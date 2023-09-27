Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A67217B0C3D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 20:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0DFD10E59E;
	Wed, 27 Sep 2023 18:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6583210E59D;
 Wed, 27 Sep 2023 18:54:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fw3TXD2vPRz2vmqoNjaLPmTj4z1vom7tzu5RVDI0fklq32pcfn+Skn74AXPlFGVxXedYUGxFqj9XQsJej+qMmXZmUxh+XWNrqe7kurU/v4dlyJLyqns16B5orkayi90zibilt8qQCtRplZzUKwTcPd5wwswUrT3sxI+/O9+OLHI6JQIuHYg1ITUhBcWPxPNtd5VO5h7w2YKLuqScH4e2/iL6eBkUlkmXkmpbkWmBB9gAaK7hghy3lImKbzzfGZy79frY0qSgY9WK0bcBmK0POqMkQK3HoKOPOG2NLNYLaLG9sNaxv+rWl2ZM1Xa7zTueTIFaZeAiKoJRE87JRNll1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+QPfUyiWEjpn5NAgrahyCAG6f0NOoexkXufL6y2Jnt4=;
 b=GnHdLrtnkUkiu86pBhTM/nTnzzdDZlA3Us+1Xo98kP3k+Qbhs+FRJhwZl7SGPGf5jcDdWsuHmluv+WxXWqeN4Lm56togI6Y/Lv19Fsz8w/PwudJJMiHLPt0Dgtpaj7yOSjfyianRzDEvfkpJJwnhYkv2eTaCMUYjxHNrJgUFih1cfw7VIMLws/dB/0z6epsnO/5JInU2rM4vsdmZQoPoRBrbyRfA4mS/cqsZLfWFI3KEPnf6e7vC03KW0Wb/znyZCGyU5U731v4yQbVcJrL8s/YiwQAAEhaM5YeO1eRamjzYl9pdRuCIjAJ0CJekQXCzssJjM0c8+wxa9HGfOdlrUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QPfUyiWEjpn5NAgrahyCAG6f0NOoexkXufL6y2Jnt4=;
 b=hxbaPG7JspEasGFv8pMl/3mIXTzAtz9i9lJ5JUWaZ1CwwZRcQtZa6a5lgmGYCWAO75OD1MjFIsLq6JTFCBhpqeIcoCKMf7ICUqoL5Nr6gYO6KywvKnIJt5jyXQyBMCdxG5GhI707iXSeLrBvS4ntim85vovjde4v9D7e2kEXruk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BY5PR12MB4193.namprd12.prod.outlook.com (2603:10b6:a03:20c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Wed, 27 Sep
 2023 18:54:00 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6813.018; Wed, 27 Sep 2023
 18:54:00 +0000
Message-ID: <3184bf80-9916-4648-b044-97e57a191e78@amd.com>
Date: Wed, 27 Sep 2023 14:53:57 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 32/32] drm/amd/display: Add 3x4 CTM support for plane
 CTM
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de
References: <20230925194932.1329483-1-mwen@igalia.com>
 <20230925194932.1329483-33-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230925194932.1329483-33-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXP288CA0003.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::14) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BY5PR12MB4193:EE_
