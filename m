Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AAD28ACBB
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 06:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C806E409;
	Mon, 12 Oct 2020 04:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F1E6E409
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 04:19:51 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C8lnd1x8Qz9sT6;
 Mon, 12 Oct 2020 15:19:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1602476389;
 bh=6nzOIoDHDbw2mX03lk95gkKSdnAkCM8m8l/dKKO68TE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LxAznhpnq8h6/CbKcUBguBKfGG5kU28tZB4xWboaQBB6g3XYA4X23q68Ugz3RgZF9
 n3ixW2mLbUlUs6W2OsQXM66A/gLlUgZYlU87+waDCv5TJKoZPg8ILWetFh7nNZTW1j
 s+JmRDO+Sg7wcdtjEzbKyDqQOdc7Eri7OXmAFmRd9LbdsVORLU0oXyF8CeGnOcTJAZ
 7cS3nogYyAHSyMnKusy3a4OJCLpzZ2yicZW490+NCRg1+cjp4za9t55dIEXAx8UQyC
 xFnWCxS2qjDvbB4UPdDQiWsDesvXTSI9UTtAueq+o+qczx929xTyXJi5wjdce0bbb6
 sJyIGtA/rm82A==
Date: Mon, 12 Oct 2020 15:19:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>, Dave Airlie <airlied@linux.ie>, Doug
 Ledford <dledford@redhat.com>
Subject: Re: linux-next: build failure after merge of the hmm tree
Message-ID: <20201012151948.3a840c00@canb.auug.org.au>
In-Reply-To: <20201006164120.GI4734@nvidia.com>
References: <20201006203508.3cb3d0e3@canb.auug.org.au>
 <20201006164120.GI4734@nvidia.com>
MIME-Version: 1.0
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
Cc: Leon Romanovsky <leonro@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Maor Gottlieb <maorg@nvidia.com>
Content-Type: multipart/mixed; boundary="===============1717823098=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1717823098==
Content-Type: multipart/signed; boundary="Sig_/6gb=Pmpxd4aBBoRVlHZ1V50";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6gb=Pmpxd4aBBoRVlHZ1V50
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 6 Oct 2020 13:41:20 -0300 Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Tue, Oct 06, 2020 at 08:35:08PM +1100, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the hmm tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >=20
> >=20
> > Caused by commit
> >=20
> >   07da1223ec93 ("lib/scatterlist: Add support in dynamic allocation of =
SG table from pages")
> >=20
> > interacting with commit
> >=20
> >   707d561f77b5 ("drm: allow limiting the scatter list size.")
> >=20
> > from the drm tree.
> >=20
> > I have added the following merge fix patch
> >=20
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Tue, 6 Oct 2020 20:22:51 +1100
> > Subject: [PATCH] lib/scatterlist: merge fix for "drm: allow limiting the
> >  scatter list size."
> >=20
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> >  drivers/gpu/drm/drm_prime.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> > index 11fe9ff76fd5..83ac901b65a2 100644
> > +++ b/drivers/gpu/drm/drm_prime.c
> > @@ -807,6 +807,7 @@ struct sg_table *drm_prime_pages_to_sg(struct drm_d=
evice *dev,
> >  				       struct page **pages, unsigned int nr_pages)
> >  {
> >  	struct sg_table *sg =3D NULL;
> > +	struct scatterlist *sl;
> >  	size_t max_segment =3D 0;
> >  	int ret;
> > =20
> > @@ -820,11 +821,13 @@ struct sg_table *drm_prime_pages_to_sg(struct drm=
_device *dev,
> >  		max_segment =3D dma_max_mapping_size(dev->dev);
> >  	if (max_segment =3D=3D 0 || max_segment > SCATTERLIST_MAX_SEGMENT)
> >  		max_segment =3D SCATTERLIST_MAX_SEGMENT;
> > -	ret =3D __sg_alloc_table_from_pages(sg, pages, nr_pages, 0,
> > +	sl =3D __sg_alloc_table_from_pages(sg, pages, nr_pages, 0,
> >  					  nr_pages << PAGE_SHIFT,
> > -					  max_segment, GFP_KERNEL);
> > -	if (ret)
> > +					  max_segment, NULL, 0, GFP_KERNEL);
> > +	if (IS_ERR(sl)) {
> > +		ret =3D PTR_ERR(sl);
> >  		goto out;
> > +	}
> > =20
> >  	return sg;
> >  out: =20
>=20
> This looks OK to me, thanks

This merge fix patch is now being applied to the merge of the drm tree
since the rdma tree (that is merged before the drm tree) has merged the
hmm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/6gb=Pmpxd4aBBoRVlHZ1V50
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+D2WQACgkQAVBC80lX
0Gxs0Af5AZow+Krg9JnlYrOXglhcOIm9Lf9ArfZa6cwVBTP5GbCoUMdcMuTf7Zo8
XOMNT67+/zn3R6faniiV/VSpKQDibWJWBxFkrNCsIgvU3OmWDYHZ4MOp3r7mn+z6
8zNYjUKGwjnzhcwMij/Huzv+akLOVzrA3kMd+Kx+yd3GumC17Aril3XEACcZRn4n
coXu4YhwGVTJcgZ31KvCIZblGlwxyjcE3/U9SjP44uj2T+TjhA4hG4XapGsAFRcK
FRLeqavH+tlOLv0DrX33SwtnGLaj/zL4uMsKsLvzmqrd6e5rMhrWXYZiyTLoj+GB
SIvnrvdkQRWBc8tBZVPcG4x2b8xsGg==
=AlzX
-----END PGP SIGNATURE-----

--Sig_/6gb=Pmpxd4aBBoRVlHZ1V50--

--===============1717823098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1717823098==--
