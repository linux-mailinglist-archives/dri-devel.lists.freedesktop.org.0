Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC3871F2DE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 21:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D5F10E5A8;
	Thu,  1 Jun 2023 19:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B1A10E5A2;
 Thu,  1 Jun 2023 19:24:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xqpa0Dbfo5LVwNWCPtDfgHUdojmwlXI11EGPDuZ/DV1z/aVOgUGFub7Lea9B7JUt1e+kGrU4T3H4yPqZuXKXkzMpxs7I8//npl6Zkhda6h7QmvLgaBELchqmX/DPUJd2QS0z1q2lzbJ7/g1HUFplN9HVasswZFPHoE5gdkqaI16/bzenUXPdUlcY69xggdMWTSW86pTsHRfEhveKHdJ+q3jfasa1dUA3ND+3LZsXR/vSEqtPMSVg+rAeH9DDnmZFWpiNj/nwQlkSAx94xQp2eyO6rwXaT8f5UJ3poxusW+OUXDy75PcSdlISIWIXl+6Wvim1kSj9xjxlrX51+ofLRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xX5NwVt/FQQX0rYPky4ve9vPntgWpwHx/I/xAj4CtVo=;
 b=iNCvOv1KBtSGSUPwEBPhH2QzmX7pCd3i3IZjiLQkDbBTfg9XAYTlO7bEJladhzlkoTsXZhj1pbd3OllKWVbnBmNIdsp+Cfpe+xX8i+Oi+02PrA/sxgGuIyE/Nf8JtPpoCrY5da212lQKrLpaUAOhpnzsnRjmpZanP6dDsI7x043XHD0VhE6FPPXUMQcN4ujeKH2+iAwF/fKcRy2BZo3v/YIivlFZgqmgcAJNTZ3uGIBQjTe0a1CMks5fYO1GksRIvZp5I6ogAXsOyBhv/2+7cFHUxt07AI2NoSMlzGm+zIFybJiDJvHk8KvzdobCKQDEz7lZOXQ5/Iy9W4xCIdUhzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xX5NwVt/FQQX0rYPky4ve9vPntgWpwHx/I/xAj4CtVo=;
 b=4AqH0II5QxBLDdUAvgBs5R8f7WuX1kCl2AiEfLV0CUpwjMSi3+lxKbikJ5H9hbzQeoxa+ELC2BqnSeiWQRqY4abrb2wf+Ji+i/LEQiSefcCYtdV0cwi1Ez0pozmmbuHnC8emR431Qb03gCMar7dKy3P2MXCNC/jZxpfoXi3VxAs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com (2603:10b6:a03:3ba::23)
 by IA0PR12MB9010.namprd12.prod.outlook.com (2603:10b6:208:48e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Thu, 1 Jun
 2023 19:24:28 +0000
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::7a73:2b11:74b0:b2e4]) by SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::7a73:2b11:74b0:b2e4%4]) with mapi id 15.20.6433.022; Thu, 1 Jun 2023
 19:24:28 +0000
