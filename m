Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A940F509A81
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 10:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA9810F62F;
	Thu, 21 Apr 2022 08:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B468B10F62D;
 Thu, 21 Apr 2022 08:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650529088; x=1682065088;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CuD6780L58yjID5rpNHtMjbJ3Jn4yeznrOmVMTsspB0=;
 b=ZDsDUxKuf+EC9yQqsbDQAJV8lsElXqurco+Yzd7mZ/gdqm8v1/FERRjK
 +jT9vHaCFjxfaMQCTWeVNszxyuaMbGQYmc8eZJ5EUzmc+fpswht/M8193
 bGOk+8eb8O6Vdvq0ZQWwr6aKoctBkQ0j3Ru2APzOFl5MD+9IPZVZwfhAT
 E581DvKZZD8uXDJZYomOLqpy+IRwDnH9wihSP5xL25n6OswA6o3bp3VdP
 6o0qZUMoETx+EoNAf92JVNmH6vTsTC99YwX7NA0vv2ERK2joEL/0zbgnO
 sALiNAW9/EtJneC4cHSKZUGHmK1Yw9oTN4i4RFzfQD/zqYFQxZzVM6cml Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="350724947"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="350724947"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 01:18:08 -0700
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="530174628"
Received: from bshawkat-mobl.ger.corp.intel.com (HELO [10.251.215.159])
 ([10.251.215.159])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 01:18:06 -0700
Message-ID: <3e944231-9219-53c5-de69-59d61d10a3ba@linux.intel.com>
Date: Thu, 21 Apr 2022 10:18:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/2] drm/i915/selftests: tweak the misaligned_case
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220406193037.1060769-1-matthew.auld@intel.com>
 <20220406193037.1060769-2-matthew.auld@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20220406193037.1060769-2-matthew.auld@intel.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LGTM Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

On 4/6/2022 9:30 PM, Matthew Auld wrote:
> The compact-pt layout restrictions should only apply to the ppGTT. Also
> make this play nice on platforms that only have the 64K GTT restriction,
> and not the compact-pt thing.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> index bccc49a8ab5e..8633bec18fa7 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> @@ -1112,10 +1112,16 @@ static int misaligned_case(struct i915_address_space *vm, struct intel_memory_re
>   	expected_vma_size = round_up(size, 1 << (ffs(vma->resource->page_sizes_gtt) - 1));
>   	expected_node_size = expected_vma_size;
>   
> -	if (NEEDS_COMPACT_PT(vm->i915) && i915_gem_object_is_lmem(obj)) {
> -		/* compact-pt should expand lmem node to 2MB */
> +	if (HAS_64K_PAGES(vm->i915) && i915_gem_object_is_lmem(obj)) {
> +		/*
> +		 * The compact-pt should expand lmem node to 2MB for the ppGTT,
> +		 * for all other cases we should only expect 64K.
> +		 */
>   		expected_vma_size = round_up(size, I915_GTT_PAGE_SIZE_64K);
> -		expected_node_size = round_up(size, I915_GTT_PAGE_SIZE_2M);
> +		if (NEEDS_COMPACT_PT(vm->i915) && !i915_is_ggtt(vm))
> +			expected_node_size = round_up(size, I915_GTT_PAGE_SIZE_2M);
> +		else
> +			expected_node_size = round_up(size, I915_GTT_PAGE_SIZE_64K);
>   	}
>   
>   	if (vma->size != expected_vma_size || vma->node.size != expected_node_size) {
