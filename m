Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E37608416
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 06:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1108910E6C1;
	Sat, 22 Oct 2022 04:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC6510E6B2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Oct 2022 04:02:43 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 45537320A6B;
 Sat, 22 Oct 2022 05:02:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1666411361; bh=W6lW3tr1JkVjn8+3o/Rjfqzp+23ERFLMnidUukM+TP4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J6nSWzrSLoZ6BsHvGmc1TbB2QKJejQrdyy7IgoUtvzx+PwJWDO+ucpBb1/SLNpOYa
 RX6qxAcoeZ9RD+WXK4SXpbkD9gIl1QPicHwlNjrfrAMWiKwqOAAbr/IOhfwBzHHM7y
 vUY8OMkcZmhWglppqylcm+uUQ0vUA1vuQeyGEICyda4eXQNYl0Ivb4ZnQdsBTLeJ2t
 H/wi4ydAiqrF6Beq48mBAP566Lu9tiBzh8osJqkB/C5GTGxMCH1tr1xhBOU9Lk4nis
 g8SK5LVhbkbdGciKx14IGH2jd0dJ7mBxpZ78tkTov6aaGYlPI3ZqX0LRogHj8sO9bH
 3Xdglt65tHWVQ==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 02/17] drm/vmwgfx: Fix frame-size warning in
 vmw_mksstat_add_ioctl
Date: Sat, 22 Oct 2022 00:02:21 -0400
Message-Id: <20221022040236.616490-3-zack@kde.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221022040236.616490-1-zack@kde.org>
References: <20221022040236.616490-1-zack@kde.org>
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
Cc: krastevm@vmware.com, banackm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Krastev <krastevm@vmware.com>

Function vmw_mksstat_add_ioctl allocates three big arrays on stack.
That triggers frame-size [-Wframe-larger-than=] warning. Refactor
that function to use kmalloc_array instead.

v2: Initialize page to null to avoid possible uninitialized use of it,
    spotted by the kernel test robot <lkp@intel.com>

Signed-off-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>
Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 43 +++++++++++++++++++----------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
index 089046fa21be..50d8b9bcd72a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
@@ -1014,8 +1014,6 @@ int vmw_mksstat_add_ioctl(struct drm_device *dev, void *data,
 
 	struct vmw_private *const dev_priv = vmw_priv(dev);
 
-	struct page *page;
-	MKSGuestStatInstanceDescriptor *pdesc;
 	const size_t num_pages_stat = PFN_UP(arg->stat_len);
 	const size_t num_pages_info = PFN_UP(arg->info_len);
 	const size_t num_pages_strs = PFN_UP(arg->strs_len);
@@ -1023,10 +1021,13 @@ int vmw_mksstat_add_ioctl(struct drm_device *dev, void *data,
 	long nr_pinned_stat;
 	long nr_pinned_info;
 	long nr_pinned_strs;
-	struct page *pages_stat[ARRAY_SIZE(pdesc->statPPNs)];
-	struct page *pages_info[ARRAY_SIZE(pdesc->infoPPNs)];
-	struct page *pages_strs[ARRAY_SIZE(pdesc->strsPPNs)];
+	MKSGuestStatInstanceDescriptor *pdesc;
+	struct page *page = NULL;
+	struct page **pages_stat = NULL;
+	struct page **pages_info = NULL;
+	struct page **pages_strs = NULL;
 	size_t i, slot;
+	int ret_err = -ENOMEM;
 
 	arg->id = -1;
 
@@ -1054,13 +1055,23 @@ int vmw_mksstat_add_ioctl(struct drm_device *dev, void *data,
 
 	BUG_ON(dev_priv->mksstat_user_pages[slot]);
 
+	/* Allocate statically-sized temp arrays for pages -- too big to keep in frame */
+	pages_stat = (struct page **)kmalloc_array(
+		ARRAY_SIZE(pdesc->statPPNs) +
+		ARRAY_SIZE(pdesc->infoPPNs) +
+		ARRAY_SIZE(pdesc->strsPPNs), sizeof(*pages_stat), GFP_KERNEL);
+
+	if (!pages_stat)
+		goto err_nomem;
+
+	pages_info = pages_stat + ARRAY_SIZE(pdesc->statPPNs);
+	pages_strs = pages_info + ARRAY_SIZE(pdesc->infoPPNs);
+
 	/* Allocate a page for the instance descriptor */
 	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
 
-	if (!page) {
-		atomic_set(&dev_priv->mksstat_user_pids[slot], 0);
-		return -ENOMEM;
-	}
+	if (!page)
+		goto err_nomem;
 
 	/* Set up the instance descriptor */
 	pdesc = page_address(page);
@@ -1075,9 +1086,8 @@ int vmw_mksstat_add_ioctl(struct drm_device *dev, void *data,
 		ARRAY_SIZE(pdesc->description) - 1);
 
 	if (desc_len < 0) {
-		atomic_set(&dev_priv->mksstat_user_pids[slot], 0);
-		__free_page(page);
-		return -EFAULT;
+		ret_err = -EFAULT;
+		goto err_nomem;
 	}
 
 	reset_ppn_array(pdesc->statPPNs, ARRAY_SIZE(pdesc->statPPNs));
@@ -1118,6 +1128,7 @@ int vmw_mksstat_add_ioctl(struct drm_device *dev, void *data,
 
 	DRM_DEV_INFO(dev->dev, "pid=%d arg.description='%.*s' id=%zu\n", current->pid, (int)desc_len, pdesc->description, slot);
 
+	kfree(pages_stat);
 	return 0;
 
 err_pin_strs:
@@ -1132,9 +1143,13 @@ int vmw_mksstat_add_ioctl(struct drm_device *dev, void *data,
 	if (nr_pinned_stat > 0)
 		unpin_user_pages(pages_stat, nr_pinned_stat);
 
+err_nomem:
 	atomic_set(&dev_priv->mksstat_user_pids[slot], 0);
-	__free_page(page);
-	return -ENOMEM;
+	if (page)
+		__free_page(page);
+	kfree(pages_stat);
+
+	return ret_err;
 }
 
 /**
-- 
2.34.1

