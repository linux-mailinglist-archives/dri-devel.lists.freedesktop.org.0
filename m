Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 399BAC568FB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 10:23:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF5D10E7E9;
	Thu, 13 Nov 2025 09:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qM7lzdvt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AEC810E7E9;
 Thu, 13 Nov 2025 09:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1763025794;
 bh=Y8pIRQA3Gh7+lYt2pulgpbadl5FdYH3E1VrlLuWgDZA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qM7lzdvtfd14pZ32W1hoWt7Byx9zL2ARWJByUkJTi+/s2yQ2ROzhvdEVyCBAhVIYF
 8YWKdlcx3TciY64/fvxPPfDZo2+nyTab8knDykI3R4HwGOsAgdfUOUV3/ynCDM2DR9
 RiEmFaBcSEIDILhVQxdwugvHPn3CpmOeEc8CRC4lKFiaPqJjYern+XWBk4PAfVTPlL
 9Aca53LxbpJc8VvqNAs71xBcesgl1y/1bvh6grPVceZdMyHb3VAomTOkODSVjpxPKA
 qPdehiYFH/LPDpozckndQj6J+Ti+JSl5wCrsduqay3otnobf4BS7s0hgDtvz8kky23
 uZmUeF1FqjZ2A==
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9F47817E1299;
 Thu, 13 Nov 2025 10:23:14 +0100 (CET)
Date: Thu, 13 Nov 2025 11:22:49 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Xaver Hugl <xaver.hugl@kde.org>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
Subject: Re: [PATCH 3/3] drm,amdgpu: add the "FreeSync HDR Mode" connector
 property
Message-ID: <20251113112249.4273a324@eldfell>
In-Reply-To: <20251112151832.77867-3-xaver.hugl@kde.org>
References: <20251112151832.77867-1-xaver.hugl@kde.org>
 <20251112151832.77867-3-xaver.hugl@kde.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rVlHDNys/HNbHCuFAmBtDfI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/rVlHDNys/HNbHCuFAmBtDfI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 12 Nov 2025 16:18:32 +0100
Xaver Hugl <xaver.hugl@kde.org> wrote:

> This property allows userspace to make the driver signal the display that=
 it
> should switch to FreeSync 2 HDR mode, which uses the native primaries and=
 a
> gamma 2.2 transfer function, instead of BT2020 + PQ in the more common HDR
> mode.

Hi Xaver,

that's awesome!

> FreeSync HDR provides the big benefit that display behavior is more
> predictable, and the "native" signal doesn't waste any color resolution on
> out of bounds colors or luminance values.
>=20
> The property has two values right now, "Disabled" and "FreeSync 2 Native".
> If any other FreeSync HDR modes exist or will be added at some point, they
> can be added as new enum values as well.

How should this interact with the connector properties "Colorspace" and
"HDR_OUTPUT_METADATA"?

Does one override the other when they disagree? Is userspace
expected to program all of them into agreement? Should the atomic
commit fail if they disagree?

What about instead of a new property, make a new value called "Native"
for "Colorspace", and require userspace to set HDR_OUTPUT_METADATA eotf
field to "traditional gamma HDR"? This might be a silly idea, but I'd
like to hear why. Alternatively, HDR_OUTPUT_METADATA could use a new
'metadata_type' value for the eotf.


Thanks,
pq

> Signed-off-by: Xaver Hugl <xaver.hugl@kde.org>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 +++++-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 +
>  drivers/gpu/drm/drm_atomic_uapi.c             |  4 ++
>  drivers/gpu/drm/drm_connector.c               | 45 +++++++++++++++++++
>  include/drm/drm_connector.h                   | 18 ++++++++
>  5 files changed, 81 insertions(+), 1 deletion(-)

...

> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 272d6254ea47..93727992f757 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1802,6 +1802,15 @@ EXPORT_SYMBOL(drm_hdmi_connector_get_output_format=
_name);
>   *
>   *	Drivers can set up these properties by calling
>   *	drm_mode_create_tv_margin_properties().
> + *
> + * FreeSync HDR Mode:
> + * 	This optional property allows userspace to signal the display to swi=
tch
> + * 	into FreeSync 2 HDR mode, which assumes a colorspace with native
> + * 	primaries and a gamma 2.2 transfer function with min and max luminan=
ce
> + * 	matching the display.
> + * 	Like with HDR_OUTPUT_METADATA, it is up to userspace to find out whi=
ch
> + * 	mode the display supports, and which primaries and luminance levels =
it
> + * 	has to use.
>   */
> =20
>  int drm_connector_create_standard_properties(struct drm_device *dev)
> @@ -2947,6 +2956,42 @@ bool drm_connector_atomic_hdr_metadata_equal(struc=
t drm_connector_state *old_sta
>  }
>  EXPORT_SYMBOL(drm_connector_atomic_hdr_metadata_equal);
> =20
> +static const struct drm_prop_enum_list freesync_hdr_mode_names[] =3D {
> +	{ FREESYNC_HDR_DISABLED, "Disabled" },
> +	{ FREESYNC_2_HDR_NATIVE, "FreeSync 2 Native" },
> +};
> +
> +/**
> + * drm_connector_attach_freesync_hdr_property - attach "FreeSync HDR Mod=
e"property
> + * @connector: connector to attach the property on.
> + *
> + * This is used to allow the userspace to enable or disable FreeSync HDR.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_connector_attach_freesync_hdr_property(struct drm_connector *con=
nector)
> +{
> +	struct drm_device *dev =3D connector->dev;
> +	struct drm_property *prop =3D connector->freesync_hdr_property;
> +	if (!prop) {
> +		prop =3D drm_property_create_enum(dev, DRM_MODE_PROP_ENUM,
> +						"FreeSync HDR Mode",
> +						freesync_hdr_mode_names,
> +						ARRAY_SIZE(freesync_hdr_mode_names));
> +		if (!prop)
> +			return -EINVAL;
> +
> +		connector->freesync_hdr_property =3D prop;
> +	}
> +
> +	drm_object_attach_property(&connector->base, prop,
> +				   FREESYNC_HDR_DISABLED);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_attach_freesync_hdr_property);
> +
>  /**
>   * drm_connector_set_vrr_capable_property - sets the variable refresh ra=
te
>   * capable property for a connector
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 8f34f4b8183d..33e557a2d985 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -462,6 +462,11 @@ enum drm_privacy_screen_status {
>  	PRIVACY_SCREEN_ENABLED_LOCKED,
>  };
> =20
> +enum freesync_hdr_mode {
> +    FREESYNC_HDR_DISABLED =3D 0,
> +    FREESYNC_2_HDR_NATIVE =3D 1,
> +};
> +
>  /**
>   * enum drm_colorspace - color space
>   *
> @@ -1149,6 +1154,12 @@ struct drm_connector_state {
>  	 * @drm_atomic_helper_connector_hdmi_check().
>  	 */
>  	struct drm_connector_hdmi_state hdmi;
> +
> +	/**
> +	* @freesync_hdr_mode: Connector property to enable
> +	* or disable FreeSync HDR
> +	*/
> +	enum freesync_hdr_mode freesync_hdr_mode;
>  };
> =20
>  struct drm_connector_hdmi_audio_funcs {
> @@ -2103,6 +2114,12 @@ struct drm_connector {
>  	 */
>  	struct drm_property *broadcast_rgb_property;
> =20
> +	/**
> +	* @freesync_hdr_property: Connector property to enable
> +	* or disable FreeSync HDR
> +	*/
> +	struct drm_property *freesync_hdr_property;
> +
>  #define DRM_CONNECTOR_POLL_HPD (1 << 0)
>  #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
>  #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
> @@ -2453,6 +2470,7 @@ int drm_connector_attach_colorspace_property(struct=
 drm_connector *connector);
>  int drm_connector_attach_hdr_output_metadata_property(struct drm_connect=
or *connector);
>  bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state =
*old_state,
>  					     struct drm_connector_state *new_state);
> +int drm_connector_attach_freesync_hdr_property(struct drm_connector *con=
nector);
>  int drm_mode_create_aspect_ratio_property(struct drm_device *dev);
>  int drm_mode_create_hdmi_colorspace_property(struct drm_connector *conne=
ctor,
>  					     u32 supported_colorspaces);


--Sig_/rVlHDNys/HNbHCuFAmBtDfI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmkVo2kACgkQI1/ltBGq
qqcgkxAAqoP9wzZ/xIMq+OJchykvriYPdu5LbBJlbFCNdP1Pmv3Xsc2sPtinkVbr
VX33vNyTPDvt6oUgEEiBV8eoRNcum2dd6iYRUtXglFA5a3NLMmy5HTvE3a7R8RYN
OG4clw9h/g3m2hkf3HWT/RGL+kI/yGbX45rifnppjpEVRuovtufoArgzR/eXD3g1
6PcZtdA5sanPU25dtAWgG3QOerucfnzEOxt1Xex5g1AW03BuEBchUd8JqobeTVOw
9a+ajFttfMyT6NDXwIPvDaZfRVLYRC3+no6xl1L7p6+mmyY0jVCbFQariZeXqwYI
ohHBjn+r7aop6ZXTouvhSKAW+q6UH2ZSjDsIh273B9pMJ8weCbkElrgFpLocxBHH
krF7rgQijJLnzzP1AlO0k67BuwLti2NnF7yYB6oZCHu1XX9toIEj8azKmccBwvda
lQPpH0Q21Av10Mn8seLRvVJbY6GvkjKWNVandiYl0aYIAnsdnPHYrU1GxOClIs1c
zRKvtCCBHMXrMp7X2XPzpzUPj0Z1Q02Ve5ORiY1HFdUzRuvvW9272zfbWX1lE8Ta
NDqHaZ7lEFDq20sCoy/zQQhiw1YAFQkQ7l4xuB8kxDPv/KgaVVG1XWjc+BNtERXz
UP0oPWXwJbyNHPTCcd7DKDN/WBTM04hh1LycTKf/7rB1zWVkQRo=
=X8s9
-----END PGP SIGNATURE-----

--Sig_/rVlHDNys/HNbHCuFAmBtDfI--
