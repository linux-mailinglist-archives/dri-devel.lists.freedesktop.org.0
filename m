Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE239A0A9C8
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2025 14:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7E710E24B;
	Sun, 12 Jan 2025 13:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="ITIz29fB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508F510E24B;
 Sun, 12 Jan 2025 13:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=GBw/kTc50JMCdL9NraUxTr2TqlNGdHlCJYiN4J/1AHo=; b=ITIz29fBjXiKUzVk
 XVN7N8JFH0gA2YyY+KeeyPgLLQYb3mMvljJWc0lymDxYZC0h870pe+BIiyvXazBqbGp/BtvhasASL
 ThuIbJm62mnA4vGurNZ8//c+V5ZHN+3pQFzc03iZGbPKxPDW+fZB73T+kjbY4O3jcIHXF6FdQdNVP
 5Mg+9GVqnaFCdV2JY8nk1nvgsMRYXzAtC/H4EmWxm3TTlFSVJc6L97WoRmRcUEf47wh0On6GfabRf
 KarInBA7f6OgFq/7Gz/YHNa3VdeYTFWYJqaH3rxl+ifutBP+2PQofLWYEWEQDqS1U7MKrLmbtR6Po
 QdWnA+iBuBgGKfdwNg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tWyDA-009jBX-29;
 Sun, 12 Jan 2025 13:41:04 +0000
From: linux@treblig.org
To: Felix.Kuehling@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/amdkfd: Remove unused functions
Date: Sun, 12 Jan 2025 13:41:03 +0000
Message-ID: <20250112134103.72081-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

kfd_device_by_pci_dev(), kfd_get_pasid_limit() and kfd_set_pasid_limit()
have been unused since 2023's
commit c99a2e7ae291 ("drm/amdkfd: drop IOMMUv2 support")

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_pasid.c    | 24 -----------------------
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h     |  3 ---
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 18 -----------------
 3 files changed, 45 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_pasid.c b/drivers/gpu/drm/amd/amdkfd/kfd_pasid.c
index e3b250918f39..8896426e0556 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_pasid.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_pasid.c
@@ -28,30 +28,6 @@
 static unsigned int pasid_bits = 16;
 static bool pasids_allocated; /* = false */
 
-bool kfd_set_pasid_limit(unsigned int new_limit)
-{
-	if (new_limit < 2)
-		return false;
-
-	if (new_limit < (1U << pasid_bits)) {
-		if (pasids_allocated)
-			/* We've already allocated user PASIDs, too late to
-			 * change the limit
-			 */
-			return false;
-
-		while (new_limit < (1U << pasid_bits))
-			pasid_bits--;
-	}
-
-	return true;
-}
-
-unsigned int kfd_get_pasid_limit(void)
-{
-	return 1U << pasid_bits;
-}
-
 u32 kfd_pasid_alloc(void)
 {
 	int r = amdgpu_pasid_alloc(pasid_bits);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 9e5ca0b93b2a..0b5979b29bbc 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1086,8 +1086,6 @@ struct kfd_process *kfd_lookup_process_by_pid(struct pid *pid);
 /* PASIDs */
 int kfd_pasid_init(void);
 void kfd_pasid_exit(void);
-bool kfd_set_pasid_limit(unsigned int new_limit);
-unsigned int kfd_get_pasid_limit(void);
 u32 kfd_pasid_alloc(void);
 void kfd_pasid_free(u32 pasid);
 
@@ -1137,7 +1135,6 @@ struct kfd_topology_device *kfd_topology_device_by_proximity_domain_no_lock(
 						uint32_t proximity_domain);
 struct kfd_topology_device *kfd_topology_device_by_id(uint32_t gpu_id);
 struct kfd_node *kfd_device_by_id(uint32_t gpu_id);
-struct kfd_node *kfd_device_by_pci_dev(const struct pci_dev *pdev);
 static inline bool kfd_irq_is_from_node(struct kfd_node *node, uint32_t node_id,
 					uint32_t vmid)
 {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index 9476e30d6baa..a9bc9ab7e31d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -108,24 +108,6 @@ struct kfd_node *kfd_device_by_id(uint32_t gpu_id)
 	return top_dev->gpu;
 }
 
-struct kfd_node *kfd_device_by_pci_dev(const struct pci_dev *pdev)
-{
-	struct kfd_topology_device *top_dev;
-	struct kfd_node *device = NULL;
-
-	down_read(&topology_lock);
-
-	list_for_each_entry(top_dev, &topology_device_list, list)
-		if (top_dev->gpu && top_dev->gpu->adev->pdev == pdev) {
-			device = top_dev->gpu;
-			break;
-		}
-
-	up_read(&topology_lock);
-
-	return device;
-}
-
 /* Called with write topology_lock acquired */
 static void kfd_release_topology_device(struct kfd_topology_device *dev)
 {
-- 
2.47.1

