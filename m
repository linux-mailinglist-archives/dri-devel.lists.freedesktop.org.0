Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6793265089D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 09:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A263610E1FE;
	Mon, 19 Dec 2022 08:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06B410E209;
 Mon, 19 Dec 2022 08:37:43 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id h11so7801592wrw.13;
 Mon, 19 Dec 2022 00:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d4PUWpDCc5OCB6Ld0BBIMnycdruf1PmlxbuZjGzJaNI=;
 b=jEjbWPy3wl7ITLr6+vKM2O1zBwRTG+Cfcc/X5DlmiSBitzlS/LzwgnImKPhv/5D6ED
 BH/znKkATw3mwgY8kioKuh6GmSRHT0rXCP0dFs+Kg5rAPJT/rRpuB/TZk4rmltnpADqO
 nitrydB3ZiDPtrY1g7PuvJG10i2LmF1ZeS+cek8jn32aayFBGJ0SIyeTmSWLMlx7kvOy
 l+gL6LB3sqdo39ElbKft1MMy9yqN9wZLrgPeu2s5qsNemG+M+hA2A3Eb96jVfB4G8Vn3
 pC1KfVRrp82KsdyUXz3L7Z8LrGyIbVtsjjDJoF3rL2hZfVNfDkbU7SwliRRAfPitUU7Q
 R8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d4PUWpDCc5OCB6Ld0BBIMnycdruf1PmlxbuZjGzJaNI=;
 b=zEFUT6+IG2MuIH2Ag8eGM0T5RBxiMZ84reMda86TNHLKzU6+VoPZQHkYxyDBKxx/Kd
 GQ3KbDuW6sLfI4Ni53BsnxBKjL711QuKTne1If0wpaRCZjEzhnhIpebwB52mnqYKPYnN
 OBpy+lVxTSstMIlH4YT2hkjXJsVNMsKQ7NxgPfXdtAyDNmdmxLd1TiAUCpnRfC0df7l+
 8Ukp/GE5/RNlpC8DaLTVLEWsvATc/eOYE0gxU6T6lgcVchIpLc5vJCi4R4DKHi55w8C4
 4cT8f2ZWqb73bj0KtraVYVx6ADg3m9Tsp56pGFBHPoEVV2cnHguCCCMSYnzrbBEn8gG3
 1hVA==
X-Gm-Message-State: ANoB5pmDLV/zGPiWDmPZOQJGC9TwpuBkQWlKW0cgko0pRWDkF21qw2gv
 htu1NZfxp1MICVRc9prQ6CM=
X-Google-Smtp-Source: AA0mqf4wyPidEccC0M5VF4p936r5kX1uhUcQHMLls8ZiooP3dZ4udmDJHm0BIgHEVPnEnYWqyGCr9Q==
X-Received: by 2002:a5d:6091:0:b0:242:2088:1546 with SMTP id
 w17-20020a5d6091000000b0024220881546mr32222857wrt.61.1671439062329; 
 Mon, 19 Dec 2022 00:37:42 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:83d7:3937:b31e:d44c?
 ([2a02:908:1256:79a0:83d7:3937:b31e:d44c])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a5d5387000000b00241e4bff85asm9285780wrv.100.2022.12.19.00.37.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 00:37:41 -0800 (PST)
Message-ID: <9e886927-df5a-e264-8d8d-c83045bac732@gmail.com>
Date: Mon, 19 Dec 2022 09:37:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6] drm: Optimise for continuous memory allocation
Content-Language: en-US
To: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org
References: <20221218065708.93332-1-xinhui.pan@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20221218065708.93332-1-xinhui.pan@amd.com>
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
Cc: arunpravin.paneerselvam@amd.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.12.22 um 07:57 schrieb xinhui pan:
> Optimise a little when continuous memory request fails.
>
> There are memory holes and continuous memory request usually fails when
> order is too big.
> Currently buddy only look for exactly order memory for such request.
> Now we can try again to look for several smaller continuous memory on
> failure.

I'm still pretty sure that this is illegal.

See the order is not only the minimum we need for linear allocation, but 
also the minimum alignment we need.

So if you look at some block combination like 010 when searching for an 
order 2 allocation you satisfy the contiguous constrain, but not the 
alignment constrain and that's illegal.

Additional to that we have a huge additional CPU overhead for contiguous 
allocations with that.

Regards,
Christian.

