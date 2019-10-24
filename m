Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 307FCE34CE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 15:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2F46E41A;
	Thu, 24 Oct 2019 13:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D888B89AD2;
 Thu, 24 Oct 2019 13:54:45 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v6so2719416wmj.0;
 Thu, 24 Oct 2019 06:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0cZShYLHRd7NnAHk/IY7awNBnZ9IrpyZyFXdwrZkHyk=;
 b=heImNDxyRbJ2FfRPccfJuZT1ESxJmLSLy50Oyzwiz5wq6X/lzwUL7gnqx7jLxsOHGY
 vFQKXX/WX3ttUC+hqWE5FbxGWdgtQ2U7IpWeYKuuKrLgDY2OKRI+AXqClBLy4HcZgFMf
 rWFSs6WjspBoFv685+sgLEKPt52J9WA5x0ENBmi0li8wxyTynGxnb014hREQsSrxtID/
 Mhzg7vN4GAi1AyHHfQ8H04/xGMfKxR+Gj7EA3RNLr5FfY28P9Ixk+7SUhben9YLkI3fm
 C5NcC5dAxepTlmlAo9Snd+xRQkMLQUVs3LQt2AaIqon9QEeFI8wmd+rv/W7lQdWCd2Vr
 vhZA==
X-Gm-Message-State: APjAAAVT1PXRqDGpT+u5WXmMvg95FOHAPdPpiqNOF1siAvk8zW7WXWk0
 XRia/77lMTlx0NsZRpFmDwLJtCVs
X-Google-Smtp-Source: APXvYqyJ0SUg3TseUH/kV4Id5JX23lnTqlBvXSS4FW0LCBogLxJPqlXC78Doi5n7L+qqb5w+n8tpew==
X-Received: by 2002:a1c:e08a:: with SMTP id x132mr5164259wmg.146.1571925284294; 
 Thu, 24 Oct 2019 06:54:44 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id h17sm2764459wmb.33.2019.10.24.06.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 06:54:42 -0700 (PDT)
Date: Thu, 24 Oct 2019 15:54:41 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/dp: Add function to parse EDID
 descriptors for adaptive sync limits
Message-ID: <20191024135441.GE2924027@ulmo>
References: <20191024000041.7391-1-manasi.d.navare@intel.com>
 <20191024103106.GA2825247@ulmo> <20191024113400.GX1208@intel.com>
MIME-Version: 1.0
In-Reply-To: <20191024113400.GX1208@intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0cZShYLHRd7NnAHk/IY7awNBnZ9IrpyZyFXdwrZkHyk=;
 b=lTBub8Rzc1Gs/KjVqlA38yrEBB2UVzXipUxwaP3jpB54hblmmM6wOejcUQa0BkAJWd
 qo1wm9xQC4zWIPheCYd6RmqW3WTFP98X3JLrAQITHbhBUdqgUOGUXCXd8K4wTtlaPeWY
 zS4jTkZb2yNACDGZQEdnpOSHL6nsHoUhQTR/F7d29oNi2rIq5+X4/N1FYXgzXIOimcgO
 Gcl8vinF8GnrhH7oeBnBDcNUV8kydgpuIhBNVOGEGvth8QbRBVhsbCYpwyWmjxdUOGEI
 OuLGPavjefUaHC+XqRDbjgqqrDPK6OCu9UI9VG27sanvlNZ5qmB7PA+8NdQ8pwje5FXK
 vlRQ==
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
Cc: Manasi Navare <manasi.d.navare@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1498116446=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1498116446==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3XA6nns4nE4KvaS/"
Content-Disposition: inline


