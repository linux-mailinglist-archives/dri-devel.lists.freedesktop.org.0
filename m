Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCFA4BBD91
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 17:32:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A51910F2E2;
	Fri, 18 Feb 2022 16:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10F210F2E2;
 Fri, 18 Feb 2022 16:32:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TICDcrbOcSyStsNsfSKAjMDl3yFuNvpckhBpz8pAvy8s3ss+KdFhuYG+8OdaC0YrmFD2H9KamgsoG/YY1Qs+9KntlNIjP5RlQHR6SMtPIG6fe4oKL4FjEhNsBhUf+o28AD5ZgGOsPkRnbz5j/sNpzM/90xg1CwP6r6PF0TlZHFDGlcNdIWsey+RYYLRzD1JcacH+b8P5d9s+RB2UKwE/VteBV8AYMtk5gDUL0EJFF9XscMGU6pjm7MR2ic2e9t0LXQtx/AuJCACNU3fhhLmlu9KINV80ZYM3Zlt3NHPqibOekkuROJr2OCZCmab6s5Wsl0iZt5Ec05j70HQNzJRkZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqj0bwuaonPmDUZx/zK0P+rN+SycqmYHYTwJ1mWBGk8=;
 b=jYbophevz+CgBwjExaiMhdJwPV89ZhTo8/5qnevbBEvul4T98o+LdgpJLMTwx7cnZDbsbfVFo7iTEcG847ck6Rusv2N3A5SrXpvvcSSGgGRXsYQF7uDyTxa0z6lH4bZY2YRF6sQP1k7UP17GX1BFjnGOB0jioTtSP13IKBdlM/vklz34Km4KuHHFQzm70EdEU9f/2SkxnBd2NFzEif905ty09BAvE3oV+hI8HWXdxeF2PyfGdO+TqrsFjV3fEnvxB8/QroNDPGEWokiFuoFfp+Q0XjFQYjkBAp+px4qo0+eSKW5KWoIHwV8CUiUKi9r1/20I+el0T0GdmK5qE0rBzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqj0bwuaonPmDUZx/zK0P+rN+SycqmYHYTwJ1mWBGk8=;
 b=VrUzqffx9fVKoCxwkPvJE4A8YlTwqS0bXrhIAYjzD0eg0asoMexVQtgXwx4+wmobXxIMGOIOl5X2oYbGDv5+mp2pMyIJTUF5V0BUuBzV5K6qB+mJqovtDrnqyrkDRKjbsPyD7d/XzBU4ao5ps5Nzhl/PDCxyuHaxJBTqIfnNFro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BN8PR12MB3140.namprd12.prod.outlook.com (2603:10b6:408:67::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 18 Feb
 2022 16:32:23 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3%4]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 16:32:23 +0000
