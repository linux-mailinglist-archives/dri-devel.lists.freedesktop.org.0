Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A9FB446BE
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 21:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D1F10E35C;
	Thu,  4 Sep 2025 19:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a86HyaX7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A4A210E35C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 19:51:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 90F0B6028B;
 Thu,  4 Sep 2025 19:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B26DC4CEF4;
 Thu,  4 Sep 2025 19:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757015493;
 bh=QPZGgKSeK7OkOS6fKJFX6cxsolH+ueRXJKXsFqAwQ14=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a86HyaX7buRnOcJQbTWphoKusLKadxi5a9jJw7PwpNQ3M9l3vIQHTOF0YgIW5sQiZ
 akGp/cU1I/v/aqOIOjbUPQ7ETVtcvNJhjdsFZuJeCwO6HAkDwfzf9RVCCDsh8ZnhJv
 Z8qz+5d1W81zu0ZtHZBoHKDCKL82XnvEPYXV3cUiCcBbCmfV2bjROl4mbId6BJBGIW
 cJHsBp4dp0JLVtSPud4SqyJkR63SJ3qCuFMF30dhLxBxkJqss0iwzohKBXTaO3qAEm
 9eiTa25I6ahjey24gEKievkWuymc0pN6VDRy72bvVOJ7XAm+m9K0t5HTTMr1QPzfz7
 k2rDjhYYI+crA==
Date: Thu, 4 Sep 2025 12:51:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Devarsh Thakkar <devarsht@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: dri-devel@lists.freedesktop.org, patches@lists.linux.dev
Subject: Re: [PATCH] drm/bridge: cdns-dsi: Select VIDEOMODE_HELPERS
Message-ID: <20250904195127.GA4160085@ax162>
References: <20250821-cdns-videohelpers-v1-1-853e021908cf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-cdns-videohelpers-v1-1-853e021908cf@kernel.org>
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

Gentle ping, this seems fairly obvious and it continues to break out
builds in -next.

On Thu, Aug 21, 2025 at 01:52:12PM -0700, Nathan Chancellor wrote:
> When no other driver selects CONFIG_VIDEOMODE_HELPERS but
> CONFIG_DRM_CDNS_DSI is enabled, there is a linker or modpost error:
> 
>   ERROR: modpost: "drm_display_mode_to_videomode" [drivers/gpu/drm/bridge/cadence/cdns-dsi.ko] undefined!
> 
> Select VIDEOMODE_HELPERS to ensure that this helper function is
> available to the driver.
> 
> Fixes: ce4bc5ca7c1d ("drm/bridge: cdns-dsi: Use video mode and clean up cdns_dsi_mode2cfg()")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/bridge/cadence/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
> index cced81633ddc..f1d8a8a151d8 100644
> --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> +++ b/drivers/gpu/drm/bridge/cadence/Kconfig
> @@ -6,6 +6,7 @@ config DRM_CDNS_DSI
>  	select DRM_PANEL_BRIDGE
>  	select GENERIC_PHY
>  	select GENERIC_PHY_MIPI_DPHY
> +	select VIDEOMODE_HELPERS
>  	depends on OF
>  	help
>  	  Support Cadence DPI to DSI bridge. This is an internal
> 
> ---
> base-commit: 3f13bcc886fc034113cb75cb32b8d9db1216b846
> change-id: 20250821-cdns-videohelpers-71182a6145bc
> 
> Best regards,
> --  
> Nathan Chancellor <nathan@kernel.org>
> 
