Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 824DA4830FD
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 13:24:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C98B710E15D;
	Mon,  3 Jan 2022 12:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9614610E15D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 12:24:37 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 g7-20020a7bc4c7000000b00345c4bb365aso18301868wmk.4
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jan 2022 04:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=fPyh02WKyhlLdOzBJxhe/AtlHRa+RMJ3Fx1lN0POwGI=;
 b=jCfJIyv5VYDTqzr3GLGtL0BeIbN25t8cts/aGkGFVXFxxI2nkmwNrN/YKYniFKokGl
 T5jYBTHsPz0Op5SQG5n0AGMbkeZvGVaOr1gSJmcGyZPT5Tc+v4esBs/B9v5mETH0Lmp1
 /Jdn2+vuSMYiKSA3X2wo3gutG+lJY8VDXgbd6yBGdq/ruNpYs4r4j4Idkc5xGdeRmZc9
 xgdm0gUern3AH9tIRT3l6J2jHAyhYI3ZRO9EZLoNDbjmvpUljljZiMTiw5R/CTKaQrpq
 TSaOT+2bZsVFrpFF60N6L7LuUq5qb5cz9192VGVuVKp2/5ybm96q9vEx4O/WcdZaatej
 9HAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=fPyh02WKyhlLdOzBJxhe/AtlHRa+RMJ3Fx1lN0POwGI=;
 b=nfInyK3YqIuolnyZm+gFCUB5EX3YjCAXefeMRMV2+EvdDhoXtNzTod72Vg7Hkc776h
 UwbA4SxoYsDPf/ED5wFYyLqM5B4fJysv7bKTRNH8gDNhGG85MO22zj4VVek5H+5UDeBU
 YJV3sUKDOv87g6I4TPOKZLcOW63UzT9XY59M7XfxVSMFRl0DMkFqAmboSimS12d5n0v6
 Wg8svvrf8Fg/W8vdA6627iLIRKAtOgyXG58fHecb+m7kah6x8H7AnfhpwwNiVXIfGLYQ
 vzWUYRQgitm0ZW07CcWxzi1zk4CF5kGxSQ3wlDepE7QDwA4Vrd+GqvwSJrt52CDnje2H
 ACDA==
X-Gm-Message-State: AOAM5310pBt8z/qPQRhothe7b2SrIvsM00JUHgG9K/Hbs0panzztzD9Y
 VNvl2tBpaTigfeUw4QD8vkE=
X-Google-Smtp-Source: ABdhPJxFptxVTR9FMOpISbuLIGa/Nbhx38Xp92VKcc2aenJW0S8G6mDTOJ0duIdmv0C747lM25+H0A==
X-Received: by 2002:a05:600c:4e08:: with SMTP id
 b8mr38529644wmq.31.1641212676161; 
 Mon, 03 Jan 2022 04:24:36 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:4bf5:8542:f955:f736?
 ([2a02:908:1252:fb60:4bf5:8542:f955:f736])
 by smtp.gmail.com with ESMTPSA id p11sm39567159wru.99.2022.01.03.04.24.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 04:24:35 -0800 (PST)
Subject: Re: [PATCH 11/24] drm/amdgpu: use dma_resv_for_each_fence for CS
 workaround
To: Daniel Vetter <daniel@ffwll.ch>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-12-christian.koenig@amd.com>
 <YcOapBWDYQj5hKRn@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <10dd0d62-b80a-f7ef-4964-e0e13fe12400@gmail.com>
Date: Mon, 3 Jan 2022 13:24:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YcOapBWDYQj5hKRn@phenom.ffwll.local>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 22.12.21 um 22:37 schrieb Daniel Vetter:
> On Tue, Dec 07, 2021 at 01:33:58PM +0100, Christian König wrote:
>> Get the write fence using dma_resv_for_each_fence instead of accessing
>> it manually.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> index 53e407ea4c89..7facd614e50a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> @@ -1268,6 +1268,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>>   	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>>   		struct dma_resv *resv = e->tv.bo->base.resv;
>>   		struct dma_fence_chain *chain = e->chain;
>> +		struct dma_resv_iter cursor;
>> +		struct dma_fence *fence;
>>   
>>   		if (!chain)
>>   			continue;
>> @@ -1277,9 +1279,10 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>>   		 * submission in a dma_fence_chain and add it as exclusive
>>   		 * fence.
>>   		 */
>> -		dma_fence_chain_init(chain, dma_resv_excl_fence(resv),
>> -				     dma_fence_get(p->fence), 1);
>> -
>> +		dma_resv_for_each_fence(&cursor, resv, false, fence) {
>> +			break;
>> +		}
>> +		dma_fence_chain_init(chain, fence, dma_fence_get(p->fence), 1);
> Uh this needs a TODO. I'm assuming you'll fix this up later on when
> there's more than write fence, but in case of bisect or whatever this is a
> bit too clever. Like you just replace one "dig around in dma-resv
> implementation details" with one that's not even a documented interface
> :-)

Ah, yes. There is a rather big TODO just above this, but I should 
probably make that even more stronger.

>
> With an adequately loud comment added interim:
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks,
Christian.

>
>>   		rcu_assign_pointer(resv->fence_excl, &chain->base);
>>   		e->chain = NULL;
>>   	}
>> -- 
>> 2.25.1
>>

