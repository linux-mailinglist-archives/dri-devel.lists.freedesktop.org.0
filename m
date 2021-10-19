Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1A643365D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 14:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6680A6E169;
	Tue, 19 Oct 2021 12:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D0F6E169;
 Tue, 19 Oct 2021 12:54:07 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id u18so47739537wrg.5;
 Tue, 19 Oct 2021 05:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=1mvclZulp1jBGRqznG/b0fXQ3yElAWRCQ+ub5281RqY=;
 b=DyFXLhO2hfmcRk4ZOfWcW28zmBfrAPLobYErFlCLG06QAX5ZvNHr/DLxehkTJHu3Jn
 q6NJzPBjIU+CRVyMxKVSbh06aqUkoILHEHA3acN5Wt2YGTz239ZBwtiu6UQMhZE5w6mB
 W/MhXuMU9VOMyTno6gEmYX9r12vkA2fDq6cIlsbChKyf5g2SoWcjwRPkoZnYaCFjw2t9
 m+upfRu68oogpgtE7B0HpUbSds1XYQYJ0qOmXlOubz5sFz2GITTdbL+/g2DH7c6bGF7z
 GK5ctOSWxAH/t3jJiiHJOlG0SsCDj5B5K/BBS0spkO7TT5DwMxNI6zGDXcI58ILa55i8
 HdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1mvclZulp1jBGRqznG/b0fXQ3yElAWRCQ+ub5281RqY=;
 b=RVzmGNhCTaGtFNtkf3Ipb6rclPwT9VZVE15aSvWBpKfNJ7TC4KIwNMfgrdim134vkB
 xumovcu0zgSa9Aes2TZdJ27mEx+R5J01TWrK3YCPej6s9Q0mqphFEV5OY8TqGMtfRrNC
 4rAIuJwzbTZPaUMggFPzrO1Nr7FKvQP2bvTd1bC+QbznihqUmLy8JuA91oWkCS7snHEB
 JVK9QDexhFVDi8C34OjRK1l+klXjXNzn5gAg/0nWiYGFHZbfZHei3pb1k7dzHTJgfb3g
 pxL9HgWQRWY1S9Zxl21uWLNe3hx6LHRDLXFw16FLwZmO8nu4Pyi/47FCEgQX0qiEV3kD
 79NA==
X-Gm-Message-State: AOAM532LKl00CiXhe4Cj0rWBNKpvR7+c5tCiBaIuFh0qv+7HHz3XMzYi
 3J2Wj8K4EmQbCoG09gv8RTc=
X-Google-Smtp-Source: ABdhPJznqWw6536w7KHmaGxJprPY+w8hHoqj2Re1K7qIk8KLaWxB9z9oathPltY4TElg2E6VG/42Uw==
X-Received: by 2002:a5d:6245:: with SMTP id m5mr44059656wrv.148.1634648046127; 
 Tue, 19 Oct 2021 05:54:06 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:f344:748e:38f7:c50?
 ([2a02:908:1252:fb60:f344:748e:38f7:c50])
 by smtp.gmail.com with ESMTPSA id k10sm15045970wrh.64.2021.10.19.05.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 05:54:05 -0700 (PDT)
Subject: Re: [PATCH 23/28] drm: use new iterator in
 drm_gem_fence_array_add_implicit v3
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 tvrtko.ursulin@linux.intel.com
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-24-christian.koenig@amd.com>
 <YWbrb7xQfTWU15U1@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <71bf3523-7c18-dac7-de53-f7b20e737cc3@gmail.com>
Date: Tue, 19 Oct 2021 14:54:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWbrb7xQfTWU15U1@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.10.21 um 16:21 schrieb Daniel Vetter:
> On Tue, Oct 05, 2021 at 01:37:37PM +0200, Christian König wrote:
>> Simplifying the code a bit.
>>
>> v2: add missing rcu_read_lock()/unlock()
>> v3: switch to locked version
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Please make sure you also apply this to the new copy of this code in
> drm/sched. This one here is up for deletion, once I get all the driver
> conversions I have landed ...

Yeah, I do have that. Only added this patch here for completeness so 
that I could at least consider dropping the old access functions.

Put I will hold it back, just ping me when the code in question is removed.

Christian.

> -Daniel
>
>> ---
>>   drivers/gpu/drm/drm_gem.c | 26 +++++---------------------
>>   1 file changed, 5 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index 09c820045859..4dcdec6487bb 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -1340,31 +1340,15 @@ int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
>>   				     struct drm_gem_object *obj,
>>   				     bool write)
>>   {
>> -	int ret;
>> -	struct dma_fence **fences;
>> -	unsigned int i, fence_count;
>> -
>> -	if (!write) {
>> -		struct dma_fence *fence =
>> -			dma_resv_get_excl_unlocked(obj->resv);
>> -
>> -		return drm_gem_fence_array_add(fence_array, fence);
>> -	}
>> +	struct dma_resv_iter cursor;
>> +	struct dma_fence *fence;
>> +	int ret = 0;
>>   
>> -	ret = dma_resv_get_fences(obj->resv, NULL,
>> -						&fence_count, &fences);
>> -	if (ret || !fence_count)
>> -		return ret;
>> -
>> -	for (i = 0; i < fence_count; i++) {
>> -		ret = drm_gem_fence_array_add(fence_array, fences[i]);
>> +	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
>> +		ret = drm_gem_fence_array_add(fence_array, fence);
>>   		if (ret)
>>   			break;
>>   	}
>> -
>> -	for (; i < fence_count; i++)
>> -		dma_fence_put(fences[i]);
>> -	kfree(fences);
>>   	return ret;
>>   }
>>   EXPORT_SYMBOL(drm_gem_fence_array_add_implicit);
>> -- 
>> 2.25.1
>>

