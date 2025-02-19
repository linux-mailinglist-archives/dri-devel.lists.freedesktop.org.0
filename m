Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA79A3C8DC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 20:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7370C10E10D;
	Wed, 19 Feb 2025 19:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hhmHqpbe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A907010E045;
 Wed, 19 Feb 2025 19:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739993732; x=1771529732;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=j6DeFoRc0fF7e2Oks35if1gZ6a65rDtTUrU//ykiUzE=;
 b=hhmHqpbe99vJ7eS3o8Zo5rBI88H8BF0rRWUQHPJwEtxRawadtZwuauyl
 bqMfaLXLAMtQ5c7dM6z6JkG3RK4JQZAUkJcthAPhCRgHwFwjzTqGtDU1c
 +n1pzsynrqrYW2U9wFn8ufPGIqi5GUA+oRHQCFW/NXOedTE/HbHB+zBnU
 WG1ropwl3SpIs8VfyphWtJ5NcMhHzgEA70bO4ZLjuyOl8P6Nh/Z8k9/qk
 wuhPZ8ywQdk2STlE9oxjFcGkZ9QsgCArXA8MYLNEUQXzwVr2zZlqPopAa
 i62XU+9mQWQ729qJcEDa3YkVxRzNzkKHBxg1oiRvx9SjO90uzOG/5LMEM Q==;
X-CSE-ConnectionGUID: aAoc3ET7S6uwoe2leX3MZQ==
X-CSE-MsgGUID: yDcGNTf8Q6qHcuuVv1l3Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44518663"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="44518663"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 11:35:31 -0800
X-CSE-ConnectionGUID: e+8QBiJrTuanDsBQC5xjHA==
X-CSE-MsgGUID: rcNt279eQzm+o3qVVFZ6cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="114645396"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.160])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 11:35:26 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915: Fix harmfull driver register/unregister
 assymetry
In-Reply-To: <20250219183807.713776-2-janusz.krzysztofik@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250219183807.713776-2-janusz.krzysztofik@linux.intel.com>
Date: Wed, 19 Feb 2025 21:35:19 +0200
Message-ID: <87o6yxn2x4.fsf@intel.com>
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

On Wed, 19 Feb 2025, Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index ffc346379cc2c..27a23b1eb9de0 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -347,6 +347,8 @@ struct drm_i915_private {
>  	/* The TTM device structure. */
>  	struct ttm_device bdev;
>  
> +	bool registered;
> +

*must* find another way.

BR,
Jani.


>  	I915_SELFTEST_DECLARE(struct i915_selftest_stash selftest;)
>  
>  	/*

-- 
Jani Nikula, Intel
