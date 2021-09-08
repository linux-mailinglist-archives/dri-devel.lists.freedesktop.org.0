Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7146B4036D8
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 11:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FB1898CE;
	Wed,  8 Sep 2021 09:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45AC89856;
 Wed,  8 Sep 2021 09:26:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="207548421"
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="207548421"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 02:26:31 -0700
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="465451883"
Received: from eoinwals-mobl.ger.corp.intel.com (HELO [10.213.233.175])
 ([10.213.233.175])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 02:26:30 -0700
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Get PM ref before accessing HW
 register
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210907232704.12982-1-vinay.belgaumkar@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <f6dce84f-0a07-ed0c-8812-7f79dc4af0c3@linux.intel.com>
Date: Wed, 8 Sep 2021 10:26:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210907232704.12982-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 08/09/2021 00:27, Vinay Belgaumkar wrote:
> Seeing these errors when GT is likely in suspend state-
> "RPM wakelock ref not held during HW access"
> 
> Ensure GT is awake before trying to access HW registers. Avoid
> reading the register if that is not the case.
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Fixes: 41e5c17ebfc2 ("drm/i915/guc/slpc: Sysfs hooks for SLPC")
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

> ---
>   drivers/gpu/drm/i915/gt/intel_rps.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index 3489f5f0cac1..e1a198bbd135 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -1969,8 +1969,14 @@ u32 intel_rps_read_actual_frequency(struct intel_rps *rps)
>   u32 intel_rps_read_punit_req(struct intel_rps *rps)
>   {
>   	struct intel_uncore *uncore = rps_to_uncore(rps);
> +	struct intel_runtime_pm *rpm = rps_to_uncore(rps)->rpm;
> +	intel_wakeref_t wakeref;
> +	u32 freq = 0;
>   
> -	return intel_uncore_read(uncore, GEN6_RPNSWREQ);
> +	with_intel_runtime_pm_if_in_use(rpm, wakeref)
> +		freq = intel_uncore_read(uncore, GEN6_RPNSWREQ);
> +
> +	return freq;
>   }
>   
>   static u32 intel_rps_get_req(u32 pureq)
> 
