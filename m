Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 777F57CC190
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 13:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9A710E2CC;
	Tue, 17 Oct 2023 11:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A02E10E2C6;
 Tue, 17 Oct 2023 11:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697541032; x=1729077032;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=VRVdXPFBAwSK80Qq9b66hn7tji1u/h9yEJsiJokyjkc=;
 b=BQyW1UpU6yzT4sizAUnTzz34aFN+sXdDQPWHWwMPrwBF16l+knMVDY+T
 BVdB6Ru5E9VNXvie10pLuV+7uk7gB3TIMIOQlms1FqP5PWSUM1T5XaLPp
 JZ+m8BOagmKQ4xlqujZFmX8JuRtdyPmjWARm8JU9Gq2owEGCwwopGewLT
 +vWh6HGnYQmsh3X4O86HZxh7wDbU1yT13elI5GbblxzEW8GAHe3KqaKnv
 +lj4xRXdphFF7/bio8QIVpJC0eQlRkoGKIml0y66AcG4jiTcZN+KjRACU
 sEg9ZwYQzQXurX9Z7hTuuClXfUl2TqduSaIacowsAWPzinsfyC4JTAsIC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="389626076"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="389626076"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 04:10:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="846786788"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="846786788"
Received: from mkuoppal-desk.fi.intel.com (HELO localhost) ([10.237.72.193])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 04:10:29 -0700
From: Mika Kuoppala <mika.kuoppala@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Don't set PIPE_CONTROL_FLUSH_L3
In-Reply-To: <20231016225530.2152896-1-vinay.belgaumkar@intel.com>
References: <20231016225530.2152896-1-vinay.belgaumkar@intel.com>
Date: Tue, 17 Oct 2023 14:07:35 +0300
Message-ID: <87v8b58q2w.fsf@mkuoppal-desk>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Vinay Belgaumkar <vinay.belgaumkar@intel.com> writes:

> This bit does not cause an explicit L3 flush. We already use
> PIPE_CONTROL_DC_FLUSH_ENABLE for that purpose.
>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Mikka Kuoppala <mika.kuoppala@intel.com>
s/kk/k

> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index ba4c2422b340..abbc02f3e66e 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -247,6 +247,7 @@ static int mtl_dummy_pipe_control(struct i915_request *rq)
>  int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>  {
>  	struct intel_engine_cs *engine = rq->engine;
> +	struct intel_gt *gt = rq->engine->gt;
>  
>  	/*
>  	 * On Aux CCS platforms the invalidation of the Aux
> @@ -278,7 +279,8 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>  		 * deals with Protected Memory which is not needed for
>  		 * AUX CCS invalidation and lead to unwanted side effects.
>  		 */
> -		if (mode & EMIT_FLUSH)
> +		if ((mode & EMIT_FLUSH) &&
> +		    !(IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))))
>  			bit_group_1 |= PIPE_CONTROL_FLUSH_L3;

Yes its best to apply for MTL first.

Acked-by: Mika Kuoppala <mika.kuoppala@linux.intel.com<

>  
>  		bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
> @@ -812,12 +814,14 @@ u32 *gen12_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs)
>  	u32 flags = (PIPE_CONTROL_CS_STALL |
>  		     PIPE_CONTROL_TLB_INVALIDATE |
>  		     PIPE_CONTROL_TILE_CACHE_FLUSH |
> -		     PIPE_CONTROL_FLUSH_L3 |
>  		     PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
>  		     PIPE_CONTROL_DEPTH_CACHE_FLUSH |
>  		     PIPE_CONTROL_DC_FLUSH_ENABLE |
>  		     PIPE_CONTROL_FLUSH_ENABLE);
>  
> +	if (!(IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))))
> +		flags |= PIPE_CONTROL_FLUSH_L3;
> +
>  	/* Wa_14016712196 */
>  	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)) || IS_DG2(i915))
>  		/* dummy PIPE_CONTROL + depth flush */
> -- 
> 2.38.1
