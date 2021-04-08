Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB6A358B3F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 19:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27EF06EB7D;
	Thu,  8 Apr 2021 17:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F1F6EB7D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 17:22:47 +0000 (UTC)
Received: from sc9-mailhost1.vmware.com (10.113.161.71) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Thu, 8 Apr 2021 10:22:43 -0700
Received: from vertex.vmware.com (unknown [10.16.120.5])
 by sc9-mailhost1.vmware.com (Postfix) with ESMTP id 3FB5A2033D;
 Thu,  8 Apr 2021 10:22:46 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/vmwgfx: Fix the lockdep breakage
Date: Thu, 8 Apr 2021 13:22:44 -0400
Message-ID: <20210408172245.673785-1-zackr@vmware.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-002.vmware.com: zackr@vmware.com does not
 designate permitted sender hosts)
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
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Martin Krastev <krastevm@vmware.com>, Roland Scheidegger <sroland@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas has noticed that the lockdep was broken in vmwgfx. It
was broken during the pci initialization rework. This fixes
the breakage by making sure we initialize the locking code
before doing anything else. This was independently spotted
and fixed by Tetsuo Handa as well.

Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Roland Scheidegger <sroland@vmware.com>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Zack Rusin <zackr@vmware.com>
Fixes: 8772c0bb58bbf98a ("drm/vmwgfx: Cleanup pci resource allocation")
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 17 ++++++++---------
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h |  2 --
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index dd69b51c40e4..6fa24645fbbf 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -712,17 +712,8 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 	dev_priv->last_read_seqno = (uint32_t) -100;
 	dev_priv->drm.dev_private = dev_priv;
 
-	ret = vmw_setup_pci_resources(dev_priv, pci_id);
-	if (ret)
-		return ret;
-	ret = vmw_detect_version(dev_priv);
-	if (ret)
-		goto out_no_pci_or_version;
-
 	mutex_init(&dev_priv->cmdbuf_mutex);
-	mutex_init(&dev_priv->release_mutex);
 	mutex_init(&dev_priv->binding_mutex);
-	mutex_init(&dev_priv->global_kms_state_mutex);
 	ttm_lock_init(&dev_priv->reservation_sem);
 	spin_lock_init(&dev_priv->resource_lock);
 	spin_lock_init(&dev_priv->hw_lock);
@@ -730,6 +721,14 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 	spin_lock_init(&dev_priv->cap_lock);
 	spin_lock_init(&dev_priv->cursor_lock);
 
+	ret = vmw_setup_pci_resources(dev_priv, pci_id);
+	if (ret)
+		return ret;
+	ret = vmw_detect_version(dev_priv);
+	if (ret)
+		goto out_no_pci_or_version;
+
+
 	for (i = vmw_res_context; i < vmw_res_max; ++i) {
 		idr_init(&dev_priv->res_idr[i]);
 		INIT_LIST_HEAD(&dev_priv->res_lru[i]);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 336f5086ca26..8087a9013455 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -529,7 +529,6 @@ struct vmw_private {
 	struct vmw_overlay *overlay_priv;
 	struct drm_property *hotplug_mode_update_property;
 	struct drm_property *implicit_placement_property;
-	struct mutex global_kms_state_mutex;
 	spinlock_t cursor_lock;
 	struct drm_atomic_state *suspend_state;
 
@@ -592,7 +591,6 @@ struct vmw_private {
 	bool refuse_hibernation;
 	bool suspend_locked;
 
-	struct mutex release_mutex;
 	atomic_t num_fifo_resources;
 
 	/*
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
