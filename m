Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F242606210
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 15:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9B210E4B4;
	Thu, 20 Oct 2022 13:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE32510E4B4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 13:45:05 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id sc25so47466887ejc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 06:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yf9YGyE8L4r3rR8vF8nxDmhRHcCQaxI8Vu64K8vPEO0=;
 b=CE3ywWqHsGpEZiLkUQzr+qrMmT+//U/AZ4tJbQ27xrEov3CnXXSXR8ODUq844pVKTG
 R3wjUqmBCc8CIFegNsWo3jXQVDnPzNnGdx1Hf17zg8aH72It8Fli6GuBsnm51zvJuQp/
 hev0SBZGjsnu2PPibPfFwHWPHwAYFsG0ZkUYAZQ6cVSb6BZgakRvD6k+O6ib/kCmLWi3
 88Ihs8YK9VIRE54U6oMCfbM9SeEWLE3J+FqOiTif6AFgh208tjLywbPOx3uoNFZSF7w9
 s8zBb4wIGlo1wnun2AM7/rg2XLaGw0zkYbIWCL6ktXiz0AptGGdY9U1XabBnJC+RAI7G
 gmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yf9YGyE8L4r3rR8vF8nxDmhRHcCQaxI8Vu64K8vPEO0=;
 b=Au0qF0h4/lmD9ZDmZkmUV5eTU7yYQuesKGCoNFS+ftUBPjn1zchUw/AE7ccTnXlS3G
 Huj6mgs/aGff/Fe8BilK965k129uVFtYZ3tOXyUDN0Emq5DyUqblwd75WnDVDfxuYCVc
 upXAkCFQSjHRSHp9EATqC/sWhQj1mVUBZVVHhbBL6SkYEpyrfTJX2QlsY3LNLGP3qIjJ
 SfQoWL0X8ZlPH813w8aWAnNMN78xeoqBLQpI4+EGtIEzC7NwP8/Rl03hI3HDIYYaSkxY
 OwA0VZYssK8XHgPSNqv2sb3s46xp9KpjFFzCV11Ddsm7fcIiRyWjbnDf6SOE5HHmh38y
 xgtA==
X-Gm-Message-State: ACrzQf3adQ7alDv9NI+mkY1AxrnkmXIsV8oC9hX3JQ6Fqeqr7JdCzpOL
 EIWhBBIt5QJt32t5mMQA56o=
X-Google-Smtp-Source: AMsMyM6VYio+yGh/VSy42bMj1712e3B+0t+UBJeA3btx45dtQj/QWTEDIefEWfC6U9keziMy8E/J4g==
X-Received: by 2002:a17:907:743:b0:740:ef93:2ffc with SMTP id
 xc3-20020a170907074300b00740ef932ffcmr11314178ejb.514.1666273503905; 
 Thu, 20 Oct 2022 06:45:03 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 et11-20020a056402378b00b0045c47b2a800sm11940936edb.67.2022.10.20.06.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 06:45:02 -0700 (PDT)
Date: Thu, 20 Oct 2022 15:45:01 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] gpu: host1x: Avoid trying to use GART on Tegra20
Message-ID: <Y1FQ3TRRs8NHDuAs@orome>
References: <ee0278cae0443d4ff407d6db38f4d9b33d477e8f.1666200021.git.robin.murphy@arm.com>
 <9b79d517-f242-6619-5f13-eee65f01c57a@nvidia.com>
 <493de78c-fce5-231b-20d3-6c5c6f53d51e@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ubLx+7fqK52n2gY3"
Content-Disposition: inline
In-Reply-To: <493de78c-fce5-231b-20d3-6c5c6f53d51e@arm.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
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
Cc: linux-tegra@vger.kernel.org, iommu@lists.linux.dev,
 Dmitry Osipenko <digetx@gmail.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ubLx+7fqK52n2gY3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2022 at 01:42:28PM +0100, Robin Murphy wrote:
