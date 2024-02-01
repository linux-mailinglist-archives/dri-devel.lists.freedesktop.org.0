Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 136218451BE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 08:07:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F5810E50D;
	Thu,  1 Feb 2024 07:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C3010E50D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 07:07:29 +0000 (UTC)
X-UUID: 791b174af724403da7687f9cd8aebb6e-20240201
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:e3ed52e8-b592-4d07-9f9e-0e04c6561891, IP:15,
 URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-INFO: VERSION:1.1.35, REQID:e3ed52e8-b592-4d07-9f9e-0e04c6561891, IP:15,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:0
X-CID-META: VersionHash:5d391d7, CLOUDID:de707f83-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:2402011502192136VGHT,BulkQuantity:0,Recheck:0,SF:24|17|19|44|66|38|1
 02,TC:nil,Content:0,EDM:-3,IP:-2,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
 L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR, TF_CID_SPAM_FAS, TF_CID_SPAM_FSD,
 TF_CID_SPAM_FSI, TF_CID_SPAM_ULS
X-UUID: 791b174af724403da7687f9cd8aebb6e-20240201
X-User: liucong2@kylinos.cn
Received: from localhost.localdomain [(116.128.244.171)] by mailgw
 (envelope-from <liucong2@kylinos.cn>) (Generic MTA)
 with ESMTP id 568714648; Thu, 01 Feb 2024 15:02:18 +0800
From: Cong Liu <liucong2@kylinos.cn>
To: Daniel Vetter <daniel@ffwll.ch>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH] fbdev/core: Replace deprecated simple_strtol with kstrtol
Date: Thu,  1 Feb 2024 15:02:16 +0800
Message-Id: <20240201070216.3291999-1-liucong2@kylinos.cn>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-fbdev@vger.kernel.org, Cong Liu <liucong2@kylinos.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch replaces the use of the deprecated simple_strtol [1] function
in the modedb.c file with the recommended kstrtol function. This change
improves error handling and boundary checks.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull

Signed-off-by: Cong Liu <liucong2@kylinos.cn>
---
 drivers/video/fbdev/core/modedb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/core/modedb.c b/drivers/video/fbdev/core/modedb.c
index 7196b055f2bd..eebbbc7e2aa3 100644
--- a/drivers/video/fbdev/core/modedb.c
+++ b/drivers/video/fbdev/core/modedb.c
@@ -661,7 +661,7 @@ int fb_find_mode(struct fb_var_screeninfo *var,
 				namelen = i;
 				if (!refresh_specified && !bpp_specified &&
 				    !yres_specified) {
-					refresh = simple_strtol(&name[i+1], NULL,
+					refresh = kstrtol(&name[i+1], NULL,
 								10);
 					refresh_specified = 1;
 					if (cvt || rb)
@@ -672,7 +672,7 @@ int fb_find_mode(struct fb_var_screeninfo *var,
 			case '-':
 				namelen = i;
 				if (!bpp_specified && !yres_specified) {
-					bpp = simple_strtol(&name[i+1], NULL,
+					bpp = kstrtol(&name[i+1], NULL,
 							    10);
 					bpp_specified = 1;
 					if (cvt || rb)
@@ -682,7 +682,7 @@ int fb_find_mode(struct fb_var_screeninfo *var,
 				break;
 			case 'x':
 				if (!yres_specified) {
-					yres = simple_strtol(&name[i+1], NULL,
+					yres = kstrtol(&name[i+1], NULL,
 							     10);
 					yres_specified = 1;
 				} else
@@ -719,7 +719,7 @@ int fb_find_mode(struct fb_var_screeninfo *var,
 			}
 		}
 		if (i < 0 && yres_specified) {
-			xres = simple_strtol(name, NULL, 10);
+			xres = kstrtol(name, NULL, 10);
 			res_specified = 1;
 		}
 done:
-- 
2.34.1

