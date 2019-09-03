Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E25A68DC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 14:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CC689330;
	Tue,  3 Sep 2019 12:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CD689322;
 Tue,  3 Sep 2019 12:46:50 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id m11so3556481ioo.0;
 Tue, 03 Sep 2019 05:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VSPFb100h3Uik0xz8yit5XxDmhLyTgBC0DSlIATmpbs=;
 b=Dpf60uJsh7/HsjcmkY8FxZ7+WTym2vrBNnuBZbFsyV4DDGifZLJ1rPKnxodw3VXBUe
 /Aoq7Wo1ZO3vG9x4nmh/zbOm8hmYeJk5mdIkacvEkxW3IMY0TDa13nCFcM2uATqoFB41
 m2gafjxZpb2OGjlncTbHgJcE9ILx08qRosxkusM8+HBet1ThLP402Q2HR+lXXim/oV1k
 N5qXs8i0rhz4I8o38Xno+jWe69PBIdqvBfcUI9YgLdlPm6BLHszMkSyAq3CXOjLrb1uW
 22vVMGMzm3Knhm9ZGK/OPlbE3w+flDnYUlQ+VAGSXpah0fq/k3PQxCpQm8RfHgz6ygG9
 D0AA==
X-Gm-Message-State: APjAAAWcSzDHZOnMf8ApX6rujCuPIe5KUv8cz9OnxA+BSsfLrvil7Elg
 F+gJ14Gx0DR4zjQgJiZQso8=
X-Google-Smtp-Source: APXvYqwtrTZ3qyIkIsCcVVlQQdv3pmvyIdzeSwyLvBwqQCIa/B5qwiK0H7blaZqufZ32/EhCuQQprA==
X-Received: by 2002:a5e:930b:: with SMTP id k11mr168121iom.2.1567514804539;
 Tue, 03 Sep 2019 05:46:44 -0700 (PDT)
Received: from smtp.gmail.com ([165.204.55.250])
 by smtp.gmail.com with ESMTPSA id k9sm17460404ioa.10.2019.09.03.05.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 05:46:43 -0700 (PDT)
Date: Tue, 3 Sep 2019 08:47:03 -0400
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/vblank: Document and fix vblank count barrier
 semantics
Message-ID: <20190903124703.7ldnm6owxu6r2fsm@smtp.gmail.com>
References: <20190719170654.GQ5942@intel.com>
 <20190723131337.22031-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20190723131337.22031-1-daniel.vetter@ffwll.ch>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VSPFb100h3Uik0xz8yit5XxDmhLyTgBC0DSlIATmpbs=;
 b=pxhl48krsVYx/AkrWS5pl5F4qbLCr1kbRtFa39nwTmj3vAFhJnpzm06W5G9sVtnhjf
 KbB0jyrslZXp5RXAhXdcutYHy2/LMyt8L/9oqSLXTYXJ7SoniR/9vuVL6hgLuDnih3VB
 hCgeKjcwHLPU+kOiaQe0RN2fY55RLYDOuELrzEKGPky9QQp5cKWmYKdE6TgBmGxxyk7b
 ecp3TXk78dYD7vbwnXAuyEz9KtpOcJ5uhtzGfda3EINNudyJEcJi1UdYHv0/La9aK3n5
 gasud8xY9kUmt6JL1Mdp86VlNc3h6flnX/iYWFMQm7yB5GCIvTagV2gGymEPbsXqO8b6
 tdow==
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
Cc: Keith Packard <keithp@keithp.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============0991039415=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0991039415==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yfx3lcbhzheddqdc"
Content-Disposition: inline


--yfx3lcbhzheddqdc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

All the series look really good for me. I just have some few questions
here.

On 07/23, Daniel Vetter wrote:
> Noticed while reviewing code. I'm not sure whether this might or might
> not explain some of the missed vblank hilarity we've been seeing. I

I have to admit that I'm a little bit confused about the "missed vblank
hilarity we've been seeing". Could you elaborate a little bit more about
this problem in the commit message?

Additionally, how about break this commit in two? One dedicated to the barr=
iers
and the atomic64, and the other related to the documentation?

