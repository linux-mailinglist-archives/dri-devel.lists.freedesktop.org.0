Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 861CC671D81
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 14:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8AE10E746;
	Wed, 18 Jan 2023 13:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A240D10E746;
 Wed, 18 Jan 2023 13:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674047964; x=1705583964;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kzLml9umll/jySx2BG9X7bAHoHA4VT9Pp+QU8OB+mAA=;
 b=UVl4G2O1QkAY65fIK8kow6YdBEb0BsbnBjdD+J6R5IhWY8bqjyQz6kJh
 wj1M+6jqrGiLuR5ZbuPowwOvcDBxzZiibTAv7xWfTV0lPFmQRV4MRoYEX
 xa4YXnjFLI9SQQpOLGodiiizP9kTQKgdYo2vNc2vyJifR88EdA1IZpWIy
 vHz+ry2pMBjAb9tllpkGhuy7H2MkZrIjOfX4Me5DaDYVI5OMkcHwGesXu
 vxyX1WBcvLSzdqoq8+8cQex3yxrfV9F/4vfuHwavAlMwD8K3MhtwmiDJA
 TPo7FV+qsAbh1ypJCj3Gf/hWME24DWj+NX5gi/mtz8VJWt8LdCGN54tiX g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="322668441"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="322668441"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 05:19:24 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="767735729"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="767735729"
Received: from llvincen-mobl.ger.corp.intel.com (HELO [10.213.215.37])
 ([10.213.215.37])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 05:19:21 -0800
Message-ID: <10d6fd71-7c03-a820-c984-7466b0aad044@linux.intel.com>
Date: Wed, 18 Jan 2023 13:19:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] drm/drm_vma_manager: Add drm_vma_node_allow_once()
Content-Language: en-US
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20230117175236.22317-1-nirmoy.das@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230117175236.22317-1-nirmoy.das@intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel,

On 17/01/2023 17:52, Nirmoy Das wrote:
> Currently there is no easy way for a drm driver to safely check and allow
> drm_vma_offset_node for a drm file just once. Allow drm drivers to call
> non-refcounted version of drm_vma_node_allow() so that a driver doesn't
> need to keep track of each drm_vma_node_allow() to call subsequent
> drm_vma_node_revoke() to prevent memory leak.
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>

Okay to take this via drm-intel?

Do we need an additional r-b from the DRM core side?

Regards,

Tvrtko

