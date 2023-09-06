Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 081C7793505
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 07:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BCA10E1D5;
	Wed,  6 Sep 2023 05:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC0510E1D5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 05:47:32 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1qdlNy-0003L2-Ug; Wed, 06 Sep 2023 07:47:30 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1qdlNx-004MDD-Pt; Wed, 06 Sep 2023 07:47:29 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1qdlNx-0002Fq-0r;
 Wed, 06 Sep 2023 07:47:29 +0200
Message-ID: <d56dfb568711b4b932edc9601010feda020c2c22.camel@pengutronix.de>
Subject: Re: [RFT PATCH 13/15] drm/imx/ipuv3: Call
 drm_atomic_helper_shutdown() at shutdown/unbind time
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Doug Anderson <dianders@chromium.org>
Date: Wed, 06 Sep 2023 07:47:29 +0200
In-Reply-To: <CAD=FV=WLw3cAU0nuNuKXiu=Zbv4tVa3aa35GFaxsjO880T0pmw@mail.gmail.com>
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.13.I0a9940ff6f387d6acf4e71d8c7dbaff8c42e3aaa@changeid>
 <32186b941d6228a102b5e799aadf34206b58ac15.camel@pengutronix.de>
 <CAD=FV=WLw3cAU0nuNuKXiu=Zbv4tVa3aa35GFaxsjO880T0pmw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Di, 2023-09-05 at 13:29 -0700, Doug Anderson wrote:
> Hi,
>=20
> On Mon, Sep 4, 2023 at 1:30=E2=80=AFAM Philipp Zabel <p.zabel@pengutronix=
.de> wrote:
> >=20
> > On Fr, 2023-09-01 at 16:41 -0700, Douglas Anderson wrote:
> > > Based on grepping through the source code this driver appears to be
> > > missing a call to drm_atomic_helper_shutdown() at system shutdown tim=
e
> > > and at driver unbind time. Among other things, this means that if a
> > > panel is in use that it won't be cleanly powered off at system
> > > shutdown time.
> > >=20
> > > The fact that we should call drm_atomic_helper_shutdown() in the case
> > > of OS shutdown/restart and at driver remove (or unbind) time comes
> > > straight out of the kernel doc "driver instance overview" in
> > > drm_drv.c.
> > >=20
> > > A few notes about this fix:
> > > - When adding drm_atomic_helper_shutdown() to the unbind path, I adde=
d
> > >   it after drm_kms_helper_poll_fini() since that's when other drivers
> > >   seemed to have it.
> > > - Technically with a previous patch, ("drm/atomic-helper:
> > >   drm_atomic_helper_shutdown(NULL) should be a noop"), we don't
> > >   actually need to check to see if our "drm" pointer is NULL before
> > >   calling drm_atomic_helper_shutdown(). We'll leave the "if" test in,
> > >   though, so that this patch can land without any dependencies. It
> > >   could potentially be removed later.
> > > - This patch also makes sure to set the drvdata to NULL in the case o=
f
> > >   bind errors to make sure that shutdown can't access freed data.
> > >=20
> > > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >=20
> > Thank you,
> > Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
>=20
> Thanks! I notice that:
>=20
> ./scripts/get_maintainer.pl --scm -f drivers/gpu/drm/imx/ipuv3/imx-drm-co=
re.c
>=20
> Doesn't say drm-misc but also when I look at the MAINTAINERS file and
> find the section for "DRM DRIVERS FOR FREESCALE IMX"

That should probably say "IMX5/6" nowadays. There are a lot more i.MX
that do not use IPUv3 than those that do.

> it doesn't explicitly list a different git tree.

I used to send pull requests from git.pengutronix.de/git/pza/linux,
same as for the reset controller framework. I might still have to do
that for changes in drivers/gpu/ipu-v3 that need coordination between
drm and v4l2, but usually pure drm/imx/ipuv3 changes are pushed to drm-
misc.

> I guess the "shawnguo" git tree listed by get_maintainer.pl is just
> from regex matching?

The "N: imx" pattern in "ARM/FREESCALE IMX / MXC ARM ARCHITECTURE", I
think.

> Would you expect this to go through drm-misc? If so, I'll probably
> land it sooner rather than later. I can also post up a patch making it
> obvious that "DRM DRIVERS FOR FREESCALE IMX" goes through drm-misc if
> you don't object.

Yes, both would be great.

regards
Philipp
