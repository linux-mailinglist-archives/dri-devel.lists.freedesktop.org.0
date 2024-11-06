Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA2E9BEDB2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 14:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8121610E6D7;
	Wed,  6 Nov 2024 13:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="LXxjDr93";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A236B10E6D7
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 13:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730898771;
 bh=17sVLOIVjrZavuOqec1U81+uMkU1sgqbBmb3g01yd5E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LXxjDr93gAYBIR7shmdfrpaKS9Td0e60kRfWoNHCj0cdQ/DOpvQzwP5ONES55fu3m
 Oyj4I6HJhUNRiScJyfnSMMwEiLyJqRUsZfYWo23Z1FF6WorNByLHZB8wm3ttUpv9wG
 nXEcfKt3Iw9Zj4+h6bx0d0s7h01DgZrLsLUNd+eeDjYHKBTgEbefZPgMAOdKsgODam
 elAfgE97Htaa88dTLyIVgQ3w+/Q6623Cy26fOMSko4rk2u9YC8aKnwXuez7ww8QV0b
 4H1cfgl0WIHre5PbNwFjNFNuN8hpdej4YYJv5/4q35qcr68ziySXtbw0yAbphVKJBt
 kOTpK98j6UjxQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BB7CD17E3631;
 Wed,  6 Nov 2024 14:12:50 +0100 (CET)
Date: Wed, 6 Nov 2024 14:12:45 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Chia-I Wu <olvaffe@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Chunming Zhou <david1.zhou@amd.com>, Lionel Landwerlin
 <lionel.g.landwerlin@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, faith.ekstrand@collabora.com, simona@ffwll.ch
Subject: Re: [PATCH v2] drm/syncobj: ensure progress for syncobj queries
Message-ID: <20241106141245.0a4f88be@collabora.com>
In-Reply-To: <048c2dca-48fd-4627-ba0c-bc9daa17ac29@amd.com>
References: <20241022161825.228278-1-olvaffe@gmail.com>
 <900f8658-726c-4034-90ff-398e6c57ec47@amd.com>
 <CAPaKu7QwSq7a-ipSOdETFEBGMu4J4ud1SqxDfPp8bNMjCMM5RQ@mail.gmail.com>
 <CAPaKu7TB30wvDvMW2FcYNcxjfDkOje358JNnRr2jJf=99-h-rg@mail.gmail.com>
 <301110a2-c004-4385-9231-b9354904b5e0@amd.com>
 <CAPaKu7Tbp1_sd7Eqj7tkWBJBVPSZYo6uYD+7jwP=CwM5YYauFg@mail.gmail.com>
 <20241106091436.48687e86@collabora.com>
 <048c2dca-48fd-4627-ba0c-bc9daa17ac29@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 6 Nov 2024 13:44:20 +0100
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 06.11.24 um 09:14 schrieb Boris Brezillon:
> > On Tue, 5 Nov 2024 09:56:22 -0800
> > Chia-I Wu<olvaffe@gmail.com>  wrote:
> > =20
> >> On Mon, Nov 4, 2024 at 11:32=E2=80=AFPM Christian K=C3=B6nig
> >> <christian.koenig@amd.com>  wrote: =20
> >>> Am 04.11.24 um 22:32 schrieb Chia-I Wu:
> >>>
> >>> On Tue, Oct 22, 2024 at 10:24=E2=80=AFAM Chia-I Wu<olvaffe@gmail.com>=
  wrote:
> >>>
> >>> On Tue, Oct 22, 2024 at 9:53=E2=80=AFAM Christian K=C3=B6nig
> >>> <christian.koenig@amd.com>  wrote:
> >>>
> >>> Am 22.10.24 um 18:18 schrieb Chia-I Wu:
> >>>
> >>> Userspace might poll a syncobj with the query ioctl.  Call
> >>> dma_fence_enable_sw_signaling to ensure dma_fence_is_signaled returns
> >>> true in finite time.
> >>>
> >>> Wait a second, just querying the fence status is absolutely not
> >>> guaranteed to return true in finite time. That is well documented on =
the
> >>> dma_fence() object.
> >>>
> >>> When you want to poll on signaling from userspace you really need to
> >>> call poll or the wait IOCTL with a zero timeout. That will also return
> >>> immediately but should enable signaling while doing that.
> >>>
> >>> So just querying the status should absolutely *not* enable signaling.
> >>> That's an intentional separation.
> >>>
> >>> I think it depends on what semantics DRM_IOCTL_SYNCOBJ_QUERY should h=
ave.
> >>>
> >>>
> >>> Well that's what I pointed out. The behavior of the QUERY IOCTL is ba=
sed on the behavior of the dma_fence and the later is documented to do exac=
tly what it currently does.
> >>>
> >>> If DRM_IOCTL_SYNCOBJ_QUERY is mainly for vulkan timeline semaphores,
> >>> it is a bit heavy if userspace has to do a
> >>> DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT before a query.
> >>>
> >>>
> >>> Maybe you misunderstood me, you *only* have to call DRM_IOCTL_SYNCOBJ=
_TIMELINE_WAIT and *not* _QUERY.
> >>>
> >>> The underlying dma_fence_wait_timeout() function is extra optimized s=
o that zero timeout has only minimal overhead.
> >>>
> >>> This overhead is actually lower than _QUERY because that one actually=
 queries the driver for the current status while _WAIT just assumes that th=
