Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6908542C1
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 07:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5D210E00B;
	Wed, 14 Feb 2024 06:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fDR8jRMF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C3310E00B
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 06:25:23 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-6ddf26eba3cso1093267a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 22:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1707891920; x=1708496720;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wf0JaDe/v/whRIZd8Ld92JiQKoN/oDT7LT2E1YHg6KQ=;
 b=fDR8jRMFcK9h6xux4AuHKz8+9tfipC5MZ9stuo601WswamoJbdx/sn/FwnSPVgZRFz
 f6yjpIZ78VV1yG9faA2IFu4MuQ7vKZGbgSwtMzh4EUa2Q8rH5xhOEIceEYr1dt5JDBmR
 JFuBtHQShLQ6F85F9Yk+bN7EyDPQ15MOrsdJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707891920; x=1708496720;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wf0JaDe/v/whRIZd8Ld92JiQKoN/oDT7LT2E1YHg6KQ=;
 b=S6yoAKBajoUipivl/NrIywkwYeqq1FqDa21YEwb0uoU1JKzLmpCSgl3B6aOQAemCrp
 6QWOjZ3VvhrF0nyGuEkdEe1RNSBAofduvAKIlkJu9JkuCfRp1c8bB2UAMsjhbEhg6xt6
 vOY3i84spAFZR4rgcsroStcEa4jUxJD2mB1F3BRndH51kYLeufxuwvQ3liFMrj3QI3nG
 /f2QXZyuVdklFPooI0op35CgmUq7rmEAZHeyclpZtm4QveMBUoctLsUpJfqB6iPW4H2i
 uRwETXHYtahBWIOXjgq8GOWYr3a88Qo8X/UTAyf/Dj4BFyC24GLUMyO/sD4DUm+BOxEK
 /xzw==
X-Gm-Message-State: AOJu0YwOrrov+sYb+4ynn3HZ59iH57rG2qMaXb2WZp7tWDNCE2W2w7ol
 DPnOioesiECtuIQEUtlG9Z4flIsZe24JbmZ2slI/mGwJ0K5IoCL4uel8LD7xaSF21ys+hdwMIc4
 Gq7BdfdPYRCO/XMgDJCkFSr15Tr3ovEVPlNVH
X-Google-Smtp-Source: AGHT+IGrfJM6/ISO76awK+/6mCArsM5o8X+G8rSeUZA5OJd420Db+eZsu2zrZlV2W9LMf9Jywkeuz0wLrkg6nbQllMU=
X-Received: by 2002:a05:6830:1d87:b0:6e2:dd2e:aa20 with SMTP id
 y7-20020a0568301d8700b006e2dd2eaa20mr1865222oti.13.1707891919693; Tue, 13 Feb
 2024 22:25:19 -0800 (PST)
MIME-Version: 1.0
References: <20240202141109.1.I24277520ac754ea538c9b14578edc94e1df11b48@changeid>
In-Reply-To: <20240202141109.1.I24277520ac754ea538c9b14578edc94e1df11b48@changeid>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 14 Feb 2024 14:24:53 +0800
Message-ID: <CAJMQK-it9YMod4rHKnACq4O-iaGieK2SN4x5vQ018CghsA631A@mail.gmail.com>
Subject: Re: [PATCH] drm/dp: Don't attempt AUX transfers when eDP panels are
 not powered
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, eizan@chromium.org, 
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Imre Deak <imre.deak@intel.com>, Jani Nikula <jani.nikula@intel.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 14, 2024 at 2:23=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> If an eDP panel is not powered on then any attempts to talk to it over
> the DP AUX channel will timeout. Unfortunately these attempts may be
> quite slow. Userspace can initiate these attempts either via a
> /dev/drm_dp_auxN device or via the created i2c device.
>
> Making the DP AUX drivers timeout faster is a difficult proposition.
> In theory we could just poll the panel's HPD line in the AUX transfer
> function and immediately return an error there. However, this is
> easier said than done. For one thing, there's no hard requirement to
> hook the HPD line up for eDP panels and it's OK to just delay a fixed
> amount. For another thing, the HPD line may not be fast to probe. On
> parade-ps8640 we need to wait for the bridge chip's firmware to boot
> before we can get the HPD line and this is a slow process.
>
> The fact that the transfers are taking so long to timeout is causing
> real problems. The open source fwupd daemon sometimes scans DP busses
> looking for devices whose firmware need updating. If it happens to
> scan while a panel is turned off this scan can take a long time. The
> fwupd daemon could try to be smarter and only scan when eDP panels are
> turned on, but we can also improve the behavior in the kernel.
>
> Let's let eDP panels drivers specify that a panel is turned off and
> then modify the common AUX transfer code not to attempt a transfer in
> this case.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

