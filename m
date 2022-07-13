Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D36055732A0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 11:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9FF98A9A;
	Wed, 13 Jul 2022 09:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06CA98A7A;
 Wed, 13 Jul 2022 09:30:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3C2E8B81D61;
 Wed, 13 Jul 2022 09:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E505FC341C8;
 Wed, 13 Jul 2022 09:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657704621;
 bh=smG9F2RXMNXCU8+/rdRMph25oHjT7Q2WcPhpkWuHDgo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P7K0y2Z9Vs9n9sU15b+DrTXWHH58JYmo2jAunLW/rw5GihE1pJ/RFTReKKJi/f9yG
 uBpNNO7K7BzKqbIrHuLvMYV6mKtFa0zzNpsjk7VtUWiXwn6NFvKzNKds6GdPY81ODj
 S/bfgZ4h861narp4RQeYoO7IxDDVMotcyJl3B5ICckeg32oP7jPAyUtSxHO3gjWqsw
 PfUIfpQpr/EYE2Je0P5IG5lXOcSBwgjOt7J/Ah49rLc+4c1Fmv+FkBdaVH3XI5UCFO
 d7sT0aUK09aIRAA8huPew1Fb+xwP7ZT4h0Jd+qiEqSgYZ3DyN8XX1zWN6e5s4SWuRw
 CTqj0DXT8WOSA==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBYhH-0050LU-Lr;
 Wed, 13 Jul 2022 10:30:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 07/21] drm/i915/gt: describe the new tlb parameter at
 i915_vma_resource
Date: Wed, 13 Jul 2022 10:30:04 +0100
Message-Id: <29c9a422328bc7c644dbc1e83a28f09e502d34d6.1657703926.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657703926.git.mchehab@kernel.org>
References: <cover.1657703926.git.mchehab@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TLB cache invalidation can happen on two different situations:

1. synchronously, at __vma_put_pages();
2. asynchronously.

On the first case, TLB cache invalidation happens inside
__vma_put_pages(). So, no need to do it later on.

However, on the second case, the pages will keep in memory
until __i915_vma_evict() is called.

So, we need to store the TLB data at struct i915_vma_resource,
in order to do a TLB cache invalidation before allowing
userspace to re-use the same memory.

So, i915_vma_resource_unbind() has gained a new parameter
in order to store the TLB data at the second case.

Document it.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH 00/21] at: https://lore.kernel.org/all/cover.1657703926.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/i915_vma_resource.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_vma_resource.c b/drivers/gpu/drm/i915/i915_vma_resource.c
index 5a67995ea5fe..4fe09ea0a825 100644
--- a/drivers/gpu/drm/i915/i915_vma_resource.c
+++ b/drivers/gpu/drm/i915/i915_vma_resource.c
@@ -216,6 +216,10 @@ i915_vma_resource_fence_notify(struct i915_sw_fence *fence,
 /**
  * i915_vma_resource_unbind - Unbind a vma resource
  * @vma_res: The vma resource to unbind.
+ * @tlb: pointer to vma->obj->mm.tlb associated with the resource
+ *	 to be stored at vma_res->tlb. When not-NULL, it will be used
+ *	 to do TLB cache invalidation before freeing a VMA resource.
+ *	 used only for async unbind.
  *
  * At this point this function does little more than publish a fence that
  * signals immediately unless signaling is held back.
-- 
2.36.1

