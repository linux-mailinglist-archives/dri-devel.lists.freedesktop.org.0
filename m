Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA6390BBBA
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 22:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D4210E477;
	Mon, 17 Jun 2024 20:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Oer8NVOn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50FE10E477
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 20:07:15 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-6b06bedc5d1so27354876d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 13:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718654833; x=1719259633;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SpQL0yvq1dDs98zST/M1XEikwLlL17e1VjSWuuysSL4=;
 b=Oer8NVOnQy/+mHEOSkJVun9yaciUw7DRx9tbb2XX/LIb7p3tInfZzNZnE5PAaoqWNR
 XtQgGeczy2cAiANqUAA/znGpv3WuEvwkv0tStNdfxi1ZKu9khfyxNH82Xl6VaYyGeJRY
 cJmSVc+9N/wIN7qgmjsMk4RB5t2Vxkma5ux/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718654833; x=1719259633;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SpQL0yvq1dDs98zST/M1XEikwLlL17e1VjSWuuysSL4=;
 b=tTKrec1XZ+iL9JIhftCH77PAyEZkTmyy0jnxjBMPbuKFUAx4a/rHa00/SVYYYpwH7/
 Nd4VowTOdj2OYNQlbKGGxNoW/3aAJ9EYEILKl9MxGTKBh9lW4iCVI/MqmxnyFiHhw8Qt
 w/H0W6f0j7hJ5jFPks3/CEx3SRmjBkOzNYhm8wvk2d6Kfmpu3TBBghBLix0jf5tb89gA
 gIJ0AbJm6TBaelujmi6D3K0hIEbn/LJu3j2SEcYWqb23nvMTl3NbOig4RYEVOFJDQNus
 tBPhqzzN3y3Hie7Msw3piYnz0U7nAUtosc59JL7wTWhc5vbMos405S7s4nlxRiBHQaSK
 KkVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0NyCFGoHLmlC/plIYaHi/G5vKlhpDSXtWymFzJdFZzVyT8ypP854DYwRXQqQZPzWYcwenJd6dy62o5KWCYQdGZLbd+ANvHExiDQWZ42Kt
X-Gm-Message-State: AOJu0YzBWDR3THE2X6MSFQy7OS6gDWt4ElfayDp2hbQLFlZTw1WuDx2D
 3Ow2FcGqu5JU+fs1P9GdPwUtdzo3oYPOQ/VDYhESrBNiD9BQ+0FcXfmxxjuC6h+OApsc41p8C5g
 =
X-Google-Smtp-Source: AGHT+IFU195DFDb7gb2KXu0+/UC3VTtZDAhX4f/ZOGf9pu1dF52cSD03f2uveCjm/X0tCUr+VOm5Cw==
X-Received: by 2002:a0c:e88e:0:b0:6b0:65cd:c09f with SMTP id
 6a1803df08f44-6b2afc9b408mr108702186d6.18.1718654833329; 
 Mon, 17 Jun 2024 13:07:13 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com.
 [209.85.160.176]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5efd278sm58986066d6.128.2024.06.17.13.07.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 13:07:12 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-443586c2091so104971cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 13:07:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXu/Dl1qtuz2+j4zuDQijZ8wZcqioTiBp/rNG3FvkIPO5pRZM6dSJuwSHDELy0WoO6I/ZblFQcFMkwzzTCDqjRwYbo8voT5QCVVEJkBdJzc
X-Received: by 2002:a05:622a:1a17:b0:442:1b20:2a9a with SMTP id
 d75a77b69052e-4449daa1b48mr5921cf.23.1718654832085; Mon, 17 Jun 2024 13:07:12
 -0700 (PDT)
MIME-Version: 1.0
References: <20240615093758.65431-1-tejasvipin76@gmail.com>
In-Reply-To: <20240615093758.65431-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 17 Jun 2024 13:06:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XRZKL_ppjUKDK61fQkWhHiQCJLfmVBS7wSo4sUux2g8Q@mail.gmail.com>
Message-ID: <CAD=FV=XRZKL_ppjUKDK61fQkWhHiQCJLfmVBS7wSo4sUux2g8Q@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: raydium-rm692e5: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Hi,

On Sat, Jun 15, 2024 at 2:40=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> @@ -168,48 +147,38 @@ static int rm692e5_prepare(struct drm_panel *panel)
>         struct rm692e5_panel *ctx =3D to_rm692e5_panel(panel);
>         struct drm_dsc_picture_parameter_set pps;
>         struct device *dev =3D &ctx->dsi->dev;
> -       int ret;
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi };
>
> -       ret =3D regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->sup=
plies);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to enable regulators: %d\n", ret);
> -               return ret;
> +       dsi_ctx.accum_err =3D regulator_bulk_enable(ARRAY_SIZE(ctx->suppl=
ies), ctx->supplies);
> +       if (dsi_ctx.accum_err) {
> +               dev_err(dev, "Failed to enable regulators: %d\n", dsi_ctx=
.accum_err);
> +               return dsi_ctx.accum_err;
>         }

It would be my preference to get rid of the error print here since
regulator_bulk_enable() already prints an error message.


>         rm692e5_reset(ctx);
>
> -       ret =3D rm692e5_on(ctx);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +       dsi_ctx.accum_err =3D rm692e5_on(ctx);
> +       if (dsi_ctx.accum_err) {
> +               dev_err(dev, "Failed to initialize panel: %d\n", dsi_ctx.=
accum_err);

I'd probably change rm692e5_on() to take the "dsi_ctx" as a parameter
and then you don't need to declare a new one there.

...also, you don't need to add an error message since rm692e5_on()
will have already printed one (since the "multi" style functions
always print error messages for you).



>                 gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>                 regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->su=
pplies);
> -               return ret;
> +               return dsi_ctx.accum_err;

Not new for your patch, but it seems odd that we don't do this error
handling (re-assert reset and disable the regulator) for errors later
in the function. Shouldn't it do that? It feels like the error
handling should be in an "err" label and we should end up doing that
any time we return an error code... What do you think?


-Doug
