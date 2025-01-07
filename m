Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE7CA0421D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 15:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5646A10E6EB;
	Tue,  7 Jan 2025 14:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cG3rwd0j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF06610E6EB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 14:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736259750; x=1767795750;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hq+g4oc3QklxrpvnQp7R4QV+2/xicfwVUXoXC54YJ74=;
 b=cG3rwd0jeelOsaa+9lpFXauHxVCmcdcgWdKfqwWXOsOhTWrp66VBeXGs
 daPr6Zq6+Lf720Ga1RSQeUuN/HcdOUaSKV0x9bI8WzJfSwdQwjRkeOACs
 omzNCWzkwyBHlU6veCuA4FuNukpgz5ZfaagyLuZ3bS3c+xSdjrikK0t/N
 3/+IyPdlIvbAFQm1Z02qUGezN2E6su9jmUs/0b+hX4X1MvTWHFDjBj9Jf
 WIiY+xJg37mGchTlPWi6E3xs7HoIpNpw5mVZzuDamQMuUVdSPcNHhzKIB
 MXRxUnjCxC0h/bGaSdiFh58S3fnOSaXltF51sGR8SoE5XI4t5yYQ/mDuS g==;
X-CSE-ConnectionGUID: rggryS7sSJOhzk1eBzFC0w==
X-CSE-MsgGUID: cD8aBe6ZQPqswhU692JLew==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36324419"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="36324419"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:22:30 -0800
X-CSE-ConnectionGUID: 3ODmwknsTE6s4jgcRphpcw==
X-CSE-MsgGUID: kuke3rV0Swy18xvJYsvQCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103635396"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:22:29 -0800
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 jacek.lawrynowicz@linux.intel.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH 01/14] accel/ivpu: Separate DB ID and CMDQ ID allocations from
 CMDQ allocation
Date: Tue,  7 Jan 2025 18:32:24 +0100
Message-ID: <20250107173238.381120-2-maciej.falkowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
References: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
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

From: Karol Wachowski <karol.wachowski@intel.com>

Move doorbell ID and command queue ID XArray allocations from command
queue memory allocation function. This will allows IDs allocations to be
done without the need for actual memory allocation.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_job.c | 88 +++++++++++++++++++++++++----------
 1 file changed, 64 insertions(+), 24 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 7149312f16e1..98e53cb38ecd 100644
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
2.43.0

