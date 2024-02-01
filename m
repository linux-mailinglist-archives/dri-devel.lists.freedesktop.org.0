Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACA2846066
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 19:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB4010EF83;
	Thu,  1 Feb 2024 18:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="x95eiFgF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD57410EF83
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 18:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706813587;
 bh=9kKMMPAbmapWVcyklnrsNcAtOZOytlRJjbhe5YSiw3M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=x95eiFgFY2lBv8aX8AOSMz6yrNfeOieGKEOPlWunW77TOKMcYf1HMrV9iZxSfw/U6
 zf1ZEzuF958IMiuppjoMwMLQmDTOMAuKH7qTAFvqz21Umldz0kDfSjqJ1hFrj44tau
 KMWlQsdbhHtGBTqAg0KWqHAgIHPydIMktPzu4JblD9lqarkh97tS5FwcQLm2RQFtXQ
 mFjUk5Udj3IpTV5bDbS8fNM1RXQ0FNVpi9U+vldv1a2lL3KTFkfMqL37+OsfGi4YbC
 8GTXE3YaMtfcl8J4P3zmInzU60JySZFZKMReIJTPOiDHfAne2ETYJJ6ZgxOJvQhf42
 7C6syg/lmbOAw==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8ED593780C6C;
 Thu,  1 Feb 2024 18:53:05 +0000 (UTC)
Message-ID: <9405645a-6d39-4de7-96e1-c418cf7f67ef@collabora.com>
Date: Thu, 1 Feb 2024 21:53:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 09/30] drm/shmem-helper: Add and use lockless
 drm_gem_shmem_get_pages()
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, virtualization@lists.linux-foundation.org
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
 <20240105184624.508603-10-dmitry.osipenko@collabora.com>
 <ZbKZNCbZoV4ovWTH@phenom.ffwll.local> <20240126111827.70f8726c@collabora.com>
 <d467e5a4-6b61-4cad-8e38-c4495836a0d6@collabora.com>
 <Zbi0lQG15vz6iHJK@phenom.ffwll.local> <20240130111033.5c01054b@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20240130111033.5c01054b@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/30/24 13:10, Boris Brezillon wrote:
> On Tue, 30 Jan 2024 09:34:29 +0100
> Daniel Vetter <daniel@ffwll.ch> wrote:
> 
>> On Fri, Jan 26, 2024 at 07:43:29PM +0300, Dmitry Osipenko wrote:
>>> On 1/26/24 13:18, Boris Brezillon wrote:  
>>>> On Thu, 25 Jan 2024 18:24:04 +0100
>>>> Daniel Vetter <daniel@ffwll.ch> wrote:
>>>>   
>>>>> On Fri, Jan 05, 2024 at 09:46:03PM +0300, Dmitry Osipenko wrote:  
>>>>>> Add lockless drm_gem_shmem_get_pages() helper that skips taking reservation
>>>>>> lock if pages_use_count is non-zero, leveraging from atomicity of the
>>>>>> refcount_t. Make drm_gem_shmem_mmap() to utilize the new helper.
>>>>>>
>>>>>> Acked-by: Maxime Ripard <mripard@kernel.org>
>>>>>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>>>> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>>>> ---
>>>>>>  drivers/gpu/drm/drm_gem_shmem_helper.c | 19 +++++++++++++++----
>>>>>>  1 file changed, 15 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>>>> index cacf0f8c42e2..1c032513abf1 100644
>>>>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>>>> @@ -226,6 +226,20 @@ void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
>>>>>>  }
>>>>>>  EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
>>>>>>  
>>>>>> +static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
>>>>>> +{
>>>>>> +	int ret;    
>>>>>
>>>>> Just random drive-by comment: a might_lock annotation here might be good,
>>>>> or people could hit some really interesting bugs that are rather hard to
>>>>> reproduce ...  
>>>>
>>>> Actually, being able to acquire a ref in a dma-signalling path on an
>>>> object we know for sure already has refcount >= 1 (because we previously
>>>> acquired a ref in a path where dma_resv_lock() was allowed), was the
>>>> primary reason I suggested moving to this atomic-refcount approach.
>>>>
>>>> In the meantime, drm_gpuvm has evolved in a way that allows me to not
>>>> take the ref in the dma-signalling path (the gpuvm_bo object now holds
>>>> the ref, and it's acquired/released outside the dma-signalling path).
>>>>
>>>> Not saying we shouldn't add this might_lock(), but others might have
>>>> good reasons to have this function called in a path where locking
>>>> is not allowed.  
>>>
>>> For Panthor the might_lock indeed won't be a appropriate, thanks for
>>> reminding about it. I'll add explanatory comment to the code.  
>>
>> Hm these kind of tricks feel very dangerous to me. I think it would be
>> good to split up the two cases into two functions:
>>
>> 1. first one does only the atomic_inc and splats if the refcount is zero.
>> I think something in the name that denotes that we're incrementing a
>> borrowed pages reference would be good here, so like get_borrowed_pages
>> (there's not really a naming convention for these in the kernel).
>> Unfortunately no rust so we can't enforce that you provide the right kind
>> of borrowed reference at compile time.
> 
> Yeah, I also considered adding a dedicated function for that use case
> at some point, instead of abusing get_pages(). Given I no longer need
> it, we can probably add this might_lock() and defer the addition of this
> get_borrowed_pages() helper until someone actually needs it.

Ack, I'll add the might_lock() then. Missed previously that you don't
need to use get_pages() anymore. Thanks

-- 
Best regards,
Dmitry

