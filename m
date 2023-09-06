Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281F4794307
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 20:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B90010E6F6;
	Wed,  6 Sep 2023 18:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2931510E6F6;
 Wed,  6 Sep 2023 18:28:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDAuFMnaPpuB+Jpdb46VBYhZkFB0siOV0MJAqc40t/JAYKitplSASRfS8yvSLqOifLkhOr0TLUwnlOlY3/BQegwWY/S/Pz1XSIp/xDYbQH3YckWLaaRm44d80ulwZn8FAgJsUHL6snJ/iA6ZgKNG+sILQH1Nom5KOa7TVely5EF4WD3ji4EPq9YP2ru8s2+Ate4rD8Yco3BRca2mHWEeqUHMz1Adt1dFQmcBim6hgX6gcEN4PBL0MkBdQEKjQTENXxo8RY/ff3F8CGIfXVgAPHHLu7IFoOgsTZ6oEg7/7vNjxyJBpRRY4ZW+0/NRk2f/fWO/AqQ5tAsFZM5xokwzdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJdD62HtomrYZPoSGq5MxBj+slacvvCZ/IdlFKZ7O9c=;
 b=CScUx6O3m4PQuUSnRXXyu2R0J2gTSjm1i3Gv4z0MkG9R6USAaLSV/M0ac/8JGupEjazog8j2oiKCkElZI0kX+VP0B6eO+Uu601n/iCOmpAAzD5wAdyOojx8+T3ptVKe/F0G+7Iy7vS3Te73qJLps2BI5AfEui785SaHGY8GpvaRA4+Vd+oYvVM7qvR+0XaCNfZ2AjMKy+s6wUXfMxk1XCPr8xiLE5nJ4BjqlNnE+yZ54Kk2GMuaQBQ628xFjFbUVzYSIS8Vf8foBcokJjJ2fxyd0gWtoM5BPu6MZoqz326C/Le/2pbZxQa5cjCEf5n8LxjPVlBzeEf4kZq3dMMe0jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJdD62HtomrYZPoSGq5MxBj+slacvvCZ/IdlFKZ7O9c=;
 b=KdAApKIGkkQZI7ojc5PGxzUx7THpY7qNqlawM6NDllgL6Y6jrkssB8EgUuUkCsCx7vB6I6huiWP/H/Eb99Bnd7HI1xykNpqTLAYbx4WkIGj7ZEEcYW8qRuR3PDdfEf14T1cppW0i2drCW5YWE4egkM2iSaJOMS4IBW/0AI2TXJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH7PR12MB5901.namprd12.prod.outlook.com (2603:10b6:510:1d5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 18:28:16 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 18:28:15 +0000
Message-ID: <4e94e9a2-89d0-4f87-9dac-795f1135242c@amd.com>
Date: Wed, 6 Sep 2023 14:28:10 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 34/34] drm/amd/display: Use 3x4 CTM for plane CTM
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-35-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230810160314.48225-35-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0131.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::28) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH7PR12MB5901:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e972e7b-1df2-4e51-589b-08dbaf070922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zcR4i9XHFiQghtuSHGm3lN5fgh4Jgej9uIMg03HtIKvqfyuQuuapKc7b32j47iYRE34EdCKAev5zD6VQw++34F6TrFV+PH2B9extDrqrOi279YcayT1rlaagdcN4vTkEBe1rhguyyeq9R+HHlbLUJyanaaRA5HOdN8XGM6QLE/pYc22t82i+nKxbcRqs1nB5TRfFhXgo0+C2JvKSFkMwW9suqM37sEcwtHJlIaKOzfMpXNflyYaT9MQC9mhXLg3yVQTArUPPb58gMdPFlfEaPE449WJfUOetZH0LAQC3u96Z742mBP/+ydklMhYcZyEQ5TG9VVuyEn9GxY1sf4wESD/UI5qfjPquQC0xCKD3o+zm7chDV3g1glq2HDBzHLEJ0gMGcD38tFgO2ZcoOSMnLQvHP1M335Fn2x2FzpI1pBxr4PlejRUu4kvtYaV8Xa+TgmHfuQWxYUKcY4crK+o3yoFIdxNfM41UKkhDPnsdexomPNflSNa1MxxL3NE6/6PuzDh9PxkZlB7bgNkURCMvwBp/eAWRSWXbNIb3S9AnD7R4la53yN5omjuGKNYj1X1Z+UBEYBJJhraxGpGBkNesjRGcnP3GhTRsatqBnw4bj1Yxl2u9gx+V/QpqjM51xtSWRNzuH8lWKnm9mngyYBPTXWQsPrMfm9ot+uv5c8qaZx0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(366004)(376002)(396003)(186009)(451199024)(1800799009)(31696002)(86362001)(7416002)(478600001)(54906003)(66946007)(66556008)(66476007)(316002)(2906002)(36756003)(110136005)(41300700001)(5660300002)(8936002)(8676002)(6512007)(4326008)(6486002)(53546011)(6506007)(31686004)(26005)(44832011)(2616005)(83380400001)(921005)(6666004)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzRPYzJ3Rm91TS9hazZzZk91dlFYSjE4UmFKTWcwNTdqcTVtanFZekNFMjhB?=
 =?utf-8?B?VThmQjNuZmxuWGVPZ1ZHWkJkNit4Y2ttS0dNY3hUZUJwQ0lOdHdpTG83SjEx?=
 =?utf-8?B?NStOQkRmOEFoSSs3anI2TVB1REdlV2lmTWpLUzJJYXFWZWpJZk92TXJUUTBG?=
 =?utf-8?B?WnpHdFBPSndiUXArcWxPeFd5T1RtSkhaNnF0c1ZqNG5xSXdnWUxHMHQxKzV0?=
 =?utf-8?B?eDB0dEd0dmdkV3BFRmFaTGVZUzdVc1ZwTU5IQnR4NlVIRnNkV3pUM2JNbVVw?=
 =?utf-8?B?OThSS1FGVEJsOW9qeExKRnpzMXpuUkQvdys5RmNjZEZLK0J1YTAvWDNhZC93?=
 =?utf-8?B?ajhlZmMzV016UUNFci9RQU9sd0NlZndnY05UeGQ3Vjhmc3o5TFU1dXpjKy8r?=
 =?utf-8?B?MFNtalNFVWY3eTUzakNPeUtPRStXMG5iSXNRUWxHQzlhRDNKWkpTUTBJMmR0?=
 =?utf-8?B?azJydlJwWE1RbXVGZHE0L0c3NU1vazcxcm1CQXFQeitEQVkvNWsrbXlYQkxa?=
 =?utf-8?B?bWJOZms1RER2QXh2clErM1JDZEFmVkxWVnc5akszWXVRbVRWZHlJSWFWc0Yx?=
 =?utf-8?B?UFZ4NHlibkloQTREYVd4dTFobjFVUnlnNFp0d3djaWErTzlSTVRLdWloUzVl?=
 =?utf-8?B?dGlxcTZidEFaZTR2VnR1QWkzVlJTWDRxcEtRRTVGODNFd2h2UGZZRFdtemx2?=
 =?utf-8?B?cFRxdUtQSUt2VTdKV1JrandEalNKNi91Y3pyLzhYQ0lQQXp1TG93eVRLNENH?=
 =?utf-8?B?NXFCVm5VbVdSaGZaYWhHTUo2WnQ2SklWbXhUZnl4NmYxL3luS3BiRW4wU2dK?=
 =?utf-8?B?MnBtbWs4MkZNaXlsR0I0blVtb0Rnenlmb01zNDZIMVp2cEZvam5DU3NYdlpG?=
 =?utf-8?B?MVl4USs4MmpPY2xzWGdxNjBJZ21IZVZFZER1MFUybmZxUGZRVElRZURWVXI0?=
 =?utf-8?B?a0dUckNZSkszK0o4bjhjR05DcGtkNUFRdUtVbEQ5T0h1NjR0MjVvWTJONTd2?=
 =?utf-8?B?RkMrR0ozeklwaTdVZ2xDQ3Q5UWpGeHBTNUtueW8yNTd5MGh4eElqcXQwL2dR?=
 =?utf-8?B?RmJGNC9YellNc0M3L0JRNml4UFFidXB4RjRlYitnR2w2MDJSQXVwNFNITGJp?=
 =?utf-8?B?dkFKa3phNGkvWFUvY2dDV09mQ2hDOU9CTjY2N1NFYUxzaG9HeW9JcENrRTNU?=
 =?utf-8?B?cTArRTFZbjQrK2Q4c01NbUJPaWdOOGlCNVh2QXhrTmhQZm5rcXZtWXZkV0hO?=
 =?utf-8?B?TksyNEZWYjl1dUJyZWlnMXF2YW5UK255RDU5V0lSdW8ra1RGd0p5L0daWm9G?=
 =?utf-8?B?RFFES01yeFFDeTVRbm5KeWYrOHJ5ZDRNRWxHVUgyZXJNZ21uakpkNzFVTlRa?=
 =?utf-8?B?VG9VMEVLZHRRbjF4OHhMYklwVTNPbFFNdVNnSEFWK1F3eWdBMmFQbkNaTENY?=
 =?utf-8?B?VzhUL0N2aTdkYVVBbGwweUh4dnZ2NjNpRDh5elNUL0ZCcGJPY3QvSlFraFM1?=
 =?utf-8?B?WW1NY2RGVUtMQ3hEVU5vcFJsVWd4Z2FDeE1qWm51bURlRVRzenE1dlNqUzh4?=
 =?utf-8?B?ZUdvRDM1aldySUZtQWxKaU5EUHBmeEVPbDNNckd4QnFBSUIxaXNYUkt3QU01?=
 =?utf-8?B?ak1sM2NFWFBmcldzc3hpYWxyd2IyU2FRRStGWkY4TGFvS1prZTBkMm1IRVFq?=
 =?utf-8?B?THp6eW5helNVSjlNcTVzYytsY0FXY1QvOVArWG9BeUthSlRBUFJiQWxrYlcw?=
 =?utf-8?B?Z3l5cjhzRXBRbkM2Y2NxdksxRFExUmlRSDczQ1JNc253cWtyanZoN2ZtMUxG?=
 =?utf-8?B?QlBlUzJwaS9sZHd4NzA5VnZ5UzB1dEhMSi9TOWdYVTdSdWpSK0VRSFA3L2VG?=
 =?utf-8?B?R2xpRDdsdXBZOG4zcnBKajhqZzduUGFic0Y1V3Nsc1NDT2RucFQ0d1l2a0h4?=
 =?utf-8?B?dy91RS95OVNNQ1I1cjdGT0dPbXhJcmJTQTA1ZHlONXFOWVloR2pWN085Tjds?=
 =?utf-8?B?MnpRNFlGUkc2ZkZhb0lwUnBzR1JmdUpCZ0tpbWdnTlRVazd5bU1vL1FtRldG?=
 =?utf-8?B?elZWSnhMY3V3cXowcXExcTIzY0IwSUk0MmpVKzFyTy9oK2tvRlpkbUpQUzVv?=
 =?utf-8?Q?VPN+Gq8l4hNMBNTHY9XS6XB+i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e972e7b-1df2-4e51-589b-08dbaf070922
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 18:28:15.8055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vvF6QD5NrSMfCCrrnwJtzKok8tA+1zXtheh9ZZ2JuXWdhfwIV6oQ5kVQXs9xkU2ZvSIGgK0FwXRgfLkpgLLFWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5901
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
> From: Joshua Ashton <joshua@froggi.es>
> 
> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 32 +++++++++++++++++--
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  2 +-
>  include/uapi/drm/drm_mode.h                   |  8 +++++
>  3 files changed, 38 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 7ff329101fd4..0a51af44efd5 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -412,6 +412,32 @@ static void __drm_ctm_to_dc_matrix(const struct drm_color_ctm *ctm,
>  	}
>  }
>  
> +/**
> + * __drm_ctm2_to_dc_matrix - converts a DRM CTM2 to a DC CSC float matrix
> + * @ctm: DRM color transformation matrix
> + * @matrix: DC CSC float matrix
> + *
> + * The matrix needs to be a 3x4 (12 entry) matrix.
> + */
> +static void __drm_ctm2_to_dc_matrix(const struct drm_color_ctm2 *ctm,
> +				   struct fixed31_32 *matrix)
> +{
> +	int i;
> +
> +	/*
> +	 * DRM gives a 3x3 matrix, but DC wants 3x4. Assuming we're operating
> +	 * with homogeneous coordinates, augment the matrix with 0's.
> +	 *

Left-over copy-paste comment. This version takes 3x4 as input param.

> +	 * The format provided is S31.32, using signed-magnitude representation.
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
> @@ -1159,7 +1185,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  {
>  	struct amdgpu_device *adev = drm_to_adev(crtc->base.state->dev);
>  	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
> -	struct drm_color_ctm *ctm = NULL;
> +	struct drm_color_ctm2 *ctm = NULL;
>  	struct dc_color_caps *color_caps = NULL;
>  	bool has_crtc_cm_degamma;
>  	int ret;
> @@ -1213,7 +1239,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  
>  	/* Setup CRTC CTM. */
>  	if (dm_plane_state->ctm) {
> -		ctm = (struct drm_color_ctm *)dm_plane_state->ctm->data;
> +		ctm = (struct drm_color_ctm2 *)dm_plane_state->ctm->data;
>  
>  		/*
>  		 * So far, if we have both plane and CRTC CTM, plane CTM takes
> @@ -1224,7 +1250,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  		 * provide support for both DPP and MPC matrix at the same
>  		 * time.
>  		 */
> -		__drm_ctm_to_dc_matrix(ctm, dc_plane_state->gamut_remap_matrix.matrix);
> +		__drm_ctm2_to_dc_matrix(ctm, dc_plane_state->gamut_remap_matrix.matrix);
>  
>  		dc_plane_state->gamut_remap_matrix.enable_remap = true;
>  		dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 0b1081c690cb..27962a3d30f5 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1543,7 +1543,7 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
>  		ret = drm_property_replace_blob_from_id(plane->dev,
>  							&dm_plane_state->ctm,
>  							val,
> -							sizeof(struct drm_color_ctm), -1,
> +							sizeof(struct drm_color_ctm2), -1,

We need to update the comment for dm_plane_state.ctm in amdgpu_dm.h
to specify the property is of type drm_color_ctm2 (or drm_color_ctm_3x4).

>  							&replaced);
>  		dm_plane_state->base.color_mgmt_changed |= replaced;
>  		return ret;
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 46becedf5b2f..402288133e4c 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -838,6 +838,14 @@ struct drm_color_ctm {
>  	__u64 matrix[9];
>  };
>  
> +struct drm_color_ctm2 {

Calling this drm_color_ctm_3x4 might be good to make it clear this is
for a 3x4 matrix.

Harry

> +	/*
> +	 * Conversion matrix in S31.32 sign-magnitude
> +	 * (not two's complement!) format.
> +	 */
> +	__u64 matrix[12];
> +};
> +
>  struct drm_color_lut {
>  	/*
>  	 * Values are mapped linearly to 0.0 - 1.0 range, with 0x0 == 0.0 and

