Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 217D3672786
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 19:57:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E7310E1F7;
	Wed, 18 Jan 2023 18:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3188310E1F6;
 Wed, 18 Jan 2023 18:57:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7oB8ERLPQOt51Ug7swVvM1iAUDeNbz+w+lqfDtQ7rEXl5W6OYpu6NH7ZaxvoiOSAvw30i2W4f1gzQwS+Scc6YDnZpEjCu4qCcYoQlHABnIW8k3hdSpv2nwRcBl45ll9UUXewrkMTd+y9Gn+SV4giw4RSljR7ow6IeRml1tt/pAO6rICGYSlRJrtD0C8tdIABwiEGs1ixOR95QaPEpMuukqU7G1vo88mpPFgVzGvbc3iTpxuAgcBlJD7+jcsJoBnxYbPjz34z9Kb92GEQrtxSDLvRTUDrmWhbvzsoYf9hF5Z5Ax1EAmI56t1gBxYuW/txdkHbQ6Ih7PvP4PKCvcm/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8qpciVDCihMvVUpFN83cA2QMW/sQdDFqOmEpVRnnx0=;
 b=U7rlsUkDeUThoEGfd1kKOuPq0N8H77sx7vltTpaAPD3vOzfV4qgALJuRdgTjcaENo1zyKvLnsZLlbVFbOQ81qiNI02X4SvMUqKk1lIo3ma/CW6NbF3g5/+oE+XMq1/zZi+/PsQ/fe8GpUr+FyezbbKI95U/2kY//FbicqHPEIx5Rm30BxORGp1sY6i3rT3eBBo/BtGRBFKtpPQk2+0s6GKptBqD24bixkvc4RRIU3RwEhxD6SrbYD3LUj82iRB/fQJEAHnybSpGJGhotB3izd1a5G1koY0eQ04IWT8/CkO7Tci2EI/QjdO1BafCpVbYv6QXaL6kghJMTMQLHwsspMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8qpciVDCihMvVUpFN83cA2QMW/sQdDFqOmEpVRnnx0=;
 b=V0TeUdMB6/SRlVApbSeS1p+0ekW3rId61kpQbMUIRtmSYIcVcHbKOG4QdNIoTgS/5/lP1+20qmzwGjbeSJQruOyuja4/CZFGRkGxYk62T9LQaPluo6yc7knIVR/w4t0sjVKCpVvl4IZZDM1GAvZlhahlQWYrPpp/qLrMSAxuXWQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM4PR12MB6278.namprd12.prod.outlook.com (2603:10b6:8:a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 18:57:09 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0%5]) with mapi id 15.20.6002.013; Wed, 18 Jan 2023
 18:57:09 +0000
Message-ID: <c380bb1b-6e65-23c4-6e6b-29ce410b6baa@amd.com>
Date: Wed, 18 Jan 2023 13:57:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v3 1/3] drm: Introduce solid fill property for drm
 plane
