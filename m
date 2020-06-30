Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F88D20FEF8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 23:30:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0872B6E442;
	Tue, 30 Jun 2020 21:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2216E35F;
 Tue, 30 Jun 2020 21:28:54 +0000 (UTC)
IronPort-SDR: +vtihtX1gc/yx/UcAZ+Tvlq3B8kYnnpVFM/r/eCzHnY7PxM9SModD7QJcFv1sCmM0Fq573lBJj
 MTNL6ZI+9wrA==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="133846937"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="133846937"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 14:28:54 -0700
IronPort-SDR: zZiPoR3MlxMtCcs0JEIzu0mpz3N8lvpgQ2TP1Ik6EfHAu3+VYg4kVKg8ZJ9AP2StuUJRl6nfmQ
 a2RzxtaeaTXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="481066823"
Received: from hdwiyono-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.176.225])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2020 14:28:53 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH 48/59] drm/kmb: SWAP R and B LCD Layer order
Date: Tue, 30 Jun 2020 14:28:00 -0700
Message-Id: <1593552491-23698-49-git-send-email-anitha.chrisanthus@intel.com>
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

Set swap bit for the colors to display correctly
when the format is RGB and not set when its BGR.

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_plane.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index d87a3a2..9f9ae57 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -218,54 +218,55 @@ unsigned int set_pixel_format(u32 format)
 		val = LCD_LAYER_FORMAT_NV12 | LCD_LAYER_PLANAR_STORAGE
 		    | LCD_LAYER_CRCB_ORDER;
 		break;
-		/* packed formats */
+	/* packed formats */
+	/* looks hw requires B & G to be swapped when RGB */
 	case DRM_FORMAT_RGB332:
-		val = LCD_LAYER_FORMAT_RGB332;
+		val = LCD_LAYER_FORMAT_RGB332 | LCD_LAYER_BGR_ORDER;
 		break;
 	case DRM_FORMAT_XBGR4444:
-		val = LCD_LAYER_FORMAT_RGBX4444 | LCD_LAYER_BGR_ORDER;
+		val = LCD_LAYER_FORMAT_RGBX4444;
 		break;
 	case DRM_FORMAT_ARGB4444:
-		val = LCD_LAYER_FORMAT_RGBA4444;
+		val = LCD_LAYER_FORMAT_RGBA4444 | LCD_LAYER_BGR_ORDER;
 		break;
 	case DRM_FORMAT_ABGR4444:
-		val = LCD_LAYER_FORMAT_RGBA4444 | LCD_LAYER_BGR_ORDER;
+		val = LCD_LAYER_FORMAT_RGBA4444;
 		break;
 	case DRM_FORMAT_XRGB1555:
-		val = LCD_LAYER_FORMAT_XRGB1555;
+		val = LCD_LAYER_FORMAT_XRGB1555 | LCD_LAYER_BGR_ORDER;
 		break;
 	case DRM_FORMAT_XBGR1555:
-		val = LCD_LAYER_FORMAT_XRGB1555 | LCD_LAYER_BGR_ORDER;
+		val = LCD_LAYER_FORMAT_XRGB1555;
 		break;
 	case DRM_FORMAT_ARGB1555:
-		val = LCD_LAYER_FORMAT_RGBA1555;
+		val = LCD_LAYER_FORMAT_RGBA1555 | LCD_LAYER_BGR_ORDER;
 		break;
 	case DRM_FORMAT_ABGR1555:
-		val = LCD_LAYER_FORMAT_RGBA1555 | LCD_LAYER_BGR_ORDER;
+		val = LCD_LAYER_FORMAT_RGBA1555;
 		break;
 	case DRM_FORMAT_RGB565:
-		val = LCD_LAYER_FORMAT_RGB565;
+		val = LCD_LAYER_FORMAT_RGB565 | LCD_LAYER_BGR_ORDER;
 		break;
 	case DRM_FORMAT_BGR565:
-		val = LCD_LAYER_FORMAT_RGB565 | LCD_LAYER_BGR_ORDER;
+		val = LCD_LAYER_FORMAT_RGB565;
 		break;
 	case DRM_FORMAT_RGB888:
-		val = LCD_LAYER_FORMAT_RGB888;
+		val = LCD_LAYER_FORMAT_RGB888 | LCD_LAYER_BGR_ORDER;
 		break;
 	case DRM_FORMAT_BGR888:
-		val = LCD_LAYER_FORMAT_RGB888 | LCD_LAYER_BGR_ORDER;
+		val = LCD_LAYER_FORMAT_RGB888;
 		break;
 	case DRM_FORMAT_XRGB8888:
-		val = LCD_LAYER_FORMAT_RGBX8888;
+		val = LCD_LAYER_FORMAT_RGBX8888 | LCD_LAYER_BGR_ORDER;
 		break;
 	case DRM_FORMAT_XBGR8888:
-		val = LCD_LAYER_FORMAT_RGBX8888 | LCD_LAYER_BGR_ORDER;
+		val = LCD_LAYER_FORMAT_RGBX8888;
 		break;
 	case DRM_FORMAT_ARGB8888:
-		val = LCD_LAYER_FORMAT_RGBA8888;
+		val = LCD_LAYER_FORMAT_RGBA8888 | LCD_LAYER_BGR_ORDER;
 		break;
 	case DRM_FORMAT_ABGR8888:
-		val = LCD_LAYER_FORMAT_RGBA8888 | LCD_LAYER_BGR_ORDER;
+		val = LCD_LAYER_FORMAT_RGBA8888;
 		break;
 	}
 	DRM_INFO("%s : %d layer format val=%d\n", __func__, __LINE__, val);
@@ -370,7 +371,6 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	val |= set_bits_per_pixel(fb->format);
 	/*CHECKME Leon drvr sets it to 100 try this for now */
 	val |= LCD_LAYER_FIFO_100;
-	val |= LCD_LAYER_BGR_ORDER;
 	kmb_write_lcd(dev_p, LCD_LAYERn_CFG(plane_id), val);
 
 	/*re-initialize interrupts */
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
