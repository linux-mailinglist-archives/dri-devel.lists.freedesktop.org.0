Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA95D2450C4
	for <lists+dri-devel@lfdr.de>; Sat, 15 Aug 2020 10:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2626E04A;
	Sat, 15 Aug 2020 08:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05C16E04A
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 08:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1597478916;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=HLQXrg/IC9PqTIwbfgIO2LCl6yVYXFoV7ivlVfDOZ30=;
 b=oI3ZwHZ/5oEjAmUHY5cQDTPkFgJnQggagZTKMUQfIJiFXoBslq0QXhSuBba+tM/A9F
 iZO0Avngmhq2mtgpAaN/1bRmFaCZX2Ge8YHMkjr3BYGvGEOgf3ss1rvv7EhnUmB1iyK5
 5U0md+HwCaMwqvdtENsCAINco2n9G9DNfFLUov9KAyotCYjLLeGlsI9gyoR+VhlqWE0H
 /StH1YHnkjNu9aabSunwGjiUnV6tnPMmF2CUiezA3JTovxodKWP6ZPDNst1SRbID2daC
 jrAbpLRy74KAfJvNJOQsFlKHdW3NMtzUx7i3HKkqo76YIrN9s3c3f3Sggh907Z438HP+
 bOEA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j8IcfFBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id Y0939ew7F88J6OE
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 15 Aug 2020 10:08:19 +0200 (CEST)
Date: Sat, 15 Aug 2020 10:08:13 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] drm/mcde: Retry DSI read/write transactions
Message-ID: <20200815080813.GA850@gerhold.net>
References: <20200814194451.3494294-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200814194451.3494294-1-linus.walleij@linaro.org>
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
Cc: linux-arm-kernel@lists.infradead.org, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 14, 2020 at 09:44:51PM +0200, Linus Walleij wrote:
> The vendor driver makes a few retries on read DSI
> transactions, something that is needed especially in
> case of read (such as reading the panel MTP ID) while
> the panel is running in video mode. This happens on
> the Samsung s6e63m0 panel on the Golden device.
> 
> Retry reads and writes alike three times.
> 
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Retry three times.
> - Only retry the actual command transmission like the vendor
>   driver does, no need to set up all registers and do checks
>   all over. Break out a part of the mcde_dsi_host_transfer()
>   function to achieve this.
> ---
>  drivers/gpu/drm/mcde/mcde_dsi.c | 158 +++++++++++++++++++-------------
>  1 file changed, 92 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
> index 4ce8cc5f0be2..b3c5d3cbda92 100644
> --- a/drivers/gpu/drm/mcde/mcde_dsi.c
> +++ b/drivers/gpu/drm/mcde/mcde_dsi.c
> @@ -208,79 +208,16 @@ static int mcde_dsi_host_detach(struct mipi_dsi_host *host,
>  	 (type == MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM) || \
>  	 (type == MIPI_DSI_DCS_READ))
>  
> -static ssize_t mcde_dsi_host_transfer(struct mipi_dsi_host *host,
> -				      const struct mipi_dsi_msg *msg)
> +static int mcde_dsi_execute_transfer(struct mcde_dsi *d,
> +				     const struct mipi_dsi_msg *msg)
>  {
> -	struct mcde_dsi *d = host_to_mcde_dsi(host);
>  	const u32 loop_delay_us = 10; /* us */
> -	const u8 *tx = msg->tx_buf;
>  	u32 loop_counter;
>  	size_t txlen = msg->tx_len;
>  	size_t rxlen = msg->rx_len;
> +	int i;
>  	u32 val;
>  	int ret;
> -	int i;
> -
> -	if (txlen > 16) {
> -		dev_err(d->dev,
> -			"dunno how to write more than 16 bytes yet\n");
> -		return -EIO;
> -	}
> -	if (rxlen > 4) {
> -		dev_err(d->dev,
> -			"dunno how to read more than 4 bytes yet\n");
> -		return -EIO;
> -	}
> -
> -	dev_dbg(d->dev,
> -		"message to channel %d, write %zd bytes read %zd bytes\n",
> -		msg->channel, txlen, rxlen);
> -
> -	/* Command "nature" */
> -	if (MCDE_DSI_HOST_IS_READ(msg->type))
> -		/* MCTL_MAIN_DATA_CTL already set up */
> -		val = DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_NAT_READ;
> -	else
> -		val = DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_NAT_WRITE;
> -	/*
> -	 * More than 2 bytes will not fit in a single packet, so it's
> -	 * time to set the "long not short" bit. One byte is used by
> -	 * the MIPI DCS command leaving just one byte for the payload
> -	 * in a short package.
> -	 */
> -	if (mipi_dsi_packet_format_is_long(msg->type))
> -		val |= DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_LONGNOTSHORT;
> -	val |= 0 << DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_ID_SHIFT;
> -	val |= txlen << DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_SIZE_SHIFT;
> -	val |= DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_LP_EN;
> -	val |= msg->type << DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_HEAD_SHIFT;
> -	writel(val, d->regs + DSI_DIRECT_CMD_MAIN_SETTINGS);
> -
> -	/* MIPI DCS command is part of the data */
> -	if (txlen > 0) {
> -		val = 0;
> -		for (i = 0; i < 4 && i < txlen; i++)
> -			val |= tx[i] << (i * 8);
> -	}
> -	writel(val, d->regs + DSI_DIRECT_CMD_WRDAT0);
> -	if (txlen > 4) {
> -		val = 0;
> -		for (i = 0; i < 4 && (i + 4) < txlen; i++)
> -			val |= tx[i + 4] << (i * 8);
> -		writel(val, d->regs + DSI_DIRECT_CMD_WRDAT1);
> -	}
> -	if (txlen > 8) {
> -		val = 0;
> -		for (i = 0; i < 4 && (i + 8) < txlen; i++)
> -			val |= tx[i + 8] << (i * 8);
> -		writel(val, d->regs + DSI_DIRECT_CMD_WRDAT2);
> -	}
> -	if (txlen > 12) {
> -		val = 0;
> -		for (i = 0; i < 4 && (i + 12) < txlen; i++)
> -			val |= tx[i + 12] << (i * 8);
> -		writel(val, d->regs + DSI_DIRECT_CMD_WRDAT3);
> -	}
>  
>  	writel(~0, d->regs + DSI_DIRECT_CMD_STS_CLR);
>  	writel(~0, d->regs + DSI_CMD_MODE_STS_CLR);
> @@ -297,6 +234,7 @@ static ssize_t mcde_dsi_host_transfer(struct mipi_dsi_host *host,
>  			usleep_range(loop_delay_us, (loop_delay_us * 3) / 2);
>  		if (!loop_counter) {
>  			dev_err(d->dev, "DSI read timeout!\n");
> +			/* Set exit code and retry */
>  			return -ETIME;
>  		}
>  	} else {
> @@ -307,6 +245,7 @@ static ssize_t mcde_dsi_host_transfer(struct mipi_dsi_host *host,
>  			usleep_range(loop_delay_us, (loop_delay_us * 3) / 2);
>  
>  		if (!loop_counter) {
> +			/* Set exit code and retry */
>  			dev_err(d->dev, "DSI write timeout!\n");
>  			return -ETIME;
>  		}
> @@ -348,6 +287,93 @@ static ssize_t mcde_dsi_host_transfer(struct mipi_dsi_host *host,
>  		ret = rdsz;
>  	}
>  
> +	/* Successful transmission */
> +	return ret;
> +}
> +
> +static ssize_t mcde_dsi_host_transfer(struct mipi_dsi_host *host,
> +				      const struct mipi_dsi_msg *msg)
> +{
> +	struct mcde_dsi *d = host_to_mcde_dsi(host);
> +	const u8 *tx = msg->tx_buf;
> +	size_t txlen = msg->tx_len;
> +	size_t rxlen = msg->rx_len;
> +	unsigned int retries = 0;
> +	u32 val;
> +	int ret;
> +	int i;
> +
> +	if (txlen > 16) {
> +		dev_err(d->dev,
> +			"dunno how to write more than 16 bytes yet\n");
> +		return -EIO;
> +	}
> +	if (rxlen > 4) {
> +		dev_err(d->dev,
> +			"dunno how to read more than 4 bytes yet\n");
> +		return -EIO;
> +	}
> +
> +	dev_dbg(d->dev,
> +		"message to channel %d, write %zd bytes read %zd bytes\n",
> +		msg->channel, txlen, rxlen);
> +
> +	/* Command "nature" */
> +	if (MCDE_DSI_HOST_IS_READ(msg->type))
> +		/* MCTL_MAIN_DATA_CTL already set up */
> +		val = DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_NAT_READ;
> +	else
> +		val = DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_NAT_WRITE;
> +	/*
> +	 * More than 2 bytes will not fit in a single packet, so it's
> +	 * time to set the "long not short" bit. One byte is used by
> +	 * the MIPI DCS command leaving just one byte for the payload
> +	 * in a short package.
> +	 */
> +	if (mipi_dsi_packet_format_is_long(msg->type))
> +		val |= DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_LONGNOTSHORT;
> +	val |= 0 << DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_ID_SHIFT;
> +	val |= txlen << DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_SIZE_SHIFT;
> +	val |= DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_LP_EN;
> +	val |= msg->type << DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_HEAD_SHIFT;
> +	writel(val, d->regs + DSI_DIRECT_CMD_MAIN_SETTINGS);
> +
> +	/* MIPI DCS command is part of the data */
> +	if (txlen > 0) {
> +		val = 0;
> +		for (i = 0; i < 4 && i < txlen; i++)
> +			val |= tx[i] << (i * 8);
> +	}
> +	writel(val, d->regs + DSI_DIRECT_CMD_WRDAT0);
> +	if (txlen > 4) {
> +		val = 0;
> +		for (i = 0; i < 4 && (i + 4) < txlen; i++)
> +			val |= tx[i + 4] << (i * 8);
> +		writel(val, d->regs + DSI_DIRECT_CMD_WRDAT1);
> +	}
> +	if (txlen > 8) {
> +		val = 0;
> +		for (i = 0; i < 4 && (i + 8) < txlen; i++)
> +			val |= tx[i + 8] << (i * 8);
> +		writel(val, d->regs + DSI_DIRECT_CMD_WRDAT2);
> +	}
> +	if (txlen > 12) {
> +		val = 0;
> +		for (i = 0; i < 4 && (i + 12) < txlen; i++)
> +			val |= tx[i + 12] << (i * 8);
> +		writel(val, d->regs + DSI_DIRECT_CMD_WRDAT3);
> +	}
> +
> +	while (retries < 3) {
> +		ret = mcde_dsi_execute_transfer(d, msg);
> +		if (ret >= 0)
> +			break;
> +		retries++;
> +	}

It might be a bit nicer to write this as a for loop, i.e.

	for (retries = 0; retries < 3; retries++) {
		ret = mcde_dsi_execute_transfer(d, msg);
		if (ret >= 0)
			break;
	}

But I guess it does not make much of a difference here.

Just a thought, looks good to me otherwise!
Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

Thanks!
Stephan

> +	if (ret < 0 && retries)
> +		dev_err(d->dev, "gave up after %d retries\n", retries);
> +
> +	/* Clear any errors */
>  	writel(~0, d->regs + DSI_DIRECT_CMD_STS_CLR);
>  	writel(~0, d->regs + DSI_CMD_MODE_STS_CLR);
>  
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
