Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FU6IL0ComnPyAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 21:46:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D8D1BDEB6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 21:46:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770CF10EC40;
	Fri, 27 Feb 2026 20:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nyIIJaH3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012028.outbound.protection.outlook.com
 [40.107.200.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010B910EC3D;
 Fri, 27 Feb 2026 20:46:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADpWG+MI7+pJD3tMYbgNCQotsUnq4MSydzqyapPVjxspwK51wWniqo9EiArpxz/LbO0RQWGUNtsli5aj3PN828fM0bPOON+1CYunjxRkneqLOe9kjJChxjFTmA7mhLyT4QHUzHjxGRZRURrz6Y80Iv0b9qOFeUFSXujZk6yEavRn5ytlJ6WdL8baNBm3ZaCj3VshVPHU4nNIX7KpbUCpTdEvQadK5vMl06GUOTiT07iSV2xhqMHhe0fcnNnV+sdCpaYchlDfGlSAYJslU5H80S2A4s5paGr2OFb1Hv/ayvrdOWAc8uEAZdUSV6WgkwzvtWVkZqbs3KewmbtH6ySatg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10sC8IVO5MG6IPQYgaZPMmbzvnzHi/F+PtUeCWap5Cc=;
 b=lIPfKdHLn85vlxy7LC29n1g4VIawuiC1Vpo6esAY9GByZFR1rfIJ9LXTPkHHUxdGHk0QmeaoixIG48NCweUjeMhQLJZ+SyGXcYMf2UWlgl+J2RTcnRGLggKGy0M/7Y/lyGOP279nufcecR1BIrHGsMzz0L2X21NRCN1FVkAfYJ11SxClQCwmrzq/Gr/IWySiTyO6JjXwkozblVMgfotUKP5KNWII1oKcHKVOtDjUtx4RzGgUQO5P3YvNlpa/Jxo63cvfFe4oBwRGDnBHwSSb5YIoZ0zIyp97hE2SiU9kz2F9DCmAlnEDCzh8YrJjVgaToSUa04l0U5MRzg2/LJLjEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10sC8IVO5MG6IPQYgaZPMmbzvnzHi/F+PtUeCWap5Cc=;
 b=nyIIJaH3ip+VJS1nIugXolMXTptbxcV5RpGMDTEHXrcsqRQSLAGGGdM6wS0uC36xPgu/t1F7UuFAWHfWUubKax3vXRMuodHv4pLdf5rd5Sm8Pdzbw05lqE8Sv34WuTsStFxBXIYKRuc3LywQTFX8Gs4nTrN0sh+sWpT+b8FKhks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5130.namprd12.prod.outlook.com (2603:10b6:408:137::9)
 by DS7PR12MB6214.namprd12.prod.outlook.com (2603:10b6:8:96::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 20:46:45 +0000
Received: from BN9PR12MB5130.namprd12.prod.outlook.com
 ([fe80::e7a:4396:5bcb:2b5a]) by BN9PR12MB5130.namprd12.prod.outlook.com
 ([fe80::e7a:4396:5bcb:2b5a%6]) with mapi id 15.20.9654.007; Fri, 27 Feb 2026
 20:46:45 +0000
Message-ID: <b94b2900-08a6-4458-839e-9c98e90680dd@amd.com>
Date: Fri, 27 Feb 2026 15:46:39 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Use mpc.preblend flag to indicate 3D LUT
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 contact@emersion.fr, daniels@collabora.com, mwen@igalia.com,
 Alvin.Lee2@amd.com, mario.limonciello@amd.com,
 chaitanya.kumar.borah@intel.com
References: <20260227192604.1377163-1-alex.hung@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20260227192604.1377163-1-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0280.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::29) To BN9PR12MB5130.namprd12.prod.outlook.com
 (2603:10b6:408:137::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5130:EE_|DS7PR12MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cc58334-77e6-4229-41dc-08de76415202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: OUDrkmTk/ChNsaLEwubZzywygs9Jo+9nD+m+oHyDsWqHPoMQauKXP9Tp2iCLccJUG+HMIeAag5zkqGaCz0OW/hJ9ygMd016lsDEU+9uvYGWXIGy1xuWcu8JFB36Ib5yvMCrMoG/v0F62i7VhDEyB5A2SAO6oG17eOYgrPqjCyGx5o/bNU6eWufWvnphdk4D5cI7dA/RgRoFAsOng5jslNBUlKeo0B05Sy0UjBmNnEn0+jAm4WKx0nM6ckPLxH2CsFyh+8M59yryvogRGmizlA9n+U/ja64MNmgfgEOuIjjWqeYOPAiMCZ5bXSxCZEzicxfKyCKfsMMjxhuPqDCdzuSGqz4V4LbzBn8Djf4bGMmbuOGhezE9zX+j55zSssYQYeXZNmzyKv9q5khTQ59APpkRLZ60MaYGEFWNbVYRDbVaRUHDSqhFxwuuWWZOyAAgWcCOAq3CHFYL6UXeGK05NO4aHsKuFEB4XBjRC0BG2ckEdRx7U7ajrHTmvLOmRaY0IYdtbJ3BWbDuCpH1/rjdvvemPTJG1u8W7n6r2Ddyw+KAENlwl62xsDQfWU/kXb46EEjBmzeWZqtMdgIQYWa9iA9ujyslF1B4CiaKRSW9U2GQNhcaOc8p72MjgEpRIM1ujIvhYwHGo4M4AqUfzepNpF/1WmywTLGgYc+ZHZIuliXoBNG4RUSo0EADGBrWTQLQHthv1vSWpLBCFYKyA9M6gDPo0w9E7yqRxe2wsB9yvH6s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5130.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUZ4Mm5ldTFLVy9nREV5Rmsva0VjSUMxR1hraE1EbzFGZ1ZkSHlFS1hIcmlX?=
 =?utf-8?B?Qzl3ZWQwT28yUjQwZSsvWDgzNndvRVZPWm1iNWI3akd6dFZvN3V0ejhUMDdQ?=
 =?utf-8?B?R2pFeWR4WVkvbXFNNFp5djVWMS9FTFpnVzdJaHJWbDZxUW9uQTBzOS8xUVRo?=
 =?utf-8?B?bjF6VlVRR2RYWUMwS3dxemJac3RyUm96MVdoSm1mODdaU2hUT3ZPUHJFRExS?=
 =?utf-8?B?d1hWRnJwUEVUbHNFZzE1NStrbkpOdGpuMHY3ZDFtZlRuZVUyZXVCdHZoTWJz?=
 =?utf-8?B?SlpsWEdkdEJXV1ptZDdqeEdBQXVsM0lqdnJsQVFsS0NOUEZkamdadzZYYnRL?=
 =?utf-8?B?WHpTMTk2clRIbi9oWWsxK2lGTmJXM0Y2dVlBRng1RUZwVGlod2RhbXJPQ1hI?=
 =?utf-8?B?Wllid1pKTlY5ZGlrMktLU292MDVJYnVRRisvRnR6OG5aK1ZsaVlCMmdQTXVn?=
 =?utf-8?B?c3lNQnJWYWFRZ1B3RU5KT0V0VUJmeXlpTUdlbDcrQ1duYnNycWI1Z3ZpaTNO?=
 =?utf-8?B?OWNPaUt6UjB5ZldnM1ZzQVZzeUwzVWJxbmJYdi9kb0syaFFxeXNRemx3ZHUy?=
 =?utf-8?B?bjNRRHE0blpzOUFQd1ZuaC9FeWR5eVZNWHRlR1F3cktZRjlOT0NDR21NM2Qw?=
 =?utf-8?B?WVBnT2R2RzFta0JvTmh3TVJ2ZTdOemp1Wi9acEVIRkl2VTM3SjRJa0wrbDhT?=
 =?utf-8?B?SElTTmtOU2RCYytKVG5rMzhVZXYzaE4rRnUrcStOeFBjRjRCNDVXQkhDYTdN?=
 =?utf-8?B?bzIxNHpraGRDWktaQjgzVzhXK0tqVTcwMXBMZUhMS3dWcDFzTTFDdXF0emox?=
 =?utf-8?B?OWxhTTcydnMzSnhZbkY3Ri94dURBcHc4V002N0JSUVZhaGhrOEt4dzNuUEp6?=
 =?utf-8?B?R25TUmh0a1N3eFVJNk9Na29qNnpWUWVXbGpON2o2b3Qzdk1SV3JFRlphak9j?=
 =?utf-8?B?VENUU0RvdFZCWkRSWDIxZHNNeTAvcm5aR3lxcWZhcStjRElneGozZzdNQmJ6?=
 =?utf-8?B?dTBtSXJoN04vNWJBWHovemRqQktrakVQS1FnaW1PWVpoVEZFMkNMckI4MmlU?=
 =?utf-8?B?ZW1rZDhIS0V6Wk1CMWdvUlB4TU9mMW9IQmlUTE42MlNnZFJxN0c5bHF4S21V?=
 =?utf-8?B?QUdQbGJ1Y2czZWMvZGM1a2lLa1VkeXY5ZW9UVEdhSEIybCs0RFI1MTRGSlgy?=
 =?utf-8?B?Qm5EaHBMZ3NVT2pNQTUvYzNqdk1nU0xiZXlUV2hpRTRMc01DZkh3VGF5V0xq?=
 =?utf-8?B?bnRTRzJjZzFncnh4aHpDOFBMY3BZQW5OT292bndrQVE2LzF1MW1KY2FRdFFJ?=
 =?utf-8?B?TEhFckZldVRXUStnWitJbkNtSHdKeXhaYWNPQ2Y3UGcveDU3TEU3emkyc212?=
 =?utf-8?B?NVU2SFYyUHBmUmJxUDdVdm1LbDRhZUpOa2ZqY1g4UkRXd1FaWCs5RUc3aTc4?=
 =?utf-8?B?U1c1dzZ1dXNZTXBwRTc5SHJybmlNZ1JjeG5hT1RkYjVKRDJpM0tESFhSWG9L?=
 =?utf-8?B?dkI5Sy83Wkl3R1RueVZYdTVJbHdiQUpwK2dTMTJncE43VUdkSkdEOFpwN0Y2?=
 =?utf-8?B?NHVnb0RpQkxpS2M4RVRGWW5GY2JXZnpTUmYxQk9BV2xrekJobEhYaFNGT1l0?=
 =?utf-8?B?OHpIdmFzYkJMZlkra0c5WXYreUlpbDZRQ1JHT2dTTGFudlVuNkxyUElrcFhz?=
 =?utf-8?B?UEc2RTFWcklYYzVOSC9lNk40Q1ZHRnBaQytxb01rZ0ZyTjhkUmtOaGp2NGZt?=
 =?utf-8?B?RFVhWk1hMnNzWmpLYkNBYnM4MStYK2JsOWhTY1pPTFBXbzNmRjVNMGowZjFR?=
 =?utf-8?B?dTN3OGVVcjFMREJPbG1sK29xYW1HUFEvZE5jUnEvaEZ0UXptWTJQYXhsMXNk?=
 =?utf-8?B?NGZzSTlqQnJLV0lSQWpUOHBBT0VjTkNJalR5dkpoT0FwMkxoVUxFQnNoQURI?=
 =?utf-8?B?QkN4STRYVXVJb0JDcjFGVjZZVkZSWTE2M0hscENjSXpXOFNGbFFrZTAyMW5P?=
 =?utf-8?B?bXJMUkpXeCtBWU0vYXUxMDhKV1IyMS9mdzNZc2g0NnluNkJWdThQNEx5TGFk?=
 =?utf-8?B?b05LeGlhN0dqYzYweWUrZ095aVJ2SzFYaUU1YmdpVzhFY2ZLNyszdFBOck5T?=
 =?utf-8?B?a3NkQURKRy9qb1VjTEtJRW9hcWhvMXVIQnZpUko3V3lIbWRwUVc0ditEbjJr?=
 =?utf-8?B?aXYvZlF2em0yRHdiQXdrNlV3dEMySmUyN0hUZHNnenZ4QXIyaVJhY3BEbVNy?=
 =?utf-8?B?eTZFVFFiMG9ZNzFQbkxSV2tzNE1CUEh0MzBjNkhXWEUwWVlvYmlPY2ROQWNB?=
 =?utf-8?B?MXhkWVZDRW1TdkkveDh1VWRHL3hPZ1Y2emZQVnZCb1M5RTIvZ2pHUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc58334-77e6-4229-41dc-08de76415202
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 20:46:45.6036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WN0Jo2J2x/yvst7ZA5o/DzFuaNpBNcL5Obwv7aA0c8sk2NuBnNPWIHecKzZRlGH7Xpmq26Cp+aftUARjsQfRGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6214
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,emersion.fr,collabora.com,intel.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[harry.wentland@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: 31D8D1BDEB6
X-Rspamd-Action: no action



On 2026-02-27 14:26, Alex Hung wrote:
> [WHAT]
> New ASIC's 3D LUT is indicated by mpc.preblend.
> 
> Fixes: 0de2b1afea8d ("drm/amd/display: add 3D LUT colorop")
> Signed-off-by: Alex Hung <alex.hung@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c   | 6 ++++--
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 3 ++-
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 2ba98f384685..cd1e58b8defc 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -1706,6 +1706,7 @@ __set_dm_plane_colorop_3dlut(struct drm_plane_state *plane_state,
>  	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
>  	struct drm_atomic_state *state = plane_state->state;
>  	const struct amdgpu_device *adev = drm_to_adev(colorop->dev);
> +	bool has_3dlut = adev->dm.dc->caps.color.dpp.hw_3d_lut || adev->dm.dc->caps.color.mpc.preblend;
>  	const struct drm_device *dev = colorop->dev;
>  	const struct drm_color_lut32 *lut3d;
>  	uint32_t lut3d_size;
> @@ -1722,7 +1723,7 @@ __set_dm_plane_colorop_3dlut(struct drm_plane_state *plane_state,
>  	}
>  
>  	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_3D_LUT) {
> -		if (!adev->dm.dc->caps.color.dpp.hw_3d_lut) {
> +		if (!has_3dlut) {
>  			drm_dbg(dev, "3D LUT is not supported by hardware\n");
>  			return -EINVAL;
>  		}
> @@ -1875,6 +1876,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
>  	struct drm_colorop *colorop = plane_state->color_pipeline;
>  	struct drm_device *dev = plane_state->plane->dev;
>  	struct amdgpu_device *adev = drm_to_adev(dev);
> +	bool has_3dlut = adev->dm.dc->caps.color.dpp.hw_3d_lut || adev->dm.dc->caps.color.mpc.preblend;
>  	int ret;
>  
>  	/* 1D Curve - DEGAM TF */
> @@ -1907,7 +1909,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
>  	if (ret)
>  		return ret;
>  
> -	if (adev->dm.dc->caps.color.dpp.hw_3d_lut) {
> +	if (has_3dlut) {
>  		/* 1D Curve & LUT - SHAPER TF & LUT */
>  		colorop = colorop->next;
>  		if (!colorop) {
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> index f25c0ede7199..d59ba82d3d7c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> @@ -60,6 +60,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>  	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
>  	struct drm_device *dev = plane->dev;
>  	struct amdgpu_device *adev = drm_to_adev(dev);
> +	bool has_3dlut = adev->dm.dc->caps.color.dpp.hw_3d_lut || adev->dm.dc->caps.color.mpc.preblend;
>  	int ret;
>  	int i = 0;
>  
> @@ -112,7 +113,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>  
>  	i++;
>  
> -	if (adev->dm.dc->caps.color.dpp.hw_3d_lut) {
> +	if (has_3dlut) {
>  		/* 1D curve - SHAPER TF */
>  		ops[i] = kzalloc_obj(*ops[0]);
>  		if (!ops[i]) {

