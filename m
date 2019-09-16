Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EADBFB3E2A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 17:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF68C6E2B6;
	Mon, 16 Sep 2019 15:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E0A6E2B6;
 Mon, 16 Sep 2019 15:54:47 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id c20so567986eds.1;
 Mon, 16 Sep 2019 08:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HUhHvP1a+4SXSOK8sf0UtqL+6elLUzz5MyZdMtMKsJE=;
 b=Zmeu8HRxQ4s5kFtwv/Ht0fYKxhSip4PnRSCweIcSJM8KZNeEWK21BiHGRomtbazTbm
 0GTb/RhXf2GiEnHTfQf7UVnWut0NJg0vWYQNwF1T2Cd2amEim2Q82q1rK02y0fjDrmp7
 XDHSa3zISxKUn8+Ejh+cKGs0blNJUMHE+jVUL1Q0ijhe3Qj+UzFLqEbsdVujqQ+XgORP
 c2mq0uMZoIWm4CU3oQ5i7c+0zZr2U3Cw2W9TkJKUoRjAFxHboBk9agpb7fga7nkFy9z0
 8ASCpBQOGQVJllyqDepvzmigC8U7VT88MH2emAUsOaYu7iwy9tq7I/fyuM2Qpb8KZN/b
 MyTw==
X-Gm-Message-State: APjAAAXlNwZOZdxiqK0NsaFOfrgJXQnV25vmleKDuyMzOmCoNNNLbLE+
 WJgodAnbW/RazSzG9zhKumI=
X-Google-Smtp-Source: APXvYqxLVRqJ/FC1e9JSWVdgrrCLuHYUZJTMbwEJt2/GCp2GPf+hmGJ+x6qExKFnx0zcgs17eq/6Sg==
X-Received: by 2002:a50:f19c:: with SMTP id x28mr16258edl.42.1568649285802;
 Mon, 16 Sep 2019 08:54:45 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id e39sm3515180edb.69.2019.09.16.08.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 08:54:44 -0700 (PDT)
Date: Mon, 16 Sep 2019 17:54:43 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>, Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 04/11] drm/nouveau: gp10b: Add custom L2 cache
 implementation
Message-ID: <20190916155443.GF7488@ulmo>
References: <20190916150412.10025-1-thierry.reding@gmail.com>
 <20190916150412.10025-5-thierry.reding@gmail.com>
 <7d917275-0a2d-6de3-e837-6dfa4d9a29c8@codethink.co.uk>
 <20190916154946.GD7488@ulmo>
MIME-Version: 1.0
In-Reply-To: <20190916154946.GD7488@ulmo>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HUhHvP1a+4SXSOK8sf0UtqL+6elLUzz5MyZdMtMKsJE=;
 b=aqSxYNrIYYWTVAaTcz7VggL7PO9C+2KOUFfKfLo0GzX1ToRVBZXhXsOb9m3B/I/BCr
 7CoNVoPkZayu/3s3uKScY4YyUpZyxWXIP4h6384kLXFUQBkLMsEjetixPrj7ONQMNcOw
 neC8rwrefrgUzS8sbF4YnO1AYZ+/wiywR95Npt6wQWRLk4P9caAU8jjp7ya3Ntd8oUTN
 v55qiAjx4PmB0CLzrWHdpKzi2ahIcFXbILwvr7n+dFJ051udPSSPSwtLD4BR7PY/8RmW
 8Segxr0MwzT9Nazr+FeryilPE9cyOEPjUksxUPgYT24fj1eRV8H3a6x8wmGHsNGAMcrw
 89tg==
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
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0267023149=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0267023149==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y/WcH0a6A93yCHGr"
Content-Disposition: inline


--Y/WcH0a6A93yCHGr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2019 at 05:49:46PM +0200, Thierry Reding wrote:
> On Mon, Sep 16, 2019 at 04:35:30PM +0100, Ben Dooks wrote:
> > On 16/09/2019 16:04, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > >=20
> > > There are extra registers that need to be programmed to make the leve=
l 2
> > > cache work on GP10B, such as the stream ID register that is used when=
 an
