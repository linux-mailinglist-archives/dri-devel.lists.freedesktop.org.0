Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1809BE01B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 09:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C39E10E665;
	Wed,  6 Nov 2024 08:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lHZakwe0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE85A10E65C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 08:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730880882;
 bh=uK95tkMa35y5aQq89p/rmF8He4kCyBKWeb+76t+rttg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lHZakwe0jH930HXxOLFpzC0wfWWTo7/KTo35+mlDnFyyiNeKum8U/rDdUojwDeJwE
 XH6tpuusiWAzEY3jOAeiFd+RjXZNPEuKKP3m+EqllffiF56STSJPjpkEWyr9Fau097
 LYndAa4PJ9TdjzbQKbyJo7GBxjP5/JegUaPIqo1GF/ZFarLUQrziRGZsrRaD5FveON
 f7xGa4gaaiVD72UgZJwfGjIWsanaZzL+XTynHuvSnxaIZP444oTgpKvlSywlOplqfp
 VL6YldBfXe3uiISHPjV7xLeVjAMo+BwzDwAm7i6J3VBkTihMBJ91ZXAKtA9mEW1tsm
 axvMhrT90hzSw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D7A2117E1220;
 Wed,  6 Nov 2024 09:14:41 +0100 (CET)
Date: Wed, 6 Nov 2024 09:14:36 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Chunming Zhou <david1.zhou@amd.com>, Lionel Landwerlin
 <lionel.g.landwerlin@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, faith.ekstrand@collabora.com, simona@ffwll.ch
Subject: Re: [PATCH v2] drm/syncobj: ensure progress for syncobj queries
Message-ID: <20241106091436.48687e86@collabora.com>
In-Reply-To: <CAPaKu7Tbp1_sd7Eqj7tkWBJBVPSZYo6uYD+7jwP=CwM5YYauFg@mail.gmail.com>
References: <20241022161825.228278-1-olvaffe@gmail.com>
 <900f8658-726c-4034-90ff-398e6c57ec47@amd.com>
 <CAPaKu7QwSq7a-ipSOdETFEBGMu4J4ud1SqxDfPp8bNMjCMM5RQ@mail.gmail.com>
 <CAPaKu7TB30wvDvMW2FcYNcxjfDkOje358JNnRr2jJf=99-h-rg@mail.gmail.com>
 <301110a2-c004-4385-9231-b9354904b5e0@amd.com>
 <CAPaKu7Tbp1_sd7Eqj7tkWBJBVPSZYo6uYD+7jwP=CwM5YYauFg@mail.gmail.com>
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

On Tue, 5 Nov 2024 09:56:22 -0800
Chia-I Wu <olvaffe@gmail.com> wrote:

> On Mon, Nov 4, 2024 at 11:32=E2=80=AFPM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> >
> > Am 04.11.24 um 22:32 schrieb Chia-I Wu:
> >
> > On Tue, Oct 22, 2024 at 10:24=E2=80=AFAM Chia-I Wu <olvaffe@gmail.com> =
wrote:
> >
> > On Tue, Oct 22, 2024 at 9:53=E2=80=AFAM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >
> > Am 22.10.24 um 18:18 schrieb Chia-I Wu:
> >
> > Userspace might poll a syncobj with the query ioctl.  Call
> > dma_fence_enable_sw_signaling to ensure dma_fence_is_signaled returns
> > true in finite time.
> >
> > Wait a second, just querying the fence status is absolutely not
> > guaranteed to return true in finite time. That is well documented on the
> > dma_fence() object.
> >
> > When you want to poll on signaling from userspace you really need to
> > call poll or the wait IOCTL with a zero timeout. That will also return
> > immediately but should enable signaling while doing that.
> >
> > So just querying the status should absolutely *not* enable signaling.
> > That's an intentional separation.
> >
> > I think it depends on what semantics DRM_IOCTL_SYNCOBJ_QUERY should hav=
e.
> >
> >
> > Well that's what I pointed out. The behavior of the QUERY IOCTL is base=
d on the behavior of the dma_fence and the later is documented to do exactl=
y what it currently does.
> >
> > If DRM_IOCTL_SYNCOBJ_QUERY is mainly for vulkan timeline semaphores,
> > it is a bit heavy if userspace has to do a
> > DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT before a query.
> >
> >
> > Maybe you misunderstood me, you *only* have to call DRM_IOCTL_SYNCOBJ_T=
IMELINE_WAIT and *not* _QUERY.
> >
> > The underlying dma_fence_wait_timeout() function is extra optimized so =
that zero timeout has only minimal overhead.
> >
> > This overhead is actually lower than _QUERY because that one actually q=
ueries the driver for the current status while _WAIT just assumes that the =
driver will signal the fence when ready from an interrupt. =20
>=20
> The context here is that vkGetSemaphoreCounterValue calls QUERY to get
> the timeline value.  WAIT does not replace QUERY.
>=20
> Taking a step back, in the binary (singled/unsignaled) case, a WAIT
> with zero timeout can get the up-to-date status.  But in the timeline
> case, there is no direct way to get the up-to-date status if QUERY
> must strictly be a wrapper for dma_fence_is_signaled.  It comes back
> to what was QUERY designed for and can we change it?
>=20
>=20
> >
> > I filed a Mesa issue,
> > https://gitlab.freedesktop.org/mesa/mesa/-/issues/12094, and Faith
> > suggested a kernel-side fix as well.  Should we reconsider this?
> >
> >
> > Wait a second, you might have an even bigger misconception here. The di=
fference between waiting and querying is usually intentional!
> >
> > This is done so that for example on mobile devices you don't need to en=
able device interrupts, but rather query in defined intervals.
> >
> > This is a very common design pattern and while I don't know the wording=
 of the Vulkan timeline extension it's quite likely that this is the intend=
ed use case. =20
> Yeah, there are Vulkan CTS tests that query timeline semaphores
> repeatedly for progress.  Those tests can fail because mesa translates
> the queries directly to the QUERY ioctl.
>=20
> As things are, enable_signaling is a requirement to query up-to-date
> status no matter the syncobj is binary or a timeline.

I kinda agree with Chia-I here. What's the point of querying a timeline
syncobj if what we get in return is an outdated sync point? I get that
the overhead of enabling signalling exists, but if we stand on this
position, that means the QUERY ioctl is not suitable for
vkGetSemaphoreCounterValue() unless we first add a
WAIT(sync_point=3D0,timeout=3D0) to make sure signalling is enabled on all
fences contained by the dma_fence_chain backing the timeline syncobj.
And this has to be done for each vkGetSemaphoreCounterValue(), because
new sync points don't have signalling enabled by default.

At the very least, we should add a new DRM_SYNCOBJ_QUERY_FLAGS_ flag
(DRM_SYNCOBJ_QUERY_FLAGS_REFRESH_STATE?) to combine the
enable_signalling and query operations in a single ioctl. If we go
for this approach, that means mesa has to support both cases, and pick
the most optimal one if the kernel supports it.
