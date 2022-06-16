Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBF454DD58
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 10:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076B4113AE4;
	Thu, 16 Jun 2022 08:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B67113ADC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 08:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eF7aVLcwkoVbUdFvllvVbAHGriYpxEUO1ljGZuVut6w=; b=jJmsJ0eTyLzueDW0Fj2Oxmxsqr
 kaBxIntQlhzctKlMy2u8UM/Yc2vHXmB4K5VvOyz62MnoDMq08BF9DRj3EnaN09V0T/TosYTviC+8A
 tQGE3fORv572oRCsmsL91RWWhgpjbyIX/ForO8wbYqyxk8dfrL8fHwG43SIJ8PjSpQDov76rp7zon
 GRC5Pdt/fg07r4WqaoS9IeiAliI3wF8b4yNPxJzt6XOb/f/pNXkN6+nsr73884HBAs2Y1A5JOwsTH
 UMMSSMt9AMUuq0rRHySFg7zQrQ+S0RuneVCVr8R9gJ/0L7K43rj9HqnMn8jMsfVQXdjayMCkpON3l
 mxYHyQtA==;
Received: from 180.red-81-39-194.dynamicip.rima-tde.net ([81.39.194.180]
 helo=mail.igalia.com) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1o1lAu-002tuP-St; Thu, 16 Jun 2022 10:48:24 +0200
Date: Thu, 16 Jun 2022 07:48:02 -0100
From: Melissa Wen <mwen@igalia.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 13/14] drm/vc4: crtc: Fix out of order frames during
 asynchronous page flips
Message-ID: <20220616084802.4qw5mjk7bqpkygyn@mail.igalia.com>
References: <20220610115149.964394-1-maxime@cerno.tech>
 <20220610115149.964394-14-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wt6zy3wenv6iuvce"
Content-Disposition: inline
In-Reply-To: <20220610115149.964394-14-maxime@cerno.tech>
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


