Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 215524EC411
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 14:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841A010E184;
	Wed, 30 Mar 2022 12:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF27B10E076;
 Wed, 30 Mar 2022 12:30:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8d367zpVNcsKVWHvW2ku0+BSYR8t8hhMqeGhiAHcME76jH6MzWXu6A5qSzzeVWn4FLc/UQbqQTvIE//VkLFMi/mjfUPYTi3vyyq1yJAzIp1XTrc5767wFb55zca5UMFtYnaVhjOD+bbDSD6QOHf341Iqs3pyTk2YlsxIBQcfVYr3Zt3iYGje9yMg+AdPteo6S+jlNGLN6yEjcaa/SKYExgud5OjcRoMoh5o4HUz1DbCjkbhZZDEmfgM6OTmpN8JsGF9BXmBHN4zqCS2U7xz9mAOFgNiYMNq8ski8F9ew74DBJ8/RDEe6ik/R6AvI66wYzT5Pa1ga6heNGDzCBl1tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JE5l+GeklRwD7bAh5QoKcJhv+bXnImEzKlJsVbZAOFI=;
 b=Jl7QCECH+WOCR6WPt+kXCDyU0tWQFswcIQMTYFwHUN8wAHc34yBqDUruP3yo6KGA7RCT2ToUCTuzKksPUC4SLW3dXEFqIkNeyoMJBmmgRicMfvZRg4woSourwJNdlsGoxXtAgrFuNiYin2YZzVjjh5E+oPWOBZHfES4qxyut8qUIEVQp78ymMVfCPMKvhyRGMfvBkeWk9pHCsv9QYraU/4F9fCfVBzjiFZ6azWcMSIM35RQusjH8iNbFjQ8NlXws51wYY9AX8nM1zEE1pKIBcElhhuxlU8pL4kquDgRMotI8wPGRtroJZrUdGfT4AsXgfZaVjsQ7UFrK6AxghCFvog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JE5l+GeklRwD7bAh5QoKcJhv+bXnImEzKlJsVbZAOFI=;
 b=VXCoGDWSzyr9LQ8HND678AiThEiegAIwRhFyqcR6212DKzKAS3d8Mv7ShR3bc29Z2+9IHRtktiKWFxzTF4jMPkzS6L6D9piZMQAH+nnEHgzOFzRGsgFF5yNxelONQyhycE6buNXvy1n94VV2FO8p1lQhxUlkfrdlA+ZFxss3maY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2896.namprd12.prod.outlook.com (2603:10b6:208:ab::22)
 by CH2PR12MB4295.namprd12.prod.outlook.com (2603:10b6:610:a7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Wed, 30 Mar
 2022 12:30:25 +0000
Received: from MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::84a2:64f8:f2ec:fc08]) by MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::84a2:64f8:f2ec:fc08%4]) with mapi id 15.20.5102.022; Wed, 30 Mar 2022
 12:30:25 +0000
