Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E28E6E65C1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 15:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E7610E34A;
	Tue, 18 Apr 2023 13:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294B210E365;
 Tue, 18 Apr 2023 13:23:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NA7GNOuCyft/U5Cqpv10J0TWYRp+coblBw1InNnmm3KmpE5D9BxP73aRO6S4G8UFfhduzJlIEl3S9kh5cqht04lm/7bjjODMkbmsNZYfq76S1QyMBk4XHVcLfPY/MUiAljVNfbyZsm7kDeLv6rHw21UUW/n2Ppb2qi1/5amMpdx0DG7qR5+TOu0i6ldFR+kgHYs6YP0vdCq9ifXsQ4fg39tBBu16eWOSjd7VjBmNfPNQuThNIrkb3FsFD2TG7duMR4Cn75zMQTxgbBO9wpLbu/k1vrd27OLmOzSgpCaDa+/lCbEmv4pOFG8k5HDmBefQyEpHDyn07cjWhzC8/jkUyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LB4u0ZFMlCuRry/qIo2Ekyu/ocs9kFL2LdgkAPPzOw=;
 b=V/kCz5IWSMy7XJ7xd/tamkoKh6FR4PSsqHg18r7P6zHcm3THtg4oMts1IW7xQG24J6W1hpDXoMyxzoFKCYf0Wdtq/xK9GJvN5rc/3nr0iz5YX7UvGnjaBiwxEa22RUGg3M5H6bwPUY5pkSB0oazZ82OkMjFE+VtDT/MZ/EGXRpJ1E5XYT0+ViHmIt2yXv+bf+nTuc7qp8dd5Xd68BBysXbjZJUglYHbw9oAJvN6o8Y3Jn27Pf9ezssEdA84uRgyl47QJGWsR1XM59lXH+DoJ3N6Gw3U3X/yg1ymrXYaUZu3XTbbtc+B5kX+d0gdcV+2M3PHMniFk/26LOgs9pYzDQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LB4u0ZFMlCuRry/qIo2Ekyu/ocs9kFL2LdgkAPPzOw=;
 b=2eN1kV60epYPF+Q3N9Unxr6qPwDKtafq30GI3tIHCkf9PRVbgounc36ehPStf8ZypWPs7QJG8gmmbrpxusBjTBP0nS3edFTvfwi0a0K0NYGZTk/3vXQy7Ssage2lUCUK+RZkD8jXA3qdq8HyrMhrPKnmrAS0BFUMVBZNgKurJEk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by MN0PR12MB5739.namprd12.prod.outlook.com (2603:10b6:208:372::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 13:23:41 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::3e54:627b:ceee:ed2b]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::3e54:627b:ceee:ed2b%4]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 13:23:41 +0000
Subject: Re: [PATCH] [v2] drm/amd/display: fix is_timing_changed() prototype
To: Arnd Bergmann <arnd@kernel.org>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
References: <20230417220827.3481168-1-arnd@kernel.org>
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
Message-ID: <3f4c2aae-40bf-3fc4-1af7-430809fab12e@amd.com>
Date: Tue, 18 Apr 2023 09:23:36 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20230417220827.3481168-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1P288CA0029.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01::42)
 To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5284:EE_|MN0PR12MB5739:EE_
