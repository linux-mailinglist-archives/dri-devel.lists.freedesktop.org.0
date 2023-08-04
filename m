Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB5E7708C4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 21:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C964310E75D;
	Fri,  4 Aug 2023 19:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C11310E75D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 19:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=aREuGkA6w6ZICk1lacHviCDE3QhBS3vYAP3oRmfIz2g=; b=UN53eR/oleMlzX8th93EgvH1hM
 h6VWPT4wWPTy7mBKrB9su6MXRV2bAgQBHnQMUihJ7UVVSfPDTKZ0C4UQ9fens3ReZLB6hzTsm6uDP
 Jwd7saRxo3qI6xqyc/vrFkg+lrY3cZvqXwMx0Et4EmwrCurvVM3As9CMIHt2b4YZZMueGLcJOfpS0
 ZXjkQEf2cL81PovwJVdvKHSpJ55FhflIq80v3Fbv1u5ATYFo3di+ETGZS95UwuQ8HntRq/z5/yphT
 sj8qdXeBvgSqaT5gT45X/+us0kOW0ufyQINfBmPXOO0OmamY0gTajROqUyI52CVZmPRPwjuCXZKWC
 GlYC7e8g==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qS0G5-00D5rN-31; Fri, 04 Aug 2023 19:14:45 +0000
Message-ID: <77cdbbed-e64d-0c55-bf0a-6dfcfbdb8b20@infradead.org>
Date: Fri, 4 Aug 2023 12:14:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm: Drop select FRAMEBUFFER_CONSOLE for
 DRM_FBDEV_EMULATION
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20230804125156.1387542-1-javierm@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230804125156.1387542-1-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Helge Deller <deller@gmx.de>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/4/23 05:51, Javier Martinez Canillas wrote:
> The commit c242f48433e7 ("drm: Make FB_CORE to be selected if DRM fbdev
> emulation is enabled") changed DRM_FBDEV_EMULATION from 'depends on FB'
> to an effective 'select FB_CORE', so any config that previously had DRM=y
> and FB=n now has FB_CORE=y and FRAMEBUFFER_CONSOLE=y.
> 
> This leads to unmet direct dependencies detected for FRAMEBUFFER_CONSOLE
> as reported by Arthur Grillo, e.g:
> 
> WARNING: unmet direct dependencies detected for FRAMEBUFFER_CONSOLE
>   Depends on [n]: VT [=n] && FB_CORE [=y] && !UML [=y]
>   Selected by [y]:
>   - DRM_FBDEV_EMULATION [=y] && HAS_IOMEM [=y] && DRM [=y] && !EXPERT [=n]
> 
> Arnd Bergmann suggests to drop the select FRAMEBUFFER_CONSOLE for the
> DRM_FBDEV_EMULATION Kconfig symbol, since a possible use case could
> be to enable DRM fbdev emulation but without a framebuffer console.
> 
> Fixes: c242f48433e7 ("drm: Make FB_CORE to be selected if DRM fbdev emulation is enabled")
> Reported-by: Arthur Grillo <arthurgrillo@riseup.net>
> Closes: https://lore.kernel.org/dri-devel/20230726220325.278976-1-arthurgrillo@riseup.net
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
> 
>  drivers/gpu/drm/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index b51c6a141dfa..2a44b9419d4d 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -135,7 +135,6 @@ config DRM_DEBUG_MODESET_LOCK
>  config DRM_FBDEV_EMULATION
>  	bool "Enable legacy fbdev support for your modesetting driver"
>  	depends on DRM
> -	select FRAMEBUFFER_CONSOLE if !EXPERT
>  	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
>  	default y
>  	help

-- 
~Randy
