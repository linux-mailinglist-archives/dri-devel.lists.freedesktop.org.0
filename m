Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F7F2E2AF6
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E07D89CC9;
	Fri, 25 Dec 2020 09:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m964.mail.126.com (mail-m964.mail.126.com [123.126.96.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DB4898C8
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Dec 2020 08:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=t5dqagdO7HyDT7ULkT
 GzWQJ+Y8umPf+mMs4qo4mfeWw=; b=AxRA1QMZNNswizz3Sr4gC0cD6Q1kpsWruU
 ulDLVH7g8bclikueH3FRx/b3kN5/fEhucPzjyoZUkgYc9lvvkHIVq01bIaPRnyK6
 SvMHRHDZoJOYuRSQR65FQKG8Og/EY2CQSSMngKqo4SXrCU8PSHHXYMeCPP4IP6QW
 OLU+Azo5A=
Received: from localhost.localdomain (unknown [36.112.86.14])
 by smtp9 (Coremail) with SMTP id NeRpCgB3L3o1n+VfBUQrQA--.7179S2;
 Fri, 25 Dec 2020 16:13:42 +0800 (CST)
From: Defang Bo <bodefang@126.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 1/2] drivers/gpu/drm/ast: Fix infinite loop if read fails
Date: Fri, 25 Dec 2020 16:13:33 +0800
Message-Id: <1608884014-2327765-1-git-send-email-bodefang@126.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: NeRpCgB3L3o1n+VfBUQrQA--.7179S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyDJFW3tryDCr15KF4DJwb_yoW8GF4UpF
 47JFyYvrWrtFn0yFW7CF4kWFyrGa97Ja4Fgr97Awn3uF15K3W0vas0kayrKFy7JrZxAFyS
 qr97tryUX3W8uw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRMKZZUUUUU=
X-Originating-IP: [36.112.86.14]
X-CM-SenderInfo: pergvwxdqjqiyswou0bp/1tbikhcG11pECE7YtQAAsh
X-Mailman-Approved-At: Fri, 25 Dec 2020 09:42:09 +0000
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
Cc: Defang Bo <bodefang@126.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why] Similar to commit <298360af3> ast_init_dram_reg() configures a window in order to access BMC memory.
A BMC register can be configured to disallow this, and if so, causes
an infinite loop in the ast driver which renders the system unusable.

[How]
Fix this by erroring out if an error is detected.

Signed-off-by: Defang Bo <bodefang@126.com>
---
 drivers/gpu/drm/ast/ast_post.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index 8902c2f..ef19c70 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -287,7 +287,9 @@ static void ast_init_dram_reg(struct drm_device *dev)
 			ast_write32(ast, 0x10100, 0xa8);
 
 			do {
-				;
+				if (pci_channel_offline(dev->pdev))
+					return -EIO;
+					
 			} while (ast_read32(ast, 0x10100) != 0xa8);
 		} else {/* AST2100/1100 */
 			if (ast->chip == AST2100 || ast->chip == 2200)
@@ -299,12 +301,14 @@ static void ast_init_dram_reg(struct drm_device *dev)
 			ast_write32(ast, 0xf000, 0x1);
 			ast_write32(ast, 0x12000, 0x1688A8A8);
 			do {
-				;
+				if (pci_channel_offline(dev->pdev))
+                                        return -EIO;
 			} while (ast_read32(ast, 0x12000) != 0x01);
 
 			ast_write32(ast, 0x10000, 0xfc600309);
 			do {
-				;
+				if (pci_channel_offline(dev->pdev))
+                                        return -EIO;
 			} while (ast_read32(ast, 0x10000) != 0x01);
 		}
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
