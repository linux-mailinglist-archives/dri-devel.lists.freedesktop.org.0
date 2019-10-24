Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92ECBE35B8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 16:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C504E89CD9;
	Thu, 24 Oct 2019 14:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91A889CD9;
 Thu, 24 Oct 2019 14:40:53 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p4so26395028wrm.8;
 Thu, 24 Oct 2019 07:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qNBxlc8ot4PRfGHe+kynRL/RiJUjzTmT/iZvgPqGreU=;
 b=qrrT8fCq537tjXaZsm0LygJ97oYxs8a5ABjtR4TS/gF/0YbofaAvHAe7pJwTGiIWtA
 1v66or67qzjjDf4rjdKgwotC27/EV+K7bKFTQhOPwrPdztcyV/6CiNNLQcEztBFGubgP
 SkU8LC+u/75o6yqusWIfJmprtXBbOZg7WT4EihztaBsIsz3oQRhTTUK4R63C1IUvh/0t
 98n1qEJQhQU8JyXNi9IH2Qs+4Izzql/4JBGYku38lGqhKy3NPWs38IHo3ViLksGTu+nU
 bAKSmUtISNbAokZ9rXiRGPXZ6zs25A/k3uZuIXe6OpexCfb21gYJ+a5qt3kKXFGNEcZm
 Cbqw==
X-Gm-Message-State: APjAAAXnU93BcQTbExgHyJ22VunhFuoxr+4Ive9F8LsVn8sAExtz4gu0
 CuSGkVgV6tLDsnyZwVisUyQ=
X-Google-Smtp-Source: APXvYqxlmmkLQVv3wb6RilVGFkv+9j3+s8/WrsYdDztgSmGlFeNx5043J79PGDmR3VNGc0h7+zcirQ==
X-Received: by 2002:a5d:6a03:: with SMTP id m3mr3967448wru.90.1571928052325;
 Thu, 24 Oct 2019 07:40:52 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id w18sm7959532wrl.75.2019.10.24.07.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 07:40:50 -0700 (PDT)
Date: Thu, 24 Oct 2019 16:40:48 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/dp: Add function to parse EDID
 descriptors for adaptive sync limits
Message-ID: <20191024144048.GF2924027@ulmo>
References: <20191024000041.7391-1-manasi.d.navare@intel.com>
 <20191024103106.GA2825247@ulmo> <20191024113400.GX1208@intel.com>
 <20191024135441.GE2924027@ulmo> <20191024142032.GB1208@intel.com>
MIME-Version: 1.0
In-Reply-To: <20191024142032.GB1208@intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qNBxlc8ot4PRfGHe+kynRL/RiJUjzTmT/iZvgPqGreU=;
 b=b8SdzWzTM+PLKOMY0fgDlHU7eBpe8+RTYIG+o+6berlT3aFhNg3mKqUwwAhYHmTxNC
 GtYk33/PYMB+dTB3hGp1F8jUnnfQlRFQGg2K8rabMsCBdMiyH6B+Bmef1slysKURVdcg
 KOJzG6PhkLl/0LpQykBJIfoAAuPupfWHJraAiEE9DlBm9nmQ+wwE0x1O69fTWQk37oYV
 ERq7GeF95N+pk3kF7xw2Rs4mTPGHZ7Fa/RTGpCZ455cfXP9sM4iHRyjG3TXr1ITXlGNU
 Mb8Z/tgHRtI58gbND85mEUiyZhYVQxTYioEwagDF4Ex7Orz5dRkFCA4qOOsZVNs61fdB
 9xXA==
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
Content-Type: multipart/mixed; boundary="===============1037692085=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1037692085==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6v9BRtpmy+umdQlo"
Content-Disposition: inline


