Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 390816E8C49
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 10:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3A110E254;
	Thu, 20 Apr 2023 08:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F0C10E254
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 08:10:06 +0000 (UTC)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 33K7rRRH055548;
 Thu, 20 Apr 2023 15:53:27 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 20 Apr 2023 16:09:49 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <airlied@redhat.com>, <tzimmermann@suse.de>
Subject: [PATCH v2] drm/ast: Fix ARM compatibility
Date: Thu, 20 Apr 2023 16:09:47 +0800
Message-ID: <20230420080947.27226-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 33K7rRRH055548
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ARM architecture only has 'memory', so all devices are accessed by
MMIO if possible.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 v2 changes:
  - Use MMIO after AST2500 which enable MMIO by default.
---
 drivers/gpu/drm/ast/ast_main.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index f83ce77127cb..d384e810fa4d 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -425,11 +425,12 @@ struct ast_private *ast_device_create(const struct drm_driver *drv,
 		return ERR_PTR(-EIO);
 
 	/*
-	 * If we don't have IO space at all, use MMIO now and
-	 * assume the chip has MMIO enabled by default (rev 0x20
-	 * and higher).
+	 * After AST2500, MMIO is enabled by default, and it should be adapted
+	 * to be compatible with Arm.
 	 */
-	if (!(pci_resource_flags(pdev, 2) & IORESOURCE_IO)) {
+	if (pdev->revision >= 0x40) {
+		ast->ioregs = ast->regs + AST_IO_MM_OFFSET;
+	} else if (!(pci_resource_flags(pdev, 2) & IORESOURCE_IO)) {
 		drm_info(dev, "platform has no IO space, trying MMIO\n");
 		ast->ioregs = ast->regs + AST_IO_MM_OFFSET;
 	}

base-commit: e62252bc55b6d4eddc6c2bdbf95a448180d6a08d
-- 
2.25.1

