Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDB36FB985
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 23:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F8C10E2EF;
	Mon,  8 May 2023 21:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5E510E0F8;
 Mon,  8 May 2023 21:24:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRPCaltWTjc9sVIXnyFaTAjrTeMU7fxhlH3T8rhEEtXuloNhmJz+tSX6TzqHT7GyRZTr91X273lSos+Vm0ALNE3lNFt1pDl1U2Rhq3WX0HwI0ebEGoZ7awfWvb2FB2jAMOaLNEotD17vAkGVOc7WhwE3WlN5lDkN89xo9KNw54XretF9zxaXL2IGQVW3TPSqvAIjnGr1u75LEbxlbDM5dSf9plowJ1A4F0xshOg5foV4htQV+diaKLoksR9uc0cGcv762ggAO1OEuHJjM0rjvCicmMl5UR7aI3XBI2qCPhSXElpOMm6pAxOFp03asxkwK8AsoOuhGu6iV9TZlpLqJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPGrbGrjURQr1dGkAppbmLN6TZ58dm1SdS78uznBoTQ=;
 b=U5bRD0cn0Y4aLBVqWoQOmMq8710jrT5nikmB79/De0Th42JShUBkyK4aQikpstzwHnpGzP+bvkjuVRPHHlYX1x0edpYqwD/4o0rK/dX+vHF8NSLteZoLgSMMXDIkbi5YyYA0izKRgu3+wWEHRLpjY3tjycSKgNWCdm/tnQcRBSR9jYQgb7tOBlljAgzE8lDfJ6tOt7UDiu47FkSWri6W4WJTOkZYz7QBJg1ZQ2SWgTKowSqwNFMvLe081qkmSVZ9ddDcJLmppED1FuGPy3Z8kX4XOlupE5mVGdXV18+pHaT4IYF5tFhKTt8Ir+a4fz7QNy+ZTL4PcsBO6dSGvisy5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPGrbGrjURQr1dGkAppbmLN6TZ58dm1SdS78uznBoTQ=;
 b=tZYfUktVWRavDzhNaeKgiXcvm8ro3YN8kqlJX9uZ3LgPuUUriX72CouKfBDQwWVosUZMduidJaZPT6X/cpNGrex2bhZ8R4kHfGFWwLtE9E4Z/35PgcOMebcDMy7H948Og3PDBhkF15TnfEYvUdmtUNVVBXQZDDGKLTtkWbytH1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH8PR12MB6676.namprd12.prod.outlook.com (2603:10b6:510:1c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.31; Mon, 8 May
 2023 21:24:42 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd26:a6b5:1d41:ac27]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd26:a6b5:1d41:ac27%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 21:24:42 +0000
Message-ID: <40bcc490-4057-0d2b-466a-bd7ce11cfc74@amd.com>
Date: Mon, 8 May 2023 17:24:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 05/40] drm/amd/display: add shaper LUT driver-private
 props
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230423141051.702990-1-mwen@igalia.com>
 <20230423141051.702990-6-mwen@igalia.com>
