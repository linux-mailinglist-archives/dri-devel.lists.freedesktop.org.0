Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2968362049
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 14:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047026E1F4;
	Fri, 16 Apr 2021 12:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488E96E1F4
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 12:53:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DFF38ABED;
 Fri, 16 Apr 2021 12:53:46 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Fix fbcon blank on QEMU graphics drivers
Date: Fri, 16 Apr 2021 14:53:44 +0200
Message-Id: <20210416125344.13550-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the DRM fbcon helper for console blank,
drm_fb_helper_blank(), simply calls drm_fb_helper_dpms() and always
returns zero, supposing the driver dealing with DPMS or atomic
crtc->active flip to handle blanking the screen.  It works on most of
devices, but broken on most of KVM/QEMU graphics: bochs, qxl and
cirrus drivers just ignore crtc->active state change as blanking (or
cirrus ignoring DPMS).  In practice, when you run like
  % setterm --blank force
on a VT console, the screen freezes without actually blanking.

A simple fix for this problem would be not to rely on DPMS but let
fbcon performs the generic blank code.  This can be achieved just by
returning an error from drm_fb_helper_blank().

In this patch, we add a flag, no_dpms_blank, to drm_fb_helper for
indicating that the driver doesn't handle blank via DPMS or
crtc->active flip.  When this flag is set, drm_fb_helper_blank()
simply returns an error, so that fbcon falls back to its generic blank
handler.  The flag is set to both bochs and qxl drivers in this patch,
while cirrus is left untouched as it's declared as to-be-deprecated.

Link: https://lore.kernel.org/dri-devel/20170726205636.19144-1-tiwai@suse.de/
BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1095700
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

Here I whip a dead horse again, revisiting the long-standing issue
stated in the previous patch set in 2017:
  https://lore.kernel.org/dri-devel/20170726205636.19144-1-tiwai@suse.de/

I thought to refresh the previous patch set at first, but it seems
invalid for the atomic modeset case.  And for the atomic, it's even
more difficult to propagate the return from the bottom to up.
So I ended up with this approach as it's much simpler.

But if there is any better way (even simpler or more robust), I'd
happily rewrite, too.

---
 drivers/gpu/drm/bochs/bochs_drv.c | 3 +++
 drivers/gpu/drm/drm_fb_helper.c   | 5 +++++
 drivers/gpu/drm/qxl/qxl_drv.c     | 3 +++
 include/drm/drm_fb_helper.h       | 8 ++++++++
 4 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
index b469624fe40d..816899a266ff 100644
--- a/drivers/gpu/drm/bochs/bochs_drv.c
+++ b/drivers/gpu/drm/bochs/bochs_drv.c
@@ -132,6 +132,9 @@ static int bochs_pci_probe(struct pci_dev *pdev,
 		goto err_unload;
 
 	drm_fbdev_generic_setup(dev, 32);
+	if (dev->fb_helper)
+		dev->fb_helper->no_dpms_blank = true;
+
 	return ret;
 
 err_unload:
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index f6baa2046124..b892f02ff2f1 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -332,9 +332,14 @@ static void drm_fb_helper_dpms(struct fb_info *info, int dpms_mode)
  */
 int drm_fb_helper_blank(int blank, struct fb_info *info)
 {
+	struct drm_fb_helper *fb_helper = info->par;
+
 	if (oops_in_progress)
 		return -EBUSY;
 
+	if (fb_helper->no_dpms_blank)
+		return -EINVAL;
+
 	switch (blank) {
 	/* Display: On; HSync: On, VSync: On */
 	case FB_BLANK_UNBLANK:
diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 1864467f1063..58ecfaeed7c1 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -120,6 +120,9 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto modeset_cleanup;
 
 	drm_fbdev_generic_setup(&qdev->ddev, 32);
+	if (qdev->fb_helper)
+		qdev->fb_helper->no_dpms_blank = true;
+
 	return 0;
 
 modeset_cleanup:
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 3b273f9ca39a..151be4219c32 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -176,6 +176,14 @@ struct drm_fb_helper {
 	 */
 	bool deferred_setup;
 
+	/**
+	 * @no_dpms_blank:
+	 *
+	 * A flag indicating that the driver doesn't support blanking.
+	 * Then fbcon core code falls back to its generic handler.
+	 */
+	bool no_dpms_blank;
+
 	/**
 	 * @preferred_bpp:
 	 *
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
