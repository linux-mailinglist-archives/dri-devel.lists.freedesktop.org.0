Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3935ED4EC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 08:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788E710E28F;
	Wed, 28 Sep 2022 06:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 915 seconds by postgrey-1.36 at gabe;
 Wed, 28 Sep 2022 03:49:21 UTC
Received: from mail-m974.mail.163.com (mail-m974.mail.163.com [123.126.97.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 07AF010E20D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 03:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ByRr8
 bZsJJi4I3/qCoEvNPxs2sr+s2xR5n1KueAfAZY=; b=nHH/YhXlV8qTBLS06GksC
 VVv88TpJlSV0HA5IxK404/vcj/p5QzXXjdye/kN76XOWgfDbk1+SLWK7ls4wPAku
 k9d/2YhYM3p7Wr/SAWJUeYZxS7OLxS2gTobh2Uvxkfrrj9sgGz2e6m7nW8XW+4Wh
 Tlcj1TGHTOxf6x8/756Cp4=
Received: from leanderwang-LC2.localdomain (unknown [111.206.145.21])
 by smtp4 (Coremail) with SMTP id HNxpCgCXvdGUwDNj9OqbgQ--.9697S2;
 Wed, 28 Sep 2022 11:33:41 +0800 (CST)
From: Zheng Wang <zyytlz.wz@163.com>
To: hackerzheng666@gmail.com
Subject: [PATCH] drm/i915/gvt: fix double free bug in split_2MB_gtt_entry
Date: Wed, 28 Sep 2022 11:33:40 +0800
Message-Id: <20220928033340.1063949-1-zyytlz.wz@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAJedcCzjWw6v5Nt42jsCStdpwHuz13D+q-CD=6ycVWBczY+4mg@mail.gmail.com>
References: <CAJedcCzjWw6v5Nt42jsCStdpwHuz13D+q-CD=6ycVWBczY+4mg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: HNxpCgCXvdGUwDNj9OqbgQ--.9697S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJFWrCw4kCrW7ZF15Ar1DKFg_yoW5WF4fpF
 W5Xa1qyFs5A3y2vF47Aa1kZF15AF1fury8Gr93K3ZayF1DtF1ktFZ8XFW3Wrya9FZ7Gr1f
 Ar4UtFW7Cay7XaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRDGYJUUUUU=
X-Originating-IP: [111.206.145.21]
X-CM-SenderInfo: h2113zf2oz6qqrwthudrp/xtbCqQOKU10DhE6moAAAsh
X-Mailman-Approved-At: Wed, 28 Sep 2022 06:30:59 +0000
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
Cc: alex000young@gmail.com, security@kernel.org, tvrtko.ursulin@linux.intel.com,
 airlied@linux.ie, gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 1002992920@qq.com, Zheng Wang <zyytlz.wz@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If intel_gvt_dma_map_guest_page failed, it will call
ppgtt_invalidate_spt, which will finally free the spt.
But the caller does not notice that, it will free spt again in error path.

Fix this by only freeing spt in ppgtt_invalidate_spt in good case.

Fixes: b901b252b6cf ("drm/i915/gvt: Add 2M huge gtt support")
Reported-by: Zheng Wang <hackerzheng666@gmail.com>
Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index ce0eb03709c3..550519f0acca 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -959,7 +959,7 @@ static inline int ppgtt_put_spt(struct intel_vgpu_ppgtt_spt *spt)
 	return atomic_dec_return(&spt->refcount);
 }
 
-static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt);
+static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt, int is_error);
 
 static int ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu *vgpu,
 		struct intel_gvt_gtt_entry *e)
@@ -995,7 +995,7 @@ static int ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu *vgpu,
 				ops->get_pfn(e));
 		return -ENXIO;
 	}
-	return ppgtt_invalidate_spt(s);
+	return ppgtt_invalidate_spt(s, 0);
 }
 
 static inline void ppgtt_invalidate_pte(struct intel_vgpu_ppgtt_spt *spt,
@@ -1016,7 +1016,7 @@ static inline void ppgtt_invalidate_pte(struct intel_vgpu_ppgtt_spt *spt,
 	intel_gvt_dma_unmap_guest_page(vgpu, pfn << PAGE_SHIFT);
 }
 
-static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt)
+static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt, int is_error)
 {
 	struct intel_vgpu *vgpu = spt->vgpu;
 	struct intel_gvt_gtt_entry e;
@@ -1059,9 +1059,11 @@ static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt)
 		}
 	}
 
-	trace_spt_change(spt->vgpu->id, "release", spt,
+	if (!is_error) {
+		trace_spt_change(spt->vgpu->id, "release", spt,
 			 spt->guest_page.gfn, spt->shadow_page.type);
-	ppgtt_free_spt(spt);
+		ppgtt_free_spt(spt);
+	}
 	return 0;
 fail:
 	gvt_vgpu_err("fail: shadow page %p shadow entry 0x%llx type %d\n",
@@ -1215,7 +1217,7 @@ static int split_2MB_gtt_entry(struct intel_vgpu *vgpu,
 		ret = intel_gvt_dma_map_guest_page(vgpu, start_gfn + sub_index,
 						   PAGE_SIZE, &dma_addr);
 		if (ret) {
-			ppgtt_invalidate_spt(spt);
+			ppgtt_invalidate_spt(spt, 1);
 			return ret;
 		}
 		sub_se.val64 = se->val64;
@@ -1393,7 +1395,7 @@ static int ppgtt_handle_guest_entry_removal(struct intel_vgpu_ppgtt_spt *spt,
 			ret = -ENXIO;
 			goto fail;
 		}
-		ret = ppgtt_invalidate_spt(s);
+		ret = ppgtt_invalidate_spt(s, 0);
 		if (ret)
 			goto fail;
 	} else {
-- 
2.25.1

