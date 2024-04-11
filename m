Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CF58A0A23
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 09:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481AF10F07A;
	Thu, 11 Apr 2024 07:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JqOKnrOP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A98B10F07A
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 07:40:58 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id
 71dfb90a1353d-4daa5d0afb5so2170213e0c.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 00:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1712821256; x=1713426056;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9nNN6WlUUNGTzkwo1N4M16DUFdPJ6ZM0diRivpuzi2Y=;
 b=JqOKnrOPHqckF0NkfC5JLu28cJzKIWf4l7XgYLe5xkgRPOHSs/E05J2jMLhXyRnxCN
 o+YWFkc4OSVDJBgJ8L/6I65OkRqEnq+GZKSkl0dTjVi3wPHKT/M8MtXI00AnL7VTuhd/
 YzVRwfH7s/TOhL0j+hbQHR3dPYDhoWejK4NyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712821256; x=1713426056;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9nNN6WlUUNGTzkwo1N4M16DUFdPJ6ZM0diRivpuzi2Y=;
 b=LMdJMMddRbHIvmsAGva1A30E5+PFudVyZXYzNMD+VoBqcWbbhlsyFJ0XG3vWf7Livh
 iQc7AySpKQ5ZSidXvgs01gnIZ/+mgnAe5zLW8Y17AUn2xBxb4GJIWWGwEnOEnTd4Hmb+
 yKgg6KNO1bTudZSKMwwIJgPmnA9iNjLezBZjWiB0iww8IncPzmIsmZQdTlL1wsBKRKeg
 2j9WtG3pynvjroOhbc6mW83jJ8TOq/x8ngNqidFz+l3YpkJCEEDv5M9Q5apebmBTNH9o
 HhZRacaL34JS+jSPKEdqd/cVtxx4cT9kHpuXhpVgRluTnhlhsVxxqk8qVJJRs01FcdLH
 MHEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXb90R/zdC/rhi2PrvSRXOI9OwmOcE8RF3IeN7fN1l+ri51F8FJk/Vmq/c+yfVEV3I2BekUDvy3VlTejA6nfRAcv/dm8ku2aPUHdv222UKh
X-Gm-Message-State: AOJu0YywBX2YqtXxfJtupbUf7nJjLscAgfqt6+VT7pIiODJvrMazS+JN
 qjQoNbRBjhFntmP7w9uBHEXt1l4/azL9fc4WK9LJbxll7Wnc89r18X6B5D299W2dc+NPZklzYnU
 aig==
X-Google-Smtp-Source: AGHT+IG38Q6GPkdkKz1JgrG4y1OQ44ffN/nrZBS58ODCvan+fEHLDNJgJkaPV+xtEDyeV0ox2vBNIQ==
X-Received: by 2002:a05:6122:512:b0:4da:dff6:16bc with SMTP id
 x18-20020a056122051200b004dadff616bcmr4700156vko.15.1712821256415; 
 Thu, 11 Apr 2024 00:40:56 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
 [209.85.160.175]) by smtp.gmail.com with ESMTPSA id
 jh17-20020a0562141fd100b006990b44228dsm612548qvb.125.2024.04.11.00.40.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 00:40:55 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-43477091797so153071cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 00:40:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWuBFP49ezVYtVuxC7TEIel2zVaIM2FPD3+lepMZVRnj80wCheNdGAhgRXzKaIXoljouLaWcyxr8uudGRmSIEkeQGsfqKcfKaj2h7qsoJ/g
X-Received: by 2002:a05:622a:4c12:b0:434:7a13:2e7e with SMTP id
 ey18-20020a05622a4c1200b004347a132e7emr198846qtb.24.1712821254947; Thu, 11
 Apr 2024 00:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240410071439.2152588-1-yangcong5@huaqin.corp-partner.google.com>
 <20240410071439.2152588-3-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240410071439.2152588-3-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 11 Apr 2024 00:40:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V2J=Tth2zhpo-kPo4uvESt70mFneO2V6TV-haac0VZuQ@mail.gmail.com>
