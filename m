Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0A97F5F1C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 13:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D2B10E072;
	Thu, 23 Nov 2023 12:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FED10E072
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 12:36:57 +0000 (UTC)
Received: from [10.3.2.161] (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8F83C6607394;
 Thu, 23 Nov 2023 12:36:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700743015;
 bh=2LllmDbYxcn3Wb7dP4KPovi6jD6viOltsx+ReLsVg9Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=O+/9TN2/vTqIy/P3ZggvtK0DJsdfdTShWxTMex0Q2IjdngbhpS/+J3TNcVsm4hpvb
 LhHGFYiSbNIv9qLLq+jffl/7vZKgM+HSdr56gD1jc7EnljOzpgGXK6vNFICi6iQAFC
 7b4NsAdlfZXZ7FvDLOr/quBmXUXOGuBzHySa/ZJHB2qJ4wlnF7bmRndc53m0FRAauX
 VRwUuAbAAOSfQVaW6RG8qY9FD+Oe3msdMGc0y4ymFeFJO9IK+/oZTtc1qav+peCgbH
 kYtYx/ziJdEsHe9fv3KL9n00h1/C117fREqXrzySSmB9Lm3ggaI+6dF7cv4TQv2b7A
 SDTCmj1+oUrUg==
Message-ID: <fdc246db-e6cd-ff31-365f-0d2e0690364d@collabora.com>
Date: Thu, 23 Nov 2023 15:36:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v18 22/26] drm/shmem-helper: Don't free refcounted GEM
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
 <20231029230205.93277-23-dmitry.osipenko@collabora.com>
 <20231113105438.60896fdf@collabora.com>
 <2faf1111-9646-21e3-feb3-f59c955bc719@collabora.com>
 <20231123100829.2e4addd0@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20231123100829.2e4addd0@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Steven Price <steven.price@arm.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/23/23 12:08, Boris Brezillon wrote:
> On Thu, 23 Nov 2023 01:30:24 +0300
> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> 
>> On 11/13/23 12:54, Boris Brezillon wrote:
>>> On Mon, 30 Oct 2023 02:02:01 +0300
>>> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
>>>   
>>>> Don't free refcounted shmem object to prevent use-after-free bug that
>>>> is worse than a memory leak.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>> ---
>>>>  drivers/gpu/drm/drm_gem_shmem_helper.c | 7 ++++---
>>>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>> index 6dd087f19ea3..4253c367dc07 100644
>>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>> @@ -203,9 +203,10 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>>>>  	if (obj->import_attach)
>>>>  		drm_prime_gem_destroy(obj, shmem->sgt);
>>>>  
>>>> -	drm_WARN_ON(obj->dev, refcount_read(&shmem->vmap_use_count));
>>>> -	drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_use_count));
>>>> -	drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_pin_count));
>>>> +	if (drm_WARN_ON(obj->dev, refcount_read(&shmem->vmap_use_count)) ||
>>>> +	    drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_use_count)) ||
>>>> +	    drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_pin_count)))
>>>> +		return;  
>>>
>>> I guess you're worried about ->sgt being referenced by the driver after
>>> the GEM is destroyed. If we assume drivers don't cache the sgt and
>>> always call get_pages_sgt() when they need it that shouldn't be an
>>> issue. What we really don't want to release is the pages themselves,
>>> but the GPU MMU might still have active mappings pointing to these
>>> pages.
>>>
>>> In any case, I'm not against leaking the GEM object when any of these
>>> counters are not zero, but can we at least have a comment in the
>>> code explaining why we're doing that, so people don't have to go look
>>> at the git history to figure it out.  
>>
>> This patch is a minor improvement, it doesn't address any specific
>> issue. This should be a common pattern in kernel. If you're giving a
>> warning and know about the inevitable catastrophe, then avoid it if you can.
> 
> Sure, I'm just asking that we add a comment to explain why we leak
> memory here. Is that too much to ask?

Will add the comment. The reason why I added this patch was unrelated to
the sgt, that's what I'm talking about.

-- 
Best regards,
Dmitry

