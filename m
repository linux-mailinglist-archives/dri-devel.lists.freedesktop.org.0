Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0AA2E9F64
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 22:16:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F706E041;
	Mon,  4 Jan 2021 21:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A105892D4;
 Mon,  4 Jan 2021 21:16:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYjikxfpv8TYvdzsd9gT0NQpiCjbKPEcAnCVyji1bpCkFkk2L6GNavzzfngxXoSqiF29YjlUyaIHt0mC2rAmulUe0BcpvGEKFKkcoQLAo4enNw9B11p95NdvZc0sYMqpToPRjweoHIcwWU4fZCts6I3bB29uW9Gj7CRnAAZlendVtO8AxJNjmS1KQGadOL889RYU2LVUMGP93bv3w8lfD7W59fmyD+XTU4+VVcuRzJdSrBGdXIfyh1HgZUYko+rmYZhcGVElcqPPL+v3x00Sm+mOTbe3SqtsrxgSm3sUV9UFuQTuyVUHrIHJK8olxm9Hm6fnwSuS/0qbkUHj7X4saQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHAszNO+uVo8ybfMqVDx1mXJkhyFnkLl03NurFvBoK8=;
 b=XrwdsDAfQMgMfqrUS0G/lsYaf4LJB8DH3yLxg9eN+9dOXO+QZa+JnvyCIHPryofABeF8bxDx5jD2dDIMbzFECyK+yuDb+2ZlUHPbTTZvZt+ci4kpteOnOH/07ZPDf3bXLf6gfiWrZt+hLv5mMGEVX/eeBV2yyGK+zWJB939Ueoxx3dEpySm48PIhI/sw1Kl9wHmgx+2kgGsPpX9JkqTyB4IeeMAWz2YGFgxWwCTIhWkN239CEJFXan5+HLimS8DzrKWW+UZpN8TRAA6IcyHal2030kngiAkZwZCdwzMbSyQeLLWM0l4qtbXWqO5VOLvWSK2KrpdmM83ME/UvWyoGMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHAszNO+uVo8ybfMqVDx1mXJkhyFnkLl03NurFvBoK8=;
 b=fPkOwT8oHR+9nhm3tu0eZJlXFQcBXhB98W6GooDTY7+E5DtKwrCa7cPjWm+GhvqfxDgSWdjZUV0JEb3do3e4GTLIHNqe2zJAnZbJymYsVE1w0k1VYY/SOuxPm8Hs/JBcWutQkItFPs9x7VNnhSS8rHovZY3MHEQqvDZ4XL9zmxw=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BYAPR12MB2726.namprd12.prod.outlook.com (2603:10b6:a03:66::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Mon, 4 Jan
 2021 21:16:12 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::c415:a6:f78f:82f5]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::c415:a6:f78f:82f5%6]) with mapi id 15.20.3676.035; Mon, 4 Jan 2021
 21:16:11 +0000
Subject: Re: [PATCH 1/2] drm/amd/display: Check plane scaling against format
 specific hw plane caps.
To: Mario Kleiner <mario.kleiner.de@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20201228185059.3949-1-mario.kleiner.de@gmail.com>
 <20201228185059.3949-2-mario.kleiner.de@gmail.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <ddc32eed-901b-e1c4-9719-d91e3ec01952@amd.com>
Date: Mon, 4 Jan 2021 16:16:08 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20201228185059.3949-2-mario.kleiner.de@gmail.com>
Content-Language: en-US
X-Originating-IP: [165.204.55.211]
X-ClientProxiedBy: YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::16) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.148.234] (165.204.55.211) by
 YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.19 via Frontend Transport; Mon, 4 Jan 2021 21:16:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 75c33d21-409d-4f3b-b258-08d8b0f5f660
