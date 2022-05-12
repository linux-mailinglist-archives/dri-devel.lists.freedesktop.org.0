Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7A2524A87
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 12:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC7310F9B8;
	Thu, 12 May 2022 10:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811C710F9B8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 10:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E84urkSIOf6JVC8hOPNI8ogw1zP0zB46eo/3bX5ZbMU=; b=p/7mU6Z686ScXn6rfddHSXLjqN
 6FRVP/XcXiIegHlIMQhperKOaaHa8KRqNtBXqoB3kIXFnx0L+E4juzJUfo8UCPnhEgVzGKNQ83Flw
 POTg8/Lu+FE6SI8D8wlJlroiHK+mNfJ1XwsF2FryGe/kWGlQ7OQMZUnkrnhAV0aqEr5FGGvjUZNdO
 HTMCrGrDPUQ2MqDE37SxSIMypGTRkRNL7+FnjUK2L1SR7Jx6zj5zLxL5O/rGdYO8lghrVh18dpKvv
 m9PuW6W++Tj9OuRaAz/tga9uxptskuywpUidxCQoOD9EZHlOMcWftMYuT2on/JASlaKxyxg4LJDXx
 aYNg2tpA==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1np6Jm-0008Ic-Jd; Thu, 12 May 2022 12:45:14 +0200
Date: Thu, 12 May 2022 09:44:42 -0100
From: Melissa Wen <mwen@igalia.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 13/14] drm/vc4: crtc: Fix out of order frames during
 asynchronous page flips
Message-ID: <20220512104442.4n7g3nq622wzknmr@mail.igalia.com>
References: <20220503121341.983842-1-maxime@cerno.tech>
 <20220503121341.983842-14-maxime@cerno.tech>
 <20220509171005.lx3pqifg3s4e7nkj@mail.igalia.com>
 <20220509171442.svodrkdp4zjsat57@mail.igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fgmhborqw5qaz7z2"
