Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB7FAC6A35
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 15:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32AD10E2CB;
	Wed, 28 May 2025 13:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QqOFRlTj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CDD110E2C7;
 Wed, 28 May 2025 13:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748438407; x=1779974407;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=K9bSH/lUb5q5/5UtzoLMGhadKkH4MgpR616bDH8+a5U=;
 b=QqOFRlTj2+lndrGk5M36F27sl5+N28x5zVUI1YlHFZ+y+XrNZTzBz/w0
 hMSMDqeFWyz3goe4WOKxUdXWkE3ld/zKxvur6FQafvkuvKs/9+K22pbe7
 FpgaiTL1fGCXc9eNzC25lGu//07IguxFUVAc7c68P9ur6rlGZ+pQ6GfN6
 HCutuyOC3w3HkD+UNir/kkDozjagg7wwhejNZiXNpf6qdwRnk5R9SsMXJ
 sHAy1oFc7GyBqEv8oH6yQ8/oPKJOQ/b+GXz3S8VeBi7WjjggMTD9kkjKe
 P05G+d1UywnJa+ciNEm9VlKNLaffIyWNmiNvzoI4xMGOd8XzN9VMyLRvd A==;
X-CSE-ConnectionGUID: uj+b3OeMSLqlX5qOpVgkgA==
X-CSE-MsgGUID: D0Xhw5BTQWWOjD3biLtRJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61123214"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="61123214"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 06:20:07 -0700
X-CSE-ConnectionGUID: uX1fC78eSE2it2HFc2umUg==
X-CSE-MsgGUID: Rmr8z9gFS3CGGW2sMOEotQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="143878506"
Received: from jkubalek-mobl.ger.corp.intel.com (HELO [10.245.113.0])
 ([10.245.113.0])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 06:20:05 -0700
Message-ID: <63e6ce44-318d-4dce-8797-8e98578f89f9@linux.intel.com>
Date: Wed, 28 May 2025 15:20:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] drm/gem: Fix race in drm_gem_handle_create_tail()
To: Simona Vetter <simona.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@intel.com>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
 <20250528091307.1894940-2-simona.vetter@ffwll.ch>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250528091307.1894940-2-simona.vetter@ffwll.ch>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This fixes the race for me.

