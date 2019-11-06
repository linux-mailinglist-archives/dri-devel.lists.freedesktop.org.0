Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15797F1431
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 11:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BB46E1B7;
	Wed,  6 Nov 2019 10:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89456E1B7
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 10:44:33 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 78474E0011;
 Wed,  6 Nov 2019 10:44:31 +0000 (UTC)
Date: Wed, 6 Nov 2019 11:46:28 +0100
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [GIT PULL FOR v5.5 - 2nd try] R-Car DU CMM support
Message-ID: <20191106104628.opzkif5ab5cinee6@uno.localdomain>
References: <20191022103135.GC4756@pendragon.ideasonboard.com>
 <20191105194902.GA8235@pendragon.ideasonboard.com>
 <CAPM=9tzhDyPU8GtJXCr+YRhNgx9F=Zo9PGiSbmpBWYkQ4qv9gg@mail.gmail.com>
 <CAPM=9tyh-cMCyKr-A7C0dHmCQaqrm+fypKM+m2zyJ22S5aXC7w@mail.gmail.com>
 <20191106100059.GA4878@pendragon.ideasonboard.com>
 <20191106100205.GB4878@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20191106100205.GB4878@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0718212584=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0718212584==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qhfunparqax2eyu4"
Content-Disposition: inline


--qhfunparqax2eyu4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent, Dave,

On Wed, Nov 06, 2019 at 12:02:05PM +0200, Laurent Pinchart wrote:
> This time with Jacopo correctly CC'ed.
>
> On Wed, Nov 06, 2019 at 12:00:59PM +0200, Laurent Pinchart wrote:
> > Hi Dave,
> >
> > (CC'ing Jacopo)
> >
> > On Wed, Nov 06, 2019 at 01:40:13PM +1000, Dave Airlie wrote:
> > > On Wed, 6 Nov 2019 at 05:56, Dave Airlie wrote:
> > > > On Wed, 6 Nov 2019 at 05:49, Laurent Pinchart wrote:
> > > > >
> > > > > Hi Dave,
> > > > >
> > > > > Has this pull request fallen through the cracks ?
> > > >
> > > > It fell down a different crack than usual, it made it from patchwork
> > > > onto my hard drive, but then I didn't execute the pull.
> > > >
> > > > I've pulled it down, thanks for reminder.
> > >
> > > Now it failed as I mentioned on irc.
> > >
> > > I think the new kconfig option needs to be a tristate, otherwise
> > > setting it to Y and having rcar-du as M fails to link
> >
> > Sorry about that :-S Both I and the 0-day bot failed to catch it.
> > Jacopo, could you please have a look ? I'm afraid this likely mean a new
> > version of the series, and thus missing the merge window, as we're
> > already at -rc6.

I managed to reproduce it by setting DRM=m.
RCAR_CMM stays indeed =y as it's a bool. Simply setting it to tristate
is enough to have it set to =m when DRM=m.

Could this be changed when applying the series ?

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 539d232790d1..e6607b5c8bb3 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -14,7 +14,7 @@ config DRM_RCAR_DU
          If M is selected the module will be called rcar-du-drm.

 config DRM_RCAR_CMM
-       bool "R-Car DU Color Management Module (CMM) Support"
+       tristate "R-Car DU Color Management Module (CMM) Support"
        depends on DRM && OF
        depends on DRM_RCAR_DU
        help

Thanks
  j

>
> --
> Regards,
>
> Laurent Pinchart

--qhfunparqax2eyu4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3CpIQACgkQcjQGjxah
VjyqHQ//cfWJiK5I0y/qVQK/Ep5Owx6qLH1PAVmkNBjAgCoAYx5dLU9KlUwDKKtD
gWR+mV3ax7+y5oX8F8uJ9yQKlOhp7+inUsv0xCvOVm/+kqM1tr6ftUf+Juy6yfse
d0uBzdEn0AHwq8TraZXGkbxToa4fY/jmz1uGGhjBh+KvEPAV2E8EEQRb9Ga9xrQw
uew24QblP1bLNR7xz21ZlATnU/DVMcGLXq8/prn40GOdaEUL2aklkLOEz/J5wi2T
8Md1+66/0J5fY3/b6ODjwMJKQi0wHJyZfVtXbfQ8Tpx1WDw7RXkplseFhjxU+y1N
gPXwBQ2nxpaVZKLGw74cY3u8YJkt9t/PRcC9ICY16Lg6a6Sj8zRjkG3vnu2J6MPH
nYlXcsQN+JJYnhArJXpeo2aihFIaBVNEJ55NDzQdhoh30A3hfn0PkEk9Hc388UOT
TAKWwOBCNqK6Ck8MtoN7YmwsIyCwer/s5KYNvuH0H5zS8zzn2soQKMcdoDMRBAcb
pNW8/QwfOuO6qmjfostfYjVQGOrRpZ1CfGP1BHZH7krMtdTsKHto1E2XaF3Z+Fwh
e3iynhjW2NihIRDSttYWXY4DscVi9U1zMpysraH/FQAFm0AJkM5dpyWTgCusqcXq
j78Ub2/qnHnyh0lrAfQj8zvUaXQx0w6c+Mf65X6qOJqXLkAoMlQ=
=3T9s
-----END PGP SIGNATURE-----

--qhfunparqax2eyu4--

--===============0718212584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0718212584==--