--wt6zy3wenv6iuvce
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/10, Maxime Ripard wrote:
> When doing an asynchronous page flip (PAGE_FLIP ioctl with the
> DRM_MODE_PAGE_FLIP_ASYNC flag set), the current code waits for the
> possible GPU buffer being rendered through a call to
> vc4_queue_seqno_cb().
>=20
> On the BCM2835-37, the GPU driver is part of the vc4 driver and that
> function is defined in vc4_gem.c to wait for the buffer to be rendered,
> and once it's done, call a callback.
>=20
> However, on the BCM2711 used on the RaspberryPi4, the GPU driver is
> separate (v3d) and that function won't do anything. This was working
> because we were going into a path, due to uninitialized variables, that
> was always scheduling the callback.
>=20
> However, we were never actually waiting for the buffer to be rendered
> which was resulting in frames being displayed out of order.
>=20
> The generic API to signal those kind of completion in the kernel are the
> DMA fences, and fortunately the v3d drivers supports them and signal
> when its job is done. That API also provides an equivalent function that
> allows to have a callback being executed when the fence is signalled as
> done.
>=20
> Let's change our driver a bit to rely on the previous function for the
> older SoCs, and on DMA fences for the BCM2711.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 50 +++++++++++++++++++++++++++++++---
>  1 file changed, 46 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crt=
c.c
> index a3c04d6cbd20..9355213dc883 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -776,6 +776,7 @@ struct vc4_async_flip_state {
>  	struct drm_pending_vblank_event *event;
> =20
>  	union {
> +		struct dma_fence_cb fence;
>  		struct vc4_seqno_cb seqno;
>  	} cb;
>  };
> @@ -835,6 +836,50 @@ static void vc4_async_page_flip_seqno_complete(struc=
t vc4_seqno_cb *cb)
>  		vc4_bo_dec_usecnt(bo);
>  }
> =20
> +static void vc4_async_page_flip_fence_complete(struct dma_fence *fence,
> +					       struct dma_fence_cb *cb)
> +{
> +	struct vc4_async_flip_state *flip_state =3D
> +		container_of(cb, struct vc4_async_flip_state, cb.fence);
> +
> +	vc4_async_page_flip_complete(flip_state);
> +	dma_fence_put(fence);
> +}
> +
> +static int vc4_async_set_fence_cb(struct drm_device *dev,
> +				  struct vc4_async_flip_state *flip_state)
> +{
> +	struct drm_framebuffer *fb =3D flip_state->fb;
> +	struct drm_gem_cma_object *cma_bo =3D drm_fb_cma_get_gem_obj(fb, 0);
> +	struct vc4_dev *vc4 =3D to_vc4_dev(dev);
> +	struct dma_fence *fence;
> +	int ret;
> +
> +	if (!vc4->is_vc5) {
> +		struct vc4_bo *bo =3D to_vc4_bo(&cma_bo->base);
> +
> +		return vc4_queue_seqno_cb(dev, &flip_state->cb.seqno, bo->seqno,
> +					  vc4_async_page_flip_seqno_complete);
> +	}
> +
> +	ret =3D dma_resv_get_singleton(cma_bo->base.resv, DMA_RESV_USAGE_READ, =
&fence);
> +	if (ret)
> +		return ret;
> +
> +	/* If there's no fence, complete the page flip immediately */
> +	if (!fence) {
> +		vc4_async_page_flip_fence_complete(fence, &flip_state->cb.fence);
> +		return 0;
> +	}
Hi,

this change lgtm.

Reviewed-by: Melissa Wen <mwen@igalia.com>

Thanks
> +
> +	/* If the fence has already been completed, complete the page flip */
> +	if (dma_fence_add_callback(fence, &flip_state->cb.fence,
> +				   vc4_async_page_flip_fence_complete))
> +		vc4_async_page_flip_fence_complete(fence, &flip_state->cb.fence);
> +
> +	return 0;
> +}
> +
>  static int
>  vc4_async_page_flip_common(struct drm_crtc *crtc,
>  			   struct drm_framebuffer *fb,
> @@ -844,8 +889,6 @@ vc4_async_page_flip_common(struct drm_crtc *crtc,
>  	struct drm_device *dev =3D crtc->dev;
>  	struct drm_plane *plane =3D crtc->primary;
>  	struct vc4_async_flip_state *flip_state;
> -	struct drm_gem_cma_object *cma_bo =3D drm_fb_cma_get_gem_obj(fb, 0);
> -	struct vc4_bo *bo =3D to_vc4_bo(&cma_bo->base);
> =20
>  	flip_state =3D kzalloc(sizeof(*flip_state), GFP_KERNEL);
>  	if (!flip_state)
> @@ -876,8 +919,7 @@ vc4_async_page_flip_common(struct drm_crtc *crtc,
>  	 */
>  	drm_atomic_set_fb_for_plane(plane->state, fb);
> =20
> -	vc4_queue_seqno_cb(dev, &flip_state->cb.seqno, bo->seqno,
> -			   vc4_async_page_flip_seqno_complete);
> +	vc4_async_set_fence_cb(dev, flip_state);
> =20
>  	/* Driver takes ownership of state on successful async commit. */
>  	return 0;
> --=20
> 2.36.1
>=20

--wt6zy3wenv6iuvce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmKq7jsACgkQwqF3j0dL
ehydJhAAoySnrRbbPEadrwx2SOG/1QQxNQfTkjOMedcJMx0w+htoLwIkDsLOhFi7
3aSU1zte7lPf4ikTnhuGbMXeqQyUjmzZ6gJdX2B8g2/U0h8u9kYq0H28hYp/KjZB
djvtgX+sCj1ZDApQlc5x7TO9dO7P7U9Vi/2bykqGglkyUhus81qH8r4Buz0G8eF2
iI+vEGKlfBNc1YJLxd79XQhKrR+UHDmoj7hfCK3eDAI5uXXrB814hga5DkNS1Kgy
nAkzSx7TCmG/CbNan6jkByDZhbri2ijvXz2qvTr/5/6ZufztGbYz3VoNJXjKtWYg
fCj6P6Eba4PIp3IfAr36XzKtPSBUukerDwXB4KdU2O/Emji2mOIs364hM/sIq8Gv
FgpC+2EdSvLf1FWFDRVqQKu9cyjlzp3GBZ8fp3+LeqsFXJ3lV3lFtY/68FRWv4HM
ZM5iOSJKsCeTeT+MIhndopxMVw/pfOE+llfdHEmVOEfH50vFdJEFSEp16Mb7ISi/
XGGSZLAUBiLf+yFCass4WvEe72Zc3XYBLBmktMsvtA1NqC87nnGynvCs0IaNB1rg
MQoC5OImcE1aShQwHWcDQTrkGeDZh3JiwMt1STckmp8aoo2Js6e8Fj5/WV8GvMxy
bSPeupGwGf+GvaDP45dZY+VjoBAeoPdCwma2mH/JSW/+LnEwnXY=
=TUBr
-----END PGP SIGNATURE-----

--wt6zy3wenv6iuvce--
