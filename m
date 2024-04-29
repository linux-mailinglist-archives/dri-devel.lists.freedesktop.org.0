Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DD88B5F64
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 18:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7479110E5C8;
	Mon, 29 Apr 2024 16:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="erCozCOq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80AC10E5C8
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 16:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GOiIuvlCdA1pnaZ1fxfIKwfyCKnXAzZFkFIHQVud6Bc=; b=erCozCOqqZim8cZXGcqwnNMQyv
 AcqQ7iHZYp2sYIaThcKG+1XlWlhPNJL7xFfXd2wV1O7wBl/wT5Y7BoZPyty4Z4fiN7OLHpG7KKq+P
 4npFCV0FUBhxvLserwASh4Lqs30fRC4cnSs2NTfTc/zhmqHIWCW0dtq3YGaHDfgZzm08pf7JM6vVI
 z0UDTT+U2H9dzMmdWePU9lHcEE1oruTwezJVsCCfSkjQN/DQPuob+qILwHr//t/qWsGkzA3Pdv6XT
 Qv24wBWiS7ZGK0+BoWUHWg0zTob01DrSY4sJZYalL3DBYAE6AJavoiTB1F52cqoWSei3oBlGvflLn
 CgKctJRg==;
Received: from [179.234.232.152] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1s1UFL-001O2U-ER; Mon, 29 Apr 2024 18:52:55 +0200
Message-ID: <0b64735c-6dab-42f0-92c5-57b7b8dfaf47@igalia.com>
Date: Mon, 29 Apr 2024 13:52:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] drm/v3d: Use gemfs/THP in BO creation if available
To: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20240428124426.309096-1-mcanal@igalia.com>
 <20240428124426.309096-8-mcanal@igalia.com>
 <0a966cc891b388133013b37820b7e0e7d982654c.camel@igalia.com>
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
In-Reply-To: <0a966cc891b388133013b37820b7e0e7d982654c.camel@igalia.com>
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

On 4/29/24 02:22, Iago Toral wrote:
> Hi Maíra,
> 
> a question below:
> 
> El dom, 28-04-2024 a las 09:40 -0300, Maíra Canal escribió:
>> Although Big/Super Pages could appear naturally, it would be quite
>> hard
>> to have 1MB or 64KB allocated contiguously naturally. Therefore, we
>> can
>> force the creation of large pages allocated contiguously by using a
>> mountpoint with "huge=within_size" enabled.
>>
>> Therefore, as V3D has a mountpoint with "huge=within_size" (if user
>> has
>> THP enabled), use this mountpoint for BO creation if available. This
>> will allow us to create large pages allocated contiguously and make
>> use
>> of Big/Super Pages.
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>>
> 
> (...)
> 
>> @@ -130,10 +140,17 @@ struct v3d_bo *v3d_bo_create(struct drm_device
>> *dev, struct drm_file *file_priv,
>>   			     size_t unaligned_size)
>>   {
>>   	struct drm_gem_shmem_object *shmem_obj;
>> +	struct v3d_dev *v3d = to_v3d_dev(dev);
>>   	struct v3d_bo *bo;
>>   	int ret;
>>   
>> -	shmem_obj = drm_gem_shmem_create(dev, unaligned_size);
>> +	/* Let the user opt out of allocating the BOs with THP */
>> +	if (v3d->gemfs)
>> +		shmem_obj = drm_gem_shmem_create_with_mnt(dev,
>> unaligned_size,
>> +							  v3d-
>>> gemfs);
>> +	else
>> +		shmem_obj = drm_gem_shmem_create(dev,
>> unaligned_size);
>> +
>>   	if (IS_ERR(shmem_obj))
>>   		return ERR_CAST(shmem_obj);
>>   	bo = to_v3d_bo(&shmem_obj->base);
> 
> 
> if I read this correctly when we have THP we always allocate with that,
> Even objects that are smaller than 64KB. I was wondering if there is
> any benefit/downside to this or if the behavior for small allocations
> is the same we had without the new mount point.

I'm assuming that your concern is related to memory pressure and memory
fragmentation.

As we are using `huge=within_size`, we only allocate a huge page if it
will be fully within `i_size`. When using `huge=within_size`, we can
optimize the performance for smaller files without forcing larger files
to also use huge pages. I don't understand `huge=within_size` in full
details, but it is possible to check that it is able to avoid the system
(even the RPi) to go OOM. Although it is slightly less performant than
`huge=always` (used in v1), I believe it is more ideal for a system such
as the RPi due to the memory requirements.

Best Regards,
- Maíra

> 
> Iago
