Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 062BBB57DAC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 15:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB5C10E2D7;
	Mon, 15 Sep 2025 13:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="r79LSZ1Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1DC10E2D7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 13:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1757943873; x=1758548673; i=natalie.vock@gmx.de;
 bh=iMCARmauxBDkqMleScIEPx21jEiLviOeGZA+HamWOQI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=r79LSZ1Yj/bdIB0WIuQbK8VnVeM+hRtCbYTyG++w8e5ByORJT4M19U6xLDPSBdc2
 Q+tLYyANyP2Z1LdN8q6ADivUm7h/l+bh5blgwCX2J73BcIwyoBtN7EK96Xk+7uMOk
 lPis/A7FaK9ZXQNnIQuWvq0h/QJAl74sR+ONILh9fKZsPx6h4AZ13iylw6o85SYRx
 oXxQIdKDW65V+CELzTY2h5C4b7KQU++Y2GV1PtUxLZO1FSGYDSfGns2Y0XrCCZ6ux
 DqzmzK4lPZtn5rs0ZQPoVYoc9DAEzK9gj9zcbxWgH93ULkgFLrsw45+zsp+OgR4EQ
 IBjvhfXR/mzCGqfQNw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.91.201.165]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5fIQ-1v0sXL0aIk-004yWY; Mon, 15
 Sep 2025 15:44:33 +0200
Message-ID: <c90eeb12-b1e7-4a68-a96a-a64a3ba779d5@gmx.de>
Date: Mon, 15 Sep 2025 15:44:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] cgroup/dmem, drm/ttm: Improve protection in contended
 cases
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maarten Lankhorst <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250915-dmemcg-aggressive-protect-v1-0-2f3353bfcdac@gmx.de>
 <01e2369e-1df2-446d-9f9d-59c86cc55a04@amd.com>
 <6f4d8e35-5230-49ed-99e2-3d923e9d0012@gmx.de>
 <8600fee7-45c6-4254-acdf-74f0d7681228@amd.com>
Content-Language: en-US
From: Natalie Vock <natalie.vock@gmx.de>
In-Reply-To: <8600fee7-45c6-4254-acdf-74f0d7681228@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OxUr6BZ88spWb5uQEErIfDul2ZIm409HXl/KcEK5sZ63YHljLIL
 M4OXbW62sd+RihXzCe7NUoxVUOy6RaconiF1oodTdmGbUJ4Zoj9hd0x6XdD5vVAjTt0bWli
 4hgf0e5mev5r860/54FOb4OTE4CV7g1/bgwPZH0EOjxNCSZPGKk7Gi6q0zaeR/qePMDBulP
 aLWpWiIeT13J45lxQO0lQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0IWfPDDkOO4=;nh7QkxEiITnXHqfLD+YQDqCXn3G
 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
 fboUKIWMxX
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

On 9/15/25 15:23, Christian K=C3=B6nig wrote:
> On 15.09.25 15:17, Natalie Vock wrote:
>> On 9/15/25 14:48, Christian K=C3=B6nig wrote:
>>> On 15.09.25 14:36, Natalie Vock wrote:
>>>> Hi all,
>>>>
>>>> I've been looking into some cases where dmem protection fails to prev=
ent
>>>> allocations from ending up in GTT when VRAM gets scarce and apps star=
t
>>>> competing hard.
>>>>
>>>> In short, this is because other (unprotected) applications end up
>>>> filling VRAM before protected applications do. This causes TTM to bac=
k
>>>> off and try allocating in GTT before anything else, and that is where
>>>> the allocation is placed in the end. The existing eviction protection
>>>> cannot prevent this, because no attempt at evicting is ever made
>>>> (although you could consider the backing-off as an immediate eviction=
 to
>>>> GTT).
>>>
>>> Well depending on what you gave as GEM flags from userspace that is ex=
pected behavior.
>>>
>>> For applications using RADV we usually give GTT|VRAM as placement whic=
h basically tells the kernel that it shouldn't evict at all and immediatel=
y fallback to GTT.
>>
>> Yeah, in general this behavior is completely expected - though I'd argu=
e that protecting VRAM via dmemcg influences the semantics a little here.
>>
>> Giving GTT|VRAM as placement from userspace essentially says "ok, pleas=
e try allocating this in VRAM, but it's ok to fall back to GTT" - whereas =
specifying VRAM only essentially says "ok, please allocate this in VRAM, a=
nd really try hard to keep it in VRAM whatever the cost".
>>
>> Usually, resource allocation failing is good enough of an indicator tha=
t it's not possible to allocate in VRAM. However, when the application's m=
emory is protected by dmemcg, it essentially says that it actually should =
be possible to allocate up to that amount of memory - the cgroup is entitl=
ed to that memory, and the other unprotected cgroups have to make do with =
the rest.
>>
>> I think it's a justifiable tradeoff between the indended function of VR=
AM|GTT and the intended function of dmem memory protection to evict these =
unprotected cgroups for only as long as the usage doesn't exceed the award=
ed protection - this is what this series implements (dropping the GTT flag=
 in userspace would have negative implications in the case the app uses mo=
re memory than the protection afforded to it, and as I described, just let=
ting protected memory allocations fall back to GTT is insufficient too).
>=20
> Yeah, that is a really good point and the argumentation makes sense.
>=20
> So the semantics of dmem should be that be that it basically guarantees =
that if the application requested x amount of VRAM that it gets at least x=
 amount of VRAM.
