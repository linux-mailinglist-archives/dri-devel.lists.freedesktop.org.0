Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BE23A1BB2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 19:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D10A46E9E3;
	Wed,  9 Jun 2021 17:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03A26E9B6
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 17:23:13 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Wed, 9 Jun 2021 10:23:10 -0700
Received: from vertex.localdomain (unknown [10.21.244.178])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 04A0B2024E;
 Wed,  9 Jun 2021 10:23:12 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 7/9] drm/vmwgfx: Refactor vmw_mksstat_remove_ioctl to expect
 pgid match with vmw_mksstat_add_ioctl to authorise removal.
Date: Wed, 9 Jun 2021 13:23:05 -0400
Message-ID: <20210609172307.131929-8-zackr@vmware.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210609172307.131929-1-zackr@vmware.com>
References: <20210609172307.131929-1-zackr@vmware.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: Martin Krastev <krastevm@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Krastev <krastevm@vmware.com>

Original vmw_mksstat_remove_ioctl expected pid to match the corresponding vmw_mksstat_add_ioctl.
That made impossible en-masse removals by one pid, which is a valid use case, so pid match was
discarded. Current change enforces a broader pgid match as a form of protection from arbitrary
processes interrupting an ongoing mks-guest-stats.

Reviewed-by: Zack Rusin <zackr@vmware.com>
Signed-off-by: Martin Krastev <krastevm@vmware.com>
Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 32 ++++++++++++-----------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
index 12df4c634075..74a3f09ad664 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
@@ -1111,7 +1111,7 @@ int vmw_mksstat_add_ioctl(struct drm_device *dev, void *data,
 	hypervisor_ppn_add((PPN64)page_to_pfn(page));
 
 	dev_priv->mksstat_user_pages[slot] = page;
-	atomic_set(&dev_priv->mksstat_user_pids[slot], current->pid);
+	atomic_set(&dev_priv->mksstat_user_pids[slot], task_pgrp_vnr(current));
 
 	arg->id = slot;
 
@@ -1158,37 +1158,31 @@ int vmw_mksstat_remove_ioctl(struct drm_device *dev, void *data,
 	struct vmw_private *const dev_priv = vmw_priv(dev);
 
 	const size_t slot = arg->id;
-	pid_t pid0;
+	pid_t pgid, pid;
 
 	if (slot >= ARRAY_SIZE(dev_priv->mksstat_user_pids))
 		return -EINVAL;
 
 	DRM_DEV_INFO(dev->dev, "pid=%d arg.id=%lu\n", current->pid, slot);
 
-	pid0 = atomic_read(&dev_priv->mksstat_user_pids[slot]);
+	pgid = task_pgrp_vnr(current);
+	pid = atomic_cmpxchg(&dev_priv->mksstat_user_pids[slot], pgid, MKSSTAT_PID_RESERVED);
 
-	if (!pid0)
+	if (!pid)
 		return 0;
 
-	if (pid0 != MKSSTAT_PID_RESERVED) {
-		const pid_t pid1 = atomic_cmpxchg(&dev_priv->mksstat_user_pids[slot], pid0, MKSSTAT_PID_RESERVED);
+	if (pid == pgid) {
+		struct page *const page = dev_priv->mksstat_user_pages[slot];
 
-		if (!pid1)
-			return 0;
-
-		if (pid1 == pid0) {
-			struct page *const page = dev_priv->mksstat_user_pages[slot];
+		BUG_ON(!page);
 
-			BUG_ON(!page);
-
-			dev_priv->mksstat_user_pages[slot] = NULL;
-			atomic_set(&dev_priv->mksstat_user_pids[slot], 0);
+		dev_priv->mksstat_user_pages[slot] = NULL;
+		atomic_set(&dev_priv->mksstat_user_pids[slot], 0);
 
-			hypervisor_ppn_remove((PPN64)page_to_pfn(page));
+		hypervisor_ppn_remove((PPN64)page_to_pfn(page));
 
-			vmw_mksstat_cleanup_descriptor(page);
-			return 0;
-		}
+		vmw_mksstat_cleanup_descriptor(page);
+		return 0;
 	}
 
 	return -EAGAIN;
-- 
2.30.2

