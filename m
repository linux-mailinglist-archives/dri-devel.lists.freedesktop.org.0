Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D832D695F30
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 10:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB3D910E848;
	Tue, 14 Feb 2023 09:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602B510E842;
 Tue, 14 Feb 2023 09:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676366931; x=1707902931;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ed8DSrWc/gNPgXx4flIUe872XXWL0cOf25eQiy1lX6g=;
 b=GV3bdw0OpvjBeGLs5RA4Bgn2dCsRFrmFN+KClF67HlctXmgpn5Xmfxsn
 4L3dKibVqbjltuf4V1f4t58d/M1KEc30QpzxVZYVbFrUTrdDdjCl29sf8
 6UIpPKpX1OtgHpRJOTaJcp0H7oh5X4Vtq1FYvoGoiczf1Arq6BiCje9dd
 lSVLgGqKY8H6R5hZW9z00COm1hrzDehaQDFBU3wPWPY+BG1paBlj74aKS
 q0esryYnNAE1v/DNl8EqB+IfqCQ2pop4TyPn7xun9HDEe3/RvcuzT/Rfa
 G+TpEiWP99MUjJTUjD2bfHbZA5vZ10dSrNvq5ynU1L420VRHb1Sz0377Q w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="333256800"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="333256800"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 01:28:50 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="737830889"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="737830889"
Received: from skalyan-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.52.13])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 01:28:48 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCHv3 2/2] i915/display/dp: SDP CRC16 for 128b132b link layer
In-Reply-To: <87edqstx4c.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230120061600.1451088-1-arun.r.murthy@intel.com>
 <20230207052657.2917314-1-arun.r.murthy@intel.com>
 <20230207052657.2917314-3-arun.r.murthy@intel.com>
 <87edqstx4c.fsf@intel.com>
Date: Tue, 14 Feb 2023 11:28:46 +0200
Message-ID: <87bklwtx2p.fsf@intel.com>
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
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Feb 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> On Tue, 07 Feb 2023, Arun R Murthy <arun.r.murthy@intel.com> wrote:
>> Enable SDP error detection configuration, this will set CRC16 in
>> 128b/132b link layer.
>> For Display version 13 a hardware bit31 in register VIDEO_DIP_CTL is
>> added to enable/disable SDP CRC applicable for DP2.0 only, but the
>> default value of this bit will enable CRC16 in 128b/132b hence
>> skipping this write.
>> Corrective actions on SDP corruption is yet to be defined.
>>
>> v2: Moved the CRC enable to link training init(Jani N)
>> v3: Moved crc enable to ddi pre enable <Jani N>
>
> It's still in intel_dp_start_link_train()...?

Also, please post new versions as new threads instead of in-reply-to. I
don't think patchwork/CI picked this up at all, for example.

BR,
Jani

>
> BR,
> Jani.
>
>
>>
>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>> ---
>>  .../gpu/drm/i915/display/intel_dp_link_training.c    | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
>> index 3d3efcf02011..7064e465423b 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
>> @@ -1453,4 +1453,16 @@ void intel_dp_start_link_train(struct intel_dp *intel_dp,
>>  
>>  	if (!passed)
>>  		intel_dp_schedule_fallback_link_training(intel_dp, crtc_state);
>> +
>> +	/* DP v2.0 SCR on SDP CRC16 for 128b/132b Link Layer */
>> +	if (intel_dp_is_uhbr(crtc_state) && passed)
>> +		drm_dp_dpcd_writeb(&intel_dp->aux,
>> +				   DP_SDP_ERROR_DETECTION_CONFIGURATION,
>> +				   DP_SDP_CRC16_128B132B_EN);
>> +		/*
>> +		 * VIDEO_DIP_CTL register bit 31 should be set to '0' to not
>> +		 * disable SDP CRC. This is applicable for Display version 13.
>> +		 * Default value of bit 31 is '0' hence discarding the write
>> +		 */
>> +		/* TODO: Corrective actions on SDP corruption yet to be defined */
>>  }

-- 
Jani Nikula, Intel Open Source Graphics Center
