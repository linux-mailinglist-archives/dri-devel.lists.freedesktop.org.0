Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C85FF757BA2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 14:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B706910E327;
	Tue, 18 Jul 2023 12:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA25710E327
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 12:18:52 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-992ca792065so778687566b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 05:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689682731; x=1692274731;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=s/TV29cuvv6jRYUYWcNh4eo5PX0lSozDTqkppq5Y9vI=;
 b=fpymSLhgJAtRhCR42jhzlXhHceCEXHGBGZtjXJwEqQ1BB1TXoHrpqRTqDb5RRxJoI6
 TmVgsFLQNQKjsXaV8c50UzZYXrhI3P2h1rs2sgAgklzq9wTFS2PNpOJxn7qrbrOlheBS
 TedcKpkdVegjhqPHwCB+EgXvZJekv8LAi7x2HpUx/uzAOLUW0r4keqPXGGIjAXi2d8rH
 q7sfk95Nw7XcpW9k8iS8wRo5zln4PoHfBdj9sEABGlcmoJOZplsSJlPwb5dvk7RFmOuA
 oAiuroaNo9RUxK+mwPUopSK/MiMEvVgDzp5f9n91Cp6jioYm9sQjXAioai+oy7Us7wGn
 Ik0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689682731; x=1692274731;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s/TV29cuvv6jRYUYWcNh4eo5PX0lSozDTqkppq5Y9vI=;
 b=OzKvLQUVGjbV9gD4k2oqRP2KKmBbdnLQpPJhfK/CtczG9dKa8qC9aa6U0FW8IGv84F
 qV9LkGQTKMHdo+Gm161albjdCFwthGp79zO7TMtzEHIUUFPZopEpQTvIhl8mWUxWy06k
 5Y9qHCkSlFBssJ2qqvmZL3ioXuqM0gBQcns/3FyzW8OaUeApV7B8p0LaQS9f590jfOer
 rkjFglgfqqTDk5zCWRKzqGLGnX1Lu64pvo5NrFgh3ZClJ27vQl6iv/J9vPrfRhbl6CZY
 ZnA34ZkVuYIEbqnRsDO7EtX7ch3j4o2lLSKPM7usbKFvwKXdZ0rMlLs+LeSwG/yAz1Qd
 loLQ==
X-Gm-Message-State: ABy/qLaf8xCVSC8hpA5jZTmRkhcn4S22804+TDZhX2qSS5ekJKLqfQfu
 8AlZVTOD/u0E7GX2tgb4fAY9B7AqSovGduvdpr8=
X-Google-Smtp-Source: APBJJlHn7+fGOx0VOiPCfk6gXwkCZ09vxkuQcM+HaUHqHMH83uXEOfQdzi7NPjsbDR9jMtI5mZxV0A==
X-Received: by 2002:a17:906:5e4b:b0:98d:cd3e:c18f with SMTP id
 b11-20020a1709065e4b00b0098dcd3ec18fmr11558969eju.72.1689682730355; 
 Tue, 18 Jul 2023 05:18:50 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef05:8700:4ac8:4223:8b53:53c1?
 (p200300f6ef0587004ac842238b5353c1.dip0.t-ipconnect.de.
 [2003:f6:ef05:8700:4ac8:4223:8b53:53c1])
 by smtp.gmail.com with ESMTPSA id
 sa22-20020a170906edb600b009929ab17be0sm936434ejb.162.2023.07.18.05.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 05:18:50 -0700 (PDT)
Message-ID: <c39c46dcd8302573334e6dced459c3f146f445b8.camel@gmail.com>
Subject: Re: [PATCH v3] drm: adv7511: Fix low refresh rate register for
 ADV7533/5
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Alexandru Ardelean <alex@shruggie.ro>, Robert Foss <rfoss@kernel.org>
Date: Tue, 18 Jul 2023 14:21:19 +0200
In-Reply-To: <CAH3L5QoYgU7HVF-Dc2ZJVcK-paoxwh0ZHWWxBhYudm+Mjvt7tA@mail.gmail.com>
References: <20190716131005.761-1-bogdan.togorean@analog.com>
 <20230718084215.12767-1-alex@shruggie.ro>
 <CAN6tsi5+WV65FSpuzjJY46beHU8SkOMYfZNS3DnXiVft_6MG4A@mail.gmail.com>
 <CAH3L5QoYgU7HVF-Dc2ZJVcK-paoxwh0ZHWWxBhYudm+Mjvt7tA@mail.gmail.com>
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
Cc: neil.armstrong@linaro.org, andrzej.hajda@intel.com, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nuno.sa@analog.com, bogdan.togorean@analog.com,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2023-07-18 at 14:45 +0300, Alexandru Ardelean wrote:
> On Tue, Jul 18, 2023 at 11:50=E2=80=AFAM Robert Foss <rfoss@kernel.org> w=
rote:
> >=20
> > On Tue, Jul 18, 2023 at 10:42=E2=80=AFAM Alexandru Ardelean <alex@shrug=
gie.ro>
> > wrote:
> > >=20
> > > From: Bogdan Togorean <bogdan.togorean@analog.com>
> > >=20
> > > For ADV7533 and ADV7535 low refresh rate is selected using
> > > bits [3:2] of 0x4a main register.
> > > So depending on ADV model write 0xfb or 0x4a register.
> > >=20
> > > Fixes: 2437e7cd88e8 ("drm/bridge: adv7533: Initial support for ADV753=
3")
> > > Reviewed-by: Nuno Sa <nuno.sa@analog.com>
> > > Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> > > Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
> > > ---
> > >=20
> > > Changelog v2 -> v3:
> > > *
> > > https://lore.kernel.org/dri-devel/1c3fde3a873b0f948d3c4d37107c5bb67dc=
9f7bb.camel@gmail.com/T/#u
> > > * Added my S-o-b tag back
> > >=20
> > > Changelog v1 -> v2:
> > > *
> > > https://lore.kernel.org/dri-devel/20190716131005.761-1-bogdan.togorea=
n@analog.com/
> > > * added Fixes: tag
> > > * added Reviewed-by: tag for Nuno
> > >=20
> > >=20
> > > =C2=A0drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 9 +++++++--
> > > =C2=A01 file changed, 7 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > index ddceafa7b637..09290a377957 100644
> > > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > @@ -786,8 +786,13 @@ static void adv7511_mode_set(struct adv7511 *adv=
7511,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 low_refresh_rate =3D ADV7511_LOW_REFRESH_RATE_NONE;
> > >=20
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regmap_update_bits(adv7511->reg=
map, 0xfb,
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x6, low_refresh_rate << 1);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (adv7511->type =3D=3D ADV751=
1)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 regmap_update_bits(adv7511->regmap, 0xfb,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x6, low=
_refresh_rate << 1);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 regmap_update_bits(adv7511->regmap, 0x4a,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xc, low=
_refresh_rate << 2);
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regmap_update_bits(adv7511=
->regmap, 0x17,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x60, (vsync_polarity << 6) | (hsync_polarity << 5));
> > >=20
> > > --
> > > 2.41.0
> > >=20
> >=20
> > This looks good, but I'm seeing some checkpatch style warnings, with
> > those fixed feel free to add my r-b.
>=20
> Thanks.
> Will do.
> May I ask what options you are using for checkpatch.pl?

'--strict' should trigger those CHECKS...

Cool enough (or not) it seems the option is not really there when you type=
=C2=A0
--help


- Nuno S=C3=A1
