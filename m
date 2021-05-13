Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9C037F120
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 04:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354D36E595;
	Thu, 13 May 2021 02:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471816E595
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 02:07:16 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FgZjn4J0tzmV9g;
 Thu, 13 May 2021 10:05:01 +0800 (CST)
Received: from [10.174.178.208] (10.174.178.208) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Thu, 13 May 2021 10:07:09 +0800
Subject: Re: [PATCH -next] drm/panfrost: Fix PM reference leak in
 panfrost_job_hw_submit()
To: Steven Price <steven.price@arm.com>, <robh@kernel.org>,
 <tomeu.vizoso@collabora.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <alyssa.rosenzweig@collabora.com>
References: <1620714551-106976-1-git-send-email-zou_wei@huawei.com>
 <7ebf35ef-58c3-7bc7-f0e9-ad487bae6686@arm.com>
From: Samuel Zou <zou_wei@huawei.com>
Message-ID: <be1d7a48-be86-3713-e623-61bbd08125f7@huawei.com>
Date: Thu, 13 May 2021 10:07:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7ebf35ef-58c3-7bc7-f0e9-ad487bae6686@arm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.208]
X-CFilter-Loop: Reflected
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Steven,

Thanks for your review and also answer my doubts. Looking forward to 
your patch.

On 2021/5/12 23:23, Steven Price wrote:
> On 11/05/2021 07:29, Zou Wei wrote:
>> pm_runtime_get_sync will increment pm usage counter even it failed.
>> Forgetting to putting operation will result in reference leak here.
>> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
>> counter balanced.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> 
> Thanks for the patch, but this is actually incorrect. 
> panfrost_job_hw_submit() is expected to unconditionally increment the pm 
> usage counter. This is because panfrost_job_hw_submit() can (currently) 
> never fail, so in this case the job is considered "submitted" (even 
> though it never reaches the hardware) and it's handled by the job timeout.
> 
> However this is at least the second time[1] this phantom "reference 
> leak" has been raised, so perhaps it's time to handle this better. I'll 
> post a patch reworking panfrost_job_hw_submit() so it can fail.
> 
> Thanks,
> 
> Steve
> 
> [1] 
> https://lore.kernel.org/r/20200520110504.24388-1-dinghao.liu%40zju.edu.cn
> 
>> ---
>>   drivers/gpu/drm/panfrost/panfrost_job.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c 
>> b/drivers/gpu/drm/panfrost/panfrost_job.c
>> index 6003cfe..42d8dbc 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>> @@ -157,7 +157,7 @@ static void panfrost_job_hw_submit(struct 
>> panfrost_job *job, int js)
>>       panfrost_devfreq_record_busy(&pfdev->pfdevfreq);
>> -    ret = pm_runtime_get_sync(pfdev->dev);
>> +    ret = pm_runtime_resume_and_get(pfdev->dev);
>>       if (ret < 0)
>>           return;
>>
> 
> .
