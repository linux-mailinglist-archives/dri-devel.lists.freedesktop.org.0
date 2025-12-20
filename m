Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C95DDCD2400
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 01:23:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C552510EA98;
	Sat, 20 Dec 2025 00:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="I4A3Rq7H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B0910EA98
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 00:23:25 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b7ce5d6627dso265324366b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 16:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1766190202; x=1766795002;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xujpkl8fslk9YF10xBFu9ZXxbTqnHCmahthzcIp9PfQ=;
 b=I4A3Rq7Hk6fFYrjF3nXG0uZyGaiYBLoS+lC2YkOofVrViwrAU2TWpk4AVNcTEPGOo1
 sffYMc1YH3tShkLbMED2bGDBZMS7FJEddldEjQelz7DEDlbTkaCrRn1oFNKDQUyGvTw5
 IKZYiM7a1cZTb2k80DP6kiMPF5XV1Qhu0JDLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766190202; x=1766795002;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xujpkl8fslk9YF10xBFu9ZXxbTqnHCmahthzcIp9PfQ=;
 b=il0DAJEzg0KgEvuQrKj5pbu0adf9KrHGAyXkB3bLtL+WIkTSvXPOhrUcWCWnT5/Mzr
 Or0t6KMv0g5AFtfAS8gWiINJ60lWdZZWP7GilDM2QhBpxpktZjyfbxEc8Z7U0dDliOHy
 EEyjLXuIki7dRc+Hare34tO5XLOdKgCdRU7v+SX8jhSMwPmEnp8E+80OjQPjF9/l2s4O
 IOCHkcoyVliMfMEuuQSfcPc12SD2G318xocXk++DCqyQHnCD1V557UiqL4/zRn6cTm9j
 ngggAXZD2kXYSzVMeosHVxBhjaFEYsBpUwo4KXRiG43aRu6JhYUm7DF7KK4M5PVSnb4w
 M+XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaAAmZrLAK3k46wACA0t1UJoSkcN83unqIqGJ/d99Y6IJeyKz0LNR1MNw6DgBRjY3IPHtWV1kVx+0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwApbJQVDsLNCJHbp3IGJ6+xM3Vzic5bKTx84HpWIOrXgT/J1dM
 dMni/xuc3oxtlOht2WKWMhMqExzLW+R0ab5IEHGMWdToFPyzora8igDYg5YkczB/Z+An2ellFnp
 ncTtXkw==
X-Gm-Gg: AY/fxX55lf4waBguofBdsoBcY15rFzqy+L6LMcUb6cQo3DzjJ57/BDODxHssf4bHHgC
 Hyu7qNfbf/u2CwcSjOr6ArVaE4hVgPFy8KSH/3jIJZmY1onRvjXb4dtMUSSuVa7qbq3VuXMcLAe
 hNzhWFV2emH120ZNzSiHHamWnj88bO5Cct64QrSjn8/lqMJr4bZAdzGciTaTgnQnLSk9JiZl9lZ
 iWhb3D6ciWybxIhAlGGvw8MHMUQMjmKVPgKhgslXx5Hxgav+bPTh29qsgsZATdYkWC9aPn+uH4D
 TpMfcPpusKZS4D4oO1kc/aUMqjRSZdGsPwzOuXmRMJmysMEeRdTrW87qlfzEBzbSQrWVWVIQpuI
 AAPneTdkdTsv5NNnV6+gHMn5PrdYBRRa95iPEmVWB0xgFcTFbs7c7WmpwigyaqPfh2V7CK23ESN
 ho4AmnjWBRJ6enJj8jstDr5oVYHTYdIWBDZEXbDdKW3SYeFFyvTQ==