X-MS-TrafficTypeDiagnostic: BYAPR12MB2726:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB2726A06C31FEE7344C847823ECD20@BYAPR12MB2726.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J+XQmaGBbIGXBntcPFityuhHElR27oxrqvcefHvQH4wUgihe87PYbs7gCF5Oq8Kxm0XHjhbTnleEo4bRPAxhH6kdYjUasBx6FVxhV3vTPvv2QHkrExhQuWCBB9nBBNgMbF5ehYeGq8UxN2gG34fYgZbO5ioKKbCvDpLCeT1ld34Pto7s01ZBjd2qq0n9pmLzWiYiPnpBLOlDBBKnb9hs+RZ1rmAVY4mEK2ruXE2NsAUa8ls1Fy2EYe+SjHiyIXceVP5FSn+1VM+v0oD2huZ5wIbahwYu//4h+OmHN4unyNMH5k5i5ssacEz74e001Pfhmu9sEPfl/hhc7d73Eb1dbd1fn5Z4u/Xfy8BK1LplkNQK13tt2ISEUhoqCP05GNYu6cuqwFHdB1q5Q/eM4Y5gv2DwTrKJlsms7fNkZ+UXFEqhu9uoKaItvR6bMg3J2HeG3FbfyeZB+Yx+4qJQDjijBvcj76Aug4CDlXq0APxolhU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(956004)(4326008)(31696002)(186003)(4001150100001)(36756003)(2616005)(66946007)(52116002)(31686004)(66556008)(66476007)(16526019)(8936002)(53546011)(316002)(16576012)(478600001)(8676002)(6486002)(26005)(86362001)(5660300002)(83380400001)(6666004)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QWdKK0FLZ24wa2JWdW5FUENIZ1ppQVRXYjdzb3NRS2s4ZlF0SGhkeTdNK1Mw?=
 =?utf-8?B?VHVDTDRWaTRCL3FaRktwUkw4dlJnNEpNQnRIS21ldkxVdHc3eDlkODhSWTRF?=
 =?utf-8?B?cGFIeEU4STdqV2hMMjRsdmdlb1VUbTVkSTQ4MU1FTkNldTZEME94K2padEtr?=
 =?utf-8?B?bzdlVEE3SnluMVhGUUdzTVp4U1dUcmRiQWwvaHVKc0N6TWthdTRzR2RnR05s?=
 =?utf-8?B?blpIY0xUdVBBRDZPdDRnWHBTcU5XQmhjcXVNcVBqcGlZQ1pMRXRiRmtqcnlJ?=
 =?utf-8?B?dUNtMTQvQ2JrZVVLU0FNNk9qUk5kTzdWN1RyK1E1ZlBnaUJxV1FyVFEzb1NT?=
 =?utf-8?B?V09DUnlTd3NlUDR1M1J4dkVyUC9VNjZ6NFFEb1pPU0hmSWZtV1ZDdkltTWl2?=
 =?utf-8?B?eVRFd0tHcHZkSUJlRFpKODRhTlpqUFZCQXpqYlZFUExNWGlRZzR2QVNEeEQz?=
 =?utf-8?B?eExDSHpZaGpJWXJZNlJWRyt1aFBRelhIWnBNR1FLeUxxay9wZWpPWUQ1czM1?=
 =?utf-8?B?bVR4MFZCd2ZTdGJkMExTemJNRlM0RzNUVVFldDd0VjZQNmZsUjYxb3JNRzlJ?=
 =?utf-8?B?LzhwT293VkJiSUFkYVlSaUJncnVDV0dva0YzZklWajg4cnFXbjc0YkgrQ1Mr?=
 =?utf-8?B?VExpeVl0SkovbnJ4MDJIenRWZ2pvanREbDdtbjl1Zy9JVkVzc3F0ODBnQ3Ay?=
 =?utf-8?B?ZEpRWlo1cEQ2UjM2aytLOTF3Z0Q2OFAvdHlSR2hyOWtySEpwRXNqdzd0RS9T?=
 =?utf-8?B?eHY5UlVBaE91TkhwVkJvekRkOEorVzI1MHMwanJNMkJJeTA5Zkt0RmtEMG1K?=
 =?utf-8?B?RGlkSVUyaGpOd0VqcTVoVWtUdDVDalIxRFNSbWs3KzgxclExR2hhdjFDMlhQ?=
 =?utf-8?B?V2tQRnpLYmNTSGNEZFRacEY1a3AxVFhmcDU3VjJPYjdaelM2aFdORVkzc1RG?=
 =?utf-8?B?VmQ2eE52S1BmSzlUNFlFUG5xOWRicVRXYk9qazdOaSs3azN5Q1F3Qm5lYS9y?=
 =?utf-8?B?ajJqSkJ2aDB2N1d6Q1dvTDJXcldId0JFeFR0TXRQSUx5UGxuN1JvRW9hYTNL?=
 =?utf-8?B?K0xKK1hwdjZwaTJhS2hnd21oOE4wNzdHQVBWQ2d1OUFkZWlkcjExbCtTcEMv?=
 =?utf-8?B?UEtqM0NrKy9IQ1BlNlZPV1ArV3QvemhZQU1RbnRYNmtJdUplV1cvSDA5MEE4?=
 =?utf-8?B?eHdvcXNka0pKUjVjNXc2clpueFlSeW9IYU93cEI4SUVCZkR5QlVCamthVnhn?=
 =?utf-8?B?dmZLV0kxZ0tUbUplakt2aXI1U1paL09Nd3o5VERFaXdiUVh1VCtYVno2UTZJ?=
 =?utf-8?Q?3ODQ6uKwVyzvcL4YnzI0NSNDXgaBJI9b7H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 21:16:11.8934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c33d21-409d-4f3b-b258-08d8b0f5f660
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RfYoK85Kti8mObWr5oChtk5PjNIpWsqNTeJGCI9IwqpD4vNR3CMYNBH8b1NgUO7vQyLUpbZtdqTStOxkzgCSmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2726
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
Cc: alexander.deucher@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-12-28 1:50 p.m., Mario Kleiner wrote:
> This takes hw constraints specific to pixel formats into account,
> e.g., the inability of older hw to scale fp16 format framebuffers.
> 
> It should now allow safely to enable fp16 formats also on DCE-8,
> DCE-10, DCE-11.0
> 
> Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