Message-ID: <CAD=FV=V2J=Tth2zhpo-kPo4uvESt70mFneO2V6TV-haac0VZuQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] drm/panel: boe-tv101wum-nl6: Support for BOE
 nv110wum-l60 MIPI-DSI panel
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 LinusW <linus.walleij@linaro.org>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 airlied@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, Apr 10, 2024 at 12:15=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> The BOE nv110wum-l60 is a 11.0" WUXGA TFT LCD panel, which fits in nicely
> with the existing panel-boe-tv101wum-nl6 driver. Hence, we add a new
> compatible with panel specific config.

I guess we have the same question we've had with this driver in the
past: do we add more tables here, or do we break this out into a
separate driver like we ended up doing with "ili9882t". I guess the
question is: what is the display controller used with this panel and
is it the same (or nearly the same) display controller as other panels
in this driver or is it a completely different display controller.
Maybe you could provide this information in the commit message to help
reviewers understand.


> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)

Maybe add Linus W to your patches since he has had opinions on this
driver in the past. I've added him as CC here but you should make sure
to CC him on future versions unless he says not to. ;-)


> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu=
/drm/panel/panel-boe-tv101wum-nl6.c
> index 0ffe8f8c01de..f91827e1548c 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -1368,6 +1368,91 @@ static const struct panel_init_cmd starry_himax831=
02_j02_init_cmd[] =3D {
>         {},
>  };
>
> +static const struct panel_init_cmd boe_nv110wum_init_cmd[] =3D {
> +       _INIT_DELAY_CMD(60),
> +       _INIT_DCS_CMD(0xB9, 0x83, 0x10, 0x21, 0x55, 0x00),

Given that the first command of "(0xB9, 0x83, 0x10, 0x21, 0x55, 0x00)"
seems to be the same as "starry_himax83102_j02" maybe those two are
the same controller? I'm just guessing, but if those are the same
controller as the two new ones you're adding in this series, maybe all
3 of them should be in their own driver? Maybe we can do something to
make more sense of some of these commands too? There certainly seem to
be a lot of commonalities in the init sequences of all 3 and if we can
define the init sequence more logically then we can share more of the
code between the different panels and we don't have a giant duplicated
blob.


> +       _INIT_DCS_CMD(0xB9, 0x00, 0x00, 0x00),
> +       _INIT_DELAY_CMD(50),
> +       _INIT_DCS_CMD(0x11),
> +       _INIT_DELAY_CMD(110),
> +       _INIT_DCS_CMD(0x29),
> +       _INIT_DELAY_CMD(25),
> +       {},
> +};
>  static inline struct boe_panel *to_boe_panel(struct drm_panel *panel)

nit: should have a blank line between the end of your struct and the
next function.


> +static const struct panel_desc boe_nv110wum_desc =3D {
> +       .modes =3D &boe_tv110wum_default_mode,
> +       .bpc =3D 8,
> +       .size =3D {
> +               .width_mm =3D 147,
> +               .height_mm =3D 235,
> +       },
> +       .lanes =3D 4,
> +       .format =3D MIPI_DSI_FMT_RGB888,
> +       .mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PU=
LSE |
> +                     MIPI_DSI_MODE_LPM,
> +       .init_cmds =3D boe_nv110wum_init_cmd,
> +       .lp11_before_reset =3D true,
> +};
>  static int boe_panel_get_modes(struct drm_panel *panel,
>                                struct drm_connector *connector)

nit: should have a blank line between the end of your struct and the
next function.


> @@ -1973,6 +2085,9 @@ static const struct of_device_id boe_of_match[] =3D=
 {
>         { .compatible =3D "starry,himax83102-j02",
>           .data =3D &starry_himax83102_j02_desc
>         },
> +       { .compatible =3D "boe,nv110wum-l60",
> +         .data =3D &boe_nv110wum_desc
> +       },

nit: the existing panels that are supported are sorted alphabetically.
Please sort things alphabetically throughout your patch series.

-Doug
