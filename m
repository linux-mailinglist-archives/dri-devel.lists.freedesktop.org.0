Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3021AE284
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 18:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D353E6E0ED;
	Fri, 17 Apr 2020 16:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D386E6E0ED
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 16:50:50 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E83F780502;
 Fri, 17 Apr 2020 18:50:42 +0200 (CEST)
Date: Fri, 17 Apr 2020 18:50:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 6/8] drm: decouple from CONFIG_FB
Message-ID: <20200417165041.GA30483@ravnborg.org>
References: <20200417155553.675905-1-arnd@arndb.de>
 <20200417155553.675905-7-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417155553.675905-7-arnd@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=9L1dKAkHxsO5wRH54ekA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
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
Cc: marex@denx.de, linux-renesas-soc@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dsd@laptop.org, Nicolas Pitre <nico@fluxnic.net>,
 airlied@linux.ie, masahiroy@kernel.org, jfrederich@gmail.com,
 Saeed Mahameed <saeedm@mellanox.com>, thellstrom@vmware.com,
 haojian.zhuang@gmail.com, Andrzej Hajda <a.hajda@samsung.com>,
 kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
 dri-devel@lists.freedesktop.org, linux-graphics-maintainer@vmware.com,
 robert.jarzmik@free.fr, Jason Gunthorpe <jgg@ziepe.ca>, daniel@zonque.org,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd.

On Fri, Apr 17, 2020 at 05:55:51PM +0200, Arnd Bergmann wrote:
> CONFIG_DRM_KMS_FB_HELPER selects CONFIG_FB, which is something it
> really should not, to avoid circular dependencies and accidentally
> including potentially dangerous user interfaces in the kernel,
> so change this into a 'depends on' check.
> 
> Two device drivers currently select CONFIG_DRM_KMS_FB_HELPER, but
> as far as I can tell, they do not really need to any more, so those
> selects can be removed.
> 
> This leaves DRM_FBDEV_EMULATION as the only thing that rightfully
> selects CONFIG_DRM_KMS_FB_HELPER, and this now has to depend on
> CONFIG_FB and its dependencies.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/Kconfig       | 5 +++--
>  drivers/gpu/drm/mxsfb/Kconfig | 1 -
>  drivers/gpu/drm/zte/Kconfig   | 1 -
>  3 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 43594978958e..7c3109133685 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -80,7 +80,7 @@ config DRM_KMS_HELPER
>  config DRM_KMS_FB_HELPER
>  	bool
>  	depends on DRM_KMS_HELPER
> -	select FB
> +	depends on FB
>  	select FRAMEBUFFER_CONSOLE if !EXPERT
>  	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
>  	select FB_SYS_FOPS
> @@ -111,7 +111,8 @@ config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>  
>  config DRM_FBDEV_EMULATION
>  	bool "Enable legacy fbdev support for your modesetting driver"
> -	depends on DRM
> +	depends on DRM && FB
> +	depends on FB=y || DRM=m
>  	select DRM_KMS_HELPER
>  	select DRM_KMS_FB_HELPER
>  	default y
This statement:

	depends on DRM && FB

tell us that both symbols must be either y or m. Any combination of y
and m will do the trick


Then we have this statement:

	depends on FB=y || DRM=m

It tells us that either FB equals y or DRM equals m.

So we have following table

	FB	DRM	Result
	n	n	n
	n	y	n
	n	m	n
	y	n	n
	y	y	y
	y	m	y
	m	n	n
	m	y	N
	m	m	y

So what this try to say is that we cannot have FB a module while DRM is
built-in (marked N in the above).

Could you explain in the changelog why this combination is not good.
(Or tell me if my analysis was flawed).

With this fixed (assuming I am right):
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

> diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
> index 0dca8f27169e..33916b7b2c50 100644
> --- a/drivers/gpu/drm/mxsfb/Kconfig
> +++ b/drivers/gpu/drm/mxsfb/Kconfig
> @@ -10,7 +10,6 @@ config DRM_MXSFB
>  	depends on COMMON_CLK
>  	select DRM_MXS
>  	select DRM_KMS_HELPER
> -	select DRM_KMS_FB_HELPER
>  	select DRM_KMS_CMA_HELPER
>  	select DRM_PANEL
>  	help
> diff --git a/drivers/gpu/drm/zte/Kconfig b/drivers/gpu/drm/zte/Kconfig
> index 90ebaedc11fd..aa8594190b50 100644
> --- a/drivers/gpu/drm/zte/Kconfig
> +++ b/drivers/gpu/drm/zte/Kconfig
> @@ -3,7 +3,6 @@ config DRM_ZTE
>  	tristate "DRM Support for ZTE SoCs"
>  	depends on DRM && ARCH_ZX
>  	select DRM_KMS_CMA_HELPER
> -	select DRM_KMS_FB_HELPER
>  	select DRM_KMS_HELPER
>  	select SND_SOC_HDMI_CODEC if SND_SOC
>  	select VIDEOMODE_HELPERS
> -- 
> 2.26.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
