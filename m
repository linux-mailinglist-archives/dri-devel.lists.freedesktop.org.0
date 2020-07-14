Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C21A21FF57
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 23:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F06F6E9FF;
	Tue, 14 Jul 2020 20:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022C56E9CB;
 Tue, 14 Jul 2020 20:58:50 +0000 (UTC)
IronPort-SDR: QDnbbKNOn6Y9xqBH+Ra4gtMeynDzn4cjMfoH8CKwPMwKQLwfkX9NYaxFEDhY5IShzIoQEetJPG
 1Jyqlo81wBAw==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444634"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444634"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:50 -0700
IronPort-SDR: zMH+7Td4kg5hKREKBn1sgLw8fz4ETCvvCPH43wiXi+rVhspunPAp18xzgJEnM5aMCk/opvwoyD
 kXghsA3NFZNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504332"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:50 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 59/59] drm/kmb: work around for planar formats
Date: Tue, 14 Jul 2020 13:57:45 -0700
Message-Id: <1594760265-11618-60-git-send-email-anitha.chrisanthus@intel.com>
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

Set the DMA Vstride and Line width for U and V planes to the same as the
Y plane and not the actual pitch.
Bit18 of layer config does not have any effect when U and V planes are
swapped, so swap it in the driver.

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Edmund Dea <edmund.j.dea@intel.com>
---
 drivers/gpu/drm/kmb/kmb_plane.c | 50 ++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index de225a8..e35d732 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -170,6 +170,8 @@ unsigned int set_pixel_format(u32 format)
 		val = LCD_LAYER_FORMAT_RGBA8888;
 		break;
 	}
+	DRM_INFO_ONCE("%s : %d format=0x%x val=0x%x\n",
+			 __func__, __LINE__, format, val);
 	return val;
 }
 
@@ -280,38 +282,48 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	dev_p->fb_addr = addr[Y_PLANE];
 	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_START_ADDR(plane_id),
 		      addr[Y_PLANE] + fb->offsets[0]);
+	val = set_pixel_format(fb->format->format);
+	val |= set_bits_per_pixel(fb->format);
 	/* Program Cb/Cr for planar formats */
 	if (num_planes > 1) {
-		if (fb->format->format == DRM_FORMAT_YUV420 ||
-		    fb->format->format == DRM_FORMAT_YVU420)
-			width /= 2;
-
 		kmb_write_lcd(dev_p, LCD_LAYERn_DMA_CB_LINE_VSTRIDE(plane_id),
-			      fb->pitches[LAYER_1]);
-
+				width*fb->format->cpp[0]);
 		kmb_write_lcd(dev_p, LCD_LAYERn_DMA_CB_LINE_WIDTH(plane_id),
 			      (width * fb->format->cpp[0]));
 
 		addr[U_PLANE] = drm_fb_cma_get_gem_addr(fb, plane->state,
-							U_PLANE);
-		kmb_write_lcd(dev_p, LCD_LAYERn_DMA_START_CB_ADR(plane_id),
-			      addr[U_PLANE]);
+				U_PLANE);
+		/* check if Cb/Cr is swapped*/
+		if ((num_planes == 3) && (val & LCD_LAYER_CRCB_ORDER))
+			kmb_write_lcd(dev_p,
+					LCD_LAYERn_DMA_START_CR_ADR(plane_id),
+					addr[U_PLANE]);
+		else
+			kmb_write_lcd(dev_p,
+					LCD_LAYERn_DMA_START_CB_ADR(plane_id),
+					addr[U_PLANE]);
 
 		if (num_planes == 3) {
 			kmb_write_lcd(dev_p,
-				      LCD_LAYERn_DMA_CR_LINE_VSTRIDE(plane_id),
-				      fb->pitches[LAYER_2]);
+				LCD_LAYERn_DMA_CR_LINE_VSTRIDE(plane_id),
+				((width)*fb->format->cpp[0]));
 
 			kmb_write_lcd(dev_p,
-				      LCD_LAYERn_DMA_CR_LINE_WIDTH(plane_id),
-				      (width * fb->format->cpp[0]));
+				LCD_LAYERn_DMA_CR_LINE_WIDTH(plane_id),
+				((width)*fb->format->cpp[0]));
 
 			addr[V_PLANE] = drm_fb_cma_get_gem_addr(fb,
-								plane->state,
-								V_PLANE);
-			kmb_write_lcd(dev_p,
-				      LCD_LAYERn_DMA_START_CR_ADR(plane_id),
-				      addr[V_PLANE]);
+					plane->state, V_PLANE);
+
+			/* check if Cb/Cr is swapped*/
+			if (val & LCD_LAYER_CRCB_ORDER)
+				kmb_write_lcd(dev_p,
+					LCD_LAYERn_DMA_START_CB_ADR(plane_id),
+					addr[V_PLANE]);
+			else
+				kmb_write_lcd(dev_p,
+					LCD_LAYERn_DMA_START_CR_ADR(plane_id),
+					addr[V_PLANE]);
 		}
 	}
 
@@ -320,8 +332,6 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	kmb_write_lcd(dev_p, LCD_LAYERn_COL_START(plane_id), crtc_x);
 	kmb_write_lcd(dev_p, LCD_LAYERn_ROW_START(plane_id), crtc_y);
 
-	val = set_pixel_format(fb->format->format);
-	val |= set_bits_per_pixel(fb->format);
 	/*CHECKME Leon drvr sets it to 100 try this for now */
 	val |= LCD_LAYER_FIFO_100;
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
