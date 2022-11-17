Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AAC62E311
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 18:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E805510E19D;
	Thu, 17 Nov 2022 17:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5691310E1C7;
 Thu, 17 Nov 2022 17:31:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hOfcv6Wt1/bs57pB8CzdTD1IU7QdSCddFGP9FDW7j7gM9Gg6EusP+6gr8x05IVPFqVyPgxuwJ9Sn9X1EYX7ZOXO+/Fy3fzLufjdmNirc+I7oU1UZZfwKG/D+pBq6JVVyKt4SwwHJu+sj2D6Nr096Dkvrdh28kq9Tjlzi7HvmQxL/L7pVo3BvD1RZ37sO4iV42GSelz1KBSlCp5SCJGr5vs9ieCDDttwyfB6Xz4gzq0Y7NPcfURXCyJLg+N41QudQKTUrim/FcctaQjZcLHeGtw4Qk83VyKxeoBPq4ImyGZGVDkAvXiB5vu5cCMqyMAt9cE/p3uk9Rp2Ezekd9MUpUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crZGVqJtjw0Vyio4pIBD/dLGZY0JrDeGw9pgFeJKM88=;
 b=JuCLsIpu/WS2N3dP4klrfBaXL4l7iFAlHZYTbvHZZxwmFV5A47lkxnc8aIehRskoXWWKoTmmxgkwzvTWAYns0+nbt39a0n4Ga3WiGy19A7hIu21KZZB1hYwFrGAAW8QktWimC7SBUDZGDEdonFRz6WHXhMZST8MNYOUft/24oWKxl0OwzkKkeHiJo0ptxl+kVeGnkNVQSlBMzivs+HHIYfKznfizGsgG50icYHTCPeF9Uv5xKEMLeWf8uBW2fYhXT8J8zRpNAA91thntWCqOIXburGxZSyJ06cpjbEV+hvalLDd5XE1BZAnB36K7J+Jha0kkmtrHDZ9h3hr2/nJrtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crZGVqJtjw0Vyio4pIBD/dLGZY0JrDeGw9pgFeJKM88=;
 b=NO5XmRZnyPjE1ysFS3rZrFGXp2Ova6Og8v3RaaNGQVa9MDkhzH32g4SKk6Vjmb+yyIjGZlp6DMbxGAYaNY3cuKn77b3LYapA8RH5iF1EjeB88x2J64G1SCdGYYf+3cHV1rqIeCxphwUM2qXrzGeB7yuOA1mhVYm1VFkFM23sM9M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 PH7PR12MB5998.namprd12.prod.outlook.com (2603:10b6:510:1da::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.17; Thu, 17 Nov 2022 17:31:03 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::39d8:ad1d:e0f3:2fc5]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::39d8:ad1d:e0f3:2fc5%9]) with mapi id 15.20.5813.020; Thu, 17 Nov 2022
 17:31:03 +0000
