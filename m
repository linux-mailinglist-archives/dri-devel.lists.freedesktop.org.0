Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C87359D21
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 15:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3F26E8D9;
	Fri, 28 Jun 2019 13:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFB16E8D9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 13:44:01 +0000 (UTC)
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 1D6A51C0002;
 Fri, 28 Jun 2019 13:43:55 +0000 (UTC)
Date: Fri, 28 Jun 2019 15:43:54 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 06/12] drm/modes: Support modes names on the command
 line
Message-ID: <20190628134354.trogpmqedr5h3fvl@flea>
References: <cover.5190d070d1439d762d7ab273f4ae2573087fee20.1560783090.git-series.maxime.ripard@bootlin.com>
 <18443e0c3bdbbd16cea4ec63bc7f2079b820b43b.1560783090.git-series.maxime.ripard@bootlin.com>
 <20190626152659.GA11481@ulmo>
MIME-Version: 1.0
In-Reply-To: <20190626152659.GA11481@ulmo>
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
Cc: eben@raspberrypi.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1367674928=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1367674928==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tdzuo56jtjnin7la"
Content-Disposition: inline


--tdzuo56jtjnin7la
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thierry,

On Wed, Jun 26, 2019 at 05:26:59PM +0200, Thierry Reding wrote:
> On Mon, Jun 17, 2019 at 04:51:33PM +0200, Maxime Ripard wrote:
> > From: Maxime Ripard <maxime.ripard@free-electrons.com>
> >
> > The drm subsystem also uses the video=3D kernel parameter, and in the
> > documentation refers to the fbdev documentation for that parameter.
> >
> > However, that documentation also says that instead of giving the mode u=
sing
> > its resolution we can also give a name. However, DRM doesn't handle that
> > case at the moment. Even though in most case it shouldn't make any
> > difference, it might be useful for analog modes, where different standa=
rds
> > might have the same resolution, but still have a few different paramete=
rs
> > that are not encoded in the modes (NTSC vs NTSC-J vs PAL-M for example).
> >
> > Reviewed-by: Noralf Tr=F8nnes <noralf@tronnes.org>
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/gpu/drm/drm_client_modeset.c |  4 ++-
> >  drivers/gpu/drm/drm_connector.c      |  3 +-
> >  drivers/gpu/drm/drm_modes.c          | 62 +++++++++++++++++++++--------
> >  include/drm/drm_connector.h          |  7 +++-
> >  4 files changed, 59 insertions(+), 17 deletions(-)
>
> This patch causes an issue on various Tegra boards that have so far been
> running flawlessly. Here's an extract from the boot log:
>
> 	[    0.000000] Kernel command line: root=3D/dev/nfs rw netdevwait ip=3D:=
::::eth0:on nfsroot=3D192.168.23.1:/srv/nfs/tegra194 console=3DttyTCU0,1152=
00n8 console=3Dtty0 fbcon=3Dmap:0 net.ifnames=3D0 rootfstype=3Dext4 video=
=3Dtegrafb no_console_suspend=3D1 earlycon=3Dtegra_comb_uart,mmio32,0x0c168=
000 gpt usbcore.old_scheme_first=3D1 tegraid=3D19.1.2.0.0 maxcpus=3D8 boot.=
slot_suffix=3D boot.ratchetvalues=3D0.2.2 vpr=3D0x8000000@0xf0000000 sdhci_=
tegra.en_boot_part_access=3D1
> 	...
> 	[   18.597001] [drm:drm_connector_init [drm]] cmdline mode for connector=
 DP-1 tegrafb 0x0@60Hz
> 	...
> 	[   18.627145] [drm:drm_connector_init [drm]] cmdline mode for connector=
 DP-2 tegrafb 0x0@60Hz
> 	...
> 	[   18.673770] [drm:drm_connector_init [drm]] cmdline mode for connector=
 HDMI-A-1 tegrafb 0x0@60Hz
