Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F145771F2C4
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 21:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC08D10E59F;
	Thu,  1 Jun 2023 19:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::615])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1C310E59F;
 Thu,  1 Jun 2023 19:18:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBSssHlLwWdGe3rPrnWF472zVBSL0aIHQkrUnoUMrX5WfFLAwBiHYanu0CoBnS4pVrdpqBfKTuF1F7Mr5vBax4ToRHkoGLANgzbrPivavb6W/s76JfcFFYyjHINSmQj9gNH2an4D5td6Kt1pnoNgbKXQ7B+dKc2YHvKzZCeY6fF4uml+AoUwCP0DhqkrXplv1VlGTN32p0zLYGkjYzWcDKFUrbQGJozMFk5XaZAslPxU3lK6SrRVVRdkXPKxRMjZypWMWt8dcr4aYXgr9aPGQOqQ/bZrw/4Q6ohw0RmCGn/Yfw8rGhvKFKnqQ8lobPEZvOla5JocS/bhEMh4Iqrmfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8XNh2c5O3KjfD/+bYC+gD9iSk6/TidZuDQ30SQ6qg8=;
 b=BCTfZHxzpTUXxlGzmpMZJIGxz4fv/Iax8ZO1kPqP7VdFTzAqFdSdM5HtulEu2K7kloFlD5XhcT7FKGnCrBUN88OgGfBbWmkiuWBb1hBpm6PN9Iej2ZeKTaj84sNg8Z6sN36Lq7fc5FfofX2uZYPpyFTkhQ80zg+EFjay12mvBjEsb7CzpuDC5E/kBju+8Rk5YrIY0tJjjATfAZyKM9JLFymaaohNEz+9Vn61ASxqcz2cm4rBpMeJZj1EeZfeHuT2kRTVm6x7aPSrDI4DNVIGFvgoy277vSv2vjrFEEbYeYydKl6IQbLu+WVyhl6OLxLv4JSzz0JgR4Pfm7IZsmKsEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8XNh2c5O3KjfD/+bYC+gD9iSk6/TidZuDQ30SQ6qg8=;
 b=Zdkcd8t0lYvig2g19knDEBKaKSzzHuIecRuAszPQfW6XUEzS9om0fr/C9vAAmOZxYjmugYE871EjkAgk4Q7ZY9yQzxijQwxKx9Urt5MssRqUUT8kTl9VXT25ouekNZQ5uifM1g1u+6Woh/NEIWUu2Ge68symFj/G/p3Cm7RXnAI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com (2603:10b6:a03:3ba::23)
 by SJ2PR12MB7845.namprd12.prod.outlook.com (2603:10b6:a03:4ce::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.26; Thu, 1 Jun
 2023 19:17:55 +0000
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::7a73:2b11:74b0:b2e4]) by SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::7a73:2b11:74b0:b2e4%4]) with mapi id 15.20.6433.022; Thu, 1 Jun 2023
 19:17:55 +0000
