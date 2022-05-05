Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B6851BCEE
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 12:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D04D10E809;
	Thu,  5 May 2022 10:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9254110E809
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 10:14:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OuxLUkEIqREEwyYM6IwPD2umur891GS9Ik76Wwkad0HD4GXymkQtRxYY1R0Y5jj2Y7AHTl2J8R5gdCqkoZmqPgVzZ8o3cUHpEKArtTActrST1IQxRUeQffUZbSnUhvHhNx7duyXGrx+kIGyB0okkfdfI8/cWwKzl2cncjDTZp+YXmsoAchuW76bFcvt6vzrg5wHWEaJda23eQG4kjIr6d6oK8hIoAbP1c14f6sips6IrJkueLliAFZWoJWRywm1yn4gTKSUDy2+WzhcxCObx3Y/635uDTzqrv+SzMIU5itJY+XaTQxhftVFx7ceSbkF0ABzr7GY9rDtCvlyXSsByxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6TgMyXLeijrKca3dkWP5quDxACmt3dwp/rkJNE7Oj0=;
 b=gu6BXRJwcBxnAvnEVifR4GbH+UaEET4QdJt9MZQRvy5fsC4qel6/MiIx0KN/3sNvZ6xQOvgAMe4i2ABmBSuVhgq4nMll+Zn6xyCYK4rhTmqICaD6sCs1LiRW4k/etIZt+5pHxbFO07HSka5i1H4pvrsZ8nbkq/ZF4xjB5r5bEokN53HlSoO7OGK9Bpm9pKOBnTCry0IaJ8+M5IgWgGJGS5R+wFvmDcvwuFTUYF4AN0jVwN69/g9zLXTSYuWkXTbMbi6eZSs/k1VoKtRjpT8wGGjApXbVoddxxg/InRGECGJx5WgYpZ8JLlW9T7Z2uxXLk0/G+iW8Bu4ZQov+1/ul6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6TgMyXLeijrKca3dkWP5quDxACmt3dwp/rkJNE7Oj0=;
 b=M5+qVSuCizx2upFz/+7XxXtx1sGAVK/CZhU2EykFkfdSWKqrvRo9RyGK0N2ohTX5fLOEH/hfWmb480UeD5vIi/XfTDZiKkm9UduvoKlujOPsdWVQeo2B4aaJB+4FEUwrD9Ig4keUrNWSfG7R7kBHNdp2t0KomLDzBiNlx13n1+s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.14; Thu, 5 May 2022 10:14:33 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f%4]) with mapi id 15.20.5206.025; Thu, 5 May 2022
 10:14:33 +0000
