Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13339537763
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 10:57:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5261110E3CD;
	Mon, 30 May 2022 08:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0E410E408
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 08:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653901036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rT8KdjlnUjd5Uq9SviQ3T6SzqdWFKXJhxwciu6WG4YY=;
 b=QDrrYZTGmr7lZ4/FIJAomH5UjZjCTKm6jViEjXNkuweR94tgbjbYA+USVmqAYIjlTWumoB
 p6Mi4Js7979YbBkkiDbCCQjlZXaY+cV63SqIyWFGQqG6QCVxQGdvCKzB/Tzb+hAkZhGQ+d
 agYRH4GNuWqeYdwlkuHkDvt91C1N7i0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-fKf5GOuBOdKc3QFu7hI7yw-1; Mon, 30 May 2022 04:57:14 -0400
X-MC-Unique: fKf5GOuBOdKc3QFu7hI7yw-1
Received: by mail-ed1-f70.google.com with SMTP id
 i20-20020a50fd14000000b0042dd305d0f7so1362381eds.18
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 01:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rT8KdjlnUjd5Uq9SviQ3T6SzqdWFKXJhxwciu6WG4YY=;
 b=zcW9oq79Hz9bMAvZ7ssV5KJrR0V5VCuTvZFXLCqR3A04RNGWgIQyQzzyz/H2ToPL4r
 orwUqpWOfmTKnmGv+bwwW3wjthB+gxRSVjxUXziDc7oicR8NtN+Jd2+RVlxF9s8+qfE0
 p1ZUXyH6glQbThhFPVeIAya6VUIQvl62yUnF58U84WPKFsCRrSfUbs/aw35A3eEogWTJ
 662BDmbmH48AQ3/KC75t8ErdCgwdUTkIZAykDG38yXkvucYFgOAiJmpR71QgkeopBDIT
 hEETg/ZNC78+iDHli11ly8KIcI/I1ROPVY53dPRpn3bkJcESWwT8CK08dttmJaGRP5a5
 7IKw==
X-Gm-Message-State: AOAM5305yMV+bZBKPBclkJp7W94rqozhcsWaLIGVH0TZ9zRkR4QlI7Xl
 YhJrB1dodmSE/0F76wbt7x0cwCBS3mq4A+GrZNdVnqcYyULQ4bDfyDuyo4JF/iuRc5s69YXm5UG
 UgRK1PBTnbUANKqwEEQt9OqjTTM/r
X-Received: by 2002:a17:907:3e04:b0:6f5:1132:59de with SMTP id
 hp4-20020a1709073e0400b006f5113259demr50478495ejc.755.1653901033623; 
 Mon, 30 May 2022 01:57:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwGZdZ2OECzTT2+3qCTNs8teETzS7iCL734rRtG3rxb48mizDGq2nXgRSvB4Ap1KHNuXXr0A==
X-Received: by 2002:a17:907:3e04:b0:6f5:1132:59de with SMTP id
 hp4-20020a1709073e0400b006f5113259demr50478470ejc.755.1653901033388; 
 Mon, 30 May 2022 01:57:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a1709062ad600b006f3ef214db2sm3802987eje.24.2022.05.30.01.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 01:57:12 -0700 (PDT)
Message-ID: <3ae6d7d1-fcf2-a769-5e4d-f80328ae06fe@redhat.com>
Date: Mon, 30 May 2022 10:57:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v10 1/4] gpu: drm: separate panel orientation property
 creating and value setting
To: Hsin-Yi Wang <hsinyi@chromium.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20220530081910.3947168-1-hsinyi@chromium.org>
 <20220530081910.3947168-2-hsinyi@chromium.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220530081910.3947168-2-hsinyi@chromium.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, Alex Deucher <alexander.deucher@amd.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 5/30/22 10:19, Hsin-Yi Wang wrote:
