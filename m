Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4080A71F3A3
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 22:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C87710E5C4;
	Thu,  1 Jun 2023 20:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E335410E0A8;
 Thu,  1 Jun 2023 20:20:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzzQQz/YTRnVaOzLZV4jeHFtP/PGIgHCKZTqXfMVGEz+7ju5tixkhvvz5qXFOBSrL+LXF/+HOJz/DDzjBVNwo5t0PbFop0GZlDqGkjCrQsTePGyuNKTHp/n1NeQyGaPgLnvLnDfXQ6G1bAFnX9JM2XE8eJD/w+4KLodGHLVWnRObYsXAnMRNvpT9FzUyXL4KRJi5Cc0nZQvZ6eNMUge9NJMtL0WQ37mWkpMkJLKXst//wKjmFSGceIb1SE/sPRkfWKq3soODKYyafR9yKGMC1YsUsEFUjuOm4n5zc9oJMzp9euqmpcZlC7oaB4g2feCbI801hkqDurkTySQYkbc/JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5b37UhdT6zyE6XI3k2ZK/5btN4e35N4aCTzf0+QZFE=;
 b=bZFb6cQI3miR2KkXZUK6cTx94MobBpsEKk226s/4BWMdN/8pMzr0UaKVb/1Bw7t0irPCd2BJnMcDA9uwSF76KXNWX45YlkccbEGzWwwVitLuDUwUhgNBgsp9wEn4iFLT64wfZ5LUyYiqLUup1+JNaNdY00JZ/mJQvjid1ij7cC1hlNX05s/D14A4uxrHbAljm/x+bjhpfqeCC9YELZNc2rEmja0M4FhOcVmDK7AbnB15WZsYzaJeuVYESrQmA/jLcMleBqpUM42/EIcjh2v4oSXNwGf1CxN5PfgSUZzXXU9hAAGIlQCnIn5+JoNnFZWVuGEr9I0rPJahugc9Hkblhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5b37UhdT6zyE6XI3k2ZK/5btN4e35N4aCTzf0+QZFE=;
 b=ujyCpHY7UDJj+OeD6cIB8Qa2APWP8Ne1BribnkHm7XZiIWJ3Os2SqcV5WzZW85y4c9B2coR78hi3/2QN7TlErc42UIXCQYXm6sWPzAcv2STpTjRznxltG4RAqz+4x7JmKrCEoIN39GBy3lbI9d7fbCu2jTLvs9oscu6+tKbad1I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com (2603:10b6:a03:3ba::23)
 by SA3PR12MB7902.namprd12.prod.outlook.com (2603:10b6:806:305::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24; Thu, 1 Jun
 2023 20:20:03 +0000
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::7a73:2b11:74b0:b2e4]) by SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::7a73:2b11:74b0:b2e4%4]) with mapi id 15.20.6433.022; Thu, 1 Jun 2023
 20:20:02 +0000
