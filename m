Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D03716BD822
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 19:27:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6070F10EDE0;
	Thu, 16 Mar 2023 18:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB18D10E2E4;
 Thu, 16 Mar 2023 18:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678991260; x=1710527260;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mKj/XVQCC1IrqRZOgJ0qT9jPUsg2rJa5U5jgUHZXMQI=;
 b=glK4sn6VuIN1rVVYAxcvT3nXNtZVX/wXVcvpuvz2beUrXiYtPLQLgkN5
 omN5Nh0Kz0jjs3H6nQoh8rmBsZvTtlafOjl18Rp0m0HbWGZMm08p7Bdet
 xKAt8268UePPiv39TSvHayefNq7k3WumsRswu/IwFjLJrJewFsPtjfXku
 K6Y8T1z4juhnlTpnBPK0M8bxowN/aTaym91IkNqO9gASiJKQkR5BXUIis
 WY6iHw4RpTT0tvazN6up9Fb9LRApTQ60DnIGQlenv2ZfxwxP5teROSHxZ
 m3kGIhfh2Ki8uh1K8uequcUIF4qb9n3nZrWyY7s1VDo8UI2GiRtWeWXq6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="326445863"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="326445863"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 11:27:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="823369471"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="823369471"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.34.106])
 ([10.252.34.106])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 11:27:38 -0700
Message-ID: <158c17b4-ec57-b6ac-bde8-2df1564e03bb@linux.intel.com>
Date: Thu, 16 Mar 2023 19:27:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/i915/gem: Clarify seemingly unaccounted obj refcount
 inc
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230315105446.5858-1-nirmoy.das@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230315105446.5858-1-nirmoy.das@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/15/2023 11:54 AM, Nirmoy Das wrote:
> Add a comment why there is a obj refcount inc before installing
> the vm_ops for the mmap call. Also remove the invalid older comment
> as drm API(drm_gem_prime_mmap()) will hold an obj reference before
> calling this driver mmap callback so we can't have 0-refcnted
> object here.
>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index d3c1dee16af2..0bc8c3818443 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -952,9 +952,10 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
>   						  vma_pages(vma));
>   	if (node && drm_vma_node_is_allowed(node, priv)) {
>   		/*
> -		 * Skip 0-refcnted objects as it is in the process of being
> -		 * destroyed and will be invalid when the vma manager lock
> -		 * is released.


This valid. Matt pointed out a case when user close the obj and call 
mmap and driver only have the fake offset to refer the object

and can end up calling this while driver is freeing the obj.


I will resend with keeping the valid comment.


Nirmoy

> +		 * When we install vm_ops for mmap we are too late for
> +		 * the vm_ops->open() which increases the ref_count of
> +		 * this obj and then it gets decreased by the vm_ops->close().
> +		 * To balance this increase the obj ref_count here.
>   		 */
>   		if (!node->driver_private) {
>   			mmo = container_of(node, struct i915_mmap_offset, vma_node);
