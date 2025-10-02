Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2186EBB2B3B
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 09:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CFA10E79E;
	Thu,  2 Oct 2025 07:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bwFJQzMQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7C610E041;
 Thu,  2 Oct 2025 07:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759390517; x=1790926517;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9hU4I5yXFIJ4a1qFMKUAKroZbsUs+Vvx5ClpVpLmR4U=;
 b=bwFJQzMQwWnDWHB0XwBDmSTAVLdA/JWpO0uC9H/1Dm4gYZV3DbtjvMy2
 eOKkqcikmYPO765MQKERa8wFTU43GptIK5gqCK46P6g9ZQnNKJN8LU30R
 JBFyHusPmaddSimJNRtOIoD1ir7gUZ+FSm5CfcS7m7ckzVFOCYQ0awPEA
 VrxyNn7Hys8Rz6V1VKGc7xByGaP+yIhQ2T31fdhNPw8sHSX1RsNQS/QsW
 5OfNTO1NcU/8hfeLgAvEg+50BRbnVpC3/1YFb+/6IaHnFQz5FHH9ZthdJ
 MiyuE3ReY2o8mymQ1UnKqEjy6BjkrR2tjf1hcLFCHMXWWAmwGmY9PX7yq w==;
X-CSE-ConnectionGUID: gT6rqqpVQ1Ojz6yN564z0w==
X-CSE-MsgGUID: NWDmjeFZR0Ou0agMgN33BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="73025451"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="73025451"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 00:35:16 -0700
X-CSE-ConnectionGUID: riUZHC1ETX+I4o1YAK6f+w==
X-CSE-MsgGUID: YoO7nr63TqqsVNW3IUMTdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="216098460"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.192])
 ([10.245.245.192])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 00:35:13 -0700
Message-ID: <b07550a8-9e68-4bb9-bae8-570bc04bff7c@linux.intel.com>
Date: Thu, 2 Oct 2025 09:35:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] drm/i915/dp: Work around a DSC pixel throughput
 issue
To: imre.deak@intel.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>
Cc: Vidya Srinivas <vidya.srinivas@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20250930182450.563016-1-imre.deak@intel.com>
 <aN0xDp1AN85zzznP@ideak-desk>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <aN0xDp1AN85zzznP@ideak-desk>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

Sure, for both:

Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Den 2025-10-01 kl. 15:47, skrev Imre Deak:
> Hi Thomas, Maarten, Maxim,
> 
> could you ack merging this patchset via intel trees? Patch 1 and 2 has
> changes in drm_dp_helper.c, but it would be good to fix the cases on
> Intel HW where the affected docking stations are used.
> 
> Thanks,
> Imre
> 
> On Tue, Sep 30, 2025 at 09:24:44PM +0300, Imre Deak wrote:
>> This is v6 of [1], removing the unreachable default switch case in
>> drm_dp_dsc_sink_max_slice_throughput() and adding the R-b and T-b tags
>> from Ville and Swati.
>>
>> Reported-by: Vidya Srinivas <vidya.srinivas@intel.com>
>> Reported-by: Swati Sharma <swati2.sharma@intel.com>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: dri-devel@lists.freedesktop.org
>>
>> [1] https://lore.kernel.org/all/20250926211236.474043-1-imre.deak@intel.com
>>
>> Imre Deak (6):
>>   drm/dp: Add quirk for Synaptics DSC throughput link-bpp limit
>>   drm/dp: Add helpers to query the branch DSC max throughput/line-width
>>   drm/i915/dp: Calculate DSC slice count based on per-slice peak
>>     throughput
>>   drm/i915/dp: Pass DPCD device descriptor to
>>     intel_dp_get_dsc_sink_cap()
>>   drm/i915/dp: Verify branch devices' overall pixel throughput/line
>>     width
>>   drm/i915/dp: Handle Synaptics DSC throughput link-bpp quirk
>>
>>  drivers/gpu/drm/display/drm_dp_helper.c       | 156 ++++++++++++++++++
>>  .../drm/i915/display/intel_display_types.h    |   9 +
>>  drivers/gpu/drm/i915/display/intel_dp.c       | 146 ++++++++++++++--
>>  drivers/gpu/drm/i915/display/intel_dp.h       |   5 +-
>>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |   9 +-
>>  include/drm/display/drm_dp.h                  |   3 +
>>  include/drm/display/drm_dp_helper.h           |  14 ++
>>  7 files changed, 328 insertions(+), 14 deletions(-)
>>
>> -- 
>> 2.49.1
>>

