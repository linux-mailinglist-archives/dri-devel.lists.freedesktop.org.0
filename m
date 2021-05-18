Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C98387731
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 13:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468566EB23;
	Tue, 18 May 2021 11:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A48C6E873;
 Tue, 18 May 2021 11:12:26 +0000 (UTC)
IronPort-SDR: X9b9lFgj+IPcyWknW7+f3yPAw1IlSxHdeKrpQY4YuxjUY3UqkDyi4bYKMLXRnZ0Ft+fVQQS7dy
 alKdU6h3RMjg==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="188092907"
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="188092907"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 04:12:25 -0700
IronPort-SDR: Y1FX7ZMijgBnWpRH4I2LwWHWC0K6tt+2/UsguJRekCgl4kCGbPdMaefUuznBNfc3fsyM2uuTTf
 34BptccjAIyQ==
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="439388231"
Received: from cbackhau-mobl.ger.corp.intel.com (HELO [10.252.37.121])
 ([10.252.37.121])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 04:12:24 -0700
Subject: Re: [PATCH v2 01/15] drm/i915: Untangle the vma pages_mutex
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-2-thomas.hellstrom@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <582d6629-1413-2c7f-d09d-aeef43f5c8c1@linux.intel.com>
Date: Tue, 18 May 2021 13:12:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210518082701.997251-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hey,

This needs a small fix, otherwise looks good.

Op 18-05-2021 om 10:26 schreef Thomas Hellström:
> From: Thomas Hellström <thomas.hellstrom@intel.com>
>
> Any sleeping dma_resv lock taken while the vma pages_mutex is held
> will cause a lockdep splat.
> Move the i915_gem_object_pin_pages() call out of the pages_mutex
> critical section.
>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_vma.c | 33 +++++++++++++++++++--------------
>  1 file changed, 19 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index a6cd0fa62847..7b1c0f4e60d7 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -800,32 +800,37 @@ static bool try_qad_pin(struct i915_vma *vma, unsigned int flags)
>  static int vma_get_pages(struct i915_vma *vma)
>  {
>  	int err = 0;
> +	bool pinned_pages = false;
>  
>  	if (atomic_add_unless(&vma->pages_count, 1, 0))
>  		return 0;
>  
> +	if (vma->obj) {
> +		err = i915_gem_object_pin_pages(vma->obj);
> +		if (err)
> +			return err;
> +		pinned_pages = true;
> +	}
> +
>  	/* Allocations ahoy! */
> -	if (mutex_lock_interruptible(&vma->pages_mutex))
> -		return -EINTR;
> +	if (mutex_lock_interruptible(&vma->pages_mutex)) {
> +		err = -EINTR;
> +		goto unpin;
> +	}
>  
>  	if (!atomic_read(&vma->pages_count)) {
> -		if (vma->obj) {
> -			err = i915_gem_object_pin_pages(vma->obj);
> -			if (err)
> -				goto unlock;
> -		}
> -
>  		err = vma->ops->set_pages(vma);
> -		if (err) {
> -			if (vma->obj)
> -				i915_gem_object_unpin_pages(vma->obj);
> +		if (err)
>  			goto unlock;
> -		}
> +		pinned_pages = false;
>  	}
>  	atomic_inc(&vma->pages_count);
>  
>  unlock:
>  	mutex_unlock(&vma->pages_mutex);
> +unpin:
> +	if (pinned_pages)
> +		__i915_gem_object_unpin_pages(vma->obj);
>  
>  	return err;
>  }
> @@ -838,10 +843,10 @@ static void __vma_put_pages(struct i915_vma *vma, unsigned int count)
>  	if (atomic_sub_return(count, &vma->pages_count) == 0) {
>  		vma->ops->clear_pages(vma);
>  		GEM_BUG_ON(vma->pages);
> -		if (vma->obj)
> -			i915_gem_object_unpin_pages(vma->obj);
>  	}
>  	mutex_unlock(&vma->pages_mutex);
> +	if (vma->obj)
> +		i915_gem_object_unpin_pages(vma->obj);

You're unconditionally unpinning pages here, if pages_count wasn't dropped to 0, we will go negative.

With that fixed:

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

