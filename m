Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC25A2F7511
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 10:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662FA6E048;
	Fri, 15 Jan 2021 09:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6E96E048
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 09:17:45 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E18D527;
 Fri, 15 Jan 2021 10:17:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610702262;
 bh=M9nYayUYUPm3qiVyuxP7MJ6hVav7Bx//CKHdCqiCz0c=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=N4pNXmhQNrzIbh2K8Kn/aAKBWmk4/DpEkvAi9BJGxiQvQt935lAqi2ag0U3JERQQ1
 LeXxgCE1R1J4OAQ3oBhiGXcPdU2fNCHjH5UWAaY0UyfifwTiSr5YvHVCy0YP1wVgVP
 0AA9T6ddnM0Bz9XEzkmbalMMmIeDgC0cWZbpAAWw=
Subject: Re: [PATCH] drm: Set vm_ops to GEM object's values during mmap
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20210115083938.21747-1-tzimmermann@suse.de>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <ac1a64d7-d117-521b-ec7a-61116a3f0df0@ideasonboard.com>
Date: Fri, 15 Jan 2021 09:17:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210115083938.21747-1-tzimmermann@suse.de>
Content-Language: en-GB
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On 15/01/2021 08:39, Thomas Zimmermann wrote:
> The GEM mmap code relies on the GEM object's mmap callback to set the
> VMA's vm_ops field. This is easily forgotten and lead to a memory leak

 s/lead/can lead/

> in the CMA helpers. Instead set the vm_ops field in the DRM core code
> to the GEM object's value. Drivers with different needs can override
> this in their mmap callback.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: f5ca8eb6f9bd ("drm/cma-helper: Implement mmap as GEM CMA object functions")
> Reported-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

This also works here.
 - https://paste.ubuntu.com/p/S2Q586rgwT/

Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/drm_gem.c   | 23 ++++++++++++-----------
>  drivers/gpu/drm/drm_prime.c |  4 ++++
>  2 files changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 34b2f111c01c..54d95621fcbb 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1069,27 +1069,28 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
>  
>  	vma->vm_private_data = obj;
>  
> +	if (!obj->funcs->vm_ops) {
> +		ret = -EINVAL;
> +		goto err_drm_gem_object_put;
> +	}
> +	vma->vm_ops = obj->funcs->vm_ops;
> +
>  	if (obj->funcs->mmap) {
>  		ret = obj->funcs->mmap(obj, vma);
> -		if (ret) {
> -			drm_gem_object_put(obj);
> -			return ret;
> -		}
> +		if (ret)
> +			goto err_drm_gem_object_put;
>  		WARN_ON(!(vma->vm_flags & VM_DONTEXPAND));
>  	} else {
> -		if (obj->funcs->vm_ops)
> -			vma->vm_ops = obj->funcs->vm_ops;
> -		else {
> -			drm_gem_object_put(obj);
> -			return -EINVAL;
> -		}
> -
>  		vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
>  		vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
>  		vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>  	}
>  
>  	return 0;
> +
> +err_drm_gem_object_put:
> +	drm_gem_object_put(obj);
> +	return ret;
>  }
>  EXPORT_SYMBOL(drm_gem_mmap_obj);
>  
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 683aa29ecd3b..0549ec190583 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -717,6 +717,10 @@ int drm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>  	vma->vm_pgoff += drm_vma_node_start(&obj->vma_node);
>  
>  	if (obj->funcs && obj->funcs->mmap) {
> +		if (!obj->funcs->vm_ops)
> +			return -EINVAL;
> +		vma->vm_ops = obj->funcs->vm_ops;
> +
>  		ret = obj->funcs->mmap(obj, vma);
>  		if (ret)
>  			return ret;
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
