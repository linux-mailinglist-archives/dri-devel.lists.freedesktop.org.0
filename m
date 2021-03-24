Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C266347B8C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:03:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501D76EA2D;
	Wed, 24 Mar 2021 15:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621376EA2D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:03:29 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id o16so24806664wrn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IDKzYBeJOgv9qLIaDrU+wAUvzFLKQpmDTW9lmztzjik=;
 b=qClg+6lv2EifrUhyMpMrWcEh7b5b10HjoP0gn40W0tF3cnL2OhY8m2StXmHUr8X6gN
 SmNJKkfO8XW7pKikYoygLsKy747CBnigccicR7ahxjl1Y7oLy1XTNhsaIIfEC8xLxe8L
 9zr82go09EO0EhlJmltmkbCWogdcYtVrc+ixB7NKxFQC8jobAapc+pT7kaVtkDJaEG9L
 a23A36uIoxxMeTkE4Iw0P5vUoxRveZvn6crJS9LRbjN1LHolSqoXymehdiMuq3SG5KRc
 LQGc/l/B6BMT+74r76o+oS23ueZdNyWqkItvjBZXMOgaU2gfr2jdaCRalh0eosb9xW0n
 TlOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IDKzYBeJOgv9qLIaDrU+wAUvzFLKQpmDTW9lmztzjik=;
 b=tEfKCcT/cCB3O5i+OO6dKyiHMPVsSouK85uiZ07N//T9XsxYldvud4wYdXx4frNnMo
 Z/iOCclR8mu8njzvgd9uA5jpyjl1MPQoS8/K8z6GsFgJ1zoupQBwBj1g91CrZxKF05MG
 HCmJTfGgAMkP/kxKNA1KovU81xfZZr+gtyBHgAmtk3cmk8qFSwdYkguSqKxp2HIkeiXV
 V9mTSFaW7zvo7hDHUrFUp9/c1HNqfnscX1LAPShq7r/1HSDkLxvidRDzhKIroMZtCzeq
 BHRG6ex+W0C/+aP4d6A7dTonyvBGI8HJzKVg0Fnkd5C9+UPqCLYbx0gcug/pJ7JqPC6X
 0n3g==
X-Gm-Message-State: AOAM5315wovRx6vUdkpWC6sBF7RvoskHNpljkWrrfCsfLCFpPyuWwg58
 Gl4VJrlU8h7ls/mqsExmoa2jmqTYivs=
X-Google-Smtp-Source: ABdhPJy1XfnIikyWvdAUdSZ4707VIXXXwM3BsUNQ1QkJ7/ooNMEZK0Wv0k6GfkpbcZM77haS03EqEg==
X-Received: by 2002:adf:f307:: with SMTP id i7mr4004127wro.142.1616598208116; 
 Wed, 24 Mar 2021 08:03:28 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id j123sm2850867wmb.1.2021.03.24.08.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:03:25 -0700 (PDT)
Date: Wed, 24 Mar 2021 16:03:46 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 4/9] drm/tegra: dc: Implement hardware cursor on Tegra186
 and later
Message-ID: <YFtU0rw+BaF6dHKy@orome.fritz.box>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
 <20210323155437.513497-5-thierry.reding@gmail.com>
 <454aea05-ee94-5789-2cab-513342cf7614@gmail.com>
 <YFoyc5mdYe/5/Cjn@orome.fritz.box>
 <487b94d0-a52b-824b-c29d-f88b4605b117@gmail.com>
MIME-Version: 1.0
In-Reply-To: <487b94d0-a52b-824b-c29d-f88b4605b117@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
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
Cc: David Airlie <airlied@linux.ie>, linux-tegra@vger.kernel.org,
 James Jones <jajones@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1206069215=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1206069215==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8a7+mhvPDJypAwVi"
Content-Disposition: inline


