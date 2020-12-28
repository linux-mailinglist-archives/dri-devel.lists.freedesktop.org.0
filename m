Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8652E35D7
	for <lists+dri-devel@lfdr.de>; Mon, 28 Dec 2020 11:20:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A696D89B46;
	Mon, 28 Dec 2020 10:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15113.mail.126.com (m15113.mail.126.com [220.181.15.113])
 by gabe.freedesktop.org (Postfix) with SMTP id 4885789728
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 02:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=JM1NyRbKhxlRO/i7Ij
 VnVe89Cxv6XhhrXatSpVLuSsQ=; b=ij9TKUUhEXTu8hlHPoN2+BAXhLEXxsPgah
 9iWgPlKps1Z96XoGIjKchSKTVN/bCrnXfnAuAS2KLPKi0KC2pmY2g6bvLw+uRaus
 Y6mq8k6mK3WGxXkC8ZyJ98mHOVQ/5tEkgC2UqpUx6C1gIIdKWbX9tID9vrsaNQ9d
 j4qvaxvSI=
Received: from localhost.localdomain (unknown [36.112.86.14])
 by smtp3 (Coremail) with SMTP id DcmowACHjeGsQulfI9kSNQ--.5611S2;
 Mon, 28 Dec 2020 10:27:57 +0800 (CST)
From: Defang Bo <bodefang@126.com>
To: airlied@redhat.com, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drivers/gpu/drm/ast: Fix infinite loop if read fails
Date: Mon, 28 Dec 2020 10:27:49 +0800
Message-Id: <1609122469-217583-1-git-send-email-bodefang@126.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: DcmowACHjeGsQulfI9kSNQ--.5611S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr43JF4Dur1xXFWkJw4Dtwb_yoW8Gw13pF
 4UJFyYvrZ5tFn0yFW7Can7GFyrCa97Ja4F9r97Jwn3uFyY93ZYvr90yayrKFy7JrZ7AFyS
 qr97tryUX3W09w7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U59N3UUUUU=
X-Originating-IP: [36.112.86.14]
X-CM-SenderInfo: pergvwxdqjqiyswou0bp/1tbikg0J11pECFzcjwAAsY
X-Mailman-Approved-At: Mon, 28 Dec 2020 10:19:13 +0000
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

[Why]
Similar to commit <298360af3>("drivers/gpu/drm/ast: Fix infinite loop if read fails"),
ast_init_dram_reg() configures a window in order to access BMC memory.
A BMC register can be configured to disallow this, and if so, causes
an infinite loop in the ast driver which renders the system unusable.

[How]
Fix this by erroring out if an error is detected.

Signed-off-by: Defang Bo <bodefang@126.com>
---
 drivers/gpu/drm/ast/ast_post.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index 8902c2f..8bcd1e6 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -287,7 +287,8 @@ static void ast_init_dram_reg(struct drm_device *dev)
 			ast_write32(ast, 0x10100, 0xa8);
 
 			do {
-				;
+				if (pci_channel_offline(dev->pdev))
+					return;
 			} while (ast_read32(ast, 0x10100) != 0xa8);
 		} else {/* AST2100/1100 */
 			if (ast->chip == AST2100 || ast->chip == 2200)
@@ -299,12 +300,14 @@ static void ast_init_dram_reg(struct drm_device *dev)
 			ast_write32(ast, 0xf000, 0x1);
 			ast_write32(ast, 0x12000, 0x1688A8A8);
 			do {
-				;
+				if (pci_channel_offline(dev->pdev))
+					return;
 			} while (ast_read32(ast, 0x12000) != 0x01);
 
 			ast_write32(ast, 0x10000, 0xfc600309);
 			do {
-				;
+				if (pci_channel_offline(dev->pdev))
+					return;
 			} while (ast_read32(ast, 0x10000) != 0x01);
 		}
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