Message-ID: <717f0e53-4e38-7ffe-3ea7-84d4bb6c284e@amd.com>
Date: Thu, 1 Jun 2023 15:24:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 07/36] drm/amd/display: add plane driver-specific
 properties for degamma LUT
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230523221520.3115570-1-mwen@igalia.com>
 <20230523221520.3115570-8-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230523221520.3115570-8-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0075.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::8) To SJ0PR12MB5438.namprd12.prod.outlook.com
 (2603:10b6:a03:3ba::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5438:EE_|IA0PR12MB9010:EE_
X-MS-Office365-Filtering-Correlation-Id: e1678119-0d61-4349-5a53-08db62d5d0c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pMEsGzhuFzQ5wnf8XoVqxegDPH4IWuZtu8dTCK3X+xtdtgNw/88mPAtc4UEllEeZA058pohBE2UlohjdrGpcGwn85lGZWQC/A/qL8RqJf1Jv+0KSVE5W8QUhu7pH9fo7OzUtlbCY9mQ56Y+ABjrVqOr9lUo3UE1xdeRSjMRvNGLeU5dt+F5Ee3q9QIZ2lnpeN5zTbp30zNlbafbl4HLbWrXd8BMyCUWORbfQUM9O+qveHtWZsbJ03PznwM7IRg3AJet9ZIrqTGh2KLse8U0hxYwv4RrRH3gRhSVbG38GEgcZ6ADd9HD/IzihsZ0w+zzjBeoySqDqxRP6ar0umpZDT1sXpkQdiZU7n48c1rQSrhtdwWrWD5/6HzlHdN0I88IOfjO+mNrFDMeHmWgTuOzbqNYGtzKfjhlO2V+m8anT1t0vY7C+63plnyniQPTXq/wjyAI0odWozj5o98bqponK7kUce4WsHIDUXHQY6MWgvR1ukomAlNWzvYsTDejLYLhwbvpnAp525L+hfjHxyscCGdb+RUhns2/f++DggyKy2/+l4pC+9tm2vO9wMScm6fP+cjKn8vzqZiL7/Z4CBIJwXohMi6mV9MHUz2C+cqmCwhzc3hP5G0JkfO/KLf/lvqOgF5sGkMzxeLK1byFWXJBZ52pVZkdTrZqtn7vuf1umvQ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5438.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(451199021)(41300700001)(6486002)(86362001)(31696002)(4326008)(6666004)(66946007)(66556008)(316002)(66476007)(36756003)(186003)(26005)(83380400001)(44832011)(6506007)(53546011)(2616005)(31686004)(7416002)(6512007)(478600001)(38100700002)(2906002)(921005)(54906003)(8936002)(5660300002)(110136005)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0R4WTBNTTJYSE5VK0V0TXJicXlFTUhGbHZmTldtRDhtN2h4K2Jyc29MdDh2?=
 =?utf-8?B?WXM5R1d6Y2hMZVdnZkFrNzBoZmpBb3d6TDlqMVNsRy9TLzJvL3pGUUN1dk5L?=
 =?utf-8?B?c3RjelNwNFhURWNFRXpIaytVc0NGTlNYdkRRdVQrNDczdkRxV0NUQ3JOMXJ1?=
 =?utf-8?B?Q1l4cTdYZXdoczNKRGNkUjVTb0lPVTZxTHlqeGwwZ09icWE0dVhCK3lKdzhI?=
 =?utf-8?B?V1EzOHozUDVPdzZFcnlBL09mUVFQWFI3ekhSMTI1bWxQUWhPU1RaQ25FcG5Z?=
 =?utf-8?B?Y2FLc2FhcGZaNXQ5RDMzUzJXckVNTEpNT1A2TzkvblpFL1JpRXUrQjI1VEVv?=
 =?utf-8?B?RXBFUnFWZFNjQjR1QnZ6SG9leDl3WFhVQVJuTi9rMUFJSUZCSURQNWN5aHF1?=
 =?utf-8?B?Ulh0eHF4UHIzcE5qQklMaHpaY08vcHYrNXQxcnhNc3FCbFRQM2hmajNPQzBH?=
 =?utf-8?B?WWpkN2daRlFVWVk3aHFtQmY5eG0yK3NJblNtaTRLbVBoTUU0L01JaDhWdW91?=
 =?utf-8?B?Sm1Fd3Nub2JmYktVMGNGTE1XWEZHMVd2S2htNnNiVTdjQ3Jja3JrdmtvOVhU?=
 =?utf-8?B?d3V5STVyU3FubTVxanJ1b1RPUlZCd3JzTWp3K0wwRG1RRkhIZHdKWU5YRUhh?=
 =?utf-8?B?RG5xT2JYQ3RhcGdPcjZyck9hYk1JVUFZSVl3WEJHYkZMdTBWR1RzMXZ3dXhD?=
 =?utf-8?B?cjYzYjhJamF6bHpyUk9GeE1zdjBtWVVZSzZzdUpIcXdxUndhRU00cWJROStu?=
 =?utf-8?B?V0QrVlRvb2J6eW1HVnY0cjRBZHYzSHJGZkRnQUZjZXVsYkova3JtVEpkVVlR?=
 =?utf-8?B?MGNJNDdNTnFtZFdEaVl4N1FQODA5Q0xVNHcvSkFJS2FhemVZT1VaUDl3Snc4?=
 =?utf-8?B?eXlpZ09PN2JCTU1mN2t5d2Rob21tQVJCL3FVdGpac011K24vNjQ0dTBXOUxY?=
 =?utf-8?B?UmJWUC9HQWZTdnJCcndyRmpTTHpJeXRsTHhocnluWUZRYm1CNU85bnNEVmVM?=
 =?utf-8?B?WlFPNCtuQytta1RqVmJwcWtpclpLNzFoNTVFcjFqY3J0U09NS2s2aTVrNUc3?=
 =?utf-8?B?OGR2bWlvaVpUSi9lYW5wL2g4cER4VURqNDJJTjRnQkMwQVRtUkFTSlM2dnJO?=
 =?utf-8?B?Y3N4SEdYRjVmeTFuMHVHbmpoN3BhR3V5bzQxK2k4K2IrSWd0a0RRaUJhcFNP?=
 =?utf-8?B?dGxEYm5qMG5IZDZFZUJrZ2pRRzVvWi9RMkJIOE9YajN1ak9nYU5jR2kzd1hw?=
 =?utf-8?B?N2NPb2VVVWNMNlo1Qk9hUnRFVlRlR0tTVFk2Um85OFc1clZ2ZDhWdU1aeVlE?=
 =?utf-8?B?UzRaeG5aUXhNM3ZnRVF2dldGUGhDUnZuWWNVMWZtc1JTWGVndWhrWmFHejBp?=
 =?utf-8?B?WWJwdytxUnR3QkJwMlBkUXpUTnk1YzRPMlhERU1RR1hDSEdFOGxKbDFJT3VD?=
 =?utf-8?B?UmMvTUZ4MmJRL0J1MnlsRm9zNXl5enlSRlJxdXR2UVVkc0Q2VEpCc3JsUWda?=
 =?utf-8?B?UnE3ZzBsOGJZZW50TDZyb2NLNTRVbUwveVJkVFJSSVNNc2l4bHk1Vloxcnly?=
 =?utf-8?B?L2UxWXQyZWlEazRPaHJxaHN1SnlWT1YyUzVaL3NRUGdSblVjdUsvMnRPajFV?=
 =?utf-8?B?WkQ2R1Jwb1gwSjByVVA1RHVGMHJVYXVJK1E2dVd4WjJvRUNWaS8yTDNBKy82?=
 =?utf-8?B?REtQUkFHc2o2VkpFSGVQWEJwbnJ5UFdySVVtdm1GSDhrOWhrKzRpYmNra3gz?=
 =?utf-8?B?VkNJSi8wUVpSVWR2Szg2OUVuVDVXbFo1SzhkQkZvN21WbmpHTHNWZWxpS0Fv?=
 =?utf-8?B?cU0vY1NWQjRtcGk3RkppTFBOUGVWN2RlcWFKeHlCMTl3TFFyT21jZW1BUExF?=
 =?utf-8?B?RzcrSXg1VjVJNUk1Z2oxZTRBRUhQVjQ1QlpscWVsdFlOVFpESjRsZEFWTkNj?=
 =?utf-8?B?eWpNeFZ4OFpWRGM3UVBEM2xoM2xScHlJSms5RDF4dy9xVGhHNTdOYWV0L3dB?=
 =?utf-8?B?TTArQUZTSlJaelF6QXdFRTR6dE5ZUGZPc00wM21kU3JLQytiZkM4alRLNll3?=
 =?utf-8?B?WllMNXpDWVZHWXY3QVRLV2cwbDJZZkwwbDMxT3VIWGxnbVd3TjN3OUR6U1c3?=
 =?utf-8?Q?IRcwsbydJ4J1kLf145UkTt273?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1678119-0d61-4349-5a53-08db62d5d0c7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5438.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 19:24:27.9273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMacOOG4eg/OMBeBh8a6muimxRVTEdJlhzJ+18wj/QKuzhkz0V/3TAEbgOQ1hRA6C0rvPsxv+al1VQICXwrplw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9010
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



On 5/23/23 18:14, Melissa Wen wrote:
> Create and attach driver-private properties for plane color management.
> First add plane degamma LUT properties that means user-blob and its
> size. We will add more plane color properties in the next commits. In
> addition, we keep these driver-private plane properties limited by
> defining AMD_PRIVATE_COLOR.
> 
> Co-developed-by: Joshua Ashton <joshua@froggi.es>
> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 14 ++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  8 ++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  9 +++
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 77 +++++++++++++++++++
>  4 files changed, 108 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index 88af075e6c18..fa67c84f5994 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -1275,6 +1275,20 @@ amdgpu_display_create_color_properties(struct amdgpu_device *adev)
>  		return -ENOMEM;
>  	adev->mode_info.regamma_tf_property = prop;
>  
> +	prop = drm_property_create(adev_to_drm(adev),
> +				   DRM_MODE_PROP_BLOB,
> +				   "AMD_PLANE_DEGAMMA_LUT", 0);
> +	if (!prop)
> +		return -ENOMEM;
> +	adev->mode_info.plane_degamma_lut_property = prop;
> +
> +	prop = drm_property_create_range(adev_to_drm(adev),
> +					 DRM_MODE_PROP_IMMUTABLE,
> +					 "AMD_PLANE_DEGAMMA_LUT_SIZE", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	adev->mode_info.plane_degamma_lut_size_property = prop;
> +

Same as with previous patch and the following ones... Would be
great to have this sit in amdgpu_dm_color.c.

Harry

>  	return 0;
>  }
>  #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index 881446c51b36..6c165ad9bdf0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -352,6 +352,14 @@ struct amdgpu_mode_info {
>  	 * drm_transfer_function`.
>  	 */
>  	struct drm_property *regamma_tf_property;
> +	/* @plane_degamma_lut_property: Plane property to set a degamma LUT to
> +	 * convert color space before blending.
> +	 */
> +	struct drm_property *plane_degamma_lut_property;
> +	/* @plane_degamma_lut_size_property: Plane property to define the max
> +	 * size of degamma LUT as supported by the driver (read-only).
> +	 */
> +	struct drm_property *plane_degamma_lut_size_property;
>  };
>  
>  #define AMDGPU_MAX_BL_LEVEL 0xFF
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index ad5ee28b83dc..22e126654767 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -716,6 +716,15 @@ enum drm_transfer_function {
>  struct dm_plane_state {
>  	struct drm_plane_state base;
>  	struct dc_plane_state *dc_state;
> +
> +	/* Plane color mgmt */
> +	/**
> +	 * @degamma_lut:
> +	 *
> +	 * LUT for converting plane pixel data before going into plane merger.
> +	 * The blob (if not NULL) is an array of &struct drm_color_lut.
> +	 */
> +	struct drm_property_blob *degamma_lut;
>  };
>  
>  struct dm_crtc_state {
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 322668973747..e9cedc4068f1 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1338,6 +1338,9 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
>  		dc_plane_state_retain(dm_plane_state->dc_state);
>  	}
>  
> +	if (dm_plane_state->degamma_lut)
> +		drm_property_blob_get(dm_plane_state->degamma_lut);
> +
>  	return &dm_plane_state->base;
>  }
>  
> @@ -1405,12 +1408,79 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
>  {
>  	struct dm_plane_state *dm_plane_state = to_dm_plane_state(state);
>  
> +	if (dm_plane_state->degamma_lut)
> +		drm_property_blob_put(dm_plane_state->degamma_lut);
> +
>  	if (dm_plane_state->dc_state)
>  		dc_plane_state_release(dm_plane_state->dc_state);
>  
>  	drm_atomic_helper_plane_destroy_state(plane, state);
>  }
>  
> +#ifdef AMD_PRIVATE_COLOR
> +static void
> +dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
> +					     struct drm_plane *plane)
> +{
> +	if (dm->dc->caps.color.dpp.dgam_ram || dm->dc->caps.color.dpp.gamma_corr ) {
> +		drm_object_attach_property(&plane->base,
> +					   dm->adev->mode_info.plane_degamma_lut_property, 0);
> +		drm_object_attach_property(&plane->base,
> +					   dm->adev->mode_info.plane_degamma_lut_size_property,
> +					   MAX_COLOR_LUT_ENTRIES);
> +	}
> +}
> +
> +static int
> +dm_atomic_plane_set_property(struct drm_plane *plane,
> +			     struct drm_plane_state *state,
> +			     struct drm_property *property,
> +			     uint64_t val)
> +{
> +	struct dm_plane_state *dm_plane_state = to_dm_plane_state(state);
> +	struct amdgpu_device *adev = drm_to_adev(plane->dev);
> +	bool replaced = false;
> +	int ret;
> +
> +	if (property == adev->mode_info.plane_degamma_lut_property) {
> +		ret = drm_property_replace_blob_from_id(plane->dev,
> +							&dm_plane_state->degamma_lut,
> +							val,
> +							-1, sizeof(struct drm_color_lut),
> +							&replaced);
> +		dm_plane_state->base.color_mgmt_changed |= replaced;
> +		return ret;
> +	} else {
> +		drm_dbg_atomic(plane->dev,
> +			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
> +			       plane->base.id, plane->name,
> +			       property->base.id, property->name);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +dm_atomic_plane_get_property(struct drm_plane *plane,
> +			     const struct drm_plane_state *state,
> +			     struct drm_property *property,
> +			     uint64_t *val)
> +{
> +	struct dm_plane_state *dm_plane_state = to_dm_plane_state(state);
> +	struct amdgpu_device *adev = drm_to_adev(plane->dev);
> +
> +	if (property == adev->mode_info.plane_degamma_lut_property) {
> +		*val = (dm_plane_state->degamma_lut) ?
> +			dm_plane_state->degamma_lut->base.id : 0;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +#endif
> +
>  static const struct drm_plane_funcs dm_plane_funcs = {
>  	.update_plane	= drm_atomic_helper_update_plane,
>  	.disable_plane	= drm_atomic_helper_disable_plane,
> @@ -1419,6 +1489,10 @@ static const struct drm_plane_funcs dm_plane_funcs = {
>  	.atomic_duplicate_state = dm_drm_plane_duplicate_state,
>  	.atomic_destroy_state = dm_drm_plane_destroy_state,
>  	.format_mod_supported = dm_plane_format_mod_supported,
> +#ifdef AMD_PRIVATE_COLOR
> +	.atomic_set_property = dm_atomic_plane_set_property,
> +	.atomic_get_property = dm_atomic_plane_get_property,
> +#endif
>  };
>  
>  int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
> @@ -1489,6 +1563,9 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
>  
>  	drm_plane_helper_add(plane, &dm_plane_helper_funcs);
>  
> +#ifdef AMD_PRIVATE_COLOR
> +	dm_atomic_plane_attach_color_mgmt_properties(dm, plane);
> +#endif
>  	/* Create (reset) the plane state */
>  	if (plane->funcs->reset)
>  		plane->funcs->reset(plane);