X-MS-Office365-Filtering-Correlation-Id: 51ebd672-c12d-4664-9392-08dbbf8b1c74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GfkaN0Pt8hRyC9OS52VZta6aUmlNGPuumhZsPcVdYWGmH/7fs0VNGgt13EjxOgH8oGJbpvzdqQDbJYbXBTXvRHeVpjdnKNm6e6psH4IXcusZmoe6ii7+KqVimWtu8WnEmiifTTVoOeHdTYWAtedetPBPK2lWuAcr/xeNNzDv1DHQDI1PyMc2XwyXEVqo/wumedU+kxTmki3+nliMaKAW7gZBRsqQG6TtN2rIFGlGLZRAbwnf2xqElLyJ2i3BvNszX2lkNz45S6tWiUAIN22GNW5pGyD+WneC/YsQ0U1vGyrlB8WBh+1FLLkKwPxnM+KwhJqXVbak16q4QmNxU7XrxcIdcsKHLyqCh2qXfluBB8AIUo+DZ6hFjDQmvArVrJso1bU114dR1o0bZvSP6MLN3fWw+O48XK6ALlx4N/aW3m+O8e1PwAGVCFIwOKDTiNwloAChie8/8HnPS3LAOlN4ToiPBAxavWNeGnYd7Zi9mkH0G4n8L1xvjw1IEsYOVedeQkEnoxtm5hYUeD4dH52HTZR87OREcwOhTWahYyGAB5/0nL2VMxBEuHtrM9eqPA4JOxpO2Fo0S3omCrG/u0bukNlVXCSkztA8rLc6lWPC7NzG8teiZRe7LTDgV+QcyreVFem6vHEmGlIatJYwVfKjppraAK2rALdh44bAUMvzfiM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(366004)(376002)(346002)(230922051799003)(451199024)(1800799009)(186009)(41300700001)(2906002)(83380400001)(86362001)(2616005)(6666004)(478600001)(6486002)(6506007)(921005)(36756003)(38100700002)(6512007)(53546011)(316002)(54906003)(26005)(66476007)(66556008)(31696002)(66946007)(110136005)(4326008)(8936002)(8676002)(7416002)(31686004)(5660300002)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1ZTckxpSS9QQ1dnckRrTitoNDlMZEs2dThPQ0pTYTUvY0pUQXduSUt0dlBq?=
 =?utf-8?B?bERNSUI0L2dpMjlmb1NMZWhGMmlOYlAyZHdwUk5laHFmTFdZVVlFcjR4Zk5D?=
 =?utf-8?B?QlZkR0RXbC9TSWd2KzlHL3FZV1FVRzlrYjlxS09FY2pWYzhYUXRscG9pSjhC?=
 =?utf-8?B?b1BuU2kwMjQvUGFNenU5SGNTOHUrVnVmOGxXR0RVbElrNGtaN3BkdUkxVHBU?=
 =?utf-8?B?T2Z0cnowdU1uWVorTGRjWWZNQ1Y0eTZOSFBaNU03TEVpUmpadWZ1aVdndmlB?=
 =?utf-8?B?MmU1OEkvWlNmUlBXRnM5VVcvMFljZjFmVHBZOTJ4UTJIeSt1ZTM1OGU5UXly?=
 =?utf-8?B?Z2p1MmtrU1JNcFFuR2lTNFh0VXE4ZCtMdVRvOVBnUTRKdk9CV0VlRG1YYUhR?=
 =?utf-8?B?eCtWcytJczVQMFlFbUlmNDJPTDBudFhaQ1M2YVowaUNPSUNKQzRZc29VN3Q1?=
 =?utf-8?B?R2NsaTBjV2dJdUtrbHZidEh4SDd4elZGWU9ZOVZGUGxsZFhEQmdEa1hzVHd4?=
 =?utf-8?B?eXQ4T3Z1Smk0dUEvZFZ0VkZTSlRjbjdnbkEvdktRNjZXTUdicURrUDh1Tmkx?=
 =?utf-8?B?d3hWN1NaWHp4Q2FqQmJ3ZWd2cm03SU0rSWwzaFBkOEJydTJoMEhpKzN5SE53?=
 =?utf-8?B?K01LY1Vpems3QlhmRzAzdXI2MVBBUXh5OGlNVG94WjlUdlQ0d2NJcFB5ZUxl?=
 =?utf-8?B?ekpJNlNUcERhbFlCbCszcWlHWWtaTjQ2OG1CKzVJM2JHM250SXRlOEJDcDBj?=
 =?utf-8?B?ZU9XTGMvWWNxdE5qWk1RaUFPb3gvc1VOcHVBSkc5QktRSWovc21tZ3J5OExI?=
 =?utf-8?B?ajZKSzBJMHhaUGRvNExlcXhWYVpoUXc5MUQ4aXRsamFnSno4S3FQb01USzhH?=
 =?utf-8?B?eU5ZV3UxK1NCZ1Z4VitVS0ZBeDQwK1FIRXdsenV6VXBMTFIzQThmTjhiSEpH?=
 =?utf-8?B?STMwZHA2b09tcXZ2SldSbDVvSE9ySWNaakdDM1BhSmtjdlhRSk9FZnlyRjBQ?=
 =?utf-8?B?Zjh1a0tZV0QvNThMb0xVOHFVeVpYeEk1WW9vYjYyREpyYmI1WkNoVVFRZjI5?=
 =?utf-8?B?WDFBOGRIVVF3ZnByeTBtaGZ0YzIxUVE3L0NMTXRkVGhNV08rQ1hESHoxTVEx?=
 =?utf-8?B?N3BtMVVpUUpweTlOclJHenJEUWlFa21sNzRqc2l6TTlaTTlKWkRXNE8wWWwr?=
 =?utf-8?B?dUJPeHdNYWg0K2wvMnhsd09uQnlQeWtpR1dwa1ZEdENSTTNVdElUQk1ndUNi?=
 =?utf-8?B?K200WllLcHc2aFhOL0lIU3Yva1l6WjA2eEFTeFNLWjNIYSsrZ3NwcmxvTjd1?=
 =?utf-8?B?R2orT3JiSjNhOHBiZUJvZzFXdjR0Ym1PTW1rbU5ZMmpkeUhjeDQySnZMQlBr?=
 =?utf-8?B?eGVTVlo1YzJZWklkUHhlRGFzUi9CNHJyREdnd2lRVWtIQjRtSS94ckt6SDBI?=
 =?utf-8?B?dkhRQ1NpKzZoanhDMG9mUDNHTytDVEJGTkprODZiVXdHTmp5N1lZaGs2aUN1?=
 =?utf-8?B?aFBndHdhNWN5VVpVcHI2NG80SFZHWDdxY1hYUE56UHpHL0pJQUV0WHB5QXIy?=
 =?utf-8?B?RWF3dUh2Y283a2dHOHczYUVrdTJXTDZMNW9xS09XWlJwSUdmdnBDTEtjS3Zn?=
 =?utf-8?B?SkRqL1VrU0RaR1Y5RmNJY3k0dDYyVkxabTZJS3pwN21DcnppekIwNHlkNEIr?=
 =?utf-8?B?S0s0T2dydWI4N0N3MldFVXRZb09NZEpWQmJCVnhDRUhaNjJIdStaTmhFa0xu?=
 =?utf-8?B?dHh6d1kxd3RlbVJSRWZzSEhoWTh2TlVlK3p5aVJIQkNtOXVvZlFVMzlGTGtY?=
 =?utf-8?B?ZmNHQUh0QWljM1gzb0xyWVRYdndBNi9XZjNaTVdvb0VIL09Od2s5SHlmeDI5?=
 =?utf-8?B?TURDNVNmeldYdmw0UGdsRWYvNGFSektvcWtCeVQ3T09VZzgxeTg4TTFSU0My?=
 =?utf-8?B?Y0RvZmhJTHVMTHNFYTNDTGlWYjcvTjBQRm9qclBVTFRqMks1eDhnR25rcld5?=
 =?utf-8?B?UHlIaWFIdTRiaUFHZm5oK2hTN21vWlN4Mi82WkRxSlFOZlVaWWFlUXM2VFVS?=
 =?utf-8?B?dk0wcnF6WW5YSFlwVjFlMHJhZHJEa21xMy9RNlRnQXZYeU8wOHd0RjEvK3hG?=
 =?utf-8?Q?ZFofwggP7WUuFQvYQ9Dntn2E3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ebd672-c12d-4664-9392-08dbbf8b1c74
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 18:54:00.3161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aldN4f+d7fcRJ3lb7JGfZ6dxUy8w2Q57OXFtmr/DgnQItW7Wo6+WINN3yjq0TMwufzd7ijTAHW5kSzryNfjn8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4193
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