e driver will signal the fence when ready from an interrupt. =20
> >> The context here is that vkGetSemaphoreCounterValue calls QUERY to get
> >> the timeline value.  WAIT does not replace QUERY. =20
>=20
> Oh, that is a really good argument.
>=20
> >> Taking a step back, in the binary (singled/unsignaled) case, a WAIT
> >> with zero timeout can get the up-to-date status.  But in the timeline
> >> case, there is no direct way to get the up-to-date status if QUERY
> >> must strictly be a wrapper for dma_fence_is_signaled.  It comes back
> >> to what was QUERY designed for and can we change it? =20
>=20
> Yeah that is a really good point. If _QUERY implements a different=20
> functionality than _WAIT than the usual distinction between polling and=20
> interrupt based approach can't be applied here.
>=20
> >>> I filed a Mesa issue,
> >>> https://gitlab.freedesktop.org/mesa/mesa/-/issues/12094, and Faith
> >>> suggested a kernel-side fix as well.  Should we reconsider this?
> >>>
> >>>
> >>> Wait a second, you might have an even bigger misconception here. The =
difference between waiting and querying is usually intentional!
> >>>
> >>> This is done so that for example on mobile devices you don't need to =
enable device interrupts, but rather query in defined intervals.
> >>>
> >>> This is a very common design pattern and while I don't know the wordi=
ng of the Vulkan timeline extension it's quite likely that this is the inte=
nded use case. =20
> >> Yeah, there are Vulkan CTS tests that query timeline semaphores
> >> repeatedly for progress.  Those tests can fail because mesa translates
> >> the queries directly to the QUERY ioctl.
> >>
> >> As things are, enable_signaling is a requirement to query up-to-date
> >> status no matter the syncobj is binary or a timeline. =20
> > I kinda agree with Chia-I here. What's the point of querying a timeline
> > syncobj if what we get in return is an outdated sync point? I get that
> > the overhead of enabling signalling exists, but if we stand on this
> > position, that means the QUERY ioctl is not suitable for
> > vkGetSemaphoreCounterValue() unless we first add a
> > WAIT(sync_point=3D0,timeout=3D0) to make sure signalling is enabled on =
all
> > fences contained by the dma_fence_chain backing the timeline syncobj.
> > And this has to be done for each vkGetSemaphoreCounterValue(), because
> > new sync points don't have signalling enabled by default. =20
>=20
> The common driver design I know from other operating systems is that you=
=20
> either poll without enabling interrupts or you enable interrupts and=20
> wait for the async operation to complete.

The problem is that we don't really poll if we call ::signaled() on a
dma_fence_array. The test is based on the state the container was at
creation time. The only way to poll a fence_array right now is to
enable signalling. So maybe that's the problem we should solve here:
make dma_fence_array_signaled() iterate over the fences instead of
checking ::num_pending and returning false if it's not zero (see the
diff at the end of this email).

>=20
> That distinction is really important for things like mobile devices=20
> where interrupts are rather power costly.

Sure, I get the importance of keeping interrupts disabled for
power-savings.

>=20
> > At the very least, we should add a new DRM_SYNCOBJ_QUERY_FLAGS_ flag
> > (DRM_SYNCOBJ_QUERY_FLAGS_REFRESH_STATE?) to combine the
> > enable_signalling and query operations in a single ioctl. If we go
> > for this approach, that means mesa has to support both cases, and pick
> > the most optimal one if the kernel supports it. =20
>=20
> Another problem we have here is that dma_fence_enable_signaling() can=20
> mean two different things, maybe the documentation is a bit confusing:
>=20
> 1) Enabling interrupts so that we don't need to call the=20
> ops->is_signaled() driver callback.
>=20
> 2) Asking preemption fences to actually signal because memory management=
=20
> wants to do something.

Uh, I wasn't aware of (2). If it's document somewhere, I probably missed
that part.

>=20
> So when this ops->is_signaled() callback is implemented it shouldn't be=20
> necessary to enable signaling to query the state.

Agree on that, see my comment about fence_array() not necessarily doing
the right thing here.

>=20
> To summarize: When you call _QUERY you shouldn't get an outdated sync=20
> point. When you do this then there is something wrong with the backend=20
> driver.

If by backend, you mean the dma_fence_array implementation, you're probably
right.

>=20
> Regards,
> Christian.


--->8---
diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-=
array.c
index 8a08ffde31e7..c9222a065954 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -104,8 +104,22 @@ static bool dma_fence_array_signaled(struct dma_fence =
*fence)
 {
        struct dma_fence_array *array =3D to_dma_fence_array(fence);
=20
-       if (atomic_read(&array->num_pending) > 0)
-               return false;
+       if (atomic_read(&array->num_pending) > 0) {
+               struct dma_fence *subfence;
+               unsigned i;
+
+               /*
+                * If signaling is enabled, we don't need to iterate over
+                * fences to get the state, we can rely on num_pending > 0.
+                */
+               if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flag=
s))
+                       return false;
+
+               dma_fence_array_for_each(subfence, i, fence) {
+                       if (!dma_fence_is_signaled(subfence))
+                               return false;
+               }
+       }
=20
        dma_fence_array_clear_pending_error(array);
        return true;


