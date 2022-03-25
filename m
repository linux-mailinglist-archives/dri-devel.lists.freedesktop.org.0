Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A57814E6EB5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 08:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF2D10EE78;
	Fri, 25 Mar 2022 07:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE1310EE76;
 Fri, 25 Mar 2022 07:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648192620; x=1679728620;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QBWcCQxngZCieKayhC+50EI8Wyni78j9XDR8bGKBvss=;
 b=CDELLucFTRV1HF2Kzxnj8c+4tEvUefbh6qBs+0+y3yKMAEGJUTF1BHc6
 jEBXwoCxuugkVJSF1zM+SM3aHsAA8EYPwuZyfLxsLQSYeNQpkLJ7K3T4O
 ZUjaysY6v3BdyBrKzh4sIovTcO0ZPGXcrDJ5Qy0QNlBAwNKyJgCW0eur7
 EuI5uRMqgSbngEXobXFCLR8vjOKYQdVxFQDNlbN0agh6eTit+qORb9KxG
 36A0+/zVPQiYfBmxc2uw/369uGazpAJg6OHQqtZnkhsGg0MXvnugZ5x2G
 GChQZ6zXRMpwE1Yq6d0ZIL7LUuxi9yFib4rO4RpVHWL2uf/g7mm+sQlTc w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="321768664"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="321768664"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 00:17:00 -0700
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="601965239"
Received: from vzinovie-mobl2.ccr.corp.intel.com (HELO [10.249.254.142])
 ([10.249.254.142])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 00:16:58 -0700
Message-ID: <84deb237-3d0b-0c0e-21c8-25df59b9fc71@linux.intel.com>
Date: Fri, 25 Mar 2022 08:16:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] drm/i915/ttm: limit where we apply
 TTM_PL_FLAG_CONTIGUOUS
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220324172143.377104-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220324172143.377104-1-matthew.auld@intel.com>
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
Cc: Nirmoy Das <nirmoy.das@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/24/22 18:21, Matthew Auld wrote:
> We only need this when allocating device local-memory, where this
> influences the drm_buddy. Currently there is some funny behaviour where
> an "in limbo" system memory object is lacking the relevant placement
> flags etc. before we first allocate the ttm_tt, leading to ttm
> performing a move when not needed, since the current placement is seen
> as not compatible.
>
> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Fixes: 2ed38cec5606 ("drm/i915: opportunistically apply ALLOC_CONTIGIOUS")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index e4a06fcf741a..97e648fa76bd 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -133,6 +133,9 @@ i915_ttm_place_from_region(const struct intel_memory_region *mr,
>   	memset(place, 0, sizeof(*place));
>   	place->mem_type = intel_region_to_ttm_type(mr);
>   
> +	if (mr->type == INTEL_MEMORY_SYSTEM)
> +		return;
> +

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

>   	if (flags & I915_BO_ALLOC_CONTIGUOUS)
>   		place->flags |= TTM_PL_FLAG_CONTIGUOUS;
>   	if (offset != I915_BO_INVALID_OFFSET) {