>=20
> The problem is where is that documented? This is part of UAPI so we pret=
ty much need to nail down what should happen before we enforce it.

We do have (arguably terse) dmem cgroup documentation[1].

Perhaps we could outline this more explicitly, but the documentation for=
=20
the dmem.min/dmem.low interface files (that govern memory protection)=20
mention that the same semantics as for memcg's memory.min/memory.low apply=
.

 From memcg documentation there is this, for memory.low:
 > Best-effort memory protection. If the memory usage of a cgroup is
 > within its effective low boundary, the cgroup=E2=80=99s memory won=E2=
=80=99t be
 > reclaimed unless there is no reclaimable memory available in
 > unprotected cgroups.

dmem covers eviction instead of CPU memory reclaim, but if you=20
s/reclaim/evict/g in the doc text, you'll get exactly the behavior we=20
currently do: We first try to evict all unprotected memory, and memory=20
protected by dmem.low is only touched if we need to evict even more.

Put shortly, an (effective) dmem.low value of x guarantees that you will=
=20
get at least x bytes of vram, save for cases where the kernel really=20
really has to evict and has no other choice.

There is also memory.min and dmem.min, which prevents eviction under=20
*any* circumstance. Of course, setting either of these (both dmem and=20
memcg) to a high value is dangerous because it may cause important=20
things to crash from OOMs.

A lot of other things from the memcg documentation don't really apply to=
=20
dmem though (for example, we can't do evictions proportional to how much=
=20
unprotected memory apps are using), so you're probably right that this=20
documentation could be much improved. :)

Thanks,
Natalie

[1] https://docs.kernel.org/admin-guide/cgroup-v2.html#dmem

>=20
> Regards,
> Christian.
>=20
>>
>> Thanks,
>> Natalie
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> This series tries to alleviate this by adding a special case when the
>>>> allocation is protected by cgroups: Instead of backing off immediatel=
y,
>>>> TTM will try evicting unprotected buffers from the domain to make spa=
ce
>>>> for the protected one. This ensures that applications can actually us=
e
>>>> all the memory protection awarded to them by the system, without bein=
g
>>>> prone to ping-ponging (only protected allocations can evict unprotect=
ed
>>>> ones, never the other way around).
>>>>
>>>> The first two patches just add a few small utilities needed to implem=
ent
>>>> this to the dmem controller. The second two patches are the TTM
>>>> implementation:
>>>>
>>>> "drm/ttm: Be more aggressive..." decouples cgroup charging from resou=
rce
>>>> allocation to allow us to hold on to the charge even if allocation fa=
ils
>>>> on first try, and adds a path to call ttm_bo_evict_alloc when the
>>>> charged allocation falls within min/low protection limits.
>>>>
>>>> "drm/ttm: Use common ancestor..." is a more general improvement in
>>>> correctly implementing cgroup protection semantics. With recursive
>>>> protection rules, unused memory protection afforded to a parent node =
is
>>>> transferred to children recursively, which helps protect entire
>>>> subtrees from stealing each others' memory without needing to protect
>>>> each cgroup individually. This doesn't apply when considering direct
>>>> siblings inside the same subtree, so in order to not break
>>>> prioritization between these siblings, we need to consider the
>>>> relationship of evictor and evictee when calculating protection.
>>>> In practice, this fixes cases where a protected cgroup cannot steal
>>>> memory from unprotected siblings (which, in turn, leads to eviction
>>>> failures and new allocations being placed in GTT).
>>>>
>>>> Thanks,
>>>> Natalie
>>>>
>>>> Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
>>>> ---
>>>> Natalie Vock (4):
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cgroup/dmem: Add queries for pr=
otection values
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cgroup/dmem: Add dmem_cgroup_co=
mmon_ancestor helper
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/ttm: Be more aggressive whe=
n allocating below protection limit
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/ttm: Use common ancestor of=
 evictor and evictee as limit pool
>>>>
>>>>  =C2=A0 drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 79 ++++++++++++++++++++++++++++++++------
>>>>  =C2=A0 drivers/gpu/drm/ttm/ttm_resource.c | 48 ++++++++++++++++-----=
=2D-
>>>>  =C2=A0 include/drm/ttm/ttm_resource.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 6 ++-
>>>>  =C2=A0 include/linux/cgroup_dmem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 25 ++++++++++++
>>>>  =C2=A0 kernel/cgroup/dmem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 73 +++++++++++++++++++++++=
++++++++++++
>>>>  =C2=A0 5 files changed, 205 insertions(+), 26 deletions(-)
>>>> ---
>>>> base-commit: f3e82936857b3bd77b824ecd2fa7839dd99ec0c6
>>>> change-id: 20250915-dmemcg-aggressive-protect-5cf37f717cdb
>>>>
>>>> Best regards,
>>>
>>
>=20

