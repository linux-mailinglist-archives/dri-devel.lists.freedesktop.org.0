Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A13BC694CF3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 17:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECD910E61E;
	Mon, 13 Feb 2023 16:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2218510E620
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 16:32:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFBC54B3;
 Mon, 13 Feb 2023 08:32:56 -0800 (PST)
Received: from [10.57.13.51] (unknown [10.57.13.51])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DD973F703;
 Mon, 13 Feb 2023 08:32:10 -0800 (PST)
Message-ID: <5c8d003c-c460-62e1-e32a-7ed37ae1f52f@arm.com>
Date: Mon, 13 Feb 2023 16:32:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/5] drm/panfrost: Use
 drm_sched_job_add_syncobj_dependency()
Content-Language: en-GB
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Luben Tuikov <luben.tuikov@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Melissa Wen <mwen@igalia.com>
References: <20230209124447.467867-1-mcanal@igalia.com>
 <20230209124447.467867-5-mcanal@igalia.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230209124447.467867-5-mcanal@igalia.com>
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
Cc: dri-devel@lists.freedesktop.org, Alyssa Rosenzweig <alyssa@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/02/2023 12:44, Maíra Canal wrote:
> As panfrost_copy_in_sync() performs the same steps as
> drm_sched_job_add_syncobj_dependency(), replace the open-coded
> implementation in Panfrost in order to simply use the DRM function.
> 
> Reviewed-by: Alyssa Rosenzweig <alyssa@collabora.com>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index abb0dadd8f63..f49096f53141 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -220,15 +220,8 @@ panfrost_copy_in_sync(struct drm_device *dev,
>  	}
>  
>  	for (i = 0; i < in_fence_count; i++) {
> -		struct dma_fence *fence;
> -
> -		ret = drm_syncobj_find_fence(file_priv, handles[i], 0, 0,
> -					     &fence);
> -		if (ret)
> -			goto fail;
> -
> -		ret = drm_sched_job_add_dependency(&job->base, fence);
> -
> +		ret = drm_sched_job_add_syncobj_dependency(&job->base, file_priv,
> +							   handles[i], 0);
>  		if (ret)
>  			goto fail;
>  	}

