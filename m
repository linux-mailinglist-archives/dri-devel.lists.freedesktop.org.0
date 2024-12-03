Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AEB9E1086
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 01:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0181210E1D0;
	Tue,  3 Dec 2024 00:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="QcfPqTiS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B5210E1D0
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 00:50:19 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53dd0cb9ce3so4357976e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 16:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733187015; x=1733791815;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ZcWaBKUD4iBCtIXIZmlq0ZY4HOgABbRlTjwZH9kmDE=;
 b=QcfPqTiSqucW0kqur9sktBtYDirBL534Y5asocXm1VTcFq3+iaU9BQH0ynnXQfyoh/
 8L8uArhXK/9s55lxidejMdFStznD/j7gxYq9pcZaarPFEE/+MOGVAGCPhaSe0OVeQiND
 LCAw9yF1aQ7hG+YuU3UvGMBEinsgSJGEem/s4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733187015; x=1733791815;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ZcWaBKUD4iBCtIXIZmlq0ZY4HOgABbRlTjwZH9kmDE=;
 b=N7r9yQu3hOgbmOS5MLQrL3/0n1wlNvNdf83xwYL2rtMus3pYS7+4lhoRLOTXAkw7g/
 RsOzVSPvdES3s8INUzxQ0/eXo0sDOi5Cnf0m6FvR07MOlFCsf0enqMuiGK/lgM8L0DJo
 yG0GprPRBikfMtDrLuv1pz3Zqi5vl8tV6HKNCFyw8DTZK4ESUznkZJUKYz2fjEp5sWAq
 RuPDkRuWI/v8j/TfiokLhLL0hRlZbbt3lrKUILC9yfiswKEfFQkK41Dgw0f5HTw3f1LF
 oE7YwCVbN6kGGNZr1ZdYMC/jHmFKZybGEgSwIu4OxS/WBTyJh1SvIW2Q2t4cBii0QQo1
 +EPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7wBoqmMqdInMF7BtuZfgr9Vs/QyBI20t+Mrs9ZN7xUQ3rdJPfKJIs22J0OzVMdS9b3H+dD8zCsgg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxBKeq9amVZHJzhoeWLdL5ORuJlPZ/5wQ5knRlpjZX4ynf+Nvw
 n1QOBXiEufcRIb1CVvJw3RovvP/AvenGG/E/ajVAiKzUDZ90RKHa1L+nrgGs+l0CUiYzMW2Ey7v
 T0Q==
X-Gm-Gg: ASbGnctJ1Bf5FoLoZlL9Ynpfqy5bwearNC6dlBwVt6A7aqBZ7r8kG8MxUvE9/5wNCXd
 3RcoD6GpOGbl7djS6h+R/AEeG38+QDOsI7hn5wScQPi3gKXph3MxILJXq3oqR8EVhMhRycrNC7V
 QrlTosd77Oo6rhWTYkqGNmVnrmobxxkb0PdNwP3NEQoDJR65FYUjruR2/XLkneCcTFuViQlC+x7
 hqf2aCFakUdB0Fpvn02s7CzP7t3eNu7L+7qrILL4vuM9J9h7GlnlLfLXcZZyIoECIN7dtEPa0Z/
 FZbKexje1AT3mg==
X-Google-Smtp-Source: AGHT+IF3Z9lEg92fLLvAxtuaNSupZu9uFkeUMehe2RNeaVwGjAIq4UDz+kFRAbimwOQAxFol0ja9bQ==
X-Received: by 2002:a05:6512:3ba4:b0:53d:ee8d:8d86 with SMTP id
 2adb3069b0e04-53e12a3927amr141337e87.52.1733187014960; 
 Mon, 02 Dec 2024 16:50:14 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df64318c5sm1647137e87.11.2024.12.02.16.50.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 16:50:14 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53df1d1b6e8so5105202e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 16:50:13 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXuXqAOwkJcyhene3mG6H1FOnE89gzcCiQEARMSUeTOfhLSmurxr+jWn/1yNxH3DnCoSSXdgxwFHH8=@lists.freedesktop.org
