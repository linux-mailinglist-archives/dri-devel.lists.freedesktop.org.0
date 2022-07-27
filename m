Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4C2582879
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 16:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE49318B18E;
	Wed, 27 Jul 2022 14:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3A114B854;
 Wed, 27 Jul 2022 14:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658931667; x=1690467667;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rZS/z2pPCJR+9C5Wg/O1igele6E4XF4KknGxce6vuL8=;
 b=XGAgy7k084JmXyp8aQM/Dg4fwSMIUfxDqFkT229f2PUFAxSfqjXENq9k
 02M8rn8A5LD79rqbr4HLCYU6OiUjmwT0IJ1Xe9E0RK7QmWe4lo6N7LPwc
 ILAI8ZW9pALDClVZ5rbtTJeOO7A9YyzB/arX/ZBuFB9+NpIC6JTSOTfY3
 ZiXguq8p/ETNtbvC62beRSxPjhCoad+UlW9HrJ0mg+yC9xKM5WsUHWtl7
 /kkeIfFZtymU36a3U4BodaEbEACPB7kErrr+KRIGpkqz6nAsXAaMQdsTj
 Zvecv7xjaFwWlK25Expvjg2G038kpnvzcjbiV2oTO1MdKXAFaH0j9p8OW w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="314024140"
X-IronPort-AV: E=Sophos;i="5.93,195,1654585200"; d="scan'208";a="314024140"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 07:20:49 -0700
X-IronPort-AV: E=Sophos;i="5.93,195,1654585200"; d="scan'208";a="659216188"
Received: from cene1-mobl.ger.corp.intel.com (HELO intel.com) ([10.252.44.151])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 07:20:41 -0700
Date: Wed, 27 Jul 2022 16:20:39 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v3 6/6] drm/i915/gt: describe the new tlb
 parameter at i915_vma_resource
Message-ID: <YuFJtzTmyRZLwwK7@alfio.lan>
References: <cover.1658924372.git.mchehab@kernel.org>
 <aa55eef7e63b8f3d0f69b525db2dd2eb87e9db6b.1658924372.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa55eef7e63b8f3d0f69b525db2dd2eb87e9db6b.1658924372.git.mchehab@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro,

> TLB cache invalidation can happen on two different situations:
> 
> 1. synchronously, at __vma_put_pages();
> 2. asynchronously.
> 
> On the first case, TLB cache invalidation happens inside
> __vma_put_pages(). So, no need to do it later on.
> 
> However, on the second case, the pages will keep in memory
> until __i915_vma_evict() is called.
> 
> So, we need to store the TLB data at struct i915_vma_resource,
> in order to do a TLB cache invalidation before allowing
> userspace to re-use the same memory.
> 
> So, i915_vma_resource_unbind() has gained a new parameter
> in order to store the TLB data at the second case.
> 
> Document it.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v3 0/6] at: https://lore.kernel.org/all/cover.1658924372.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/i915_vma_resource.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_vma_resource.c b/drivers/gpu/drm/i915/i915_vma_resource.c
> index 5a67995ea5fe..4fe09ea0a825 100644
> --- a/drivers/gpu/drm/i915/i915_vma_resource.c
> +++ b/drivers/gpu/drm/i915/i915_vma_resource.c
> @@ -216,6 +216,10 @@ i915_vma_resource_fence_notify(struct i915_sw_fence *fence,
>  /**
>   * i915_vma_resource_unbind - Unbind a vma resource
>   * @vma_res: The vma resource to unbind.
> + * @tlb: pointer to vma->obj->mm.tlb associated with the resource
> + *	 to be stored at vma_res->tlb. When not-NULL, it will be used
> + *	 to do TLB cache invalidation before freeing a VMA resource.
> + *	 used only for async unbind.

/used/Used/

With that:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
