Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FF497BE75
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 17:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE80B10E5D6;
	Wed, 18 Sep 2024 15:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kM1b4Aul";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093B110E5D6;
 Wed, 18 Sep 2024 15:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726672371; x=1758208371;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=dX26jQToZMk/ywvfBX19Zq85rSfYambcB5wy1n/f+cA=;
 b=kM1b4AulYZqbPsHZ9XpT6hZdFop30HUSEhk0eKgo1pTilHG21qHJboCE
 Bfsco4whHAAiQi9SgEm8SRQSlKUStWu2vEjVUyFO8qFsQACfW8uJML3o6
 xt4XgWnNmV5tAFXdMG3uN3d4xO83vLQ5rJRyh9KG4i74R6gTneP1baaMG
 a4VkVo8rlA3/SuL8zaC27i+Ws25Kpp0MuEb0F+oPfqdIcxx+r9/pTQdCH
 sRlutEUJpP92HR+FfMXO+jEexIcmyQmatIKHqpFGa3YkciTaCFpYPnEZE
 iOMiTnT4eFc6Hqos/REGn4kDkghwteJgTzV1WJ2UwY4WDsXJfb8EC9NPL A==;
X-CSE-ConnectionGUID: jZx42UGlSVC4kSX33O1UWw==
X-CSE-MsgGUID: 87Dtr+hwSCiPS1VyiagKfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25464894"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="25464894"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 08:12:51 -0700
X-CSE-ConnectionGUID: yjCVVs3GSCW/qiXbQntUsA==
X-CSE-MsgGUID: qeI6wnwvQXu9uxLdWMZBgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="69849595"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 08:12:48 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nemesa Garg <nemesa.garg@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: Re: [PATCH v2 4/5] drm/i915/display: Add registers and compute the
 strength
In-Reply-To: <20240917092634.1109572-5-nemesa.garg@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240917092634.1109572-1-nemesa.garg@intel.com>
 <20240917092634.1109572-5-nemesa.garg@intel.com>
Date: Wed, 18 Sep 2024 18:12:45 +0300
Message-ID: <875xqtatci.fsf@intel.com>
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

On Tue, 17 Sep 2024, Nemesa Garg <nemesa.garg@intel.com> wrote:
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 84b05b57ad52..41c6c56d83d6 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -2396,6 +2396,23 @@
>  			_ID(id, _PS_COEF_SET0_DATA_1A, _PS_COEF_SET0_DATA_2A) + (set) * 8, \
>  			_ID(id, _PS_COEF_SET0_DATA_1B, _PS_COEF_SET0_DATA_2B) + (set) * 8)
>  
> +#define _SHARPNESS_CTL_A               0x682B0
> +#define SHARPNESS_CTL(trans)           _MMIO_PIPE2(dev_priv, trans, _SHARPNESS_CTL_A)

Oh, also, absolutely do not rely on implicit dev_priv variable in
there. Replace with display passed in explicitly. We've fixed this,
there are no implicit dev_priv variables used anywhere anymore. Do not
add new ones.

> +#define  FILTER_EN                      REG_BIT(31)
> +#define  FILTER_STRENGTH_MASK           REG_GENMASK(15, 8)
> +#define  FILTER_STRENGTH(x)             REG_FIELD_PREP(FILTER_STRENGTH_MASK, (x))
> +#define  FILTER_SIZE_MASK               REG_GENMASK(1, 0)
> +#define  FILTER_SIZE(x)                 REG_FIELD_PREP(FILTER_SIZE_MASK, (x))
> +
> +#define _SHRPLUT_DATA_A                        0x682B8
> +#define SHRPLUT_DATA(trans)            _MMIO_PIPE2(dev_priv, trans, _SHRPLUT_DATA_A)
> +
> +#define _SHRPLUT_INDEX_A               0x682B4
> +#define SHRPLUT_INDEX(trans)           _MMIO_PIPE2(dev_priv, trans, _SHRPLUT_INDEX_A)
> +#define  INDEX_AUTO_INCR               REG_BIT(10)
> +#define  INDEX_VALUE_MASK              REG_GENMASK(4, 0)
> +#define  INDEX_VALUE(x)                        REG_FIELD_PREP(INDEX_VALUE_MASK, (x))
          ^ 3 spaces      ^ tabs

Also, do check the big comment near the top of i915_reg.h about style
for the macros.

BR,
Jani.

> +
>  /* Display Internal Timeout Register */
>  #define RM_TIMEOUT		_MMIO(0x42060)
>  #define RM_TIMEOUT_REG_CAPTURE	_MMIO(0x420E0)

-- 
Jani Nikula, Intel
