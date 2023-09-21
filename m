Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF877A9A9B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 20:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C0F10E183;
	Thu, 21 Sep 2023 18:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1298310E183
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 18:46:22 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5041d6d8b10so2105552e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 11:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695321979; x=1695926779;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ozcv+tNcrjJTNVnx50veCSyyrwlXIHAIqy4hJ7iqZd4=;
 b=hRLcaiwZAnlVigkbuLD+B0JhJ3EAI1YPcpVFPIrQaK+HNM6L+OAF2lYnC3GtcPSlgu
 ceh7GeuHDfXWZxIVL0PCjR2GUYxhMc935v+s4l1w2xuc39sj7LFy+r6zS6hS0fl+PfLx
 ucLvP4IUmIoxoKhRw5uDsZoqS7cZkfg71Lzb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695321979; x=1695926779;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ozcv+tNcrjJTNVnx50veCSyyrwlXIHAIqy4hJ7iqZd4=;
 b=HlHHwCYgtJq/vrp6T/G9F8HB3JLmWSYxCxfP77uIh90v5Lm+9zjsOTZ5YAQVQtqNjE
 X9PvBQoHPhwSRj/4D59PBNCdkNnBEF0ahWZKQ+pscpRP7/AncXErgLB2iMeNtmMRgP5U
 bnKP8rUVamlulTjXPXlG2n/tMMDkQLkddrGUQTWj2WawjEEFUPeR35oTv1BiGqph4jSP
 t0vyDnkl1tV/MAHnRNmxZIILgjD3qyABtburqqLCJAT2P8fmNoJMOnGLcum2bntG8Sut
 vGrd9C+COYO6QWxvjs5BRmtFc9sRUAFdVSEehqBqqe5iHBuU8fFYCi0KCfcmkgnt+CIz
 HYKw==
X-Gm-Message-State: AOJu0Yywa32pO23AZLgVbuWOxPf9NT+TrLIlghU8cydzn0yiRh9KkXoG
 GL5kA4CuGrLBiFC4dT9n99n4lOy/GpZChDD/7CLKxQ==
X-Google-Smtp-Source: AGHT+IF1rJRskT3+mK0RcCRrZh3MXqsncdz//aIl6l0mDN58iEOqB2QPXf678Y/Oiiy0tDs1XJ4ETw==
X-Received: by 2002:ac2:464f:0:b0:4fb:7c40:9f97 with SMTP id
 s15-20020ac2464f000000b004fb7c409f97mr5547749lfo.27.1695321979311; 
 Thu, 21 Sep 2023 11:46:19 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 k2-20020aa7d8c2000000b0052f3051f7d2sm1160872eds.80.2023.09.21.11.46.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 11:46:18 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-405290ab4b6so23205e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 11:46:18 -0700 (PDT)
X-Received: by 2002:a05:600c:3ac9:b0:400:46db:1bf2 with SMTP id
 d9-20020a05600c3ac900b0040046db1bf2mr130799wms.2.1695321978276; Thu, 21 Sep
 2023 11:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.1.I3d5598bd73a59b5ded71430736c93f67dc5dea61@changeid>
 <ZPSsBhbekKY7VyDg@shell.armlinux.org.uk>
 <CAD=FV=WT4Hf1XVA641WtNFg4WRYFKarU1WOkLPEbr0eiVQuZPg@mail.gmail.com>
 <CAD=FV=UpJEFKcsnHSzPqEiGaWusp50DrcEh=mcra4eLeRQT5NQ@mail.gmail.com>
 <CAD=FV=WSdp=5DnJinELOSncX=eqrN9y27kw=VFDHowzgnTS6Qg@mail.gmail.com>
 <ZQtAuKBwo+ue8QQQ@shell.armlinux.org.uk>
