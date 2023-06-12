Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B436172C616
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 15:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A257510E242;
	Mon, 12 Jun 2023 13:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6FE710E04D;
 Mon, 12 Jun 2023 13:35:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E30E1616FD;
 Mon, 12 Jun 2023 13:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F1AC433D2;
 Mon, 12 Jun 2023 13:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686576946;
 bh=qAGctGPmTEGb8Q322023xH/8ic4A2qSPM1FKoiXCBSk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QvDxDyruXr+m7Nhq2DHbE0eMq5Bv0/Vs2UIxhO1PWnbg0RpNbROQQ5QB/y1lEB1nt
 ZL1O4J8dEmi33KST4wq8FgbUVFfzUMR6n3Z3R1GTC4IyWFW00ncK7P51eA08JXQPze
 Zp4+Te3auFeleRBfNrA0AX+fzfh1CHJ3EsEq6/Wt0UQfsyFPxI3bpRPyCW8dShDV4v
 AOWIm/TJhAPQ4S9N56JhjTxGWe71+OEYKlxPdyW2zPQCcAcgtjnx6CZUQqOXsD/dJb
 IoMN2TehnUo8DvHbJvllWjDXLgB252JvWBVLkyeBVog4bKehA2aflV1oxP5+W+PYH1
 tk1qIdNsos5hA==
Date: Mon, 12 Jun 2023 15:35:42 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] drm/i915/gmch: avoid unused variable warning
Message-ID: <20230612133542.knm4edwlk2nhfboj@intel.intel>
References: <20230612124408.521325-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612124408.521325-1-arnd@kernel.org>
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
 Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

On Mon, Jun 12, 2023 at 02:43:59PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When CONFIG_PNP is disabled, the mchbar_addr variable is only written but
> not read:
> 
> drivers/gpu/drm/i915/soc/intel_gmch.c: In function 'intel_alloc_mchbar_resource':
> drivers/gpu/drm/i915/soc/intel_gmch.c:41:13: error: variable 'mchbar_addr' set but not used [-Werror=unused-but-set-variable]
>    41 |         u64 mchbar_addr;
>       |             ^~~~~~~~~~~
> 
> No idea why this showed up now, but it's easy to fix by changing the #ifdef to
> an IS_ENABLED() check that the compiler can see through.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi

> ---
> I saw this last week already, so it's likely that someone else already sent
> a fix for it.
> 
>  drivers/gpu/drm/i915/soc/intel_gmch.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/soc/intel_gmch.c b/drivers/gpu/drm/i915/soc/intel_gmch.c
> index 6d0204942f7a5..49c7fb16e934f 100644
> --- a/drivers/gpu/drm/i915/soc/intel_gmch.c
> +++ b/drivers/gpu/drm/i915/soc/intel_gmch.c
> @@ -47,11 +47,9 @@ intel_alloc_mchbar_resource(struct drm_i915_private *i915)
>  	mchbar_addr = ((u64)temp_hi << 32) | temp_lo;
>  
>  	/* If ACPI doesn't have it, assume we need to allocate it ourselves */
> -#ifdef CONFIG_PNP
> -	if (mchbar_addr &&
> +	if (IS_ENABLED(CONFIG_PNP) && mchbar_addr &&
>  	    pnp_range_reserved(mchbar_addr, mchbar_addr + MCHBAR_SIZE))
>  		return 0;
> -#endif
>  
>  	/* Get some space for it */
>  	i915->gmch.mch_res.name = "i915 MCHBAR";
> -- 
> 2.39.2
> 
