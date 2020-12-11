Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F25842D7662
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 14:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1F06EDE8;
	Fri, 11 Dec 2020 13:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58676EDE8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 13:17:44 +0000 (UTC)
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 6058260009;
 Fri, 11 Dec 2020 13:17:41 +0000 (UTC)
Date: Fri, 11 Dec 2020 14:17:40 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v7 2/3] drm: Add support for the LogiCVC display controller
Message-ID: <X9NxdLtIsGxbDmfL@aptenodytes>
References: <20201102155308.142691-1-paul.kocialkowski@bootlin.com>
 <20201102155308.142691-3-paul.kocialkowski@bootlin.com>
 <20201103094659.56sdcerwwzqu2gdy@gilmour.lan>
 <X8e7kBx/OYpN2HqB@aptenodytes>
 <20201207104231.ipa5dccnxxro3xxc@gilmour>
MIME-Version: 1.0
In-Reply-To: <20201207104231.ipa5dccnxxro3xxc@gilmour>
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>
Content-Type: multipart/mixed; boundary="===============2109363884=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2109363884==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r7jeyoHvsI0TyI2X"
Content-Disposition: inline


--r7jeyoHvsI0TyI2X
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 07 Dec 20, 11:42, Maxime Ripard wrote:
> On Wed, Dec 02, 2020 at 05:06:40PM +0100, Paul Kocialkowski wrote:
> > > > +static void logicvc_crtc_atomic_begin(struct drm_crtc *drm_crtc,
> > > > +				      struct drm_atomic_state *state)
> > > > +{
> > > > +	struct logicvc_crtc *crtc =3D logicvc_crtc(drm_crtc);
> > > > +	struct drm_crtc_state *crtc_state =3D
> > > > +		drm_atomic_get_old_crtc_state(state, drm_crtc);
> > > > +	struct drm_device *drm_dev =3D drm_crtc->dev;
> > > > +	unsigned long flags;
> > > > +
> > > > +	/* Register pending event, only if vblank is already on. */
> > > > +	if (drm_crtc->state->event && crtc_state->active) {
> > > > +		spin_lock_irqsave(&drm_dev->event_lock, flags);
> > > > +		WARN_ON(drm_crtc_vblank_get(drm_crtc) !=3D 0);
> > > > +
> > > > +		crtc->event =3D drm_crtc->state->event;
> > > > +		drm_crtc->state->event =3D NULL;
> > > > +
> > > > +		spin_unlock_irqrestore(&drm_dev->event_lock, flags);
> > > > +	}
> > > > +}
> > >=20
> > > That's unusual to do it in atomic_begin, why do you need it?
> >=20
> > This is to cover the case where we need to send a page flip event but t=
he
> > crtc is already on. In that case, neither atomic_enable nor atomic_disa=
ble
> > will be called so we need to rely on atomic_begin to grab that event.
> > This happens for example when a single plane is updated.
> >=20
> > The same thing is done in e.g. sun4i-drm.
>=20
> Yeah, but I'm not sure why that's needed in the first place on sun4i-drm
> either. This looks to me as either something that should be handled by
> the helpers, or isn't needed at all. Just like the other times you
> fiddle with the vblank in your driver.

I didn't really question myself about whether this could be done in helpers,
but it looks like the philosophy now is that the driver grabs the page flip
done event when it can and serves the event in the IRQ routine.

So nothing unusual about this driver in particular.

> I looked around and the only drivers that have that logic seem to be ARM
> HDLCD, Atmel HCLDC, Meson, Tegra. This looks like it might be some cargo
> cult.
>=20
> Daniel, do you know why that would be needed?

As far as I understand, this could work just as well with a helper in my
case (and sun4i-drm's case as well). But in any case, what this patch imple=
ments
is the current philosophy and I guess that reworking it through helpers is
way out of the scope of this series ;)