Message-ID: <8f0c640f-e093-3977-0203-52e69da6e59d@amd.com>
Date: Thu, 17 Nov 2022 12:31:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] drm/amd/display: add FB_DAMAGE_CLIPS support
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20221115202413.283685-1-hamza.mahfooz@amd.com>
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20221115202413.283685-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0044.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::13) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|PH7PR12MB5998:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e5915fd-9e5b-49ca-de22-08dac8c18038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2K1gmnOfHAjmOTKqN60T2uEAXA2VmnQGqIf4ko6snwFvAn6W6AZZ1R580sSiakY79rBXE4OcuZGEkgl4Jdpq9xkEhzJOajhXCr40PgqxXrl5g+v1PiNavTgkztqBp5IH9fDDZDBgMrfEgA3QG7LOyRsTYqxviFB+YdPfv222VrmD1QXD/N8BiumSG5AZYuWDOKZumbPBoQ6OshfkBrv/6NcTU2dxS4pJPV2F/4vkNYE4KbUkd1Xmdx4SfeC6euVLvvKXRnfSMRHKdibVdNswBGarHJgI4iY159UUQX2H6TbXEOi9hEND2vCGJ5mQGDoT9PqZiAsIYbH5IZLhIm9EVljWgacgFuAhIJUv9E3gSAy13IMGCyZTs4tT60mLZl/9OtMRG59toZpQU77LNNoMcJRbUnJG5nw989dwBI9w4hYELW8BfaO5oU+/cUwcbVEAowkbHFB8c9hKezXdEMyXZ4jnATCvd1mMH2HANvjRqq3NrwrT8gyDA85FyM0IKE2iJebCLq7rubgEOTD6GDRb/pG91kVpYdPtO1goZLu4xyRV7WgrOB2kafnCB0nNicmDH7tak9CCEslsc3wqxCFtnzf2eakiaYPIHrDPNOToZIDa2/zhrRqn6x10j/c3n9DGLScEGDqGTIBh71XayXrI3mH+BbA8fHEqp+ZxTPnAVuocAN9SYV3U5NgjBySwFNz96AZLDSV0rq1Dn4+BefWuWrII2D4LTydm5cJh57GpNrM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(366004)(396003)(376002)(39860400002)(451199015)(86362001)(53546011)(6512007)(26005)(66556008)(31696002)(316002)(83380400001)(66946007)(5660300002)(2906002)(41300700001)(66476007)(8936002)(2616005)(4326008)(38100700002)(8676002)(36756003)(186003)(478600001)(6486002)(31686004)(6506007)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aExTNDl6Nm1tcSsyK0xGakFIM1p5TTZuZ09FRGRoRk1acE9QRWZ6Qkx5S1I5?=
 =?utf-8?B?cjMwSDkybE9MeUZ2UUlXWXEybGpNUU9vTFQrM2REcmF3UzN6MGFFMzdjZFRu?=
 =?utf-8?B?emhQNCtsbm1kbUhmME05TENSUXFpbHRoMnM0clJLSlgrNGJOMThNVzdqVy9j?=
 =?utf-8?B?ZUxRbFYxb1c5YWltdzI4YkVpYlZLaFk0SFZpb09wRXlSNFdhS1pjNE5iQzlp?=
 =?utf-8?B?b0pwL2JuL29iRFhQT0ZGd3dmL0Z6Ty82cXdqaml2ZHF5RzlUZG9VVG52Mlhp?=
 =?utf-8?B?cEh6Z1Z2bUhmWi82UmNoaDhhNXA1bElaMUJrRWY0TThEekgvSUl0YzVJNjRj?=
 =?utf-8?B?ZnJ0enAweWhDYWt1TXpzVXoweG1FZWg3ZzBUVndHSFFVVDhMTi9nSXBpTjUy?=
 =?utf-8?B?RXRvVEd1ZytxNXNVbytweHQveWpKQlJBTGh4VW9FZ3B3a0xJbXhZRHdkbE1E?=
 =?utf-8?B?dkE3MEcydm9DbU50V0FtNjBWRm9hbXRMNzNuakJBTHlwcWhKNjJuY0U2VVVv?=
 =?utf-8?B?MjBWK0h2cGR5SkdhZXpjT1U4TUdsNmlrQmNjazJLQ21ycVZyNkpRYXI3NHhF?=
 =?utf-8?B?b3U1NVBmZXRmQ2pFN2wvUnd5NFZBYjlta3dWZFVoRnBHRm9EbVp3MjFVQ29x?=
 =?utf-8?B?emtoZnphYk5KSjQyUGw2VmJTVjFPYytJNGpra2QxcERlWUpqQ2l0V2dwQStD?=
 =?utf-8?B?TlNOc1ZnMWJIdXdiZXd2bjhRa0hoOVhjTFU5d0IzYnUzRW1zVEphL1VTUzBC?=
 =?utf-8?B?dTBBL2dmVkJOVEFWcGRoUHEzaEI1SlpCNHNPL1F3enFudHBiTzdaa0xpRGhh?=
 =?utf-8?B?QTlnYkdSL0l2L2Fsbkk2QVFYRHBBUmlOSlFKblhyQXlQSnIrY01mWmwxcHBl?=
 =?utf-8?B?MWllVTZRSjEwTlhLaWZzTDZmVDBZamx0eXdnRGs0V3hjeUQyZ0RCOWx1b0JE?=
 =?utf-8?B?YUtSRFFqUEl0bStCUDIxaDk3blA0dkl2OWZ4cnZ3MzRvZXV0S1Vmb2ZjOTd4?=
 =?utf-8?B?cTFTMkZBeXZYVWF4VGVZMWlwWGR4ZmdHVTNTM2pMVzhOUUFKOWRYQ3hjOTFJ?=
 =?utf-8?B?bG55N2FhWUg5a1ZjM2xDcGlQMWRlY0JodVZUbzJFNG1id2drbEYvR2FMUTJX?=
 =?utf-8?B?TEdNZDRGdFZuSFhSOTdxMkQrNVZxdGMzWElrc0R3WmM4NjNFa0YrUXZEb1Rm?=
 =?utf-8?B?eEphb1c4aGtiTytScDZQTlBPNlk0d0RTbDY4NHoyc1p6N2tzRUdzc0M1dTIr?=
 =?utf-8?B?eHNTbVZ5RFRBUWtpNlducklqQVY0UXRidTcxZ3YzR1F3UTQ4bms3bnJ0SWhC?=
 =?utf-8?B?cHFWMXAzcStnUTR0WUFhaTJPSGFZTHk5bUJra0lsODVqREErLzVhV3hndmw0?=
 =?utf-8?B?SXJrTWdaTUNVcG56Q2U1WGY3TGJCUDdPbTBtbERwUXRZYVhMOHlFQTlPQVlq?=
 =?utf-8?B?YlRETUI3eEFEMjJFZk9rYi9hYlJFQ1IyV1JLSkl4VHVCUHlIblp6YlpCbDUv?=
 =?utf-8?B?NzBoemFvUzFsUkphVE5leEZZRzYxME5kdmhPNnQ2ME5seVhjUTlVdE9ubkhx?=
 =?utf-8?B?YkR3Z0ZUNnBqeFViekh3dDZoS3VqTWdDN2ZlNTQwd1FFMGFTcmozdGUzeDdh?=
 =?utf-8?B?NVA2d25Tb2l0Wk11RmJJckdyWGd1STJTQW5tU2RFNjh3ejR4U0hEaEhGL2g3?=
 =?utf-8?B?cnVpWEkzbU11TVNnNnJIZk9XeGJTeDFyTUF5a2VRRUMwdUNkKzZIMlRTdHdk?=
 =?utf-8?B?ZUpvOEs2a29nZDNzR3VmQ01nZ2d1Y3gzb0lKZGJBQUxSS0Q5WDFTbEtvb2VM?=
 =?utf-8?B?UHo1SHRkVmJCd3lIbTI2UGZuNkgvd3FoUHFIV1Q2eWU5VS85NWduek5HQ2Fa?=
 =?utf-8?B?V0pyaE81ZFN1WlA2cy81dE13MkVWMkp1STY4UjFCb3BabVhTZVpxZExIMmE4?=
 =?utf-8?B?aWJuVlp3MDJNZjhma1JwOXBJOGlMZ0tvdklNblgvVkJMbGZsbVB6bXdodFNx?=
 =?utf-8?B?ZHh6cUFPRkQ0amZ1cDdKOFErQXI1cGFlSHhyQlRNaTF3MzBRWFNHN29HRkx1?=
 =?utf-8?B?ZHRVT1JKTDRFb0p5YUp6c3R3Vm5YS1RPb3pNZ2tNb1c4Y0Vvc2F1bm5wZ2lx?=
 =?utf-8?Q?EkIk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e5915fd-9e5b-49ca-de22-08dac8c18038
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 17:31:03.3518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OB2WMsbBDZ8kD6irPevqWw9CtcjqTM9HC4we9NytxpnqJl4TxAPrWHb7PJwQ/LHS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5998
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
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/15/22 15:24, Hamza Mahfooz wrote:
> Currently, userspace doesn't have a way to communicate selective updates
> to displays. So, enable support for FB_DAMAGE_CLIPS for DCN ASICs newer
> than DCN301, convert DRM damage clips to dc dirty rectangles and fill
> them into dirty_rects in fill_dc_dirty_rects().
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 91 +++++++++++--------
>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  4 +
>   2 files changed, 58 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 185d09c760ba..18b710ba802d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -4842,6 +4842,31 @@ static int fill_dc_plane_attributes(struct amdgpu_device *adev,
>   	return 0;
>   }
>   
> +static inline void fill_dc_dirty_rect(struct drm_plane *plane,
> +				      struct rect *dirty_rect, int32_t x,
> +				      int32_t y, int32_t width, int32_t height,
> +				      int *i, bool ffu)
> +{
> +	WARN_ON(*i >= DC_MAX_DIRTY_RECTS);

Hi Hamza,

Since dc_flip_addrs->dirty_rects has a fixed length of 
DC_MAX_DIRTY_RECTS per pipe (a restriction by DMUB FW), I think it makes 
more sense to fallback to a full-frame-update (FFU) if num_clips > 
DC_MAX_DIRTY_RECTS. An alternative would be to reject the atomic commit, 
but that sounds heavy handed.


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
> +	(*i)++;
> +}
> +
> +
>   /**
>    * fill_dc_dirty_rects() - Fill DC dirty regions for PSR selective updates
>    *
> @@ -4862,10 +4887,6 @@ static int fill_dc_plane_attributes(struct amdgpu_device *adev,
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
> @@ -4876,12 +4897,11 @@ static void fill_dc_dirty_rects(struct drm_plane *plane,
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
> @@ -4894,15 +4914,11 @@ static void fill_dc_dirty_rects(struct drm_plane *plane,
>   	 * requested, and there is a plane update, do FFU.
>   	 */
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
> +		fill_dc_dirty_rect(new_plane_state->plane, &dirty_rects[0], 0,
> +				   0, dm_crtc_state->base.mode.crtc_hdisplay,
> +				   dm_crtc_state->base.mode.crtc_vdisplay, &i,
> +				   true);
> +		flip_addrs->dirty_rect_count = i;
>   		return;
>   	}

