Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103AF7ECA89
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 19:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE4610E13E;
	Wed, 15 Nov 2023 18:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B384B10E13E;
 Wed, 15 Nov 2023 18:27:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+o7tEbXG8ydfVHi3/NFmhQYmO2dLcpu0n3qF60wwO1SGOqbYdLC43x9Gu9GZ1DQ4YS0ZFlH7e5vFJfMR171ZLE+LxVeqDENHr9/BkdlZe63GGstLOjKDZAnF+FZR5fvpPQ8FcIXLQHtXd/U/qOtNzL+3GCqfE+zGCh2q6sGayH//ngTnASu6ZHSLM0A0GbBe12vaxKGg3/FwQdVWifbns6v8URD5RavaRY10S9f2U8owO7Qz84vq+Rg8S7ueUYLYoqy4TE3QTbKkfIlnO1Q4kVmVnst+3i48mCpxwa05ul43GPiIlmo+Fg+MxG4pSYRA2zYcPFlLco56MROb43JGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42QgKLTel43neyEosaNGrgWc43/PiPrO7+NwYTwpLOw=;
 b=UgbRjPgsSw+PKCsw3/tXprI3jteCdZaOlfIokKiMh2fKIcChLsPrHST3y8h4SbikF+AnzJC+LBA6BRseUmEvzzXbXoOR1NRmM0wta5X3Qq6Y1tSqKjad7USzm6AX7uTy9QuA8vR/Au+OnD9C3EC9ILtgLIZJo/02qUskxbggxDg30Fu5833n5mgnpT5tYd5So0NbZKN8omul36MI6DbTsIBuFnU8wv4pc+AhrrxD6RHy9z1vWbCxMc902erj1zv7GwSTz+KCBe8rhEAFzTIitLr7CWmlIMGxzT/Peb20Wq81gQFVain2lWBIK/WBKosNpGpz4xgseQ9qqdscpsq4fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42QgKLTel43neyEosaNGrgWc43/PiPrO7+NwYTwpLOw=;
 b=MKcAzrD8iND1fSRaZ6Xs2KTFRt6aFuKsqh+AjE/wihmXV/YBNMW/JYe6DIoeqpeEE2j1H0CmJdFeQ0qIHMgpStxHtmnDONpNv+t7lC1/9lFyAuKGkBlZCUVJVklrYc0DuJiYBtmcNZYjkXRHS2yB3Br9vSsQLwKS1Dbdni/0tJ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ0PR12MB7083.namprd12.prod.outlook.com (2603:10b6:a03:4ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.22; Wed, 15 Nov
 2023 18:27:35 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a%5]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 18:27:35 +0000
Message-ID: <aafa77e6-6580-4991-8152-f498245211d5@amd.com>
Date: Wed, 15 Nov 2023 13:27:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/32] drm/amd/display: add CRTC gamma TF
 driver-specific property
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20231005171527.203657-1-mwen@igalia.com>
 <20231005171527.203657-13-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231005171527.203657-13-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0256.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::23) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ0PR12MB7083:EE_
