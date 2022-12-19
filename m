Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D71D7650C30
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 13:53:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8E910E29E;
	Mon, 19 Dec 2022 12:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.215])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6770010E2A6;
 Mon, 19 Dec 2022 12:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=uxYH6
 rrU5fdjTZNUSkyInFLMBcyBhkRRS55I787F7LE=; b=c3MxkReacFwFpO3rkb5eb
 2mvuGDoCXHLe55cZoIIPb8L90Gsq+IurHKy5SncT4Sjzlua9NpaN7cP34Q7rxQAp
 eWFbvqJQgZZHxNf0NsF4GYG9JwFPaK/9KRtdG5JUVEvbdhZ7aBD2iRAYhVGzmY47
 MYAJCI2jbepyCVq69pkrN8=
Received: from leanderwang-LC2.localdomain (unknown [111.206.145.21])
 by zwqz-smtp-mta-g0-4 (Coremail) with SMTP id _____wA3hXZ1XqBjHoJ2AA--.37727S2;
 Mon, 19 Dec 2022 20:52:05 +0800 (CST)
From: Zheng Wang <zyytlz.wz@163.com>
To: zhi.a.wang@intel.com
Subject: [RESEND PATCH v4] drm/i915/gvt: fix double free bug in
 split_2MB_gtt_entry
Date: Mon, 19 Dec 2022 20:52:04 +0800
Message-Id: <20221219125204.1001149-1-zyytlz.wz@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <11728bc1-7b59-1623-b517-d1a0d57eb275@intel.com>
References: <11728bc1-7b59-1623-b517-d1a0d57eb275@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wA3hXZ1XqBjHoJ2AA--.37727S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXry3Ar17WF1UKryrJr1UWrg_yoW5trWkpF
 WUWF45AF4xAF1IvryfWF18AFy3Z3W3Xa4xWrZ7K3WYkFsrtF1qyrWayFy3Jr9I9rZrWw4f
 CF4UJFZrC34jqa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRYhFsUUUUU=
X-Originating-IP: [111.206.145.21]
X-CM-SenderInfo: h2113zf2oz6qqrwthudrp/1tbiXB3cU1Xl5JmTlQAAsF
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
Cc: alex000young@gmail.com, security@kernel.org,
 intel-gvt-dev@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com,
 airlied@linux.ie, gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 hackerzheng666@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 1002992920@qq.com, zyytlz.wz@163.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If intel_gvt_dma_map_guest_page failed, it will call
 ppgtt_invalidate_spt, which will finally free the spt. But the caller does
 not notice that, it will free spt again in error path.

Fix this by undoing the mapping of DMA address and freeing sub_spt.

Fixes: b901b252b6cf ("drm/i915/gvt: Add 2M huge gtt support")
Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
---
v4:
- fix by undo the mapping of DMA address and free sub_spt suggested by Zhi

v3:
- correct spelling mistake and remove unused variable suggested by Greg

v2: https://lore.kernel.org/all/20221006165845.1735393-1-zyytlz.wz@163.com/

v1: https://lore.kernel.org/all/20220928033340.1063949-1-zyytlz.wz@163.com/
---
 drivers/gpu/drm/i915/gvt/gtt.c | 53 +++++++++++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 51e5e8fb505b..b472e021e5a4 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -1192,11 +1192,11 @@ static int split_2MB_gtt_entry(struct intel_vgpu *vgpu,
 {
 	const struct intel_gvt_gtt_pte_ops *ops = vgpu->gvt->gtt.pte_ops;
 	struct intel_vgpu_ppgtt_spt *sub_spt;
-	struct intel_gvt_gtt_entry sub_se;
+	struct intel_gvt_gtt_entry sub_se, e;
 	unsigned long start_gfn;
 	dma_addr_t dma_addr;
-	unsigned long sub_index;
-	int ret;
+	unsigned long sub_index, parent_index;
+	int ret, ret1;
 
 	gvt_dbg_mm("Split 2M gtt entry, index %lu\n", index);
 
@@ -1209,10 +1209,8 @@ static int split_2MB_gtt_entry(struct intel_vgpu *vgpu,
 	for_each_shadow_entry(sub_spt, &sub_se, sub_index) {
 		ret = intel_gvt_dma_map_guest_page(vgpu, start_gfn + sub_index,
 						   PAGE_SIZE, &dma_addr);
-		if (ret) {
-			ppgtt_invalidate_spt(spt);
-			return ret;
-		}
+		if (ret)
+			goto err;
 		sub_se.val64 = se->val64;
 
 		/* Copy the PAT field from PDE. */
@@ -1231,6 +1229,47 @@ static int split_2MB_gtt_entry(struct intel_vgpu *vgpu,
 	ops->set_pfn(se, sub_spt->shadow_page.mfn);
 	ppgtt_set_shadow_entry(spt, se, index);
 	return 0;
+err:
+	/* Undone the existing mappings of DMA addr. */
+	for_each_present_shadow_entry(spt, &e, parent_index) {
+		switch (e.type) {
+		case GTT_TYPE_PPGTT_PTE_4K_ENTRY:
+			gvt_vdbg_mm("invalidate 4K entry\n");
+			ppgtt_invalidate_pte(spt, &e);
+			break;
+		case GTT_TYPE_PPGTT_PTE_64K_ENTRY:
+			/* We don't setup 64K shadow entry so far. */
+			WARN(1, "suspicious 64K gtt entry\n");
+			continue;
+		case GTT_TYPE_PPGTT_PTE_2M_ENTRY:
+			gvt_vdbg_mm("invalidate 2M entry\n");
+			continue;
+		case GTT_TYPE_PPGTT_PTE_1G_ENTRY:
+			WARN(1, "GVT doesn't support 1GB page\n");
+			continue;
+		case GTT_TYPE_PPGTT_PML4_ENTRY:
+		case GTT_TYPE_PPGTT_PDP_ENTRY:
+		case GTT_TYPE_PPGTT_PDE_ENTRY:
+			gvt_vdbg_mm("invalidate PMUL4/PDP/PDE entry\n");
+			ret1 = ppgtt_invalidate_spt_by_shadow_entry(
+					spt->vgpu, &e);
+			if (ret1) {
+				gvt_vgpu_err("fail: shadow page %p shadow entry 0x%llx type %d\n",
+				spt, e.val64, e.type);
+				goto free_spt;
+			}
+			break;
+		default:
+			GEM_BUG_ON(1);
+		}
+	}
+	/* Release the new alloced apt. */
+free_spt:
+	trace_spt_change(sub_spt->vgpu->id, "release", sub_spt,
+		sub_spt->guest_page.gfn, sub_spt->shadow_page.type);
+	ppgtt_free_spt(sub_spt);
+	sub_spt = NULL;
+	return ret;
 }
 
 static int split_64KB_gtt_entry(struct intel_vgpu *vgpu,
-- 
2.25.1

