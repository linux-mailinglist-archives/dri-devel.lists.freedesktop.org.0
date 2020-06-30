Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF9920FF38
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 23:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10F56E4CA;
	Tue, 30 Jun 2020 21:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BF26E35F;
 Tue, 30 Jun 2020 21:28:56 +0000 (UTC)
IronPort-SDR: Lqh801BrWjZj96wHtGm6ZZFCAXqtO4P/LCMKC6G43ncD5+a2gNzK2y4YlDIzz2/DRA586Rs53A
 cjHm9sLjOgeA==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="143867597"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="143867597"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 14:28:56 -0700
IronPort-SDR: SMLL5ukrowHNsiZwOjspBuxJ2OblO6tAjrjUtZANvn+zIPypsHdYP+Cau6RqW+6rZiLSnPd++a
 bvyIXB3hKLwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="481066866"
Received: from hdwiyono-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.176.225])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2020 14:28:56 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH 56/59] kmb/drm: Prune unsupported modes
Date: Tue, 30 Jun 2020 14:28:08 -0700
Message-Id: <1593552491-23698-57-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
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
index f8894d3..68e7b5c 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -359,8 +359,8 @@ static const struct drm_mode_config_funcs kmb_mode_config_funcs = {
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
index 83824f7..eef2d8b 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -28,10 +28,12 @@
 
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
index 8a12d6d..ec974da 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -216,6 +216,17 @@ static enum drm_mode_status
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
index 81250e1..5e040f7 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -77,6 +77,8 @@ static int kmb_plane_atomic_check(struct drm_plane *plane,
 
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
