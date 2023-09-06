Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC85B7943D1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 21:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D055110E1E0;
	Wed,  6 Sep 2023 19:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C5810E1E4;
 Wed,  6 Sep 2023 19:30:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QL0Cmuz29+DbzIW/qZtcCzMqnNnrWEjIL96sbDA7KNTiLsr45LZb7n4JX8v64P1y1IofrKFz7vquOzh2pY6bgRystmjRtUa7kHeB6cSD0VwX/KjVmG9qX7uxHbcpVupQMhl3pj+e4k4kkJFddH/w2YSm2Wzx2+cHUCMBwfGTr/IQVd5061bt0uwrLYwRbQhDiOBTwDdQywc2yEgVVz1RbQ5cEXd23nznSVg507p2oKAHk+MLUInZkvQDX9PsgDS1xtfjTu2qP2RKy4P8pcGQVC5EUiFuMtceV9FBfAfGgeW9zoqvojoEswB5uTujoQ4ZAYcoAau3SH/pyqr5XpdDwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gh7QcvNZ9uT3dY8Y3eY71rEA9fTMDeaPqBRAOSdKg78=;
 b=h18RgkSPtRsgGhuQRaApU9IkatDO0+AACYP+OnvdB/NxEVHTen8HG9XHuUimp3XFaOlwbzDDhrB75ivr76/0ejC9ID2R1oqRBpu7ATH8loNGPupZ17iU1prsad7qljR77mhtST+FGeI9+EtkWHixwhIObRLGGdFWW3fJZpp7Z//I6Wu30/BxRAPCZt869PaHS7QgSPC6DCRkgFF5yLO8NCrnI72H4ZuDpZ/slwLjw4FIgUeibj0rJFfS98ktuJQNWjEv/Zi98LmxWcAZcRxWgprn9rmG6j6CABPZ18SWrYAgctXQ/Pux+XSgZjN5sSmeVPLDye1DI1uNz3k7+NsYfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gh7QcvNZ9uT3dY8Y3eY71rEA9fTMDeaPqBRAOSdKg78=;
 b=ZWTNs/sG85PplhFbJL4m04/t8CjPdnbZuhw2eDJWzdXEmFky7I7cL42lpZAdidIiaZTQhbWZffECWwvmR/fAXLEIWqNWKiUlqkao18EX19vW7HO1TR5PJPhHqROAd82qBKdNTfrDf3C465F+S+r44TS+s3g/mET27Z0w+WmL0Ls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM4PR12MB9070.namprd12.prod.outlook.com (2603:10b6:8:bc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 19:30:10 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 19:30:10 +0000
Message-ID: <758deee7-7530-4931-830e-d5a4acff337f@amd.com>
Date: Wed, 6 Sep 2023 15:30:04 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/34] drm/amd/display: add plane 3D LUT
 driver-specific properties
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-11-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230810160314.48225-11-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::34) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM4PR12MB9070:EE_
X-MS-Office365-Filtering-Correlation-Id: e5000ca2-050d-410a-04aa-08dbaf0faf21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8VYgfI9rruIJmTRP1Lf6MA0bGi1OdRG4cLQQ+b+zByQifkRy7XHokgLFMZ14zHJ3gjhSWkc5N7mTBO002v+0vVvoXSs/3xDJO3eD9f5Cy2VfNuBIOEfOTCFMcWKyNQUzcKQATWAbqtYmwJuymFF6ltUF/JS9SdgmVeRRM+1NfXcNK1Wr01fw+bNTIHeEbvFPmYvPaC/T3Zgwh4da7e7AmBsUnhF4xPyTkayy5R4EZEcpeGbEv9WuJSxS3nQxWarOOOV7G57EqPwEjffsLacPCNOJivCH+PQKQXoa7ycDDDCxRqj2e08go3wEEF05ZDh7VvWw6mQaeO+tZAYIbLyZiqsGHCYxupu8Ug5EbKbL+14toXl9zP1bxqs08gc3Ol5vkzOuqMmC/MYFc1gqUMl0IyRRvcnAnmJ/3DgFfal9S5uk4uivedA9OmiQAYatNbFyCejd/hiw9pTOBstRgL1EZYMCuU/c4sSWx1BcT5rON35sXG2mwozWk4hIUseCpbXLlBAbSukxdKzTSO8OrbriNojBxvk6aq6LuAGK5nqTGe9HY3TR3Jn/BJ5Y4l2ifJBFbEt5KhVaDscWtUFXDKucVi+/HvnEif0yEv4J5PEWNSHZa5YX5c8mAa+i5nNfZdW9C1xyO5fKuf0JGD6n/ldoas7Lqphab81FwdGTmFhOUGM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(346002)(366004)(39860400002)(186009)(451199024)(1800799009)(31686004)(36756003)(921005)(83380400001)(6506007)(8676002)(31696002)(5660300002)(6666004)(4326008)(44832011)(8936002)(26005)(2616005)(86362001)(41300700001)(6486002)(6512007)(53546011)(110136005)(7416002)(66476007)(316002)(38100700002)(966005)(478600001)(2906002)(66946007)(54906003)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm9uaXNYeGI4ZmN2ZzU2anJNaFZTN1dlcGpMK09STGU1azlDcGxwTEpKWUVX?=
 =?utf-8?B?VlBNeVVMamdVVkpHTmxjQnJlbWp5K09rT3dBOERpVDQzY2tlRlcvWlZuU1VZ?=
 =?utf-8?B?cFZLcFEvL3Z6VUV1SDBiQzJLQ0YwcjlMWUFoUGtIYXpGTnV4aE1wdFEwbDNY?=
 =?utf-8?B?RjFRSnpYTEQyaXNVRUVpTUlMSkM0QnB6VVdvNDcvZ1dxTEQwTlcyUE91Ujds?=
 =?utf-8?B?OXJGNE4rUDZqK28vMlZUaU11TEdPT3JZM0Q4SGJ6WDA1M0tla1RvUjhyeTBa?=
 =?utf-8?B?blJFTXR5ZjRNNlBnN3ZhcFRYU3Z2YnZ2UE1nMWdrNldlSnVzMm1ZRGtqZjV2?=
 =?utf-8?B?L2hMaDdBMHV3NGZUZnBWankxSnlmZHhHQ2JGVEFjK2Q2N1BqWVlwMFB3Z3h2?=
 =?utf-8?B?NmxoSjdQQlBXeVR5V3BzamJ0ZGJrdVVhNngvSlBOa0RXU1B1dHUwYVl5NFFn?=
 =?utf-8?B?QnVPY3kyRmZqV28wang4Q2hSUEU4cjRaV3JSU2ljVXZGZi9uQ09mTjlYL0lI?=
 =?utf-8?B?YjFtNm5WQjRJekpSRmpacXVCSHdiYVFNRVQ3SDZLRWVMWHVwNytGZDBoeU1p?=
 =?utf-8?B?QWZ2cm1TRlZ5TW9tdzFyaDl0dlp5RWpxQlZ6VW4rWnU3L0RoY3MwRDBRSC9F?=
 =?utf-8?B?OXNDUjh4eUlQVi9HeDh2alI1MWg1cVBNakdRNlBieHRvN3VWZm5zdStTdk0z?=
 =?utf-8?B?MkRBY1VDcldkK2dYYW1uRUFocmg5bzdwcllyMmdoRjBtSGVnWStNdnc3OTNo?=
 =?utf-8?B?U1ZibGxwamE2Y01sSnN1ZGUxd0NUcXBVSm1GMXRYUGNnVTNlNWltS1Y5enRs?=
 =?utf-8?B?MjhTRDFsdnZzVnl6NTNhTzNIdEJWelVicm40WTVGK1lqbE0yTDI2N3F6Rkho?=
 =?utf-8?B?U0Y3eEhyQmNnYm0rNUZmb2dmQS9oU1dXQUxNZ1RFbDN4WDg4RktVUC9xbjBu?=
 =?utf-8?B?MlQrZW5XWGgyZUlrSEt0aDZRdXhIS3ZMNGhMMUVKQ1lQT21rL1htVmJXb3hJ?=
 =?utf-8?B?QmNzSVhYMzVPQ1VCNEtWUmdTNnZUcC9EeHZLZ29MUFEyS3JhZW02SFk2N01T?=
 =?utf-8?B?WEFkSVBSUzZxT3pRUHVCUFVEUlQ1b2dScFlEdVV0eTBOMndGZ0ptSlJCK1Fm?=
 =?utf-8?B?aU1GSEhjbjNDdmRLZWhIcElCbERGWDVPUkJwam1IckI2b0xjalhOOFB4SWR2?=
 =?utf-8?B?ZVorRkJDSW4yVjFTOWUvQk5nSVgvZG9sTVVqZDlwUEt3b09tcFZMV1JBUHoy?=
 =?utf-8?B?UTd6bmdxdEYvR2pUakpaVU5BWlRpeGlKbnBqbXdBRElxSy95S3FUTG84V01E?=
 =?utf-8?B?T0diQlBKWUd2Wm9taWdFTjFoak9WZzB4ZmxUbGpadndSKzJ5enVmc2RyemhY?=
 =?utf-8?B?NXMweVc4YlhDKytuaGxma3g4YytXY3dlZm9UWXVVa1JqVW5QTG91d1JxRFpo?=
 =?utf-8?B?R0VFb3BISHJQYWgxK0R3UWdRbTJwQWg4K3ZnN21BQks2bjFCS3JObkMrdTNi?=
 =?utf-8?B?bHF5RGFCRm5aaDlRZW5iSzFLVE9pcWVsVjNIcEVGSFBEM0s1VFFYdU05VVp5?=
 =?utf-8?B?aExLc3YwYThZNk9ncjhhK001Qjh0Qi9RTXE3STc0RkVrWWJCTXNncDZKWTcx?=
 =?utf-8?B?dFNLYVFPZTFtbzFHUGRzaC9vdThJdWZWTkw5Y3VNelY5WFhFdzVESXdRY0xl?=
 =?utf-8?B?YVovcHUyZEZwZXJybnVmR2VBeXM3ejRpZ0JyaUk0Q2NPNWNHRzV0OWdsVFFu?=
 =?utf-8?B?bjRsSUJiaGNQZEJaR2M2azFZamYvTDd5dUVFQWJyNXhTMlNNcjVXQ2U2Y3cz?=
 =?utf-8?B?dVVPVS9sYTg3enBDTzdXVkQyVlJGQTBpMVN5RHpKdzBqeDNPK2FRUXFIZHhP?=
 =?utf-8?B?YXpSRlFWbU1TazJjNFNMRjdXdy9iTVdVdktMN1YvZEw1OWNORUVuMlIzQklQ?=
 =?utf-8?B?ckRYMU9XekYwZWIzTzlwbDhuWlMxbTF4K2tPTlRVWGgyV2cwVURoKzRKcm9I?=
 =?utf-8?B?U2dqdkxwN21ONFpNZko2REExaWJMRnBocU5ZU3dzVTZiSWY3Rm1WakljS3Nt?=
 =?utf-8?B?U2pJazN0ekd0SlRIVWNta2VsMkdvR3AyaEpxTnBsZkNnNUtEY0hLeFdxVmxF?=
 =?utf-8?Q?0tYYIMIEynThkLK4Iiol3NXvR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5000ca2-050d-410a-04aa-08dbaf0faf21
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 19:30:10.1943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +oGYm6GkjkEsMUoNWq8GGFc7uKlEVleUaNQkbqtk/yESLRW2L0fQ0zQgYeOt/l1+b4pRESYA05RENkeVMWYJpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9070
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