> > > SMMU is used to translate memory addresses.
> > >=20
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > >   .../gpu/drm/nouveau/include/nvkm/subdev/ltc.h |  1 +
> > >   .../gpu/drm/nouveau/nvkm/engine/device/base.c |  2 +-
> > >   .../gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild    |  1 +
> > >   .../gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c   | 69 ++++++++++++++++=
+++
> > >   .../gpu/drm/nouveau/nvkm/subdev/ltc/priv.h    |  2 +
> > >   5 files changed, 74 insertions(+), 1 deletion(-)
> > >   create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
> > >=20
> > > diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/ltc.h b/driv=
ers/gpu/drm/nouveau/include/nvkm/subdev/ltc.h
> > > index 644d527c3b96..d76f60d7d29a 100644
> > > --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/ltc.h
> > > +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/ltc.h
> > > @@ -40,4 +40,5 @@ int gm107_ltc_new(struct nvkm_device *, int, struct=
 nvkm_ltc **);
> > >   int gm200_ltc_new(struct nvkm_device *, int, struct nvkm_ltc **);
> > >   int gp100_ltc_new(struct nvkm_device *, int, struct nvkm_ltc **);
> > >   int gp102_ltc_new(struct nvkm_device *, int, struct nvkm_ltc **);
> > > +int gp10b_ltc_new(struct nvkm_device *, int, struct nvkm_ltc **);
> > >   #endif
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/driv=
ers/gpu/drm/nouveau/nvkm/engine/device/base.c
> > > index c3c7159f3411..d2d6d5f4028a 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> > > @@ -2380,7 +2380,7 @@ nv13b_chipset =3D {
> > >   	.fuse =3D gm107_fuse_new,
> > >   	.ibus =3D gp10b_ibus_new,
> > >   	.imem =3D gk20a_instmem_new,
> > > -	.ltc =3D gp102_ltc_new,
> > > +	.ltc =3D gp10b_ltc_new,
> > >   	.mc =3D gp10b_mc_new,
> > >   	.mmu =3D gp10b_mmu_new,
> > >   	.secboot =3D gp10b_secboot_new,
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild b/drivers=
/gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild
> > > index 2b6d36ea7067..728d75010847 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild
> > > @@ -6,3 +6,4 @@ nvkm-y +=3D nvkm/subdev/ltc/gm107.o
> > >   nvkm-y +=3D nvkm/subdev/ltc/gm200.o
> > >   nvkm-y +=3D nvkm/subdev/ltc/gp100.o
> > >   nvkm-y +=3D nvkm/subdev/ltc/gp102.o
> > > +nvkm-y +=3D nvkm/subdev/ltc/gp10b.o
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
> > > new file mode 100644
> > > index 000000000000..4d27c6ea1552
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
> > > @@ -0,0 +1,69 @@
> > > +/*
> > > + * Copyright (c) 2019 NVIDIA Corporation.
> > > + *
> > > + * Permission is hereby granted, free of charge, to any person obtai=
ning a
> > > + * copy of this software and associated documentation files (the "So=
ftware"),
> > > + * to deal in the Software without restriction, including without li=
mitation
> > > + * the rights to use, copy, modify, merge, publish, distribute, subl=
icense,
> > > + * and/or sell copies of the Software, and to permit persons to whom=
 the
> > > + * Software is furnished to do so, subject to the following conditio=
ns:
> > > + *
> > > + * The above copyright notice and this permission notice shall be in=
cluded in
> > > + * all copies or substantial portions of the Software.
> > > + *
> > > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, E=
XPRESS OR
> > > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTA=
BILITY,
> > > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVEN=
T SHALL
> > > + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAM=
AGES OR
> > > + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERW=
ISE,
> > > + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE US=
E OR
> > > + * OTHER DEALINGS IN THE SOFTWARE.
> > > + *
> > > + * Authors: Thierry Reding
> > > + */
> > > +
> > > +#include "priv.h"
> > > +
> > > +static void
> > > +gp10b_ltc_init(struct nvkm_ltc *ltc)
> > > +{
> > > +	struct nvkm_device *device =3D ltc->subdev.device;
> > > +#ifdef CONFIG_IOMMU_API
> > > +	struct iommu_fwspec *spec;
> > > +#endif
> > > +
> > > +	nvkm_wr32(device, 0x17e27c, ltc->ltc_nr);
> > > +	nvkm_wr32(device, 0x17e000, ltc->ltc_nr);
> > > +	nvkm_wr32(device, 0x100800, ltc->ltc_nr);
> > > +
> > > +#ifdef CONFIG_IOMMU_API
> > > +	spec =3D dev_iommu_fwspec_get(device->dev);
> > > +	if (spec) {
> > > +		u32 sid =3D spec->ids[0] & 0xffff;
> > > +
> > > +		/* stream ID */
> > > +		nvkm_wr32(device, 0x160000, sid << 2);
> > > +	}
> > > +#endif
> >=20
> > Could we get rid of the #ifdef blocks here if there was a NULL
> > inline version of dev_iommu_fwspec_get() in the include/linux/iommu.h
> > header? The compiler should then optimise the lot out if the config
> > is not set.
>=20
> I had thought the same thing and had even typed up the patch to add a
> dummy for dev_iommu_fwspec_get(), but then when I tested some builds, I
> got build errors nevertheless because struct iommu_fwspec is only
> declared under IOMMU_API.
>=20
> The obvious thing would have been to move struct iommu_fwspec outside of
> the IOMMU_API protection, but then I remembered having an earlier
> discussion with Joerg about something similar. I guess the issue here is
> that we need to reach into struct iommu_fwspec, so it has to be
> available in full.
>=20
> Anyway, I can add a patch to do this and remove the IOMMU_API guards,
> but let's see what Joerg thinks about that first.
>=20
> Joerg, to summarize: the proposal here is to move the declaration of the
> iommu_fwspec outside of the IOMMU_API guard and provide a dummy
> implementation of dev_iommu_fwspec_get() to allow this code to be built
> without the #ifdef guards. We had discussed something similar about 5
> years back and at the time you had been opposed:
>=20
> 	https://lore.kernel.org/linux-iommu/1406897113-20099-1-git-send-email-th=
ierry.reding@gmail.com/
>=20
> The case here is slightly different and a lot of time has passed since,
> so just wanted to ask if your opinion here is the same, or whether you
> would accept a patch to make this buildable without resorting to
> #ifdef'ery.
>=20
> Thierry

Actually adding Joerg this time.

Thierry

--Y/WcH0a6A93yCHGr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1/sEMACgkQ3SOs138+
s6Hq3A//XhOC3tcfyhGZXILADs/IlB+/BiuOdPa832We5DqiHynCOyKOchvpP5Of
HWj99i2SDfL1KdpqtIRAnteMzMR79aibDPziLY/dy7/i8YMpH0UfmwnkMMqR6ES5
n6SqD2920pTrUHaW6OTivIpoXYWsbskPPcQ1sDCWz8LSWyQ7wXA+YocCVRnji59A
mxgqVuOJxX1h4RZi2xMOpyiw99t1leHyKc4OsnQMVkOMp/apnZbkSowR94Ahyy3y
husUiOyXJfnOyy/pDf/Ds/z8BlaXWjfeGbqfLZdd/+CsdJO2qZGBb0FXnwvC7cT3
fQCSM6cgn2euTeTBez3SPvn7aDdooPEDFHTJVX93soNu1xoDQE1Xh64750K0K2jl
w6eUGzSuxA6HDRpAq1Lb9c6kSoBF/6eih7k4LvGOdN8pbcCwvnorvZcbO6WAfmYZ
mgeLoNCphgq02i6+xVwlnjuia8iLyv/w/e4DKjynh0ldpeOV7/GB89szG7hrNatF
aCm49rAjajQyiYwzeM60iTR+qSf4NyFeyqg5v7Pqhoyffd9RgsQWCgzERp3GfGfq
/vflkI0bhdAMCX2/UMJDZ8cy/sB4gD6tH16gN7H8TyvJOZBO/blw0CmZ2t3vTC5t
XO0RxD9M6pHyS7t2fyJlFFFtCiTw7b8dSWHDG2td8BLUz4ll+5k=
=cKUq
-----END PGP SIGNATURE-----

--Y/WcH0a6A93yCHGr--

--===============0267023149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0267023149==--
