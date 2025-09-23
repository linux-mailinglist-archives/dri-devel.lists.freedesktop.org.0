Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 434F0B95BC1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 13:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A695E10E5FD;
	Tue, 23 Sep 2025 11:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ehSeOyi+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B8910E5FD
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 11:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1758628280;
 bh=jvy/vAYmMOLRMMWIkSbBhe38y0mvh5nN853qLS5gDgM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ehSeOyi+ns1NkTMfcfayG43C5/SV/M/kM3Awdv8sTvSUmlWDaljYuQ40BVNeetFF6
 1DlhxAf1mV8XU7e5PE1Rb0ZmKCchK2IbDuYcOIbXYtTWtEDqOtxBCdygB+x+PVkV3n
 FSgXIX8VRfA6PmL3j0Ph8EnFSAGSub1MF9ntOxJ/soniru8De09VW1BlYqCL1p/L5S
 tG4uKblLlaA/QAlJuZcUYMj4Fw5NdWy2MV2kUGoPfN0INo4ilLrp7n8NvJkr2dNoAd
 JW25lvU7T//3wT/4J2E0znPCGlglml40nH9DGslcg6G2iFBm1MoY30644rR/SILBzR
 fb9wocIctIEEw==
Received: from xpredator (unknown
 [IPv6:2a02:2f08:ed09:4100:e88e:21ff:fe65:be18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D8ED217E00B0;
 Tue, 23 Sep 2025 13:51:19 +0200 (CEST)
Date: Tue, 23 Sep 2025 14:51:18 +0300
From: Marius Vlad <marius.vlad@collabora.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, daniel.stone@collabora.com,
 tzimmermann@suse.de, simona.vetter@ffwll.ch, derek.foreman@collabora.com
Subject: Re: [PATCH] drm/connector: hdmi: Add a link bpc property
Message-ID: <aNKJtqEwracEAiCn@xpredator>
References: <20250801101750.1726-1-marius.vlad@collabora.com>
 <a1c36f0b76eecbb6a4e23d71da053d89f7193b0d@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="di2kFlggsarfCZ6G"
Content-Disposition: inline
In-Reply-To: <a1c36f0b76eecbb6a4e23d71da053d89f7193b0d@intel.com>
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


--di2kFlggsarfCZ6G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jani,

Thanks for the feedback, sorry the late reply.

On Fri, Aug 01, 2025 at 03:19:08PM +0300, Jani Nikula wrote:
> On Fri, 01 Aug 2025, Marius Vlad <marius.vlad@collabora.com> wrote:
> > From: Derek Foreman <derek.foreman@collabora.com>
> >
> > Add a way to know the actual bpc of a running link.
> >
> > Drivers might change the current bpc link value due to changes in mode
> > line or refresh rates. For example when enabling VRR the underlying
> > hardware might not be able sustain the same bandwidth for a particular
> > mode line, and it might attempt to lower the bpc. Another example can be
> > found when switching the color output format, part of YUV420 fallback.
> >
> > This means we might be displaying a stale bpc value although it was
> > modified for different reasons -- like a refresh rate or an output
> > color format.
> >
> > This patch introduces a new property 'link bpc' that user-space can
>=20
> Nitpick, s/This patch introduces/Introduce/.
Sure, will mend.
>=20
> > use to get the current bpc value of a running link. In the same
> > time this would allow user-space set up bpc using 'max_bpc' property.
> >
> > Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_atomic_uapi.c |  5 +++++
> >  drivers/gpu/drm/drm_connector.c   | 26 ++++++++++++++++++++++++++
> >  include/drm/drm_connector.h       |  8 ++++++++
> >  3 files changed, 39 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_at=
omic_uapi.c
> > index ecc73d52bfae..3a2ffb957ade 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -776,6 +776,9 @@ static int drm_atomic_connector_set_property(struct=
 drm_connector *connector,
> >  						   fence_ptr);
> >  	} else if (property =3D=3D connector->max_bpc_property) {
> >  		state->max_requested_bpc =3D val;
> > +	} else if (property =3D=3D connector->link_bpc_property) {
> > +		drm_dbg_kms(dev, "only drivers can set link bpc property. Use max_bp=
c instead\n");
> > +		return -EINVAL;
> >  	} else if (property =3D=3D connector->privacy_screen_sw_state_propert=
y) {
> >  		state->privacy_screen_sw_state =3D val;
> >  	} else if (property =3D=3D connector->broadcast_rgb_property) {
> > @@ -861,6 +864,8 @@ drm_atomic_connector_get_property(struct drm_connec=
tor *connector,
> >  		*val =3D 0;
> >  	} else if (property =3D=3D connector->max_bpc_property) {
> >  		*val =3D state->max_requested_bpc;
> > +	} else if (property =3D=3D connector->link_bpc_property) {
> > +		*val =3D state->hdmi.output_bpc;
> >  	} else if (property =3D=3D connector->privacy_screen_sw_state_propert=
y) {
> >  		*val =3D state->privacy_screen_sw_state;
> >  	} else if (property =3D=3D connector->broadcast_rgb_property) {
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_conn=
ector.c
> > index 272d6254ea47..7ed27aec0ccc 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -542,6 +542,28 @@ int drmm_connector_init(struct drm_device *dev,
> >  }
> >  EXPORT_SYMBOL(drmm_connector_init);
> > =20
> > +static int
> > +drm_connector_attach_link_bpc_property(struct drm_connector *connector,
> > +				       int min, int max)
> > +{
> > +	struct drm_device *dev =3D connector->dev;
> > +	struct drm_property *prop;
> > +
> > +	prop =3D connector->link_bpc_property;
> > +	if (prop)
> > +		return 0;
> > +
> > +	prop =3D drm_property_create_range(dev, 0, "link bpc", min, max);
> > +	if (!prop)
> > +		return -ENOMEM;
> > +
> > +	connector->link_bpc_property =3D prop;
> > +
> > +	drm_object_attach_property(&connector->base, prop, max);
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * drmm_connector_hdmi_init - Init a preallocated HDMI connector
> >   * @dev: DRM device
> > @@ -618,6 +640,10 @@ int drmm_connector_hdmi_init(struct drm_device *de=
v,
> >  	drm_connector_attach_max_bpc_property(connector, 8, max_bpc);
> >  	connector->max_bpc =3D max_bpc;
> > =20
> > +	ret =3D drm_connector_attach_link_bpc_property(connector, 8, max_bpc);
> > +	if (ret)
> > +		return ret;
> > +
> >  	if (max_bpc > 8)
> >  		drm_connector_attach_hdr_output_metadata_property(connector);
> > =20
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index 8f34f4b8183d..4a50198aa7c0 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -2079,6 +2079,14 @@ struct drm_connector {
> >  	 */
> >  	struct drm_property *max_bpc_property;
> > =20
> > +	/**
> > +	 * @link_bpc_property: Current connector link bpc set by the driver
> > +	 *
> > +	 * This property can be used to retrieve the current link bpc from
> > +	 * connector_state::hdmi:output_bpc
>=20
> It doesn't have to be just HDMI, does it?
For sure it doesn't, just that I didn't found anything else that would
expose this independently of/for the connector type.=20

I'm under the impression that only HDMI -- and those drivers that
actually call the available helpers update this value accordingly.

For code that was inspired from i915, i915 doesn't seem to use those
helpers (intel_hdmi_mode_clock_valid) nor it does actually update
connector_state::hdmi:output_bpc when picking the best available bpc.  I
suppose doing this now wouldn't be that hard, but having something=20
similar for DP/MST seems like an quest on its own.=20

Is that something you'd like to see pursued with this patch/series?
>=20
> > +	 */
> > +	struct drm_property *link_bpc_property;
> > +
> >  	/** @privacy_screen: drm_privacy_screen for this connector, or NULL. =
*/
> >  	struct drm_privacy_screen *privacy_screen;
>=20
> --=20
> Jani Nikula, Intel

--di2kFlggsarfCZ6G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAmjSibMACgkQ9jQS5glH
1u9psQ//SrdbbD/CioOHBSa1htgR4dSebhncxmZlmoKG+tjRUdMB9r5LmrL5vvLB
NqYbIlEELMGUqh/now0DgheFjaFY4YKh/OW3E3wXBiPLXCKBzqiZ4ry2Lzb9b79l
EPseUsmD6uulEyiVZcdYaXEII5hEo4O14/oV9F8eOl+JlXDm6Z/DQVMsWwjuz+Kb
dCrJsR+meJC/3vKGL10VNnSGCsH8r+ot/P5+9dDSlt628pdyuM/k61Yu9TZoFIom
t+PEbQpD7wt3x4Z9/JpwV67ooh/wa2vpn+hwxbEZbTzxyqznAH9G4VgxZIEy9b6D
zGXAcP4oLFTKE5EkYpkwOf6E3V0uIz0Z5Le5JbzpwcZ9tCG6iPV32AaqwYRBMuWM
HOab1Od88vA3qRMeqKhbdtaQvu9qTkYjyxNI1stgkJwKRtPDT1sxK1/zx0HBbdmC
R0Fk1bOkdq3ZfjW7s6rRp+THwvqN+iQgo1EK21Q88JOdHGtvVKbq0uWADBFajxAd
jd+dPlY3ypGo3vUIBjsnB3wrcwwXewMFEM7uUJv32pE9zehnhg7HzWNAFu5Bljwf
FPHrOxfY6Il5d3/opxcA5Qn0dKNXfPJiqYWa4j23eovnQ/8DIlUwDCWcwuCqM8of
QQBsyzs+bLvYpageBzAr+k4LEflnm9VIV/OOlT7dckg19qIbP2s=
=XCSS
-----END PGP SIGNATURE-----

--di2kFlggsarfCZ6G--
