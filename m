Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33591960DBC
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 16:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C842510E349;
	Tue, 27 Aug 2024 14:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AcQf7WWc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9915710E33C
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 14:39:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B58AFA41AB6;
 Tue, 27 Aug 2024 14:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCB67C61045;
 Tue, 27 Aug 2024 14:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724769587;
 bh=ckdi/miqyo98Qcfs4P1GzK4XTVojHa5tth4ya1iCIv4=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=AcQf7WWcp0kQuk7SA6AdlDMihcTgfxilbL/BSD+uqsaRJGsOWheyFXUxS36RlrcYC
 /vxpS+u600m+gJI6xgJNJu3pj7LWOqTKeTtlAI3nkR6jjmwJYZKCcWomny+lw6KvYh
 RrEMjpw2dvnBFH4CvfVarOHGcPgzR8SWzHjotjamaxOtRm9dJbbkC5zLxCcm4dAdZA
 dVw1cHaoL7rpWs0Si5WAlG/6SxGdg5rmYjJimjefbmpu/b0efDewzTgszqWPtXv39Y
 NqDen0kBanDRyerHCc46aa0hGoduQuZLaAlFPGx74f39VCrEeX3rRasKw8E6BnlW8J
 TTiZgf3ljR8GQ==
Date: Tue, 27 Aug 2024 16:39:44 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v2 1/6] drm/vkms: Switch to managed for connector
Message-ID: <20240827-chubby-tidy-collie-c8ecf7@houat>
References: <20240827-google-vkms-managed-v2-0-f41104553aeb@bootlin.com>
 <20240827-google-vkms-managed-v2-1-f41104553aeb@bootlin.com>
 <20240827-dynamic-acoustic-guillemot-ddde49@houat>
 <Zs3TeoUwn3iO7oBs@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="rvemour242cytzao"
Content-Disposition: inline
In-Reply-To: <Zs3TeoUwn3iO7oBs@louis-chauvet-laptop>
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


--rvemour242cytzao
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 03:24:10PM GMT, Louis Chauvet wrote:
> Le 27/08/24 - 15:15, Maxime Ripard a =E9crit :
> > Hi,
> >=20
> > On Tue, Aug 27, 2024 at 11:57:36AM GMT, Louis Chauvet wrote:
> > > The current VKMS driver uses non-managed function to create connector=
s. It
> > > is not an issue yet, but in order to support multiple devices easily,
> > > convert this code to use drm and device managed helpers.
> > >=20
> > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > ---
> > >  drivers/gpu/drm/vkms/vkms_drv.h    |  1 -
> > >  drivers/gpu/drm/vkms/vkms_output.c | 22 ++++++++++++----------
> > >  2 files changed, 12 insertions(+), 11 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/v=
kms_drv.h
> > > index 5e46ea5b96dc..9a3c6c34d1f6 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > > @@ -99,7 +99,6 @@ struct vkms_crtc_state {
> > >  struct vkms_output {
> > >  	struct drm_crtc crtc;
> > >  	struct drm_encoder encoder;
> > > -	struct drm_connector connector;
> > >  	struct drm_writeback_connector wb_connector;
> > >  	struct hrtimer vblank_hrtimer;
> > >  	ktime_t period_ns;
> > > diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkm=
s/vkms_output.c
> > > index 5ce70dd946aa..4fe6b88e8081 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_output.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_output.c
> > > @@ -3,11 +3,11 @@
> > >  #include "vkms_drv.h"
> > >  #include <drm/drm_atomic_helper.h>
> > >  #include <drm/drm_edid.h>
> > > +#include <drm/drm_managed.h>
> > >  #include <drm/drm_probe_helper.h>
> > > =20
> > >  static const struct drm_connector_funcs vkms_connector_funcs =3D {
> > >  	.fill_modes =3D drm_helper_probe_single_connector_modes,
> > > -	.destroy =3D drm_connector_cleanup,
> > >  	.reset =3D drm_atomic_helper_connector_reset,
> > >  	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_s=
tate,
> > >  	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
> > > @@ -50,7 +50,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, i=
nt index)
> > >  {
> > >  	struct vkms_output *output =3D &vkmsdev->output;
> > >  	struct drm_device *dev =3D &vkmsdev->drm;
> > > -	struct drm_connector *connector =3D &output->connector;
> > > +	struct drm_connector *connector;
> > >  	struct drm_encoder *encoder =3D &output->encoder;
> > >  	struct drm_crtc *crtc =3D &output->crtc;
> > >  	struct vkms_plane *primary, *cursor =3D NULL;
> > > @@ -80,8 +80,15 @@ int vkms_output_init(struct vkms_device *vkmsdev, =
int index)
> > >  	if (ret)
> > >  		return ret;
> > > =20
> > > -	ret =3D drm_connector_init(dev, connector, &vkms_connector_funcs,
> > > -				 DRM_MODE_CONNECTOR_VIRTUAL);
> > > +	connector =3D drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
> > > +	if (!connector) {
> > > +		DRM_ERROR("Failed to allocate connector\n");
> > > +		ret =3D -ENOMEM;
> > > +		goto err_connector;
> > > +	}
> > > +
> >=20
> > I think it would be worth explaining why you need to move to a separate
> > allocation for the connector now.
> >=20
> > Maxime
>=20
> Hi,
>=20
> This is in preparation for ConfigFS implementation, as the number of=20
> connector/encoders/crtc/planes... will be dynamic, we need to have=20
> separate alloaction.
>=20
> If I add this paragraph in the commit message, is it sufficient?
>=20
> 	A specific allocation for the connector is not strictly necessary=20
> 	at this point, but in order to implement dynamic configuration of=20
> 	VKMS (configFS), it will be easier to have one allocation per=20
> 	connector.
>=20
> (same for encoder & CRTC)

Yeah, that's a good message, but it probably belongs in a separate patch
then.

Thanks!
Maxime

--rvemour242cytzao
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZs3lMAAKCRAnX84Zoj2+
dorsAYC5SayM75HRPLbrhndfWBwXoDjAnqDJDy6BCtRdqynORziWDr2dZYuqqd4V
76YURcIBgKp9V3tn6rw20lDgiA2Zo1d7BrVWmVuHWRNI3PFdhjlvzRLsBw7zab+b
v/80cgOc7Q==
=wokh
-----END PGP SIGNATURE-----

--rvemour242cytzao--