--6v9BRtpmy+umdQlo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2019 at 05:20:32PM +0300, Ville Syrj=C3=A4l=C3=A4 wrote:
> On Thu, Oct 24, 2019 at 03:54:41PM +0200, Thierry Reding wrote:
> > On Thu, Oct 24, 2019 at 02:34:00PM +0300, Ville Syrj=C3=A4l=C3=A4 wrote:
> > > On Thu, Oct 24, 2019 at 12:31:06PM +0200, Thierry Reding wrote:
> > > > On Wed, Oct 23, 2019 at 05:00:41PM -0700, Manasi Navare wrote:
> > > > > Adaptive Sync is a VESA feature so add a DRM core helper to parse
> > > > > the EDID's detailed descritors to obtain the adaptive sync monito=
r range.
> > > > > Store this info as part fo drm_display_info so it can be used
> > > > > across all drivers.
> > > > > This part of the code is stripped out of amdgpu's function
> > > > > amdgpu_dm_update_freesync_caps() to make it generic and be used
> > > > > across all DRM drivers
> > > > >=20
> > > > > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > > > Cc: Harry Wentland <harry.wentland@amd.com>
> > > > > Cc: Clinton A Taylor <clinton.a.taylor@intel.com>
> > > > > Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_edid.c  | 49 +++++++++++++++++++++++++++++++=
++++++
> > > > >  include/drm/drm_connector.h | 25 +++++++++++++++++++
> > > > >  include/drm/drm_edid.h      |  2 ++
> > > > >  3 files changed, 76 insertions(+)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edi=
d.c
> > > > > index 474ac04d5600..97dd1200773e 100644
> > > > > --- a/drivers/gpu/drm/drm_edid.c
> > > > > +++ b/drivers/gpu/drm/drm_edid.c
> > > > > @@ -4707,6 +4707,52 @@ static void drm_parse_cea_ext(struct drm_c=
onnector *connector,
> > > > >  	}
> > > > >  }
> > > > > =20
> > > > > +void drm_get_adaptive_sync_limits(struct drm_connector *connecto=
r,
> > > > > +				  const struct edid *edid)
> > > > > +{
> > > > > +	struct drm_display_info *info =3D &connector->display_info;
> > > > > +	const struct detailed_timing *timing;
> > > > > +	const struct detailed_non_pixel *data;
> > > > > +	const struct detailed_data_monitor_range *range;
> > > > > +	int i;
> > > >=20
> > > > This can be unsigned int.
> > >=20
> > > Please no. A loop iterator called 'i' should always be a normal signe=
d int.
> >=20
> > What? Where's that rule written down? In my experience it's always
> > better to use as restrictive a type as possible. It's really annoying
> > when GCC suddenly starts complaining about comparison between signed and
> > unsigned. So if a variable can never contain a signed value, why risk
> > the ambiguity? The value goes from 0 to 4, the sign bit is useless.
>=20
> Dunno if it's really written down anywhere. It's just something
> experience has taught. IIRC there's also a rant from Linus about this
> somewhere. Hm, can't find that one right now, but Andrew Morton also
> seems to agree: https://lwn.net/Articles/309279/
> Ah, here is one Linus rant about unsigned array indexes:
> https://yarchive.net/comp/linux/gcc.html

It's interesting that none of those actually give a real reason why
unsigned int shouldn't be used for variables called i.

> My opinion: unsigned is an very *dangerous* keyword in C that demands
> your respect. You should never use it without thinking first what the
> ramifications are. You always have to have the promotion rules clear=20
> in you mind when you do any kind of arithmetic with >=3D unsigned int
> type. And common idioms such as 'int i' should be respected so as to
> not cause unexpected hair loss to other developers when they decide
> to make the loop iterate backwards.

I would argue that when you do things like make a loop iterate backwards
you better know what variable types you're dealing with.

Anyway, this is clearly very subjective, so feel free to let this be int
if you prefer.

> > > > > +	/*
> > > > > +	 * Restrict Adaptive Sync only for dp and edp
> > > > > +	 */
> > > > > +	if (connector->connector_type !=3D DRM_MODE_CONNECTOR_DisplayPo=
rt &&
> > > > > +	    connector->connector_type !=3D DRM_MODE_CONNECTOR_eDP)
> > > > > +		return;
> > > > > +
> > > > > +	if (edid->version <=3D 1 && !(edid->version =3D=3D 1 && edid->r=
evision > 1))
> > > > > +		return;
> > > > > +
> > > > > +	for (i =3D 0; i < 4; i++) {
> > > > > +		timing  =3D &edid->detailed_timings[i];
> > > > > +		data    =3D &timing->data.other_data;
> > > > > +		range   =3D &data->data.range;
> > > > > +		/*
> > > > > +		 * Check if monitor has continuous frequency mode
> > > > > +		 */
> > > > > +		if (data->type !=3D EDID_DETAIL_MONITOR_RANGE)
> > > > > +			continue;
> > > > > +		/*
> > > > > +		 * Check for flag range limits only. If flag =3D=3D 1 then
> > > > > +		 * no additional timing information provided.
> > > > > +		 * Default GTF, GTF Secondary curve and CVT are not
> > > > > +		 * supported
> > > > > +		 */
> > > > > +		if (range->flags !=3D 1)
> > > > > +			continue;
> > > > > +
> > > > > +		info->adaptive_sync.min_vfreq =3D range->min_vfreq;
> > > > > +		info->adaptive_sync.max_vfreq =3D range->max_vfreq;
> > > > > +		info->adaptive_sync.pixel_clock_mhz =3D
> > > > > +			range->pixel_clock_mhz * 10;
> > > > > +		break;
> > > > > +	}
> > > > > +}
> > > > > +EXPORT_SYMBOL(drm_get_adaptive_sync_limits);
> > > > > +
> > > > >  /* A connector has no EDID information, so we've got no EDID to =
compute quirks from. Reset
> > > > >   * all of the values which would have been set from EDID
> > > > >   */
> > > > > @@ -4728,6 +4774,7 @@ drm_reset_display_info(struct drm_connector=
 *connector)
