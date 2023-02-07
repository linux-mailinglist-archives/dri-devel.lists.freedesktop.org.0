Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA8668D708
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 13:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BEE10E4ED;
	Tue,  7 Feb 2023 12:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD9410E4EB;
 Tue,  7 Feb 2023 12:42:36 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id gr7so42794459ejb.5;
 Tue, 07 Feb 2023 04:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=IGCuXnyI4M13AzKv5QYypCllinLq5sGCHA3t3XtkHiM=;
 b=AByZOb9vmxbTScd6PfkUp4n2zT42ha605jeUp3zgsPmRESY8IGB7kzFMFX1rYfRKPy
 lXEmmDV0vz+sL2kj2xo5oboP1Y+ebc4v6mh4W+Le6R+JGQsvmia8tmphvdkJhfEg46gV
 NcdTFulJtI06yFWpCyy563GC7Zh3dQDBPDKNU8gRmJd9K5s048XTQ6zeKrnhboOdgAwo
 wwDETcOR8CKkR5H8Fzipt+aIhA63+tpWmd0XS0DJMJK9J7iMAKOjVoemRMCigqN8TakU
 RBG8pTfxvOazImM/YcMjAdwW0Am1iTZwXXlyO80JaNDGtxWL1ahAJwg1CbX3j2k0pX1E
 ml0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IGCuXnyI4M13AzKv5QYypCllinLq5sGCHA3t3XtkHiM=;
 b=Yc1c6AImVKJEL4ZM6kRdCSE05INw7gChZ7pGT0rjdygWPFnD//xo3ai9oHZKKzZFQS
 i5x4VSGUddlkq2nutxevOTg2Ai6rT+4NAPDWWFhe15NhNFwtFnO307gLLdqVv5psRS6h
 U0M70xkhP2rO6lH7aoRdqe95ghsXdpzCk0xkL/xtLwk05mGJUQscAJaa5ScyN8Hu3jm9
 VOwOsA2yuyE2jZFSOYR5pH6vHZjgnIqP6dXVHL+/yfzKowB64Rjw1BdtoFZ1F28vPoqN
 uh8rkM9SiTc/19xfWZKFHxsHbsq2jo3VzIvVj/PU6dtUl4sRLVRky0oL6ofNq4dp3tl6
 51nA==
X-Gm-Message-State: AO0yUKWb5Q58emiPR3g4Ak6ZUYAqi7Y2+llr+gkjGwBaJutfEBysqkui
 IvMSLnW21243nCbw+NfVfc8=
X-Google-Smtp-Source: AK7set/Gmzifody9GT6VvJg8PV0ZAlGGKwHqO/COJOUCOT6zSQtGrEn53o2pemk7LwhV2hji4YImGQ==
X-Received: by 2002:a17:906:8a69:b0:87b:dac1:bbe6 with SMTP id
 hy9-20020a1709068a6900b0087bdac1bbe6mr2913386ejc.36.1675773754507; 
 Tue, 07 Feb 2023 04:42:34 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 x10-20020a1709060a4a00b0088091cca1besm6808258ejf.134.2023.02.07.04.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 04:42:34 -0800 (PST)
Date: Tue, 7 Feb 2023 14:42:21 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Joshua Ashton <joshua@froggi.es>
Subject: Re: [PATCH v2 18/21] drm/amd/display: Fallback to 2020_YCBCR if the
 pixel encoding is not RGB
Message-ID: <20230207144221.61eec592@eldfell>
In-Reply-To: <79ca3c26-11e8-0dad-641d-af21ec557d07@froggi.es>
References: <20230113162428.33874-1-harry.wentland@amd.com>
 <20230113162428.33874-19-harry.wentland@amd.com>
 <CA+hFU4xHKNSWO21Swq_b2VPPxtYGdeo4e3rPEVo44OPmB+opZw@mail.gmail.com>
 <79ca3c26-11e8-0dad-641d-af21ec557d07@froggi.es>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PI2E=ti23/EJlz2nfWJiN63";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/PI2E=ti23/EJlz2nfWJiN63
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 25 Jan 2023 12:59:53 +0000
Joshua Ashton <joshua@froggi.es> wrote:

> On 1/23/23 20:30, Sebastian Wick wrote:
> > A new property to control YCC and subsampling would be the more
> > complete path here. If we actually want to fix this in the short-term
> > though, we should handle the YCC and RGB Colorspace values as
> > equivalent, everywhere. Technically we're breaking the user space API
> > here so it should be documented on the KMS property and other drivers
> > must be adjusted accordingly as well. =20
>=20
> I am happy with treating 2020_YCC and 2020_RGB as the same.
>=20
> I think having the YCC/RGB split here in Colorspace is a mistake.
> Pixel encoding should be completely separate from colorspace from a uAPI=
=20
> perspective when we want to expose that.
> It's just a design flaw from when it was added as it just mirrors the=20
> values in the colorimetry packets 1:1. I understand why this happened,=20
> and I don't think it's a big deal for us to correct ourselves now:
>=20
> I suggest we deprecate the _YCC variants, treat them the same as the RGB=
=20
> enum to avoid any potential uAPI breakage and key the split entirely off=
=20
> the pixel_encoding value.
>=20
> That way when we do want to plumb more explicit pixel encoding down the=20
> line, userspace only has to manage one thing. There's no advantage for=20
> anything more here.

Sounds good to me!


Thanks,
pq

>=20
> - Joshie =F0=9F=90=B8=E2=9C=A8
>=20
> >=20
> > On Fri, Jan 13, 2023 at 5:26 PM Harry Wentland <harry.wentland@amd.com>=
 wrote: =20
> >>
> >> From: Joshua Ashton <joshua@froggi.es>
> >>
> >> Userspace might not aware whether we're sending RGB or YCbCr
> >> data to the display. If COLOR_SPACE_2020_RGB_FULLRANGE is
> >> requested but the output encoding is YCbCr we should
> >> send COLOR_SPACE_2020_YCBCR.
> >>
> >> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> >> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> >> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> >> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> >> Cc: Vitaly.Prosyak@amd.com
> >> Cc: Joshua Ashton <joshua@froggi.es>
> >> Cc: dri-devel@lists.freedesktop.org
> >> Cc: amd-gfx@lists.freedesktop.org
> >> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> >> ---
> >>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 ++++-
> >>   1 file changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drive=
rs/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> index f74b125af31f..16940ea61b59 100644
> >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> @@ -5184,7 +5184,10 @@ get_output_color_space(const struct dc_crtc_tim=
ing *dc_crtc_timing,
> >>                  color_space =3D COLOR_SPACE_ADOBERGB;
> >>                  break;
> >>          case DRM_MODE_COLORIMETRY_BT2020_RGB:
> >> -               color_space =3D COLOR_SPACE_2020_RGB_FULLRANGE;
> >> +               if (dc_crtc_timing->pixel_encoding =3D=3D PIXEL_ENCODI=
NG_RGB)
> >> +                       color_space =3D COLOR_SPACE_2020_RGB_FULLRANGE;
> >> +               else
> >> +                       color_space =3D COLOR_SPACE_2020_YCBCR;
> >>                  break;
> >>          case DRM_MODE_COLORIMETRY_BT2020_YCC:
> >>                  color_space =3D COLOR_SPACE_2020_YCBCR;
> >> --
> >> 2.39.0
> >> =20
> >  =20


--Sig_/PI2E=ti23/EJlz2nfWJiN63
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPiRy0ACgkQI1/ltBGq
qqe3yQ/+PTkfQxY/dc/rOnDRb5mK0rVEaoK8XLDM6wb7SHffb9peMR8fBUgnqYyd
wadRcOgtVedRCnw/W9xf0cjKs2lQuAzfC7LlFQ/jw9oAZpGj+X/4LZMQmUv+hIYI
p4aQzK5dPPG6K8g7YvSafIP6tLCM+DP65LwlepG2xmo08OzAGI0x6WUKsnJ3XxN4
sL4kmfSL6h11x9XAMvR+RmByp4k0KryfL67WeBi52Kl4sor0vWBYYv61U6wnbpx6
swvBCeZuF2omAFnvjCrrrIE8PYWbxEo2bpqxWlF1m766elfYK8Moj+tpFWTGv/Jy
He6hMcY2lTZZunYku3cHNHhyrp7uB143o5e55ONAV81neCI5u50DjaIB4gLuSlf2
/SqVgnC6k79lqTK1YnC6KmjTVUQWmde7n3YWW6UcuOG/VxlVmoF4LqaLDTvGnm2y
IEhrYMVlByTc8vfSggZojNFxiE7pcBVgXz+RE+gn5ylIJp2OxZIrOF3UWcc0RnkX
84xISxbekki55KHRgA3vsEH0amDj8OrdrxC1FkQjQ+ki7q9dhc+sA6eXKFRiyGIA
oCCugoUQZo8s4+PtweHUHPYrO5Ck5l4LNmOFTy5CydON4ZE+adhw9NdIy6fG9g6w
951Vl5hlm2J7HNd1DOykaXLXN8GM/lQW4zwksRbFLAxU7HQ6B08=
=jZzR
-----END PGP SIGNATURE-----

--Sig_/PI2E=ti23/EJlz2nfWJiN63--