> think those all go through the vblank completion event, which has
> unconditional barriers - it always takes the spinlock. Therefore no
> cc stable.
>=20
> v2:
> - Barrriers are hard, put them in in the right order (Chris).
> - Improve the comments a bit.
>=20
> v3:
>=20
> Ville noticed that on 32bit we might be breaking up the load/stores,
> now that the vblank counter has been switched over to be 64 bit. Fix
> that up by switching to atomic64_t. This this happens so rarely in
> practice I figured no need to cc: stable ...
>=20
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Keith Packard <keithp@keithp.com>
> References: 570e86963a51 ("drm: Widen vblank count to 64-bits [v3]")
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_vblank.c | 45 ++++++++++++++++++++++++++++++++----
>  include/drm/drm_vblank.h     | 15 ++++++++++--
>  2 files changed, 54 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 603ab105125d..03e37bceac9c 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -107,7 +107,7 @@ static void store_vblank(struct drm_device *dev, unsi=
gned int pipe,
> =20
>  	write_seqlock(&vblank->seqlock);
>  	vblank->time =3D t_vblank;
> -	vblank->count +=3D vblank_count_inc;
> +	atomic64_add(vblank_count_inc, &vblank->count);
>  	write_sequnlock(&vblank->seqlock);
>  }
> =20
> @@ -273,7 +273,8 @@ static void drm_update_vblank_count(struct drm_device=
 *dev, unsigned int pipe,
> =20
>  	DRM_DEBUG_VBL("updating vblank count on crtc %u:"
>  		      " current=3D%llu, diff=3D%u, hw=3D%u hw_last=3D%u\n",
> -		      pipe, vblank->count, diff, cur_vblank, vblank->last);
> +		      pipe, atomic64_read(&vblank->count), diff,
> +		      cur_vblank, vblank->last);
> =20
>  	if (diff =3D=3D 0) {
>  		WARN_ON_ONCE(cur_vblank !=3D vblank->last);
> @@ -295,11 +296,23 @@ static void drm_update_vblank_count(struct drm_devi=
ce *dev, unsigned int pipe,
>  static u64 drm_vblank_count(struct drm_device *dev, unsigned int pipe)
>  {
>  	struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> +	u64 count;
> =20
>  	if (WARN_ON(pipe >=3D dev->num_crtcs))
>  		return 0;
> =20
> -	return vblank->count;
> +	count =3D atomic64_read(&vblank->count);
> +
> +	/*
> +	 * This read barrier corresponds to the implicit write barrier of the
> +	 * write seqlock in store_vblank(). Note that this is the only place
> +	 * where we need an explicit barrier, since all other access goes
> +	 * through drm_vblank_count_and_time(), which already has the required
> +	 * read barrier curtesy of the read seqlock.
> +	 */
> +	smp_rmb();

I think I did not get all the idea behind the smp_rmb() in this function. F=
WIU,
smp_xxx are used for preventing race conditions in a multiprocessor system,
right? In this sense, I can presume that this change can bring benefits for
VKMS or any other virtual driver; on the other hand, this will not bring any
advantage on real drivers like i915 and amdgpu since these devices are not
related with smp stuff, right?

Thanks

> +
> +	return count;
>  }
> =20
>  /**
> @@ -764,6 +777,14 @@ drm_get_last_vbltimestamp(struct drm_device *dev, un=
signed int pipe,
>   * vblank interrupt (since it only reports the software vblank counter),=
 see
>   * drm_crtc_accurate_vblank_count() for such use-cases.
>   *
> + * Note that for a given vblank counter value drm_crtc_handle_vblank()
> + * and drm_crtc_vblank_count() or drm_crtc_vblank_count_and_time()
> + * provide a barrier: Any writes done before calling
> + * drm_crtc_handle_vblank() will be visible to callers of the later
> + * functions, iff the vblank count is the same or a later one.
> + *
> + * See also &drm_vblank_crtc.count.
> + *
>   * Returns:
>   * The software vblank counter.
>   */
> @@ -801,7 +822,7 @@ static u64 drm_vblank_count_and_time(struct drm_devic=
e *dev, unsigned int pipe,
> =20
>  	do {
>  		seq =3D read_seqbegin(&vblank->seqlock);
> -		vblank_count =3D vblank->count;
> +		vblank_count =3D atomic64_read(&vblank->count);
>  		*vblanktime =3D vblank->time;
>  	} while (read_seqretry(&vblank->seqlock, seq));
> =20
> @@ -818,6 +839,14 @@ static u64 drm_vblank_count_and_time(struct drm_devi=
ce *dev, unsigned int pipe,
>   * vblank events since the system was booted, including lost events due =
to
>   * modesetting activity. Returns corresponding system timestamp of the t=
ime
>   * of the vblank interval that corresponds to the current vblank counter=
 value.
> + *
> + * Note that for a given vblank counter value drm_crtc_handle_vblank()
> + * and drm_crtc_vblank_count() or drm_crtc_vblank_count_and_time()
> + * provide a barrier: Any writes done before calling
> + * drm_crtc_handle_vblank() will be visible to callers of the later
> + * functions, iff the vblank count is the same or a later one.
> + *
> + * See also &drm_vblank_crtc.count.
>   */
>  u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
>  				   ktime_t *vblanktime)
> @@ -1791,6 +1820,14 @@ EXPORT_SYMBOL(drm_handle_vblank);
>   *
>   * This is the native KMS version of drm_handle_vblank().
>   *
> + * Note that for a given vblank counter value drm_crtc_handle_vblank()
> + * and drm_crtc_vblank_count() or drm_crtc_vblank_count_and_time()
> + * provide a barrier: Any writes done before calling
> + * drm_crtc_handle_vblank() will be visible to callers of the later
> + * functions, iff the vblank count is the same or a later one.
> + *
> + * See also &drm_vblank_crtc.count.
> + *
>   * Returns:
>   * True if the event was successfully handled, false on failure.
>   */
> diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> index 9fe4ba8bc622..c16c44052b3d 100644
> --- a/include/drm/drm_vblank.h
> +++ b/include/drm/drm_vblank.h
> @@ -109,9 +109,20 @@ struct drm_vblank_crtc {
>  	seqlock_t seqlock;
> =20
>  	/**
> -	 * @count: Current software vblank counter.
> +	 * @count:
> +	 *
> +	 * Current software vblank counter.
> +	 *
> +	 * Note that for a given vblank counter value drm_crtc_handle_vblank()
> +	 * and drm_crtc_vblank_count() or drm_crtc_vblank_count_and_time()
> +	 * provide a barrier: Any writes done before calling
> +	 * drm_crtc_handle_vblank() will be visible to callers of the later
> +	 * functions, iff the vblank count is the same or a later one.
> +	 *
> +	 * IMPORTANT: This guarantee requires barriers, therefor never access
> +	 * this field directly. Use drm_crtc_vblank_count() instead.
>  	 */
> -	u64 count;
> +	atomic64_t count;
>  	/**
>  	 * @time: Vblank timestamp corresponding to @count.
>  	 */
> --=20
> 2.22.0
>=20

--=20
Rodrigo Siqueira
Software Engineer, Advanced Micro Devices (AMD)
https://siqueira.tech

--yfx3lcbhzheddqdc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl1uYMcACgkQWJzP/com
vP+Pqg/9HyJHKu3KqehS8aHMOyZVaBlC9l3KyRBpt9MNy17YPH+W+F6exQtXQFyb
iyf0O2n2lVVqoxMADxNJooIpvr2XtRubWGTThyPcNQxEYLrRO0auYbU/8QLpenyO
PiA+673J1TBypMi/aplZpSPW0GMW2yx6lrhpA18lIjCFaI2Ie8j/fgXcM0XnamWT
hjzx4TloxcyzmpzK1WvkxNpvnwbiMBDb+l7DgXZkYJu5FocAmmPzbjAwgRQji2eK
FXu/s4/m3S03wOfO+XcKbO6EqZNph5cnReNs+eCMgk2Th7+9KHZSvclo9Ty3X9jX
bSUXI8l7ejlyBMofyxCUgAvU3uD9XnfjvvkAtmdJXSSxqNSgxRXZNQK6FwdhxgpG
vNnEU7gF6HGmuZpNTyEX53LIIC5NBM4Wq0vZKTiPXm2sIEqmb6ZvltmhCcyltCjB
zSfACmUiO0sFv1R/+16we9tyeTID5+gfiutBajBe/+IOBegnVtpw1rCkP8bbweEP
MfbckXN1vGXYksjNdDw32dT0Avlync+lT/z4bpOEr5XeiZ6Ua7eDzi/fbGahcmef
G1963xCMoynRyOIcuC8+hkT0IHkAQJounHSEpjoegz4OX2q0781aiTqKE2DsroOO
Lm6dT0VTn7x1D+iYjw/xnKcV5Iw7QnbiQE1aZqtHcTy8ekglC2o=
=UUeP
-----END PGP SIGNATURE-----

--yfx3lcbhzheddqdc--

--===============0991039415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0991039415==--