Content-Language: en-US
In-Reply-To: <20230423141051.702990-6-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::44) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH8PR12MB6676:EE_
X-MS-Office365-Filtering-Correlation-Id: 51c2dd47-3c22-4a26-8eaa-08db500aa345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bLER0VB0bAFJ5mlkU+VN8Bj95yjU5j8HyaxGG3ItVEhFMEhTUm36Hf4IMEDq0jduvJBuk1gS5PFrDY3807FRoOz3TZ7HQniDIOVLfALKJqHni304siW+NOlVzo4n9/1MK5Z/JtsXKJFTFuN4aopJlpbdcghS4yTn8VzMJymo+kx3ub8SC7Wf5Xt++I1+3fBdC+LvazTx/EHV8AbomnEKCVEdDaej+LDWiiAhvKevghQnMA5TMoJ5bW5nyxzlFoTD9mjGDxPVBN4ky6D8Y2Okj1b07XYS+H5xJXop/qQUUGjXhXlgHusZF0HW+RXJYihfJg4x5zzhtSWmRnQDkZST1NX5CaJkqefREW32T7J5WKfMGCuafrlNOfnteMOBFAE8mMVOvnErwkmc0OGyGYigtq8P7boHLZ0dpVK2qAe24xZEOM0hW8ZnpZjnrSEQEsRBFCrlAHIDQZBlOTaeK4YnQ2L3ldwqUgDi0BdjywYBLcnuNYAtckEGzwX3lb6bioP4Wvf0FoajAqL1zmH7slWw16hiL9VCdrX601sYHSYTh3XRgMIU6J8oEqYOr/DiovzbpqpD0Ay12Et9KBt5Z9tQzDQ1U98aYh4EUfAvK1u2Nhbk+G15UbTY0TZhynxG+375zy06DIqItMAknZ4NZ0xCfWJyDDT6j63BqD5GXlROHeQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(451199021)(83380400001)(110136005)(6666004)(478600001)(54906003)(6486002)(2616005)(6506007)(26005)(53546011)(186003)(6512007)(2906002)(44832011)(38100700002)(36756003)(66556008)(66946007)(66476007)(4326008)(921005)(41300700001)(8676002)(5660300002)(316002)(31696002)(86362001)(8936002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czhCQUZUNG5VQkkxNWlndkdad0hNb1V6VG1iRi8zTlYxakp6Tk9xU2VvaXZW?=
 =?utf-8?B?R0k0eVorTWVIZnc0QzVpcGFYRzlMQVhnZ3pPYytQOElkTG1McERxVWlQaFdL?=
 =?utf-8?B?SUhNb3B1UXhjc3c3dWQ4aTRsZm5IdUY2d0oySGRYcjA2Q2VhRHRmODB5MEw3?=
 =?utf-8?B?dFp1N25GcVJVQktQQ1B5andMZG5GRXVtd3dWeDByNVFtdzk2ODN4QW9oNnVj?=
 =?utf-8?B?NlVaRmpIUThtc0tNdkpYTkUzaElBQXJMd0JWSW56MjJIVkVTb1hNYXIvQ0lo?=
 =?utf-8?B?UXBkdlh2eFZjUk9RbnNYRll3TkZuRyszTEIybG4ySnp1TFJwNVRnZjIycFcr?=
 =?utf-8?B?N1ltNGxtMXlwR21IeUR3ODBuRTBtMkdSK042SXU3cHI3QUhGWjVJTWtVWXAv?=
 =?utf-8?B?SEI0S2JNeGdkdkhTSGxabTVMalluZHkxeFhmUFhTL1dlQUhMckFKaHZnaDJZ?=
 =?utf-8?B?cXFYUDlodTVyQmc5RDY3cm0wYjFSUkExOURhNHJheHV1SWNscFlxWG1vOVRa?=
 =?utf-8?B?Q0NoUzJwWENtYlRuOUFCNVJzZEo3blFJK0FSOWZrZFVCUVoxK2N5YXFOSDVP?=
 =?utf-8?B?MFZEZkFlK3lMZFdRUlNrS1dMdnRxSzRLaWJ6L1dzV1MxOFlyZVlKQXAvM3pK?=
 =?utf-8?B?M25JYWV1amxoM09wdG5ESzR5TkNKcEFpcWdwRGZNYW80MkYwQnRUbkhwTENL?=
 =?utf-8?B?djUxTk8rdVkvV2M0RXNYQXFTbGxGSWxZM3F1Mnc2eVNVMHBVSWRwU2dHU2FF?=
 =?utf-8?B?OEhEZHdpRGZiUlRYTzNTTE9DY281dDNjWWNvdDdTTU9hRUdrb1RGb1NnZEdE?=
 =?utf-8?B?UUJ6aFZ6VlpaMmk4U2MxM3pTTWdEWkUvMlQyemp4WDlHaGxYRWZwNWFxTk5B?=
 =?utf-8?B?YnVndCtmYzcxRHlCbnh6bmlDVWNuRUJ4NkNoczJHQ1EvRWY0OWo4M1lLVGNz?=
 =?utf-8?B?anpzT1ZUejl6MisrOUQ4SjY0K1NoWTNMd2dWdVlleThYMEFNS2NjWWExQ2tX?=
 =?utf-8?B?d2hBQXprSUQ5OE05T0VKZHozUVdQOTlCU3RGemY0QzdJUE5qSjhlL1U1TWIz?=
 =?utf-8?B?TC96R2tOaHFWak10ajdWQ3QrcEgvcEx0Zjl5VFJNbzgxalllazJDbmJrNWVX?=
 =?utf-8?B?MWk4TCtYMW10TkZtZUFyYmhnQmtDcVVpVDJBdHlPLzVyOU4rSHdzRHR0V0d4?=
 =?utf-8?B?N01UT25LYVJ3bitsdkMxNjQ4QjJIcXJNUElLRmZTdkVnbWNHZzhIVFBDSUhu?=
 =?utf-8?B?MkZJR1RXaDZkYnRVQVdESWhwNXNiQS9GeGwyZFdTNGdMWUJDSVBKYUswMC9j?=
 =?utf-8?B?c2tPZXBwV3Z3YU16azJzRlVWbThBVVVEcjBFS0JwZVdSVnM2NGU0MmdkNllj?=
 =?utf-8?B?NS9wMlNQVnhwWWZnT1FFSDNhdjNWa3J1QWtKZ3kzTlR3NEpiUUJPU2ZCTGxu?=
 =?utf-8?B?azdhQlg4aUpWcjRWbDN0ZmZKSTRadmZxbXVJMm5TMHpDdlh1UVVZVHpkaFJ1?=
 =?utf-8?B?TStjN3o2RXlNQTZyVjJWRDI4NzcwQ3pJalc1RVN1MnhlMG1pYUhYYjI2UDB3?=
 =?utf-8?B?RVorMnJIVmIxazQweXc5aUt4REE3ajkzbXV6OXVzUUkxdWlmbDBTNmhLWFRJ?=
 =?utf-8?B?YkNOWmpzeDl1Ukh3NjdONk1TZkJKNXZ6QzdRWGZTaE5HNGNCaXV4MFZqU0cz?=
 =?utf-8?B?eGNtSXVOUElrTXNvZlQzTzBOY3c4Y0R4UXVIWm5HeURUa1RNcE5pUGtQVGY1?=
 =?utf-8?B?MUlBOXloeHpnOVZiT1p6WlFzc3dIb1V5dXp4V2lEbk54Y1ZQYnpnQnZCenMv?=
 =?utf-8?B?YktNSnlOSlcxMldMUU4vVTIxU2wwc0h1bGdPOWxvNTZlZjZhbXFYZGUzTkhn?=
 =?utf-8?B?UlIrMjBGeGZEWWhVQkZ2WTNkWUJYMVF4WWdZeVo4K0p2T3UydUFycVB0Z3dI?=
 =?utf-8?B?Z2l6YWhxMFgvTVlNUERCdVI4S0dMNkNrYmJOMy8rQThncEtUUHYrdTNOZ3BI?=
 =?utf-8?B?dHhVL0JvRm93MlQrbTRkMGdXS1pyWk10Z3U5OHlNM2VhL0U5U0s5dVVLVDU5?=
 =?utf-8?B?U3FFTStDN2xXY3k5Si9hczdweHp4aDVSVWZuREFSc1lQVk50T0VVbnJWSGxD?=
 =?utf-8?Q?GiFKHB6SnXVwzByCeY3VgKff9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51c2dd47-3c22-4a26-8eaa-08db500aa345
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 21:24:42.3546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yCN+TNblrzTbQghlKZFhd1njDfynysMX090W/EsJ/P50o7r8EJVjghCl5wxxnhoKgKEp/970yDdaFl2qhv4qaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6676
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
> CRTC shaper LUT shapes the content after blending, i.e., de-linearizes
> or normalizes space before applying a 3D LUT color correction. In the
> next patch, we add CRTC 3D LUT property to DRM color management after
> this shaper LUT and before the current CRTC gamma LUT.
> 

It might be good to describe the motivation behind the "de-linearization"
of pixels. Since a 3DLUT has a limited number of entries in each dimension
we want to use them in an optimal fashion. This means using the 3DLUT in
a colorspace that is optimized for human vision, such as sRGB, PQ, or
another non-linear space.

> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  28 ++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  14 ++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  17 +++
>  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 122 +++++++++++++++++-
>  4 files changed, 179 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index 8632ab695a6c..44c22cb87dde 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -1247,6 +1247,30 @@ amdgpu_display_user_framebuffer_create(struct drm_device *dev,
>  	return &amdgpu_fb->base;
>  }
>  
> +#ifdef CONFIG_STEAM_DECK

Something like AMD_PRIVATE_COLOR would be better.

It might also be enough to guard only the bits that make the uAPI
appear, such as drm_property_create, etc.

Harry

> +static int
> +amdgpu_display_create_color_properties(struct amdgpu_device *adev)
> +{
> +	struct drm_property *prop;
> +
> +	prop = drm_property_create(adev_to_drm(adev),
> +				   DRM_MODE_PROP_BLOB,
> +				   "AMD_SHAPER_LUT", 0);
> +	if (!prop)
> +		return -ENOMEM;
> +	adev->mode_info.shaper_lut_property = prop;
> +
> +	prop = drm_property_create_range(adev_to_drm(adev),
> +					 DRM_MODE_PROP_IMMUTABLE,
> +					 "AMD_SHAPER_LUT_SIZE", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	adev->mode_info.shaper_lut_size_property = prop;
> +
> +	return 0;
> +}
> +#endif
> +
>  const struct drm_mode_config_funcs amdgpu_mode_funcs = {
>  	.fb_create = amdgpu_display_user_framebuffer_create,
>  };
> @@ -1323,6 +1347,10 @@ int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
>  			return -ENOMEM;
>  	}
>  
> +#ifdef CONFIG_STEAM_DECK
> +	if (amdgpu_display_create_color_properties(adev))
> +		return -ENOMEM;
> +#endif
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index b8633df418d4..1fd3497af3b5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -344,6 +344,20 @@ struct amdgpu_mode_info {
>  	int			disp_priority;
>  	const struct amdgpu_display_funcs *funcs;
>  	const enum drm_plane_type *plane_type;
> +
> +	/* Driver-private color mgmt props */
> +#ifdef CONFIG_STEAM_DECK
> +	/**
> +	 * @shaper_lut_property: CRTC property to set post-blending shaper LUT
> +	 * that converts content before 3D LUT gamma correction.
> +	 */
> +	struct drm_property *shaper_lut_property;
> +	/**
> +	 * @shaper_lut_size_property: CRTC property for the size of
> +	 * post-blending shaper LUT as supported by the driver (read-only).
> +	 */
> +	struct drm_property *shaper_lut_size_property;
> +#endif
>  };
>  
>  #define AMDGPU_MAX_BL_LEVEL 0xFF
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 2e2413fd73a4..de63455896cc 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -726,6 +726,23 @@ struct dm_crtc_state {
>  	struct dc_info_packet vrr_infopacket;
>  
>  	int abm_level;
> +
> +#ifdef CONFIG_STEAM_DECK
> +	/* AMD driver-private color mgmt pipeline
> +	 *
> +	 * DRM provides CRTC degamma/ctm/gamma color mgmt features, but AMD HW
> +	 * has a larger set of post-blending color calibration features, as
> +	 * below:
> +	 */
> +	/**
> +	 * @shaper_lut:
> +	 *
> +	 * Lookup table used to de-linearize pixel data for gamma correction.
> +	 * See drm_crtc_enable_color_mgmt(). The blob (if not NULL) is an array
> +	 * of &struct drm_color_lut.
> +	 */
> +	struct drm_property_blob *shaper_lut;
> +#endif
>  };
>  
>  #define to_dm_crtc_state(x) container_of(x, struct dm_crtc_state, base)
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> index e3762e806617..503433e5cb38 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -229,7 +229,9 @@ static void dm_crtc_destroy_state(struct drm_crtc *crtc,
>  	if (cur->stream)
>  		dc_stream_release(cur->stream);
>  
> -
> +#ifdef CONFIG_STEAM_DECK
> +	drm_property_blob_put(cur->shaper_lut);
> +#endif
>  	__drm_atomic_helper_crtc_destroy_state(state);
>  
>  
> @@ -266,7 +268,12 @@ static struct drm_crtc_state *dm_crtc_duplicate_state(struct drm_crtc *crtc)
>  	state->crc_skip_count = cur->crc_skip_count;
>  	state->mpo_requested = cur->mpo_requested;
>  	/* TODO Duplicate dc_stream after objects are stream object is flattened */
> +#ifdef CONFIG_STEAM_DECK
> +	state->shaper_lut = cur->shaper_lut;
>  
> +	if (state->shaper_lut)
> +		drm_property_blob_get(state->shaper_lut);
> +#endif
>  	return &state->base;
>  }
>  
> @@ -299,6 +306,111 @@ static int amdgpu_dm_crtc_late_register(struct drm_crtc *crtc)
>  }
>  #endif
>  
> +#ifdef CONFIG_STEAM_DECK
> +/**
> + * drm_crtc_additional_color_mgmt - enable additional color properties
> + * @crtc: DRM CRTC
> + *
> + * This function lets the driver enable the 3D LUT color correction property
> + * on a CRTC. This includes shaper LUT, 3D LUT and regamma TF. The shaper
> + * LUT and 3D LUT property is only attached if its size is not 0.
> + */
> +static void
> +dm_crtc_additional_color_mgmt(struct drm_crtc *crtc)
> +{
> +	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
> +
> +	if (adev->dm.dc->caps.color.mpc.num_3dluts) {
> +		drm_object_attach_property(&crtc->base,
> +					   adev->mode_info.shaper_lut_property, 0);
> +		drm_object_attach_property(&crtc->base,
> +					   adev->mode_info.shaper_lut_size_property,
> +					   MAX_COLOR_LUT_ENTRIES);
> +	}
> +}
> +
> +static int
> +atomic_replace_property_blob_from_id(struct drm_device *dev,
> +					 struct drm_property_blob **blob,
> +					 uint64_t blob_id,
> +					 ssize_t expected_size,
> +					 ssize_t expected_elem_size,
> +					 bool *replaced)
> +{
> +	struct drm_property_blob *new_blob = NULL;
> +
> +	if (blob_id != 0) {
> +		new_blob = drm_property_lookup_blob(dev, blob_id);
> +		if (new_blob == NULL)
> +			return -EINVAL;
> +
> +		if (expected_size > 0 &&
> +		    new_blob->length != expected_size) {
> +			drm_property_blob_put(new_blob);
> +			return -EINVAL;
> +		}
> +		if (expected_elem_size > 0 &&
> +		    new_blob->length % expected_elem_size != 0) {
> +			drm_property_blob_put(new_blob);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	*replaced |= drm_property_replace_blob(blob, new_blob);
> +	drm_property_blob_put(new_blob);
> +
> +	return 0;
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
> +	bool replaced = false;
> +	int ret;
> +
> +	if (property == adev->mode_info.shaper_lut_property) {
> +		ret = atomic_replace_property_blob_from_id(crtc->dev,
> +					&acrtc_state->shaper_lut,
> +					val,
> +					-1, sizeof(struct drm_color_lut),
> +					&replaced);
> +		acrtc_state->base.color_mgmt_changed |= replaced;
> +		return ret;
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
> +	if (property == adev->mode_info.shaper_lut_property)
> +		*val = (acrtc_state->shaper_lut) ?
> +			acrtc_state->shaper_lut->base.id : 0;
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
> @@ -317,6 +429,10 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
>  #if defined(CONFIG_DEBUG_FS)
>  	.late_register = amdgpu_dm_crtc_late_register,
>  #endif
> +#ifdef CONFIG_STEAM_DECK
> +	.atomic_set_property = amdgpu_dm_atomic_crtc_set_property,
> +	.atomic_get_property = amdgpu_dm_atomic_crtc_get_property,
> +#endif
>  };
>  
>  static void dm_crtc_helper_disable(struct drm_crtc *crtc)
> @@ -477,9 +593,11 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
>  	is_dcn = dm->adev->dm.dc->caps.color.dpp.dcn_arch;
>  	drm_crtc_enable_color_mgmt(&acrtc->base, is_dcn ? MAX_COLOR_LUT_ENTRIES : 0,
>  				   true, MAX_COLOR_LUT_ENTRIES);
> -
>  	drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_ENTRIES);
>  
> +#ifdef CONFIG_STEAM_DECK
> +	dm_crtc_additional_color_mgmt(&acrtc->base);
> +#endif
>  	return 0;
>  
>  fail:


