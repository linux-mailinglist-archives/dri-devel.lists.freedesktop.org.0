Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9435574CD3
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 14:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D721128F4;
	Thu, 14 Jul 2022 12:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A6C11298F;
 Thu, 14 Jul 2022 12:06:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9E6B361E2E;
 Thu, 14 Jul 2022 12:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C1CC341CA;
 Thu, 14 Jul 2022 12:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657800390;
 bh=k6CXTL8ceMAzWtFMfpdGKkaoDa07ImXWLg+e0JE66dg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pKunhve3qZujvooirtyHbI4zCCgeMc3wzGjIDG0l2qd69h+MvnWTX69mkKVHEdLzi
 B6kPxxlNHfCi5sTgNFO2DgQ8T38EBTjc/PgHal5yBQY+zT1E/mkXz+bKfowzIFre7r
 GIe2H26ysSxaThpdPrVHe4yV5+0GNtv2lZ7Ok/eq9m8QYCKwIGWzRfcLY6h4BBrfCh
 IHoW3Zu7mr2vhef2mnEo7BbtaQ5mOeqblB8+W0dukCX71e8OjX6kRrXiPq0Wk6R3uN
 DHSsstCOKc2vOkIaxKqoBtiyyrtWMoVA1PyUo+WKa+VZCkqen6BW5LiLtFUwCe9duE
 /YpkPh1a+WjFg==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBxbv-0059sn-Ts;
 Thu, 14 Jul 2022 13:06:27 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 07/21] drm/i915/gt: describe the new tlb parameter at
 i915_vma_resource
Date: Thu, 14 Jul 2022 13:06:12 +0100
Message-Id: <f673f7931bcb36e704117386eefb0adffe0f8db9.1657800199.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657800199.git.mchehab@kernel.org>
References: <cover.1657800199.git.mchehab@kernel.org>
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

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/21] at: https://lore.kernel.org/all/cover.1657800199.git.mchehab@kernel.org/

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

