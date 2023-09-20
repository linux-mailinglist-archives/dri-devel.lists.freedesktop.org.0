Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 549717A8B0B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 20:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E2E10E536;
	Wed, 20 Sep 2023 18:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F1210E536
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 18:03:47 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-530ce262ab2so9187a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 11:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695233025; x=1695837825;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wNWpiq1Y/Z/txxjcp0TRMtu8Ee0OMKlu6U++2G9rtSM=;
 b=lg9WqMlZecyoRoIP1recyCSVBfI9SiAiNKo+5GZcXm3gPykmN6qZwyOzhzpFFVzd/w
 YxseZ/QZ9Wln6SMsAam/t8p+M7Ks0pNm7oXpn+zik4YYoLVhfQrgRpQ9R79ndXMtOo43
 9dxI3BEZZSfGTH7IvunubmitFwns4DbWUGuL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695233025; x=1695837825;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wNWpiq1Y/Z/txxjcp0TRMtu8Ee0OMKlu6U++2G9rtSM=;
 b=M6cKgp+Y2dFXpxtso9z+j4wSlu86qFJGmiTenVhtlFWupIrPt8F1uE6jOM9Q9RYtJK
 CbMzKJbCTyq6ADXvTqnrkddC6UPrluOTa9D4tvsIsXZsuUeOcTOrqCohmYOYP+hZxeCu
 wv9qiFrqnBCiQyFOJuJlSAeblHjuHpQ8yIMdzJLdKlpQ5LbrBfzGhRc0C4FAVIGHD3iJ
 GKzbOH0CXOeE8bGsKuu+QBGy9A2UPvY2IOEAnOdUbjiwc0I7J7fbV8OE1ia+oTPG3dpo
 CoQCdQYFCL0ivuvTCzAQsmxt0LRJE+xgLjophTdXCYieSclRX4OrgX5tpaMZgYcn46y0
 sYBA==
X-Gm-Message-State: AOJu0YyqGJMYRu0hoS20ZATbsM4jav8kpwK3QWSBcbsGGI3+YMthTnvK
 ICCYrRXPbZFDIoTB0eDKyhsCpWBYWXn+TExjRGYFRiBB
X-Google-Smtp-Source: AGHT+IE/TqPS8wwVKUkVDD5uc0FslOmkhz0NBQSuZ5gDsw/GOCFtp7+faSKUOYcfDgJg9WidrwqAFQ==
X-Received: by 2002:aa7:d893:0:b0:531:24f4:44bc with SMTP id
 u19-20020aa7d893000000b0053124f444bcmr2413997edq.34.1695233025147; 
 Wed, 20 Sep 2023 11:03:45 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50]) by smtp.gmail.com with ESMTPSA id
 u16-20020a056402111000b0051e0be09297sm9300563edv.53.2023.09.20.11.03.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Sep 2023 11:03:44 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-404f881aa48so12245e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 11:03:44 -0700 (PDT)
X-Received: by 2002:a05:600c:3b95:b0:3fe:dd72:13ae with SMTP id
 n21-20020a05600c3b9500b003fedd7213aemr6399wms.0.1695233024332; Wed, 20 Sep
 2023 11:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.1.I3d5598bd73a59b5ded71430736c93f67dc5dea61@changeid>
 <ZPSsBhbekKY7VyDg@shell.armlinux.org.uk>
 <CAD=FV=WT4Hf1XVA641WtNFg4WRYFKarU1WOkLPEbr0eiVQuZPg@mail.gmail.com>
 <CAD=FV=UpJEFKcsnHSzPqEiGaWusp50DrcEh=mcra4eLeRQT5NQ@mail.gmail.com>
In-Reply-To: <CAD=FV=UpJEFKcsnHSzPqEiGaWusp50DrcEh=mcra4eLeRQT5NQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 20 Sep 2023 11:03:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WSdp=5DnJinELOSncX=eqrN9y27kw=VFDHowzgnTS6Qg@mail.gmail.com>
Message-ID: <CAD=FV=WSdp=5DnJinELOSncX=eqrN9y27kw=VFDHowzgnTS6Qg@mail.gmail.com>
Subject: Re: [RFT PATCH 01/15] drm/armada: Call drm_atomic_helper_shutdown()
 at shutdown time
To: Maxime Ripard <mripard@kernel.org>
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
Cc: "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime,

On Wed, Sep 13, 2023 at 8:34=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Sep 5, 2023 at 7:23=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
> >
> > Hi,
> >
> > On Sun, Sep 3, 2023 at 8:53=E2=80=AFAM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > >
> > > On Fri, Sep 01, 2023 at 04:41:12PM -0700, Douglas Anderson wrote:
> > > > Based on grepping through the source code this driver appears to be
> > > > missing a call to drm_atomic_helper_shutdown() at system shutdown
> > > > time. Among other things, this means that if a panel is in use that=
 it
> > > > won't be cleanly powered off at system shutdown time.
> > > >
> > > > The fact that we should call drm_atomic_helper_shutdown() in the ca=
se
> > > > of OS shutdown/restart comes straight out of the kernel doc "driver
> > > > instance overview" in drm_drv.c.
> > > >
> > > > This driver was fairly easy to update. The drm_device is stored in =
the
> > > > drvdata so we just have to make sure the drvdata is NULL whenever t=
he
> > > > device is not bound.
> > >
> > > ... and there I think you have a misunderstanding of the driver model=
.
> > > Please have a look at device_unbind_cleanup() which will be called if
> > > probe fails, or when the device is removed (in other words, when it i=
s
> > > not bound to a driver.)
> >
> > ...and there I think you didn't read this patch closely enough and
> > perhaps that you have a misunderstanding of the component model.
> > Please have a look at the difference between armada_drm_unbind() and
> > armada_drm_remove() and also check which of those two functions is
> > being modified by my patch. Were this patch adding a call to
> > "dev_set_drvdata(dev, NULL)" in armada_drm_remove() then your NAK
> > would be justified. However, I am not aware of anything in the
> > component unbind path nor in the failure case of component bind that
> > would NULL the drvdata.
> >
> > Kindly look at the patch a second time with this in mind.
>
> Since I didn't see any further response, I'll assume that my
> explanation here has addressed your concerns. If not, I can re-post it
> without NULLing the "drvdata". While I still believe this is unsafe in
> some corner cases because of the component model used by this driver,
> at least it would get the shutdown call in.
>
> In any case, what's the process for landing patches to this driver?
> Running `./scripts/get_maintainer.pl --scm -f
> drivers/gpu/drm/armada/armada_drv.c` seems to indicate that this
> should go through the git tree:
>
> git git://git.armlinux.org.uk/~rmk/linux-arm.git drm-armada-devel
>
> ...but it doesn't appear that recent changes to this driver have gone
> that way. Should this land through drm-misc?

Do you have any advice here? Should I land this through drm-misc-next,
put it on ice for a while, or resend without the calls to NULL our the
drvdata?

Thanks!

-Doug
