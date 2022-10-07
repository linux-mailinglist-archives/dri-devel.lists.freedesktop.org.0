Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 104E25F728C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 03:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112ED10E903;
	Fri,  7 Oct 2022 01:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m971.mail.163.com (mail-m971.mail.163.com [123.126.97.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id E977B10E903;
 Fri,  7 Oct 2022 01:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=7PIcH
 oJT2xUDoymReRma8zSJpRHSmZRy+6yCr4qAVKE=; b=D0Bn16E7W2DRuYPLYLVCJ
 q/g6M+N5Lafsk3BluhaJvyRI8bA7yzDWXag5ma1s52uu/QsouOafWAP1t3ADzoiO
 179arph26YPvLkqlxYT2cO7E/+Q3VDINfxO2kTRENWqnhjO+HPF0sN8byM2O8D8I
 Jl4kI2Br4mb8HcrLUTkKz0=
Received: from leanderwang-LC2.localdomain (unknown [111.206.145.21])
 by smtp1 (Coremail) with SMTP id GdxpCgA3UcHFgj9jXCGUiQ--.26378S2;
 Fri, 07 Oct 2022 09:37:10 +0800 (CST)
From: Zheng Wang <zyytlz.wz@163.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH v3] drm/i915/gvt: fix double free bug in split_2MB_gtt_entry
Date: Fri,  7 Oct 2022 09:37:08 +0800
Message-Id: <20221007013708.1946061-1-zyytlz.wz@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <Yz8rIxV7bVCcfZb0@kroah.com>
References: <Yz8rIxV7bVCcfZb0@kroah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: GdxpCgA3UcHFgj9jXCGUiQ--.26378S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr47Jw43Kw13Zr4rur48WFg_yoW5uw17pF
 W5XFZ0yFs8Aw4IvF47Cw1kZF15JF1fWFy8GrZ3K3ZYyF1DtF1DKa9avrW7XryS9FZ7Gr1f
 Ar4UtF4UCay7XaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRloGLUUUUU=
X-Originating-IP: [111.206.145.21]
X-CM-SenderInfo: h2113zf2oz6qqrwthudrp/1tbiXAaTU1Xl4ZoIewAAsi
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
Cc: alex000young@gmail.com, security@kernel.org, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, hackerzheng666@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 1002992920@qq.com, zyytlz.wz@163.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If intel_gvt_dma_map_guest_page failed, it will call
ppgtt_invalidate_spt, which will finally free the spt.
But the caller does not notice that, it will free spt again in error path.

Fix this by spliting invalidate and free in ppgtt_invalidate_spt.
Only free spt when in good case.

Reported-by: Zheng Wang <hackerzheng666@gmail.com>
Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
---
v3:
- correct spelling mistake and remove unused variable suggested by Greg

v2: https://lore.kernel.org/all/20221006165845.1735393-1-zyytlz.wz@163.com/

v1: https://lore.kernel.org/all/20220928033340.1063949-1-zyytlz.wz@163.com/
---
 drivers/gpu/drm/i915/gvt/gtt.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index ce0eb03709c3..865d33762e45 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -959,6 +959,7 @@ static inline int ppgtt_put_spt(struct intel_vgpu_ppgtt_spt *spt)
 	return atomic_dec_return(&spt->refcount);
 }
 
+static int ppgtt_invalidate_and_free_spt(struct intel_vgpu_ppgtt_spt *spt);
 static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt);
 
 static int ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu *vgpu,
@@ -995,7 +996,7 @@ static int ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu *vgpu,
 				ops->get_pfn(e));
 		return -ENXIO;
 	}
-	return ppgtt_invalidate_spt(s);
+	return ppgtt_invalidate_and_free_spt(s);
 }
 
 static inline void ppgtt_invalidate_pte(struct intel_vgpu_ppgtt_spt *spt,
@@ -1016,18 +1017,30 @@ static inline void ppgtt_invalidate_pte(struct intel_vgpu_ppgtt_spt *spt,
 	intel_gvt_dma_unmap_guest_page(vgpu, pfn << PAGE_SHIFT);
 }
 
-static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt)
+static int ppgtt_invalidate_and_free_spt(struct intel_vgpu_ppgtt_spt *spt)
 {
-	struct intel_vgpu *vgpu = spt->vgpu;
-	struct intel_gvt_gtt_entry e;
-	unsigned long index;
 	int ret;
 
 	trace_spt_change(spt->vgpu->id, "die", spt,
-			spt->guest_page.gfn, spt->shadow_page.type);
-
+		spt->guest_page.gfn, spt->shadow_page.type);
 	if (ppgtt_put_spt(spt) > 0)
 		return 0;
+	ret = ppgtt_invalidate_spt(spt);
+	if (!ret) {
+		trace_spt_change(spt->vgpu->id, "release", spt,
+			 spt->guest_page.gfn, spt->shadow_page.type);
+		ppgtt_free_spt(spt);
+	}
+
+	return ret;
+}
+
+static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt)
+{
+	struct intel_vgpu *vgpu = spt->vgpu;
+	struct intel_gvt_gtt_entry e;
+	unsigned long index;
+	int ret;
 
 	for_each_present_shadow_entry(spt, &e, index) {
 		switch (e.type) {
@@ -1059,9 +1072,6 @@ static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt)
 		}
 	}
 
-	trace_spt_change(spt->vgpu->id, "release", spt,
-			 spt->guest_page.gfn, spt->shadow_page.type);
-	ppgtt_free_spt(spt);
 	return 0;
 fail:
 	gvt_vgpu_err("fail: shadow page %p shadow entry 0x%llx type %d\n",
@@ -1393,7 +1403,7 @@ static int ppgtt_handle_guest_entry_removal(struct intel_vgpu_ppgtt_spt *spt,
 			ret = -ENXIO;
 			goto fail;
 		}
-		ret = ppgtt_invalidate_spt(s);
+		ret = ppgtt_invalidate_and_free_spt(s);
 		if (ret)
 			goto fail;
 	} else {
-- 
2.25.1

