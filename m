Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C3D78D5B9
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 14:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E2F10E507;
	Wed, 30 Aug 2023 12:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3883C10E507;
 Wed, 30 Aug 2023 12:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693396863; x=1724932863;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=0UhcPUZUKNa3cNMELTl/0FRYugnT31wZz/nXS31YcmM=;
 b=FJZd5cYaeTwBanyO9SjtMbsIWKrYdx5IoxDfxXV+wg6K0l2+IFRfQSoC
 lCidOtRQM622lkCjACASpGHst6QsZJTRJClFu4ogztDaeguIl9Pnp6YWh
 yAmRmqCdC+V3YLIyNW6d2mw1A0Haye3vcOFvoFXDqjAmirNUD6vAkDQuz
 +DCBJB7bDlguFDKyLw94gTXYjrNGu/k0jzac9Zunkh94oLRK7pP8cKG9Z
 ztUI3awQRaxxps5sq4lI3YnsHQSOcvD2Kmy+Zzj97kTb0kIx2s0uXxsW1
 V/GtEERLYAMXN5FoFBJJjYpqTCLLyxkq0QrZKm4sDCQljI+aQqfBkQmOX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="379371821"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="379371821"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:01:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="739074027"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="739074027"
Received: from ziemtocx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.251])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:00:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>, Ankit Nautiyal
 <ankit.k.nautiyal@intel.com>
Subject: Re: [Intel-gfx] [1/2] drm/display/dp: Assume 8 bpc support when DSC
 is supported
In-Reply-To: <ZO71Dbu1NvY8qYup@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230824125121.840298-2-ankit.k.nautiyal@intel.com>
 <ZO71Dbu1NvY8qYup@intel.com>
Date: Wed, 30 Aug 2023 15:00:56 +0300
Message-ID: <87zg28zqmf.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Aug 2023, "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com> wrote:
> On Thu, Aug 24, 2023 at 06:21:20PM +0530, Ankit Nautiyal wrote:
>> As per DP v1.4, a DP DSC Sink device shall support 8bpc in DPCD 6Ah.
>> Apparently some panels that do support DSC, are not setting the bit for
>> 8bpc.
>> 
>> So always assume 8bpc support by DSC decoder, when DSC is claimed to be
>> supported.
>> 
>> v2: Use helper to get check dsc support. (Ankit)
>> v3: Fix styling and other typos. (Jani)
>> 
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>
> Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

Pushed both to drm-intel-next, with Maxime's ack, thanks for the patches
and review.

BR,
Jani.

>
>> ---
>>  drivers/gpu/drm/display/drm_dp_helper.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
>> index e6a78fd32380..8a1b64c57dfd 100644
>> --- a/drivers/gpu/drm/display/drm_dp_helper.c
>> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
>> @@ -2449,12 +2449,16 @@ int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_S
>>  	int num_bpc = 0;
>>  	u8 color_depth = dsc_dpcd[DP_DSC_DEC_COLOR_DEPTH_CAP - DP_DSC_SUPPORT];
>>  
>> +	if (!drm_dp_sink_supports_dsc(dsc_dpcd))
>> +		return 0;
>> +
>>  	if (color_depth & DP_DSC_12_BPC)
>>  		dsc_bpc[num_bpc++] = 12;
>>  	if (color_depth & DP_DSC_10_BPC)
>>  		dsc_bpc[num_bpc++] = 10;
>> -	if (color_depth & DP_DSC_8_BPC)
>> -		dsc_bpc[num_bpc++] = 8;
>> +
>> +	/* A DP DSC Sink device shall support 8 bpc. */
>> +	dsc_bpc[num_bpc++] = 8;
>>  
>>  	return num_bpc;
>>  }

-- 
Jani Nikula, Intel Open Source Graphics Center
