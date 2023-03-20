Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB5D6C2016
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 19:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1340810E22C;
	Mon, 20 Mar 2023 18:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A72CC10E22C;
 Mon, 20 Mar 2023 18:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679337569; x=1710873569;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NVpb0s44A4CDvY38C/xGCzroKuG69A4v+lxaRmy7irg=;
 b=cnYUN8KGLi4+h/2RaMcY4fr0LSk3xCFUJad2HXO/b1BjYIrfBKKDPbdA
 5eFstzgp+dQScplTPCNhyBkNobL3SVW4eEpAoZhgDQjg41Zm4lh+1+LW/
 KjXpZ9KATk7Eqqq+fOt3+ubem9KOpOYjNloo93Uav+RhTFOUoBEltzJCF
 b+PQU+f2wUEjVyEhAJk+z8nFO72yffcEuR3AFHi7yvnG167YC+PXvoySS
 /nsk5uoPN9xHWfXx5+F1RlAOvM4G/6f3akGgiDo7sTxT8rF47IAvWfBCh
 Qm0bs4ego4uwVCzjzBbmt6o+nBa4/oFvK5BmIvnaf2LxMgdL0boFfGEDP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="337463651"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="337463651"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 11:39:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="824605929"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="824605929"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.6.65])
 ([10.213.6.65])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 11:39:25 -0700
Message-ID: <e0481f32-1245-f429-cebe-b6c55c613f80@intel.com>
Date: Mon, 20 Mar 2023 19:39:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [Intel-gfx] [PATCH v4 06/10] drm/i915: Separate wakeref tracking
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230224-track_gt-v4-0-464e8ab4c9ab@intel.com>
 <20230224-track_gt-v4-6-464e8ab4c9ab@intel.com>
 <ZBehYC0npr4nv4mw@ashyti-mobl2.lan>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <ZBehYC0npr4nv4mw@ashyti-mobl2.lan>
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
Cc: netdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris.p.wilson@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Eric Dumazet <edumazet@google.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20.03.2023 00:57, Andi Shyti wrote:
> Hi Andrzej,
> 
> On Mon, Mar 06, 2023 at 05:32:02PM +0100, Andrzej Hajda wrote:
>> From: Chris Wilson <chris@chris-wilson.co.uk>
>>
>> Extract the callstack tracking of intel_runtime_pm.c into its own
>> utility so that that we can reuse it for other online debugging of
>> scoped wakerefs.
>>
>> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> ---
>>   drivers/gpu/drm/i915/Kconfig.debug           |   9 ++
>>   drivers/gpu/drm/i915/Makefile                |   4 +
>>   drivers/gpu/drm/i915/intel_runtime_pm.c      | 222 +++----------------------
>>   drivers/gpu/drm/i915/intel_wakeref.h         |   2 +-
>>   drivers/gpu/drm/i915/intel_wakeref_tracker.c | 234 +++++++++++++++++++++++++++
>>   drivers/gpu/drm/i915/intel_wakeref_tracker.h |  52 ++++++
>>   6 files changed, 319 insertions(+), 204 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
>> index 93dfb7ed970547..5fde52107e3b44 100644
>> --- a/drivers/gpu/drm/i915/Kconfig.debug
>> +++ b/drivers/gpu/drm/i915/Kconfig.debug
>> @@ -25,6 +25,7 @@ config DRM_I915_DEBUG
>>   	select PREEMPT_COUNT
>>   	select I2C_CHARDEV
>>   	select STACKDEPOT
>> +	select STACKTRACE
>>   	select DRM_DP_AUX_CHARDEV
>>   	select X86_MSR # used by igt/pm_rpm
>>   	select DRM_VGEM # used by igt/prime_vgem (dmabuf interop checks)
>> @@ -37,6 +38,7 @@ config DRM_I915_DEBUG
>>   	select DRM_I915_DEBUG_GEM
>>   	select DRM_I915_DEBUG_GEM_ONCE
>>   	select DRM_I915_DEBUG_MMIO
>> +	select DRM_I915_TRACK_WAKEREF
>>   	select DRM_I915_DEBUG_RUNTIME_PM
>>   	select DRM_I915_SW_FENCE_DEBUG_OBJECTS
>>   	select DRM_I915_SELFTEST
>> @@ -227,11 +229,18 @@ config DRM_I915_DEBUG_VBLANK_EVADE
>>   
>>   	  If in doubt, say "N".
>>   
>> +config DRM_I915_TRACK_WAKEREF
>> +	depends on STACKDEPOT
>> +	depends on STACKTRACE
>> +	bool
>> +
>>   config DRM_I915_DEBUG_RUNTIME_PM
>>   	bool "Enable extra state checking for runtime PM"
>>   	depends on DRM_I915
>>   	default n
>>   	select STACKDEPOT
>> +	select STACKTRACE
>> +	select DRM_I915_TRACK_WAKEREF
>>   	help
>>   	  Choose this option to turn on extra state checking for the
>>   	  runtime PM functionality. This may introduce overhead during
>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>> index b2f91a1f826858..42daff6d575a82 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -81,6 +81,10 @@ i915-$(CONFIG_DEBUG_FS) += \
>>   	i915_debugfs_params.o \
>>   	display/intel_display_debugfs.o \
>>   	display/intel_pipe_crc.o
>> +
>> +i915-$(CONFIG_DRM_I915_TRACK_WAKEREF) += \
>> +	intel_wakeref_tracker.o
>> +
> 
> This patch, along with the previous one and two following it, is
> a bit confusing. We add this file only to remove it later and
> the code hops from file to file. There seem to be some extra
> steps that could be avoided.
> 
> Is there room for simplification?

The reason behind this was that i915 had it's own tracker integrated 
with i915_runtime_pm, then it was abstracted out (05,06) to allow track 
gt->wakerefs (07) and then I proposed replacement of internal tracker 
with ref_tracker (09). I wanted to keep original history of development.
I can squash all/some of this work, but I am afraid it will generate 
less readable patches - now we have separated abstract-out and replace 
steps.

Probably sending patches 05-08 1st, then proposing conversion to 
ref_tracker in another patchset would make it more clear.

Regards
Andrzej


> 
> Thanks,
> Andi

