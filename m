Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B403CCCE
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 15:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6BC890DD;
	Tue, 11 Jun 2019 13:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D90890DD
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 13:20:58 +0000 (UTC)
X-Originating-IP: 90.88.159.246
Received: from localhost (aaubervilliers-681-1-40-246.w90-88.abo.wanadoo.fr
 [90.88.159.246]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 517D7E0003;
 Tue, 11 Jun 2019 13:20:50 +0000 (UTC)
Date: Tue, 11 Jun 2019 15:20:49 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v3 3/6] drm/modes: Allow to specify rotation and
 reflection on the commandline
Message-ID: <20190611132049.njlrgbtobzgyzyzh@flea>
References: <cover.87b91639451f23d4ab68a7c9812f2dd158869025.1555591281.git-series.maxime.ripard@bootlin.com>
 <ba320b3a13c4444102b77c4d00f7c1dc810adc3c.1555591281.git-series.maxime.ripard@bootlin.com>
 <9ccb7573-d46e-4b90-7caa-7b8cd7b8e7a2@tronnes.org>
 <e2edb1dc-f719-93f0-5205-ecb7b44b057e@tronnes.org>
MIME-Version: 1.0
In-Reply-To: <e2edb1dc-f719-93f0-5205-ecb7b44b057e@tronnes.org>
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
Content-Type: multipart/mixed; boundary="===============0175479219=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0175479219==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mdnmry45awvilud2"
Content-Disposition: inline


--mdnmry45awvilud2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Noralf,

On Fri, Apr 19, 2019 at 10:53:28AM +0200, Noralf Tr=F8nnes wrote:
> Den 18.04.2019 18.40, skrev Noralf Tr=F8nnes:
> >
> >
> > Den 18.04.2019 14.41, skrev Maxime Ripard:
> >> Rotations and reflections setup are needed in some scenarios to initia=
lise
> >> properly the initial framebuffer. Some drivers already had a bunch of
> >> quirks to deal with this, such as either a private kernel command line
> >> parameter (omapdss) or on the device tree (various panels).
> >>
> >> In order to accomodate this, let's create a video mode parameter to de=
al
> >> with the rotation and reflexion.
> >>
> >> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> >> ---
> >>  drivers/gpu/drm/drm_client_modeset.c |  10 +++-
> >>  drivers/gpu/drm/drm_modes.c          | 110 ++++++++++++++++++++++----=
--
> >>  include/drm/drm_connector.h          |   9 ++-
> >>  3 files changed, 109 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/dr=
m_client_modeset.c
> >> index f2869c82510c..15145d2c86d5 100644
> >> --- a/drivers/gpu/drm/drm_client_modeset.c
> >> +++ b/drivers/gpu/drm/drm_client_modeset.c
> >> @@ -823,6 +823,7 @@ EXPORT_SYMBOL(drm_client_modeset_probe);
> >>  bool drm_client_panel_rotation(struct drm_mode_set *modeset, unsigned=
 int *rotation)
> >>  {
> >>  	struct drm_connector *connector =3D modeset->connectors[0];
> >> +	struct drm_cmdline_mode *cmdline;
> >>  	struct drm_plane *plane =3D modeset->crtc->primary;
> >>  	u64 valid_mask =3D 0;
> >>  	unsigned int i;
> >> @@ -844,6 +845,15 @@ bool drm_client_panel_rotation(struct drm_mode_se=
t *modeset, unsigned int *rotat
> >>  		*rotation =3D DRM_MODE_ROTATE_0;
> >>  	}
> >>
> >> +	/**
> >> +	 * We want the rotation on the command line to overwrite
> >> +	 * whatever comes from the panel.
> >> +	 */
> >> +	cmdline =3D &connector->cmdline_mode;
> >> +	if (cmdline->specified &&
> >> +	    cmdline->rotation !=3D DRM_MODE_ROTATE_0)
> >
> > I believe you need to drop that second check, otherwise rotate=3D0 will
> > not overwrite panel rotation.
> >
> >> +		*rotation =3D cmdline->rotation;
>
> I remembered that you wanted this to propagate to DRM userspace. That's
> not happening here.

It's propated to the userspace through the plane's rotation property,
I just checked.

> The only way I see for that to happen, is to set
> ->panel_orientation. And to repeat myself, imo that makes
> 'orientation' a better name for this video=3D option.

orientation and rotation are two different things to me. The
orientation of a panel for example is absolute, while the rotation is
a transformation. In this particular case, I think that both the
orientation and the rotation should be taken into account, with the
orientation being the default state, and the hardware / panel will
tell us that, while the rotation would be a transformation from that
default to whatever the user wants.

More importantly, the orientation is a property of the hardware (ie,
how the display has been assembled), while the rotation is a software
construct.

And if the property being used to expose that is the rotation, I guess
it would make sense to just use the same name and remain consistent.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--mdnmry45awvilud2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXP+qrAAKCRDj7w1vZxhR
xe5PAQDCQaIDsixvc62mOwJmH8N2VDKLgwxZHb4VAkAg2RCODwD9GaVUIrYgsH4V
8gU7LihF1xKwFgXm4nWPMTkv3/PVmAE=
=ch9K
-----END PGP SIGNATURE-----

--mdnmry45awvilud2--

--===============0175479219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0175479219==--
