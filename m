Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 819EA8CACE7
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 12:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B092310EAD7;
	Tue, 21 May 2024 10:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eEU2o//b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B3A10EAD1;
 Tue, 21 May 2024 10:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716289058; x=1747825058;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HEEgfecDfT/gFkSpbYtQGgMvA7+rpSr2/rQpdv6Or0Y=;
 b=eEU2o//bs1nygYkwupA+DE4NRYRVJsEG0QaqA7lgLN/JTaSP9ab51ceL
 thYYJaYrw+s7/+1c07uAgI0AL8I1ImaDRlXgohh/xB+G5IHFFgu3pxXUa
 hALKVbJKA4shIl7DpKKsUnl15u9FFnuBRPrvJgjngClaQmLJo1BhqW8iJ
 xpfxejCB4KO0x6Im8A8f2HoAdb3UliILF5NdeMuKGMkdgHLocNxlIYzhF
 gR5SG+vBsPXMGRkle91QHs4eC8xbKQMARc8zSl69TfKfv9RXFxiHmKPw7
 6ucCrTYGWEfAZdyqNvomyEhzzwclPh5KHye3gtHywi75s1R9CbD3NmgiN Q==;
X-CSE-ConnectionGUID: Tci0BN1uQYyHte6Ve3T2sQ==
X-CSE-MsgGUID: GozRdBcKR7KMUwCaQ9kVPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="11630058"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="11630058"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:57:37 -0700
X-CSE-ConnectionGUID: y6Ar1L17SxWajSSBnIYSRA==
X-CSE-MsgGUID: V3j7ATB+SzWJIuHMc2Ag0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="32891204"
Received: from bvivekan-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.247.118.249])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:57:16 -0700
Date: Tue, 21 May 2024 12:56:57 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH 2/2] drm/i915: Don't treat FLR resets as errors
Message-ID: <Zkx9-RHwTEnblEXo@ashyti-mobl2.lan>
References: <20240517112550.251955-1-andi.shyti@linux.intel.com>
 <20240517112550.251955-3-andi.shyti@linux.intel.com>
 <e2a23879-c69e-4b57-a0a0-4c1ac81d9403@linux.intel.com>
 <ZkexSOO9MYt7Y9-8@ashyti-mobl2.lan>
 <b78fea46-2db1-45f9-9d7a-e257bc242c91@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b78fea46-2db1-45f9-9d7a-e257bc242c91@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

On Fri, May 17, 2024 at 10:13:37PM +0200, Nirmoy Das wrote:
> Hi Andi,
> 
> On 5/17/2024 9:34 PM, Andi Shyti wrote:
> 
>     Hi Nirmoy,
> 
>     On Fri, May 17, 2024 at 04:00:02PM +0200, Nirmoy Das wrote:
> 
>         On 5/17/2024 1:25 PM, Andi Shyti wrote:
> 
>             If we timeout while waiting for an FLR reset, there is nothing we
>             can do and i915 doesn't have any control on it. In any case the
>             system is still perfectly usable
> 
>         If a FLR reset fails then we will have a dead GPU, I don't think the GPU is
>         usable without a cold reboot.
> 
>     fact is that the GPU keeps going and even though the timeout has
>     expired, the system moves to the next phase.
> 
> The current test might look like it is has passed, but if you look into the
> subsequent tests you can see a dead GPU:
> 
> <7>[  369.168121] pci 0000:00:02.0: [drm:intel_uncore_fini_mmio [i915]] Triggering Driver-FLR
> <3>[  372.170189] pci 0000:00:02.0: [drm] *ERROR* Driver-FLR-teardown wait completion failed! -110
> <7>[  372.437630] [IGT] i915_selftest: finished subtest requests, SUCCESS
> <7>[  372.438356] [IGT] i915_selftest: starting dynamic subtest migrate
> <5>[  373.110580] Setting dangerous option live_selftests - tainting kernel
> <3>[  373.183499] i915 0000:00:02.0: Unable to change power state from D0 to D0, device inaccessible
> <3>[  373.246921] i915 0000:00:02.0: [drm] *ERROR* Unrecognized display IP version 1023.255; disabling display.
> <7>[  373.247130] i915 0000:00:02.0: [drm:intel_step_init [i915]] Using future steppings
> <7>[  373.247716] i915 0000:00:02.0: [drm:intel_step_init [i915]] Using future steppings
> <7>[  373.248263] i915 0000:00:02.0: [drm:intel_step_init [i915]] Using future display steppings
> <7>[  373.251843] i915 0000:00:02.0: [drm:intel_gt_common_init_early [i915]] WOPCM: 2048K
> <7>[  373.252505] i915 0000:00:02.0: [drm:intel_uc_init_early [i915]] GT0: enable_guc=3 (guc:yes submission:yes huc:no slpc:yes)
> <7>[  373.253140] i915 0000:00:02.0: [drm:intel_gt_probe_all [i915]] GT0: Setting up Primary GT
> <7>[  373.253556] i915 0000:00:02.0: [drm:intel_gt_probe_all [i915]] GT1: Setting up Standalone Media GT
> <7>[  373.253941] i915 0000:00:02.0: [drm:intel_gt_common_init_early [i915]] WOPCM: 2048K
> <7>[  373.254365] i915 0000:00:02.0: [drm:intel_uc_init_early [i915]] GT1: enable_guc=3 (guc:yes submission:yes huc:yes slpc:yes)
> <3>[  375.256235] i915 0000:00:02.0: [drm] *ERROR* Device is non-operational; MMIO access returns 0xFFFFFFFF!
> <3>[  375.259089] i915 0000:00:02.0: Device initialization failed (-5)
> <3>[  375.260521] i915 0000:00:02.0: probe with driver i915 failed with error -5
> <7>[  375.392209] [IGT] i915_selftest: finished subtest migrate, FAIL
> 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14724/bat-arls-3/dmesg0.txt

Are we sure this is dependent on the FLR reset? There are cases
when the FLR reset doesn't make any difference and in any case
this error is completely ignored by the driver.

Perhaps we can change it to a warning?

>         This is a serious issue and should be report as an error.  I think we need
>         to create a HW ticket to understand
> 
>         why is FLR reset fails.
> 
>     Maybe it takes longer and longer to reset. We've been sending
>     several patches in the latest years to fix the timings.
> 
> HW spec says 3 sec but we can try increasing it bit higher to try it out.

We could go, then, with just patch 1 and see if it improves. Also
because, the FLR reset might also depend on the firmware.

Thanks, Nirmoy,
Andi