> On 2022-10-20 13:25, Jon Hunter wrote:
> > Hi Robin,
> >=20
> > On 19/10/2022 18:23, Robin Murphy wrote:
> > > Since commit c7e3ca515e78 ("iommu/tegra: gart: Do not register with
> > > bus") quite some time ago, the GART driver has effectively disabled
> > > itself to avoid issues with the GPU driver expecting it to work in wa=
ys
> > > that it doesn't. As of commit 57365a04c921 ("iommu: Move bus setup to
> > > IOMMU device registration") that bodge no longer works, but really the
> > > GPU driver should be responsible for its own behaviour anyway. Make t=
he
> > > workaround explicit.
> > >=20
> > > Reported-by: Jon Hunter <jonathanh@nvidia.com>
> > > Suggested-by: Dmitry Osipenko <digetx@gmail.com>
> > > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > > ---
> > > =C2=A0 drivers/gpu/host1x/dev.c | 4 ++++
> > > =C2=A0 1 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> > > index a13fd9441edc..1cae8eea92cf 100644
> > > --- a/drivers/gpu/host1x/dev.c
> > > +++ b/drivers/gpu/host1x/dev.c
> > > @@ -352,6 +352,10 @@ static struct iommu_domain
> > > *host1x_iommu_attach(struct host1x *host)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!host1x_wants_iommu(host) || domai=
n)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return domain;
> > > +=C2=A0=C2=A0=C2=A0 /* Our IOMMU usage policy doesn't currently play =
well with GART */
> > > +=C2=A0=C2=A0=C2=A0 if (of_machine_is_compatible("nvidia,tegra20"))
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 host->group =3D iommu_group_get(host->=
dev);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (host->group) {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct iommu_d=
omain_geometry *geometry;
> >=20
> >=20
> > Thanks for sending. I gave this a quick test, but I still see ...
> >=20
> > [=C2=A0=C2=A0=C2=A0 2.901739] tegra-gr2d 54140000.gr2d: failed to attac=
h to domain: -19
> > [=C2=A0=C2=A0=C2=A0 2.908373] drm drm: failed to initialize 54140000.gr=
2d: -19
>=20
> Urgh, of course it's the same-but-different logic in host1x_drm_probe() t=
hat
> matters for that one. Am I allowed to mention how much these drivers drive
> me to despair?

Yeah, the whole situation around these drivers has been difficult over
the years. In fact there's a current regression in certain corner cases
because some the IOMMU internals keep changing.

I'm not sure if anybody else (or why nobody else) is seeing similar
issues. Perhaps we're the only users left where direct IOMMU API is
used. Or used in a problematic way, which is primarily due to a need to
share IOMMU domains on certain older devices where they are very scarce.

Frankly, this whole mess has been going on for so long that I no longer
remember why we never switched to using the DMA API exclusively. It may
be because we don't support those DMA domains on 32-bit ARM (or on pre-
Tegra186, more generally), which in turn is due to the lack of early
direct mapping support. The iommu-addresses series is meant to fix that
on newer chips. On older chips we likely won't be able to do anything on
that front anymore, but there may be a way to hack something up in the
tegra-smmu driver to avoid faults...

Thierry

--ubLx+7fqK52n2gY3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNRUNoACgkQ3SOs138+
s6HcJRAAhl0hECwdoaYjwk6vhAmOG7TJpuGnUzftpvhDmgwgOv8df1lLwDiOSLQ5
OOYU3uU0/t/V2PiEk2wQXziXSCkOhv7r02Psh70PExAEGWcdkvzWRSbGEzc/q6BG
hPsoZuif2S4dzeokcHtRyLT9oOOtjETTSVY0YN+ZXe5zfwg1URZkMkA7UUYSDqJc
SnrRRlKp5UZa++A+AA+UwxpYfScQ7NnHIveiclqoGO2AMd0eh7eSBdIl0rNdWAOr
bWOCNPpfo2eTENTAw1L1CghQQrwcNhpiPY91wf27uYuFmpZJUHQFKSy02NJjyzpq
uekkSlS+KxmM/mSuG8+qT0LCGnAqDWOg2zSVr2o5CaFZFM2A4R63nvL3tIU3EupO
lQWvrwbIWFG2tlUuBw8Xmopur0qRg4FeOrcNOoxs+kUa5dQEQFTaXqCvolDvHthx
0wVc2cBoTWBKaUnuTeD+4exgwNysQY910mJJLDpV2DUcvvS470lrQY3mets+a9GD
Kg2eH1IfUp9ie/+tqLf8XK3ChcnPB/C7divkO+pfgutdZw7XsAayVytXbX5WXkqR
FTUkQURcCYIeKQBF0OFIJgXFcjUpUxyny/tTlWNL8DTrEa+DMl6a7O/BRRSS9ASE
hU1+Kccs+YhCFNGNXnQLwlYZTshPECKmS4bKimDEaOmeKjPVdkM=
=cj9z
-----END PGP SIGNATURE-----

--ubLx+7fqK52n2gY3--
