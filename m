Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB69B7B0C2C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 20:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECDAF10E597;
	Wed, 27 Sep 2023 18:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E59410E594;
 Wed, 27 Sep 2023 18:49:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzCcZIFY1fpjoikO2qgs4Qmsj9SzDL+G+NppAggEscqrl9e2IroOq0CbqN/pVESauRBfbU0E9KQZPa7ZbDnSGYVsn/YiqXRjuoyU/WtB1rg9NzAgtaSo3WdFHkAFCT3o8UpgCpQEXxDz/tdiMjLOKWBKtrz20kSeTkuYUxHoUm9GfDTwPjXIybvVxnvKnFu7nQuKfdqX5XLKPbWuLbr4uctDxxTqIrMUtmHeJ+zQTtFAmKpDFMRrQFvqlQrLkfZGeQrksO8lNRWsrsma3Tym8skrm2MDaYdUiJMrjAz//oJY6GmXH3b8ToW85UfTDn+NlsUmD/xGw2Ihnx71qNyJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJLhzonI+/PgIPulNbreMp9VHttxJbYt1BI2GDaVauQ=;
 b=LLYYZM7dw3sVmNBCq4dJBqN4u6Rp2IznIgKO6y7ns2oJeFEI/sPsSwz2LyXBFq8OtA1gQGOP921+lv/LtRSk+fFxHqOmba5hecDt+K2w7eLwAe4mkj/sul1VKm8aOS/mIAdFsOwmmLHilPujj6mm847vQiL+gyldWo1aTGw2q5TlzpyGKt0LFZqtl9szEtBxYaslOrVFb9oBkUzpsmZv3WKC18XIhPeRC6I6HgPhlGJ8gn/AEZelhqDDx3CcvgKhc8eJA2K6RfUoq2zVYg9quZvbv6uQX74/9PNZkEoTXgwcMqtwTji3ExTYyRtIaRQ/0SYN+Vrs5p95K6KnKTiLOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJLhzonI+/PgIPulNbreMp9VHttxJbYt1BI2GDaVauQ=;
 b=tTHNc6nu6rkR67cipuxoVRfOsZq9z1qVecAaAxXY3WHpwiwc+z2C2w42bN2jAweVwpbVk3ue9aax1xYrAtQFaZ3CAi/qxTDMJ8L3079/EkNh7i0u/eGg0hXsRxJ4tfcLdYV2HWwXyA2X9eYYhy+9yMYLdPWwnzDqEg8OVRPn8Mg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Wed, 27 Sep
 2023 18:49:37 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6813.018; Wed, 27 Sep 2023
 18:49:37 +0000
