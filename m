Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3719121FF36
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 22:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6296E9CE;
	Tue, 14 Jul 2020 20:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9106E9B8;
 Tue, 14 Jul 2020 20:58:30 +0000 (UTC)
IronPort-SDR: C/ITnAoHDzwixBxprsKEs9bNCDoCTItmTDk3TU/uyJNcW0ggaPY7lTVebL6GU5CtGTkkWfSMtk
 ZQKADe01WJSg==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444568"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444568"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:29 -0700
IronPort-SDR: lLplo203JGpv56biQ/rkrtuE4rdWmcRfDdRWvkYFXTnsd3Nzt41kGywf2UcSuZ12NfbgES5+o9
 MNrz9FfTHcMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504146"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:29 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 22/59] drm/kmb: Set hardcoded values to LCD_VSYNC_START
Date: Tue, 14 Jul 2020 13:57:08 -0700
Message-Id: <1594760265-11618-23-git-send-email-anitha.chrisanthus@intel.com>
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

Myriadx code has it set to these values.

v2: upclassed dev_private

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_crtc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c b/drivers/gpu/drm/kmb/kmb_crtc.c
index 5c1e858..eca0f3a 100644
--- a/drivers/gpu/drm/kmb/kmb_crtc.c
+++ b/drivers/gpu/drm/kmb/kmb_crtc.c
@@ -102,6 +102,9 @@ static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	kmb_write_lcd(dev_p, LCD_H_BACKPORCH, vm.hback_porch - 1);
 	kmb_write_lcd(dev_p, LCD_H_FRONTPORCH, vm.hfront_porch - 1);
 	kmb_write_lcd(dev_p, LCD_HSYNC_WIDTH, vm.hsync_len - 1);
+	/*this is hardcoded as 0 in the Myriadx code */
+	kmb_write_lcd(dev_p, LCD_VSYNC_START, 0);
+	kmb_write_lcd(dev_p, LCD_VSYNC_END, 0);
 
 	if (m->flags == DRM_MODE_FLAG_INTERLACE) {
 		kmb_write_lcd(dev_p,
@@ -112,10 +115,9 @@ static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)
 				LCD_V_FRONTPORCH_EVEN, vm.vfront_porch - 1);
 		kmb_write_lcd(dev_p,
 				LCD_V_ACTIVEHEIGHT_EVEN, m->crtc_vdisplay - 1);
-		kmb_write_lcd(dev_p, LCD_VSYNC_START_EVEN,
-				vsync_start_offset);
-		kmb_write_lcd(dev_p, LCD_VSYNC_END_EVEN,
-				vsync_end_offset);
+		/*this is hardcoded as 10 in the Myriadx code*/
+		kmb_write_lcd(dev_p, LCD_VSYNC_START_EVEN, 10);
+		kmb_write_lcd(dev_p, LCD_VSYNC_END_EVEN, 10);
 	}
 	/* enable VL1 layer as default */
 	ctrl = LCD_CTRL_ENABLE | LCD_CTRL_VL1_ENABLE;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
