Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 553EB10CD1B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 17:50:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316FB6E866;
	Thu, 28 Nov 2019 16:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A066E866
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 16:50:30 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a131so7297167wme.5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 08:50:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WUkl5jnRGfV/kV8cyt6Eg+72AaYhmkjbi+1i7ecJ1mo=;
 b=VfEzcnqRnGJ+m+dP19zmGYBUeZ6wdPRb2eCW8rAHJQDJd11mBDIl1MZnDd2U+hnXTg
 dzLxE1/UZXiku5FaXeQ7RPkWKm0GrTxSTnIO/u9WWK3rEbAfDbLo4lHikryH/btkiaxB
 Fba/EcpGO9PbOBauy+3hB0b6Yxa3WaCC/VPUT+TV0BXI3HF2ECKKF0IKDaHWynznxssY
 IA0H6Ph0vGhWwY366vUzXixrSRq4lIqJ1Ad3z0Ool9hbG8hSnF6RowNPC53W6STxlyur
 R/f5/TNZlS3jJizOLylbbiVGs0vjmaD0zW2o9N0eKQw+tjNPM8mk3Uf7r1ORxGPaz07T
 ETkg==
X-Gm-Message-State: APjAAAUXr+ggJXsvETrST53qYDETDmfabqIiIPPvbmTzXo7iYU6Bb+91
 x2GMpWdNi5onHMduw0gXiE4=
X-Google-Smtp-Source: APXvYqw/Rk1HO4LPlPbWBMuiTAgE3dOIrv9Mn4hWI/VmFC5SoleWU4B7t57e/CasMTGHHDYv4kv2KA==
X-Received: by 2002:a05:600c:2301:: with SMTP id
 1mr10852998wmo.143.1574959829103; 
 Thu, 28 Nov 2019 08:50:29 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id a15sm25776678wrx.81.2019.11.28.08.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 08:50:27 -0800 (PST)
Date: Thu, 28 Nov 2019 17:50:26 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH 1/2] PM / runtime: Allow drivers to override runtime PM
 behaviour on sleep
Message-ID: <20191128163623.GA2382107@ulmo>
References: <20191128160314.2381249-1-thierry.reding@gmail.com>
 <20191128160314.2381249-2-thierry.reding@gmail.com>
 <CAJZ5v0haOB1vc8aKk11RR-OnfLHChcqa+z7QkeKyN66s6xM3OA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0haOB1vc8aKk11RR-OnfLHChcqa+z7QkeKyN66s6xM3OA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WUkl5jnRGfV/kV8cyt6Eg+72AaYhmkjbi+1i7ecJ1mo=;
 b=oCI2+ouwC6FFFtwC3HQe79/vZiJy/YQyFyQwhwV/ymbxp3MvaqFahpwedaEfj3OrdD
 CuftaRGF0xFpDINRHILhK+cH1tHhFQHfcomOVj8tA9J+v1PZQlceN9zKnUFwempR5po/
 akAoN1D9mpSJsG1+QmiNFMAzdOecVbRvq3CM50/jSHNn9DfEw04pDNiR+nchVHhsAHcY
 ogdXmFfca6ppxNYpCccsY4/OUm+QH8iC2PMyTrKXBFhN3dwTbkC9cwbu6HY3V2iWfUHy
 kBoKPAJfNNgiFhHGAmb20bV0eCdmC4qimpNUVfsGWM68GiK0LndjbjxsMYd1hNfcDN5U
 AZrQ==
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
Cc: Len Brown <len.brown@intel.com>, Linux PM <linux-pm@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 dri-devel <dri-devel@lists.freedesktop.org>, Pavel Machek <pavel@ucw.cz>,
 linux-tegra <linux-tegra@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>
Content-Type: multipart/mixed; boundary="===============0129945948=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0129945948==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2019 at 05:14:51PM +0100, Rafael J. Wysocki wrote:
> On Thu, Nov 28, 2019 at 5:03 PM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> >
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Currently the driver PM core will automatically acquire a runtime PM
> > reference for devices before system sleep is entered. This is needed
> > to avoid potential issues related to devices' parents getting put to
> > runtime suspend at the wrong time and causing problems with their
> > children.
>=20
> Not only for that.
>=20
> > In some cases drivers are carefully written to avoid such issues and
> > the default behaviour can be changed to allow runtime PM to operate
> > regularly during system sleep.
>=20
> But this change breaks quite a few assumptions in the core too, so no,
> it can't be made.

Anything in particular that I can look at? I'm not seeing any issues
when I test this, which could of course mean that I'm just getting
lucky.

One thing that irritated me is that I think this used to work. I do
recall testing suspend/resume a few years ago and devices would get
properly runtime suspended/resumed. I did some digging but couldn't
find anything that would have had an impact on this.

Given that this is completely opt-in feature, why are you categorically
NAK'ing this?

Is there some other alternative that I can look into?

Thierry

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3f+tAACgkQ3SOs138+
s6F4mBAAqcwu+TStcK/qpZpkwObpVPR3H5IoPOrDpq8MN9UfrWpbf4uaAcUPdVMj
7yMCZQT8etpz6ZSoyDATX4QqU5RYmAYcYQpVEzHNQ4WryTkba8Z6ElbOZMhlESfs
rNIHFvtYsBwvjPCq4VV4gdjodlKiarKCsKogOwP4CmPGOph0j4bdwyxpuUMhB+bd
nrxkDeDzHNGHqRgg9uGVt23icJnMqlWAl+NCkxvTCzpt3r0BwT2TW4xnZ6IEx9Rx
rcimhfWk9WxMkAKeYK1q9CZBwSeaEMkZ9LtmH242j9rTQj7UiEKnWgm8ogzIsq2X
/ZtPeZ95g5cNGzMJTrmxvteNvoIv2ROaKiOI12HrEAfFtFoHt9sotcNS0awSm5eG
6Yfle+/XfnVyBk+3mPX43r6hULcicnLY281NZ0YP+Av8y40HD0I+ynrjtByj/c3M
XZGsgVEPPNioiPPhKo3i+mbIGqfTiA1NeCb6EP+zHaMkqsswxSLlSckGXb3O3rdc
W0C0KZByR7PkzohlsTSnuV5edDwXWM0lfsBWEtL4PJG7ukNYHCifM4B2IW6ANc40
ACLA3rShB7oY9fuxtVDd4/Q/CK4r+4qLntQ9cF09g0NKUgs7HnIXKbMdcd0WYyWB
5S3TBt8Bir2B64eaa5x/Sr12uLRm+kkzWQMopKNUpI3Dt4Q8D1k=
=U0Wg
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--

--===============0129945948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0129945948==--
