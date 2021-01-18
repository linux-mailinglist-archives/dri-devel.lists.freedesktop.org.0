Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE9C2F9B9B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 09:58:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9351D89C52;
	Mon, 18 Jan 2021 08:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A2989C52
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 08:58:12 +0000 (UTC)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 10I8qj7E044071;
 Mon, 18 Jan 2021 16:52:45 +0800 (GMT-8)
 (envelope-from kuohsiang_chou@aspeedtech.com)
Received: from localhost.localdomain.com (192.168.2.206) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 18 Jan 2021 16:58:03 +0800
From: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
To: <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/ast: Update the sequence of Clearing Fast-reset
Date: Mon, 18 Jan 2021 16:57:55 +0800
Message-ID: <20210118085755.107804-1-kuohsiang_chou@aspeedtech.com>
X-Mailer: git-send-email 2.18.4
MIME-Version: 1.0
X-Originating-IP: [192.168.2.206]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 10I8qj7E044071
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

[Bug][AST2500]
If SCU00 is not unlocked, just enter its password again.
It is unnecessary to clear AHB lock condition and restore WDT default
setting again, before Fast-reset clearing.

Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
---
 drivers/gpu/drm/ast/ast_post.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index 1f0007daa005..4f194c5fd2c2 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -2030,7 +2030,6 @@ void ast_patch_ahb_2500(struct ast_private *ast)
 {
 	u32	data;

-patch_ahb_lock:
 	/* Clear bus lock condition */
 	ast_moutdwm(ast, 0x1e600000, 0xAEED1A03);
 	ast_moutdwm(ast, 0x1e600084, 0x00010000);
@@ -2044,11 +2043,9 @@ void ast_patch_ahb_2500(struct ast_private *ast)
 		ast_moutdwm(ast, 0x1E78500c, 0x00000033);
 		udelay(1000);
 	}
-	ast_moutdwm(ast, 0x1e6e2000, 0x1688A8A8);
 	do {
+		ast_moutdwm(ast, 0x1e6e2000, 0x1688A8A8);
 		data = ast_mindwm(ast, 0x1e6e2000);
-		if (data == 0xffffffff)
-			goto patch_ahb_lock;
 	}	while (data != 1);
 	ast_moutdwm(ast, 0x1e6e207c, 0x08000000);	/* clear fast reset */
 }
--
2.18.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
