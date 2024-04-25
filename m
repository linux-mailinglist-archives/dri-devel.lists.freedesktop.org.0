Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 243508B1B6D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 09:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A6C11A205;
	Thu, 25 Apr 2024 07:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="Zfb1td1R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7CE11A20B;
 Thu, 25 Apr 2024 07:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1714028769; x=1714633569; i=friedrich.vock@gmx.de;
 bh=i4akl77UZzHLeMcH8ZDdpPqlIvG32xply5EC17WzyLM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Zfb1td1RrGD+DN74/mfKu6b5SzTyI1WMdzqvfh8g51LaCkqIpM3GOPvrqSJiDmC+
 b+Lc2biBtRONPcND0VjW0rOE0U8ZcGIp2izb9DWtNaCq1YX2R5shfZdnccWRrYoAk
 B2ed4Ia9ooRgBhAyDZ//SbgfRt03MCkPsaL/kYNTjNAUbc4tAsPvDvldSzBzX2K16
 hz5lZL/wZ+akk63sGyTYGqkMZ3cYf0AT63eLMKIwqiQlzKkUew4Bym3TuS4yWn87W
 msq6nEaV1KZaaBXWNlm7uIsfOHaBtn/NnaZI65+b6vhljj5ajCh1rgTCGhpMCMjd7
 AtpXqMXGNC3XCc1Mww==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.177.3] ([213.152.117.111]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MXp9i-1sC7Zd3KDU-00YC8w; Thu, 25
 Apr 2024 09:06:09 +0200
Message-ID: <38a23351-6f16-462b-be02-187829e3c2c2@gmx.de>
Date: Thu, 25 Apr 2024 09:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 16/18] drm/amdgpu: Implement SET_PRIORITY GEM op
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, Joshua Ashton
 <joshua@froggi.es>, Alex Deucher <alexander.deucher@amd.com>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
 <20240424165937.54759-17-friedrich.vock@gmx.de>
 <e5224fdf-ecc0-41f2-a7d9-42e3937f2e63@amd.com>
 <6830272c-e3c0-4d54-aa10-6c96c1e644fc@gmx.de>
 <b2e62f12-4490-4438-a54f-10e0c4a4e793@amd.com>
Content-Language: en-US
From: Friedrich Vock <friedrich.vock@gmx.de>
Autocrypt: addr=friedrich.vock@gmx.de; keydata=
 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
 f7+xmX0X3AMtWz/15Y+7cPO2
In-Reply-To: <b2e62f12-4490-4438-a54f-10e0c4a4e793@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Y0QBqvKbPfVgzcLUvYmFhMXoH7oUew7Ug3N5kO2upDQsVJO5G0A
 9FHSKOIYFciqoeFaaF3az5ldMHQOz0TvogyEh1k88/yOVxLw/M/Et2Y0KS/k3SLfaQyYN3W
 RYI+9tY92Mv+aBlLq9T1fYsLpmg72txtphMUOGwVtOumw9lXOFbRXQXOtSnEbW2FWPGmh/P
 0tk3krv9JqKpI71z4+zlA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bGIqeVrX8Ng=;powqPkkx/cfx56WIvaSNHvNBZUS
 NOEjdO2uvXCavAYynGgrk5jCM8gebU0wVF75argzDa+9a5roEYoOfD6RooDIxBKwACwabfqot
 pNgJZknGQfL1+FVnAA8iNauDIMA5EmDJniLgXCBvg/+MM9BKQqbXm9f0NcYZw87QcZU6qeaUU
 2yp5c7gSESoR1NFQS/PCd0lWPdCrXFg2SpiYocTFZEZYWrJ9sw0wA3nnLW+PSsy63lwqrD/js
 Y81WiOTrA78UG5O0eEnVC3bXPXKjUHW/2gt13SoWAP3Ef0zvD0Y6UsLx08IBz9YLcFv+66jWF
 hwX5m3wtm7ir5HRuJ6F50gw56zjToDXtPYnEJ8rhcCbA19cX5ixCr4atBT1ZNJ3Is3A94Zvwd
 jrwA0ESaLl/EIUKOu6fcAakkgVX0FWZhhZOY6Ii7nNMICNUI9w+6FV+UcSMJWXUxsxDFpEBjp
 wxOFflt7Q3Dk5TCB4qjYLkDE97q0Oq8Yg0PEl/8CgR1BD58KXnnfE7+a7W5kq2KQRLAijt6UL
 6uDYc4cnL8lxGH0hGNxl3zLbQWW/m0fuvCiFzXTYXyZ9FaYiWlAfKwkSbdSRjNSTDpGpV1gX5
 tRWgfXbW2NlU3XIQMMgpg9mt7mbcEtFjcFU77nwSlpu9UEEFqvTjJA1e0A8JErZFBHfXR3jml
 R1r8zZCgaHSI9cvhf3TOC7v+Gt4JeBbOvgHPipd5EbjaXDAYHnhj6tCTQQhBD48b6pbyn5w84
 26uK73S+o4hW4ewL2RTAQ+PYYdXDxEgs7FkPPyT7YqAna4JDpAovuh9dvVvESfJjhzDtLS0iS
 h8UJfAl+1yM9KwLm2Ugn0duvyA94/4kigW6uGDfJqa8n8=
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

