Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C491A6A23BA
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 22:24:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51F010ED36;
	Fri, 24 Feb 2023 21:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D064610E5D5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 21:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tFmaPs7ntwSudLQbrwIn3Ez3rmwKD+Qb4DpakrzMgPc=; b=kYSM77pcqKYvMZvrZWhnVzecPt
 4RIuu0YX21tZnFiSiJNJTYyXm2syYYwvEXvTwPH93ruE2NUg1BlIoH6RIzRHDvSPJbkqB6MD14bZk
 2azHrmHZnwVes/4yh6j+BDAzeCWqKynOWyRdS2lXQHgAXl0fpD4/PUwetzILqB87Jq/UQROlSk5PA
 7JJMMTwaCO1Z8UdriEtG/fMkWt78s7qsdWtzM4lWYMoHy7Uua49U+ZskPngbSr6KkzkUghRtnIWSJ
 ovlFqQh8aIT0SoSCF647AdUoHoqsySatJd/vE5N9Bfi8emwLVXUTdYGUWkUAYJF676nvlTAN0Nefi
 kE9SbGLw==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pVfYT-00Du3i-K1; Fri, 24 Feb 2023 22:24:37 +0100
Message-ID: <99ae3dad-2c90-bef0-408f-ff997873b4b4@igalia.com>
Date: Fri, 24 Feb 2023 18:24:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/5] drm/sched: Create wrapper to add a syncobj
 dependency to job
To: Luben Tuikov <luben.tuikov@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Melissa Wen <mwen@igalia.com>
References: <20230209124447.467867-1-mcanal@igalia.com>
 <20230209124447.467867-2-mcanal@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230209124447.467867-2-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/9/23 09:44, Maíra Canal wrote:
> In order to add a syncobj's fence as a dependency to a job, it is
> necessary to call drm_syncobj_find_fence() to find the fence and then
> add the dependency with drm_sched_job_add_dependency(). So, wrap these
> steps in one single function, drm_sched_job_add_syncobj_dependency().
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 29 ++++++++++++++++++++++++++
>   include/drm/gpu_scheduler.h            |  6 ++++++
>   2 files changed, 35 insertions(+)
> 

Applied to drm-misc-next.

Best Regards,
- Maíra Canal
