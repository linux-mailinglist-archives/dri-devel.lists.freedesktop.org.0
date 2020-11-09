Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AEE2AB3B8
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 10:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C21893A4;
	Mon,  9 Nov 2020 09:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC65893A4
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 09:38:40 +0000 (UTC)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 0A99YRss012235;
 Mon, 9 Nov 2020 17:34:27 +0800 (GMT-8)
 (envelope-from kuohsiang_chou@aspeedtech.com)
Received: from localhost.localdomain.com (192.168.2.206) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 9 Nov 2020 17:38:26 +0800
From: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
To: <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/ast: Create chip AST2600
Date: Mon, 9 Nov 2020 17:38:12 +0800
Message-ID: <20201109093812.161483-1-kuohsiang_chou@aspeedtech.com>
X-Mailer: git-send-email 2.18.4
MIME-Version: 1.0
X-Originating-IP: [192.168.2.206]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 0A99YRss012235
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
Cc: airlied@linux.ie, tommy_huang@aspeedtech.com, jenmin_yuan@aspeedtech.com,
 airlied@redhat.com, arc_sung@aspeedtech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[New] Support AST2600

Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
---
 drivers/gpu/drm/ast/ast_drv.h  | 1 +
 drivers/gpu/drm/ast/ast_main.c | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 467049ca8430..6b9e3b94a712 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -63,6 +63,7 @@ enum ast_chip {
 	AST2300,
 	AST2400,
 	AST2500,
+	AST2600,
 };

 enum ast_tx_chip {
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 77066bca8793..4ec6884f6c65 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -143,7 +143,10 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
 	ast_detect_config_mode(dev, &scu_rev);

 	/* Identify chipset */
-	if (dev->pdev->revision >= 0x40) {
+	if (dev->pdev->revision >= 0x50) {
+		ast->chip = AST2600;
+		drm_info(dev, "AST 2600 detected\n");
+	} else if (dev->pdev->revision >= 0x40) {
 		ast->chip = AST2500;
 		drm_info(dev, "AST 2500 detected\n");
 	} else if (dev->pdev->revision >= 0x30) {
--
2.18.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
