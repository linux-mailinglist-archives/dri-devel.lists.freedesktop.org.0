Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ED33A633D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 13:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B1289DEC;
	Mon, 14 Jun 2021 11:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5A489DEC
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 11:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RQhawg/BREW1jX9Ukuz4joj4NbCmuOISlWm7hbfacnM=; b=XJJkPJBEtuuZNvS6hMxtEl+cP7
 0ytd3GUH35kZ6nq96w3JZZmLqhFvT0QHT+1ln8IP4FBVShz077j7c7MGeDcHrppiz8EZVBaG9bwZd
 uVbTcQDCXEAgzELnGCck/h0ba8MIV2+omtpf1f/7LJ2XJUXRsuLshe/MVmXrPx/jMxWPHND7lBt49
 cR9dFmWphpX+d1J/FNHU9O3se9gjWTB1HDcsLzqgTAudgMDhH7ZgyMVNl073N/yWOy2slf6E4j5R9
 DLVK2PI/tKFKyfE3Q/SYEuXV+I6E4fUeVucjKzEoBwO6i4pERg77Zz6mBS9TTg8MWsqOvLOTfSsfZ
 to945nXA==;
Received: from [2a01:799:95f:4600:cca0:57ac:c55d:a485] (port=62969)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lskTL-0000yH-JV; Mon, 14 Jun 2021 13:09:39 +0200
Subject: Re: [PATCH 2/2] drm/panel: s6e63m0: Switch to DBI abstraction for SPI
To: Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
References: <20210611214243.669892-1-linus.walleij@linaro.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <94e475b5-b4f5-78fe-24b1-94a44c76744b@tronnes.org>
Date: Mon, 14 Jun 2021 13:09:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210611214243.669892-1-linus.walleij@linaro.org>
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



Den 11.06.2021 23.42, skrev Linus Walleij:
> The SPI access to s6e63m0 is using the DBI protocol, so switch
> to using the elaborate DBI protocol implementation in the DRM
> DBI helper library.
> 
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c
> index 326deb3177b6..293c18ee448a 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c
> @@ -5,62 +5,42 @@
>  #include <linux/spi/spi.h>
>  #include <linux/delay.h>
>  
> +#include <drm/drm_mipi_dbi.h>
>  #include <drm/drm_print.h>
>  
>  #include "panel-samsung-s6e63m0.h"
>  
> -#define DATA_MASK	0x100
> +static const u8 s6e63m0_dbi_read_commands[] = {
> +	MCS_READ_ID1,
> +	MCS_READ_ID2,
> +	MCS_READ_ID3,
> +	0, /* sentinel */
> +};
>  
> -static int s6e63m0_spi_dcs_read(struct device *dev, const u8 cmd, u8 *data)
> +static int s6e63m0_spi_dcs_read(struct device *dev, void *trsp,
> +				const u8 cmd, u8 *data)
>  {
> -	struct spi_device *spi = to_spi_device(dev);
> -	u16 buf[1];
> -	u16 rbuf[1];
> +	struct mipi_dbi *dbi = trsp;
>  	int ret;
>  
> -	/* SPI buffers are always in CPU order */
> -	buf[0] = (u16)cmd;
> -	ret = spi_write_then_read(spi, buf, 2, rbuf, 2);
> -	dev_dbg(dev, "READ CMD: %04x RET: %04x\n", buf[0], rbuf[0]);
> -	if (!ret)
> -		/* These high 8 bits of the 9 contains the readout */
> -		*data = (rbuf[0] & 0x1ff) >> 1;
> +	ret = mipi_dbi_command_read(dbi, cmd, data);
> +	if (ret)
> +		dev_err(dev, "error on DBI read command %02x\n", cmd);
> +	else
> +		dev_dbg(dev, "read DBI %02x\n", *data);

You could drop this dev_dbg() and set drm.debug=2 instead to get the
same info. See MIPI_DBI_DEBUG_COMMAND().

>  
>  	return ret;
>  }
>  
> -static int s6e63m0_spi_write_word(struct device *dev, u16 data)
> -{
> -	struct spi_device *spi = to_spi_device(dev);
> -
> -	/* SPI buffers are always in CPU order */
> -	return spi_write(spi, &data, 2);
> -}
> -
> -static int s6e63m0_spi_dcs_write(struct device *dev, const u8 *data, size_t len)
> +static int s6e63m0_spi_dcs_write(struct device *dev, void *trsp,
> +				 const u8 *data, size_t len)
>  {
> -	int ret = 0;
> +	struct mipi_dbi *dbi = trsp;
> +	int ret;
>  
>  	dev_dbg(dev, "SPI writing dcs seq: %*ph\n", (int)len, data);

Same here MIPI_DBI_DEBUG_COMMAND() can print this.

>  
> -	/*
> -	 * This sends 9 bits with the first bit (bit 8) set to 0
> -	 * This indicates that this is a command. Anything after the
> -	 * command is data.
> -	 */
> -	ret = s6e63m0_spi_write_word(dev, *data);
> -
> -	while (!ret && --len) {
> -		++data;
> -		/* This sends 9 bits with the first bit (bit 8) set to 1 */
> -		ret = s6e63m0_spi_write_word(dev, *data | DATA_MASK);
> -	}
> -
> -	if (ret) {
> -		dev_err(dev, "SPI error %d writing dcs seq: %*ph\n", ret,
> -			(int)len, data);
> -	}
> -
> +	ret = mipi_dbi_command_stackbuf(dbi, data[0], (data + 1), (len - 1));

_stackbuf was not meant to be used by drivers, but I see that the driver
layering gives you no choice (except open coding ofc). So:

Acked-by: Noralf Trønnes <noralf@tronnes.org>

Noralf.

>  	usleep_range(300, 310);
>  
>  	return ret;
