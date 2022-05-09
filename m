Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3EB52035E
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 19:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383E010F4E1;
	Mon,  9 May 2022 17:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9AC010F4E1
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 17:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lrDhWX3AO646QgK4WC9IiQ0JM8Ox4+ZuGmJmMv9G5ms=; b=stmLjDCT7RkcmxPLeVOzY3ukwW
 XFF6m2iSqVpTYRpYEAtPvmYd5CQpngrWGSXfcAzoyzO/2aMoDTFp3JOoNMgI2nVODfvBr0s19eiZn
 jLb1xZeuqeCmpTW4yXSiJzbXsseCEPqLiToauVhRee+ypxFszPx0z1lDwfsAXRA+qh2rHJ+qhncb4
 DejYDLPD63MXE4HMwq8pSNGiNG2VLJP0vnAaVPGuxGparg6MbZp2vcUXZUwvVMb33EGwg1Mlg8SqI
 g6fTrZ81oMPSxVeujPRK3jdNXs6edexXQOiiFQO+1GM5t1Bj8lzqBL3k0DJWlNuj3DCK2bwHgoZUF
 HTWz83sg==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1no6yh-000C0I-1K; Mon, 09 May 2022 19:15:23 +0200
Date: Mon, 9 May 2022 16:15:11 -0100
From: Melissa Wen <mwen@igalia.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 13/14] drm/vc4: crtc: Fix out of order frames during
 asynchronous page flips
Message-ID: <20220509171442.svodrkdp4zjsat57@mail.igalia.com>
References: <20220503121341.983842-1-maxime@cerno.tech>
 <20220503121341.983842-14-maxime@cerno.tech>
 <20220509171005.lx3pqifg3s4e7nkj@mail.igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sziq2osjkrxubslc"
Content-Disposition: inline
In-Reply-To: <20220509171005.lx3pqifg3s4e7nkj@mail.igalia.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--sziq2osjkrxubslc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

