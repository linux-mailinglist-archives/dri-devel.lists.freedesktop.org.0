Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B26AAA0BD
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B152210E4FF;
	Mon,  5 May 2025 22:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gvM1cW+1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDC510E4FF
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 22:38:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4429C629C9;
 Mon,  5 May 2025 22:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 097FDC4CEEF;
 Mon,  5 May 2025 22:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484708;
 bh=HlSzp+yEa0DoVAu3CNxQX9WBoBXnANNxvrF+hMxFmdo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gvM1cW+1d5Wh5g+tJC+IUvLnD6/QhnHaCx4ooNLvM+FgWQ/Q5fvFvR5ygyvmvyMDY
 uAPXaHK9T66iRu4G1yrC6it7/FJC5RopNdM5OvDiw2c3HJAp6GV+Lp4DFGP8Io04j4
 PNU+KNCf0aW1rOl3KFBWRyje3n5RszQdERxuBLQal0wIWfUHs8mWD/qLijCxSZc7Y/
 EKnH6Fdnx0tyr7rBER44qnfyFZj0CMlcNRVGIK5bHhUZ3l58GCzwqjBpZ09ZwHGdVx
 m4dmyAUD8ShTb4cVWt5x3IvcZOBY4D42LaWXxRRMEZpTxaZVMsMJGUjaUcGnKEcl/S
 qvtpSzWRS6dww==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Karol Wachowski <karol.wachowski@intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Sasha Levin <sashal@kernel.org>, ogabbay@kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 620/642] accel/ivpu: Separate DB ID and CMDQ ID
 allocations from CMDQ allocation
Date: Mon,  5 May 2025 18:13:56 -0400
Message-Id: <20250505221419.2672473-620-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Karol Wachowski <karol.wachowski@intel.com>

[ Upstream commit 950942b4813f8c44dbec683fdb140cf4a238516b ]

Move doorbell ID and command queue ID XArray allocations from command
queue memory allocation function. This will allow ID allocations to be
done without the need for actual memory allocation.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250107173238.381120-2-maciej.falkowski@linux.intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/accel/ivpu/ivpu_job.c | 88 +++++++++++++++++++++++++----------
 1 file changed, 64 insertions(+), 24 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 7149312f16e19..98e53cb38ecd3 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -83,23 +83,9 @@ static struct ivpu_cmdq *ivpu_cmdq_alloc(struct ivpu_file_priv *file_priv)
 	if (!cmdq)
 		return NULL;
 
-	ret = xa_alloc_cyclic(&vdev->db_xa, &cmdq->db_id, NULL, vdev->db_limit, &vdev->db_next,
-			      GFP_KERNEL);
-	if (ret < 0) {
-		ivpu_err(vdev, "Failed to allocate doorbell id: %d\n", ret);
-		goto err_free_cmdq;
-	}
-
-	ret = xa_alloc_cyclic(&file_priv->cmdq_xa, &cmdq->id, cmdq, file_priv->cmdq_limit,
-			      &file_priv->cmdq_id_next, GFP_KERNEL);
-	if (ret < 0) {
-		ivpu_err(vdev, "Failed to allocate command queue id: %d\n", ret);
-		goto err_erase_db_xa;
-	}
-
 	cmdq->mem = ivpu_bo_create_global(vdev, SZ_4K, DRM_IVPU_BO_WC | DRM_IVPU_BO_MAPPABLE);
 	if (!cmdq->mem)
-		goto err_erase_cmdq_xa;
+		goto err_free_cmdq;
 
 	ret = ivpu_preemption_buffers_create(vdev, file_priv, cmdq);
 	if (ret)
@@ -107,10 +93,6 @@ static struct ivpu_cmdq *ivpu_cmdq_alloc(struct ivpu_file_priv *file_priv)
 
 	return cmdq;
 
-err_erase_cmdq_xa:
-	xa_erase(&file_priv->cmdq_xa, cmdq->id);
-err_erase_db_xa:
-	xa_erase(&vdev->db_xa, cmdq->db_id);
 err_free_cmdq:
 	kfree(cmdq);
 	return NULL;
@@ -233,30 +215,88 @@ static int ivpu_cmdq_fini(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cm
 	return 0;
 }
 
+static int ivpu_db_id_alloc(struct ivpu_device *vdev, u32 *db_id)
+{
+	int ret;
+	u32 id;
+
+	ret = xa_alloc_cyclic(&vdev->db_xa, &id, NULL, vdev->db_limit, &vdev->db_next, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+
+	*db_id = id;
+	return 0;
+}
+
+static int ivpu_cmdq_id_alloc(struct ivpu_file_priv *file_priv, u32 *cmdq_id)
+{
+	int ret;
+	u32 id;
+
+	ret = xa_alloc_cyclic(&file_priv->cmdq_xa, &id, NULL, file_priv->cmdq_limit,
+			      &file_priv->cmdq_id_next, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+
+	*cmdq_id = id;
+	return 0;
+}
+
 static struct ivpu_cmdq *ivpu_cmdq_acquire(struct ivpu_file_priv *file_priv, u8 priority)
 {
+	struct ivpu_device *vdev = file_priv->vdev;
 	struct ivpu_cmdq *cmdq;
-	unsigned long cmdq_id;
+	unsigned long id;
 	int ret;
 
 	lockdep_assert_held(&file_priv->lock);
 
-	xa_for_each(&file_priv->cmdq_xa, cmdq_id, cmdq)
+	xa_for_each(&file_priv->cmdq_xa, id, cmdq)
 		if (cmdq->priority == priority)
 			break;
 
 	if (!cmdq) {
 		cmdq = ivpu_cmdq_alloc(file_priv);
-		if (!cmdq)
+		if (!cmdq) {
+			ivpu_err(vdev, "Failed to allocate command queue\n");
 			return NULL;
+		}
+
+		ret = ivpu_db_id_alloc(vdev, &cmdq->db_id);
+		if (ret) {
+			ivpu_err(file_priv->vdev, "Failed to allocate doorbell ID: %d\n", ret);
+			goto err_free_cmdq;
+		}
+
+		ret = ivpu_cmdq_id_alloc(file_priv, &cmdq->id);
+		if (ret) {
+			ivpu_err(vdev, "Failed to allocate command queue ID: %d\n", ret);
+			goto err_erase_db_id;
+		}
+
 		cmdq->priority = priority;
+		ret = xa_err(xa_store(&file_priv->cmdq_xa, cmdq->id, cmdq, GFP_KERNEL));
+		if (ret) {
+			ivpu_err(vdev, "Failed to store command queue in cmdq_xa: %d\n", ret);
+			goto err_erase_cmdq_id;
+		}
 	}
 
 	ret = ivpu_cmdq_init(file_priv, cmdq, priority);
-	if (ret)
-		return NULL;
+	if (ret) {
+		ivpu_err(vdev, "Failed to initialize command queue: %d\n", ret);
+		goto err_free_cmdq;
+	}
 
 	return cmdq;
+
+err_erase_cmdq_id:
+	xa_erase(&file_priv->cmdq_xa, cmdq->id);
+err_erase_db_id:
+	xa_erase(&vdev->db_xa, cmdq->db_id);
+err_free_cmdq:
+	ivpu_cmdq_free(file_priv, cmdq);
+	return NULL;
 }
 
 void ivpu_cmdq_release_all_locked(struct ivpu_file_priv *file_priv)
-- 
2.39.5

