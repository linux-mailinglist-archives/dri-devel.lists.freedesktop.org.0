Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A1079F0C4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 20:00:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9AC10E4D8;
	Wed, 13 Sep 2023 18:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EEBE10E4D2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 18:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1694628041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F7Etp2gwXXN1Lvy/uBfbUYk8A2C1RiABpvJPDeacEFM=;
 b=RPVJ3zKZ2xJ/SsGdaPGI1IswGijnANnjJw4pUYBsX17Z38SXmpAo+z/8HAYmTyJBYLTGXC
 uRiKYB2qbN9Y683g78Vg2/Zh6/Id42JfCB/M5raTdOSdnWsqftmTC3cVoyKiiT+beNrGf9
 laQ8Hz6dYFCfsFV7iBbQlSMSwxvqJYU=
Message-ID: <ac04dbc27e4d5f0fd3ec458b1ad7d4d2f2b39092.camel@crapouillou.net>
Subject: Re: [RFT PATCH 03/15] drm/ingenic: Call
 drm_atomic_helper_shutdown() at shutdown time
From: Paul Cercueil <paul@crapouillou.net>
To: Doug Anderson <dianders@chromium.org>
Date: Wed, 13 Sep 2023 20:00:39 +0200
In-Reply-To: <CAD=FV=UFkTHhsxFZGPqFVOX6ra+bx=1P-jAdh1wz-_Q=GBJc4Q@mail.gmail.com>
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.3.Iea742f06d8bec41598aa40378fc625fbd7e8a3d6@changeid>
 <288af70dafc5e73d0fdfac71a33449385d4d6bd3.camel@crapouillou.net>
 <CAD=FV=VuJe7ACFw3pt1z=EAh14_Z4iTOc5VKJt24CGwZYjRpeQ@mail.gmail.com>
 <CAD=FV=UFkTHhsxFZGPqFVOX6ra+bx=1P-jAdh1wz-_Q=GBJc4Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-mips@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

Le mercredi 13 septembre 2023 =C3=A0 09:25 -0700, Doug Anderson a =C3=A9cri=
t=C2=A0:
> Hi,
>=20
> On Tue, Sep 5, 2023 at 1:16=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg>
> wrote:
> >=20
> > Paul,
> >=20
> > On Mon, Sep 4, 2023 at 2:15=E2=80=AFAM Paul Cercueil <paul@crapouillou.=
net>
> > wrote:
> > >=20
> > > Hi Douglas,
> > >=20
> > > Le vendredi 01 septembre 2023 =C3=A0 16:41 -0700, Douglas Anderson a
> > > =C3=A9crit :
> > > > Based on grepping through the source code this driver appears
> > > > to be
> > > > missing a call to drm_atomic_helper_shutdown() at system
> > > > shutdown
> > > > time. Among other things, this means that if a panel is in use
> > > > that
> > > > it
> > > > won't be cleanly powered off at system shutdown time.
> > > >=20
> > > > The fact that we should call drm_atomic_helper_shutdown() in
> > > > the case
> > > > of OS shutdown/restart comes straight out of the kernel doc
> > > > "driver
> > > > instance overview" in drm_drv.c.
> > > >=20
> > > > Since this driver uses the component model and shutdown happens
> > > > at
> > > > the
> > > > base driver, we communicate whether we have to call
> > > > drm_atomic_helper_shutdown() by seeing if drvdata is non-NULL.
> > > >=20
> > > > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > >=20
> > > LGTM.
> > > Acked-by: Paul Cercueil <paul@crapouillou.net>
> >=20
> > Thanks for the Ack! Would you expect this patch to land through
> > "drm-misc", or do you expect it to go through some other tree?
> > Running:
> >=20
> > ./scripts/get_maintainer.pl --scm -f
> > drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> >=20
> > ...does not show that this driver normally goes through drm-misc,
> > but
> > it also doesn't show that it goes through any other tree so maybe
> > it's
> > just an artifact of the way it's tagged in the MAINTAINERS file? If
> > it's fine for this to go through drm-misc, I'll probably land it
> > (with
> > your Ack and Maxime's Review) sooner rather than later just to make
> > this patch series less unwieldy.
> >=20
> >=20
> > > > ---
> > > > This commit is only compile-time tested.
> > > >=20
> > > > NOTE: this patch touches a lot more than other similar patches
> > > > since
> > > > the bind() function is long and we want to make sure that we
> > > > unset
> > > > the
> > > > drvdata if bind() fails.
> > > >=20
> > > > While making this patch, I noticed that the bind() function of
> > > > this
> > > > driver is using "devm" and thus assumes it doesn't need to do
> > > > much
> > > > explicit error handling. That's actually a bug. As per kernel
> > > > docs
> > > > [1]
> > > > "the lifetime of the aggregate driver does not align with any
> > > > of the
> > > > underlying struct device instances. Therefore devm cannot be
> > > > used and
> > > > all resources acquired or allocated in this callback must be
> > > > explicitly released in the unbind callback". Fixing that is
> > > > outside
> > > > the scope of this commit.
> > > >=20
> > > > [1] https://docs.kernel.org/driver-api/component.html
> > > >=20
> > >=20
> > > Noted, thanks.
> >=20
> > FWIW, I think that at least a few other DRM drivers handle this by
> > doing some of their resource allocation / acquiring in the probe()
> > function and then only doing things in the bind() that absolutely
> > need
> > to be in the bind. ;-)
>=20
> I've been collecting patches that are ready to land in drm-misc but,
> right now, I'm not taking this patch since I didn't get any
> clarification of whether it should land through drm-misc or somewhere
> else.

Sorry, you can take it in drm-misc, yes.

Cheers,
-Paul
