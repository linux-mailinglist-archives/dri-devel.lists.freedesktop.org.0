Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BD570A9F4
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 20:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2197110E195;
	Sat, 20 May 2023 18:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F71810E195
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 18:22:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CA0E360F1A;
 Sat, 20 May 2023 18:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E9F2C433D2;
 Sat, 20 May 2023 18:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684606939;
 bh=QXOmpFfrX6WqPjEMMraE5Lk9ZwBNgRHBGUmGtOqvR3Y=;
 h=From:To:Cc:Subject:Date:From;
 b=iSwCLec8SCqScGb16+HI4oHFqR/Hs0qviBIURyuZox3ihfrJ4syl5P++GqHyHvxjn
 4cVsfPSKmaEddgl+kkj0mLWxC/fdsIu6Cnpi6AXxly6wTD/DqIct+xK90YlD466bhT
 AX8CDRggXVSqb1RIAdIRtTk75L2NfelpOM+qUG/pwy62Cq5YzUcSO/8ASVWI6/4HO5
 P2Hin2rMIqKPtYvjhkhMjjPVBE+9H+u4THqKVHnxaPW2x5CRgfJCa+ylpaG8scLcfC
 XP21clreOlOU7iKaw8SXEa7rw+fFbtzfnFWXPiZwyQocuJ8i+eKu5GVjGL+NeWC7Ju
 i2BHXgmhKwgxg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 01/11] drm/ast: Fix ARM compatibility
Date: Sat, 20 May 2023 14:22:04 -0400
Message-Id: <20230520182215.845131-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Jammy Huang <jammy_huang@aspeedtech.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jammy Huang <jammy_huang@aspeedtech.com>

[ Upstream commit 4327a6137ed43a091d900b1ac833345d60f32228 ]

ARM architecture only has 'memory', so all devices are accessed by
MMIO if possible.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20230421003354.27767-1-jammy_huang@aspeedtech.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/ast/ast_main.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 79a3618679554..754a08c92d3d1 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -423,11 +423,12 @@ struct ast_private *ast_device_create(const struct drm_driver *drv,
 		return ERR_PTR(-EIO);
 
 	/*
-	 * If we don't have IO space at all, use MMIO now and
-	 * assume the chip has MMIO enabled by default (rev 0x20
-	 * and higher).
+	 * After AST2500, MMIO is enabled by default, and it should be adopted
+	 * to be compatible with Arm.
 	 */
-	if (!(pci_resource_flags(pdev, 2) & IORESOURCE_IO)) {
+	if (pdev->revision >= 0x40) {
+		ast->ioregs = ast->regs + AST_IO_MM_OFFSET;
+	} else if (!(pci_resource_flags(pdev, 2) & IORESOURCE_IO)) {
 		drm_info(dev, "platform has no IO space, trying MMIO\n");
 		ast->ioregs = ast->regs + AST_IO_MM_OFFSET;
 	}
-- 
2.39.2