--8a7+mhvPDJypAwVi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 10:05:23PM +0300, Dmitry Osipenko wrote:
> 23.03.2021 21:24, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Mar 23, 2021 at 08:57:42PM +0300, Dmitry Osipenko wrote:
> >> 23.03.2021 18:54, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> @@ -920,15 +934,42 @@ static void tegra_cursor_atomic_update(struct d=
rm_plane *plane,
> >>>  	value =3D tegra_dc_readl(dc, DC_DISP_BLEND_CURSOR_CONTROL);
> >>>  	value &=3D ~CURSOR_DST_BLEND_MASK;
> >>>  	value &=3D ~CURSOR_SRC_BLEND_MASK;
> >>> -	value |=3D CURSOR_MODE_NORMAL;
> >>> +
> >>> +	if (dc->soc->has_nvdisplay)
> >>> +		value &=3D ~CURSOR_COMPOSITION_MODE_XOR;
> >>> +	else
> >>> +		value |=3D CURSOR_MODE_NORMAL;
> >>> +
> >>>  	value |=3D CURSOR_DST_BLEND_NEG_K1_TIMES_SRC;
> >>>  	value |=3D CURSOR_SRC_BLEND_K1_TIMES_SRC;
> >>>  	value |=3D CURSOR_ALPHA;
> >>>  	tegra_dc_writel(dc, value, DC_DISP_BLEND_CURSOR_CONTROL);
> >>> =20
> >>> +	/* nvdisplay relies on software for clipping */
> >>> +	if (dc->soc->has_nvdisplay) {
> >>
> >> But coordinates already should be clipped by
> >> drm_atomic_helper_check_plane_state().
> >=20
> > Yes, and the driver goes on to use the clipped coordinates later on in
> > this function.
>=20
> I see now what it does, looks okay.
>=20
> Minor nit: the i/j aren't very expressive names, something like sx/sy
> sw/sh should be a bit more appropriate naming.
>=20
> You could also make use of drm_rect_width/height helpers.
>=20
> But this doesn't deserve a v2 if there is nothing more important to impro=
ve.

As I was browsing through the drm_rect helpers, I also came across
drm_rect_fp_to_int(), which helps simplify this further. As a result I
was able to just get rid of most of these temporary variables in favor
of just the integer version of drm_rect.

Thanks for the hint.

Thierry

--8a7+mhvPDJypAwVi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBbVNIACgkQ3SOs138+
s6FWtxAAt8h4TuclxE5yAV+CJVMHbWT9PtMeF3agHADYed6OqrdYK1Rgp9Q28k5J
o92AH9QOjf3RsMVKJ+fcJQTrRA6vVjVqWNKw9T/ACa/kutuGZmDJLKPa6yOsnFo8
vOTnH0YsZRubq51XD90v0CTR1Dvo3reo5Kl7351IxPLZvU29YsXzmoC0zQeon2+9
NLnPaB8Ejy+ostty55IZoaVEfiotZ/nSv58iAVjCetSlH4HAEgFl/ZA19am4HVWb
nDCiBoaDrOjlJpIIlo+R1YsEygBgh8BG4KEDkJYeaXV3UMa5vDSDan8T9wGZ2zMj
xUEOox9hmf0sGIEcoFJlY2z+iqGCmzD1xKoxRUDWSST7fSOAqhY35fgKy1kiAAfL
Ua/DCOLjCanErEhofZWBSk5n8cHPaKEezONi2QowGnp3nQ4nuET71VdN7az42gVv
4PrHFsEk3vNAHLO6qALqKQ4OtfGv9nacBNBvy6ftOODmjfdwGWl9TjMIa+SrV5md
yAILgy2yJd4052E9UZMd0jvFGwbMWlTAik0QIuYqPcvS/pcn5KjVieSMSLAm17By
1tVx+HaEq3dObN6DnMHYtvvwMIgKBTz5LMderTsKx6gwacCFbJJQAUB6GDG0LXN3
tt7EdlPkWgvwbHzpcJJgPKUy7CXcRpPYntxtSfxFSJIecNCsqKg=
=EM7w
-----END PGP SIGNATURE-----

--8a7+mhvPDJypAwVi--

--===============1206069215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1206069215==--
