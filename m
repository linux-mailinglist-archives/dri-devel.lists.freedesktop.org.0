Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2D87EF7B9
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 20:14:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854C110E766;
	Fri, 17 Nov 2023 19:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2064.outbound.protection.outlook.com [40.107.100.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299F410E766;
 Fri, 17 Nov 2023 19:14:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzbMEzQys9V/IPfm4BhjvUPT54UIOpA4UQWGCIh01U5DioWf486Q8xJNyw5FUIJb0VMvDZyGHZpK9mfdTXWsbbV1wZqBvkwzul1/4uBXfw2DZYkPPwbHb638RNzyuhLpLb+IKsl9mBDULTWu112152to5VGSoJo8US6PIP+kBiDIhTtFYm6vpI5Jl87IEgKUrEdMWXKhepWBPQUOg3nfGcFjOGZp0RttuoMuZiwHmcRYRKLgADZP9EbDdZXo5t9H2PhDOrwsKINCHqGXDqSTKlDl+dZBmx6G/71Rc84AVwyu0ckAxbtwCKfjDJeV0e3oX6CezMB/+HpeY5/+tBHsvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNjziSD1evOFctcde+YIF/efJ1mACSAF46hmhsPZ4mI=;
 b=D1cdqBQzJgdTOxJw7nr4lr9qg3npjb5dgmNJTtEaObRG4vEzFTVmRzEXa9EejtmuEwnrYYOEX5P+YbVugWlTI0bC6PuPbDsbelDrHfRfsBRUiEr58ec++8MfEhYMHQTsk6zqACD4tzNr4Bn5otZnAJ84VjiuCZ9tS6XP5dY2imHH3/UBxXibpxQ4XnO7D7YfzAyq2mtuMsO9mkG4bZANs2LbJS0+zh58yS+VYnbvesjC616lz0siSNnUTproxusPEDUgzVRO3YIo6GEVh8g/p/dscLKkhG2iPdIbxLaM0aKvsMsjCTMOtX6LykqAixyFaHMTAy3KcjfkpOU7r03s4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNjziSD1evOFctcde+YIF/efJ1mACSAF46hmhsPZ4mI=;
 b=NOtsk5slRs+NGx7sByBfhOR2/pGhncOqPXlBLSQPlcqj31WroKLSi5O4YbCwjiCEZtRKJHECztE0uCQS/N/juE7OBNgk752AS/ybT5v8EiTwK9J6kfIchHZkNjWcqRygTh6kHR0+2fEHdmCweVVmXdNQSmuooHexeHFGXSAdMRM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MN6PR12MB8490.namprd12.prod.outlook.com (2603:10b6:208:470::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Fri, 17 Nov
 2023 19:14:34 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a%5]) with mapi id 15.20.7002.015; Fri, 17 Nov 2023
 19:14:33 +0000
