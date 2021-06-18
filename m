Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E079C3AD207
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 20:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2706EA61;
	Fri, 18 Jun 2021 18:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF3F6E993;
 Fri, 18 Jun 2021 18:21:03 +0000 (UTC)
Received: from smtpclient.apple (unknown
 [IPv6:2a01:4c8:1c83:54d4:49a8:de99:3a5c:a773])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: daniels)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5B7331F44CDE;
 Fri, 18 Jun 2021 19:21:02 +0100 (BST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Daniel Stone <daniels@collabora.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [Mesa-dev] [PATCH 0/6] dma-buf: Add an API for exporting sync
 files (v12)
Date: Fri, 18 Jun 2021 19:20:59 +0100
Message-Id: <7AEE4CF9-860E-4AEA-A0B1-9E841130DC5C@collabora.com>
References: <b364d818-edeb-a2e9-a3a0-960e2463f086@amd.com>
In-Reply-To: <b364d818-edeb-a2e9-a3a0-960e2463f086@amd.com>
To: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailer: iPhone Mail (18F72)
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
Cc: =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland-devel@lists.freedesktop.org,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry for the mobile reply, but V4L2 is absolutely not write-only; there has=
 never been an intersection of V4L2 supporting dmabuf and not supporting rea=
ds.

I see your point about the heritage of dma_resv but it=E2=80=99s a red herri=
ng. It doesn=E2=80=99t matter who=E2=80=99s right, or who was first, or wher=
e the code was extracted from.

It=E2=80=99s well defined that amdgpu defines resv to be one thing, that eve=
ry other non-TTM user defines it to be something very different, and that th=
e other TTM users define it to be something in the middle.

We=E2=80=99ll never get to anything workable if we keep arguing who=E2=80=99=
s right. Everyone is wrong, because dma_resv doesn=E2=80=99t globally mean a=
nything.

It seems clear that there are three classes of synchronisation barrier (not u=
sing the =E2=80=98f=E2=80=99 word here), in descending exclusion order:
  - memory management barriers (amdgpu exclusive fence / ttm_bo->moving)
  - implicit synchronisation write barriers (everyone else=E2=80=99s exclusi=
ve fences, amdgpu=E2=80=99s shared fences)
  - implicit synchronisation read barriers (everyone else=E2=80=99s shared f=
ences, also amdgpu=E2=80=99s shared fences sometimes)

I don=E2=80=99t see a world in which these three uses can be reduced to two s=
lots. What also isn=E2=80=99t clear to me though, is how the memory-manageme=
nt barriers can exclude all other access in the original proposal with purel=
y userspace CS. Retaining the three separate modes also seems like a hard re=
quirement to not completely break userspace, but then I don=E2=80=99t see ho=
w three separate slots would work if they need to be temporally ordered. amd=
gpu fixed this by redefining the meaning of the two slots, others fixed this=
 by not doing one of the three modes.

So how do we square the circle without encoding a DAG into the kernel? Do th=
e two slots need to become a single list which is ordered by time + =E2=80=98=
weight=E2=80=99 and flattened whenever modified? Something else?

Have a great weekend.

-d

> On 18 Jun 2021, at 5:43 pm, Christian K=C3=B6nig <christian.koenig@amd.com=
> wrote:
>=20
> =EF=BB=BFAm 18.06.21 um 17:17 schrieb Daniel Vetter:
>> [SNIP]
>> Ignoring _all_ fences is officially ok for pinned dma-buf. This is
>> what v4l does. Aside from it's definitely not just i915 that does this
>> even on the drm side, we have a few more drivers nowadays.
>=20
> No it seriously isn't. If drivers are doing this they are more than broken=
.
>=20
> See the comment in dma-resv.h
>=20
>  * Based on bo.c which bears the following copyright notice,
>  * but is dual licensed:
> ....
>=20
>=20
> The handling in ttm_bo.c is and always was that the exclusive fence is use=
d for buffer moves.
>=20
> As I said multiple times now the *MAIN* purpose of the dma_resv object is m=
emory management and *NOT* synchronization.
>=20
> Those restrictions come from the original design of TTM where the dma_resv=
 object originated from.
>=20
> The resulting consequences are that:
>=20
> a) If you access the buffer without waiting for the exclusive fence you ru=
n into a potential information leak.
>     We kind of let that slip for V4L since they only access the buffers fo=
r writes, so you can't do any harm there.
>=20
> b) If you overwrite the exclusive fence with a new one without waiting for=
 the old one to signal you open up the possibility for userspace to access f=
reed up memory.
>     This is a complete show stopper since it means that taking over the sy=
stem is just a typing exercise.
>=20
>=20
> What you have done by allowing this in is ripping open a major security ho=
le for any DMA-buf import in i915 from all TTM based driver.
>=20
> This needs to be fixed ASAP, either by waiting in i915 and all other drive=
rs doing this for the exclusive fence while importing a DMA-buf or by markin=
g i915 and all other drivers as broken.
>=20
> Sorry, but if you allowed that in you seriously have no idea what you are t=
alking about here and where all of this originated from.
>=20
> Regards,
> Christian.