Message-ID: <61fe8337-ef01-0ca9-cfd3-4d2029aee5ec@amd.com>
Date: Thu, 1 Jun 2023 16:19:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 21/36] drm/amd/display: add CRTC 3D LUT support
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230523221520.3115570-1-mwen@igalia.com>
 <20230523221520.3115570-22-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230523221520.3115570-22-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0288.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::8) To SJ0PR12MB5438.namprd12.prod.outlook.com
 (2603:10b6:a03:3ba::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5438:EE_|SA3PR12MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: efc87f24-e982-4dea-c0b1-08db62dd948d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9tLxS6uAZzoBSzIXe+pRFa7s/HNKs7O2yB8DvO+M295wPNm9wChTZzmYjHa/9/chQG+0e0x/gGI8e2EAgccHIDC5YLtUdkc9Fpzf1pRP8Deublv4BkPJTCiPkkrGnrzKejseDmpVQ8CmGriV+IRWRWxrt/YBmrLngFJfB9ib7PI+NPffj7LdM5Lqs35X/+ng0WJzKZ43F2I8vfQrHLkw/ck4uAJ1Q5ueCCjDQcNvA8crU7Y0LowaFvefITOCX/VfH6OTfCLPhbOdAeqTiRKqjA5H7rI2SIwLnIhv1Empe2uKDmIMgmW+GBVpgtQ3Q7H64CjuxbtXCLu++6nxAvGQcNF1P7TH1LiPzvlQquKUrPRv+4NsVXqdD1Aqn3Ryb10f+Ue/PN6eojv5M0SdJhK4yPKhL4gp1tYkEts7K238ffHjLx7ELf/L0p3mLHhcsUqpOd4ulWY07uzXLkI9XqtgNNLfdaoWzIjDPFGg9589cgVBg4A7+CPsHKxjOOFEpkAHgHtHc5YdPFV2N3IbXEod+o6POT2Vvh6uDRmi2N9zpl8GtHj4J1OOdYInoPneSm7vRsdgUIixVUC6rdeAPyFRnIl2qHrX5mNz2/L5UoVKNXr7MUPAA+dm6Wz2mycYkWVh8deR/ve1BdwyaiFumUAFL+aSzlnn3AOKyJJpFrWTdcg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5438.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(451199021)(921005)(38100700002)(31686004)(110136005)(86362001)(54906003)(478600001)(66476007)(66556008)(66946007)(4326008)(36756003)(31696002)(6486002)(6666004)(186003)(53546011)(6512007)(26005)(6506007)(2906002)(316002)(8676002)(5660300002)(7416002)(44832011)(8936002)(2616005)(41300700001)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGIrcG80Rmp3N3lIUmo2aUt6M21vK09uNXN1TFZwWTk5ZEVmRmJiQmg5clhI?=
 =?utf-8?B?ZkJYMFpOS1RPK3lIK1RaSjZPWU1CL001bzdCTTZTNlV6UWl1M0JBK0xtRFJO?=
 =?utf-8?B?dWxOdHFSRGhUUXNiNk41U2wrd3VsN0x2ZjRhYm40SFJoMDFWWmhWcEtNbGM2?=
 =?utf-8?B?T1k1S2VZS3NvbHM1bmRwK1BIL3luaFpCNWJtY1QrT1M5YXZhZU5wUzhGemo1?=
 =?utf-8?B?dFdTZ2dRYlRDZ2JrdmpGUGlHZnFBRGg4RkNZcXhxbk9ZQUwwM3JqTXdXdnE0?=
 =?utf-8?B?bmtXRWJEd1B5Rm54N2dwRDdXdGpUQnN4a0MrWEMzeXlOWVZxcytpc1VJM1hu?=
 =?utf-8?B?L2dyZWRsSmdtcjJqeHNYMUJYNGJIQ29jNWM2WTRmclRYSjNZMkhCQTh2S24y?=
 =?utf-8?B?dkdOVUNJbnd3bHRnNGo2SmJ1VU5MMGZ4Wnp3SDU0TDAvWGJKckNscTkyUTVU?=
 =?utf-8?B?eUlSSVdaK1ArZ1cxMU9MN245YVU5UUtMMzdHOUdReUNJU1ZVcFprTE14M3FF?=
 =?utf-8?B?R0tySEUrYlJveWR0UmRlVjRjYmh0bnVmZ29hTWQyRk1UZHRXTSswVXJFNTBO?=
 =?utf-8?B?NzJBdW03cXR4OENFSUFydytCMnNyb0hyeHFmTGdndjg2UFJEOUdFWnBGcWhu?=
 =?utf-8?B?WmZxVmtPS1RtdTNWOHNDaW40ZzViNVZhRURXNTFodFJreWxHT2JkWjJZRDNk?=
 =?utf-8?B?MTBBUU11REMwL0J2MTBLSHFwbGgxaVhjMDg4TDF1RzdORnZDU1JWVHN3QldM?=
 =?utf-8?B?OWM5K0xXK01mVWFOcVByT29obEpWZnNUa1IwdVNTTUp3MEttKzFhd0VXeC9n?=
 =?utf-8?B?S0JiZE5WZTVEV0Uyblh0alF2OFFPVnJNenVtUGRBUEthVllwOThQQWJXRmEy?=
 =?utf-8?B?MURuUjhZWkFOd1lxN0hWWnNidXFERzI3ZjVEM3VobXErV2o1Tkh4Um52Q2VD?=
 =?utf-8?B?aUJLeWZyeUxyNnFENC96VWRLUEtiOUJFaDBmZWNLZ3BKaloybzdDVjBFWmFR?=
 =?utf-8?B?aWZXZSt1N216akpBMXJ5ZE1oUFVPd28rQnBCZlZadzQ2WWNuZjNEU2ZRcGJJ?=
 =?utf-8?B?VTd3ZnBPbDFHMEozdG40d2p6YTNYN0w3U1gwMGp1MHBuMEdLczB1ZGdLNlQ4?=
 =?utf-8?B?NGZOMDlsR3c0TldKTXA5M2o3ZWs5TG1HMW94RlBaVHd6OFl2MUdwS2d1dkkw?=
 =?utf-8?B?RS9zMjdSUnMzNldiM3lpTlBkK0VzYTlCVmNqK29oTTUyTEtDbmtQS0l1M2dO?=
 =?utf-8?B?cytCU1RkODhJNFBicGluYjZ5U0JoejhPWjJoYXNOalBPeUhSZk11cjNsU0J1?=
 =?utf-8?B?bnJYd0FXRCtXaDdweXhUTjZwZm1rc1NiVGYwYy9wUktYYWtEeHh3MHFXNitk?=
 =?utf-8?B?MDVGSEhhQ2RvdGZiYlpPaUczSXpDcFd3SUErNC9TTFFXMDNTaDZoMHpSdTgy?=
 =?utf-8?B?ZkxuSUZkdUlnTnBMWTRWTzNiblBUWS80VTVuVFZodXQ0cm1kYmJ3OWNlTU5B?=
 =?utf-8?B?ZHVnWU4vOXc3SXdJV3BaaUNBcFhtSWJXSU5KSUUwS1NCNlRIdTREdkJRcmRR?=
 =?utf-8?B?RTV1OWY4S2F4Q3hUTjNmeVg5VHZ3QjExaGN3UzVwVGNoQXVXU015Z3plRHA5?=
 =?utf-8?B?bDd1d2YxbnVUcXE2WGd4V095Ym1FY0pRNlBJT3RQQ1hpcXFrM2t4Z1N2QXEz?=
 =?utf-8?B?UmdjVzVLSHpvWGprUnNqWklKaHZHSVdUN2sxSW8zQVBTRDlISUdaOEF4TE16?=
 =?utf-8?B?UGdraXBSOXIrM2VKekZWSmRFN1d1aDVWK2hXSjl3OTFtZzJ2TVpwcHkzNFMz?=
 =?utf-8?B?TmN1M0pQVGhXK3N6Ty9GRzRXWmdlVW5yeWhmUnB1Q2I5SmYrV1kwWUovejFw?=
 =?utf-8?B?bVdHaXJXNTNjNFduRjJ1Ymdnd2tCMDZqYndQSFpsY2hHL3pUUjE5UmQ4NkR6?=
 =?utf-8?B?eEVhSjhvYWVXZTFOWUp2MDdFOTNGRmdKSERsRWUyenY1dlE5YTFMQ0RyYzJ1?=
 =?utf-8?B?WHgxelBZWUVnZEViTm5DZlJ5aFZjSUYvcW85VlF6N1paeXJ5RmYzc0ZvMHVJ?=
 =?utf-8?B?Ni9wQlRMeTU1RnA4R20wVnFxTWMzWDdPaUtNUlErbjZGSkRvNjR4QTRWUGVH?=
 =?utf-8?Q?ijo9eGPzieLfL2Edoq7e54+dV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efc87f24-e982-4dea-c0b1-08db62dd948d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5438.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 20:20:02.4926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eej2pmO4xcWrG5zD11OhMGxeaZV1WnsUugm7EhzaxTsb32qh1mW57ghS0DPkQmnGKV6CQyqwUeWwZGwoqzSGkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7902
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



On 5/23/23 18:15, Melissa Wen wrote:
> Wire up DC 3D LUT to DM CRTC color management (post-blending). On AMD
> display HW, we have to set a shaper LUT to delinearize or normalize the
> color space before applying a 3D LUT (since we have a reduced number of
> LUT entries). Therefore, we map DC shaper LUT to DM CRTC color mgmt in
> the next patch.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   6 +
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  17 ++
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 158 +++++++++++++++++-
>  3 files changed, 180 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 0be62fe436b0..a6dd982d7e77 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -9976,6 +9976,12 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>  			goto fail;
>  		}
>  
> +		ret = amdgpu_dm_verify_lut3d_size(adev, new_crtc_state);
> +		if (ret) {
> +			drm_dbg_driver(dev, "amdgpu_dm_verify_lut_sizes() failed\n");
> +			goto fail;
> +		}
> +
>  		if (!new_crtc_state->enable)
>  			continue;
>  
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index e5f9db5a43f4..eebe12c353ad 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -797,6 +797,21 @@ struct dm_crtc_state {
>  
>  	int abm_level;
>  
> +	/* AMD driver-private CRTC color management
> +	 *
> +	 * DRM provides CRTC degamma/ctm/gamma color mgmt features, but AMD HW
> +	 * has a larger set of post-blending color calibration. Here, DC MPC
> +	 * color caps are wired up to DM CRTC state:
> +	 */
> +	/**
> +	 * @lut3d:
> +	 *
> +	 * Post-blending 3D Lookup table for converting pixel data. When
> +	 * supported by HW (DCN 3+), it is positioned just before post-blending
> +	 * regamma and always assumes a preceding shaper LUT. The blob (if not
> +	 * NULL) is an array of &struct drm_color_lut.
> +	 */
> +	struct drm_property_blob *lut3d;
>          /**
>  	 * @regamma_tf:
>  	 *
> @@ -868,6 +883,8 @@ void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
>  /* 3D LUT max size is 17x17x17 */
>  #define MAX_COLOR_3DLUT_ENTRIES 4913
>  #define MAX_COLOR_3DLUT_BITDEPTH 12
> +int amdgpu_dm_verify_lut3d_size(struct amdgpu_device *adev,
> +				const struct drm_crtc_state *crtc_state);
>  /* 1D LUT size */
>  #define MAX_COLOR_LUT_ENTRIES 4096
>  /* Legacy gamm LUT users such as X doesn't like large LUT sizes */
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 161807e19886..cef8d0d7f37b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -364,6 +364,96 @@ static int __set_input_tf(struct dc_transfer_func *func,
>  	return res ? 0 : -ENOMEM;
>  }
>  
> +static void __to_dc_lut3d_color(struct dc_rgb *rgb,
> +				const struct drm_color_lut lut,
> +				int bit_precision)
> +{
> +	rgb->red = drm_color_lut_extract(lut.red, bit_precision);
> +	rgb->green = drm_color_lut_extract(lut.green, bit_precision);
> +	rgb->blue  = drm_color_lut_extract(lut.blue, bit_precision);
> +}
> +
> +static void __drm_3dlut_to_dc_3dlut(const struct drm_color_lut *lut,
> +				    uint32_t lut3d_size,
> +				    struct tetrahedral_params *params,
> +				    bool use_tetrahedral_9,
> +				    int bit_depth)
> +{
> +	struct dc_rgb *lut0;
> +	struct dc_rgb *lut1;
> +	struct dc_rgb *lut2;
> +	struct dc_rgb *lut3;
> +	int lut_i, i;
> +
> +
> +	if (use_tetrahedral_9) {
> +		lut0 = params->tetrahedral_9.lut0;
> +		lut1 = params->tetrahedral_9.lut1;
> +		lut2 = params->tetrahedral_9.lut2;
> +		lut3 = params->tetrahedral_9.lut3;
> +	} else {
> +		lut0 = params->tetrahedral_17.lut0;
> +		lut1 = params->tetrahedral_17.lut1;
> +		lut2 = params->tetrahedral_17.lut2;
> +		lut3 = params->tetrahedral_17.lut3;
> +	}
> +
> +	for (lut_i = 0, i = 0; i < lut3d_size - 4; lut_i++, i += 4) {
> +		/* We should consider the 3dlut RGB values are distributed
> +		 * along four arrays lut0-3 where the first sizes 1229 and the
> +		 * other 1228. The bit depth supported for 3dlut channel is
> +		 * 12-bit, but DC also supports 10-bit.
> +		 *
> +		 * TODO: improve color pipeline API to enable the userspace set
> +		 * bit depth and 3D LUT size/stride, as specified by VA-API.
> +		 */
> +		__to_dc_lut3d_color(&lut0[lut_i], lut[i], bit_depth);
> +		__to_dc_lut3d_color(&lut1[lut_i], lut[i + 1], bit_depth);
> +		__to_dc_lut3d_color(&lut2[lut_i], lut[i + 2], bit_depth);
> +		__to_dc_lut3d_color(&lut3[lut_i], lut[i + 3], bit_depth);
> +	}
> +	/* lut0 has 1229 points (lut_size/4 + 1) */
> +	__to_dc_lut3d_color(&lut0[lut_i], lut[i], bit_depth);
> +}
> +
> +/* amdgpu_dm_atomic_lut3d - set DRM 3D LUT to DC stream
> + * @drm_lut3d: DRM CRTC (user) 3D LUT
> + * @drm_lut3d_size: size of 3D LUT
> + * @lut3d: DC 3D LUT
> + *
> + * Map DRM CRTC 3D LUT to DC 3D LUT and all necessary bits to program it
> + * on DCN MPC accordingly.
> + */
> +static void amdgpu_dm_atomic_lut3d(const struct drm_color_lut *drm_lut,
> +				   uint32_t drm_lut3d_size,
> +				   struct dc_3dlut *lut)
> +{
> +	if (!drm_lut3d_size) {
> +		lut->state.bits.initialized = 0;
> +	} else {
> +		/* Stride and bit depth are not programmable by API yet.
> +		 * Therefore, only supports 17x17x17 3D LUT (12-bit).
> +		 */
> +		lut->lut_3d.use_tetrahedral_9 = false;
> +		lut->lut_3d.use_12bits = true;
> +		lut->state.bits.initialized = 1;
> +		__drm_3dlut_to_dc_3dlut(drm_lut, drm_lut3d_size, &lut->lut_3d,
> +					lut->lut_3d.use_tetrahedral_9,
> +					MAX_COLOR_3DLUT_BITDEPTH);
> +	}
> +}
> +
> +static int amdgpu_dm_atomic_shaper_lut(struct dc_transfer_func *func_shaper)
> +{
> +	/* We don't get DRM shaper LUT yet. We assume the input color space is already
> +	 * delinearized, so we don't need a shaper LUT and we can just BYPASS
> +	 */

This assumption won't be true for all compositors. This comment will
be misleading when someone looks at this in the future. I'm thinking we
might not want to merge patches 16-22 since we have no way to exercise
this code.

We'll definitely want MPC 3DLUT support in the future, with the driver-agnostic
API. So these patches still have value.

Harry

> +	func_shaper->type = TF_TYPE_BYPASS;
> +	func_shaper->tf = TRANSFER_FUNCTION_LINEAR;
> +
> +	return 0;
> +}
> +
>  /* amdgpu_dm_atomic_shaper_lut3d - set DRM CRTC shaper LUT and 3D LUT to DC
>   * interface
>   * @dc: Display Core control structure
> @@ -404,6 +494,57 @@ static int amdgpu_dm_atomic_shaper_lut3d(struct dc *dc,
>  	stream->func_shaper = func_shaper;
>  	stream->lut3d_func = lut3d_func;
>  
> +	if (!acquire)
> +		return 0;
> +
> +	amdgpu_dm_atomic_lut3d(drm_lut3d, drm_lut3d_size, lut3d_func);
> +
> +	return amdgpu_dm_atomic_shaper_lut(func_shaper);
> +}
> +
> +/**
> + * amdgpu_dm_lut3d_size - get expected size according to hw color caps
> + * @adev: amdgpu device
> + * @lut_size: default size
> + *
> + * Return:
> + * lut_size if DC 3D LUT is supported, zero otherwise.
> + */
> +static uint32_t amdgpu_dm_get_lut3d_size(struct amdgpu_device *adev,
> +					 uint32_t lut_size)
> +{
> +	return adev->dm.dc->caps.color.mpc.num_3dluts ? lut_size : 0;
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
> +				const struct drm_crtc_state *crtc_state)
> +{
> +	const struct drm_color_lut *lut3d = NULL;
> +	struct dm_crtc_state *acrtc_state = to_dm_crtc_state(crtc_state);
> +	uint32_t exp_size, size;
> +
> +	exp_size = amdgpu_dm_get_lut3d_size(adev, MAX_COLOR_3DLUT_ENTRIES);
> +
> +	lut3d = __extract_blob_lut(acrtc_state->lut3d, &size);
> +
> +	if (lut3d && size != exp_size) {
> +		drm_dbg(&adev->ddev, "Invalid 3D LUT size. Should be %u but got %u.\n",
> +			exp_size, size);
> +		return -EINVAL;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -478,6 +619,14 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc,
>  	bool has_regamma, has_degamma;
>  	bool is_legacy;
>  	int r;
> +	const struct drm_color_lut *lut3d;
> +	uint32_t lut3d_size;
> +
> +	r =  amdgpu_dm_verify_lut3d_size(adev, &crtc->base);
> +	if (r)
> +		return r;
> +
> +	lut3d = __extract_blob_lut(crtc->lut3d, &lut3d_size);
>  
>  	r = amdgpu_dm_verify_lut_sizes(&crtc->base);
>  	if (r)
> @@ -526,10 +675,17 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc,
>  		if (r)
>  			return r;
>  	} else {
> +		/* We are not exposing CRTC 3D LUT properties yet, so DC 3D LUT
> +		 * programming is expected to be set to bypass mode, since
> +		 * there is no user-blob.
> +		 */
> +		lut3d_size = lut3d != NULL ? lut3d_size : 0;
>  		r = amdgpu_dm_atomic_shaper_lut3d(adev->dm.dc, ctx, stream,
> -						  NULL, 0, NULL, 0);
> +						  NULL, 0,
> +						  lut3d, lut3d_size);
>  		if (r)
>  			return r;
> +
>  		/* Note: OGAM is disabled if 3D LUT is successfully programmed.
>  		 * See params and set_output_gamma in
>  		 * dcn30_set_output_transfer_func()

