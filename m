Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7519501007
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 16:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DB510FF88;
	Thu, 14 Apr 2022 14:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006F410FF93;
 Thu, 14 Apr 2022 14:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649947291; x=1681483291;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/nmAQuF8uidNgq7HJ/eFp9m+rY8zxzb44tZes2w07Zo=;
 b=d//fhInm9146gicPeZjJsyIFAoPegjwFN5E+++TkcbFajjuJQX2dwhSi
 D1geqG8mZ78pxdFUMhep6lbYb2eDdf+cxKMpA1sgLig98wAoSSEf/Ori6
 2eKq4SrE9hZIP5LBnj4AbKd6NPMP+GV14+ZrXC0cKjxh9zYDfNkD8feIA
 XRGA3ieYX74KpQUhvGcWwgEclC2sSh3WiJB9gPmp8aeaIJmGCxy1JIr0m
 BbAa+ABjRXBea5OFV5hswFOqJfrVT36w+mfVz6lFlLQorEJ0ZhihA2Xi1
 zRFjVOFYF8UJsGC69hDqPoAo9USj4Xw/ObVYARkp6tYPDIVY7U2TiVSIn g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="263120510"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="263120510"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 07:41:29 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="725385705"
Received: from aviljane-mobl.ger.corp.intel.com (HELO [10.249.254.86])
 ([10.249.254.86])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 07:41:25 -0700
Message-ID: <94ddf51a-90ae-dee8-5d6a-45ee2cd1e584@linux.intel.com>
Date: Thu, 14 Apr 2022 16:41:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 5/5] drm/i915: stolen memory use ttm backend
Content-Language: en-US
To: Robert Beckett <bob.beckett@collabora.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220412193817.2098308-1-bob.beckett@collabora.com>
 <20220412193817.2098308-6-bob.beckett@collabora.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220412193817.2098308-6-bob.beckett@collabora.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 4/12/22 21:38, Robert Beckett wrote:
> +struct ttm_resource *
> +i915_gem_stolen_reserve_range(struct drm_i915_private *i915,
> +			      resource_size_t size,
> +			      u64 start, u64 end)
>   {
> -	int ret;
> +	struct intel_memory_region *mem = i915->mm.stolen_region;
>   
> -	if (!drm_mm_initialized(&i915->mm.stolen))
> -		return -ENODEV;
> -
> -	/* WaSkipStolenMemoryFirstPage:bdw+ */
> -	if (GRAPHICS_VER(i915) >= 8 && start < 4096)
> -		start = 4096;

Did we lose this Workaround?

Need to continue reviewing this patchnext week.


Thx,

Thomas




> -
> -	mutex_lock(&i915->mm.stolen_lock);
> -	ret = drm_mm_insert_node_in_range(&i915->mm.stolen, node,
> -					  size, alignment, 0,
> -					  start, end, DRM_MM_INSERT_BEST);
> -	mutex_unlock(&i915->mm.stolen_lock);
> +	if (!mem)
> +		return ERR_PTR(-ENODEV);
> +	return intel_region_ttm_resource_alloc(mem, size, start, end, I915_BO_ALLOC_CONTIGUOUS);
> +}
>   
> -	
