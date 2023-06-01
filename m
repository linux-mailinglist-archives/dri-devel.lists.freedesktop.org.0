Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5692871F2FD
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 21:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6F310E5B8;
	Thu,  1 Jun 2023 19:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::613])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2B410E5B2;
 Thu,  1 Jun 2023 19:33:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWQYRiZ+Sb+x85kWvPecz06m3tbh5TgpuMumL08Rd8VbQygXreeH5VJJndsH2JyB2ybZNLFe6DduIJg1/HWq+zch6eEzELcdQjrMkEXTx7ICtoM4/YTIhC5g0KhHtw7GWSIYbuTEkY7wHF066i4TJP05mxQwdV35ndzzw52d/+fuY8oaKo8cL50Et2tQfar3G7+JlQO63AdGY8x9wgnnzwtiJ8ltqVfrcJB8Ra+g+Ntzp7lhGRVlhFF6mpjSC/riGOcwww8owzw6txIi1aws97bI31oxD00LZ2UThJ5ujH8WlAt9GOuYRJU9NDWixlWGmUAPtNEtur5OGqij1U8Avg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNE3inBmsQJH66DpRreCbHgIlOsIKxJ9uAxpc1NezIs=;
 b=fkh0ibSBzbVNKD+KNdvwBd62XcoM7zcRIK/83/sWdoarTih7P5PaILmDLvDh6pnhJx6JkYp6uDpXSdJFWTKz6ZOOcKz1Ip2hoUQ7DV6T1/8JXeY91o8ATOpzKSnqeKFZlAWfUEkXNghSx/jkICOob5owtAMdqe13Jc/dNC0gvooahH6lgRNmKGS4/3+SUcQgVTB1sfS6m3VJYXoNchrHkVTQZw3qozYZ2b34wV3rJYPyhBLnkBg9H6It8AJIxj9eGfe8MUqzBfPIbAspKbCgsKxi8SDByWk7JIoskW6KeIZp7g/N+H/ci7A+vqOZN7SdWAyHQBikPtBxonND8zRMVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNE3inBmsQJH66DpRreCbHgIlOsIKxJ9uAxpc1NezIs=;
 b=FOawwLp3dyiyYv0PpsXxpsIrPSpRlQIbbBmS2XhnC1W4ZA/VVcbgJhIxZgMvtsRczDIShW1mrbUoVCd17Fult2WWxTkQ3+nbsNuFUzw9qLkSrnJXG4L4KgFLw98WrEOWowiHgsmOmYuWVrGVZLv/KGZTeUPKJH6JFjrMwpyME4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com (2603:10b6:a03:3ba::23)
 by LV2PR12MB5725.namprd12.prod.outlook.com (2603:10b6:408:14c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Thu, 1 Jun
 2023 19:33:40 +0000
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::7a73:2b11:74b0:b2e4]) by SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::7a73:2b11:74b0:b2e4%4]) with mapi id 15.20.6433.022; Thu, 1 Jun 2023
 19:33:40 +0000
