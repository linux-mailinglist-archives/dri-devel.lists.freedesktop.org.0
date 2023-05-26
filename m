Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AFF71254D
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 13:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA9410E7E7;
	Fri, 26 May 2023 11:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7669110E06F;
 Fri, 26 May 2023 11:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685099501; x=1716635501;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Mhkhm8kq53AOwOF+Lqg4GTd5pXjrHRpfVPXbRnGf3bY=;
 b=Gid9LHNstejw08EKqgu2zsTb5kAFg39mDbIxPWMF5gvMj6hE25qS5g1x
 f9nTVBfxdTaMaHKOzRT+35TCbrhnZ+7u9/syAZDOOUmkqW3w+4jOAuDTZ
 RlT1uJ6nkk8d+9To5f/PJCr6tYAkvoCoIQsjb54kq944YEGPfOdfWjEdD
 i5VMQ6cVI8zWMTCEoDUAo6Bm2906JctnqNSJTVGGLlyjOIm2e1Ay3FpgF
 4JKGoh9KVGea104hSWntmqh41mr/3C1L5akVSm95Hd1Scio2HN+6AyIrz
 tEAMecbNd6aIgn0VdPYWqeEBQH8zjNQ2igNW1Ql/B0xcGLZqNwfafhlwr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="417664182"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="417664182"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 04:11:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="699388945"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="699388945"
Received: from binis42x-mobl.gar.corp.intel.com (HELO [10.249.254.65])
 ([10.249.254.65])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 04:11:31 -0700
Message-ID: <be9b192a-a125-6774-bb4f-8b9fb517ce0d@linux.intel.com>
Date: Fri, 26 May 2023 13:11:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH] dma-buf/dma-fence: Use a successful read_trylock()
 annotation for dma_fence_begin_signalling()
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
References: <20230428125233.228353-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230428125233.228353-1-thomas.hellstrom@linux.intel.com>
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
Cc: linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel,

On 4/28/23 14:52, Thomas Hellström wrote:
> Condsider the following call sequence:
>
> /* Upper layer */
> dma_fence_begin_signalling();
> lock(tainted_shared_lock);
> /* Driver callback */
> dma_fence_begin_signalling();
> ...
>
> The driver might here use a utility that is annotated as intended for the
> dma-fence signalling critical path. Now if the upper layer isn't correctly
> annotated yet for whatever reason, resulting in
>
> /* Upper layer */
> lock(tainted_shared_lock);
> /* Driver callback */
> dma_fence_begin_signalling();
>
> We will receive a false lockdep locking order violation notification from
> dma_fence_begin_signalling(). However entering a dma-fence signalling
> critical section itself doesn't block and could not cause a deadlock.
>
> So use a successful read_trylock() annotation instead for
> dma_fence_begin_signalling(). That will make sure that the locking order
> is correctly registered in the first case, and doesn't register any
> locking order in the second case.
>
> The alternative is of course to make sure that the "Upper layer" is always
> correctly annotated. But experience shows that's not easily achievable
> in all cases.
>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Resurrecting the discussion on this one. I can't see a situation where 
we would miss *relevant* locking
order violation warnings with this patch. Ofc if we have a scheduler 
annotation patch that would work fine as well, but the lack of 
annotation in the scheduler callbacks is really starting to hurt us.

Thanks,

Thomas



> ---
>   drivers/dma-buf/dma-fence.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index f177c56269bb..17f632768ef9 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -308,8 +308,8 @@ bool dma_fence_begin_signalling(void)
>   	if (in_atomic())
>   		return true;
>   
> -	/* ... and non-recursive readlock */
> -	lock_acquire(&dma_fence_lockdep_map, 0, 0, 1, 1, NULL, _RET_IP_);
> +	/* ... and non-recursive successful read_trylock */
> +	lock_acquire(&dma_fence_lockdep_map, 0, 1, 1, 1, NULL, _RET_IP_);
>   
>   	return false;
>   }
> @@ -340,7 +340,7 @@ void __dma_fence_might_wait(void)
>   	lock_map_acquire(&dma_fence_lockdep_map);
>   	lock_map_release(&dma_fence_lockdep_map);
>   	if (tmp)
> -		lock_acquire(&dma_fence_lockdep_map, 0, 0, 1, 1, NULL, _THIS_IP_);
> +		lock_acquire(&dma_fence_lockdep_map, 0, 1, 1, 1, NULL, _THIS_IP_);
>   }
>   #endif
>   
