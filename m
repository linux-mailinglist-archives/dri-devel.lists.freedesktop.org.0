Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7B58B1C0C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 09:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944C911A23B;
	Thu, 25 Apr 2024 07:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="b/ehocMo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D316011A23E;
 Thu, 25 Apr 2024 07:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1714030773; x=1714635573; i=friedrich.vock@gmx.de;
 bh=BxTN5uPh4kaMi+ageMypSqDleNRT7EV1VUYxXUFAkO8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=b/ehocMom6MM5nOQk9QKOCuqN9V01CrI1pH/DmIygFcxdpV4o8VnRUpf5qTyo6YN
 VL7NeASymAnxMP/sCbV9cpKddACunFnAZPPKg12Vu70LAwhXe+ExY6tvF2wdOVdfy
 FeCiXq4ukF4DrxlEl6usbdQZRHnynqEkgUj8pSfgSRj00KsERW/TEBF4jQMmxBGOA
 kNlOyyzh9iz9UIhIidLTgc7YKcyTeSLTNIldCjKrIFkwHMUSx9Gnl72KaKiLRSH74
 O/A5IgCWHNfr1QIt0ToFxnacyNqELIo8WLWDRV0rT5fMOL4Dcm4fIGNieRU3VrCF7
 FnQOYZeYpC6ThI6aww==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.177.3] ([213.152.117.111]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7sDg-1s3laA3w5C-0060W0; Thu, 25
 Apr 2024 09:39:33 +0200
Message-ID: <6cca42e1-1e36-4e16-9dfb-f2c3cc96706c@gmx.de>
Date: Thu, 25 Apr 2024 09:39:30 +0200
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
 <38a23351-6f16-462b-be02-187829e3c2c2@gmx.de>
 <0031da6c-3064-4603-9af4-ae684842e4e1@amd.com>
Content-Language: en-US
From: Friedrich Vock <friedrich.vock@gmx.de>
Autocrypt: addr=friedrich.vock@gmx.de; keydata=
 xsDNBGPTxTYBDACuXf97Zpb1IttAOHjNRHW77R759ueDHfkZT/SkWjtlwa4rMPoVdJIte9ZY
 +5Ht5+MLdq+Pjd/cbvfqrS8Q+BBwONaVzjDP35lQdim5sJ/xBqm/sozQbGVLJ/szoYhGY+va
 my9lym47Z14xVGH1rhHcXLgZ0FHbughbxmwX77P/BvdI1YrjIk/0LJReph27Uko8WRa3zh6N
 vAxNk6YKsQj4UEO30idkjmpw6jIN2qU7SyqKmsI+XnB9RrUyisV/IUGGuQ4RN0Rjtqd8Nyhy
 2qQGr8tnbDWEQOcdSCvE/bnSrhaX/yrGzwKoJZ8pMyWbkkAycD72EamXH13PU7A3RTCrzNJa
 AKiCvSA9kti4MRkoIbE+wnv1sxM+8dkDmqEY1MsXLTJ4gAkCnmsdGYz80AQ2uyXD06D8x/jR
 RcwbRbsQM5LMSrXA0CDmNXbt5pst7isDbuoBu1zerqy2ba+rf6sxnSnCzQR6SuE0GB7NYV8A
 lrNVyQlMModwmrY2AO3rxxcAEQEAAc0mRnJpZWRyaWNoIFZvY2sgPGZyaWVkcmljaC52b2Nr
 QGdteC5kZT7CwQ4EEwEIADgWIQT3VIkd33wSl/TfALOvWjJVL7qFrgUCY9PFNgIbAwULCQgH
 AgYVCgkICwIEFgIDAQIeAQIXgAAKCRCvWjJVL7qFro7GC/9PfV0ICDbxBoILGLM6OXXwqgoC
 HkAsBEXE/5cS68TT++YXMHCetXpFfBIwTe8FlBcbhtylSYIUhFLmjiGfgoXy5S87l9osOp1G
 y3+RNbFoz4OJvqcXX5BqFK5KHh7iL/Q6BaZB9u3es0ifFt5YMwhDgcCbYaLUlTPbl+5m+/ie
 Eori0ASylvhz3EdB11sMqN9CmoKvBEVnkdiydDMuFvpEi08WB8ZC8qckiuwrLOIa4/JB54E2
 QyGw0KgBT4ApeMmkKurS3UOsrAwoKKP/0rgWsBFVnXrBIOEL+7/HGqSSDboLAjt1qE967yxM
 3Qzt1FUBU9db2biFW7O3TmXP31SyPwVYWfeETa4MT9A8EyjfWF66+sfPXREsBvqRTin3kEst
 IlbMdSNijCjKZz9XPCaKwx3hJaD5VEs3gPsKa9qXOQftfTqt+SI0nYBw3sdT2+wWJCeyZ3aE
 L0Us8uMILncTxVAhX2a8pUvGrbtuyW2qqEFId1OSfWlrLZEuv8+631fOwM0EY9PFNgEMAKx2
 G48lrQ1bLAWgjq3syyswS80e70M+/Fbxb2aBKRHw5XbpSPYr9FLE3MPdgvUtt+fiK2xA69bk
 i86sfSV2KNhRuiS2rb1h/jfmTlxfimBezHv6xnzVuHJNd87vL35lqd0D6B5zvnzzP9CjpXq/
 o7isfiA2FMSOI1OnrHEw9pbEd1B26cgS+mIGhDf/gBI6MtsPuN8xMUyybtpUSSVi3b4oRkge
 +vwwbMn+vwvhN39kjcISAT+jFWNupDybFIs8cYNWA7MkWJAIuqSjMydE0l1+c8eF7nnvzY2o
 2GGarFmxNO4CHuh3JoMFfY4wlKjmDlk+FJ5UfIFelVmOiVPLGrSL8ggcubnOS75VjDvDTQgY
 tjDvLuUmOj1vYSmPSE9PjDMhrpx1LcSOHyV+aX0NQeHP869A/YLjwQbOJBJVIN+XdsGlnwG5
 teXXxU9uwFDqYPAneHp4As5OKovOCIzNj6EB4MIZIpTGgYQBIN4xrwL0YsjvPm2i1RyBPTpf
 UKvjVQARAQABwsD2BBgBCAAgFiEE91SJHd98Epf03wCzr1oyVS+6ha4FAmPTxTYCGwwACgkQ
 r1oyVS+6ha4Hlgv/Z2q6pSxeCjK/g20vub8Gvg09jNYAle3FTaJD2Jd/MhUs6s9Y5StWtiDf
 hw27O8bhJan1W4hrngQceR2EcvKxejroVhu3UI2b9ElM5aphD2IolOWqfwPXeUetIgaMNqTl
 GJ9rGx+k8HCpchW4QVZfWn7yM+IymCwOYov+36vMMHd8gdQ0BxMiT2WLDzCWwDb+/PYMfOiq
 AoPBV5EQ2K3x85wl9N4OxiQdGWi9+/0KJyMPYoGlFqCdPdvvbpFe4XD6YOBr3HmVOFCWtLcW
 Bm+BCucpo93VhjNVqZ+cuN/tlS+Px8kl0qW9J3Q8fwWhgz69v5YdiOczQza/zQu3YrcYapBD
 kQXSmDju1Yd4jIGeZ8vf+dnmbX78mpj3nBmYLhIs5lszAH634uoWyJqMLs77WG1pkk0utvwh
 Zvq4r6fbLIuofLsboYKQxUJuX5uRSK4/hWXEETUTxxvkA/hiuhsdMbDWIZWFp8yuoZvR2itT
 f7+xmX0X3AMtWz/15Y+7cPO2
In-Reply-To: <0031da6c-3064-4603-9af4-ae684842e4e1@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jL0AJphihadtDnfoRluL8+X2EBhkfUEKcRCLjwHVXkKOGzGNND3
 ZMTWiOPTX26XxNA4nespqAnOIY2/0Yrx8EFi5NWQHGTCYZ4SLWYiT28g/+AItXgbCj+Xe0a
 SC5Vp3hBACJbBNV90hgigZHosvlYhP5kRKocAB26p5cCryFsKm52BPmImEuc21VF1U34KT0
 jkvd0Kr0p0ZcQdVFGfwCw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:W5ZDSByRXU8=;bUjVq5cHpxh6OU+KJEnZpJ0H75I
 B5SZnG9YF249YuWxLR93HbrJu5szu0CewTI95lZxP8tXwiSphj2Arhu3DziEJTP49fgai7XPJ
 sDSwpQgWom5tENsrTnTOQZU91G5I41b1IIiAmuxCRs4CG75nCe3mD9p5tkSlPxGygjubLCQy5
 8aq/pcqkirKFZw9i/9MvOX5YA6LGyJgPF5ENr7Jpc+RFtU+8noEWdZdIh/qcUHnH5ZEt6lgml
 29YUVJ51lktiMRk8rlor06To/fv47IUnrw+xfFaxJwCas1dsFH/andHoAm5wCZ0VHGCO04tQz
 94W24A8v9cSiFI0itM9l/JFQXVREToM+3uE9FELfGoe0oY9FCfBXIS0+FatTZm4kRhUZs3gTQ
 cfnOMHkBZaJ++ALkHPNm7QuYkpS09ocbCx2i/2STb3klw3ho5/9FPr/vPx10OOi84cGFUTjMx
 nB+O9X/0l2+VOdLHnHgKRqD9vblGwWuPmlroboqXXd5rBdWclkQC7+fRHtrGWQw5eAWut8CA1
 k+j825/Mr3g0dk8abC2iSZWnWVbHCDajwio2oYXS51V1wRUkUfqJNcoKj+A71i7iXRfTMfP9y
 DbmmA3G2Td4sREuLIUdoqN44LiD9ps8z9rhYZl45cSjdWxAiWmsiQMAY+Z3GFNX7aOotjhV7Y
 Voq1AUHcUZM2jHd5H55arXuFLzEGUVYGQK/pDXMSTbZQvTS2TDoXgXi7Hpw6erbJseWYOhvWU
 9fUGAVi2Rf7BL7zG4CRfok6moMLHj83NNtpBgqV7rqdfhG7HkgqfbnywcxTiyzgGtt3CmIQO9
 FghWFDm3l0lMWEBWxifqx64Fw9HDNzdjdRUBfW6pobWTo=
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

On 25.04.24 09:15, Christian K=C3=B6nig wrote:
> Am 25.04.24 um 09:06 schrieb Friedrich Vock:
>> On 25.04.24 08:58, Christian K=C3=B6nig wrote:
>>> Am 25.04.24 um 08:46 schrieb Friedrich Vock:
>>>> On 25.04.24 08:32, Christian K=C3=B6nig wrote:
>>>>> Am 24.04.24 um 18:57 schrieb Friedrich Vock:
>>>>>> Used by userspace to adjust buffer priorities in response to
>>>>>> changes in
>>>>>> application demand and memory pressure.
>>>>>
>>>>> Yeah, that was discussed over and over again. One big design criteri=
a
>>>>> is that we can't have global priorities from userspace!
>>>>>
>>>>> The background here is that this can trivially be abused.
>>>>>
>>>> I see your point when apps are allowed to prioritize themselves above
>>>> other apps, and I agree that should probably be disallowed at least
>>>> for
>>>> unprivileged apps.
>>>>
>>>> Disallowing this is a pretty trivial change though, and I don't reall=
y
>>>> see the abuse potential in being able to downgrade your own priority?
>>>
>>> Yeah, I know what you mean and I'm also leaning towards that
>>> argumentation. But another good point is also that it doesn't actually
>>> help.
>>>
>>> For example when you have desktop apps fighting with a game, you
>>> probably don't want to use static priorities, but rather evict the
>>> apps which are inactive and keep the apps which are active in the
>>> background.
>>>
>> Sadly things are not as simple as "evict everything from app 1, keep
>> everything from app 2 active". The simplest failure case of this is
>> games that already oversubscribe VRAM on their own. Keeping the whole
>> app inside VRAM is literally impossible there, and it helps a lot to
>> know which buffers the app is most happy with evicting.
>>> In other words the priority just tells you which stuff from each app
>>> to evict first, but not which app to globally throw out.
>>>
>> Yeah, but per-buffer priority system could do both of these.
>
> Yeah, but we already have that. See amdgpu_bo_list_entry_cmp() and
> amdgpu_bo_list_create().
>
> This is the per application priority which can be used by userspace to
> give priority to each BO in a submission (or application wide).
>
> The problem is rather that amdgpu/TTM never really made good use of
> that information.
>
I think it's nigh impossible to make good use of priority information if
you wrap it in the BO list which you only know on submit. For example,
you don't know when priorities change unless you duplicate all the
tracking work (that the application has to do too!) in the kernel. You
also have no way of knowing the priority changed until right when the
app wants to submit work using that BO, and starting to move BOs around
at that point is bad for submission latency. That's why I didn't go
forward with tracking priorities on a BO-list basis.

Also, the priorities being local to a submission is actually not that
great when talking about lowering priorities. Consider a case where an
app's working set fits into VRAM completely, but combined with the
working set of other apps running in parallel, VRAM is oversubscribed.
The app recognizes this and asks the kernel to evict one of its
rarely-used buffers by setting the priority to the lowest possible, to
make space for the other applications.
Without global priorities, the kernel can't honor that request, even
though it would solve the oversubscription with minimal performance
impact. Even with per-app priorities, the kernel isn't likely to evict
buffers from the requesting application unless all the other
applications have a higher priority.

Regards,
Friedrich

> Regards,
> Christian.
>
>>
>> Regards,
>> Friedrich
>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Regards,
>>>> Friedrich
>>>>
>>>>> What we can do is to have per process priorities, but that needs
>>>>> to be
>>>>> in the VM subsystem.
>>>>>
>>>>> That's also the reason why I personally think that the handling
>>>>> shouldn't be inside TTM at all.
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>
>>>>>> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
>>>>>> ---
>>>>>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 20 +++++++++++++++=
+++++
>>>>>> =C2=A0 include/uapi/drm/amdgpu_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>>>>> =C2=A0 2 files changed, 21 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>>> index 5ca13e2e50f50..6107810a9c205 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>>> @@ -836,8 +836,10 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev=
,
>>>>>> void *data,
>>>>>> =C2=A0 {
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_device *adev =3D drm_t=
o_adev(dev);
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_amdgpu_gem_op *args =3D d=
ata;
>>>>>> +=C2=A0=C2=A0=C2=A0 struct ttm_resource_manager *man;
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gem_object *gobj;
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_vm_bo_base *base;
>>>>>> +=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx ctx;
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_bo *robj;
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int r;
>>>>>>
>>>>>> @@ -851,6 +853,9 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev,
>>>>>> void *data,
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (unlikely(r))
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>>>>>>
>>>>>> +=C2=A0=C2=A0=C2=A0 memset(&ctx, 0, sizeof(ctx));
>>>>>> +=C2=A0=C2=A0=C2=A0 ctx.interruptible =3D true;
>>>>>> +
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (args->op) {
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case AMDGPU_GEM_OP_GET_GEM_CREATE_IN=
FO: {
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_a=
mdgpu_gem_create_in info;
>>>>>> @@ -898,6 +903,21 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev=
,
>>>>>> void *data,
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_bo_un=
reserve(robj);
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>> +=C2=A0=C2=A0=C2=A0 case AMDGPU_GEM_OP_SET_PRIORITY:
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (args->value > AMDGP=
U_BO_PRIORITY_MAX_USER)
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 args->value =3D AMDGPU_BO_PRIORITY_MAX_USER;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_update_priority(=
&robj->tbo, args->value);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (robj->tbo.evicted_t=
ype !=3D TTM_NUM_MEM_TYPES) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ttm_bo_try_unevict(&robj->tbo, &ctx);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 amdgpu_bo_unreserve(robj);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 amdgpu_bo_unreserve(robj);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 man =3D ttm_manager_type(robj->tbo.bdev,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 robj->tbo.resource->mem_type);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ttm_mem_unevict_evicted(robj->tbo.bdev, man,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t=
rue);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_bo_un=
reserve(robj);
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D -EINVA=
L;
>>>>>> diff --git a/include/uapi/drm/amdgpu_drm.h
>>>>>> b/include/uapi/drm/amdgpu_drm.h
>>>>>> index bdbe6b262a78d..53552dd489b9b 100644
>>>>>> --- a/include/uapi/drm/amdgpu_drm.h
>>>>>> +++ b/include/uapi/drm/amdgpu_drm.h
>>>>>> @@ -531,6 +531,7 @@ union drm_amdgpu_wait_fences {
>>>>>>
>>>>>> =C2=A0 #define AMDGPU_GEM_OP_GET_GEM_CREATE_INFO=C2=A0=C2=A0=C2=A0 =
0
>>>>>> =C2=A0 #define AMDGPU_GEM_OP_SET_PLACEMENT=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 1
>>>>>> +#define AMDGPU_GEM_OP_SET_PRIORITY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2
>>>>>>
>>>>>> =C2=A0 /* Sets or returns a value associated with a buffer. */
>>>>>> =C2=A0 struct drm_amdgpu_gem_op {
>>>>>> --
>>>>>> 2.44.0
>>>>>>
>>>>>
>>>
>
