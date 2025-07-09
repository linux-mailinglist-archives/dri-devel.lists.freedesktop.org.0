Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE58CAFE5C1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 12:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D410D10E201;
	Wed,  9 Jul 2025 10:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="UPp6amXj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D917A10E201
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 10:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F9RIeA1TZukOUNP6Woaqx12d+XEAnqxID4oNu82lBjM=; b=UPp6amXjeEQPh+k9tBqxn0YSJZ
 u3BBbq8HShliOUHO3Qu1Suc/fYwj+RaBKkzydtQLXgFI8WC6mRENY+PtYmrpdCVRXnW5bWy/uANAR
 xfDYxxfeJYXCODusAjcRqhIyjVgnwkj3SwgrU3kEVKXQGPAWXzVsPtpORB/1+6w57K3IxjiPjlYnJ
 +ruMPgTVLfq/2TFO/B4XOQMFv+6I2eFjfjpCT+GByE8Fbg7d5GPMa/SFAoleKsPBcwdJKp/gNXlWq
 crWa2D7DSGLFo6gfvmbjVE6/PLsRr/PWAL6ch1rbZhE3/feP/CtKS7Idweipu1/0UJLdi40Ei+ryC
 2otWYNCQ==;
Received: from [84.65.48.237] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uZS5y-00EQLN-Ey; Wed, 09 Jul 2025 12:32:10 +0200
Message-ID: <6af2a9c2-b3ac-44e0-8bbb-026809a28a6c@igalia.com>
Date: Wed, 9 Jul 2025 11:32:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: Fix scheduler workqueue bug
To: Philipp Stanner <phasta@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Binns <frank.binns@imgtec.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250709102957.100849-2-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250709102957.100849-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 09/07/2025 11:29, Philipp Stanner wrote:
> When the GPU scheduler was ported to using a struct for its
> initialization parameters, it was overlooked that panfrost creates a
> distinct workqueue for timeout handling.
> 
> The pointer to this new workqueue is not initialized to the struct,
> resulting in NULL being passed to the scheduler, which then uses the
> system_wq for timeout handling.
> 
> Set the correct workqueue to the init args struct.
> 
> Cc: stable@vger.kernel.org # 6.15+
> Fixes: 796a9f55a8d1 ("drm/sched: Use struct for drm_sched_init() params")
> Reported-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Closes: https://lore.kernel.org/dri-devel/b5d0921c-7cbf-4d55-aa47-c35cd7861c02@igalia.com/
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   drivers/gpu/drm/panfrost/panfrost_job.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 5657106c2f7d..15e2d505550f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -841,7 +841,6 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>   		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
>   		.credit_limit = 2,
>   		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
> -		.timeout_wq = pfdev->reset.wq,
>   		.name = "pan_js",
>   		.dev = pfdev->dev,
>   	};
> @@ -879,6 +878,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>   	pfdev->reset.wq = alloc_ordered_workqueue("panfrost-reset", 0);
>   	if (!pfdev->reset.wq)
>   		return -ENOMEM;
> +	args.timeout_wq = pfdev->reset.wq;
>   
>   	for (j = 0; j < NUM_JOB_SLOTS; j++) {
>   		js->queue[j].fence_context = dma_fence_context_alloc(1);

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

