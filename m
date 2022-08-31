Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDBF5A868C
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 21:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AD710E106;
	Wed, 31 Aug 2022 19:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B9310E03D;
 Wed, 31 Aug 2022 19:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lFykXXuh414AMHOUrkjMCmREYuLQabBQPnrg6lAfPPY=; b=ZZ198Xf6PPUp/l53rhljFuGMcF
 4zuRseMWeZpoj311RIFnjrUYtADjn9wuJNnEsMO5CjZC+xEdH2c5qjeG0ILG3eq0DkS+/UAuBjtmA
 lj9MawJD7bAGX1645naLEYPOhTdWjb1DKDqwDt5sCid+4EKbwJJ+m1nntHZqZTCOwtH2m0Y9w0pvq
 ypgdce4iD49nSDTQOHr/OQAfe1DigWSkskMg6tndHXcqQjah9nFLMqXz3YF7rBpOLW1ZK9v7rG2Lt
 fwCHewKIgkfbPSZuTdFO+kk9VvsODXV4OOvjxUHa5qpzXfN6R8L2vlOWdmejD3IUudqW/Bg3YIvS9
 NvG7WR9A==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=57178)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oTTAj-0002O5-TA; Wed, 31 Aug 2022 21:14:45 +0200
Message-ID: <dab9899b-b3e5-b99f-7219-9b5efa3a3591@tronnes.org>
Date: Wed, 31 Aug 2022 21:14:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 18/41] drm/connector: Add a function to lookup a TV
 mode by its name
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-18-459522d653a7@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-18-459522d653a7@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 29.08.2022 15.11, skrev Maxime Ripard:
> As part of the command line parsing rework coming in the next patches,
> 
> we'll need to lookup drm_connector_tv_mode values by their name, already
> 
> defined in drm_tv_mode_enum_list.
> 
> 
> 
> In order to avoid any code duplication, let's do a function that will
> 
> perform a lookup of a TV mode name and return its value.
> 
> 
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> 
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> 
> index b1fcacd150e8..0fe01a1c20ad 100644
> 
> --- a/drivers/gpu/drm/drm_connector.c
> 
> +++ b/drivers/gpu/drm/drm_connector.c
> 
> @@ -1003,6 +1003,30 @@ static const struct drm_prop_enum_list drm_tv_mode_enum_list[] = {
> 
>  };
> 
>  DRM_ENUM_NAME_FN(drm_get_tv_mode_name, drm_tv_mode_enum_list)
> 
>  
> 
> +/**
> 
> + * drm_get_tv_mode_from_name - Translates a TV mode name into its enum value
> 
> + * @name: TV Mode name we want to convert
> 
> + * @len: Length of @name
> 
> + *
> 
> + * Translates @name into an enum drm_connector_tv_mode.
> 
> + *
> 
> + * Returns: the enum value on success, a negative errno otherwise.
> 
> + */
> 
> +int drm_get_tv_mode_from_name(const char *name, size_t len)
> 
> +{
> 
> +	unsigned int i;
> 
> +
> 
> +	for (i = 0; i < ARRAY_SIZE(drm_tv_mode_enum_list); i++) {
> 
> +		const struct drm_prop_enum_list *item = &drm_tv_mode_enum_list[i];
> 
> +
> 
> +		if (strlen(item->name) == len && !strncmp(item->name, name, len))
> 
> +			return item->type;
> 
> +	}
> 
> +
> 
> +	return -EINVAL;
> 
> +}
> 
> +EXPORT_SYMBOL(drm_get_tv_mode_from_name)

Missing semicolon.

Noralf.

> 
> +
> 
>  static const struct drm_prop_enum_list drm_tv_select_enum_list[] = {
> 
>  	{ DRM_MODE_SUBCONNECTOR_Automatic, "Automatic" }, /* DVI-I and TV-out */
> 
>  	{ DRM_MODE_SUBCONNECTOR_Composite, "Composite" }, /* TV-out */
> 
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> 
> index bb39d2bb806e..49d261977d4e 100644
> 
> --- a/include/drm/drm_connector.h
> 
> +++ b/include/drm/drm_connector.h
> 
> @@ -1943,6 +1943,8 @@ const char *drm_get_dp_subconnector_name(int val);
> 
>  const char *drm_get_content_protection_name(int val);
> 
>  const char *drm_get_hdcp_content_type_name(int val);
> 
>  
> 
> +int drm_get_tv_mode_from_name(const char *name, size_t len);
> 
> +
> 
>  int drm_mode_create_dvi_i_properties(struct drm_device *dev);
> 
>  void drm_connector_attach_dp_subconnector_property(struct drm_connector *connector);
> 
>  
> 
> 
> 
