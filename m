Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA354C58AF4
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:24:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA20010E8A7;
	Thu, 13 Nov 2025 16:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OL/lNvXN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D2510E1B6;
 Thu, 13 Nov 2025 16:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763051079; x=1794587079;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Lomghik68bTMtU36RIFLYy58d0Veyew3FMWrimKrqlg=;
 b=OL/lNvXN6MbBKZe3AHj2J16WWLrFJRLp72c7Z41Zrmnqnlmf+fkklrGD
 rr2tXVtj8tjz7pPdPkfTVpeYMBCXqmgtyynaBa/eCYpwqAe8TOiDZgGWg
 yuxsK/ylwO0dX7u210GJK8aghtaycRTECxHYiR9llDtKfLbPCoipVwaVT
 K0+0VNdDn4DCnaEmBodCCbTRTvPQrZ3J83587XdOLry3fR2cG1pZxnF8G
 HYgdX8BgkNB9xcPf9D/IhyTfQCQrKpk5w34Kx11DYYYscEyPXqBPWd+O6
 u5oPiy03GR1tNjPTaBtWkn4dv6aqk5pNyXYnWZ8otkgUb01+cwlGhQa5v w==;
X-CSE-ConnectionGUID: TQu5uyVpRbSkm9kLwrY2Tg==
X-CSE-MsgGUID: lN1pJFLkT2OwmgkJhmXBXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="69001973"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="69001973"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:24:39 -0800
X-CSE-ConnectionGUID: c/TEMq/gQTKcPwy9mYC1tA==
X-CSE-MsgGUID: KKS4taUlRfqyhDu2SRVoBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="212940695"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.135])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:24:36 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: imre.deak@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 arun.r.murthy@intel.com
Subject: Re: [PATCH] drm/display/dp_mst: Add protection against 0 vcpi
In-Reply-To: <aRWU-ovOdSRUQI-B@ideak-desk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251113043918.716367-1-suraj.kandpal@intel.com>
 <aRWU-ovOdSRUQI-B@ideak-desk>
Date: Thu, 13 Nov 2025 18:24:33 +0200
Message-ID: <689e22d69f7ad9be4f4a78b5194d8c4965be8ca8@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 13 Nov 2025, Imre Deak <imre.deak@intel.com> wrote:
> On Thu, Nov 13, 2025 at 10:09:19AM +0530, Suraj Kandpal wrote:
>> When releasing a timeslot there is a slight chance we may end up
>> with the wrong payload mask due to overflow if the delayed_destroy_work
>> ends up coming into play after a DP 2.1 monitor gets disconnected
>> which causes vcpi to become 0 then we try to make the payload =
>> ~BIT(vcpi - 1) which is a negative shift.
>> 
>> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> ---
>>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> index 64e5c176d5cc..3cf1eafcfcb5 100644
>> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> @@ -4531,6 +4531,7 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
>>  	struct drm_dp_mst_atomic_payload *payload;
>>  	struct drm_connector_state *old_conn_state, *new_conn_state;
>>  	bool update_payload = true;
>> +	int bit;
>>  
>>  	old_conn_state = drm_atomic_get_old_connector_state(state, port->connector);
>>  	if (!old_conn_state->crtc)
>> @@ -4572,7 +4573,8 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
>>  	if (!payload->delete) {
>>  		payload->pbn = 0;
>>  		payload->delete = true;
>> -		topology_state->payload_mask &= ~BIT(payload->vcpi - 1);
>> +		bit = payload->vcpi ? payload->vcpi - 1 : 0;
>> +		topology_state->payload_mask &= ~BIT(bit);
>
> This looks wrong, clearing the bit for an unrelated payload.

Agreed.

The logs have, among other things,

<7> [515.138211] xe 0000:03:00.0: [drm:intel_dp_sink_set_dsc_decompression [xe]] Failed to enable sink decompression state

<7> [515.193484] xe 0000:03:00.0: [drm:drm_dp_add_payload_part1 [drm_display_helper]] VCPI 0 for port ffff888126ce9000 not in topology, not creating a payload to remote

<7> [515.194671] xe 0000:03:00.0: [drm:drm_dp_add_payload_part2 [drm_display_helper]] Part 1 of payload creation for DP-5 failed, skipping part 2

<7> [515.347331] xe 0000:03:00.0: [drm:drm_dp_remove_payload_part1 [drm_display_helper]] Payload for VCPI 0 not in topology, not sending remove

So it's no wonder the port's not in topology and everything fails. We
obviously need to skip payload_mask updates when the VCPI is 0, but
that's just a symptom of other stuff going wrong first. Perhaps we could
do with some earlier error handling too?

BR,
Jani.


>
>>  	}
>>  
>>  	return 0;
>> -- 
>> 2.34.1
>> 

-- 
Jani Nikula, Intel
