Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F83348AD40
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 13:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF9B10EC24;
	Tue, 11 Jan 2022 12:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5F310EC24
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 12:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 Subject:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jyL93/6BnSzZVNk0d+pZVStpOnNWGIWV0cp232YBOgI=; b=mT2tFt8Aj6L1bsweeK606aleQA
 0q/CwoWO+evMQh6GF50pJ9PCCCJyuXmOhrRYLTjQTDKpOhN5D1TYzPaDFKoepp28vQrmdjWG6wUW8
 LGlw4YnNeBeXX7pKtIYZ3/rLRKgUBssnd7als6RGu0CxyV46XVwUK4IDmmPFA3ITABbriBLqZUyX7
 UWENmSQBWStSeVvtNjuAYCql48TE2QdR6owbFy1pu34zh7hD38mCeIMvQV128RgQ14GVHI+BlaVUf
 s1SRoWZUU6eUnGUkYz/h6+kwWvf5T6XHSBuiDwqgK/Ebb/WdPwu+Hoa2GmokqiDnSf/G5RdV5o7Ly
 1/sUx6RQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:50898
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1n7Frc-0003rr-1p; Tue, 11 Jan 2022 13:02:56 +0100
Message-ID: <a9e2d66e-1a85-b61f-ee3b-ca7032e0516f@tronnes.org>
Date: Tue, 11 Jan 2022 13:02:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
To: tzimmermann@suse.de
References: <20211106193509.17472-2-tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/2] drm/mipi-dbi: Remove dependency on GEM CMA helper
 library
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20211106193509.17472-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-aspeed@lists.ozlabs.org, airlied@linux.ie, daniel.vetter@ffwll.ch,
 naresh.kamboju@linaro.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, noralf@tronnes.org, marcel@ziswiler.com,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> The MIPI DBI helpers access struct drm_gem_cma_object.vaddr in a
> few places. Replace all instances with the correct generic GEM
> functions. Use drm_gem_fb_vmap() for mapping a framebuffer's GEM
> objects and drm_gem_fb_vunmap() for unmapping them. This removes
> the dependency on CMA helpers within MIPI DBI.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_mipi_dbi.c | 34 +++++++++++++++++++++++++---------
>  1 file changed, 25 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c
b/drivers/gpu/drm/drm_mipi_dbi.c
> index 71b646c4131f..f80fd6c0ccf8 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -15,9 +15,10 @@
>  #include <drm/drm_connector.h>
>  #include <drm/drm_damage_helper.h>
>  #include <drm/drm_drv.h>
> -#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_file.h>
>  #include <drm/drm_format_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_gem.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_mipi_dbi.h>
>  #include <drm/drm_modes.h>
> @@ -200,13 +201,19 @@ int mipi_dbi_buf_copy(void *dst, struct
drm_framebuffer *fb,
>  		      struct drm_rect *clip, bool swap)
>  {
>  	struct drm_gem_object *gem = drm_gem_fb_get_obj(fb, 0);
> -	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(gem);
> -	void *src = cma_obj->vaddr;
> +	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
> +	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
> +	void *src;
>  	int ret;
>
>  	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
>  	if (ret)
>  		return ret;
> +	src = data[0].vaddr; /* TODO: Use mapping abstraction properly */

This assignment should be after the _vmap() call. The MIPI DBI drivers
are currently broken because of this.

Noralf.

> +
> +	ret = drm_gem_fb_vmap(fb, map, data);
> +	if (ret)
> +		goto out_drm_gem_fb_end_cpu_access;
>
>  	switch (fb->format->format) {
>  	case DRM_FORMAT_RGB565:
> @@ -221,9 +228,11 @@ int mipi_dbi_buf_copy(void *dst, struct
drm_framebuffer *fb,
>  	default:
>  		drm_err_once(fb->dev, "Format is not supported: %p4cc\n",
>  			     &fb->format->format);
> -		return -EINVAL;
> +		ret = -EINVAL;
>  	}
>
> +	drm_gem_fb_vunmap(fb, map);
> +out_drm_gem_fb_end_cpu_access:
>  	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
>
>  	return ret;
>
