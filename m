Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8CFAC24C0
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 16:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E025610E7F1;
	Fri, 23 May 2025 14:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CFRMiWZN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D03E10E7F1;
 Fri, 23 May 2025 14:11:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4238461154;
 Fri, 23 May 2025 14:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C52DFC4CEE9;
 Fri, 23 May 2025 14:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748009499;
 bh=2RvGKF67j+4vkPmmPMtts4eoztaLmDOx0k0Y+Ib4+dQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CFRMiWZNbVwdCU3CzdnQbWQzw4asK4/Y+HVs8GlXf+UlqvajGJCr0xIaZDzNFV9Ba
 UrvAx5+87EAjKHfla+ayYJVLBEJ8X0QBLcLF6Ha6XDSLmmeVzBdU3c1x5DUywwIMmM
 x6/XWFBmuSsTzIDddbuQJXKCuD0dGAsJpHblWOtsf2yIIBATKn2By0cLcgYffWeMag
 MEqpO26GmWvn9G7md/kXtyADASWoyk97uYy+CXIkB8qoSNprZw3Q16fpYvDZR0c1ZP
 PWLFFmF9P5VUufArgNUdQcWcx+Yy6cNC0hQbeNTLJ4iYBz5dm/MmUq2INvL9eZww06
 kpAGz1aJ56mGQ==
Date: Fri, 23 May 2025 16:11:35 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: tursulin@ursulin.net, phasta@mailbox.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/4] drm/sched: optimize drm_sched_job_add_dependency
Message-ID: <aDCCF0JFhO7lR2VJ@cassiopeiae>
References: <20250523125643.7540-1-christian.koenig@amd.com>
 <20250523125643.7540-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250523125643.7540-2-christian.koenig@amd.com>
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

On Fri, May 23, 2025 at 02:56:40PM +0200, Christian König wrote:
> It turned out that we can actually massively optimize here.
> 
> The previous code was horrible inefficient since it constantly released
> and re-acquired the lock of the xarray and started each iteration from the
> base of the array to avoid concurrent modification which in our case
> doesn't exist.
> 
> Additional to that the xas_find() and xas_store() functions are explicitly
> made in a way so that you can efficiently check entries and if you don't
> find a match store a new one at the end or replace existing ones.
> 
> So use xas_for_each()/xa_store() instead of xa_for_each()/xa_alloc().
> It's a bit more code, but should be much faster in the end.

This commit message does neither explain the motivation of the commit nor what it
does. It describes what instead belongs into the changelog between versions.

Speaking of versioning of the patch series, AFAIK there were previous versions,
but this series was sent as a whole new series -- why?

Please resend with a proper commit message, version and changelog. Thanks!

> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 29 ++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index f7118497e47a..cf200b1b643e 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -871,10 +871,8 @@ EXPORT_SYMBOL(drm_sched_job_arm);
>  int drm_sched_job_add_dependency(struct drm_sched_job *job,
>  				 struct dma_fence *fence)
>  {
> +	XA_STATE(xas, &job->dependencies, 0);
>  	struct dma_fence *entry;
> -	unsigned long index;
> -	u32 id = 0;
> -	int ret;
>  
>  	if (!fence)
>  		return 0;
> @@ -883,24 +881,37 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
>  	 * This lets the size of the array of deps scale with the number of
>  	 * engines involved, rather than the number of BOs.
>  	 */
> -	xa_for_each(&job->dependencies, index, entry) {
> +	xa_lock(&job->dependencies);
> +	xas_for_each(&xas, entry, ULONG_MAX) {
>  		if (entry->context != fence->context)
>  			continue;
>  
>  		if (dma_fence_is_later(fence, entry)) {
>  			dma_fence_put(entry);
> -			xa_store(&job->dependencies, index, fence, GFP_KERNEL);
> +			xas_store(&xas, fence);
>  		} else {
>  			dma_fence_put(fence);
>  		}
> -		return 0;
> +		xa_unlock(&job->dependencies);
> +		return xas_error(&xas);
>  	}
>  
> -	ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, GFP_KERNEL);
> -	if (ret != 0)
> +retry:
> +	entry = xas_store(&xas, fence);
> +	xa_unlock(&job->dependencies);
> +
> +	/* There shouldn't be any concurrent add, so no need to loop again */

Concurrency shouldn't matter, xas_nomem() stores the pre-allocated memory in the
XA_STATE not the xarray. Hence, I think we should remove the comment.

> +	if (xas_nomem(&xas, GFP_KERNEL)) {
> +		xa_lock(&job->dependencies);
> +		goto retry;

Please don't use a goto here, if we would have failed to allocate memory here,
this would be an endless loop until we succeed eventually. It would be equal to:

	while (!ptr) {
		ptr = kmalloc();
	}

Instead just take the lock and call xas_store() again.

> +	}
> +
> +	if (xas_error(&xas))
>  		dma_fence_put(fence);
> +	else
> +		WARN_ON(entry);

Please don't call WARN_ON() here, this isn't fatal, we only need to return the
error code.