Message-ID: <f0c7adf6-7417-3773-3780-4a273e9ffb1a@amd.com>
Date: Wed, 30 Mar 2022 08:30:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] drm/amd/display: don't ignore alpha property on
 pre-multiplied mode
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Zhan Liu <Zhan.Liu@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Simon Ser <contact@emersion.fr>
References: <20220329201835.2393141-1-mwen@igalia.com>
From: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
In-Reply-To: <20220329201835.2393141-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0289.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::24) To MN2PR12MB2896.namprd12.prod.outlook.com
 (2603:10b6:208:ab::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7058cf13-f149-4b14-e1d9-08da12491124
X-MS-TrafficTypeDiagnostic: CH2PR12MB4295:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB429503295F4454419DACC4EE981F9@CH2PR12MB4295.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2E1eXdMC46ldGjMofJ7IUP9VOQ/UeGGOxgPNwSK1zYLuziOOM78Upcs/eQ2vpMbTEBmhQYvudcYzHaVr6H1gw30LoYELD94vI0NNuAcrXEltquLRO9KqmHLuX/WXECvtGsMH07KZJTMrSWPVahT5xYoTkK2TI7QaElRgWWzjHgCi4OBgz42QywapPN9xgXYYTjfvi9Z8jSyLp8DGgeORD52aMoWarsmsGcS8sq9Wzmup9vGheq/HnTqF/fecmtMcwBnxXuD+QRND/g52nYX9y5pPVNBz0vRsIqlv4+4F7Xt6aSDMnMO1ABT7c4689EbNrOaEhMUiOULpayFwYHkXF84v7mmJix40mVVCqMfgVfolqjfIKPadmX+ISDhV4DWOI+WplZFvbxbUcOPbGZ9zCSkES39sofjr4qhC3LrBkicfno4nB9cGI1oD7no5FhFbhhmKsTCkJKZ8AWkI4A5NrKCNoYmecPGZY0X8aM2exWFnJhXz0GqGl3S4iULCKQpgp5zpD7MMKMBuRuYZsXJhNCqy0E73uvvxfr//0yvSqyouDXeSb7HfLyBN+T7tG4I9MPyS/uD9xb4XSZlgTjb/I5iFArQAHwWQ6LVewMfw/DkZlIsJ7ufO1p31C/V/1W2eni29AleIs71agdfoV11m04X+zfAT4tyyu3lOByETKNdjSrXSDrK7COjFMa9epu2EaCIkpY0FcBu50/W6nHY1JJtruL1qqCjzmAssYrVQ4UxQwsFHlkYVqRnpQVlbYzPP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2896.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(4326008)(83380400001)(6506007)(53546011)(36756003)(31686004)(2906002)(31696002)(66556008)(66946007)(66476007)(5660300002)(8936002)(38100700002)(6486002)(966005)(508600001)(54906003)(186003)(2616005)(110136005)(316002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3BOemFTeFlIK2FIbVM5TW5hNzlmQUV1RlY3bENnUVlnUUNvOEo4SWpBcXp0?=
 =?utf-8?B?TFlaUk00MHo1MVlRNlhvWXJPSHE1dTlNanVUeS8rbXc5R2JOcVNFb1BkSFU0?=
 =?utf-8?B?dUVzWjVVRm00Ky9mcjFucWJ4RzVOWS9abGZwTW0xWndIa0EwdGN4aUVjS1pO?=
 =?utf-8?B?bjVVVkJSTkdHN2pUcVJPTkppMnE5Mkg4WG9hMlc4TjdQOUNiUFcxYVNmRUU1?=
 =?utf-8?B?TTc3N1BGVlJRRUtoT1ZuSVBmanBqc1JzSWpqOW9BYWJFejhUMkFScEE0RExG?=
 =?utf-8?B?Y2xCQzNLWlFsc0VrQjlCdjBBRDVBbG5Kb2MvQ3pXZDZxUWpLbk0xall1TlQx?=
 =?utf-8?B?MXNuUHlMb3BabGdzd3FldEp6ekwyM1hVYzFJaFBWSkZ4VXVPQlMyMnAvdGNn?=
 =?utf-8?B?L2JKRWVXdmFnaWI0SHpKbjdTWW42aDl6azRRemxtWjBuU1J1anFadDlGRkN2?=
 =?utf-8?B?aGhMTTArOVFLeWF6WXFMbHZ3UWNYZWlPbWEyWE1WRG05VG9UUFNFbFJITXZP?=
 =?utf-8?B?ankvMmd2NGNnNnZnZnJaNy9BSGpzeCtmUDMxNXducEhSNDBVbjQ4M0o3bVFj?=
 =?utf-8?B?c2Y1bFVjUDIwUGFtU2lyRXZvOTh4OFY2ZFY4Tk1jK3NCN1dqbzd4MDVrcW1z?=
 =?utf-8?B?bWgvd3UyK3d1cWFJcGROalRjRXcxZGJKaUQ0MkxKYTRKdTdhSHlpUDkxSUcy?=
 =?utf-8?B?QzFiTzVTWG54K2dVZXRvclYzYlhxTnIwc21ETU80WXQvY0svOTkyWlg2eFcw?=
 =?utf-8?B?dHQwMDNFcEIwNE9yT3V6dmp5c08xOGNXSytuNXVYVUFEcWU1VlR1RFdlc3Ry?=
 =?utf-8?B?UTFYdGt0YjJwNWVNclFhbjdwTmxEd1JkWVA3MkNrSEIrNHVQb1FCVDRzQW5q?=
 =?utf-8?B?Z1JGRjRUVGFQNWc1TnNrdXoyWmlzZjBkN2NQVHNEblNnbU9ESm50OXhZOWtR?=
 =?utf-8?B?Y3R2K2s3am5ESDZIdC9EN09ER3lmT3ZCUGRjcUVDQjJXRkhWSnUyaWlmemxj?=
 =?utf-8?B?Vnc4MC9hS2Z2UWE0Tnh0V2p2eHY1UG5VMk4zZWt1elJ2akppcUVNeG83WGRa?=
 =?utf-8?B?MHpKZUdIemsrUnBTcFZvNGhBZGZMYkxaYXdIaEptMlk0bW5ZazgyenM5S0Yw?=
 =?utf-8?B?SEc5b0lRYm1qRkJmS1FScGppMzI5WC9sdlZheHdmcjNDTjFyTjNDY3lRc0lJ?=
 =?utf-8?B?OXFPbjY1R3JydFJ0MW5XNmdNaXFCekVudUE5TGI0dVNuYmhsNGRDY2RhZzRU?=
 =?utf-8?B?VWtTSDhUWWF3NzZ2NksrVVRhUVFrdGEvV0RjS21taWVEdHRpQjdNNEx5djFu?=
 =?utf-8?B?QS9NM1VManpsQ1Q3M3R2aXBOMnRXSXFjUmR5VXNpaFBuOHpPNmV1U3p1cTZy?=
 =?utf-8?B?dmRtYzZsTVVXTktCeXhtaHFQVGYzYmE2TUpYVnZSNVBGM0lFWjA4TXdFZTdV?=
 =?utf-8?B?d2xHb01JMmtNU202di9VRzBBUEhUQmtTUUI5WDRzRFhWN1NXOFIwVjN0a2Y2?=
 =?utf-8?B?ZDEwanV4UGE2TzE0c2M1ZWtENHJzczh3TjVXN09FZGc3bTl4RGFNZUkwQWVp?=
 =?utf-8?B?KzNwdVJrM3ZZQnQrVDNFQUpFRTJoRFBkN29qLzVKMHFxYm9pQWhLTU05ZlAy?=
 =?utf-8?B?QUpjUkdsell1VCtPUjJwa1dzdzcvd2dQZHptTTZtNllNYjFXRlZ4Q2FpS05Q?=
 =?utf-8?B?WDlQZ2FOQ0hESVV5a3dZMnpnOU9iSFJpZWdHUStELzEwSGhrMGNyWDRWY0NX?=
 =?utf-8?B?bU9BdllTWGx1NENiRHptbE1sSDRycCtTS29zckdZa1AvaEgrOHQ3TU5lSTh4?=
 =?utf-8?B?S2d3QXUzWWRuS0M5YzhpRDBqMTdYalJpZTVwOEkybHdsSnA0bnJyL25HL1Vl?=
 =?utf-8?B?TXlLcHVtdWNnMGd2UUdYUjZ3VkJ5SjF5VStsLzRlNUt1YjdCS0hBdTdBZFdx?=
 =?utf-8?B?SzFnVm9aQTlIWFJFakV1bW5xMWxvaHc3cXlpZnFXcy91RHBDUXI5djAzS2pC?=
 =?utf-8?B?b1dSdU1laFB3cVdieE5oWSthckttekdIZkhVWFdXMmM3dXRhRTREMlZyS0hm?=
 =?utf-8?B?K1RBOWdZYks1VU9ISzhyanpCWVdrZUlhOTh6SGp3d3pXWUpVcldPY0ppZVFJ?=
 =?utf-8?B?VDh2UnVaZFZwbE9kSjZkclh5Vi9DVFMydVk2YVhXWE1zMjF3QUc4M3Nrclhp?=
 =?utf-8?B?dXAwL051eVV1MDFSb00vdDlscHBnRkYwenVmRFJxTVRBSzlnbmd2N3hVVGJU?=
 =?utf-8?B?WDhhZklJaHcxYkorSDQwZW1jSlBJWWdrbTYrcytWU2tqbWNNdzQ4U0RydFls?=
 =?utf-8?B?NHUxcHRxODBUY1dOdU45Y3V5eVNrQkVMYjBkcmFyTVhlR3RyTkM0Yi95Yk5F?=
 =?utf-8?Q?T1XP0Lfok0VESF3m08YExhdNxTTkR99vGGeqdQ2mLoGKk?=
X-MS-Exchange-AntiSpam-MessageData-1: 2ufLeIJ8o8E7hQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7058cf13-f149-4b14-e1d9-08da12491124
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2896.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 12:30:25.7763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j2aateFisorwhgTeUNskjBrvM+y/MRRIgydP/DquhJvGwEvaroLYi0x0IkNi2rkb9qACcJ7vqudfstbFgJd0Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4295
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
Cc: sunpeng.li@amd.com, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Agustin Gutierrez <agustin.gutierrez@amd.com>,
 markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-03-29 16:18, Melissa Wen wrote:
> "Pre-multiplied" is the default pixel blend mode for KMS/DRM, as
> documented in supported_modes of drm_plane_create_blend_mode_property():
> https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_blend.c
> 
> In this mode, both 'pixel alpha' and 'plane alpha' participate in the
> calculation, as described by the pixel blend mode formula in KMS/DRM
> documentation:
> 
> out.rgb = plane_alpha * fg.rgb +
>            (1 - (plane_alpha * fg.alpha)) * bg.rgb
> 
> Considering the blend config mechanisms we have in the driver so far,
> the alpha mode that better fits this blend mode is the
> _PER_PIXEL_ALPHA_COMBINED_GLOBAL_GAIN, where the value for global_gain
> is the plane alpha (global_alpha).
> 
> With this change, alpha property stops to be ignored. It also addresses
> Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1734
> 
> v2:
>   * keep the 8-bit value for global_alpha_value (Nicholas)
>   * correct the logical ordering for combined global gain (Nicholas)
>   * apply to dcn10 too (Nicholas)
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  | 14 +++++++++-----
>   drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c | 14 +++++++++-----
>   2 files changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> index ad757b59e00e..b1034e6258c8 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> @@ -2528,14 +2528,18 @@ void dcn10_update_mpcc(struct dc *dc, struct pipe_ctx *pipe_ctx)
>   	struct mpc *mpc = dc->res_pool->mpc;
>   	struct mpc_tree *mpc_tree_params = &(pipe_ctx->stream_res.opp->mpc_tree_params);
>   
> -	if (per_pixel_alpha)
> -		blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA;
> -	else
> -		blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA;
> -
>   	blnd_cfg.overlap_only = false;
>   	blnd_cfg.global_gain = 0xff;
>   
> +	if (per_pixel_alpha && pipe_ctx->plane_state->global_alpha) {
> +		blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA_COMBINED_GLOBAL_GAIN;
> +		blnd_cfg.global_gain = pipe_ctx->plane_state->global_alpha_value;
> +	} else if (per_pixel_alpha) {
> +		blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA;
> +	} else {
> +		blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA;
> +	}
> +
>   	if (pipe_ctx->plane_state->global_alpha)
>   		blnd_cfg.global_alpha = pipe_ctx->plane_state->global_alpha_value;
>   	else
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
> index 4290eaf11a04..b627c41713cc 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
> @@ -2344,14 +2344,18 @@ void dcn20_update_mpcc(struct dc *dc, struct pipe_ctx *pipe_ctx)
>   	struct mpc *mpc = dc->res_pool->mpc;
>   	struct mpc_tree *mpc_tree_params = &(pipe_ctx->stream_res.opp->mpc_tree_params);
>   
> -	if (per_pixel_alpha)
> -		blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA;
> -	else
> -		blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA;
> -
>   	blnd_cfg.overlap_only = false;
>   	blnd_cfg.global_gain = 0xff;
>   
> +	if (per_pixel_alpha && pipe_ctx->plane_state->global_alpha) {
> +		blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA_COMBINED_GLOBAL_GAIN;
> +		blnd_cfg.global_gain = pipe_ctx->plane_state->global_alpha_value;
> +	} else if (per_pixel_alpha) {
> +		blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA;
> +	} else {
> +		blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA;
> +	}
> +

Hi Melissa,

Thanks a lot for this patch. I run your patch in our CI, and everything 
looks good from the IGT test result.

In this sense:
Tested-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

However, I think it is still necessary to have someone else review.

Harry, Nick, or Zhan, what do you think about this change?

Thanks
Siqueira

>   	if (pipe_ctx->plane_state->global_alpha)
>   		blnd_cfg.global_alpha = pipe_ctx->plane_state->global_alpha_value;
>   	else

