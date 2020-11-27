Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1792C6281
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 11:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D606EB7B;
	Fri, 27 Nov 2020 10:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3B2CF6EB7B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 10:06:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4293C1516;
 Fri, 27 Nov 2020 02:06:24 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F2D93F71F;
 Fri, 27 Nov 2020 02:06:23 -0800 (PST)
Subject: Re: [PATCH] drm/panfrost: fix reference leak in panfrost_job_hw_submit
To: Qinglang Miao <miaoqinglang@huawei.com>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20201127094441.121094-1-miaoqinglang@huawei.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <46d1944e-fbbe-075f-1c5b-356b5ce73ee0@arm.com>
Date: Fri, 27 Nov 2020 10:06:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201127094441.121094-1-miaoqinglang@huawei.com>
Content-Language: en-GB
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/11/2020 09:44, Qinglang Miao wrote:
> pm_runtime_get_sync will increment pm usage counter even it
> failed. Forgetting to putting operation will result in a
> reference leak here.
> 
> A new function pm_runtime_resume_and_get is introduced in
> [0] to keep usage counter balanced. So We fix the reference
> leak by replacing it with new funtion.
> 
> [0] dd8088d5a896 ("PM: runtime: Add  pm_runtime_resume_and_get to deal with usage counter")
> 
> Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
>   drivers/gpu/drm/panfrost/panfrost_job.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 30e7b7196..04cf3bb67 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -147,7 +147,7 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>   
>   	panfrost_devfreq_record_busy(&pfdev->pfdevfreq);
>   
> -	ret = pm_runtime_get_sync(pfdev->dev);
> +	ret = pm_runtime_resume_and_get(pfdev->dev);

Sorry, but in this case this change isn't correct. 
panfrost_job_hw_submit() is expected to be unbalanced (the PM reference 
count is expected to be incremented on return).

In the case where pm_runtime_get_sync() fails, the job will eventually 
timeout, and there's a corresponding pm_runtime_put_noidle() in 
panfrost_reset().

Potentially this could be handled better (e.g. without waiting for the 
timeout to occur), but equally this isn't something we expect to happen 
in normal operation).

Steve

>   	if (ret < 0)
>   		return;
>   
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
