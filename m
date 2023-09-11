Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1B579AE2C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 01:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928D610E069;
	Mon, 11 Sep 2023 23:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BB410E356
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 23:42:03 +0000 (UTC)
Received: from [192.168.2.112] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 756AF66072EF;
 Tue, 12 Sep 2023 00:42:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694475722;
 bh=OrWMPUr9xPwnLGNG5ZZ649t03TEnkQ5xzPfCCOrwjzk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bdkmqOWWnk55xFgdFOACT+6rfydSIOpX7SnniGRcA4p2N8h9vRVMKm/y7OLu6xKZ2
 Hb/AO/1RAjJ1xVJFzvvvegmg81DMjAFc2tx2lorj27emHCLTY/7gX66mhM/iuxXre4
 YS08ebmyCGsPBrRwIRWOZAUrdFAB4c8Kj85ds8VudrCe5U3lSX7cuhUgpKX/2HTyi8
 RHgGUQQu8TiSGvSzDAzwqmzFBbSzQ2KYtzKFTAD/bbhrUYCmq5yx8aywMX4zMUbv2H
 qFq3nohe37BOrJBUuRSKc59EAbH/I51ZBwfjcvlV8X2b5ZF4NuAMcOO9E5IHwOyGoE
 zFncu+0P3Yf0g==
Message-ID: <297f5209-603e-a50d-c27b-8e50d23f86de@collabora.com>
Date: Tue, 12 Sep 2023 02:41:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v16 02/20] drm/shmem-helper: Use flag for tracking page
 count bumped by get_pages_sgt()
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230903170736.513347-1-dmitry.osipenko@collabora.com>
 <20230903170736.513347-3-dmitry.osipenko@collabora.com>
 <20230905094050.3c918a43@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230905094050.3c918a43@collabora.com>
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

On 9/5/23 10:40, Boris Brezillon wrote:
> On Sun,  3 Sep 2023 20:07:18 +0300
> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> 
>> Use separate flag for tracking page count bumped by shmem->sgt to avoid
>> imbalanced page counter during of drm_gem_shmem_free() time. It's fragile
>> to assume that populated shmem->pages at a freeing time means that the
>> count was bumped by drm_gem_shmem_get_pages_sgt(), using a flag removes
>> the ambiguity.
>>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>  drivers/gpu/drm/drm_gem_shmem_helper.c | 11 ++++++++++-
>>  drivers/gpu/drm/lima/lima_gem.c        |  1 +
>>  include/drm/drm_gem_shmem_helper.h     |  7 +++++++
>>  3 files changed, 18 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> index 6693d4061ca1..848435e08eb2 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -152,8 +152,10 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>>  			sg_free_table(shmem->sgt);
>>  			kfree(shmem->sgt);
>>  		}
>> -		if (shmem->pages)
>> +		if (shmem->pages) {
>>  			drm_gem_shmem_put_pages(shmem);
>> +			drm_WARN_ON(obj->dev, !shmem->got_pages_sgt);
>> +		}
> 
> Already mentioned in v15, but I keep thinking the following:
> 
> 		if (shmem->sgt) {
> 			// existing code in the preceding
> 			// if (shmem->sgt) branch
> 			...
> 
> 			/*
> 			 * Release the implicit pages ref taken in
> 			 * drm_gem_shmem_get_pages_sgt_locked().
> 			 */
> 			drm_gem_shmem_put_pages(shmem);
> 		}
> 
> does exactly the same without requiring the addition of a new field.

I'll factor out these "flag" patches into separate patchset since they
cause too many questions. This is a fix for a minor bug that existed for
many years and is difficult to trigger in practice, it can wait.

For now will be better to focus on finishing and landing the refcnt and
shrinker patches, the rest of drm-shmem core improvements can be done
afterwards.

-- 
Best regards,
Dmitry