Content-Language: en-US
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <20230104234036.636-2-quic_jesszhan@quicinc.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230104234036.636-2-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YTBP288CA0032.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::45) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM4PR12MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: c986f6ec-8fd7-442f-2d16-08daf985cd2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Uv6yl9k+pQd95s4YuczO7yZG1t+HYLWOXXyiBwBT0X4qRJWwfTdVZfYh3anhs16ZuUOWROYa184YDK/c/1iOCy1AXkT+hBJa0CnnTZZiV5a0CglCnjU7g0jqE6HodftSKT8yVWEPP0/6FlZjqVAOEIxyAbaEaxvpm92uYWoEUNsnMk7BiAO+kQyhiEg8wZkcihg7vJDPxNh9wYKphJTdhZBU2Kpp5jQ9StfTgq8zD8bmqnoGZfy2se3oOqipy6KOwyhnHKEv0eAWi0iw5tB68lLCFIoeoJAPCZf7rW/vsC6yjlOL9SpIeTSj56B2VZam7bFbRblAhnSMKtumKnzkmihA4y6ogTy9ljgvEpJ9FQFdDw2e6TT181T8K5NWcKxWTsUI4bRaWrbwewhvethhAjdujPOP0d9As/xJJAm0g7o1cA99ZQoQvKlCviwaRtQta1c8Om17HAxlvo5IWmfEOb+ig3o3uKbd9xAY27aqPQR+7BtjlHQA+i+9YNiMGTTm9HoC5leqHH56W+DHDEVC/TZEeVCg/BdfpNbab/s290r6aMd+LFwUDRKgjl/ai/9fo0wdFhpbMHkZ1U7iQQB9ghF+3oYDjgc4evoehIS2nuXph4x2/mQBv3Mk4KXNg9w0JBVFP0YT3Zit2mb7YWqnwWKsT3h/+kz0BjU1VrgWcK57PxrRDkJJB15Qj5s+oHn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(136003)(366004)(396003)(346002)(451199015)(31686004)(86362001)(2906002)(44832011)(7416002)(66476007)(66946007)(66556008)(5660300002)(8936002)(31696002)(38100700002)(316002)(6666004)(53546011)(966005)(6486002)(6506007)(36756003)(478600001)(8676002)(4326008)(41300700001)(186003)(6512007)(26005)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWtLemR1dW5yWDk3K2NTWjJJSXpLWGlLNG9HRGdVdElIcHlhWXh2amN4Y1lV?=
 =?utf-8?B?ZjdpTTFzWUFuU3dFWHBMVlMrNFN2d2tYOFZBSHJyUktJcWFrQk94Q3hML0FL?=
 =?utf-8?B?M0t3YmRUV2RDUmR4VU5aWlFZMUxOTW9INE9SREpZdy92VlZQQ0NHa2xGZy9Z?=
 =?utf-8?B?akh1WC93MEZWV1QrbllkWkZtNlFvNlNoKzlYNjVRRHJWb1hJQ1d0djd4eXdv?=
 =?utf-8?B?eUZMTWdnZlZRVHJFM3A3ZlIvaDVwaUd5c25QWTE0alA0WEJ2QldJYUN1eFJW?=
 =?utf-8?B?Z3BicHR1aU4xVVR3c1VuQlFzaUl4KzV3Smo4NkR4MnRjYWw3alBJU2hJbHhQ?=
 =?utf-8?B?VWxlaHgySURLQ2ovODg2WUlvV05MTkRyUUhWTngxM2tNeXdYUjFVSVZyVzdP?=
 =?utf-8?B?RlkrMi9pTlV3bSs2TkJFTFJ5aG5QQ2M0bUVhTGtjU3FQR3FjcmJZV2lRRXlD?=
 =?utf-8?B?K1lLL3FlL1Vja0d3UGJnbWloaS9jR1VHbVRpK09SbDdZS2hsOTFiRUxKSGZy?=
 =?utf-8?B?Rk9walV4SDErbDhCZ2YwbDVjRHN3b2lPTGZNTU5JTUUxVkp6VnlQK2ZWZ3o5?=
 =?utf-8?B?eFd0S0R4ZUVZZVpvV1pEdGFPZzVyd21mNGpZUWlLOVY0K3FDOXdpenN4MWZa?=
 =?utf-8?B?bjJFb3kwbHZVTk9jSzgrdFllV2Jhd0lOejAzSnArK0hRTExJdkdLK0xEbHc4?=
 =?utf-8?B?SmFJd2g2ZGRPNE9HemV0MHhWYjRjek9WR0JzVHd3M0JwRHRPYnRxa09nYUdu?=
 =?utf-8?B?SWJFTDM2UHJoTkphOHNjeit2SWdOSzFGek5ZcklERW9ISEtMRk92MHYxWHUz?=
 =?utf-8?B?SXN6SDNpbC95aGxGTjBQVjZ3WERqYnAwVXRBUGQ2VFhPWUpnQjA5Rmg1NXZW?=
 =?utf-8?B?VEhqdmIxRGRuZEhHc1JUOVM1WXhkUWRUMkYvblJvYWw3V1dJa2tDOFhsdjdL?=
 =?utf-8?B?U3VYT2ZETXNhcFY3VGlmUmNwRjZCRGwra2tPcU1MY0d0cEJmVjRzYVg2L0pP?=
 =?utf-8?B?ODNvWDVGSzdmVGEwOTh4Rm5MZngxLytJNVZ5MTUxRTJHdFdiVXFDTmFnY0Fp?=
 =?utf-8?B?OEtKQ1VvMjZ5RnZlTVFZalUxRXd4Y2hiSFRuQnBqbmVRM2lOdW1yaUtSa1F6?=
 =?utf-8?B?bnZ4YWQxMndLMHFmTDRTSVM0UWNpc2w4K3dJL2phbEJ1TWwzUENyenU2ckRn?=
 =?utf-8?B?SkRSaGxOS1FxQ2NUYTZWQlRiYjBhUVk3V3pVZ09qVUYrUE9XczdFTnRWZTNp?=
 =?utf-8?B?MkczNkp1UlhSc2RhRCtWZHI5VmY5NFRtVlNPeDhJMGhPcVQ2S0dLNlJMbisx?=
 =?utf-8?B?ZEF4R0wyMDd4VnpUUGl6M3NwUHhDRHJ3SVFVSEhaR0NqTy94Rk1INllrb2Rh?=
 =?utf-8?B?UkthQUd0T3c4dTZPY3g1SnVFVHZuVTRoeitlV0tBSVFRdnhscG1TTFNkN0Zr?=
 =?utf-8?B?SEswd1pJZkJIaStaVjlRTmk3OEl0cTBQRTFGR052dk5UTEFqWGo4Y2RqMG9P?=
 =?utf-8?B?VGFFaEN3bXBjaW9zZ0VYc3l1ZHdYRVlTNERLdkk5eFlJdndJMldpNjVOeGtD?=
 =?utf-8?B?RVloUUdmRGc4YlFkRWdua3lMZU16Y2JxQXFrMEUyOHlVdkwvajE2ZStINElz?=
 =?utf-8?B?RmJaZytKQklHUXZuSjhMZTJPeFZLeHE1UmxQSWQ1N2tPa0ovMFpsaGFPWjlm?=
 =?utf-8?B?a1RWZ1FwMzBtblcxMXZsNU5UWDNJQ1ZaK2tmTnNXSVBacVdwaU1tY3RCdlo1?=
 =?utf-8?B?NGRUTW15N1hYd2NER2dSL0pDdlJDOXloOWlqdnV0eDdOZnkwS3h4Q2lmakRs?=
 =?utf-8?B?UGxCdTQrbjNNekR5Rm1BRS9oaWloNlJJak9RR3ZsRlBRbnAzd3dLd3daWG9F?=
 =?utf-8?B?T2F1Q3dMYldWK1Q5UlVvSnVwaXFia2Foa2ozMnNGOEluSGxVZjNQQjJFM09Y?=
 =?utf-8?B?azAwRm1JOVZCd0xNRXBabEszUksrenY0YXhGc0pUdHQ0WEh0ZWpBSVFaNEgz?=
 =?utf-8?B?aW9pd25LK2V0SFc5bFFneTlPd0xyYnEwU1Vrb1RiUkdCK1V5ZW5KTW81SWxk?=
 =?utf-8?B?ZE56TmVxMisxV1p4bWFPRlZ2TE13c0dFUVI1aEZ0c2xZQnJlL21xbzMyb2xV?=
 =?utf-8?Q?Ko8YyYQIqqUXXqCFIL4aUwlaN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c986f6ec-8fd7-442f-2d16-08daf985cd2d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 18:57:09.6633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nl2G9qgglnzOpYeS9EG/AHcMmGrVxMTX8Ux7kmxg1KmjkYuw/lEH6grUeM5CE6rs6IkM9RvkWPhqzbsNrZP8QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6278
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
Cc: sebastian.wick@redhat.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, ppaalanen@gmail.com, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, daniel.vetter@ffwll.ch,
 dmitry.baryshkov@linaro.org, wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/4/23 18:40, Jessica Zhang wrote:
