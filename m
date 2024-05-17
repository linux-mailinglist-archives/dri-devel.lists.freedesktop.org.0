Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BDD8C874E
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 15:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B43610EEBF;
	Fri, 17 May 2024 13:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aixZj5sF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710F010EEBE;
 Fri, 17 May 2024 13:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715952959; x=1747488959;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pkRP99O+qWWbe1s2SsGiS6DSLgz7jQCK/kztN4sSjFw=;
 b=aixZj5sFaB165U7jQ25wouoJdPZRduy44PksN8bkv8wNRQAB84Y+BcTB
 NdcfVe3QNIcqsfy7a9GXkwAsDh86lTZIFq3N68nFjAvii4HKL3Kh4m5CZ
 XVfYhzuW9nMi+3vUJc1lVLPSw9En8HIzv7hqGfU3/pu46JWaTkRTSFzmo
 LLoslPtf8JHa92ygaRQNFwJ4xG4pjH3wcv+xlFqeEPk6ZObB/VUnGhmo9
 QNY0glnHqfc8c2u7O31U0rZ+FX9Fu9B3p56GY4igl5lAN0GU3HUwysi4N
 DrGYTEYI7vK35tBNLl9XqWAgYW6uHJCWYD7zHtar+Jykfn/p3PO2xOfcn Q==;
X-CSE-ConnectionGUID: kje+V0qWTeajfVBpdmYc9g==
X-CSE-MsgGUID: HbZs/tozQTqTXgwIEiW0VA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12250781"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="12250781"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 06:35:59 -0700
X-CSE-ConnectionGUID: cHnsHfvkTJ+wYkF24U+TIQ==
X-CSE-MsgGUID: 4SdFAxaeQzODMrSekj05zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="36543280"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 06:35:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 3/3] drm/i915: Don't use __func__ as prefix for
 drm_dbg_printer
In-Reply-To: <20240517125730.2304-4-michal.wajdeczko@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240517125730.2304-1-michal.wajdeczko@intel.com>
 <20240517125730.2304-4-michal.wajdeczko@intel.com>
Date: Fri, 17 May 2024 16:35:52 +0300
Message-ID: <87msooa7d3.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 May 2024, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> Updated code of drm_dbg_printer() is already printing symbolic
> name of the caller like drm_dbg() does.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_reset.c      | 2 +-
>  drivers/gpu/drm/i915/gt/selftest_context.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index 6161f7a3ff70..735cd23a43c6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -1025,7 +1025,7 @@ void intel_gt_set_wedged(struct intel_gt *gt)
>  
>  	if (GEM_SHOW_DEBUG()) {
>  		struct drm_printer p = drm_dbg_printer(&gt->i915->drm,
> -						       DRM_UT_DRIVER, __func__);
> +						       DRM_UT_DRIVER, NULL);
>  		struct intel_engine_cs *engine;
>  		enum intel_engine_id id;
>  
> diff --git a/drivers/gpu/drm/i915/gt/selftest_context.c b/drivers/gpu/drm/i915/gt/selftest_context.c
> index 12eca750f7d0..5eb46700dc4e 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_context.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_context.c
> @@ -286,7 +286,7 @@ static int __live_active_context(struct intel_engine_cs *engine)
>  
>  	if (intel_engine_pm_is_awake(engine)) {
>  		struct drm_printer p = drm_dbg_printer(&engine->i915->drm,
> -						       DRM_UT_DRIVER, __func__);
> +						       DRM_UT_DRIVER, NULL);
>  
>  		intel_engine_dump(engine, &p,
>  				  "%s is still awake:%d after idle-barriers\n",

-- 
Jani Nikula, Intel
