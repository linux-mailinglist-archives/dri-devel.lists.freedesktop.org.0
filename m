Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9929FB836C4
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 10:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FA710E68D;
	Thu, 18 Sep 2025 08:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="hvLKUexk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id B81C010E3B8
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 08:04:53 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1127)
 id 2AEC820143D2; Thu, 18 Sep 2025 01:04:53 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2AEC820143D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1758182693;
 bh=MOUqalofeahNoTixGAy7MlIUq0vm6rw3ZxM2+iKViC8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hvLKUexkKhhudfDgCiJR9/sOFaWVEWKPP9hEWMRAtraYvzA0RCdCpXdnHFHXNyUYu
 gu8D8WyxWtIydi1/se18PBKm06RsicKFzjP0HEE8ei+uEeKox77APir+hjQCflT2Yv
 zEtlryxBuxLW7CPYUP/xsoyah5edP4SPU3g3P+fM=
Date: Thu, 18 Sep 2025 01:04:53 -0700
From: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 mhklinux@outlook.com, rdunlap@infradead.org,
 bartosz.golaszewski@linaro.org, gonzalo.silvalde@gmail.com,
 arnd@arndb.de, tzimmermann@suse.de, decui@microsoft.com,
 wei.liu@kernel.org, deller@gmx.de, kys@microsoft.com,
 haiyangz@microsoft.com
Subject: Re: [PATCH 1/2] fbdev/hyperv_fb: deprecate this in favor of Hyper-V
 DRM driver
Message-ID: <20250918080453.GA17773@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <E5C2A201B1BD>
 <1758117785-20653-1-git-send-email-ptsm@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1758117785-20653-1-git-send-email-ptsm@linux.microsoft.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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

On Wed, Sep 17, 2025 at 07:03:05AM -0700, Prasanna Kumar T S M wrote:
> The Hyper-V DRM driver is available since kernel version 5.14 and it
> provides full KMS support and fbdev emulation via the DRM fbdev helpers.
> Deprecate this driver in favor of Hyper-V DRM driver.
> 
> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> ---
>  drivers/video/fbdev/Kconfig     | 5 ++++-
>  drivers/video/fbdev/hyperv_fb.c | 2 ++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index c21484d15f0c..48c1c7417f6d 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -1773,13 +1773,16 @@ config FB_BROADSHEET
>  	  a bridge adapter.
>  
>  config FB_HYPERV
> -	tristate "Microsoft Hyper-V Synthetic Video support"
> +	tristate "Microsoft Hyper-V Synthetic Video support (DEPRECATED)"
>  	depends on FB && HYPERV
>  	select DMA_CMA if HAVE_DMA_CONTIGUOUS && CMA
>  	select FB_IOMEM_HELPERS_DEFERRED
>  	help
>  	  This framebuffer driver supports Microsoft Hyper-V Synthetic Video.
>  
> +	  This driver is deprecated, please use the Hyper-V DRM driver at
> +	  drivers/gpu/drm/hyperv (CONFIG_DRM_HYPERV) instead.
> +
>  config FB_SIMPLE
>  	tristate "Simple framebuffer support"
>  	depends on FB
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
> index 75338ffc703f..c99e2ea4b3de 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -1357,6 +1357,8 @@ static int __init hvfb_drv_init(void)
>  {
>  	int ret;
>  
> +	pr_warn("Deprecated: use Hyper-V DRM driver instead\n");
> +
>  	if (fb_modesetting_disabled("hyper_fb"))
>  		return -ENODEV;
>  
> -- 
> 2.49.0

Thanks for the patch. I hope it makes to the next LTS as planned.

Reviewed-by: Saurabh Sengar <ssengar@linux.microsoft.com>
