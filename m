Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C623D67181B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 10:45:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F8210E36A;
	Wed, 18 Jan 2023 09:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F2E10E368;
 Wed, 18 Jan 2023 09:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674035125; x=1705571125;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=P9MlO3+To/FlPKwIsQJJvxb8lkte5F7uDSfAfu/+DzM=;
 b=jHxsW+maAGZw13j4uaX2ZS56/juapKkFWo1iaJ5RIgJCEOqOEAx59fx5
 MpwcbQM0bh98mBm+/D0eki2PTTqC5zBgb76WnswhmJC0oRSZ59Yuj/ut4
 ecaaA4fVs9OkGEGa1f6Dx2S2M+YeBwvFPU/m+69yBhvhsp6h+X6nyY4VE
 ehTawMHmYs/gqiR2KVFkPy7IYCAQucS3USyMwEF1V7tHLn8g1JfguguEG
 991t5HG18Y3kWP3LO5FiZC+KMzL/5nB1nRGtQPX58RiBwWWfwTJWk4Yhc
 m5GmcVQwA+MI5FiDMr2LYBd4Pm/eAjbsb/hZ8e6CO4MaUFuk6Fy/LmiF+ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="323632960"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="323632960"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 01:45:24 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="988473836"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="988473836"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.41.107])
 ([10.252.41.107])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 01:45:22 -0800
Message-ID: <cfbc4dd5-88d2-9727-ef9d-2434da7c2352@linux.intel.com>
Date: Wed, 18 Jan 2023 10:45:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/drm_vma_manager: Add
 drm_vma_node_allow_once()
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20230117175236.22317-1-nirmoy.das@intel.com>
 <Y8e+Ab4vmm2jZdVd@ashyti-mobl2.lan>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <Y8e+Ab4vmm2jZdVd@ashyti-mobl2.lan>
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
Cc: Chris Wilson <chris.p.wilson@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/18/2023 10:38 AM, Andi Shyti wrote:
> On Tue, Jan 17, 2023 at 06:52:35PM +0100, Nirmoy Das wrote:
>> Currently there is no easy way for a drm driver to safely check and allow
>> drm_vma_offset_node for a drm file just once. Allow drm drivers to call
>> non-refcounted version of drm_vma_node_allow() so that a driver doesn't
>> need to keep track of each drm_vma_node_allow() to call subsequent
>> drm_vma_node_revoke() to prevent memory leak.
>>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>
> Next time, please, don't leave any spaces between tags.


I will keep that in my mind.

>
>> Suggested-by: Chris Wilson <chris.p.wilson@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>


Thanks,

Nirmoy

