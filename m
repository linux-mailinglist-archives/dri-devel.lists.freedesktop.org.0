Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5307762447C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 15:40:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E26510E816;
	Thu, 10 Nov 2022 14:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A5910E810;
 Thu, 10 Nov 2022 14:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668091201; x=1699627201;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=SApq8lKkJUeO70t01f4rFEURkrXdvDqycfEbjvn0v0s=;
 b=kmtrx0gmWFI47T6APYuseotsybUEEgYOZ00Ofh1A2S+9I91CZdqA4Lmk
 lc8AQ5PU/nHOFmaRu/mlvGzqtBIjr7CpTM28xe2PhsaKULrp3q//tOutq
 g6NBOLEfpeavIJ9rh2pec9y/T9IQ5foPB/+Qnis5LUzrRk7t4MEYcv1HG
 av9UehL2y+EDwnn27oZmoP+7v0Pfs9uSlqCyXJ/Hjm5vh6pUrQGRl1afX
 nRctanWGjqiQgcRvNM+W83VmQmo5dvJPYRSXYWogRc16y6B3QYLR/GHiV
 Y4dEZEBDyu8vBYsUSCj96Q6qY7tuTp0S6z9ZIWuSxNrGSjJLOZSpxhCSL g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="308945074"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; d="scan'208";a="308945074"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 06:40:00 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="762300252"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; d="scan'208";a="762300252"
Received: from mkuoppal-desk.fi.intel.com (HELO localhost) ([10.237.72.193])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 06:39:58 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Simplify internal helper function
 signature
In-Reply-To: <20221110124633.3135026-1-tvrtko.ursulin@linux.intel.com>
References: <20221110124633.3135026-1-tvrtko.ursulin@linux.intel.com>
Date: Thu, 10 Nov 2022 16:39:26 +0200
Message-ID: <87pmduho0x.fsf@mkuoppal-desk>
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
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> writes:

> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Since we are now storing the GT backpointer in the wa list we can drop the
> explicit struct intel_gt * argument to wa_list_apply.

There is room for more dropping, all the platform lists inits.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 07bf115029a0..4db04761d5ea 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -1717,9 +1717,9 @@ wa_verify(struct intel_gt *gt, const struct i915_wa *wa, u32 cur,
>  	return true;
>  }
>  
> -static void
> -wa_list_apply(struct intel_gt *gt, const struct i915_wa_list *wal)
> +static void wa_list_apply(const struct i915_wa_list *wal)
>  {
> +	struct intel_gt *gt = wal->gt;
>  	struct intel_uncore *uncore = gt->uncore;
>  	enum forcewake_domains fw;
>  	unsigned long flags;
> @@ -1755,7 +1755,7 @@ wa_list_apply(struct intel_gt *gt, const struct i915_wa_list *wal)
>  				intel_gt_mcr_read_any_fw(gt, wa->mcr_reg) :
>  				intel_uncore_read_fw(uncore, wa->reg);
>  
> -			wa_verify(wal->gt, wa, val, wal->name, "application");
> +			wa_verify(gt, wa, val, wal->name, "application");
>  		}
>  	}
>  
> @@ -1765,7 +1765,7 @@ wa_list_apply(struct intel_gt *gt, const struct i915_wa_list *wal)
>  
>  void intel_gt_apply_workarounds(struct intel_gt *gt)
>  {
> -	wa_list_apply(gt, &gt->wa_list);
> +	wa_list_apply(&gt->wa_list);
>  }
>  
>  static bool wa_list_verify(struct intel_gt *gt,
> @@ -3025,7 +3025,7 @@ void intel_engine_init_workarounds(struct intel_engine_cs *engine)
>  
>  void intel_engine_apply_workarounds(struct intel_engine_cs *engine)
>  {
> -	wa_list_apply(engine->gt, &engine->wa_list);
> +	wa_list_apply(&engine->wa_list);
>  }
>  
>  static const struct i915_range mcr_ranges_gen8[] = {
> -- 
> 2.34.1