On 2023-08-10 12:02, Melissa Wen wrote:
> Add 3D LUT property for plane gamma correction using a 3D lookup table.
> Since a 3D LUT has a limited number of entries in each dimension we want
> to use them in an optimal fashion. This means using the 3D LUT in a
> colorspace that is optimized for human vision, such as sRGB, PQ, or
> another non-linear space. Therefore, userpace may need one 1D LUT
> (shaper) before it to delinearize content and another 1D LUT after 3D
> LUT (blend) to linearize content again for blending. The next patches
> add these 1D LUTs to the plane color mgmt pipeline.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      | 10 ++++++++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  9 ++++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 14 +++++++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 23 +++++++++++++++++++
>  4 files changed, 56 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index 66bae0eed80c..730a88236501 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -363,6 +363,16 @@ struct amdgpu_mode_info {
>  	 * @plane_hdr_mult_property:
>  	 */
>  	struct drm_property *plane_hdr_mult_property;
> +	/**
> +	 * @plane_lut3d_property: Plane property for gamma correction using a
> +	 * 3D LUT (pre-blending).
> +	 */

I think we'll want to describe how the 3DLUT entries are laid out.
Something that describes how userspace should fill it, like
gamescope does for example:
https://github.com/ValveSoftware/gamescope/blob/7108880ed80b68c21750369e2ac9b7315fecf264/src/color_helpers.cpp#L302

Something like: a three-dimensional array, with each dimension
having a size of the cubed root of lut3d_size, blue being the
outermost dimension, red the innermost.


> +	struct drm_property *plane_lut3d_property;
> +	/**
> +	 * @plane_degamma_lut_size_property: Plane property to define the max
> +	 * size of 3D LUT as supported by the driver (read-only).
> +	 */

We should probably document that the size of the 3DLUT should
be the size of one dimension cubed, or that the cubed root of
the LUT size gives the size per dimension.

Harry

> +	struct drm_property *plane_lut3d_size_property;
>  };
>  
>  #define AMDGPU_MAX_BL_LEVEL 0xFF
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 44f17ac11a5f..deea90212e31 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -769,6 +769,11 @@ struct dm_plane_state {
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
> @@ -854,6 +859,10 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
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
> index b891aaf5f7c1..7e6d4df99a0c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -209,6 +209,20 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
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
> index ab7f0332c431..882391f7add6 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1353,6 +1353,8 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
>  
>  	if (dm_plane_state->degamma_lut)
>  		drm_property_blob_get(dm_plane_state->degamma_lut);
> +	if (dm_plane_state->lut3d)
> +		drm_property_blob_get(dm_plane_state->lut3d);
>  
>  	dm_plane_state->degamma_tf = old_dm_plane_state->degamma_tf;
>  	dm_plane_state->hdr_mult = old_dm_plane_state->hdr_mult;
> @@ -1426,6 +1428,8 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
>  
>  	if (dm_plane_state->degamma_lut)
>  		drm_property_blob_put(dm_plane_state->degamma_lut);
> +	if (dm_plane_state->lut3d)
> +		drm_property_blob_put(dm_plane_state->lut3d);
>  
>  	if (dm_plane_state->dc_state)
>  		dc_plane_state_release(dm_plane_state->dc_state);
> @@ -1456,6 +1460,14 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
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
> @@ -1487,6 +1499,14 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
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
> @@ -1514,6 +1534,9 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
>  		*val = dm_plane_state->degamma_tf;
>  	} else if (property == adev->mode_info.plane_hdr_mult_property) {
>  		*val = dm_plane_state->hdr_mult;
> +	} else 	if (property == adev->mode_info.plane_lut3d_property) {
> +		*val = (dm_plane_state->lut3d) ?
> +			dm_plane_state->lut3d->base.id : 0;
>  	} else {
>  		return -EINVAL;
>  	}

