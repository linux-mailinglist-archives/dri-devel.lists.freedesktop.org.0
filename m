Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C7F7B0C28
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 20:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A70410E592;
	Wed, 27 Sep 2023 18:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0435A10E592;
 Wed, 27 Sep 2023 18:47:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jk6PEWDk907ZUk8KjRiNZej6ZFcPcaKQ3PbitofkclCwcXa58o9tociiwuBr5Obceo8PIKP6JYZ1yCPwSN8TLdPADfkMoBZIsWIiLwMqvnIdw5fJne4qZCUPRTosxkg6/EI00yRnz5nqTUODYZ2fcx8hTsEslrx9dqvoSfnztCFZ5CCnpSF/nFA+m6DPbc6fsivnic+e0YbsKc6G1oiv0KrTlmIHTAEmsY8y4DD6pRwgAr8pHzwO1gCxkrJlHngW43oq8KpIEzVGn/7CdkLXFc3jhG4snStAi7UK5/hBEdduUHDBomQ1oP2txHArQwiSTYFqkSl9Faoff9DYznSdLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dLrdA1WqcNxGCr3LMwZWUSb3XkjasYAbnHfIXJzxp8=;
 b=ScP9HomNepaHGKjUpcdeGh18rWQiuF4/7Ak4DXCzS9o8+0Hawe8fm3qOODsFnoRcu3oc6VHkS+u/EH2xbdbWgiAPgKNgTaQdVVFPudizo8xndysFCjGh2goRjilIrSdVoQR++6ne35cs6SqxIc+MGyMwgWEo6ZNwCSPFTnm9h+m40nl+0f4F4nYXJlovdO9MOtMEd3hXzeFcFh8MkwR1hOkb8Od2W5clfI4F0PRT9KfgSEFRHvntDLdV17hfJcmrW8g5imCDAatBgqNBvhCaU2oa/KQ1ob0Qm1S0Em8v6ZdVq1VTc0tjlEv8tqAbX23jD2PoL7HxemaOnZZcMg2aPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dLrdA1WqcNxGCr3LMwZWUSb3XkjasYAbnHfIXJzxp8=;
 b=ODsCgDp//jj3u7uYHdnAyC2DOwzrJLPy586akA7XX16t/FRfaOz4unz0GrDfvyU3OCtt2euk344Bpa3gbiOAoHGUWAbSTqKJuALgJ+aCQ4gmsbC7neqXw6u4lERXls8nMxsBbTWvlwTzBtLfamrExcWp1xXEnMT4DTYSvgC7YVg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS0PR12MB9322.namprd12.prod.outlook.com (2603:10b6:8:1bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Wed, 27 Sep
 2023 18:47:53 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6813.018; Wed, 27 Sep 2023
 18:47:53 +0000
Message-ID: <728a979a-7f0a-4a90-a7d5-1c8b1c3ab1d3@amd.com>
Date: Wed, 27 Sep 2023 14:47:47 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/32] drm/amd/display: add plane 3D LUT
 driver-specific properties
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230925194932.1329483-1-mwen@igalia.com>
 <20230925194932.1329483-10-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230925194932.1329483-10-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0042.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::19) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS0PR12MB9322:EE_
