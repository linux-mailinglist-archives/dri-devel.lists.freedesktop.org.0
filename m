Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EB620FEF1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 23:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8736E447;
	Tue, 30 Jun 2020 21:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643AE6E329;
 Tue, 30 Jun 2020 21:28:43 +0000 (UTC)
IronPort-SDR: lUX9odUiD3JAlkYAF8Vl++Vrgp4dkEFZqo6zzhBq4Rg1x1hPNHOLyIO4kg47k1TDTpSQTVUz3W
 UhOhv5MBQHpA==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="144554746"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="144554746"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 14:28:43 -0700
IronPort-SDR: Vgft+Vdr7Lzmjs2a+yf3UkjLqmsOJ4a8Vnz0jeI8VLy4U69/oej54kotk75wrA1VufWI59zFIS
 DF7LeKfGYaVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="481066698"
Received: from hdwiyono-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.176.225])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2020 14:28:42 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH 22/59] drm/kmb: Set hardcoded values to LCD_VSYNC_START
Date: Tue, 30 Jun 2020 14:27:34 -0700
Message-Id: <1593552491-23698-23-git-send-email-anitha.chrisanthus@intel.com>
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

Myriadx code has it set to these values.

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_crtc.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c b/drivers/gpu/drm/kmb/kmb_crtc.c
index b2b50cc..053da17 100644
--- a/drivers/gpu/drm/kmb/kmb_crtc.c
+++ b/drivers/gpu/drm/kmb/kmb_crtc.c
@@ -120,6 +120,9 @@ static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	kmb_write_lcd(dev->dev_private, LCD_H_BACKPORCH, vm.hback_porch - 1);
 	kmb_write_lcd(dev->dev_private, LCD_H_FRONTPORCH, vm.hfront_porch - 1);
 	kmb_write_lcd(dev->dev_private, LCD_HSYNC_WIDTH, vm.hsync_len - 1);
+	/*this is hardcoded as 0 in the Myriadx code */
+	kmb_write_lcd(dev->dev_private, LCD_VSYNC_START, 0);
+	kmb_write_lcd(dev->dev_private, LCD_VSYNC_END, 0);
 
 	if (m->flags == DRM_MODE_FLAG_INTERLACE) {
 		kmb_write_lcd(dev->dev_private,
@@ -128,12 +131,11 @@ static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)
 				LCD_V_BACKPORCH_EVEN, vm.vback_porch - 1);
 		kmb_write_lcd(dev->dev_private,
 				LCD_V_FRONTPORCH_EVEN, vm.vfront_porch - 1);
-		kmb_write_lcd(dev->dev_private,
-				LCD_V_ACTIVEHEIGHT_EVEN, m->crtc_vdisplay - 1);
-		kmb_write_lcd(dev->dev_private, LCD_VSYNC_START_EVEN,
-				vsync_start_offset);
-		kmb_write_lcd(dev->dev_private, LCD_VSYNC_END_EVEN,
-				vsync_end_offset);
+		kmb_write_lcd(dev->dev_private, LCD_V_ACTIVEHEIGHT_EVEN,
+			m->crtc_vdisplay - 1);
+		/*this is hardcoded as 10 in the Myriadx code*/
+		kmb_write_lcd(dev->dev_private, LCD_VSYNC_START_EVEN, 10);
+		kmb_write_lcd(dev->dev_private, LCD_VSYNC_END_EVEN, 10);
 	}
 	/* enable VL1 layer as default */
 	ctrl = LCD_CTRL_ENABLE | LCD_CTRL_VL1_ENABLE;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