In-Reply-To: <ZQtAuKBwo+ue8QQQ@shell.armlinux.org.uk>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Sep 2023 11:46:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XhYjUCcVycSA2+t+zxxOqJRohE6WLqWSa1-gGof+sscQ@mail.gmail.com>
Message-ID: <CAD=FV=XhYjUCcVycSA2+t+zxxOqJRohE6WLqWSa1-gGof+sscQ@mail.gmail.com>
Subject: Re: [RFT PATCH 01/15] drm/armada: Call drm_atomic_helper_shutdown()
 at shutdown time
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Sep 20, 2023 at 11:58=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Wed, Sep 20, 2023 at 11:03:32AM -0700, Doug Anderson wrote:
> > Maxime,
> >
> > On Wed, Sep 13, 2023 at 8:34=E2=80=AFAM Doug Anderson <dianders@chromiu=
m.org> wrote:
> > >
> > > Hi,
> > >
> > > On Tue, Sep 5, 2023 at 7:23=E2=80=AFAM Doug Anderson <dianders@chromi=
um.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Sun, Sep 3, 2023 at 8:53=E2=80=AFAM Russell King (Oracle)
> > > > <linux@armlinux.org.uk> wrote:
> > > > >
> > > > > On Fri, Sep 01, 2023 at 04:41:12PM -0700, Douglas Anderson wrote:
> > > > > > Based on grepping through the source code this driver appears t=
o be
> > > > > > missing a call to drm_atomic_helper_shutdown() at system shutdo=
wn
> > > > > > time. Among other things, this means that if a panel is in use =
that it
> > > > > > won't be cleanly powered off at system shutdown time.
> > > > > >
> > > > > > The fact that we should call drm_atomic_helper_shutdown() in th=
e case
> > > > > > of OS shutdown/restart comes straight out of the kernel doc "dr=
iver
> > > > > > instance overview" in drm_drv.c.
> > > > > >
> > > > > > This driver was fairly easy to update. The drm_device is stored=
 in the
> > > > > > drvdata so we just have to make sure the drvdata is NULL whenev=
er the
> > > > > > device is not bound.
> > > > >
> > > > > ... and there I think you have a misunderstanding of the driver m=
odel.
> > > > > Please have a look at device_unbind_cleanup() which will be calle=
d if
> > > > > probe fails, or when the device is removed (in other words, when =
it is
> > > > > not bound to a driver.)
> > > >
> > > > ...and there I think you didn't read this patch closely enough and
> > > > perhaps that you have a misunderstanding of the component model.
> > > > Please have a look at the difference between armada_drm_unbind() an=
d
> > > > armada_drm_remove() and also check which of those two functions is
> > > > being modified by my patch. Were this patch adding a call to
> > > > "dev_set_drvdata(dev, NULL)" in armada_drm_remove() then your NAK
> > > > would be justified. However, I am not aware of anything in the
> > > > component unbind path nor in the failure case of component bind tha=
t
> > > > would NULL the drvdata.
> > > >
> > > > Kindly look at the patch a second time with this in mind.
> > >
> > > Since I didn't see any further response, I'll assume that my
> > > explanation here has addressed your concerns. If not, I can re-post i=
t
> > > without NULLing the "drvdata". While I still believe this is unsafe i=
n
> > > some corner cases because of the component model used by this driver,
> > > at least it would get the shutdown call in.
> > >
> > > In any case, what's the process for landing patches to this driver?
> > > Running `./scripts/get_maintainer.pl --scm -f
> > > drivers/gpu/drm/armada/armada_drv.c` seems to indicate that this
> > > should go through the git tree:
> > >
> > > git git://git.armlinux.org.uk/~rmk/linux-arm.git drm-armada-devel
> > >
> > > ...but it doesn't appear that recent changes to this driver have gone
> > > that way. Should this land through drm-misc?
> >
> > Do you have any advice here? Should I land this through drm-misc-next,
> > put it on ice for a while, or resend without the calls to NULL our the
> > drvdata?
>
> Sorry, I haven't had a chance to look at it, but I think you're probably
> right, so I withdraw my objection. Please take it through drm-misc for
> the time being. Thanks.

Pushed to drm-misc-next:

c478768ce807 drm/armada: Call drm_atomic_helper_shutdown() at shutdown time
