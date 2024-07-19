Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2161593768B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 12:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9C910EBBB;
	Fri, 19 Jul 2024 10:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TcNXBgzn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247CE10EBBB
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 10:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721384277; x=1752920277;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ukiKUcHxw6E5rNaEVwCvS99WA1kcaSLZF5/03q4C2lw=;
 b=TcNXBgznMNPMIZWkNAbKaC1Kc/KfSkKApfEIS0Aow2aaJymWj/M3lJT9
 2WwcmRqji2xo9Ag7Ch0BrzAkZRB/DlDGuyklOGEHnVltlfKuwy9H3YRjl
 UafVW2cbGzXO6zOOugOOUHnVOzHDUtKqPCVCY9MB8n9514g2bV4+E9QmV
 I49tSmh86VQ7laXcd/exOjdPDD7P5VzYl947BJDR+lIWlVBmcjReJD7md
 ScrRSrT8QqxDydySXa+tzt789j0Xk2p2rgXPJN1hRNEYVaM9+lJUc3awt
 ASoTAEMyEH3cdrz4Q6ZIV4vr4uFQWcX3aWjx00/1H4JPbXitlJSepaF7U g==;
X-CSE-ConnectionGUID: hObzWY6qQra4TZp3zJdg5Q==
X-CSE-MsgGUID: 044TvFLRRt+2a5V1UUOzlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="19125258"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="19125258"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 03:17:56 -0700
X-CSE-ConnectionGUID: 9saA8r7wQFWiWAUmTXoXsQ==
X-CSE-MsgGUID: pAkOsJ74REG3vMffOwQXqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="74282171"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 03:17:52 -0700
Date: Fri, 19 Jul 2024 13:18:06 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/panic: Add drm_panic_is_enabled()
Message-ID: <Zpo9Xv6wLevidsNa@ideak-desk.fi.intel.com>
References: <20240717090102.968152-1-jfalempe@redhat.com>
 <20240717090102.968152-2-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240717090102.968152-2-jfalempe@redhat.com>
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jul 17, 2024 at 10:48:39AM +0200, Jocelyn Falempe wrote:
> It allows to check if the drm device supports drm_panic.
> Prepare the work to have better integration with fbcon and vtconsole.
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/drm_panic.c | 20 ++++++++++++++++++++
>  include/drm/drm_panic.h     |  2 ++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 948aed00595e..d9a25c2d0a65 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -703,6 +703,26 @@ static void debugfs_register_plane(struct drm_plane *plane, int index)
>  static void debugfs_register_plane(struct drm_plane *plane, int index) {}
>  #endif /* CONFIG_DRM_PANIC_DEBUG */
>  
> +/**
> + * drm_panic_is_enabled
> + * @dev: the drm device that may supports drm_panic
> + *
> + * returns true if the drm device supports drm_panic
> + */
> +bool drm_panic_is_enabled(struct drm_device *dev)
> +{
> +	struct drm_plane *plane;
> +
> +	if (!dev->mode_config.num_total_plane)
> +		return false;
> +
> +	drm_for_each_plane(plane, dev)
> +		if (plane->helper_private && plane->helper_private->get_scanout_buffer)
> +			return true;
> +	return false;
> +}
> +EXPORT_SYMBOL(drm_panic_is_enabled);
> +
>  /**
>   * drm_panic_register() - Initialize DRM panic for a device
>   * @dev: the drm device on which the panic screen will be displayed.
> diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
> index 73bb3f3d9ed9..c3a358dc3e27 100644
> --- a/include/drm/drm_panic.h
> +++ b/include/drm/drm_panic.h
> @@ -148,11 +148,13 @@ struct drm_scanout_buffer {
>  
>  #ifdef CONFIG_DRM_PANIC
>  
> +bool drm_panic_is_enabled(struct drm_device *dev);
>  void drm_panic_register(struct drm_device *dev);
>  void drm_panic_unregister(struct drm_device *dev);
>  
>  #else
>  
> +bool drm_panic_is_enabled(struct drm_device *dev) {return false; }

This was moved to drivers/gpu/drm/drm_crtc_internal.h in the applied
version and I can't find that version on the mailing list; imo this kind
of change requires a resend.

Also, the above breaks CONFIG_DRM_PANIC=n builds:

In file included from drivers/gpu/drm/drm_atomic_uapi.c:43:
drivers/gpu/drm/drm_crtc_internal.h:322:6: error: no previous prototype for ‘drm_panic_is_enabled’ [-Werror=missing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }

Stubs like the above must be an inline function.

>  static inline void drm_panic_register(struct drm_device *dev) {}
>  static inline void drm_panic_unregister(struct drm_device *dev) {}
>  
> -- 
> 2.45.2
> 
