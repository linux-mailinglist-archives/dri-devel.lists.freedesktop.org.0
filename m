Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 841FC752B5A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 22:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D510A10E05D;
	Thu, 13 Jul 2023 20:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838BA10E05D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 20:08:17 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fb7dc16ff0so2016929e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 13:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1689278894; x=1691870894; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u34z4glnpomRSBgQT4bG9FMnp1Iswj4TV0WEYU0qNmY=;
 b=bGAOyWilVBc09A647WYrJIumc8/YjY9sDp7NZmrDXwn0qDQePWLh48nO+TUBh17Nyd
 oAZaLPLVA3isDJw+AFba5SDOaoss9qxBaPUEcpwUyJidSkzjW597ngchDC+z4On+1MLl
 qpQNF7M4LVHZEjzaIgrfTqO6Er9Rt8vLyUfeakjL8xAe4DyhfkdgzCuH25atPcQ9c9l2
 U1JOfQeyh41hNp5fDzYnvHyv1M+6E3m4hnOVAQFythTWRv9+El6F/xFe7SVJvMaF81A9
 3CK6INwNak3gSfnX+PMAEi41qYy7mz1rsh8fWjPvG87glYP8j7fwB1odhk+62U2CXrXL
 Wjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689278894; x=1691870894;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u34z4glnpomRSBgQT4bG9FMnp1Iswj4TV0WEYU0qNmY=;
 b=hunz5zGSyrMUAQazJmZ0nI4TmhMvv2NhJDiosNIu1SJeNqC9CqYb3d58iVsfzjiHcq
 WHOghgLJPh/zAdd2FW6vok9lj10VlSSAH4yJn5KsHUswaKUoVxKfac5mWnRyH9td93hY
 D9p5ChsyfpxHZcUMV+w7TOQQ34dgpiGlFDd0XjoWNF12xhnLxnuDTYdfsnvH/pccOD8N
 ODBRQJDOSphb0SZ7TOz3P51B3XCzXYnqlde5fk8Ektbq9PIIA9DXD84xjzRrFksK0oOy
 tXd+CLHKVOYsFJYTDT2k2CCLg4rztFLtNHET89uoA8yGn871RNmruhlRAAscFXwEH2Ok
 TpZA==
X-Gm-Message-State: ABy/qLbYt6+11gQylss4mbKuk9h5HrW0+caWUknLt0TkVUS1y8PX0j2T
 ixhAqnoT/eRn/mLjHm/w2JQxTrPs14VxRKE7w9pLkVvztbEi5xL0
X-Google-Smtp-Source: APBJJlGlntgpNzb8aiVWjVCNIX8MNjnI9Q/oyemXLvfjZeeUxu+YH3q9dZLCcmqm9qyQ/BtiGwjjzA8vEIa/9mrKxiY=
X-Received: by 2002:ac2:5dd4:0:b0:4fa:a217:1e76 with SMTP id
 x20-20020ac25dd4000000b004faa2171e76mr1911934lfq.9.1689278894303; Thu, 13 Jul
 2023 13:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230516164416.11616-1-alex@shruggie.ro>
In-Reply-To: <20230516164416.11616-1-alex@shruggie.ro>
From: Alexandru Ardelean <alex@shruggie.ro>
Date: Thu, 13 Jul 2023 23:08:03 +0300
Message-ID: <CAH3L5QpmPrHZPKVSapPtgDNORb8hj2AhCLGP0Fx7p5ZX++qOOA@mail.gmail.com>
Subject: Re: [PATCH] drm: adv7511: Fix low refresh rate register for ADV7533/5
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Cc: Bogdan Togorean <bogdan.togorean@analog.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 16, 2023 at 7:44=E2=80=AFPM Alexandru Ardelean <alex@shruggie.r=
o> wrote:
>
> From: Bogdan Togorean <bogdan.togorean@analog.com>
>
> For ADV7533 and ADV7535 low refresh rate is selected using
> bits [3:2] of 0x4a main register.
> So depending on ADV model write 0xfb or 0x4a register.
>

Ping on this patch :)

> Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
> ---
>  drivers/gpu/drm/i2c/adv7511.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i2c/adv7511.c b/drivers/gpu/drm/i2c/adv7511.=
c
> index 61aa824d45d2..e016105a8fbe 100644
> --- a/drivers/gpu/drm/i2c/adv7511.c
> +++ b/drivers/gpu/drm/i2c/adv7511.c
> @@ -729,8 +729,13 @@ static void adv7511_encoder_mode_set(struct drm_enco=
der *encoder,
>         else
>                 low_refresh_rate =3D ADV7511_LOW_REFRESH_RATE_NONE;
>
> -       regmap_update_bits(adv7511->regmap, 0xfb,
> -               0x6, low_refresh_rate << 1);
> +       if (adv7511->type =3D=3D ADV7511)
> +               regmap_update_bits(adv7511->regmap, 0xfb,
> +                       0x6, low_refresh_rate << 1);
> +       else
> +               regmap_update_bits(adv7511->regmap, 0x4a,
> +                       0xc, low_refresh_rate << 2);
> +
>         regmap_update_bits(adv7511->regmap, 0x17,
>                 0x60, (vsync_polarity << 6) | (hsync_polarity << 5));
>
> --
> 2.40.1
>
