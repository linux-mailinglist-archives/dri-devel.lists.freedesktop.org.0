Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 522574B9BBC
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 10:09:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0437810EB8E;
	Thu, 17 Feb 2022 09:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0DA10EB77;
 Thu, 17 Feb 2022 09:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645088954; x=1676624954;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+l2mkKl56Ko3JW3nIt2TuMstFhob5PJ/wgtMKJl8X6U=;
 b=Uei/36borNfuuP1W+J6XBn4V5dd6xcAxoWr56629VlPMGZnxYeUJwCyr
 CMb9oBLY8u6yje2Z0+mC1GyWJrksT9rmPwhtqwWuFyroQH1Jz4iSBaKtx
 WTQHJ9JwClwbiiCUS+PamPR4g+HKzgdQ7o/xwipyI3zvcqwI3LHPNrkM1
 ZeSAoZsopM/2crqblc5AJfEZFwXxcQovm+7HIvLbLrc4OQri7TYRbkyXn
 r6ONjhS9Ru8WblvWr5vZkCggoZIAYBVQNMu7GvHggQ8mRH+li/I2mZPYP
 uEwmOR5GCJYhOAVIouPW3KbIvvpOgUda5GzNPlL8Wyhr973J/KUz/7dOB Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="311574997"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="311574997"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 01:09:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="530060943"
Received: from markorti-mobl.ger.corp.intel.com (HELO [10.213.216.21])
 ([10.213.216.21])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 01:09:12 -0800
Message-ID: <a37a0c45-615e-e731-e124-7db18bc06e1f@linux.intel.com>
Date: Thu, 17 Feb 2022 09:09:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/3] drm/mm: Ensure that the entry is not NULL before
 extracting rb_node
Content-Language: en-US
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220217075014.922605-1-vivek.kasireddy@intel.com>
 <20220217075014.922605-2-vivek.kasireddy@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220217075014.922605-2-vivek.kasireddy@intel.com>
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 17/02/2022 07:50, Vivek Kasireddy wrote:
> While looking for next holes suitable for an allocation, although,
> it is highly unlikely, make sure that the DECLARE_NEXT_HOLE_ADDR
> macro is using a valid node before it extracts the rb_node from it.

Was the need for this just a consequence of insufficient locking in the 
i915 patch?

Regards,

Tvrtko

> 
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>   drivers/gpu/drm/drm_mm.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
> index 8257f9d4f619..499d8874e4ed 100644
> --- a/drivers/gpu/drm/drm_mm.c
> +++ b/drivers/gpu/drm/drm_mm.c
> @@ -389,11 +389,12 @@ first_hole(struct drm_mm *mm,
>   #define DECLARE_NEXT_HOLE_ADDR(name, first, last)			\
>   static struct drm_mm_node *name(struct drm_mm_node *entry, u64 size)	\
>   {									\
> -	struct rb_node *parent, *node = &entry->rb_hole_addr;		\
> +	struct rb_node *parent, *node;					\
>   									\
> -	if (!entry || RB_EMPTY_NODE(node))				\
> +	if (!entry || RB_EMPTY_NODE(&entry->rb_hole_addr))		\
>   		return NULL;						\
>   									\
> +	node = &entry->rb_hole_addr;					\
>   	if (usable_hole_addr(node->first, size)) {			\
>   		node = node->first;					\
>   		while (usable_hole_addr(node->last, size))		\
