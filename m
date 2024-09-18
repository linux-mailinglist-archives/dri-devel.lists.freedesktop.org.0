Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E06B97BBC6
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 13:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A87110E24C;
	Wed, 18 Sep 2024 11:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Y4g5gxPN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE4E10E24C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 11:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9upZVFdQMskb90PaXVMiXraLUFDk9ov2A+mmuMpfLd8=; b=Y4g5gxPN9u5h2FK1sZrfWZaXIF
 G7dCF0FH+g8umiV4mKRBAFDvapSRUoJvmjLbIY+PdbbZhDNYghAr5UBF7N/Q5dIjohpfq98fNV1QO
 rs8OLxn/QArFyjgXEDZjSw7d03Hb2aeHHBu3WdRw6mvP1HhqAJvfxqsJP/+qz+Gj+3k1NghI9d1BB
 8ifKnH0mmaA2eY7+GEqq8xpwL23aV29accGKODvWYfVdbmSfuB1nDx6gsgPB/eRZLj330Noap7/Fr
 ExTPvqF0dCPiqdJ4t92GspIIHv5cxhirmLLt0wwBEO6xS0V/UCwG+raNhidq0OVUZIroKrNMYm41O
 v7ADM0ZQ==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sqtGi-00FFyB-5W; Wed, 18 Sep 2024 13:54:48 +0200
Message-ID: <0d08cadd-c9f0-4953-adca-f97a55042df2@igalia.com>
Date: Wed, 18 Sep 2024 08:54:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/10] drm/v3d: Fix the MMU flush order
To: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240829130954.2439316-1-mcanal@igalia.com>
 <20240829130954.2439316-2-mcanal@igalia.com>
 <f686b0113ed782e9defc112b2d9a3bb877730bd9.camel@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <f686b0113ed782e9defc112b2d9a3bb877730bd9.camel@igalia.com>
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

Hi Iago,

On 9/4/24 05:24, Iago Toral wrote:
> Hi Maira,
> 
> El jue, 29-08-2024 a las 10:05 -0300, Maíra Canal escribió:
>> We must first flush the MMU cache and then, flush the TLB, not the
>> other
>> way around. Currently, we can see a race condition between the MMU
>> cache
>> and the TLB when running multiple rendering processes at the same
>> time.
>> This is evidenced by MMU errors triggered by the IRQ.
>>
>> Fix the MMU flush order by flushing the MMU cache and then the TLB.
> 
> the patch is making 2 changes, it is changing the ordering of the
> flushes but also the fact that now we wait for the first flush to
> commplete before starting the second while the previous version would
> start both flushes and then wait for both to complete. The commit log
> seems to suggest that the first change is the one that fixes the issue
> but I wonder if that is really what is happening.
> 
> Also, have you tested keeping the original order of operations but with
> interleaved waits like we do here? Either way, I think we probably

I just tested keeping the order of the operations but using interleaved
waits and I end up having MMU errors that crash the GPU. Changing the
order of the operations was a deliberated choice due the GPU design and
and waiting for each of those to finish is needed to avoid race
conditions.

> should emphasized more in the committ log the fact that we are now
> waiting for each flush to complete before starting the other flush.
> 

But you are absolutely right. I need to mention it on the commit log.
I'll add this information in the next version.

> 
>>
>> Fixes: 57692c94dcbe ("drm/v3d: Introduce a new DRM driver for
>> Broadcom V3D V3.x+")
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_mmu.c | 29 ++++++++++-------------------
>>   1 file changed, 10 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_mmu.c
>> b/drivers/gpu/drm/v3d/v3d_mmu.c
>> index 14f3af40d6f6..06bb44c7f35d 100644
>> --- a/drivers/gpu/drm/v3d/v3d_mmu.c
>> +++ b/drivers/gpu/drm/v3d/v3d_mmu.c
>> @@ -32,32 +32,23 @@ static int v3d_mmu_flush_all(struct v3d_dev *v3d)
>>   {
>>   	int ret;
>>   
>> -	/* Make sure that another flush isn't already running when
>> we
>> -	 * start this one.
>> -	 */
>> -	ret = wait_for(!(V3D_READ(V3D_MMU_CTL) &
>> -			 V3D_MMU_CTL_TLB_CLEARING), 100);
>> -	if (ret)
>> -		dev_err(v3d->drm.dev, "TLB clear wait idle pre-wait
>> failed\n");
>> -
> 
> are we certain we can't have a flush in flux when a new one comes in?

We can, but it doesn't really matter, as by the end of both requests,
the TLB will be flushed.

Best Regards,
- Maíra

> 
>> -	V3D_WRITE(V3D_MMU_CTL, V3D_READ(V3D_MMU_CTL) |
>> -		  V3D_MMU_CTL_TLB_CLEAR);
>> -
>> -	V3D_WRITE(V3D_MMUC_CONTROL,
>> -		  V3D_MMUC_CONTROL_FLUSH |
>> +	V3D_WRITE(V3D_MMUC_CONTROL, V3D_MMUC_CONTROL_FLUSH |
>>   		  V3D_MMUC_CONTROL_ENABLE);
>>   
>> -	ret = wait_for(!(V3D_READ(V3D_MMU_CTL) &
>> -			 V3D_MMU_CTL_TLB_CLEARING), 100);
>> +	ret = wait_for(!(V3D_READ(V3D_MMUC_CONTROL) &
>> +			 V3D_MMUC_CONTROL_FLUSHING), 100);
>>   	if (ret) {
>> -		dev_err(v3d->drm.dev, "TLB clear wait idle
>> failed\n");
>> +		dev_err(v3d->drm.dev, "MMUC flush wait idle
>> failed\n");
>>   		return ret;
>>   	}
>>   
>> -	ret = wait_for(!(V3D_READ(V3D_MMUC_CONTROL) &
>> -			 V3D_MMUC_CONTROL_FLUSHING), 100);
>> +	V3D_WRITE(V3D_MMU_CTL, V3D_READ(V3D_MMU_CTL) |
>> +		  V3D_MMU_CTL_TLB_CLEAR);
>> +
>> +	ret = wait_for(!(V3D_READ(V3D_MMU_CTL) &
>> +			 V3D_MMU_CTL_TLB_CLEARING), 100);
>>   	if (ret)
>> -		dev_err(v3d->drm.dev, "MMUC flush wait idle
>> failed\n");
>> +		dev_err(v3d->drm.dev, "TLB clear wait idle
>> failed\n");
> 
> I'd maybe use "MMU TLB clear wait idle failed", so we can more easily
> identify this message comes from the MMU implementation.
> 
> Iago
> 
>>   
>>   	return ret;
>>   }
> 
