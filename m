Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A1693504A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 17:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C4010E9F4;
	Thu, 18 Jul 2024 15:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="GspH/d0Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DE610E9F4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 15:58:09 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-3d853e31de8so575495b6e.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 08:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721318287; x=1721923087;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KI6+OUVJCzVw8+deYC/JOskjFnoamUOWD+xEmu+wUIw=;
 b=GspH/d0YkScPLfogMrXuKtxtDyHiC1MKAE7TucLvEpC/4ntvYA1sXkbM7SbNLR4kC6
 x1Yh/+nPiL8mok3Yqy0DhpLDgAsh4g3bV2TcIaddr31Oi6AEJiGMllDkfOmRT5T6bjsV
 cqtS6bXkkfr7aRkzlrR7LW6tZ3Cc0v1C/bAFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721318287; x=1721923087;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KI6+OUVJCzVw8+deYC/JOskjFnoamUOWD+xEmu+wUIw=;
 b=H3Agxxq23zs5o9lzIBOcIqln//Llq+DHibEb2+WkYPJ5srT2XD01nhFEYXzIBYGv/X
 2o/xOvyKyToIseFXv9egFoVp5MjccIOpH/2kBxBIFKIwWPmhz3ygbcWWXDG85G0io+Au
 9z2kqFBgOoXEK9ycEGgtQr1JUasWpkdUhSolJIRwKQX2g/El2en607PQo9CSDDmdUmzL
 9EalLUTR5CLJ8mPZcrx/bf/a3TOkm/wtidgtEn+qIOHyOXVA1dCxW25axW1X5alXsiox
 IUyLpA2Jj0sUvIB4I/D/vJLhMrCAifWn4MZxLegYvtvuat9NwfEQlhWOFYuzrJJJ1TUl
 YJ0g==
X-Gm-Message-State: AOJu0Yz1IIkdfwDFNCbARHlXzuHx76H/dm/D4l6BdAG8123S9FLR3rS5
 3p5pxyLvLVhpyP8CsUwqUwQ9uU/KK0sm6jdFaNHhiJWiS9gVQ9HqHJPipske0RPifARweJLG33Y
 =
X-Google-Smtp-Source: AGHT+IGzNiuM+pqgN4kBDMa6Y7lLckPcyBzIq2Pk+BQnMj+/uV8QB4K+SyD81iIiW4gpRWYT2UOnrg==
X-Received: by 2002:a05:6808:1445:b0:3d5:600c:682 with SMTP id
 5614622812f47-3dad51f3041mr5424243b6e.13.1721318286834; 
 Thu, 18 Jul 2024 08:58:06 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com.
 [209.85.160.170]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1939800d5sm37448985a.129.2024.07.18.08.58.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 08:58:06 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-447df43324fso157521cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 08:58:05 -0700 (PDT)
X-Received: by 2002:a05:622a:4116:b0:447:e01a:de95 with SMTP id
 d75a77b69052e-44f9681efaemr1462911cf.0.1721318285517; Thu, 18 Jul 2024
 08:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240717215847.5310-1-robdclark@gmail.com>
 <CAD=FV=XCOKJHJ-yzENpvm_MD34tMR5LRy2m2jYdcWzZXP4pfXQ@mail.gmail.com>
 <CAF6AEGuBZqV4zg1asUNbMLvq0-i-iyFwfi37uKS3kWNuRSOU+g@mail.gmail.com>
In-Reply-To: <CAF6AEGuBZqV4zg1asUNbMLvq0-i-iyFwfi37uKS3kWNuRSOU+g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 18 Jul 2024 08:57:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UMiDTLBBEMk3fpg+TfE_K23fyL+JDZj77Fe9fCY8DyjA@mail.gmail.com>
Message-ID: <CAD=FV=UMiDTLBBEMk3fpg+TfE_K23fyL+JDZj77Fe9fCY8DyjA@mail.gmail.com>
Subject: Re: [RFC] drm/panel/simple-edp: Add Samsung ATNA45DC02
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 Rob Clark <robdclark@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
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

On Wed, Jul 17, 2024 at 6:09=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Wed, Jul 17, 2024 at 5:19=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Wed, Jul 17, 2024 at 2:58=E2=80=AFPM Rob Clark <robdclark@gmail.com>=
 wrote:
> > >
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Just a guess on the panel timings, but they appear to work.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > > This adds the panel I have on my lenovo yoga slim 7x laptop.  I could=
n't
> > > find any datasheet so timings is just a guess.  But AFAICT everything
> > > works fine.
> > >
> > >  drivers/gpu/drm/panel/panel-edp.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> >
> > Given that this is a Samsung ATNA<mumble>, is there any chance it's an
> > OLED panel? Should it be supported with the Samsung OLED panel driver
> > like this:
> >
> > https://lore.kernel.org/r/20240715-x1e80100-crd-backlight-v2-0-31b7f2f6=
58a3@linaro.org
>
> it is an OLED panel, and I did see that patchset and thought that
> samsung panel driver would work.  But changing the compat string on
> the yoga dts only gave me a black screen (and I didn't see any of the
> other mentioned problems with bl control or dpms with panel-edp).  So
> :shrug:?  It could be I overlooked something else, but it _seems_ like
> panel-edp is fine for this panel. Plus, it would avoid awkwardness if
> it turned out there were other non-samsung 2nd sources, but so far
> with a sample size of two 100% of these laptops have the same panel

Hmm, OK. One question for you: are you using the "enable" GPIO in
panel-edp? IMO the code handling that GPIO in panel-edp is somewhat
dodgy, but it predates my deeper involvement with panels. I've never
seen an eDP panel that could use panel-edp where it was actually
required--every instance where someone thought it was required was
better modeled by using that GPIO as the backlight enable. On the
other hand, the "enable" GPIO in the Samsung OLED panel driver came
straight from the panel datasheet and it makes sense for it to be in
the panel driver since the backlight is handled straight by the
panel...

In any case, I guess if things are working it doesn't really hurt to
take it in panel-edp for now...


> But that was the reason for posting this as an RFC.  I was hoping
> someone had some hint about where to find datasheets (my google'ing
> was not successful), etc.

I don't personally have any hints.

-Doug
