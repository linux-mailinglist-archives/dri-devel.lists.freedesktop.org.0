Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 704D1770417
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 17:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F307E10E71F;
	Fri,  4 Aug 2023 15:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB88A10E71F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 15:10:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4A8566206C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 15:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E5CC433CD
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 15:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691161812;
 bh=k/WEV4wChuXrYdiVjfZQg92NekohcL6BMfLucYkhImI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DeqIpYcYPsJrb5GoacN0Bs+9uHCfU0qlOXefyRIw345uQW+COgwQECJGhZLwO6oX9
 NaMp+PQGGsKq3Nk1G17T4KJspQgLBpKj2OPesmFXhaWlTY6qeCA7nF+2jN+EsezlHZ
 IWGQOi9d23l2uwqOdptBKqKjUZ20qQfVfSBsvb7AQQHTfTrII6k0e4CuhsXW9150KP
 EG83O95mTUJw5XHZzDdQHMSZ4n1+1Du4uQB1b82S6zuDFC/v4rxzAY3zKn13edqom/
 Oy+RyimmjBoNBQDzZmEXP62o+KVcUmm1+VJKS99rM40pkEilOG2LNaZEWAhJXzp/3v
 yenJZ/ZH6dBcw==
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-563f8e8a53dso1222069a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 08:10:12 -0700 (PDT)
X-Gm-Message-State: AOJu0YzPFakmhz5finIZB1nEVlbuyeK3QmjWWDxfFMMVgwdYjxttKfZP
 smM2UqqWtu0V8zAvRCgxgnCCcNibNF23cx11wTfSeg==
X-Google-Smtp-Source: AGHT+IElvAxN2zei6BanZFW0NwWKaaCidPWt1sbwnVPv5pTqIYIdvy4XQVOTTtbdkHsd177fmMf8SmGydpiw77jCVmM=
X-Received: by 2002:a17:90a:1bc6:b0:267:e011:3e9a with SMTP id
 r6-20020a17090a1bc600b00267e0113e9amr1495780pjr.3.1691161811724; Fri, 04 Aug
 2023 08:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230804-lt8912b-v1-0-c542692c6a2f@ideasonboard.com>
 <20230804-lt8912b-v1-1-c542692c6a2f@ideasonboard.com>
In-Reply-To: <20230804-lt8912b-v1-1-c542692c6a2f@ideasonboard.com>
From: Robert Foss <rfoss@kernel.org>
Date: Fri, 4 Aug 2023 17:10:01 +0200
X-Gmail-Original-Message-ID: <CAN6tsi7yxLNvXTVz-xzksr-E9SRmB5Hscc=Hue1G5T+5QZb5HA@mail.gmail.com>
Message-ID: <CAN6tsi7yxLNvXTVz-xzksr-E9SRmB5Hscc=Hue1G5T+5QZb5HA@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/bridge: lt8912b: Fix bridge_detach
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 4, 2023 at 12:48=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> The driver calls lt8912_bridge_detach() from its lt8912_remove()
> function. As the DRM core detaches bridges automatically, this leads to
> calling lt8912_bridge_detach() twice. The code probably has tried to
> manage the double-call with the 'is_attached' variable, but the driver
> never sets the variable to false, so its of no help.
>
> Fix the issue by dropping the call to lt8912_bridge_detach() from
> lt8912_remove(), as the DRM core will handle the detach call for us,
> and also drop the useless is_attached field.
>
> Fixes: 88abfc2b9e61 ("drm/bridge: Introduce LT8912B DSI to HDMI bridge")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt8912b.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/b=
ridge/lontium-lt8912b.c
> index 4eaea67fb71c..0e581f6e3c88 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> @@ -45,7 +45,6 @@ struct lt8912 {
>
>         u8 data_lanes;
>         bool is_power_on;
> -       bool is_attached;
>  };
>
>  static int lt8912_write_init_config(struct lt8912 *lt)
> @@ -575,8 +574,6 @@ static int lt8912_bridge_attach(struct drm_bridge *br=
idge,
>         if (ret)
>                 goto error;
>
> -       lt->is_attached =3D true;
> -
>         return 0;
>
>  error:
> @@ -588,15 +585,13 @@ static void lt8912_bridge_detach(struct drm_bridge =
*bridge)
>  {
>         struct lt8912 *lt =3D bridge_to_lt8912(bridge);
>
> -       if (lt->is_attached) {
> -               lt8912_hard_power_off(lt);
> +       lt8912_hard_power_off(lt);
>
> -               if (lt->hdmi_port->ops & DRM_BRIDGE_OP_HPD)
> -                       drm_bridge_hpd_disable(lt->hdmi_port);
> +       if (lt->hdmi_port->ops & DRM_BRIDGE_OP_HPD)
> +               drm_bridge_hpd_disable(lt->hdmi_port);
>
> -               drm_connector_unregister(&lt->connector);
> -               drm_connector_cleanup(&lt->connector);
> -       }
> +       drm_connector_unregister(&lt->connector);
> +       drm_connector_cleanup(&lt->connector);
>  }
>
>  static enum drm_connector_status
> @@ -750,7 +745,6 @@ static void lt8912_remove(struct i2c_client *client)
>  {
>         struct lt8912 *lt =3D i2c_get_clientdata(client);
>
> -       lt8912_bridge_detach(&lt->bridge);
>         drm_bridge_remove(&lt->bridge);
>         lt8912_free_i2c(lt);
>         lt8912_put_dt(lt);
>
> --
> 2.34.1
>


Reviewed-by: Robert Foss <rfoss@kernel.org>
