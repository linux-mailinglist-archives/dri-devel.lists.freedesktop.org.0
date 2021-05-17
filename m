Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6C5383D9C
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 21:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27336EA65;
	Mon, 17 May 2021 19:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D766EA65;
 Mon, 17 May 2021 19:39:59 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id b25so10936002eju.5;
 Mon, 17 May 2021 12:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=38ziZcYcZr57KsHEyvHZhQV5MTnxcJn5y4DdrSJQiwY=;
 b=QEu511/bsk+JD0G5PmN5tLFhHqljFLF/7D5v/wslkHlrRvVQsuPwtv3myKNMgQDyCN
 uVq9XOP2RU+7Zo2jIzsn3hoiMa4YVW9YWgpH4ExrUHrUTQyKLSCvW78cgmhZpYTnpdUX
 IuKqzQSQ3unrumnWX6h5sLExuzRc3C1Hgu/uOdpToyPraYs6vW0/dvoqLVbomOSYqvml
 TuCBk8eaSVWYCDDqGAmHiNkCNIFCBvAV+6xIsVQubqziCgLACIV+Oi8JU6DKkZ5YN7LG
 58Rk+zQ+0NzdyJWmeGlh8Bfddl28vKw2GQrzXswX9rH3xnPkxRhEf/g9KKBK1iCl8vqu
 dV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=38ziZcYcZr57KsHEyvHZhQV5MTnxcJn5y4DdrSJQiwY=;
 b=OWO6n5ojf7Otkjqy1G3ZJIcR6kJVLLFm2tUR/zOuAsWZ9Uz7AQq8oUSvPVUzPj47Z0
 KVHZEBj9TQlyFCHdOc2Y1hHxv7URN5QSyPGBjrCTGaTZXZukYqE51pOvcL/yQhQE6K1z
 lROlLJSw+nZKLQkFqkRGJGjtcMyTg6JeoNJVDewmn6wyn8z3sDAz1pArzedZfpPOD/Z8
 F19gMjGLgplVPVW8Ami37IcCtKiTPh+/oCt6gMe6D0Jh7vFY8OxaChaR5p7m2mQSo2fa
 l0yaE3ujZfppdc7uv5nrukCWDyyhIa3UpSPfUVPbV+1jYW3r7Sh/q96WN+/rLHJp32Me
 DtzQ==
X-Gm-Message-State: AOAM5310gFpmwj7wqb8+TeJ5Zf+c/rVSY/D59WwDSO+0lzZuRPycKS6Q
 aQzp4aD699ZDCLv6DKPgOk4=
X-Google-Smtp-Source: ABdhPJwwxfd2fPAJc2OXSfYAbVpwpof6Ye0W4UuLSzuIf3R7gbpdKVyI0Ez/ieb3VCy7w6My8thk4A==
X-Received: by 2002:a17:906:fa90:: with SMTP id
 lt16mr1555668ejb.411.1621280397777; 
 Mon, 17 May 2021 12:39:57 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:bd86:58d9:7c79:a095?
 ([2a02:908:1252:fb60:bd86:58d9:7c79:a095])
 by smtp.gmail.com with ESMTPSA id z12sm5356339edq.77.2021.05.17.12.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 12:39:57 -0700 (PDT)
Subject: Re: [PATCH v7 12/16] drm/amdgpu: Fix hang on device removal.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-13-andrey.grodzovsky@amd.com>
 <0e13e0fb-5cf8-30fa-6ed8-a0648f8fe50b@amd.com>
 <a589044b-8dac-e573-e864-4093e24574a3@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <356d03bf-e221-86b1-f133-83def9d956bd@gmail.com>
Date: Mon, 17 May 2021 21:39:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a589044b-8dac-e573-e864-4093e24574a3@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

You need to note who you are pinging here.

I'm still assuming you wait for feedback from Daniel. Or should I take a 
look?

Christian.

Am 17.05.21 um 16:40 schrieb Andrey Grodzovsky:
> Ping
>
> Andrey
>
> On 2021-05-14 10:42 a.m., Andrey Grodzovsky wrote:
>> Ping
>>
>> Andrey
>>
>> On 2021-05-12 10:26 a.m., Andrey Grodzovsky wrote:
>>> If removing while commands in flight you cannot wait to flush the
>>> HW fences on a ring since the device is gone.
>>>
>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 16 ++++++++++------
>>>   1 file changed, 10 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>> index 1ffb36bd0b19..fa03702ecbfb 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>> @@ -36,6 +36,7 @@
>>>   #include <linux/firmware.h>
>>>   #include <linux/pm_runtime.h>
>>> +#include <drm/drm_drv.h>
>>>   #include "amdgpu.h"
>>>   #include "amdgpu_trace.h"
>>> @@ -525,8 +526,7 @@ int amdgpu_fence_driver_init(struct 
>>> amdgpu_device *adev)
>>>    */
>>>   void amdgpu_fence_driver_fini_hw(struct amdgpu_device *adev)
>>>   {
>>> -    unsigned i, j;
>>> -    int r;
>>> +    int i, r;
>>>       for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
>>>           struct amdgpu_ring *ring = adev->rings[i];
>>> @@ -535,11 +535,15 @@ void amdgpu_fence_driver_fini_hw(struct 
>>> amdgpu_device *adev)
>>>               continue;
>>>           if (!ring->no_scheduler)
>>>               drm_sched_fini(&ring->sched);
>>> -        r = amdgpu_fence_wait_empty(ring);
>>> -        if (r) {
>>> -            /* no need to trigger GPU reset as we are unloading */
>>> +        /* You can't wait for HW to signal if it's gone */
>>> +        if (!drm_dev_is_unplugged(&adev->ddev))
>>> +            r = amdgpu_fence_wait_empty(ring);
>>> +        else
>>> +            r = -ENODEV;
>>> +        /* no need to trigger GPU reset as we are unloading */
>>> +        if (r)
>>>               amdgpu_fence_driver_force_completion(ring);
>>> -        }
>>> +
>>>           if (ring->fence_drv.irq_src)
>>>               amdgpu_irq_put(adev, ring->fence_drv.irq_src,
>>>                          ring->fence_drv.irq_type);
>>>