X-MS-Office365-Filtering-Correlation-Id: c4b88cba-1daa-442b-242d-08dbbf8a41b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ihQnPqTlB92BvcTIJSFuhEBwA8SZe8M64qmbfw8vctfp3SQXIU46iJoQ4rvgxWzGh1Ar6uHl3aGUMi2BJwL6/clO3tz0YtSra+mu+YT7FX6HQs2HNIkm2J3QzdTFwFavIzpQEr4o1k6B90k1B9t2Y7712MBPLrmb3G6/SecG8oHgE1u2nnOzrqkiq+BWRmN2tjmBzFvQ/TLA3cL61U0DHdKRZb0W7nvHem1kPA5tGEt9rspk8zeC+axgsIzUBuZ2sKapQjyQVJKw7SCX55cmJgAuWYscZkfBd2F0ONtpd9oziGVRBt0Lvkot60UbAlaOTM7FFDJdCSvMFNgzYOiGHzNM6USeSupCxJesPCViX65IruaZFC4LEVSEvZA66cMDzK7KUaw95ZOJTZlQrur5QzuWjWAKPL5yC/uO97t8XFHHV2B8UkxNEBjVLlJzyeeGfNvX9LNUiU/pGmpE0H36y66QuvHC7HFevGJgs5l4c1Bwk+iSx/87WkCj2AlI043AAfm/Dqhhu8nP/tRFwDozGHNgL4mJ5HwL0/jblPlhGPMCHnasVQ5fKu8K0P7TB3qx5yV245DXMZgq4YYci7sz9msh+Fm2e4sKi3uiEEfZY84B345zFKO6IgCnYuKUpvOLlmzbMlZsayUyIOavpnAKPmjO15MN6pn4Un9jiH2eJ/Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(451199024)(186009)(1800799009)(83380400001)(26005)(8676002)(2616005)(5660300002)(4326008)(8936002)(6486002)(921005)(6506007)(53546011)(6512007)(44832011)(31686004)(478600001)(6666004)(41300700001)(66476007)(66556008)(54906003)(66946007)(110136005)(2906002)(86362001)(38100700002)(36756003)(31696002)(316002)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WitjNVhGZ3EyNTE4K05ZZk5PYklBaDFaRGxMSWM5YXZuMG56N2RVSG1JQzFZ?=
 =?utf-8?B?dTh4cS9HQVVaRVhwNG1KNTlEWktzeFlBKzFaYXJWSXBSNEJxTmY3UGdTaWp5?=
 =?utf-8?B?YlhnSEUwakxxcHd5ZmpMQ3RiVGJxSDhpTThod1ZEU01WZkE5KzN6WXYvMytj?=
 =?utf-8?B?bFJsWEk3cENSR3FUZFliWnIveDI4dWdKaWRNWlUrZEdHZHFmWS9JOG5KRWhr?=
 =?utf-8?B?ZVhFUWlrTDYyVTJGa1dzTEEybVZ5ZnVLdlRJbXMxQzFoMm8vWHB4RHZEWno4?=
 =?utf-8?B?RmJXV0FxcUVnaUEzemswa0Z5eEdBVGduMmh5a3RNajByZDZHMGcxYTNWcVFL?=
 =?utf-8?B?MS9qdVlPWjgyODhsWW9Dcis4NVJGSjl2UWtWeXI0K2thNWUyMUdNa1E5T0VB?=
 =?utf-8?B?V3JWQ2t6S2Uzc0FiSDgyVkY5RGdsQ3VYcUxlT1M4RWQ3UG9ac1ltZDN2WHFn?=
 =?utf-8?B?cVNXcTlXTnVpaTNiR1o5NUwyMHJSVThpTVZ6UG5qd1A0b3o4MUxLUmFubk1K?=
 =?utf-8?B?ekJpQXZNY2VZQStiTXZVdThXWFNQRlRUM1ExMVFRZHlDODhIekgwTUhmYTY1?=
 =?utf-8?B?dVR6SW1xdVdxaVpnWmdBRUhZODNTbEt2MllFaUdQZHl6b0EyQ1RYakRvb2xj?=
 =?utf-8?B?VVBpNHl5MDhmZlFBZk42QjhvWUhSU2UrWVp0Nml6NUgveDlDeTIyVGpqVWF4?=
 =?utf-8?B?TS9UZVJ0ZnRoNzdmNnJ1NXQwT1NvTU5NcjBma2p6WEdFbUNtRG5jMDljc0xr?=
 =?utf-8?B?S1diOTZLVG10bWIzN3VoL1Izbi9OVytwK09mVWQ2NGhhT0V3Z1grNlRpSTV4?=
 =?utf-8?B?bFVHZVBXYXRtemM2bVVrdVpjNTB6VXdaVFpKMHVORUdEUCtKZ0ZLMkdmMFM5?=
 =?utf-8?B?ZGVDVk9UMTBNRG5RY1FKbWVFZDZkSzZHS0E5WGhvWjdURWdsQk9haklURWxz?=
 =?utf-8?B?em4vbThyK2JlU2hZRGxzYk8rTm50Qk8wa2dwOGdMdFRoVHpwbVBLTnZid1ha?=
 =?utf-8?B?bTRESWcxNFM5SFYzSGQvVlgzbWFTWlZPOUNrTE5sa2kyWjQ2TmY0Q1JqWHlN?=
 =?utf-8?B?RmZFOC9yZHA5TXpRMll3N3pMU2ExN044VXE3dm85ZTNpY0JrRmY0dE1KRS9X?=
 =?utf-8?B?ckszNENTdXd5K3N6M1JxR3VGYmFvUFdTMWNTY2pBdHR3VDg5OWhBcFg5a0gr?=
 =?utf-8?B?QWxmeE9LTFRRTDg4V29RTlRVTTJEdVp6YXlnOWdJREdkNENBckxycVBEV2Fh?=
 =?utf-8?B?a0JnREl4SXJkeWtwS1lQb2Vib2h2ZGEzUnZtZ1R2Q09vS0hURjVWYStQSDBw?=
 =?utf-8?B?MXltQ2RhZXI0Ym5IaTNYd3E4NFJYRDRpeGFnclhtbGNRM3RLNzc1clJtTHJz?=
 =?utf-8?B?bmUyZjlweEtKZG1qZmNBM3NXNXpuTUl0N2JIeFUzNlI2L1lzamhtd1RuMXVB?=
 =?utf-8?B?WVZyanBDZUZONU9VVzBIN1NyTVBlOVQ2SUgvSGg2Yk81QXJhVkdvdEJaKzdG?=
 =?utf-8?B?M0UwZ29zcGVUalcrWmV2RkJ1MEFaZXk5SEVIblFJUWVrV0l5bWxQY1ZvdHRT?=
 =?utf-8?B?WmlqSkdQZWkxTUo0dDJmTENhSHhjRkxIajV0aEJtejgxNVRTelBpMzlFeklW?=
 =?utf-8?B?ZEJVbXk3Z3VjWTRrM1RmSkNrT09HOHVlVnNLVlNYYzN4Vy8ybThCMEo1cU5P?=
 =?utf-8?B?Y3FZTzE2Z3g0dmZ6cDE4TEVRZUZ1ZTEyYWo0NFc2azBUSEd4SHpPeE9leXhl?=
 =?utf-8?B?Z24rVDY5OFRSTWN2SGNPMUdHeEl0Nkt2Vk93NzVvdkd1M3EwL2ovRTJPVVNI?=
 =?utf-8?B?WkZ6bkhNNGlkWlFyK2krdXBESCtLbDB3RUZzZ2lqbHU0RlVyOXFaR1FlSkx3?=
 =?utf-8?B?akRWbndKbS9TMmRESWl5N3lMRkhwcERvZlROejZ2MS9kdjl6eUR5aUEzdEVE?=
 =?utf-8?B?ZktJbkYxbnJyQXpVVTdsVC8zeHh3RjdIU1VtalpnU24yb05JYWRPRTR1Q1Fk?=
 =?utf-8?B?WEQvblp5Skpkc3JRN2ZwWUQwT1dNaHJ3RzhIbDB1VVFmVkRPYWxJUFAvQ0Z6?=
 =?utf-8?B?TzJiYlhvZnRaVVBFNTNjNDhjZUVXWFgrTjJUanA0eXI5SllIQ3Z1L2laOEw3?=
 =?utf-8?Q?fgln4Mrj/M/Wp8yiL0VT1OzYa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b88cba-1daa-442b-242d-08dbbf8a41b3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 18:47:53.3834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ISbfosWZozml/7+YxYMVjlPdfZzrI23UTFjDaZK/sFvOLd6knPvKMz7NVLkNh4xqhwbcoJZ7C5q5CCUlD028g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9322
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
> Add 3D LUT property for plane color transformations using a 3D lookup
> table. 3D LUT allows for highly accurate and complex color
> transformations and is suitable to adjust the balance between color
> channels. It's also more complex to manage and require more
> computational resources. Since a 3D LUT has a limited number of entries
> in each dimension we want to use them in an optimal fashion. This means
> using the 3D LUT in a colorspace that is optimized for human vision,
> such as sRGB, PQ, or another non-linear space. Therefore, userpace may
> need one 1D LUT (shaper) before it to delinearize content and another 1D
> LUT after 3D LUT (blend) to linearize content again for blending. The
> next patches add these 1D LUTs to the plane color mgmt pipeline.
> 
> v3:
> - improve commit message about 3D LUT
> - describe the 3D LUT entries and size (Harry)
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      | 17 ++++++++++++++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  9 ++++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 14 +++++++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 23 +++++++++++++++++++
>  4 files changed, 63 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index 66bae0eed80c..1b5f25989f7f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -363,6 +363,23 @@ struct amdgpu_mode_info {
>  	 * @plane_hdr_mult_property:
>  	 */
>  	struct drm_property *plane_hdr_mult_property;
> +	/**
> +	 * @plane_lut3d_property: Plane property for color transformation using
> +	 * a 3D LUT (pre-blending), a three-dimensional array where each
> +	 * element is an RGB triplet. Each dimension has a size of the cubed
> +	 * root of lut3d_size. The array contains samples from the approximated
> +	 * function. On AMD, values between samples are estimated by
> +	 * tetrahedral interpolation. The array is accessed with three indices,
> +	 * one for each input dimension (color channel), blue being the
> +	 * outermost dimension, red the innermost.
> +	 */
> +	struct drm_property *plane_lut3d_property;
> +	/**
> +	 * @plane_degamma_lut_size_property: Plane property to define the max
> +	 * size of 3D LUT as supported by the driver (read-only). The max size
> +	 * is the max size of one dimension cubed.
> +	 */

I've been thinking about this some more and don't particulary
like that we're reporting the size as the dimension cubed, e.g.,
4913 (17^3) instead of 17. This works for an AMD private API
(and I'm okay with keeping it as-is if changing it is a lot of
effort at this point) but in a generic API it would be a source
of bugs or undefined behavior if a driver mistakenly reported
a size that doesn't have an even cubed root.

Reporting the size of a single dimension (e.g., 17 in the case
of the current AMD driver) would be clearer.

Could we still change that?

Harry


> +	struct drm_property *plane_lut3d_size_property;
>  };
>  
>  #define AMDGPU_MAX_BL_LEVEL 0xFF
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 7ca594c7dfbe..dbd36fc24eca 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -773,6 +773,11 @@ struct dm_plane_state {
>  	 * S31.32 sign-magnitude.
>  	 */
>  	__u64 hdr_mult;
> +	/**
> +	 * @lut3d: 3D lookup table blob. The blob (if not NULL) is an array of
> +	 * &struct drm_color_lut.
> +	 */
> +	struct drm_property_blob *lut3d;
>  };
>  
>  struct dm_crtc_state {
> @@ -858,6 +863,10 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>  
>  void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
>  
> +/* 3D LUT max size is 17x17x17 */
> +#define MAX_COLOR_3DLUT_ENTRIES 4913
> +#define MAX_COLOR_3DLUT_BITDEPTH 12
> +/* 1D LUT size */
>  #define MAX_COLOR_LUT_ENTRIES 4096
>  /* Legacy gamm LUT users such as X doesn't like large LUT sizes */
>  #define MAX_COLOR_LEGACY_LUT_ENTRIES 256
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index f274909c0c7e..e2f3f2099cac 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -207,6 +207,20 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
>  		return -ENOMEM;
>  	adev->mode_info.plane_hdr_mult_property = prop;
>  
> +	prop = drm_property_create(adev_to_drm(adev),
> +				   DRM_MODE_PROP_BLOB,
> +				   "AMD_PLANE_LUT3D", 0);
> +	if (!prop)
> +		return -ENOMEM;
> +	adev->mode_info.plane_lut3d_property = prop;
> +
> +	prop = drm_property_create_range(adev_to_drm(adev),
> +					 DRM_MODE_PROP_IMMUTABLE,
> +					 "AMD_PLANE_LUT3D_SIZE", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	adev->mode_info.plane_lut3d_size_property = prop;
> +
>  	return 0;
>  }
>  #endif
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index b66da6b76f5c..56f9109ecf60 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1361,6 +1361,8 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
>  
>  	if (dm_plane_state->degamma_lut)
>  		drm_property_blob_get(dm_plane_state->degamma_lut);
> +	if (dm_plane_state->lut3d)
> +		drm_property_blob_get(dm_plane_state->lut3d);
>  
>  	dm_plane_state->degamma_tf = old_dm_plane_state->degamma_tf;
>  	dm_plane_state->hdr_mult = old_dm_plane_state->hdr_mult;
> @@ -1434,6 +1436,8 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
>  
>  	if (dm_plane_state->degamma_lut)
>  		drm_property_blob_put(dm_plane_state->degamma_lut);
> +	if (dm_plane_state->lut3d)
> +		drm_property_blob_put(dm_plane_state->lut3d);
>  
>  	if (dm_plane_state->dc_state)
>  		dc_plane_state_release(dm_plane_state->dc_state);
> @@ -1464,6 +1468,14 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
>  	drm_object_attach_property(&plane->base,
>  				   dm->adev->mode_info.plane_hdr_mult_property,
>  				   AMDGPU_HDR_MULT_DEFAULT);
> +
> +	if (dpp_color_caps.hw_3d_lut) {
> +		drm_object_attach_property(&plane->base,
> +					   mode_info.plane_lut3d_property, 0);
> +		drm_object_attach_property(&plane->base,
> +					   mode_info.plane_lut3d_size_property,
> +					   MAX_COLOR_3DLUT_ENTRIES);
> +	}
>  }
>  
>  static int
> @@ -1495,6 +1507,14 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
>  			dm_plane_state->hdr_mult = val;
>  			dm_plane_state->base.color_mgmt_changed = 1;
>  		}
> +	} else if (property == adev->mode_info.plane_lut3d_property) {
> +		ret = drm_property_replace_blob_from_id(plane->dev,
> +							&dm_plane_state->lut3d,
> +							val, -1,
> +							sizeof(struct drm_color_lut),
> +							&replaced);
> +		dm_plane_state->base.color_mgmt_changed |= replaced;
> +		return ret;
>  	} else {
>  		drm_dbg_atomic(plane->dev,
>  			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
> @@ -1522,6 +1542,9 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
>  		*val = dm_plane_state->degamma_tf;
>  	} else if (property == adev->mode_info.plane_hdr_mult_property) {
>  		*val = dm_plane_state->hdr_mult;
> +	} else 	if (property == adev->mode_info.plane_lut3d_property) {
> +		*val = (dm_plane_state->lut3d) ?
> +			dm_plane_state->lut3d->base.id : 0;
>  	} else {
>  		return -EINVAL;
>  	}

