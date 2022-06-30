Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A34BD561DEB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 16:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2898A1125F3;
	Thu, 30 Jun 2022 14:29:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E584A1125C9;
 Thu, 30 Jun 2022 14:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656599392; x=1688135392;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wQpzAJXTo7Bhnhsk3imUJSwSv9/OyCu1er02rRF6zKA=;
 b=OOdEHLEFZ5SJXDev514ghXyhkZpYLlHGYz24gYfPWtUVC4pINjPvVI3K
 49jPUiiM+B3cQnvSiFlUGyJqBguYztEDhTdaAU7/ahzuiT0YJh8x5sD6Y
 vs7wvxZ77oCCWKXEUpai0eRiDBQmKhgBFKQxexU/wbbm/CkUG+7MpDqyW
 ZqvZKtWgQpJ9NTJmJkvFM1tFXOdxNT2eOaDOHGC3+jfx+XIb+xkUdKOxX
 X4sQJfHqiQtsbzbd8gxpXR2T8iDczy1HqpIIomXQtpics7445R6JGAbBf
 oDq++A9lv/U8S9Y8PKk/0UFpA947vDUJfffwkGyHVZSv3XtYWtwKDPSdz g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="282396356"
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; d="scan'208";a="282396356"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 07:29:52 -0700
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; d="scan'208";a="647912693"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.25.211])
 ([10.213.25.211])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 07:29:44 -0700
Message-ID: <95e834e2-bd6f-efd9-28d2-9e983f9de7ae@intel.com>
Date: Thu, 30 Jun 2022 16:29:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Remove __dma_fence_is_chain()
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220628233512.439555-1-robdclark@gmail.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220628233512.439555-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29.06.2022 01:35, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> drive-by cleanup
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_wait.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> index 319936f91ac5..667841780514 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> @@ -73,11 +73,6 @@ static void fence_set_priority(struct dma_fence *fence,
>   	rcu_read_unlock();
>   }
>   
> -static inline bool __dma_fence_is_chain(const struct dma_fence *fence)
> -{
> -	return fence->ops == &dma_fence_chain_ops;
> -}
> -
>   void i915_gem_fence_wait_priority(struct dma_fence *fence,
>   				  const struct i915_sched_attr *attr)
>   {
> @@ -93,7 +88,7 @@ void i915_gem_fence_wait_priority(struct dma_fence *fence,
>   
>   		for (i = 0; i < array->num_fences; i++)
>   			fence_set_priority(array->fences[i], attr);
> -	} else if (__dma_fence_is_chain(fence)) {
> +	} else if (dma_fence_is_chain(fence)) {
>   		struct dma_fence *iter;
>   
>   		/* The chain is ordered; if we boost the last, we boost all */

