Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7F569795C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 10:57:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D0710EA83;
	Wed, 15 Feb 2023 09:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4586810E1BB;
 Wed, 15 Feb 2023 09:57:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 036C31042;
 Wed, 15 Feb 2023 01:58:16 -0800 (PST)
Received: from [10.57.11.212] (unknown [10.57.11.212])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 910D73F663;
 Wed, 15 Feb 2023 01:57:30 -0800 (PST)
Message-ID: <3020f24b-e387-930a-8cf9-2fd02dbe5779@arm.com>
Date: Wed, 15 Feb 2023 09:57:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/gem: Expose the buffer object handle to userspace last
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230214125050.1205394-1-tvrtko.ursulin@linux.intel.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230214125050.1205394-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Rob Clark <robdclark@chromium.org>, lima@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Herrmann <dh.herrmann@gmail.com>,
 spice-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/02/2023 12:50, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Currently drm_gem_handle_create_tail exposes the handle to userspace
> before the buffer object constructions is complete. This allowing
> of working against a partially constructed object, which may also be in
> the process of having its creation fail, can have a range of negative
> outcomes.
> 
> A lot of those will depend on what the individual drivers are doing in
> their obj->funcs->open() callbacks, and also with a common failure mode
> being -ENOMEM from drm_vma_node_allow.
> 
> We can make sure none of this can happen by allocating a handle last,
> although with a downside that more of the function now runs under the
> dev->object_name_lock.
> 
> Looking into the individual drivers open() hooks, we have
> amdgpu_gem_object_open which seems like it could have a potential security
> issue without this change.
> 
> A couple drivers like qxl_gem_object_open and vmw_gem_object_open
> implement no-op hooks so no impact for them.
> 
> A bunch of other require a deeper look by individual owners to asses for
> impact. Those are lima_gem_object_open, nouveau_gem_object_open,
> panfrost_gem_open, radeon_gem_object_open and virtio_gpu_gem_object_open.

I've looked over the panfrost code, and I can't see how this could
create a security hole there. It looks like there's a path which can
confuse the shrinker (so objects might not be purged when they could
be[1]) but they would be freed properly in the normal path - so no worse
than user space could already do.

[1] gpu_usecount is incremented in panfrost_lookup_bos() per bo, but not
decremented on failure.

> Putting aside the risk assesment of the above, some common scenarios to
> think about are along these lines:
> 
> 1)
> Userspace closes a handle by speculatively "guessing" it from a second
> thread.
> 
> This results in an unreachable buffer object so, a memory leak.
> 
> 2)
> Same as 1), but object is in the process of getting closed (failed
> creation).
> 
> The second thread is then able to re-cycle the handle and idr_remove would
> in the first thread would then remove the handle it does not own from the
> idr.

This, however, looks plausible - and I can see how this could
potentially trigger a security hole in user space.

> 3)
> Going back to the earlier per driver problem space - individual impact
> assesment of allowing a second thread to access and operate on a partially
> constructed handle / object. (Can something crash? Leak information?)
> 
> In terms of identifying when the problem started I will tag some patches
> as references, but not all, if even any, of them actually point to a
> broken state. I am just identifying points at which more opportunity for
> issues to arise was added.
> 
> References: 304eda32920b ("drm/gem: add hooks to notify driver when object handle is created/destroyed")
> References: ca481c9b2a3a ("drm/gem: implement vma access management")
> References: b39b5394fabc ("drm/gem: Add drm_gem_object_funcs")
> Cc: dri-devel@lists.freedesktop.org
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: David Herrmann <dh.herrmann@gmail.com>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: lima@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: Steven Price <steven.price@arm.com>
> Cc: virtualization@lists.linux-foundation.org
> Cc: spice-devel@lists.freedesktop.org
> Cc: Zack Rusin <zackr@vmware.com>

FWIW I think this makes the code easier to reason about, so

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/drm_gem.c | 48 +++++++++++++++++++--------------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index aa15c52ae182..e3d897bca0f2 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -356,52 +356,52 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
>  			   u32 *handlep)
>  {
>  	struct drm_device *dev = obj->dev;
> -	u32 handle;
>  	int ret;
>  
>  	WARN_ON(!mutex_is_locked(&dev->object_name_lock));
>  	if (obj->handle_count++ == 0)
>  		drm_gem_object_get(obj);
>  
> +	ret = drm_vma_node_allow(&obj->vma_node, file_priv);
> +	if (ret)
> +		goto err_put;
> +
> +	if (obj->funcs->open) {
> +		ret = obj->funcs->open(obj, file_priv);
> +		if (ret)
> +			goto err_revoke;
> +	}
> +
>  	/*
> -	 * Get the user-visible handle using idr.  Preload and perform
> -	 * allocation under our spinlock.
> +	 * Get the user-visible handle using idr as the _last_ step.
> +	 * Preload and perform allocation under our spinlock.
>  	 */
>  	idr_preload(GFP_KERNEL);
>  	spin_lock(&file_priv->table_lock);
> -
>  	ret = idr_alloc(&file_priv->object_idr, obj, 1, 0, GFP_NOWAIT);
> -
>  	spin_unlock(&file_priv->table_lock);
>  	idr_preload_end();
>  
> -	mutex_unlock(&dev->object_name_lock);
>  	if (ret < 0)
> -		goto err_unref;
> -
> -	handle = ret;
> +		goto err_close;
>  
> -	ret = drm_vma_node_allow(&obj->vma_node, file_priv);
> -	if (ret)
> -		goto err_remove;
> +	mutex_unlock(&dev->object_name_lock);
>  
> -	if (obj->funcs->open) {
> -		ret = obj->funcs->open(obj, file_priv);
> -		if (ret)
> -			goto err_revoke;
> -	}
> +	*handlep = ret;
>  
> -	*handlep = handle;
>  	return 0;
>  
> +err_close:
> +	if (obj->funcs->close)
> +		obj->funcs->close(obj, file_priv);
>  err_revoke:
>  	drm_vma_node_revoke(&obj->vma_node, file_priv);
> -err_remove:
> -	spin_lock(&file_priv->table_lock);
> -	idr_remove(&file_priv->object_idr, handle);
> -	spin_unlock(&file_priv->table_lock);
> -err_unref:
> -	drm_gem_object_handle_put_unlocked(obj);
> +err_put:
> +	if (--obj->handle_count == 0)
> +		drm_gem_object_put(obj);
> +
> +	mutex_unlock(&dev->object_name_lock);
> +
>  	return ret;
>  }
>  

