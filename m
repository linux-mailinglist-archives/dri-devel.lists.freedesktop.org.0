Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8DD8C4368
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 16:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D1A10E7EB;
	Mon, 13 May 2024 14:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="uhJsZpzZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 312 seconds by postgrey-1.36 at gabe;
 Mon, 13 May 2024 14:42:26 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE31610E4E2;
 Mon, 13 May 2024 14:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1715611345; x=1716216145; i=friedrich.vock@gmx.de;
 bh=a8fQ+P3zm2qc0WATNnbNqbmXMkFbxJZKHOKcIqN7CkY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=uhJsZpzZsjg4G/NdQIXmOWbHp/05CbWf+0cx6BsTjTArwcCcItSAYFpv24qGTEIK
 88DHQVZiU4+AUK+cql5PSVlBnmkajl0Q8tGop8wRdGOZe9zkVSANbuUqHo97DAJ6C
 zfYRqLeJUSMait3WO3iKTqcwY6LRdNkPHLFGwz7hTz62OE9pC0t+EyIPluFsn1ufT
 KiNqEJ8nXjpoRO6LuRQpuYZU+j6uH+ZWRMiqGyJDPVVotqRYvddD8eDVIX8KPJc8t
 dB6VIL1qYf7kBDe0SyIoZ+xtutEiopiEsyI42A1WioVPklM8cngnX2Sybmnsva98Y
 Si5JtE7iYm08H+0eTw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.177.3] ([213.152.117.111]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKKYx-1rs1of0wE3-00IHI1; Mon, 13
 May 2024 16:36:54 +0200
Message-ID: <7fc5ff77-19ba-477f-8693-6dd93cfa2d97@gmx.de>
Date: Mon, 13 May 2024 16:36:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/5] drm/amdgpu: Fix migration rate limiting accounting
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
References: <20240508180946.96863-1-tursulin@igalia.com>
 <20240508180946.96863-2-tursulin@igalia.com>
 <146d615c-6eb1-491a-9494-cacb9337f13e@gmx.de>
 <1a2788ef-6969-4f4c-95e9-cf5f2c7e0872@igalia.com>
Content-Language: en-US
From: Friedrich Vock <friedrich.vock@gmx.de>
Autocrypt: addr=friedrich.vock@gmx.de; keydata=
 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
 f7+xmX0X3AMtWz/15Y+7cPO2
In-Reply-To: <1a2788ef-6969-4f4c-95e9-cf5f2c7e0872@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1/fxiGDIIfaG819CxdPby8k3NsVqxsyziZhL2wYKxwIWYnREeNr
 U94bTm8+LBg2FsfdtoC6tIJ7FiS/M24QqRw+otyXPSENzr2t3bxUFXl1QGTx0t5Ad0XWu5S
 W2PyTMSja/IjLNpw/tMQo+O9oieLlCWrUQWa08s/Qtulj5ilOs5udVYgQV3SL8NSQ6ahwcg
 k+U7QeOhHGZTW4T5/IPvQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:emBgqn01NmU=;x6qm44+OFZorANseSpCuzfbaF8t
 oXJ8qN1UHkXNebaafgHKk5ZaSbRFZUE2REiB6iz3Npr33ilGVh8N+/Uo7miEWG4nE2bQYtFt+
 ixUiWSLncHdY1uEMLrxOz+CLveUC4H93T85yDJa244TqXKid3A0UMOym9NVjuLH70rh2iIA2j
 lG5fTBlCUVHuDIAS8PkWtWaxzlT4oIXZFz6pVgHOh0j3OfHOp7GiZ1pZTG+CHba8j6538vC0F
 ax5spC1/8rrYmA3ppg4oWEDShf6YVE5BIZManR4PCmiDQca65cFerZtNtrWw2FFXX8v/nl4di
 TaNKE5sMxWRHJ1yhFeR+zMm9m1UggHuQCABNOLN7XARffy/D05Px8Q7wZ+yUPn7Gtyf45gQpM
 6jyWX1UT+N1jHq3zNUlb4rHyVM/vfjE+mVAy52o0poiKzy0mAfVmL7/akEh/NRIkYaA1UShYQ
 wpUlL+1NguM7uUJLYJa0AKil5ezM1uAxQi5r72a569n18mFe5GdxNlAKPYTH3qtMm1wcQjn/z
 gtHDV8cqdSbOd+KFrWnzGwDDA5F8XHi44jnO5XgXmFd4Eg0IfidU4uRcYZuu6P8nl8a8is3if
 JARfauUBkGmY9GKelMKbPz2JUkJ9N0OxgUfEYjqaKDqN4kA1o73qW2eMExrDUIUu4HIIiYGqD
 OGaJJLS6SPajZqcnTAnqNRPxXErzmQ7h1QViAtr3YdcJ89/e/ap4b9KXg5u1NAxZGKPT5IVo4
 hTD8Z0Wf+7Q0DcCO+Jxn9warKMT2UBcQYZGXo2MkABkPaMq1Hw0wcDKOLsf4x5Sp6S0j39ks5
 x+QGyTbaKZjTogxOMXHxBQEgh6zIbcks6awGrNkZHTGBg=
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

