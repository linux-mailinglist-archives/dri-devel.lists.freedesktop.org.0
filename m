Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 520518AA4EB
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 23:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D982113B37;
	Thu, 18 Apr 2024 21:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kc2y2rwn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68AE11A03C;
 Thu, 18 Apr 2024 21:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713477431; x=1745013431;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YTAwvbMycwG5cb3j7vIP93lVwZ8xj4iKyrEBeO9eL4w=;
 b=Kc2y2rwnY8HfRxvDoj/cIjpGoRxPUisu6eBTPFvnWWjCTOpWIHRmPZ3v
 oU+Dgbrt9jf0kBQhFVrAfRLca0qtoE8QxTHcTFdQiwtwvvJwrhLfk6pxc
 vwu8gRh4S6z/uqXmnz5IO40of6jHhbltYK7lR+xtxgwsvu49JVVyFEDJR
 b32FZBMhq7JKuk4JTSc8df0eVoL9IGQQ9Gf5AA/8jKGU6xnnxiLRwVNBh
 U6f16fl2B0s0IvwvgJQAIOdpzkybk5ZjotZWYk2MfqntulYnZ645ct+K4
 1/LmGBWjoUE/NeDthmT8t2RqxgV0NPYR68Fd1DCsRmbYViwYyBWUITHQC g==;
X-CSE-ConnectionGUID: jYeL70nXRbuJhDjeiqTG9A==
X-CSE-MsgGUID: t1ml1ga0Rl2+PATmJAViOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="19664977"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="19664977"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 14:57:10 -0700
X-CSE-ConnectionGUID: 1BB1O1PHRtGMYYpDSinWww==
X-CSE-MsgGUID: RtenSBPEQoaLM7kXIE5B4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="46417112"
Received: from unknown (HELO intel.com) ([10.247.119.51])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 14:57:05 -0700
Date: Thu, 18 Apr 2024 23:56:58 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Badal Nilawar <badal.nilawar@intel.com>,
 Ville =?iso-8859-15?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 linux-hwmon@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/hwmon: Get rid of devm
Message-ID: <ZiGXKrheNEJlk56X@ashyti-mobl2.lan>
References: <20240417145646.793223-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417145646.793223-1-ashutosh.dixit@intel.com>
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

Hi Ashutosh,

On Wed, Apr 17, 2024 at 07:56:46AM -0700, Ashutosh Dixit wrote:
> When both hwmon and hwmon drvdata (on which hwmon depends) are device
> managed resources, the expectation, on device unbind, is that hwmon will be
> released before drvdata. However, in i915 there are two separate code
> paths, which both release either drvdata or hwmon and either can be
> released before the other. These code paths (for device unbind) are as
> follows (see also the bug referenced below):
> 
> Call Trace:
> release_nodes+0x11/0x70
> devres_release_group+0xb2/0x110
> component_unbind_all+0x8d/0xa0
> component_del+0xa5/0x140
> intel_pxp_tee_component_fini+0x29/0x40 [i915]
> intel_pxp_fini+0x33/0x80 [i915]
> i915_driver_remove+0x4c/0x120 [i915]
> i915_pci_remove+0x19/0x30 [i915]
> pci_device_remove+0x32/0xa0
> device_release_driver_internal+0x19c/0x200
> unbind_store+0x9c/0xb0
> 
> and
> 
> Call Trace:
> release_nodes+0x11/0x70
> devres_release_all+0x8a/0xc0
> device_unbind_cleanup+0x9/0x70
> device_release_driver_internal+0x1c1/0x200
> unbind_store+0x9c/0xb0
> 
> This means that in i915, if use devm, we cannot gurantee that hwmon will
> always be released before drvdata. Which means that we have a uaf if hwmon
> sysfs is accessed when drvdata has been released but hwmon hasn't.
> 
> The only way out of this seems to be do get rid of devm_ and release/free
> everything explicitly during device unbind.
> 
> v2: Change commit message and other minor code changes
> v3: Cleanup from i915_hwmon_register on error (Armin Wolf)
> v4: Eliminate potential static analyzer warning (Rodrigo)
>     Eliminate fetch_and_zero (Jani)
> v5: Restore previous logic for ddat_gt->hwmon_dev error return (Andi)

Thanks!

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
