Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F08678258
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 17:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8175010E512;
	Mon, 23 Jan 2023 16:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CB710E50E;
 Mon, 23 Jan 2023 16:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674493017; x=1706029017;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vdG2LRYEzwMOvj9iyM2asicTeJVJUO1nFbPkAsUJrec=;
 b=XR/ckRp+zXtUpQz8h/jbnajWUXPCmT+kFGwZwzvpsbzvdUs9s0Q9SifL
 bTHXEgrV86oznCS8QNooeHSDWltJio92D2JjcmODZZrDXXjU+ZNe1DJzd
 cei9sawdKEo5rM997zX6FKBQ3QxYWniKVsEIajoEMkre2L5Sja3wXNYx9
 zs7LzXem46LNh2wQjh4V8Zy8u2CAXLPwe8h7Rx3K4fnL9fkfncAItEP3H
 Y6sYdP2PaygM9YYJXhOQg283CWfAAncLdAf/QY889mM0Ve+pGMY2fkNrv
 oVC6f/lFuyX7qJxC+mL684UzXh6NrbE0DNPjDcybw+094CR0EeX+bjn8R w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="388440574"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="388440574"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 08:56:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="730342577"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="730342577"
Received: from bridge4x-mobl.ger.corp.intel.com (HELO [10.213.214.72])
 ([10.213.214.72])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 08:56:49 -0800
Message-ID: <f24be4ca-edde-819a-5bcc-070e0d2e23d1@linux.intel.com>
Date: Mon, 23 Jan 2023 16:56:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/i915: Avoid potential vm use-after-free
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230119173321.2825472-1-robdclark@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230119173321.2825472-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Rob Clark <robdclark@chromium.org>, Matthew Brost <matthew.brost@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, katrinzhou <katrinzhou@tencent.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


+ some more people based on e1a7ab4fca0c

On 19/01/2023 17:32, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Adding the vm to the vm_xa table makes it visible to userspace, which
> could try to race with us to close the vm.  So we need to take our extra
> reference before putting it in the table.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> Note, you could list commit e1a7ab4fca0c ("drm/i915: Remove the vm open
> count") as the "fixed" commit, but really the issue seems to go back
> much further (with the fix needing some backporting in the process).

It would probably be rather essential to identify the correct Fixes: tag.

Since Thomas, Matt and Niranjana you were directly involved in the patch 
which changed significantly how this works, perhaps there is something 
still somewhat easily retrievable from your memory lanes to help with this?

Regards,

Tvrtko

> 
>   drivers/gpu/drm/i915/gem/i915_gem_context.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 6250de9b9196..e4b78ab4773b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1861,11 +1861,19 @@ static int get_ppgtt(struct drm_i915_file_private *file_priv,
>   	vm = ctx->vm;
>   	GEM_BUG_ON(!vm);
>   
> +	/*
> +	 * Get a reference for the allocated handle.  Once the handle is
> +	 * visible in the vm_xa table, userspace could try to close it
> +	 * from under our feet, so we need to hold the extra reference
> +	 * first.
> +	 */
> +	i915_vm_get(vm);
> +
>   	err = xa_alloc(&file_priv->vm_xa, &id, vm, xa_limit_32b, GFP_KERNEL);
> -	if (err)
> +	if (err) {
> +		i915_vm_put(vm);
>   		return err;
> -
> -	i915_vm_get(vm);
> +	}
>   
>   	GEM_BUG_ON(id == 0); /* reserved for invalid/unassigned ppgtt */
>   	args->value = id;
