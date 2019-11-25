Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80261108C40
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 11:47:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8F189DC9;
	Mon, 25 Nov 2019 10:47:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2FE89DBC;
 Mon, 25 Nov 2019 10:47:51 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id l1so14894704wme.2;
 Mon, 25 Nov 2019 02:47:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ffiJLU38gEeVx/W0K7eQeeV98raEvJbICVrP2RUGYJE=;
 b=hVKzWEzScspaNUYh3yrN1uTXhkKGBffJ93lmSb4ct2h5lNaj9xBGBX9flN9NgXVeNC
 exfUEN749xE81zxEipWGv9mz1Gw431E0w/+6UWgX/q9m9MYFXwe2nfvEAhGhWx4ocvUg
 0KTxu8iYkf1GdXWHsTXq2JpIPlauIQTbNZqMCQetmBeALD+e7gHqomkzNQJcpLHi+qi3
 mZ4zIze/bGPv7pqJZKwJ9iAFvXuippDQKb0mqtBUN3SdNlMqpD5h2T/m77sbpgmMb5ms
 rhwBk1l500YOzjy9KTh6/72u0sI0R6OrBpmJ9xziJz9koTBWRbPEIuIA8SLxK8pvVP4s
 Bj9A==
X-Gm-Message-State: APjAAAXz9mQ/SVbhQUlxr5NFNSHxQtKBPEb3ns+hVLy2hZAZaUo/TvUL
 nzkCBtp+m38/xTkgx1jlA3g=
X-Google-Smtp-Source: APXvYqxrxthFXPUda9610VSrub1TK9Hw16v+le2ORZrl8oDGzvqBxvKko/8EQBg2PN/MgLOLt79B/Q==
X-Received: by 2002:a1c:544b:: with SMTP id p11mr28445744wmi.46.1574678870016; 
 Mon, 25 Nov 2019 02:47:50 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id 16sm11752082wmf.0.2019.11.25.02.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 02:47:48 -0800 (PST)
Date: Mon, 25 Nov 2019 11:47:47 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 01/15] drm/tegra: Map cmdbuf once for reloc processing
Message-ID: <20191125104747.GG1409040@ulmo>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-2-daniel.vetter@ffwll.ch>
 <20191125095856.GL29965@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20191125095856.GL29965@phenom.ffwll.local>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ffiJLU38gEeVx/W0K7eQeeV98raEvJbICVrP2RUGYJE=;
 b=pre0QsF/pS5aKTRauFdsp7jCToAk5kZpmw7u9z9RQ32Kj6xYvNUHik3kfOq61hbhnq
 4syNf3CSaEMu4lkqxWlzejrpXBM5Bo7APYjO2ZbfQr9rx5iWJQKJgmUUtrT441dXTv6R
 TvVkmXgsME2qBZ99RgcpTNkQhZSqTZ3UDA6LlmDb7IpptbG/LDp7XY6qzA2wfpTU14aa
 DcBeCEiRPmhPIOaeBzs4+FT9GxGxnSjawwKP1r99Kg+W5Zn80yy9/YoBMUCtnhw+eY1O
 amHKIKmsE/Y6YcKZVh26D/pT8s2oOPJeunkb3Dh+DEFzVowFIr+BnYhH1/eEYYnoJX2k
 Iqhw==
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
Cc: linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1886870099=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1886870099==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Fnm8lRGFTVS/3GuM"
Content-Disposition: inline


--Fnm8lRGFTVS/3GuM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2019 at 10:58:56AM +0100, Daniel Vetter wrote:
> On Mon, Nov 18, 2019 at 11:35:22AM +0100, Daniel Vetter wrote:
> > A few reasons to drop kmap:
> >=20
> > - For native objects all we do is look at obj->vaddr anyway, so might
> >   as well not call functions for every page.
> >=20
> > - Reloc-processing on dma-buf is ... questionable.
> >=20
> > - Plus most dma-buf that bother kernel cpu mmaps give you at least
> >   vmap, much less kmaps. And all the ones relevant for arm-soc are
> >   again doing a obj->vaddr game anyway, there's no real kmap going on
> >   on arm it seems.
> >=20
> > Plus this seems to be the only real in-tree user of dma_buf_kmap, and
> > I'd like to get rid of that.
> >=20
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: linux-tegra@vger.kernel.org
>=20
> Ping for testing/review on these first 2 tegra patches. They're holding up
> the entire series, and I got acks for all the other bits surprisingly
> fast. So would like to land this rather sooner than later. I'm also
> working on a lot more dma-buf patches ...

Right, I had forgotten about this series. Let me go test it right away.