> drm_dev_register() sets connector->registration_state to
> DRM_CONNECTOR_REGISTERED and dev->registered to true. If
> drm_connector_set_panel_orientation() is first called after
> drm_dev_register(), it will fail several checks and results in following
> warning.
> 
> Add a function to create panel orientation property and set default value
> to UNKNOWN, so drivers can call this function to init the property earlier
> , and let the panel set the real value later.
> 
> [    4.480976] ------------[ cut here ]------------
> [    4.485603] WARNING: CPU: 5 PID: 369 at drivers/gpu/drm/drm_mode_object.c:45 __drm_mode_object_add+0xb4/0xbc
> <snip>
> [    4.609772] Call trace:
> [    4.612208]  __drm_mode_object_add+0xb4/0xbc
> [    4.616466]  drm_mode_object_add+0x20/0x2c
> [    4.620552]  drm_property_create+0xdc/0x174
> [    4.624723]  drm_property_create_enum+0x34/0x98
> [    4.629241]  drm_connector_set_panel_orientation+0x64/0xa0
> [    4.634716]  boe_panel_get_modes+0x88/0xd8
> [    4.638802]  drm_panel_get_modes+0x2c/0x48
> [    4.642887]  panel_bridge_get_modes+0x1c/0x28
> [    4.647233]  drm_bridge_connector_get_modes+0xa0/0xd4
> [    4.652273]  drm_helper_probe_single_connector_modes+0x218/0x700
> [    4.658266]  drm_mode_getconnector+0x1b4/0x45c
> [    4.662699]  drm_ioctl_kernel+0xac/0x128
> [    4.666611]  drm_ioctl+0x268/0x410
> [    4.670002]  drm_compat_ioctl+0xdc/0xf0
> [    4.673829]  __arm64_compat_sys_ioctl+0xc8/0x100
> [    4.678436]  el0_svc_common+0xf4/0x1c0
> [    4.682174]  do_el0_svc_compat+0x28/0x3c
> [    4.686088]  el0_svc_compat+0x10/0x1c
> [    4.689738]  el0_sync_compat_handler+0xa8/0xcc
> [    4.694171]  el0_sync_compat+0x178/0x180
> [    4.698082] ---[ end trace b4f2db9d9c88610b ]---
> [    4.702721] ------------[ cut here ]------------
> [    4.707329] WARNING: CPU: 5 PID: 369 at drivers/gpu/drm/drm_mode_object.c:243 drm_object_attach_property+0x48/0xb8
> <snip>
> [    4.833830] Call trace:
> [    4.836266]  drm_object_attach_property+0x48/0xb8
> [    4.840958]  drm_connector_set_panel_orientation+0x84/0xa0
> [    4.846432]  boe_panel_get_modes+0x88/0xd8
> [    4.850516]  drm_panel_get_modes+0x2c/0x48
> [    4.854600]  panel_bridge_get_modes+0x1c/0x28
> [    4.858946]  drm_bridge_connector_get_modes+0xa0/0xd4
> [    4.863984]  drm_helper_probe_single_connector_modes+0x218/0x700
> [    4.869978]  drm_mode_getconnector+0x1b4/0x45c
> [    4.874410]  drm_ioctl_kernel+0xac/0x128
> [    4.878320]  drm_ioctl+0x268/0x410
> [    4.881711]  drm_compat_ioctl+0xdc/0xf0
> [    4.885536]  __arm64_compat_sys_ioctl+0xc8/0x100
> [    4.890142]  el0_svc_common+0xf4/0x1c0
> [    4.893879]  do_el0_svc_compat+0x28/0x3c
> [    4.897791]  el0_svc_compat+0x10/0x1c
> [    4.901441]  el0_sync_compat_handler+0xa8/0xcc
> [    4.905873]  el0_sync_compat+0x178/0x180
> [    4.909783] ---[ end trace b4f2db9d9c88610c ]---
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Sean Paul <seanpaul@chromium.org>
> ---
> v9->v10: rebase to latest linux-next.
> v9: https://patchwork.kernel.org/project/linux-mediatek/patch/20220318074825.3359978-2-hsinyi@chromium.org/
> v8: https://patchwork.kernel.org/project/linux-mediatek/patch/20220208084234.1684930-1-hsinyi@chromium.org/
> v7: https://patchwork.kernel.org/project/linux-mediatek/patch/20220208073714.1540390-1-hsinyi@chromium.org/
> ---
>  drivers/gpu/drm/drm_connector.c | 58 +++++++++++++++++++++++++--------
>  include/drm/drm_connector.h     |  2 ++
>  2 files changed, 47 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 1c48d162c77e..d68cc78f6684 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1252,7 +1252,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>   *	INPUT_PROP_DIRECT) will still map 1:1 to the actual LCD panel
>   *	coordinates, so if userspace rotates the picture to adjust for
>   *	the orientation it must also apply the same transformation to the
> - *	touchscreen input coordinates. This property is initialized by calling
> + *	touchscreen input coordinates. This property value is set by calling
>   *	drm_connector_set_panel_orientation() or
>   *	drm_connector_set_panel_orientation_with_quirk()
>   *
> @@ -2310,8 +2310,8 @@ EXPORT_SYMBOL(drm_connector_set_vrr_capable_property);
>   * @connector: connector for which to set the panel-orientation property.
>   * @panel_orientation: drm_panel_orientation value to set
>   *
> - * This function sets the connector's panel_orientation and attaches
> - * a "panel orientation" property to the connector.
> + * This function sets the connector's panel_orientation value. If the property
> + * doesn't exist, it will try to create one.
>   *
>   * Calling this function on a connector where the panel_orientation has
>   * already been set is a no-op (e.g. the orientation has been overridden with
> @@ -2343,18 +2343,13 @@ int drm_connector_set_panel_orientation(
>  
>  	prop = dev->mode_config.panel_orientation_property;
>  	if (!prop) {
> -		prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
> -				"panel orientation",
> -				drm_panel_orientation_enum_list,
> -				ARRAY_SIZE(drm_panel_orientation_enum_list));
> -		if (!prop)
> +		if (drm_connector_init_panel_orientation_property(connector) < 0)
>  			return -ENOMEM;
> -
> -		dev->mode_config.panel_orientation_property = prop;
> +		prop = dev->mode_config.panel_orientation_property;
>  	}
>  
> -	drm_object_attach_property(&connector->base, prop,
> -				   info->panel_orientation);
> +	drm_object_property_set_value(&connector->base, prop,
> +				      info->panel_orientation);
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_connector_set_panel_orientation);
> @@ -2362,7 +2357,7 @@ EXPORT_SYMBOL(drm_connector_set_panel_orientation);
>  /**
>   * drm_connector_set_panel_orientation_with_quirk - set the
>   *	connector's panel_orientation after checking for quirks
> - * @connector: connector for which to init the panel-orientation property.
> + * @connector: connector for which to set the panel-orientation property.
>   * @panel_orientation: drm_panel_orientation value to set
>   * @width: width in pixels of the panel, used for panel quirk detection
>   * @height: height in pixels of the panel, used for panel quirk detection
> @@ -2389,6 +2384,43 @@ int drm_connector_set_panel_orientation_with_quirk(
>  }
>  EXPORT_SYMBOL(drm_connector_set_panel_orientation_with_quirk);
>  
> +/**
> + * drm_connector_init_panel_orientation_property -
> + * 	create the connector's panel orientation property
> + *
> + * This function attaches a "panel orientation" property to the connector
> + * and initializes its value to DRM_MODE_PANEL_ORIENTATION_UNKNOWN.
> + *
> + * The value of the property can be set by drm_connector_set_panel_orientation()
> + * or drm_connector_set_panel_orientation_with_quirk() later.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_connector_init_panel_orientation_property(
> +	struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct drm_property *prop;
> +
> +	if(dev->mode_config.panel_orientation_property)
> +		return 0;
> +
> +	prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
> +			"panel orientation",
> +			drm_panel_orientation_enum_list,
> +			ARRAY_SIZE(drm_panel_orientation_enum_list));
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	dev->mode_config.panel_orientation_property = prop;
> +	drm_object_attach_property(&connector->base, prop,
> +				   DRM_MODE_PANEL_ORIENTATION_UNKNOWN);

DRM_MODE_PANEL_ORIENTATION_UNKNOWN is -1 which is not a valid value
for an enum. IOW when the panel-orientation is DRM_MODE_PANEL_ORIENTATION_UNKNOWN
then the property should not be created on the drm-connector object at all.

Which brings us back to what I said in reply to the coverletter,
it seems that you have a probe ordering problem here; and fixing that
issue would make this patch-set unnecessary.

Regards,

Hans



> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_init_panel_orientation_property);
> +
>  static const struct drm_prop_enum_list privacy_screen_enum[] = {
>  	{ PRIVACY_SCREEN_DISABLED,		"Disabled" },
>  	{ PRIVACY_SCREEN_ENABLED,		"Enabled" },
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 3ac4bf87f257..f0681091c617 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1802,6 +1802,8 @@ int drm_connector_set_panel_orientation_with_quirk(
>  	struct drm_connector *connector,
>  	enum drm_panel_orientation panel_orientation,
>  	int width, int height);
> +int drm_connector_init_panel_orientation_property(
> +	struct drm_connector *connector);
>  int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>  					  int min, int max);
>  void drm_connector_create_privacy_screen_properties(struct drm_connector *conn);

