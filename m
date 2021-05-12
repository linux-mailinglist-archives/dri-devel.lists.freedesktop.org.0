Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BEC37C3B9
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 17:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61AE890FE;
	Wed, 12 May 2021 15:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D65E0890FE
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 15:23:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D06931B;
 Wed, 12 May 2021 08:23:51 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 051603F718;
 Wed, 12 May 2021 08:23:49 -0700 (PDT)
Subject: Re: [PATCH -next] drm/panfrost: Fix PM reference leak in
 panfrost_job_hw_submit()
To: Zou Wei <zou_wei@huawei.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com, airlied@linux.ie, daniel@ffwll.ch,
 alyssa.rosenzweig@collabora.com
References: <1620714551-106976-1-git-send-email-zou_wei@huawei.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <7ebf35ef-58c3-7bc7-f0e9-ad487bae6686@arm.com>
Date: Wed, 12 May 2021 16:23:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1620714551-106976-1-git-send-email-zou_wei@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/05/2021 07:29, Zou Wei wrote:
> pm_runtime_get_sync will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here.
> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
> counter balanced.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>

Thanks for the patch, but this is actually incorrect. 
panfrost_job_hw_submit() is expected to unconditionally increment the pm 
usage counter. This is because panfrost_job_hw_submit() can (currently) 
never fail, so in this case the job is considered "submitted" (even 
though it never reaches the hardware) and it's handled by the job timeout.

However this is at least the second time[1] this phantom "reference 
leak" has been raised, so perhaps it's time to handle this better. I'll 
post a patch reworking panfrost_job_hw_submit() so it can fail.

Thanks,

Steve

[1] 
https://lore.kernel.org/r/20200520110504.24388-1-dinghao.liu%40zju.edu.cn

> ---
>   drivers/gpu/drm/panfrost/panfrost_job.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 6003cfe..42d8dbc 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -157,7 +157,7 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>   
>   	panfrost_devfreq_record_busy(&pfdev->pfdevfreq);
>   
> -	ret = pm_runtime_get_sync(pfdev->dev);
> +	ret = pm_runtime_resume_and_get(pfdev->dev);
>   	if (ret < 0)
>   		return;
>   
> 