O 05/09, Melissa Wen wrote:
> On 05/03, Maxime Ripard wrote:
> > When doing an asynchronous page flip (PAGE_FLIP ioctl with the
> > DRM_MODE_PAGE_FLIP_ASYNC flag set), the current code waits for the
> > possible GPU buffer being rendered through a call to
> > vc4_queue_seqno_cb().
> >=20
> > On the BCM2835-37, the GPU driver is part of the vc4 driver and that
> > function is defined in vc4_gem.c to wait for the buffer to be rendered,
> > and once it's done, call a callback.
> >=20
> > However, on the BCM2711 used on the RaspberryPi4, the GPU driver is
> > separate (v3d) and that function won't do anything. This was working
> > because we were going into a path, due to uninitialized variables, that
> > was always scheduling the callback.
> >=20
> > However, we were never actually waiting for the buffer to be rendered
> > which was resulting in frames being displayed out of order.
> >=20
> > The generic API to signal those kind of completion in the kernel are the
> > DMA fences, and fortunately the v3d drivers supports them and signal
> > when its job is done. That API also provides an equivalent function that
> > allows to have a callback being executed when the fence is signalled as
> > done.
> >=20
> > Let's change our driver a bit to rely on the previous function for the
> > older SoCs, and on DMA fences for the BCM2711.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/vc4/vc4_crtc.c | 41 ++++++++++++++++++++++++++++++++--
> >  1 file changed, 39 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_c=
rtc.c
> > index e0ae7bef08fa..8e1369fca937 100644
> > --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> > +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> > @@ -776,6 +776,7 @@ struct vc4_async_flip_state {
> >  	struct drm_pending_vblank_event *event;
> > =20
> >  	union {
> > +		struct dma_fence_cb fence;
> >  		struct vc4_seqno_cb seqno;
> >  	} cb;
> >  };
> > @@ -835,6 +836,43 @@ static void vc4_async_page_flip_seqno_complete(str=
uct vc4_seqno_cb *cb)
> >  		vc4_bo_dec_usecnt(bo);
> >  }
> > =20
> > +static void vc4_async_page_flip_fence_complete(struct dma_fence *fence,
> > +					       struct dma_fence_cb *cb)
> > +{
> > +	struct vc4_async_flip_state *flip_state =3D
> > +		container_of(cb, struct vc4_async_flip_state, cb.fence);
> > +
> > +	vc4_async_page_flip_complete(flip_state);
> > +	dma_fence_put(fence);
> > +}
> > +
> > +static int vc4_async_set_fence_cb(struct drm_device *dev,
> > +				  struct vc4_async_flip_state *flip_state)
> > +{
> > +	struct drm_framebuffer *fb =3D flip_state->fb;
> > +	struct drm_gem_cma_object *cma_bo =3D drm_fb_cma_get_gem_obj(fb, 0);
> > +	struct vc4_dev *vc4 =3D to_vc4_dev(dev);
> > +	struct dma_fence *fence;
> > +	int ret;
> > +
> > +	if (!vc4->is_vc5) {
> > +		struct vc4_bo *bo =3D to_vc4_bo(&cma_bo->base);
> > +
> > +		return vc4_queue_seqno_cb(dev, &flip_state->cb.seqno, bo->seqno,
> > +					  vc4_async_page_flip_seqno_complete);
> > +	}
> > +
> > +	ret =3D dma_resv_get_singleton(cma_bo->base.resv, false, &fence);
+ for kernel bot complaint, I replaced false with `DMA_RESV_USAGE_READ`
to run some tests

> > +	if (ret)
> > +		return ret;
> > +
> > +	if (dma_fence_add_callback(fence, &flip_state->cb.fence,
> > +				   vc4_async_page_flip_fence_complete))
> > +		vc4_async_page_flip_fence_complete(fence, &flip_state->cb.fence);
> > +
> > +	return 0;
> > +}
> > +
> >  static int
> >  vc4_async_page_flip_common(struct drm_crtc *crtc,
> >  			   struct drm_framebuffer *fb,
> > @@ -874,8 +912,7 @@ vc4_async_page_flip_common(struct drm_crtc *crtc,
> >  	 */
> >  	drm_atomic_set_fb_for_plane(plane->state, fb);
> > =20
> > -	vc4_queue_seqno_cb(dev, &flip_state->cb.seqno, bo->seqno,
> > -			   vc4_async_page_flip_seqno_complete);
> > +	vc4_async_set_fence_cb(dev, flip_state);
>=20
> I tried to run igt kms_async_flip, but the test still seems very tied to
> the i915 driver. So, as far as I could check, I didn't see any red
> flags and sync page flip behaviour seems preserved.
>=20
> > =20
> >  	/* Driver takes ownership of state on successful async commit. */
> >  	return 0;
> > --=20
> > 2.35.1
> >=20



--sziq2osjkrxubslc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmJ5TB8ACgkQwqF3j0dL
ehyrtA//dq0ETuekuCu+FtjVqUVEZ37t5qL+Yl1LJvkM0M//FVjwUs8vpWZPB+AV
oiczxapmojMt1tGLFprQfGNzsmzdCeu8befav3JxMBSK1VT1Z0LeOR1SAvlKSr0F
BhQTVISPOZYZyuMcbE5rzIl4uzxDKYOvBp9JPa0uUUamR3vP40xdAE05gA/Xwygx
ATZOtxaZQu/Chap97QW3DXgGOdEzPMBBwPjmsw7VXa8etJkjvNZpJyzd9stQYlcn
h4BTgl+im+xJAkPkafoy5HULZMdQjnAKy5KxtUs0Ykr+q+U7nYQiiPr/rAeLegN9
ZfyaWGZfk0o76Z/vo8BSn+7oJgkBGJ5heYzgHWpu3YzD17hTjVs5j9C6Jv0/5vFL
awohuTsdeyQErzZDOOO/jKT/3DeR6T1mXSXs7JqozyTwXqAZtg3aqF+fOzRLDHiU
ZJMutV/xzbmpgbGERIoL9vtwwnc2ZCSD8FPg+HteGwF5b9Liis51aqmul8/CaZ19
lZfY5GADFKdrpy+yblVJwUZ4Stz4dyMMx8/AMJ1oTKKH3t0lZqq82vctISE6r2ty
C2xA9GqikxdMLhGCGZqwHRgP+g3FL4B/s3G0r+1MbxqN5yCfGXIm6wKyTKix2h98
WZSDJAEELypRcdvPdokZIItF0e3uHT55SbxeHlq1AruShuFdvOs=
=1xj3
-----END PGP SIGNATURE-----

--sziq2osjkrxubslc--
