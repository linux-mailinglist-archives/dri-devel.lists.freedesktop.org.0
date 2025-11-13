Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE749C5A4E9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 23:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2376910E200;
	Thu, 13 Nov 2025 22:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bNnsW5w1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6903110E200
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 22:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1763072669;
 bh=0A7E6p3NyGvGxRZwbuJeOguXiJ/TAcxI4gw35WC8eBU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bNnsW5w1L4nQ6M9iOKcAXFQjUiKR2YfkTIPtMRbV39ThZ7InueAuUT1nKwbCFUVyP
 TvW7zfAG6WX75ibRfEaHl/NWPJbjipufjj5id0Qe8nIA2mEEzLTt6ZcQo7mS+/6jlJ
 5qAqZoAIMsrOfbbSZHQ8xCn1Aqu51EpXoFDFg0AC5IShn1LAzZttY89ZSUgneo8ZXU
 fQOGxjy7OvcWDWtA2X9lqryhECIQYh71l3shPFMIS6xu7fjiYnVkbh8ulOO3KxEp9g
 pyuTysqb+Xs2B4O6hTWQ8ou4QtNabnPAilxWe6IJEYkLis7CZn3n2wDAlcgzQz1bu9
 z7byeOWHmTBcg==
Received: from [192.168.1.90] (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4C54A17E00B0;
 Thu, 13 Nov 2025 23:24:28 +0100 (CET)
Message-ID: <684723a1-50f4-4645-ab6e-52e69d1fc96a@collabora.com>
Date: Fri, 14 Nov 2025 00:24:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/bridge: dw-hdmi-qp: Add support for missing HPD
To: Chris Morgan <macroalpha82@gmail.com>, linux-rockchip@lists.infradead.org
Cc: mripard@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, rfoss@kernel.org,
 tzimmermann@suse.de, jonas@kwiboo.se, neil.armstrong@linaro.org,
 heiko@sntech.de, sebastian.reichel@collabora.com, jernej.skrabec@gmail.com,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, krzk+dt@kernel.org, robh@kernel.org,
 Laurent.pinchart@ideasonboard.com
References: <20251113192939.30031-1-macroalpha82@gmail.com>
 <20251113192939.30031-3-macroalpha82@gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20251113192939.30031-3-macroalpha82@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/13/25 9:29 PM, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the dw-hdmi-qp driver to handle devices with missing
> HPD pins.
> 
> Since in this situation we are now polling for the EDID data via i2c
> change the error message to a debug message when we are unable to
> complete an i2c read, as a disconnected device would otherwise fill
> dmesg with i2c read errors.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 32 +++++++++++++++++---
>  1 file changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> index 39332c57f2c5..a2b1a4821714 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> @@ -145,6 +145,7 @@ struct dw_hdmi_qp {
>  	struct regmap *regm;
>  
>  	unsigned long tmds_char_rate;
> +	bool no_hpd;
>  };
>  
>  static void dw_hdmi_qp_write(struct dw_hdmi_qp *hdmi, unsigned int val,
> @@ -520,6 +521,11 @@ static int dw_hdmi_qp_i2c_read(struct dw_hdmi_qp *hdmi,
>  		i2c->is_regaddr = true;
>  	}
>  
> +	/*
> +	 * Mark errors as debug messages when using no_hpd so no device
> +	 * attached does not fill up dmesg.
> +	 */
> +

Using the *_ratelimited() variant - see below - would make this comment kind of
redundant.  Moreover, you've already explained the rationale behind the change
in the commit description.  Hence I'd rather drop it.

>  	while (length--) {
>  		reinit_completion(&i2c->cmp);
>  
> @@ -535,14 +541,20 @@ static int dw_hdmi_qp_i2c_read(struct dw_hdmi_qp *hdmi,
>  
>  		stat = wait_for_completion_timeout(&i2c->cmp, HZ / 10);
>  		if (!stat) {
> -			dev_err(hdmi->dev, "i2c read timed out\n");
> +			if (hdmi->no_hpd)
> +				dev_dbg(hdmi->dev, "i2c read timed out\n");

I think it's worth switching to dev_dbg_ratelimited() in this case.

> +			else
> +				dev_err(hdmi->dev, "i2c read timed out\n");
>  			dw_hdmi_qp_write(hdmi, 0x01, I2CM_CONTROL0);
>  			return -EAGAIN;
>  		}
>  
>  		/* Check for error condition on the bus */
>  		if (i2c->stat & I2CM_NACK_RCVD_IRQ) {
> -			dev_err(hdmi->dev, "i2c read error\n");
> +			if (hdmi->no_hpd)
> +				dev_dbg(hdmi->dev, "i2c read error\n");

Same here.

> +			else
> +				dev_err(hdmi->dev, "i2c read error\n");
>  			dw_hdmi_qp_write(hdmi, 0x01, I2CM_CONTROL0);
>  			return -EIO;
>  		}

[...]

Regardless,

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

