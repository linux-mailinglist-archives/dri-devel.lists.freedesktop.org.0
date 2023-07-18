Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE68A7574D3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 09:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1835410E0A1;
	Tue, 18 Jul 2023 07:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DAAC10E0A1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 07:01:00 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fc8049fd8bso8379917e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 00:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689663658; x=1692255658;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=kzieHZlpDOLsgEPivisv9+3RDs3SyQFnGZbkeHuzeX0=;
 b=np/Ysr8mFnATx1zGSjJaJBGBYCAYp8ngWc4vLS4YQ2TLze9a/kHLMsU7fUjND/pPf4
 jgy4m4GJVitBizM1aGRXQ78vBu2y5ZEOuYxE/fIoDV5qdl6UKPKqGE0DZBlSeAMrMCs6
 6e6x4gg0LruYJ5qulCOPP9MKR/3V9jUFZEx7tPVwre3/NXYVYWrtNkTI2ljPURj/RPKP
 I38ksF65IYD9pcaDpH/hvTkC9x8M9BbbdtlTykBNgpQom216hMO5YOgHbX6OFpVaAFmD
 osq0rbYlJlxgkkgaa9l2rd66vXBJnfcGxtL/KcgAYzDLs86tF+dStoW6SWf091UY94yT
 4tlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689663658; x=1692255658;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kzieHZlpDOLsgEPivisv9+3RDs3SyQFnGZbkeHuzeX0=;
 b=asfzfgPkLZ1OvyYyoyysGBe2/Q3jJsf+Q45TCto8ycaBszN3fYy/nJaeZ3NjjxA6Xc
 pASyNdBkPBt6u0a6URKgGpBbS5B8XvjkzvezLNVV8ATRHs/Bo8Zdgk17BRnhhymCriGj
 a6ehPQwvrTA2x/44aMYFuOJca2CL9wRhBk1gY8d1atGmbdLFlQjgl+wDYP6B3UkBkOug
 +kbISOUJzTdB0/P+e8SwlIMJkc+5HADV+TEma5WwambO6XwOESrJ8v4qgFMqoyfrodtE
 Cpg8EBU2U8HY5aR5B5RRkUB/vvMZL73HeYm/HcDiBaoHgHvgKbyrPpRdFK0cyRaiZgQl
 bG+w==
X-Gm-Message-State: ABy/qLZLj1oYGmF4Pqqg4xuUIV2JBwzTBRho933BhgaAzzm1lxJR6U6s
 fKdzHj2FfWC6e23+XIgauQk=
X-Google-Smtp-Source: APBJJlFHvd7M7a9soGmSZ+09TiCIcaPpyWtKjUfbn2SPfV0Vkwikg+WrazoT8xrn8UbRc9VLObqhfQ==
X-Received: by 2002:a19:e001:0:b0:4f9:6256:2a7e with SMTP id
 x1-20020a19e001000000b004f962562a7emr8964387lfg.31.1689663657398; 
 Tue, 18 Jul 2023 00:00:57 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef05:8700:4ac8:4223:8b53:53c1?
 (p200300f6ef0587004ac842238b5353c1.dip0.t-ipconnect.de.
 [2003:f6:ef05:8700:4ac8:4223:8b53:53c1])
 by smtp.gmail.com with ESMTPSA id
 x25-20020aa7cd99000000b0050488d1d376sm779394edv.0.2023.07.18.00.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 00:00:57 -0700 (PDT)
Message-ID: <1c3fde3a873b0f948d3c4d37107c5bb67dc9f7bb.camel@gmail.com>
Subject: Re: [PATCH V2] drm: adv7511: Fix low refresh rate register for
 ADV7533/5
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Alexandru Ardelean <alex@shruggie.ro>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Date: Tue, 18 Jul 2023 09:03:27 +0200
In-Reply-To: <20230718062854.29875-1-alex@shruggie.ro>
References: <20190716131005.761-1-bogdan.togorean@analog.com>
 <20230718062854.29875-1-alex@shruggie.ro>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
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
Cc: neil.armstrong@linaro.org, architt@codeaurora.org, rfoss@kernel.org,
 andrzej.hajda@intel.com, jonas@kwiboo.se, nuno.sa@analog.com,
 bogdan.togorean@analog.com, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2023-07-18 at 09:28 +0300, Alexandru Ardelean wrote:
> From: Bogdan Togorean <bogdan.togorean@analog.com>
>=20
> For ADV7533 and ADV7535 low refresh rate is selected using
> bits [3:2] of 0x4a main register.
> So depending on ADV model write 0xfb or 0x4a register.
>=20
> Fixes: 2437e7cd88e8 ("drm/bridge: adv7533: Initial support for ADV7533")
> Reviewed-by: Nuno Sa <nuno.sa@analog.com>
> Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> ---
>=20

It looks like you dropped your S-o-b tag in v2? I guess it was not on purpo=
se :)

- Nuno S=C3=A1

> Changelog v1 -> v2:
> *
> https://lore.kernel.org/dri-devel/20190716131005.761-1-bogdan.togorean@an=
alog.com/
> * added Fixes: tag
> * added Reviewed-by: tag for Nuno
>=20
> =C2=A0drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 9 +++++++--
> =C2=A01 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index ddceafa7b637..09290a377957 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -786,8 +786,13 @@ static void adv7511_mode_set(struct adv7511 *adv7511=
,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0low_refresh_rate =3D ADV7511_LOW_REFRESH_RATE_NONE;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regmap_update_bits(adv7511->re=
gmap, 0xfb,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A00x6, low_refresh_rate << 1);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (adv7511->type =3D=3D ADV75=
11)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0regmap_update_bits(adv7511->regmap, 0xfb,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x6, low_=
refresh_rate << 1);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0regmap_update_bits(adv7511->regmap, 0x4a,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00xc, low_=
refresh_rate << 2);
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regmap_update_bits(adv751=
1->regmap, 0x17,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A00x60, (vsync_polarity << 6) | (hsync_polarity << 5)=
);
> =C2=A0

