Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D670479EE3A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 18:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0913010E494;
	Wed, 13 Sep 2023 16:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6334510E471
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 16:25:31 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-52bcd4db4e6so9086133a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 09:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694622328; x=1695227128;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x/h8LhBCMwqwCfF1tLU1WVlQTqaYSvf4SN9SeoE8D3o=;
 b=OAbmLvWV/FOBZHiopAcQrsrjth3yQix0Qs3zUpVd3Ft/nCU7C2TXuUxaPB8nGReyPF
 bQpqkLiNVMuX+e5BYcHTcUVEJVah0mQyGvdfXTmxTXWkLfaXaQcwfD+JYJAbNHh6RQls
 PTyYeYOB2qRjyN2SkjHNnSjvYMaNLwiMv/YNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694622328; x=1695227128;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x/h8LhBCMwqwCfF1tLU1WVlQTqaYSvf4SN9SeoE8D3o=;
 b=A8RtguQyFf2Fcm/j45VMhwZneqBdHJ2A3pmlT3A33RBisTrN+iSR23XMWIbAQ17SJF
 iJ33zqY04VEEfAmcvAcTNtvAOqMRTCLzptgdJdVW1bRZg/uPAlpdKRtrTqe0+Gk4y73V
 ldyHHF6rQjIfiX5jgpNr6X4HUPBDt3MGivqlwZhTNgxeBEuDoOkvzBh568VuuZ0Jp9NT
 +orap0++bt+u9d/7Zmkwk7OXHBtqsWGTv8tf+5e0gap+wtKTlG6d65Y6DkvxgBofA8rS
 7MXUPZKAlgNvhLEE7wi5zieEf4ixTiAZBM+8VNW4jdHh0nx4iGSMUg29FTY82pdK8MeX
 LxzQ==
X-Gm-Message-State: AOJu0Yxe6q3YCHXAiz3ReX74nBpiv/o362VxMovMAoPFWL0/GoL8WlaR
 FmjfMkGUubwnrZdSPxHw1jC+TtTNfuotOw02lwz3ckIF
X-Google-Smtp-Source: AGHT+IFSjbtnv0p/c36arT+TsVQogBC5s1Nd57nBjqxRWdHZ20ZnYwSXON4uqcOM2Fhzx+FaNrJuWQ==
X-Received: by 2002:a05:6402:1511:b0:522:3a0d:38c2 with SMTP id
 f17-20020a056402151100b005223a0d38c2mr2594581edw.9.1694622328676; 
 Wed, 13 Sep 2023 09:25:28 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com.
 [209.85.208.41]) by smtp.gmail.com with ESMTPSA id
 u14-20020aa7d0ce000000b0052c11951f4asm7518856edo.82.2023.09.13.09.25.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 09:25:28 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-51e24210395so18152a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 09:25:28 -0700 (PDT)
X-Received: by 2002:a50:baef:0:b0:51a:1ffd:10e with SMTP id
 x102-20020a50baef000000b0051a1ffd010emr139918ede.3.1694622327845; Wed, 13 Sep
 2023 09:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.3.Iea742f06d8bec41598aa40378fc625fbd7e8a3d6@changeid>
 <288af70dafc5e73d0fdfac71a33449385d4d6bd3.camel@crapouillou.net>
 <CAD=FV=VuJe7ACFw3pt1z=EAh14_Z4iTOc5VKJt24CGwZYjRpeQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VuJe7ACFw3pt1z=EAh14_Z4iTOc5VKJt24CGwZYjRpeQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 13 Sep 2023 09:25:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UFkTHhsxFZGPqFVOX6ra+bx=1P-jAdh1wz-_Q=GBJc4Q@mail.gmail.com>
Message-ID: <CAD=FV=UFkTHhsxFZGPqFVOX6ra+bx=1P-jAdh1wz-_Q=GBJc4Q@mail.gmail.com>
Subject: Re: [RFT PATCH 03/15] drm/ingenic: Call drm_atomic_helper_shutdown()
 at shutdown time
To: Paul Cercueil <paul@crapouillou.net>
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
Cc: linux-mips@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Sep 5, 2023 at 1:16=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Paul,
>
> On Mon, Sep 4, 2023 at 2:15=E2=80=AFAM Paul Cercueil <paul@crapouillou.ne=
t> wrote:
> >
> > Hi Douglas,
> >
> > Le vendredi 01 septembre 2023 =C3=A0 16:41 -0700, Douglas Anderson a =
=C3=A9crit :
> > > Based on grepping through the source code this driver appears to be
> > > missing a call to drm_atomic_helper_shutdown() at system shutdown
> > > time. Among other things, this means that if a panel is in use that
> > > it
> > > won't be cleanly powered off at system shutdown time.
> > >
> > > The fact that we should call drm_atomic_helper_shutdown() in the case
> > > of OS shutdown/restart comes straight out of the kernel doc "driver
> > > instance overview" in drm_drv.c.
> > >
> > > Since this driver uses the component model and shutdown happens at
> > > the
> > > base driver, we communicate whether we have to call
> > > drm_atomic_helper_shutdown() by seeing if drvdata is non-NULL.
> > >
> > > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> > LGTM.
> > Acked-by: Paul Cercueil <paul@crapouillou.net>
>
> Thanks for the Ack! Would you expect this patch to land through
> "drm-misc", or do you expect it to go through some other tree?
> Running:
>
> ./scripts/get_maintainer.pl --scm -f drivers/gpu/drm/ingenic/ingenic-drm-=
drv.c
>
> ...does not show that this driver normally goes through drm-misc, but
> it also doesn't show that it goes through any other tree so maybe it's
> just an artifact of the way it's tagged in the MAINTAINERS file? If
> it's fine for this to go through drm-misc, I'll probably land it (with
> your Ack and Maxime's Review) sooner rather than later just to make
> this patch series less unwieldy.
>
>
> > > ---
> > > This commit is only compile-time tested.
> > >
> > > NOTE: this patch touches a lot more than other similar patches since
> > > the bind() function is long and we want to make sure that we unset
> > > the
> > > drvdata if bind() fails.
> > >
> > > While making this patch, I noticed that the bind() function of this
> > > driver is using "devm" and thus assumes it doesn't need to do much
> > > explicit error handling. That's actually a bug. As per kernel docs
> > > [1]
> > > "the lifetime of the aggregate driver does not align with any of the
> > > underlying struct device instances. Therefore devm cannot be used and
> > > all resources acquired or allocated in this callback must be
> > > explicitly released in the unbind callback". Fixing that is outside
> > > the scope of this commit.
> > >
> > > [1] https://docs.kernel.org/driver-api/component.html
> > >
> >
> > Noted, thanks.
>
> FWIW, I think that at least a few other DRM drivers handle this by
> doing some of their resource allocation / acquiring in the probe()
> function and then only doing things in the bind() that absolutely need
> to be in the bind. ;-)

I've been collecting patches that are ready to land in drm-misc but,
right now, I'm not taking this patch since I didn't get any
clarification of whether it should land through drm-misc or somewhere
else.

-Doug
