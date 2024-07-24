Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 273AB93B3BF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 17:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCDF10E04F;
	Wed, 24 Jul 2024 15:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PyRGwp2I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A2210E04F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 15:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721835143; x=1753371143;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=JhLX2zUbNgvYUBkcoaMs0tiU+YC8ZirmCH9vCBVSvFU=;
 b=PyRGwp2IXcGVBEqawQ/A2ZyB+EgtP3owcF2PnyifcDXLtVbHzTNePBsC
 JXheNMtWdTNi55RdK11d2F9phMw4nolcbz2qGMa7pdQLa6c/pGfRvrCr5
 XAcSUSJBIrSN3voAjMP2UpXBZrv5EqeLXhzZZ2LsZSjmvQbXT/XajNnXY
 pJqSHUGSQXiL19cgEtG8x3hdU53Eh/jAv58czMduP/TvKeLtegPHSAMrf
 8Le4pVGrDy3NTElH6a79eSuqfdaeViEaQdVVjRTgugSZfFr01sEzKXoFT
 FWaiQR+jtLRhibRBd16OZpfspQRdi/w4enusqJnCuyPSal0G87G44zG4x Q==;
X-CSE-ConnectionGUID: vWYML09NTjuM178D5yE43w==
X-CSE-MsgGUID: 7cW9G7puR2GpQtTYpgMX2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="30941467"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="30941467"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 08:32:22 -0700
X-CSE-ConnectionGUID: 774wppLPSIS4l+YAKiOK/Q==
X-CSE-MsgGUID: hVfjG1w1Ru2ZjsVxsHPYjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="56766983"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 08:32:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tejas Vipin <tejasvipin76@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Cc: dianders@chromium.org, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Tejas Vipin
 <tejasvipin76@gmail.com>
Subject: Re: [PATCH 2/2] drm/mipi-dsi: Change multi functions to use quiet
 member of mipi_dsi_multi_context
In-Reply-To: <20240724122447.284165-3-tejasvipin76@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240724122447.284165-1-tejasvipin76@gmail.com>
 <20240724122447.284165-3-tejasvipin76@gmail.com>
Date: Wed, 24 Jul 2024 18:32:14 +0300
Message-ID: <877cdakdq9.fsf@intel.com>
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

On Wed, 24 Jul 2024, Tejas Vipin <tejasvipin76@gmail.com> wrote:
> Changes all the multi functions to check if the current context requires
> errors to be printed or not using the quiet member.
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index a471c46f5ca6..cbb77342d201 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -814,6 +814,8 @@ void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
>  	ret = mipi_dsi_generic_write(dsi, payload, size);
>  	if (ret < 0) {
>  		ctx->accum_err = ret;
> +		if (ctx->quiet)
> +			return;
>  		dev_err(dev, "sending generic data %*ph failed: %d\n",
>  			(int)size, payload, ctx->accum_err);

A maintainability nitpick. Imagine someone wishing to add some more
error handling here. Or something else after the block.

IMO the dev_err() should be wrapped in if (!ctx->quiet) instead of
adding an early return.

Ditto everywhere.

BR,
Jani.


>  	}
> @@ -958,6 +960,8 @@ void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_multi_context *ctx,
>  	ret = mipi_dsi_dcs_write_buffer(dsi, data, len);
>  	if (ret < 0) {
>  		ctx->accum_err = ret;
> +		if (ctx->quiet)
> +			return;
>  		dev_err(dev, "sending dcs data %*ph failed: %d\n",
>  			(int)len, data, ctx->accum_err);
>  	}
> @@ -1450,6 +1454,8 @@ void mipi_dsi_picture_parameter_set_multi(struct mipi_dsi_multi_context *ctx,
>  	ret = mipi_dsi_picture_parameter_set(dsi, pps);
>  	if (ret < 0) {
>  		ctx->accum_err = ret;
> +		if (ctx->quiet)
> +			return;
>  		dev_err(dev, "sending PPS failed: %d\n",
>  			ctx->accum_err);
>  	}
> @@ -1481,6 +1487,8 @@ void mipi_dsi_compression_mode_ext_multi(struct mipi_dsi_multi_context *ctx,
>  	ret = mipi_dsi_compression_mode_ext(dsi, enable, algo, pps_selector);
>  	if (ret < 0) {
>  		ctx->accum_err = ret;
> +		if (ctx->quiet)
> +			return;
>  		dev_err(dev, "sending COMPRESSION_MODE failed: %d\n",
>  			ctx->accum_err);
>  	}
> @@ -1506,6 +1514,8 @@ void mipi_dsi_dcs_nop_multi(struct mipi_dsi_multi_context *ctx)
>  	ret = mipi_dsi_dcs_nop(dsi);
>  	if (ret < 0) {
>  		ctx->accum_err = ret;
> +		if (ctx->quiet)
> +			return;
>  		dev_err(dev, "sending DCS NOP failed: %d\n",
>  			ctx->accum_err);
>  	}
> @@ -1531,6 +1541,8 @@ void mipi_dsi_dcs_enter_sleep_mode_multi(struct mipi_dsi_multi_context *ctx)
>  	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
>  	if (ret < 0) {
>  		ctx->accum_err = ret;
> +		if (ctx->quiet)
> +			return;
>  		dev_err(dev, "sending DCS ENTER_SLEEP_MODE failed: %d\n",
>  			ctx->accum_err);
>  	}
> @@ -1556,6 +1568,8 @@ void mipi_dsi_dcs_exit_sleep_mode_multi(struct mipi_dsi_multi_context *ctx)
>  	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
>  	if (ret < 0) {
>  		ctx->accum_err = ret;
> +		if (ctx->quiet)
> +			return;
>  		dev_err(dev, "sending DCS EXIT_SLEEP_MODE failed: %d\n",
>  			ctx->accum_err);
>  	}
> @@ -1581,6 +1595,8 @@ void mipi_dsi_dcs_set_display_off_multi(struct mipi_dsi_multi_context *ctx)
>  	ret = mipi_dsi_dcs_set_display_off(dsi);
>  	if (ret < 0) {
>  		ctx->accum_err = ret;
> +		if (ctx->quiet)
> +			return;
>  		dev_err(dev, "sending DCS SET_DISPLAY_OFF failed: %d\n",
>  			ctx->accum_err);
>  	}
> @@ -1606,6 +1622,8 @@ void mipi_dsi_dcs_set_display_on_multi(struct mipi_dsi_multi_context *ctx)
>  	ret = mipi_dsi_dcs_set_display_on(dsi);
>  	if (ret < 0) {
>  		ctx->accum_err = ret;
> +		if (ctx->quiet)
> +			return;
>  		dev_err(dev, "sending DCS SET_DISPLAY_ON failed: %d\n",
>  			ctx->accum_err);
>  	}
> @@ -1633,6 +1651,8 @@ void mipi_dsi_dcs_set_tear_on_multi(struct mipi_dsi_multi_context *ctx,
>  	ret = mipi_dsi_dcs_set_tear_on(dsi, mode);
>  	if (ret < 0) {
>  		ctx->accum_err = ret;
> +		if (ctx->quiet)
> +			return;
>  		dev_err(dev, "sending DCS SET_TEAR_ON failed: %d\n",
>  			ctx->accum_err);
>  	}

-- 
Jani Nikula, Intel
