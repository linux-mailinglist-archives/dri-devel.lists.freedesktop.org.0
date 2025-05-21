Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 586E4ABF945
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 17:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6E010EA36;
	Wed, 21 May 2025 15:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AE7BvIJ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F8510E8B7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 15:29:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0F74C49CC5;
 Wed, 21 May 2025 15:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90925C4CEE4;
 Wed, 21 May 2025 15:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747841382;
 bh=qlXssQ+zC+nvTT6qYoRyNT3Tx8K4SII3RQNRlGCTdtU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AE7BvIJ1UqmiwFoAVamkAODvZqa+2XTKYBHLnCRt+g3vB8lTIfGdeslGD4aGcEtgw
 4larKn1k0IQ/b1oUPWgsjM32z1PJe3f/EX5IqpfOEL8i2S/2aPIo7ujIhBUBPdeMOd
 5WXXViniJ0x6vHnp1jL4PkQenpT25HFObsn+SxVIJ9+aYwnW9chLk2WVP3JR/z6DfC
 fKAENgM/qNZVoITQtSTib0RE5+C7NJO1vzuSUSJEYX+jKQQwFbSnTNlVJkW5dQhh7x
 XgFlx8z6dvJblnlAULCTUtFR9FYT/zgr1zO7FRLgE1mFED/KnWY37uUTETrXvMBa48
 tWLar7Q3RR4Ag==
Date: Wed, 21 May 2025 17:29:40 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jared Kangas <jkangas@redhat.com>
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
 christian.koenig@amd.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Give default CMA heap a fixed name
Message-ID: <20250521-curious-dolphin-of-perspective-4cc8c2@houat>
References: <20250422191939.555963-1-jkangas@redhat.com>
 <20250422191939.555963-3-jkangas@redhat.com>
 <20250424-sassy-cunning-pillbug-ffde51@houat>
 <aApirJb9P-LOOB8j@jkangas-thinkpadp1gen3.rmtuswa.csb>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="rl37qy3jxoobtiw7"
Content-Disposition: inline
In-Reply-To: <aApirJb9P-LOOB8j@jkangas-thinkpadp1gen3.rmtuswa.csb>
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


--rl37qy3jxoobtiw7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Give default CMA heap a fixed name
MIME-Version: 1.0

Hi Jared,

On Thu, Apr 24, 2025 at 09:11:24AM -0700, Jared Kangas wrote:
> > >  struct cma_heap {
> > >  	struct dma_heap *heap;
> > > @@ -394,15 +395,26 @@ static int __init __add_cma_heap(struct cma *cm=
a, const char *name)
> > >  static int __init add_default_cma_heap(void)
> > >  {
> > >  	struct cma *default_cma =3D dev_get_cma_area(NULL);
> > > +	const char *legacy_cma_name;
> > >  	int ret;
> > > =20
> > >  	if (!default_cma)
> > >  		return 0;
> > > =20
> > > -	ret =3D __add_cma_heap(default_cma, cma_get_name(default_cma));
> > > +	ret =3D __add_cma_heap(default_cma, DEFAULT_CMA_NAME);
> > >  	if (ret)
> > >  		return ret;
> > > =20
> > > +	legacy_cma_name =3D cma_get_name(default_cma);
> > > +
> > > +	if (IS_ENABLED(CONFIG_DMABUF_HEAPS_CMA_LEGACY) &&
> > > +	    strcmp(legacy_cma_name, DEFAULT_CMA_NAME)) {
> > > +		ret =3D __add_cma_heap(default_cma, legacy_cma_name);
> > > +		if (ret)
> > > +			pr_warn("cma_heap: failed to add legacy heap: %pe\n",
> > > +				ERR_PTR(-ret));
> > > +	}
> > > +
> >=20
> > It would also simplify this part, since you would always create the leg=
acy heap.
>=20
> By "always", do you mean removing the strcmp? I added this to guard
> against cases where the devicetree node's name clashed with the default
> name, given that the DT name isn't necessarily restricted to one of the
> current names in use ("linux,cma" or "default-pool"). It seems like the
> strcmp would be relevant regardless of the naming choice, but if this is
> overly cautious, I can remove it in v3.

That's not overly cautious, that's something I overlooked :)

You're totally right that we should check for that. We should probably
add a more specific error message in that case though

Maxime

--rl37qy3jxoobtiw7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaC3xWAAKCRAnX84Zoj2+
duoJAX9hAWq/z0ihm1zZTbF17+eFM+dkCOxQNGkpF7/zsL9i44NQmwLDKPkIqTNv
euwhPhABf1kJHpTOiIbhwIC7VQYsdPmlucG8eH8pJSrd3FSG5iyuhauInEQ62awL
1HmM16MzAg==
=0SOR
-----END PGP SIGNATURE-----

--rl37qy3jxoobtiw7--
