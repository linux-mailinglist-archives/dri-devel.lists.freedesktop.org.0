Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5267576A4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 10:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2931410E023;
	Tue, 18 Jul 2023 08:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4301B10E023
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 08:35:17 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b703caf344so79146941fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 01:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1689669316; x=1692261316; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0FAjjlFJMhYYhEn4cuk55R7hTz2rcMK9MMxmywNIilg=;
 b=us7q9Q7bMQD6QiZGe7pAzDFn9TJxGirtRL8iZql96Zy6630wyGXPeHXYKmndc2adge
 defvKpa39g1PLfi/Qa87PSa5VjYDOFj1/sf26QrS6bvKBfVyEjHRgTEF931rQ633349i
 HiAd8ubJEEeXEHnxixYxEbTGGUv8HSMEOvrAMko7piHcGLxcHEXH3GSpxck8UYBgmYUG
 CaefSXyl9tInyUc97WnYFdQF+3/x+o1hg2DOlUXpSlz30iCHlxb1TqIGqDwnBEHEKvzk
 cKFQAZOnu1piVVjEyOAwFh076QZtXqZT152xYMsoV0M+e62CCOHazXpJp+ooaTT9P0wJ
 9S4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689669316; x=1692261316;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0FAjjlFJMhYYhEn4cuk55R7hTz2rcMK9MMxmywNIilg=;
 b=JAkNzOYcIdcjjZoQvZb2mCqLuT1IJa2RVExV158RPHYQfWWLnO6KwaUN3dhrIq4/Ky
 dYeZxZxsHSskghIHe0r62Ov9Ntry/zkY4uUxm22RMllvqsggMcmpkVJNtpCjGo5xO2RB
 nkCvrpn+C3sHokI7KXOZwR+UOpCW0wAvDYZprgNkH1RK39E3i/sgfNorATC/8m+GetNj
 snLUsZORxQWF2Mr2orLVx+wu3Eb1PFeW8vWc1OuwYge3o76zH9cojnNPTpA45Rc9gJmT
 HjhAFKb8t+M6hAzP4BehlNeftBRWOy3FxPIo+w7+5jAXewfHkOTLmSUcTEsgvLEDwvm1
 aYKw==
X-Gm-Message-State: ABy/qLYqDH5WmYrM7nldnqLPwUZWRYkja+PQCQUGEFw5JjFvQyLQyXH7
 PeRQytQH5g3G2XL4Lj1BK5eOjMpV0S/9scbU2CY69Q==
X-Google-Smtp-Source: APBJJlEJn1y3olhyRFcIsFIYaiJDoObNMuP+6Cs83oTwOX312nUsL5Z1YPgoLWGUZh71ZI4HY5BOOq9Vnc6ESIcr0Wg=
X-Received: by 2002:a2e:9891:0:b0:2b6:d6e1:a191 with SMTP id
 b17-20020a2e9891000000b002b6d6e1a191mr1205288ljj.23.1689669315761; Tue, 18
 Jul 2023 01:35:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190716131005.761-1-bogdan.togorean@analog.com>
 <20230718062854.29875-1-alex@shruggie.ro>
 <1c3fde3a873b0f948d3c4d37107c5bb67dc9f7bb.camel@gmail.com>
In-Reply-To: <1c3fde3a873b0f948d3c4d37107c5bb67dc9f7bb.camel@gmail.com>
From: Alexandru Ardelean <alex@shruggie.ro>
Date: Tue, 18 Jul 2023 11:35:04 +0300
Message-ID: <CAH3L5Qq5t3FgMCCF7YB7-W1R2kewz_OFFETz1NQc_K5egfps=w@mail.gmail.com>
Subject: Re: [PATCH V2] drm: adv7511: Fix low refresh rate register for
 ADV7533/5
To: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>
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
Cc: neil.armstrong@linaro.org, architt@codeaurora.org, rfoss@kernel.org,
 andrzej.hajda@intel.com, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nuno.sa@analog.com,
 bogdan.togorean@analog.com, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 18, 2023 at 10:00=E2=80=AFAM Nuno S=C3=A1 <noname.nuno@gmail.co=
m> wrote:
>
> On Tue, 2023-07-18 at 09:28 +0300, Alexandru Ardelean wrote:
> > From: Bogdan Togorean <bogdan.togorean@analog.com>
> >
> > For ADV7533 and ADV7535 low refresh rate is selected using
> > bits [3:2] of 0x4a main register.
> > So depending on ADV model write 0xfb or 0x4a register.
> >
> > Fixes: 2437e7cd88e8 ("drm/bridge: adv7533: Initial support for ADV7533"=
)
> > Reviewed-by: Nuno Sa <nuno.sa@analog.com>
> > Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> > ---
> >
>
> It looks like you dropped your S-o-b tag in v2? I guess it was not on pur=
pose :)

oops; yes;
will send a V3;

thanks for the notification;

>
> - Nuno S=C3=A1
>
> > Changelog v1 -> v2:
> > *
> > https://lore.kernel.org/dri-devel/20190716131005.761-1-bogdan.togorean@=
analog.com/
> > * added Fixes: tag
> > * added Reviewed-by: tag for Nuno
> >
> >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > index ddceafa7b637..09290a377957 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > @@ -786,8 +786,13 @@ static void adv7511_mode_set(struct adv7511 *adv75=
11,
> >         else
> >                 low_refresh_rate =3D ADV7511_LOW_REFRESH_RATE_NONE;
> >
> > -       regmap_update_bits(adv7511->regmap, 0xfb,
> > -               0x6, low_refresh_rate << 1);
> > +       if (adv7511->type =3D=3D ADV7511)
> > +               regmap_update_bits(adv7511->regmap, 0xfb,
> > +                       0x6, low_refresh_rate << 1);
> > +       else
> > +               regmap_update_bits(adv7511->regmap, 0x4a,
> > +                       0xc, low_refresh_rate << 2);
> > +
> >         regmap_update_bits(adv7511->regmap, 0x17,
> >                 0x60, (vsync_polarity << 6) | (hsync_polarity << 5));
> >
>
