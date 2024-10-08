Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF223995854
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 22:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8656610E5B4;
	Tue,  8 Oct 2024 20:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="nY1nIZgA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030B510E5B4
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 20:23:33 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5398df2c871so6588924e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2024 13:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1728419008; x=1729023808;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EDnb4fLf/tcrWG5SBzt36Cz475xIYljj6zFplZ4H15A=;
 b=nY1nIZgAYnnldzrpdE8MHAhus2Gdj5n9BlgcdA/9/uRyMqpz7KDCZSPh1YaFPdHhjJ
 Vc45HoYuKvRcfHGPCo34AKcMydQBW1suL4pMeIao8WmFawhQpj5q616WgJFvULIX3vfz
 j0h3mGCTFLdJRjFvkQnMJLvz0ctkdGhUzn+2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728419008; x=1729023808;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EDnb4fLf/tcrWG5SBzt36Cz475xIYljj6zFplZ4H15A=;
 b=cTZwlE5qJ53XSSAoJp232bG/LVgfrbwjiPGBg52sRUrrJx05EslDXkmzrTsCRfKD+r
 CsdfAyDx50hbUXoLKJCuV1khWbbBUC/erPOoDH1r6t8vwvUqTZReNVyK6e3cWfvxQhmx
 YGjM+L8yMF8E9g94eGyjmruIPPcYh5Dy4yjoKyeyyPsNc2VAQRvbb1GB8Xn1GHpjuBkW
 RM2anrxJ+hXa2uqAjvdeRvkgytQlLK7KuJDgE44T7AJpjQ5oOGpkT8OOYhRLDVjCX6CB
 5HFUKXU43iuDGxPoRJe4xzNfRiMCtvxy/z0m2xfdnzDlJkHcguDX0O5URBoaDM/CgQFY
 6q0g==
X-Gm-Message-State: AOJu0YzrdNMQ5InHIY2+FWaexzY6gjxe0Pze0VkjWgNx7G4t/2x6KxBc
 VDPcmDO2RFoWyqk1mvUFuU5iKRHmMiqlGhjt+6s4fd6kO7TUEk3Ea+H7GSa19S1ffvKsHNgtWs7
 hgqDE
X-Google-Smtp-Source: AGHT+IHpshsLO7ZJfk6OTB+1/4KUGjYocof8NwyXOc2tNQaXw3BbtrbMN3X+DMqzfqgr8maKte//9Q==
X-Received: by 2002:a05:6512:2302:b0:539:88cd:bf06 with SMTP id
 2adb3069b0e04-539c4948479mr3199e87.48.1728419006978; 
 Tue, 08 Oct 2024 13:23:26 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com.
 [209.85.208.178]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539aff1d277sm1295558e87.155.2024.10.08.13.23.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 13:23:25 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2fb18f14242so419281fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2024 13:23:25 -0700 (PDT)
X-Received: by 2002:a2e:702:0:b0:2f6:6576:ae6e with SMTP id
 38308e7fff4ca-2fb1878c5b5mr1138191fa.21.1728419004946; Tue, 08 Oct 2024
 13:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <20241008073014.16411-1-alex.vinarskis@gmail.com>
In-Reply-To: <20241008073014.16411-1-alex.vinarskis@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 8 Oct 2024 13:23:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WdTW3R1n_1CA11vcPhkwHihcM-wDr0AQapnxUyKGHc5Q@mail.gmail.com>
Message-ID: <CAD=FV=WdTW3R1n_1CA11vcPhkwHihcM-wDr0AQapnxUyKGHc5Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] drm/edp-panel: Add panels used by Dell XPS 13 9345
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Bryan.Kemp@dell.com, tudor.laurentiu.oss@gmail.com, peterdekraker@umito.nl
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

