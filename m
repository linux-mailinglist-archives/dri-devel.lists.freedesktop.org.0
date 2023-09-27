Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9047B0C29
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 20:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1A310E595;
	Wed, 27 Sep 2023 18:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0933B10E593;
 Wed, 27 Sep 2023 18:47:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GddzH1292E9rlxGpJa/p8JzQzrwQ+wYS7bwBgG+XofDWOCZv4ib8nV9VIzJe9YjlWnks+afv3GN9r5w4tCwc8E5CiDHbGokT61oBjbQv8NhQMuuJz4JFtzzyaqQBKTw4U8I8IOi8R8YOmyGDyJTlj7aKW9IAEPAASvCEp48vBvCBIeldKThIxE8XFkX4wyKVj7Hzwm8xMDCqrYf25WK4W/37gSFnxFg9gQL1z+f7jHnmMTGVrAkYtWydp/6OUDL3dbL/pUWNAx4GBpBQUlGBFJyX5XDKH6znhMnEY0OPam5RznySuN66oFs7LDuzoseVt4nQ6URSibH1OwXc3DBtBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ptYx/Web6lt+JkbBW6NRGZRZ5bMerORUbhlccacdDg=;
 b=dRTwsu8yKMUczxaMKMOcDat4BMUz0vIZWk8ncwTIIOhfYU2qzjk9MJSc4aSLhT84cGrEh7g7bb2W4DW3wH1AQAVifBmMMvsX4Aaq4Z69ptOKL3jKYMj7DtHZGgF4QADEzV6GVRsJfm+WxHULyYEqgUaMR9XA4VPLKdW6IRvDFKiCO9ljz/zBp4ebpZZY54Tk1sRwWnNpzzcWpHb79rTEJ/ezqxxZSgl8ocazA8hERnZaShjTh9i4WEcgN9tBPDDkCbcfSj8q5pG6tT3HleXYISPDj1SrXDLJnsN+UxxBq/Q0lYJfM90vUJa7t44+ZWTzp7ZiZ2XYFPQGQhj9jFGoHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ptYx/Web6lt+JkbBW6NRGZRZ5bMerORUbhlccacdDg=;
 b=xqHa5IP7M/jHYp0ilfDM/Qw1F44YISgwSPCMej4cVeQr/AU79nwm6Ft+QNSZx6GG6HKM78YCzwEsjWXhzg+rwm5o8RxYDWCwpadCPdnUPzvfup5qPiaF/R9uUUjZkbVGvxko7mQREoYJOk8yYhljEBMAN4Ctf77H/dfUHzzRRO4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS0PR12MB9322.namprd12.prod.outlook.com (2603:10b6:8:1bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Wed, 27 Sep
 2023 18:47:55 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6813.018; Wed, 27 Sep 2023
 18:47:55 +0000
Message-ID: <11acd0e1-c195-4f26-ad26-183b20c512cc@amd.com>
Date: Wed, 27 Sep 2023 14:47:49 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/32] drm/amd/display: add plane shaper LUT support
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230925194932.1329483-1-mwen@igalia.com>
 <20230925194932.1329483-24-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230925194932.1329483-24-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0056.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::33) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS0PR12MB9322:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a9ba12d-c059-4f4e-6c68-08dbbf8a42cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QzeK35RMy72p1T0bCB89IFYf/5HxxJxIG9USrfq5sjb780cvgtQOq8ztSpuH0fKps+UTSt1AlBKL845IVxzvcr3pOQVTAhsbyuEYa7ZrA4TgR3cSCzQ1AGGTlc0rWbz1DdBeK2potnc6cI1dfuRyfbmfhGcrVmLqWuiVc+ByZehob/E1tFUkhl8YpYzNRpiYegsd7JV2FYeL8JhdDzU8+IVY4H2HeHrEN5xZbg5cKOJ0MwRo4w6yDcYAIEe7qyBcKWoTY06bfFHJ8u5t8q0mqkCyQmTKhr9d4JcLhygcgBZ7AhyElqYpQY09390JS/rqYf7FtBGa6kR6KvtFJ6NaO/oIZ7dUXg8q8Z4InJb+6j9pFrf70vFRyE0TbcB9+0EYat+ruZ0xVPRZVkcYsnLqOqrXhmV6CZAKe1xQDKorYNA3r/sMFyu7W+zbYKvMK1uRbAG2L82HxfcjofMB8SSFePYxQxh0+Y/FuEyvHaqbqUDRV4bfCIktcECSNhEKkgkJ0/Lhpov0ZznRxHk7V+kBcm5Ltfhen5ljLM1myH/44cibjpu9gqOfez7U37+q7eJT4DZYmBqeXGwa/7TahzcXV/0Y1sUvm5ixRd5FwzL99W0UhKfAD3Mg6zUafFPG5pMBCifJwvCr3HUTOyrw1DFRN3swk1Ef6risFIoyoMptO/s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(451199024)(186009)(1800799009)(83380400001)(26005)(8676002)(2616005)(5660300002)(4326008)(8936002)(6486002)(921005)(6506007)(53546011)(6512007)(44832011)(31686004)(478600001)(6666004)(41300700001)(66476007)(66556008)(54906003)(66946007)(110136005)(2906002)(86362001)(38100700002)(36756003)(31696002)(316002)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azk4WnB0TTRQeXJNNjZCTzVBOEFDcEtvRHgwRFJmcGVoSlF2U2tJN0hJNDVl?=
 =?utf-8?B?RXVDZXg0M2hRSFJrODMwQnVGSmZ1RDkwWlNTOEl2SWoxZWpTVGpIb3U4RHZs?=
 =?utf-8?B?YzdxUE1mbnpneTBvZW9hWjV1UXZINGVxYUN1R2ltdTY1c1ZBd0c3eTc2Qkcw?=
 =?utf-8?B?RU1CYytyUnZoR3VpMW5UdjlCSldnbHRWZTkydnkyY0dCOTRGaXRCcC9nRTJR?=
 =?utf-8?B?Ny9Oc1ZESEw5Z09vZld2VlcveE5XVzRlU1A2dDhkTTJiWDcvMHdORlRpUmVW?=
 =?utf-8?B?VDlIcVpsQjRvcXpqL0FhOUFCUUhrZVNuQnZHcnRsSVh6VytHcUdxdXhCUlRJ?=
 =?utf-8?B?Z2NTa3ZBRFZmYUZzcFNnZ1VQNTFpRy9TWEFyVjZyYVNPRUZNUjh6Umlxcmhp?=
 =?utf-8?B?VjhiSzdIeElzc0wrZkZBK2F5Qyt0a29TTytQVWZzb0dkVDMzdlkxcjRlNDQz?=
 =?utf-8?B?T3hybDZSU082WHhJZ3l5YlJIUVVPWlZPdFI5WjQvTVFwM2xSUnMwUTg3N2c0?=
 =?utf-8?B?WXBCWldaSVhpQVo0OG8xcUJwNnVEaWdrSU43Z3pSQ2JCSkZRRlBrOGZTb0pp?=
 =?utf-8?B?ODVRbEx5WENIWEZORnVDMWN0b2gyZTRrd1doTUpudS9icmZHbzg3VkVqd3JZ?=
 =?utf-8?B?Rkp2RUwrUldCVGh1a3RxNU1KM1J5RTlCMFA0aHpxMzdJdU1Jbm5IVVUzc2FR?=
 =?utf-8?B?c1Z6NlA1a2FybGpzd3Z3UmxyQVR2c2k4SzEyTHhiZkRia0Qyc1EvY2tHSGtM?=
 =?utf-8?B?KzhLTk0xOW9BcUJsOHJxVDNscnBsY2J1MjJMVm9Rd2xOTnlYcW1IekNuLy9h?=
 =?utf-8?B?ZmNuSVM3S3NjaXYrNXBkdXBTSUF5ZTNrcVBTZTdOd2ZKL20vR3Fub3phUUNS?=
 =?utf-8?B?RHFOcm82V1ZPQm41eWV4ZElRaVN3aU1pU04ydDl4WFVxelZCanpqUVVCTE1L?=
 =?utf-8?B?SjBxTHdUamMxbWJhOEpGMTd3NTBGbmZ4SWl4M3Q1b3ZtUGgwbHBDemZyKzhs?=
 =?utf-8?B?ek9maU1IditURkZibEgyOHRMYlBQZDV3VGFYY2dYYVAyT3J5L2ZKRUZUR21Y?=
 =?utf-8?B?T25pTE5ERHJXajlXeHNTenFldDREeFpMUjhnek1JK2JzQm4vZnhqUVBHeTd4?=
 =?utf-8?B?cmt1YUpHTm9zOFI5eURmY2diSUNjczdkS1I0MFZUTHFGQXBBUEJKV1VjUHdK?=
 =?utf-8?B?U2FKZ2pIVm84VExTMlFzdDNaYmRPUng1c2FrL0owa1ZKcVArTVdVS09pUXZm?=
 =?utf-8?B?TDEvUEREdFlJejByOHhZeU1EbHo5TmdFZXhCckp0bnkzYUprSll4KzhvQXYy?=
 =?utf-8?B?TSsrUjZFN3RVaGE1ZkFpdjNtQUhQeHpQNG5HYTNXSE53dk5adGJGcDQ2NVFL?=
 =?utf-8?B?WFVDK3FmSWhBNVd1eUFlNThZa0EwZ1U0UE1JZWRueWhveng5VlFOMGlFTVAr?=
 =?utf-8?B?UGxmVlpjQXFNaS9FYmZlWVJ3TWU1bEl2N2pPQ3VUMDkzUll5VjhXVXZaSHBl?=
 =?utf-8?B?WFpxajA2VzVMeGszWFV3NW9DZTdwUFppZnFZeFRQUG9kMk53SGZIT1gzQ1JF?=
 =?utf-8?B?UkJiMG00NDZkNTB3T0pzeWVSQktIVmwvRVFvWGVUaThjdUphNzk4VlhGVVJD?=
 =?utf-8?B?cWovSDNTdzJxeFJLcDY1M0N1U016VTIwQ2h3MnFJNENwbXJBNDZZSitUVkhM?=
 =?utf-8?B?QXJ2ZEx5QTRqRFRoeEtJL1BtbU9xcXBkdTUyL3cxcEttdWp6NCtQSzVLQUpR?=
 =?utf-8?B?b2VHVW5IZGlyUzd4YWNkYno0eDZpTDdrR2d5QWxKbjVDOFE3clcycWhQUXY1?=
 =?utf-8?B?SWxwRlRDT2Nkb1dsa2s1a2x4WHBCRVZPODFOa2dlakJ2amV3aUo0RVRxMkl6?=
 =?utf-8?B?K3dHUnZxUUlxVjExQms5VWNGdHhMREJsckJoa2FsS0ZPWTByN2ZzMVE3RHZl?=
 =?utf-8?B?M201K1AzWXlqYlhJY0dibHJaSnIrdURyakx3SGZpM2lRQWNuWWsvcGIzRVdP?=
 =?utf-8?B?dkh1MzlibE9pNm5jRlRWdGt6WGU1aGc0R0U2ODZ2cXBQblNhM2Z3SHpMT1Fq?=
 =?utf-8?B?MmhQM1NnK0VreldzeXlRZUs5MU15U1FiY05uYW92NzJEcnNzRXpoNDNCWkVL?=
 =?utf-8?Q?Cw9j9Tu/pP6Hj8XuVqxMJoV1g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a9ba12d-c059-4f4e-6c68-08dbbf8a42cc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 18:47:55.2058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1fnbDA0LEigxFpnNBy4gtPJR5zI5QvtWsVAyvK3KJ7Mwh4USqhxb2B35qCLb89tmh8vXo8IdrEQDUOFhHceiWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9322
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-09-25 15:49, Melissa Wen wrote:
> Map DC shaper LUT to DM plane color management. Shaper LUT can be used
> to delinearize and/or normalize the color space for computational
> efficiency and achiving specific visual styles. If a plane degamma is
> apply to linearize the color space, a custom shaper 1D LUT can be used
> just before applying 3D LUT.
> 
> v2:
> - use DPP color caps to verify plane 3D LUT support
> - add debug message if shaper LUT programming fails
> 
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   1 +
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   2 +
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 108 +++++++++++++++++-
>  3 files changed, 107 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 455b690d6185..af18c523c431 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -8185,6 +8185,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>  			bundle->surface_updates[planes_count].in_transfer_func = dc_plane->in_transfer_func;
>  			bundle->surface_updates[planes_count].gamut_remap_matrix = &dc_plane->gamut_remap_matrix;
>  			bundle->surface_updates[planes_count].hdr_mult = dc_plane->hdr_mult;
> +			bundle->surface_updates[planes_count].func_shaper = dc_plane->in_shaper_func;
>  		}
>  
>  		amdgpu_dm_plane_fill_dc_scaling_info(dm->adev, new_plane_state,
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index b7b1d67f87a0..ad583cc97f15 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -897,6 +897,8 @@ void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
>  /* 3D LUT max size is 17x17x17 */
>  #define MAX_COLOR_3DLUT_ENTRIES 4913
>  #define MAX_COLOR_3DLUT_BITDEPTH 12
> +int amdgpu_dm_verify_lut3d_size(struct amdgpu_device *adev,
> +				struct drm_plane_state *plane_state);
>  /* 1D LUT size */
>  #define MAX_COLOR_LUT_ENTRIES 4096
>  /* Legacy gamm LUT users such as X doesn't like large LUT sizes */
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 577a9dc669a5..8c991b5cf473 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -594,6 +594,74 @@ amdgpu_tf_to_dc_tf(enum amdgpu_transfer_function tf)
>  	}
>  }
>  
> +static int amdgpu_dm_atomic_shaper_lut(const struct drm_color_lut *shaper_lut,
> +				       uint32_t shaper_size,
> +				       struct dc_transfer_func *func_shaper)
> +{
> +	int ret = 0;
> +
> +	if (shaper_size) {
> +		/* If DRM shaper LUT is set, we assume a linear color space
> +		 * (linearized by DRM degamma 1D LUT or not)
> +		 */
> +		func_shaper->type = TF_TYPE_DISTRIBUTED_POINTS;
> +		func_shaper->tf = TRANSFER_FUNCTION_LINEAR;
> +
> +		ret = __set_output_tf(func_shaper, shaper_lut, shaper_size, false);
> +	} else {
> +		func_shaper->type = TF_TYPE_BYPASS;
> +		func_shaper->tf = TRANSFER_FUNCTION_LINEAR;
> +	}
> +
> +	return ret;
> +}
> +
> +/* amdgpu_dm_lut3d_size - get expected size according to hw color caps
> + * @adev: amdgpu device
> + * @lut_size: default size
> + *
> + * Return:
> + * lut_size if DC 3D LUT is supported, zero otherwise.
> + */
> +static uint32_t amdgpu_dm_get_lut3d_size(struct amdgpu_device *adev,

The function name is a bit confusing since this just returns the
lut_size if we have a hw_3d_lut caps field. Might be clearer to
simply drop the function and do the below line of code in its
place directly.

No need to drop the RB, just a minor thing.

Harry

> +					 uint32_t lut_size)
> +{
> +	return adev->dm.dc->caps.color.dpp.hw_3d_lut ? lut_size : 0;
> +}
> +
> +/**
> + * amdgpu_dm_verify_lut3d_size - verifies if 3D LUT is supported and if DRM 3D
> + * LUT matches the hw supported size
> + * @adev: amdgpu device
> + * @crtc_state: the DRM CRTC state
> + *
> + * Verifies if post-blending (MPC) 3D LUT is supported by the HW (DCN 3.0 or
> + * newer) and if the DRM 3D LUT matches the supported size.
> + *
> + * Returns:
> + * 0 on success. -EINVAL if lut size are invalid.
> + */
> +int amdgpu_dm_verify_lut3d_size(struct amdgpu_device *adev,
> +				struct drm_plane_state *plane_state)
> +{
> +	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
> +	const struct drm_color_lut *shaper = NULL;
> +	uint32_t exp_size, size;
> +
> +	/* shaper LUT is only available if 3D LUT color caps*/
> +	exp_size = amdgpu_dm_get_lut3d_size(adev, MAX_COLOR_LUT_ENTRIES);
> +	shaper = __extract_blob_lut(dm_plane_state->shaper_lut, &size);
> +
> +	if (shaper && size != exp_size) {
> +		drm_dbg(&adev->ddev,
> +			"Invalid Shaper LUT size. Should be %u but got %u.\n",
> +			exp_size, size);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * amdgpu_dm_verify_lut_sizes - verifies if DRM luts match the hw supported sizes
>   * @crtc_state: the DRM CRTC state
> @@ -881,6 +949,34 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
>  	return 0;
>  }
>  
> +static int
> +amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
> +				     struct dc_plane_state *dc_plane_state)
> +{
> +	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
> +	const struct drm_color_lut *shaper_lut;
> +	uint32_t shaper_size;
> +	int ret;
> +
> +	/* We have nothing to do here, return */
> +	if (!plane_state->color_mgmt_changed)
> +		return 0;
> +
> +	dc_plane_state->hdr_mult = dc_fixpt_from_s3132(dm_plane_state->hdr_mult);
> +
> +	shaper_lut = __extract_blob_lut(dm_plane_state->shaper_lut, &shaper_size);
> +	shaper_size = shaper_lut != NULL ? shaper_size : 0;
> +
> +	ret = amdgpu_dm_atomic_shaper_lut(shaper_lut, shaper_size,
> +					  dc_plane_state->in_shaper_func);
> +	if (ret)
> +		drm_dbg_kms(plane_state->plane->dev,
> +			    "setting plane %d shaper LUT failed.\n",
> +			    plane_state->plane->index);
> +
> +	return ret;
> +}
> +
>  /**
>   * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC plane.
>   * @crtc: amdgpu_dm crtc state
> @@ -898,10 +994,16 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  				      struct drm_plane_state *plane_state,
>  				      struct dc_plane_state *dc_plane_state)
>  {
> -	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
> +	struct amdgpu_device *adev = drm_to_adev(crtc->base.state->dev);
>  	bool has_crtc_cm_degamma;
>  	int ret;
>  
> +	ret = amdgpu_dm_verify_lut3d_size(adev, plane_state);
> +	if (ret) {
> +		drm_dbg_driver(&adev->ddev, "amdgpu_dm_verify_lut3d_size() failed\n");
> +		return ret;
> +	}
> +
>  	/* Initially, we can just bypass the DGM block. */
>  	dc_plane_state->in_transfer_func->type = TF_TYPE_BYPASS;
>  	dc_plane_state->in_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
> @@ -909,8 +1011,6 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  	/* After, we start to update values according to color props */
>  	has_crtc_cm_degamma = (crtc->cm_has_degamma || crtc->cm_is_degamma_srgb);
>  
> -	dc_plane_state->hdr_mult = dc_fixpt_from_s3132(dm_plane_state->hdr_mult);
> -
>  	ret = __set_dm_plane_degamma(plane_state, dc_plane_state);
>  	if (ret == -ENOMEM)
>  		return ret;
> @@ -942,5 +1042,5 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  			return ret;
>  	}
>  
> -	return 0;
> +	return amdgpu_dm_plane_set_color_properties(plane_state, dc_plane_state);
>  }

