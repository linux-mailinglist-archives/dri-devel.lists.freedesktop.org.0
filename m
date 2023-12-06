Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EB780702D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 13:49:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5105610E6E8;
	Wed,  6 Dec 2023 12:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F6E10E6E8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 12:49:03 +0000 (UTC)
Received: from [192.168.88.20] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 017FA29B;
 Wed,  6 Dec 2023 13:48:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1701866901;
 bh=hurEz5yHE2buEex1n4ZzEFee0FP8RPfh+K+tCD6yjvE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fSFVZBdqI+JviLDvZH3zOzMq6rEwYaylDL/ogqXTxjKS8Pbs77u6g61MHeDtIgMgS
 0U2LsMrmCjYISAbTYxThCoRRDssGiqCsnEGg3rsLJVJZ6Yji+JOX7TSUM6ylnEK+8B
 3wMzlOZAUVJfFXbm+yPjW/p0CKt36FjlmxwJi13I=
Message-ID: <17b43cb8-1543-48d2-830a-b9f6dd50fc15@ideasonboard.com>
Date: Wed, 6 Dec 2023 14:48:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mipi-dsi: Fix detach call without attach
Content-Language: en-US
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
 Tony Lindgren <tony@atomide.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>
References: <20230921-dsi-detach-fix-v1-1-d0de2d1621d9@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20230921-dsi-detach-fix-v1-1-d0de2d1621d9@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi mipi dsi maintainers (I'm not sure who that is =),

On 21/09/2023 13:50, Tomi Valkeinen wrote:
> It's been reported that DSI host driver's detach can be called without
> the attach ever happening:
> 
> https://lore.kernel.org/all/20230412073954.20601-1-tony@atomide.com/
> 
> After reading the code, I think this is what happens:
> 
> We have a DSI host defined in the device tree and a DSI peripheral under
> that host (i.e. an i2c device using the DSI as data bus doesn't exhibit
> this behavior).
> 
> The host driver calls mipi_dsi_host_register(), which causes (via a few
> functions) mipi_dsi_device_add() to be called for the DSI peripheral. So
> now we have a DSI device under the host, but attach hasn't been called.
> 
> Normally the probing of the devices continues, and eventually the DSI
> peripheral's driver will call mipi_dsi_attach(), attaching the
> peripheral.
> 
> However, if the host driver's probe encounters an error after calling
> mipi_dsi_host_register(), and before the peripheral has called
> mipi_dsi_attach(), the host driver will do cleanups and return an error
> from its probe function. The cleanups include calling
> mipi_dsi_host_unregister().
> 
> mipi_dsi_host_unregister() will call two functions for all its DSI
> peripheral devices: mipi_dsi_detach() and mipi_dsi_device_unregister().
> The latter makes sense, as the device exists, but the former may be
> wrong as attach has not necessarily been done.
> 
> To fix this, track the attached state of the peripheral, and only detach
> from mipi_dsi_host_unregister() if the peripheral was attached.
> 
> Note that I have only tested this with a board with an i2c DSI
> peripheral, not with a "pure" DSI peripheral.
> 
> However, slightly related, the unregister machinery still seems broken.
> E.g. if the DSI host driver is unbound, it'll detach and unregister the
> DSI peripherals. After that, when the DSI peripheral driver unbound
> it'll call detach either directly or using the devm variant, leading to
> a crash. And probably the driver will crash if it happens, for some
> reason, to try to send a message via the DSI bus.
> 
> But that's another topic.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---

Any comments? I can push this via drm-misc, but I'd like an ack.

  Tomi


>   drivers/gpu/drm/drm_mipi_dsi.c | 17 +++++++++++++++--
>   include/drm/drm_mipi_dsi.h     |  2 ++
>   2 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index 14201f73aab1..843a6dbda93a 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -347,7 +347,8 @@ static int mipi_dsi_remove_device_fn(struct device *dev, void *priv)
>   {
>   	struct mipi_dsi_device *dsi = to_mipi_dsi_device(dev);
>   
> -	mipi_dsi_detach(dsi);
> +	if (dsi->attached)
> +		mipi_dsi_detach(dsi);
>   	mipi_dsi_device_unregister(dsi);
>   
>   	return 0;
> @@ -370,11 +371,18 @@ EXPORT_SYMBOL(mipi_dsi_host_unregister);
>   int mipi_dsi_attach(struct mipi_dsi_device *dsi)
>   {
>   	const struct mipi_dsi_host_ops *ops = dsi->host->ops;
> +	int ret;
>   
>   	if (!ops || !ops->attach)
>   		return -ENOSYS;
>   
> -	return ops->attach(dsi->host, dsi);
> +	ret = ops->attach(dsi->host, dsi);
> +	if (ret)
> +		return ret;
> +
> +	dsi->attached = true;
> +
> +	return 0;
>   }
>   EXPORT_SYMBOL(mipi_dsi_attach);
>   
> @@ -386,9 +394,14 @@ int mipi_dsi_detach(struct mipi_dsi_device *dsi)
>   {
>   	const struct mipi_dsi_host_ops *ops = dsi->host->ops;
>   
> +	if (WARN_ON(!dsi->attached))
> +		return -EINVAL;
> +
>   	if (!ops || !ops->detach)
>   		return -ENOSYS;
>   
> +	dsi->attached = false;
> +
>   	return ops->detach(dsi->host, dsi);
>   }
>   EXPORT_SYMBOL(mipi_dsi_detach);
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index c9df0407980c..c0aec0d4d664 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -168,6 +168,7 @@ struct mipi_dsi_device_info {
>    * struct mipi_dsi_device - DSI peripheral device
>    * @host: DSI host for this peripheral
>    * @dev: driver model device node for this peripheral
> + * @attached: the DSI device has been successfully attached
>    * @name: DSI peripheral chip type
>    * @channel: virtual channel assigned to the peripheral
>    * @format: pixel format for video mode
> @@ -184,6 +185,7 @@ struct mipi_dsi_device_info {
>   struct mipi_dsi_device {
>   	struct mipi_dsi_host *host;
>   	struct device dev;
> +	bool attached;
>   
>   	char name[DSI_DEV_NAME_SIZE];
>   	unsigned int channel;
> 
> ---
> base-commit: 9fc75c40faa29df14ba16066be6bdfaea9f39ce4
> change-id: 20230921-dsi-detach-fix-6736f7a48ba7
> 
> Best regards,

