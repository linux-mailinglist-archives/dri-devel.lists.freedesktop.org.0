Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF6C10D3BB
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 11:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4BB6E8A4;
	Fri, 29 Nov 2019 10:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13626E8A4
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 10:15:40 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id y23so4811143wma.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 02:15:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qNZ9kkRzGPvYazTCgMrPpHWIp9WiIZSwgT+T2AdzT9s=;
 b=Ui7+Mbq12M4YGXRfJuwECZ6cwl8o6QhMwfoyKPJaY1H8BXfmXxO/nhedCye9yXkvrF
 BvYnPaSdW2wnXlz9/SVXcPZI+bYXdeJeLMAmt2FxnsXPFtw1wzcd6HUXPUz/JQSu01/G
 qDH9KaWOwKJ9ETEOez0QKixZJiHERyn8OZilBznw6co0DqfGo+MK+nMTkKyCqDJjlCGC
 W59dXGmIneBUzv8YSB54u8om7GntA+LUFtOvS8/ArL3QyQ8W0O64ywe4B87xxvWAHHTr
 O68R+qpGnwSpJTNAVa9CN8nuR7RE6cYEZBUO+jsN/TUyevLzIeVsZPlkvraUZ28czogb
 LkOA==
X-Gm-Message-State: APjAAAVDv9w+QZY+FfGbvurB023ot5s9ASq9NsIHT8NTgTRWZTSfUMt7
 o9UB2DkeccUcbJQm7bllH1o=
X-Google-Smtp-Source: APXvYqz0TrSWYcSoJWlCAwZ3SvYC5it+2xuja+EIXWWyonuqwtq1PnoWSzxAoa9+qM5S0FmXw3d+hQ==
X-Received: by 2002:a1c:e915:: with SMTP id q21mr14102365wmc.164.1575022539142; 
 Fri, 29 Nov 2019 02:15:39 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id c2sm9446856wrp.46.2019.11.29.02.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 02:15:38 -0800 (PST)
Date: Fri, 29 Nov 2019 11:15:37 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/9] drm/tegra: gem: Properly pin imported buffers
Message-ID: <20191129101537.GB2771912@ulmo>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
 <20191128153741.2380419-3-thierry.reding@gmail.com>
 <20191129091038.GB624164@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20191129091038.GB624164@phenom.ffwll.local>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qNZ9kkRzGPvYazTCgMrPpHWIp9WiIZSwgT+T2AdzT9s=;
 b=DhI+zQZ3zBxKvstaxNnpHag2RriklL6o63vNP3mKk94Q1M77KVj4KqfON7D3wi4R/f
 TMmXH+oMFZUVfzm1EYEqPftxHDyQNxfh05QhLOoDmMW3oA7ZE2NKXnv/9LeBcrVcUHoW
 BtH+ok4Ll8NCAiD8/qan2q2LlCtDNULeIkUqV7DZXOOLvrGqvhutqB336f46vhYB075L
 cVJ31gPPWyxkZd0JZnq+ckEUsdUnXbxgoCILL2zjEY1TfgcuZ/YQU7CG7Qr5Txk/xQit
 enia/s47W1skh5kKlN6CAnV5XU4psfs4XpdYBVgfCvWRBvDE0WP7aDiqhP+mBLIruJZI
 EHCA==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0124221833=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0124221833==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Hf61M2y+wYpnELGG"
Content-Disposition: inline