X-MS-Office365-Filtering-Correlation-Id: f6515fb0-ad74-462e-ac04-08dbe6088a12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZFG2oTnldPXr3Ydd/EneW1bAX7kGbC+RljFPxqLDkuky0g1LunYdWvmNhHClEBM3PiqyqLH/ou/xgzfsBlwfF4gELe+sTOlWJC3aNgRlDfXUyLy77eVMDX7wp7YDRS3rQBPdfOYs1kqLsjfKjPyB86ZOZz5Th4nlSDtGwaYjjnr8JTY8CXtGugsIlKZAowU3lt2AF5MMJRnQ28cBBvghs6zEm5FKwTvsi2B1FTqfxbqdKX8OwD7bbzHaSMsC9RsVQLMj9hxbp3YAk4RS6Nx0UD9gYY0+L97XL2lBzsAcSPaTTVWJtO/droansDS4O93etxSPHU6k75gVon/+9tVrmgM3dOIbs2KwdOpiBx7DuLcgDSL7JRiWLzXDs6Gda2P+WN5yvJY2MFxybeUiwSN318tkvoddXYOUbvbD02g+sDxjvgvVlQx6NSL4lc8AuWLa+3Jv/gJ0+fdz2AwQrcah6Crc7FSeh5GrdvJ459pvp9eJxVEFEOojF4YDQwcdBRYMYzEQ3T2KGH7wiQqics/actMen37UJyZ+DFy6TeZDRKXYACusN2Q3SnmvTTcvw9vmgMr3gZ2AS7TLIybezv/cbB0ZVFt3XXCwvOGR5pvWVg8/kPH3FUX4tV3HcLx8WAXgGtDr02XYr8iXuKN4RHZA255JIoQhSC+1dxzgS94sk14=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(136003)(366004)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6512007)(83380400001)(54906003)(316002)(66946007)(66556008)(66476007)(38100700002)(110136005)(8676002)(8936002)(4326008)(6486002)(478600001)(31686004)(36756003)(6666004)(6506007)(53546011)(44832011)(7416002)(86362001)(5660300002)(2616005)(921008)(2906002)(26005)(31696002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTNDKzV2dC9SK1R3Z3VKSTVJVVplUEVXdFN6R0JyU1FyeElRYkY2Zld6WFFo?=
 =?utf-8?B?SG91dUtKU1BiTmZTQU1OWGJEZkEyb0kyT3FVZ2x1SUtFbTM4R3RMTGVmN2p4?=
 =?utf-8?B?a0xjeHY3ZEhGT0kyN1JwRHdUUUg4NW10NGsxb29PTkhTcU4wKzk0RlFKZmt1?=
 =?utf-8?B?dm5DaXltV2ZlMXNBV0E5ekNJVTdRNU9EbmFadHJyMzFLZTBDTTVpNUlkREFj?=
 =?utf-8?B?UERkQmhLMzhiUm1lb3VvQ3JZYUM2R1Y4cU9EZjVnWkV6RDJZd3IwRE1Ub0xE?=
 =?utf-8?B?M1VhZXZFUWEzZUJkRG1YMEFFbjFrcVNxdnFnQlhBcWZXcWZtd2R2Z2p1UjlK?=
 =?utf-8?B?eXV0eFpOTUdkRmx4L2Z4Yk9pTUVBNG9GVXBKRkFxYWZsSmpUTUpPcmh5c2lN?=
 =?utf-8?B?azhOQmN3dEJPZ2tBVFJ4alQvYW9tWldtODFuM2E4cThXTnF3R0tjQThlSnhW?=
 =?utf-8?B?QWZjZk1pakxXNG8xeGYrS20rVmtINEhLNzFVb0hCdjU3b2ZGeUFlekxIU3lU?=
 =?utf-8?B?RTFHSmJ5UmxmOGZTaDRKbU9nNU1QYUhKTzAydjlMYzJyWHZkNWVkWnRqVXg0?=
 =?utf-8?B?WExscTZlNkVib3Y2WE9heE55U2MwOHNkNUtqM0xObExWRWdYNENKSVlTSXAw?=
 =?utf-8?B?bzFUc2hjVERKSzRYcUdmMGNDWjFtYWExcXRleTFvRUlKeFB6WVM5aDQ3cFgx?=
 =?utf-8?B?UUxYVzBybnYzeGl0N09xbE9jYnc3SHVzNzYwbDdycmlyZHZaQjE3REpEcndC?=
 =?utf-8?B?YmYza2dlUnVBSjhzZGtCOXRzM0wwaXg0WE5aTmJZOGZ6bVcvekV6SXF3bE1D?=
 =?utf-8?B?YmZhVzU3Wjdsak5DME12RXZ1SUxNRUU5UDhIMEJVOFNQdEluL0JIM0JzbGh6?=
 =?utf-8?B?cmhzellqUGROS0NYR2VwOG5pMkhPT0loQ1lDWVVVUmx4TklMdVRFUlc1bnFN?=
 =?utf-8?B?SGRycnRUK3laWVE0TG1pWHZqcmNnYmY2RWNXWHVYRlQvMktsTDVEc016b1R1?=
 =?utf-8?B?NFd2bmdCdUZSQkVWUzhPdzNYeGQzYUcxOE9wYjRjelZJcDdNR2QvdVpUcDBP?=
 =?utf-8?B?T0RkY2FUN2hVckxKMTdUczRHU292VDhLbzdxR1RtK2lJaUxDQk4yTXEzb25G?=
 =?utf-8?B?WG5BYSs5Rkw5WW1Pd3FZS0lYUmtZelFoa1ZHOVRSRFJjZnhZT0VFcXo5aW1M?=
 =?utf-8?B?UllJalo4UHI3THR4VkNxVmc4Ni9TcHVqaEFOaXRtcUZab1JxQzRMVlRQMmlP?=
 =?utf-8?B?SHdLc0NOUzdnZGo0cnB6V0xkTGpIbWxxNlUyV3p0MVg4M3hEclFuRWlVYnhT?=
 =?utf-8?B?a3VLYU5aL0FJbnBHNnFSWS9mdFBkWVRwejZOdkdlK3YxSUVTNlpWSlQzaTB2?=
 =?utf-8?B?SWRlZExibXcrYkNQenJ5Y3lBakVnK2xIOGowTE9jVUYwemZQRWJleVBPb0Jo?=
 =?utf-8?B?Rkc1bElnYTBiWUI5YTljQWx1bEthVFlzODhIOW1ybnhGMFpIdEYyWXp2UC9W?=
 =?utf-8?B?aWZVZnhlSy9NYlFtWEhTZXllQjQ5dnJFbEg5VG9Lem0veDgrUWFUU3lJTW8w?=
 =?utf-8?B?SlkyRDh6NWJreGxvTXhMb1EvdVdIUFAvMkZqZitQNjltRFRrdHMzaDdvOWE3?=
 =?utf-8?B?TGxHUjQ4eGxTWjI4enRqNDNDSU93WThzalhlT3VUc0VwdHhtUlhjNk93VnUx?=
 =?utf-8?B?T2RXUkpod3BOcjNZL3NxSUs4SkFMamwvalNkNFEzbkVmMllGdk16T2RHdlln?=
 =?utf-8?B?OEFtR2toak1ZTE5vdUs5NHNYeitPWVdQanpNZGcxbFl4eVQyK2VPc0FqemtL?=
 =?utf-8?B?TXdTdzVTWnY1SmJxMXpWaWtkSEtzS3V3RXh3eGtxREpiSkY0ck9YblpqNWd1?=
 =?utf-8?B?K29QcXBsVkpoM1JvbWtEMEtUeXo3Mno5QWppajV0dmNDTndDL1R0dkpMUjBw?=
 =?utf-8?B?M0x2d3BKRHB5SW16eTR5QmhiZ0xZOU1VZ2Q3T3lsNlhHSlRyb1E3Ni9RN09v?=
 =?utf-8?B?ckFONEhwQ1M2dmI5STJ6TEVwM0Y0MHBXMVpsV1hNZXhTR1BHWnFiMEY0UWJK?=
 =?utf-8?B?azhaS2JXcUtqVnhtQzBPYWRGRGtOU2E5QnNJdlJVQUcxdTJMUGRqWk9vOVJq?=
 =?utf-8?Q?ot8BtuygXf9mfR8BGOr7WzKF7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6515fb0-ad74-462e-ac04-08dbe6088a12
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 18:27:35.5759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R35hPaCGRN2WC4DtnPSyPZApVHdCdSf5vW1PbtJonuxKLxK3anAEFsLYU/brAnCjqGGGlBAPQd2hGpMrdxdhRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7083
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



On 2023-10-05 13:15, Melissa Wen wrote:
> Add AMD pre-defined transfer function property to default DRM CRTC gamma
> to convert to wire encoding with or without a user gamma LUT. There is
> no post-blending regamma ROM for pre-defined TF. When setting Gamma TF
> (!= Identity) and LUT at the same time, the color module will combine
> the pre-defined TF and the custom LUT values into the LUT that's
> actually programmed.
> 
> v2:
> - enable CRTC prop in the end of driver-specific prop sequence
> - define inverse EOTFs as supported regamma TFs
> - reword driver-specific function doc to remove shaper/3D LUT
> 
> v3:
> - spell out TF+LUT behavior in the commit and comments (Harry)
> 
> Co-developed-by: Joshua Ashton <joshua@froggi.es>
> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  7 ++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  8 +++
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  7 ++
>  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 72 +++++++++++++++++++
>  4 files changed, 94 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index dee35d208493..071cc10bfd90 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -424,6 +424,13 @@ struct amdgpu_mode_info {
>  	 * from a combination of pre-defined TF and the custom 1D LUT).
>  	 */
>  	struct drm_property *plane_blend_tf_property;
> +	/* @regamma_tf_property: Transfer function for CRTC regamma
> +	 * (post-blending). Possible values are defined by `enum
> +	 * amdgpu_transfer_function`. There is no regamma ROM, but we can use
> +	 * AMD color modules to program LUT parameters from predefined TF (or
> +	 * from a combination of pre-defined TF and the custom 1D LUT).
> +	 */
> +	struct drm_property *regamma_tf_property;
>  };
>  
>  #define AMDGPU_MAX_BL_LEVEL 0xFF
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 1b96c742d747..c138457ff12e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -836,6 +836,14 @@ struct dm_crtc_state {
>  	struct dc_info_packet vrr_infopacket;
>  
>  	int abm_level;
> +
> +        /**
> +	 * @regamma_tf:
> +	 *
> +	 * Pre-defined transfer function for converting internal FB -> wire
> +	 * encoding.
> +	 */
> +	enum amdgpu_transfer_function regamma_tf;
>  };
>  
>  #define to_dm_crtc_state(x) container_of(x, struct dm_crtc_state, base)
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 82c554662faa..2ecfa0e886e8 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -294,6 +294,13 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
>  		return -ENOMEM;
>  	adev->mode_info.plane_blend_tf_property = prop;
>  
> +	prop = amdgpu_create_tf_property(adev_to_drm(adev),
> +					 "AMD_CRTC_REGAMMA_TF",
> +					 amdgpu_inv_eotf);
> +	if (!prop)
> +		return -ENOMEM;
> +	adev->mode_info.regamma_tf_property = prop;
> +
>  	return 0;
>  }
>  #endif
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> index 440fc0869a34..d746f0aa0f11 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -253,6 +253,7 @@ static struct drm_crtc_state *dm_crtc_duplicate_state(struct drm_crtc *crtc)
>  	state->freesync_config = cur->freesync_config;
>  	state->cm_has_degamma = cur->cm_has_degamma;
>  	state->cm_is_degamma_srgb = cur->cm_is_degamma_srgb;
> +	state->regamma_tf = cur->regamma_tf;
>  	state->crc_skip_count = cur->crc_skip_count;
>  	state->mpo_requested = cur->mpo_requested;
>  	/* TODO Duplicate dc_stream after objects are stream object is flattened */
> @@ -289,6 +290,70 @@ static int amdgpu_dm_crtc_late_register(struct drm_crtc *crtc)
>  }
>  #endif
>  
> +#ifdef AMD_PRIVATE_COLOR
> +/**
> + * drm_crtc_additional_color_mgmt - enable additional color properties
> + * @crtc: DRM CRTC
> + *
> + * This function lets the driver enable post-blending CRTC regamma transfer
> + * function property in addition to DRM CRTC gamma LUT. Default value means
> + * linear transfer function, which is the default CRTC gamma LUT behaviour
> + * without this property.
> + */
> +static void
> +dm_crtc_additional_color_mgmt(struct drm_crtc *crtc)
> +{
> +	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
> +
> +	if(adev->dm.dc->caps.color.mpc.ogam_ram)
> +		drm_object_attach_property(&crtc->base,
> +					   adev->mode_info.regamma_tf_property,
> +					   AMDGPU_TRANSFER_FUNCTION_DEFAULT);
> +}
> +
> +static int
> +amdgpu_dm_atomic_crtc_set_property(struct drm_crtc *crtc,
> +				   struct drm_crtc_state *state,
> +				   struct drm_property *property,
> +				   uint64_t val)
> +{
> +	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
> +	struct dm_crtc_state *acrtc_state = to_dm_crtc_state(state);
> +
> +	if (property == adev->mode_info.regamma_tf_property) {
> +		if (acrtc_state->regamma_tf != val) {
> +			acrtc_state->regamma_tf = val;
> +			acrtc_state->base.color_mgmt_changed |= 1;
> +		}
> +	} else {
> +		drm_dbg_atomic(crtc->dev,
> +			       "[CRTC:%d:%s] unknown property [PROP:%d:%s]]\n",
> +			       crtc->base.id, crtc->name,
> +			       property->base.id, property->name);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +amdgpu_dm_atomic_crtc_get_property(struct drm_crtc *crtc,
> +				   const struct drm_crtc_state *state,
> +				   struct drm_property *property,
> +				   uint64_t *val)
> +{
> +	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
> +	struct dm_crtc_state *acrtc_state = to_dm_crtc_state(state);
> +
> +	if (property == adev->mode_info.regamma_tf_property)
> +		*val = acrtc_state->regamma_tf;
> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +#endif
> +
>  /* Implemented only the options currently available for the driver */
>  static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
>  	.reset = dm_crtc_reset_state,
> @@ -307,6 +372,10 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
>  #if defined(CONFIG_DEBUG_FS)
>  	.late_register = amdgpu_dm_crtc_late_register,
>  #endif
> +#ifdef AMD_PRIVATE_COLOR
> +	.atomic_set_property = amdgpu_dm_atomic_crtc_set_property,
> +	.atomic_get_property = amdgpu_dm_atomic_crtc_get_property,
> +#endif
>  };
>  
>  static void dm_crtc_helper_disable(struct drm_crtc *crtc)
> @@ -470,6 +539,9 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
>  
>  	drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_ENTRIES);
>  
> +#ifdef AMD_PRIVATE_COLOR
> +	dm_crtc_additional_color_mgmt(&acrtc->base);
> +#endif
>  	return 0;
>  
>  fail:

