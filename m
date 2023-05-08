Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F75B6FB98C
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 23:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E21410E300;
	Mon,  8 May 2023 21:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2083.outbound.protection.outlook.com [40.107.95.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703BD10E300;
 Mon,  8 May 2023 21:25:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWMMjrx9v36eEasjpSWc+SVSuyAaV3i3/laQQy6mXJTyinRIbl/uRVTAZFGiV7uRqDK36M3Ud957zDXx7PpccmGj1Uqk+BTNEKjiWjKJX4f1k+2knNw/v+6yjVxpGJtMnoHurN/zVjK2oNSuqrSPmkhY/U7YOqRqJrjEOPY3+kA1jL9rVpoaUjot9t1qrC0ULaLmzNM2Hu9OikEXIuZPtoBReMLgyAh/JiaO/EVkIiyGJPy4HZGlrCsBcjgQQcR3zB17ipnJoos0Ba9umAcytFoIX0S4LI2IlD3bRTnjDqFP2VpKDgqB8fP/whx0dOi7ZPIWaANCpMUKqqztmihuzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRGcyF83YOKnZFKCoUEYo3LbQ0ptPvSLS6v0uW1K9eQ=;
 b=RhE8XS5ErZnHmoh9mdBXFUHp+o/qXPRP+NYNJy/BOpXhqIa+1qISxvLtlX1foWngObnGYq5SxL/6OQce9cDATGPD3tvYEAJnvJwxvhOa8w8Yrz3lA2kcyup16xFaM7P/VKoUX2r9FymCVv8T6u7ZiywJ0Q3lSTnmLDmFXBum9DrXuCLI2ur5c7N6WguMD8OOcyV84NNAQLsldG3MzSGnAr7LL3CZH7S+5cr9BQMsGbK4UEoGyT54cq2DIX54JpK2uvELUk6tnzrnIrphhJBPCQ/U/elHYlXAqwnU0s+VS4/yS0Y7ER+nEBBN1sWLIs04Yi3uqxs2q+WESHfyi8Bevw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRGcyF83YOKnZFKCoUEYo3LbQ0ptPvSLS6v0uW1K9eQ=;
 b=h/JIcchC2Nh9Do0M+LXRu0axvpJD6H3Cj78+EOgdA305dY2XFfX5F4qZMBg5vEQDZVPl5tPvFfpo0uvkB+buDAz7LYNSsznUDfK6PVuIItB8kUsWpe0SCbiZhILwnRidDvvLcItBzb5jyZZlAwopbiAJoxhYqnkEPEMwIzIyvVI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 21:25:00 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd26:a6b5:1d41:ac27]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd26:a6b5:1d41:ac27%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 21:25:00 +0000
Message-ID: <5bbd49b6-ad09-607f-521d-96f9d8eb3b20@amd.com>
Date: Mon, 8 May 2023 17:24:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 12/40] drm/amd/display: add plane HDR multiplier
 driver-private property
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230423141051.702990-1-mwen@igalia.com>
 <20230423141051.702990-13-mwen@igalia.com>
Content-Language: en-US
In-Reply-To: <20230423141051.702990-13-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::12)
 To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BL1PR12MB5269:EE_