On 09.05.24 11:19, Tvrtko Ursulin wrote:
>
> On 08/05/2024 20:08, Friedrich Vock wrote:
>> On 08.05.24 20:09, Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>
>>> The logic assumed any migration attempt worked and therefore would
>>> over-
>>> account the amount of data migrated during buffer re-validation. As a
>>> consequence client can be unfairly penalised by incorrectly considerin=
g
>>> its migration budget spent.
>>
>> If the migration failed but data was still moved (which I think could b=
e
>> the case when we try evicting everything but it still doesn't work?),
>> shouldn't the eviction movements count towards the ratelimit too?
>
> Possibly, which path would that be?
>
Thinking about it more, the only case where allocation still won't
succeed after evicting everything from a place is the edge case when the
buffer is larger than the place's size.

The most likely condition for this to happen (without the submission
failing entirely because the buffer just doesn't fit anywhere) would be
if the app tries creating a 256MB+ visible-VRAM buffer if resizeable BAR
is disabled.
This case could potentially trigger an allocation failure when trying
with preferred_domains, but retrying with allowed_domains, which
includes GTT, could subsequently work.

> I mean there are definitely more migration which *should not* be
> counted which I think your mini-series approaches more accurately.
> What this patch achieves, in its current RFC form, is reduces the
> "false-positive" migration budget depletions.
>
> So larger improvements aside, point of the series was to illustrate
> that even the things which were said to be working do not seem to. See
> cover letter to see what I thought does not work either well or at all.
Fair point. If this patchset does "wrong"/inaccurate accounting in a
different way that improves the experience, then it's still an improvement=
.
>>> Fix it by looking at the before and after buffer object backing
>>> store and
>>> only account if there was a change.
>>>
>>> FIXME:
>>> I think this needs a better solution to account for migrations between
>>> VRAM visible and non-visible portions.
>>
>> FWIW, I have some WIP patches (not posted on any MLs yet though) that
>> attempt to solve this issue (+actually enforcing ratelimits) by moving
>> the ratelimit accounting/enforcement to TTM entirely.
>>
>> By moving the accounting to TTM we can count moved bytes when we move
>> them, and don't have to rely on comparing resources to determine whethe=
r
>> moving actually happened. This should address your FIXME as well.
>
> Yep, I've seen them. They are not necessarily conflicting with this
> series, potentialy TTM placement flag aside. *If* something like this
> can be kept small and still manage to fix up a few simple things which
> do not appear to work at all at the moment.
>
> For the larger re-work it is quite, well, large and it is not easy to
> be certain the end result would work as expected. IMO it would be best
> to sketch out a larger series which brings some practical and
> masurable change in behaviour before commiting to merge things piecemeal=
.
>
Yeah, fully agree. Getting something working and iterating on that based
on the results you get seems like the best way forward, that's what I'll
be focusing on for now.

Thanks,
Friedrich

> For instance I have a niggling feeling the runtime games driver plays
> with placements and domains are not great and wonder if things could
> be cleaner if simplified by letting TTM manage things more, more
> explicitly, and having the list of placements more static. Thinking
> about it seems a step too far for now though.
>
> Regards,
>
> Tvrtko
>
>>
>> Regards,
>> Friedrich
>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>>> Cc: Friedrich Vock <friedrich.vock@gmx.de>
>>> ---
>>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 26
>>> +++++++++++++++++++++-----
>>> =C2=A0 1 file changed, 21 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> index ec888fc6ead8..22708954ae68 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> @@ -784,12 +784,15 @@ static int amdgpu_cs_bo_validate(void *param,
>>> struct amdgpu_bo *bo)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .no_wait_gpu =
=3D false,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .resv =3D bo->t=
bo.base.resv
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>> +=C2=A0=C2=A0=C2=A0 struct ttm_resource *old_res;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t domain;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int r;
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (bo->tbo.pin_count)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>
>>> +=C2=A0=C2=A0=C2=A0 old_res =3D bo->tbo.resource;
>>> +
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Don't move this buffer if we have de=
pleted our allowance
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * to move it. Don't move anything=
 if the threshold is zero.
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> @@ -817,16 +820,29 @@ static int amdgpu_cs_bo_validate(void *param,
>>> struct amdgpu_bo *bo)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_bo_placement_from_domain(bo, dom=
ain);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D ttm_bo_validate(&bo->tbo, &bo->pl=
acement, &ctx);
>>>
>>> -=C2=A0=C2=A0=C2=A0 p->bytes_moved +=3D ctx.bytes_moved;
>>> -=C2=A0=C2=A0=C2=A0 if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_res_cpu_visible(ade=
v, bo->tbo.resource))
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p->bytes_moved_vis +=3D ct=
x.bytes_moved;
>>> -
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (unlikely(r =3D=3D -ENOMEM) && domai=
n !=3D bo->allowed_domains) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 domain =3D bo->=
allowed_domains;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto retry;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>
>>> +=C2=A0=C2=A0=C2=A0 if (!r) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource *new_r=
es =3D bo->tbo.resource;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool moved =3D true;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (old_res =3D=3D new_res=
)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mo=
ved =3D false;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (old_res && new_re=
s &&
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 old_res->mem_type =3D=3D new_res->mem_type)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mo=
ved =3D false;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (moved) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p-=
>bytes_moved +=3D ctx.bytes_moved;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 amdgpu_res_cpu_visible(adev, bo->tbo.resource))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 p->bytes_moved_vis +=3D ctx.bytes_moved;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return r;
>>> =C2=A0 }
>>>