I think we're fine with equating all the planes as equal since we don't 
expose underlay support on DCE.

Regards,
Nicholas Kazlauskas

> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 81 +++++++++++++++++--
>   1 file changed, 73 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 2c4dbdeec46a..a3745cd8a459 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3759,10 +3759,53 @@ static const struct drm_encoder_funcs amdgpu_dm_encoder_funcs = {
>   };
>   
>   
> +static void get_min_max_dc_plane_scaling(struct drm_device *dev,
> +					 struct drm_framebuffer *fb,
> +					 int *min_downscale, int *max_upscale)
> +{
> +	struct amdgpu_device *adev = drm_to_adev(dev);
> +	struct dc *dc = adev->dm.dc;
> +	/* Caps for all supported planes are the same on DCE and DCN 1 - 3 */
> +	struct dc_plane_cap *plane_cap = &dc->caps.planes[0];
> +
> +	switch (fb->format->format) {
> +	case DRM_FORMAT_P010:
> +	case DRM_FORMAT_NV12:
> +	case DRM_FORMAT_NV21:
> +		*max_upscale = plane_cap->max_upscale_factor.nv12;
> +		*min_downscale = plane_cap->max_downscale_factor.nv12;
> +		break;
> +
> +	case DRM_FORMAT_XRGB16161616F:
> +	case DRM_FORMAT_ARGB16161616F:
> +	case DRM_FORMAT_XBGR16161616F:
> +	case DRM_FORMAT_ABGR16161616F:
> +		*max_upscale = plane_cap->max_upscale_factor.fp16;
> +		*min_downscale = plane_cap->max_downscale_factor.fp16;
> +		break;
> +
> +	default:
> +		*max_upscale = plane_cap->max_upscale_factor.argb8888;
> +		*min_downscale = plane_cap->max_downscale_factor.argb8888;
> +		break;
> +	}
> +
> +	/*
> +	 * A factor of 1 in the plane_cap means to not allow scaling, ie. use a
> +	 * scaling factor of 1.0 == 1000 units.
> +	 */
> +	if (*max_upscale == 1)
> +		*max_upscale = 1000;
> +
> +	if (*min_downscale == 1)
> +		*min_downscale = 1000;
> +}
> +
> +
>   static int fill_dc_scaling_info(const struct drm_plane_state *state,
>   				struct dc_scaling_info *scaling_info)
>   {
> -	int scale_w, scale_h;
> +	int scale_w, scale_h, min_downscale, max_upscale;
>   
>   	memset(scaling_info, 0, sizeof(*scaling_info));
>   
> @@ -3794,17 +3837,25 @@ static int fill_dc_scaling_info(const struct drm_plane_state *state,
>   	/* DRM doesn't specify clipping on destination output. */
>   	scaling_info->clip_rect = scaling_info->dst_rect;
>   
> -	/* TODO: Validate scaling per-format with DC plane caps */
> +	/* Validate scaling per-format with DC plane caps */
> +	if (state->plane && state->plane->dev && state->fb) {
> +		get_min_max_dc_plane_scaling(state->plane->dev, state->fb,
> +					     &min_downscale, &max_upscale);
> +	} else {
> +		min_downscale = 250;
> +		max_upscale = 16000;
> +	}
> +
>   	scale_w = scaling_info->dst_rect.width * 1000 /
>   		  scaling_info->src_rect.width;
>   
> -	if (scale_w < 250 || scale_w > 16000)
> +	if (scale_w < min_downscale || scale_w > max_upscale)
>   		return -EINVAL;
>   
>   	scale_h = scaling_info->dst_rect.height * 1000 /
>   		  scaling_info->src_rect.height;
>   
> -	if (scale_h < 250 || scale_h > 16000)
> +	if (scale_h < min_downscale || scale_h > max_upscale)
>   		return -EINVAL;
>   
>   	/*
> @@ -6424,12 +6475,26 @@ static void dm_plane_helper_cleanup_fb(struct drm_plane *plane,
>   static int dm_plane_helper_check_state(struct drm_plane_state *state,
>   				       struct drm_crtc_state *new_crtc_state)
>   {
> -	int max_downscale = 0;
> -	int max_upscale = INT_MAX;
> +	struct drm_framebuffer *fb = state->fb;
> +	int min_downscale, max_upscale;
> +	int min_scale = 0;
> +	int max_scale = INT_MAX;
> +
> +	/* Plane enabled? Get min/max allowed scaling factors from plane caps. */
> +	if (fb && state->crtc) {
> +		get_min_max_dc_plane_scaling(state->crtc->dev, fb,
> +					     &min_downscale, &max_upscale);
> +		/*
> +		 * Convert to drm convention: 16.16 fixed point, instead of dc's
> +		 * 1.0 == 1000. Also drm scaling is src/dst instead of dc's
> +		 * dst/src, so min_scale = 1.0 / max_upscale, etc.
> +		 */
> +		min_scale = (1000 << 16) / max_upscale;
> +		max_scale = (1000 << 16) / min_downscale;
> +	}
>   
> -	/* TODO: These should be checked against DC plane caps */
>   	return drm_atomic_helper_check_plane_state(
> -		state, new_crtc_state, max_downscale, max_upscale, true, true);
> +		state, new_crtc_state, min_scale, max_scale, true, true);
>   }
>   
>   static int dm_plane_atomic_check(struct drm_plane *plane,
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
