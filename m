Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 124691E486F
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 17:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984C46E33E;
	Wed, 27 May 2020 15:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A62E76E33E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:52:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A35830E;
 Wed, 27 May 2020 08:52:05 -0700 (PDT)
Received: from [192.168.1.84] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E5533F52E;
 Wed, 27 May 2020 08:52:03 -0700 (PDT)
Subject: Re: [PATCH] [v2] drm/panfrost: Fix runtime PM imbalance on error
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
References: <20200522134109.27204-1-dinghao.liu@zju.edu.cn>
From: Steven Price <steven.price@arm.com>
Message-ID: <48348af2-649c-7305-6255-6ae6a80e9b7a@arm.com>
Date: Wed, 27 May 2020 16:52:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200522134109.27204-1-dinghao.liu@zju.edu.cn>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/05/2020 14:41, Dinghao Liu wrote:
> The caller expects panfrost_job_hw_submit() to increase
> runtime PM usage counter. The refcount decrement on the
> error branch of WARN_ON() will break the counter balance
> and needs to be removed.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,

Steve

> ---
> 
> Changelog:
> 
> v2: - Remove refcount decrement on the error path of
>        WARN_ON() rather than add refcount decrement
>        on the error path of pm_runtime_get_sync().
> ---
>   drivers/gpu/drm/panfrost/panfrost_job.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 7914b1570841..1092d9754f0f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -150,7 +150,6 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>   		return;
>   
>   	if (WARN_ON(job_read(pfdev, JS_COMMAND_NEXT(js)))) {
> -		pm_runtime_put_sync_autosuspend(pfdev->dev);
>   		return;
>   	}
>   
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