> Add support for solid_fill property to drm_plane. In addition, add
> support for setting and getting the values for solid_fill.
> 
> solid_fill holds data for supporting solid fill planes. The property
> accepts an RGB323232 value and the driver data is formatted as such:
> 
> struct drm_solid_fill {
> 	u32 r;
> 	u32 g;
> 	u32 b;
> };

Rather than special-casing this would it make sense to define this
as a single pixel of a FOURCC property?

I.e., something like this:

struct drm_solid_fill_info {
	u32 format; /* FOURCC value */
	u64 value; /* FOURCC pixel value */
}

That removes some ambiguity how the value should be interpreted, i.e.,
it can be interpreted like a single pixel of the specified FOURCC format.

It might also make sense to let drivers advertise the supported
FOURCC formats for solid_fill planes.

Is there an implementation for this in a corresponding canonical
upstream userspace project, to satisfy [1]? If not, what is the plan
for this? If so, please point to the corresponding patches.

[1] https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements

Harry

> 
> To enable solid fill planes, userspace must assigned solid_fill to a
> property blob containing the following information:
> 
> struct drm_solid_fill_info {
> 	u8 version;
> 	u32 r, g, b;
> };
> 
> Changes in V2:
> - Changed solid_fill property to a property blob (Simon, Dmitry)
> - Added drm_solid_fill struct (Simon)
> - Added drm_solid_fill_info struct (Simon)
> 
> Changes in V3:
> - Corrected typo in drm_solid_fill struct documentation
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c |  9 ++++
>  drivers/gpu/drm/drm_atomic_uapi.c         | 59 +++++++++++++++++++++++
>  drivers/gpu/drm/drm_blend.c               | 17 +++++++
>  include/drm/drm_blend.h                   |  1 +
>  include/drm/drm_plane.h                   | 43 +++++++++++++++++
>  5 files changed, 129 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index dfb57217253b..c96fd1f2ad99 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -253,6 +253,11 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
>  	plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
>  	plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
>  
> +	if (plane_state->solid_fill_blob) {
> +		drm_property_blob_put(plane_state->solid_fill_blob);
> +		plane_state->solid_fill_blob = NULL;
> +	}
> +
>  	if (plane->color_encoding_property) {
>  		if (!drm_object_property_get_default_value(&plane->base,
>  							   plane->color_encoding_property,
> @@ -335,6 +340,9 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
>  	if (state->fb)
>  		drm_framebuffer_get(state->fb);
>  
> +	if (state->solid_fill_blob)
> +		drm_property_blob_get(state->solid_fill_blob);
> +
>  	state->fence = NULL;
>  	state->commit = NULL;
>  	state->fb_damage_clips = NULL;
> @@ -384,6 +392,7 @@ void __drm_atomic_helper_plane_destroy_state(struct drm_plane_state *state)
>  		drm_crtc_commit_put(state->commit);
>  
>  	drm_property_blob_put(state->fb_damage_clips);
> +	drm_property_blob_put(state->solid_fill_blob);
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_plane_destroy_state);
>  
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index c06d0639d552..8a1d2fb7a757 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -316,6 +316,55 @@ drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
>  }
>  EXPORT_SYMBOL(drm_atomic_set_crtc_for_connector);
>  
> +static void drm_atomic_convert_solid_fill_info(struct drm_solid_fill *out,
> +		struct drm_solid_fill_info *in)
> +{
> +	out->r = in->r;
> +	out->g = in->g;
> +	out->b = in->b;
> +}
> +
> +static int drm_atomic_set_solid_fill_prop(struct drm_plane_state *state,
> +		struct drm_property_blob *blob)
> +{
> +	int ret = 0;
> +	int blob_version;
> +
> +	if (blob == state->solid_fill_blob)
> +		return 0;
> +
> +	drm_property_blob_put(state->solid_fill_blob);
> +	state->solid_fill_blob = NULL;
> +
> +	memset(&state->solid_fill, 0, sizeof(state->solid_fill));
> +
> +	if (blob) {
> +		if (blob->length != sizeof(struct drm_solid_fill_info)) {
> +			drm_dbg_atomic(state->plane->dev,
> +					"[PLANE:%d:%s] bad solid fill blob length: %zu\n",
> +					state->plane->base.id, state->plane->name,
> +					blob->length);
> +			return -EINVAL;
> +		}
> +
> +		blob_version = ((struct drm_solid_fill_info *)blob->data)->version;
> +
> +		/* Append with more versions if necessary */
> +		if (blob_version == 1) {
> +			drm_atomic_convert_solid_fill_info(&state->solid_fill, blob->data);
> +		} else {
> +			drm_dbg_atomic(state->plane->dev,
> +					"[PLANE:%d:%s] failed to set solid fill (ret=%d)\n",
> +					state->plane->base.id, state->plane->name,
> +					ret);
> +			return -EINVAL;
> +		}
> +		state->solid_fill_blob = drm_property_blob_get(blob);
> +	}
> +
> +	return ret;
> +}
> +
>  static void set_out_fence_for_crtc(struct drm_atomic_state *state,
>  				   struct drm_crtc *crtc, s32 __user *fence_ptr)
>  {
> @@ -544,6 +593,13 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>  		state->src_w = val;
>  	} else if (property == config->prop_src_h) {
>  		state->src_h = val;
> +	} else if (property == plane->solid_fill_property) {
> +		struct drm_property_blob *solid_fill = drm_property_lookup_blob(dev, val);
> +
> +		ret = drm_atomic_set_solid_fill_prop(state, solid_fill);
> +		drm_property_blob_put(solid_fill);
> +
> +		return ret;
>  	} else if (property == plane->alpha_property) {
>  		state->alpha = val;
>  	} else if (property == plane->blend_mode_property) {
> @@ -616,6 +672,9 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>  		*val = state->src_w;
>  	} else if (property == config->prop_src_h) {
>  		*val = state->src_h;
> +	} else if (property == plane->solid_fill_property) {
> +		*val = state->solid_fill_blob ?
> +			state->solid_fill_blob->base.id : 0;
>  	} else if (property == plane->alpha_property) {
>  		*val = state->alpha;
>  	} else if (property == plane->blend_mode_property) {
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index b4c8cab7158c..17ab645c8309 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -616,3 +616,20 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
> +
> +int drm_plane_create_solid_fill_property(struct drm_plane *plane)
> +{
> +	struct drm_property *prop;
> +
> +	prop = drm_property_create(plane->dev,
> +			DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_BLOB,
> +			"solid_fill", 0);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	drm_object_attach_property(&plane->base, prop, 0);
> +	plane->solid_fill_property = prop;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_create_solid_fill_property);
> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
> index 88bdfec3bd88..0338a860b9c8 100644
> --- a/include/drm/drm_blend.h
> +++ b/include/drm/drm_blend.h
> @@ -58,4 +58,5 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
>  			      struct drm_atomic_state *state);
>  int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>  					 unsigned int supported_modes);
> +int drm_plane_create_solid_fill_property(struct drm_plane *plane);
>  #endif
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 447e664e49d5..3b9da06f358b 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -40,6 +40,25 @@ enum drm_scaling_filter {
>  	DRM_SCALING_FILTER_NEAREST_NEIGHBOR,
>  };
>  
> +/**
> + * struct drm_solid_fill_info - User info for solid fill planes
> + */
> +struct drm_solid_fill_info {
> +	__u8 version;
> +	__u32 r, g, b;
> +};
> +
> +/**
> + * struct solid_fill_property - RGB values for solid fill plane
> + *
> + * Note: This is the V1 for this feature
> + */
> +struct drm_solid_fill {
> +	uint32_t r;
> +	uint32_t g;
> +	uint32_t b;
> +};
> +
>  /**
>   * struct drm_plane_state - mutable plane state
>   *
> @@ -116,6 +135,23 @@ struct drm_plane_state {
>  	/** @src_h: height of visible portion of plane (in 16.16) */
>  	uint32_t src_h, src_w;
>  
> +	/**
> +	 * @solid_fill_blob:
> +	 *
> +	 * Blob containing relevant information for a solid fill plane
> +	 * including pixel format and data. See
> +	 * drm_plane_create_solid_fill_property() for more details.
> +	 */
> +	struct drm_property_blob *solid_fill_blob;
> +
> +	/**
> +	 * @solid_fill:
> +	 *
> +	 * Pixel data for solid fill planes. See
> +	 * drm_plane_create_solid_fill_property() for more details.
> +	 */
> +	struct drm_solid_fill solid_fill;
> +
>  	/**
>  	 * @alpha:
>  	 * Opacity of the plane with 0 as completely transparent and 0xffff as
> @@ -699,6 +735,13 @@ struct drm_plane {
>  	 */
>  	struct drm_plane_state *state;
>  
> +	/*
> +	 * @solid_fill_property:
> +	 * Optional solid_fill property for this plane. See
> +	 * drm_plane_create_solid_fill_property().
> +	 */
> +	struct drm_property *solid_fill_property;
> +
>  	/**
>  	 * @alpha_property:
>  	 * Optional alpha property for this plane. See

