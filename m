Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E76FE258917
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0966E5C8;
	Tue,  1 Sep 2020 07:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B8D89E63
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 09:32:30 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c18so5196505wrm.9
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 02:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iVYbH9pq5ON75kceYMv0ldXRcI8Va5OUTJxQ40DJfbw=;
 b=s3DPMpUnlBRCpr7AuJx3CTYtb0SatpC56SyQGWzvJh/NWXOJuKL7poG62fhUtUhGXW
 1WduYjNLVTWz0THZ+thbkV+Jl2/AXZaog6O8f1139vJe+NYR96j5twvSej7tqRODIkhq
 kniIeoTgfYlYHL3Mgx8pEQNFf6jK/BKna8/uVSv/1zerP/Z5YIZ0CCyfZU9YmGfUtlAP
 Mny7O27bR7/dqk/brPWYa9IJ1Y7uGLgiDZwmmK5vl46KpiZNGN9ayVCg2FixQXqkdXsQ
 8NBDrmFzZ+at5nmoqiZhua3IAxD3xgWatK0Vv2I5IBUc4/GBNFvR3JzPiCIZ7k492595
 0Jcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iVYbH9pq5ON75kceYMv0ldXRcI8Va5OUTJxQ40DJfbw=;
 b=Mf//TvLz4g0wTyO6u1Qyr+Zy92Kyb3EUeJWspr3NmM5afbiMFeHjcldxCS68uen6mZ
 wacr3trTLqkQps5JoaL1tcDGE91dcR/h4KgnDb52RdMbHie57ypjGY68SuXCvyfrKb3T
 l69Zd0D9IlU/F291TksKC2FoAG0aEGUxrMosX2b+oQvbI446dcjYESRifypT8x2677+q
 v9YDBePdkbJPxsYc6rn6/VDK1WvoIgehFoRPA37M6/eIiqmW23QXdrasBjUVz0vr17ZT
 E0e8J44Bo62IkXlaJWcNDVwcU8Fb+8Gzxf9HETdW293ta9i8f/pWRh5LR8gzCj4sk6SN
 Qr/w==
X-Gm-Message-State: AOAM532Tfr09G8dnu10avgIau+yDLvOcRTD09xQ/LjU8Yos0PiJgIIkg
 9WkEIgwTD07NH2wZgt15Ezs=
X-Google-Smtp-Source: ABdhPJxTvECBM8RTxX8g3+utmkDt/KjKwqU5iywA22yPS+/iKuXCqUpd/LnjDn4d+tdSFn9KKYWUAQ==
X-Received: by 2002:adf:ef45:: with SMTP id c5mr759476wrp.37.1598866349178;
 Mon, 31 Aug 2020 02:32:29 -0700 (PDT)
Received: from a-VirtualBox ([103.120.71.253])
 by smtp.gmail.com with ESMTPSA id t203sm10231507wmg.43.2020.08.31.02.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 02:32:28 -0700 (PDT)
Date: Mon, 31 Aug 2020 14:32:23 +0500
From: Bilal Wasim <bwasim.lkml@gmail.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v3 1/1] drm/bridge: ps8640: Rework power state handling
Message-ID: <20200831143223.1a775ba6@a-VirtualBox>
In-Reply-To: <20200827085911.944899-2-enric.balletbo@collabora.com>
References: <20200827085911.944899-1-enric.balletbo@collabora.com>
 <20200827085911.944899-2-enric.balletbo@collabora.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 01 Sep 2020 07:31:54 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, drinkcat@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 laurent.pinchart@ideasonboard.com, hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Enric,

On Thu, 27 Aug 2020 10:59:11 +0200
Enric Balletbo i Serra <enric.balletbo@collabora.com> wrote:

