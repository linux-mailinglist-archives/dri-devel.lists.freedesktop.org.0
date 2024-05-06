Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0B58BCD8A
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 14:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBEBB10E00D;
	Mon,  6 May 2024 12:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XG/A/0RP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5B810E5D0
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 12:13:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6BDB9CE0D55
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 12:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB788C4AF67
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 12:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714997587;
 bh=SJorlvBhI60itC7iiQx26RslvUGaX59HbR2ZqMGANGk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XG/A/0RPtmpxF8KzxNDsBqtVTipjfffh68vuGTv4CF1NkIzQcAl66ev7nIH4aEVEb
 g1v+inLWVqSwUyx7srz68yAnEiqj5LmAuMewDtjCYc2D6a5wK6R132ZZOOnYt75d9L
 VglcF7MA6E7+inXJ17Fv/GC9aNZFi54ENR1FixCPQVmJ6iCYksGkmPUeKyhJrnm8Mj
 AZWCJCQxfW3epDHCFWqVjOj4Jsu0Y6JxpHjSFHSysdU1gP0pcDv3bNcCWtTEYPDEn4
 918uJoFaEWrnGkCQrFejpsj1IMRE50xLkTo74zErAl6kfVr7S2Q85YP0Ud7F9GLi0u
 RnfF1iFh/v9QQ==
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-de59daab3f3so1882232276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 05:13:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWqsh0c8osgdZkGCCJ95WlmcO1Nt9xgT6MAhwp2gZ4ZxrcT3+GB++U7Z+7whlNH0X6YIdx5N4ImzaRaXtzNCpn/agtiC8hMP8FxbxI70ng3
X-Gm-Message-State: AOJu0YzEg88y212ad1K3XFiIYHaupeF4pqwIz7FJMLHsNNnRReh+klbe
 OpUy8QIaZL20HVMkcOlAKAno5cpbj/B9pgxwmk9/s7RnT+Sg1BDUo04SJjSfkTeeH8J+wM76tSx
 T06P1pXbyNlnHEFMELDD2ty/8gbWKUOVoMw5z3Q==
X-Google-Smtp-Source: AGHT+IEdvvzDKPPs35mauLYBPaP2BlZLW/tD4jzIuzbyL2tiOrWFfQ0DbgvnC6EA7OV6cZIuLrHmcp8oSAKySJVe49A=
X-Received: by 2002:a05:6902:1b01:b0:ddd:7456:d203 with SMTP id
 eh1-20020a0569021b0100b00ddd7456d203mr11606197ybb.41.1714997586640; Mon, 06
 May 2024 05:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240502-anx-tdm-v1-0-894a9f634f44@chromium.org>
 <20240502-anx-tdm-v1-2-894a9f634f44@chromium.org>
In-Reply-To: <20240502-anx-tdm-v1-2-894a9f634f44@chromium.org>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 6 May 2024 14:12:55 +0200
X-Gmail-Original-Message-ID: <CAN6tsi79jNhCybjyX3aQjXAP_J6MpjuCBL5q2aFrgjENPt60kA@mail.gmail.com>
Message-ID: <CAN6tsi79jNhCybjyX3aQjXAP_J6MpjuCBL5q2aFrgjENPt60kA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: anx7625: Change TDM setting accroding to
 dt property
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Xin Ji <xji@analogixsemi.com>, dri-devel@lists.freedesktop.org, 
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

On Thu, May 2, 2024 at 11:03=E2=80=AFAM Hsin-Te Yuan <yuanhsinte@chromium.o=
rg> wrote:
>
> For some SoCs, the TDM setting is not to shift the first audio data bit,
> which is not the default setting of anx7625. In such cases, the TDM
> setting should be changed according to the device tree property.
>
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++++++
>  drivers/gpu/drm/bridge/analogix/anx7625.h | 1 +
>  2 files changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/=
bridge/analogix/anx7625.c
> index 29d91493b101a..538edddf313c9 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1709,6 +1709,9 @@ static int anx7625_parse_dt(struct device *dev,
>         if (of_property_read_bool(np, "analogix,audio-enable"))
>                 pdata->audio_en =3D 1;
>
> +       if(!of_property_read_bool(np, "no-shift-audio-data"))
> +               pdata->shift_audio_data =3D 1;

checkpatch --strict reports this:

ERROR: space required before the open parenthesis '('
#27: FILE: drivers/gpu/drm/bridge/analogix/anx7625.c:1712:
+    if(!of_property_read_bool(np, "no-shift-audio-data"))


> +
>         return 0;
>  }
>
> @@ -1866,6 +1869,11 @@ static int anx7625_audio_hw_params(struct device *=
dev, void *data,
>                                            ~TDM_SLAVE_MODE,
>                                            I2S_SLAVE_MODE);
>
> +       if (!ctx->pdata.shift_audio_data)
> +               ret |=3D anx7625_write_or(ctx, ctx->i2c.tx_p2_client,
> +                                      AUDIO_CONTROL_REGISTER,
> +                                      TDM_TIMING_MODE);
> +
>         /* Word length */
>         switch (params->sample_width) {
>         case 16:
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/=
bridge/analogix/anx7625.h
> index 39ed35d338363..41b395725913a 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> @@ -441,6 +441,7 @@ struct anx7625_platform_data {
>         u8 lane1_reg_data[DP_TX_SWING_REG_CNT];
>         u32 low_power_mode;
>         struct device_node *mipi_host_node;
> +       int shift_audio_data;
>  };
>
>  struct anx7625_i2c_client {
>
> --
> 2.45.0.rc1.225.g2a3ae87e7f-goog
>
>
