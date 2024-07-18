Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A79459350B4
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 18:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0423B10EA36;
	Thu, 18 Jul 2024 16:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="YmVfHKHx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA9B10EA36
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 16:31:28 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-79f08b01ba6so44414885a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 09:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721320286; x=1721925086;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kYXM0M2L9/ShtUVFb30rLFi4Wo4QnGam8REPnb23O7o=;
 b=YmVfHKHxuV1IDoCJ1Aysp62iqJ2Tqs/p/ewgcv1cAKzYWuv5GbussE52Szih1IE5tl
 d9UKprKjInS8gsiingwAl5SqaF65aJnJnEEW14id1BDUi035qhGym62YMI7luoJUd3EF
 FQ5LEzJFT2jqRSffbwhHSP8hbaqNlfC51dy4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721320286; x=1721925086;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kYXM0M2L9/ShtUVFb30rLFi4Wo4QnGam8REPnb23O7o=;
 b=AGzj1QnneYY5OfMlDnyoxMk8R3V7QVrIasyoZBLvzYqmygRPElDmzvoSikTH9GuZo0
 i904tMGxElaAIS+63LSj1XUoc4Qar03U1WmMp6EeD8BYHy5FT6/58x/CgSpMfIToj/nh
 eepCx6BeWIpIONk25t/B1ppK8rltzcVdf1weOf58gVNojOJ7jnrU4oMI3TMYz7w4vMUy
 zNMK0yuOjGoM+CrhZGNMzwn3NpIZ+2Xlbp6mA+C6Q2wl0nxfyhM9H9ignpHRZz0Zhu07
 888X3LsvVKZ6FHiAhuPDRSXEzhJVJYUkqw+Dvy//ZtqwotZUXUyiWI3eNe+pcidFELkI
 oUUQ==
X-Gm-Message-State: AOJu0YxA1nbxsfZfCVxgZarizwxpiv7zhrHT5FR5bDtoQluThzDxFR7C
 jNuEXjlIxasTT//5LAssMnbnMWfJcENxwV1YW2eYkWYmr6FTASSNVjIM59Btl7IN6kOj1AbOBss
 =
X-Google-Smtp-Source: AGHT+IFyqKUiW6OdsF0yz61Fu12XAZanJHEaex5GNonuvNi8ugnvMCnQK/mNO55vxY6PPyuxzTeANg==
X-Received: by 2002:a05:620a:2591:b0:79e:fd1e:6fc4 with SMTP id
 af79cd13be357-7a193b54b5amr203915985a.34.1721320285845; 
 Thu, 18 Jul 2024 09:31:25 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com.
 [209.85.160.179]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1938fabefsm40907585a.60.2024.07.18.09.31.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 09:31:25 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-447f8aa87bfso2361cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 09:31:24 -0700 (PDT)
X-Received: by 2002:ac8:53cd:0:b0:447:ed90:7396 with SMTP id
 d75a77b69052e-44f96ac4b5dmr1388311cf.24.1721320284402; Thu, 18 Jul 2024
 09:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240717215847.5310-1-robdclark@gmail.com>
 <CAD=FV=XCOKJHJ-yzENpvm_MD34tMR5LRy2m2jYdcWzZXP4pfXQ@mail.gmail.com>
 <CAF6AEGuBZqV4zg1asUNbMLvq0-i-iyFwfi37uKS3kWNuRSOU+g@mail.gmail.com>
 <CAD=FV=UMiDTLBBEMk3fpg+TfE_K23fyL+JDZj77Fe9fCY8DyjA@mail.gmail.com>
 <CAF6AEGs22brXntJ-eDv_uTZGc2=rH2q2V4y6Vt8K4s+dsO=4-A@mail.gmail.com>