>
> Thanks,
> Andi
>
>> ---
>>   drivers/gpu/drm/drm_vma_manager.c | 76 ++++++++++++++++++++++---------
>>   include/drm/drm_vma_manager.h     |  1 +
>>   2 files changed, 55 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_vma_manager.c b/drivers/gpu/drm/drm_vma_manager.c
>> index 7de37f8c68fd..83229a031af0 100644
>> --- a/drivers/gpu/drm/drm_vma_manager.c
>> +++ b/drivers/gpu/drm/drm_vma_manager.c
>> @@ -240,27 +240,8 @@ void drm_vma_offset_remove(struct drm_vma_offset_manager *mgr,
>>   }
>>   EXPORT_SYMBOL(drm_vma_offset_remove);
>>   
>> -/**
>> - * drm_vma_node_allow - Add open-file to list of allowed users
>> - * @node: Node to modify
>> - * @tag: Tag of file to remove
>> - *
>> - * Add @tag to the list of allowed open-files for this node. If @tag is
>> - * already on this list, the ref-count is incremented.
>> - *
>> - * The list of allowed-users is preserved across drm_vma_offset_add() and
>> - * drm_vma_offset_remove() calls. You may even call it if the node is currently
>> - * not added to any offset-manager.
>> - *
>> - * You must remove all open-files the same number of times as you added them
>> - * before destroying the node. Otherwise, you will leak memory.
>> - *
>> - * This is locked against concurrent access internally.
>> - *
>> - * RETURNS:
>> - * 0 on success, negative error code on internal failure (out-of-mem)
>> - */
>> -int drm_vma_node_allow(struct drm_vma_offset_node *node, struct drm_file *tag)
>> +static int vma_node_allow(struct drm_vma_offset_node *node,
>> +			  struct drm_file *tag, bool ref_counted)
>>   {
>>   	struct rb_node **iter;
>>   	struct rb_node *parent = NULL;
>> @@ -282,7 +263,8 @@ int drm_vma_node_allow(struct drm_vma_offset_node *node, struct drm_file *tag)
>>   		entry = rb_entry(*iter, struct drm_vma_offset_file, vm_rb);
>>   
>>   		if (tag == entry->vm_tag) {
>> -			entry->vm_count++;
>> +			if (ref_counted)
>> +				entry->vm_count++;
>>   			goto unlock;
>>   		} else if (tag > entry->vm_tag) {
>>   			iter = &(*iter)->rb_right;
>> @@ -307,8 +289,58 @@ int drm_vma_node_allow(struct drm_vma_offset_node *node, struct drm_file *tag)
>>   	kfree(new);
>>   	return ret;
>>   }
>> +
>> +/**
>> + * drm_vma_node_allow - Add open-file to list of allowed users
>> + * @node: Node to modify
>> + * @tag: Tag of file to remove
>> + *
>> + * Add @tag to the list of allowed open-files for this node. If @tag is
>> + * already on this list, the ref-count is incremented.
>> + *
>> + * The list of allowed-users is preserved across drm_vma_offset_add() and
>> + * drm_vma_offset_remove() calls. You may even call it if the node is currently
>> + * not added to any offset-manager.
>> + *
>> + * You must remove all open-files the same number of times as you added them
>> + * before destroying the node. Otherwise, you will leak memory.
>> + *
>> + * This is locked against concurrent access internally.
>> + *
>> + * RETURNS:
>> + * 0 on success, negative error code on internal failure (out-of-mem)
>> + */
>> +int drm_vma_node_allow(struct drm_vma_offset_node *node, struct drm_file *tag)
>> +{
>> +	return vma_node_allow(node, tag, true);
>> +}
>>   EXPORT_SYMBOL(drm_vma_node_allow);
>>   
>> +/**
>> + * drm_vma_node_allow_once - Add open-file to list of allowed users
>> + * @node: Node to modify
>> + * @tag: Tag of file to remove
>> + *
>> + * Add @tag to the list of allowed open-files for this node.
>> + *
>> + * The list of allowed-users is preserved across drm_vma_offset_add() and
>> + * drm_vma_offset_remove() calls. You may even call it if the node is currently
>> + * not added to any offset-manager.
>> + *
>> + * This is not ref-counted unlike drm_vma_node_allow() hence drm_vma_node_revoke()
>> + * should only be called once after this.
>> + *
>> + * This is locked against concurrent access internally.
>> + *
>> + * RETURNS:
>> + * 0 on success, negative error code on internal failure (out-of-mem)
>> + */
>> +int drm_vma_node_allow_once(struct drm_vma_offset_node *node, struct drm_file *tag)
>> +{
>> +	return vma_node_allow(node, tag, false);
>> +}
>> +EXPORT_SYMBOL(drm_vma_node_allow_once);
>> +
>>   /**
>>    * drm_vma_node_revoke - Remove open-file from list of allowed users
>>    * @node: Node to modify
>> diff --git a/include/drm/drm_vma_manager.h b/include/drm/drm_vma_manager.h
>> index 4f8c35206f7c..6c2a2f21dbf0 100644
>> --- a/include/drm/drm_vma_manager.h
>> +++ b/include/drm/drm_vma_manager.h
>> @@ -74,6 +74,7 @@ void drm_vma_offset_remove(struct drm_vma_offset_manager *mgr,
>>   			   struct drm_vma_offset_node *node);
>>   
>>   int drm_vma_node_allow(struct drm_vma_offset_node *node, struct drm_file *tag);
>> +int drm_vma_node_allow_once(struct drm_vma_offset_node *node, struct drm_file *tag);
>>   void drm_vma_node_revoke(struct drm_vma_offset_node *node,
>>   			 struct drm_file *tag);
>>   bool drm_vma_node_is_allowed(struct drm_vma_offset_node *node,
>> -- 
>> 2.39.0