On 25.04.24 08:58, Christian K=C3=B6nig wrote:
> Am 25.04.24 um 08:46 schrieb Friedrich Vock:
>> On 25.04.24 08:32, Christian K=C3=B6nig wrote:
>>> Am 24.04.24 um 18:57 schrieb Friedrich Vock:
>>>> Used by userspace to adjust buffer priorities in response to
>>>> changes in
>>>> application demand and memory pressure.
>>>
>>> Yeah, that was discussed over and over again. One big design criteria
>>> is that we can't have global priorities from userspace!
>>>
>>> The background here is that this can trivially be abused.
>>>
>> I see your point when apps are allowed to prioritize themselves above
>> other apps, and I agree that should probably be disallowed at least for
>> unprivileged apps.
>>
>> Disallowing this is a pretty trivial change though, and I don't really
>> see the abuse potential in being able to downgrade your own priority?
>
> Yeah, I know what you mean and I'm also leaning towards that
> argumentation. But another good point is also that it doesn't actually
> help.
>
> For example when you have desktop apps fighting with a game, you
> probably don't want to use static priorities, but rather evict the
> apps which are inactive and keep the apps which are active in the
> background.
>
Sadly things are not as simple as "evict everything from app 1, keep
everything from app 2 active". The simplest failure case of this is
games that already oversubscribe VRAM on their own. Keeping the whole
app inside VRAM is literally impossible there, and it helps a lot to
know which buffers the app is most happy with evicting.
> In other words the priority just tells you which stuff from each app
> to evict first, but not which app to globally throw out.
>
Yeah, but per-buffer priority system could do both of these.

Regards,
Friedrich

> Regards,
> Christian.
>
>>
>> Regards,
>> Friedrich
>>
>>> What we can do is to have per process priorities, but that needs to be
>>> in the VM subsystem.
>>>
>>> That's also the reason why I personally think that the handling
>>> shouldn't be inside TTM at all.
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
>>>> ---
>>>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 20 +++++++++++++++++=
+++
>>>> =C2=A0 include/uapi/drm/amdgpu_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>>> =C2=A0 2 files changed, 21 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>> index 5ca13e2e50f50..6107810a9c205 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>> @@ -836,8 +836,10 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev,
>>>> void *data,
>>>> =C2=A0 {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_device *adev =3D drm_to_=
adev(dev);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_amdgpu_gem_op *args =3D dat=
a;
>>>> +=C2=A0=C2=A0=C2=A0 struct ttm_resource_manager *man;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gem_object *gobj;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_vm_bo_base *base;
>>>> +=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx ctx;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_bo *robj;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int r;
>>>>
>>>> @@ -851,6 +853,9 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev,
>>>> void *data,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (unlikely(r))
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>>>>
>>>> +=C2=A0=C2=A0=C2=A0 memset(&ctx, 0, sizeof(ctx));
>>>> +=C2=A0=C2=A0=C2=A0 ctx.interruptible =3D true;
>>>> +
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (args->op) {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case AMDGPU_GEM_OP_GET_GEM_CREATE_INFO=
: {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_amd=
gpu_gem_create_in info;
>>>> @@ -898,6 +903,21 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev,
>>>> void *data,
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_bo_unre=
serve(robj);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> +=C2=A0=C2=A0=C2=A0 case AMDGPU_GEM_OP_SET_PRIORITY:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (args->value > AMDGPU_=
BO_PRIORITY_MAX_USER)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 a=
rgs->value =3D AMDGPU_BO_PRIORITY_MAX_USER;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_update_priority(&r=
obj->tbo, args->value);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (robj->tbo.evicted_typ=
e !=3D TTM_NUM_MEM_TYPES) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t=
tm_bo_try_unevict(&robj->tbo, &ctx);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 a=
mdgpu_bo_unreserve(robj);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 a=
mdgpu_bo_unreserve(robj);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 m=
an =3D ttm_manager_type(robj->tbo.bdev,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 robj->tbo.resource->mem_type);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t=
tm_mem_unevict_evicted(robj->tbo.bdev, man,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t=
rue);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_bo_unre=
serve(robj);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D -EINVAL;
>>>> diff --git a/include/uapi/drm/amdgpu_drm.h
>>>> b/include/uapi/drm/amdgpu_drm.h
>>>> index bdbe6b262a78d..53552dd489b9b 100644
>>>> --- a/include/uapi/drm/amdgpu_drm.h
>>>> +++ b/include/uapi/drm/amdgpu_drm.h
>>>> @@ -531,6 +531,7 @@ union drm_amdgpu_wait_fences {
>>>>
>>>> =C2=A0 #define AMDGPU_GEM_OP_GET_GEM_CREATE_INFO=C2=A0=C2=A0=C2=A0 0
>>>> =C2=A0 #define AMDGPU_GEM_OP_SET_PLACEMENT=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 1
>>>> +#define AMDGPU_GEM_OP_SET_PRIORITY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2
>>>>
>>>> =C2=A0 /* Sets or returns a value associated with a buffer. */
>>>> =C2=A0 struct drm_amdgpu_gem_op {
>>>> --
>>>> 2.44.0
>>>>
>>>
>