Tested-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 5/28/2025 11:12 AM, Simona Vetter wrote:
> Object creation is a careful dance where we must guarantee that the
> object is fully constructed before it is visible to other threads, and
> GEM buffer objects are no difference.
> 
> Final publishing happens by calling drm_gem_handle_create(). After
> that the only allowed thing to do is call drm_gem_object_put() because
> a concurrent call to the GEM_CLOSE ioctl with a correctly guessed id
> (which is trivial since we have a linear allocator) can already tear
> down the object again.
> 
> Luckily most drivers get this right, the very few exceptions I've
> pinged the relevant maintainers for. Unfortunately we also need
> drm_gem_handle_create() when creating additional handles for an
> already existing object (e.g. GETFB ioctl or the various bo import
> ioctl), and hence we cannot have a drm_gem_handle_create_and_put() as
> the only exported function to stop these issues from happening.
> 
> Now unfortunately the implementation of drm_gem_handle_create() isn't
> living up to standards: It does correctly finishe object
> initialization at the global level, and hence is safe against a
> concurrent tear down. But it also sets up the file-private aspects of
> the handle, and that part goes wrong: We fully register the object in
> the drm_file.object_idr before calling drm_vma_node_allow() or
> obj->funcs->open, which opens up races against concurrent removal of
> that handle in drm_gem_handle_delete().
> 
> Fix this with the usual two-stage approach of first reserving the
> handle id, and then only registering the object after we've completed
> the file-private setup.
> 
> Jacek reported this with a testcase of concurrently calling GEM_CLOSE
> on a freshly-created object (which also destroys the object), but it
> should be possible to hit this with just additional handles created
> through import or GETFB without completed destroying the underlying
> object with the concurrent GEM_CLOSE ioctl calls.
> 
> Note that the close-side of this race was fixed in f6cd7daecff5 ("drm:
> Release driver references to handle before making it available
> again"), which means a cool 9 years have passed until someone noticed
> that we need to make this symmetry or there's still gaps left :-/
> Without the 2-stage close approach we'd still have a race, therefore
> that's an integral part of this bugfix.
> 
> More importantly, this means we can have NULL pointers behind
> allocated id in our drm_file.object_idr. We need to check for that
> now:
> 
> - drm_gem_handle_delete() checks for ERR_OR_NULL already
> 
> - drm_gem.c:object_lookup() also chekcs for NULL
> 
> - drm_gem_release() should never be called if there's another thread
>   still existing that could call into an IOCTL that creates a new
>   handle, so cannot race. For paranoia I added a NULL check to
>   drm_gem_object_release_handle() though.
> 
> - most drivers (etnaviv, i915, msm) are find because they use
>   idr_find, which maps both ENOENT and NULL to NULL.
> 
> - vmgfx is already broken vmw_debugfs_gem_info_show() because NULL
>   pointers might exist due to drm_gem_handle_delete(). This needs a
>   separate patch. This is because idr_for_each_entry terminates on the
>   first NULL entry and so might not iterate over everything.
> 
> - similar for amd in amdgpu_debugfs_gem_info_show() and
>   amdgpu_gem_force_release(). The latter is really questionable though
>   since it's a best effort hack and there's no way to close all the
>   races. Needs separate patches.
> 
> - xe is really broken because it not uses idr_for_each_entry() but
>   also drops the drm_file.table_lock, which can wreak the idr iterator
>   state if you're unlucky enough. Maybe another reason to look into
>   the drm fdinfo memory stats instead of hand-rolling too much.
> 
> - drm_show_memory_stats() is also broken since it uses
>   idr_for_each_entry. But since that's a preexisting bug I'll follow
>   up with a separate patch.
> 
> Reported-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Cc: stable@vger.kernel.org
> Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Signed-off-by: Simona Vetter <simona.vetter@intel.com>
> Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_gem.c | 10 +++++++++-
>  include/drm/drm_file.h    |  3 +++
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 1e659d2660f7..e4e20dda47b1 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -279,6 +279,9 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
>  	struct drm_file *file_priv = data;
>  	struct drm_gem_object *obj = ptr;
>  
> +	if (WARN_ON(!data))
> +		return 0;
> +
>  	if (obj->funcs->close)
>  		obj->funcs->close(obj, file_priv);
>  
> @@ -399,7 +402,7 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
>  	idr_preload(GFP_KERNEL);
>  	spin_lock(&file_priv->table_lock);
>  
> -	ret = idr_alloc(&file_priv->object_idr, obj, 1, 0, GFP_NOWAIT);
> +	ret = idr_alloc(&file_priv->object_idr, NULL, 1, 0, GFP_NOWAIT);
>  
>  	spin_unlock(&file_priv->table_lock);
>  	idr_preload_end();
> @@ -420,6 +423,11 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
>  			goto err_revoke;
>  	}
>  
> +	/* mirrors drm_gem_handle_delete to avoid races */
> +	spin_lock(&file_priv->table_lock);
> +	obj = idr_replace(&file_priv->object_idr, obj, handle);
> +	WARN_ON(obj != NULL);
> +	spin_unlock(&file_priv->table_lock);
>  	*handlep = handle;
>  	return 0;
>  
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 5c3b2aa3e69d..d344d41e6cfe 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -300,6 +300,9 @@ struct drm_file {
>  	 *
>  	 * Mapping of mm object handles to object pointers. Used by the GEM
>  	 * subsystem. Protected by @table_lock.
> +	 *
> +	 * Note that allocated entries might be NULL as a transient state when
> +	 * creating or deleting a handle.
>  	 */
>  	struct idr object_idr;
>  

