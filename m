Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEEA8451BC
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 08:06:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF06D10E50B;
	Thu,  1 Feb 2024 07:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Thu, 01 Feb 2024 07:06:46 UTC
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D3F10E50B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 07:06:46 +0000 (UTC)
X-UUID: 65cdf20534ff4e049a204efcd879dd7c-20240201
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:1eff9a06-e204-4097-8ba7-f29e89d81adb, IP:15,
 URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-INFO: VERSION:1.1.35, REQID:1eff9a06-e204-4097-8ba7-f29e89d81adb, IP:15,
 UR
 L:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-5
X-CID-META: VersionHash:5d391d7, CLOUDID:4972e68e-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:240201150131SZXINURA,BulkQuantity:0,Recheck:0,SF:19|44|66|24|17|102,
 TC:nil,Content:0,EDM:-3,IP:-2,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
 ,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR, TF_CID_SPAM_FAS, TF_CID_SPAM_FSD,
 TF_CID_SPAM_FSI, TF_CID_SPAM_ULS
X-UUID: 65cdf20534ff4e049a204efcd879dd7c-20240201
X-User: liucong2@kylinos.cn
Received: from localhost.localdomain [(116.128.244.171)] by mailgw
 (envelope-from <liucong2@kylinos.cn>) (Generic MTA)
 with ESMTP id 1121363701; Thu, 01 Feb 2024 15:01:29 +0800
From: Cong Liu <liucong2@kylinos.cn>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH] fbdev/sh_mobile_lcdcfb: Replace deprecated simple_strtol with
 kstrtol
Date: Thu,  1 Feb 2024 15:01:27 +0800
Message-Id: <20240201070127.3290465-1-liucong2@kylinos.cn>
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
in the sh_mobile_lcdcfb.c file with the recommended kstrtol function.
This change improves error handling and boundary checks.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull

Signed-off-by: Cong Liu <liucong2@kylinos.cn>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index eb2297b37504..5fc7d74b273e 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1278,11 +1278,11 @@ overlay_position_store(struct device *dev, struct device_attribute *attr,
 	int pos_x;
 	int pos_y;
 
-	pos_x = simple_strtol(buf, &endp, 10);
+	pos_x = kstrtol(buf, &endp, 10);
 	if (*endp != ',')
 		return -EINVAL;
 
-	pos_y = simple_strtol(endp + 1, &endp, 10);
+	pos_y = kstrtol(endp + 1, &endp, 10);
 	if (isspace(*endp))
 		endp++;
 
-- 
2.34.1

