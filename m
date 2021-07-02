Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D133BA2BE
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 17:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8EEF6E03F;
	Fri,  2 Jul 2021 15:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB726E03F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 15:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mmTOEUV4IIYNNjZTC+YtfI4kr3V+cNDpvDGbvFpd9Zw=; b=IxONQtZI/HSGHfyWsp+PddHcq2
 XEchCgYOVo5FNMbykZBvBO6OUJcJbnkr0cHxUhIQNOVC18SS5+rwXhiByFrs0g4w3y4Vws26ZTn3E
 oEZX2lzaFuCUuYoQ4CCGIHyetr0VD25iMatFvysbb9lx1LjbZ46cs/KLgvN0+sk1XekfIYikMwiaa
 8uMQpxNcc5LXdfMU9KQ1i/VJwiBeYhBDogXsSnLga0zxoH2Y6FNbsF1gKRdGUcD/aSUy9wFZJABYY
 W0E3MWGuG8GJf63gzLBH9qbFeqsr0m/BBm7ieA8gvf6m+e0b0oE+VTBCTGBnxqztpXPx8s0SN3EI+
 sy5+bbLg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:52472
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lzL4h-0003nD-19; Fri, 02 Jul 2021 17:27:27 +0200
Subject: Re: [PATCH v3] drm/dbi: Print errors for mipi_dbi_command()
To: Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
References: <20210702135601.3952726-1-linus.walleij@linaro.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <f197060b-f737-a5af-57d8-9986596e00f4@tronnes.org>
Date: Fri, 2 Jul 2021 17:27:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702135601.3952726-1-linus.walleij@linaro.org>
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



Den 02.07.2021 15.56, skrev Linus Walleij:
> The macro mipi_dbi_command() does not report errors unless you wrap it
> in another macro to do the error reporting.
> 
> Report a rate-limited error so we know what is going on.
> 
> Drop the only user in DRM using mipi_dbi_command() and actually checking
> the error explicitly, let it use mipi_dbi_command_buf() directly
> instead.

You forgot to remove this section.

With that fixed:

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>

> 
> After this any code wishing to send command arrays can rely on
> mipi_dbi_command() providing an appropriate error message if something
> goes wrong.
> 
> Suggested-by: Noralf Trønnes <noralf@tronnes.org>
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Make the macro actually return the error value if need be, by
>   putting a single ret; at the end of the macro. (Neat trick from
>   StackOverflow!)
> - Switch the site where I switched mipi_dbi_command() to
>   mipi_dbi_command_buf() back to what it was.
> - Print the failed command in the error message.
> - Put the dbi in (parens) since drivers/gpu/drm/tiny/st7586.c was
>   passing &dbidev->dbi as parameter to mipi_dbi_command()
>   and this would expand to
>   struct device *dev = &&dbidev->dbi->spi->dev
>   which can't be parsed but
>   struct device *dev = &(&dbidev->dbi)->spi-dev;
>   should work. I hope.
> ChangeLog v1->v2:
> - Fish out the struct device * from the DBI SPI client and use
>   that to print the errors associated with the SPI device.
> ---
>  include/drm/drm_mipi_dbi.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
> index f543d6e3e822..05e194958265 100644
> --- a/include/drm/drm_mipi_dbi.h
> +++ b/include/drm/drm_mipi_dbi.h
> @@ -183,7 +183,12 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
>  #define mipi_dbi_command(dbi, cmd, seq...) \
>  ({ \
>  	const u8 d[] = { seq }; \
> -	mipi_dbi_command_stackbuf(dbi, cmd, d, ARRAY_SIZE(d)); \
> +	struct device *dev = &(dbi)->spi->dev;	\
> +	int ret; \
> +	ret = mipi_dbi_command_stackbuf(dbi, cmd, d, ARRAY_SIZE(d)); \
> +	if (ret) \
> +		dev_err_ratelimited(dev, "error %d when sending command %#02x\n", ret, cmd); \
> +	ret; \
>  })
>  
>  #ifdef CONFIG_DEBUG_FS
> 
