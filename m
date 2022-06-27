Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B430855BB45
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 19:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C3E112717;
	Mon, 27 Jun 2022 17:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F6E11277E;
 Mon, 27 Jun 2022 17:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656350189; x=1687886189;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=f80zQDpGb3qCdiZO0Pw+9oUfOLXgcy5hmh3xSi/OTo8=;
 b=dCvEuuI5SHOE1TKRoeDeUbIx6dd/ZIRl3JfX2pjgG255Fw5eJHJLLO62
 TOd8UEbhepwcAg89dY97x9BrDJA64Y2cvsaWHU/iyJNVFIbgpskwTqwJr
 zGoEXMXr/f3lMNiKxrnHHXevxhvMX+gTT6BVGvHQiuGuxk0kGJ5IbTT9K
 JNOYU1VZrjMS9FAod5r7N2ZFfGpoWXdm+e0SwQ9FpRzRDb/HKh2M+QrkX
 JCDHB11RBl5rMOs+EW8aE8OTRdeavZKdshLDRflZShBvQzq0zH0PL/ZQd
 gltgR5znPzGao8liuBm65iUOHzf9LPDrO6bNN7jh+5D3V5zrDG4Oev6Z+ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="261925668"
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="261925668"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 10:16:05 -0700
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="594393747"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 10:16:05 -0700
Date: Mon, 27 Jun 2022 10:09:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH 1/3] drm/i915: Do not access rq->engine without a reference
Message-ID: <20220627170932.GA9402@jons-linux-dev-box>
References: <20220614184348.23746-1-ramalingam.c@intel.com>
 <20220614184348.23746-2-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220614184348.23746-2-ramalingam.c@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 15, 2022 at 12:13:46AM +0530, Ramalingam C wrote:
> From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> 
> In i915_fence_get_driver_name(), user may not hold a
> reference to rq->engine. Hence do not access it. Instead,
> store required device private pointer in 'rq->i915' and use it.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_request.c | 3 ++-
>  drivers/gpu/drm/i915/i915_request.h | 2 ++
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 73d5195146b0..7f6998bf390c 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -60,7 +60,7 @@ static struct kmem_cache *slab_execute_cbs;
>  
>  static const char *i915_fence_get_driver_name(struct dma_fence *fence)
>  {
> -	return dev_name(to_request(fence)->engine->i915->drm.dev);
> +	return dev_name(to_request(fence)->i915->drm.dev);
>  }
>  
>  static const char *i915_fence_get_timeline_name(struct dma_fence *fence)
> @@ -937,6 +937,7 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
>  	rq->engine = ce->engine;
>  	rq->ring = ce->ring;
>  	rq->execution_mask = ce->engine->mask;
> +	rq->i915 = ce->engine->i915;
>  
>  	ret = intel_timeline_get_seqno(tl, rq, &seqno);
>  	if (ret)
> diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
> index 28b1f9db5487..47041ec68df8 100644
> --- a/drivers/gpu/drm/i915/i915_request.h
> +++ b/drivers/gpu/drm/i915/i915_request.h
> @@ -196,6 +196,8 @@ struct i915_request {
>  	struct dma_fence fence;
>  	spinlock_t lock;
>  
> +	struct drm_i915_private *i915;
> +
>  	/**
>  	 * Context and ring buffer related to this request
>  	 * Contexts are refcounted, so when this request is associated with a
> -- 
> 2.20.1
> 
