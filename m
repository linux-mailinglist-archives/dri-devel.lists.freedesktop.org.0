Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C0E8C0FCC
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 14:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7CA10E3C7;
	Thu,  9 May 2024 12:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="BAfLIvyJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F0010E297;
 Thu,  9 May 2024 12:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=gpCe6LjXBhGLTjURAG6pCgVHAv6LRa6xLP8t9gn2lQM=;
 t=1715258603; x=1715690603; b=BAfLIvyJZIelKILeo1AlFfcn0/2MFvxfOFyN923yblHfnFl
 2Nq9mIBfhUGsa7NkmPhRpR6gNmMZIk2Guv5X7/39h9hJKrJu4V+B5o+hF7ZtKzoP8J93z7Q4lxrW3
 xli3T6d4unsKDvxF6E1FI34oepdgdvHm4OxqIk1kDMrmEmpWdTo2q9jJ7gwNEWoQoq8+SyZqwex5l
 uGgJph4o4Uu6GLRO6MGJkVuMtbSVDA2Rsf0FNNvcfXvU8uKmV+Dp6r7YwX2BjHvzHPqhjMq4AAhA0
 A0TlS4gDDSyJucb6M1XNWcD0GzzRuKeOl18VDC4qqXfEWVhBMKJNjRRNsTLz2lFg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1s537E-0007dX-TB; Thu, 09 May 2024 14:43:16 +0200
Message-ID: <41b87510-7abf-47e8-b28a-9ccc91bbd3c1@leemhuis.info>
Date: Thu, 9 May 2024 14:43:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mst: Fix NULL pointer dereference at
 drm_dp_add_payload_part2
To: Harry Wentland <harry.wentland@amd.com>, Wayne Lin <Wayne.Lin@amd.com>
Cc: lyude@redhat.com, imre.deak@intel.com,
 =?UTF-8?Q?Leon_Wei=C3=9F?= <leon.weiss@ruhr-uni-bochum.de>,
 stable@vger.kernel.org, regressions@lists.linux.dev,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20240307062957.2323620-1-Wayne.Lin@amd.com>
 <0847dc03-c7db-47d7-998b-bda2e82ed442@amd.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <0847dc03-c7db-47d7-998b-bda2e82ed442@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1715258603;
 8108d75c; 
X-HE-SMSGID: 1s537E-0007dX-TB
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18.04.24 21:43, Harry Wentland wrote:
> On 2024-03-07 01:29, Wayne Lin wrote:
>> [Why]
>> Commit:
>> - commit 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload allocation/removement")
>> accidently overwrite the commit
>> - commit 54d217406afe ("drm: use mgr->dev in drm_dbg_kms in drm_dp_add_payload_part2")
>> which cause regression.
>>
>> [How]
>> Recover the original NULL fix and remove the unnecessary input parameter 'state' for
>> drm_dp_add_payload_part2().
>>
>> Fixes: 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload allocation/removement")
>> Reported-by: Leon Weiß <leon.weiss@ruhr-uni-bochum.de>
>> Link: https://lore.kernel.org/r/38c253ea42072cc825dc969ac4e6b9b600371cc8.camel@ruhr-uni-bochum.de/
>> Cc: lyude@redhat.com
>> Cc: imre.deak@intel.com
>> Cc: stable@vger.kernel.org
>> Cc: regressions@lists.linux.dev
>> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> 
> I haven't been deep in MST code in a while but this all looks
> pretty straightforward and good.
> 
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Hmmm, that was three weeks ago, but it seems since then nothing happened
to fix the linked regression through this or some other patch. Is there
a reason? The build failure report from the CI maybe?

Wayne Lin, do you know what's up?

Ciao, Thorsten

