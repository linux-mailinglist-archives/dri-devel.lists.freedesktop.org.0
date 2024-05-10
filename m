Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B865B8C2C12
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 23:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE98E10F1A1;
	Fri, 10 May 2024 21:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fhUFuXTX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E51F310E2AD
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 21:47:16 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-69b44071a07so21065456d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 14:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715377632; x=1715982432;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S2YIl+MQvRGvQIN5Fz+YZaIiDbAnY60xDJHXBLWCOro=;
 b=fhUFuXTXCmKel52LQvbF7cTDkcc1cUrcfq1z9hONMk6ci6HGL+Xl5zwN4SSt+kCXiH
 3VuHg6eKxEJywX+oaIIjIK1g/OjLFfSxXaVv0T69PhzTdVMc/wmskRSkE/MI8CP0fXAK
 sn5EGBgLKAHA2fN0rwR2Y6Y/eQIUYYAKXcyDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715377632; x=1715982432;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S2YIl+MQvRGvQIN5Fz+YZaIiDbAnY60xDJHXBLWCOro=;
 b=Sy17Qa4RwYEPOkYVEvqHSaydRDciFyNHPXbKrxoEsgKpPddjyOdPibIvZPs2q/C1Ks
 8VuglBAU9zKYb0ufAQkn9iC/kgarL4xPbSrmL0KWQ0UnkQSJh3SC/xXJtLaeOV+sLDnn
 X4pl5hDVx2wsuT6m6ZTPGBLWjhKRFqMKd5utUK7rcU60UVsGqYrYDL4qFWypE7KTXl5d
 AcG1cBySRPeIMj3Z+WdPjkCSL3ImgAgBzCCNXRtrApTW87VJ/DAnWsVBkzkW7lo7LBpU
 D9iAATKgQfkOHdnVPqEkovuR3Hb82lk/qGHxO25QGPh5yaAAjagB31Om/1H1XxxdP29v
 ke+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIBWl9giwYnV4xL6QRxR2Mx35fLxO1/S4dcwk6zBBvqbOLBVdTDC4cref4x2qiHio33K+cF5bIYhjZ2lYciZq9ofjvp2LmIFPQJivDtxJY
X-Gm-Message-State: AOJu0YxlY6aZhTv+l851czDmwgLO7NM2XOK5CElgRwyoBiqQ7PVq/khH
 FknDucPCteSl+X2O0vXgxgC/P5wo3HtvrnGc1GKoO9G0lXtGWhhvdckNqZxhKovXvjZwLbJ3Hpc
 =
X-Google-Smtp-Source: AGHT+IHZ4KLSlkoZqGreYhW0qvuOfPszcQbF3CzSed984erqaWohZqsHMJ4f3eT4HhO+DDpGfI4TMg==
X-Received: by 2002:a05:6214:33c2:b0:6a0:cad1:9ccf with SMTP id
 6a1803df08f44-6a16824bb59mr39609616d6.51.1715377631841; 
 Fri, 10 May 2024 14:47:11 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com.
 [209.85.160.177]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f1857f9sm20809336d6.49.2024.05.10.14.47.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 May 2024 14:47:11 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-439b1c72676so42121cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 14:47:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU0O5AqR7q1erwnaNkfAaDc9RWRGaGtw1CMKvMYk9RHcfo9ojsJgZ6iz/LElXZxQudexVWgQ9OwJM92Y69FeHMNS45jpQdTAMEWu+iGGOXj
X-Received: by 2002:a05:622a:5883:b0:437:c89e:245b with SMTP id
 d75a77b69052e-43e0a1d2a53mr207461cf.15.1715377619819; Fri, 10 May 2024
 14:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240510-dsi-panels-upd-api-v1-0-317c78a0dcc8@linaro.org>
 <20240510-dsi-panels-upd-api-v1-5-317c78a0dcc8@linaro.org>
In-Reply-To: <20240510-dsi-panels-upd-api-v1-5-317c78a0dcc8@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 10 May 2024 14:46:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VG7fSNoSo61T71PdciXHPVZhUE1Gr-8_sBXXsJZ9MGiw@mail.gmail.com>
Message-ID: <CAD=FV=VG7fSNoSo61T71PdciXHPVZhUE1Gr-8_sBXXsJZ9MGiw@mail.gmail.com>
Subject: Re: [PATCH RFC 5/7] drm/panel: novatek-nt36672e: use wrapped MIPI DCS
 functions
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org, 
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

