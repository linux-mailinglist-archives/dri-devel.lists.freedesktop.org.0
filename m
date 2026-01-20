Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCGPDfKfb2kcKAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:32:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B974618A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C5D10E0E0;
	Tue, 20 Jan 2026 11:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="GeGuhzPr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFF510E0E0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 11:33:33 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-432d2c7dd52so4799454f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 03:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1768908812; x=1769513612; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DpRVaE1p7OSRBko9e1YVAbA+9mQStYl3vcnJTRiUMoQ=;
 b=GeGuhzPrjS8oVg4Tl3Lm/SGksP76sVvy7+2w7GjST8OdXKJdLeFofNzRAeTHBdLLyu
 9JqJqKYVd91xhBCGn9Y+LPx6Q3w8tWVXnnoZv4wyAjKS94hGZWlJNZb7nKrVr2DcJPHO
 9OC5Bf5bP08gmmOZuPQyTKT1gYCe8Go0Bkre9PikYsWFeuHaEMCc7ZWjyNvjXIpbiafd
 ol+eoXznFr1NjK27L3THnNsIRbPBzFcacpoiCgZ0kp+Uh87OZHJBPEnAAfxtz8AoycRY
 7HHA7YyIQg+F9kUdK4ImKouoftMArWTcomrQF4yoNOMkwHy5e0kWyizhTqO9zbcQnYmX
 N7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768908812; x=1769513612;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DpRVaE1p7OSRBko9e1YVAbA+9mQStYl3vcnJTRiUMoQ=;
 b=hnT2w1956McEJxc14dg/XNNIoydD84L73do8Lou5FY/I8Zi6sYU8H84ajhhPe2I7lZ
 yHBHHzw+SbhZc4vrmmZV5YiQiGCj6uTkFZFuT4DBBTM+aQeBL+PePlt/FDwenfIBnn34
 F/zNXUK7DKMOSLkVF8UZimvoJiiGsZqiHdZhRZSMVQZPNQNAHGR34DdLQO6wVw8W0zyJ
 Lr5KTdEaUnETsu847ZJwiHMwt2ifAFmtpf+GL1lF2ZgAIvXlHQOukcUPMzYsiXbEuZV6
 hxvjM4yvw7lscg5Tn2A3gDo0BSKRaNUNugMJ+0VV+dXm7llobi6A2m50i01lDgc+B6qS
 Q7Sg==
X-Gm-Message-State: AOJu0YzISMh4+o3rTU84zMBWV44HlYusnfNvoO/IZAl77gHGK4vdLhMZ
 PK+tYqvcQHifEVNQTSHy/++vQgBRdCzswz6GVCMIVvQwRIyiW+I8JWgAZnFrXDWVJWE=
X-Gm-Gg: AZuq6aLLpE3J2zvuGsdbiTtsAr2oOhL/cTisX0rZ1Wo0AcZ+BPvtVVfqf66FYxYGksQ
 zuI7Um+ifZToqAfHpD07KmSsU0/S5xTqGSSo4UgkghSJZme9TE8UGqOs9oiGAVagPlP0+dLKKib
 n0nxbZAy8236tI2i9lSWb+fF3H3oelXYyfHNFG6WzWHJAFIRCjuku8tNKLjl028F9NJEt/p/zDT
 A2JRZE67oY+M7MzPMw3dWdUL8EpyGuLkCLxMp8ijniRSzGC9DGkrfTUREW3MZ+ZmljdUBo+jp92
 1kSCqcA2dvq/6ArkmDVnOv81cpIWU9h/fEBRtae2Lk1Or0XJMiQX9JQ9oZJaHzF0JAqMSsxyTP2
 HEObTslO4Zg6jEVifkFgraPNTyg68Dfxkep9NcagUMGOv8L8Yk5Sdusxdymr6H2s/w2WE3KoThR
 xVnvnwhLM5xxAX/HuQBDSkP+jiHR/P6JwB
X-Received: by 2002:a05:6000:1448:b0:430:ff8b:fdc2 with SMTP id
 ffacd0b85a97d-4358ff3a262mr2269276f8f.60.1768908811975; 
 Tue, 20 Jan 2026 03:33:31 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569921dddsm30028833f8f.6.2026.01.20.03.33.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 03:33:31 -0800 (PST)
