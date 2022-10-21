Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86810606E62
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 05:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0627C10E493;
	Fri, 21 Oct 2022 03:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162D610E0DD
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 03:44:09 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 29FE533EEF3;
 Fri, 21 Oct 2022 04:44:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1666323847; bh=uaKHv1POeaC/frQoloocoC7d6lsVmEIsjtLGJsYfV34=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KS+0bFeURMOSUL1WW4uhHAFKcHVy2CGSxIxZfnyAIyAEpEKTFLE+kscU+HnJHJm7d
 SoS3aWer61jt+HqIGYV8tlkhYbBG64O6B5YcZ/ocCspK/vb/Y2iEPwe+3X4aQeda+X
 SWzWKcyPWLITeU9oL4WZuSnvmXe3ZeQgL+/o4pc32g9AUI3VADBsXYUKOViCKwh+MR
 5TsAgY/W8FIEzNWAt70vEt0iqdyrrKbMQ2BDMNd0JoMN6+mSL/aksjZK+nFv05qjdb
 X36qMMZuO2i6cK5HnIxZPaLy7sYBTt6ex3cWr9qfrnDaFi9ZSF5AEqTblOVIy1O1Z+
 ovAYo3WgKrqmw==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 02/17] drm/vmwgfx: Fix frame-size warning in
 vmw_mksstat_add_ioctl
Date: Thu, 20 Oct 2022 23:43:45 -0400
Message-Id: <20221021034400.542909-3-zack@kde.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021034400.542909-1-zack@kde.org>
References: <20221021034400.542909-1-zack@kde.org>
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

Signed-off-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>
Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 39 ++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
index 089046fa21be..a6cea35eaa01 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
@@ -1023,10 +1023,11 @@ int vmw_mksstat_add_ioctl(struct drm_device *dev, void *data,
 	long nr_pinned_stat;
 	long nr_pinned_info;
 	long nr_pinned_strs;
-	struct page *pages_stat[ARRAY_SIZE(pdesc->statPPNs)];
-	struct page *pages_info[ARRAY_SIZE(pdesc->infoPPNs)];
-	struct page *pages_strs[ARRAY_SIZE(pdesc->strsPPNs)];
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

