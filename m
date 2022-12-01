Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EC163F4E7
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 17:12:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362BB10E62C;
	Thu,  1 Dec 2022 16:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC4D10E62F;
 Thu,  1 Dec 2022 16:12:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwZ2zMzF1nUdkI+DF+YVsbVyYJKYVOuSbGIXz/bh6TGoZroAqbyrFeyoOMJQvQj5hoH8QNphT9pKSmJAOLnLXLMOCSnTILxymM85RLhuQylFZ6DpxkX2zOosljFJkpvdHZv3FNEdWF2Ok8lwV42P5TKY457qzkGP5ogJZl/w4wty7Dg6DMMgKAzHgNVVphnMj1heqr8kC/p7rJtLrz9YBM+i58smXfjqpYKhaq6Cb9nHZsfqihP6jN3JsfkJ7UdvHJ3fpKiC3zdmhvU5IEYwqxt7eIv2ey97eM6SyldDdn8BUpvqJYBaPtb+Btg4G9qjkAOuyphKPfOrZpsGyBFmIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Im/GABGCWNQolzsPGit5fXE2XpR8dTqI61EI3rheDUU=;
 b=lnLBenCwV5ygo+lN9efxnqesbrKq+AHIiP5pChZd7jXZUmjurUezGTd246FGqjxuqurhaEHufUR6G3k4ldIyCP1ydCKVlT3KRN7sh/RAt+m6Gvkwe8HqzrJNpAp/cXJsb3JRKTLFbCGy8U1nXzC+BXL1WO+3v5WBvGs9XCzlPcvpiy7hTcOZYknEN2AJKDdMxgKw5Rdi9XeBxCC7MCkM8iXVKFCZHli3NTuUkavKoYgsPjcH31MDaxrVF9HCYU76WfxK5VbPeQa99ObJ9WTq+4l7qizXAtvGoF0f7ecvieiZ07qWe3ygYW+br/ngR20Ul/SZz7Jrfl96zULjzPGiGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Im/GABGCWNQolzsPGit5fXE2XpR8dTqI61EI3rheDUU=;
 b=41Kly0U+YYe1AAsIVMysIX5Xgy2lpMms7rqJIUbUOFa9aTrmP4k4XZDW7FxIkNM3PpkT0NG+4gvXZy1NWbewqy853+2fRQPWoYyA3JvPm7YA7ZDwtOPKpXHjVbGA6W7AXwns7ZjmQkFWzA7pOf0fmv/HIxXsxILI3rzYslJ7oYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 SA1PR12MB7224.namprd12.prod.outlook.com (2603:10b6:806:2bb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 16:12:22 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::1e6c:6695:7097:c0c]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::1e6c:6695:7097:c0c%6]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 16:12:22 +0000
