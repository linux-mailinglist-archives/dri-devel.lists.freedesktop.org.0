Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71140542F16
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 13:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0405110E15E;
	Wed,  8 Jun 2022 11:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E7610E15E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 11:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z4wDrQ0fQ6BLyA1sFHaEngtQAxZ9SFSyX37IC10ftE0=; b=DNtv+uwb5CMYG7tczMm/0ovIY5
 5z3ie1xDskP4IVRcXs/Rqx0KBf8NIF7uOIK6lF4OKcIHnZwNC4rgcdncgiAWtxn33DR4PHyAScUfz
 V4VR9DD/O3jZMadrebw9D+PR+ilRKcHL0ptj5uCZamTnKAUFRczX89SDTjIyttwNNbRgelgduhtjJ
 jQ92aF4xg2fZAnxz8kmh8kfs8GFP6ykaJBTaDbKe2M+7BvLlA5oXxumWXyVvvR2Z/AypXQ2vn1Qke
 /UXqJB71JOfuLnRy//IM4pZICxYtpQGD8oopJPzFQrRKp52Yu9lInTQSsyMKE5jheZNa2Tv+RjTur
 cYLrPHAQ==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nyto3-00EAQd-1x; Wed, 08 Jun 2022 13:24:59 +0200
Date: Wed, 8 Jun 2022 10:24:46 -0100
From: Melissa Wen <mwen@igalia.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 13/14] drm/vc4: crtc: Fix out of order frames during
 asynchronous page flips
Message-ID: <20220608112446.gceflgplgxzfhyel@mail.igalia.com>
References: <20220503121341.983842-1-maxime@cerno.tech>
 <20220503121341.983842-14-maxime@cerno.tech>
 <20220509171005.lx3pqifg3s4e7nkj@mail.igalia.com>
 <20220509171442.svodrkdp4zjsat57@mail.igalia.com>
 <20220512104442.4n7g3nq622wzknmr@mail.igalia.com>
 <20220606135914.2ghokdevbjrqjlef@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aahdbugjmox5ktza"
Content-Disposition: inline
In-Reply-To: <20220606135914.2ghokdevbjrqjlef@houat>
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