Message-ID: <53b73a8a-453c-41a3-ba1c-b00091204d56@amd.com>
Date: Fri, 17 Nov 2023 14:14:29 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/32] drm/amd/display: add plane 3D LUT
 driver-specific properties
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20231116195812.906115-1-mwen@igalia.com>
 <20231116195812.906115-10-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231116195812.906115-10-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0125.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::25) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|MN6PR12MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: c3019f44-fee0-492c-78c4-08dbe7a16ea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yeOAupkCshOI289XU0D+Pc4i1xO01uHNRN7gJqZNvpmpegqD3Ev3MUoC5jBmlRy8/tTpbsA6XoLKJMbWHuIe9MomoAdjN54b4QRS3pf/c623NvVCcKOe9k4BKPweRicqV5xPAl7dxw10T1IvXp4W90k7S/ahReX8QzaEETLVP1C3m3fhP+rdpmro0zavhPx9us39B0yr/EUcU3YxQcqLYQoKGypctoiY6yDnNddCFc1c8zRPu2uBSDVVasfp+nkj0/J2S7vnC64JNPFxPSgpikaHi1W7LJXgZ/biZWRLpets5P1g6iCdqXuSG6ZPPSCgxd7LTG0/GMpnn+tB8V2HjQJXqAZ1iHcf0I4BhQmzCaB37as0QKb0dPk0pdT5wUs8+oyL+B+2XqX6nNnn1QtbM9NO+QiTYYvT0YpztUIa84NO4YpvhJOBKAM5KSIORBcNjFG+Wiv+Ps+eusUuHTvY6dDaUZdSwi5HXj34GHy2QWdEs/qwnXySzL4oQNQ19Rnt98BrUC3KkaKWu06xnDSRhM6L2FsmCtOhwF1Z77dySENIk/eVkIaen2qPQDUNIOMh0XIqVc+ymU0i5yktoOYeIoBJAjgg9tY0s7Dqqag5fs5BsLOKAdtJyg9wvI9fQJX7iNRD1QQbsUWRPZnD4uJbXdHzLcg0rSVez0D90W8liew=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(83380400001)(478600001)(6486002)(2616005)(6666004)(26005)(38100700002)(31696002)(44832011)(66946007)(66556008)(54906003)(66476007)(4326008)(316002)(8676002)(36756003)(8936002)(41300700001)(4001150100001)(2906002)(5660300002)(31686004)(86362001)(53546011)(7416002)(110136005)(6506007)(921008)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFpBM0xTUHgrU0VqcTh2ZkFTcjhia3paNklMR2JKd2FHaVYvSWRHd3RHdCtJ?=
 =?utf-8?B?Q0JFdDRFbjRoQVZqc0NSK2E3bHBZeE9Xb09Zc1FLNGtyNkt3ckZtcGhtU2hR?=
 =?utf-8?B?TzlydDF4REJuREpNYmhPSFBnZCtjbGN1UTg0VkErczZoc0JqdEJ0WTR0d3Qw?=
 =?utf-8?B?TkN6RXBOK0srdWJNWmkvZ1dSMFZLcVJzYWxKUVdWSnNqQ01ZU3EvdTJYaU5m?=
 =?utf-8?B?V3JuUlFNNmJCNUVQa2RPYXdHaTNzTWVKQzlXV0ZRNk8xVERLUUtQa0hUMVVB?=
 =?utf-8?B?YXF3YVJlWWRobHh6TGJiU0FiQWJWWHlWcDg3cXFiQk9zL0lEd2VaajhUMlRR?=
 =?utf-8?B?cFVwNkQyU0pmS3hGanUrMFVQS2dDamh0cVp4UjNBeGhsRUx0bVhzSk9FTU1N?=
 =?utf-8?B?WllORHdSclJsOTBVVk4vVkRucWRHaXFrZ3VvMTY3bFlubDJxRG1HbWF5allL?=
 =?utf-8?B?MGRjaHVLTWhFOUhtdUZ1WHJQcTVWaEowU0J3Sm5oUlllY3Y0ZHJDRHZXcGpT?=
 =?utf-8?B?dkxISzkxRWs4bkxCZ1d4MUk3V0FSS1pCNVVNdW9MSXVwL3puN1NCR0JzVi9G?=
 =?utf-8?B?VHMrZEN4Unk2ekdhbVZkOWxwd0ZBYzNxSU5Sd3JGdkpPclV1TVBUbjdHY1c5?=
 =?utf-8?B?czR6UWJndGIrcWcwSitJejhENm5RWHJvVnZJNlNuTXV2TktNOUlXMCtPaUt5?=
 =?utf-8?B?QlZCMkF3aG1YbkZsMllyTjQ1N21zdjh5S25ueVUzUmdoNUhpL3ppNmRQSG5k?=
 =?utf-8?B?V0N1MXU3b3NBcVpjYjV6VUhoemRkL0ZiaEJRSDVUMi9XcUw1RElrTzJBTnZK?=
 =?utf-8?B?R0hxbko4MVMxUStUOEFwU3VqcGI1cmlJazNJem14c1d3VDdPeDljK0ZKUWtm?=
 =?utf-8?B?azJVMTBhQ1NvTFZwUXo2UmwyVFRTdElvM1oyajg4YlVKNUxodFlxN2YvNis4?=
 =?utf-8?B?bllIUE41WFd0YWNjUmQ3NjRvemVWZGl4d2xmY0VpVUFIVXlsN0RPSGN5YnpD?=
 =?utf-8?B?aVIraTFLNFlIcGdxcDVEYWp0ajNKOVNzWWp0Rm9VbFVoMGdnSzl0dXM3SmJr?=
 =?utf-8?B?MDN5R0tJY25pUGVQYTNIL0c0QnpXMlM0bGZ6MEYrd2ZIS0dGVWpHUk1RZzh0?=
 =?utf-8?B?Q0pNcDlHbEtucmtDMFVOdUFwODlVdXQzR1pBRDRNcUFRWWdQQlBxcXBaTGFV?=
 =?utf-8?B?THBtdWgzM1dXSGx6Ykhrc3lWZG1mVmkxQzRnVzZEVHdmcVUxVXkyOC9oSW8v?=
 =?utf-8?B?ME1QRGlJUnZEamRrY1BFYmdQaWxNaWk1SS9ZN3BnMzExS2lOV3d6NzNxaUtq?=
 =?utf-8?B?VWZYMHF2SGRwMGxaanRxRzljakpvUVpmS3YzL21QV25WKzFoTEl1MzRlN0tY?=
 =?utf-8?B?cXcvVmpxbFdKWkphSXJ2L1lNMXYvMkZqbjZxd0pPcHUyREM2OFkvOFB6M0Uw?=
 =?utf-8?B?MjhOeDFMMElTZlIzRno2Mk1mSHVJZGRadEZDOTVLK01UanU1TVRURHdCYjFr?=
 =?utf-8?B?S2llZ2NNeVJOdkxXNitvclNBM3ZMTGR4dnViTloyRTc5MTJSUUppdU1YRHQ5?=
 =?utf-8?B?MmRyZTNSYUtCQ29YWTBOd3NkTEhDTnN4STkyUWplQXZvNVVNVlpLY2RvT1lG?=
 =?utf-8?B?eDZiankyY1d2VS94R1RRNzhnT01YYTdCOGRHWCtLT2t3eThYdWc4cHFLVDFq?=
 =?utf-8?B?eWJ4S3JCcjZ6czhXb1o5MmlnU0x2elpHU0FOZTRyZXc0Vzd5SlpGYjRZMUV4?=
 =?utf-8?B?VklkUGtmc29URjR3dmI5RGdRWHNJcVhiU2pQdEpTeS96OUlKZmM3WDBqQzJj?=
 =?utf-8?B?aGRDK2VJcWIyWWorcHA2MDRYUzZZS0tqTUoyazRSMUJnTHQ5aVF5eWRxeTBk?=
 =?utf-8?B?N1dDUm9wNXc0L1cvS1JkUnMxSFpPQlZtWlFtcDNhUmY0VHV3WFYwZDhzak8y?=
 =?utf-8?B?VThQWE9mNHZVT0hCYXhpdnpTbmwvQ0xJb3JvRXZENDFvbXhPQTB4TDdJaWp5?=
 =?utf-8?B?WElZQ0VjLy9QMUh2enJFRVBVblpRYVZYYzFkN04yQmVRNFBvQnlhcUVuT2d5?=
 =?utf-8?B?OWxYNGhqT3VDUUJxMllzMkFaZlpGT05SZGQ2aVIrSFFPUi9WMS9hQlkxQlB2?=
 =?utf-8?Q?ZUvwcSw/SBTQH0NnBxoQDG9uB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3019f44-fee0-492c-78c4-08dbe7a16ea0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 19:14:33.8269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1jbd1MYAVycghKI6jaQXehhHGmoWomgM3/XJvLOwwRH9ehCetVUgZwO21JSMzkZ5TnbixWF006K743K5L1Rz+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8490
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

