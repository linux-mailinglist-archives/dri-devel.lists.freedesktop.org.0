Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD5FB823F2
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 01:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7234F10E05C;
	Wed, 17 Sep 2025 23:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="UX5k2If7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A3C10E05C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 23:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w7sTkQinDemtHXwQ/rrCa9tZ9/Yr7nXsHFokH7SDOH8=; b=UX5k2If794OdKkSFI6T+Pvja5h
 GOFW9J8DcF0Uw+yb4Mboo4Bx6gH8kXvke7bmYmKguS7JrF8TqkHN4okZ7k+l48RxlVwbe8lXPMjq1
 mpSyTd6LRJrhs+bnny0sOaG7KL9d/f+ilh8KsjdsZ4W07Ww3RJL4eOaLe04NHehiQB8qqO+UpPOKR
 5jdB1/itn+au2lGZGkfc5dbpniVhU8viijzZ6bWUpXdWA8xhGs3bXRrYCwZDyABx2H2jlX+vi+Jw+
 j/OPoyQVGnYyLNvhRpV0+IfpoOZXIKVz9WwM8HLm1M13yGEQviL3DbAPkWJMi837FUTqzws6RG6K/
 p5Fe4R6Q==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uz1LG-00CuKy-Nt; Thu, 18 Sep 2025 01:13:38 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1uz1LE-004mby-4i; Thu, 18 Sep 2025 01:13:38 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail with esmtp (Exim 4.96) (envelope-from <mcanal@igalia.com>)
 id 1uz1LD-009yj2-1p; Thu, 18 Sep 2025 01:13:35 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 20:13:35 -0300
From: mcanal <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 itoral@igalia.com
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH] drm/v3d: create a dedicated lock for dma fence
In-Reply-To: <20250916172022.2779837-1-mwen@igalia.com>
References: <20250916172022.2779837-1-mwen@igalia.com>
Message-ID: <2fce3aff-8fcf-4e76-a396-f8cdd3ec28d9@igalia.com>
X-Sender: mcanal@igalia.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Report: NO, Score=-2.2, Tests=ALL_TRUSTED=-3,BAYES_50=0.8
X-Spam-Score: -21
X-Spam-Bar: --
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

Hi Melissa,

On 16/09/25 14:18, Melissa Wen wrote:
> Don't mix dma fence lock with the active_job lock. The issue was
> uncovered when PREEMPT_RT on.

Maybe you could add a bit more detail about the issue in the commit
message? If I wasn't already familiar to the issue, I believe I wouldn't
be able to understand it from the commit message.

> 
> Link: https://github.com/raspberrypi/linux/issues/7035
> Fixes: fa6a20c87470 ("drm/v3d: Address race-condition between per-fd GPU stats and fd release")
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Thanks for fixing this issue!

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/v3d/v3d_drv.h   | 1 +
>   drivers/gpu/drm/v3d/v3d_fence.c | 2 +-
>   drivers/gpu/drm/v3d/v3d_gem.c   | 1 +
>   3 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
> index 0317f3d7452a..b1c41af87e17 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -62,6 +62,7 @@ struct v3d_queue_state {
>   	/* Currently active job for this queue */
>   	struct v3d_job *active_job;
>   	spinlock_t queue_lock;
> +	spinlock_t fence_lock;
>   };
>     /* Performance monitor object. The perform lifetime is controlled by userspace
> diff --git a/drivers/gpu/drm/v3d/v3d_fence.c b/drivers/gpu/drm/v3d/v3d_fence.c
> index 8f8471adae34..c82500a1df73 100644
> --- a/drivers/gpu/drm/v3d/v3d_fence.c
> +++ b/drivers/gpu/drm/v3d/v3d_fence.c
> @@ -15,7 +15,7 @@ struct dma_fence *v3d_fence_create(struct v3d_dev *v3d, enum v3d_queue q)
>   	fence->dev = &v3d->drm;
>   	fence->queue = q;
>   	fence->seqno = ++queue->emit_seqno;
> -	dma_fence_init(&fence->base, &v3d_fence_ops, &queue->queue_lock,
> +	dma_fence_init(&fence->base, &v3d_fence_ops, &queue->fence_lock,
>   		       queue->fence_context, fence->seqno);
>     	return &fence->base;
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index c77d90aa9b82..bb110d35f749 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -273,6 +273,7 @@ v3d_gem_init(struct drm_device *dev)
>   		seqcount_init(&queue->stats.lock);
>     		spin_lock_init(&queue->queue_lock);
> +		spin_lock_init(&queue->fence_lock);
>   	}
>     	spin_lock_init(&v3d->mm_lock);