X-MS-Office365-Filtering-Correlation-Id: e2389ca5-10ff-4947-eb82-08db500aadbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nFEmj4Ju1jUtZvOe4c8QEILNuK2zNND516/YdV4F0hI/yA49/TMNOgFKoqxqJpwAF3+GJAv4GYQW5LnGw1plere+Xet0NV/gWVr0jGWGJPgTlXcqGDpSo3C3BYYwyaT+6TgnzI6ssAr19+DtDeIPK5SWj6MO9n0QzrALU6pzNxM5X1ExJisdGG+qxAsDGzAZG6jbR5fFlFnpjPROh4q2MtvyiX3+nUlt+NzJMHE0jtTCCMHcX3aPfDiZufXiBkJCjFSTgEo/LHryjvjWXsN3vhgk8WdJjfEhpGdQlCv/uXSd842mq7FMpyEKJxmkJeF2VAQ8O7u/WJO7Cphj2GEZiT+3gBgfJwaqmDxHPfmkMsY9E7ScbnwSg2uqaTP5n1Eda6Ib3zqHX0l/gFz8nqPdmxoG/Ab5KgaUBcrIE/eoS0xUipNMnlnkdo41qEzYG0dj4sPWbOvSCnYkTjBWj5NE6PvtH8eTytjwqxdYnAyxYHn9Rjh7I6Rrbykd8r2Q8m2eVjHHMfbTXAxbV1ZZrcvyPQRgiNpWPgm/s17mXMbmZ90P2uUW2q5ZQ+bea34rRuGATuWv68mCxBsuXQQ7qq1Ro3Cqzyf4T+qBW2XGmD2B6q7lZd8NCL7PysHHVHnlO6XsRZOTDQoFtnV/93Lc9mYM8f6+kPLGghudisoUeOycihQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(451199021)(83380400001)(2616005)(478600001)(6666004)(110136005)(54906003)(6486002)(6506007)(26005)(53546011)(186003)(6512007)(44832011)(2906002)(38100700002)(36756003)(66476007)(66946007)(41300700001)(66556008)(4326008)(8936002)(921005)(5660300002)(31696002)(86362001)(8676002)(316002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGlxdWpJdEcrVStCYzI2czI4eks4WUdSbFVuZm1YeUhhb2RVaGxhaW5DbE90?=
 =?utf-8?B?b0R2QzdPU1ZDMVl6eXVVQWVyOE15em9iTDFKUU5HOFJLaDJXbUgvS09DRm82?=
 =?utf-8?B?bC8yVGFaMDQzc09mR2FZc2UzRVErT3lNMEZKWkQ3Vnp3L3h2dmJ1WW0yZFI2?=
 =?utf-8?B?QlI1SnF5em40ZndUV0xwOUs3SmtQTTE3Y0VTTWd4Wmk2OVFHZTlFOW5uWUxa?=
 =?utf-8?B?blAxeDAveDkvdExUZURxcllHazZqaEN5S1AyempBTkVmbmkxcHZwU0hrOXph?=
 =?utf-8?B?WXJ2Qktyd21ET3BQSGdPVTFDRXdZdUJSSnM5MmY3QVU3RzUzWFhHMFRZbDF5?=
 =?utf-8?B?RmkxT1RoV2dWZXR6QkJJTnQ1UC8zdVg0QmluSW9DQnFlb3c2NGZDNUw2d2Yr?=
 =?utf-8?B?ZUxCZDF2Y1FZR2daOVVsTjZIdWEzb0xjZzdoaEJlVU5BUk1HUElSNW8zcGhZ?=
 =?utf-8?B?SUlKczM1N2ttRFphMjIyOXdzdFNTWm1xVUVLMDFJL1dwRGs5UnZ0SFc1dXhC?=
 =?utf-8?B?bUUxcEhlV0hwdUR4S0tFMElFTnFDbEd4cW9EcU9HZmVvNndnRWdHakhRaFNK?=
 =?utf-8?B?MVFWMTFxRTZYRE5jOWtyUVZ2L0lwY0xSUXFnWXJrWjFuaE5zV1Vib0d1cElP?=
 =?utf-8?B?Q2RscEs5MFBrMEE4L3E3QkJ3MFpFTzRNdHdjeW1vT3dzN0EreWMzSXZjT0VN?=
 =?utf-8?B?a0RONC83QWdQT3d3VEFiNGtWQ3NtWmcvOFp5QTFJTHVDaGgyR0sySnVOWTJ2?=
 =?utf-8?B?Qm9zbGZ1T1hDcVFrbm9YK0FuMnE3K2ZjRlAvVjlQcVNLR2l4NDAxM1IwVlM3?=
 =?utf-8?B?MnJybXpodUhieHJ3YVFpMXc4dFBrQVdnZ2RYMGRTb0tBWFhZTlZ2TzVXSDBk?=
 =?utf-8?B?OUczSVFQSklhVG1Mb1ZYa0xKdHNTblJzc2s2bHd5NHNFMXpBQ3NoR0cvcG1B?=
 =?utf-8?B?THQ4ay9TelFBa1FrMkY4dFB6Z1pETE1tMFl3UkhlL2FzRzlTdU9pczc3ZjNp?=
 =?utf-8?B?RTlMZGdCYzZicWVSaHcxd3VOQ241NHY3U3g5Ri9YRkFsUEoyK2tYOHNwbnBG?=
 =?utf-8?B?YWdNejMzWGZCMndhZVBBMnE5clZObERuOWFxVjJFNnQ4dnZDbFh3YzVKNmxx?=
 =?utf-8?B?alcyU3cwYk1nWTlKcUlJc0RoWm0vZkZ2enc2S1U4aWhZc0Nyd2xBVUlwMkR4?=
 =?utf-8?B?VEx3TGM2YktUZ29DL1J2RjhRb1RPMzFPQ0tENWdaUGhRMXVnWXF0TndCdTIv?=
 =?utf-8?B?WXplWXY0OFBGNU5TSmVqOVdtUC9yaFJKU3JCZmh4ZmR2c1oyZW14K3ErWnkr?=
 =?utf-8?B?a09yVVIvVGdUeEpNNDRzNldlSUNpWmhYNzBaRDlTc1lvc0tMYURoaDF0b0JE?=
 =?utf-8?B?c1dHSE93ZU52WlJHdGp4ZWhReWpWQUVHU2l6cDMrenJzeHF4aFdYbnp1b1JH?=
 =?utf-8?B?U1QxQjVZcGFNckRDV2dFWURSbnFkZXE2S3BrYmlyTkJVcVhKRmNNNDlidy9H?=
 =?utf-8?B?bmgyd2R5aTMrczZ5ZmgvNFhPeEx0R1Y2V0ZvK2FlNVFtYi93dFYwNmJLZndz?=
 =?utf-8?B?aHBYZnZuVVlVa3Z6TmpXcnlwZjZHaGhXZnRkOGRta2UycmdiT0dSS01ScHFp?=
 =?utf-8?B?SldQWDdRLzBjc292MHhVZm9vYUZDMXRLWCtCYWdxTnFXdHYxYnNHaWJRdjZ2?=
 =?utf-8?B?WGExclM5QzgzTUg5ZWJqanN1d0N4L2xWQ0VEVUxsTE5SU3Vnb0RZZkF2eWZ4?=
 =?utf-8?B?dDVEc2YzeHBOa21ReUhRT2c4UFdvai9OZXQ5aTNBNytOcTQyT0g3cFp3dmZC?=
 =?utf-8?B?amZZZVIreXVSSGVteWdtakNIdEtJeGVTbEkvOVU0aG9tcE1lK1g5N1BFRWoz?=
 =?utf-8?B?VHdXZ1JmbVhUYTl4MDljSkNXVjA0UDlXSGVQc2tBK3dRVGJDenRYWDRPMUpV?=
 =?utf-8?B?UGhIRUVBYXBMdlhaazdHZUdOMVZScEgxTEZBR1p5TG84VVFzM25mLzlyWHcz?=
 =?utf-8?B?dVB6cTJtWFhBbG55VDMycE01VUdhYnZuQU81Ny9YdTBSVnVRYkNsc1YzUXZJ?=
 =?utf-8?B?Mnltc1FMNU10Z1FVTllzYlV0WHJRSXgxU1NIWm5Bc01YS1dkdkVWNndoUW82?=
 =?utf-8?Q?9LrZu8gd3v5aimcX0BJACdBhO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2389ca5-10ff-4947-eb82-08db500aadbc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 21:24:59.9992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YTqd+Nd3WYmmYqPPKfofpKUSEQ1qbD++SgAAlRlUpGZxDUI+YNFYcTta4TL4J9Pj6oUOeUFjb091DNIgwjZyeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5269
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
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/23/23 10:10, Melissa Wen wrote:
> From: Joshua Ashton <joshua@froggi.es>
> 
> Multiplier to 'gain' the plane. When PQ is decoded using the fixed func
> transfer function to the internal FP16 fb, 1.0 -> 80 nits (on AMD at
> least) When sRGB is decoded, 1.0 -> 1.0.  Therefore, 1.0 multiplier = 80
> nits for SDR content. So if you want, 203 nits for SDR content, pass in
> (203.0 / 80.0).
> 

Is gamescope intending to use this?

Harry

> Co-developed-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  6 +++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  4 +++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 12 +++++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 25 ++++++++++++++-----
>  4 files changed, 41 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index 24595906dab1..dd658f162f6f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -1326,6 +1326,12 @@ amdgpu_display_create_color_properties(struct amdgpu_device *adev)
>  		return -ENOMEM;
>  	adev->mode_info.plane_degamma_tf_property = prop;
>  
> +	prop = drm_property_create_range(adev_to_drm(adev),
> +					 0, "AMD_PLANE_HDR_MULT", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	adev->mode_info.plane_hdr_mult_property = prop;
> +
>  	return 0;
>  }
>  #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index ab9ce6f26c90..65a9d62ffbe4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -387,6 +387,10 @@ struct amdgpu_mode_info {
>  	 * linearize content with or without LUT.
>  	 */
>  	struct drm_property *plane_degamma_tf_property;
> +	/**
> +	 * @plane_hdr_mult_property:
> +	 */
> +	struct drm_property *plane_hdr_mult_property;
>  #endif
>  };
>  
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 005632c1c9ec..bb7307b9cfd5 100644
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
> @@ -736,6 +737,17 @@ struct dm_plane_state {
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
> +	__u64 hdr_mult;
>  #endif
>  };
>  
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 5b458cc0781c..57169dae8b3d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1321,8 +1321,10 @@ static void dm_drm_plane_reset(struct drm_plane *plane)
>  		__drm_atomic_helper_plane_reset(plane, &amdgpu_state->base);
>  
>  #ifdef CONFIG_STEAM_DECK
> -	if (amdgpu_state)
> +	if (amdgpu_state) {
>  		amdgpu_state->degamma_tf = DRM_TRANSFER_FUNCTION_DEFAULT;
> +		amdgpu_state->hdr_mult = AMDGPU_HDR_MULT_DEFAULT;
> +	}
>  #endif
>  }
>  
> @@ -1424,11 +1426,11 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
>  #ifdef CONFIG_STEAM_DECK
>  int
>  amdgpu_dm_replace_property_blob_from_id(struct drm_device *dev,
> -					       struct drm_property_blob **blob,
> -					       uint64_t blob_id,
> -					       ssize_t expected_size,
> -					       ssize_t expected_elem_size,
> -					       bool *replaced)
> +					struct drm_property_blob **blob,
> +					uint64_t blob_id,
> +					ssize_t expected_size,
> +					ssize_t expected_elem_size,
> +					bool *replaced)
>  {
>  	struct drm_property_blob *new_blob = NULL;
>  
> @@ -1482,6 +1484,10 @@ dm_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
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
> @@ -1507,6 +1513,11 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
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
> @@ -1533,6 +1544,8 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
>  			dm_plane_state->degamma_lut->base.id : 0;
>  	} else if (property == adev->mode_info.plane_degamma_tf_property) {
>  		*val = dm_plane_state->degamma_tf;
> +	} else if (property == adev->mode_info.plane_hdr_mult_property) {
> +		*val = dm_plane_state->hdr_mult;
>  	} else {
>  		return -EINVAL;
>  	}


