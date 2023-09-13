Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1920F79E2D9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 11:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781D210E18A;
	Wed, 13 Sep 2023 09:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE98310E098;
 Wed, 13 Sep 2023 09:01:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 6AC8FCE20B8;
 Wed, 13 Sep 2023 09:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711E6C433C8;
 Wed, 13 Sep 2023 09:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694595698;
 bh=Feb4J9LX4ImkTbr7yjcTSpSpgAU86GJulnnkLr0gYrw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BkuW1dDbZkdBCmIICjA3dSTunrbBByXY/vrx4Vz13Fmom6MsGlUKezfJxA8r2b1ig
 k9IGGYVYlrcTO3PnipRC60R7oyBxkV91CZ628WHxyB5pxEBvjJbSbppFOKiDbV4M8x
 ZdK2fcI6QrHA7fI5V5dcoZrLXW+p/GTjn8OD+SHn3tnevmqLe/ScFL41e8bqk2EG/E
 T7dN6enkt5awz+v9kR+z6y9JbILGKfmdqnqVy2BUnlwKaMi7V1BffdGFkOKhFFUtgV
 CekUnziijoqLwhcBEi5/AqS3siDsfCgPe3k/NoV6Zn1A/HMl40SwdmLTYJHkGI8R2r
 N8H2mJrx7fADQ==
Date: Wed, 13 Sep 2023 11:01:35 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] drm/i915/gt: Prevent error pointer dereference
Message-ID: <20230913090135.yikme2rv2kjmcqag@zenone.zhora.eu>
References: <455b2279-2e08-4d00-9784-be56d8ee42e3@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <455b2279-2e08-4d00-9784-be56d8ee42e3@moroto.mountain>
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
 kernel-janitors@vger.kernel.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Zhanjun Dong <zhanjun.dong@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Fei Yang <fei.yang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,

On Wed, Sep 13, 2023 at 11:17:41AM +0300, Dan Carpenter wrote:
> Move the check for "if (IS_ERR(obj))" in front of the call to
> i915_gem_object_set_cache_coherency() which dereferences "obj".
> Otherwise it will lead to a crash.
> 
> Fixes: 43aa755eae2c ("drm/i915/mtl: Update cache coherency setting for context structure")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/i915/gt/intel_lrc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 957d0aeb0c02..c378cc7c953c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -1094,6 +1094,9 @@ __lrc_alloc_state(struct intel_context *ce, struct intel_engine_cs *engine)
>  					  I915_BO_ALLOC_PM_VOLATILE);
>  	if (IS_ERR(obj)) {
>  		obj = i915_gem_object_create_shmem(engine->i915, context_size);
> +		if (IS_ERR(obj))
> +			return ERR_CAST(obj);
> +

that's correct! When the workaround was added later it wasn't
checking whether obj had a valid value or not, leading to a
potential segfault.

Thanks for fixing it!

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi

>  		/*
>  		 * Wa_22016122933: For Media version 13.0, all Media GT shared
>  		 * memory needs to be mapped as WC on CPU side and UC (PAT
> @@ -1102,8 +1105,6 @@ __lrc_alloc_state(struct intel_context *ce, struct intel_engine_cs *engine)
>  		if (intel_gt_needs_wa_22016122933(engine->gt))
>  			i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
>  	}
> -	if (IS_ERR(obj))
> -		return ERR_CAST(obj);
>  
>  	vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL);
>  	if (IS_ERR(vma)) {
