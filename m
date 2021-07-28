Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2EC3D84B2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 02:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDBE6EB15;
	Wed, 28 Jul 2021 00:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02E56EAE3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 00:32:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="209441994"
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="209441994"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 17:32:13 -0700
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="634583393"
Received: from mamarti1-mobl.amr.corp.intel.com (HELO
 achrisan-desk3.intel.com) ([10.212.71.161])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 17:32:12 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com
Subject: [PATCH 05/14] drm/kmb: Limit supported mode to 1080p
Date: Tue, 27 Jul 2021 17:31:17 -0700
Message-Id: <20210728003126.1425028-5-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KMB only supports single resolution(1080p), this commit checks for
1920x1080x60 or 1920x1080x59 in crtc_mode_valid.

Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_crtc.c | 28 ++++++++++++++++++++++++++++
 drivers/gpu/drm/kmb/kmb_drv.h  | 15 +++++++++++++--
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c b/drivers/gpu/drm/kmb/kmb_crtc.c
index 44327bc629ca..44626044c85e 100644
--- a/drivers/gpu/drm/kmb/kmb_crtc.c
+++ b/drivers/gpu/drm/kmb/kmb_crtc.c
@@ -185,11 +185,39 @@ static void kmb_crtc_atomic_flush(struct drm_crtc *crtc,
 	spin_unlock_irq(&crtc->dev->event_lock);
 }
 
+static enum drm_mode_status
+		kmb_crtc_mode_valid(struct drm_crtc *crtc,
+				    const struct drm_display_mode *mode)
+{
+	int refresh;
+	struct drm_device *dev = crtc->dev;
+
+	if (mode->vdisplay < KMB_CRTC_MAX_HEIGHT) {
+		drm_dbg(dev, "height = %d less than %d",
+			mode->vdisplay, KMB_CRTC_MAX_HEIGHT);
+		return MODE_BAD_VVALUE;
+	}
+	if (mode->hdisplay < KMB_CRTC_MAX_WIDTH) {
+		drm_dbg(dev, "width = %d less than %d",
+			mode->hdisplay, KMB_CRTC_MAX_WIDTH);
+		return MODE_BAD_HVALUE;
+	}
+	refresh = drm_mode_vrefresh(mode);
+	if (refresh < KMB_MIN_VREFRESH || refresh > KMB_MAX_VREFRESH) {
+		drm_dbg(dev, "refresh = %d less than %d or greater than %d",
+			refresh, KMB_MIN_VREFRESH, KMB_MAX_VREFRESH);
+		return MODE_BAD;
+	}
+
+	return MODE_OK;
+}
+
 static const struct drm_crtc_helper_funcs kmb_crtc_helper_funcs = {
 	.atomic_begin = kmb_crtc_atomic_begin,
 	.atomic_enable = kmb_crtc_atomic_enable,
 	.atomic_disable = kmb_crtc_atomic_disable,
 	.atomic_flush = kmb_crtc_atomic_flush,
+	.mode_valid = kmb_crtc_mode_valid,
 };
 
 int kmb_setup_crtc(struct drm_device *drm)
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index 0904e6eb2a09..fefb1052058c 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -18,8 +18,19 @@
 
 #define DRIVER_DATE			"20210223"
 #define DRIVER_MAJOR			1
-#define DRIVER_MINOR			1
-
+#define DRIVER_MINOR			2
+
+/* Platform definitions */
+#define KMB_CRTC_MAX_WIDTH		1920 /* max width in pixels */
+#define KMB_CRTC_MAX_HEIGHT		1080 /* max height in pixels */
+#define KMB_CRTC_MIN_WIDTH		1920
+#define KMB_CRTC_MIN_HEIGHT		1080
+#define KMB_FB_MAX_WIDTH		1920
+#define KMB_FB_MAX_HEIGHT		1080
+#define KMB_FB_MIN_WIDTH		1
+#define KMB_FB_MIN_HEIGHT		1
+#define KMB_MIN_VREFRESH		59    /*vertical refresh in Hz */
+#define KMB_MAX_VREFRESH		60    /*vertical refresh in Hz */
 #define KMB_LCD_DEFAULT_CLK		200000000
 #define KMB_SYS_CLK_MHZ			500
 
-- 
2.25.1