Message-ID: <a73caf52-dc33-4dd5-b830-7d375ade3ad3@ursulin.net>
Date: Tue, 20 Jan 2026 11:33:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dma-buf: add dma_fence_was_initialized function v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20260120105655.7134-1-christian.koenig@amd.com>
 <20260120105655.7134-2-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260120105655.7134-2-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 77B974618A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ckoenig.leichtzumerken@gmail.com,m:phasta@mailbox.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[ursulin.net];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,mailbox.org,intel.com,linaro.org];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[131.252.210.177:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RBL_SENDERSCORE_REPUT_BLOCKED(0.00)[131.252.210.177:from];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DNSWL_BLOCKED(0.00)[209.85.221.53:received,131.252.210.177:from,90.240.106.137:received];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[ursulin.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[90.240.106.137:received];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DWL_DNSWL_BLOCKED(0.00)[ursulin.net:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,igalia.com:email,amd.com:email]


On 20/01/2026 10:54, Christian König wrote:
> Some driver use fence->ops to test if a fence was initialized or not.
> The problem is that this utilizes internal behavior of the dma_fence
> implementation.
> 
> So better abstract that into a function.
> 
> v2: use a flag instead of testing fence->ops, rename the function, move
>      to the beginning of the patch set.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence.c             |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 13 +++++++------
>   drivers/gpu/drm/qxl/qxl_release.c       |  2 +-
>   include/linux/dma-fence.h               | 15 +++++++++++++++
>   4 files changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 21c5c30b4f34..c9a036b0d592 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -1054,7 +1054,7 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>   	fence->lock = lock;
>   	fence->context = context;
>   	fence->seqno = seqno;
> -	fence->flags = flags;
> +	fence->flags = flags | BIT(DMA_FENCE_FLAG_INITIALIZED_BIT);
>   	fence->error = 0;
>   
>   	trace_dma_fence_init(fence);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 0a0dcbf0798d..d1e74d0050c7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -278,9 +278,10 @@ void amdgpu_job_free_resources(struct amdgpu_job *job)
>   	unsigned i;
>   
>   	/* Check if any fences were initialized */
> -	if (job->base.s_fence && job->base.s_fence->finished.ops)
> +	if (job->base.s_fence &&
> +	    dma_fence_was_initialized(&job->base.s_fence->finished))
>   		f = &job->base.s_fence->finished;
> -	else if (job->hw_fence && job->hw_fence->base.ops)
> +	else if (dma_fence_was_initialized(&job->hw_fence->base))
>   		f = &job->hw_fence->base;
>   	else
>   		f = NULL;
> @@ -297,11 +298,11 @@ static void amdgpu_job_free_cb(struct drm_sched_job *s_job)
>   
>   	amdgpu_sync_free(&job->explicit_sync);
>   
> -	if (job->hw_fence->base.ops)
> +	if (dma_fence_was_initialized(&job->hw_fence->base))
>   		dma_fence_put(&job->hw_fence->base);
>   	else
>   		kfree(job->hw_fence);
> -	if (job->hw_vm_fence->base.ops)
> +	if (dma_fence_was_initialized(&job->hw_vm_fence->base))
>   		dma_fence_put(&job->hw_vm_fence->base);
>   	else
>   		kfree(job->hw_vm_fence);
> @@ -335,11 +336,11 @@ void amdgpu_job_free(struct amdgpu_job *job)
>   	if (job->gang_submit != &job->base.s_fence->scheduled)
>   		dma_fence_put(job->gang_submit);
>   
> -	if (job->hw_fence->base.ops)
> +	if (dma_fence_was_initialized(&job->hw_fence->base))
>   		dma_fence_put(&job->hw_fence->base);
>   	else
>   		kfree(job->hw_fence);
> -	if (job->hw_vm_fence->base.ops)
> +	if (dma_fence_was_initialized(&job->hw_vm_fence->base))
>   		dma_fence_put(&job->hw_vm_fence->base);
>   	else
>   		kfree(job->hw_vm_fence);
> diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
> index 7b3c9a6016db..06b0b2aa7953 100644
> --- a/drivers/gpu/drm/qxl/qxl_release.c
> +++ b/drivers/gpu/drm/qxl/qxl_release.c
> @@ -146,7 +146,7 @@ qxl_release_free(struct qxl_device *qdev,
>   	idr_remove(&qdev->release_idr, release->id);
>   	spin_unlock(&qdev->release_idr_lock);
>   
> -	if (release->base.ops) {
> +	if (dma_fence_was_initialized(&release->base)) {
>   		WARN_ON(list_empty(&release->bos));
>   		qxl_release_free_list(release);
>   
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index d4c92fd35092..9c4d25289239 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -48,6 +48,7 @@ struct seq_file;
>    * atomic ops (bit_*), so taking the spinlock will not be needed most
>    * of the time.
>    *
> + * DMA_FENCE_FLAG_INITIALIZED_BIT - fence was initialized
>    * DMA_FENCE_FLAG_SIGNALED_BIT - fence is already signaled
>    * DMA_FENCE_FLAG_TIMESTAMP_BIT - timestamp recorded for fence signaling
>    * DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT - enable_signaling might have been called
> @@ -98,6 +99,7 @@ struct dma_fence {
>   };
>   
>   enum dma_fence_flag_bits {
> +	DMA_FENCE_FLAG_INITIALIZED_BIT,
>   	DMA_FENCE_FLAG_SEQNO64_BIT,
>   	DMA_FENCE_FLAG_SIGNALED_BIT,
>   	DMA_FENCE_FLAG_TIMESTAMP_BIT,
> @@ -263,6 +265,19 @@ void dma_fence_release(struct kref *kref);
>   void dma_fence_free(struct dma_fence *fence);
>   void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq);
>   
> +/**
> + * dma_fence_was_initialized - test if fence was initialized
> + * @fence: fence to test
> + *
> + * Return: True if fence was ever initialized, false otherwise. Works correctly
> + * only when memory backing the fence structure is zero initialized on
> + * allocation.
> + */
> +static inline bool dma_fence_was_initialized(struct dma_fence *fence)
> +{
> +	return fence && test_bit(DMA_FENCE_FLAG_INITIALIZED_BIT, &fence->flags);
> +}
> +
>   /**
>    * dma_fence_put - decreases refcount of the fence
>    * @fence: fence to reduce refcount of

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

