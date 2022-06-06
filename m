Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B99853EE53
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 21:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597C710ED04;
	Mon,  6 Jun 2022 19:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3307110ECBB
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 19:08:48 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id h187so7820786oif.4
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 12:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=U+d48J6VO4jwWOwK4nY7MppUng+HS6f87TdgczeTWfA=;
 b=jbYQLfVc8E3vRnH/nAaGpEpu3GBx4LeR4+rgdiFOihSxweRGcyNUDXo8oXTht50+6z
 vCTaJSGT4TIKqAoQCMUYxwZN9KwxGDwPDjCxGedcYvmUQ583rhPZD1tmOJE3v34dIpjn
 C98AM8dS6nf6IlEL28J7wSLX2wRF8ySv7yZOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=U+d48J6VO4jwWOwK4nY7MppUng+HS6f87TdgczeTWfA=;
 b=a57lIkPOxfNrNGutVNJGHoAbyCzm0ykphMGghLRrBzh42FGtxaTR+dB/GKbJ9G79pm
 h/bZ9RIUMJYpCqBmcV2kg51T23ALymfAQsT4HVm0CDHHPAJqQz45Yf+FRJuWeQguNhBf
 8QIvydamzGTHqOR9FNcvGbveyO/qdUMJffB9ReaWRuFU0FD7SLpwjtkJ0C/VtKt6N8u7
 6WmM7wmusJwXDtAxtnUmJuSLhviD2bvhYMYWESwzCDa3u/dSdqRnU+araIwA8/Gil/ry
 xYf0wN5xOTPMXQnvvGXxR12chRNGEp/nD11x70F4MFzcmgooMVJPZayzMrzjWXAZRniW
 fR4w==
X-Gm-Message-State: AOAM530IDEiChMmq3UtcsxrljD/ERzMissGwlxrnQSmRXb6XYKlRDkoi
 9xLE2PUISMwuvHZnRjCsS3oYS3z8Uq7LkKpq5Fcmzw==
X-Google-Smtp-Source: ABdhPJy4c94CssdxgDB7cICSjvhkR/T7a00ZnGxM1AaOQjnzXXHNZCZXMZRtPZa2NcP41pwS569R9SzLPrA11kDyVIA=
X-Received: by 2002:a05:6808:e87:b0:32e:4789:d2c with SMTP id
 k7-20020a0568080e8700b0032e47890d2cmr11740857oil.193.1654542527131; Mon, 06
 Jun 2022 12:08:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jun 2022 12:08:46 -0700
MIME-Version: 1.0
In-Reply-To: <20220606152431.1889185-5-hsinyi@chromium.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org>
 <20220606152431.1889185-5-hsinyi@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 6 Jun 2022 12:08:46 -0700
Message-ID: <CAE-0n51xPADPVcBH7QRh96t7q=mx4VhxrEb1cZENcsu7Z=Nv0A@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] drm/panel: lvds: Implement .get_orientation
 callback
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Hsin-Yi Wang (2022-06-06 08:24:27)
> diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
> index f11252fb00fe..491b64c2c8d6 100644
> --- a/drivers/gpu/drm/panel/panel-lvds.c
> +++ b/drivers/gpu/drm/panel/panel-lvds.c
> @@ -99,15 +99,30 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
>         drm_display_info_set_bus_formats(&connector->display_info,
>                                          &lvds->bus_format, 1);
>         connector->display_info.bus_flags = lvds->bus_flags;
> +
> +       /*
> +        * drm drivers are expected to call drm_panel_get_orientation() to get
> +        * panel's orientation then drm_connector_set_panel_orientation() to
> +        * set the property before drm_dev_register(). Otherwise there will be
> +        * a WARN_ON if orientation is set after drm is registered.
> +        */

Should this comment also be a "TODO: Remove once all drm drivers call
drm_connector_set_panel_orientation()"?

>         drm_connector_set_panel_orientation(connector, lvds->orientation);
>
>         return 1;
>  }
>
> +static enum drm_panel_orientation panel_lvds_get_orientation,(struct drm_panel *panel)

Stray comma here                                            ---^

> +{
> +       struct panel_lvds *lvds = to_panel_lvds(panel);
> +
> +       return lvds->orientation;
> +}
> +