Message-ID: <906deb55-9c3e-7206-af6a-d57d320ced7f@amd.com>
Date: Thu, 5 May 2022 12:14:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/4] drm/amdgpu: switch DM to atomic fence helpers
Content-Language: en-US
To: dri-devel@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>, 
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
References: <20220429134230.24334-1-christian.koenig@amd.com>
 <20220429134230.24334-2-christian.koenig@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220429134230.24334-2-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0166.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::21) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01a6eac9-be59-4c36-329f-08da2e800ca3
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB6373EA765A20CE05A824C85D83C29@DM4PR12MB6373.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WhjmlPHHrgBGYdCAQaSf4axO17gPUe3whKgbIJS5ngJsIlwggUM0/MXu5R7JG+2Qt0YMWTvnFrUEqFFoe5soHLbvnJxarDuiY6BxkyWMkYuoZFgydWximW3lAX3FcIApdzf3B7tRMeTsEROoc74Zp7F8MsxNsqQIrNoXFEjeQIB6n/b3w0SjobAaMvNeDVCbyHq6BQTWBEWh4KoVtHBHi1zEZehJgTyzm4i8i0473OdqtVq/cy3O4tBCyy8IsR0vwTxgOwDbKtcRsfPRftGW+xusMzs/FDt00pGUrfRX1Wa/1WhKvj/z5atHsn1qJffVMf96C0lzO7XAmUlZvISMis4gIkX3eDEMs4yZxzjC4J/h1pj3KaUh+eyuBgQYnFS6bdWSa7Hvdo0hS16EgqLhvs44sBwyJYEyAzERr8G+V4mFhK3kZsEbjSAqBnSKcrbrEmEhTnXGfVcGSbw+46Ga4OyN6IcmJENFvXOPlm7Q0aXR1xm0P1yNtw45Wx98cIZFQf5zgqCrpGWD/C2BAyEgiu19CXPzSPRaRZMOcFI4bNWhN1gZ0vqGhQEF4pKRkpMO0+pEKx4iago8OL539x6H9fRTPj9xcJ8she2Aih4/OtoOgnrtCs4IcJW5q7+d2HRezs2CZ3iRVcnb3UL5MHlt4Nfce0udv8FBAcqSwVXSnI/PTK+E3D69dY2uYGjyKJpzC+yR2aHKjXSFArbm1hVVF8eBjgYuImvYHOxrdEW+488TO3FUZW4nHdjs5M+hzTf+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(66574015)(2906002)(6636002)(6506007)(6666004)(31686004)(316002)(36756003)(186003)(110136005)(38100700002)(54906003)(8936002)(83380400001)(8676002)(6486002)(66946007)(66476007)(508600001)(4326008)(66556008)(86362001)(31696002)(26005)(6512007)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlpGQUJQVWlVaWVCdDMzNzAxSjN6VExQRFNPc1ZJSGNiYVBLcG1rK2o4OXZ1?=
 =?utf-8?B?OUd1b2NVTjJkQitJamIwbzNqbHV3UkpiUjUySVpGeFJGSnhYZGNDWUdvU1I0?=
 =?utf-8?B?Q25WbHgwcGtvRzRkMTNwcWhXZjAwVTZWUENkVno0cy93N1BpZkR1eGx3VWF3?=
 =?utf-8?B?eUtJU1dZU0pwd0hKWWFJMEMvNU1sZzROWjI4SlFGR1IrRHJJSzMwQmJ0bHhT?=
 =?utf-8?B?V2htMmdWdTZZRktVaVE3Z1pVQnc5RWlUNnQ0UlV0VXRBcDJ2RkpONmZrVFhY?=
 =?utf-8?B?WlQ0TlJhRjRlaGJabG56bUNha0hyYStNYng2aEEvKzhTYVJ4WGtNUTJHc2xa?=
 =?utf-8?B?WnJmTUJDaUVCbmhWdVZzWUFITGQxeDVmV1UrSjAxUTB3c0FUUjhrM2cwUXVu?=
 =?utf-8?B?Y0psNkNaWm9lbDRaenNNa3IwSnFtcEVjQXB3aGZncEdXNnRia0UrTVAxeXRK?=
 =?utf-8?B?d05DUzFQalRRQ2p3bVBwaUZxTE1acGo2a0ZORGdHMFVoaTF1dTRvYzhKbGVk?=
 =?utf-8?B?KzdJWmtCdExBUmtzTmpveWJjMkxLbXd4ajgybE9lbGNDeThVcnlZWDYvcmFY?=
 =?utf-8?B?ZG81U0MxTTJrQVU1c0JjbTMrdFJBN0hGZmRsTnlXd3NzenloNk5xU2NnL0xH?=
 =?utf-8?B?QVNVYUZmd3hJaGwzai9RSU1XTndOZWphSlY3ODgwd1MzSEdtWkw5VTNzKzZh?=
 =?utf-8?B?ZWhSWnVkNUNuelNvZStpOWErWEU4b1NoTjk0Q2k5OUU4QnlxOUNVZ0p1Y0Rw?=
 =?utf-8?B?ZjBEdnkrVkZVOTRqVko3KzhxaFJIUGVWbkRqU2FUWmJLL1I1WWFLcmVjWHJU?=
 =?utf-8?B?NzlFd2xTWnFickovcVZRSzNod1RFWGI5L2h4MGtXS1UxYzc4OUlDMzNSL1VM?=
 =?utf-8?B?aFVXMFFPWGxvOFZiSEI4YzdTUG42SVR5YUgweWp0a0QvamUyMGx1b1FwMm1M?=
 =?utf-8?B?NGltY2FYVnk4MnBaZU1zYk5RV25oeGppS0daWUJMdHRINXlFTmN2aHdnYnMz?=
 =?utf-8?B?QXlkU2YyMTJzaHlkbHQ4NTY5dHl6S0R3UnlqSXRxQ1ZFOTNFQ2RVVFZhaHc0?=
 =?utf-8?B?TXVyaHJMdTFXM1FTckE2TVNaUWdRZ1JmakUwbDBvUE9FZ3BLOExSeXgwQ2pM?=
 =?utf-8?B?Szk3SVVEalN6emhKQzdzU3U5Mi9yNXlGdE1mV0RpM0VTVTZuOUtLL1FZNXNn?=
 =?utf-8?B?QzRsM24zSWd3T0J5YVNXQlNXSFhMVmlZTm45d0kyR1JXUTlXOGVLLzVzZC9J?=
 =?utf-8?B?cEhrNE1lenAwdTFzNTc2ckR6VlZXNnBhUEpaOHA1ZEF5VnpCVjdhR1p5UElv?=
 =?utf-8?B?RkkwWlZWQnV4Zkh5REQ2aVZPa3ZwNjJNTEtRNk4wVFVpNDBidGF4ZVIwMEFY?=
 =?utf-8?B?Vm1DN3RKWlFHRXY0WHkvNmhHMkFsSzBuUjJvcUpkbXRtbUpKVHRPMHA3YU9K?=
 =?utf-8?B?VERkY1lCTDQ1RnJkQ0ZwV0xrMFFneEgxZzBjVkM2L3dxSFRNeWp5OVpST28y?=
 =?utf-8?B?cSs3SWwzdWU3VDlUc1k1ZFJnUVF5ZlYzdmNBaGoydkFSL3ZmODNWRWhQR2Zn?=
 =?utf-8?B?REd1VktCejliSjhvN0xZM2VodVJaQlo3Tm9FNjJBTEMrL1QweC9udWtuNjJF?=
 =?utf-8?B?d05LSitnL0dqRmhpMjRPQWRCNXlRZzh6MUxaMUFXQ2ZsM0NJVTlyckRHVGV5?=
 =?utf-8?B?N1N2SXlwVWxBNkpVejcyZU5UU3ZnQTNsdi8yYjJPSHYvczdSR1F6Z0psNksv?=
 =?utf-8?B?dmI4bzlKMGdybzFnL2pFYTJsWk9TeG11U21nNHBNNmhRVXpNWWFhQTZDM1gv?=
 =?utf-8?B?WnEyNXRkTG1WV04wendDMkk0cXRSTXgzYm1zWThwNUpsR3Nwc0NjVUtKQUZT?=
 =?utf-8?B?VklDeEVTVFBBaG0wYTdibCt5L0tia3JKWWI2YzNFdmgrWkszNllHaHBRV09M?=
 =?utf-8?B?L1prTjltTlc4NTdzSTN3b1lsVjJDRUVOWkZ2V0h4c3RSZGtzd1V4OGEwdzV1?=
 =?utf-8?B?ZXpyK2pLUVc5SXlmOEN5U0xsb0xXUjAzVkdBcXJqc1g2U2FTZm5VSlliRTB2?=
 =?utf-8?B?ZUs3bE9tZzJuUW9UcURLZnBGZFRNSG5lYlg0Sys2eEhDMG5ZOG9rNFFoeEtG?=
 =?utf-8?B?U1RRaDdLSUxibFAyMkxaQTNzWUZVKzVZSWtZVlBOZlZvSWN2eVZDUFBwbmJO?=
 =?utf-8?B?c1d0MmRQUUNhVDNhYS9ubnFmN0lLeHo1cUdrcU40VUFuS3c1ekNydFFrN2dM?=
 =?utf-8?B?S1hPNjV1SENDQkFCSFB4VWJ0Qk1QSy9hajR5UlVoM0ZoRk4zYkEzUTBRb0tn?=
 =?utf-8?B?b2UzZm9INlJZWGpsSmZlTlZuZUIwbE9LQVJKMnpmTGlSa0ppWk1wdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a6eac9-be59-4c36-329f-08da2e800ca3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 10:14:33.4528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0y7g0+4NHO/SyFDZsLdTuVpbi3u/ljXyQL4X7R8F8I4BD0miXKM/oAHkKI4UzO+x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6373
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
Cc: daniel.vetter@ffwll.ch, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Roman Li <Roman.Li@amd.com>, Jude Shih <shenshih@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just a gentle ping on this.