--3XA6nns4nE4KvaS/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2019 at 02:34:00PM +0300, Ville Syrj=C3=A4l=C3=A4 wrote:
> On Thu, Oct 24, 2019 at 12:31:06PM +0200, Thierry Reding wrote:
> > On Wed, Oct 23, 2019 at 05:00:41PM -0700, Manasi Navare wrote:
> > > Adaptive Sync is a VESA feature so add a DRM core helper to parse
> > > the EDID's detailed descritors to obtain the adaptive sync monitor ra=
nge.
> > > Store this info as part fo drm_display_info so it can be used
> > > across all drivers.
> > > This part of the code is stripped out of amdgpu's function
> > > amdgpu_dm_update_freesync_caps() to make it generic and be used
> > > across all DRM drivers
> > >=20
> > > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > Cc: Harry Wentland <harry.wentland@amd.com>
> > > Cc: Clinton A Taylor <clinton.a.taylor@intel.com>
> > > Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_edid.c  | 49 +++++++++++++++++++++++++++++++++++=
++
> > >  include/drm/drm_connector.h | 25 +++++++++++++++++++
> > >  include/drm/drm_edid.h      |  2 ++
> > >  3 files changed, 76 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > > index 474ac04d5600..97dd1200773e 100644
> > > --- a/drivers/gpu/drm/drm_edid.c
> > > +++ b/drivers/gpu/drm/drm_edid.c
> > > @@ -4707,6 +4707,52 @@ static void drm_parse_cea_ext(struct drm_conne=
ctor *connector,
> > >  	}
> > >  }
> > > =20
> > > +void drm_get_adaptive_sync_limits(struct drm_connector *connector,
> > > +				  const struct edid *edid)
> > > +{
> > > +	struct drm_display_info *info =3D &connector->display_info;
> > > +	const struct detailed_timing *timing;
> > > +	const struct detailed_non_pixel *data;
> > > +	const struct detailed_data_monitor_range *range;
> > > +	int i;
> >=20
> > This can be unsigned int.
>=20
> Please no. A loop iterator called 'i' should always be a normal signed in=
t.

What? Where's that rule written down? In my experience it's always
better to use as restrictive a type as possible. It's really annoying
when GCC suddenly starts complaining about comparison between signed and
unsigned. So if a variable can never contain a signed value, why risk
the ambiguity? The value goes from 0 to 4, the sign bit is useless.

> > > +	/*
> > > +	 * Restrict Adaptive Sync only for dp and edp
> > > +	 */
> > > +	if (connector->connector_type !=3D DRM_MODE_CONNECTOR_DisplayPort &&
> > > +	    connector->connector_type !=3D DRM_MODE_CONNECTOR_eDP)
> > > +		return;
> > > +
> > > +	if (edid->version <=3D 1 && !(edid->version =3D=3D 1 && edid->revis=
ion > 1))
> > > +		return;
> > > +
> > > +	for (i =3D 0; i < 4; i++) {
> > > +		timing  =3D &edid->detailed_timings[i];
> > > +		data    =3D &timing->data.other_data;
> > > +		range   =3D &data->data.range;
> > > +		/*
> > > +		 * Check if monitor has continuous frequency mode
> > > +		 */
> > > +		if (data->type !=3D EDID_DETAIL_MONITOR_RANGE)
> > > +			continue;
> > > +		/*
> > > +		 * Check for flag range limits only. If flag =3D=3D 1 then
> > > +		 * no additional timing information provided.
> > > +		 * Default GTF, GTF Secondary curve and CVT are not
> > > +		 * supported
> > > +		 */
> > > +		if (range->flags !=3D 1)
> > > +			continue;
> > > +
> > > +		info->adaptive_sync.min_vfreq =3D range->min_vfreq;
> > > +		info->adaptive_sync.max_vfreq =3D range->max_vfreq;
> > > +		info->adaptive_sync.pixel_clock_mhz =3D
> > > +			range->pixel_clock_mhz * 10;
> > > +		break;
> > > +	}
> > > +}
> > > +EXPORT_SYMBOL(drm_get_adaptive_sync_limits);
> > > +
> > >  /* A connector has no EDID information, so we've got no EDID to comp=
ute quirks from. Reset
> > >   * all of the values which would have been set from EDID
> > >   */
> > > @@ -4728,6 +4774,7 @@ drm_reset_display_info(struct drm_connector *co=
nnector)
> > >  	memset(&info->hdmi, 0, sizeof(info->hdmi));
> > > =20
> > >  	info->non_desktop =3D 0;
> > > +	memset(&info->adaptive_sync, 0, sizeof(info->adaptive_sync));
> > >  }
> > > =20
> > >  u32 drm_add_display_info(struct drm_connector *connector, const stru=
ct edid *edid)
> > > @@ -4743,6 +4790,8 @@ u32 drm_add_display_info(struct drm_connector *=
connector, const struct edid *edi
> > > =20
> > >  	info->non_desktop =3D !!(quirks & EDID_QUIRK_NON_DESKTOP);
> > > =20
> > > +	drm_get_adaptive_sync_limits(connector, edid);
> > > +
> > >  	DRM_DEBUG_KMS("non_desktop set to %d\n", info->non_desktop);
> > > =20
> > >  	if (edid->revision < 3)
> > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > > index 5f8c3389d46f..a27a84270d8d 100644
> > > --- a/include/drm/drm_connector.h
> > > +++ b/include/drm/drm_connector.h
> > > @@ -254,6 +254,26 @@ enum drm_panel_orientation {
> > >  	DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
> > >  };
> > > =20
> > > +/**
> > > + * struct drm_adaptive_sync_info - Panel's Adaptive Sync capabilitie=
s for
> > > + * &drm_display_info
> > > + *
> > > + * This struct is used to store a Panel's Adaptive Sync capabilities
> > > + * as parsed from EDID's detailed monitor range descriptor block.
> > > + *
> > > + * @min_vfreq: This is the min supported refresh rate in Hz from
> > > + *             EDID's detailed monitor range.
> > > + * @max_vfreq: This is the max supported refresh rate in Hz from
> > > + *             EDID's detailed monitor range
> > > + * @pixel_clock_mhz: This is the dotclock in MHz from
> > > + *                   EDID's detailed monitor range
> > > + */
> > > +struct drm_adaptive_sync_info {
> > > +	int min_vfreq;
> > > +	int max_vfreq;
> > > +	int pixel_clock_mhz;
> >=20
> > Any reason why these can't be unsigned? Also, does it perhaps make sense
> > to store the pixel clock as kHz like we do everywhere else?
>=20
> Aye, all typical clock frequencies should be in khz.
>=20
> Also the vfreqs are only u8 in the EDID, so can be u8 here as well.

Not if you store them in kHz, they can't.

Thierry

--3XA6nns4nE4KvaS/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2xrSEACgkQ3SOs138+
s6Gjvw//bKR2vIivE5aWUTYp8d4uHGS7J5FvUx3vtLE6JE6tfTOeNDJEYXYGcRZ+
+pf3Cnu8tBXr9Jwzt6lan9/hkjHOJ+XkmeW4FKG2tV7kllp4TrS4lKqVphai4vAN
gewpWYhMnTE5yR+0oMmFLACa1X2CDF8ng7njFw7467BZQzsLiZu7bZRR6B/35XNU
QCpE1g6gMV2jyW/ThMd8BG2My1+dzuBOAVcer5nL3Fmkm86pM9t499P7yzOtWIUD
8pOCt0S+2NNh2pnRSbtiHasI7fVfJOlu9usXDAm0uET2HjNrQXtaZLdpY4ArCBqF
rlGRpu35sAq883D3NwHltaW+M/r9PdUGgZ2MHlcPeZEt7mYC6o3mVMWpzOKQmNvU
UbEHPJgTPqi2ZfkU97PwFQ+/WD1DbdjmloRQ1egBva5n2VRDBDklQ/ZhJJ1TC6V+
dpWFzeceeZiSwl381tlGthMaWgcSDI0fwOFvrCxKHRBfOOWXrh/fYP6aFbRZ2sUn
2JSIfp9wuwX6o6OrjmMaafLgRY0cogICQTtMe1HpCYhnYrD/crJAKUJQbJCaIAaZ
fA4vSqdbJh/YpR+yCeKYlZrNHtjgNkU3zye7Uh1mUVzRF8POHSrcMO02/MV7+UK3
6+E4lhpOYo9DGc8wJ908CQV9xuPpAwhCToIQzUj/4eOSGl5LGY4=
=7huf
-----END PGP SIGNATURE-----

--3XA6nns4nE4KvaS/--

--===============1498116446==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1498116446==--