>
> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
> ---
> change from v5:
> reworked
> ---
>   drivers/gpu/drm/drm_buddy.c | 161 ++++++++++++++++++++++++++++++++++--
>   1 file changed, 154 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 11bb59399471..6c795e1b3247 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -386,6 +386,140 @@ alloc_range_bias(struct drm_buddy *mm,
>   	return ERR_PTR(err);
>   }
>   
> +static void __continuous_block_in_tree(struct drm_buddy_block *top_block,
> +				       struct list_head *fbl,
> +				       int left,
> +				       int min_order)
> +{
> +	/*
> +	 * Look for continuous memory of
> +	 * [top_block) when left is true or (top_block] when left is false.
> +	 * The list of fbl looks like (top_block1][free_block][...][top_blockX).
> +	 * Memory offset is in ascending order.
> +	 */
> +	while (top_block) {
> +		struct drm_buddy_block *block = top_block;
> +		int order;
> +
> +		while (drm_buddy_block_is_split(block))
> +			block = left ? block->left : block->right;
> +
> +		order = drm_buddy_block_order(block);
> +		if (order < min_order || !drm_buddy_block_is_free(block))
> +			return;
> +
> +		if (left)
> +			list_add_tail(&block->tmp_link, fbl);
> +		else
> +			list_add(&block->tmp_link, fbl);
> +
> +		if (order == min_order)
> +			return;
> +		top_block = __get_buddy(block);
> +	}
> +}
> +
> +static bool __free_block_in_order(struct list_head *fbl,
> +				  struct drm_buddy_block *cur,
> +				  int order,
> +				  struct drm_buddy_block **first,
> +				  struct drm_buddy_block **last)
> +{
> +	struct drm_buddy_block *fb = cur, *lb = list_next_entry(cur, tmp_link);
> +	u64 pages = BIT(order);
> +	u64 cur_pages = 0;
> +
> +	/*
> +	 * Look for continuous memory which satisfy requested order.
> +	 * Memory in list fbl are already in below order.
> +	 * 1) Memory offset are in ascending order.
> +	 * 2) Memory size are in ascending order from left to middle and
> +	 * descending order from middle to right.
> +	 * So walk through the list of fbl from middle to both sides to
> +	 * choose the bigger memory.
> +	 * This is because one memory with order X are composed with 2 of order X-1
> +	 * or 1 of order X-1 and 2 of order X-2, etc. Looks like below.
> +	 *      n
> +	 *    {∑(X - y)} + {2 * (X-n-1))}
> +	 *      1
> +	 * And the last 2 memory of order (X-n-1) are at the two sides of list.
> +	 */
> +	list_for_each_entry_from_reverse(fb, fbl, tmp_link) {
> +		int prev_order = drm_buddy_block_order(fb);
> +
> +		list_for_each_entry_from(lb, fbl, tmp_link) {
> +			int next_order = drm_buddy_block_order(lb);
> +
> +			if (prev_order <= next_order)
> +				cur_pages += BIT(next_order);
> +			else
> +				break;
> +		}
> +
> +		cur_pages += BIT(prev_order);
> +		if (pages == cur_pages) {
> +			*first = fb;
> +			*last = list_prev_entry(lb, tmp_link);
> +			return true;
> +		}
> +		BUG_ON(pages < cur_pages);
> +	}
> +
> +	*first = *last = NULL;
> +	return false;
> +}
> +
> +static struct drm_buddy_block *
> +find_continuous_blocks(struct drm_buddy *mm,
> +		       int order,
> +		       unsigned long flags,
> +		       struct drm_buddy_block **lb)
> +{
> +	struct list_head *head = &mm->free_list[order - 1];
> +	struct drm_buddy_block *free_block, *first = NULL, *last = NULL;
> +
> +	/*
> +	 * Look for continuous free memory in buddy and buddy-in-law.
> +	 * IOW, the most left blocks at right of free block and the most right
> +	 * blocks at left of free block.
> +	 */
> +
> +	list_for_each_entry(free_block, head, link) {
> +		struct drm_buddy_block *buddy, *parent, *block;
> +		int left, min_order = 0;
> +		LIST_HEAD(fbl);
> +
> +		parent = free_block->parent;
> +		if (!parent)
> +			continue;
> +
> +		left = parent->left == free_block;
> +		list_add(&free_block->tmp_link, &fbl);
> +		buddy = __get_buddy(free_block);
> +		__continuous_block_in_tree(buddy, &fbl, left, min_order);
> +
> +		while (parent && !((parent->left == block) ^ left)) {
> +			block = parent;
> +			parent = parent->parent;
> +		}
> +
> +		if (!parent)
> +			continue;
> +
> +		buddy = __get_buddy(block);
> +		__continuous_block_in_tree(buddy, &fbl, !left, min_order);
> +
> +		/* list head of fbl is invalid outside.
> +		 * Walk through list from first fo last only.
> +		 */
> +		if (__free_block_in_order(&fbl, free_block, order, &first, &last))
> +			break;
> +	}
> +
> +	*lb = last;
> +	return first;
> +}
> +
>   static struct drm_buddy_block *
>   get_maxblock(struct list_head *head)
>   {
> @@ -637,7 +771,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   			   struct list_head *blocks,
>   			   unsigned long flags)
>   {
> -	struct drm_buddy_block *block = NULL;
> +	struct drm_buddy_block *block = NULL, *last_block = NULL;
>   	unsigned int min_order, order;
>   	unsigned long pages;
>   	LIST_HEAD(allocated);
> @@ -689,17 +823,30 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   				break;
>   
>   			if (order-- == min_order) {
> +				if (!(flags & DRM_BUDDY_RANGE_ALLOCATION) &&
> +				    min_order != 0 && pages == BIT(min_order)) {
> +					block = find_continuous_blocks(mm,
> +								       min_order,
> +								       flags,
> +								       &last_block);
> +					if (block)
> +						break;
> +				}
>   				err = -ENOSPC;
>   				goto err_free;
>   			}
>   		} while (1);
>   
> -		mark_allocated(block);
> -		mm->avail -= drm_buddy_block_size(mm, block);
> -		kmemleak_update_trace(block);
> -		list_add_tail(&block->link, &allocated);
> -
> -		pages -= BIT(order);
> +		do {
> +			mark_allocated(block);
> +			mm->avail -= drm_buddy_block_size(mm, block);
> +			kmemleak_update_trace(block);
> +			list_add_tail(&block->link, &allocated);
> +			pages -= BIT(drm_buddy_block_order(block));
> +			if (block == last_block || !last_block)
> +				break;
> +			block = list_next_entry(block, tmp_link);
> +		} while (block);
>   
>   		if (!pages)
>   			break;

