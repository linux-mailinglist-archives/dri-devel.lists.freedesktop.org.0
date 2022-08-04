Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EC258A101
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 21:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561FDA462B;
	Thu,  4 Aug 2022 19:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD4910E41D;
 Thu,  4 Aug 2022 19:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=9an68t6elSEcOxsuHOeSkwUdZXoYQKoxZyn8P9hztAI=; b=HCuiLBk7YM6RDFcdi3JYetDCyB
 NDuwb/yZ2K8aMah3/uI8gMzJ60yAbY1qmiefbsrKvkQOp684ftVjAZfgJvbYPfl4w4odz1P7cUb78
 ZR+Z92l79j+5neCTzVefLEU5klvKgrmI/vpjL/4t5yWoC9T/04YDoVj9n7KYjsO9vw6Dmzz/GH1XE
 1F50Mbkp5HEs1cBSWW4ekedmFq/otFqGs4wWVoD06nhCnhs4Jv/lKPYZe2ysV4mK9OQ1QoQlNKy1D
 qs+3Was90u4oPEwk80aveBjRTM5e1UNpcUc4dlWGnmBoUPBuYQx/ozeAxit+qHLuH4OpYHtj9XO6y
 dQAaI0hQ==;
Received: from [2601:1c0:6280:3f0::a6b3]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oJg52-008PmV-0P; Thu, 04 Aug 2022 19:00:24 +0000
Message-ID: <0698c5a5-3bf2-daa4-e10e-2715f9b0d080@infradead.org>
Date: Thu, 4 Aug 2022 12:00:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 3/3] drm/i915/gt: document TLB cache invalidation
 functions
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
References: <cover.1659598090.git.mchehab@kernel.org>
 <cc68d62a1979ea859b447b94413e100472331f57.1659598090.git.mchehab@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <cc68d62a1979ea859b447b94413e100472331f57.1659598090.git.mchehab@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
 Andi Shyti <andi.shyti@linux.intel.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris.p.wilson@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro,

On 8/4/22 00:37, Mauro Carvalho Chehab wrote:
> Add a description for the TLB cache invalidation algorithm and for
> the related kAPI functions.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v3 0/3] at: https://lore.kernel.org/all/cover.1659598090.git.mchehab@kernel.org/
> 
>  Documentation/gpu/i915.rst          |  7 ++
>  drivers/gpu/drm/i915/gt/intel_tlb.c | 25 ++++++++
>  drivers/gpu/drm/i915/gt/intel_tlb.h | 99 +++++++++++++++++++++++++++++
>  3 files changed, 131 insertions(+)
> 

> diff --git a/drivers/gpu/drm/i915/gt/intel_tlb.c b/drivers/gpu/drm/i915/gt/intel_tlb.c
> index af8cae979489..16b918ffe824 100644
> --- a/drivers/gpu/drm/i915/gt/intel_tlb.c
> +++ b/drivers/gpu/drm/i915/gt/intel_tlb.c
> @@ -145,6 +145,18 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>  	intel_uncore_forcewake_put_delayed(uncore, FORCEWAKE_ALL);
>  }
>  
> +/**
> + * intel_gt_invalidate_tlb_full - do full TLB cache invalidation
> + * @gt: GT structure

In multiple places (here and below) it would be nice to know what a
GT structure is. I looked thru multiple C and header files yesterday
and didn't find any comments about it.

Just saying that @gt is a GT structure isn't very helpful, other
than making kernel-doc shut up.

> + * @seqno: sequence number
> + *
> + * Do a full TLB cache invalidation if the @seqno is bigger than the last
> + * full TLB cache invalidation.
> + *
> + * Note:
> + * The TLB cache invalidation logic depends on GEN-specific registers.
> + * It currently supports MMIO-based TLB flush for GEN8 to GEN12.
> + */
>  void intel_gt_invalidate_tlb_full(struct intel_gt *gt, u32 seqno)
>  {
>  	intel_wakeref_t wakeref;
> @@ -171,12 +183,25 @@ void intel_gt_invalidate_tlb_full(struct intel_gt *gt, u32 seqno)
>  	}
>  }
>  
> +/**
> + * intel_gt_init_tlb - initialize TLB-specific vars
> + * @gt: GT structure
> + *
> + * TLB cache invalidation logic internally uses some resources that require
> + * initialization. Should be called before doing any TLB cache invalidation.
> + */
>  void intel_gt_init_tlb(struct intel_gt *gt)
>  {
>  	mutex_init(&gt->tlb.invalidate_lock);
>  	seqcount_mutex_init(&gt->tlb.seqno, &gt->tlb.invalidate_lock);
>  }
>  
> +/**
> + * intel_gt_fini_tlb - free TLB-specific vars
> + * @gt: GT structure
> + *
> + * Frees any resources needed by TLB cache invalidation logic.
> + */
>  void intel_gt_fini_tlb(struct intel_gt *gt)
>  {
>  	mutex_destroy(&gt->tlb.invalidate_lock);
> diff --git a/drivers/gpu/drm/i915/gt/intel_tlb.h b/drivers/gpu/drm/i915/gt/intel_tlb.h
> index 46ce25bf5afe..2838c051f872 100644
> --- a/drivers/gpu/drm/i915/gt/intel_tlb.h
> +++ b/drivers/gpu/drm/i915/gt/intel_tlb.h
> @@ -11,16 +11,115 @@
>  
>  #include "intel_gt_types.h"
>  
> +/**
> + * DOC: TLB cache invalidation logic
> + *
...
> +
>  void intel_gt_invalidate_tlb_full(struct intel_gt *gt, u32 seqno);
>  
>  void intel_gt_init_tlb(struct intel_gt *gt);
>  void intel_gt_fini_tlb(struct intel_gt *gt);
>  
> +/**
> + * intel_gt_tlb_seqno - Returns the current TLB invlidation sequence number
> + * @gt: GT structure
> + *
> + * There's no need to lock while calling it, as seqprop_sequence is thread-safe
> + */
>  static inline u32 intel_gt_tlb_seqno(const struct intel_gt *gt)
>  {
>  	return seqprop_sequence(&gt->tlb.seqno);
>  }
>  
> +/**
> + * intel_gt_next_invalidate_tlb_full - Returns the next TLB full invalidation
> + *	sequence number
> + * @gt: GT structure
> + *
> + * There's no need to lock while calling it, as seqprop_sequence is thread-safe
> + */
>  static inline u32 intel_gt_next_invalidate_tlb_full(const struct intel_gt *gt)
>  {
>  	return intel_gt_tlb_seqno(gt) | 1;

thanks.

-- 
~Randy
