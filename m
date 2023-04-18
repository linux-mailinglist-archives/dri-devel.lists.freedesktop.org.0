Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7766E66E4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 16:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B9310E744;
	Tue, 18 Apr 2023 14:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA5C10E744;
 Tue, 18 Apr 2023 14:16:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9O6Ox42zWaMQQsYmi8CfVxsmZLt/tCc48uHXkDETeidIAafyyRBfpOjBu7ltdZBJ45YKlYZqeCO+T3pXG1aPB54wEM+a1cVpAjZAvHIKpMxGyNGVLca/iobokkUrokjqkozey5PJjJS5gjDPf85Rp1KchvP6p6AXa5rnBs0ZLfHWJozhCJMzT/7hrArrPWObwA7Zk2VZ09wURWbzGo1t6H6AQc0eOrKk+fYdreKwwDMrhr608rwxJcajBdib5pXokc5TPk8M86WC+ILd6tl7MsSlkXdwjtUUp6U3PXNcU9WJsHnTGe/WpmwrcC9ueox8db2rRgklou2/uk7a4H5TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gf02M+tN9TmNL0Q1lps70E+ha3eVFb4+1C2qmDM1/4k=;
 b=bmjQcEIqBjCOIiGA9AjvR5d70x0n5/+SUviUqKgDb4umEezWWrhevccVGUzSNY1Gzym0IGRusTihOVpSCiz+B74acZoMPZgcH+4iLxr4GwnsetN1DLgs2FSWXGeEpQSnsugJ9uIhaSAnsLSBhTGc2CSOVCKTjlLjhdu0AR1RZfbPVofd/5ryFHJLuUf17kHbKOfRQRSJVYmzYDRIEyaE7P0qGRve4zbYgwkXoAQOnFGn5LUyiSLZCw2IsGH9j2Mm7xjD17jCbBTAR5oU2Fpn7PVSE7dB8Ox30gnlrkKUPgwBV1qn9qOFbkypMLpokOlH15h+ZC8QHHpM82fP5JcKQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gf02M+tN9TmNL0Q1lps70E+ha3eVFb4+1C2qmDM1/4k=;
 b=00lzMEPyqP3GAalvgjIQY9g6o9xhEu0IyJBIXes1+wkH8e3D75Gsj+3ey+BSTogbiWZQ1s9t7ZqBYi3WlhC0Oxv4o12b4f7NicbFO9H4+EHMuqNZcUWSTEHbUaVn4uTO9/OOt4B+hryelUgajHUmfAg0UbuPsnKX3ZE3lzhemIY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 PH8PR12MB8606.namprd12.prod.outlook.com (2603:10b6:510:1ce::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 14:16:02 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%9]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 14:16:02 +0000
Message-ID: <9f3e7030-c439-b8fe-7d30-80b11f4d06bb@amd.com>
Date: Tue, 18 Apr 2023 10:17:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] [v2] drm/amd/display: fix is_timing_changed() prototype
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
References: <20230417220827.3481168-1-arnd@kernel.org>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230417220827.3481168-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0096.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::32) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|PH8PR12MB8606:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d5cfc01-b740-46cb-f6e4-08db401770b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lPVH5x+z4T4AaL4xmOobdPauvdtdpSIefjmObQCDZlzijZ+5xy0UidB6trlOgSu5OAWSp4nSWiXdfn/rGFVAJb4SvDSz5cWaF35dl0DKMPiSMgcxh1FFXOrj5RTxdGuToE9NDMHpMbhSvyrj8eclj6AY+LjA4fNbPZiNjspG4mSq+hFdKQ5xDOT+SX5xGW3deBePsO2/Te7soOt8yFPYb4c2RoP6wzxkCY8+j4kKNL8fNTdCBL0LFyjFeUorhERuUz6ZLmD/VtZTxsOcH/PGX2T4bEen+X1vSDdM58Z9vQMAiMRDeqn6ByvJAQHn1Wcwg28VQC2+RXe4f5+tgx/hDLwIcDNuA97p7PHtrtoDUB1VZ23ACG/RRoHhA92IVQ62eDXjHyBV0q1KOp4lmOw4/mDCE+HwKuqFt+GeiGSI3Ze6bLo4Z2OQOH9Affr1F59lMfyLsL16x/s7ecD/Q4ovSn4e4fJpv7OIGqir5GLCZN5SmmBg6O7DtuMPTvvhQxXwzQ+ZPi+wP6Z4zgtu4CaNpqDmfkeV78YE2zWPDP/NiD37F4qcJpjhFfYHndvlHgPUsI4MVvcpSlGkeLVRZ1NpVKuKvMEQZrXDzRugoQo6e52zkONENWZr9b8/ojr0tZP4nWj4tDqyMvxoasp0qsLZvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199021)(36756003)(6636002)(4326008)(110136005)(54906003)(316002)(66946007)(66556008)(66476007)(478600001)(6666004)(41300700001)(5660300002)(6486002)(8676002)(8936002)(2906002)(44832011)(31696002)(86362001)(38100700002)(2616005)(6506007)(26005)(186003)(53546011)(6512007)(83380400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0RJQmVtZ3VrM1pXT1NZTlhIYXczQmYzdFBHeDRJZEVHalcxZi96MngrZU5U?=
 =?utf-8?B?L2lpbURoNlBHWk5KR2ZRWVZuZk0yYlFiY1oyTkxKa0REeVhrYkhYdlowMW5S?=
 =?utf-8?B?VWFRbE93R0pHUHVGVWZLYUxaSm9xUlM0SUNZUWlWYjJ5SmoxdVhmQytpRW0x?=
 =?utf-8?B?anNzOWlnN3dNc0xacUFqQzZheWdjZUx6K0h6VmFOQkdVdkw1cEpqKzkzWU0v?=
 =?utf-8?B?RkRBVGJBa0lQM1VyWklmWVEyL0dlM3hjSFp1b3BRZUNuUCtxNEw3V0hROUt2?=
 =?utf-8?B?ak1WYzh3RVNvMXQ4UllQeW45V1p1cUlNMEQ0SmlYdmZ2SjRtOU5sMGU4dG1U?=
 =?utf-8?B?NlovazVFeUY5ZEZ4WG0wWTlvcU91dFN6MVh6Nnd3TVV3S2RYM3B1c0FhSFVO?=
 =?utf-8?B?NmIvamEwNU1Pd0JyK0lKa0VZcW9UNmNRRXdvaERDamVkV2taK1I3SUtmUTh2?=
 =?utf-8?B?UXpKUFhCcWZuNEhsMmIzazlDTTdZVDFkTHFGeGcxbXd5YzFnNDVtL1pGU25n?=
 =?utf-8?B?WHZmTWtKUjd0ZG1hWEpvM2N0d09iciswbnU2Q2ZaS2g1cGhoN3JlYyszQ1Yw?=
 =?utf-8?B?Vm1jMyttVDZnRDJaYndDYWMvZVpmWUNtbGppcGhudEVWMWFvWm1LQjRvYVlF?=
 =?utf-8?B?WUFVTkhMd0NPc0tlRDEvNFU1VHpKYTFOQ2ZnQXhoUUZSeW9QbklmaHZPTUZo?=
 =?utf-8?B?QXA5L1pEakZFblFmaU1wVllVUFFYRG9uT2hhWklRVllnNTJRS2t4VkRSWXVW?=
 =?utf-8?B?czkzMGFxcVVLSXN3TjR5SzU1bVdsc3FwZDdwWXpDeEJUUm9zRjFyNmx2Y09E?=
 =?utf-8?B?M0VmNCtBTXozVEU5SkRkSjA0MzB4bGVnbEJ3VGlyMUQrakZuc3VPY2tQYmFp?=
 =?utf-8?B?RXdIcER6aytqd2t2SlRlcFZ1cUxJdEp1Mld3eWovL3VCU3lXdkdGTm9EZ3FT?=
 =?utf-8?B?amlEcmM4aGk0cXI1Wk56czhLNXZXVFljSVZDajBWRFF5aTIzL2pLejlBSEh0?=
 =?utf-8?B?cmowa3Q2TURqbk12WkJGTnBWMWhManlwaU51MHhKUURGT0diQk5iNW9jbTE2?=
 =?utf-8?B?VFoxWnFDSWU2TUlBaDFmdXZaazFSbm5wWHA4c3RIUVBpdWcyTldtWGc1b0Zk?=
 =?utf-8?B?bUVLWW1LaTUwbHdZTW1rWHVpR3BIdW80S1ZDUDdha004eEZ4NS9sQlZkTzRj?=
 =?utf-8?B?SDFFYnlUOG4reWNnczEweDBZejhnb2szRmYyRUo4MzhHTHNTTGt3R0NpWlR1?=
 =?utf-8?B?eFg2WnZUSm0vU1BEdjg2R09mbzNaN0VjQWFydWNUL1lBcWg5UzJzWUFnaWxY?=
 =?utf-8?B?cmttejlnYXVacFZJc1lBRUNUNHpFWTBadTNHUDMxeHd3RGtlTTNyZUhwUHYw?=
 =?utf-8?B?OHlUSlIwRnNoOCtwSTZTTERmclZzVmhXUlpLc1h0ZU5jamNhN3Iya3BNTEVU?=
 =?utf-8?B?M1I3NFVZWHVxMVVtbTdPT0Q4S2FMcVlvdm83M0w0SnVleXNLQW91bUNqblBE?=
 =?utf-8?B?YnNYaGN4ekJHazM3R2liVmhWVDZHRGFick1hSXpoZGRnblI5eW5sNGRLc2k3?=
 =?utf-8?B?dWJwTDJBOVVUMFBCU3dZVDFhVWJlcXdPNzh4UVZmc2pFTWdmallqMURwZmZU?=
 =?utf-8?B?Z2lHclljME5SaEdCQXRqelBFTk84dS9TNjFpTXdYS3c0SVlJQmtIOHpabGtp?=
 =?utf-8?B?R1VLK0l3dCtmSEZHcEs4T2xLT3hacmlvTUhybFoxUUtMVnYyWmJOb3dBRFZQ?=
 =?utf-8?B?SUtkK2QzNFNkVE9FY05rR1BwamRtcTdVN09pNHVHOFJXN1BqdmQvSkIzNS9Q?=
 =?utf-8?B?MlRzdldFZlVOS3lvSmhRQUt1WDRNd1Uva1Z6MEJaQzAvbjN4WVJsWWpGdUx1?=
 =?utf-8?B?R2Znb3QwdWVRY0FmV09NS3AvZEJWbTZGTTVXbFRNdjVNUXM5K3djKzJBaTdS?=
 =?utf-8?B?RWllQ0pFVjB3YkNOc1RUUDZ4Rzd0aVg1dFMrUDlUOXpSbWROQ1A5UXpDZGNp?=
 =?utf-8?B?cTNCbTBXMkFOQlMveE5GTW5xTXpwZzBBRTlMeVQzcUxwZTNlTlloNzhzQkRx?=
 =?utf-8?B?U2lGK0ZPYmUwS1ZUdWVXNUVMMXZWb1BtdzFiMU51VnByMXcwMDQ2eng4eUVo?=
 =?utf-8?Q?4nNBU5HmB3sSs4eKSlWCMOI+S?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5cfc01-b740-46cb-f6e4-08db401770b0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 14:16:02.4237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4YGbV5ivX4cP5BMtrA+9gBsBir8BRjX8lcqIeHAtGbtRUR1FlzLf+T2oEqIR6Y8CyhH9Is1QKHWWcfK/lzvRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8606
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, Alex Hung <alex.hung@amd.com>,
 linux-kernel@vger.kernel.org, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Jasdeep Dhillon <jdhillon@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 amd-gfx@lists.freedesktop.org, Roman Li <roman.li@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Aurabindo Pillai <Aurabindo.Pillai@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, Alvin Lee <Alvin.Lee2@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Jun Lei <Jun.Lei@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/17/23 18:07, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Three functions in the amdgpu display driver cause -Wmissing-prototype
> warnings:
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1858:6: error: no previous prototype for 'is_timing_changed' [-Werror=missing-prototypes]
> 
> is_timing_changed() is actually meant to be a global symbol, but needs
> a proper name and prototype.
> 
> Fixes: 17ce8a6907f7 ("drm/amd/display: Add dsc pre-validation in atomic check")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 5 ++---
>   drivers/gpu/drm/amd/display/dc/core/dc_resource.c           | 6 +++---
>   drivers/gpu/drm/amd/display/dc/dc.h                         | 3 +++
>   3 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 994ba426ca66..442511061178 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -45,8 +45,7 @@
>   #endif
>   
>   #include "dc/dcn20/dcn20_resource.h"
> -bool is_timing_changed(struct dc_stream_state *cur_stream,
> -		       struct dc_stream_state *new_stream);
> +
>   #define PEAK_FACTOR_X1000 1006
>   
>   static ssize_t dm_dp_aux_transfer(struct drm_dp_aux *aux,
> @@ -1417,7 +1416,7 @@ int pre_validate_dsc(struct drm_atomic_state *state,
>   		struct dc_stream_state *stream = dm_state->context->streams[i];
>   
>   		if (local_dc_state->streams[i] &&
> -		    is_timing_changed(stream, local_dc_state->streams[i])) {
> +		    dc_is_timing_changed(stream, local_dc_state->streams[i])) {
>   			DRM_INFO_ONCE("crtc[%d] needs mode_changed\n", i);
>   		} else {
>   			int ind = find_crtc_index_in_state_by_stream(state, stream);
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> index 85d54bfb595c..344533623cb9 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> @@ -1855,7 +1855,7 @@ bool dc_add_all_planes_for_stream(
>   	return add_all_planes_for_stream(dc, stream, &set, 1, context);
>   }
>   
> -bool is_timing_changed(struct dc_stream_state *cur_stream,
> +bool dc_is_timing_changed(struct dc_stream_state *cur_stream,
>   		       struct dc_stream_state *new_stream)
>   {
>   	if (cur_stream == NULL)
> @@ -1880,7 +1880,7 @@ static bool are_stream_backends_same(
>   	if (stream_a == NULL || stream_b == NULL)
>   		return false;
>   
> -	if (is_timing_changed(stream_a, stream_b))
> +	if (dc_is_timing_changed(stream_a, stream_b))
>   		return false;
>   
>   	if (stream_a->signal != stream_b->signal)
> @@ -3505,7 +3505,7 @@ bool pipe_need_reprogram(
>   	if (pipe_ctx_old->stream_res.stream_enc != pipe_ctx->stream_res.stream_enc)
>   		return true;
>   
> -	if (is_timing_changed(pipe_ctx_old->stream, pipe_ctx->stream))
> +	if (dc_is_timing_changed(pipe_ctx_old->stream, pipe_ctx->stream))
>   		return true;
>   
>   	if (pipe_ctx_old->stream->dpms_off != pipe_ctx->stream->dpms_off)
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
> index 23ee63b98dcd..e7ab6cb3769b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -2225,4 +2225,7 @@ void dc_process_dmub_dpia_hpd_int_enable(const struct dc *dc,
>   /* Disable acc mode Interfaces */
>   void dc_disable_accelerated_mode(struct dc *dc);
>   
> +bool dc_is_timing_changed(struct dc_stream_state *cur_stream,
> +		       struct dc_stream_state *new_stream);
> +
>   #endif /* DC_INTERFACE_H_ */
-- 
Hamza

