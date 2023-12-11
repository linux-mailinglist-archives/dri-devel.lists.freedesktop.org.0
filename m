Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F9B80D555
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 19:23:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C2C10E3F1;
	Mon, 11 Dec 2023 18:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 320 seconds by postgrey-1.36 at gabe;
 Mon, 11 Dec 2023 18:23:31 UTC
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DAF10E3F1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 18:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1702318689;
 bh=9Wcs2sC0whfirg/3qFAlvB3jbEVFbDc0DX+kdRotHjU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=YNjJQEOd1NJ6lPBk4SsWTsAT2Lx82VLKMo3sVwJGf3OA81ujwkVbzErr9rOezbzYn
 zwcNPFo434ooIz0c5iJoGG6+oQ2ejQWjhqDgd2MN7SJa86R6g3aLagplp7QzxXVeZr
 J+xypbQ2d+/SH7mYwAwe26M++XGHKRpIUnLYDiENrOJe78DsPqbesv1nsxRdlIaLMe
 BWVuVB71NywYElDrxNxEZWEoiHyZTEwhBXbYg1cNlrrF61KjuW6xVN4QAd//iLzgel
 u0M+wY1q9xoVLFH+uG4ltZ/b9Ta1L8Qi07Lvu4PFnY1boc4YTYOcSBs4x9knRICXGP
 wi5FHqV1WC8kA==
Received: from beaker.gfxstrand.net (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: gfxstrand)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 51CAC3781417;
 Mon, 11 Dec 2023 18:18:06 +0000 (UTC)
Message-ID: <fba8eaf97e61a716ca74c4add7092c52b1ff2fbe.camel@collabora.com>
Subject: Re: [PATCH v3 00/14] drm: Add a driver for CSF-based Mali GPUs
From: Faith Ekstrand <faith.ekstrand@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Tatsuyuki Ishi
 <ishitatsuyuki@gmail.com>
Date: Mon, 11 Dec 2023 12:18:04 -0600
In-Reply-To: <20231211095206.13e3d7ba@collabora.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <08C0F75B-292B-444D-A509-1451B08D0059@gmail.com>
 <20231211095206.13e3d7ba@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
 kernel@collabora.com, Robin Murphy <robin.murphy@arm.com>, "Marty E .
 Plummer" <hanetzer@startmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2023-12-11 at 09:52 +0100, Boris Brezillon wrote:
> Hi,
>=20
> On Sun, 10 Dec 2023 13:58:51 +0900
> Tatsuyuki Ishi <ishitatsuyuki@gmail.com> wrote:
>=20
> > > On Dec 5, 2023, at 2:32, Boris Brezillon
> > > <boris.brezillon@collabora.com> wrote:
> > >=20
> > > Hello,
> > >=20
> > > This is the 3rd version of the kernel driver for Mali CSF-based
> > > GPUs.
> > >=20
> > > With all the DRM dependencies being merged (drm-sched single
> > > entity and
> > > drm_gpuvm), I thought now was a good time to post a new version.
> > > Note
> > > that the iommu series we depend on [1] has been merged recently.
> > > The
> > > only remaining dependency that hasn't been merged yet is this
> > > rather
> > > trival drm_gpuvm [2] patch.
> > >=20
> > > As for v2, I pushed a branch based on drm-misc-next and
> > > containing
> > > all the dependencies that are not yet available in drm-misc-next
> > > here[3], and another [4] containing extra patches to have things
> > > working on rk3588. The CSF firmware binary can be found here[5],
> > > and
> > > should be placed under
> > > /lib/firmware/arm/mali/arch10.8/mali_csffw.bin.
> > >=20
> > > The mesa MR adding v10 support on top of panthor is available
> > > here [6].
> > >=20
> > > Regarding the GPL2+MIT relicensing, Liviu did an audit and found
> > > two
> > > more people that I didn't spot initially: Cl=C3=A9ment P=C3=A9ron for=
 the