> > > > >  	memset(&info->hdmi, 0, sizeof(info->hdmi));
> > > > > =20
> > > > >  	info->non_desktop =3D 0;
> > > > > +	memset(&info->adaptive_sync, 0, sizeof(info->adaptive_sync));
> > > > >  }
> > > > > =20
> > > > >  u32 drm_add_display_info(struct drm_connector *connector, const =
struct edid *edid)
> > > > > @@ -4743,6 +4790,8 @@ u32 drm_add_display_info(struct drm_connect=
or *connector, const struct edid *edi
> > > > > =20
> > > > >  	info->non_desktop =3D !!(quirks & EDID_QUIRK_NON_DESKTOP);
> > > > > =20
> > > > > +	drm_get_adaptive_sync_limits(connector, edid);
> > > > > +
> > > > >  	DRM_DEBUG_KMS("non_desktop set to %d\n", info->non_desktop);
> > > > > =20
> > > > >  	if (edid->revision < 3)
> > > > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connec=
tor.h
> > > > > index 5f8c3389d46f..a27a84270d8d 100644
> > > > > --- a/include/drm/drm_connector.h
> > > > > +++ b/include/drm/drm_connector.h
> > > > > @@ -254,6 +254,26 @@ enum drm_panel_orientation {
> > > > >  	DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
> > > > >  };
> > > > > =20
> > > > > +/**
> > > > > + * struct drm_adaptive_sync_info - Panel's Adaptive Sync capabil=
ities for
> > > > > + * &drm_display_info
> > > > > + *
> > > > > + * This struct is used to store a Panel's Adaptive Sync capabili=
ties
> > > > > + * as parsed from EDID's detailed monitor range descriptor block.
> > > > > + *
> > > > > + * @min_vfreq: This is the min supported refresh rate in Hz from
> > > > > + *             EDID's detailed monitor range.
> > > > > + * @max_vfreq: This is the max supported refresh rate in Hz from
> > > > > + *             EDID's detailed monitor range
> > > > > + * @pixel_clock_mhz: This is the dotclock in MHz from
> > > > > + *                   EDID's detailed monitor range
> > > > > + */
> > > > > +struct drm_adaptive_sync_info {
> > > > > +	int min_vfreq;
> > > > > +	int max_vfreq;
> > > > > +	int pixel_clock_mhz;
> > > >=20
> > > > Any reason why these can't be unsigned? Also, does it perhaps make =
sense
> > > > to store the pixel clock as kHz like we do everywhere else?
> > >=20
> > > Aye, all typical clock frequencies should be in khz.
> > >=20
> > > Also the vfreqs are only u8 in the EDID, so can be u8 here as well.
> >=20
> > Not if you store them in kHz, they can't.
>=20
> IMO those can stay in Hz. That's what drm_mode_vrefresh() gives you as we=
ll.

Oh, you were talking about only the vfreqs. Yes, you're right in that
case.

Unless if at some point in the future we do end up with monitors where
the vrefresh rate no longer fits into u8... I guess manufacturers might
be discouraged from building those just based on the fact that you can't
store the values in EDID.

Thierry

--6v9BRtpmy+umdQlo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2xt+0ACgkQ3SOs138+
s6FF2A//fBlnyHP6uEP7dKq9xWVS7sm6OiN8YzDzX7N1NLmtp4RCjW0Wso+N30u2
tMEx+vOc38j310PsrpvtP2/1yVSuWt79g6vJqK7hgLbZ9hokOxGzmceHGQaVH9yO
SZeA0Xy7+cDOzQhKlSMXFtSwr+MnYkANOTtBUMoSiyGXNIZAE8S1931e1fDj+LLq
5q8TzXLSLZeX8VnIC6b/I++Gi1AbPx1t8K9SCAhH/VLo/3Sd/t56yDf7Cu5a2/Yt
Ff2w+k9D8CAlanVp2K2Q68kks9R5D+ad7ZuAT8C1VUk5L/tzTQidruKN999w/Z8B
hiypTOUMG6o3o3WHeRODHhhDp0x+d0yRodmb99OmOsDkFK1/F8o8chinjr31474u
GBu7j4KiekZiEkVFsk9eGgJjUWcCPa8bv5BD8ne304/XI0dVmdfU2DO6pwrr3QzH
dwPEwgdOPtCM0Q9iSlKc4+0hasIQUuiNB8vfrIbrXFug1Et82aEcRDyBs0g/7tGQ
SsmegGKOfT4MYBFGx/sBx6lWLCyIYO0CXRtGg6kxBqtA8I5e1CyR6HiahTYaZ59G
U3NTz2+2cjYnQMyXmSzXeoQCaoED9XyVNw8jYwEdmAFrcfhPIqiY3Uk/svrBt5P8
twmjUCiCUt18x17I8d/C8wktYE336o6LXA1xXdaVrcgSzq0ejmg=
=TZhG
-----END PGP SIGNATURE-----

--6v9BRtpmy+umdQlo--

--===============1037692085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1037692085==--
