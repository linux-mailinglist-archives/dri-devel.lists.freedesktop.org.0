Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 452BB232F74
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 11:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3136E090;
	Thu, 30 Jul 2020 09:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675AB6E090
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 09:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596101135;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=aQ5BaG49UfFFTRVhU6L+vETZMDjHJjzpa0rBqOelmGU=;
 b=YXFBvND+2cf0S9M7pn+0cjl9maq99kdGmaPuNgyw0+xc4eY3cNoHjRN6tcbUQ0dW1P
 XGDd0sWnKkSrBlPZz78cFax3fYymDmq7ph09zqfmKNCXUwGV+Cp8EW0Y5TOwKn9oq26T
 D4Anf3muqgPMsclqorQzMZwqA6GnLYLjxsQjedCRHrMWlYTFrGlWbPCA8VV6ecT23sTL
 JZfDAHZDasxnUGo2EWrzhy0ObSOXV+u+V/U0O0S14QUD2Q41i03c/K/mqTyoNzKQaBsf
 7reN8Zu5b5b2BpD1aV4/2DqL+yjMxo5Oj8qA53Q8c1EvLNS8RyvL4jBv0r42ffnLPltP
 wGEw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j6Ic/CaIo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id Y0939ew6U9PHhQb
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 30 Jul 2020 11:25:17 +0200 (CEST)
Date: Thu, 30 Jul 2020 11:25:12 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/mcde: Retry DSI read/write transactions
Message-ID: <20200730092512.GA1826@gerhold.net>
References: <20200730081306.34783-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200730081306.34783-1-linus.walleij@linaro.org>
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

On Thu, Jul 30, 2020 at 10:13:06AM +0200, Linus Walleij wrote:
> The vendor driver makes a few retries on read DSI
> transactions, something that is needed especially in
> case of read (such as reading the panel MTP ID) while
> the panel is running in video mode. This happens on
> the Samsung s6e63m0 panel on the Golden device.
> 

So this fixes reads from the panel for samsung-golden?

> Retry reads and writes alike two times.
> 
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/mcde/mcde_dsi.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
> index 337c4c5e3947..76fecd7ab658 100644
> --- a/drivers/gpu/drm/mcde/mcde_dsi.c
> +++ b/drivers/gpu/drm/mcde/mcde_dsi.c
> @@ -207,8 +207,8 @@ static int mcde_dsi_host_detach(struct mipi_dsi_host *host,
>  	 (type == MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM) || \
>  	 (type == MIPI_DSI_DCS_READ))
>  
> -static ssize_t mcde_dsi_host_transfer(struct mipi_dsi_host *host,
> -				      const struct mipi_dsi_msg *msg)
> +static ssize_t mcde_dsi_host_transfer_commit(struct mipi_dsi_host *host,
> +					     const struct mipi_dsi_msg *msg)
>  {
>  	struct mcde_dsi *d = host_to_mcde_dsi(host);
>  	const u32 loop_delay_us = 10; /* us */
> @@ -353,6 +353,23 @@ static ssize_t mcde_dsi_host_transfer(struct mipi_dsi_host *host,
>  	return ret;
>  }
>  
> +static ssize_t mcde_dsi_host_transfer(struct mipi_dsi_host *host,
> +				      const struct mipi_dsi_msg *msg)
> +{
> +	struct mcde_dsi *d = host_to_mcde_dsi(host);
> +	int retries = 2;
> +	ssize_t ret;
> +
> +	while (retries--) {
> +		ret = mcde_dsi_host_transfer_commit(host, msg);
> +		if (ret >= 0)
> +			return ret;
> +	}

I wonder if it would be better to do this inside
mcde_dsi_host_transfer_commit() - it seems like the vendor driver only
retries triggering the command, i.e.

	writel(~0, d->regs + DSI_DIRECT_CMD_STS_CLR);
	writel(~0, d->regs + DSI_CMD_MODE_STS_CLR);
	/* Send command */
	writel(1, d->regs + DSI_DIRECT_CMD_SEND);

and does not write all the registers again.

> +
> +	dev_err(d->dev, "gave up transfer after retrying\n");
> +	return ret;
> +}
> +
>  static const struct mipi_dsi_host_ops mcde_dsi_host_ops = {
>  	.attach = mcde_dsi_host_attach,
>  	.detach = mcde_dsi_host_detach,
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
