Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E772ECBFB
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 09:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5662D6E438;
	Thu,  7 Jan 2021 08:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3694789C9B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 17:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=yQ5itrDnbg9igQ8my+7e84Kmy2cQCcjsSyJKHJrFm18=; b=x8EiuOhYHMBT7tPc8ulaUpkh6R
 gPp0rwPaWotassVhZPxkOceUfoH4j+Z9kIN/Ccu00UaB/ydVgSBbfyys8POsj0psPnNzICHkRwrMT
 pVEM90rFkgO5+xJLNRyD9a7LRu1ANLO8uD+N9bSyoXtHFRHHCQfjyYK4RHT1ADsof2M+Fqw2yTGYu
 dn83a+hI8aShO6M6WVUsfo5U4gO48WX/REmvtJeVGPKC2BE9RpdBUpBhEjAwU/nCupaTAzAmz+TDX
 38F6yufpaqIX4BM7Tl3d5DFB0uSAyGwqFq3HFh400f8/TYYotiaGJh2PQoTTQ1yEO2pC8GSxIIL5q
 TrB2MVqA==;
Received: from [2601:1c0:6280:3f0::79df]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxCjn-00051X-S5; Wed, 06 Jan 2021 17:36:48 +0000
Subject: Re: [PATCH] drm/imx: dw_hdmi-imx: depend on OF to fix randconfig
 compile tests on x86_64
To: Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20210106173003.14117-1-p.zabel@pengutronix.de>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4f34e8bb-6b74-d2d0-83dd-c19815748cb1@infradead.org>
Date: Wed, 6 Jan 2021 09:36:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210106173003.14117-1-p.zabel@pengutronix.de>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 07 Jan 2021 08:53:13 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/6/21 9:30 AM, Philipp Zabel wrote:
> The i.MX6 HDMI driver uses of_drm_find_bridge() and thus cannot be built
> with CONFIG_OF disabled:
> 
>     ld: drivers/gpu/drm/imx/dw_hdmi-imx.o: in function `dw_hdmi_imx_probe':
>     dw_hdmi-imx.c:(.text+0x29f): undefined reference to `of_drm_find_bridge'
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Fixes: c805ec7eb210 ("drm/imx: dw_hdmi-imx: move initialization into probe")
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
>  drivers/gpu/drm/imx/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/imx/Kconfig b/drivers/gpu/drm/imx/Kconfig
> index 73fe2bc5633c..b5fa0e45a839 100644
> --- a/drivers/gpu/drm/imx/Kconfig
> +++ b/drivers/gpu/drm/imx/Kconfig
> @@ -37,7 +37,7 @@ config DRM_IMX_LDB
>  config DRM_IMX_HDMI
>  	tristate "Freescale i.MX DRM HDMI"
>  	select DRM_DW_HDMI
> -	depends on DRM_IMX
> +	depends on DRM_IMX && OF
>  	help
>  	  Choose this if you want to use HDMI on i.MX6.
>  
> 


-- 
~Randy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