> Suggested-by: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/drm_vma_manager.c | 76 ++++++++++++++++++++++---------
>   include/drm/drm_vma_manager.h     |  1 +
>   2 files changed, 55 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_vma_manager.c b/drivers/gpu/drm/drm_vma_manager.c
> index 7de37f8c68fd..83229a031af0 100644
> --- a/drivers/gpu/drm/drm_vma_manager.c
> +++ b/drivers/gpu/drm/drm_vma_manager.c
> @@ -240,27 +240,8 @@ void drm_vma_offset_remove(struct drm_vma_offset_manager *mgr,
>   }
>   EXPORT_SYMBOL(drm_vma_offset_remove);
>   
> -/**
> - * drm_vma_node_allow - Add open-file to list of allowed users
> - * @node: Node to modify
> - * @tag: Tag of file to remove
> - *
> - * Add @tag to the list of allowed open-files for this node. If @tag is
> - * already on this list, the ref-count is incremented.
> - *
> - * The list of allowed-users is preserved across drm_vma_offset_add() and
> - * drm_vma_offset_remove() calls. You may even call it if the node is currently
> - * not added to any offset-manager.
> - *
> - * You must remove all open-files the same number of times as you added them
> - * before destroying the node. Otherwise, you will leak memory.
> - *
> - * This is locked against concurrent access internally.
> - *
> - * RETURNS:
> - * 0 on success, negative error code on internal failure (out-of-mem)
> - */
> -int drm_vma_node_allow(struct drm_vma_offset_node *node, struct drm_file *tag)
> +static int vma_node_allow(struct drm_vma_offset_node *node,
> +			  struct drm_file *tag, bool ref_counted)
>   {
>   	struct rb_node **iter;
>   	struct rb_node *parent = NULL;
> @@ -282,7 +263,8 @@ int drm_vma_node_allow(struct drm_vma_offset_node *node, struct drm_file *tag)
>   		entry = rb_entry(*iter, struct drm_vma_offset_file, vm_rb);
>   
>   		if (tag == entry->vm_tag) {
> -			entry->vm_count++;
> +			if (ref_counted)
> +				entry->vm_count++;
>   			goto unlock;
>   		} else if (tag > entry->vm_tag) {
>   			iter = &(*iter)->rb_right;
> @@ -307,8 +289,58 @@ int drm_vma_node_allow(struct drm_vma_offset_node *node, struct drm_file *tag)
>   	kfree(new);
>   	return ret;
>   }
> +
> +/**
> + * drm_vma_node_allow - Add open-file to list of allowed users
> + * @node: Node to modify
> + * @tag: Tag of file to remove
> + *
> + * Add @tag to the list of allowed open-files for this node. If @tag is
> + * already on this list, the ref-count is incremented.
> + *
> + * The list of allowed-users is preserved across drm_vma_offset_add() and
> + * drm_vma_offset_remove() calls. You may even call it if the node is currently
> + * not added to any offset-manager.
> + *
> + * You must remove all open-files the same number of times as you added them
> + * before destroying the node. Otherwise, you will leak memory.
> + *
> + * This is locked against concurrent access internally.
> + *
> + * RETURNS:
> + * 0 on success, negative error code on internal failure (out-of-mem)
> + */
> +int drm_vma_node_allow(struct drm_vma_offset_node *node, struct drm_file *tag)
> +{
> +	return vma_node_allow(node, tag, true);
> +}
>   EXPORT_SYMBOL(drm_vma_node_allow);
>   
> +/**
> + * drm_vma_node_allow_once - Add open-file to list of allowed users
> + * @node: Node to modify
> + * @tag: Tag of file to remove
> + *
> + * Add @tag to the list of allowed open-files for this node.
> + *
> + * The list of allowed-users is preserved across drm_vma_offset_add() and
> + * drm_vma_offset_remove() calls. You may even call it if the node is currently
> + * not added to any offset-manager.
> + *
> + * This is not ref-counted unlike drm_vma_node_allow() hence drm_vma_node_revoke()
> + * should only be called once after this.
> + *
> + * This is locked against concurrent access internally.
> + *
> + * RETURNS:
> + * 0 on success, negative error code on internal failure (out-of-mem)
> + */
> +int drm_vma_node_allow_once(struct drm_vma_offset_node *node, struct drm_file *tag)
> +{
> +	return vma_node_allow(node, tag, false);
> +}
> +EXPORT_SYMBOL(drm_vma_node_allow_once);
> +
>   /**
>    * drm_vma_node_revoke - Remove open-file from list of allowed users
>    * @node: Node to modify
> diff --git a/include/drm/drm_vma_manager.h b/include/drm/drm_vma_manager.h
> index 4f8c35206f7c..6c2a2f21dbf0 100644
> --- a/include/drm/drm_vma_manager.h
> +++ b/include/drm/drm_vma_manager.h
> @@ -74,6 +74,7 @@ void drm_vma_offset_remove(struct drm_vma_offset_manager *mgr,
>   			   struct drm_vma_offset_node *node);
>   
>   int drm_vma_node_allow(struct drm_vma_offset_node *node, struct drm_file *tag);
> +int drm_vma_node_allow_once(struct drm_vma_offset_node *node, struct drm_file *tag);
>   void drm_vma_node_revoke(struct drm_vma_offset_node *node,
>   			 struct drm_file *tag);
>   bool drm_vma_node_is_allowed(struct drm_vma_offset_node *node,
