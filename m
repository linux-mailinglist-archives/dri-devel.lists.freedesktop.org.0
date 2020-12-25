Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D5E2E2AF7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:43:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9506A89C80;
	Fri, 25 Dec 2020 09:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m964.mail.126.com (mail-m964.mail.126.com [123.126.96.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97DD898C8
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Dec 2020 08:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=En7Gpmtc3/wWaw6Atp
 RnRmYZe/wcAcBFc8FpXL5uPMY=; b=SiyivXHvZeIi6ImxAmSsi4uPvt6ScNra+S
 7cpM16wxNI/bd8OA3azXi3MuPZ0jgGJ8z8LxIIoQa2W41RWQoFEGDRjA/pf4rYx+
 /hU82RRyv+/mZnnWQJLnZgJCk00uzAUGHnrGwtugz3fnAsTXNlvFG7jW0fahxxyb
 lMGZ2nqJY=
Received: from localhost.localdomain (unknown [36.112.86.14])
 by smtp9 (Coremail) with SMTP id NeRpCgB3L3o1n+VfBUQrQA--.7179S3;
 Fri, 25 Dec 2020 16:13:45 +0800 (CST)
From: Defang Bo <bodefang@126.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 2/2] drivers/gpu/drm/ast: Fix infinite loop if read fails
Date: Fri, 25 Dec 2020 16:13:34 +0800
Message-Id: <1608884014-2327765-2-git-send-email-bodefang@126.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608884014-2327765-1-git-send-email-bodefang@126.com>
References: <1608884014-2327765-1-git-send-email-bodefang@126.com>
X-CM-TRANSID: NeRpCgB3L3o1n+VfBUQrQA--.7179S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKrWDAw1UKrWrGFy8KFy3Jwb_yoWDtFg_Cr
 1rXr9xW34qy3Zrur1jya15ZrZF9a1j9rZ5X3W7KayfAr18ArsIq3409rykAr4UW3ZrZFZ8
 Xa1kWry5Jr1fKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj8sqtUUUUU==
X-Originating-IP: [36.112.86.14]
X-CM-SenderInfo: pergvwxdqjqiyswou0bp/1tbiExkG11pD+-BOsgAAs1
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
 drivers/gpu/drm/ast/ast_post.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index ef19c70..86e4d23 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -302,13 +302,13 @@ static void ast_init_dram_reg(struct drm_device *dev)
 			ast_write32(ast, 0x12000, 0x1688A8A8);
 			do {
 				if (pci_channel_offline(dev->pdev))
-                                        return -EIO;
+					return -EIO;
 			} while (ast_read32(ast, 0x12000) != 0x01);
 
 			ast_write32(ast, 0x10000, 0xfc600309);
 			do {
 				if (pci_channel_offline(dev->pdev))
-                                        return -EIO;
+					return -EIO;
 			} while (ast_read32(ast, 0x10000) != 0x01);
 		}
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
