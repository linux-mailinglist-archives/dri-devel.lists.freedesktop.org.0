Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A279B4771
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 11:54:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2E610E623;
	Tue, 29 Oct 2024 10:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="k9f2Uy9g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19B710E623
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 10:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BvJMMRt1z7kOyyvUn0nECg1A2DXOBDb3fSwEgftGhmw=; b=k9f2Uy9gWUB5eCdim9JMZ+MTD6
 HVfwvaQMkcTHuSbNymaBzvVxjQ+dB8fOTIilSEbe4cxFaN6mModmS7x9GTvlhcYoggQ+UgvP/J7q5
 lgXJPvwf4g+HvKJ1rguObeY5P7pIQdCIuPOTlmYgrGyp2Fu2WDJmT64+NE9Q81QbuHDhIIEixidMC
 m6hFYRatEvAO1Stcr9s1srYuX34B2HuuMxUdJOlNczaCJIPmUtiEeZ18kPJhK3Pw10cAnLXDdSt70
 SeMaflTKW3r4EmrJmmUkbtUedENrwcfybKBXNtjD5YPQGTOwAkBW9NGPJ6QqlhNeP6lvtM7Nd64Ws
 CCGXwGKA==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1t5jr9-00Gada-Sk; Tue, 29 Oct 2024 11:53:48 +0100
Message-ID: <078957ad-bd7d-41b3-88d5-4c09824f134a@igalia.com>
Date: Tue, 29 Oct 2024 07:53:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/v3d: Drop allocation of object without mountpoint
To: Matthias Brugger <mbrugger@suse.com>, matthias.bgg@kernel.org,
 Melissa Wen <mwen@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20241028-v3d-v1-1-907bee355edf@gmail.com>
 <38486268-ad83-4719-8ad5-ead05935d02d@igalia.com>
 <49593924-4e4a-4341-9a10-5733a9be082b@suse.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <49593924-4e4a-4341-9a10-5733a9be082b@suse.com>
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

Hi Matthias,

On 29/10/24 05:43, Matthias Brugger wrote:
> Hi Maria,
> 
> On 29/10/2024 01:41, Maíra Canal wrote:
>> Hi Matthias,
>>
>> Thanks for your patch!
>>
>> On 28/10/24 11:27, matthias.bgg@kernel.org wrote:
>>> From: Matthias Brugger <matthias.bgg@gmail.com>
>>>
>>> Function drm_gem_shmem_create_with_mnt() creates an object
>>> without using the mountpoint if gemfs is NULL.
>>>
>>> Drop the else branch calling drm_gem_shmem_create().
>>>
>>> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
>>> ---
>>>   drivers/gpu/drm/v3d/v3d_bo.c | 7 +------
>>>   1 file changed, 1 insertion(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
>>> index 
>>> 7055f7c7bcfe5700aee10b09ecc0005197323b01..f6df9e0947b6ee06043cdbb42c4f98a71bdeba4d 100644
>>> --- a/drivers/gpu/drm/v3d/v3d_bo.c
>>> +++ b/drivers/gpu/drm/v3d/v3d_bo.c
>>> @@ -157,13 +157,8 @@ struct v3d_bo *v3d_bo_create(struct drm_device 
>>> *dev, struct drm_file *file_priv,
>>>       struct v3d_bo *bo;
>>>       int ret;
>>> -    /* Let the user opt out of allocating the BOs with THP */
>>> -    if (v3d->gemfs)
>>> -        shmem_obj = drm_gem_shmem_create_with_mnt(dev, unaligned_size,
>>> +    shmem_obj = drm_gem_shmem_create_with_mnt(dev, unaligned_size,
>>>                                 v3d->gemfs);
>>
>> Please, run scripts/checkpatch.pl before sending the patch.
>>
> 
> I did with b4 prep --check which gave no errors, just double checked with:
> $ ./scripts/checkpatch.pl 0001-drm-v3d-Drop-allocation-of-object- 
> without-mountpoint.patch
> total: 0 errors, 0 warnings, 14 lines checked
> 
> 0001-drm-v3d-Drop-allocation-of-object-without-mountpoint.patch has no 
> obvious style problems and is ready for submission.
> 
> I suppose you want line "v3d->gemfs" to get an extra tab, correct?

Yes. A tip is running checkpatch.pl with the flag --strict.

$ ./scripts/checkpatch.pl --strict -g HEAD
CHECK: Alignment should match open parenthesis
#28: FILE: drivers/gpu/drm/v3d/v3d_bo.c:161:
+	shmem_obj = drm_gem_shmem_create_with_mnt(dev, unaligned_size,
  							  v3d->gemfs);

total: 0 errors, 0 warnings, 1 checks, 14 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
       mechanically convert to the typical style using --fix or 
--fix-inplace.

Commit d2ba234a691f ("drm/v3d: Drop allocation of object without 
mountpoint") has style problems, please review.

NOTE: If any of the errors are false positives, please report
       them to the maintainer, see CHECKPATCH in MAINTAINERS.

Best Regards,
- Maíra

> 
> Regards,
> Matthias
> 
>> Best Regards,
>> - Maíra
>>
>>> -    else
>>> -        shmem_obj = drm_gem_shmem_create(dev, unaligned_size);
>>> -
>>>       if (IS_ERR(shmem_obj))
>>>           return ERR_CAST(shmem_obj);
>>>       bo = to_v3d_bo(&shmem_obj->base);
>>>
>>> ---
>>> base-commit: dec9255a128e19c5fcc3bdb18175d78094cc624d
>>> change-id: 20241028-v3d-1d2546ed92d7
>>>
>>> Best regards,
>>

