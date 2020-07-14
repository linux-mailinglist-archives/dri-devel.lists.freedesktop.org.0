Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A9B21FF68
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 23:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032F96EA0F;
	Tue, 14 Jul 2020 20:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912956E9C6;
 Tue, 14 Jul 2020 20:58:49 +0000 (UTC)
IronPort-SDR: XlUQgZjhrufIVZSpdMsegCq6ADqEshqneVPLBmrOnfJ9L6YCWoxBNs+INfakgVrTnOm6+W72Nj
 7dBxU5M7i+Sg==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444629"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444629"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:49 -0700
IronPort-SDR: /JLOdh0F7IguSDrmgFjbxqh2pWHS53CKIssYsJOTAhHTOR55OqRAJDdv5XJc5W+nyFB72C2svK
 R2XBqm42wVjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504321"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:48 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 56/59] kmb/drm: Prune unsupported modes
Date: Tue, 14 Jul 2020 13:57:42 -0700
Message-Id: <1594760265-11618-57-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KMB display pipeline is LCD->Mipi->HDMI. Mipi->HDMI converter chip only
accepts 4-lane input from mipi.
With 4-lane mipi, KMB hardware can only support 1080p resolution.
Therefore, limit supported mode to 1080p.

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c   |  4 ++--
 drivers/gpu/drm/kmb/kmb_drv.h   |  8 +++++---
 drivers/gpu/drm/kmb/kmb_dsi.c   | 11 +++++++++++
 drivers/gpu/drm/kmb/kmb_plane.c |  2 ++
 4 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 7fcab4b..b844c77 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -337,8 +337,8 @@ static const struct drm_mode_config_funcs kmb_mode_config_funcs = {
 static void kmb_setup_mode_config(struct drm_device *drm)
 {
 	drm_mode_config_init(drm);
-	drm->mode_config.min_width = 0;
-	drm->mode_config.min_height = 0;
+	drm->mode_config.min_width = KMB_MIN_WIDTH;
+	drm->mode_config.min_height = KMB_MIN_HEIGHT;
 	drm->mode_config.max_width = KMB_MAX_WIDTH;
 	drm->mode_config.max_height = KMB_MAX_HEIGHT;
 	drm->mode_config.funcs = &kmb_mode_config_funcs;
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index 94b62b9..373a059 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -8,10 +8,12 @@
 
 #include "kmb_regs.h"
 
-#define FCCTEST
+//#define FCCTEST
 #define LCD_TEST
-#define KMB_MAX_WIDTH			1920	/*max width in pixels */
-#define KMB_MAX_HEIGHT			1080	/*max height in pixels */
+#define KMB_MAX_WIDTH			1920 /*max width in pixels */
+#define KMB_MAX_HEIGHT			1080 /*max height in pixels */
+#define KMB_MIN_WIDTH                   1920 /*max width in pixels */
+#define KMB_MIN_HEIGHT                  1080 /*max height in pixels */
 #define KMB_LCD_DEFAULT_CLK		250000000
 #define KMB_MIPI_DEFAULT_CLK		24000000
 #define KMB_MIPI_DEFAULT_CFG_CLK	24000000
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 2599ed2..47798ed 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -193,6 +193,17 @@ static enum drm_mode_status
 kmb_dsi_mode_valid(struct drm_connector *connector,
 		   struct drm_display_mode *mode)
 {
+	struct drm_device *dev = connector->dev;
+	struct drm_mode_config *mode_config = &dev->mode_config;
+
+	if (mode->hdisplay < mode_config->min_width ||
+			mode->hdisplay > mode_config->max_width)
+		return MODE_BAD_HVALUE;
+
+	if (mode->vdisplay < mode_config->min_height ||
+			mode->vdisplay > mode_config->max_height)
+		return MODE_BAD_VVALUE;
+
 	return MODE_OK;
 }
 
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 8b2b202..a6b5969 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -57,6 +57,8 @@ static int kmb_plane_atomic_check(struct drm_plane *plane,
 
 	if (state->crtc_w > KMB_MAX_WIDTH || state->crtc_h > KMB_MAX_HEIGHT)
 		return -EINVAL;
+	if (state->crtc_w < KMB_MIN_WIDTH || state->crtc_h < KMB_MIN_HEIGHT)
+		return -EINVAL;
 	return 0;
 }
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