Harry, Nicholas any comments or can I push this through drm-misc-next?

Thanks,
Christian.

Am 29.04.22 um 15:42 schrieb Christian König:
> This gives us the standard atomic implicit and explicit fencing rules.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Cc: Roman Li <Roman.Li@amd.com>
> Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>
> Cc: Jude Shih <shenshih@amd.com>
> Cc: Wayne Lin <Wayne.Lin@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 23 ++++++++-----------
>   1 file changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 2ade82cfb1ac..c5b2417adcc6 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -83,6 +83,7 @@
>   #include <drm/drm_edid.h>
>   #include <drm/drm_vblank.h>
>   #include <drm/drm_audio_component.h>
> +#include <drm/drm_gem_atomic_helper.h>
>   
>   #if defined(CONFIG_DRM_AMD_DC_DCN)
>   #include "ivsrcid/dcn/irqsrcs_dcn_1_0.h"
> @@ -7627,6 +7628,10 @@ static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
>   		goto error_unpin;
>   	}
>   
> +	r = drm_gem_plane_helper_prepare_fb(plane, new_state);
> +	if (unlikely(r != 0))
> +		goto error_unpin;
> +
>   	amdgpu_bo_unreserve(rbo);
>   
>   	afb->address = amdgpu_bo_gpu_offset(rbo);
> @@ -9160,7 +9165,6 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>   	struct dm_crtc_state *dm_old_crtc_state =
>   			to_dm_crtc_state(drm_atomic_get_old_crtc_state(state, pcrtc));
>   	int planes_count = 0, vpos, hpos;
> -	long r;
>   	unsigned long flags;
>   	struct amdgpu_bo *abo;
>   	uint32_t target_vblank, last_flip_vblank;
> @@ -9173,6 +9177,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>   		struct dc_flip_addrs flip_addrs[MAX_SURFACES];
>   		struct dc_stream_update stream_update;
>   	} *bundle;
> +	int r;
>   
>   	bundle = kzalloc(sizeof(*bundle), GFP_KERNEL);
>   
> @@ -9181,6 +9186,10 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>   		goto cleanup;
>   	}
>   
> +	r = drm_atomic_helper_wait_for_fences(dev, state, false);
> +	if (unlikely(r))
> +		DRM_ERROR("Waiting for fences timed out!");
> +
>   	/*
>   	 * Disable the cursor first if we're disabling all the planes.
>   	 * It'll remain on the screen after the planes are re-enabled
> @@ -9235,18 +9244,6 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>   		}
>   
>   		abo = gem_to_amdgpu_bo(fb->obj[0]);
> -
> -		/*
> -		 * Wait for all fences on this FB. Do limited wait to avoid
> -		 * deadlock during GPU reset when this fence will not signal
> -		 * but we hold reservation lock for the BO.
> -		 */
> -		r = dma_resv_wait_timeout(abo->tbo.base.resv,
> -					  DMA_RESV_USAGE_WRITE, false,
> -					  msecs_to_jiffies(5000));
> -		if (unlikely(r <= 0))
> -			DRM_ERROR("Waiting for fences timed out!");
> -
>   		fill_dc_plane_info_and_addr(
>   			dm->adev, new_plane_state,
>   			afb->tiling_flags,

