Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F7640F4CF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 11:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C136EC13;
	Fri, 17 Sep 2021 09:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4246EC13
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 09:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=PiFYvkZmfgoIr7YkSNQ3xsS/bb7c4drIm7Z293entqw=; 
 b=i60jZRRY46N4fKbIR4U3sfg7ngLcoFsrtp5PU6KynSSvLJiPmUpQWldwPTiwpJI+/Ss10TLLcnp2FaHol2IJ//3ikug9mKBYOw7sU4k+gvQigxHFTijcwGWQG1FU+TWd4WeqcQQmciGUVla4dbWP0H/oHls/ZUTPDsVSr2Apx1sRGfZGQxOb5xVTyn+OPDvtvzox+a7MKqS/4adm4Rg+U75dKfNMAW+zAMILoizwdbcvAiBdZcqhYZe7QN3QflseZ6f5akWF3ogN/evl8notEfoC8yzlxtlwsXKHquasoLXSCQbABqpru7iIksxnafz/piDjg9NWhRoQTtSgOMtE7A==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mRA9b-0006q4-GT; Fri, 17 Sep 2021 11:27:31 +0200
Date: Fri, 17 Sep 2021 10:27:18 +0100
From: Melissa Wen <mwen@igalia.com>
To: Iago Toral <itoral@igalia.com>
Cc: dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/v3d: fix sched job resources cleanup when a job is
 aborted
Message-ID: <20210917092654.5enypivdethdsd6j@mail.igalia.com>
References: <20210916212726.2u2psq2egwy2mdva@mail.igalia.com>
 <e408d91387fa8d64cfbb42b9df34f9f9aefcf574.camel@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2vafkasvnpkpqajl"
Content-Disposition: inline
In-Reply-To: <e408d91387fa8d64cfbb42b9df34f9f9aefcf574.camel@igalia.com>
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


--2vafkasvnpkpqajl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 09/17, Iago Toral wrote:
> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
>=20
> With that said, I don't like how we are doing error handling here, I
> think we want to simplify this and try to make it so we centralize
> error handling in one place instead of having multiple error exits
> paths, each one trying to do the right thing at that point. This is
> error prone, as this patch is showing.
>=20
> Here is a proposal to make this better:
>=20
> Make job memory allocation part of v3d_job_init. v3d_job init already
> handles error conditions nicely. If we do this, we no longer need to
> handle allocation errors in ioctls one by one and for any job we only
> have two scenarios: v3d_job_init was successul or it failed (in which
> case we know it already cleaned up after itself and we should have a
> NULL job as a result). If v3d_job_init failed, then we *always* jump to
> the fail tag and there we call v3d_job_cleanup for all jobs that can be
> created in that ioctl. If a job is NULL then v3d_job_cleanup returns
> early, otherwise, we know it is a fully initialized job, so it does =09
> drm_sched_job_cleanup + v3d_job_put.
>=20
> I think that should make error handling in these functions a lot
> easier.

Hi,

yes, sounds good. I can include this refactoring in the v2 of the
multisync patchset, since there is a prep work there (first patch).

Thanks for reviewing both,

Melissa

