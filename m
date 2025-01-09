Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0B6A073CA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 11:54:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C6210E365;
	Thu,  9 Jan 2025 10:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Z0K4LlRA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1A710E365
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 10:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QYSvHVpuF78zTZReuVwdeXx8MKU5bLbNIuBvlwfsW74=; b=Z0K4LlRA6mN0nZofJf8S9+DR4s
 Bm3iw90h1BP8tEBDiDH74nHqrOaB/9MBwibjhVyZNZYAMgPxQOnq8iCSBvmQB2U5f125wNaTSJku2
 TWhXZRPN4+9FfBPDhTNmtC1fPP/i8eDqB/BM4A2DR0EQIujtxPHs1yyDLA0jlBQZCcvJZbisnEoUn
 W8IUZc4tG0lXGQJvQSG7QwnBb961YYKLD1PgCxRJq1QicruseYj4rKhl70DMJeARkeC6CXx5aGDXU
 BrWQ+8aSjaT+qxx/ddETm28+2IyGE9vDkzM1UMFx1WPQycL1oxmK3fEImYRzGIucowPUNDpuvNQNF
 h07dmpLA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tVqAk-00DWJw-9f; Thu, 09 Jan 2025 11:53:54 +0100
Message-ID: <39453319-a786-42d2-b670-40073a008b21@igalia.com>
Date: Thu, 9 Jan 2025 10:53:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] dma-fence: Add a single fence fast path for fence
 merging
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Friedrich Vock <friedrich.vock@gmx.de>
References: <20241115102153.1980-1-tursulin@igalia.com>
 <20241115102153.1980-4-tursulin@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20241115102153.1980-4-tursulin@igalia.com>
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


Christian - it looks this patch could be merged now.

Thanks,

Tvrtko

On 15/11/2024 10:21, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> Testing some workloads in two different scenarios, such as games running
> under Gamescope on a Steam Deck, or vkcube under a Plasma desktop, shows
> that in a significant portion of calls the dma_fence_unwrap_merge helper
> is called with just a single unsignalled fence.
> 
> Therefore it is worthile to add a fast path for that case and so bypass
> the memory allocation and insertion sort attempts.
> 
> Tested scenarios:
> 
> 1) Hogwarts Legacy under Gamescope
> 
> ~1500 calls per second to __dma_fence_unwrap_merge.
> 
> Percentages per number of fences buckets, before and after checking for
> signalled status, sorting and flattening:
> 
>     N       Before      After
>     0       0.85%
>     1      69.80%        ->   The new fast path.
>    2-9     29.36%        9%   (Ie. 91% of this bucket flattened to 1 fence)
>   10-19
>   20-40
>    50+
> 
> 2) Cyberpunk 2077 under Gamescope
> 
> ~2400 calls per second.
> 
>     N       Before      After
>     0       0.71%
>     1      52.53%        ->    The new fast path.
>    2-9     44.38%      50.60%  (Ie. half resolved to a single fence)
>   10-19     2.34%
>   20-40     0.06%
>    50+
> 
> 3) vkcube under Plasma
> 
> 90 calls per second.
> 
>     N       Before      After
>     0
>     1
>    2-9      100%         0%   (Ie. all resolved to a single fence)
>   10-19
>   20-40
>    50+
> 
> In the case of vkcube all invocations in the 2-9 bucket were actually
> just two input fences.
> 
> v2:
>   * Correct local variable name and hold on to unsignaled reference. (Chistian)
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Friedrich Vock <friedrich.vock@gmx.de>
> ---
>   drivers/dma-buf/dma-fence-unwrap.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
> index 6345062731f1..2a059ac0ed27 100644
> --- a/drivers/dma-buf/dma-fence-unwrap.c
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -84,8 +84,8 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>   					   struct dma_fence **fences,
>   					   struct dma_fence_unwrap *iter)
>   {
> +	struct dma_fence *tmp, *unsignaled = NULL, **array;
>   	struct dma_fence_array *result;
> -	struct dma_fence *tmp, **array;
>   	ktime_t timestamp;
>   	int i, j, count;
>   
> @@ -94,6 +94,8 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>   	for (i = 0; i < num_fences; ++i) {
>   		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i]) {
>   			if (!dma_fence_is_signaled(tmp)) {
> +				dma_fence_put(unsignaled);
> +				unsignaled = dma_fence_get(tmp);
>   				++count;
>   			} else {
>   				ktime_t t = dma_fence_timestamp(tmp);
> @@ -107,9 +109,16 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>   	/*
>   	 * If we couldn't find a pending fence just return a private signaled
>   	 * fence with the timestamp of the last signaled one.
> +	 *
> +	 * Or if there was a single unsignaled fence left we can return it
> +	 * directly and early since that is a major path on many workloads.
>   	 */
>   	if (count == 0)
>   		return dma_fence_allocate_private_stub(timestamp);
> +	else if (count == 1)
> +		return unsignaled;
> +
> +	dma_fence_put(unsignaled);
>   
>   	array = kmalloc_array(count, sizeof(*array), GFP_KERNEL);
>   	if (!array)
