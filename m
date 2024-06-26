Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C305B9199A1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 23:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6598010E15D;
	Wed, 26 Jun 2024 21:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HAI84UjX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0182410E0D8;
 Wed, 26 Jun 2024 21:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719436077; x=1750972077;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MgGgyoc9fSlanUqnGcBHYUH+0n05v0kdiRXtRKd1cCM=;
 b=HAI84UjXUj5llAofaTMpls0PepP11WHQNkSdd+IwyAsE1kYKfS2jyyks
 OtDV1iJ2LPYPI8GIo2ZK1iu4AKBtULxuFcZrFWLW7yt8Q5jlw6MbKpJIw
 rnR0KLBvzB0AF12enaOPjjWGQ/XOkv1B7GZ6OsPW4ceD7+JI0P9Va01tG
 IEiJz83p38kpHtSmyGYko91KxaNr/+hQRYN/gmseW6lHXVGnpNcmaExuO
 pMnavVr8glpD5/wPBwWyi/844pHRCILYw0vPPLDzgZOeT1t3lYslTBFUR
 IlM+M2iolmbLf5uPNgNvCGUnVQGFKG35yzfSUXvtGnTUIzbP26eRPV4SF g==;
X-CSE-ConnectionGUID: fQCSDM6NQVKHXJzfRCcFGg==
X-CSE-MsgGUID: MjXAJeXzTVGigcPg5vGXhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="39041538"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="39041538"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 14:07:57 -0700
X-CSE-ConnectionGUID: s0ISMdCJSQmbOCi3gw/qQw==
X-CSE-MsgGUID: l5GDNEh3SLKPB3X785/USA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="74897778"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.48.229])
 ([10.246.48.229])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 14:07:56 -0700
Message-ID: <f599a462-c548-4ca1-a1e7-f4b03236fb8f@linux.intel.com>
Date: Wed, 26 Jun 2024 23:07:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gem: Suppress oom warning in favour of ENOMEM to
 userspace
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <20240626143318.11600-1-nirmoy.das@intel.com>
 <ZnwylM64-5HqQr4R@intel.com> <5871ef5e-50f2-4623-b3c2-8275d65aab17@intel.com>
 <Znw4wjbyUZ20y0mf@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <Znw4wjbyUZ20y0mf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Rodrigo,

On 6/26/2024 5:50 PM, Rodrigo Vivi wrote:
> On Wed, Jun 26, 2024 at 05:36:43PM +0200, Nirmoy Das wrote:
>>     Hi Rodrigo,
>>                                                                                  
>>     On 6/26/2024 5:24 PM, Rodrigo Vivi wrote:
>>                                                                                  
>>     On Wed, Jun 26, 2024 at 04:33:18PM +0200, Nirmoy Das wrote:
>>                                                                                  
>>     >We report object allocation failures to userspace with ENOMEM
>>     >so add __GFP_NOWARN to remove superfluous oom warnings.
>>                                                                                  
>>     >Closes: [1]https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4936
>>     >Cc: Andi Shyti [2]<andi.shyti@linux.intel.com>
>>     >Signed-off-by: Nirmoy Das [3]<nirmoy.das@intel.com>
>>     >---
>>     > drivers/gpu/drm/i915/i915_scatterlist.c | 8 ++++----
>>     > 1 file changed, 4 insertions(+), 4 deletions(-)
>>                                                                                  
>>     >diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
>>     >index e93d2538f298..4d830740946d 100644
>>     >--- a/drivers/gpu/drm/i915/i915_scatterlist.c
>>     >+++ b/drivers/gpu/drm/i915/i915_scatterlist.c
>>     >@@ -90,7 +90,7 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
>>     >
>>     >        GEM_BUG_ON(!max_segment);
>>     >
>>     >-       rsgt = kmalloc(sizeof(*rsgt), GFP_KERNEL);
>>     >+       rsgt = kmalloc(sizeof(*rsgt), GFP_KERNEL | __GFP_NOWARN);
>>     >        if (!rsgt)
>>     >                return ERR_PTR(-ENOMEM);
>>                                                                                  
>>     is it really safe?
>>     I don't believe we can guarantee a good fallback plan here if allocation fails.
>>     __i915_refct_sgt_init
>>     might end up in a null dereference, no?!
>>                                                                                  
>>     Kernel is now returning  ENOMEM and also throwing a oom warning stack.
>>     With __GFP_NOWARN
>>                                                                                  
>>     the oom warning stack won't be there in the dmesg but userspace will still
>>     get ENOMEM as expected.
> doh! I had missunderstand the flag. Thanks for the confirmation.
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
> BTW, what email clients are you using recently?

Using the same client, Thunderbird.


> it is hard to parse your responses lately. Please check if it is really
> sending/replying as text-only mode.

Thanks for notifying me. May be recent update changed some settings. I 
will check.


Nirmoy

>
>>                                                                                  
>>     Let me know if got your question correctly.
>>                                                                                  
>>     Regards,
>>                                                                                  
>>     Nirmoy
>>                                                                                  
>>                                                                                  
>>                                                                                  
>>     >
>>     >@@ -104,7 +104,7 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
>>     >        }
>>     >
>>     >        if (sg_alloc_table(st, DIV_ROUND_UP_ULL(node->size, segment_pages),
>>     >-                          GFP_KERNEL)) {
>>     >+                          GFP_KERNEL | __GFP_NOWARN)) {
>>     >                i915_refct_sgt_put(rsgt);
>>     >                return ERR_PTR(-ENOMEM);
>>     >        }
>>     >@@ -178,7 +178,7 @@ struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
>>     >        GEM_BUG_ON(list_empty(blocks));
>>     >        GEM_BUG_ON(!max_segment);
>>     >
>>     >-       rsgt = kmalloc(sizeof(*rsgt), GFP_KERNEL);
>>     >+       rsgt = kmalloc(sizeof(*rsgt), GFP_KERNEL | __GFP_NOWARN);
>>     >        if (!rsgt)
>>     >                return ERR_PTR(-ENOMEM);
>>     >
>>     >@@ -190,7 +190,7 @@ struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
>>     >                return ERR_PTR(-E2BIG);
>>     >        }
>>     >
>>     >-       if (sg_alloc_table(st, PFN_UP(res->size), GFP_KERNEL)) {
>>     >+       if (sg_alloc_table(st, PFN_UP(res->size), GFP_KERNEL | __GFP_NOWARN)) {
>>     >                i915_refct_sgt_put(rsgt);
>>     >                return ERR_PTR(-ENOMEM);
>>     >        }
>>     >--
>>     >2.42.0
>>
>> References
>>
>>     Visible links
>>     1. https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4936
>>     2. mailto:andi.shyti@linux.intel.com
>>     3. mailto:nirmoy.das@intel.com