Message-ID: <be597d48-1d25-bb18-c8cd-2dddd688303b@amd.com>
Date: Thu, 1 Jun 2023 15:33:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 09/36] drm/amd/display: add plane HDR multiplier
 driver-specific property
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230523221520.3115570-1-mwen@igalia.com>
 <20230523221520.3115570-10-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230523221520.3115570-10-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0283.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::24) To SJ0PR12MB5438.namprd12.prod.outlook.com
 (2603:10b6:a03:3ba::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5438:EE_|LV2PR12MB5725:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a5ef76f-77fd-44c1-2ac6-08db62d71a12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FTVqPSV6Klugh0TIaPSGc4QM/Q0axYOGep7GKe/tsZ8VdlZVhmLXNJfaQm9ZPt95BrRLA7wr+gZvX9TnhDKZ6OOgYAiclWglBoa2nHfG9AluXXCnJoRvEr2KneoxT8HEw2OD8h1Cgy86mOv4wZstNn0U5OQJXOe8zKi11paW8xG/qzzB9eZlRb9MG6KqF9PbrGAjiie3SDvEHEF/tHdBKo8iLXM54hOkarVEixWTUjZWYBRLA0hOKIqmE30llPCVZ85A4AdBmAVsqb1fsGy5K8tcINTzUXFa1j/4B32Qqcknkq05+maIhrmphM96up9Hkrp1ZjuE5uA80fj1v58vdBE6LNtp3E/ndLu3zuZ0COngdhxiJ1C3Rz36+YdoLiprgB8slJhBaNwhvAHPeBfyv9R/bVVfid7/YVZUaNj8W4fs7Mjx0tL7JJbfQznOKAStXMSa/+3gHQr/tVEq16i3O7mBN6ONwNfMSs+mK4EAbke3BhXF32n9W0ZG27fz6aXY2VI3aK+l52lLN3W3em8k+s8upDlh8Yc3jn03FbYBzyRc4pAGMD7LARsOdFpkwU/59lVvV8ZzIRJzlEsPIaRd7kuxqDH/J+FJe124aWqfojzShK4mcrHHySUN0ROlOmh+GduZ2VtvXEgPP7f8R6XbrcwrA4VYG/Iqal7hC61kGzY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5438.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(451199021)(2616005)(83380400001)(186003)(2906002)(4326008)(66476007)(6486002)(316002)(66556008)(6666004)(478600001)(54906003)(110136005)(66946007)(8676002)(6512007)(7416002)(53546011)(6506007)(44832011)(5660300002)(26005)(8936002)(41300700001)(38100700002)(921005)(36756003)(31696002)(86362001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3NIdjJ4d05mVGxCb0RTY0RwQWFObW4yVWFTUUp4bjVuMVk0K0NjZytCY2ky?=
 =?utf-8?B?RXdOVlFRQ0RZOXlRZ2k2UDdiVm5Ib1QwTElhZ1Nwb0FrUFdOMXl3WnVLQThm?=
 =?utf-8?B?VFgxL2tUL1h4UHpodjllY1dsRnRqd0x1Wm5IYXU3akhQcUlMS1RadkFkWStx?=
 =?utf-8?B?NVRIeldvTU40R3BYMW0zMGJzR0xUQldSVWpxeCszVSsyUHQwQk9VbHZETlpy?=
 =?utf-8?B?YTJ6aHZ1RHNlWm1XOFNFTXRGLytPMlhaSk42OGVDQlBFdm8xMUNhVEJXWEZO?=
 =?utf-8?B?Y3NNRmNrL1VMUEN0V1NJKzBKdjIzSk8zZEZBaFlZbXU0di90dGYyYmlBVnlK?=
 =?utf-8?B?Vkd3ZWgrVzN3ZXJEclZCbFBXWnZ3SS9xL2hNK2psMnpkbUtUbkMwbHRKczIw?=
 =?utf-8?B?RGVvVjdmN29CL0l3Wi8wTjVHU0R5L2ZzcHliMGxKeHlhSmIrRENzbU84NXl5?=
 =?utf-8?B?MUNwWkJJYUtFUkhsd3lDUjNpbDNDSFdhZ0lJM1RuZ0g4R3JuTFlXNTJ5bHp1?=
 =?utf-8?B?N1lMdTdWaHhiVXcrTExUZjVBb0gyTVluUHk4dGZRaWRRbzFmR2U4NzhaUkV6?=
 =?utf-8?B?MnJUb25kUHhCaDBjei9JN29PVmNCT05xTElxdk9IWGpBQUo1aGtIYW5ydFR2?=
 =?utf-8?B?bzFtVk5ZSGR0cUxFTW1KZC8xeUl0RCtYeDA1VjN4cDYrekErdDE3VW4xN2pM?=
 =?utf-8?B?Z3dKNytRMTcxRjVVa0lCSWtsUUJ3QitIc0hacndiNGJ3clQxNWVLNW14b3lZ?=
 =?utf-8?B?d1lSa0t4NlFON0Mrd1d6UWZkcGJEeWR0RmZxQnQvN0xxS3dQSlFOZjlkV0ps?=
 =?utf-8?B?c2ZHQUFhZHJmSTUyVGhvTklWLzNyVGJJRlhTdlpxb3ZNcWpVbkFRT2Z6QW1k?=
 =?utf-8?B?ckVOL1RmWitIUFZnWFFyaGhhc3hvdnRxTmtQenpvaUkvVXBSMm5CbGpEeThK?=
 =?utf-8?B?ekEycVFoN0VHcXk2ZWVaMjRZaVVFc1Z0dWlFQm1NdTA2bGd2ZVkvVkduZGFr?=
 =?utf-8?B?WUMyeGd0STVWd1B6V25jZWFKQ1MxLzhzS0xSRnUrQUxzS25xNldhUjZNZzND?=
 =?utf-8?B?MGNRZE5pUTYxWm0za3R5MGszY0ZGNExEbHQzeGVKTG12VG5zZG8zTWZXRWd3?=
 =?utf-8?B?TzZnRkg2aVRDei9FZFIvOCtmSVdZdG1sWWRLUWpoampxRW1xVmpna0pVd0hR?=
 =?utf-8?B?NnB6MFhjMHVXcEl6U3ZRN2Z5VW1pbXZzTWxGcUhEMGkweXRCcjZ1UWdCdUlK?=
 =?utf-8?B?UTVQRS83eGtyOTdKemc2TkcvWXBMSW9pa2xWU3FhUStBa0pYeHBnRC80Y2Zz?=
 =?utf-8?B?MVJId1VqR2pHVUpONGhEa3RtVWlvT21seGd4YUs2SlJDNVIyTXFSN0NZZzdV?=
 =?utf-8?B?TGlrMHFjQlZVeUFKL0xSaHZEQ0hjNEFOTWI2SG42SzJtcU1oSlduNWp2OVpT?=
 =?utf-8?B?UE42Ymp5R1lvRzQ5U3hidEVkM0Y1VjUwY1BRWE9BV3o1V3Z1aHFyc3FWU3c3?=
 =?utf-8?B?WFJ5UVV1UyswQVNERGZaakJWTDdVTzhsN3pQb2poUmFxL1pBZDllQlVFbnBB?=
 =?utf-8?B?WDAyRmV0UEJ4eTVTUDQ3aUllYmlIRnBITjNVNUxqR1Q1T0xROW5WUFB2Yy8r?=
 =?utf-8?B?MHZHTkFsazBpV3VQQ295em1va0YxS3NMSGN5R1RiQlNleS9oZkhXcjdxK0sz?=
 =?utf-8?B?Rk5PWTFjSFFRY2duZFpFbHFSUDBvNEpEQmVjTUQwcXFETTlkbXloZWNsdmc4?=
 =?utf-8?B?dWF6WklUNTVSUmdRTGcvTmErK1BONWNIQVhibHdrVmFYUzFFaTMvdHpBNm41?=
 =?utf-8?B?QUxOcHpVM0xRL0c5NjZIRDBZQjl0WTU1NG52WjBWNUhlbnhTMTdVWEVGaHNw?=
 =?utf-8?B?czB2TUs0TlErOFZXNVlUMTRjaHdHYkNVQ1p1ekI4cUw1dDlBa05jc2RIbG9l?=
 =?utf-8?B?azNNdjFhVTI1enFkM0RobzFVdU1FeCttbW9jdlpUdFpuV2k5dWFUNGQyOHZJ?=
 =?utf-8?B?a1pFWFdIVGcvR3QxQjlIbTEzbzNUQ1QxTXFVS1VYWTY5Tm5qd2FLZlA3dFFD?=
 =?utf-8?B?RTZkQ1JPYUV4ZThnVk1DcHRSRnhudldwM0gwSWlGTVVMUzl3b3E5RHJVZ01t?=
 =?utf-8?Q?GFVwbbcTbUHyQeUjSyHqi994C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5ef76f-77fd-44c1-2ac6-08db62d71a12
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5438.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 19:33:40.2202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pcK6IgyfluYvfUW5/PxhAXw+sRqxZBhwqWLgi/P2oy5JT+Row6xShnbnPFcteb9erUDnhrXpF1+gQPyg076+fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5725
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
> From: Joshua Ashton <joshua@froggi.es>
> 
> Multiplier to 'gain' the plane. When PQ is decoded using the fixed func
> transfer function to the internal FP16 fb, 1.0 -> 80 nits (on AMD at
> least) When sRGB is decoded, 1.0 -> 1.0.  Therefore, 1.0 multiplier = 80
> nits for SDR content. So if you want, 203 nits for SDR content, pass in
> (203.0 / 80.0).
> 
> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> Co-developed-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c         |  6 ++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h            |  4 ++++
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h   | 12 ++++++++++++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 13 +++++++++++++
>  4 files changed, 35 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index fd6c4078c53a..f0e12cca295d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -1298,6 +1298,12 @@ amdgpu_display_create_color_properties(struct amdgpu_device *adev)
>  		return -ENOMEM;
>  	adev->mode_info.plane_degamma_tf_property = prop;
>  
> +	prop = drm_property_create_range(adev_to_drm(adev),
> +					 0, "AMD_PLANE_HDR_MULT", 0, U64_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	adev->mode_info.plane_hdr_mult_property = prop;
> +
>  	return 0;
>  }
>  #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index 9d7f47fe6303..c105f51b7b6d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -365,6 +365,10 @@ struct amdgpu_mode_info {
>  	 * linearize content with or without LUT.
>  	 */
>  	struct drm_property *plane_degamma_tf_property;
> +	/**
> +	 * @plane_hdr_mult_property:
> +	 */
> +	struct drm_property *plane_hdr_mult_property;
>  };
>  
>  #define AMDGPU_MAX_BL_LEVEL 0xFF
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index b8e432cc8078..dadbef561606 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -51,6 +51,7 @@
>  
>  #define AMDGPU_DMUB_NOTIFICATION_MAX 5
>  
> +#define AMDGPU_HDR_MULT_DEFAULT (0x100000000LL)
>  /*
>  #include "include/amdgpu_dal_power_if.h"
>  #include "amdgpu_dm_irq.h"
> @@ -732,6 +733,17 @@ struct dm_plane_state {
>  	 * linearize.
>  	 */
>  	enum drm_transfer_function degamma_tf;
> +	/**
> +	 * @hdr_mult:
> +	 *
> +	 * Multiplier to 'gain' the plane.  When PQ is decoded using the fixed
> +	 * func transfer function to the internal FP16 fb, 1.0 -> 80 nits (on
> +	 * AMD at least). When sRGB is decoded, 1.0 -> 1.0, obviously.
> +	 * Therefore, 1.0 multiplier = 80 nits for SDR content.  So if you
> +	 * want, 203 nits for SDR content, pass in (203.0 / 80.0).  Format is
> +	 * S31.32 sign-magnitude.
> +	 */

Good explanation.

Harry

> +	__u64 hdr_mult;
>  };
>  
>  struct dm_crtc_state {
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 6b71777a525c..bbbf25dd2515 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1322,6 +1322,7 @@ static void dm_drm_plane_reset(struct drm_plane *plane)
>  
>  	__drm_atomic_helper_plane_reset(plane, &amdgpu_state->base);
>  	amdgpu_state->degamma_tf = DRM_TRANSFER_FUNCTION_DEFAULT;
> +	amdgpu_state->hdr_mult = AMDGPU_HDR_MULT_DEFAULT;
>  }
>  
>  static struct drm_plane_state *
> @@ -1345,6 +1346,7 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
>  		drm_property_blob_get(dm_plane_state->degamma_lut);
>  
>  	dm_plane_state->degamma_tf = old_dm_plane_state->degamma_tf;
> +	dm_plane_state->hdr_mult = old_dm_plane_state->hdr_mult;
>  
>  	return &dm_plane_state->base;
>  }
> @@ -1450,6 +1452,10 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
>  					   dm->adev->mode_info.plane_degamma_tf_property,
>  					   DRM_TRANSFER_FUNCTION_DEFAULT);
>  	}
> +	/* HDR MULT is always available */
> +	drm_object_attach_property(&plane->base,
> +				   dm->adev->mode_info.plane_hdr_mult_property,
> +				   AMDGPU_HDR_MULT_DEFAULT);
>  }
>  
>  static int
> @@ -1476,6 +1482,11 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
>  			dm_plane_state->degamma_tf = val;
>  			dm_plane_state->base.color_mgmt_changed = 1;
>  		}
> +	} else if (property == adev->mode_info.plane_hdr_mult_property) {
> +		if (dm_plane_state->hdr_mult != val) {
> +			dm_plane_state->hdr_mult = val;
> +			dm_plane_state->base.color_mgmt_changed = 1;
> +		}
>  	} else {
>  		drm_dbg_atomic(plane->dev,
>  			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
> @@ -1501,6 +1512,8 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
>  			dm_plane_state->degamma_lut->base.id : 0;
>  	} else if (property == adev->mode_info.plane_degamma_tf_property) {
>  		*val = dm_plane_state->degamma_tf;
> +	} else if (property == adev->mode_info.plane_hdr_mult_property) {
> +		*val = dm_plane_state->hdr_mult;
>  	} else {
>  		return -EINVAL;
>  	}