X-Received: by 2002:a05:6512:1313:b0:53d:dd6b:8bdc with SMTP id
 2adb3069b0e04-53e129ef81emr179847e87.1.1733187013144; Mon, 02 Dec 2024
 16:50:13 -0800 (PST)
MIME-Version: 1.0
References: <20241202114731.1005549-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20241202114731.1005549-2-u.kleine-koenig@baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 2 Dec 2024 16:50:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WWqEsqgjqBHb1nVnGhe7c2Su7ugfsF-CLRxCH+cFaDfg@mail.gmail.com>
Message-ID: <CAD=FV=WWqEsqgjqBHb1nVnGhe7c2Su7ugfsF-CLRxCH+cFaDfg@mail.gmail.com>
Subject: Re: [PATCH v2] drm: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Liu Ying <victor.liu@nxp.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>, 
 Ian Ray <ian.ray@ge.com>, Martyn Welch <martyn.welch@collabora.co.uk>, 
 Jagan Teki <jagan@amarulasolutions.com>, Russell King <linux@armlinux.org.uk>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>, Jani Nikula <jani.nikula@intel.com>, 
 Pin-yen Lin <treapking@chromium.org>, "Rob Herring (Arm)" <robh@kernel.org>, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>, 
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, dri-devel@lists.freedesktop.org
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

On Mon, Dec 2, 2024 at 3:47=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> These drivers don't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize this member.
>
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.
>
> While add it, also remove commas after the sentinel entries.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
> Hello,
>
> changes since (implicit) v1
> (https://lore.kernel.org/dri-devel/20240516123837.81664-2-u.kleine-koenig=
@pengutronix.de):
>
>  - Update author email address
>  - Rebase (trivially) to latest next
>  - Also convert drivers/gpu/drm/bridge/ite-it6263.c (which is new since
>    the series was orginally sent in May)
>
> Best regards
> Uwe
>
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c       | 2 +-
>  drivers/gpu/drm/bridge/analogix/anx7625.c                | 2 +-
>  drivers/gpu/drm/bridge/chrontel-ch7033.c                 | 2 +-
>  drivers/gpu/drm/bridge/ite-it6263.c                      | 2 +-
>  drivers/gpu/drm/bridge/ite-it6505.c                      | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt8912b.c                 | 4 ++--
>  drivers/gpu/drm/bridge/lontium-lt9611.c                  | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c               | 2 +-
>  drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 8 ++++----
>  drivers/gpu/drm/bridge/nxp-ptn3460.c                     | 4 ++--
>  drivers/gpu/drm/bridge/sii902x.c                         | 4 ++--
>  drivers/gpu/drm/bridge/sii9234.c                         | 4 ++--
>  drivers/gpu/drm/bridge/sil-sii8620.c                     | 4 ++--
>  drivers/gpu/drm/bridge/tc358767.c                        | 2 +-
>  drivers/gpu/drm/bridge/tc358768.c                        | 4 ++--
>  drivers/gpu/drm/bridge/ti-dlpc3433.c                     | 2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c                    | 4 ++--
>  drivers/gpu/drm/bridge/ti-tfp410.c                       | 2 +-
>  drivers/gpu/drm/i2c/ch7006_drv.c                         | 2 +-
>  drivers/gpu/drm/i2c/sil164_drv.c                         | 2 +-
>  drivers/gpu/drm/i2c/tda9950.c                            | 4 ++--
>  drivers/gpu/drm/i2c/tda998x_drv.c                        | 2 +-
>  22 files changed, 33 insertions(+), 33 deletions(-)

This conflicts with commit dbf7986f8a56 ("drm/bridge: Constify struct
i2c_device_id"). Can you rebase, please?

Other than that:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
