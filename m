Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC5C83DF13
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 17:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4673910FC19;
	Fri, 26 Jan 2024 16:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFE610FC19
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 16:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706287413;
 bh=U6u3xgf4R+utqvmtwCD7pg1WXxuAovEW7noxe87GDmw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KeswJROhwGGRCE5tdZ1RC8zLadqOPmPE3UK2Yj5P5hgbG7FBPfNCxYkwMYNE+SKwd
 DX6GBQiHWaaIhiby6QrQjjW1qb01imlJGar0H58w0ZXPj4Ig74w7iN/dBhp+rCJMfp
 U1x8qHsm+S8XWiZe2bhGxGBqyOwVSlqtEjRf6THeYOgu8ceW/2h9FNH4SNQSYPgC2Q
 vCcyVSZzLEGNQ9Kz0Z1aRA19OxbfqZAcasBM+kXiB2wYcSGMwQcTvSXkvwS+pTKH1R
 Iove7Or8j6Dtwzb+a5PJc70/zZs8HnXriVfNq36SpeachhYK8w6V4KaLxjrNApzXXy
 7oqzT/l5MaLNA==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0146F378201D;
 Fri, 26 Jan 2024 16:43:31 +0000 (UTC)
Message-ID: <d467e5a4-6b61-4cad-8e38-c4495836a0d6@collabora.com>
Date: Fri, 26 Jan 2024 19:43:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 09/30] drm/shmem-helper: Add and use lockless
 drm_gem_shmem_get_pages()
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
 <20240105184624.508603-10-dmitry.osipenko@collabora.com>
 <ZbKZNCbZoV4ovWTH@phenom.ffwll.local> <20240126111827.70f8726c@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20240126111827.70f8726c@collabora.com>
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
Cc: kernel@collabora.com, Emma Anholt <emma@anholt.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@gmail.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/24 13:18, Boris Brezillon wrote:
> On Thu, 25 Jan 2024 18:24:04 +0100
> Daniel Vetter <daniel@ffwll.ch> wrote:
> 
>> On Fri, Jan 05, 2024 at 09:46:03PM +0300, Dmitry Osipenko wrote:
>>> Add lockless drm_gem_shmem_get_pages() helper that skips taking reservation
>>> lock if pages_use_count is non-zero, leveraging from atomicity of the
>>> refcount_t. Make drm_gem_shmem_mmap() to utilize the new helper.
>>>
>>> Acked-by: Maxime Ripard <mripard@kernel.org>
>>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>> ---
>>>  drivers/gpu/drm/drm_gem_shmem_helper.c | 19 +++++++++++++++----
>>>  1 file changed, 15 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> index cacf0f8c42e2..1c032513abf1 100644
>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> @@ -226,6 +226,20 @@ void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
>>>  }
>>>  EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
>>>  
>>> +static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
>>> +{
>>> +	int ret;  
>>
>> Just random drive-by comment: a might_lock annotation here might be good,
>> or people could hit some really interesting bugs that are rather hard to
>> reproduce ...
> 
> Actually, being able to acquire a ref in a dma-signalling path on an
> object we know for sure already has refcount >= 1 (because we previously
> acquired a ref in a path where dma_resv_lock() was allowed), was the
> primary reason I suggested moving to this atomic-refcount approach.
> 
> In the meantime, drm_gpuvm has evolved in a way that allows me to not
> take the ref in the dma-signalling path (the gpuvm_bo object now holds
> the ref, and it's acquired/released outside the dma-signalling path).
> 
> Not saying we shouldn't add this might_lock(), but others might have
> good reasons to have this function called in a path where locking
> is not allowed.

For Panthor the might_lock indeed won't be a appropriate, thanks for
reminding about it. I'll add explanatory comment to the code.

-- 
Best regards,
Dmitry

