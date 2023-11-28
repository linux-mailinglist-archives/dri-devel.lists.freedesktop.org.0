Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 895087FB927
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 12:14:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEBC10E4E1;
	Tue, 28 Nov 2023 11:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5805710E4E1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 11:14:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 685CFB839A0;
 Tue, 28 Nov 2023 11:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CABC433C7;
 Tue, 28 Nov 2023 11:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701170084;
 bh=ghXHN0aqKTTETA6By+7Mc0o8Xy5WxEMUZIlYt+T2S2k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RMsIKIwU5rCX0ZEd0AknFuQtsCuGZOd+UAdrNrElQLX+FzsvWwmnGzu/13zFTjv8S
 1sEGdUq+2Bh4u+xNBIkrOOA8OSDB/8dEVr+Q56+9wc6pXUozr4s9v+fIFf75ETOlF8
 XzZ2CFbTXGZyPhcJTLNeLIW2fjYac22oBY/+Br5aBCc6IHjl+TkO83cOKk+1da8jxN
 kcv0PqsiaEZGa6Py7G5TSKYyFsk91CQK+QFXFSva2vpwwhI8R7/GtaB6DiMrQG0oCq
 vpfDbnOoEWH7qtaUuEpPX6SypVnAweYMwsC1Zn+ukA5U3TbtvvX/W9MFchbO8JwdGt
 XHotEI5pg4ayg==
Date: Tue, 28 Nov 2023 12:14:42 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v18 04/26] drm/shmem-helper: Refactor locked/unlocked
 functions
Message-ID: <kw5bho3jx73d3glvtewmjvqt4qty4khju6dcwypuh25ya3gi4b@7slmijjqdi4p>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
 <20231029230205.93277-5-dmitry.osipenko@collabora.com>
 <wboljiwogeus7pwgaqzxaltt3xdavy2dzisygn6pdpoiwlnwgc@mwaiukjguzat>
 <20231124115911.79ab24af@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4o4oj77z6epqtcan"
Content-Disposition: inline
In-Reply-To: <20231124115911.79ab24af@collabora.com>
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
Cc: kernel@collabora.com, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Emma Anholt <emma@anholt.net>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Melissa Wen <mwen@igalia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Steven Price <steven.price@arm.com>, virtualization@lists.linux-foundation.org,
 Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4o4oj77z6epqtcan
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 24, 2023 at 11:59:11AM +0100, Boris Brezillon wrote:
> On Fri, 24 Nov 2023 11:40:06 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > On Mon, Oct 30, 2023 at 02:01:43AM +0300, Dmitry Osipenko wrote:
> > > Add locked and remove unlocked postfixes from drm-shmem function name=
s,
> > > making names consistent with the drm/gem core code.
> > >=20
> > > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com> =20
> >=20
> > This contradicts my earlier ack on a patch but...
> >=20
> > > ---
> > >  drivers/gpu/drm/drm_gem_shmem_helper.c        | 64 +++++++++--------=
--
> > >  drivers/gpu/drm/lima/lima_gem.c               |  8 +--
> > >  drivers/gpu/drm/panfrost/panfrost_drv.c       |  2 +-
> > >  drivers/gpu/drm/panfrost/panfrost_gem.c       |  6 +-
> > >  .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |  2 +-
> > >  drivers/gpu/drm/panfrost/panfrost_mmu.c       |  2 +-
> > >  drivers/gpu/drm/v3d/v3d_bo.c                  |  4 +-
> > >  drivers/gpu/drm/virtio/virtgpu_object.c       |  4 +-
> > >  include/drm/drm_gem_shmem_helper.h            | 36 +++++------
> > >  9 files changed, 64 insertions(+), 64 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm=
/drm_gem_shmem_helper.c
> > > index 0d61f2b3e213..154585ddae08 100644
> > > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > > @@ -43,8 +43,8 @@ static const struct drm_gem_object_funcs drm_gem_sh=
mem_funcs =3D {
> > >  	.pin =3D drm_gem_shmem_object_pin,
> > >  	.unpin =3D drm_gem_shmem_object_unpin,
> > >  	.get_sg_table =3D drm_gem_shmem_object_get_sg_table,
> > > -	.vmap =3D drm_gem_shmem_object_vmap,
> > > -	.vunmap =3D drm_gem_shmem_object_vunmap,
> > > +	.vmap =3D drm_gem_shmem_object_vmap_locked,
> > > +	.vunmap =3D drm_gem_shmem_object_vunmap_locked, =20
> >=20
> > While I think we should indeed be consistent with the names, I would
> > also expect helpers to get the locking right by default.
>=20
> Wait, actually I think this patch does what you suggest already. The
> _locked() prefix tells the caller: "you should take care of the locking,
> I expect the lock to be held when this is hook/function is called". So
> helpers without the _locked() prefix take care of the locking (which I
> guess matches your 'helpers get the locking right' expectation), and
> those with the _locked() prefix don't.

What I meant by "getting the locking right" is indeed a bit ambiguous,
sorry. What I'm trying to say I guess is that, in this particular case,
I don't think you can expect the vmap implementation to be called with
or without the locks held. The doc for that function will say that it's
either one or the other, but not both.

So helpers should follow what is needed to provide a default vmap/vunmap
implementation, including what locking is expected from a vmap/vunmap
implementation.

If that means that vmap is always called with the locks taken, then
drm_gem_shmem_object_vmap can just assume that it will be called with
the locks taken and there's no need to mention it in the name (and you
can probably sprinkle a couple of lockdep assertion to make sure the
locking is indeed consistent).

> > I'm not sure how reasonable it is, but I think I'd prefer to turn this
> > around and keep the drm_gem_shmem_object_vmap/unmap helpers name, and
> > convert whatever function needs to be converted to the unlock suffix so
> > we get a consistent naming.
>=20
> That would be an _unlocked() prefix if we do it the other way around. I
> think the main confusion comes from the names of the hooks in
> drm_gem_shmem_funcs. Some of them, like drm_gem_shmem_funcs::v[un]map()
> are called with the GEM resv lock held, and locking is handled by the
> core, others, like drm_gem_shmem_funcs::[un]pin() are called
> without the GEM resv lock held, and locking is deferred to the
> implementation. As I said, I don't mind prefixing hooks/helpers with
> _unlocked() for those that take care of the locking, and no prefix for
> those that expects locks to be held, as long as it's consistent, but I
> just wanted to make sure we're on the same page :-).

What about _nolock then? It's the same number of characters than
_locked, plus it expresses what the function is (not) doing, not what
context it's supposed to be called in?

Maxime

--4o4oj77z6epqtcan
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWXLogAKCRDj7w1vZxhR
xdPLAP0bk4jcd19Kcw1HVEeKM+/ZsKBusXZ3qgtT2fHoMh5QUQEAsOV0Jvb2c6uk
6hLo3uAZKWG2e93N+kwfw1XjMKiwpQA=
=DFKK
-----END PGP SIGNATURE-----

--4o4oj77z6epqtcan--
