Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE143CC237
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 11:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90426EA4A;
	Sat, 17 Jul 2021 09:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 457 seconds by postgrey-1.36 at gabe;
 Fri, 16 Jul 2021 10:49:59 UTC
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net
 (zg8tmty1ljiyny4xntqumjca.icoremail.net [165.227.154.27])
 by gabe.freedesktop.org (Postfix) with SMTP id 6B3F86E95B;
 Fri, 16 Jul 2021 10:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fudan.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id; bh=w5xXaDBOfVSI80cqGOxUol6Qepjcs1Dts3X92bpb+2w=; b=O
 mrzHJyX9PLJKjMmUPnKju2lLoHQnRyq6BioyNjE8T5Iny1ZfZUsLdvrBH81v3+vT
 3cEC4fPDctEUN5T8nzjaus0UO5c/cbu7RQQ+gXZuQcevnpnkaDSH27oBDrDJawC+
 goDDtVsCSPIsv2HLQEqUmAnhU/CYNDVlPvI4kfm0Qw=
Received: from localhost.localdomain (unknown [10.162.86.133])
 by app2 (Coremail) with SMTP id XQUFCgCnriZoYvFgqS7QBA--.26894S3;
 Fri, 16 Jul 2021 18:41:45 +0800 (CST)
From: Xiyu Yang <xiyuyang19@fudan.edu.cn>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/gvt: Convert from atomic_t to refcount_t on
 intel_vgpu_ppgtt_spt->refcount
Date: Fri, 16 Jul 2021 18:41:38 +0800
Message-Id: <1626432098-27626-1-git-send-email-xiyuyang19@fudan.edu.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: XQUFCgCnriZoYvFgqS7QBA--.26894S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Wry3tF48Wr15Zr1xWr17Wrg_yoW8tFy5pF
 4YvF9rAFs5Aa4IqrW7Aa48ZF1fJ3WfZa4rGrWkK3ZIqr9rt3W5t39YvFW5JryUXrZrJr1a
 9r1UWrWakasrWaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9E14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
 648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
 C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
 wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
 vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
 0xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
 AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbHa0DUUUUU==
X-CM-SenderInfo: irzsiiysuqikmy6i3vldqovvfxof0/
X-Mailman-Approved-At: Sat, 17 Jul 2021 09:35:00 +0000
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
Cc: Xin Tan <tanxin.ctf@gmail.com>, yuanxzhang@fudan.edu.cn,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

refcount_t type and corresponding API can protect refcounters from
accidental underflow and overflow and further use-after-free situations

Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 11 ++++++-----
 drivers/gpu/drm/i915/gvt/gtt.h |  3 ++-
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index cc2c05e18206..62f3daff5a36 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -841,7 +841,7 @@ static struct intel_vgpu_ppgtt_spt *ppgtt_alloc_spt(
 	}
 
 	spt->vgpu = vgpu;
-	atomic_set(&spt->refcount, 1);
+	refcount_set(&spt->refcount, 1);
 	INIT_LIST_HEAD(&spt->post_shadow_list);
 
 	/*
@@ -927,18 +927,19 @@ static struct intel_vgpu_ppgtt_spt *ppgtt_alloc_spt_gfn(
 
 static inline void ppgtt_get_spt(struct intel_vgpu_ppgtt_spt *spt)
 {
-	int v = atomic_read(&spt->refcount);
+	int v = refcount_read(&spt->refcount);
 
 	trace_spt_refcount(spt->vgpu->id, "inc", spt, v, (v + 1));
-	atomic_inc(&spt->refcount);
+	refcount_inc(&spt->refcount);
 }
 
 static inline int ppgtt_put_spt(struct intel_vgpu_ppgtt_spt *spt)
 {
-	int v = atomic_read(&spt->refcount);
+	int v = refcount_read(&spt->refcount);
 
 	trace_spt_refcount(spt->vgpu->id, "dec", spt, v, (v - 1));
-	return atomic_dec_return(&spt->refcount);
+	refcount_dec(&spt->refcount);
+	return refcount_read(&spt->refcount);
 }
 
 static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt);
diff --git a/drivers/gpu/drm/i915/gvt/gtt.h b/drivers/gpu/drm/i915/gvt/gtt.h
index 3bf45672ef98..944c2d0739df 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.h
+++ b/drivers/gpu/drm/i915/gvt/gtt.h
@@ -38,6 +38,7 @@
 #include <linux/kref.h>
 #include <linux/mutex.h>
 #include <linux/radix-tree.h>
+#include <linux/refcount.h>
 
 #include "gt/intel_gtt.h"
 
@@ -243,7 +244,7 @@ struct intel_vgpu_oos_page {
 
 /* Represent a vgpu shadow page table. */
 struct intel_vgpu_ppgtt_spt {
-	atomic_t refcount;
+	refcount_t refcount;
 	struct intel_vgpu *vgpu;
 
 	struct {
-- 
2.7.4

