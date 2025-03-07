Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBCBA57028
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 19:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB9F10E161;
	Fri,  7 Mar 2025 18:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Fji5kqzS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC44B10E161
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 18:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4hMBSR6a742363nCujmsUyxpy/ct/roqWkQT1nfgQbc=; b=Fji5kqzSnmSbBnKJJTQzYEgzh9
 RB0f4J7Qvv204sKyCH9QdaYc6glzjc06PGQBPzZ90tdxazgiH8XkwbBj7ghIUketh67S8p425NQV0
 uLDhbgUB3mSuDwZL++Bu3Vnm29IqbAYy27GmYOTM8MWYn2S6B04WIhXW1VT21Q0tnQwGGhnEvGhiJ
 DXSh+tSQU68qsQAqw5m9TYj9gOPKKXqX8ho3nRtGKq/rpsPyOAMw6psrLGg+FJAPkI6ejracrpTzb
 iQdS2YYYZvFbGads5NeVQBuZ8dAfc9IbtWYvJv6xqWFFXE9uz7HVWw+6HzY//V0B21c0W+399atZK
 n2rrOLcw==;
Received: from [189.7.87.170] (helo=[192.168.0.224])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tqc8t-005TCi-No; Fri, 07 Mar 2025 19:09:57 +0100
Message-ID: <7502a793-4e92-4bfc-9c87-66bd7fdd88ce@igalia.com>
Date: Fri, 7 Mar 2025 15:09:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] drm/sched: Adjust outdated docu for run_job()
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250305130551.136682-2-phasta@kernel.org>
 <20250305130551.136682-3-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250305130551.136682-3-phasta@kernel.org>
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

Hi Philipp,

On 05/03/25 10:05, Philipp Stanner wrote:
> The documentation for drm_sched_backend_ops.run_job() mentions a certain
> function called drm_sched_job_recovery(). This function does not exist.
> What's actually meant is drm_sched_resubmit_jobs(), which is by now also
> deprecated.
> 
> Furthermore, the scheduler expects to "inherit" a reference on the fence
> from the run_job() callback. This, so far, is also not documented.
> 
> Remove the mention of the removed function.
> 
> Discourage the behavior of drm_sched_backend_ops.run_job() being called
> multiple times for the same job.
> 
> Document the necessity of incrementing the refcount in run_job().
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   include/drm/gpu_scheduler.h | 34 ++++++++++++++++++++++++++++++----
>   1 file changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 50928a7ae98e..6381baae8024 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -410,10 +410,36 @@ struct drm_sched_backend_ops {
>   					 struct drm_sched_entity *s_entity);
>   
>   	/**
> -         * @run_job: Called to execute the job once all of the dependencies
> -         * have been resolved.  This may be called multiple times, if
> -	 * timedout_job() has happened and drm_sched_job_recovery()
> -	 * decides to try it again.
> +	 * @run_job: Called to execute the job once all of the dependencies
> +	 * have been resolved.
> +	 *
> +	 * @sched_job: the job to run
> +	 *
> +	 * The deprecated drm_sched_resubmit_jobs() (called by &struct
> +	 * drm_sched_backend_ops.timedout_job) can invoke this again with the
> +	 * same parameters. Using this is discouraged because it violates
> +	 * dma_fence rules, notably dma_fence_init() has to be called on
> +	 * already initialized fences for a second time. Moreover, this is
> +	 * dangerous because attempts to allocate memory might deadlock with
> +	 * memory management code waiting for the reset to complete.

Thanks for adding this paragraph! Also, thanks Christian for providing
this explanation in v5. It really helped clarify the reasoning behind
deprecating drm_sched_resubmit_jobs().

Best Regards,
- Maíra

> +	 *
> +	 * TODO: Document what drivers should do / use instead.
> +	 *
> +	 * This method is called in a workqueue context - either from the
> +	 * submit_wq the driver passed through drm_sched_init(), or, if the
> +	 * driver passed NULL, a separate, ordered workqueue the scheduler
> +	 * allocated.
> +	 *
> +	 * Note that the scheduler expects to 'inherit' its own reference to
> +	 * this fence from the callback. It does not invoke an extra
> +	 * dma_fence_get() on it. Consequently, this callback must take a
> +	 * reference for the scheduler, and additional ones for the driver's
> +	 * respective needs.
> +	 *
> +	 * Return:
> +	 * * On success: dma_fence the driver must signal once the hardware has
> +	 * completed the job ("hardware fence").
> +	 * * On failure: NULL or an ERR_PTR.
>   	 */
>   	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
>   