--Hf61M2y+wYpnELGG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2019 at 10:10:38AM +0100, Daniel Vetter wrote:
> On Thu, Nov 28, 2019 at 04:37:34PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Buffers that are imported from a DMA-BUF don't have pages allocated with
> > them. At the same time an SG table for them can't be derived using the
> > DMA API helpers because the necessary information doesn't exist. However
> > there's already an SG table that was created during import, so this can
> > simply be duplicated.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/tegra/gem.c | 43 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> > index 746dae32c484..6dfad56eee2b 100644
> > --- a/drivers/gpu/drm/tegra/gem.c
> > +++ b/drivers/gpu/drm/tegra/gem.c
> > @@ -27,6 +27,29 @@ static void tegra_bo_put(struct host1x_bo *bo)
> >  	drm_gem_object_put_unlocked(&obj->gem);
> >  }
> > =20
> > +/* XXX move this into lib/scatterlist.c? */
> > +static int sg_alloc_table_from_sg(struct sg_table *sgt, struct scatter=
list *sg,
> > +				  unsigned int nents, gfp_t gfp_mask)
> > +{
> > +	struct scatterlist *dst;
> > +	unsigned int i;
> > +	int err;
> > +
> > +	err =3D sg_alloc_table(sgt, nents, gfp_mask);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	dst =3D sgt->sgl;
> > +
> > +	for (i =3D 0; i < nents; i++) {
> > +		sg_set_page(dst, sg_page(sg), sg->length, 0);
> > +		dst =3D sg_next(dst);
> > +		sg =3D sg_next(sg);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static struct sg_table *tegra_bo_pin(struct device *dev, struct host1x=
_bo *bo,
> >  				     dma_addr_t *phys)
> >  {
> > @@ -52,11 +75,31 @@ static struct sg_table *tegra_bo_pin(struct device =
*dev, struct host1x_bo *bo,
> >  		return ERR_PTR(-ENOMEM);
> > =20
> >  	if (obj->pages) {
> > +		/*
> > +		 * If the buffer object was allocated from the explicit IOMMU
> > +		 * API code paths, construct an SG table from the pages.
> > +		 */
> >  		err =3D sg_alloc_table_from_pages(sgt, obj->pages, obj->num_pages,
> >  						0, obj->gem.size, GFP_KERNEL);
> >  		if (err < 0)
> >  			goto free;
> > +	} else if (obj->sgt) {
> > +		/*
> > +		 * If the buffer object already has an SG table but no pages
> > +		 * were allocated for it, it means the buffer was imported and
> > +		 * the SG table needs to be copied to avoid overwriting any
> > +		 * other potential users of the original SG table.
> > +		 */
> > +		err =3D sg_alloc_table_from_sg(sgt, obj->sgt->sgl, obj->sgt->nents,
> > +					     GFP_KERNEL);
>=20
> Why duplicate this instead of just handing out obj->sgt, and then in unpin
> making sure you don't release it? You could also only map/unmap the
> dma_buf here in your pin/unpin, but that's a pile of work plus the mapping
> is cached anyway so won't change a thing.

The problem with just handing out obj->sgt is that these buffers may be
used by several of the host1x engines in the same job. This means that
they may end up getting dma_map()'ed by multiple devices. dma_map_*()
stores the DMA addresses for the buffer in the SG entries, so subsequent
calls would effectively overwrite the earlier mappings, so we need a new
SG table for each device.

Thierry

> -Daniel
>=20
> > +		if (err < 0)
> > +			goto free;
> >  	} else {
> > +		/*
> > +		 * If the buffer object had no pages allocated and if it was
> > +		 * not imported, it had to be allocated with the DMA API, so
> > +		 * the DMA API helper can be used.
> > +		 */
> >  		err =3D dma_get_sgtable(dev, sgt, obj->vaddr, obj->iova,
> >  				      obj->gem.size);
> >  		if (err < 0)
> > --=20
> > 2.23.0
> >=20
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--Hf61M2y+wYpnELGG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3g78kACgkQ3SOs138+
s6HpxQ//VggJhmt9na98LluPjrj45QRtkZxHUX2ZpVqpVQqOq9Aja2GeCNj6HKB/
NgiW37V+QJwVlLeEgOhWyJb49JQ48wHZJl2sW8JbXsiRlTiQXEJJtdzxPVaBHX8d
vgiqi4jCRIOpm9McO3MrnRZJKBonCxND0fkMUZ5zUPcoByjrdO21q4lnzt8H/7K5
ET+SniGMFGK3MZhYj2Rpd7MaDz7Ydi/SwZV+Y19qH/j8hB2aPGXInlZ8Bd+KTBfD
dQ3qz3aSOF/5IHKdLcrNoN6iq9YXFOmzAWCp3HoizspaSqZQE3qnGmyS0g+QUKpf
n2VngQOj3jGymh4aQ+X0EPACI5d0JnNG4edWJ8QxCdnbCahkPavZPlD52T4gGPI3
vsP7yAp62BZi3wV6kPjGSiniwSOZbdsOaXDtrgP/Ato67qdTzc8t8KxocEWhJ25R
AAziXEnCpMx7g3XRnoyr28UUH+RZBtFjmaGbb/EOOs96RrlSs9LIZ/wH+3AkMH+l
4BFxmpPQB7DpGZ/2BvzRm5cnOPFgqzdwZ3ljS9MNQzkUQMxG3CDI6yonq5FWNLUI
LHumo2QLjVrwtqXJb4ns/Au4/ifwxqOKkrrJCjlGoyBzZYogVM9IzDSp9Vkl6KK6
FHXK84wbO6grpXUOMLQSSNKqCx7JPjS3LxLpxdNIhoK4ej7YQd4=
=pzBO
-----END PGP SIGNATURE-----

--Hf61M2y+wYpnELGG--

--===============0124221833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0124221833==--
