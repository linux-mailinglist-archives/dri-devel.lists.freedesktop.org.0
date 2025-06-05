Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EC3ACF780
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 20:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C062510E2FE;
	Thu,  5 Jun 2025 18:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="n2Ng5+Mf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 907 seconds by postgrey-1.36 at gabe;
 Thu, 05 Jun 2025 12:15:50 UTC
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9BE1210E0B5
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 12:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=KR
 NCC18omdfEpRQUVlWfZpcOMAD5V4isyK2fPf4AK+o=; b=n2Ng5+MfJomWlDyCJA
 mspK/xhkHAC4SrMEcM+lSVbCSItvu6RueGzPuuAzyxzg/fwGk+dfxXViNqEj7t4M
 xws6xZw6iXJ8qZD6Ae+a2VFv1nKDE/uI46ywkJrasL+RCfaFsPuGIE2UCAQCyq4H
 AnInUTj9Xpf7EoZ9W6m02Z5N4=
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id
 _____wDnSdy_hkFoCz2rGQ--.7118S2; 
 Thu, 05 Jun 2025 20:00:00 +0800 (CST)
From: luoqing <l1138897701@163.com>
To: obitton@habana.ai,
	peterz@infradead.org
Cc: ogabbay@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, luoqing@kylinos.cn
Subject: [PATCH 1/2] accel/habanalabs: ZERO_OR_NULL_PTR Macro overdetection
Date: Thu,  5 Jun 2025 19:59:58 +0800
Message-Id: <20250605115958.799831-1-l1138897701@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnSdy_hkFoCz2rGQ--.7118S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF1ktr4kCFWDCr45tr47Jwb_yoW8ur4fpF
 4UGFnYya15tryDuF4jy3yku3W5GanIgFW7KFy2y3s09asxX347C3W5Ga4qqry7urWUuanx
 ZF1UC3WUCa1rZrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UvQ6XUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: jorrjmiyzxliqr6rljoofrz/1tbiEARiRGhAMMu2UgACsH
X-Mailman-Approved-At: Thu, 05 Jun 2025 18:53:56 +0000
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

From: luoqing <luoqing@kylinos.cn>

sizeof(xx) these variable values' return values cannot be 0.
For memory allocation requests of non-zero length,
there is no need to check other return values;
it is sufficient to only verify that it is not null.

Signed-off-by: luoqing <luoqing@kylinos.cn>
---
 drivers/accel/habanalabs/common/memory.c  | 4 ++--
 drivers/accel/habanalabs/common/mmu/mmu.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
index 601fdbe70179..0d2782529ec3 100644
--- a/drivers/accel/habanalabs/common/memory.c
+++ b/drivers/accel/habanalabs/common/memory.c
@@ -140,7 +140,7 @@ static int alloc_device_memory(struct hl_ctx *ctx, struct hl_mem_in *args,
 	phys_pg_pack->contiguous = contiguous;
 
 	phys_pg_pack->pages = kvmalloc_array(num_pgs, sizeof(u64), GFP_KERNEL);
-	if (ZERO_OR_NULL_PTR(phys_pg_pack->pages)) {
+	if (!(phys_pg_pack->pages)) {
 		rc = -ENOMEM;
 		goto pages_arr_err;
 	}
@@ -887,7 +887,7 @@ static int init_phys_pg_pack_from_userptr(struct hl_ctx *ctx,
 
 	phys_pg_pack->pages = kvmalloc_array(total_npages, sizeof(u64),
 						GFP_KERNEL);
-	if (ZERO_OR_NULL_PTR(phys_pg_pack->pages)) {
+	if (!(phys_pg_pack->pages)) {
 		rc = -ENOMEM;
 		goto page_pack_arr_mem_err;
 	}
diff --git a/drivers/accel/habanalabs/common/mmu/mmu.c b/drivers/accel/habanalabs/common/mmu/mmu.c
index 79823facce7f..a3cf14cf5abc 100644
--- a/drivers/accel/habanalabs/common/mmu/mmu.c
+++ b/drivers/accel/habanalabs/common/mmu/mmu.c
@@ -844,7 +844,7 @@ int hl_mmu_hr_init(struct hl_device *hdev, struct hl_mmu_hr_priv *hr_priv, u32 h
 	}
 
 	hr_priv->mmu_asid_hop0 = kvcalloc(prop->max_asid, sizeof(struct pgt_info), GFP_KERNEL);
-	if (ZERO_OR_NULL_PTR(hr_priv->mmu_asid_hop0)) {
+	if (!(hr_priv->mmu_asid_hop0)) {
 		dev_err(hdev->dev, "Failed to allocate hr-mmu hop0 table\n");
 		rc = -ENOMEM;
 		goto destroy_mmu_pgt_pool;
-- 
2.25.1

