Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C04EB56B3DC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 09:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CAC10F972;
	Fri,  8 Jul 2022 07:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE9510F972;
 Fri,  8 Jul 2022 07:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657266828; x=1688802828;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=226n02MK38Ht0X6q4rCIPnDL++KJz3PSWDz7ZAUD+1w=;
 b=HKz3qwxDYMVMqAhWITTPB116RJrukIagwdJys6K0Xqndjd24hAPG2SoK
 Bhx37uQnTAbwNC2AsB+p1RNgR0lWYmmN2wRjLQe+SW2RxYFS+kgIxuAEb
 RyNtoA7F7kMDSTCt2AS+f1eD7ZCWZ0Ln+y8hVTO5X7TW6zxyXbdyRcC4c
 4KCoTinxLK8l3Yh5rezZmcbyl7HQXF+1MpRFebpeCMeKZ8oxpElkbrWU7
 AOMnWPYjxy/tV1RWo4zlXaxfa+qSCaqrDonQ4d2WHle50xsY/FAiNreC8
 xZtgL4fq1Xtwz1UMjCBMGTd4+obER5DRy45NTY6f9VhOzYKcPNjhnX8US g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="284245278"
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; d="scan'208";a="284245278"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 00:53:47 -0700
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; d="scan'208";a="661691042"
Received: from cmchugh-mobl.ger.corp.intel.com (HELO [10.213.229.21])
 ([10.213.229.21])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 00:53:45 -0700
Message-ID: <6e387f90-dce3-486d-83e9-26a975777265@intel.com>
Date: Fri, 8 Jul 2022 08:53:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v10 04/11] drm/i915/gem: selftest should not attempt mmap
 of private regions
Content-Language: en-GB
To: Robert Beckett <bob.beckett@collabora.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220707200230.1657555-1-bob.beckett@collabora.com>
 <20220707200230.1657555-5-bob.beckett@collabora.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220707200230.1657555-5-bob.beckett@collabora.com>
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
 kernel@collabora.com, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/07/2022 21:02, Robert Beckett wrote:
> During testing make can_mmap consider whether the region is private.

Do we still need this with: 938d2fd17d17 ("drm/i915/selftests: skip the 
mman tests for stolen") ?

> 
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> index 5bc93a1ce3e3..76181e28c75e 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> @@ -869,6 +869,9 @@ static bool can_mmap(struct drm_i915_gem_object *obj, enum i915_mmap_type type)
>   	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>   	bool no_map;
>   
> +	if (obj->mm.region && obj->mm.region->private)
> +		return false;
> +
>   	if (obj->ops->mmap_offset)
>   		return type == I915_MMAP_TYPE_FIXED;
>   	else if (type == I915_MMAP_TYPE_FIXED)
