Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A214DB4FE1F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 15:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FD810E778;
	Tue,  9 Sep 2025 13:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m4P90aeS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C971810E77C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 13:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757425945; x=1788961945;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cB60dTH36cJn6bhj7LO4fYyxsqTwnBK5gWYnVm8iKcc=;
 b=m4P90aeSp08u2fdRRTzZbaPXCgG5GZnLqdywp6JvJyJujpNIHP7Z/Iie
 rg9IuvwhB7YpR4Z3xE2gM7QGdjDT9ob9VVDTGaU/zADm6f2yjO2vVuhsi
 oN7ANv7s4idN6NgyKG31qyakYo2FopV+t/HZ2468KWzviG8oFWvkmKj1a
 UC0tcxPehyCBqTlvc/EcJtq0X8CbzfB0lpqMU7/biPfhrX92TFI0YRa4e
 mkIlPtn8nEunvO3axkssCce59cOETwGgiZhR4Kateahd4PY/b0oCch1CO
 1cJvYwc+fWUVXrkQMRWeJ1ASAQvdE1hIoKFUhKr2u4j+txE3O/RW6CHak w==;
X-CSE-ConnectionGUID: ZfUxaLFjT7S/cEAxrKvVJQ==
X-CSE-MsgGUID: pQ2pQieURN2FccvotjdhzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63540498"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63540498"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:52:24 -0700
X-CSE-ConnectionGUID: uOtQ303AQT+UUb7RYD4Arg==
X-CSE-MsgGUID: emVJJelAQGC2XlamoX9law==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="177148881"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.181])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:52:22 -0700
Date: Tue, 9 Sep 2025 16:52:18 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 37/39] drm/ingenic: crtc: Switch to
 ingenic_drm_get_new_priv_state()
Message-ID: <aMAxEjIJOvxmOj2D@intel.com>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
 <20250909-drm-no-more-existing-state-v3-37-1c7a7d960c33@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250909-drm-no-more-existing-state-v3-37-1c7a7d960c33@kernel.org>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Tue, Sep 09, 2025 at 01:27:56PM +0200, Maxime Ripard wrote:
> The ingenic CRTC atomic_enable() implementation will indirectly call
> drm_atomic_get_private_obj_state() through ingenic_drm_get_priv_state().
> 
> drm_atomic_get_private_obj_state() will either return the new state for
> the object in the global state if it exists, or will allocate a new one
> and add it to the global state.
> 
> atomic_enable() however isn't allowed to modify the global state. So
> what the implementation should use is the
> drm_atomic_get_new_private_obj_state() helper to get the new state for
> the CRTC, without performing an extra allocation.
> 
> The ingenic driver has a wrapper around that helper with
> ingenic_drm_get_new_priv_state(), so let's use that instead.
> 
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> 
> ---
> To: Paul Cercueil <paul@crapouillou.net>
> Cc: linux-mips@vger.kernel.org
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 05faed933e5619c796f2a4fa1906e0eaa029ac68..a1b641d63fc500dc169d0b0e22f93168c343a242 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -245,11 +245,11 @@ static void ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
>  {
>  	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
>  	struct ingenic_drm_private_state *priv_state;
>  	unsigned int next_id;
>  
> -	priv_state = ingenic_drm_get_priv_state(priv, state);
> +	priv_state = ingenic_drm_get_new_priv_state(priv, state);
>  	if (WARN_ON(IS_ERR(priv_state)))

get_new_state() will never return an error pointer. It's either
a valid pointer or NULL.

To me it looks like this could potentially be NULL here as the
get_pvi_state() call is done from the plane .atomic_check()
whereas this gets called for the crtc. So if the plane is
disabled there might not be any private state included in the
commit.

Not sure how this driver/hardware is supposed to work so not
sure what the proper fix for that is...

>  		return;
>  
>  	/* Set addresses of our DMA descriptor chains */
>  	next_id = priv_state->use_palette ? HWDESC_PALETTE : 0;
> 
> -- 
> 2.50.1

-- 
Ville Syrjälä
Intel
