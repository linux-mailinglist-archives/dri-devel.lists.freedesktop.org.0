Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFAA433505
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 13:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC5A6EB8E;
	Tue, 19 Oct 2021 11:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6EA6E0FE;
 Tue, 19 Oct 2021 11:49:10 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id v127so11613785wme.5;
 Tue, 19 Oct 2021 04:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=egDcJzLzf/Uxj848Ty7/5BUuy3wZZ0YFuTvjxwcidJg=;
 b=K7mF4Ax5bWuDd0p6uv/wHlHOVoQSEMRCzONmjR/o+WxERYIScG9mhePG9bMfay2nwa
 ARVpJsXLoaJ66xrGmSHd7EFFGapPdLdy/HMS6xnrbnCCvGXXHrNMONVuKWa8SLVPJlb4
 1TmEIRHm6JFqXxgOyqffMcsnOBPskflIV/mbuu/AnKSdTIy9wl1VgCbXXdiXfY29HGQW
 zv1mXdWq810MjhVw15AZ9CwqY6AX2635RzkXLG8I8p+nACvX8ZKKu2FPQqg2XX1ROvfz
 T3XOgcs0jBiIaEHVB7sAu29WUYkvGya6Sq86+tILgdbopVFixVCKm98UiMQomhMSO8+E
 55fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=egDcJzLzf/Uxj848Ty7/5BUuy3wZZ0YFuTvjxwcidJg=;
 b=R1tFjWlhvxthBanc8No7WFSxlq2Xgt4gE6dkaaITyH5fvUUwJMi6Xy2ytrGAvEcUrr
 6nuCdeIcXMiKfpWxk3elcfxP0zaRne722VcNb+BKAQBLhjGt6RyE76QjJBCKm3kbx1nx
 hi5qd4bhGNXHIeAn5adYbp1REM/zjGK0dKDpbF9PG1QCP63iExhoNeuWCbA40XFZieb9
 BiUEJN9N/X2JqTV626K8RxDNIL0UbRymJ3h2NedLHWcJbUbflZd1CF+XXl5w72lpiNhi
 1TYdxAAYJbch03gBWTMGcbyXtRMpVp4qy5WnTjxsr2gW8N8fY8/psMtUJaNn/G8FONOq
 gXCw==
X-Gm-Message-State: AOAM533WmVAa6qM3CypXGFqNC2dZKj0lh7XS/uyHzzP638xbd7GjQJQL
 3AsgP6MoP6KbR8+9jZzqK3l9gESoZOk=
X-Google-Smtp-Source: ABdhPJy+IdMIzL2VFAVUXSkXWGgmJQypeQj8T16niNgUpDzi2GSZ+eSOF1fnyhlmfHh4rbR9QfeFbw==
X-Received: by 2002:a05:600c:a0b:: with SMTP id
 z11mr5704474wmp.147.1634644149444; 
 Tue, 19 Oct 2021 04:49:09 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:f344:748e:38f7:c50?
 ([2a02:908:1252:fb60:f344:748e:38f7:c50])
 by smtp.gmail.com with ESMTPSA id a2sm15169311wru.82.2021.10.19.04.49.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 04:49:09 -0700 (PDT)
Subject: Re: [PATCH 14/28] drm/msm: use new iterator in msm_gem_describe
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 tvrtko.ursulin@linux.intel.com
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-15-christian.koenig@amd.com>
 <YWbp1PoezuLqHpKZ@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9fff1e2b-b4f1-9c36-b621-4c896bf58c01@gmail.com>
Date: Tue, 19 Oct 2021 13:49:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWbp1PoezuLqHpKZ@phenom.ffwll.local>
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

Am 13.10.21 um 16:14 schrieb Daniel Vetter:
> On Tue, Oct 05, 2021 at 01:37:28PM +0200, Christian König wrote:
>> Simplifying the code a bit. Also drop the RCU read side lock since the
>> object is locked anyway.
>>
>> Untested since I can't get the driver to compile on !ARM.
> Cross-compiler install is pretty easy and you should have that for pushing
> drm changes to drm-misc :-)

I do have cross compile setups for some architectures, but I seriously 
can't do that for every single driver.

With only a bit of work we allowed MSM to be compile tested on other 
architectures as well now. That even yielded a couple of missing 
includes and dependencies in MSM which just don't matter on ARM.

>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> Assuming this compiles, it looks correct.

Yes it does.

>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


Thanks,
Christian.

>
>> ---
>>   drivers/gpu/drm/msm/msm_gem.c | 19 +++++--------------
>>   1 file changed, 5 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
>> index 40a9863f5951..5bd511f07c07 100644
>> --- a/drivers/gpu/drm/msm/msm_gem.c
>> +++ b/drivers/gpu/drm/msm/msm_gem.c
>> @@ -880,7 +880,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
>>   {
>>   	struct msm_gem_object *msm_obj = to_msm_bo(obj);
>>   	struct dma_resv *robj = obj->resv;
>> -	struct dma_resv_list *fobj;
>> +	struct dma_resv_iter cursor;
>>   	struct dma_fence *fence;
>>   	struct msm_gem_vma *vma;
>>   	uint64_t off = drm_vma_node_start(&obj->vma_node);
>> @@ -955,22 +955,13 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
>>   		seq_puts(m, "\n");
>>   	}
>>   
>> -	rcu_read_lock();
>> -	fobj = dma_resv_shared_list(robj);
>> -	if (fobj) {
>> -		unsigned int i, shared_count = fobj->shared_count;
>> -
>> -		for (i = 0; i < shared_count; i++) {
>> -			fence = rcu_dereference(fobj->shared[i]);
>> +	dma_resv_for_each_fence(&cursor, robj, true, fence) {
>> +		if (dma_resv_iter_is_exclusive(&cursor))
>> +			describe_fence(fence, "Exclusive", m);
>> +		else
>>   			describe_fence(fence, "Shared", m);
>> -		}
>>   	}
>>   
>> -	fence = dma_resv_excl_fence(robj);
>> -	if (fence)
>> -		describe_fence(fence, "Exclusive", m);
>> -	rcu_read_unlock();
>> -
>>   	msm_gem_unlock(obj);
>>   }
>>   
>> -- 
>> 2.25.1
>>

