Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3438C50F173
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 08:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3355112180;
	Tue, 26 Apr 2022 06:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBEAE10F1B7;
 Tue, 26 Apr 2022 02:55:02 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id z16so16659305pfh.3;
 Mon, 25 Apr 2022 19:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1rN0QiDzAAW5o3UYZm7hzXV2kAazUl8u4ntaehl3IYY=;
 b=CKlnpeBxCkY9/2r9tihE070O6O6esEOSK57Xpc3Vv1OspQXZ8FSAhNyk/0pzL1ThJB
 3SU0TgHPCKeme2NGx2ovXKg0Izevq7DXEe2+fvy4j3/gkZJCHIeerEyzFOLiZx5wJDgw
 f1nPISkt7PaBSYcYTFexafRMHcr5BEfbeBIiuruBSTO1hksKz5omTtFlT0z/SnLf+jfo
 d3vSZWLZKwBEYtc/HPJd+sGB0oSVU6N5Dxgn7TulHlucufpK9wMTdlbHacLiJ+GDPHB+
 KHYtio7b85nDxECcvO6FrF0r7CaeVaAlF0+RFyds5homIAkTCvw4lAbpu1bzQzxVczhx
 wsaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1rN0QiDzAAW5o3UYZm7hzXV2kAazUl8u4ntaehl3IYY=;
 b=qnjm+akHAplBJWBnHJwy05Liyuq5cm7NTlMwu+EKBJ7Y8wdtzmX/4517fEC79gHOlU
 sb1EO5ax7JD1xT7jw0itsVOY5140CdBH7S/neAt08hsmnNWl6IuXa6906VlVDIAvg5oD
 gYRJLuzv4msldYslycNgZw600BSnhTNmyoQCFZAxkU/a48fJ8LfH4qEgtA1oZdoBnG7T
 n/LQUSrPqlOsmj5LpYs/vQF8Yf5w4jcwj++9pfcibN/kGB6Ivlct/X0wtCiuOeWmgInN
 1FXW1GdBmDfFnBfaERn9UgOUGI5AESz0pMU7N04yKAIM3xmrFnTP7r+QlxIb6QpXea3G
 SjsQ==
X-Gm-Message-State: AOAM531ZKhy1UBaUR3Nn50/N1XuUd40M42SAVaUfahZS9Dwd356j5iyU
 UgSPeZttgLvTfF+lbx2yqxKBbbhWkffqyA==
X-Google-Smtp-Source: ABdhPJwNviYckUI/UNiow7E3FbeLHkwCCdm6a+W3VMy0VDCDXJZew/LWDZNamF9MAQ6ELIyCFePw9g==
X-Received: by 2002:a05:6a00:b48:b0:50c:f2de:6811 with SMTP id
 p8-20020a056a000b4800b0050cf2de6811mr18519968pfo.80.1650941702399; 
 Mon, 25 Apr 2022 19:55:02 -0700 (PDT)
Received: from [192.168.50.247] ([103.84.139.165])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a17090a540800b001d952b8f728sm780306pjh.2.2022.04.25.19.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 19:55:02 -0700 (PDT)
Message-ID: <79b198d0-eff2-d658-4b5e-9084a834fc93@gmail.com>
Date: Tue, 26 Apr 2022 10:54:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] gpu: drm: remove redundant dma_fence_put() when
 drm_sched_job_add_dependency() fails
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, yuq825@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20220425083645.25922-1-hbh25y@gmail.com>
 <b7d8956e-5ac6-8200-d8b1-4ce828f04665@amd.com>
From: Hangyu Hua <hbh25y@gmail.com>
In-Reply-To: <b7d8956e-5ac6-8200-d8b1-4ce828f04665@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Apr 2022 06:46:27 +0000
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
Cc: lima@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022/4/25 23:42, Andrey Grodzovsky wrote:
> On 2022-04-25 04:36, Hangyu Hua wrote:
> 
>> When drm_sched_job_add_dependency() fails, dma_fence_put() will be called
>> internally. Calling it again after drm_sched_job_add_dependency() 
>> finishes
>> may result in a dangling pointer.
>>
>> Fix this by removing redundant dma_fence_put().
>>
>> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
>> ---
>>   drivers/gpu/drm/lima/lima_gem.c        | 1 -
>>   drivers/gpu/drm/scheduler/sched_main.c | 1 -
>>   2 files changed, 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/lima/lima_gem.c 
>> b/drivers/gpu/drm/lima/lima_gem.c
>> index 55bb1ec3c4f7..99c8e7f6bb1c 100644
>> --- a/drivers/gpu/drm/lima/lima_gem.c
>> +++ b/drivers/gpu/drm/lima/lima_gem.c
>> @@ -291,7 +291,6 @@ static int lima_gem_add_deps(struct drm_file 
>> *file, struct lima_submit *submit)
>>           err = drm_sched_job_add_dependency(&submit->task->base, fence);
>>           if (err) {
>> -            dma_fence_put(fence);
>>               return err;
> 
> 
> Makes sense here
> 
> 
>>           }
>>       }
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index b81fceb0b8a2..ebab9eca37a8 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -708,7 +708,6 @@ int drm_sched_job_add_implicit_dependencies(struct 
>> drm_sched_job *job,
>>           dma_fence_get(fence);
>>           ret = drm_sched_job_add_dependency(job, fence);
>>           if (ret) {
>> -            dma_fence_put(fence);
> 
> 
> 
> Not sure about this one since if you look at the relevant commits -
> 'drm/scheduler: fix drm_sched_job_add_implicit_dependencies' and
> 'drm/scheduler: fix drm_sched_job_add_implicit_dependencies harder'
> You will see that the dma_fence_put here balances the extra dma_fence_get
> above
> 
> Andrey
> 

I don't think so. I checked the call chain and found no additional 
dma_fence_get(). But dma_fence_get() needs to be called before 
drm_sched_job_add_dependency() to keep the counter balanced. On the 
other hand, dma_fence_get() and dma_fence_put() are meaningless here if 
threre is an extra dma_fence_get() beacause counter will not decrease to 
0 during drm_sched_job_add_dependency().

I check the call chain as follows:

msm_ioctl_gem_submit()
-> submit_fence_sync()
-> drm_sched_job_add_implicit_dependencies()

Thanks,
Hangyu

> 
>>               return ret;
>>           }
>>       }