--aahdbugjmox5ktza
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/06, Maxime Ripard wrote:
> Hi,
>=20
> On Thu, May 12, 2022 at 09:44:42AM -0100, Melissa Wen wrote:
> > On 05/09, Melissa Wen wrote:
> > > O 05/09, Melissa Wen wrote:
> > > > On 05/03, Maxime Ripard wrote:
> > > > > When doing an asynchronous page flip (PAGE_FLIP ioctl with the
> > > > > DRM_MODE_PAGE_FLIP_ASYNC flag set), the current code waits for the
> > > > > possible GPU buffer being rendered through a call to
> > > > > vc4_queue_seqno_cb().
> > > > >=20
> > > > > On the BCM2835-37, the GPU driver is part of the vc4 driver and t=
hat
> > > > > function is defined in vc4_gem.c to wait for the buffer to be ren=
dered,
> > > > > and once it's done, call a callback.
> > > > >=20
> > > > > However, on the BCM2711 used on the RaspberryPi4, the GPU driver =
is
> > > > > separate (v3d) and that function won't do anything. This was work=
ing
> > > > > because we were going into a path, due to uninitialized variables=
, that
> > > > > was always scheduling the callback.
> > > > >=20
> > > > > However, we were never actually waiting for the buffer to be rend=
ered
> > > > > which was resulting in frames being displayed out of order.
> > > > >=20
> > > > > The generic API to signal those kind of completion in the kernel =
are the
> > > > > DMA fences, and fortunately the v3d drivers supports them and sig=
nal
> > > > > when its job is done. That API also provides an equivalent functi=
on that
> > > > > allows to have a callback being executed when the fence is signal=
led as
> > > > > done.
> > > > >=20
> > > > > Let's change our driver a bit to rely on the previous function fo=
r the
> > > > > older SoCs, and on DMA fences for the BCM2711.
> > > > >=20
> > > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > > ---
> > > > >  drivers/gpu/drm/vc4/vc4_crtc.c | 41 ++++++++++++++++++++++++++++=
++++--
> > > > >  1 file changed, 39 insertions(+), 2 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4=
/vc4_crtc.c
> > > > > index e0ae7bef08fa..8e1369fca937 100644
> > > > > --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> > > > > +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> > > > > @@ -776,6 +776,7 @@ struct vc4_async_flip_state {
> > > > >  	struct drm_pending_vblank_event *event;
> > > > > =20
> > > > >  	union {
> > > > > +		struct dma_fence_cb fence;
> > > > >  		struct vc4_seqno_cb seqno;
> > > > >  	} cb;
> > > > >  };
> > > > > @@ -835,6 +836,43 @@ static void vc4_async_page_flip_seqno_comple=
te(struct vc4_seqno_cb *cb)
> > > > >  		vc4_bo_dec_usecnt(bo);
> > > > >  }
> > > > > =20
> > > > > +static void vc4_async_page_flip_fence_complete(struct dma_fence =
*fence,
> > > > > +					       struct dma_fence_cb *cb)
> > > > > +{
> > > > > +	struct vc4_async_flip_state *flip_state =3D
> > > > > +		container_of(cb, struct vc4_async_flip_state, cb.fence);
> > > > > +
> > > > > +	vc4_async_page_flip_complete(flip_state);
> > > > > +	dma_fence_put(fence);
> > > > > +}
> > > > > +
> > > > > +static int vc4_async_set_fence_cb(struct drm_device *dev,
> > > > > +				  struct vc4_async_flip_state *flip_state)
> > > > > +{
> > > > > +	struct drm_framebuffer *fb =3D flip_state->fb;
> > > > > +	struct drm_gem_cma_object *cma_bo =3D drm_fb_cma_get_gem_obj(fb=
, 0);
> > > > > +	struct vc4_dev *vc4 =3D to_vc4_dev(dev);
> > > > > +	struct dma_fence *fence;
> > > > > +	int ret;
> > > > > +
> > > > > +	if (!vc4->is_vc5) {
> > > > > +		struct vc4_bo *bo =3D to_vc4_bo(&cma_bo->base);
> > > > > +
> > > > > +		return vc4_queue_seqno_cb(dev, &flip_state->cb.seqno, bo->seqn=
o,
> > > > > +					  vc4_async_page_flip_seqno_complete);
> > > > > +	}
> > > > > +
> > > > > +	ret =3D dma_resv_get_singleton(cma_bo->base.resv, false, &fence=
);
> > > + for kernel bot complaint, I replaced false with `DMA_RESV_USAGE_REA=
D`
> > > to run some tests
> > >=20
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > > +
> > > > > +	if (dma_fence_add_callback(fence, &flip_state->cb.fence,
> > me again :)
> >=20
> > I was thinking if we should add a check here for !fence and just comple=
te the page flip,
> > instead of letting `dma_fence_add_callback` warns whenever fence is NUL=
L.
> > I think there are situation in which fence is NULL and it is not an
> > issue, right? Does it make sense?
>=20
> I'm not sure. What situation do you have in mind?

I mean, if no implicity fence was attached to this bo, it's safe to just
do the page flip. This behaviour will happen anyway, after
dma_fence_add_callback() checks fence is NULL and return -EINVAL. But
this check will also trigger a warning for something that it's not an
issue here, I think. So, if we just check `fence` before calling
dma_fence_add_callback(), we keep the same behaviour and prevent the
warning.

Melissa
>=20
> Maxime



--aahdbugjmox5ktza
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmKghvUACgkQwqF3j0dL
ehxZMxAAlKr9cbKxDhbrOmUjSJO01pJ0WdlNDlzka+O/AdXRSekdUVdHvAvODmLG
XtOlPLuEGnKqutdtW0VP/xNNQoqthDNkjKaUNdDLMH5KzQ/50XZbhowYF0EMISWf
Z76kJqhp2Klzb3S+kBxqU7/MFmY70MTY2XyJvsAJsX31Zat44OTtfsRVsrgsnxBG
INjBoeDjjN5sh2+20AWbN6r1tDjSxYw0r8BGdLJcvonLl3fOOvB6+GTRBlom7h3i
RbjDUB9AI37aRa+Ij4EFCFMABWrpdEtF73rp214z/2RsPaNbLppBLw6+I7wyjlCL
WWiVm38z4bdyIe0hEOKRViLznJNbJnqwWgUzUz6bixDlENCB5eE/rk9Ci2BF5rJi
z1Y9P84zsvrzCdukXal6L2LUiaNvQDQ/daLOUEknO484mhMT6/7V0K+BWrkr41Q3
94+5xnUvJp9NQRR7KMu9v2JKOwEctBvpWJ7nO8iZ/8JGCtYTvc1KEUM3PFf2lTtp
79J9lTjKPHeleOjOy40Rca99x1w5omJDyrj+KkdaCRW6MAHEFnhlnlUzbXSLMJ+s
+Y2itFQk6zznzwSqBnaKa29c0ew0dszQL2ZmkIjutfa5NP+lxcu44nT5b6XbB2xM
3RGB88595q/ujFOUSSTXvYLtq4bc1Pyff4yZlsia7YxCUTLPhaI=
=tQdD
-----END PGP SIGNATURE-----

--aahdbugjmox5ktza--
