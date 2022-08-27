Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D997B5A334D
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 03:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067C310EAC7;
	Sat, 27 Aug 2022 01:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE80110EAC7
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 01:04:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A88F120A;
 Sat, 27 Aug 2022 03:04:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661562271;
 bh=WOyHgEMzsUmZjwukdnKWFvD4AASLtWqiRnnpX83POBg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o/KWvI6219Rdafw1d+LUYSmV98CVTpOUlcwcAn+40sEyRd0NAQwIyuIhwexQwsqfh
 5Sd92ghJjn9Bqq7vlhInii3I0Znk9hhw47ePS4DIoKgR1hPUycJC/hRPQjYP1Nf42K
 rGVrbk5zgofKh/3RheZa0AcTqhJ0N66JMCpwRnS4=
Date: Sat, 27 Aug 2022 04:04:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v5 1/4] drm/bridge: ti-sn65dsi86: check AUX errors better
Message-ID: <Ywltl8yLRx9Wq+ux@pendragon.ideasonboard.com>
References: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
 <20220824130034.196041-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220824130034.196041-2-tomi.valkeinen@ideasonboard.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Wed, Aug 24, 2022 at 04:00:31PM +0300, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> The driver does not check AUX_IRQ_STATUS_NAT_I2C_FAIL bit at all when
> sending AUX transfers, which leads to the driver not returning an error.
> 
> Add the check.

That looks right.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 90bbabde1595..ba84215c1511 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -582,6 +582,11 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
>  		goto exit;
>  	}
>  
> +	if (val & AUX_IRQ_STATUS_NAT_I2C_FAIL) {
> +		ret = -EIO;
> +		goto exit;
> +	}
> +
>  	if (val & AUX_IRQ_STATUS_AUX_SHORT) {
>  		ret = regmap_read(pdata->regmap, SN_AUX_LENGTH_REG, &len);
>  		if (ret)

-- 
Regards,

Laurent Pinchart
