Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77701B83C7E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 11:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584E310E0F2;
	Thu, 18 Sep 2025 09:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QqkwScsB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70A410E0F2;
 Thu, 18 Sep 2025 09:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1758187626;
 bh=0FLWmqr3F9NOr+WyWmMcLIv6IBbJvkig+Fq135VmMQQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QqkwScsB9e4fyvJDOPeUR9Itkuf/146HmRHCT1+dj+3paNQiOTCcS+6wJt3giNvvb
 qn/5IUbdgp0gmnxAmD802WSQOthud13HJdAI6hyunI1Qid68s6JUwZZ+4hcF0jvKKq
 HfLG1nQnv+Bpd/t1Dn5CqOI1m2pZ1LU632Aw+w7Mm3Cwp/Kz51pdlKNibARhGPmIUQ
 Jl08W3qmr5YPy58uQzxYtT29W50Pa2pTaybxFG0U240RRoyi3NPfHCV/0CcmmBo+9H
 /Li7vWPqxKAe0vbWIPf0SaRS/248PInSdC7TttjDQQld1LBn8b9lllKi6NWep2zbSM
 XhE9jaOcnkERQ==
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 13FEE17E12C4;
 Thu, 18 Sep 2025 11:27:05 +0200 (CEST)
Date: Thu, 18 Sep 2025 12:26:53 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Alex Hung <alex.hung@amd.com>, Shengyu Qu <wiagn233@outlook.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "leo.liu@amd.com" <leo.liu@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "mwen@igalia.com"
 <mwen@igalia.com>, "jadahl@redhat.com" <jadahl@redhat.com>,
 "sebastian.wick@redhat.com" <sebastian.wick@redhat.com>,
 "shashank.sharma@amd.com" <shashank.sharma@amd.com>, "agoins@nvidia.com"
 <agoins@nvidia.com>, "joshua@froggi.es" <joshua@froggi.es>,
 "mdaenzer@redhat.com" <mdaenzer@redhat.com>, "aleixpol@kde.org"
 <aleixpol@kde.org>, "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 "victoria@system76.com" <victoria@system76.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "uma.shankar@intel.com" <uma.shankar@intel.com>,
 "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>, "marcan@marcan.st"
 <marcan@marcan.st>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>,
 "chaitanya.kumar.borah@intel.com" <chaitanya.kumar.borah@intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>,
 "mcanal@igalia.com" <mcanal@igalia.com>, "nfraprado@collabora.com"
 <nfraprado@collabora.com>, Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH V11 31/47] drm/colorop: add BT2020/BT709 OETF and
 Inverse OETF
Message-ID: <20250918122653.7420411c@eldfell>
In-Reply-To: <6ab345aa-262c-4da4-8e18-8d8041962540@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-32-alex.hung@amd.com>
 <TY4PR01MB14432C77EDFD80D2075FFCC2A9834A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <774b1164-b1e9-4b99-9dae-b6688980e39d@amd.com>
 <TY4PR01MB144322B1C74D8FCF6370BD12D9837A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <6ab345aa-262c-4da4-8e18-8d8041962540@amd.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JZ3x9q/e9PS3hOsnK6IN2x0";
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

--Sig_/JZ3x9q/e9PS3hOsnK6IN2x0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 15 Aug 2025 21:28:47 -0600
Alex Hung <alex.hung@amd.com> wrote:

> On 8/15/25 20:45, Shengyu Qu wrote:
> > Hi,
> >=20
> > Thanks for reply. I guess we need to point this out in documentation or=
=20
> > code comment? As I can see different definition somewhere like this[1].
> >=20
> > Best regards,
> > Shengyu
> >=20
> > [1] https://color.org/chardata/rgb/BT2020.xalter =20
>=20
> It's the same one. You can find the ITU document in "Documentation=20
> source" in above link.

Hi,

I sense confusion, because color.org quotes BT.1886 explicitly in

> Color component transfer function: C'=3D C^1/2.4

which is not the BT.2020 OETF (nor it's inverse, nor approximation).

> >>
> >> https://www.itu.int/dms_pubrec/itu-r/rec/bt/R-REC-BT.2020-2-201510-I!!=
=20
> >> PDF-E.pdf (Table 4?)

says

E' =3D 4.5 * E, for 0 <=3D E < =CE=B2
E' =3D =CE=B1 * E^0.45 - (=CE=B1 - 1), for =CE=B2 <=3D E <=3D 1

with

=CE=B1 =3D 1.09929682680944... and
=CE=B2 =3D 0.018053968510807..

The footnote for that table:

> (4) In typical production practice the encoding function of image
> sources is adjusted so that the final picture has the desired look,
> as viewed on a reference monitor having the reference decoding
> function of Recommendation ITU-R BT.1886, in the reference viewing
> environment defined in Recommendation ITU-R BT.2035.

In other words, the common practice is to not use the specified curve.

As we can see in
https://www.desmos.com/calculator/gqjuzqsebg
the two curves do not even approximate each other.

However, for someone familiar with the specifications BT.2020 and
BT.1886, the two curves are distinctly named. BT.2020 defines the OETF,
and BT.1886 defines the EOTF. Inverse of one does not match the other
deliberately. The mismatch between the camera curve and the display
curve is required to make the picture look better.

When someone says "BT.2020 OETF", it is unambiguous. It's the only
curve actually specified in BT.2020.


Thanks,
pq

--Sig_/JZ3x9q/e9PS3hOsnK6IN2x0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmjL0F0ACgkQI1/ltBGq
qqdgCQ/+Klry8BSSYVr9aMbhej1VjCdodD54n49fjntUVHM6ypC1Jli8PCub834w
mBWFCPcqUFdmUHESY8TiEXOxKzIw4flg2sAngfrHHJGtqu7/S9Orfbn3Hj/YaNrp
inW8oZ19gSeU8qF8FzpuoasPMtptEMzeRjYrAy+diCUlcJCN+YxG/IrCoTpqcZhQ
gkuSHUGGzH2n+yGJirtg+m+JAw3qCxY5dXRH81+QGnONDn5onQvh+ufLYMj1YX5D
Jd3OcwkbTbLZTbhE5FCqMKLQHPmBZ+Zw7jomzwwfgk4uMbuh0TTEnbCMck4j3pkS
kneMF/iFoXu2lqoz8HoJPAnHsIFE5GFgUQGHx0af79cS+8t3moJL645oambnk0YO
w9frFwfelEoea2IgOZDy9z6lxV3F2ztzePParuIwaXAc63YtW9XvYg7x4eAhxcej
UNOG6r9Tqmp1D/CZyOblkXs6whwiHn0QkbIF83OL2HFcQrfUDVe4/QvQseKx7NIX
FJF1HlWwVnrlPXKPsgj7NIs3IuzETtypTCaTzyvkr6CaZZ0qenYOi6WQQE/MHllw
+fTLOA9zO9cdzDIs74FEfk/wfFmjwdYe2kNj3hrVWQsEHv6AAIkVBXgokrz+gx/c
8Hk81c82ggBEZCPSBa1AKzohjbo42pM3VUrJquxW9TYNA5xlVo0=
=qdJv
-----END PGP SIGNATURE-----

--Sig_/JZ3x9q/e9PS3hOsnK6IN2x0--