On Tue, Oct 8, 2024 at 12:30=E2=80=AFAM Aleksandrs Vinarskis
<alex.vinarskis@gmail.com> wrote:
>
> Introduce low-res IPS and OLED panels for mentioned device.
>
> SHP panel's timings were picked experimentally, without this patch or wit=
h
> `delay_200_500_e50` panel sometimes fails to boot/stays black on startup.
>
> LGD panel's timings were copied from other LGD panels and tested to be
> working.
>
> Particular laptop also comes in high-res IPS variant, which unfortunately
> I do not have access to verify.
>
> The raw edid for SHP panel is:
>
> 00 ff ff ff ff ff ff 00 4d 10 93 15 00 00 00 00
> 2c 21 01 04 a5 1d 12 78 07 ee 95 a3 54 4c 99 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 f0 7b 80 90 70 b0 52 45 30 20
> 36 00 20 b4 10 00 00 18 00 00 00 fd 00 1e 78 9a
> 9a 20 01 0a 20 20 20 20 20 20 00 00 00 fe 00 4b
> 4a 46 47 52 80 4c 51 31 33 34 4e 31 00 00 00 00
> 00 02 41 0c 32 00 01 00 00 0b 41 0a 20 20 01 ef
>
> 70 20 79 02 00 20 00 13 8c 52 19 93 15 00 00 00
> 00 2c 17 07 4c 51 31 33 34 4e 31 21 00 1d 40 0b
> 08 07 80 07 b0 04 88 3d 8a 54 cd a4 99 66 62 0f
> 02 45 54 d0 5f d0 5f 00 34 12 78 26 00 09 02 00
> 00 00 00 00 01 00 00 22 00 14 5e d7 04 05 7f 07
> 8f 00 2f 00 1f 00 af 04 50 00 02 00 05 00 25 01
> 09 5e d7 04 5e d7 04 1e 78 80 81 00 0b e3 05 80
> 00 e6 06 01 01 6a 6a 39 00 00 00 00 00 00 ce 90
>
> The raw edid for LGD panel is:
>
> 00 ff ff ff ff ff ff 00 30 e4 78 07 00 00 00 00
> 00 22 01 04 b5 1d 12 78 06 96 65 b0 4f 3c b9 23
> 0b 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 ef 83 40 a0 b0 08 34 70 30 20
> 36 00 20 b4 10 00 00 1a 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 fe 00 44
> 48 39 50 57 80 31 33 34 57 54 31 0a 00 00 00 00
> 00 04 04 03 28 00 01 00 00 2b 01 0a 20 20 01 d4
>
> 70 20 79 02 00 20 00 13 3c e6 24 78 07 00 00 00
> 00 00 18 07 31 33 34 57 54 31 0a 21 00 1d 41 0b
> 08 07 40 0b 08 07 88 06 6b 4f c3 a3 b9 35 82 0b
> 02 45 54 40 5e 1a 60 18 10 23 78 26 00 09 04 00
> 00 00 00 00 41 00 00 22 00 14 55 27 05 85 3f 0b
> 9f 00 2f 80 1f 00 07 07 33 00 02 00 05 00 25 01
> 09 55 27 05 55 27 05 3c 3c 00 81 00 0b e3 05 80
> 00 e6 06 05 01 6d 60 02 00 00 00 00 00 00 31 90
>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 767e47a2b0c1..8566e9cf2f82 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1977,11 +1977,13 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('L', 'G', 'D', 0x0567, &delay_200_500_e200_d200, =
"Unknown"),
>         EDP_PANEL_ENTRY('L', 'G', 'D', 0x05af, &delay_200_500_e200_d200, =
"Unknown"),
>         EDP_PANEL_ENTRY('L', 'G', 'D', 0x05f1, &delay_200_500_e200_d200, =
"Unknown"),
> +       EDP_PANEL_ENTRY('L', 'G', 'D', 0x0778, &delay_200_500_e200_d200, =
"134WT1"),
>
>         EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140=
M1JW48"),
>         EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ140M=
1JW46"),
>         EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140=
T1JH01"),
>         EDP_PANEL_ENTRY('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ=
116M1JW10"),
> +       EDP_PANEL_ENTRY('S', 'H', 'P', 0x1593, &delay_200_500_p2e100, "LQ=
134N1"),

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll plan to give it a day or so and then land it. Thanks!

-Doug