Thierry

> > ---
> >  drivers/gpu/host1x/job.c | 21 +++++++--------------
> >  1 file changed, 7 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
> > index 25ca54de8fc5..60b2fedd0061 100644
> > --- a/drivers/gpu/host1x/job.c
> > +++ b/drivers/gpu/host1x/job.c
> > @@ -244,8 +244,7 @@ static unsigned int pin_job(struct host1x *host, st=
ruct host1x_job *job)
> > =20
> >  static int do_relocs(struct host1x_job *job, struct host1x_job_gather =
*g)
> >  {
> > -	u32 last_page =3D ~0;
> > -	void *cmdbuf_page_addr =3D NULL;
> > +	void *cmdbuf_addr =3D NULL;
> >  	struct host1x_bo *cmdbuf =3D g->bo;
> >  	unsigned int i;
> > =20
> > @@ -267,28 +266,22 @@ static int do_relocs(struct host1x_job *job, stru=
ct host1x_job_gather *g)
> >  			goto patch_reloc;
> >  		}
> > =20
> > -		if (last_page !=3D reloc->cmdbuf.offset >> PAGE_SHIFT) {
> > -			if (cmdbuf_page_addr)
> > -				host1x_bo_kunmap(cmdbuf, last_page,
> > -						 cmdbuf_page_addr);
> > +		if (!cmdbuf_addr) {
> > +			cmdbuf_addr =3D host1x_bo_mmap(cmdbuf);
> > =20
> > -			cmdbuf_page_addr =3D host1x_bo_kmap(cmdbuf,
> > -					reloc->cmdbuf.offset >> PAGE_SHIFT);
> > -			last_page =3D reloc->cmdbuf.offset >> PAGE_SHIFT;
> > -
> > -			if (unlikely(!cmdbuf_page_addr)) {
> > +			if (unlikely(!cmdbuf_addr)) {
> >  				pr_err("Could not map cmdbuf for relocation\n");
> >  				return -ENOMEM;
> >  			}
> >  		}
> > =20
> > -		target =3D cmdbuf_page_addr + (reloc->cmdbuf.offset & ~PAGE_MASK);
> > +		target =3D cmdbuf_addr + reloc->cmdbuf.offset;
> >  patch_reloc:
> >  		*target =3D reloc_addr;
> >  	}
> > =20
> > -	if (cmdbuf_page_addr)
> > -		host1x_bo_kunmap(cmdbuf, last_page, cmdbuf_page_addr);
> > +	if (cmdbuf_addr)
> > +		host1x_bo_munmap(cmdbuf, cmdbuf_addr);
> > =20
> >  	return 0;
> >  }
> > --=20
> > 2.24.0
> >=20
>=20
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--Fnm8lRGFTVS/3GuM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3bsVMACgkQ3SOs138+
s6HCZg/9FGm4sPPaTlmxdmeXe0jAJa+u6ysFQtoln955fM3lJMaa9uzCHFRYYxpl
6123F+2BuuCYDoizz2LzlmSUYTXuyuYnWBxaGRUdHtAHBmvcndLrULELXAnWp4zg
jWk8Xhf3aieUFgDfXBrb89E3NqFj4VXblnmdKXHzq4WA9nQKZROFy3ATSdYWS2D/
WHQNYuD10jqVyGRScXePVD2PKTCJnbSDYIg67fWBxWBSuU8Go/nW8NhALCLysgXT
A6p6Kysr7jA5FME8ZRu6lkrRQ063lvlNFzAG4e/iRFh74GhhLxsnwzvdV7YZQDWF
h9t70vSLIO/9B5fTHEJ81XnfRus5yb2qkp2eYF9PWVf5tcobXykP/2OpQCR1ymr6
iFm/QNmDgRwmKsu5/7aGOFUn198qPdmapYIGf6rTJ4mGOnJgLltXkTK+Kd4SKJ/T
nDroWWc2oA/75/3yCxG/7jvQb/59p/F7YcOXp4DODRRSMOOj1aBNemNtpeoqyLVQ
+9j4S26wvcyRSlzrIjmnYmzMNOvvmHr7e3MUzm+ANEssvUZ6fiLpK69CnsUDc7y3
YOxmfk2k22CECJYkL1rCSD2dKGQBWKC8XFg2cf2+NdHBoLI4DnQdyU/iWhEc3LI7
cKcd9EJvtIK5Aw0dnZC3Smi24KokOnfR4gvNJs2cGj/HKDGMk1U=
=7zGa
-----END PGP SIGNATURE-----

--Fnm8lRGFTVS/3GuM--

--===============1886870099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1886870099==--
