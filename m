Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1AD8AA316
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 21:44:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36E1113F69;
	Thu, 18 Apr 2024 19:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qEYkmnur";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D61113F68;
 Thu, 18 Apr 2024 19:43:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EG3TCRqjdwF+PY5hRI9+vLpN6XA6/L/CgGJmmBkKEu8gSTOK4hfrjduYjEAVAFUZcKdBQUAxaV+MRHm/PkX1Ob/sEM3yCmnpLTy4iv2p3iR6OueYIojJ3CyAt0ybclRrjqCxFm1MIM+jTAwgnmgBhtDZDCmj5OSajCBHqD6ET910zdTUsYtt8LcRh64TZdqTMrTtFLFBZa4cNPynZaAhl3s51cA2oHOskict2YlBMylBzFf48VkvwG4NNStpUd2Q9nWdKwRN1hEnmJqeJcECo+VGf3W+oKlIeLkqtYE4GpLpfqv+wJvObPYgdld4LOwKSxkcg5JXXeu+JrBYZxIpLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3dU7MV7NIAPioE9LeDvqOQCDHJyG5Y9hSOHMXkoH+4=;
 b=HmeeG4uSHN3fU0H1lcVbvxSMzAK5Rwsb9y0bN3FmAVrlfCPesc3jutJLawNL8t03IOqUoYAF4UX2QYcragTcpR1Zo0GjoOgA8JomDlIfGVzt3II+fxuf/DvFWXyyVmHI+ZYWdSBnwzKzI7Rnrfu/zEaXFzTSLqL5uJFTzt7fXeh8uq4i6hfuVE6OcMPJfTCiMU1vz2KmRyLBgFN5LbzwXFB9YFCqUuWMG2X5LDHg6S+THDIxxx9qjRIK345bHgK2ck6ImdtUW2WHm95RGL+md4rNJlqbHWAshwiDHY1pISc3ge7ZpSqQFcBmz+Yids3sJMnY2+e2+vBprIprJviHMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3dU7MV7NIAPioE9LeDvqOQCDHJyG5Y9hSOHMXkoH+4=;
 b=qEYkmnurs59tooEzp2FH6DYWb5dwCZOPW6mkZuz52g50uJakeSZSNvUM1dKWqHVmWUhIF9jLBMMC7yD7MoZDJqN3MOSKDR+QcarEInPLHMyfizvmXgvzQdKdR03BLwkuz6osOSFSQTjo5kd7WsJpF7TSlaeHxTmI0If1JAPjCwA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM4PR12MB5940.namprd12.prod.outlook.com (2603:10b6:8:6b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 19:43:54 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%5]) with mapi id 15.20.7452.049; Thu, 18 Apr 2024
 19:43:54 +0000
Message-ID: <0847dc03-c7db-47d7-998b-bda2e82ed442@amd.com>
Date: Thu, 18 Apr 2024 15:43:50 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mst: Fix NULL pointer dereference at
 drm_dp_add_payload_part2
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: lyude@redhat.com, imre.deak@intel.com,
 =?UTF-8?Q?Leon_Wei=C3=9F?= <leon.weiss@ruhr-uni-bochum.de>,
 stable@vger.kernel.org, regressions@lists.linux.dev
