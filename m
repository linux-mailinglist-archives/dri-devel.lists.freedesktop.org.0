Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 735DFCF4F57
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 18:19:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAAC910E23A;
	Mon,  5 Jan 2026 17:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="REP1ruL8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2B110E23A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 17:18:59 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id
 a640c23a62f3a-b736ffc531fso39099466b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 09:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1767633537; x=1768238337;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jyEq9qa7TDQIzBWJq5aVUtj/juytXvj0ykbdRsaUi5E=;
 b=REP1ruL8nzqzUHqfUvUmcS+VeucFV1C0wHaxvbssCfgZDfL8vb1hOKh7HPRLyJoFBl
 NSGQssZsMAAQrdlcKvv0s57XtT0JsIZuYQq7JfwVigmeGI+FDdviPtpVZYgEdU4KEnw1
 fF/CKwb7UMgrmNhgJCENbCa9p2JqXRW70UM+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767633537; x=1768238337;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jyEq9qa7TDQIzBWJq5aVUtj/juytXvj0ykbdRsaUi5E=;
 b=Ya/4QYhizzStBUfpz3stvDq7UX9EYBsD0dRO4XMn1RugKHviXVgYT0StoDSjp0pcZI
 riQWvFsKkd1ryHdgUyCkZgvMR0K07jPZwMnIcKxFQ+GTtNE1iNV/S6oIivS3tMAksSB5
 DVdExb3kljUw9cuz3uLzStxGICm2pcQMo/7gMhWchKQETbDRWdcwRqzSM8FNufrtmH2l
 epDBZ2jFGPwOQDxGAoWbJ+zNS/s+MqeWatptQB3HFGrrVRTdmq9sgdSESAWBAsNd7Nqg
 DeTkoazVy0hzFR1Rs8sT/kcnACy60ksUa8/HkLbuLOBA4D8hEHa0ZK4gtYPuelG0xnhW
 hQSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK0eopESl6Bad6Ay0IUscB6+xZI54vV3aeJPSmAB1LeVPsicNTQj8p6BAh0b+paAb8jVQ3ykrCG1w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydzC19ii2P2DN2sdbShwtULodDWQI4TvQv24uz0PuGcOh+HMLQ
 H/4XRrb2UPFTgNz/xzSxyRESXvGWyKxn9dwTJueidqSwU40fMOda3wfTHJZcTIwiG7Ea6QzKZdg
 zNkFgqRI2
X-Gm-Gg: AY/fxX5PDoq6lGN7dH1jUX268DgtNPn7I8dUkgctrhsYfyANxycY5VuDqF5BF1y11Fp
 3EyLJB/72u8k3FWnqSqA881o1Vv+KFguvGl5YgToo1oBPCpXDvlZ1O5pOACT1AxkhZ9ZYbi6PR5
 1ByEZRoONqm0v/7/AbCB/eYSbhAGt5mNCDyA0LdUvinfBA7k+Qr6aT2rIcJKJqke6lboLSYfJuO
 +xxw7+tT3GCxnq/PvDqN6dzYinX7l9DjDGVbGEixaXENZ38Hpr5nY7DpaPHzR1vUej2VjC1XCKU
 xZUvi4S9VjP8AXVB+H4Y3kOGpqQwfier40nb6qZmOntuwaFnotz+Mq6uzbS+E2OHowouvzDILQu
 brJRLaYIbg0d1z7j0RgebXmMvzdGv1hCnam3c3KaP3A8lMDTN/9pMFghvoKz4lOJkoUCOfStNSL
 e2i2qXkOfEIU2vwL73sdU8NeZiwggVbDUw39LSsLyVz44cBwhIJyFpFrxWaRf4
X-Google-Smtp-Source: AGHT+IFELZ+l4LLgu5Rf0ZuFsNGNFmuRzZw9d1q+MaNR06KO5Z8vVM/etagRDYTAe2gNGw+kKHVWdg==
X-Received: by 2002:a17:907:60d2:b0:b79:e4db:2e9 with SMTP id
 a640c23a62f3a-b8426c4fbb0mr43768566b.60.1767633537195; 
 Mon, 05 Jan 2026 09:18:57 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507618cc31sm304186a12.24.2026.01.05.09.18.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 09:18:56 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-432777da980so67882f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 09:18:56 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUA4kj6Ohkg+ra8/Wi7MASKRmpGsaKHcOS0fdaQeTefJFS16vvycGyFj2I2ekCpZbA0l4Vx4x+dcbE=@lists.freedesktop.org
