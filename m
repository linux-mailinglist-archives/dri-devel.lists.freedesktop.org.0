Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E737F536A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 23:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4937610E680;
	Wed, 22 Nov 2023 22:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0964610E680
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 22:30:30 +0000 (UTC)
Received: from [10.3.2.161] (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 09F6666022D8;
 Wed, 22 Nov 2023 22:30:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700692228;
 bh=JuqJLDT68MtrvZ6KemLJZfCj6oUfIaSyMp7JzlRd+Kw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nF8dP092dwUTtl8L+2mnE2eSTtj69O5p4aconvCpeUO/RzH3dK/9/2kY30WVeqRGq
 8yhSxitPrC9iL0SOV/G5U6Z7erNubpppaxCT7RhHF4mtgY85VEWFiIHilnzkd2dj/b
 aIde5qG4o75yWljtuR80MmF3sRAABZrss8YTN6zYFYnlBLpe9rkdQ8ynRiTmVBQ5bj
 nAyE3IotT/v0q6IVC7IML14d28GQI0PbnRB7x93VJHOeZrZmN1YSZc+FrRp6h4n39z
 kZrvQEZMJxAGT+hEP4f/foPQQJ6U96wKMaccl/ZxbhEn5kZZVFWySmtrCZdDRnDb4b
 hn1n+SX3K2BnQ==
Message-ID: <2faf1111-9646-21e3-feb3-f59c955bc719@collabora.com>
Date: Thu, 23 Nov 2023 01:30:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v18 22/26] drm/shmem-helper: Don't free refcounted GEM
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
 <20231029230205.93277-23-dmitry.osipenko@collabora.com>
 <20231113105438.60896fdf@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20231113105438.60896fdf@collabora.com>
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

On 11/13/23 12:54, Boris Brezillon wrote:
> On Mon, 30 Oct 2023 02:02:01 +0300
> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> 
>> Don't free refcounted shmem object to prevent use-after-free bug that
>> is worse than a memory leak.
>>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>  drivers/gpu/drm/drm_gem_shmem_helper.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> index 6dd087f19ea3..4253c367dc07 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -203,9 +203,10 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>>  	if (obj->import_attach)
>>  		drm_prime_gem_destroy(obj, shmem->sgt);
>>  
>> -	drm_WARN_ON(obj->dev, refcount_read(&shmem->vmap_use_count));
>> -	drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_use_count));
>> -	drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_pin_count));
>> +	if (drm_WARN_ON(obj->dev, refcount_read(&shmem->vmap_use_count)) ||
>> +	    drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_use_count)) ||
>> +	    drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_pin_count)))
>> +		return;
> 
> I guess you're worried about ->sgt being referenced by the driver after
> the GEM is destroyed. If we assume drivers don't cache the sgt and
> always call get_pages_sgt() when they need it that shouldn't be an
> issue. What we really don't want to release is the pages themselves,
> but the GPU MMU might still have active mappings pointing to these
> pages.
> 
> In any case, I'm not against leaking the GEM object when any of these
> counters are not zero, but can we at least have a comment in the
> code explaining why we're doing that, so people don't have to go look
> at the git history to figure it out.

This patch is a minor improvement, it doesn't address any specific
issue. This should be a common pattern in kernel. If you're giving a
warning and know about the inevitable catastrophe, then avoid it if you can.

Actually, there are other similar cases in drm-shmem that can be improved.

-- 
Best regards,
Dmitry