>> ---
>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 +-
>>  drivers/gpu/drm/display/drm_dp_mst_topology.c             | 4 +---
>>  drivers/gpu/drm/i915/display/intel_dp_mst.c               | 2 +-
>>  drivers/gpu/drm/nouveau/dispnv50/disp.c                   | 2 +-
>>  include/drm/display/drm_dp_mst_helper.h                   | 1 -
>>  5 files changed, 4 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> index c27063305a13..2c36f3d00ca2 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> @@ -363,7 +363,7 @@ void dm_helpers_dp_mst_send_payload_allocation(
>>  	mst_state = to_drm_dp_mst_topology_state(mst_mgr->base.state);
>>  	new_payload = drm_atomic_get_mst_payload_state(mst_state, aconnector->mst_output_port);
>>  
>> -	ret = drm_dp_add_payload_part2(mst_mgr, mst_state->base.state, new_payload);
>> +	ret = drm_dp_add_payload_part2(mst_mgr, new_payload);
>>  
>>  	if (ret) {
>>  		amdgpu_dm_set_mst_status(&aconnector->mst_status,
>> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> index 03d528209426..95fd18f24e94 100644
>> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> @@ -3421,7 +3421,6 @@ EXPORT_SYMBOL(drm_dp_remove_payload_part2);
>>  /**
>>   * drm_dp_add_payload_part2() - Execute payload update part 2
>>   * @mgr: Manager to use.
>> - * @state: The global atomic state
>>   * @payload: The payload to update
>>   *
>>   * If @payload was successfully assigned a starting time slot by drm_dp_add_payload_part1(), this
>> @@ -3430,14 +3429,13 @@ EXPORT_SYMBOL(drm_dp_remove_payload_part2);
>>   * Returns: 0 on success, negative error code on failure.
>>   */
>>  int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
>> -			     struct drm_atomic_state *state,
>>  			     struct drm_dp_mst_atomic_payload *payload)
>>  {
>>  	int ret = 0;
>>  
>>  	/* Skip failed payloads */
>>  	if (payload->payload_allocation_status != DRM_DP_MST_PAYLOAD_ALLOCATION_DFP) {
>> -		drm_dbg_kms(state->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
>> +		drm_dbg_kms(mgr->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
>>  			    payload->port->connector->name);
>>  		return -EIO;
>>  	}
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> index 53aec023ce92..2fba66aec038 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> @@ -1160,7 +1160,7 @@ static void intel_mst_enable_dp(struct intel_atomic_state *state,
>>  	if (first_mst_stream)
>>  		intel_ddi_wait_for_fec_status(encoder, pipe_config, true);
>>  
>> -	drm_dp_add_payload_part2(&intel_dp->mst_mgr, &state->base,
>> +	drm_dp_add_payload_part2(&intel_dp->mst_mgr,
>>  				 drm_atomic_get_mst_payload_state(mst_state, connector->port));
>>  
>>  	if (DISPLAY_VER(dev_priv) >= 12)
>> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
>> index 0c3d88ad0b0e..88728a0b2c25 100644
>> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
>> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
>> @@ -915,7 +915,7 @@ nv50_msto_cleanup(struct drm_atomic_state *state,
>>  		msto->disabled = false;
>>  		drm_dp_remove_payload_part2(mgr, new_mst_state, old_payload, new_payload);
>>  	} else if (msto->enabled) {
>> -		drm_dp_add_payload_part2(mgr, state, new_payload);
>> +		drm_dp_add_payload_part2(mgr, new_payload);
>>  		msto->enabled = false;
>>  	}
>>  }
>> diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
>> index 9b19d8bd520a..6c9145abc7e2 100644
>> --- a/include/drm/display/drm_dp_mst_helper.h
>> +++ b/include/drm/display/drm_dp_mst_helper.h
>> @@ -851,7 +851,6 @@ int drm_dp_add_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
>>  			     struct drm_dp_mst_topology_state *mst_state,
>>  			     struct drm_dp_mst_atomic_payload *payload);
>>  int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
>> -			     struct drm_atomic_state *state,
>>  			     struct drm_dp_mst_atomic_payload *payload);
>>  void drm_dp_remove_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
>>  				 struct drm_dp_mst_topology_state *mst_state,
> 
> 
> 