> > > devfreq
> > > code, and Alexey Sheplyakov for some bits in panthor_gpu.c. Both
> > > are
> > > Cc-ed on the relevant patches. The rest of the code is either
> > > new, or
> > > covered by the Linaro, Arm and Collabora acks.
> > >=20
> > > And here is a non-exhaustive changelog, check each commit for a
> > > detailed
> > > changelog.
> > >=20
> > > v3;
> > > - Quite a few changes at the MMU/sched level to make the fix some
> > > =C2=A0race conditions and deadlocks
> > > - Addition of the a sync-only VM_BIND operation (to support
> > > =C2=A0vkQueueSparseBind with zero commands).=C2=A0=20
> >=20
> > Hi Boris,
> >=20
> > Just wanted to point out that vkQueueBindSparse's semantics is
> > rather different
> > from vkQueueSubmit when it comes to synchronization.=C2=A0 In short,
> > vkQueueBindSparse does not operate on a particular timeline (aka
> > scheduling
> > queue / drm_sched_entity).=C2=A0 The property of following a timeline
> > order is known
> > as =E2=80=9Csubmission order=E2=80=9D [1] in Vulkan, and applies to vkQ=
ueueSubmit
> > only and not
> > vkQueueBindSparse.
>=20
> Hm, okay. I really though the same ordering guarantees applied to
> sparse binding queues too, as the spec [1] says
>=20
> "
> Batches begin execution in the order they appear in pBindInfo, but
> may complete out of order.
> "

Right. So this is something where the Vulkan spec isn't terribly clear
and I think I need to go file a spec bug.=C2=A0 I'm fairly sure that the
intent is that bind operations MAY complete out-of-order but are not
required to complete out-of-order.=C2=A0 In other words, I'm fairly sure
that implementations are allowed but not required to insert extra
dependencies that force some amount of ordering.=C2=A0 We take advantage of
this in Mesa today to properly implement vkQueueWaitIdle() on sparse
binding queues.=C2=A0 This is also a requirement of Windows WDDM2 as far as
I can tell so I'd be very surprised if we disallowed it in the spec.

That said, that's all very unclear and IDK where you'd get that from
the spec.=C2=A0 I'm going to go file a spec bug so we can get this sorted
out.

~Faith


> which means things are submitted in order inside a vkQueueSparseBind
> context, so I was expecting the submission ordering guarantee to
> apply
> across vkQueueSparseBind() calls on the same queue too. Just want to
> mention that all kernel implementations I have seen so far assume
> VM_BIND submissions on a given queue are serialized (that's how
> drm_sched works, and Xe, Nouveau and Panthor are basing their VM_BIND
> implemenation on drm_sched).
>=20
> Maybe Faith, or anyone deeply involved in the Vulkan specification,
> can
> confirm that submission ordering guarantees are relaxed on sparse
> binding queues.
>=20
> >=20
> > Hence, an implementation that takes full advantage of Vulkan
> > semantics would
> > essentially have an infinite amount of VM_BIND contexts.
>=20
> Uh, that's definitely not how I understood it initially...
>=20
> > It would also not need
> > sync-only VM_BIND submissions, assuming that drmSyncobjTransfer
> > works.
>=20
> Sure, if each vkQueueSparseBind() has its own timeline, an internal
> timeline-syncobj with a bunch of drmSyncobjTransfer() calls would do
> the
> trick (might require several ioctls() to merge input syncobjs, but
> that's probably not the end of the world).
>=20
> >=20
> > I=E2=80=99m not saying that the driver should always be implemented tha=
t
> > way; in
> > particular, app developers are also confused by the semantics and
> > native Vulkan
> > games can be terribly wrong [2].
>=20
> Okay, thanks for the pointer. If I may, I find this semantics utterly
> confusing, to say the least. At the very least, the
> vkQueueBindSparse()
> doc could be update so it clearly reflects the facts submission order
> is not guaranteed across vkQueueBindSparse() calls, because right now
> it's only suggested in the [3], by the lack of vkQueueBindSparse()
> mention in the first bullet, which can be interpreted as a genuine
> omission rather than an expected behavior.
>=20
> Regards,
>=20
> Boris
>=20
> [1]
> https://registry.khronos.org/vulkan/specs/1.3-extensions/man/html/vkQ
> ueueBindSparse.html
> [2]
> https://registry.khronos.org/vulkan/specs/1.3-extensions/man/html/vkQ
> ueueBindSparse.html#VUID-vkQueueBindSparse-pBindInfo-parameter
> [3]
> https://registry.khronos.org/vulkan/specs/1.3-extensions/html/vkspec.
> html#synchronization-submission-order


