Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49651917CCE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 11:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB5B10E817;
	Wed, 26 Jun 2024 09:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V3iI7ue8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55AE010E817
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 09:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719395099; x=1750931099;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rUkb/XtxnPf8kMa8QTE5ZaHy/kdwHRipRbbMnUTdKNY=;
 b=V3iI7ue8FFAjGY4/2FPL1+KNiv58FB6CO4qa3b8Bqn0ujYGJoY5Vntle
 euYML4D7wU8uR+Q32w0gNoVnp4R0tkygCNzV9xTz4Cf+88kSTuyGlXXOh
 HC4tRMjmswjy8fdjWn6WzyIcSWNPoHESEkwzadXG31dgSDtITGT5H8yi7
 3kg9zLTw1Xt6/a924DiT/sSc/KcgfAfxuDHZT5Nx5vT4FW6DIlf49wkCs
 LeK+4QT+0Jmq+qLbTYfZog4z85mpPkUTcER/WcqmqmxAHDV+VIXl4XP0B
 izU7e/ovLRVhu+1lsK7TeGn81/+oiLJQFe8M/ONmtCzW7k3jKBqSD4Teo Q==;
X-CSE-ConnectionGUID: n0/sbk2hT6SI0WL0BeQ/cA==
X-CSE-MsgGUID: 5UdIOelvSoOVi6kPCoimEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16598063"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="16598063"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 02:44:58 -0700
X-CSE-ConnectionGUID: HHQuvY9ETPqNbtN67MTYvA==
X-CSE-MsgGUID: UGcgaTdIRcW6iNodH8BvfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="75154769"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.95])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 02:44:55 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ma Ke <make24@iscas.ac.cn>, patrik.r.jakobsson@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Ma Ke
 <make24@iscas.ac.cn>
Subject: Re: [PATCH] drm/gma500: fix null pointer dereference in
 psb_intel_lvds_get_modes
In-Reply-To: <20240626011656.2763368-1-make24@iscas.ac.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240626011656.2763368-1-make24@iscas.ac.cn>
Date: Wed, 26 Jun 2024 12:44:48 +0300
Message-ID: <8734p0domn.fsf@intel.com>
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

On Wed, 26 Jun 2024, Ma Ke <make24@iscas.ac.cn> wrote:
> In psb_intel_lvds_get_modes(), the return value of drm_mode_duplicate() is
> assigned to mode, which will lead to a possible NULL pointer dereference
> on failure of drm_mode_duplicate(). Add a check to avoid npd.
>
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/gpu/drm/gma500/psb_intel_lvds.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
> index 8486de230ec9..aa5bf2a8a319 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
> +++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
> @@ -504,6 +504,8 @@ static int psb_intel_lvds_get_modes(struct drm_connector *connector)
>  	if (mode_dev->panel_fixed_mode != NULL) {
>  		struct drm_display_mode *mode =
>  		    drm_mode_duplicate(dev, mode_dev->panel_fixed_mode);
> +		if (!mode)
> +			return -ENOMEM;

Do not return negative values from .get_modes().

BR,
Jani.

>  		drm_mode_probed_add(connector, mode);
>  		return 1;
>  	}

-- 
Jani Nikula, Intel
