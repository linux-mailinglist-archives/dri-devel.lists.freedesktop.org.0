Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4610A8B1B3A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 08:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E298D11A1D9;
	Thu, 25 Apr 2024 06:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="dXGEi+F3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04AF411A1D7;
 Thu, 25 Apr 2024 06:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1714027563; x=1714632363; i=friedrich.vock@gmx.de;
 bh=+opWWEvXXtlcNCHfXv6BnDYHoJHHpcHWKAQlUE9B+Qc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=dXGEi+F3dzywTAWrIqBO4j69lqEUMSik3IH4qY0bw/KE1mKmzWVhOPAdNq0UixAO
 D22YOkFsvCwzcqWAOzQnUEr90Ak2Y82lporAiBCaE8MxUr7NpMxIYPn87VScl/LW8
 OW1Ht2GNDrtII3VUWQ+Ncr2mKiYVg857lUgaBg7s8s+wfA1mtjtxu+bUjqbvmwltI
 pWshM26QfXv2F0fxLiqS69kS8w6kIvkiFzsr0xTvQcindirmR5JAlG5chh5nG48eK
 B/wMRNwSoboJ7055ugwha6bschYQphq1nzki0z59Gbr5haaytDQbgQI0T3OxMZA1I
 ExNKUHm1ghzK6YLcLg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.177.3] ([213.152.117.111]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MiaY9-1sehXJ3nnD-00fiB3; Thu, 25
 Apr 2024 08:46:03 +0200
Message-ID: <6830272c-e3c0-4d54-aa10-6c96c1e644fc@gmx.de>
Date: Thu, 25 Apr 2024 08:46:00 +0200
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
Content-Language: en-US
From: Friedrich Vock <friedrich.vock@gmx.de>
Autocrypt: addr=friedrich.vock@gmx.de; keydata=
 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
 f7+xmX0X3AMtWz/15Y+7cPO2
In-Reply-To: <e5224fdf-ecc0-41f2-a7d9-42e3937f2e63@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ef4TDmWPP6Z4R4HHcKfPIdEGWXZnX0ojmp/GJz0BD3drC1VOGzP
 NlWZYD8sDbiC9IwLJftjFoeQq8j4JlzmS1GYzA3f6zW+kEsgfWKTdbAdykPgZVL7hlQo8Nc
 n3p5uX9EEymOrYEqlN2SSQi/X1iX1LOmGaRUB84sY1bxKhV27+BdXKdFCarZZBlGx/N1rlk
 ufeFA+j8dWdf6Hsl9ZHPw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TCJhYXylOx0=;xHoAqC79eaUOPI9nMpT1vNo7xrW
 mOx0wSQ/4CMOJpoBTbvQatlqb/2bWAlrSL2InrBCJGPtcHs/dfGVmhn5/nSGY6B046a1vs/DO
 exwbpoKCnE+KfAw/QEYpjz33kYcr/sdYSIgbng8rgwtkVfIPgxMHRxfDAx0B+WvfjQeXQ3gyU
 Onw1BRcg0RIZEYorMvjd8RCwACq8nU7uKIWzS0daegweEUixs4SfX9Xf5W97p/VkosPH4995H
 ZHOZqWsFPNrPcLxfjGzmrE7GM3tsG1G8zWke+HhKq3wTPORvl/KE193VV/wBrTY6OkhOyEmJm
 wq16FivrzbXWJ2gNrzzk4o+z/c6EOUORr5kcZJweTJepVTDHJKeV6i7rifRe7bC8OcWJ2CplG
 yd+rfHNQjcG5sbp6UN8D6BoxEMvEKSlOF6WAiYH/1SpzbAJ5wNjQVfeEq8samLqAm5xSBasWN
 Y2ofv1uZTljN0lcbS7DHJ6bdjPJbpJpFR3I00vl7oHcyfy3eB95ivDAMImBQXezIjdm2KB4Ci
 TjNrIkqVGlee0JrdpKyONxUodeTrZtlXK02ykIogNpsDUEwZSqxmrP3jrjQ8jzDONVCM53OMC
 Kz5c182Y7Wss8oOKVStQTYN6IT70uhayGeYuGeSM8UWCI5O3j84RL0u8MKF5r8OQ1xcxUx/jg
 5RG9EGa4wcaVvcD+WOwzg+Kx/U4UJ2E495cf0pLyq2Xe+RTLvQKKxVeBDbqNElyF1EGY95ccs
 TAnzxAmlDwCf27y7AcWTfudnOOL77nJHq9ncROYZHFzQx3l412wak5LOgIs/agbQYPVDxwtIh
 d1PnEqlEU45cyaL0v3WtR3kdYeX0MmoenJ4XOIdlwRdL0=
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

On 25.04.24 08:32, Christian K=C3=B6nig wrote:
> Am 24.04.24 um 18:57 schrieb Friedrich Vock:
>> Used by userspace to adjust buffer priorities in response to changes in
>> application demand and memory pressure.
>
> Yeah, that was discussed over and over again. One big design criteria
> is that we can't have global priorities from userspace!
>
> The background here is that this can trivially be abused.
>
I see your point when apps are allowed to prioritize themselves above
other apps, and I agree that should probably be disallowed at least for
unprivileged apps.

Disallowing this is a pretty trivial change though, and I don't really
see the abuse potential in being able to downgrade your own priority?

Regards,
Friedrich

> What we can do is to have per process priorities, but that needs to be
> in the VM subsystem.
>
> That's also the reason why I personally think that the handling
> shouldn't be inside TTM at all.
>
> Regards,
> Christian.
>
>>
>> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
>> ---
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 20 +++++++++++++++++++=
+
>> =C2=A0 include/uapi/drm/amdgpu_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 2 files changed, 21 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> index 5ca13e2e50f50..6107810a9c205 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> @@ -836,8 +836,10 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev,
>> void *data,
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_device *adev =3D drm_to_ad=
ev(dev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_amdgpu_gem_op *args =3D data;
>> +=C2=A0=C2=A0=C2=A0 struct ttm_resource_manager *man;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gem_object *gobj;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_vm_bo_base *base;
>> +=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx ctx;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_bo *robj;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int r;
>>
>> @@ -851,6 +853,9 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev,
>> void *data,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (unlikely(r))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>>
>> +=C2=A0=C2=A0=C2=A0 memset(&ctx, 0, sizeof(ctx));
>> +=C2=A0=C2=A0=C2=A0 ctx.interruptible =3D true;
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (args->op) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case AMDGPU_GEM_OP_GET_GEM_CREATE_INFO: =
{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_amdgp=
u_gem_create_in info;
>> @@ -898,6 +903,21 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev,
>> void *data,
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_bo_unrese=
rve(robj);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> +=C2=A0=C2=A0=C2=A0 case AMDGPU_GEM_OP_SET_PRIORITY:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (args->value > AMDGPU_BO=
_PRIORITY_MAX_USER)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arg=
s->value =3D AMDGPU_BO_PRIORITY_MAX_USER;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_update_priority(&rob=
j->tbo, args->value);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (robj->tbo.evicted_type =
!=3D TTM_NUM_MEM_TYPES) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm=
_bo_try_unevict(&robj->tbo, &ctx);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amd=
gpu_bo_unreserve(robj);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amd=
gpu_bo_unreserve(robj);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 man=
 =3D ttm_manager_type(robj->tbo.bdev,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 robj->tbo.resource->mem_type);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm=
_mem_unevict_evicted(robj->tbo.bdev, man,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 true=
);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_bo_unrese=
rve(robj);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D -EINVAL;
>> diff --git a/include/uapi/drm/amdgpu_drm.h
>> b/include/uapi/drm/amdgpu_drm.h
>> index bdbe6b262a78d..53552dd489b9b 100644
>> --- a/include/uapi/drm/amdgpu_drm.h
>> +++ b/include/uapi/drm/amdgpu_drm.h
>> @@ -531,6 +531,7 @@ union drm_amdgpu_wait_fences {
>>
>> =C2=A0 #define AMDGPU_GEM_OP_GET_GEM_CREATE_INFO=C2=A0=C2=A0=C2=A0 0
>> =C2=A0 #define AMDGPU_GEM_OP_SET_PLACEMENT=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 1
>> +#define AMDGPU_GEM_OP_SET_PRIORITY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2
>>
>> =C2=A0 /* Sets or returns a value associated with a buffer. */
>> =C2=A0 struct drm_amdgpu_gem_op {
>> --
>> 2.44.0
>>
>
