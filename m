Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4FB72C572
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 15:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDE010E234;
	Mon, 12 Jun 2023 13:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C79F10E234
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 13:06:00 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 40CE76603050;
 Mon, 12 Jun 2023 14:05:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686575157;
 bh=yTm9vSIAV9r4Iz9vvYJ/ktlMoUFJjs1cP9rVcgT5xd0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KB9SsLlIY4HGDIerUbwx/RfDnCIjH53eO2CbzwiQBN7TnNe1b25YzWx8fNQNI5aQj
 7S9XGW7N5dibwTGufrjcUGjtpi0E/XJHx5DGpyPzZx4bFsm4RfNFT4AlcNUG7e++Np
 WRz9OyGv+nWvDh9AcOq7lCr46aPg/VThon964qMFB4gv2mKF4XiF2ZPo1+qKjZooyJ
 /c9VksQGIfCJj9UD0ckye3N8cl8x0nbc+OcDe4KxWDbz/davwzIFnQH3MVpCPiYc8M
 Lf0mpRwTi6nm5fwGL7SwyDw3eYD/vpIsJsg+PIWuSxyp2nUgDGV4vKsXBhxK+M9m3+
 U9zE/282N5whA==
Date: Mon, 12 Jun 2023 15:05:53 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Donald Robson <Donald.Robson@imgtec.com>
Subject: Re: [PATCH] drm/sched: Add native dependency support to drm_sched
Message-ID: <20230612150553.66999e56@collabora.com>
In-Reply-To: <7ced7c0a101cb2467c34b69d2b686c429f64d8c2.camel@imgtec.com>
References: <7ced7c0a101cb2467c34b69d2b686c429f64d8c2.camel@imgtec.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Sarah Walker <Sarah.Walker@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Donald,

On Thu, 8 Jun 2023 13:23:26 +0000
Donald Robson <Donald.Robson@imgtec.com> wrote:

>  /**
>   * drm_sched_job_arm - arm a scheduler job for execution
>   * @job: scheduler job to arm
> @@ -669,6 +755,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>  	job->s_priority = entity->rq - sched->sched_rq;
>  	job->id = atomic64_inc_return(&sched->job_id_count);
>  
> +	drm_sched_sort_native_deps(job);

If we get [1] accepted, we no longer need to sort the array. We can
just skip native dependencies as we iterate over the array in
drm_sched_job_dependency() with something like:

       f = xa_load(&job->dependencies, job->last_dependency);
       while (f) {
               struct drm_sched_fence *s_fence;
               struct dma_fence *scheduled_fence;

               job->last_dependency++;

               /* Not a native dependency, return the fence directly. */
               if (!job->sched->ops->dependency_is_native ||
                   !job->sched->ops->dependency_is_native(f))
                       return dma_fence_get(f);

               /*
                * If the native fence is a drm_sched_fence object, we
                * ensure the job has been submitted so drm_sched_fence
                * ::parent points to a valid dma_fence object.
                */
               s_fence = to_drm_sched_fence(f);
               scheduled_fence = s_fence ?
				 dma_fence_get_rcu(&s_fence->scheduled) :
                                 NULL;

               if (scheduled_fence)
                       return scheduled_fence;

               /* Otherwise we skip the native fence and check the next fence. */
               f = xa_load(&job->dependencies, job->last_dependency);
        }

And, in the driver, when you get to submit the job, you can gather
the native deps with a simple xa_for_each() loop:

	xa_for_each(&job->dependencies, index, f) {
		/* If the fence is not signaled, it must be a native fence,
		 * because drm_sched_entity waited for all non-native ones.
		 */
		if (!dma_fence_is_signaled(f))
			// DO SOMETHING
	}

>  	drm_sched_fence_init(job->s_fence, job->entity);
>  }

Regards,

Boris

[1]https://patchwork.freedesktop.org/patch/541956/
