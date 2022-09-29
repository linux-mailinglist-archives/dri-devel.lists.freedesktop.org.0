Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 380EE5EEF7B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 09:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B9A10E989;
	Thu, 29 Sep 2022 07:44:18 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278A210E2D9;
 Thu, 29 Sep 2022 07:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664437453; x=1695973453;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8waZTORVBrUnFu91rJEmtrEAjOg/p8Q5zkHox+9PysM=;
 b=Ee706cfZvunpJ6A/4DKjIJSrE+BgpJ2NjhLXmvamYl94zESSHaT/Y/YB
 9lIGFJWZienh3kiK3GoN7dCUzuweLlqdgCSVkUgU9mhw+ahN892WuHOFz
 Md9ZASOifsq87ma7+F+ORy6+bMBO4nW2QeK7WOkpyqszoDTSFpS132fH5
 /4GK6O9Ueo0ROqZWqFT8Wf16Z0WuZwmo7Ar/HIapcJQmlCa/BbHPdC4Mt
 Nr2kdZ4WgPneh6MwcpvlITF+G54r5tJjdWBEHDH+uUk5chBhMDaL0ntyd
 VRG6kj+u6UnrHtMdsJfWdFxh/TS55GLmYxrsy44bYqAVHC7KTZR8tJGfP A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="299422347"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; d="scan'208";a="299422347"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 00:44:12 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="622250138"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; d="scan'208";a="622250138"
Received: from aknyaze1-mobl.ger.corp.intel.com (HELO [10.213.226.16])
 ([10.213.226.16])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 00:44:10 -0700
Message-ID: <2d9daafb-b105-c410-1e2e-0afdd188523a@linux.intel.com>
Date: Thu, 29 Sep 2022 08:44:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [Intel-gfx] [PATCH v4 4/4] drm/i915: Improve long running compute
 w/a for GuC submission
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20220929021813.2172701-1-John.C.Harrison@Intel.com>
 <20220929021813.2172701-5-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220929021813.2172701-5-John.C.Harrison@Intel.com>
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
Cc: Michal Mrozek <michal.mrozek@intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 29/09/2022 03:18, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> A workaround was added to the driver to allow compute workloads to run
> 'forever' by disabling pre-emption on the RCS engine for Gen12.
> It is not totally unbound as the heartbeat will kick in eventually
> and cause a reset of the hung engine.
> 
> However, this does not work well in GuC submission mode. In GuC mode,
> the pre-emption timeout is how GuC detects hung contexts and triggers
> a per engine reset. Thus, disabling the timeout means also losing all
> per engine reset ability. A full GT reset will still occur when the
> heartbeat finally expires, but that is a much more destructive and
> undesirable mechanism.
> 
> The purpose of the workaround is actually to give compute tasks longer
> to reach a pre-emption point after a pre-emption request has been
> issued. This is necessary because Gen12 does not support mid-thread
> pre-emption and compute tasks can have long running threads.
> 
> So, rather than disabling the timeout completely, just set it to a
> 'long' value.
> 
> v2: Review feedback from Tvrtko - must hard code the 'long' value
> instead of determining it algorithmically. So make it an extra CONFIG
> definition. Also, remove the execlist centric comment from the
> existing pre-emption timeout CONFIG option given that it applies to
> more than just execlists.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> (v1)
> Acked-by: Michal Mrozek <michal.mrozek@intel.com>

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

> ---
>   drivers/gpu/drm/i915/Kconfig.profile      | 26 +++++++++++++++++++----
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c |  9 ++++++--
>   2 files changed, 29 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/Kconfig.profile b/drivers/gpu/drm/i915/Kconfig.profile
> index 39328567c2007..7cc38d25ee5c8 100644
> --- a/drivers/gpu/drm/i915/Kconfig.profile
> +++ b/drivers/gpu/drm/i915/Kconfig.profile
> @@ -57,10 +57,28 @@ config DRM_I915_PREEMPT_TIMEOUT
>   	default 640 # milliseconds
>   	help
>   	  How long to wait (in milliseconds) for a preemption event to occur
> -	  when submitting a new context via execlists. If the current context
> -	  does not hit an arbitration point and yield to HW before the timer
> -	  expires, the HW will be reset to allow the more important context
> -	  to execute.
> +	  when submitting a new context. If the current context does not hit
> +	  an arbitration point and yield to HW before the timer expires, the
> +	  HW will be reset to allow the more important context to execute.
> +
> +	  This is adjustable via
> +	  /sys/class/drm/card?/engine/*/preempt_timeout_ms
> +
> +	  May be 0 to disable the timeout.
> +
> +	  The compiled in default may get overridden at driver probe time on
> +	  certain platforms and certain engines which will be reflected in the
> +	  sysfs control.
> +
> +config DRM_I915_PREEMPT_TIMEOUT_COMPUTE
> +	int "Preempt timeout for compute engines (ms, jiffy granularity)"
> +	default 7500 # milliseconds
> +	help
> +	  How long to wait (in milliseconds) for a preemption event to occur
> +	  when submitting a new context to a compute capable engine. If the
> +	  current context does not hit an arbitration point and yield to HW
> +	  before the timer expires, the HW will be reset to allow the more
> +	  important context to execute.
>   
>   	  This is adjustable via
>   	  /sys/class/drm/card?/engine/*/preempt_timeout_ms
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index fcbccd8d244e9..c1257723d1949 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -508,9 +508,14 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
>   	engine->props.timeslice_duration_ms =
>   		CONFIG_DRM_I915_TIMESLICE_DURATION;
>   
> -	/* Override to uninterruptible for OpenCL workloads. */
> +	/*
> +	 * Mid-thread pre-emption is not available in Gen12. Unfortunately,
> +	 * some compute workloads run quite long threads. That means they get
> +	 * reset due to not pre-empting in a timely manner. So, bump the
> +	 * pre-emption timeout value to be much higher for compute engines.
> +	 */
>   	if (GRAPHICS_VER(i915) == 12 && (engine->flags & I915_ENGINE_HAS_RCS_REG_STATE))
> -		engine->props.preempt_timeout_ms = 0;
> +		engine->props.preempt_timeout_ms = CONFIG_DRM_I915_PREEMPT_TIMEOUT_COMPUTE;
>   
>   	/* Cap properties according to any system limits */
>   #define CLAMP_PROP(field) \
