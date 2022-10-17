Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D45600CC5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 12:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4DE10E210;
	Mon, 17 Oct 2022 10:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C953010E210;
 Mon, 17 Oct 2022 10:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qeYGbN2RwRCxQ6AMeNN4NET15UVb7PUi0OEIs+b6DkY=; b=jaCLyiJIXlOFybxMXHamoKAPkX
 RHSfiMXeX4fvs7LiQKE8Q5e/06tx2cQwr8jIMeCYwO8NUrWL3TOpqtA2uuBb8mjxfcD0MAqHQqqkI
 Oj0+Yj+NMSh0lSKW99AmftyTYxvcUU2ptJHFipdq3DamjRcFZtnVbWv5KRKncuGL/Krgp/IS887/G
 r8Dq6EE2ZunlWE/VAXv2ZEK9A6NSKX4L0v5limK7McDeDp08wbRQGG4IrtApe/df2nrJCJF4LNJ78
 0Mj+gtIYfPtsmTPGfDKoclxCyXLbsoHiRVtCqON1ffVLz7nhdhmuCaWLHwoRJejNa4R42VHxxPD9I
 rhlfsfCA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:62495
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1okNc1-0003mn-9T; Mon, 17 Oct 2022 12:44:49 +0200
Message-ID: <7dcf479c-8ac7-ed47-8587-30268684373c@tronnes.org>
Date: Mon, 17 Oct 2022 12:44:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v5 12/22] drm/connector: Add a function to lookup a TV
 mode by its name
To: Maxime Ripard <maxime@cerno.tech>, Karol Herbst <kherbst@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Emma Anholt <emma@anholt.net>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
 <20220728-rpi-analog-tv-properties-v5-12-d841cc64fe4b@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v5-12-d841cc64fe4b@cerno.tech>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 13.10.2022 15.18, skrev Maxime Ripard:
> As part of the command line parsing rework coming in the next patches,
> we'll need to lookup drm_connector_tv_mode values by their name, already
> defined in drm_tv_mode_enum_list.
> 
> In order to avoid any code duplication, let's do a function that will
> perform a lookup of a TV mode name and return its value.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/drm_connector.c | 24 ++++++++++++++++++++++++
>  include/drm/drm_connector.h     |  2 ++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 820f4c730b38..30611c616435 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -991,6 +991,30 @@ static const struct drm_prop_enum_list drm_tv_mode_enum_list[] = {
>  };
>  DRM_ENUM_NAME_FN(drm_get_tv_mode_name, drm_tv_mode_enum_list)
>  
> +/**
> + * drm_get_tv_mode_from_name - Translates a TV mode name into its enum value
> + * @name: TV Mode name we want to convert
> + * @len: Length of @name
> + *
> + * Translates @name into an enum drm_connector_tv_mode.
> + *
> + * Returns: the enum value on success, a negative errno otherwise.
> + */
> +int drm_get_tv_mode_from_name(const char *name, size_t len)

Do we really need to pass in length here?
item->name has to always be NUL terminated otherwise things would break
elsewhere, so it shouldn't be necessary AFAICS.

Noralf.

> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(drm_tv_mode_enum_list); i++) {
> +		const struct drm_prop_enum_list *item = &drm_tv_mode_enum_list[i];
> +
> +		if (strlen(item->name) == len && !strncmp(item->name, name, len))
> +			return item->type;
> +	}
> +
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL(drm_get_tv_mode_from_name);
> +
>  static const struct drm_prop_enum_list drm_tv_select_enum_list[] = {
>  	{ DRM_MODE_SUBCONNECTOR_Automatic, "Automatic" }, /* DVI-I and TV-out */
>  	{ DRM_MODE_SUBCONNECTOR_Composite, "Composite" }, /* TV-out */
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index a501db7d2222..a33f24a76738 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1864,6 +1864,8 @@ const char *drm_get_dp_subconnector_name(int val);
>  const char *drm_get_content_protection_name(int val);
>  const char *drm_get_hdcp_content_type_name(int val);
>  
> +int drm_get_tv_mode_from_name(const char *name, size_t len);
> +
>  int drm_mode_create_dvi_i_properties(struct drm_device *dev);
>  void drm_connector_attach_dp_subconnector_property(struct drm_connector *connector);
>  
> 