>
>  drivers/gpu/drm/display/drm_dp_helper.c       | 35 +++++++++++++++++++
>  drivers/gpu/drm/panel/panel-edp.c             |  3 ++
>  .../gpu/drm/panel/panel-samsung-atna33xc20.c  |  2 ++
>  include/drm/display/drm_dp_helper.h           |  6 ++++
>  4 files changed, 46 insertions(+)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/di=
splay/drm_dp_helper.c
> index b1ca3a1100da..6fa705d82c8f 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -532,6 +532,15 @@ static int drm_dp_dpcd_access(struct drm_dp_aux *aux=
, u8 request,
>
>         mutex_lock(&aux->hw_mutex);
>
> +       /*
> +        * If the device attached to the aux bus is powered down then the=
re's
> +        * no reason to attempt a transfer. Error out immediately.
> +        */
> +       if (aux->powered_down) {
> +               ret =3D -EBUSY;
> +               goto unlock;
> +       }
> +
>         /*
>          * The specification doesn't give any recommendation on how often=
 to
>          * retry native transactions. We used to retry 7 times like for
> @@ -599,6 +608,29 @@ int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsign=
ed int offset)
>  }
>  EXPORT_SYMBOL(drm_dp_dpcd_probe);
>
> +/**
> + * drm_dp_dpcd_set_powered() - Set whether the DP device is powered
> + * @aux: DisplayPort AUX channel; for convenience it's OK to pass NULL h=
ere
> + *       and the function will be a no-op.
> + * @powered: true if powered; false if not
> + *
> + * If the endpoint device on the DP AUX bus is known to be powered down
> + * then this function can be called to make future transfers fail immedi=
ately
> + * instead of needing to time out.
> + *
> + * If this function is never called then a device defaults to being powe=
red.
> + */
> +void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux, bool powered)
> +{
> +       if (!aux)
> +               return;
> +
> +       mutex_lock(&aux->hw_mutex);
> +       aux->powered_down =3D !powered;
> +       mutex_unlock(&aux->hw_mutex);
> +}
> +EXPORT_SYMBOL(drm_dp_dpcd_set_powered);
> +
>  /**
>   * drm_dp_dpcd_read() - read a series of bytes from the DPCD
>   * @aux: DisplayPort AUX channel (SST or MST)
> @@ -1858,6 +1890,9 @@ static int drm_dp_i2c_xfer(struct i2c_adapter *adap=
ter, struct i2c_msg *msgs,
>         struct drm_dp_aux_msg msg;
>         int err =3D 0;
>
> +       if (aux->powered_down)
> +               return -EBUSY;
> +
>         dp_aux_i2c_transfer_size =3D clamp(dp_aux_i2c_transfer_size, 1, D=
P_AUX_MAX_PAYLOAD_BYTES);
>
>         memset(&msg, 0, sizeof(msg));
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 7d556b1bfa82..d2a4e514d8fd 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -413,6 +413,7 @@ static int panel_edp_suspend(struct device *dev)
>  {
>         struct panel_edp *p =3D dev_get_drvdata(dev);
>
> +       drm_dp_dpcd_set_powered(p->aux, false);
>         gpiod_set_value_cansleep(p->enable_gpio, 0);
>         regulator_disable(p->supply);
>         p->unprepared_time =3D ktime_get_boottime();
> @@ -469,6 +470,7 @@ static int panel_edp_prepare_once(struct panel_edp *p=
)
>         }
>
>         gpiod_set_value_cansleep(p->enable_gpio, 1);
> +       drm_dp_dpcd_set_powered(p->aux, true);
>
>         p->powered_on_time =3D ktime_get_boottime();
>
> @@ -507,6 +509,7 @@ static int panel_edp_prepare_once(struct panel_edp *p=
)
>         return 0;
>
>  error:
> +       drm_dp_dpcd_set_powered(p->aux, false);
>         gpiod_set_value_cansleep(p->enable_gpio, 0);
>         regulator_disable(p->supply);
>         p->unprepared_time =3D ktime_get_boottime();
> diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/g=
pu/drm/panel/panel-samsung-atna33xc20.c
> index 5703f4712d96..76c2a8f6718c 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> @@ -72,6 +72,7 @@ static int atana33xc20_suspend(struct device *dev)
>         if (p->el3_was_on)
>                 atana33xc20_wait(p->el_on3_off_time, 150);
>
> +       drm_dp_dpcd_set_powered(p->aux, false);
>         ret =3D regulator_disable(p->supply);
>         if (ret)
>                 return ret;
> @@ -93,6 +94,7 @@ static int atana33xc20_resume(struct device *dev)
>         ret =3D regulator_enable(p->supply);
>         if (ret)
>                 return ret;
> +       drm_dp_dpcd_set_powered(p->aux, true);
>         p->powered_on_time =3D ktime_get_boottime();
>
>         if (p->no_hpd) {
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/dr=
m_dp_helper.h
> index 863b2e7add29..472359a9d675 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -463,9 +463,15 @@ struct drm_dp_aux {
>          * @is_remote: Is this AUX CH actually using sideband messaging.
>          */
>         bool is_remote;
> +
> +       /**
> +        * @powered_down: If true then the remote endpoint is powered dow=
n.
> +        */
> +       bool powered_down;
>  };
>
>  int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset);
> +void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux, bool powered);
>  ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
>                          void *buffer, size_t size);
>  ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
> --
> 2.43.0.594.gd9cf4e227d-goog
>