X-Google-Smtp-Source: AGHT+IEMQR5WWnUHFDE3XMS9YUYutS9fQaXizrozKxEUFGXE0EbhEO3Hb/D3yZTv3ty7pT16n2fQ8A==
X-Received: by 2002:a17:907:1c27:b0:b75:7b39:847a with SMTP id
 a640c23a62f3a-b80372228e5mr473455466b.60.1766190202279; 
 Fri, 19 Dec 2025 16:23:22 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b910601c7sm3472941a12.14.2025.12.19.16.23.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 16:23:20 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-430f57cd471so1304452f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 16:23:20 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVEsweBjwt6PI+NCCKENfO27hicdMs0mtkKZOuCGWcXYkYU2KsjKFaiFq/nAQqiUJ2Q2nHA/87ZfwY=@lists.freedesktop.org
X-Received: by 2002:a05:6000:2dc3:b0:430:f463:b6b4 with SMTP id
 ffacd0b85a97d-4324e50c73fmr4935412f8f.50.1766190200122; Fri, 19 Dec 2025
 16:23:20 -0800 (PST)
MIME-Version: 1.0
References: <20251219085838.98152-1-johannes.goede@oss.qualcomm.com>
In-Reply-To: <20251219085838.98152-1-johannes.goede@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 19 Dec 2025 16:23:07 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VKe6=v0xSgxcAXctAnwqCyhici+vc1dfWYW=Eaky+AwQ@mail.gmail.com>
X-Gm-Features: AQt7F2phtFFzDwXIHU4IVu0uVnj0meM5Ts5g_uN96xIpEOYk4GgdmOzBmiRYEuo
Message-ID: <CAD=FV=VKe6=v0xSgxcAXctAnwqCyhici+vc1dfWYW=Eaky+AwQ@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm: panel-edp: add BOE NV140WUM-T08 panel
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
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

On Fri, Dec 19, 2025 at 12:58=E2=80=AFAM Hans de Goede
<johannes.goede@oss.qualcomm.com> wrote:
>
> Add powerseq timing info for the BOE NV140WUM-T08 panel used on Lenovo
> Thinkpad T14s gen 6 (Snapdragon X1 Elite) laptops.
>
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 09 e5 26 0c 00 00 00 00
> 0a 21 01 04 a5 1e 13 78 03 d6 62 99 5e 5a 8e 27
> 25 53 58 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 33 3f 80 dc 70 b0 3c 40 30 20
> 36 00 2e bc 10 00 00 1a 00 00 00 fd 00 28 3c 4c
> 4c 10 01 0a 20 20 20 20 20 20 00 00 00 fe 00 42
> 4f 45 20 43 51 0a 20 20 20 20 20 20 00 00 00 fe
> 00 4e 56 31 34 30 57 55 4d 2d 54 30 38 0a 00 fa
>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 415b894890ad..7b8e5cd41594 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1730,6 +1730,12 @@ static const struct panel_delay delay_200_500_p2e1=
00 =3D {
>         .prepare_to_enable =3D 100,
>  };
>
> +static const struct panel_delay delay_200_500_p2e200 =3D {
> +       .hpd_absent =3D 200,
> +       .unprepare =3D 500,
> +       .prepare_to_enable =3D 200,
> +};
> +
>  static const struct panel_delay delay_200_500_e50 =3D {
>         .hpd_absent =3D 200,
>         .unprepare =3D 500,
> @@ -1975,6 +1981,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140=
FHM-N47"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b66, &delay_200_500_e80, "NE140=
WUM-N6G"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT140=
FHM-N47"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c26, &delay_200_500_p2e200, "NV=
140WUM-T08"),

This looks OK, but I'd like to make sure that you really need
`prepare_to_enable` as 200 and it's not supposed to be
`powered_on_to_enable`. I notice that some other BOE panels have
"delay_200_500_e50_po2e200".

prepare_to_enable is usually usually (T4+T5+T6+T8)-min

powered_on_to_enable is usually (T3+T4+T5+T6+T8)-min

If you're sure you need `prepare_to_enable` then that's fine--just
thought I'd check. :-P

-Doug
