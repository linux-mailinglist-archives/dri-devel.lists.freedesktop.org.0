Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 518A1A3C5A0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 18:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35E910E34F;
	Wed, 19 Feb 2025 17:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="NJS0yQ/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8664310E34F;
 Wed, 19 Feb 2025 17:06:33 +0000 (UTC)
Received: from hm-sls2 (unknown [142.114.216.132])
 by linux.microsoft.com (Postfix) with ESMTPSA id C4DC22043DE3;
 Wed, 19 Feb 2025 09:06:32 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C4DC22043DE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1739984793;
 bh=T0SF2vhw1Q2Z6TUUz8hq+4hhSBf5ohEFbobVnAl9p2Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NJS0yQ/rwqgyQ5KrCIqo6LhROYKfhiHmOwNAHrtxLRclcpI7HPyBCkx9o1gjUSNHa
 z4XxIeGPlZoOu63S93mKnR4YBYYltf7p/TXHm6Za5VcudcHLT7SJxKwnG3K8bsIoTq
 YS68Y7qfzdaMSfhaT5aCAhRb5gy7+fDQxK4c74tA=
Date: Wed, 19 Feb 2025 12:06:20 -0500
From: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/atomic: Filter out redundant DPMS calls
Message-ID: <Z7YPjEOgLJGsAt2d@hm-sls2>
References: <20250219160239.17502-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250219160239.17502-1-ville.syrjala@linux.intel.com>
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

On Wed, Feb 19, 2025 at 06:02:39PM +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Video players (eg. mpv) do periodic XResetScreenSaver() calls to
> keep the screen on while the video playing. The modesetting ddx
> plumbs these straight through into the kernel as DPMS setproperty
> ioctls, without any filtering whatsoever. When implemented via
> atomic these end up as full commits on the crtc, which leads to a
> dropped frame every time XResetScreenSaver() is called.
> 
> Let's just filter out redundant DPMS property changes in the
> kernel to avoid this issue.

Do you know if this has any impact on the DPMS timeout (as set by
DPMSSetTimeouts())?

> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 2765ba90ad8f..c2726af6698e 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -957,6 +957,10 @@ int drm_atomic_connector_commit_dpms(struct drm_atomic_state *state,
>  
>  	if (mode != DRM_MODE_DPMS_ON)
>  		mode = DRM_MODE_DPMS_OFF;
> +
> +	if (connector->dpms == mode)
> +		goto out;
> +
>  	connector->dpms = mode;
>  
>  	crtc = connector->state->crtc;
> -- 
> 2.45.3
