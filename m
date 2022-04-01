Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2364EE905
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 09:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5684F10FE3E;
	Fri,  1 Apr 2022 07:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.meizu.com (edge05.meizu.com [157.122.146.251])
 by gabe.freedesktop.org (Postfix) with ESMTP id 42F1A10F50D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 05:45:39 +0000 (UTC)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail12.meizu.com
 (172.16.1.108) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 1 Apr
 2022 11:41:26 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 1 Apr
 2022 11:41:23 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: Thomas Winischhofer <thomas@winischhofer.net>, Helge Deller <deller@gmx.de>
Subject: [PATCH] video: fbdev: sis: fix potential NULL dereference in
 sisfb_post_sis300()
Date: Fri, 1 Apr 2022 11:41:16 +0800
Message-ID: <1648784476-20803-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-124.meizu.com (172.16.1.124) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)
X-Mailman-Approved-At: Fri, 01 Apr 2022 07:23:24 +0000
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
Cc: linux-fbdev@vger.kernel.org, Haowen Bai <baihaowen@meizu.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bios could be null without checking null and return in this function,
but still dereference bios[0xf5].

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
 drivers/video/fbdev/sis/sis_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index 742f629..24a0299 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -4463,7 +4463,7 @@ static void sisfb_post_sis300(struct pci_dev *pdev)
 		SiS_SetReg(SISCR, 0x37, 0x02);
 		SiS_SetReg(SISPART2, 0x00, 0x1c);
 		v4 = 0x00; v5 = 0x00; v6 = 0x10;
-		if(ivideo->SiS_Pr.UseROM) {
+		if (ivideo->SiS_Pr.UseROM && bios) {
 			v4 = bios[0xf5];
 			v5 = bios[0xf6];
 			v6 = bios[0xf7];
-- 
2.7.4