X-MS-Office365-Filtering-Correlation-Id: b6d25318-3111-4691-35b2-08db4010201a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8VwIo/4GsT8ZSC0i9N6gaao8ZTV8FSml3VdtyrhfZxAE3jBp8rZ90cZ0RxMz82iZQFfs5pbBRDhN3v/5BEY0YG2TaBzHK15sqUVQV9WXUxA39M/uMP1xiLvEXJCyxK5Op+N+Pdznz32UAgJ17JkDvnoJvMsZHpHoXZvV5x2h5894EbYKzVa3sAzzDERAriABQwaBAm3ktqd4PuJL0POMuyOkxAbc7H4lEhk4H2UGNsmPOxzeFuG7y1Xv4i49wvlq7smaZDMhoSzsPx3haKPJBGpcMsK8o9cirNSErbbEsAOigfzw5ZydI6w5vw4/3Q6s/CmhE5Al2MZLUaDZCYn3l0SmMcs0gMaJAIONHcs96yTil/KDUjOo/hWfn1hF5A1a/Hby/w7djyzvzzDrHXvSFNfizXNmKWzgS7n7DuFoFD4Ged7HlhooypoUtyTMr6JiP/8pUxH98xcReoHhqum+qmDh7MGB3A4wPeVGm7KYuiOmVxvvJQKIr2FCRcbVnr5CN6rQ4A0pcuL5yyXhkn/11XQuOkQ/l9Qm03eX+F/Ozc0XnapDn5zOmFb+rZfXTUXKwufJ1Y2hLInycf+uDYwR1bFarg89QLDCyMjGit4FuerEvK3UUFsJB4LPrAZJf4qxpBWWWv1SAMLBX0NleL6dbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199021)(6666004)(6486002)(86362001)(478600001)(31696002)(110136005)(36756003)(2616005)(83380400001)(26005)(6506007)(6512007)(186003)(53546011)(38100700002)(316002)(4326008)(66556008)(66476007)(66946007)(2906002)(8676002)(5660300002)(8936002)(44832011)(31686004)(41300700001)(54906003)(6636002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OS9tVW54UWkyUzNaZGpKZXFlai9vcUJmcGVLdVNrZFNTVXpjSXQxdVFCZVVu?=
 =?utf-8?B?MTk1U2FKVXF6K1NIdmgzRS9vd3lubDRxWUJtWllSMkJQUEtPR1pKV0RQbkt0?=
 =?utf-8?B?NjdTbHBEU2d2ZmRvSnl5U1EzYkxONFpWK2ZHdndMUDZSSDN4eGMxRTFqdW5a?=
 =?utf-8?B?RnR4bjdvZFgxT21BRGx5ZlB4UUZ3RmlWUjFlSGkwSnJMd2VqN0RWLzVnd01P?=
 =?utf-8?B?aG5ncUliZThJS0R3UDJFYmMvL1huTXFzM2thZHgxOFlJalE5UitsaDdaVURU?=
 =?utf-8?B?WmtwMmZNOHN3cXJHdVkwYnhGSjVaWWsvNDBzQVN2U0dvbUdmVFR3c3ZYbU1j?=
 =?utf-8?B?Nk5xWk1IODZGQ1VhanFZbzhwVEFkYUpvWVh5UVVEQ21TWHFPWU5obEc4dEVX?=
 =?utf-8?B?NWZITUdkOU9hQ3pBOUtiUDB0RWJxVU5zc3JuVlpESnZnY1F1TlFtL2IwNnN4?=
 =?utf-8?B?ZUs0d3puK2VSTFF2TFJNd0ErR05ISkJsYVRLMFhPdC83dkNMcU02aHc3enZs?=
 =?utf-8?B?S1J6ME5FWHo0UG9mZkxQQzhuOEdESTlwTW1mOXNUV1pqT2k2dWVwc0RydmxE?=
 =?utf-8?B?cU1HUzBFcXR3QVNiRHp6R01xYVhIei9jRnlxTzJCWVdqY1lTZWdUbG5pVm5V?=
 =?utf-8?B?VjlxLzhtNkRYcWVjYU1iMnRNWVJlbFQ3SkNhc1JZQkVWQUdzVjVNZnM2M3h1?=
 =?utf-8?B?eFlpQnZ1dmhXNGZhTVczMXZiZmErUDJBbUZMQVlGeU1qUHNQYWhHREZXSk1t?=
 =?utf-8?B?dTdBQWwva1BqUXNkSWRzZXJkeHgveTV3VCtuSm5MVVVYcWRtYWM0VmFBcmor?=
 =?utf-8?B?cmh0VFpkdG1IL1BsQ2ZtaU9EQnNjbUNYRTVMRnZLMTB5cFpJTE9hT2R0a1dP?=
 =?utf-8?B?SDdMYmJPZUQvT0Vibms4b3VlSHRUN3ROQTdQOXN1TkRxeG96NXQ0YXdYT0RM?=
 =?utf-8?B?WlhXazdsSHNCK2xhK084OEUxdlVQMzlSdHdqRXBtUEVuSGNaalhmdHJoUThP?=
 =?utf-8?B?allSY2JrTmhTTytxU2RFY2VUV0MrQnpRS1ErWjFBanhDVGZxcTk2U0ZRWkY2?=
 =?utf-8?B?UVR5cmJvS09ySFhpakU1dkRUbFBvbGp5VEtGNlBRcFNiWllXczJ3TDZDR1RC?=
 =?utf-8?B?RmZNWHhFYVc4cU5rTjZuY2psSnJka3B2emMvMFNtUCsrOTdrMHM0aEhIVnFX?=
 =?utf-8?B?WjJKZUNoUXUwVE9SV21qN091QlNBMW9tYjNUdS9aN090VWlJY2R3anhZZmJi?=
 =?utf-8?B?SHRvL01uYkh4cHl1NHRNbHo5QVVrcHI4TnRKd3I3ZXo4bjJ1Mm9GMFRubE44?=
 =?utf-8?B?UWNWQzJITVpFVVJmamYzU2pwejhLZHQwSVFHU2t4aWtaalFwekM0Z09kd2Ry?=
 =?utf-8?B?aDlzRFdQSnpzTkdINHFvQXBoNFE0MmZJUkJZQUhwaTNCMEFsZXhIS2VQdHYv?=
 =?utf-8?B?em02bDdpV2dEbno0dlJpNXpkb0tqNDVZSmcvWXFjODJKTzVGcGpadG1RYWhJ?=
 =?utf-8?B?bm1KT2pLSFlwY0U2VjZ2V2k5cmdIRTd4N1U3dXJHZE9wWWdjMnU2SERpK2tB?=
 =?utf-8?B?S2R0YmJ3NExGWHArVm15S2RNZklvREx0R25USkFmN2ZjeTVQTjBidE90K040?=
 =?utf-8?B?aFVhWXkwQlJ0elEwQmZQZHUwZDlyOW9BajJCODdISGlDWEpWQzYxdWFTazNz?=
 =?utf-8?B?QWRJdGM4SWxtSG9hUXBobHlnSGVVeDZ2RnVpRFlXNUMyajFXckNwd0JFL2p1?=
 =?utf-8?B?ZlpKTW5uTHVhd0Nuand2bGdkZXYwajNOMU9NUzJxMEhiYjljMXl1czlnVllT?=
 =?utf-8?B?NFlXVnB0R2xiOU81NzJGNCtPNkVHV2xEbTAyQ3hSUkxHUE5UTG5kNlZ1eHo2?=
 =?utf-8?B?WDVHd1FDdjg2eWRzNERSalRoaEdZcVU5VWZLcXRucUt4V1VSbG1xcHJNUWNH?=
 =?utf-8?B?Z2gxZWJVRDhkcjhTOE9yZklUdHdueXVtZ0JLVDVMQXZSZEMvcnYrVTJWNFFx?=
 =?utf-8?B?UktIQXNaQlBTT0xGd1RkSENNdWNycGN3YjJBQkFWVXNRRks5NnFJT0V2NW4r?=
 =?utf-8?B?SWluWlhXa1FaQ3NUdm4vb2VlT0RsYXQvV3JsV3FKT1hkYjhsdkY0SXVmVCsw?=
 =?utf-8?Q?jMteYsi0eHcQMCg4dMwhL/vWX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d25318-3111-4691-35b2-08db4010201a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 13:23:40.8817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3/+9KrCSe3D3NQu1Au8R7v+AfgxVd9vjxrjvkzVJadBSQ5xGuI8jwjn8FXwyP/sqrIyRMKpBmiX5XD+6S1kvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5739
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
 Fangzhi Zuo <Jerry.Zuo@amd.com>, hersen wu <hersenxs.wu@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Jun Lei <Jun.Lei@amd.com>, Alvin Lee <Alvin.Lee2@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/17/2023 6:07 PM, Arnd Bergmann wrote:
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
> 


Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
