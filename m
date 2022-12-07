Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD45645F95
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 18:03:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B676810E403;
	Wed,  7 Dec 2022 17:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE3410E403
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 17:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670432585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jOQIidfQ3sbnFLjha2rLDG/XELirqixmyLKRkZZW63g=;
 b=PjIL3S5WAw2nrg0ZVHtfyvf/COeQBHlF2fxQ67vpsQIFJUhLmkw/WRG87qO9ENoIDRg01M
 14BiseAQEY0rQe1Byia7jBhof+QVqs4kMljzcKHknFTf06I36EHigQCw7h7QQvitV5KJUa
 JtmumD5Kw0fDOJzQXOgQhXT9OzS/6Gs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-85-UDMZSkqUPSC4MO9DR5R1nw-1; Wed, 07 Dec 2022 12:03:04 -0500
X-MC-Unique: UDMZSkqUPSC4MO9DR5R1nw-1
Received: by mail-ed1-f70.google.com with SMTP id
 j6-20020a05640211c600b0046d6960b266so1452074edw.6
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Dec 2022 09:03:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jOQIidfQ3sbnFLjha2rLDG/XELirqixmyLKRkZZW63g=;
 b=LybX87E0sg65SkTmCIMFKIzZefmqYvUde1TNIKPGsh3ZZgwwKkaJ7/z+WbJ4T8Ivzw
 yEq6CmOuTD0LaslfZZLaYi9GU5efF4eW2F4Zz1FPLXBVKSLgfop+n9BLTQ3sC0/faPp0
 1l2oMujjW63Olvrn/KpjsiU3bU7NJn6pkHY25OhEZOJ2VxbCHSBnzvsXzYApoo2Nj0lg
 Ia3gLrO7PXxwUA9VWUztujDjD2+jnHGhc2MQHaRxob7iqiq8qETBfB2TgX5YsgopPPPs
 IhWHsm/StxAEi+clqbo7q53gnWTugEAtVYeao2IkVt25RBBumfWyxtvpAeJy/rMr3/3D
 JfTQ==
X-Gm-Message-State: ANoB5plvdRCayLsFA1kFEzxqCiLxMooIKWx6Sf5XvYb6jiq9BEqJH+gF
 1yxfER0lj8OBhI1GSp93RiQUGzkX4jpfaPoDzyuPriXXx6bAkOistJLPJ6LBx+Xnmz4Cw7veKv/
 YyJrDYnf96y0tFb6Mx4NowM2TX6SO
X-Received: by 2002:a17:906:d782:b0:7bc:9d14:a2db with SMTP id
 pj2-20020a170906d78200b007bc9d14a2dbmr45551825ejb.770.1670432583349; 
 Wed, 07 Dec 2022 09:03:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4hY1hd3kXz3CHOlo4t5MTSfkJs8W9NDntOh8GHLT7DUWqJ7CgOGM7kz24jRb0n5QnPy2AAQQ==
X-Received: by 2002:a17:906:d782:b0:7bc:9d14:a2db with SMTP id
 pj2-20020a170906d78200b007bc9d14a2dbmr45551810ejb.770.1670432583144; 
 Wed, 07 Dec 2022 09:03:03 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 vs19-20020a170907139300b007bee745759bsm8712515ejb.20.2022.12.07.09.03.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 09:03:02 -0800 (PST)
Message-ID: <df129d35-6015-4745-afef-e8b261224f34@redhat.com>
Date: Wed, 7 Dec 2022 18:03:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm: Add orientation quirk for DynaBook K50
To: Allen Ballway <ballway@chromium.org>, LKML <linux-kernel@vger.kernel.org>
References: <20221130170811.1.Iee9a494547541dade9eeee9521cc8b811e76a8a0@changeid>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221130170811.1.Iee9a494547541dade9eeee9521cc8b811e76a8a0@changeid>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/30/22 18:08, Allen Ballway wrote:
> Like the ASUS T100HAN for which there is already a quirk,
> the DynaBook K50 has a 800x1280 portrait screen mounted
> in the tablet part of a landscape oriented 2-in-1.
> Update the quirk to be more generic and apply to this device.
> 
> Signed-off-by: Allen Ballway <ballway@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I've pushed this to drm-misc-next now.

Regards,

Hans




> ---
> 
>  .../gpu/drm/drm_panel_orientation_quirks.c    | 20 ++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 52d8800a8ab86..14f870fb2db04 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -30,12 +30,6 @@ struct drm_dmi_panel_orientation_data {
>  	int orientation;
>  };
> 
> -static const struct drm_dmi_panel_orientation_data asus_t100ha = {
> -	.width = 800,
> -	.height = 1280,
> -	.orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
> -};
> -
>  static const struct drm_dmi_panel_orientation_data gpd_micropc = {
>  	.width = 720,
>  	.height = 1280,
> @@ -121,6 +115,12 @@ static const struct drm_dmi_panel_orientation_data lcd1280x1920_rightside_up = {
>  	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
>  };
> 
> +static const struct drm_dmi_panel_orientation_data lcd800x1280_leftside_up = {
> +	.width = 800,
> +	.height = 1280,
> +	.orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
> +};
> +
>  static const struct drm_dmi_panel_orientation_data lcd1600x2560_leftside_up = {
>  	.width = 1600,
>  	.height = 2560,
> @@ -151,7 +151,7 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T100HAN"),
>  		},
> -		.driver_data = (void *)&asus_t100ha,
> +		.driver_data = (void *)&lcd800x1280_leftside_up,
>  	}, {	/* Asus T101HA */
>  		.matches = {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> @@ -196,6 +196,12 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Hi10 pro tablet"),
>  		},
>  		.driver_data = (void *)&lcd1200x1920_rightside_up,
> +	}, {	/* Dynabook K50 */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dynabook Inc."),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "dynabook K50/FR"),
> +		},
> +		.driver_data = (void *)&lcd800x1280_leftside_up,
>  	}, {	/* GPD MicroPC (generic strings, also match on bios date) */
>  		.matches = {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Default string"),
> --
> 2.38.1.584.g0f3c55d4c2-goog
> 

