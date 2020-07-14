Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C99521FF43
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 22:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC0B6E9D9;
	Tue, 14 Jul 2020 20:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6EAD6E9AC;
 Tue, 14 Jul 2020 20:58:44 +0000 (UTC)
IronPort-SDR: 6J5/DDMlNzX8zyCu4lX9+2h1NiuXgPLYzUFHfA8p3DnP2nRtzq6OZ1H5ic5IgRJTmwkPAzqOl8
 +3fzeIff8GnA==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444615"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444615"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:44 -0700
IronPort-SDR: uTZadAGXvaVnRplF5r/KQuVPwsl5C3U9DPf5k1nGICGkZ6tnGO8X3NhqFtg8F0Ks5XtykcIilq
 Nf0fXiyfX5eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504273"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:44 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 48/59] drm/kmb: SWAP R and B LCD Layer order
Date: Tue, 14 Jul 2020 13:57:34 -0700
Message-Id: <1594760265-11618-49-git-send-email-anitha.chrisanthus@intel.com>
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

Set swap bit for the colors to display correctly
when the format is RGB and not set when its BGR.

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_plane.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 1582ccf..5fd1837 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -198,54 +198,55 @@ unsigned int set_pixel_format(u32 format)
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
@@ -348,7 +349,6 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
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
