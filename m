Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D83DD3B9F6F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 13:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0331F89C99;
	Fri,  2 Jul 2021 11:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BCC89C96
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 11:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IvLgbPADdaEhabUlOo62i+twDYxle9LZKDhA5H+YLhw=; b=mi1Di69C++aXFeMQzc9E4eWIh8
 7/zsMrt9yHREMF/UuSq8o8TMvh6c54vfesifs9s6pmWyLZ0umF8X3P3ioXRFyuNGKVmOn3N9YoDiO
 myB1WIygMb+RvUUY3sD/4Yy3ysCe1Q5wYPdoP7oiHzuRVK4I7CNG25PkmKer/9DGDy6LOIZnyi4C8
 E11SmwA83ZOWWA/2NigUj7xedtRbmt1DAJlRroKDiovsTfANhOKt7txFUIhfMRqUR/UjUjjwTPsa1
 SsIaAy2gZCRucOZGU3vH2ef26fx8tKIsmA27v7erBbDEHCOZJqVuRmqwNjGOyb3YIbdrU8LplkamB
 VZIlo25w==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:52202
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lzGxM-0001rY-9b; Fri, 02 Jul 2021 13:03:36 +0200
Subject: Re: [PATCH v2] drm/dbi: Print errors for mipi_dbi_command()
To: Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
References: <20210702100455.3928920-1-linus.walleij@linaro.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <9f853dd6-ecdd-c587-7a48-4257a9eae110@tronnes.org>
Date: Fri, 2 Jul 2021 13:03:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702100455.3928920-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
Cc: Douglas Anderson <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 02.07.2021 12.04, skrev Linus Walleij:
> The macro mipi_dbi_command() does not report errors unless you wrap it
> in another macro to do the error reporting.
> 
> Report a rate-limited error so we know what is going on.
> 
> Drop the only user in DRM using mipi_dbi_command() and actually checking
> the error explicitly, let it use mipi_dbi_command_buf() directly
> instead.
> 
> After this any code wishing to send command arrays can rely on
> mipi_dbi_command() providing an appropriate error message if something
> goes wrong.
> 
> Suggested-by: Noralf Trønnes <noralf@tronnes.org>
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Fish out the struct device * from the DBI SPI client and use
>   that to print the errors associated with the SPI device.
> ---
>  drivers/gpu/drm/drm_mipi_dbi.c | 2 +-
>  include/drm/drm_mipi_dbi.h     | 6 +++++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index 3854fb9798e9..c7c1b75df190 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -645,7 +645,7 @@ static int mipi_dbi_poweron_reset_conditional(struct mipi_dbi_dev *dbidev, bool
>  		return 1;
>  
>  	mipi_dbi_hw_reset(dbi);
> -	ret = mipi_dbi_command(dbi, MIPI_DCS_SOFT_RESET);
> +	ret = mipi_dbi_command_buf(dbi, MIPI_DCS_SOFT_RESET, NULL, 0);
>  	if (ret) {
>  		DRM_DEV_ERROR(dev, "Failed to send reset command (%d)\n", ret);
>  		if (dbidev->regulator)
> diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
> index f543d6e3e822..f00cb9690cf2 100644
> --- a/include/drm/drm_mipi_dbi.h
> +++ b/include/drm/drm_mipi_dbi.h
> @@ -183,7 +183,11 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
>  #define mipi_dbi_command(dbi, cmd, seq...) \
>  ({ \
>  	const u8 d[] = { seq }; \
> -	mipi_dbi_command_stackbuf(dbi, cmd, d, ARRAY_SIZE(d)); \
> +	struct device *dev = &dbi->spi->dev; \
> +	int ret; \
> +	ret = mipi_dbi_command_stackbuf(dbi, cmd, d, ARRAY_SIZE(d)); \
> +	if (ret) \
> +		dev_err_ratelimited(dev, "error %d when sending command\n", ret); \

Nit: Printing the failing command would have been useful, like you did
in the driver macro.

>  })

I would have preferred if mipi_dbi_command could have returned the error
code. This indicates that it should be possible:
https://stackoverflow.com/questions/3532621/using-and-returning-output-in-c-macro

But I can live with this, but if drivers want to start checking the
error code we might have to rethink this.

But this works as things are now:

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
