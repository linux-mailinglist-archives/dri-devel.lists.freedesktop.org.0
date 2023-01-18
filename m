Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E36806717E7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 10:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2430E10E1F5;
	Wed, 18 Jan 2023 09:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4F410E1F5;
 Wed, 18 Jan 2023 09:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674034698; x=1705570698;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zQfUx5L0wCDrk6Q0asYhy4S6O+Pm4vDBNUXahFUgrhc=;
 b=ROIP+SgemuLrHyMK27BY5vKpQ200lhEc0pU/TBXA8BATncHCpf4EMnGp
 M48L8R+CWG2RKTHyRQSjcAgdoULylueo8svHaLlCY0OHdiFhtT63wcz1Q
 PB/0bmkmlfuBtVxeZdNZN3EdkywgBwDvqeU/hcHHu42gLHcGqhmS9AKWD
 98umJg3z1Hnr2Xeqd9X87c565jkOYpjFp6aKgYGeqn3+TmLPUpYPnTxyW
 LNX5F/2TAz0tsmcEBOlI2UD/AC3Dylw6+K/Jgt8slE3Kj+XO6N/OOoo30
 69Zn/GkmIXJznp4/7eyXrbu2NJzG1E7OCcD16f7kvzY4PAjIf8Q4hRwuY Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="312822916"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="312822916"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 01:38:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="659724275"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="659724275"
Received: from tpalli-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.54.209])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 01:38:13 -0800
Date: Wed, 18 Jan 2023 10:38:09 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH 1/2] drm/drm_vma_manager: Add drm_vma_node_allow_once()
Message-ID: <Y8e+Ab4vmm2jZdVd@ashyti-mobl2.lan>
References: <20230117175236.22317-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117175236.22317-1-nirmoy.das@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 17, 2023 at 06:52:35PM +0100, Nirmoy Das wrote:
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
> 

Next time, please, don't leave any spaces between tags.

> Suggested-by: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

> ---
>  drivers/gpu/drm/drm_vma_manager.c | 76 ++++++++++++++++++++++---------
>  include/drm/drm_vma_manager.h     |  1 +
>  2 files changed, 55 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_vma_manager.c b/drivers/gpu/drm/drm_vma_manager.c
> index 7de37f8c68fd..83229a031af0 100644
> --- a/drivers/gpu/drm/drm_vma_manager.c
> +++ b/drivers/gpu/drm/drm_vma_manager.c
> @@ -240,27 +240,8 @@ void drm_vma_offset_remove(struct drm_vma_offset_manager *mgr,
>  }
>  EXPORT_SYMBOL(drm_vma_offset_remove);
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
>  {
>  	struct rb_node **iter;
>  	struct rb_node *parent = NULL;
> @@ -282,7 +263,8 @@ int drm_vma_node_allow(struct drm_vma_offset_node *node, struct drm_file *tag)
>  		entry = rb_entry(*iter, struct drm_vma_offset_file, vm_rb);
>  
>  		if (tag == entry->vm_tag) {
> -			entry->vm_count++;
> +			if (ref_counted)
> +				entry->vm_count++;
>  			goto unlock;
>  		} else if (tag > entry->vm_tag) {
>  			iter = &(*iter)->rb_right;
> @@ -307,8 +289,58 @@ int drm_vma_node_allow(struct drm_vma_offset_node *node, struct drm_file *tag)
>  	kfree(new);
>  	return ret;
>  }
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
>  EXPORT_SYMBOL(drm_vma_node_allow);
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
>  /**
>   * drm_vma_node_revoke - Remove open-file from list of allowed users
>   * @node: Node to modify
> diff --git a/include/drm/drm_vma_manager.h b/include/drm/drm_vma_manager.h
> index 4f8c35206f7c..6c2a2f21dbf0 100644
> --- a/include/drm/drm_vma_manager.h
> +++ b/include/drm/drm_vma_manager.h
> @@ -74,6 +74,7 @@ void drm_vma_offset_remove(struct drm_vma_offset_manager *mgr,
>  			   struct drm_vma_offset_node *node);
>  
>  int drm_vma_node_allow(struct drm_vma_offset_node *node, struct drm_file *tag);
> +int drm_vma_node_allow_once(struct drm_vma_offset_node *node, struct drm_file *tag);
>  void drm_vma_node_revoke(struct drm_vma_offset_node *node,
>  			 struct drm_file *tag);
>  bool drm_vma_node_is_allowed(struct drm_vma_offset_node *node,
> -- 
> 2.39.0
