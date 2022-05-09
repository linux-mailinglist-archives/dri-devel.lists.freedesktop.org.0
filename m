Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D81AC520353
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 19:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3576010F48F;
	Mon,  9 May 2022 17:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A1910F48F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 17:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5qSKciRDqHLj4ZZ8OqZyTd09Pg71HHXK7gOU76GHors=; b=C/NAlUaED2SEV4PLAl3Ku8m+QV
 QDO5z6r7fKmFVpH86lJ/kvToB9I/cRefWSvyEr2wbB6le/BMoLrz0W5JdCKcKZBYwK6Ys/Wf0sxTB
 PN7A0u+FlzWgH7yT+SDtqibH1UiX8VLSycV7YACVIIdXZ/d0SLPoZTUGC0IF90Lxl4vd34ooyCEx0
 qoi8+hDhfqVw6X6GdP+ZQMeLfDYZrJo5cSVI0nCaPEN6DI6NFUJGRXtq+cX5KKPrbqKndXWvL1cP8
 MlJhyGCu6BFrUFP3RTNPXVpDLundOhLqdzVIam32h5Smt1LnqSZoy4bXOvbWXqW1tdfefDdYelX/x
 e0MQUefA==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1no6tr-000Bdn-FM; Mon, 09 May 2022 19:10:23 +0200
Date: Mon, 9 May 2022 16:10:05 -0100
From: Melissa Wen <mwen@igalia.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 13/14] drm/vc4: crtc: Fix out of order frames during
 asynchronous page flips
Message-ID: <20220509171005.lx3pqifg3s4e7nkj@mail.igalia.com>
References: <20220503121341.983842-1-maxime@cerno.tech>
 <20220503121341.983842-14-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7u246d4wy7xoniqi"
Content-Disposition: inline
In-Reply-To: <20220503121341.983842-14-maxime@cerno.tech>
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


--7u246d4wy7xoniqi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05/03, Maxime Ripard wrote:
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
>  drivers/gpu/drm/vc4/vc4_crtc.c | 41 ++++++++++++++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crt=
c.c
> index e0ae7bef08fa..8e1369fca937 100644
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
> @@ -835,6 +836,43 @@ static void vc4_async_page_flip_seqno_complete(struc=
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
> +	ret =3D dma_resv_get_singleton(cma_bo->base.resv, false, &fence);
> +	if (ret)
> +		return ret;
> +
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
> @@ -874,8 +912,7 @@ vc4_async_page_flip_common(struct drm_crtc *crtc,
>  	 */
>  	drm_atomic_set_fb_for_plane(plane->state, fb);
> =20
> -	vc4_queue_seqno_cb(dev, &flip_state->cb.seqno, bo->seqno,
> -			   vc4_async_page_flip_seqno_complete);
> +	vc4_async_set_fence_cb(dev, flip_state);

I tried to run igt kms_async_flip, but the test still seems very tied to
the i915 driver. So, as far as I could check, I didn't see any red
flags and sync page flip behaviour seems preserved.

> =20
>  	/* Driver takes ownership of state on successful async commit. */
>  	return 0;
> --=20
> 2.35.1
>=20

--7u246d4wy7xoniqi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmJ5SuIACgkQwqF3j0dL
ehzK2w//cZ+Svspec3kVaNfxx+O8K6srI6xkKYftgAlBZzYjRf4ZYGaLMS+1ANKy
5Me4xjghKywnDW8vRT5k4V+wvSC1v5wVLaHkNYlTgnEozBvxnGkL7qkxKQzwkSOK
lbDQHJyvFbdz/S+9WrdzNJvouYxEDZambvLkWBla5l6yIT2P6id0lveBlCvy5T+N
xYcaxO6IgNGpzzn57rqf2T4hi4iwTrnhbUTn2DK4DSgksEJPsWztIK4jriVjs50v
tdCraAfa48Ye6Wd37uReKrefXNiZ0oxmCwqnGENEdMHyXY4PsxXx9psPPM1SZx+d
eJkKnmEv7TdzQUKNqKuApIv3D5lzdxzuTx+Rx6hxRX1hO1checfGtRSYkRLcdN4p
/Y/85FaRfZmWQGG94SCC3j/Zu88YKebPSC+EDhS30QKhtl7URmaiDbyVvXBYCXFU
e4mLN2W7FqEEc5FuhHrmY5vm94qO4pA83o8DERYD+SkElPl/64FZJOBruVmZ9D6b
6SpbMgTk1r1EOXinOyJ3VZ+/jVyS3Sc5xmznGuyQRy/0LqBUH/XGpjsfTLeFo27/
I4TsPfIWBabElsuEiRMSApb8/wTT2E2BE1ijYsZSO1szRCA7qwxC5lBOGEphDWZ6
M20s/s5rtzF81yrPpg6PIlD7YxOlrdOAW8PPNMO3PIR/vgGcqGA=
=P09X
-----END PGP SIGNATURE-----

--7u246d4wy7xoniqi--