Message-ID: <a221ee69-0afd-ea36-1ca1-c5540da0091b@amd.com>
Date: Thu, 1 Dec 2022 11:12:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] drm/amd/display: add FB_DAMAGE_CLIPS support
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20221118215137.384884-1-hamza.mahfooz@amd.com>
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20221118215137.384884-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:208:32d::15) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|SA1PR12MB7224:EE_
X-MS-Office365-Filtering-Correlation-Id: 0084f37d-47d0-4152-0834-08dad3b6d2c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: alFxGGxytkJvwLOl4L0RJUggtufTdNqHil/gjQ8I4II+DPmBEOv1OEcKcCfEkwUhedF4clCBp5YIx0sfYKDT6pX8ok5Z5ctm7cd5oirgVUDPOapHLrwu/tMqv01vH4aFstYFdoXptm1Ni4SaD7WkIuM1NinGyYyUMXiM27+FWTsODHWSJi6yWVRf3ijjd13IthcgrrSdFHU6eMIToTDPk+fdhhtAyVZQBQjFVJDGsTC91Tfabj99mvSVd1vpvJjk2iJbbhNSAeZnJdMJxT1kIfbvt9iXPKC8tuXOEE/KW640+ngcVdJmj6cssPeokfiLzRz4U9evrFF1oKA1Q4kmx7oy4LXFZJmSrA4axVWQfP/CZnfeylEjUDcNsBnJwPN+EiDNFemOBv+uvqxbkiI9v/rxhiu4Nj3Jpj2qQhnKKKDQL9l6zGFYsXtG7bsaHNHhNmz1vxOFsrQJfw8OHoSRubbEZHG6SZRe/wWirZo3GS9HT7ERP1Gc30PUcC9nMnT4+OWRk2dpJ5Sc/fmkiDnnS9wxQczzQCbk/843a5LJbRgABv5jGwLIMB+misKqjg27G6OOX+1CmMDPgY/4dyoUYz3gBsEmSarflmxrgRkcWQ85qOLRSOqkAwfkp9I7w3WN8Uc3dP9dVDPElRe3EO6Ij+sFuLYTMWqO4Mw9SK6PjLW8hZA2NILrbVbJvLyV9xKOfVgHE1BtIV9rljydVoekpJ5015/2lWr9p604UvtkoLA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(451199015)(6666004)(2906002)(36756003)(2616005)(86362001)(31696002)(6486002)(478600001)(26005)(316002)(6506007)(66556008)(5660300002)(41300700001)(4326008)(8676002)(8936002)(66476007)(54906003)(66946007)(38100700002)(6512007)(186003)(53546011)(83380400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnhHa253dzJYN0phN1R4M2lEUDlWSnM0VDdxanZZN2xkTkZ2RXBTLzBrV1hm?=
 =?utf-8?B?bDYzMWpXRWJKRVpxV3poMVJMeHR5NlBWMWNjK3VSU2xhYjJBR1M4aTBVOWt0?=
 =?utf-8?B?UzBuT2FTV01FUXFMeVY1ajJnaFlLUkMwRmh3d3Brb1A5dTlDOWRhK1FlcUU3?=
 =?utf-8?B?SnZnOUU3dUNmS1hBTkFTdnlqcHQwbkFCNjJ3YnFvMkNLSXIrY1ZJcE12Ylc1?=
 =?utf-8?B?d01Ec1BCMUlIWnVQR2pUZ2o3MVkwOUdSanFic1ptQ2FMbVJheVVNZVpicWFv?=
 =?utf-8?B?Y3k1OTF1dWFNbWZCcUZwbUNjNUZCTkt0bVVCU3hqQjRTeUZBRDU2anFBVWJv?=
 =?utf-8?B?d1hXT2V5V0RJZUMzNVVWcmRPVGZ0NkJodFBUOFFIR2s1U0YyazBoeHFabXVq?=
 =?utf-8?B?eUNFYndacUVSSHJTYXZSY3lLOTB4c1E1eFQ3VEZneWNhaSt6Zy9WOEphZ09x?=
 =?utf-8?B?eEhrUVJHQmJqNG1LREl6RnRiNnlEQXdVbERvNlQ0dFhHaE8rZmtJNHBEWVE3?=
 =?utf-8?B?T25sblFyb2ZRVkgwTVhHamtxMGkwRUx4ZzJ1VTRvNFZ2dFc2UkRudXZ6Rkw3?=
 =?utf-8?B?Mm1IbXpDUU9SamNRM0F4clMwOGhHcWZrdmtBcmF0dVhrRU9rcTUyZHVNRlFP?=
 =?utf-8?B?V2tHeWNHMmNqNTNuQVJudkgyT3J3dVZLVXBybXQ1bFhiRWNlb3AzSXhpWE14?=
 =?utf-8?B?WHcyUlBYNTVYSVVnenZoVzhCN0JKeUxJM2VrL0JYREo5eFdqdm5DN1g1NkVY?=
 =?utf-8?B?Z0VlZE9UU2R1SkkyRzdXZlJaVGh6dDhPdTZyTHc3bFNXWlJGQkF3Mk1Tcmhh?=
 =?utf-8?B?cDNKR0tCdHdXK21ubFpLa3dLdUp0bzQvSDBEakJ5OHJWcEFoU2ZYNEFwZStH?=
 =?utf-8?B?Vkl1MmM0cWpKcGU3dlkwTFM4ZCtmU3VCeWhhVnk3VnBCUCtMUGp2WlUzTXd2?=
 =?utf-8?B?OGxLVHN6eDE5clZpWXc5ZTY0c1RsS3U0YVU2cm5mZnFKYWRtMC8xWEZoOG9k?=
 =?utf-8?B?SnhPRjF4alQ2aHorUzJicERCakxDeFNFZm0rbHhZRnROWUc1ZjVmcGIyS3Q0?=
 =?utf-8?B?R3pvVnE5MGs0cDZISi82TmRhbitEdkMrMjQ5dVN5Zit4YzYyZGpEV3lhR2pJ?=
 =?utf-8?B?Z2xxQnBPMFVkRmFVTjd1NVdPQ0xmajdZOVFweWFUMG5SV1kzOTJDdFNzWXpz?=
 =?utf-8?B?YmlwWUlFUFlsdWduY0daMEZBTWtUOEREZFZLVkM3dkkzN0F3c0xlb2FYMXZn?=
 =?utf-8?B?cUw1UlJiNUlLdExmZG1GbEVhMWdXU0FSTm1YRmpKMnRtanA4ckhhajhndm9I?=
 =?utf-8?B?dW9pZno5clFaa3hPK1ZSRVZIa0FjbkNNMDhtV0NyTEQxdURiYVVSOTFTeCtM?=
 =?utf-8?B?THFlSFhRU2xwTVdxblg0STVDdFRwdVVoOVlvYno2Y2lXci8veXRmSkJ5Wm9K?=
 =?utf-8?B?ejZ4RmxXamNWUmg3SWhXTkJuMWxCUDZseGNUWEhtbXFadGFkRXJmMUIvUk5t?=
 =?utf-8?B?eFB3YXo3UzhLdjJiTXdjSjArT1g4K1MyUkZRRzJ1b0NmUWNNOFNoSzRNY3A1?=
 =?utf-8?B?NU9OaGNvYjBxQldXanF5dTRuSnpISjNGL05oTFBqa1NSR3dVQkdmOE9IT1Nr?=
 =?utf-8?B?ckVEeFdxM3hNNXZ6SXdONXhPTENDSnE0ZElMelU1VUYrV0U2UGVkTmUvUUR1?=
 =?utf-8?B?MFh0RldlSEYvaXpkTmNVelo1WkJ4dXRDdnAxYnp2Q3VWVVd4N2FQK09iMjlh?=
 =?utf-8?B?MUNQdUtqNDNFRUFkeDIzSkRKSzMyZVkzNVk0dUdnVXNLMkw4T3MwZnNoUkFQ?=
 =?utf-8?B?eWNOMG9uUGxIQ2FrVTV1bFd5N1hYSEdFTWVkbWs2RzJaa0ZNSTJwTklVN2Vz?=
 =?utf-8?B?TmxLaEZrWnZPd1dKbHRVNUlOckthN1dDZC9FRWtJTk50dnBxcjRjTms0c3Nh?=
 =?utf-8?B?L2h6SGQ4SERYNkg4MDhsZ0tlY1VoWjI1VytuOGJiQVhhNSt6TXdyeFhqZUJn?=
 =?utf-8?B?a2s3ZFhLWml0TGRxU0NnM1p5US9BMGJhckV3UzNuS2NlODdKRi9nWmhtcHJF?=
 =?utf-8?B?REVrU05QVmdoSjVLNk9lTzZtWTVReWlOMG9OWlFqRUNiYzZvVFhUU1FlZ09s?=
 =?utf-8?Q?LfWNGxC3ukpkCMTFmRQDSBdwe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0084f37d-47d0-4152-0834-08dad3b6d2c9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 16:12:22.3552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJ64BNkyAMCzaE7kD1oegvmDgLiI/reO0bUqYq+xdCwimC1SuyHtZWwTXb0yHwlE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7224
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
Cc: Yifan Zhang <yifan1.zhang@amd.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 =?UTF-8?Q?Joaqu=c3=adn_Ignacio_Aramend=c3=ada?= <samsagax@gmail.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/18/22 16:51, Hamza Mahfooz wrote:
> Currently, userspace doesn't have a way to communicate selective updates
> to displays. So, enable support for FB_DAMAGE_CLIPS for DCN ASICs newer
> than DCN301, convert DRM damage clips to dc dirty rectangles and fill
> them into dirty_rects in fill_dc_dirty_rects().
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Thanks for the patch, it LGTM.

Reviewed-by: Leo Li <sunpeng.li@amd.com>

It would be good to add an IGT case to cover combinations of MPO & 
damage clip commits. Perhaps something that covers the usecase of moving 
a MPO video, while desktop UI updates. We'd expect the SU region to 
cover both the MPO plane + UI damage clips, or fallback to FFU.

Thanks,
Leo
> ---
> v2: fallback to FFU if we run into too many dirty rectangles, consider
>      dirty rectangles in non MPO case and always add a dirty rectangle
>      for the new plane if there are bb changes in the MPO case.
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 130 +++++++++++-------
>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |   4 +
>   2 files changed, 88 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 4eb8201a2608..7af94a2c6237 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -4842,6 +4842,35 @@ static int fill_dc_plane_attributes(struct amdgpu_device *adev,
>   	return 0;
>   }
>   
> +static inline void fill_dc_dirty_rect(struct drm_plane *plane,
> +				      struct rect *dirty_rect, int32_t x,
> +				      int32_t y, int32_t width, int32_t height,
> +				      int *i, bool ffu)
> +{
> +	if (*i > DC_MAX_DIRTY_RECTS)
> +		return;
> +
> +	if (*i == DC_MAX_DIRTY_RECTS)
> +		goto out;
> +
> +	dirty_rect->x = x;
> +	dirty_rect->y = y;
> +	dirty_rect->width = width;
> +	dirty_rect->height = height;
> +
> +	if (ffu)
> +		drm_dbg(plane->dev,
> +			"[PLANE:%d] PSR FFU dirty rect size (%d, %d)\n",
> +			plane->base.id, width, height);
> +	else
> +		drm_dbg(plane->dev,
> +			"[PLANE:%d] PSR SU dirty rect at (%d, %d) size (%d, %d)",
> +			plane->base.id, x, y, width, height);
> +
> +out:
> +	(*i)++;
> +}
> +
>   /**
>    * fill_dc_dirty_rects() - Fill DC dirty regions for PSR selective updates
>    *
> @@ -4862,10 +4891,6 @@ static int fill_dc_plane_attributes(struct amdgpu_device *adev,
>    * addition, certain use cases - such as cursor and multi-plane overlay (MPO) -
>    * implicitly provide damage clips without any client support via the plane
>    * bounds.
> - *
> - * Today, amdgpu_dm only supports the MPO and cursor usecase.
> - *
> - * TODO: Also enable for FB_DAMAGE_CLIPS
>    */
>   static void fill_dc_dirty_rects(struct drm_plane *plane,
>   				struct drm_plane_state *old_plane_state,
> @@ -4876,12 +4901,11 @@ static void fill_dc_dirty_rects(struct drm_plane *plane,
>   	struct dm_crtc_state *dm_crtc_state = to_dm_crtc_state(crtc_state);
>   	struct rect *dirty_rects = flip_addrs->dirty_rects;
>   	uint32_t num_clips;
> +	struct drm_mode_rect *clips;
>   	bool bb_changed;
>   	bool fb_changed;
>   	uint32_t i = 0;
>   
> -	flip_addrs->dirty_rect_count = 0;
> -
>   	/*
>   	 * Cursor plane has it's own dirty rect update interface. See
>   	 * dcn10_dmub_update_cursor_data and dmub_cmd_update_cursor_info_data
> @@ -4889,20 +4913,20 @@ static void fill_dc_dirty_rects(struct drm_plane *plane,
>   	if (plane->type == DRM_PLANE_TYPE_CURSOR)
>   		return;
>   
> -	/*
> -	 * Today, we only consider MPO use-case for PSR SU. If MPO not
> -	 * requested, and there is a plane update, do FFU.
> -	 */
> +	num_clips = drm_plane_get_damage_clips_count(new_plane_state);
> +	clips = drm_plane_get_damage_clips(new_plane_state);
> +
>   	if (!dm_crtc_state->mpo_requested) {
> -		dirty_rects[0].x = 0;
> -		dirty_rects[0].y = 0;
> -		dirty_rects[0].width = dm_crtc_state->base.mode.crtc_hdisplay;
> -		dirty_rects[0].height = dm_crtc_state->base.mode.crtc_vdisplay;
> -		flip_addrs->dirty_rect_count = 1;
> -		DRM_DEBUG_DRIVER("[PLANE:%d] PSR FFU dirty rect size (%d, %d)\n",
> -				 new_plane_state->plane->base.id,
> -				 dm_crtc_state->base.mode.crtc_hdisplay,
> -				 dm_crtc_state->base.mode.crtc_vdisplay);
> +		if (!num_clips || num_clips > DC_MAX_DIRTY_RECTS)
> +			goto ffu;
> +
> +		for (; flip_addrs->dirty_rect_count < num_clips; clips++)
> +			fill_dc_dirty_rect(new_plane_state->plane,
> +					   &dirty_rects[i], clips->x1,
> +					   clips->y1, clips->x2 - clips->x1,
> +					   clips->y2 - clips->y1,
> +					   &flip_addrs->dirty_rect_count,
> +					   false);
>   		return;
>   	}
>   
> @@ -4913,7 +4937,6 @@ static void fill_dc_dirty_rects(struct drm_plane *plane,
>   	 * If plane is moved or resized, also add old bounding box to dirty
>   	 * rects.
>   	 */
> -	num_clips = drm_plane_get_damage_clips_count(new_plane_state);
>   	fb_changed = old_plane_state->fb->base.id !=
>   		     new_plane_state->fb->base.id;
>   	bb_changed = (old_plane_state->crtc_x != new_plane_state->crtc_x ||
> @@ -4921,36 +4944,51 @@ static void fill_dc_dirty_rects(struct drm_plane *plane,
>   		      old_plane_state->crtc_w != new_plane_state->crtc_w ||
>   		      old_plane_state->crtc_h != new_plane_state->crtc_h);
>   
> -	DRM_DEBUG_DRIVER("[PLANE:%d] PSR bb_changed:%d fb_changed:%d num_clips:%d\n",
> -			 new_plane_state->plane->base.id,
> -			 bb_changed, fb_changed, num_clips);
> -
> -	if (num_clips || fb_changed || bb_changed) {
> -		dirty_rects[i].x = new_plane_state->crtc_x;
> -		dirty_rects[i].y = new_plane_state->crtc_y;
> -		dirty_rects[i].width = new_plane_state->crtc_w;
> -		dirty_rects[i].height = new_plane_state->crtc_h;
> -		DRM_DEBUG_DRIVER("[PLANE:%d] PSR SU dirty rect at (%d, %d) size (%d, %d)\n",
> -				 new_plane_state->plane->base.id,
> -				 dirty_rects[i].x, dirty_rects[i].y,
> -				 dirty_rects[i].width, dirty_rects[i].height);
> -		i += 1;
> -	}
> +	drm_dbg(plane->dev,
> +		"[PLANE:%d] PSR bb_changed:%d fb_changed:%d num_clips:%d\n",
> +		new_plane_state->plane->base.id,
> +		bb_changed, fb_changed, num_clips);
>   
> -	/* Add old plane bounding-box if plane is moved or resized */
>   	if (bb_changed) {
> -		dirty_rects[i].x = old_plane_state->crtc_x;
> -		dirty_rects[i].y = old_plane_state->crtc_y;
> -		dirty_rects[i].width = old_plane_state->crtc_w;
> -		dirty_rects[i].height = old_plane_state->crtc_h;
> -		DRM_DEBUG_DRIVER("[PLANE:%d] PSR SU dirty rect at (%d, %d) size (%d, %d)\n",
> -				old_plane_state->plane->base.id,
> -				dirty_rects[i].x, dirty_rects[i].y,
> -				dirty_rects[i].width, dirty_rects[i].height);
> -		i += 1;
> -	}
> +		fill_dc_dirty_rect(new_plane_state->plane, &dirty_rects[i],
> +				   new_plane_state->crtc_x,
> +				   new_plane_state->crtc_y,
> +				   new_plane_state->crtc_w,
> +				   new_plane_state->crtc_h, &i, false);
> +
> +		/* Add old plane bounding-box if plane is moved or resized */
> +		fill_dc_dirty_rect(new_plane_state->plane, &dirty_rects[i],
> +				   old_plane_state->crtc_x,
> +				   old_plane_state->crtc_y,
> +				   old_plane_state->crtc_w,
> +				   old_plane_state->crtc_h, &i, false);
> +	}
> +
> +	if (num_clips) {
> +		for (; i < num_clips; clips++)
> +			fill_dc_dirty_rect(new_plane_state->plane,
> +					   &dirty_rects[i], clips->x1,
> +					   clips->y1, clips->x2 - clips->x1,
> +					   clips->y2 - clips->y1, &i, false);
> +	} else if (fb_changed && !bb_changed) {
> +		fill_dc_dirty_rect(new_plane_state->plane, &dirty_rects[i],
> +				   new_plane_state->crtc_x,
> +				   new_plane_state->crtc_y,
> +				   new_plane_state->crtc_w,
> +				   new_plane_state->crtc_h, &i, false);
> +	}
> +
> +	if (i > DC_MAX_DIRTY_RECTS)
> +		goto ffu;
>   
>   	flip_addrs->dirty_rect_count = i;
> +	return;
> +
> +ffu:
> +	fill_dc_dirty_rect(new_plane_state->plane, &dirty_rects[0], 0, 0,
> +			   dm_crtc_state->base.mode.crtc_hdisplay,
> +			   dm_crtc_state->base.mode.crtc_vdisplay,
> +			   &flip_addrs->dirty_rect_count, true);
>   }
>   
>   static void update_stream_scaling_settings(const struct drm_display_mode *mode,
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index e6854f7270a6..3c50b3ff7954 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1600,6 +1600,10 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
>   		drm_plane_create_rotation_property(plane, DRM_MODE_ROTATE_0,
>   						   supported_rotations);
>   
> +	if (dm->adev->ip_versions[DCE_HWIP][0] > IP_VERSION(3, 0, 1) &&
> +	    plane->type != DRM_PLANE_TYPE_CURSOR)
> +		drm_plane_enable_fb_damage_clips(plane);
> +
>   	drm_plane_helper_add(plane, &dm_plane_helper_funcs);
>   
>   #ifdef CONFIG_DRM_AMD_DC_HDR