>=20
> Iago
>=20
>=20
> On Thu, 2021-09-16 at 22:27 +0100, Melissa Wen wrote:
> > In a cl submission, when bin job initialization fails, sched job
> > resources
> > were already allocated for the render job. At this point,
> > drm_sched_job_init(render) was done in v3d_job_init but the render
> > job is
> > aborted before drm_sched_job_arm (in v3d_job_push) happens;
> > therefore, not
> > only v3d_job_put but also drm_sched_job_cleanup should be called (by
> > v3d_job_cleanup). A similar issue is addressed for csd and tfu
> > submissions.
> >=20
> > The issue was noticed from a review by Iago Toral in a patch that
> > touches
> > the same part of the code.
> >=20
> > Fixes: 916044fac8623 ("drm/v3d: Move drm_sched_job_init to
> > v3d_job_init")
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  drivers/gpu/drm/v3d/v3d_gem.c | 11 +++++------
> >  1 file changed, 5 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/v3d/v3d_gem.c
> > b/drivers/gpu/drm/v3d/v3d_gem.c
> > index 1953706bdaeb..ead0be8d48a7 100644
> > --- a/drivers/gpu/drm/v3d/v3d_gem.c
> > +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> > @@ -567,14 +567,14 @@ v3d_submit_cl_ioctl(struct drm_device *dev,
> > void *data,
> >  	if (args->bcl_start !=3D args->bcl_end) {
> >  		bin =3D kcalloc(1, sizeof(*bin), GFP_KERNEL);
> >  		if (!bin) {
> > -			v3d_job_put(&render->base);
> > +			v3d_job_cleanup(&render->base);
> >=20
> > >  			return -ENOMEM;
> >  		}
> > =20
> >  		ret =3D v3d_job_init(v3d, file_priv, &bin->base,
> >  				   v3d_job_free, args->in_sync_bcl,
> > V3D_BIN);
> >  		if (ret) {
> > -			v3d_job_put(&render->base);
> > +			v3d_job_cleanup(&render->base);
> >  			kfree(bin);
> >  			return ret;
> >  		}
> > @@ -716,7 +716,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void
> > *data,
> >  	job->base.bo =3D kcalloc(ARRAY_SIZE(args->bo_handles),
> >  			       sizeof(*job->base.bo), GFP_KERNEL);
> >  	if (!job->base.bo) {
> > -		v3d_job_put(&job->base);
> > +		v3d_job_cleanup(&job->base);
> >  		return -ENOMEM;
> >  	}
> > =20
> > @@ -810,14 +810,13 @@ v3d_submit_csd_ioctl(struct drm_device *dev,
> > void *data,
> > =20
> >  	clean_job =3D kcalloc(1, sizeof(*clean_job), GFP_KERNEL);
> >  	if (!clean_job) {
> > -		v3d_job_put(&job->base);
> > -		kfree(job);
> > +		v3d_job_cleanup(&job->base);
> >  		return -ENOMEM;
> >  	}
> > =20
> >  	ret =3D v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0,
> > V3D_CACHE_CLEAN);
> >  	if (ret) {
> > -		v3d_job_put(&job->base);
> > +		v3d_job_cleanup(&job->base);
> >  		kfree(clean_job);
> >  		return ret;
> >  	}
>=20

--2vafkasvnpkpqajl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmFEX3YACgkQwqF3j0dL
ehwEEQ//TBDrd8ccRKoGZquCaE7dy3K11Z0j86OPx7s09U56CwOF/wR3q3g2TlI7
C+i5NfpToVzFfBLO5Jgq5R7lPHU8yKkvdaZIpVIoj229OPCKlZiucig8KUqONFzv
Cz20KB6b8QTJ3LihEelPa55qOvQLsIMJNEVMh4eeRHYcuT2D+eXpJvv6qkBUcAmB
FENiN4D6/CmNAQqEtNfJXVZfsyiFNxMeV3h9ykmL4vRvrkOp1hYnUHBKSFJxNdXW
1pGzIhT0E2PUawbw+MtP8rPQqWobwNnAAB5kWBU1JCILMj5xS27I1/jsdWgRF7Fe
uriX6Rq5ksbSrYKUIcAcp95Z7e5+HLxOKdf1ZvtH7hXIxZZ+8XsPX8As0Jejynnr
g33/EYj6sZofCXKcGW59VxXfnfEL/BlIQyNyBHNURRVGZAedkibvoRH3t+1EI+lw
YdGeZLy+l03iF6XGP7JbhFQf3deF8yBUVFDHTC2QAy80LNk5rCpP3hFk6tabk92C
BXd45HoaxUEGypc2TtL96sqSxyWJPrzHGLoYDB6QJEV5EIgoqsroHxKpTf3Oc/Z6
osK5hVDiYTnLjnkjhwui4YKRprbiusMvximCwX0biBQRHNg3F/BL3AVU+2vaHXMP
YqHQEZqLxKU8Yls8w8+XjbbCxuugMcHqvrWzVDqhG+TQc0ZauVA=
=BMub
-----END PGP SIGNATURE-----

--2vafkasvnpkpqajl--
