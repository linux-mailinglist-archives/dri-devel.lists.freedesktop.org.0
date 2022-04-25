Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E12C850EA9B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 22:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9018410E4B7;
	Mon, 25 Apr 2022 20:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7CB10E4B7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 20:31:58 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 6F6FB28C840;
 Mon, 25 Apr 2022 21:31:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1650918716; bh=dVp4tuVe3ZVVujVy5A2ZiQZ/SOUY4NqtuDbAeuK4u5o=;
 h=From:To:Cc:Subject:Date:From;
 b=AntlJkjMMO+vETlLcBnWAOUQIngp97/i1PaWGmHaWdXHohszbmGCXI6PQFe9A4CHe
 LHkqB3u77gjEdigzjyDdNmaeuEnaa2hWTdTSbImX1R9yCkCpHkP6yTOYTILZ7oD/7K
 gkLcNUAmz8K+Eonl+Xud6TojPPv52B6KNr2/H4TzCnD2BpQ2Lhj4MxCTMIT9am/aSR
 0ZNu47MhzXnrmDx9By237xLnqUFTWntfgI6bv9xCtnjvScR/0Efu2BYxFbzWcwxV+r
 p/CwPqjoI8Z0nRpJrJM2lvKZnelkV7AmkzY+A7feG+iJO1B5wZHd/xhAprvXTnm2ac
 UXtCOwGsv5wzw==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/vmwgfx: Remove unused hugepage support
Date: Mon, 25 Apr 2022 16:31:51 -0400
Message-Id: <20220425203152.1314211-1-zack@kde.org>
X-Mailer: git-send-email 2.32.0
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

There's no point in explicitly trying to align virtual memory to
facilitate huge page table entries or huge page memory in buffer objects
given that they're not being used.

Transparent hugepages support for vram allocations has been gradually
retired over the last two years making alignment of unmapped areas
unneeded and pointless.

Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 5dc02fd806db..45028e25d490 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1423,18 +1423,6 @@ static void vmw_debugfs_resource_managers_init(struct vmw_private *vmw)
 					    root, "system_mob_ttm");
 }
 
-static unsigned long
-vmw_get_unmapped_area(struct file *file, unsigned long uaddr,
-		      unsigned long len, unsigned long pgoff,
-		      unsigned long flags)
-{
-	struct drm_file *file_priv = file->private_data;
-	struct vmw_private *dev_priv = vmw_priv(file_priv->minor->dev);
-
-	return drm_get_unmapped_area(file, uaddr, len, pgoff, flags,
-				     dev_priv->drm.vma_offset_manager);
-}
-
 static int vmwgfx_pm_notifier(struct notifier_block *nb, unsigned long val,
 			      void *ptr)
 {
@@ -1601,7 +1589,6 @@ static const struct file_operations vmwgfx_driver_fops = {
 	.compat_ioctl = vmw_compat_ioctl,
 #endif
 	.llseek = noop_llseek,
-	.get_unmapped_area = vmw_get_unmapped_area,
 };
 
 static const struct drm_driver driver = {
-- 
2.32.0

