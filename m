Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F6B11C895
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:55:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6AA6ECC3;
	Thu, 12 Dec 2019 08:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.HINET-IP.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTP id 578626EC31
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 02:39:34 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 12 Dec 2019 10:39:33 +0800
Received: from csbcas.internal.ite.com.tw (csbcas1.internal.ite.com.tw
 [192.168.65.46]) by mse.ite.com.tw with ESMTP id xBC2dSJ3065779;
 Thu, 12 Dec 2019 10:39:28 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from allen-VirtualBox.internal.ite.com.tw (192.168.70.14) by
 csbcas1.internal.ite.com.tw (192.168.65.45) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Thu, 12 Dec 2019 10:39:28 +0800
From: allen <allen.chen@ite.com.tw>
To: 
Subject: [PATCH v2] drm/edid: fixup EDID 1.4 judge reduced-blanking timings
 logic
Date: Thu, 12 Dec 2019 10:33:42 +0800
Message-ID: <1576118022-4347-1-git-send-email-allen.chen@ite.com.tw>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.168.70.14]
X-MAIL: mse.ite.com.tw xBC2dSJ3065779
X-Mailman-Approved-At: Thu, 12 Dec 2019 08:55:06 +0000
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
Cc: Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Allen Chen <allen.chen@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Pi-Hsun Shih <pihsun@chromium.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to VESA ENHANCED EXTENDED DISPLAY IDENTIFICATION DATA STANDARD
(Defines EDID Structure Version 1, Revision 4) page: 39
How to determine whether the monitor support RB timing or not?
EDID 1.4
First:  read detailed timing descriptor and make sure byte 0 = 0x00,
	byte 1 = 0x00, byte 2 = 0x00 and byte 3 = 0xFD
Second: read EDID bit 0 in feature support byte at address 18h = 1
	and detailed timing descriptor byte 10 = 0x04
Third:  if EDID bit 0 in feature support byte = 1 &&
	detailed timing descriptor byte 10 = 0x04
	then we can check byte 15, if bit 4 in byte 15 = 1 is support RB
        if EDID bit 0 in feature support byte != 1 ||
	detailed timing descriptor byte 10 != 0x04,
	then byte 15 can not be used

The linux code is_rb function not follow the VESA's rule

Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
Reported-by: kbuild test robot <lkp@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index f5926bf..826ed78 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2017,13 +2017,21 @@ struct drm_display_mode *drm_mode_find_dmt(struct drm_device *dev,
 	}
 }
 
+static bool
+is_display_descriptor(const u8 *r, u8 tag)
+{
+	return (!r[0] && !r[1] && !r[2] && r[3] == tag) ? true : false;
+}
+
 static void
 is_rb(struct detailed_timing *t, void *data)
 {
 	u8 *r = (u8 *)t;
-	if (r[3] == EDID_DETAIL_MONITOR_RANGE)
-		if (r[15] & 0x10)
-			*(bool *)data = true;
+
+	if (is_display_descriptor(r, EDID_DETAIL_MONITOR_RANGE)) {
+		if (r[10] == BIT(2))
+			*(int *)data = !!(r[15] & 0x10);
+	}
 }
 
 /* EDID 1.4 defines this explicitly.  For EDID 1.3, we guess, badly. */
@@ -2031,9 +2039,13 @@ struct drm_display_mode *drm_mode_find_dmt(struct drm_device *dev,
 drm_monitor_supports_rb(struct edid *edid)
 {
 	if (edid->revision >= 4) {
-		bool ret = false;
-		drm_for_each_detailed_block((u8 *)edid, is_rb, &ret);
-		return ret;
+		if (edid->features & BIT(0)) {
+			int ret = -1;
+
+			drm_for_each_detailed_block((u8 *)edid, is_rb, &ret);
+			if (ret != -1)
+				return ret;
+		}
 	}
 
 	return ((edid->input & DRM_EDID_INPUT_DIGITAL) != 0);
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
