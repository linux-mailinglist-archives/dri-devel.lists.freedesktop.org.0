Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94543522E4F
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 10:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C13C010F223;
	Wed, 11 May 2022 08:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D3210F1E7;
 Wed, 11 May 2022 08:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652257600; x=1683793600;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IlS+wvIwyPBWN+lFXIFb/bALEA6jOVPJY1n40lk4/ic=;
 b=nkVgA1RXqZ4Vq1cDWSO9ILTF0y+AA42xhb74hQW8FPZDxOa0dt78fx39
 AHJumeNmaP5WEXzWZCUK2fFu5ZB5GJy6tztSakB5FR3vG/YB+KifWJxbo
 d0iR1Iw9N39PEw0rFrCXl9zT3ZQrMhwFY5n8wq7CwBhEYd4Wz9+riWzMw
 SmUDTvu3cdz03HIIDMJbBMUe+mQe5nNQJHqnKCkQ0hEcRTDfhMCmVX52S
 Ijyd5T/1vS9qooXv6efZoNUEgeaEDuQaBGFZaAzZJb6JvTt52CfguuFcJ
 DrwNkTBMhVNzbEt+jDfpiA1rA2b5J/OnVaCyNalXMQ9DuM+Bi7+Y/K3c7 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="269763220"
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="269763220"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 01:26:39 -0700
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="520426085"
Received: from mmlucey-mobl1.ger.corp.intel.com (HELO [10.213.195.130])
 ([10.213.195.130])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 01:26:37 -0700
Message-ID: <3dd4df27-ebf5-9942-2d17-941da79aa743@linux.intel.com>
Date: Wed, 11 May 2022 09:26:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [PATCH v4 1/3] drm/i915/gt: Ignore TLB invalidations
 on idle engines
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
References: <20220511011121.114226-1-andi.shyti@linux.intel.com>
 <20220511011121.114226-2-andi.shyti@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220511011121.114226-2-andi.shyti@linux.intel.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/05/2022 02:11, Andi Shyti wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> As an extension of the current skip TLB invalidations if the device is
> powered down, we recognised that prior to any engine activity, all the
> TLBs are explicitly invalidated. Thus anytime we know the engine is
> asleep, we can skip invalidating the TLBs on that engine.

I've only noticed this after looking at the single patch version.

The commit message here does not match the patch really and CI also says 
something is not quite right.

Otherwise the idea I think is a good one. I think it can work together 
with the optimisation I mentioned in my reply to the single patch version.

But there is no rush, for_each_gt flow is unreachable in upstream anyway.

Regards,

Tvrtko

> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_pm.h | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> index bc898df7a48cc..3b1fbce7ea369 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> @@ -55,6 +55,10 @@ static inline void intel_gt_pm_might_put(struct intel_gt *gt)
>   	for (tmp = 1, intel_gt_pm_get(gt); tmp; \
>   	     intel_gt_pm_put(gt), tmp = 0)
>   
> +#define with_intel_gt_pm_if_awake(gt, tmp) \
> +	for (tmp = 1, intel_gt_pm_get_if_awake(gt); tmp; \
> +	     intel_gt_pm_put(gt), tmp = 0)
> +
>   static inline int intel_gt_pm_wait_for_idle(struct intel_gt *gt)
>   {
>   	return intel_wakeref_wait_for_idle(&gt->wakeref);
