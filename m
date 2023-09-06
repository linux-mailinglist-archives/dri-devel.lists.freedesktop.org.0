Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7184B7942E5
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 20:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E7110E6E6;
	Wed,  6 Sep 2023 18:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::613])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A27710E6E6;
 Wed,  6 Sep 2023 18:15:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CraF9kay6wiehEUF+j9x1xOMqqqoV0Kz8YNqrTrOehKBmxZuhTwb09c8SBn3A5dRvermD9m3N6JFgbSOceRv7x/N73yprytv/j726yyrTn6F83JywAHap2lJq7wiE3gwv16Bhkp5KKZ8dh8ZFvMvx10TPn7T727blv1AnfTpa/inUSvxCuKU3I7u0w5o7JjhF93B6sAus+1texLoEzP7n0SDa54vUrncclvZKmM10kjtLVOOdZMcjRX5zjDKLH/RHpcoUOh88QkpL/iaelJwsRC077tRTEvyZ6gQwphJZUwylE4QOCH9U+EQXSB+tBfWmUdKZxAwp2xzJMdRuh8AKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phCu5zGMGKdl0TuXW5SnNiA12W8tqyG3Cqp55t96UNA=;
 b=gEcCpb47caS6Ij4ugD2NnP91aFqmE0FVzrH6vGxICGN3jB2BXk+x4VnlaiBX/0IP8V2R9Je45v1SyrQWhGrc/HD39Bq5mnC3R182Rd40ySd7twRYF4SZEhtFn68FGYceLt0//YLWU5aM/ZsXedVtLWavQpxDxryjeKu3j15p73lTYuBieNL7epjo2rFnFQYd+/IojQCzt3dISUNMoEGiE/Hz6nokM4XcSkP8EL6cEftytn3LZo+oyXZP5zPidMR1X9xbl+0U4qZ4FUxd94BlAR5b8XAzuXm0p/LXPJ9g2eMiCzz3nqlGRL1p0pIeqpKccnTGqbACye0H6fZNPm1f9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phCu5zGMGKdl0TuXW5SnNiA12W8tqyG3Cqp55t96UNA=;
 b=zDz7rJAbilKKIIZZIyWLjZb46Q0X+tJujG8S+yJfFehgbAiuKjkkfP5vbe/qmT0Lckml5R5lHo9RJc4Dfbp/LNVFk5Nu2rJtWsFlmWS+4kqomzHjyZDpYu3s3TyusdNluSbeUoKQJrYN97tsDgpP5ZyzbYTgzUaY8GTm08BoZJY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH0PR12MB8552.namprd12.prod.outlook.com (2603:10b6:610:18e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 18:15:04 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 18:15:04 +0000
Message-ID: <d50e07fe-4e8e-4e18-ae75-ba351c3c95ad@amd.com>
Date: Wed, 6 Sep 2023 14:14:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 32/34] drm/amd/display: add plane CTM driver-specific
 property
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-33-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230810160314.48225-33-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0303.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::14) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH0PR12MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: f922214e-3127-43d6-ed41-08dbaf053198
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 47eOO/x+LqZi7WSIDTSVAajaHmkDz2shjWBzscNG+F8x6VSg6PSkeyXqJngSji3rTcFXoRTWwXqO6QQtL9sePgCa8gk+ACo8fMXC8bAfzX408wKiM/1bugp4QywdzaCDjEKtAY327EeAE+MYtTlXRdsPo/w6XTbRrnPLFZH3QmRipw38TKwQLZRt2vXjP2oA1SWv0xi63nhWAnn1yrf6gbsCj7ybv7oBcIl08u8o8w53GLJroZUivo3uS6rYj0kV0ZWnOwPylawSY81a8yqRc6g0oIkx84iUiUeIDuwBrFi2eSMhI0xGqSJ/IS1LpzQ9hGOFkmtoSIPXX8DSoDoLQKcAWkggXm2dFELT+tyEozXW48mmR35PKOxRG7s4c3yPvueTLR3OqZnwbbIEcNR60gFFJzcQYZOrQb7rXxaxk8dXXW35w0vw4iFD6evdSGxFEtDP9E59hTl5QFyp4xJeEfMNm3+1+PaSDMX2ZsbyqofHG+3Fh2eBxV/9hi1mSiIG5h+vwQnYOm8hRLRQQ/jsX0qF8jPnSzQ3j8jN3B63/sxAIbDGXUZ76Qn8skS4LaBoWnFv6hLReriGSc7XNtjLgjRqnZ/HD16i2grhLdwnsG7fOERpcYH7bRUE377uZ3Ikmn5K33OyybrOxw0S22SL7ruTyBQMVXLVdAEtkFdmQAw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(366004)(39860400002)(396003)(186009)(1800799009)(451199024)(2616005)(921005)(38100700002)(26005)(6486002)(6506007)(53546011)(6512007)(36756003)(31696002)(86362001)(44832011)(5660300002)(7416002)(41300700001)(54906003)(316002)(66556008)(66946007)(110136005)(66476007)(8936002)(4326008)(8676002)(31686004)(6666004)(2906002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGt1VGdxdmJaLy82WGQ2MVdHUmZNZXhrQjEyRjQxcUg5dWlzZlh3dWNMamJL?=
 =?utf-8?B?OHZjZzV3bzZqempqbllRZVlJa0ZwNkEwblNHc09JZE03Q1cvT1czbWNHdW4z?=
 =?utf-8?B?ZmRzT1c5YnJURUUvQlNTMi9WaDFTd0pBcWtKR1p6SWFodGwveTF3UmU5WFVn?=
 =?utf-8?B?ZXA0OHpRYlFvREZtWC9wQ1pJR3I3c0NwM2NMaXViakFWeTlRZWNsQldVdlpp?=
 =?utf-8?B?VGpJSXlBYzhYMVJqazVhbUtnRzM1VXRlQUNzMnh4VDhuT2JHc2dlbmpJdWNG?=
 =?utf-8?B?OVcrYjQ1L2tjYVM1QUNJQlpKL0ZLMXJRT1VUNmpFSjRXbEZ2RWUvQ0VPTk1w?=
 =?utf-8?B?NEw0TllSKzhmbEpubE1aWmFFb0twSTZJVzcyRTRvUHRWbEh1REVIMTF1OTBQ?=
 =?utf-8?B?dDU3LzFMa0pLK2hxSHFuUkxneWV6blFMTmJKVkd5S2ZGT01BZXdqWFJaYUdJ?=
 =?utf-8?B?UjNIYlIvbFVsMWdSQ3A1Y1U5ZkIxZUVFbGpzMkVwcGVqc1dtb2dFc0pOeTF3?=
 =?utf-8?B?R1JUaXpOdU9RR3dxbEI3bVJMdWErZlp2STZIbWd4c3lveWVDYkVScVZmRTM4?=
 =?utf-8?B?Vk1jS1c2TWFFL0NsVkRlSzhLTk1lV1l3T0J4V3BNZEhDcU4xY2RhUW9yRFY2?=
 =?utf-8?B?emRuN1lRaUIzZXlDa1dDSnZRRldiWkpGYzVBWUpqN1JlMEhteklTMlh0UVZo?=
 =?utf-8?B?bXVzY1BFVGkxcThqcFJxK3d1Sk4raUdtSDBjcVBLVEsrYTlnb2w3VEdERnRo?=
 =?utf-8?B?MGlaOUdOTFlUTWVpeHBMU1dLZkhEd0sxN0EzUXJzcjAvQTNYTXJJdFV6TmRX?=
 =?utf-8?B?djBMNXp0YnhKYlRaeThhV2NoWFF1aWNESms0cnZtNkJTVEFPVUlpandMN3Vq?=
 =?utf-8?B?VUkvVjN5VjBKRDNWVHF5Qm4zUmxlcklOT1Mwemc4eUJoNnBXVW5Ya0V4eTNw?=
 =?utf-8?B?aElEbDlwZHdUOHFSTTZEMWhlZUJERExnOWJXVFlVRndtQ1ZsTWpuamdQTXN1?=
 =?utf-8?B?bGRvNi9VL09KUkhQenI3NGZwcTZ1ZmlhQ2hGUnAxYURzaURqWUtwUnNZRlhC?=
 =?utf-8?B?eUZIZEUxdWdDZ0VtMklXdzhicnp3QnZoYnBjQ2taR3gzRnBJdHp6WjRMbVdF?=
 =?utf-8?B?Q1JKa1lWcjBPL1ZHYnN0SkFQZFNZS3RRVFZ3Vm5UWFlES1BGQUZaSjd5UWNW?=
 =?utf-8?B?Z0ZINlBFWWxPTmcvVUNSRHRLTlZVVzlqOS93a2lMTk5wZVhRdnpZOGhIa08y?=
 =?utf-8?B?Uk9ReWhSWG9pWnNlNUp2anA4QzZ3aUNzdEZSOTY0eGNHbDJKdGp1bnVuZGlP?=
 =?utf-8?B?aitVUm5OS3VlSmFWOU04d2tnUVVLQWF3SHBRWVZ0NXh1QlpFbUFpUXJiRXFH?=
 =?utf-8?B?SFJydDVlbk9ZQ3ZXRVg3YTBKY0Ywa2ZBUVhSUVkyS3ZaV3oySm1EdUF1VENR?=
 =?utf-8?B?aWtYTS9aRkdhME83TWQ1d3liWnI4ZjM1T3QzeVJrU2dOU29NSFNLN3NxU0pR?=
 =?utf-8?B?aVBrNU4xZFFxR0NiTlJZOXFjZ1BWb25hZVpMWUFvaXFsblUyaEd1cVJGa0tz?=
 =?utf-8?B?cWlNZzdhamJXOWU0TElQbStUOXBmZnBhN2RmcnliNmVSczRRU1NXdUZKcDRt?=
 =?utf-8?B?RnlNaFlTSVdTRnROcnFjdWJGYXhZTlduVjJXNm8zekRzQXgrWHJRdHlPYVo2?=
 =?utf-8?B?WjBPYzE5YnBneFY2cUR0RW5RQXl0VDc2ckhoTXF5Ukp5NFpsSTFCck9MRGo2?=
 =?utf-8?B?SlYzaEF1ak8xL25GTHRhOWdQNHdJWjlkN0hIbWY2ZkNmVkQxL0FDSE9la2ZI?=
 =?utf-8?B?bmVkcDNZUTZOTnk2MUtzQUVjVkV4eHBkbVBLai9VT2FEQmdyb3lRRTUwZytx?=
 =?utf-8?B?R1lZSWdkdmJRcFhUWXVYbyttaU9kVHlCUVRRQnFLSjFHMjI2R3EzREtxWGdp?=
 =?utf-8?B?aWczZ2xXNjYxcVZuZUVUWjlESVJnWTFIaHhJekFnSjludUFMZkE4L2plcGgv?=
 =?utf-8?B?Yk5zNXQxT2F3ZGFiaU92aDhXOFcyVFRybkNjVHA4T1d3eENCMFc3MzFVYXVL?=
 =?utf-8?B?VHQwMTd4ckJpdDFjamR3NFlVZG4yV0hDRVJUN1k3clYremdyeDRFT2VtRWVk?=
 =?utf-8?Q?Pj5T/o6UUAU1Lou+0BTYsVE3d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f922214e-3127-43d6-ed41-08dbaf053198
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 18:15:04.7273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zZdCSyiHtDDTlktnrkfB+qgknQy91yTl4yf3IPeNzblMVwG5a6Y6R0muvWgqvWo6ooF+cNcSNk7eJkbwg9rbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8552
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
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-08-10 12:03, Melissa Wen wrote:
> Plane CTM for pre-blending color space conversion. Only enable
> driver-specific plane CTM property on drivers that support both pre- and
> post-blending gamut remap matrix, i.e., DCN3+ family. Otherwise it
> conflits with DRM CRTC CTM property.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  2 ++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  7 +++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  7 +++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 20 +++++++++++++++++++
>  4 files changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index abb871a912d7..84bf501b02f4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -363,6 +363,8 @@ struct amdgpu_mode_info {
>  	 * @plane_hdr_mult_property:
>  	 */
>  	struct drm_property *plane_hdr_mult_property;
> +
> +	struct drm_property *plane_ctm_property;
>  	/**
>  	 * @shaper_lut_property: Plane property to set pre-blending shaper LUT
>  	 * that converts color content before 3D LUT.
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 095f39f04210..6252ee912a63 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -769,6 +769,13 @@ struct dm_plane_state {
>  	 * S31.32 sign-magnitude.
>  	 */
>  	__u64 hdr_mult;
> +	/**
> +	 * @ctm:
> +	 *
> +	 * Color transformation matrix. See drm_crtc_enable_color_mgmt(). The
> +	 * blob (if not NULL) is a &struct drm_color_ctm.
> +	 */
> +	struct drm_property_blob *ctm;
>  	/**
>  	 * @shaper_lut: shaper lookup table blob. The blob (if not NULL) is an
>  	 * array of &struct drm_color_lut.
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 4356846a2bce..86a918ab82be 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -218,6 +218,13 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
>  		return -ENOMEM;
>  	adev->mode_info.plane_hdr_mult_property = prop;
>  
> +	prop = drm_property_create(adev_to_drm(adev),
> +				   DRM_MODE_PROP_BLOB,
> +				   "AMD_PLANE_CTM", 0);

We'll want to wrap the property creation/attachment with
#ifdef AMD_PRIVATE_COLOR here as well.

Harry

> +	if (!prop)
> +		return -ENOMEM;
> +	adev->mode_info.plane_ctm_property = prop;
> +
>  	prop = drm_property_create(adev_to_drm(adev),
>  				   DRM_MODE_PROP_BLOB,
>  				   "AMD_PLANE_SHAPER_LUT", 0);
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 3fd57de7c5be..0b1081c690cb 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1355,6 +1355,8 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
>  
>  	if (dm_plane_state->degamma_lut)
>  		drm_property_blob_get(dm_plane_state->degamma_lut);
> +	if (dm_plane_state->ctm)
> +		drm_property_blob_get(dm_plane_state->ctm);
>  	if (dm_plane_state->shaper_lut)
>  		drm_property_blob_get(dm_plane_state->shaper_lut);
>  	if (dm_plane_state->lut3d)
> @@ -1436,6 +1438,8 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
>  
>  	if (dm_plane_state->degamma_lut)
>  		drm_property_blob_put(dm_plane_state->degamma_lut);
> +	if (dm_plane_state->ctm)
> +		drm_property_blob_put(dm_plane_state->ctm);
>  	if (dm_plane_state->lut3d)
>  		drm_property_blob_put(dm_plane_state->lut3d);
>  	if (dm_plane_state->shaper_lut)
> @@ -1473,6 +1477,11 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
>  				   dm->adev->mode_info.plane_hdr_mult_property,
>  				   AMDGPU_HDR_MULT_DEFAULT);
>  
> +	/* Only enable plane CTM if both DPP and MPC gamut remap is available. */
> +	if (dm->dc->caps.color.mpc.gamut_remap)
> +		drm_object_attach_property(&plane->base,
> +					   dm->adev->mode_info.plane_ctm_property, 0);
> +
>  	if (dpp_color_caps.hw_3d_lut) {
>  		drm_object_attach_property(&plane->base,
>  					   mode_info.plane_shaper_lut_property, 0);
> @@ -1530,6 +1539,14 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
>  			dm_plane_state->hdr_mult = val;
>  			dm_plane_state->base.color_mgmt_changed = 1;
>  		}
> +	} else if (property == adev->mode_info.plane_ctm_property) {
> +		ret = drm_property_replace_blob_from_id(plane->dev,
> +							&dm_plane_state->ctm,
> +							val,
> +							sizeof(struct drm_color_ctm), -1,
> +							&replaced);
> +		dm_plane_state->base.color_mgmt_changed |= replaced;
> +		return ret;
>  	} else if (property == adev->mode_info.plane_shaper_lut_property) {
>  		ret = drm_property_replace_blob_from_id(plane->dev,
>  							&dm_plane_state->shaper_lut,
> @@ -1591,6 +1608,9 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
>  		*val = dm_plane_state->degamma_tf;
>  	} else if (property == adev->mode_info.plane_hdr_mult_property) {
>  		*val = dm_plane_state->hdr_mult;
> +	} else if (property == adev->mode_info.plane_ctm_property) {
> +		*val = (dm_plane_state->ctm) ?
> +			dm_plane_state->ctm->base.id : 0;
>  	} else 	if (property == adev->mode_info.plane_shaper_lut_property) {
>  		*val = (dm_plane_state->shaper_lut) ?
>  			dm_plane_state->shaper_lut->base.id : 0;