X-Received: by 2002:a05:6000:2209:b0:432:b951:e9ff with SMTP id
 ffacd0b85a97d-432bca50942mr736622f8f.53.1767633535813; Mon, 05 Jan 2026
 09:18:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1767111804.git.robin.murphy@arm.com>
 <027763b36fbad2005d09eeb289b7716c57f65e76.1767111809.git.robin.murphy@arm.com>
In-Reply-To: <027763b36fbad2005d09eeb289b7716c57f65e76.1767111809.git.robin.murphy@arm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 5 Jan 2026 09:18:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V4Q7MxsHJivfaO6JD5uW0Dqa4K1OsYmmerdsw5Apjkcw@mail.gmail.com>
X-Gm-Features: AQt7F2pluFldn98dXmv9Vd4lrpkG1uNZNZvh3TeVxvGJlWd-_jEbDvtmnHtLVpg
Message-ID: <CAD=FV=V4Q7MxsHJivfaO6JD5uW0Dqa4K1OsYmmerdsw5Apjkcw@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/panel-edp: Move FriendlyELEC HD702E
To: Robin Murphy <robin.murphy@arm.com>
Cc: heiko@sntech.de, neil.armstrong@linaro.org, thierry.reding@gmail.com, 
 sam@ravnborg.org, jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

On Tue, Dec 30, 2025 at 9:20=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> FriendlyELEC's HD702E module is an eDP panel (in as much as it's some
> LVDS LCD behind a Chrontel CH7511B eDP bridge), so move its data over
> to the eDP driver, also resolving the warning about the missing bpc
> value in the process.
>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c    | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/panel/panel-simple.c | 25 -------------------------
>  2 files changed, 26 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 415b894890ad..dd53ccc209ce 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1256,6 +1256,29 @@ static const struct panel_desc boe_nv140fhmn49 =3D=
 {
>         },
>  };
>
> +static const struct drm_display_mode friendlyarm_hd702e_mode =3D {
> +       .clock          =3D 67185,
> +       .hdisplay       =3D 800,
> +       .hsync_start    =3D 800 + 20,
> +       .hsync_end      =3D 800 + 20 + 24,
> +       .htotal         =3D 800 + 20 + 24 + 20,
> +       .vdisplay       =3D 1280,
> +       .vsync_start    =3D 1280 + 4,
> +       .vsync_end      =3D 1280 + 4 + 8,
> +       .vtotal         =3D 1280 + 4 + 8 + 4,
> +       .flags          =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> +};
> +
> +static const struct panel_desc friendlyarm_hd702e =3D {
> +       .modes =3D &friendlyarm_hd702e_mode,
> +       .num_modes =3D 1,
> +       .bpc =3D 8,
> +       .size =3D {
> +               .width  =3D 94,
> +               .height =3D 151,
> +       },
> +};
> +
>  static const struct drm_display_mode innolux_n116bca_ea1_mode =3D {
>         .clock =3D 76420,
>         .hdisplay =3D 1366,
> @@ -1663,6 +1686,9 @@ static const struct of_device_id platform_of_match[=
] =3D {
>         }, {
>                 .compatible =3D "boe,nv140fhmn49",
>                 .data =3D &boe_nv140fhmn49,
> +       }, {
> +               .compatible =3D "friendlyarm,hd702e",
> +               .data =3D &friendlyarm_hd702e,

Do you actually need this? I notice that in the DTS patch you've got
things under the DP AUX bus, which should enable you to use the
generic "edp-panel" compatible string assuming the EDID is populated
properly and there are no problems with power sequencing. IMO the only
reasons we should be adding new entries to "platform_of_match" these
days is if we need to work with some legacy eDP controller that can't
be updated to handle the DP AUX BUS or we've got a controller with a
bogus EDID...

-Doug