> > > > +static void logicvc_version_print(struct logicvc_drm *logicvc)
> > > > +{
> > > > +	u32 version;
> > > > +
> > > > +	regmap_read(logicvc->regmap, LOGICVC_IP_VERSION_REG, &version);
> > > > +
> > > > +	DRM_INFO("LogiCVC version %d.%02d.%c\n",
> > > > +		 (int)LOGICVC_FIELD_GET(LOGICVC_IP_VERSION_MAJOR, version),
> > > > +		 (int)LOGICVC_FIELD_GET(LOGICVC_IP_VERSION_MINOR, version),
> > > > +		 (char)LOGICVC_FIELD_GET(LOGICVC_IP_VERSION_LEVEL, version) +
> > > > +		 'a');
> > >=20
> > > DRM_DEV_INFO?
> >=20
> > Okay but now according to Sam, "DRM_DEV_ERROR() and friends are depreca=
ted"
> > so I wonder which is the right one to use at this point.
>=20
> AFAIU, it's drm_info / drm_err

Thanks!

> > > > +static void logicvc_encoder_enable(struct drm_encoder *drm_encoder)
> > > > +{
> > > > +	struct logicvc_drm *logicvc =3D logicvc_drm(drm_encoder->dev);
> > > > +	struct logicvc_interface *interface =3D
> > > > +		logicvc_interface_from_drm_encoder(drm_encoder);
> > > > +
> > > > +	regmap_update_bits(logicvc->regmap, LOGICVC_POWER_CTRL_REG,
> > > > +			   LOGICVC_POWER_CTRL_VIDEO_ENABLE,
> > > > +			   LOGICVC_POWER_CTRL_VIDEO_ENABLE);
> > > > +
> > > > +	if (interface->drm_panel) {
> > > > +		drm_panel_prepare(interface->drm_panel);
> > > > +
> > > > +		/* Encoder enable is too early to enable the panel and a white
> > > > +		 * screen will be seen if the panel gets enabled before the
> > > > +		 * first page flip is done (and no other framebuffer
> > > > +		 * configuration remains from the boot software). */
> > > > +		interface->drm_panel_enabled =3D false;
> > > > +	}
> > > > +}
> > >=20
> > > That's fishy (and the similar stuff in commit_tail). Is it because you
> > > need to have the CRTC powered before the encoder?
> > >=20
> > > If so, you should try the commit_tail_rpm variant, it makes sure the
> > > CRTC is powered on before making a commit.
> >=20
> > No, this is unrelated to CRTC vs encoder enable order. Instead, it's ab=
out
> > panel enable order: I don't want to enable the panel before a buffer was
> > flipped on the CRTC otherwise a blank/white/garbage screen will be show=
n.
>=20
> Well, since the encoder will enable the panel, it's kind of related
> though?

Right, I meant that it's not related to the CRTC in particular.

> > This is why this drm_panel_enabled variable is used to make sure we don=
't
> > enable the panel before.
> >=20
> > This is nothing specific to my hardware, but a general concern that pro=
bably
> > exists in every DRM driver. Nobody really seems to care about it but I'=
ve
> > decided that I would in this driver. Now if you think this is too exoti=
c,
> > I don't mind removing it.
>=20
> If this is a concern of yours and affects multiple drivers, then it
> should be fixed in the core, not in one particular driver.

So I suppose this should be fixed by having the core enable the encoder at =
first
page flip and not before then, right?

In that case the change should indeed be separate from this series and my d=
river
should still enable the panel at encoder enable time.

In spite of that, I agree this implementation is not very appropriate so I'=
ll
get rid of it in the next revision.

> > > > +static void logicvc_connector_destroy(struct drm_connector *drm_co=
nnector)
> > > > +{
> > > > +	drm_connector_cleanup(drm_connector);
> > > > +}
> > >=20
> > > I guess you don't need that intermediate function?
> >=20
> > I would need to check if that call is necessary or if some implied mech=
anism
> > calls it for me already.
>=20
> What I meant is that you don't need logicvc_connector_destroy, you can
> directly set the atomic_destroy_state to drm_connector_cleanup.

Oh right, I hadn't really noticed that the prototypes are 100% the same :)

Thanks for the review,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--r7jeyoHvsI0TyI2X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl/TcXQACgkQ3cLmz3+f
v9Gfagf/Xb0Nda8hOPL/6tNcqLhoI2vWfpZWazSwV7vjr4O8Ok6yFYZwub+38qA7
DhJAvQChTQl18uUXaPsaHAy7lVlIQsfh/AOeSK4DPDxNV0wDmoKkI//hvXnyGXj2
CJxwM0+aoG2/rai19cT99euMbBGw9bK8a84P59hVs5YoWa25/Xgbwk5zllBRNYlo
Faiq/crIzGWOA5iyAUrE9JuFZjmBhvZUvCTsAE/k1B6pTIY7Z3OydeemrWhW9caD
yE3+4EQTAsg4WAyWaqZ3rNT0VcKwA8E9NV/FK+P7jr7K/+SXrsdinC8QuNHq8V9Q
7TdKcSDc9PEi5l4GdfXsv2Qit0BhvA==
=uJ66
-----END PGP SIGNATURE-----

--r7jeyoHvsI0TyI2X--

--===============2109363884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2109363884==--