On 2023-09-25 15:49, Melissa Wen wrote:
> From: Joshua Ashton <joshua@froggi.es>
> 
> Create drm_color_ctm_3x4 to support 3x4-dimension plane CTM matrix and
> convert DRM CTM to DC CSC float matrix.
> 
> v3:
> - rename ctm2 to ctm_3x4 (Harry)
> 
> Signed-off-by: Joshua Ashton <joshua@froggi.es>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 28 +++++++++++++++++--
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  2 +-
>  include/uapi/drm/drm_mode.h                   |  8 ++++++
>  3 files changed, 34 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 944dccd483de..774a83a9dee7 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -410,6 +410,28 @@ static void __drm_ctm_to_dc_matrix(const struct drm_color_ctm *ctm,
>  	}
>  }
>  
> +/**
> + * __drm_ctm_3x4_to_dc_matrix - converts a DRM CTM 3x4 to a DC CSC float matrix
> + * @ctm: DRM color transformation matrix with 3x4 dimensions
> + * @matrix: DC CSC float matrix
> + *
> + * The matrix needs to be a 3x4 (12 entry) matrix.
> + */
> +static void __drm_ctm_3x4_to_dc_matrix(const struct drm_color_ctm_3x4 *ctm,
> +				       struct fixed31_32 *matrix)
> +{
> +	int i;
> +
> +	/* The format provided is S31.32, using signed-magnitude representation.
> +	 * Our fixed31_32 is also S31.32, but is using 2's complement. We have
> +	 * to convert from signed-magnitude to 2's complement.
> +	 */
> +	for (i = 0; i < 12; i++) {
> +		/* gamut_remap_matrix[i] = ctm[i - floor(i/4)] */
> +		matrix[i] = dc_fixpt_from_s3132(ctm->matrix[i]);
> +	}
> +}
> +
>  /**
>   * __set_legacy_tf - Calculates the legacy transfer function
>   * @func: transfer function
> @@ -1154,7 +1176,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  {
>  	struct amdgpu_device *adev = drm_to_adev(crtc->base.state->dev);
>  	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
> -	struct drm_color_ctm *ctm = NULL;
> +	struct drm_color_ctm_3x4 *ctm = NULL;
>  	struct dc_color_caps *color_caps = NULL;
>  	bool has_crtc_cm_degamma;
>  	int ret;
> @@ -1208,7 +1230,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  
>  	/* Setup CRTC CTM. */
>  	if (dm_plane_state->ctm) {
> -		ctm = (struct drm_color_ctm *)dm_plane_state->ctm->data;
> +		ctm = (struct drm_color_ctm_3x4 *)dm_plane_state->ctm->data;
>  		/* DCN2 and older don't support both pre-blending and
>  		 * post-blending gamut remap. For this HW family, if we have
>  		 * the plane and CRTC CTMs simultaneously, CRTC CTM takes
> @@ -1219,7 +1241,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  		 * mapping CRTC CTM to MPC and keeping plane CTM setup at DPP,
>  		 * as it's done by dcn30_program_gamut_remap().
>  		 */
> -		__drm_ctm_to_dc_matrix(ctm, dc_plane_state->gamut_remap_matrix.matrix);
> +		__drm_ctm_3x4_to_dc_matrix(ctm, dc_plane_state->gamut_remap_matrix.matrix);
>  
>  		dc_plane_state->gamut_remap_matrix.enable_remap = true;
>  		dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 98501f5044c2..a1f087b0f7e5 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1551,7 +1551,7 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
>  		ret = drm_property_replace_blob_from_id(plane->dev,
>  							&dm_plane_state->ctm,
>  							val,
> -							sizeof(struct drm_color_ctm), -1,
> +							sizeof(struct drm_color_ctm_3x4), -1,
>  							&replaced);
>  		dm_plane_state->base.color_mgmt_changed |= replaced;
>  		return ret;
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 46becedf5b2f..a811d24e8ed5 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -838,6 +838,14 @@ struct drm_color_ctm {
>  	__u64 matrix[9];
>  };
>  
> +struct drm_color_ctm_3x4 {
> +	/*
> +	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
> +	 * (not two's complement!) format.
> +	 */
> +	__u64 matrix[12];
> +};
> +
>  struct drm_color_lut {
>  	/*
>  	 * Values are mapped linearly to 0.0 - 1.0 range, with 0x0 == 0.0 and

