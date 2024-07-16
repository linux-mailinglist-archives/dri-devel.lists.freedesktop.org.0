Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B685A932C5F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 17:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E520410E798;
	Tue, 16 Jul 2024 15:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="dT2ksDvU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8706410E798
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 15:54:32 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-708bf659898so1745630a34.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 08:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721145271; x=1721750071;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Cptj2CuYa/Zbm4OtWYM2fatIt6ccC2m1uYdd4iqOhs=;
 b=dT2ksDvUhbt9d6jX2iYoA4BdK/H5zXGEa44bFlk0chMgTBpMu/UnSkGQQ4zo92kRIO
 ovTpsNgmn2M7fwzEBGKDfJg/ee4ET9imfX1J3m6Qlz3Og5J1iYB/oAlIHOUaTBNjW2YJ
 YeZNtK0hMR/3beJmtF3Pb8Bt0Ex2/8bHqViGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721145271; x=1721750071;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Cptj2CuYa/Zbm4OtWYM2fatIt6ccC2m1uYdd4iqOhs=;
 b=ee6spxQy4or/mIa6l4kpEiDcZypg+fXLYCcoFNkdJbIJOwFfiS/XtvlVj9kbXfuaCn
 DCuGA4HyQ9TCL9wowIFy4ilU2DhGIJOQB7GFgwp3j0YdmkQTxEe0ycaRHvdI5xD6Fqb4
 StuFssUWLIG1Bb/7ln7Z3cETG4BwFhIr6L6o2gKeVthLVwgl706rN49HDmJeAgIWPsQH
 8Nk5+6vj9re8AlyQ0vtxQnKhQ32uXIbNVsGdo4s3q/198jiGyrr+NcvZQ/ycTagoA7XQ
 4yfGiXgW+9TJSjbYYdQ3z9dTk5hZPeX+erkU721Aj4f7qWLLI4/KJPiVmAx6zF1aVPT4
 uOTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhOSuRcFiUwHKyEvk8LX/4ep51Vv5elLrmfycLlW5tb6lmqmvRy2UelIc08/JACHrGlrNH8hajwIk7bCGPkqrq3wBSK12e96qeh8blqpJW
X-Gm-Message-State: AOJu0YyEc+2gl8v8GuSE90kcrEhe4CJtfLTYqlElG71xBmyvZM6Ie/uv
 63xMknhh6ji/OObyLwHFzSspcd1HvxYCku2Ngjh6iJIOOGMQIFH5B9MaXZ1DmikRnXSSa11WRWU
 =
X-Google-Smtp-Source: AGHT+IEPaoMKFUAzCMgHNfY2bMLGNmXUxpC1/9R6GsH6odaVtNv5HApVnss4wDXWo4Tu3kztzQ2m5w==
X-Received: by 2002:a05:6830:7191:b0:703:6d56:92bd with SMTP id
 46e09a7af769-708d972a58bmr2853381a34.0.1721145271077; 
 Tue, 16 Jul 2024 08:54:31 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com.
 [209.85.160.179]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b76198d795sm32140816d6.53.2024.07.16.08.54.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 08:54:30 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-447df43324fso347981cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 08:54:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU+JnSxcCPv7yP23vxXDxMiqdWX1Sgd7q5iQVXbKphX0ZJ90g3Ayj5VWvrBE4KafH4N3TksccWADHn+cGozN5VsdJcMzBrSv8JsTX3ASE2Z
X-Received: by 2002:a05:622a:5298:b0:447:e01a:de95 with SMTP id
 d75a77b69052e-44f7a30445dmr4001041cf.0.1721145269303; Tue, 16 Jul 2024
 08:54:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240716121112.14435-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240716121112.14435-3-lvzhaoxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240716121112.14435-3-lvzhaoxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 16 Jul 2024 08:54:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U+Y551wC99w4b7Xjv7S7YOG2pYm6t1CpjDGbowbAGxbw@mail.gmail.com>
Message-ID: <CAD=FV=U+Y551wC99w4b7Xjv7S7YOG2pYm6t1CpjDGbowbAGxbw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/panel: boe-th101mb31ig002 : using
 drm_connector_helper_get_modes_fixed()
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, airlied@gmail.com, 
 mripard@kernel.org, hsinyi@google.com, awarnecke002@hotmail.com, 
 quic_jesszhan@quicinc.com, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
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

On Tue, Jul 16, 2024 at 5:11=E2=80=AFAM Zhaoxiong Lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> Use public functions(drm_connector_helper_get_modes_fixed()) to
> get porch parameters.
>
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
>  .../drm/panel/panel-boe-th101mb31ig002-28a.c  | 26 ++-----------------
>  1 file changed, 2 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drive=
rs/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> index d4e4abd103bb..4a61a11099b6 100644
> --- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> +++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> @@ -16,6 +16,7 @@
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_modes.h>
>  #include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
>
>  struct boe_th101mb31ig002;
>
> @@ -313,31 +314,8 @@ static int boe_th101mb31ig002_get_modes(struct drm_p=
anel *panel,
>                                                       struct boe_th101mb3=
1ig002,
>                                                       panel);
>         const struct drm_display_mode *desc_mode =3D ctx->desc->modes;
> -       struct drm_display_mode *mode;
>
> -       mode =3D drm_mode_duplicate(connector->dev, desc_mode);
> -       if (!mode) {
> -               dev_err(panel->dev, "Failed to add mode %ux%u@%u\n",
> -                       desc_mode->hdisplay, desc_mode->vdisplay,
> -                       drm_mode_vrefresh(desc_mode));
> -               return -ENOMEM;
> -       }
> -
> -       drm_mode_set_name(mode);
> -
> -       connector->display_info.bpc =3D 8;

I notice that drm_connector_helper_get_modes_fixed() doesn't seem to
set bpc. Unless I'm mistaken and that gets set automatically somewhere
else then you should keep that, right?

> -       connector->display_info.width_mm =3D mode->width_mm;
> -       connector->display_info.height_mm =3D mode->height_mm;
> -
> -       /*
> -        * TODO: Remove once all drm drivers call
> -        * drm_connector_set_orientation_from_panel()
> -        */
> -       drm_connector_set_panel_orientation(connector, ctx->orientation);

Are we confident that all the other users of this panel are properly
getting the orientation and we can remove the above bit of code? It
looks like one other user is 'rk3566-pinetab2'.

From what I recall, the relevant commits are commit 15b9ca1641f0
("drm: Config orientation property if panel provides it") and commit
e3ea1806e4ad ("drm/bridge: panel: Set orientation on panel_bridge
connector"). I think in all cases the assumption was that, to get the
right functionality we need to switch to "panel_bridge". That happens
when we use drmm_of_get_bridge() or devm_drm_of_get_bridge(). ...but
it looks like Rockchip DRM is directly using
drm_of_find_panel_or_bridge() and thus hasn't switched to panel
bridge.

...so, unless I'm mistaken, the other users of this panel driver still
need the drm_connector_set_panel_orientation() call here and you
shouldn't remove it. Perhaps Alexander Warnecke could comment about
whether this is still needed. ...or perhaps someone who maintains
Rockchip DRM can say whether they have any plans around this area?

If, for some reason, you do remove it then it should at least be
called out in the description since this is a functionality change.

-Doug
