Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 857AB5B98F7
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 12:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F75510E190;
	Thu, 15 Sep 2022 10:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C0D10E190;
 Thu, 15 Sep 2022 10:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663238451; x=1694774451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=82BwvvuVXrg/Tr3uehT2VsUUfwrMnWvCMTClECJpWn8=;
 b=FmLHVqn1GXM8Jco/QlPnPDjP+94lCpVgr0nYQwNVE+21EbKNKJg147rl
 fbNsF9UnEm/JOUThYnMVhGDdbR5qvEcZNE49YGOlIMICqv+rE6axQSGcd
 KQ7vzT7fICN0FfXB05gHcqISoNc8WiyOlhCgRxdkF+bXLHh2s2S2Yi/L2
 nz8I8cUDlisqmkWbfAviGh5wQe0dSpP2SYxJ5RvBRfXBcddw/IaGyg98G
 tzjluwJQvA4nAoM91DSjL1jMwbBbI3xEBG6HFtNmz8N2hXfOUnZ2d4nBX
 NTbMIJSD3oINJCQS3aUo6+eQbRvDAUNXY67hUTVfgkSy0+5r1sxiFwn2I Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="285718241"
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; d="scan'208";a="285718241"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 03:40:50 -0700
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; d="scan'208";a="568381199"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.25.71])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 03:40:48 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/4] drm/i915/gt: Cleanup partial engine discovery failures
Date: Thu, 15 Sep 2022 12:40:45 +0200
Message-ID: <2218767.ZfL8zNpBrT@jkrzyszt-mobl1.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220914220427.3091448-2-matthew.d.roper@intel.com>
References: <20220914220427.3091448-1-matthew.d.roper@intel.com>
 <20220914220427.3091448-2-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Chris Wilson <chris.p.wilson@intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matt,

On Thursday, 15 September 2022 00:04:24 CEST Matt Roper wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> If we abort driver initialisation in the middle of gt/engine discovery,
> some engines will be fully setup and some not. Those incompletely setup
> engines only have 'engine->release == NULL' and so will leak any of the
> common objects allocated.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 1f7188129cd1..bff12b4ec314 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -1196,6 +1196,12 @@ void intel_engine_destroy_pinned_context(struct intel_context *ce)
>  	intel_context_put(ce);
>  }
>  
> +static void destroy_pinned_context(struct intel_context *ce)
> +{
> +	if (ce)
> +		intel_engine_destroy_pinned_context(ce);
> +}
> +
>  static struct intel_context *
>  create_kernel_context(struct intel_engine_cs *engine)
>  {
> @@ -1274,8 +1280,13 @@ int intel_engines_init(struct intel_gt *gt)
>  			return err;
>  
>  		err = setup(engine);
> -		if (err)
> +		if (err) {
> +			intel_engine_cleanup_common(engine);
>  			return err;
> +		}
> +
> +		/* The backend should now be responsible for cleanup */
> +		GEM_BUG_ON(engine->release == NULL);

LGTM

>  
>  		err = engine_init_common(engine);
>  		if (err)
> @@ -1307,8 +1318,7 @@ void intel_engine_cleanup_common(struct intel_engine_cs *engine)
>  	if (engine->default_state)
>  		fput(engine->default_state);
>  
> -	if (engine->kernel_context)
> -		intel_engine_destroy_pinned_context(engine->kernel_context);
> +	destroy_pinned_context(engine->kernel_context);

I think there is no point for this hunk, and consequently for the first one.  
A version of intel_engine_destroy_pinned_context() that accepts NULL can be 
added later, when we see need for similar code optimisation in more places, if 
ever.

Thanks,
Janusz

>  
>  	GEM_BUG_ON(!llist_empty(&engine->barrier_tasks));
>  	cleanup_status_page(engine);
> 


