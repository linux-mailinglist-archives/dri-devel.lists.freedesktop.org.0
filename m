Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34419877C40
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 10:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E7B1128E2;
	Mon, 11 Mar 2024 09:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NKACIwGf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB22A112900
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 09:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710147928; x=1741683928;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rImkqM/I/bYKr0LnvGSDk6a0kXoGqUeX9ScOOvPWmR0=;
 b=NKACIwGfu2/MWxUlbTOozHglyvEI1kfo8JyLD+EdIh3phB35DF3qrzYu
 7fgezY7taYwDjZAawSekBcHB8VSWBlaLuavShO10TAByoOu7E/JCzQ6nT
 3i2m5Zfn+qBIcxSwiDMOkViRfw3aWbxB/rksvPzXaCP5nj8gdmTp7esVx
 xBZNrGx+vM0GLFbYW4zQSJP77wefdI7eC8QJFrO/w/d/BaHG/YwjBPYzA
 exkMZ2Sem/qpgxi35+CJLXWtdXi2xQndSBYI9dMeJqk9czbXbWhYNVO1x
 zsnfQ2LBH5ioTOJCg1dIhJFYcRNAHf5vK85sLK22ehDBrbUPtaStsexKK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="15437808"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="15437808"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 02:05:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="15600083"
Received: from tbeaumon-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.34.24])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 02:05:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/bridge: correct DRM_BRIDGE_OP_EDID documentation
In-Reply-To: <20240310-drm-bridge-fix-docs-v1-1-70d3d741cb7a@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240310-drm-bridge-fix-docs-v1-1-70d3d741cb7a@linaro.org>
Date: Mon, 11 Mar 2024 11:05:16 +0200
Message-ID: <87v85tt9yr.fsf@intel.com>
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

On Sun, 10 Mar 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> While the commit d807ad80d811 ("drm/bridge: add ->edid_read hook and
> drm_bridge_edid_read()") and the commit 27b8f91c08d9 ("drm/bridge:
> remove ->get_edid callback") replaced ->get_edid() callback with the
> ->edid_read(), they failed to update documentation. Fix the drm_bridge
> docs to point to edid_read().
>
> Fixes: 27b8f91c08d9 ("drm/bridge: remove ->get_edid callback")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

My bad, thanks for fixing it!

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  include/drm/drm_bridge.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 3606e1a7f965..4baca0d9107b 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -541,7 +541,7 @@ struct drm_bridge_funcs {
>  	 * The @get_modes callback is mostly intended to support non-probeable
>  	 * displays such as many fixed panels. Bridges that support reading
>  	 * EDID shall leave @get_modes unimplemented and implement the
> -	 * &drm_bridge_funcs->get_edid callback instead.
> +	 * &drm_bridge_funcs->edid_read callback instead.
>  	 *
>  	 * This callback is optional. Bridges that implement it shall set the
>  	 * DRM_BRIDGE_OP_MODES flag in their &drm_bridge->ops.
> @@ -687,7 +687,7 @@ enum drm_bridge_ops {
>  	/**
>  	 * @DRM_BRIDGE_OP_EDID: The bridge can retrieve the EDID of the display
>  	 * connected to its output. Bridges that set this flag shall implement
> -	 * the &drm_bridge_funcs->get_edid callback.
> +	 * the &drm_bridge_funcs->edid_read callback.
>  	 */
>  	DRM_BRIDGE_OP_EDID = BIT(1),
>  	/**
>
> ---
> base-commit: 1843e16d2df9d98427ef8045589571749d627cf7
> change-id: 20240310-drm-bridge-fix-docs-0fd12bc6a041
>
> Best regards,

-- 
Jani Nikula, Intel