Content-Disposition: inline
In-Reply-To: <20220509171442.svodrkdp4zjsat57@mail.igalia.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fgmhborqw5qaz7z2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05/09, Melissa Wen wrote:
> O 05/09, Melissa Wen wrote:
> > On 05/03, Maxime Ripard wrote:
> > > When doing an asynchronous page flip (PAGE_FLIP ioctl with the
> > > DRM_MODE_PAGE_FLIP_ASYNC flag set), the current code waits for the
> > > possible GPU buffer being rendered through a call to
> > > vc4_queue_seqno_cb().
> > >=20
> > > On the BCM2835-37, the GPU driver is part of the vc4 driver and that
> > > function is defined in vc4_gem.c to wait for the buffer to be rendere=
d,
> > > and once it's done, call a callback.
> > >=20
> > > However, on the BCM2711 used on the RaspberryPi4, the GPU driver is
> > > separate (v3d) and that function won't do anything. This was working
> > > because we were going into a path, due to uninitialized variables, th=
at
> > > was always scheduling the callback.
> > >=20
> > > However, we were never actually waiting for the buffer to be rendered
> > > which was resulting in frames being displayed out of order.
> > >=20
> > > The generic API to signal those kind of completion in the kernel are =
the
> > > DMA fences, and fortunately the v3d drivers supports them and signal
> > > when its job is done. That API also provides an equivalent function t=
hat
> > > allows to have a callback being executed when the fence is signalled =
as
> > > done.
> > >=20
> > > Let's change our driver a bit to rely on the previous function for the
> > > older SoCs, and on DMA fences for the BCM2711.
> > >=20
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > >  drivers/gpu/drm/vc4/vc4_crtc.c | 41 ++++++++++++++++++++++++++++++++=
--
> > >  1 file changed, 39 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4=
_crtc.c
> > > index e0ae7bef08fa..8e1369fca937 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> > > @@ -776,6 +776,7 @@ struct vc4_async_flip_state {
> > >  	struct drm_pending_vblank_event *event;
> > > =20
> > >  	union {
> > > +		struct dma_fence_cb fence;
> > >  		struct vc4_seqno_cb seqno;
> > >  	} cb;
> > >  };
> > > @@ -835,6 +836,43 @@ static void vc4_async_page_flip_seqno_complete(s=
truct vc4_seqno_cb *cb)
> > >  		vc4_bo_dec_usecnt(bo);
> > >  }
> > > =20
> > > +static void vc4_async_page_flip_fence_complete(struct dma_fence *fen=
ce,
> > > +					       struct dma_fence_cb *cb)
> > > +{
> > > +	struct vc4_async_flip_state *flip_state =3D
> > > +		container_of(cb, struct vc4_async_flip_state, cb.fence);
> > > +
> > > +	vc4_async_page_flip_complete(flip_state);
> > > +	dma_fence_put(fence);
> > > +}
> > > +
> > > +static int vc4_async_set_fence_cb(struct drm_device *dev,
> > > +				  struct vc4_async_flip_state *flip_state)
> > > +{
> > > +	struct drm_framebuffer *fb =3D flip_state->fb;
> > > +	struct drm_gem_cma_object *cma_bo =3D drm_fb_cma_get_gem_obj(fb, 0);
> > > +	struct vc4_dev *vc4 =3D to_vc4_dev(dev);
> > > +	struct dma_fence *fence;
> > > +	int ret;
> > > +
> > > +	if (!vc4->is_vc5) {
> > > +		struct vc4_bo *bo =3D to_vc4_bo(&cma_bo->base);
> > > +
> > > +		return vc4_queue_seqno_cb(dev, &flip_state->cb.seqno, bo->seqno,
> > > +					  vc4_async_page_flip_seqno_complete);
> > > +	}
> > > +
> > > +	ret =3D dma_resv_get_singleton(cma_bo->base.resv, false, &fence);
> + for kernel bot complaint, I replaced false with `DMA_RESV_USAGE_READ`
> to run some tests
>=20
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	if (dma_fence_add_callback(fence, &flip_state->cb.fence,
me again :)

I was thinking if we should add a check here for !fence and just complete t=
he page flip,
instead of letting `dma_fence_add_callback` warns whenever fence is NULL.
I think there are situation in which fence is NULL and it is not an
issue, right? Does it make sense?

> > > +				   vc4_async_page_flip_fence_complete))
> > > +		vc4_async_page_flip_fence_complete(fence, &flip_state->cb.fence);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int
> > >  vc4_async_page_flip_common(struct drm_crtc *crtc,
> > >  			   struct drm_framebuffer *fb,
> > > @@ -874,8 +912,7 @@ vc4_async_page_flip_common(struct drm_crtc *crtc,
> > >  	 */
> > >  	drm_atomic_set_fb_for_plane(plane->state, fb);
> > > =20
> > > -	vc4_queue_seqno_cb(dev, &flip_state->cb.seqno, bo->seqno,
> > > -			   vc4_async_page_flip_seqno_complete);
> > > +	vc4_async_set_fence_cb(dev, flip_state);
> >=20
> > I tried to run igt kms_async_flip, but the test still seems very tied to
> > the i915 driver. So, as far as I could check, I didn't see any red
> > flags and sync page flip behaviour seems preserved.
> >=20
> > > =20
> > >  	/* Driver takes ownership of state on successful async commit. */
> > >  	return 0;
> > > --=20
> > > 2.35.1
> > >=20
>=20
>=20



--fgmhborqw5qaz7z2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmJ85RUACgkQwqF3j0dL
ehy2fg//cEF+S/4zFNIoq/s35YYZPlcy7eq45bm1H75clYr/kZwnTSaKfJSMgMlK
T3kJuTJqK+drqy7ZwCaJ+DoZLqSRHSpE/4z21HJGeYnv/Zj5gEsM+qtcNSDsB0g+
LROY1AiuYoSRb/wCJXYBOU1q0DJ8PpRqLNL9YX2DaZ0zC5Rjef23Axo18aXLW7AU
K3e6kWpd7cSa6TQ8T7uTZdv0I3AFPiTsFQJETqnQEu7VR/HSQXzTufUpwJ34f+/V
LwOm92F4ydTVEs0lU45tDh4/hRnNgl3djLzeOK/2YOn9LyQ7DrU0WIyEy9ZGpjlk
TQ/9NTFoyvi86XU6Dt/kayM7GAmrpoZPoYGtgHBIu1d7SywRiLOkSoBL2/D1GWyI
iIOKrhEhi8LKeFy8bbBjwKRXdHy1LzMwhrhw51VwbLy+DHS63Cald2hCQ2K4MuK8
JtP4KtT5mXHlY7I8reg0xt+1CaU44N53Z8bxKFE5pOGBnHMwAb69+ZPHJ/LlLKDP
tZgn54a4hlSp1fY4AYMgocHtxIeNR78udcx9qaMYyIv25JCOPKP5gS1a94JoQv8r
jcC8peTX5oBvJzl3uQo8sfhDivdTk9k/tjeSL3m70Tio6H1kBjR1r4CidWCEao7j
n2TC5dlODV43Oz5w1fIKiBj3qAzjbqZZmVN4uzCyhD7zPSgkJFE=
=fl/z
-----END PGP SIGNATURE-----

--fgmhborqw5qaz7z2--