On Thu, May 9, 2024 at 3:37=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Remove conditional code and always use mipi_dsi_dcs_*multi() wrappers to
> simplify driver's init/exit code. This also includes passing context to
> the init_sequence() function instead of passing the DSI device.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-novatek-nt36672e.c | 587 ++++++++++++-------=
------
>  1 file changed, 281 insertions(+), 306 deletions(-)

One note is that we might not be able to land ${SUBJECT} patch since
the patch it's based on [1] doesn't have any Reviewed-by tags. Just
sayin'. ;-)

[1] https://lore.kernel.org/r/20240508135148.v4.6.I3c08a7d02c467d2bc88da14e=
513ea4c8649fce45@changeid


> @@ -381,61 +377,40 @@ static int nt36672e_power_off(struct nt36672e_panel=
 *ctx)
>         return ret;
>  }
>
> -static int nt36672e_on(struct nt36672e_panel *ctx)
> +static int nt36672e_on(struct nt36672e_panel *panel)

Small nit that I think of the variable "panel" as referring to a
"struct drm_panel". I'd personally rather this be named something
else, like "nt36672e".


>  {
> -       struct mipi_dsi_device *dsi =3D ctx->dsi;
> -       const struct panel_desc *desc =3D ctx->desc;
> -       int ret =3D 0;
> +       struct mipi_dsi_multi_context ctx =3D { .dsi =3D panel->dsi };
> +       struct mipi_dsi_device *dsi =3D panel->dsi;
> +       const struct panel_desc *desc =3D panel->desc;
>
>         dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
>
> -       if (desc->init_sequence) {
> -               ret =3D desc->init_sequence(dsi);
> -               if (ret < 0) {
> -                       dev_err(&dsi->dev, "panel init sequence failed: %=
d\n", ret);
> -                       return ret;
> -               }
> -       }
> +       if (desc->init_sequence)
> +               desc->init_sequence(&ctx);
>
> -       ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> -       if (ret < 0) {
> -               dev_err(&dsi->dev, "Failed to exit sleep mode: %d\n", ret=
);
> -               return ret;
> -       }
> -       msleep(120);
> +       mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
> +       mipi_dsi_msleep(&ctx, 120);
>
> -       ret =3D mipi_dsi_dcs_set_display_on(dsi);
> -       if (ret < 0) {
> -               dev_err(&dsi->dev, "Failed to set display on: %d\n", ret)=
;
> -               return ret;
> -       }
> -       msleep(100);
> +       mipi_dsi_dcs_set_display_on_multi(&ctx);
>
> -       return 0;
> +       mipi_dsi_msleep(&ctx, 100);
> +
> +       return ctx.accum_err;
>  }
>
> -static int nt36672e_off(struct nt36672e_panel *ctx)
> +static int nt36672e_off(struct nt36672e_panel *panel)
>  {
> -       struct mipi_dsi_device *dsi =3D ctx->dsi;
> -       int ret =3D 0;
> +       struct mipi_dsi_multi_context ctx =3D { .dsi =3D panel->dsi };
>
> -       dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
> +       panel->dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
>
> -       ret =3D mipi_dsi_dcs_set_display_off(dsi);
> -       if (ret < 0) {
> -               dev_err(&dsi->dev, "Failed to set display off: %d\n", ret=
);
> -               return ret;
> -       }
> -       msleep(20);
> +       mipi_dsi_dcs_set_display_off_multi(&ctx);
> +       mipi_dsi_msleep(&ctx, 20);
>
> -       ret =3D mipi_dsi_dcs_enter_sleep_mode(dsi);
> -       if (ret < 0) {
> -               dev_err(&dsi->dev, "Failed to enter sleep mode: %d\n", re=
t);
> -               return ret;
> -       }
> -       msleep(60);
> +       mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
> +       mipi_dsi_msleep(&ctx, 60);
>
> -       return 0;
> +       return ctx.accum_err;
>  }

nit: similar to other patches in the series, the callers of
nt36672e_on() and nt36672e_off() should be able to get rid of their
error prints.

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
