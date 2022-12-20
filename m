Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AACD651DAF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 10:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571E210E36A;
	Tue, 20 Dec 2022 09:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.216])
 by gabe.freedesktop.org (Postfix) with ESMTP id E697810E365;
 Tue, 20 Dec 2022 09:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=5U/Q0
 IzBncgGJ65mZDk0e6NuKaOGAn75Xs2OHH9bGHk=; b=SrkBw11w8K6FHxt1r/Cva
 GQWOb75ACnz7P5xM98IkqXOjfmO8KduGo4Pv8Xi7FjygF1zJFdFsOK1cgwI4gtKh
 IJ3JRQ+xud5UYjcCa/m1uk+LeX95NeT/jesrY9D1/ctk2Px2r0+2yJ7uTM6P29q3
 vrWyHZx9Z+ZeDdw9r7kMUo=
Received: from leanderwang-LC2.localdomain (unknown [111.206.145.21])
 by zwqz-smtp-mta-g0-3 (Coremail) with SMTP id _____wB3j3r_gqFjgjtjAA--.34322S2;
 Tue, 20 Dec 2022 17:40:15 +0800 (CST)
From: Zheng Wang <zyytlz.wz@163.com>
To: zhi.a.wang@intel.com
Subject: [PATCH v5] drm/i915/gvt: fix double free bug in split_2MB_gtt_entry
Date: Tue, 20 Dec 2022 17:40:14 +0800
Message-Id: <20221220094014.1128207-1-zyytlz.wz@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <11728bc1-7b59-1623-b517-d1a0d57eb275@intel.com>
References: <11728bc1-7b59-1623-b517-d1a0d57eb275@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wB3j3r_gqFjgjtjAA--.34322S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFW8WFy7XF4DtF17trWxtFb_yoW5JF43pF
 W8XF4YyF48ZF1Ivw47uF18AFy3Z3W3Xa48WrZ7Ka4Ykrs0qF1qkr90yFW5Xr97uFWDAw4f
 Cr4DJrW3Ca4jvaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRomh7UUUUU=
X-Originating-IP: [111.206.145.21]
X-CM-SenderInfo: h2113zf2oz6qqrwthudrp/xtbBzgbdU2I0W3z3ogAAsi
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
 ppgtt_invalidate_spt, which will finally free the spt. But the
 caller function ppgtt_populate_spt_by_guest_entry does not notice
 that, it will free spt again in its error path.

Fix this by undoing the mapping of DMA address and freeing sub_spt.
Besides, leave the handle of spt destroy to caller function instead of
callee function when error occurs.

Fixes: b901b252b6cf ("drm/i915/gvt: Add 2M huge gtt support")
Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
---
v5:
- remove unnecessary switch-case code for there is only one particular case,
correct the unmap target from parent_spt to sub_spt.add more details in
commit message. All suggested by Zhenyu

v4:
- fix by undo the mapping of DMA address and free sub_spt suggested by Zhi

v3:
- correct spelling mistake and remove unused variable suggested by Greg

v2: https://lore.kernel.org/all/20221006165845.1735393-1-zyytlz.wz@163.com/

v1: https://lore.kernel.org/all/20220928033340.1063949-1-zyytlz.wz@163.com/
---
 drivers/gpu/drm/i915/gvt/gtt.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 51e5e8fb505b..4d478a59eb7d 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
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
@@ -1231,6 +1229,18 @@ static int split_2MB_gtt_entry(struct intel_vgpu *vgpu,
 	ops->set_pfn(se, sub_spt->shadow_page.mfn);
 	ppgtt_set_shadow_entry(spt, se, index);
 	return 0;
+err:
+	/* Undone the existing mappings of DMA addr. */
+	for_each_present_shadow_entry(sub_spt, &sub_se, sub_index) {
+		gvt_vdbg_mm("invalidate 4K entry\n");
+		ppgtt_invalidate_pte(sub_spt, &sub_se);
+	}
+	/* Release the new allocated spt. */
+	trace_spt_change(sub_spt->vgpu->id, "release", sub_spt,
+		sub_spt->guest_page.gfn, sub_spt->shadow_page.type);
+	ppgtt_free_spt(sub_spt);
+	sub_spt = NULL;
+	return ret;
 }
 
 static int split_64KB_gtt_entry(struct intel_vgpu *vgpu,
-- 
2.25.1

