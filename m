Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACF37A6356
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 14:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B74E10E3BA;
	Tue, 19 Sep 2023 12:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E9310E3B5;
 Tue, 19 Sep 2023 12:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695127361; x=1726663361;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vBKQwdegdCh2J7T7Rwh8O/CTG5o6wANbnNbVpQVFRWk=;
 b=MxKzW0S62ks1KNFNV5cueopIq/2sjw44yyrEyIKex9ZWSxCUe9UcAuXD
 IadZEjIEl17RyK4uxo1cXKW15OuJI2nTD6K3+8OXK9YbJmek/rt98ocfs
 GCEa60jaZAQL+7gsw+QG14AG/7DsO8aL/UvUy9pqLvDI2i1NO0Oa//Tn0
 EsSxba2sodnNCwXTg22uhxsCAJXo29NrfOikCtDxD77z6Wwnoe8mZGE7z
 dDh/sJUBd3mvFptL7Gu+pzHSRBrSogcQjG3e60SS6qRV3pVJWGhSywsQ6
 rezcjYusIHdRKmvSvijSjBUvRFqrKuUNyS9vzTpindNkQSP78TaME/ROu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="410858823"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="410858823"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 05:42:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="722859934"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="722859934"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.8.52])
 ([10.213.8.52])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 05:42:36 -0700
Message-ID: <db23e7bf-eb94-8f74-ca45-340b9a9db278@intel.com>
Date: Tue, 19 Sep 2023 14:42:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/i915: Fix aux invalidation with proper pipe_control
 flag
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230919114716.19378-1-nirmoy.das@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230919114716.19378-1-nirmoy.das@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19.09.2023 13:47, Nirmoy Das wrote:
> The suggestion from the spec is to do l3 fabric flush not L3 flush.
>
> Fixes: 78a6ccd65fa3 ("drm/i915/gt: Ensure memory quiesced before
> invalidation")
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 6 +++++-
>   drivers/gpu/drm/i915/gt/intel_gpu_commands.h | 1 +
>   2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 0143445dba83..a4b241d502c8 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -272,7 +272,11 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   			bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
>   
>   		bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
> -		bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
> +		if (mode & EMIT_FLUSH)
> +			bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
> +		else if (gen12_needs_ccs_aux_inv(engine))
> +			bit_group_1 |= PIPE_CONTROL_L3_FABRIC_FLUSH;
> +
>   		bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
>   		bit_group_1 |= PIPE_CONTROL_DEPTH_CACHE_FLUSH;
>   		/* Wa_1409600907:tgl,adl-p */
> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> index 2bd8d98d2110..12e8dc481c53 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> @@ -284,6 +284,7 @@
>   #define   DISPLAY_PLANE_A           (0<<20)
>   #define   DISPLAY_PLANE_B           (1<<20)
>   #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
> +#define   PIPE_CONTROL_L3_FABRIC_FLUSH			(1<<30)
>   #define   PIPE_CONTROL_COMMAND_CACHE_INVALIDATE		(1<<29) /* gen11+ */
>   #define   PIPE_CONTROL_TILE_CACHE_FLUSH			(1<<28) /* gen11+ */
>   #define   PIPE_CONTROL_FLUSH_L3				(1<<27)

