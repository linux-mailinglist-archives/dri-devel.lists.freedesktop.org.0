Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7CDA67408
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 13:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B156410E47B;
	Tue, 18 Mar 2025 12:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EGEgJUrH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA5810E22C;
 Tue, 18 Mar 2025 12:39:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B0BE25C58DA;
 Tue, 18 Mar 2025 12:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A47C4CEDD;
 Tue, 18 Mar 2025 12:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742301546;
 bh=2e+zFKLmefoVlJH+QXgvwXNeq0lONZMsK48SZIa4bsA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EGEgJUrHvIog7ah9s1MlhtLGT/L3OvBdp82nbtWpoE02MqcLuxq2JpIIS5j4wBjAd
 wxOTpFxlT2gm/oihmsYD1xmAdibBqNRwYT2WdqkBemo2sLkVUB+kWeZxNyWhnLrh4l
 SznFOynVuUF2sfvrwpK01PHjtp82Qd+dSwwp/CctluYiarlTAo60o8Nf3y2goe9RXm
 7hYblY8n+fec+AhySBwdHhh5QHjU3n/oBHCeoopA2j/T6ZbCfuu3MOSoz8n1AXCE5W
 MbUxqGR7T5cuJlq3mJldKhzuxxffvWq0+cpsVW6tZYTnA3YNvjJNGDA5GEEpqEorK5
 vPY3yzgpCIrUQ==
Date: Tue, 18 Mar 2025 13:39:02 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: phasta@mailbox.org, tvrtko.ursulin@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/sched: add drm_sched_prealloc_dependency_slots
Message-ID: <Z9lpZiRaq0B80XoL@pollux>
References: <20250318120313.19099-1-christian.koenig@amd.com>
 <20250318120313.19099-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250318120313.19099-2-christian.koenig@amd.com>
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

On Tue, Mar 18, 2025 at 01:03:12PM +0100, Christian König wrote:
>  /**
>   * drm_sched_job_add_dependency - adds the fence as a job dependency
>   * @job: scheduler job to add the dependencies to
> @@ -878,10 +910,12 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
>  	 * engines involved, rather than the number of BOs.
>  	 */
>  	xa_for_each(&job->dependencies, index, entry) {
> -		if (entry->context != fence->context)
> +		bool signaled = dma_fence_is_signaled(entry);
> +
> +		if (!signaled && entry->context != fence->context)
>  			continue;
>  
> -		if (dma_fence_is_later(fence, entry)) {
> +		if (signaled || dma_fence_is_later(fence, entry)) {
>  			dma_fence_put(entry);
>  			xa_store(&job->dependencies, index, fence, GFP_KERNEL);
>  		} else {
> @@ -890,7 +924,8 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
>  		return 0;
>  	}
>  
> -	ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, GFP_KERNEL);
> +	ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b,
> +		       GFP_KERNEL);
>  	if (ret != 0)
>  		dma_fence_put(fence);

Those changes seem unrelated, aren't they?
