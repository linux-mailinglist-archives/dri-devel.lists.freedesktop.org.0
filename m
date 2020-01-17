Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2243C142E70
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 16:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FDD89B3C;
	Mon, 20 Jan 2020 15:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 341 seconds by postgrey-1.36 at gabe;
 Mon, 20 Jan 2020 15:10:56 UTC
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3163D89B3C;
 Mon, 20 Jan 2020 15:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id A5C71FB02;
 Mon, 20 Jan 2020 16:05:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8znXPdI71quQ; Mon, 20 Jan 2020 16:05:11 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id ED37240007; Fri, 17 Jan 2020 16:47:26 +0100 (CET)
Date: Fri, 17 Jan 2020 16:47:26 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 13/24] drm/etnaviv: reject timeouts with tv_nsec >=
 NSEC_PER_SEC
Message-ID: <20200117154726.GA328525@bogon.m.sigxcpu.org>
References: <20191213204936.3643476-1-arnd@arndb.de>
 <20191213205417.3871055-4-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213205417.3871055-4-arnd@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: y2038@lists.linaro.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Emil Velikov <emil.velikov@collabora.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Fri, Dec 13, 2019 at 09:53:41PM +0100, Arnd Bergmann wrote:
> Most kernel interfaces that take a timespec require normalized
> representation with tv_nsec between 0 and NSEC_PER_SEC.
> 
> Passing values larger than 0x100000000ull further behaves differently
> on 32-bit and 64-bit kernels, and can cause the latter to spend a long
> time counting seconds in timespec64_sub()/set_normalized_timespec64().
> 
> Reject those large values at the user interface to enforce sane and
> portable behavior.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index 1f9c01be40d7..95d72dc00280 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -297,6 +297,9 @@ static int etnaviv_ioctl_gem_cpu_prep(struct drm_device *dev, void *data,
>  	if (args->op & ~(ETNA_PREP_READ | ETNA_PREP_WRITE | ETNA_PREP_NOSYNC))
>  		return -EINVAL;
>  
> +	if (args->timeout.tv_nsec > NSEC_PER_SEC)
> +		return -EINVAL;
> +
>  	obj = drm_gem_object_lookup(file, args->handle);
>  	if (!obj)
>  		return -ENOENT;
> @@ -360,6 +363,9 @@ static int etnaviv_ioctl_wait_fence(struct drm_device *dev, void *data,
>  	if (args->flags & ~(ETNA_WAIT_NONBLOCK))
>  		return -EINVAL;
>  
> +	if (args->timeout.tv_nsec > NSEC_PER_SEC)
> +		return -EINVAL;
> +
>  	if (args->pipe >= ETNA_MAX_PIPES)
>  		return -EINVAL;
>  
> @@ -411,6 +417,9 @@ static int etnaviv_ioctl_gem_wait(struct drm_device *dev, void *data,
>  	if (args->flags & ~(ETNA_WAIT_NONBLOCK))
>  		return -EINVAL;
>  
> +	if (args->timeout.tv_nsec > NSEC_PER_SEC)
> +		return -EINVAL;
> +
>  	if (args->pipe >= ETNA_MAX_PIPES)
>  		return -EINVAL;
>

This breaks rendering here on arm64/gc7000 due to

ioctl(6, DRM_IOCTL_ETNAVIV_GEM_CPU_PREP or DRM_IOCTL_MSM_GEM_CPU_PREP, 0xfffff7888680) = -1 EINVAL (Invalid argument)
ioctl(6, DRM_IOCTL_ETNAVIV_GEM_CPU_FINI or DRM_IOCTL_QXL_CLIENTCAP, 0xfffff78885e0) = 0
ioctl(6, DRM_IOCTL_ETNAVIV_GEM_CPU_PREP or DRM_IOCTL_MSM_GEM_CPU_PREP, 0xfffff7888680) = -1 EINVAL (Invalid argument)
ioctl(6, DRM_IOCTL_ETNAVIV_GEM_CPU_FINI or DRM_IOCTL_QXL_CLIENTCAP, 0xfffff78885e0) = 0
ioctl(6, DRM_IOCTL_ETNAVIV_GEM_CPU_PREP or DRM_IOCTL_MSM_GEM_CPU_PREP, 0xfffff7888680) = -1 EINVAL (Invalid argument)
ioctl(6, DRM_IOCTL_ETNAVIV_GEM_CPU_FINI or DRM_IOCTL_QXL_CLIENTCAP, 0xfffff78885e0) = 0

This is due to

    get_abs_timeout(&req.timeout, 5000000000);

in etna_bo_cpu_prep which can exceed NSEC_PER_SEC.

Should i send a patch to revert that change since it breaks existing userspace?

Cheers,
 -- Guido

> -- 
> 2.20.0
> 
> _______________________________________________
> etnaviv mailing list
> etnaviv@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/etnaviv
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