In-Reply-To: <CAF6AEGs22brXntJ-eDv_uTZGc2=rH2q2V4y6Vt8K4s+dsO=4-A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 18 Jul 2024 09:31:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WJQBTjt61ma-CoJQeGYKigEyXpA6j25JSyEfikrLeSNQ@mail.gmail.com>
Message-ID: <CAD=FV=WJQBTjt61ma-CoJQeGYKigEyXpA6j25JSyEfikrLeSNQ@mail.gmail.com>
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

On Thu, Jul 18, 2024 at 9:25=E2=80=AFAM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Thu, Jul 18, 2024 at 9:00=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Wed, Jul 17, 2024 at 6:09=E2=80=AFPM Rob Clark <robdclark@gmail.com>=
 wrote:
> > >
> > > On Wed, Jul 17, 2024 at 5:19=E2=80=AFPM Doug Anderson <dianders@chrom=
ium.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Wed, Jul 17, 2024 at 2:58=E2=80=AFPM Rob Clark <robdclark@gmail.=
com> wrote:
> > > > >
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > Just a guess on the panel timings, but they appear to work.
> > > > >
> > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > ---
> > > > > This adds the panel I have on my lenovo yoga slim 7x laptop.  I c=
ouldn't
> > > > > find any datasheet so timings is just a guess.  But AFAICT everyt=
hing
> > > > > works fine.
> > > > >
> > > > >  drivers/gpu/drm/panel/panel-edp.c | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > >
> > > > Given that this is a Samsung ATNA<mumble>, is there any chance it's=
 an
> > > > OLED panel? Should it be supported with the Samsung OLED panel driv=
er
> > > > like this:
> > > >
> > > > https://lore.kernel.org/r/20240715-x1e80100-crd-backlight-v2-0-31b7=
f2f658a3@linaro.org
> > >
> > > it is an OLED panel, and I did see that patchset and thought that
> > > samsung panel driver would work.  But changing the compat string on
> > > the yoga dts only gave me a black screen (and I didn't see any of the
> > > other mentioned problems with bl control or dpms with panel-edp).  So
> > > :shrug:?  It could be I overlooked something else, but it _seems_ lik=
e
> > > panel-edp is fine for this panel. Plus, it would avoid awkwardness if
> > > it turned out there were other non-samsung 2nd sources, but so far
> > > with a sample size of two 100% of these laptops have the same panel
> >
> > Hmm, OK. One question for you: are you using the "enable" GPIO in
> > panel-edp? IMO the code handling that GPIO in panel-edp is somewhat
> > dodgy, but it predates my deeper involvement with panels. I've never
> > seen an eDP panel that could use panel-edp where it was actually
> > required--every instance where someone thought it was required was
> > better modeled by using that GPIO as the backlight enable. On the
> > other hand, the "enable" GPIO in the Samsung OLED panel driver came
> > straight from the panel datasheet and it makes sense for it to be in
> > the panel driver since the backlight is handled straight by the
> > panel...
>
> hmm, at least current dts doesn't have an enable gpio.  Which could be
> why panel-samsung-atna33xc20 wasn't working.
>
> It is entirely possible we are relying on something left on by the bootlo=
ader.

That would be my best guess. Is there any way for you to find out if
there's an enable GPIO?


> > In any case, I guess if things are working it doesn't really hurt to
> > take it in panel-edp for now...
> >
>
> I wonder if using compatible=3D"edp-panel" everywhere isn't a great idea
> if we want to switch drivers later.  But I guess that is already water
> under the bridge (so to speak)

For panels that aren't OLED it's all very standard and we're kinda
forced to use something generic since manufacturers want lots of 2nd
(and 3rd and 4th and ...) sourcing. As far as I've been able to tell
you can't do 2nd sourcing between OLED panels and other panels since
the wires hooked up to the panels are a little different for the OLED
panels and the power sequencing is a bit different. It would also be
pretty obvious to an end user if some of their devices had an OLED
panel and some didn't. I'm not aware of OLED panels other than the
Samsung ones, but I haven't done any real research here...

-Doug
