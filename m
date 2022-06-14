Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F4754B0A6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 14:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B4010E5A7;
	Tue, 14 Jun 2022 12:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFF010E131;
 Tue, 14 Jun 2022 12:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655210049; x=1686746049;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vyleMAMcAkcU500Rv3CEC92mOLYJuP6C4HKbgZUA4Dg=;
 b=a/ohay1k4kvDgVtQ0uOH7L8X4dLX4jhG+yPFRbiSqwKJwTal2tdjFYEj
 f/cX5vPeM+V6BnRE/bUSzQNCvFxeWVdpowZrzZrx1Q3ZVpLejsqxn1EJW
 ZWw8s+OICU3/VICSpGNq4g8VAacDAEIfI03m4zR1hum8JL4N5VbIH6vm3
 mDjpetyFlrQPYrOvwvuu7AYNQfSTnfWx0V/NdmBgBBlhFl4weNkuSAuAW
 WmZakxiU1ft6RtuT9o3a8V1iz6/6oxIuzHfsrptCTT2lVyGjut2E2dSKj
 WGsoKFVe0CXJ+Ge1KGHGn7isTVnOZUDh6gsrXBEHoqS+LYuZBe4mOCUxN A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="277386875"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="277386875"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 05:34:08 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="830397014"
Received: from nncongwa-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.32.178])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 05:34:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/dp/mst: Read the extended DPCD capabilities during
 system resume
In-Reply-To: <87sfo7xw5g.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220614094537.885472-1-imre.deak@intel.com>
 <87sfo7xw5g.fsf@intel.com>
Date: Tue, 14 Jun 2022 15:34:05 +0300
Message-ID: <87pmjbxw3m.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Jun 2022, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Tue, 14 Jun 2022, Imre Deak <imre.deak@intel.com> wrote:
>> The WD22TB4 Thunderbolt dock at least will revert its DP_MAX_LINK_RATE
>> from HBR3 to HBR2 after system suspend/resume if the DP_DP13_DPCD_REV
>> registers are not read subsequently also as required.
>
> Does it actually change the behaviour depending on whether the dpcd is
> read or not, or is this just about the resume path overwriting mgr->dpcd
> with stuff from DP_DPCD_REV?
>
> drm_dp_mst_topology_mgr_set_mst() does use drm_dp_read_dpcd_caps() for
> reading the caps, which would normally set mgr->dpcd from
> DP_DP13_DPCD_REV.

Oh,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

on the changes, I'm just wondering about the statement in the commit
message.



>
> BR,
> Jani.
>
>>
>> Fix this by reading DP_DP13_DPCD_REV registers as well, matching what is
>> done during connector detection. While at it also fix up the same call
>> in drm_dp_mst_dump_topology().
>>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5292
>> Signed-off-by: Imre Deak <imre.deak@intel.com>
>> ---
>>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> index 67b3b9697da7f..18f2b6075b780 100644
>> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> @@ -3860,9 +3860,7 @@ int drm_dp_mst_topology_mgr_resume(struct drm_dp_mst_topology_mgr *mgr,
>>  	if (!mgr->mst_primary)
>>  		goto out_fail;
>>  
>> -	ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, mgr->dpcd,
>> -			       DP_RECEIVER_CAP_SIZE);
>> -	if (ret != DP_RECEIVER_CAP_SIZE) {
>> +	if (drm_dp_read_dpcd_caps(mgr->aux, mgr->dpcd) < 0) {
>>  		drm_dbg_kms(mgr->dev, "dpcd read failed - undocked during suspend?\n");
>>  		goto out_fail;
>>  	}
>> @@ -4911,8 +4909,7 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
>>  		u8 buf[DP_PAYLOAD_TABLE_SIZE];
>>  		int ret;
>>  
>> -		ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, buf, DP_RECEIVER_CAP_SIZE);
>> -		if (ret) {
>> +		if (drm_dp_read_dpcd_caps(mgr->aux, buf) < 0) {
>>  			seq_printf(m, "dpcd read failed\n");
>>  			goto out;
>>  		}

-- 
Jani Nikula, Intel Open Source Graphics Center
