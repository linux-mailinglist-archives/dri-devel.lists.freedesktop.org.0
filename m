Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D66886A3A1C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 05:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1500910E0D2;
	Mon, 27 Feb 2023 04:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203BE10E0D2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 04:27:57 +0000 (UTC)
Received: from [192.168.2.206] (109-252-117-89.nat.spd-mgts.ru
 [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C73CD660210B;
 Mon, 27 Feb 2023 04:27:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677472075;
 bh=kGcDbR4j3314+FTKe5Y7VXHs4Heb3IW139yRkBeOUHE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=b6pZBgVLX08t2YqV5olnHu19OeCoqB/Pm9rJVvl1XsvpURdJl5pAkl/KFEncqUPLm
 WH/OI8V39hmkRzCMr7+8+53/GdvfmBHLFqudl1IKzB/Mvpc9nIYG58SE6/8BvZZEO4
 w2DKaRa/Tjpz8AGIB58dHehk2+HDKr/9Knt3u5F5sWStdDWKRtvthKm9wZqQ9kGfdL
 k65gnWGlhEaZkkd2mIjigeJZCvJuFITIWf8qmqmmtOXHXwBKMVh9azo6OIgz5ogjOA
 bv6DOQVh5MFRUu37Wiet7YY9sahysVOG2QtMnrpWSiNEQ5QoUWOd7+bOlXFx1xcq0J
 ZIWVn1cPp6VgA==
Message-ID: <4d6e096b-4f04-5e17-ff23-4842b69fdc95@collabora.com>
Date: Mon, 27 Feb 2023 07:27:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v10 01/11] drm/msm/gem: Prevent blocking within shrinker
 loop
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
 <20230108210445.3948344-2-dmitry.osipenko@collabora.com>
 <d1c560f1-0201-7b41-bb27-d6bcb332b8d4@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <d1c560f1-0201-7b41-bb27-d6bcb332b8d4@suse.de>
Content-Type: text/plain; charset=UTF-8
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/17/23 15:02, Thomas Zimmermann wrote:
> Hi
> 
> Am 08.01.23 um 22:04 schrieb Dmitry Osipenko:
>> Consider this scenario:
>>
>> 1. APP1 continuously creates lots of small GEMs
>> 2. APP2 triggers `drop_caches`
>> 3. Shrinker starts to evict APP1 GEMs, while APP1 produces new purgeable
>>     GEMs
>> 4. msm_gem_shrinker_scan() returns non-zero number of freed pages
>>     and causes shrinker to try shrink more
>> 5. msm_gem_shrinker_scan() returns non-zero number of freed pages again,
>>     goto 4
>> 6. The APP2 is blocked in `drop_caches` until APP1 stops producing
>>     purgeable GEMs
>>
>> To prevent this blocking scenario, check number of remaining pages
>> that GPU shrinker couldn't release due to a GEM locking contention
>> or shrinking rejection. If there are no remaining pages left to shrink,
>> then there is no need to free up more pages and shrinker may break out
>> from the loop.
>>
>> This problem was found during shrinker/madvise IOCTL testing of
>> virtio-gpu driver. The MSM driver is affected in the same way.
>>
>> Reviewed-by: Rob Clark <robdclark@gmail.com>
>> Fixes: b352ba54a820 ("drm/msm/gem: Convert to using drm_gem_lru")
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>   drivers/gpu/drm/drm_gem.c              | 9 +++++++--
>>   drivers/gpu/drm/msm/msm_gem_shrinker.c | 8 ++++++--
>>   include/drm/drm_gem.h                  | 4 +++-
>>   3 files changed, 16 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index 59a0bb5ebd85..c6bca5ac6e0f 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -1388,10 +1388,13 @@ EXPORT_SYMBOL(drm_gem_lru_move_tail);
>>    *
>>    * @lru: The LRU to scan
>>    * @nr_to_scan: The number of pages to try to reclaim
>> + * @remaining: The number of pages left to reclaim
>>    * @shrink: Callback to try to shrink/reclaim the object.
>>    */
>>   unsigned long
>> -drm_gem_lru_scan(struct drm_gem_lru *lru, unsigned nr_to_scan,
>> +drm_gem_lru_scan(struct drm_gem_lru *lru,
>> +         unsigned int nr_to_scan,
>> +         unsigned long *remaining,
>>            bool (*shrink)(struct drm_gem_object *obj))
>>   {
>>       struct drm_gem_lru still_in_lru;
>> @@ -1430,8 +1433,10 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
>> unsigned nr_to_scan,
>>            * hit shrinker in response to trying to get backing pages
>>            * for this obj (ie. while it's lock is already held)
>>            */
>> -        if (!dma_resv_trylock(obj->resv))
>> +        if (!dma_resv_trylock(obj->resv)) {
>> +            *remaining += obj->size >> PAGE_SHIFT;
>>               goto tail;
>> +        }
>>             if (shrink(obj)) {
>>               freed += obj->size >> PAGE_SHIFT;
>> diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c
>> b/drivers/gpu/drm/msm/msm_gem_shrinker.c
>> index 051bdbc093cf..b7c1242014ec 100644
>> --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
>> +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
>> @@ -116,12 +116,14 @@ msm_gem_shrinker_scan(struct shrinker *shrinker,
>> struct shrink_control *sc)
>>       };
>>       long nr = sc->nr_to_scan;
>>       unsigned long freed = 0;
>> +    unsigned long remaining = 0;
>>         for (unsigned i = 0; (nr > 0) && (i < ARRAY_SIZE(stages)); i++) {
>>           if (!stages[i].cond)
>>               continue;
>>           stages[i].freed =
>> -            drm_gem_lru_scan(stages[i].lru, nr, stages[i].shrink);
>> +            drm_gem_lru_scan(stages[i].lru, nr, &remaining,
> 
> This function relies in remaining being pre-initialized. That's not
> obvious and error prone. At least, pass-in something like
> &stages[i].remaining that is then initialized internally by
> drm_gem_lru_scan() to zero. And similar to freed, sum up the individual
> stages' remaining here.
> 
> TBH I somehow don't like the overall design of how all these functions
> interact with each other. But I also can't really point to the actual
> problem. So it's best to take what you have here; maybe with the change
> I proposed.
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

I had to keep to the remaining being pre-initialized because moving the
initialization was hurting the rest of the code. Though, updated the MSM
patch to use &stages[i].remaining

-- 
Best regards,
Dmitry

