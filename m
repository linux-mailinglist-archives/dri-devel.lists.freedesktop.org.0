Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6781176A2E2
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 23:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921D210E2F6;
	Mon, 31 Jul 2023 21:34:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F1D10E2F1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 21:34:24 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-99bcd6c0282so768594766b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 14:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690839262; x=1691444062;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ejKthqQ2mY4lZZ2bMQcaZN7l6q+OoRAfSRPPpEe2fI=;
 b=AUcWyjUpfGvs6wvB+ixlBbF4YNgPdMDLG5rnrBDNwkK2/gInt0QGtqnfgCK76YJbMZ
 WQJLxUyqHPWc06GaYPC857msyWP4cruxeb3bbOddjvkd8RLdF1z/3dzBiDaoecUU0bKB
 YuxW2bsqaWWalMTEv4ydw/ourzrBlCSAgjJTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690839262; x=1691444062;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ejKthqQ2mY4lZZ2bMQcaZN7l6q+OoRAfSRPPpEe2fI=;
 b=aSbZqqXPFV3FXiPUnl6qIKH/vK7ZvhTnsWS16QuAMNSiNB9uQPEN3/27M8yUVOiyaP
 xBMScV41jn9mpWJlie3+e0k6v2+aH2i1ZhbMVzQnRznhwUwBHw4Q+QSfkrCSZ7kE6IgP
 QOrw9qt1zItYxSvS+CAzMTL0ZOUmFekJb6eg+Cys5E6EXJ+GSOpbAsKqdXWTKvfrabVz
 9WWyQdmr0o35vgt+yvE+gH+WXw9raygjolkgR1pgIPWKNsDFuE4MaNbiqtmQe5WRx54j
 qTZ1ULPC5N0JaG+0UPYmjiv4k81CJ4L1aLcNnNQmLIL2ZJ1H4IApNnmeijtkApzrE/4h
 tPQw==
X-Gm-Message-State: ABy/qLaHASbqTQd6TnUF35tDZtx9ArLZL0V9p+dQuOl9S0Ws5ylL/T2l
 4l5eW9pLZt286cEqXUEKNT3A7qEWRJwL3o/wgzdn6Q==
X-Google-Smtp-Source: APBJJlEU9likmmEeqTrjLxQYEtdXIkQf5P1MGplZu2n4kDCYPBsocjv3GbNjlUYrUracz0NZTyUA/w==
X-Received: by 2002:a17:907:60c7:b0:994:542c:8718 with SMTP id
 hv7-20020a17090760c700b00994542c8718mr687948ejc.76.1690839261880; 
 Mon, 31 Jul 2023 14:34:21 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43]) by smtp.gmail.com with ESMTPSA id
 dc26-20020a170906c7da00b00988e953a586sm6676430ejb.61.2023.07.31.14.34.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 14:34:21 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-51e24210395so4427a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 14:34:21 -0700 (PDT)
X-Received: by 2002:a50:f69e:0:b0:522:3c11:1780 with SMTP id
 d30-20020a50f69e000000b005223c111780mr225246edn.0.1690839260862; Mon, 31 Jul
 2023 14:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230709135231.449636-1-marex@denx.de>
 <CAD=FV=W9qXNaeQ14h8nmvoP3HKhXT8PbAtGikwR4eaQ+svX+ig@mail.gmail.com>
 <a0f83bf2-b125-9474-4316-9df3b6da5ad8@denx.de>
 <CAD=FV=X1Pt4439OT5xjHcP6+BWbQ7z81_nPB+bOiK3xnYNi_rA@mail.gmail.com>
 <34985434-7ee4-d86e-e157-9ad670315315@denx.de>
 <CAD=FV=XAk423Z34ebiooHO874GmUf5BgssyQm4_HieCGhs7E_A@mail.gmail.com>
 <594f8182-b74d-6ef2-0d90-74061b35bc50@denx.de>
 <CAD=FV=VXMsZ-kUOgd32LnjBP4eP-j0rbiDhF6O0wSAQsEB5mng@mail.gmail.com>
 <2a6e338d-36ef-6836-bc9d-ef1f727463a4@denx.de>
 <CAD=FV=X17TEovhxm9Wh9qX0RZXAO3Km0coYnfnoO=nsr=doUFw@mail.gmail.com>
 <75b6257d-b9d0-9cba-b3d3-218bad8209b4@denx.de>