Message-ID: <f17850e7-27f9-4606-bc18-3954dea43563@amd.com>
Date: Wed, 27 Sep 2023 14:49:33 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 28/32] drm/amd/display: allow newer DC hardware to use
 degamma ROM for PQ/HLG
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230925194932.1329483-1-mwen@igalia.com>
 <20230925194932.1329483-29-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230925194932.1329483-29-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0056.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::33) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA0PR12MB4430:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ffd79ef-c465-4dec-c81f-08dbbf8a7f71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D15lTS1eCtugLyDLdDLxsJ0lJ1KQJ8mM141HnTpbLxNgeaYer5G9OGnMMyBhhaztkDrulTqIRR/eG9YFx3i4LrD/4yo+P+36cNqh3CM4AJKNUu/KT/Wtz9AlfH6XREPXToa58pN4DR/xgg980yv04k0TqHgeWzlr08gGhQfphekl3n2cZ7ou1kVF7EgKNT8sakEk06LiD9ZR+1tgqprxYDqV77rfJnOK/cA1+YLudhBHUzEC21VLx73P6pPEuOWhWoaZ0fJaROkV3mwv+3MUMd1sFhaaxEFUhchfn7pA62vXUTWF2USbsloLoRQs3ZpQnPNtey92E/8xi57KCSRYXPLr0kGu7sZLc/NaQ3LRDuiKTEpqXdWORKeVMZ03rvPo/BEgup96/C1D9PgcM0rnC9n8SGnsHctyPN1MLkS1ruHCEIGId2S7gTiBx6jygNTenvRHKfdhbdL9xIXWCs5wu9G/6udhQKuAs873pOME5XyDNUPYU4Cit216lhiKrNwnc2l8UBRQp20OThERBVb81ywMK5D/yqSExWdXUOOXCh4+gjtr1kTm/iS1ARZMd2xUoExJc9RHBcHyvpKu4NBaewp6su1A1pyhNdVgFjBUvFAAThwfOxtY8c8p6xJOAMsRu/ivqc/Xwe+3E4XP34BC5IXhsK2y2/4W6Y6+S6ShJG0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(396003)(346002)(39860400002)(230922051799003)(186009)(451199024)(1800799009)(6506007)(7416002)(83380400001)(6666004)(2906002)(6486002)(6512007)(478600001)(66946007)(8676002)(44832011)(66476007)(66556008)(5660300002)(8936002)(4326008)(26005)(54906003)(110136005)(41300700001)(2616005)(316002)(38100700002)(921005)(53546011)(31686004)(86362001)(36756003)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTNtSGtUVVh4SS82YmpTS0V3TDNCZmRZRDdnVXFTaGp6bktub0VHYmpMUHFX?=
 =?utf-8?B?RkVYbncvTUNqR2hEWmNVYW1aRjV0ZTNGeEtneG1aaEhWcWdRcDNFYk5Od1N1?=
 =?utf-8?B?R1EzOEk5elZJczdoSTh2U1lWdmVlZ2Z6UzFEdGNaVDVuQU1qMXZXbTIvc3B0?=
 =?utf-8?B?VjBCRDlRM0RTYllCSklrMVB3MHExbDlCZ1IwRlYvY1pjQzUrUEZDZmZCMlor?=
 =?utf-8?B?T2I5U0Jkb2VJdDZPcWlJWWtVUmRXRzdmU2lsTm9HRDF2aUV6R1UwWjhFZTV1?=
 =?utf-8?B?VGVGbnJJeU1VaUk1Z2dBUkRiTk40Ui96NkZrTysvblplUUN5SVFhZGpRRG9Y?=
 =?utf-8?B?a3lGNk80NHE5elNTbFd5N3hTVWQyUXNxTHRHSFNJMUc2ZHFsNVNWRlI2ZFJB?=
 =?utf-8?B?cGVJOEx4Qzc3dllOM0lZK2FDZzZjRDluY3JoUE5BKzFQTkhwUDMxMFB2eEEw?=
 =?utf-8?B?WjZXd2ZkdUVBTThTUGRySVIzanFndDNwVHR1MWRWODl6U2VUem9yZ1JZWUR1?=
 =?utf-8?B?bmlBSDZyZkJVM3BPLzU0V3dxdGpNTXRIeEI4Z2lVcEVMdDZmRUhrbkJEM1Nt?=
 =?utf-8?B?UTJjSUNyUDdhZXU2d1BwVnFVdzlvbmRhSGIwZ1I4VEpvSEpRdTF0U1QxYklo?=
 =?utf-8?B?R2pTQm1yYWZaUUpPZUxTSWJTeXExdXQ3NEt0ZWprY3FHcHhleTYyRGwzYUJr?=
 =?utf-8?B?bWpoNStmTHg5UG1pYTdCam9zbXJBdU05UG1rUkpRdC9SRFZMYitkSFRYeW81?=
 =?utf-8?B?cThNZEZzM0ZnUGxNZ1UvZFkvdndCdWthTUNEajZLZzE5NC8yTW8rOXZkU1Yx?=
 =?utf-8?B?dDJUS1hFcXBIZ1pyWEtlVDluekRRWG5tOGFVRmMzbWFuaXhvRFV4THNhS2I2?=
 =?utf-8?B?YzUzdTFzanR1WUQrQU9yOGpEYWtsU0NBQm9VZjY1aVFtcndNZlRramlSdWFX?=
 =?utf-8?B?TWI2cWZ6eFJncWxSUkljUmwvY010R2taUW1pL1pUcUxWMFhnMnRBcEs4OXR0?=
 =?utf-8?B?eDBpaFhWdVZJVW1jYnRobk1JeDhFMENtQVFpY2hyTS9xa0d4bmFZUWhKM1RE?=
 =?utf-8?B?Yk9icEVXUjVJbU1hdWo0WjJOeFNiSEdBejFZTFpyNXllYWx1Z1kxZVNzYUc5?=
 =?utf-8?B?Y2xtb3BSaHV4WmJnZ2ptcG5IdzloQnM1UXJjUHdENVFLbE8yZ1N3R0hxKzNY?=
 =?utf-8?B?UXdMWmwzZk1MdXUvZHFXZEw2Ti93em8ySWRaQWdyRW1Xb1U5dHJWeGg3N1lQ?=
 =?utf-8?B?THA3aVgxeVFYZXhlVThsTUZSUFZHM1VybGp5dmVuejgrU1dTMTlZc3NBZWRt?=
 =?utf-8?B?TXdRTSt5Q3RzQU42NjdXQXZCMUZrM1lVMjJ5bEtXd25BejU5bmc1SzdGbG01?=
 =?utf-8?B?VHI5UUljZjZZWEFMRGpIK2pISUU4VHBoVzV0cFBJNHg3K2RKRTNGMDcydlVF?=
 =?utf-8?B?alRFUnJCQ3gvdmhRZ1g0Y2R4Z1pEVVgyVFdmWnpIM2gxTDRINTM4aFdZbmZM?=
 =?utf-8?B?bHN5YjNWQTFhMWJZZkdlbThaQnNjVkl6a2tGS1JvOWFQdkdQSEFnQXQrL3A3?=
 =?utf-8?B?dml2UGpCZFdqeHJIMktpREVHUFlLVGIrLzZpQjJxZ1JKajJvTEdybzZmOGto?=
 =?utf-8?B?NjZqZ25qUEVyQnAwVnJWd1owR2c5dzBIRy9BZGtOVWtxZThVOGtId0NJeisr?=
 =?utf-8?B?bnYza3BDVzlQVlgycVFzKzRXbmROcW1YWnplOWZZOHVOc2FMeEN5NVBNQ29w?=
 =?utf-8?B?SUxJR0FqdFREK2ZDclpJbXQvL1JpanRMZUMvUERVUit4b2R3dkkyUmFJTysy?=
 =?utf-8?B?ZzZ2Q2Y5ZFZuZDc1MlhUbUlVbGtwOWtNYVZrYlMvaXh4VHlDVlVNcDZWUkJR?=
 =?utf-8?B?ZFk4cHB1SnpackdOM0VXNFV5cEZDZjB1SGdrZ1RTOVk4bWF1STU3YjNsOUxS?=
 =?utf-8?B?bUF6QlBXOThKVE50dTdLTWo5dHRjUUZpVkRqOVhqNldOa2dRZmhpd2tWd0Z0?=
 =?utf-8?B?WjNYdlZQWUg3NXliakpLVExCYm1DT25Ib0pCVExZRnIrSUhFYmxlMnRENG5k?=
 =?utf-8?B?UlpHZ0tKYkZ3NmtENEs0akxSNlU4WVBhN0FZK2RVT3hDWHpydVoxZE5RcThL?=
 =?utf-8?Q?xQYZ5D/z40siohueLO0Gl65mt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ffd79ef-c465-4dec-c81f-08dbbf8a7f71
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 18:49:36.9098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WdSwESoDDV1++GA3gLOo5eBy+HZlGiN9hmd77Wi8xASTHf+L3oCUFRV7SWTVY8+v1mQATq30A7nhcUT2M/VtMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4430
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
> From: Joshua Ashton <joshua@froggi.es>
> 
> Need to funnel the color caps through to these functions so it can check
> that the hardware is capable.
> 
> v2:
> - remove redundant color caps assignment on plane degamma map (Harry)
> - pass color caps to degamma params
> 
> v3:
> - remove unused color_caps parameter from set_color_properties (Harry)
> 
> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 29 ++++++++++++-------
>  1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 15590677f209..7871256f0e5f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -536,6 +536,7 @@ static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
>  /**
>   * __set_input_tf - calculates the input transfer function based on expected
>   * input space.
> + * @caps: dc color capabilities
>   * @func: transfer function
>   * @lut: lookup table that defines the color space
>   * @lut_size: size of respective lut.
> @@ -543,7 +544,7 @@ static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
>   * Returns:
>   * 0 in case of success. -ENOMEM if fails.
>   */
> -static int __set_input_tf(struct dc_transfer_func *func,
> +static int __set_input_tf(struct dc_color_caps *caps, struct dc_transfer_func *func,
>  			  const struct drm_color_lut *lut, uint32_t lut_size)
>  {
>  	struct dc_gamma *gamma = NULL;
> @@ -560,7 +561,7 @@ static int __set_input_tf(struct dc_transfer_func *func,
>  		__drm_lut_to_dc_gamma(lut, gamma, false);
>  	}
>  
> -	res = mod_color_calculate_degamma_params(NULL, func, gamma, gamma != NULL);
> +	res = mod_color_calculate_degamma_params(caps, func, gamma, gamma != NULL);
>  
>  	if (gamma)
>  		dc_gamma_release(&gamma);
> @@ -721,7 +722,7 @@ static int amdgpu_dm_atomic_blend_lut(const struct drm_color_lut *blend_lut,
>  		func_blend->tf = tf;
>  		func_blend->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
>  
> -		ret = __set_input_tf(func_blend, blend_lut, blend_size);
> +		ret = __set_input_tf(NULL, func_blend, blend_lut, blend_size);
>  	} else {
>  		func_blend->type = TF_TYPE_BYPASS;
>  		func_blend->tf = TRANSFER_FUNCTION_LINEAR;
> @@ -946,7 +947,8 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>  
>  static int
>  map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
> -			     struct dc_plane_state *dc_plane_state)
> +			     struct dc_plane_state *dc_plane_state,
> +			     struct dc_color_caps *caps)
>  {
>  	const struct drm_color_lut *degamma_lut;
>  	enum dc_transfer_func_predefined tf = TRANSFER_FUNCTION_SRGB;
> @@ -1001,7 +1003,7 @@ map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
>  			dc_plane_state->in_transfer_func->tf =
>  				TRANSFER_FUNCTION_LINEAR;
>  
> -		r = __set_input_tf(dc_plane_state->in_transfer_func,
> +		r = __set_input_tf(caps, dc_plane_state->in_transfer_func,
>  				   degamma_lut, degamma_size);
>  		if (r)
>  			return r;
> @@ -1014,7 +1016,7 @@ map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
>  		dc_plane_state->in_transfer_func->tf = tf;
>  
>  		if (tf != TRANSFER_FUNCTION_SRGB &&
> -		    !mod_color_calculate_degamma_params(NULL,
> +		    !mod_color_calculate_degamma_params(caps,
>  							dc_plane_state->in_transfer_func,
>  							NULL, false))
>  			return -ENOMEM;
> @@ -1025,7 +1027,8 @@ map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
>  
>  static int
>  __set_dm_plane_degamma(struct drm_plane_state *plane_state,
> -		       struct dc_plane_state *dc_plane_state)
> +		       struct dc_plane_state *dc_plane_state,
> +		       struct dc_color_caps *color_caps)
>  {
>  	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
>  	const struct drm_color_lut *degamma_lut;
> @@ -1056,7 +1059,7 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
>  		dc_plane_state->in_transfer_func->type =
>  			TF_TYPE_DISTRIBUTED_POINTS;
>  
> -		ret = __set_input_tf(dc_plane_state->in_transfer_func,
> +		ret = __set_input_tf(color_caps, dc_plane_state->in_transfer_func,
>  				     degamma_lut, degamma_size);
>  		if (ret)
>  			return ret;
> @@ -1064,7 +1067,7 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
>  		dc_plane_state->in_transfer_func->type =
>  			TF_TYPE_PREDEFINED;
>  
> -		if (!mod_color_calculate_degamma_params(NULL,
> +		if (!mod_color_calculate_degamma_params(color_caps,
>  		    dc_plane_state->in_transfer_func, NULL, false))
>  			return -ENOMEM;
>  	}
> @@ -1143,6 +1146,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  				      struct dc_plane_state *dc_plane_state)
>  {
>  	struct amdgpu_device *adev = drm_to_adev(crtc->base.state->dev);
> +	struct dc_color_caps *color_caps = NULL;
>  	bool has_crtc_cm_degamma;
>  	int ret;
>  
> @@ -1152,6 +1156,9 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  		return ret;
>  	}
>  
> +	if (dc_plane_state->ctx && dc_plane_state->ctx->dc)
> +		color_caps = &dc_plane_state->ctx->dc->caps.color;
> +
>  	/* Initially, we can just bypass the DGM block. */
>  	dc_plane_state->in_transfer_func->type = TF_TYPE_BYPASS;
>  	dc_plane_state->in_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
> @@ -1159,7 +1166,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  	/* After, we start to update values according to color props */
>  	has_crtc_cm_degamma = (crtc->cm_has_degamma || crtc->cm_is_degamma_srgb);
>  
> -	ret = __set_dm_plane_degamma(plane_state, dc_plane_state);
> +	ret = __set_dm_plane_degamma(plane_state, dc_plane_state, color_caps);
>  	if (ret == -ENOMEM)
>  		return ret;
>  
> @@ -1185,7 +1192,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  		 * linearize (implicit degamma) from sRGB/BT709 according to
>  		 * the input space.
>  		 */
> -		ret = map_crtc_degamma_to_dc_plane(crtc, dc_plane_state);
> +		ret = map_crtc_degamma_to_dc_plane(crtc, dc_plane_state, color_caps);
>  		if (ret)
>  			return ret;
>  	}

