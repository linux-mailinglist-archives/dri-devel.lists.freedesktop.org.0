Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A75368DF3C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 18:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCAA10E21D;
	Tue,  7 Feb 2023 17:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D011710E1E9;
 Tue,  7 Feb 2023 17:47:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 365FAB81A21;
 Tue,  7 Feb 2023 17:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C6A1C433D2;
 Tue,  7 Feb 2023 17:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1675792053;
 bh=+64e+8mFJKnm+yEYJF8Wm9cBrBW+Xnn8VVoYGCj2o4o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lxPHTo2gRczfX0FFhodjL1OD3Pe7ccpOrMmfFdKFWYKVdnvT1bv/uWyoHYoiFRr2j
 k/JbE9UPKwTdKM2YLNh19Ql5cfYg2zbPzDpI5dLprUCYigNH7pNE/gsuH0lBBsQCaq
 7sEi/3TPeWngpL4gNkJwGZfRGagS3Cta4/+ZHetM=
Date: Tue, 7 Feb 2023 18:47:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm: Disable dynamic debug as broken
Message-ID: <Y+KOszHLodcTx9Sr@kroah.com>
References: <20230207143337.2126678-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230207143337.2126678-1-jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 07, 2023 at 04:33:37PM +0200, Jani Nikula wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> CONFIG_DRM_USE_DYNAMIC_DEBUG breaks debug prints for (at least modular)
> drm drivers. The debug prints can be reinstated by manually frobbing
> /sys/module/drm/parameters/debug after the fact, but at that point the
> damage is done and all debugs from driver probe are lost. This makes
> drivers totally undebuggable.
> 
> There's a more complete fix in progress [1], with further details, but
> we need this fixed in stable kernels. Mark the feature as broken and
> disable it by default, with hopes distros follow suit and disable it as
> well.
> 
> [1] https://lore.kernel.org/r/20230125203743.564009-1-jim.cromie@gmail.com
> 
> Fixes: 84ec67288c10 ("drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro")
> Cc: Jim Cromie <jim.cromie@gmail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.1+
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index f42d4c6a19f2..dc0f94f02a82 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -52,7 +52,8 @@ config DRM_DEBUG_MM
>  
>  config DRM_USE_DYNAMIC_DEBUG
>  	bool "use dynamic debug to implement drm.debug"
> -	default y
> +	default n
> +	depends on BROKEN
>  	depends on DRM
>  	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
>  	depends on JUMP_LABEL

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