> The get_edid() callback can be triggered anytime by an ioctl, i.e
> 
>   drm_mode_getconnector (ioctl)
>     -> drm_helper_probe_single_connector_modes
>        -> drm_bridge_connector_get_modes
>           -> ps8640_bridge_get_edid  
> 
> Actually if the bridge pre_enable() function was not called before
> get_edid(), the driver will not be able to get the EDID properly and
> display will not work until a second get_edid() call is issued and if
> pre_enable() is called before. The side effect of this, for example,
> is that you see anything when `Frecon` starts, neither the splash
> screen, until the graphical session manager starts.
> 
> To fix this we need to make sure that all we need is enabled before
> reading the EDID. This means the following:
> 
> 1. If get_edid() is called before having the device powered we need to
>    power on the device. In such case, the driver will power off again
> the device.
> 
> 2. If get_edid() is called after having the device powered, all should
>    just work. We added a powered flag in order to avoid recurrent
> calls to ps8640_bridge_poweron() and unneeded delays.
> 
> 3. This seems to be specific for this device, but we need to make sure
>    the panel is powered on before do a power on cycle on this device.
>    Otherwise the device fails to retrieve the EDID.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v3:
> - Make poweron/poweroff and pre_enable/post_disable reverse one to
> each other (Sam Ravnborg)
> 
> Changes in v2:
> - Use drm_bridge_chain_pre_enable/post_disable() helpers (Sam
> Ravnborg)
> 
>  drivers/gpu/drm/bridge/parade-ps8640.c | 68
> ++++++++++++++++++++++---- 1 file changed, 58 insertions(+), 10
> deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c
> b/drivers/gpu/drm/bridge/parade-ps8640.c index
> 9f7b7a9c53c5..7bd0affa057a 100644 ---
> a/drivers/gpu/drm/bridge/parade-ps8640.c +++
> b/drivers/gpu/drm/bridge/parade-ps8640.c @@ -65,6 +65,7 @@ struct
> ps8640 { struct regulator_bulk_data supplies[2];
>  	struct gpio_desc *gpio_reset;
>  	struct gpio_desc *gpio_powerdown;
> +	bool powered;
>  };
>  
>  static inline struct ps8640 *bridge_to_ps8640(struct drm_bridge *e)
> @@ -91,13 +92,15 @@ static int ps8640_bridge_vdo_control(struct
> ps8640 *ps_bridge, return 0;
>  }
>  
> -static void ps8640_pre_enable(struct drm_bridge *bridge)
> +static void ps8640_bridge_poweron(struct ps8640 *ps_bridge)
>  {
> -	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
>  	struct i2c_client *client = ps_bridge->page[PAGE2_TOP_CNTL];
>  	unsigned long timeout;
>  	int ret, status;
>  
> +	if (ps_bridge->powered)
> +		return;
> +
>  	ret = regulator_bulk_enable(ARRAY_SIZE(ps_bridge->supplies),
>  				    ps_bridge->supplies);
>  	if (ret < 0) {
> @@ -152,10 +155,6 @@ static void ps8640_pre_enable(struct drm_bridge
> *bridge) goto err_regulators_disable;
>  	}
>  
> -	ret = ps8640_bridge_vdo_control(ps_bridge, ENABLE);
> -	if (ret)
> -		goto err_regulators_disable;
> -
>  	/* Switch access edp panel's edid through i2c */
>  	ret = i2c_smbus_write_byte_data(client, PAGE2_I2C_BYPASS,
>  					I2C_BYPASS_EN);
> @@ -164,6 +163,8 @@ static void ps8640_pre_enable(struct drm_bridge
> *bridge) goto err_regulators_disable;
>  	}
>  
> +	ps_bridge->powered = true;
> +
>  	return;
>  
>  err_regulators_disable:
> @@ -171,12 +172,12 @@ static void ps8640_pre_enable(struct drm_bridge
> *bridge) ps_bridge->supplies);
>  }
>  
> -static void ps8640_post_disable(struct drm_bridge *bridge)
> +static void ps8640_bridge_poweroff(struct ps8640 *ps_bridge)
>  {
> -	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
>  	int ret;
>  
> -	ps8640_bridge_vdo_control(ps_bridge, DISABLE);
> +	if (!ps_bridge->powered)
> +		return;
>  
>  	gpiod_set_value(ps_bridge->gpio_reset, 1);
>  	gpiod_set_value(ps_bridge->gpio_powerdown, 1);
> @@ -184,6 +185,28 @@ static void ps8640_post_disable(struct
> drm_bridge *bridge) ps_bridge->supplies);
>  	if (ret < 0)
>  		DRM_ERROR("cannot disable regulators %d\n", ret);
> +
> +	ps_bridge->powered = false;
> +}
> +
> +static void ps8640_pre_enable(struct drm_bridge *bridge)
> +{
> +	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
> +	int ret;
> +
> +	ps8640_bridge_poweron(ps_bridge);
> +
> +	ret = ps8640_bridge_vdo_control(ps_bridge, ENABLE);
> +	if (ret < 0)
> +		ps8640_bridge_poweroff(ps_bridge);
> +}
> +
> +static void ps8640_post_disable(struct drm_bridge *bridge)
> +{
> +	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
> +
> +	ps8640_bridge_vdo_control(ps_bridge, DISABLE);
> +	ps8640_bridge_poweroff(ps_bridge);
>  }
>  
>  static int ps8640_bridge_attach(struct drm_bridge *bridge,
> @@ -249,9 +272,34 @@ static struct edid
> *ps8640_bridge_get_edid(struct drm_bridge *bridge, struct
> drm_connector *connector) {
>  	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
> +	bool poweroff = !ps_bridge->powered;
> +	struct edid *edid;
> +
> +	/*
> +	 * When we end calling get_edid() triggered by an ioctl, i.e
> +	 *
> +	 *   drm_mode_getconnector (ioctl)
> +	 *     -> drm_helper_probe_single_connector_modes
> +	 *        -> drm_bridge_connector_get_modes
> +	 *           -> ps8640_bridge_get_edid
> +	 *
> +	 * We need to make sure that what we need is enabled before
> reading
> +	 * EDID, for this chip, we need to do a full poweron,
> otherwise it will
> +	 * fail.
> +	 */
> +	drm_bridge_chain_pre_enable(bridge);

Are we sure that pre_enable is always good enough to get the EDID? I
know that we only have support for ps8640 on the MT8173 SoC which works
only with pre_enable, but I think a more scalable solution would be to
call drm_bridge_chain_pre_enable / drm_bridge_chain_enable here, and
drm_bridge_chain_post_disable / drm_bridge_chain_disable when disabling
the chain. If this is not a concern and we are sure that pre_enable
will always work (especially on newer boards), then please ignore my
comment. 

Other than this, everything looks fine.

>  
> -	return drm_get_edid(connector,
> +	edid = drm_get_edid(connector,
>  			    ps_bridge->page[PAGE0_DP_CNTL]->adapter);
> +
> +	/*
> +	 * If we call the get_edid() function without having enabled
> the chip
> +	 * before, return the chip to its original power state.
> +	 */
> +	if (poweroff)
> +		drm_bridge_chain_post_disable(bridge);
> +
> +	return edid;
>  }
>  
>  static const struct drm_bridge_funcs ps8640_bridge_funcs = {

-Bilal
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
