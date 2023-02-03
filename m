Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CA1689BB5
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 15:31:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4E710E7A5;
	Fri,  3 Feb 2023 14:31:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E565810E7A5;
 Fri,  3 Feb 2023 14:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675434696; x=1706970696;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ErWT9gO5zkBEnLPzIGYm9DUumt4v4IkZrPCHmNldwoY=;
 b=VnonkvdjFExhLT9uTNcgi9fMyWLNic6RYprQsHttI5jpC5tysrXdECDz
 oIK9bfsvc8PRG211LzisSmZQKC9qwPFB2v1YE1TrsUb8hPdmP9yLS/8gi
 yal6AyKJbojW+aqPxbB2YQi6OABWUqYZuOit5HGiAlGSPFVydfMbPT4qu
 DrlKl/VKW6TpVAsWDm4bftMqubi7+p+9/N06DlV4l0hXiBXclcg+qbWib
 bpDMyua9t1jNS5JsNrPHWPvXDtgpUZU2abaYtM+89sFfkSnjC4jVZCgEu
 QVi0YEuFfVS3n+PwyuwWUbAEcfhnkjvD7CKl73ARuaq+jZq0iG2jwshCJ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="328773248"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="328773248"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 06:31:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="643280161"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="643280161"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.5.248])
 ([10.213.5.248])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 06:31:34 -0800
Message-ID: <535f4fc7-e89f-9e20-e883-91f100dc85e2@intel.com>
Date: Fri, 3 Feb 2023 15:31:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Initialize the obj flags for
 shmem objects
Content-Language: en-US
To: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20230203135205.4051149-1-aravind.iddamsetty@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230203135205.4051149-1-aravind.iddamsetty@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03.02.2023 14:52, Aravind Iddamsetty wrote:
> Obj flags for shmem objects is not being set correctly. Fixes in setting
> BO_ALLOC_USER flag which applies to shmem objs as well.
> 
> Fixes: 13d29c823738 ("drm/i915/ehl: unconditionally flush the pages on acquire")
> Cc: <stable@vger.kernel.org> # v5.15+
> 
> v2: Add fixes tag (Tvrtko, Matt A)
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> index 114443096841..37d1efcd3ca6 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -596,7 +596,7 @@ static int shmem_object_init(struct intel_memory_region *mem,
>   	mapping_set_gfp_mask(mapping, mask);
>   	GEM_BUG_ON(!(mapping_gfp_mask(mapping) & __GFP_RECLAIM));
>   
> -	i915_gem_object_init(obj, &i915_gem_shmem_ops, &lock_class, 0);
> +	i915_gem_object_init(obj, &i915_gem_shmem_ops, &lock_class, flags);
>   	obj->mem_flags |= I915_BO_FLAG_STRUCT_PAGE;
>   	obj->write_domain = I915_GEM_DOMAIN_CPU;
>   	obj->read_domains = I915_GEM_DOMAIN_CPU;

