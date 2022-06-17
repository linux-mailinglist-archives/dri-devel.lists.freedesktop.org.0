Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 853785500C7
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 01:30:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F3510F6D2;
	Fri, 17 Jun 2022 23:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4654410F5D0;
 Fri, 17 Jun 2022 23:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655508624; x=1687044624;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ep7q7Ufn4sniQNQKMzFTwx/tDhkrSQ+04210RVQDnEI=;
 b=gmGzqPU3p3sbXJuKZHKdHMmabUF8B2ohVogybp4aBrWfQYXoXB+4GRoz
 lb3zLn6VSRbqAJJ8ikoIJ2uTSzTC78UN3ingHKGXOui5PH9SFd3Ocsab3
 aCwnX1BnGS9ovW1ca8Var/BpERGMfg/9TPuJqeeponVg0a9vFTSq4vhgQ
 ZRWWm8JitLNN93e8W8a7G4XpOvb4McJcGGx+1ScYZk3O16G2anYGYDVRQ
 g3hXHvmdIZev6rcqo9Zwiqj8hvRjvyiwMcyWMBqonF3Jj90HloX1QkyDI
 M4q5f9lwU9BAdNIoFwvTE0Fm8AaCDNLTRCBcvU3qW7yn8xhlBYJESsI1l Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="279640376"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="279640376"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 16:30:23 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="832231558"
Received: from bsantana-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.55.135])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 16:30:23 -0700
Date: Fri, 17 Jun 2022 16:30:23 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michael Cheng <michael.cheng@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 1/1] i915/gem: drop wbinvd_on_all_cpus usage
Message-ID: <20220617233023.6y4itjzycqjcoqfa@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220414181923.25631-1-michael.cheng@intel.com>
 <20220414181923.25631-2-michael.cheng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220414181923.25631-2-michael.cheng@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, intel-gfx@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 14, 2022 at 11:19:23AM -0700, Michael Cheng wrote:
>Previous concern with using drm_clflush_sg was that we don't know what the
>sg_table is pointing to, thus the usage of wbinvd_on_all_cpus to flush
>everything at once to avoid paranoia.

humn... and now we know it is backed by struct pages? I'm not sure I
follow what we didn't know before and now we do.

Thomas / Matthew, could you take another look herer if it seems correct
to you.


thanks
Lucas De Marchi


>To make i915 more architecture-neutral and be less paranoid, lets attempt to
>use drm_clflush_sg to flush the pages for when the GPU wants to read
>from main memory.
>
>Signed-off-by: Michael Cheng <michael.cheng@intel.com>
>---
> drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 9 ++-------
> 1 file changed, 2 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>index f5062d0c6333..b0a5baaebc43 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>@@ -8,6 +8,7 @@
> #include <linux/highmem.h>
> #include <linux/dma-resv.h>
> #include <linux/module.h>
>+#include <drm/drm_cache.h>
>
> #include <asm/smp.h>
>
>@@ -250,16 +251,10 @@ static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
> 	 * DG1 is special here since it still snoops transactions even with
> 	 * CACHE_NONE. This is not the case with other HAS_SNOOP platforms. We
> 	 * might need to revisit this as we add new discrete platforms.
>-	 *
>-	 * XXX: Consider doing a vmap flush or something, where possible.
>-	 * Currently we just do a heavy handed wbinvd_on_all_cpus() here since
>-	 * the underlying sg_table might not even point to struct pages, so we
>-	 * can't just call drm_clflush_sg or similar, like we do elsewhere in
>-	 * the driver.
> 	 */
> 	if (i915_gem_object_can_bypass_llc(obj) ||
> 	    (!HAS_LLC(i915) && !IS_DG1(i915)))
>-		wbinvd_on_all_cpus();
>+		drm_clflush_sg(pages);
>
> 	sg_page_sizes = i915_sg_dma_sizes(pages->sgl);
> 	__i915_gem_object_set_pages(obj, pages, sg_page_sizes);
>-- 
>2.25.1
>
