Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC814CC9E2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 00:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9B510E33B;
	Thu,  3 Mar 2022 23:16:46 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD50A10E33B;
 Thu,  3 Mar 2022 23:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646349405; x=1677885405;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=K5NCl7c6l3snJcQzwWfBmo3TIQkhEQd1GIfIElaR+kM=;
 b=TspiehXXz/OwHMZp9d4t5pZ34QepnI/0pYZMwcf6EehDR4kTNiA9PmiF
 fogcMhao4xxbXN1NuFvk6nYFrO6IslTiOm0bx+0pesOv+t9iofrA+QO3d
 gl68W3NzJGUyWmgj0PpQhGMKfBQa2PNx0HoCQI6igBjg92QjSLjwcmKu+
 hemLBM6jiIbchlAXvayQWpa665F1/poP80yBc1A8pNs3Ti6E4TOnDKGwC
 5baKyQXK0Aa/tySVEsNxHHM3icn8bDwgNf9w8Gp/4mS/dW5+dw7hr0hl4
 VvAN40hwQ6dkVadzRRUzLa41W8zo4dFPkv4HAywOT/XRu5x9i1jWFJwmr w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="253772723"
X-IronPort-AV: E=Sophos;i="5.90,153,1643702400"; d="scan'208";a="253772723"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 15:16:45 -0800
X-IronPort-AV: E=Sophos;i="5.90,153,1643702400"; d="scan'208";a="551972142"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 15:16:44 -0800
Date: Thu, 3 Mar 2022 15:16:43 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: John.C.Harrison@intel.com
Subject: Re: [PATCH v3 2/4] drm/i915: Fix compute pre-emption w/a to apply to
 compute engines
Message-ID: <YiFMW13U31UMNKF1@mdroper-desk1.amr.corp.intel.com>
References: <20220303223737.708659-1-John.C.Harrison@Intel.com>
 <20220303223737.708659-3-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220303223737.708659-3-John.C.Harrison@Intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-GFX@lists.freedesktop.org,
 DRI-Devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Stuart Summers <stuart.summers@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 03, 2022 at 02:37:35PM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> An earlier patch added support for compute engines. However, it missed
> enabling the anti-pre-emption w/a for the new engine class. So move
> the 'compute capable' flag earlier and use it for the pre-emption w/a
> test.
> 
> Fixes: c674c5b9342e ("drm/i915/xehp: CCS should use RCS setup functions")
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: "Michał Winiarski" <michal.winiarski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 22e70e4e007c..4185c7338581 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -421,6 +421,12 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
>  	engine->logical_mask = BIT(logical_instance);
>  	__sprint_engine_name(engine);
>  
> +	/* features common between engines sharing EUs */
> +	if (engine->class == RENDER_CLASS || engine->class == COMPUTE_CLASS) {
> +		engine->flags |= I915_ENGINE_HAS_RCS_REG_STATE;
> +		engine->flags |= I915_ENGINE_HAS_EU_PRIORITY;
> +	}
> +
>  	engine->props.heartbeat_interval_ms =
>  		CONFIG_DRM_I915_HEARTBEAT_INTERVAL;
>  	engine->props.max_busywait_duration_ns =
> @@ -433,15 +439,9 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
>  		CONFIG_DRM_I915_TIMESLICE_DURATION;
>  
>  	/* Override to uninterruptible for OpenCL workloads. */
> -	if (GRAPHICS_VER(i915) == 12 && engine->class == RENDER_CLASS)
> +	if (GRAPHICS_VER(i915) == 12 && (engine->flags & I915_ENGINE_HAS_RCS_REG_STATE))
>  		engine->props.preempt_timeout_ms = 0;
>  
> -	/* features common between engines sharing EUs */
> -	if (engine->class == RENDER_CLASS || engine->class == COMPUTE_CLASS) {
> -		engine->flags |= I915_ENGINE_HAS_RCS_REG_STATE;
> -		engine->flags |= I915_ENGINE_HAS_EU_PRIORITY;
> -	}
> -
>  	/* Cap properties according to any system limits */
>  #define CLAMP_PROP(field) \
>  	do { \
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