In-Reply-To: <75b6257d-b9d0-9cba-b3d3-218bad8209b4@denx.de>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 31 Jul 2023 14:34:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VSAJyY=m0NJhYeEPgnqSsQHMi74-MoMk5JuroPCjbEnA@mail.gmail.com>
Message-ID: <CAD=FV=VSAJyY=m0NJhYeEPgnqSsQHMi74-MoMk5JuroPCjbEnA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: simple: Initialize unprepared_time in probe
To: Marek Vasut <marex@denx.de>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 31, 2023 at 2:15=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> On 7/31/23 21:50, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Jul 31, 2023 at 11:03=E2=80=AFAM Marek Vasut <marex@denx.de> wr=
ote:
> >>
> >> On 7/24/23 15:49, Doug Anderson wrote:
> >>
> >> Hi,
> >>
> >> [...]
> >>
> >>>> Maybe the EPROBE_DEFER actually happens and triggers the failure ?
> >>>
> >>> I could certainly believe that EPROBE_DEFER is involved.
> >>
> >> So no, it is not. It is difficult to set this up and access the signal=
s,
> >> but so I did.
> >>
> >> What happens is this:
> >> panel_simple_probe() calls devm_regulator_get()
> >>     -> If the regulator was ENABLED, then it is now DISABLED
> >
> > As per my previous response, I don't think this is true.
>
> I just measured that with a scope on actual hardware .
>
> reg_fixed_voltage_probe() is the code which turns the regulator OFF,
> specifically in the part gpiod_get_optional(...GPIOD_OUT_LOW);

Great, at least we're on the same page here now.


> > So just as a point of order, do you agree that prior to the commit
> > that you are "Fixing" that we _weren't_ doing the full delay at probe
> > time? That means that if things worked before they were working by
> > some amount of luck, right? The old code used to do a delay after
> > turning _off_ the regulator (at unprepare time).
>
> Yes, that's well possible.

...so assuming we agree that this is _not_ a regression introduced by
e5e30dfcf3db ("drm: panel: simple: Defer unprepare delay till next
prepare to shorten it"), that means that all other preexisting users
of panel-simple were fine with the old behavior where the unprepare
delay was only enforced when the panel driver itself turned things off
and then back on and no extra delay was needed at probe. The one board
we know about that has a problem with this behavior is the one you're
reproducing on, which we think only worked previously by chance.


> > I will also continue to assert that trying to fix the problem via a
> > delay in the probe of the panel code is the wrong place to fix the
> > code. The problem is that you need a board-level constraint on this
> > regulator (off-on-delay-us) preventing it from turning on again within
> > a certain amount of time after it is turned off. This allows the
> > regulator framework, which is what decided to turn this rail off
> > during the regulator probe, to enforce this constraint.
>
> No, the driver must respect the unprepare delay, that is what is
> currently not happening. Trying to somehow work around that by adding
> random changes to DT is not going to fix the fact that panel-simple is
> not respecting its own internal built-in constraints.

Well, except that the panel _isn't_ actually unpreparing the panel.
The constant you're talking about is a delay between unpreparing the
panel and then preparing it again and we're not doing that here. Here,
you are trying to account for an implicit unprepare that happened
outside the context of the panel driver (in the regulator framework).
The regulator framework is the one disabling the regulator on its own
and without the knowledge of the panel driver. The problem should be
addressed at the regulator framework, which might involve the
off-on-delay.

I would even go further and say that, perhaps, when the regulator
framework turns this regulator off at bootup then you might be
violating the power sequencing requirements in the panel anyway. If
the bootloader left the panel on and _also_ left an enable GPIO on
then it's entirely possible that you've got a power leak through the
enable GPIO where you're backpowering the panel's logic when the
regulator framework turns things off. This is something that would be
impossible for the panel driver to solve because the panel driver
hasn't even probed yet.

In any case, at this point it seems unlikely that I'll convince you or
that you'll convince me. I wonder if it's time for someone else on
this thread to provide an opinion.

-Doug
