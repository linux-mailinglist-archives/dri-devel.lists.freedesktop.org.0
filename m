Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B5D54CDD7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 18:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE74112521;
	Wed, 15 Jun 2022 16:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 12BF8112521
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 16:09:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7841153B;
 Wed, 15 Jun 2022 09:09:19 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DAB243F7F5;
 Wed, 15 Jun 2022 09:09:18 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: liviu.dudau@arm.com
Subject: [PATCH v2] drm/arm/hdlcd: Take over EFI framebuffer properly
Date: Wed, 15 Jun 2022 17:09:15 +0100
Message-Id: <31acd57f4aa8a4d02877026fa3a8c8d035e15a0d.1655309004.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.36.1.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, javierm@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Arm Juno board EDK2 port has provided an EFI GOP display via HDLCD0
for some time now, which works nicely as an early framebuffer. However,
once the HDLCD driver probes and takes over the hardware, it should
take over the logical framebuffer as well, otherwise the now-defunct GOP
device hangs about and virtual console output inevitably disappears into
the wrong place most of the time.

We'll do this after binding the HDMI encoder, since that's the most
likely thing to fail, and the EFI console is still better than nothing
when that happens. However, the two HDLCD controllers on Juno are
independent, and many users will still be using older firmware without
any display support, so we'll only bother if we find that the HDLCD
we're probing is already enabled. And if it is, then we'll also stop it,
since otherwise the display can end up shifted if it's still scanning
out while the rest of the registers are subsequently reconfigured.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

Since I ended up adding (relatively) a lot here, I didn't want to
second-guess Javier's opinion so left off the R-b tag from v1.

 drivers/gpu/drm/arm/hdlcd_drv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index e89ae0ec60eb..1f1171f2f16a 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -21,6 +21,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_debugfs.h>
@@ -314,6 +315,12 @@ static int hdlcd_drm_bind(struct device *dev)
 		goto err_vblank;
 	}
 
+	/* If EFI left us running, take over from efifb/sysfb */
+	if (hdlcd_read(hdlcd, HDLCD_REG_COMMAND)) {
+		hdlcd_write(hdlcd, HDLCD_REG_COMMAND, 0);
+		drm_aperture_remove_framebuffers(false, &hdlcd_driver);
+	}
+
 	drm_mode_config_reset(drm);
 	drm_kms_helper_poll_init(drm);
 
-- 
2.36.1.dirty

