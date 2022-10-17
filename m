Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5E4602475
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 08:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11B710EE82;
	Tue, 18 Oct 2022 06:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1672A10E06D;
 Mon, 17 Oct 2022 09:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666000085; x=1697536085;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8avkb8niqXxOei1jYk0QQPKLA+dnwojk9iKaLNjUT+Y=;
 b=h1vRH+7/reUlTwZHFv3RUQE4vXndm4ioh8yQKfsRvcSp4OgTVmcjxrB4
 uR+trrzO5zmMLw0gi2mJIEWrAyn+luI2Fvs23CI++cfEJEdKrXXpZ+I+j
 EIsnvEbeVUHPo0D/U4BkDcmbiVyEWU8R5SyPMNLx9gSJm1yV7qAjN49Mn
 wDEaDxfF6tIDLQFtS+6E35uZqyKkMoLr8phi5fPVCiPiLsLM9eCcqYZke
 UYzwBt0QD7ck0mLaSQu/k2Iv3yMjiKoTcReYvAZLFCOXqAKPq5K42LbR/
 vm0QTKgpM8yvnkR/zih1bFbtyRBqnawk6fMCKNjeGy46hlkb/xjPwtCJL w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="369945577"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="369945577"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 02:48:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="753576169"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="753576169"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.132])
 by orsmga004.jf.intel.com with ESMTP; 17 Oct 2022 02:47:59 -0700
Date: Mon, 17 Oct 2022 17:53:34 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] x86/hyperv: Replace kmap() with kmap_local_page()
Message-ID: <Y00mHsbkoxRDtpJB@liuzhao-OptiPlex-7080>
References: <20221017093726.2070674-1-zhao1.liu@linux.intel.com>
 <20221017093726.2070674-11-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221017093726.2070674-11-zhao1.liu@linux.intel.com>
X-Mailman-Approved-At: Tue, 18 Oct 2022 06:35:11 +0000
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
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>, Zhao Liu <zhao1.liu@intel.com>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry, please ignore the last hyperv patch, I made a mistake.

Zhao

On Mon, Oct 17, 2022 at 05:37:26PM +0800, Zhao Liu wrote:
> Date: Mon, 17 Oct 2022 17:37:26 +0800
> From: Zhao Liu <zhao1.liu@linux.intel.com>
> Subject: [PATCH v3] x86/hyperv: Replace kmap() with kmap_local_page()
> X-Mailer: git-send-email 2.34.1
> 
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> kmap() is being deprecated in favor of kmap_local_page()[1].
> 
> There are two main problems with kmap(): (1) It comes with an overhead as mapping space is restricted and protected by a global lock for synchronization and (2) it also requires global TLB invalidation when the kmap's pool wraps and it might block when the mapping space is fully utilized until a slot becomes available.
> 
> With kmap_local_page() the mappings are per thread, CPU local, can take page faults, and can be called from any context (including interrupts).
> It is faster than kmap() in kernels with HIGHMEM enabled. Furthermore, the tasks can be preempted and, when they are scheduled to run again, the kernel virtual addresses are restored and are still valid.
> 
> Since its use in hyperv/hv_init.c is safe, it should be preferred.
> 
> Therefore, replace kmap() with kmap_local_page() in hyperv/hv_init.c.
> 
> [1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com
> 
> Suggested-by: Ira Weiny <ira.weiny@intel.com>
> Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> 
> ---
> Suggested by credits.
>         Ira: Referred to his task documentation and review comments.
>         Fabio: Stole some of his boiler plate commit message.
> 
> ---
> Changelog:
> v2:
> - Fix wrong incoming parameters in kunmap_local();
> - Add Fabio as suggester since I quoted his commit message.
> 
> ---
>  arch/x86/hyperv/hv_init.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
> index 3de6d8b53367..72fe46eb183f 100644
> --- a/arch/x86/hyperv/hv_init.c
> +++ b/arch/x86/hyperv/hv_init.c
> @@ -459,13 +459,13 @@ void __init hyperv_init(void)
>                 wrmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
> 
>                 pg = vmalloc_to_page(hv_hypercall_pg);
> -               dst = kmap(pg);
> +               dst = kmap_local_page(pg);
>                 src = memremap(hypercall_msr.guest_physical_address << PAGE_SHIFT, PAGE_SIZE,
>                                 MEMREMAP_WB);
>                 BUG_ON(!(src && dst));
>                 memcpy(dst, src, HV_HYP_PAGE_SIZE);
>                 memunmap(src);
> -               kunmap(pg);
> +               kunmap_local(dst);
>         } else {
>                 hypercall_msr.guest_physical_address = vmalloc_to_pfn(hv_hypercall_pg);
>                 wrmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
> --
> 2.34.1
> 