On 2023-11-16 14:57, Melissa Wen wrote:
> Add 3D LUT property for plane color transformations using a 3D lookup
> table. 3D LUT allows for highly accurate and complex color
> transformations and is suitable to adjust the balance between color
> channels. It's also more complex to manage and require more
> computational resources.
> 
> Since a 3D LUT has a limited number of entries in each dimension we want
> to use them in an optimal fashion. This means using the 3D LUT in a
> colorspace that is optimized for human vision, such as sRGB, PQ, or
> another non-linear space. Therefore, userpace may need one 1D LUT
> (shaper) before it to delinearize content and another 1D LUT after 3D
> LUT (blend) to linearize content again for blending. The next patches
> add these 1D LUTs to the plane color mgmt pipeline.
> 
> v3:
> - improve commit message about 3D LUT
> - describe the 3D LUT entries and size (Harry)
> 
> v4:
> - advertise 3D LUT max size as the size of a single-dimension
> 
> v5:
> - get lut3d blob correctly (Joshua)
> - fix doc about 3d-lut dimension size (Sebastian)
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

We'll run this series through our testing. If that doesn't show
problems and if I don't see any new comments on the series I'm
planning to merge it through amd-staging-drm-next.

Harry


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      | 18 ++++++++++++++
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  9 +++++++
>   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 14 +++++++++++
>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 24 +++++++++++++++++++
>   4 files changed, 65 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index ee67c5adf0f1..57822477408f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -364,6 +364,24 @@ struct amdgpu_mode_info {
>   	 * @plane_hdr_mult_property:
>   	 */
>   	struct drm_property *plane_hdr_mult_property;
> +	/**
> +	 * @plane_lut3d_property: Plane property for color transformation using
> +	 * a 3D LUT (pre-blending), a three-dimensional array where each
> +	 * element is an RGB triplet. Each dimension has the size of
> +	 * lut3d_size. The array contains samples from the approximated
> +	 * function. On AMD, values between samples are estimated by
> +	 * tetrahedral interpolation. The array is accessed with three indices,
> +	 * one for each input dimension (color channel), blue being the
> +	 * outermost dimension, red the innermost.
> +	 */
> +	struct drm_property *plane_lut3d_property;
> +	/**
> +	 * @plane_degamma_lut_size_property: Plane property to define the max
> +	 * size of 3D LUT as supported by the driver (read-only). The max size
> +	 * is the max size of one dimension and, therefore, the max number of
> +	 * entries for 3D LUT array is the 3D LUT size cubed;
> +	 */
> +	struct drm_property *plane_lut3d_size_property;
>   };
>   
>   #define AMDGPU_MAX_BL_LEVEL 0xFF
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 38163b7084fa..03b48b331b7c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -776,6 +776,11 @@ struct dm_plane_state {
>   	 * TF is needed for any subsequent linear-to-non-linear transforms.
>   	 */
>   	__u64 hdr_mult;
> +	/**
> +	 * @lut3d: 3D lookup table blob. The blob (if not NULL) is an array of
> +	 * &struct drm_color_lut.
> +	 */
> +	struct drm_property_blob *lut3d;
>   };
>   
>   struct dm_crtc_state {
> @@ -861,6 +866,10 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>   
>   void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
>   
> +/* 3D LUT max size is 17x17x17 (4913 entries) */
> +#define MAX_COLOR_3DLUT_SIZE 17
> +#define MAX_COLOR_3DLUT_BITDEPTH 12
> +/* 1D LUT size */
>   #define MAX_COLOR_LUT_ENTRIES 4096
>   /* Legacy gamm LUT users such as X doesn't like large LUT sizes */
>   #define MAX_COLOR_LEGACY_LUT_ENTRIES 256
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index b5b34a9209e4..a3b4f6a4c4a8 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -231,6 +231,20 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
>   		return -ENOMEM;
>   	adev->mode_info.plane_hdr_mult_property = prop;
>   
> +	prop = drm_property_create(adev_to_drm(adev),
> +				   DRM_MODE_PROP_BLOB,
> +				   "AMD_PLANE_LUT3D", 0);
> +	if (!prop)
> +		return -ENOMEM;
> +	adev->mode_info.plane_lut3d_property = prop;
> +
> +	prop = drm_property_create_range(adev_to_drm(adev),
> +					 DRM_MODE_PROP_IMMUTABLE,
> +					 "AMD_PLANE_LUT3D_SIZE", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	adev->mode_info.plane_lut3d_size_property = prop;
> +
>   	return 0;
>   }
>   #endif
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 45a2c9b36630..e588cff7d6b0 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1364,6 +1364,9 @@ static struct drm_plane_state *amdgpu_dm_plane_drm_plane_duplicate_state(struct
>   	if (old_dm_plane_state->degamma_lut)
>   		dm_plane_state->degamma_lut =
>   			drm_property_blob_get(old_dm_plane_state->degamma_lut);
> +	if (old_dm_plane_state->lut3d)
> +		dm_plane_state->lut3d =
> +			drm_property_blob_get(old_dm_plane_state->lut3d);
>   
>   	dm_plane_state->degamma_tf = old_dm_plane_state->degamma_tf;
>   	dm_plane_state->hdr_mult = old_dm_plane_state->hdr_mult;
> @@ -1437,6 +1440,8 @@ static void amdgpu_dm_plane_drm_plane_destroy_state(struct drm_plane *plane,
>   
>   	if (dm_plane_state->degamma_lut)
>   		drm_property_blob_put(dm_plane_state->degamma_lut);
> +	if (dm_plane_state->lut3d)
> +		drm_property_blob_put(dm_plane_state->lut3d);
>   
>   	if (dm_plane_state->dc_state)
>   		dc_plane_state_release(dm_plane_state->dc_state);
> @@ -1470,6 +1475,14 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
>   	drm_object_attach_property(&plane->base,
>   				   dm->adev->mode_info.plane_hdr_mult_property,
>   				   AMDGPU_HDR_MULT_DEFAULT);
> +
> +	if (dpp_color_caps.hw_3d_lut) {
> +		drm_object_attach_property(&plane->base,
> +					   mode_info.plane_lut3d_property, 0);
> +		drm_object_attach_property(&plane->base,
> +					   mode_info.plane_lut3d_size_property,
> +					   MAX_COLOR_3DLUT_SIZE);
> +	}
>   }
>   
>   static int
> @@ -1501,6 +1514,14 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
>   			dm_plane_state->hdr_mult = val;
>   			dm_plane_state->base.color_mgmt_changed = 1;
>   		}
> +	} else if (property == adev->mode_info.plane_lut3d_property) {
> +		ret = drm_property_replace_blob_from_id(plane->dev,
> +							&dm_plane_state->lut3d,
> +							val, -1,
> +							sizeof(struct drm_color_lut),
> +							&replaced);
> +		dm_plane_state->base.color_mgmt_changed |= replaced;
> +		return ret;
>   	} else {
>   		drm_dbg_atomic(plane->dev,
>   			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
> @@ -1528,6 +1549,9 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
>   		*val = dm_plane_state->degamma_tf;
>   	} else if (property == adev->mode_info.plane_hdr_mult_property) {
>   		*val = dm_plane_state->hdr_mult;
> +	} else 	if (property == adev->mode_info.plane_lut3d_property) {
> +		*val = (dm_plane_state->lut3d) ?
> +			dm_plane_state->lut3d->base.id : 0;
>   	} else {
>   		return -EINVAL;
>   	}