References: <20240307062957.2323620-1-Wayne.Lin@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20240307062957.2323620-1-Wayne.Lin@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::21) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM4PR12MB5940:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca3cebe-8704-4504-0f7a-08dc5fdfe199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KnBAlGFELnMU//Nx9vnChoRNaplOi3q/dhCmIcUyW5Gr/Y6V4mGaEabLTQQ5HkX5C53dUrv5xYNulrxWxrEMs+gaKn8ZMtiJgEqZWQZqVRopLa8nIOm0aaV3xw1aZtfUaIqEWKy1ciGa33Wf5Z1LD3CnWo6gI1Vp8FGRZWMdIaj072YM8gPjvnT2/Jcux6r5KnfyMfwywm4bwriqZ/+KDXNNYR6zV1DuuqBfcjYJQs+xO+ggQ8CML0Ruim2wYd2r1fpWXKa+s0CShLNr0tFgNlS1v7aD/qmaS6Ud3zJDXbEfZ9it/dIwQJn9jLFjcuhAIOTXyrj+vPUyA0C/meIyeJ8KHA4jgrE7qxzVJQkpg8KlD/ia8BWJxxtvLbIw4IQCRp1XvH4XQXnF19dB51ufjgE3xHckEVCFE0tNBKdQf+gt9v2aSAC3tbYxp/rnO7kv6s1upfgvfHd5yoWnyydUHBN43ThkUC6nYd7CKmagQKslmpul9UF3lnhEXwgGUxEOU6BaO4bUC6eQUi4nF6dIA739z+dQoVVQ5R9Q6ePhhTBXHVygLUjf3KVWMUnc7jpuvmcbuYLTNqz8o9CbSwu69KZD6tRASB/hgkzqQu3SxBrv+//RcGwCqTEPC6gJ7THJdGvmake5ERr5lLb+i9A2Sm4kjKT/R5DUXKbHhiXE0cU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzlrcnJnQXIvSW8rVVByN1pFQ0ppTlFWK2xuZUVUVFVmOVZ2YXA5MDFjNHRE?=
 =?utf-8?B?OTNLd2ZmVFAxcHpaNy9rYU5xWkRBRjBwTlZacGorTWtycU9BQ0hPUTRRa0Q2?=
 =?utf-8?B?NU8vZWtNOEZYWWJhQ0lUS3Z2VEEvcTBzSTVINkFva2p4aDJHUm94WEpHbTZO?=
 =?utf-8?B?RHBTUnAwZnF0R2p4NDMxN2toWXZrMWFHWkQwc2d2VjBFNlZ0dE9LSXNoL3pn?=
 =?utf-8?B?RFZJaEpxMzE5am9teXVHTVUwL1J1aUNSOEJ4QXBhSUMxZlNpWWlNNTh3VDQ0?=
 =?utf-8?B?Mk9XSFB5VmczU1NnVldjU1NDUlR0SDNrTEJCN1VjYlR1ckhQMzk0cW51a2hD?=
 =?utf-8?B?NkhHYTNzWDRBeWpIa0pIZHNHZ1AralU0ekpzTVVPK0hZc2NzUWNxY3h3Szk2?=
 =?utf-8?B?dmdMTk5zalVzZGJiSDlRTmxnUkVoa3pUcEV2TFFXckZpR1lxcUZCci9ZVnhK?=
 =?utf-8?B?cmhDUkxXc3ZCZGdDSXFZdmhCa0NwcHpPd2ViVU9YMXhoeFNCbklhYkVPSzN6?=
 =?utf-8?B?ZEdXZmVNWGlLYWVCRWRob2I5ejd2QXRTNnJZcU1LTDlFRGJWVC9wcnlHTmFJ?=
 =?utf-8?B?YmhzaUlsQXdFdW1XdnBsQU5aMSsvbFgwbW42aDl4SEFtaVJoQkEwOG9nVGZH?=
 =?utf-8?B?b3c3a3FycnpWWXMzaXZjQkwra1pQR00vTyswWU8wZ2RmQXhIOU9JYlRKL0Fn?=
 =?utf-8?B?Q0t2TUxLRG1hRWNjUjcwYVY3SXdxU2xpcURiQlVJT3BMTnNxL04zTW9Md2Zi?=
 =?utf-8?B?b0ZqTXlUczBsbjM3OGNMK3g2S1lNUWprSDQ5bkFCR1dwaGpLeW1PMkVTZm1O?=
 =?utf-8?B?T1pvS0ZGQXpzZTdIdkJFMEFmL1Y0eTVUSTMxbmFzV0d6MGZRQ0lIZE10aXR1?=
 =?utf-8?B?RDRENUVZbVZpQVFUWkF4c1QvL0s0Z1FKeFgwZmppdVFFT2RIamlod3hOWHph?=
 =?utf-8?B?ZDIySEVoUk53SnBlRGtWcEY2NTY1RW9rczh6RTNHNmQyUnJkbk5CbFNEa2kr?=
 =?utf-8?B?N1ZQQ1lYdllwVGRLVjZpeTljZmk1NXpvdVBNOXFSZzVZa21VRWZneDJNZFZs?=
 =?utf-8?B?QSs0T3FDRlZieHNuMXRycnppTXg0dE1zRGJPOGlod2FiNzB2QldNTXAxbXhv?=
 =?utf-8?B?emRVL0hDamQvZk5ZT3lnaUxRenpCdWsrdjRabXc4SXRZd1ZSTTR0d2pObHU4?=
 =?utf-8?B?Sk1ENTZ4MzJ1VWtiZGl0VVVrRStUYW1wd2hYdHZTNnRXTXo5UnNEVW1XUnRm?=
 =?utf-8?B?a2cwVlVrSkhUNE5vTUhWaTBlTkRmYUNyOW45OWZnVm1UTXdvdG9wNXdFcXo3?=
 =?utf-8?B?MzQrQ3FZOEZ3Z3RCdVdpb3ZYM3EwMmdxZSs5MHVSWVJWZDE1UHZRQmpxeXNi?=
 =?utf-8?B?RlZwOGVwWmlWWkU3SHEvUE9RQVdoQ3J5TGVUV1o2MThYSjdHay93aFdkbzUz?=
 =?utf-8?B?d01mU3JoWVVnOHFXajZBRW52WC91bUp4dDQzbUV2YXB6OEo5aFVGWUpROC84?=
 =?utf-8?B?Z3VLOVZjZi9oajFSUTI2T3lMb2EyT3dDSVBhdmVid0tlTlNqQXhIcWRyWnIv?=
 =?utf-8?B?Nlc3bTFJTnVBT2NqWnVYOFBUOEZITEdCcGgzcDhrUU5jaFJkVEhaV25aT3Nu?=
 =?utf-8?B?MGdwWTVCV3ZtbjFjQllWK3c4UjZudXJRanhwN3pMTzNlMUxsY2dCOEhDbjEz?=
 =?utf-8?B?MXk3QUQ0T3ZDM1VXSnpkYkR6bjUwYnhydTRFRmdzV1dlMnF3NTh6T3NIM3dm?=
 =?utf-8?B?YlF5T1lZOWIrR08yZndZb1BtUjZBUll0S2w3b2ZGY092MFlzRDZMamtXVTZZ?=
 =?utf-8?B?dHNtN3lKZ3ZlbnlMZk0yc0xOaEx5QlZpemFLTncwdDJoZmx3NlNyYndoNUtx?=
 =?utf-8?B?T0NodzlxWjlESFdNaGFLbDVEUE54SmRUUEJ3WEhjeVY4OHBTdTY1RUNUanFk?=
 =?utf-8?B?OTZwdmkyNEV3YUlrQkFNR014d0wyWWxZNHNHSEkzeEhYdFM0WWVoUGxmWTBW?=
 =?utf-8?B?Y1Y2QmlOeFBIWEt1MkFlekNjc25DRGRGL3diSmVwNUR1bi9RNndyd0ZKMTJw?=
 =?utf-8?B?M01ibk54dXI3RmNEdmFwUkJmdzlUT1FNTU83TEd5dmd3c1hNcWtiZnY4eExP?=
 =?utf-8?Q?f3AW1w1EyJ/9AyHO7zzMqRfsV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca3cebe-8704-4504-0f7a-08dc5fdfe199
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 19:43:54.8198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCt2HhIEenntXKoCH8ofhM3/D4af0d6cs0ctlX9gFD8Yoedmu84tVI8ZchlPd8AYQxXq+EsunvQwsAxvudz3Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5940
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



