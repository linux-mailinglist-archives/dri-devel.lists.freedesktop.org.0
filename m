Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C08257CA163
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 10:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124BB10E131;
	Mon, 16 Oct 2023 08:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A4010E131
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 08:14:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E38957E;
 Mon, 16 Oct 2023 10:14:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1697444072;
 bh=X0qPY/ZLr+T1pIWB06XY/oU04miPkYzv4QR6qe8hHmE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OEPhb+qfjRVqR7D1DjR/E4Qs9EwjfcHt8zBmMXEBgHmGiLl1wKX0oqAr3SYY4QtqV
 qPTLmd/7cqLDNPiSZG5NARIWT+TbU4s+6EyMzvh4mOJFRByYRQsDZG9L5ctpTQRtkM
 GBcs5herAk57EUmN/IcNYyspYVC5+maSi2mZhSsE=
Date: Mon, 16 Oct 2023 11:14:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>
Subject: Re: [PATCH] drm/bridge: adv7511: fix crash on irq during probe
Message-ID: <20231016081444.GD23177@pendragon.ideasonboard.com>
References: <20231014-adv7511-cec-irq-crash-fix-v1-1-3389486c8373@bang-olufsen.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231014-adv7511-cec-irq-crash-fix-v1-1-3389486c8373@bang-olufsen.dk>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Archit Taneja <architt@codeaurora.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Mads Bligaard Nielsen <bli@bang-olufsen.dk>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Hans Verkuil <hans.verkuil@cisco.com>, Maxime Ripard <mripard@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Alvin,

On Sat, Oct 14, 2023 at 08:46:12PM +0200, Alvin Šipraga wrote:
> From: Mads Bligaard Nielsen <bli@bang-olufsen.dk>
> 
> Moved IRQ registration down to end of adv7511_probe().
> 
> If an IRQ already is pending during adv7511_probe
> (before adv7511_cec_init) then cec_received_msg_ts
> could crash using uninitialized data:
> 
>     Unable to handle kernel read from unreadable memory at virtual address 00000000000003d5
>     Internal error: Oops: 96000004 [#1] PREEMPT_RT SMP
>     Call trace:
>      cec_received_msg_ts+0x48/0x990 [cec]
>      adv7511_cec_irq_process+0x1cc/0x308 [adv7511]
>      adv7511_irq_process+0xd8/0x120 [adv7511]
>      adv7511_irq_handler+0x1c/0x30 [adv7511]
>      irq_thread_fn+0x30/0xa0
>      irq_thread+0x14c/0x238
>      kthread+0x190/0x1a8
> 
> Fixes: 3b1b975003e4 ("drm: adv7511/33: add HDMI CEC support")

Isn't the issue older than that ?

> Signed-off-by: Mads Bligaard Nielsen <bli@bang-olufsen.dk>
> Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>

With the Fixes: tag updated,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index d518de88b5c3..71022cb8abe4 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1291,17 +1291,6 @@ static int adv7511_probe(struct i2c_client *i2c)
>  
>  	INIT_WORK(&adv7511->hpd_work, adv7511_hpd_work);
>  
> -	if (i2c->irq) {
> -		init_waitqueue_head(&adv7511->wq);
> -
> -		ret = devm_request_threaded_irq(dev, i2c->irq, NULL,
> -						adv7511_irq_handler,
> -						IRQF_ONESHOT, dev_name(dev),
> -						adv7511);
> -		if (ret)
> -			goto err_unregister_cec;
> -	}
> -
>  	adv7511_power_off(adv7511);
>  
>  	i2c_set_clientdata(i2c, adv7511);
> @@ -1325,6 +1314,17 @@ static int adv7511_probe(struct i2c_client *i2c)
>  
>  	adv7511_audio_init(dev, adv7511);
>  
> +	if (i2c->irq) {
> +		init_waitqueue_head(&adv7511->wq);
> +
> +		ret = devm_request_threaded_irq(dev, i2c->irq, NULL,
> +						adv7511_irq_handler,
> +						IRQF_ONESHOT, dev_name(dev),
> +						adv7511);
> +		if (ret)
> +			goto err_unregister_audio;
> +	}
> +
>  	if (adv7511->type == ADV7533 || adv7511->type == ADV7535) {
>  		ret = adv7533_attach_dsi(adv7511);
>  		if (ret)
> 

-- 
Regards,

Laurent Pinchart