> 	...
> 	[   19.057500] [drm:drm_mode_debug_printmodeline [drm]] Modeline "0x0": =
0 0 0 0 0 0 0 1 4 1 0x20 0x6
> 	[   19.066341] [drm:drm_mode_prune_invalid [drm]] Not using 0x0 mode: CL=
OCK_LOW
> 	...
> 	[   19.677803] [drm:drm_client_modeset_probe [drm]] looking for cmdline =
mode on connector 60
> 	[   19.686019] [drm:drm_client_modeset_probe [drm]] found mode 0x0
> 	...
> 	[   19.851843] drm drm: failed to set initial configuration: -28
>
> So basically what's happening here is that the bootloader is passing a
> video=3D parameter on the command-line and after this patch, the DRM core
> will consider the tegrafb in that parameter to be a named video mode.
> The mode is then filtered out because it doesn't make any sense, but
> then drm_client_modeset_probe() still tries to use it, eventually
> leading to failure because we can't allocate memory for a 0x0
> framebuffer.

What was the behaviour before? That it wouldn't set a mode at all?

> Now, there are obviously a couple of places where things go wrong. On
> one hand I think if the mode specified on the command-line is already
> filtered out, then drm_client_modeset_probe() should not be trying to
> use it.

Yeah, that would make sense

> One could also argue that the bootloader shouldn't be passing that
> video=3Dtegrafb parameter in the first place. Then again, this is nothing
> out of the ordinary (as documented in Documentation/fb/modedb.rst).

I've read that documentation, and I'm not sure which section in there
allows to do that?

> The problem with named modes, and you already highlighted this in your
> comment in the code, is that it's not possible to distinguish between a
> mode name and a video=3D option that defines the framebuffer device to
> use.
>
> That said, I wouldn't be surprised if this change ended up breaking on
> other devices. I'm also not sure that under these circumstances it's a
> good idea to support named modes. At least not until we have a better
> way of determining what's a real mode name and what isn't. Looking at
> the old modedb from fb, not even the standard modes listed there have
> names associated with them, so I'm not sure how this was ever supposed
> to work. From the looks of it, some of the fbdev drivers seem to take a
> mode list from board-code (see for example the mx21ads_modes array from
> arch/arm/mach-imx/mach-mx21ads.c). The imxfb driver can then take a mode
> name from the command line and try to match it against a list of known
> modes. That seems to match what the documentation says.
>
> However, that also really only works because this is all directly dealt
> with in the fbdev drivers. For DRM/KMS we don't do that and instead we
> rely on the core to provide this backwards-compatibility. However, at
> the time when we parse the mode from the command line we don't have the
> list of modes that are considered to be valid, so your patch currently
> needs to assume that it is a valid mode. I don't think that's a good
> idea, because clearly not all strings that currently make it through the
> filter are actually modes.

We have a list of named modes in the connector, and we match against
that. It already works for sunxi (minus the bugs..).

> So if we really need this, I think we want some way for the connector to
> provide the list of named modes that it supports so that by the time we
> want to parse the command-line we can check whether it's actually a name
> to avoid false positives like the ones I'm seeing on Tegra.

I guess that could work yep

> For now it might just be easiest to avoid any of this and disable the
> named mode support until it's a bit more mature. The patch no longer
> reverts cleanly, but it should be fairly easy to disable the feature in
> a follow-up patch again.

If we were to do that, I'd really like to have least get a unit test
for that case, and some documentation on how we're supposed to deal
with this case.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--tdzuo56jtjnin7la
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXRYZmgAKCRDj7w1vZxhR
xXSoAQCxbeuFE2y6dgH33D7dIgM3UYtqGoIhXIhYyxJZRjDlKAEAsG01uW0iAafH
qsuo2MfZ9+xPfiXv9NjUj+FauSt4Jg8=
=uJ3i
-----END PGP SIGNATURE-----

--tdzuo56jtjnin7la--

--===============1367674928==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1367674928==--