Message-ID: <b3f6777d-7a0d-3109-9312-8059e6ba8e3a@amd.com>
Date: Fri, 18 Feb 2022 11:32:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 04/22] drm/amdgpu: Use drm_mode_copy()
Content-Language: en-US
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-5-ville.syrjala@linux.intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220218100403.7028-5-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0253.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::15) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ea49e09-312e-4fe7-be52-08d9f2fc3d8a
X-MS-TrafficTypeDiagnostic: BN8PR12MB3140:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB314076F6AB0CD4B0B0400BC08C379@BN8PR12MB3140.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m7B8zKYlJlgGh8BO2GbLp+bU+sRN2aAPYwbye+GSeRDzLqBSFlN0XFk6GyTHhf91lvo91Lr+9eEULlN18BqFdlGweA+WiJ2RTKdDMUW77s4Mav9G2MTf5eJjVE4/lHhcDDCMos4m4ugI2elNCa9EJw5UpbNQ4uyeeMBgSEGdApPEBdmL9ikEmMfMbsclfxnwj9liO/WZifYSMBRwiRDWREpDgsr3UQ+cENZPXS/YAWYG/nmybPotaZEUPwGc/X43An4IIo5xNLd+iMjr1Kg9S45gxtKTII0bwB2wlHIbkOLXBqnA0oTPNIieCcd7EIdzdsmkEhYizuwwIvDRFwK9DV7L1H0ulrb7I4RMvtUP2Vty9g9e38T7iZtthHw+DPUkGGi8eE+KAd8q45kisNYNplWbopR8+4CSi/GDXKAKerDzgRc1vHDymQUWJC7prhDZowSYCZxVPayziOli2vRoO9t3hAiztJLaTOvYTXfVpfJFmSSd9jQaOXAB/O0UkNqn5G3F79rzQtd98RgfQwKk4ilM6ZCtkX0ugRoqaiRq0LmC8Bk8kP9q3Wj6Sl+iEDVp6tRTOyfdG6MCN2YLKo5LLK5hUuEP8e5h+L0RKkm1kH33gHTVMZ2+/Z7i9/mFlK2gwRq0iI6NaPWmyZDAg7p2Cp+Ffq2N+ZjjvI+jcGt2UNHdQQh/9YoOAtwLbgVkMvgB2FNDsIN43xfbak1I5LcC6RiDTyHSw1yPeh0VfvCR5ntNWxEEwrYbdHgwGUx09CAZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(5660300002)(26005)(186003)(53546011)(8936002)(2906002)(83380400001)(6512007)(6666004)(44832011)(38100700002)(31686004)(66556008)(66476007)(66946007)(4326008)(8676002)(508600001)(54906003)(316002)(6486002)(31696002)(2616005)(36756003)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmhRNmhjWWFCY1FqYzZ6YXNaa3hWL0VqSHFhdlFsczhZUHdxMTM0bmtZVGpH?=
 =?utf-8?B?WUNMSGxIQmFlR2w2SXhjaFBEMVV6ejZteVArUmJ5c3NXa3hOc0pUckd0UzUw?=
 =?utf-8?B?VWYzN01SNU9sdjEyZ05MZzNmKzRFZVMzZ2JPTGdDQ1RkRVJ0WXZmV3ZMblRq?=
 =?utf-8?B?Ris1b2x4MlVOSkRRUGVtc2JZTWtnZ3R2ZmIwMys1WGpwTnJPRlBvYVhQMnp1?=
 =?utf-8?B?b3pzcWl2L0J6dXFyNDNka2Q2Rk5wTDllaDE5ZzU1RFpOank4Yll5bUxZcHhY?=
 =?utf-8?B?MjJwd2U1b1NoYTQ0NXkrTytnSEhkUXBXTytCOUs3Uy9KTitITGhmRVBsbnh5?=
 =?utf-8?B?bmpyb2QvUnd5U1Z6VEphZmplOW1sa2ZNNlU1R3hZcGZCR1BZWWJOUEFxNlpH?=
 =?utf-8?B?RGhuSGRiT3BZaklDUVNQbklXQVZkWkhRcEF1eCtkcUdxalc0d2tNYkRRM0ta?=
 =?utf-8?B?UlVyRVd4dld4eWQ2TDJKdVFJaWJWNVFHRFYxcFRHd3FEVjd1Vzdqdm1rTWdo?=
 =?utf-8?B?czRHaE9MTHpuajYxVWdjNXZiZzBESllscUR6TnFUMG53VGN6Wk5ydzhQMEdj?=
 =?utf-8?B?d3I2MURUSmhaeS9kTGFpQ0Z6WExEbW1ualA1MC9ONWEwSjFySnhmT3U5c1ZE?=
 =?utf-8?B?M2daL0d2Y3BkeElRYnhpOGM3V0Q2ZXZWQ0hqTnZvVUNKNktLMk9mT2VZajVa?=
 =?utf-8?B?c3Z0QXNtVnViNEcrR251aFFvRkRHNE52WS9CQXZqZzB1ZEJnQ1k4QjhrYm1k?=
 =?utf-8?B?bnY3a2thbnV6R2xrWHNadElRMmdCNTIwanV3T2N2WDE0aHV2N2s5c0lIM3Vx?=
 =?utf-8?B?MkJkdkNvR2h6NzBTcTNEV0krTnNoY0RhdzlOVWZjVlFDSENQRGFQYU01am5Y?=
 =?utf-8?B?bDZYQ2doLzRHd2ZQTzJFWGxpK2taZU1xVi9hQUg3TjJtS1FDL0ZNaHJwTk9i?=
 =?utf-8?B?d0tXc3JUb0ZjQ3dOdlJDNVRRaUNZLzhNYmZLTEl6djMzRHZ3bC9BZmlvNlRJ?=
 =?utf-8?B?bllaUE9pYVE0NGNUckI1T25MQmtVODZNbXJJdkxNd0ZCZitOdVYzeDBucGtJ?=
 =?utf-8?B?NWNZWHprTmJxbE5pYk5yWFJubmY0Q2JLREdrUFYwTUp4SVNlaVYyN3B4YTBQ?=
 =?utf-8?B?RS9sVHJPRzdrWXQwWU4vKy9yOHVOVHNoSERVeXhxNG9iR3hpdEtlY01WOGFP?=
 =?utf-8?B?Vnc3b3dpZ0Ezck4wdWNLbnZiYmplUlBsSjdTeldReGdUZkp5Vk1ZSS9IODIv?=
 =?utf-8?B?WG1mMEEyS05OYTl5TXNtQ1lsVFdsUGMvbXJ3eXJsOFJOMjJrSXQvY1pwSEhT?=
 =?utf-8?B?cHkvdkZ0OWVxdVd0VDRuelh2SGtuTHROMXdEaCtOSUw5THdUZ2N6TEY0M2ND?=
 =?utf-8?B?eTBrOHdYWTF6R2ZNdnRVUElXQ1JIc3lsRmQwODZwdmNDUXRwRGMxT09VcWZn?=
 =?utf-8?B?VTU1dmc0L0NWWloybU05VURTblUvQ0dkUHVTMnh3VFprVlFnV3pmWkRobmdD?=
 =?utf-8?B?TnROaXlRYlRDUEFQSVcvTkpnM0FhbkttUllmd2tYYStzc0JEcEdtUnNGVmY4?=
 =?utf-8?B?alBhNnhWUDhTT3F4bU0yQ3IvR1lTbVQrQnY2YTQ2dnhnaENDUHprYXFWdU40?=
 =?utf-8?B?eXlZYnhURm04REZmS2VjUzNBWmhUZlFVQkE3MU5MV3hLeDM2VmRjV0ZuQlVH?=
 =?utf-8?B?MVpyNGFWc09BbUQ1Qjdkai85cjBUV2hFbytXdDBYaXFRREZKVFk4anFpNmVC?=
 =?utf-8?B?NnJabm1VODRmOXVhTDBiTktWVG9GVVNaSlhqTWZQVnF1NjdrZ00vRGR0VGdk?=
 =?utf-8?B?NnErSFJYV1k2aG1DdkY4dmJtWVJHQ2dLaVNmZFh6bzlGdmp6c2xiU2xrZzZ4?=
 =?utf-8?B?UEw4R1I1Vmw5Y2Jld1JmeGxDYnpyMmRId2pmTkNrdFJHdldNL3g2ZmlybXBN?=
 =?utf-8?B?OHFIWHZ2V0F3bEVkcis5U2x2WHBxV3VSYjNOSERsVlIrbHBQSERldGZFUk10?=
 =?utf-8?B?MkFXMHNDM1huakxZSTdmeVhQL3B3eFlHZnRreHVwUk91MTMzcUNqVnB3SXNz?=
 =?utf-8?B?cm5JRnZCaVl5RmFwNzNDVEc2S3BLUkRFc0xVWEZyNFZrd200Nis4alRrajQr?=
 =?utf-8?B?YzRVd3VGNkpPRFBvWU15Y0RrV3V6SHlRbmQxQWx2SXFzaDBMSm1wWnpMY05Y?=
 =?utf-8?Q?miyysLFWI3jZydA7jW1Ks74=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea49e09-312e-4fe7-be52-08d9f2fc3d8a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 16:32:22.9562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 83M5ATXz9nbh6woWTwebF7Uwvr5JuXsvJWiUZgdfx8KeGiONcHBdIJZ8VLscB30RpDf5XiN/Ms8XiQoczizIwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3140
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
Cc: Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 intel-gfx@lists.freedesktop.org, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-02-18 05:03, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> struct drm_display_mode embeds a list head, so overwriting
> the full struct with another one will corrupt the list
> (if the destination mode is on a list). Use drm_mode_copy()
> instead which explicitly preserves the list head of
> the destination mode.
> 
> Even if we know the destination mode is not on any list
> using drm_mode_copy() seems decent as it sets a good
> example. Bad examples of not using it might eventually
> get copied into code where preserving the list head
> actually matters.
> 
> Obviously one case not covered here is when the mode
> itself is embedded in a larger structure and the whole
> structure is copied. But if we are careful when copying
> into modes embedded in structures I think we can be a
> little more reassured that bogus list heads haven't been
> propagated in.
> 
> @is_mode_copy@
> @@
> drm_mode_copy(...)
> {
> ...
> }
> 
> @depends on !is_mode_copy@
> struct drm_display_mode *mode;
> expression E, S;
> @@
> (
> - *mode = E
> + drm_mode_copy(mode, &E)
> |
> - memcpy(mode, E, S)
> + drm_mode_copy(mode, E)
> )
> 
> @depends on !is_mode_copy@
> struct drm_display_mode mode;
> expression E;
> @@
> (
> - mode = E
> + drm_mode_copy(&mode, &E)
> |
> - memcpy(&mode, E, S)
> + drm_mode_copy(&mode, E)
> )
> 
> @@
> struct drm_display_mode *mode;
> @@
> - &*mode
> + mode
> 
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c    | 4 ++--
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> index fa20261aa928..673078faa27a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> @@ -626,7 +626,7 @@ amdgpu_connector_fixup_lcd_native_mode(struct drm_encoder *encoder,
>  		if (mode->type & DRM_MODE_TYPE_PREFERRED) {
>  			if (mode->hdisplay != native_mode->hdisplay ||
>  			    mode->vdisplay != native_mode->vdisplay)
> -				memcpy(native_mode, mode, sizeof(*mode));
> +				drm_mode_copy(native_mode, mode);
>  		}
>  	}
>  
> @@ -635,7 +635,7 @@ amdgpu_connector_fixup_lcd_native_mode(struct drm_encoder *encoder,
>  		list_for_each_entry_safe(mode, t, &connector->probed_modes, head) {
>  			if (mode->hdisplay == native_mode->hdisplay &&
>  			    mode->vdisplay == native_mode->vdisplay) {
> -				*native_mode = *mode;
> +				drm_mode_copy(native_mode, mode);
>  				drm_mode_set_crtcinfo(native_mode, CRTC_INTERLACE_HALVE_V);
>  				DRM_DEBUG_KMS("Determined LVDS native mode details from EDID\n");
>  				break;
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index bd23c9e481eb..514280699ad5 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6318,7 +6318,7 @@ get_highest_refresh_rate_mode(struct amdgpu_dm_connector *aconnector,
>  		}
>  	}
>  
> -	aconnector->freesync_vid_base = *m_pref;
> +	drm_mode_copy(&aconnector->freesync_vid_base, m_pref);
>  	return m_pref;
>  }
>  
> @@ -6432,8 +6432,8 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
>  		recalculate_timing = is_freesync_video_mode(&mode, aconnector);
>  		if (recalculate_timing) {
>  			freesync_mode = get_highest_refresh_rate_mode(aconnector, false);
> -			saved_mode = mode;
> -			mode = *freesync_mode;
> +			drm_mode_copy(&saved_mode, &mode);
> +			drm_mode_copy(&mode, freesync_mode);
>  		} else {
>  			decide_crtc_timing_for_drm_display_mode(
>  				&mode, preferred_mode, scale);

