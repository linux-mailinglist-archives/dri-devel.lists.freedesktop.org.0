Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 287E8915F73
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 09:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3054010E483;
	Tue, 25 Jun 2024 07:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="HD10R5U/";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="ONpvQvFJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bunu.damsy.net (bunu.damsy.net [51.159.160.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D194B10E43E;
 Tue, 25 Jun 2024 07:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202404r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1719299233;
 bh=q2vLeUkveR0tnb+z7Vog04U
 kSwvNv7OGBJH/W+R2mXc=; b=HD10R5U/wSV2pF8ydlVGW6O/qlw2lDWHyHGEYD9/Pvrvxj0nzI
 nZOEE3vfVOwv1pVR/oDo3h81U9wNEx2F+gDlClLO98km0l72aBrTnCt+tS1xjzp+55YeSiho003
 tP7RxGcGch4xz/OsREI9M7tu4mzR2/IgIydl2ne0waVYgE+L90L5Yhu8GMnk26nsSShB77voD00
 cfvMx0JfFeiHro6Z29NatIPqiauXkEBV5F+ECdYO/BAAT5JbpxNo6pHJuIv+FENGhhGUgbqBm7a
 IHdpoNYuYg5K9ch1BL6mWbt/PBnH9shnL3Pai9dQukg4GrRGbMUG9O0xaHQztUfi75w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202404e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1719299233; bh=q2vLeUkveR0tnb+z7Vog04U
 kSwvNv7OGBJH/W+R2mXc=; b=ONpvQvFJljRA3VDJ7/ib4hwus24oi5p1JCWorlgbTQrE+T7Dk+
 7/v57mMlxtAT3PPhkZoGkDXZYOqBPy+AOzCw==;
Message-ID: <188b82b3-c600-4920-84c7-ceb072b8e9d6@damsy.net>
Date: Tue, 25 Jun 2024 09:07:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/amdgpu: allow ioctls to opt-out of runtime pm
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
References: <20240618153003.146168-1-pierre-eric.pelloux-prayer@amd.com>
 <20240618153003.146168-2-pierre-eric.pelloux-prayer@amd.com>
 <c45283a1-98d2-43a2-a73c-71896464c7f9@amd.com>
 <d2eefecf-656e-4c9c-96b3-717756581cc1@damsy.net>
 <bcca41dc-8f75-4ca0-a843-62fa63636262@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <bcca41dc-8f75-4ca0-a843-62fa63636262@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


Le 20/06/2024 à 15:36, Christian König a écrit :
> Am 20.06.24 um 15:06 schrieb Pierre-Eric Pelloux-Prayer:
>> Le 19/06/2024 à 11:26, Christian König a écrit :
>>> Am 18.06.24 um 17:23 schrieb Pierre-Eric Pelloux-Prayer:
>>>> Waking up a device can take multiple seconds, so if it's not
>>>> going to be used we might as well not resume it.
>>>>
>>>> The safest default behavior for all ioctls is to resume the GPU,
>>>> so this change allows specific ioctls to opt-out of generic
>>>> runtime pm.
>>>
>>> I'm really wondering if we shouldn't put that into the IOCTL 
>>> description.
>>>
>>> See amdgpu_ioctls_kms and DRM_IOCTL_DEF_DRV() for what I mean.
>>
>> Are you suggesting to add a new entry in enum drm_ioctl_flags to 
>> indicate ioctls which need the device to be awake?
>>
>> Something like: "DRM_NO_DEVICE = BIT(6)" and then use it for both
>> core and amdgpu ioctls?
> 
> Yeah something like that. Maybe name that DRM_SW_ONLY or something like 
> that.

+ dri-devel to gauge interest in adding such a flag in shared code.

Pierre-Eric



> 
> Christian.
> 
>>
>> Pierre-Eric
>>
>>
>>
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Signed-off-by: Pierre-Eric Pelloux-Prayer 
>>>> <pierre-eric.pelloux-prayer@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 25 
>>>> ++++++++++++++++++++-----
>>>>   1 file changed, 20 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> index 60d5758939ae..a9831b243bfc 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> @@ -2855,18 +2855,33 @@ long amdgpu_drm_ioctl(struct file *filp,
>>>>   {
>>>>       struct drm_file *file_priv = filp->private_data;
>>>>       struct drm_device *dev;
>>>> +    bool needs_device;
>>>>       long ret;
>>>>       dev = file_priv->minor->dev;
>>>> -    ret = pm_runtime_get_sync(dev->dev);
>>>> -    if (ret < 0)
>>>> -        goto out;
>>>> +
>>>> +    /* Some ioctl can opt-out of powermanagement handling
>>>> +     * if they don't require the device to be resumed.
>>>> +     */
>>>> +    switch (cmd) {
>>>> +    default:
>>>> +        needs_device = true;
>>>> +    }
>>>> +
>>>> +    if (needs_device) {
>>>> +        ret = pm_runtime_get_sync(dev->dev);
>>>> +        if (ret < 0)
>>>> +            goto out;
>>>> +    }
>>>>       ret = drm_ioctl(filp, cmd, arg);
>>>> -    pm_runtime_mark_last_busy(dev->dev);
>>>>   out:
>>>> -    pm_runtime_put_autosuspend(dev->dev);
>>>> +    if (needs_device) {
>>>> +        pm_runtime_mark_last_busy(dev->dev);
>>>> +        pm_runtime_put_autosuspend(dev->dev);
>>>> +    }
>>>> +
>>>>       return ret;
>>>>   }
