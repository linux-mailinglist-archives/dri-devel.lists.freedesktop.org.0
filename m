Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7FFA1DAAA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 17:33:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2504310E15E;
	Mon, 27 Jan 2025 16:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA7410E15E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 16:33:23 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1tcS31-0006AZ-MY; Mon, 27 Jan 2025 17:33:15 +0100
Message-ID: <bf0abe8daf18a5718b1a38c29096967bfde36c12.camel@pengutronix.de>
Subject: Re: [PATCH] drm/amdgpu: restore wait-free fastpath for GEM_WAIT_IDLE
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, Marek
 =?UTF-8?Q?Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Date: Mon, 27 Jan 2025 17:33:15 +0100
In-Reply-To: <280a3079-d213-4892-869f-004776fd90d0@amd.com>
References: <20250127160258.289035-1-l.stach@pengutronix.de>
 <280a3079-d213-4892-869f-004776fd90d0@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Hi Christian,

Am Montag, dem 27.01.2025 um 17:14 +0100 schrieb Christian K=C3=B6nig:
> Am 27.01.25 um 17:02 schrieb Lucas Stach:
> > This effectively reverts 0fea2ed61e7f ("drm/amdgpu: Remove call to
> > reservation_object_test_signaled_rcu before wait"), as the premise of
> > that commit is wrong. dma_resv_wait_timeout() without a timeout will
> > not turn into a wait-free dma_resv_test_signaled, but will wait a
> > jiffy for unsignaled fences, which is not at all what userspace expects
> > when it calls GEM_WAIT_IDLE with a timeout of 0.
>=20
> Marek pinged me about that strange behavior as well. That sounds like a=
=20
> separate bug in dma_resv_wait_timeout() to me.
>=20
> I don't see why the function should be waiting with a timeout of 0 and=
=20
> we have multiple cases where that is assumed.
>=20
> What should happen is that dma_resv_wait_timeout() should return 1 when=
=20
> all fences are signaled even when the timeout is 0.
>=20
> My educated guess is that this behavior is somehow broken and instead we=
=20
> wait for at least 1 jiffies.
>=20
> This here is probably just the tip of the iceberg.
>=20
dma_resv_wait_timeout() explicitly sets timeout to a single jiffy when
it is entered with timeout =3D=3D 0. This behavior was introduced with your
commit 06a66b5c77ed ("reservation: revert "wait only with non-zero
timeout specified (v3)" v2"), which seems to fix a real bug.

Between the two behaviors I think it is wrong for callers of
dma_resv_wait_timeout() to assume that the call is necessarily wait-
free in case of timeout =3D=3D 0. If you want wait-free but are able to
deal with false positive unsignaled returns use dma_resv_test_signaled,
otherwise use dma_resv_wait_timeout to get accurate answers with a
possible wait.

Regards,
Lucas

> Regards,
> Christian.
>=20
> >=20
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> > This is most likely the correct kernel-side solution for the unexpected
> > slowdown worked around with in userspace with this Mesa series:
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32877
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 9 +++++++--
> >   1 file changed, 7 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_gem.c
> > index 1a5df8b94661..75b5d5149911 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > @@ -567,8 +567,13 @@ int amdgpu_gem_wait_idle_ioctl(struct drm_device *=
dev, void *data,
> >   		return -ENOENT;
> >  =20
> >   	robj =3D gem_to_amdgpu_bo(gobj);
> > -	ret =3D dma_resv_wait_timeout(robj->tbo.base.resv, DMA_RESV_USAGE_REA=
D,
> > -				    true, timeout);
> > +	if (timeout =3D=3D 0)
> > +		ret =3D dma_resv_test_signaled(robj->tbo.base.resv,
> > +					     DMA_RESV_USAGE_READ);
> > +	else
> > +		ret =3D dma_resv_wait_timeout(robj->tbo.base.resv,
> > +					    DMA_RESV_USAGE_READ,
> > +					    true, timeout);
> >  =20
> >   	/* ret =3D=3D 0 means not signaled,
> >   	 * ret > 0 means signaled
>=20