Message-ID: <5ea0146c-19a2-58d9-4cc9-29af6d433915@amd.com>
Date: Thu, 1 Jun 2023 15:17:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 06/36] drm/amd/display: add CRTC driver-specific property
 for gamma TF
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230523221520.3115570-1-mwen@igalia.com>
 <20230523221520.3115570-7-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230523221520.3115570-7-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::23) To SJ0PR12MB5438.namprd12.prod.outlook.com
 (2603:10b6:a03:3ba::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5438:EE_|SJ2PR12MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: 718215b8-e023-4705-e3a3-08db62d4e66a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yz5DXnD525Er2TlmEShsPGROtPQoVWFb2V33//pB2dno/xNm0cNxO3BEgi1t6tMj3Lv+Mv1T6kc3Y6sRDWG8cGv2ZH14149KttMeE1z46pmrdzfvJ4LDUtrDU0LBXqwChseaMyWAgIT592HH2+jieZYjNyQdvWmOPHyhIxSv0xZpillMao/1igvscBsw/SP0Vk8eJzNIq5n7Pis2/XKPVTrIk0T1H5quMjWQb+FeVYMNfetOS8JsR9Kfw4em+k4Nb8FTjYxpCQZpg4KKFPhUDfYpAO4HnZzDySDnZVsL7mv70zS5L4jTWGYFjJkte8QGVqMHQY5dGJJh92ajAEhydIJ43nhMwdcqVbxKZTtIYZRJRKZ5dCjamzbcOh7o10zu4dYy6XOK23gJeKc/woOqkLTGEFxKVF+m7l5pFj5/4nLCJlFRGzUwNjJzLCMZR0ECyPtYQM6rKmx91d7+tM4stuh1VxETpnOP4xD5HkI/y4HHGjYR8zxRNEKNFveD0WdTDCmHUm2Pg8WwAyjLTKJgYc7N58ffuX7LpQfCp88N9mHv6Rw61D2Wo1QKx18cgHhZVnsmix9CrNifeeHnkRjhkrDboWEp3a9Fppl6CAk/9R79gUWLlLS/J7WL5Z6tFSZWSJLr0lmHrp7L370yexPXTxUp7CeA/VXdUis4l4BrmG0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5438.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199021)(26005)(6506007)(6512007)(186003)(53546011)(6666004)(6486002)(2616005)(83380400001)(41300700001)(316002)(2906002)(5660300002)(7416002)(44832011)(8936002)(30864003)(8676002)(478600001)(4326008)(66556008)(66946007)(66476007)(110136005)(54906003)(36756003)(31696002)(86362001)(921005)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVFFVXNSaURiTXk0S3RZTklLWXErTkt2dkhvZFJDSGZSeEdxN3VlVWhJTlY3?=
 =?utf-8?B?MkdxZEV1c080cVRiRXpPa3ZhNUhndUZhK285VERjelZFZnZVdHFFNGFCUVM3?=
 =?utf-8?B?OEhjeUlaWTdhVkwzYkJjdnJ0L2M2K1NkVU5CdHc2NC9nTWRtaC9JZjZ3NVVY?=
 =?utf-8?B?N3ZBbmdYQ0w3VWVuZ2FnTHA2ZE9MZGVQUVN3T25icndkMDJiK3pDQ2xINUhZ?=
 =?utf-8?B?Vjc0dFBrMk5MTTNIUDJHeHJsU0FQZ3VqWmFFbTcvTEVCV1U0anBYNjBuMzlB?=
 =?utf-8?B?K0VxRlE5Sm5MbGd6R2IydmJlL3k3dmd1OXdUMHY0a0JuclpGWGpmVk5Ocksy?=
 =?utf-8?B?WVJ0RTUvRHN1K0gzVEpkUmVQcnQ0bytPSXZyclU3b09DZ1hLVU9scUw1L0ZZ?=
 =?utf-8?B?VElPMEthOHVxRWY0bFFRaTNteDk4WGhGR2o3THpqMC8wczc0RXlLaHpWWGk2?=
 =?utf-8?B?NHFrNXhvaFN4ZTNNWUJmeVZyUlh4V3E3WWJWSFBWbmtYcVJtbWtNdmRvQ2lK?=
 =?utf-8?B?aHVrWEluN3F6blUzLzFKWkk2YXY5b0xPclpjbEJwTVI5Z1dVSThqazMwWExC?=
 =?utf-8?B?WjBUeTNMNGp1Zjd1UHFpWjFMMXdrNzlRTEtWaXFnS3BsRHVlQVRmSWFWcUd5?=
 =?utf-8?B?K1lBL0JPWUJGOUhMOHlHcjh0YTkzSEhYSUhkZGNKVCtPUktZR3VzcEVMbHFS?=
 =?utf-8?B?T0FqMXBzWE5vZ2kzcUhISGdoVXJqQmdramNwZjZxT0N4a3Z3cEVPaEYyUlI0?=
 =?utf-8?B?U1VrYjF3Rm94eVRoQTd5VnpSb2MrcW9hZXNhRmxHb2Ywd1BXeXFnQWluOGtM?=
 =?utf-8?B?R1Z0NkhsYThPQU5KZm8xcHg4NUlZbmNLTmdhcWJuZm1yNkZSRXorSzVoc05P?=
 =?utf-8?B?NVUyOVIrQzNaL0FSbWFMcktCL0pDUUtlZVFZeHFQT3ZCNE4yRSswSk8zSjRO?=
 =?utf-8?B?RWd5SE9uNDdhT0pUc0c0djc1NHljU09Gd09DWWNWOWsyWW9aMFBqYVdyMTY1?=
 =?utf-8?B?SXIvNDZZK2hualF3U2RzaE02ZHlYK2hxeXFjNmdYUTZPcnRDMTNzdFl1TUlB?=
 =?utf-8?B?SzA5ejlhb2ZMbW1UY3VJN0NPUVQ2NnErN2hIbFdUekpDYVFNVDY1TjVoaG5z?=
 =?utf-8?B?N3ZraDcvOVZFODhEY0RwNUZxY2xkeUdja2hueHgvRXE1cGZaV1p0YzM0cFRO?=
 =?utf-8?B?bzBUZ1loUzZjUDFKdHI0L21LMVlZZU0xSDd5cFFsUzBMZjErdjN1RTIyQVIy?=
 =?utf-8?B?eXRJK1llZUI2eUN5aVR6RERUU1IrSyt2Z0hWV0w2aHNsd1FFMVd2bkhnU3FD?=
 =?utf-8?B?bGtBWDlTR2t2SDcweXIvZ04vVVNOQ0owelV4dHk3dWN0RWxlMmlQVjV6TVJI?=
 =?utf-8?B?TW9pbE9MNlZ3U09UMXhlNHpQeGF3N0NJVnhEemF3eTR3eHRsVTRWem1HWUJ2?=
 =?utf-8?B?UjhDbmxZbDlLc3BPeXgvd1ZFVzMrSURaZ3ZueS9LWFdLb2kzd1daY1RWWUox?=
 =?utf-8?B?bnlubUh2UWIwMSt0WnJuckVMTFAzZ3h4RVY1VE9CVzdiU2pZb0VvSVVhZEN6?=
 =?utf-8?B?MkhWNlVtanY2NmNSc0ZYVnpEWXpMKzJST3ZLWFpXQ3RYRDU0dDN6NmF4cXh5?=
 =?utf-8?B?T2FxV25xZ2d1dFNhdCtIbFkxSWt0YVNRelk2aStjSmc0RWJaaXlUKzR4QlRo?=
 =?utf-8?B?YmVyQlhGcmE4aDJBN29Pckgzb1VPM3d5cm05U1FteE0rcWtCMVJjK0k0bkxF?=
 =?utf-8?B?ZWxMb08ybEtMSWlpYlI0MmVaakduOVowLzNaeEpLSk5sWmVNbjV6emJZbHFi?=
 =?utf-8?B?KzRhNUZHeEM5Ny94cVl2MjNOa3dhZENWV1NTMTh3M1dvZGpIMmhKV2dSNkJE?=
 =?utf-8?B?TG8yMGh4cjZnK0dWK3lHWTBhZ1prRTgxZG1GZjlMRUpOUkU2bTgwd0wzRkE0?=
 =?utf-8?B?QXR0d1d3V3dOaXdnQjJHdDNZZEZJa0JPaUE3Wi90Z1VzbTlOZnN0TFJhMWlo?=
 =?utf-8?B?bEh2USswYUxad3IrcVpoOENVRTAzUk9iaERDeVU0cDlodERSUEUwOGhieS9r?=
 =?utf-8?B?Q0hmcXpBNSs5eVBhelZlSU90Nm5zTk0zYTRidFFYRzAwdk9YU1Z4YWErd3dX?=
 =?utf-8?Q?ZS2q4GEltCHIR4M33fZ+WHp9T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 718215b8-e023-4705-e3a3-08db62d4e66a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5438.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 19:17:54.5587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aamcmLYfekYPcHP5UPoZ+cw6bNPYK9td0OSzDW95Q7w2hb5AfTXvuI65m9vp+ZYStDMFmnNoLb1u70bpPRqy+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7845
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
> Hook up driver-specific atomic operations for managing AMD color
> properties and create AMD driver-specific color management properties
> and attach them according to HW capabilities defined by `struct
> dc_color_caps`. Add enumerated transfer function property to DRM CRTC
> gamma to convert to wire encoding with or without a user gamma LUT.
> Enumerated TFs are not supported yet by the DRM color pipeline,
> therefore, create a DRM enum list with the predefined TFs supported by
> the AMD display driver.
> 
> Co-developed-by: Joshua Ashton <joshua@froggi.es>
> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 36 ++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  8 +++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 22 ++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 72 ++++++++++++++++++-
>  4 files changed, 137 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index 389396eac222..88af075e6c18 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -1247,6 +1247,38 @@ amdgpu_display_user_framebuffer_create(struct drm_device *dev,
>  	return &amdgpu_fb->base;
>  }
>  
> +static const struct drm_prop_enum_list drm_transfer_function_enum_list[] = {
> +	{ DRM_TRANSFER_FUNCTION_DEFAULT, "Default" },
> +	{ DRM_TRANSFER_FUNCTION_SRGB, "sRGB" },
> +	{ DRM_TRANSFER_FUNCTION_BT709, "BT.709" },
> +	{ DRM_TRANSFER_FUNCTION_PQ, "PQ (Perceptual Quantizer)" },
> +	{ DRM_TRANSFER_FUNCTION_LINEAR, "Linear" },
> +	{ DRM_TRANSFER_FUNCTION_UNITY, "Unity" },
> +	{ DRM_TRANSFER_FUNCTION_HLG, "HLG (Hybrid Log Gamma)" },
> +	{ DRM_TRANSFER_FUNCTION_GAMMA22, "Gamma 2.2" },
> +	{ DRM_TRANSFER_FUNCTION_GAMMA24, "Gamma 2.4" },
> +	{ DRM_TRANSFER_FUNCTION_GAMMA26, "Gamma 2.6" },
> +};

Let's not use the DRM_/drm_ prefix here. It might clash later when
we introduce DRM_ core interfaces for enumerated transfer functions.

We'll want to specify whether something is an EOTF or an inverse EOTF,
or possibly an OETF. Of course that wouldn't apply to "Linear" or
"Unity" (I'm assuming the two are the same?).

EOTF = electro-optical transfer function
This is the transfer function to go from the encoded value to an
optical (linear) value.

Inverse EOTF = simply the inverse of the EOTF
This is usually intended to go from an optical/linear space (which
might have been used for blending) back to the encoded values.

OETF = opto-electronic transfer function
This is usually used for converting optical signals into encoded
values. Usually that's done on the camera side but I think HLG might
define the OETF instead of the EOTF. A bit fuzzy on that. If you're
unclear about HLG I recommend we don't include it yet.

It would also be good to document a bit more what each of the TFs
mean, but I'm fine if that comes later with a "driver-agnostic"
API. The key thing to clarify is whether we have an EOTF or inv_EOTF,
i.e. whether we use the TF to go from encoded to optical or vice
versa.

I know DC is sloppy and doesn't define those but it will still use
them as either EOTF or inv_EOTF, based on which block they're being
programmed, if I'm not mistaken.

> +
> +#ifdef AMD_PRIVATE_COLOR
> +static int
> +amdgpu_display_create_color_properties(struct amdgpu_device *adev)
> +{
> +	struct drm_property *prop;
> +
> +	prop = drm_property_create_enum(adev_to_drm(adev),
> +					DRM_MODE_PROP_ENUM,
> +					"AMD_REGAMMA_TF",
> +					drm_transfer_function_enum_list,
> +					ARRAY_SIZE(drm_transfer_function_enum_list));
> +	if (!prop)
> +		return -ENOMEM;
> +	adev->mode_info.regamma_tf_property = prop;
> +
> +	return 0;
> +}
> +#endif
> +

It'd be nice if we have this function and the above enum_list
in amdgpu_dm, possibly in amdgpu_dm_color.c. You could call it
directly after the amdgpu_display_modeset_create_prop() call in 
amdgpu_dm_mode_config_init().

>  const struct drm_mode_config_funcs amdgpu_mode_funcs = {
>  	.fb_create = amdgpu_display_user_framebuffer_create,
>  };
> @@ -1323,6 +1355,10 @@ int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
>  			return -ENOMEM;
>  	}
>  
> +#ifdef AMD_PRIVATE_COLOR
> +	if (amdgpu_display_create_color_properties(adev))
> +		return -ENOMEM;
> +#endif
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index b8633df418d4..881446c51b36 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -344,6 +344,14 @@ struct amdgpu_mode_info {
>  	int			disp_priority;
>  	const struct amdgpu_display_funcs *funcs;
>  	const enum drm_plane_type *plane_type;
> +
> +	/* Driver-private color mgmt props */
> +
> +	/* @regamma_tf_property: Transfer function for CRTC regamma
> +	 * (post-blending). Possible values are defined by `enum
> +	 * drm_transfer_function`.
> +	 */
> +	struct drm_property *regamma_tf_property;
>  };
>  
>  #define AMDGPU_MAX_BL_LEVEL 0xFF
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 2e2413fd73a4..ad5ee28b83dc 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -699,6 +699,20 @@ static inline void amdgpu_dm_set_mst_status(uint8_t *status,
>  
>  extern const struct amdgpu_ip_block_version dm_ip_block;
>  
> +enum drm_transfer_function {
> +	DRM_TRANSFER_FUNCTION_DEFAULT,
> +	DRM_TRANSFER_FUNCTION_SRGB,
> +	DRM_TRANSFER_FUNCTION_BT709,
> +	DRM_TRANSFER_FUNCTION_PQ,
> +	DRM_TRANSFER_FUNCTION_LINEAR,
> +	DRM_TRANSFER_FUNCTION_UNITY,
> +	DRM_TRANSFER_FUNCTION_HLG,
> +	DRM_TRANSFER_FUNCTION_GAMMA22,
> +	DRM_TRANSFER_FUNCTION_GAMMA24,
> +	DRM_TRANSFER_FUNCTION_GAMMA26,
> +	DRM_TRANSFER_FUNCTION_MAX,
> +};
> +
>  struct dm_plane_state {
>  	struct drm_plane_state base;
>  	struct dc_plane_state *dc_state;
> @@ -726,6 +740,14 @@ struct dm_crtc_state {
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
> +	enum drm_transfer_function regamma_tf;

Again, let's avoid a drm_ prefix. Maybe name all this amdgpu_ instead.

>  };
>  
>  #define to_dm_crtc_state(x) container_of(x, struct dm_crtc_state, base)
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> index e3762e806617..1eb279d341c5 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -229,7 +229,6 @@ static void dm_crtc_destroy_state(struct drm_crtc *crtc,
>  	if (cur->stream)
>  		dc_stream_release(cur->stream);
>  
> -

nit: stray newline

Harry

>  	__drm_atomic_helper_crtc_destroy_state(state);
>  
>  
> @@ -263,6 +262,7 @@ static struct drm_crtc_state *dm_crtc_duplicate_state(struct drm_crtc *crtc)
>  	state->freesync_config = cur->freesync_config;
>  	state->cm_has_degamma = cur->cm_has_degamma;
>  	state->cm_is_degamma_srgb = cur->cm_is_degamma_srgb;
> +	state->regamma_tf = cur->regamma_tf;
>  	state->crc_skip_count = cur->crc_skip_count;
>  	state->mpo_requested = cur->mpo_requested;
>  	/* TODO Duplicate dc_stream after objects are stream object is flattened */
> @@ -299,6 +299,69 @@ static int amdgpu_dm_crtc_late_register(struct drm_crtc *crtc)
>  }
>  #endif
>  
> +#ifdef AMD_PRIVATE_COLOR
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
> +	if(adev->dm.dc->caps.color.mpc.ogam_ram)
> +		drm_object_attach_property(&crtc->base,
> +					   adev->mode_info.regamma_tf_property,
> +					   DRM_TRANSFER_FUNCTION_DEFAULT);
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
> @@ -317,6 +380,10 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
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
> @@ -480,6 +547,9 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
>  
>  	drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_ENTRIES);
>  
> +#ifdef AMD_PRIVATE_COLOR
> +	dm_crtc_additional_color_mgmt(&acrtc->base);
> +#endif
>  	return 0;
>  
>  fail:

