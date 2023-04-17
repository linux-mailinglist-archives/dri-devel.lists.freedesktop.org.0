Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BB56E53BE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 23:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05DAB10E60E;
	Mon, 17 Apr 2023 21:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outbound.mail.protection.outlook.com
 (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D15310E608;
 Mon, 17 Apr 2023 21:15:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAF6OG4rhrUvaywAERaldljxb0QX1JVl2a6wRQ61+C7BORR9GuAM5px4fgJRWinRtnD4UVjHKdaLoRaLt+bAAveDWh8++1n/H5fVCcE/4UFEm7bH3kWh4Q7J+l1+Kojwa/KzHwDw9Jva9lkXw93zOeBYqywhvv3qkiPd/ina0AZjBgfFIthy+VlIbOswxD+OeeFDQIsSGlUhwI77rZnrgUQb6JEu/FNkJzLvokMoyq6BvFnOUR/1pQMU6hHxuqxxlTxZju6RgUJWuxVfzFBCkbt5+uk2STVPF1tWVCZFTv3S55mcnRN7mAB3E1yriPegaOYP3pHmLPo7CBoKdKAKFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X20RKJlBDv0b2bSMV+2hia9w8QmcOrHHzpQ4MBYaE2w=;
 b=B8kcJPz7Lp9pdHewDn35SNXPqMVcfMi7YCqX0AwuVViRpJFyDmKeC9d6npd8d5cvpk4OJsYb5Hmq/6IwfjGDQcUWyXHbK2G+ZMaaUgq8tAgxKqBE8p/LNaLPTnjVuUmdg/bcxztWbvjECBKUvsM3rSPrUnOIadYwUiXoZ/HgV/MAPahBhcvn4OLK1Fw/afr7rAnG++TxSm+IaeR3CAJI7wmjhU52z7dIyDDEMwUqBI09bDXA4DdS+dMnGCi0vygPhfOQFxPO6Iv4z6dX3SGRuxXW9wOpO3vP4dh4lbFAf2wCkg3TG5A5ThhH/Ic+kIjXKO8kivLvhuwpghMVZX4ylA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X20RKJlBDv0b2bSMV+2hia9w8QmcOrHHzpQ4MBYaE2w=;
 b=CDScFZGU3lKRvsNF4uXg0qkCkHiPhf0rDU4DDcZE1wJj4QZTC0B/d1jxcTqAXFa0hSPoERPT/+1IjI9K3dN0cAWzPpPhPMCQ5xSSZTX8E9jNoriLDgoRpAFz6Sl8B5GOpkYk/w3iVx5tZVum2ec5/L/GTY7VX1s6UaTYclx2mxw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DS7PR12MB6214.namprd12.prod.outlook.com (2603:10b6:8:96::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.45; Mon, 17 Apr 2023 21:15:56 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%9]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 21:15:56 +0000
Message-ID: <558fee93-282a-34b1-7225-3bcce63f6b1b@amd.com>
Date: Mon, 17 Apr 2023 17:17:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/2] drm/amd/display: fix missing=prototypes warnings
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230417210602.2614198-1-arnd@kernel.org>
 <20230417210602.2614198-2-arnd@kernel.org>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230417210602.2614198-2-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0461.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::29) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DS7PR12MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: c16cf7df-f3f4-4092-145c-08db3f88eee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CVwPIjXPUvU1DGdAXrN9eRqeZIz4lY+e5/BqF8nkXETTHZnwiYLUrO787ZNuo8GEEStfDjCWV4oc23Nz6AtbIdu9USvxe3c3jXnrne4poMxYcY5NGQAQfR0j45hNpeAhQDO/Iky4LHSNNAXf/qClTssfOpoj0e9stws75yIF0QfM3snPstg9Ts0XeeBxmIgjKWZSZgzZDSHnOi1JCaucEi1l8qocyU4WwNSx5Y3zAUKjuDJpnMqV5wIjJcQD3ssubqmUiClX1SaIE1liscXG46x30R0EpPVg8CGQD/HomqgCRDliydK2BKdSzo5aPlxoQiRnv2A/SulCYs7G7tpRMO4eQuzmm3QkSwCFpjLB+J7s3teEK+/0ryDP/oxxopXKYrHT+uL01lCWywpRZlTvPpyy55Fgo4micqhOb7s0z2zwOoi7aUGgGxwIn2Myql5nXHwWcq1ctpKBDuA22ruWOvhgQndr7jDau8wOA9/bD+onDwPHAeE0bCQmU356dykXTSTFYjB1S3yGeiEbiPFE1eN/9vCYvVMB+soIqouEA8Zs0PuGZu4U5O1sST/TTCLKj7TI9I1OxVZbcVPVLjzdaepBtQVlfuMpLh5Omx9BJFuQsKjORQjNdpm1I8eZ2l6I8yF8jg7wJo5uh7EJECCyk+hCI7OYILxguQsU+g9ficY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(39860400002)(136003)(346002)(366004)(451199021)(26005)(186003)(6506007)(6512007)(41300700001)(110136005)(54906003)(66946007)(86362001)(53546011)(2616005)(83380400001)(4326008)(316002)(31696002)(66476007)(66556008)(2906002)(8676002)(8936002)(6486002)(6666004)(921005)(44832011)(31686004)(38100700002)(36756003)(5660300002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGcxUFpOcDdZREFQeDFwM1RDWTVvWG5LMXVzMldBdENtN0trUUVmdU1qdnhp?=
 =?utf-8?B?NndWa2pwN1pNWUpYdlI5UmZEb012LzZwRFR4c2NwNFQvRjZBRXJtUHlxZ2xY?=
 =?utf-8?B?Qkptc0pHTm1SbWN3VEJoSHVzdWhaMGE5MVAwSkg5ajNPN1RxVVFPLzhVSTB5?=
 =?utf-8?B?eUhEZUhMMFo1Q05lUUhFenY0RGdFaXhoVmo4RWpHY3ZSU1llRC9iV2oramta?=
 =?utf-8?B?QzQ1WnppWVJSZGNUQjc5OUhBaHI2VW5IYjJhQnlzaG8wbnZyc1YzOVZIbndR?=
 =?utf-8?B?UFFEYkN0am9GZ3dNWnZYQlBXL3RFOVlhTHMyQjNwNEd4bm55cUtFQ3czTHI2?=
 =?utf-8?B?b3lFektibjVUWUNFRFVIdXpVRjFiY1NBZXkwTlE0VDB5dGxrRVVtYkUydFBJ?=
 =?utf-8?B?bWkrSWxpS1hwMWZmWm8yWE04eXk0U0trVEdNR2tFeCtqUjB0RG5qcDIyZ29K?=
 =?utf-8?B?bWU4UnVSOGFic1dRbmJCQjYrUWVZTE4yQzM4dGdSbHdrcUdjU3VrL3lKMGx6?=
 =?utf-8?B?WXMrUStscVF0NXZ1bmt1RHlmZHZYaXpuOFNTcGJrTEZqUGN1eENSNm5kREI0?=
 =?utf-8?B?QnYvVzJJMHFYZlRlT2p3ZkVTekphTXBLYmQxL1VaVWtmckxMSmRzUGd6Ymgz?=
 =?utf-8?B?WVd3bnV6MTNlRXNYekMzNWxkRlZWdWNESlJ2TGpCcHhzSUhMNG9jd1VKT0lz?=
 =?utf-8?B?K1RhNVQ0eHNJTTRzeTZvd2ppRXJwSUZZaGo0bjlnQmxNMGpwbGNzU2VrUXRw?=
 =?utf-8?B?bUMwWjkySFZqM1ZGdWJwTWtvNjlHa1BiSlJwdWVwM2ZlakNXVEFtQi9xVzlL?=
 =?utf-8?B?WTJaVnBFVFpSZW8xSzMxaGhlK3B5Z3ZyK3ZtWVA5bU1wYVRNUWdURHJvS1ky?=
 =?utf-8?B?enlXNC9DZGRSM1dIcTVQMy9tL0I0SUpvcm83SUFXbEFRMSsxcnlBc2NuV2ls?=
 =?utf-8?B?TnI3ditkZ2VzT1BzaWNZUmtBZ1BkUkFQcWRtWTV5UTRJWXNPZnJIRDd2c2pm?=
 =?utf-8?B?NmRadVZOcWN6UDJ5VVNEazROOUk4c2R0UmVuR2s3c1hJbWxPUDEvVWJieStV?=
 =?utf-8?B?WmlwaWVRbTBCcWRZdWVjQmFDQ01nYm1oK1E3Q3BLdFUrcyticTdsYng2WDV3?=
 =?utf-8?B?ZE9qbERRMlRacmhselZnNHZ1b1NzOHQ4SkNDR0k0V0JscSsvNlg0dzd0VGJO?=
 =?utf-8?B?bTZNQmFFNE1WWS95UG1WT2pxWEVZUzliLzdlVkt5bzFtOTVQYzRGYVRHZzcz?=
 =?utf-8?B?VnZ6aGgvTlZuNmExSVV0cWo5ck91KzZTalhuOUhqeFB5MXNZTVRqOGdrNFlD?=
 =?utf-8?B?VTZiWWRYOWdremZtdzNiOWUwOFZGQXhENnNpUWYzK2FUZzN3Sjl3RUlVbFFR?=
 =?utf-8?B?eTJXbndpZFVoc0NrNGUrVVRIM3FCK2Rob3V0K1VjbSs2Si9Ib0RVdGN4dG8v?=
 =?utf-8?B?SFdxYlpMUEg3WUxneVpPUEJwd1ZNOU9xTVJBNzQ3b0g0Ui9ibXBaeWw3MWRo?=
 =?utf-8?B?aHNRK05NY05yQTFrbk81RTJueXlpanJyTU5qNVdXSTk3THJWdjk4QXZvN0t2?=
 =?utf-8?B?TXBiQ09BaGdzMGw3eW1lMGwzZTN0amFKcDhNLytBT2xOZHYyV2o2VFhyV0t6?=
 =?utf-8?B?UHdENitPV2NaYUJnd1Z0d016YlRTQUdlUTJqeTFCWHpaN3FyVkRYZUwyN2I3?=
 =?utf-8?B?d3czeHF1OTNGRjFLQ3h0akR5NEl0U0szZXhRc0dCc0NDZ3k4azYvazZnbkNs?=
 =?utf-8?B?eUJMcDBYd2xiQVRpWWl2bjh2NXNVc3NBZ0hNaDRSL3FaTVFRMEt5MStBUDlZ?=
 =?utf-8?B?YkRnVk8yQWNGL3cxUWpFVUh6M3FQY01ad011MHVhWTZBWU9WZ1c5UGJuN3Yz?=
 =?utf-8?B?Sld4dFhmbFVXOEZjNlU3SFBNbW96TTdTd0RTVEFhWUJMaCs0c29VTVpBOFlJ?=
 =?utf-8?B?MW8zSUpHOHpVSzJxOTV1YVc5MVg2bTdmTHZNdVhRQzRFa2xGRkZYT2JSeDR1?=
 =?utf-8?B?SmxGRmdRRXhnNWlNN1J1cCtIUFYzVU4zZVR1VWZoenRoN3BEYjhtN01NdG81?=
 =?utf-8?B?bXZ2aFJZWW9Mb24rdkE5Y211L0hIOE91SCsvUFBGbS9lcDN5cTJrbXdGQjNv?=
 =?utf-8?Q?aAK8ivPLb1tF9vDqUyHzGzc5M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c16cf7df-f3f4-4092-145c-08db3f88eee3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 21:15:56.1462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MrS24dVbNjCze2u91h2fuawoq4w24GlIXlYv59ayXpPA/swfuVAaPFd1fwnVE7jcgYH0OSMFqEMK38dtMjiZHw==
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, dri-devel@lists.freedesktop.org,
 Wesley Chalmers <Wesley.Chalmers@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Alex Hung <alex.hung@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Jasdeep Dhillon <jdhillon@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Roman Li <roman.li@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Aurabindo Pillai <Aurabindo.Pillai@amd.com>, hersen wu <hersenxs.wu@amd.com>,
 Alvin Lee <Alvin.Lee2@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Jun Lei <Jun.Lei@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/17/23 17:05, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Three functions in the amdgpu display driver cause -Wmissing-prototype
> warnings:
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1858:6: error: no previous prototype for 'is_timing_changed' [-Werror=missing-prototypes]
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:210:6: error: no previous prototype for 'is_synaptics_cascaded_panamera' [-Werror=missing-prototypes]
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.c:294:6: error: no previous prototype for 'optc3_wait_drr_doublebuffer_pending_clear' [-Werror=missing-prototypes]
> 
> is_timing_changed() is actually meant to be a global symbol, but needs
> a proper name and prototype, while the other two can just be made static.
> 
> Fixes: 54c7b715b5ef ("drm/amd/display: Add DSC Support for Synaptics Cascaded MST Hub")
> Fixes: 17ce8a6907f7 ("drm/amd/display: Add dsc pre-validation in atomic check")
> Fixes: 8f0d304d21b3 ("drm/amd/display: Do not commit pipe when updating DRR")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

It seems like, only the changes for is_timing_changed() are in this patch.

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

