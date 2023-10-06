Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A68C7BBFDA
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 21:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D76E10E561;
	Fri,  6 Oct 2023 19:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D58210E561;
 Fri,  6 Oct 2023 19:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696621835; x=1728157835;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VEZNdkfO0poRqnk3jQ2dMNf+hVLjvkgNjsVV9pd57zs=;
 b=K63EsWwKleL97Av8VjBB4KXw7FvZmmOan5o0+700sza5EVS7kwQd2k3Z
 +tGVNnkoLN07aLWoUYIphFt4nE6K/qdv5Vf2mFf2W6pEjNmpDCcdcq/Jj
 aJp0iyQ2WrglfPxab/BOHrVu++1/nZnAwsrXjZhAyY1I4lV7Cv8OyjsS2
 HzqL4PikcbECsa1AYQaoJVbSHGgaGrkL+VFZk+UTCJLOhM/s5DX7YzB66
 L5WYuLh3vZIf0RL2G6hFRn+BgwMddXcxIrDLco1loiA806N3DI4nS42yW
 H6dExbly0FB4FjNTgc62fiTq/RpY5W6IS5lATQj8VOldglF40Jsr0HYej A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="382686954"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="382686954"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 12:50:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="702152212"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="702152212"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.31.15])
 ([10.213.31.15])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 12:50:32 -0700
Message-ID: <be27c1d4-f3c9-4e1e-b4e5-bf5b4e058f89@intel.com>
Date: Fri, 6 Oct 2023 21:50:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915: Remove incomplete PVC plumbing
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20231006083103.660153-1-tvrtko.ursulin@linux.intel.com>
 <20231006083103.660153-3-tvrtko.ursulin@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20231006083103.660153-3-tvrtko.ursulin@linux.intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06.10.2023 10:31, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> PVC support will not be coming to i915 so get rid of its partial
> enablement and reduce the driver maintenance burden.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   .../gpu/drm/i915/gem/i915_gem_object_types.h  |   2 +-
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |   3 -
>   drivers/gpu/drm/i915/gt/intel_gt_mcr.c        |  31 +---
>   drivers/gpu/drm/i915/gt/intel_mocs.c          |  19 ---
>   drivers/gpu/drm/i915/gt/intel_rps.c           |   4 +-
>   drivers/gpu/drm/i915/gt/intel_sseu.c          |   9 +-
>   drivers/gpu/drm/i915/gt/intel_workarounds.c   |  81 +---------
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   4 +-
>   drivers/gpu/drm/i915/i915_debugfs.c           |  12 --
>   drivers/gpu/drm/i915/i915_drv.h               |   9 --
>   drivers/gpu/drm/i915/i915_pci.c               |  35 -----
>   drivers/gpu/drm/i915/i915_reg.h               |   1 -
>   drivers/gpu/drm/i915/intel_clock_gating.c     |  16 +-
>   drivers/gpu/drm/i915/intel_device_info.c      |   1 -
>   drivers/gpu/drm/i915/intel_device_info.h      |   1 -
>   drivers/gpu/drm/i915/intel_step.c             |  70 +--------
>   drivers/gpu/drm/i915/intel_uncore.c           | 142 ------------------
>   drivers/gpu/drm/i915/selftests/intel_uncore.c |   2 -
>   18 files changed, 10 insertions(+), 432 deletions(-)

Nice diffstat.
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

