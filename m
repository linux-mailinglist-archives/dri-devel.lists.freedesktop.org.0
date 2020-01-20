Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1995C142A71
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 13:21:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512616FA90;
	Mon, 20 Jan 2020 12:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A3C6FA8D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 12:20:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BEAB6AD46;
 Mon, 20 Jan 2020 12:20:54 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Subject: [PATCH v3 1/4] drm: Add drm_crtc_has_vblank()
Date: Mon, 20 Jan 2020 13:20:48 +0100
Message-Id: <20200120122051.25178-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200120122051.25178-1-tzimmermann@suse.de>
References: <20200120122051.25178-1-tzimmermann@suse.de>
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
Cc: xen-devel@lists.xenproject.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new interface drm_crtc_has_vblank() return true if vblanking has
been initialized for a certain CRTC, or false otherwise. This function
will be useful for initializing CRTC state.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_vblank.c | 21 +++++++++++++++++++++
 include/drm/drm_vblank.h     |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 1659b13b178c..c20102899411 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -501,6 +501,27 @@ int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
 }
 EXPORT_SYMBOL(drm_vblank_init);
 
+/**
+ * drm_crtc_has_vblank - test if vblanking has been initialized for
+ *                       a CRTC
+ * @crtc: the CRTC
+ *
+ * Drivers may call this function to test if vblank support is
+ * initialized for a CRTC. For most hardware this means that vblanking
+ * can also be enabled on the CRTC.
+ *
+ * Returns:
+ * True if vblanking has been initialized for the given CRTC, false
+ * otherwise.
+ */
+bool drm_crtc_has_vblank(const struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+
+	return crtc->index < dev->num_crtcs;
+}
+EXPORT_SYMBOL(drm_crtc_has_vblank);
+
 /**
  * drm_crtc_vblank_waitqueue - get vblank waitqueue for the CRTC
  * @crtc: which CRTC's vblank waitqueue to retrieve
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index c16c44052b3d..531a6bc12b7e 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -206,6 +206,7 @@ struct drm_vblank_crtc {
 };
 
 int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs);
+bool drm_crtc_has_vblank(const struct drm_crtc *crtc);
 u64 drm_crtc_vblank_count(struct drm_crtc *crtc);
 u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
 				   ktime_t *vblanktime);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