On 2024-03-07 01:29, Wayne Lin wrote:
> [Why]
> Commit:
> - commit 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload allocation/removement")
> accidently overwrite the commit
> - commit 54d217406afe ("drm: use mgr->dev in drm_dbg_kms in drm_dp_add_payload_part2")
> which cause regression.
> 
> [How]
> Recover the original NULL fix and remove the unnecessary input parameter 'state' for
> drm_dp_add_payload_part2().
> 
> Fixes: 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload allocation/removement")
> Reported-by: Leon Weiß <leon.weiss@ruhr-uni-bochum.de>
> Link: https://lore.kernel.org/r/38c253ea42072cc825dc969ac4e6b9b600371cc8.camel@ruhr-uni-bochum.de/
> Cc: lyude@redhat.com
> Cc: imre.deak@intel.com
> Cc: stable@vger.kernel.org
> Cc: regressions@lists.linux.dev
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>

I haven't been deep in MST code in a while but this all looks
pretty straightforward and good.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 +-
>  drivers/gpu/drm/display/drm_dp_mst_topology.c             | 4 +---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c               | 2 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c                   | 2 +-
>  include/drm/display/drm_dp_mst_helper.h                   | 1 -
>  5 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index c27063305a13..2c36f3d00ca2 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -363,7 +363,7 @@ void dm_helpers_dp_mst_send_payload_allocation(
>  	mst_state = to_drm_dp_mst_topology_state(mst_mgr->base.state);
>  	new_payload = drm_atomic_get_mst_payload_state(mst_state, aconnector->mst_output_port);
>  
> -	ret = drm_dp_add_payload_part2(mst_mgr, mst_state->base.state, new_payload);
> +	ret = drm_dp_add_payload_part2(mst_mgr, new_payload);
>  
>  	if (ret) {
>  		amdgpu_dm_set_mst_status(&aconnector->mst_status,
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 03d528209426..95fd18f24e94 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -3421,7 +3421,6 @@ EXPORT_SYMBOL(drm_dp_remove_payload_part2);
>  /**
>   * drm_dp_add_payload_part2() - Execute payload update part 2
>   * @mgr: Manager to use.
> - * @state: The global atomic state
>   * @payload: The payload to update
>   *
>   * If @payload was successfully assigned a starting time slot by drm_dp_add_payload_part1(), this
> @@ -3430,14 +3429,13 @@ EXPORT_SYMBOL(drm_dp_remove_payload_part2);
>   * Returns: 0 on success, negative error code on failure.
>   */
>  int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
> -			     struct drm_atomic_state *state,
>  			     struct drm_dp_mst_atomic_payload *payload)
>  {
>  	int ret = 0;
>  
>  	/* Skip failed payloads */
>  	if (payload->payload_allocation_status != DRM_DP_MST_PAYLOAD_ALLOCATION_DFP) {
> -		drm_dbg_kms(state->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
> +		drm_dbg_kms(mgr->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
>  			    payload->port->connector->name);
>  		return -EIO;
>  	}
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 53aec023ce92..2fba66aec038 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -1160,7 +1160,7 @@ static void intel_mst_enable_dp(struct intel_atomic_state *state,
>  	if (first_mst_stream)
>  		intel_ddi_wait_for_fec_status(encoder, pipe_config, true);
>  
> -	drm_dp_add_payload_part2(&intel_dp->mst_mgr, &state->base,
> +	drm_dp_add_payload_part2(&intel_dp->mst_mgr,
>  				 drm_atomic_get_mst_payload_state(mst_state, connector->port));
>  
>  	if (DISPLAY_VER(dev_priv) >= 12)
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 0c3d88ad0b0e..88728a0b2c25 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -915,7 +915,7 @@ nv50_msto_cleanup(struct drm_atomic_state *state,
>  		msto->disabled = false;
>  		drm_dp_remove_payload_part2(mgr, new_mst_state, old_payload, new_payload);
>  	} else if (msto->enabled) {
> -		drm_dp_add_payload_part2(mgr, state, new_payload);
> +		drm_dp_add_payload_part2(mgr, new_payload);
>  		msto->enabled = false;
>  	}
>  }
> diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
> index 9b19d8bd520a..6c9145abc7e2 100644
> --- a/include/drm/display/drm_dp_mst_helper.h
> +++ b/include/drm/display/drm_dp_mst_helper.h
> @@ -851,7 +851,6 @@ int drm_dp_add_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
>  			     struct drm_dp_mst_topology_state *mst_state,
>  			     struct drm_dp_mst_atomic_payload *payload);
>  int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
> -			     struct drm_atomic_state *state,
>  			     struct drm_dp_mst_atomic_payload *payload);
>  void drm_dp_remove_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
>  				 struct drm_dp_mst_topology_state *mst_state,