Previously, we always do FFU on plane updates if no MPO has been 
requested. Now, since we want to look at user-provided DRM damage clips, 
this bit needs a bit of a rework.

In short, if there are valid clips for this plane 
(drm_plane_get_damage_clips_count() > 0), they should be added to 
dc_dirty_rects. Otherwise, fallback to old FFU logic.

With MPO, the damage clips are more interesting, since the entire 
plane's bounding box can be moved. I wonder if that is reflected in 
DRM's damage clips. Do you know if a plane bb change will be reflected 
in drm_plane_get_damage_clips()?

Thanks,
Leo
>   
> @@ -4914,6 +4930,7 @@ static void fill_dc_dirty_rects(struct drm_plane *plane,
>   	 * rects.
>   	 */
>   	num_clips = drm_plane_get_damage_clips_count(new_plane_state);
> +	clips = drm_plane_get_damage_clips(new_plane_state);
>   	fb_changed = old_plane_state->fb->base.id !=
>   		     new_plane_state->fb->base.id;
>   	bb_changed = (old_plane_state->crtc_x != new_plane_state->crtc_x ||
> @@ -4921,33 +4938,33 @@ static void fill_dc_dirty_rects(struct drm_plane *plane,
>   		      old_plane_state->crtc_w != new_plane_state->crtc_w ||
>   		      old_plane_state->crtc_h != new_plane_state->crtc_h);
>   
> -	DRM_DEBUG_DRIVER("[PLANE:%d] PSR bb_changed:%d fb_changed:%d num_clips:%d\n",
> -			 new_plane_state->plane->base.id,
> -			 bb_changed, fb_changed, num_clips);
> +	drm_dbg(plane->dev,
> +		"[PLANE:%d] PSR bb_changed:%d fb_changed:%d num_clips:%d\n",
> +		new_plane_state->plane->base.id,
> +		bb_changed, fb_changed, num_clips);
>   
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
> +	if (num_clips) {
> +		for (; i < num_clips; i++, clips++) {
> +			fill_dc_dirty_rect(new_plane_state->plane,
> +					   &dirty_rects[i], clips->x1,
> +					   clips->y1, clips->x2 - clips->x1,
> +					   clips->y2 - clips->y1, &i, false);
> +		}
> +	} else if (fb_changed || bb_changed) {
> +		fill_dc_dirty_rect(new_plane_state->plane, &dirty_rects[i],
> +				   new_plane_state->crtc_x,
> +				   new_plane_state->crtc_y,
> +				   new_plane_state->crtc_w,
> +				   new_plane_state->crtc_h, &i, false);
>   	}
>   
>   	/* Add old plane bounding-box if plane is moved or resized */
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
> +		fill_dc_dirty_rect(new_plane_state->plane, &dirty_rects[i],
> +				   old_plane_state->crtc_x,
> +				   old_plane_state->crtc_y,
> +				   old_plane_state->crtc_w,
> +				   old_plane_state->crtc_h, &i, false);
>   	}
>   
>   	flip_addrs->dirty_rect_count = i;
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
