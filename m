Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C727ECA86
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 19:27:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DE910E55C;
	Wed, 15 Nov 2023 18:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D761910E55C;
 Wed, 15 Nov 2023 18:27:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NH0gBJ8PhQ9gHpTZodC/nWLf2YY8V+rhR8pjqjZTJcpHC3d1lMZzi504eNtMk/lwTzpthLvHuvrtttwQnjfQGQ0jCsQKfJZhqAhfRV9X7u30/pO/ujSwDfikMLX0ykQ/NNM43mBFKP7Ux/9dLdfBjZqV+jJNVpIiv8nHOW1o0+DHewt0aEtkcAHnlw6VMEtKyQlVaVTGtWuRSb1Mf0XCBCHPAwtR8zcRzAO3uk6fxnXpX9JJBvFj4+UXXYBb7EV++uB0oBWpzOmxCk7fCAbiDGmKnhjclg/kOD7cBonNvUIoj+yJc70XgDWRVrMKiK5AfPsG6TcclN1qrm/yoH6A9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GySh1hj8CWVb6abdSb57SWO4xCwShV8JFw8gp7ceKko=;
 b=TLNli2zoK1jvx+2ANTpnxNxB6LBYGg4+86lorz4X6ccXnS/mBmQKrJc0hk5v86eLt0bojtJ5B1eRupigB/GXDkBl0yM/SafPc230+2Z3UscU+lx3JG0NKy2PPj2AyocqzOLLNdUoGJPjI3wed8qVuLg2hhkqSQseoFMdlHfyrMnfr6tXDp0mErRGEmrfkRONtyxMHucwB4vqqDh+buJXs6w5AKv6rlAn/AXSe2fOjvlJe1qeAaUGuUPOMoTVJxSDu4UB8Tu3/44RdtEjXTCk7mg+g87Fa8wzaB34n4CkYu1SoCRQQOq7dYfcRXquzRLaiNKHDHngYcsgnr2VAIySNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GySh1hj8CWVb6abdSb57SWO4xCwShV8JFw8gp7ceKko=;
 b=nXE1rqz/dSjvCEPBCD0vyfc6F5dLjR+g6F9xhazE/joa/5drFh4O+P4/mMTFwOq8+gLtycuFblNBIiQ6BgcpKH4S6E3ELfNvGY4WT46oYq1BzFDxpEfgvZBYqs0H6t2UCk/oEozLO8JmDyNyVXjqMeIlSQOtwv6YdCs/zlLd46g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ0PR12MB7083.namprd12.prod.outlook.com (2603:10b6:a03:4ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.22; Wed, 15 Nov
 2023 18:27:25 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a%5]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 18:27:25 +0000
Message-ID: <e311076f-e5ee-47d0-8eb5-0a0bf6c122fb@amd.com>
Date: Wed, 15 Nov 2023 13:27:22 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/32] drm/amd/display: add plane blend LUT and TF
 driver-specific properties
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20231005171527.203657-1-mwen@igalia.com>
 <20231005171527.203657-12-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231005171527.203657-12-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0256.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::23) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ0PR12MB7083:EE_
X-MS-Office365-Filtering-Correlation-Id: e6e4b136-d0a5-4e68-a871-08dbe608843b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gxIlwq3B51g7RgWqYSkxeQ+q55S5ojFzRaKr8eADyR54ezBO42IPm8Kk8upxsbO+WX8y/Xl7dmGAbKcjN7mtVm+h/r6g87Ef/JeJcLdlxyYv4IE8/7TJi8rGYObT4+ukICBTT25OsCqoAD+QFq1fpqd6LYjlxREfZDoOzhCb7XQPwbjQq8WxqGWUB0gaQrOwmIkIG3wLPDCcC7y6e3qZIg2lPbChMOVjud8kz1nJECsv6wAaqChkNQShj2OPeK23+x8VlNDM/PdWA/2wWGxjuijadmjDpVC3GwWpCluiArHts3fcOsnDAlxebGQowEnOj+IacfCszfRadKE9lZiAqcF+KEcRhSjeQGxJq8QeOAoweC+0PcvUyCVpi60DX9ShEoXzv3Tz4TmwLWmXGSskgJ85Pae2yl2Ynid8wAWITW7yda+N+HTcqnXRPJ7nF9CW5BARvIQpKheZZFPvg6CCh6aX4CBq2oDm8/De2ovNbUxgEE6e8ywpR9Ta0D19Sk8/IOrlpgndxV0i+UP7j4sQpOYbksfXhXwr26nf7cCJz1D/cOAXqJ7pon2WM8WxMOSTujcahE2PiF6W16mkLs5vLPZv5vkRkOxTW8JmYITacSWg+ibbgsd1lC2iXB3hiUOXLb03Gz4SU1gpSaoNSS1XfJ1aN5tRhvOn+baerDVcsQ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(136003)(366004)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6512007)(54906003)(316002)(66946007)(66556008)(66476007)(38100700002)(110136005)(8676002)(8936002)(4326008)(6486002)(478600001)(31686004)(36756003)(6666004)(6506007)(53546011)(44832011)(7416002)(86362001)(5660300002)(2616005)(921008)(2906002)(26005)(31696002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjhTSkdmMXkwU2R3TTlNMGdkV2RXSlo3MGFyZ0VWeVJNMlFpUkVtdnFScjd3?=
 =?utf-8?B?VFZidUlxZEJJUTJPbjVJc3dadS9pMVF0SVlvSWRhSzZJOC9XTUVXbjBOTDdQ?=
 =?utf-8?B?SGxFT0xEcGl2YXlzVDl3RHBNVnlFZ25mZUVybkVyeC9hTWEvK2xVWndrZ1di?=
 =?utf-8?B?NUh1emZCamFpbkRGQnNYOU5ONHpBUHo4U0RsMDZHemtndzU3ME5Ud1ZDOS9s?=
 =?utf-8?B?WDFsV1NIdzM2TGFMZXVIU0FFV1N0ZGhUVHhBODBSSFMweUpqTVcrSWJQd1FX?=
 =?utf-8?B?Qi9jUjljWXJqZEUzVHBXM1B6WGY1Q2xmR2o0cmRrQjhoLzUyZHlIb1B2UGtM?=
 =?utf-8?B?bTZHaHhSZlNaM1l5K2E0SkkxSElsQVBWTzR5VGFQbFUyclZOc1RjbXlHcUoz?=
 =?utf-8?B?WjBseDlsdUFUejY1OU5XQ1k3YzFsNEtuK1M3WjVrV0h0OW1ydHFwc3lpOXEr?=
 =?utf-8?B?bi9uT0hpRXN5VmtCWmlWZzhpY2gxMXNNdHU0YTFZYm1hT1RxTC9yRHU3S1lT?=
 =?utf-8?B?cFRNMDYyT0NLbTJZeUNqR0FlaFA4VWhpa29qZ1lJVlRReklzRlJ2aS8wbm52?=
 =?utf-8?B?cnBEMTVBV2VFU216dzkwbS9ZNkFIT3lWa1o5YklldiszU05xSENMR1ZQUTcx?=
 =?utf-8?B?M3BwRXhzNDczT2VzelhUT0JCVDYzTlJ0UEhIb2ZIMXh3eUhBUXNCa2NLQk5p?=
 =?utf-8?B?Mit3RXY1UkRhZDBTeWdqeHNMWEMwSXU0Y0hNRXdrWERsK2hJTGpZb3Z4alkx?=
 =?utf-8?B?Zk8zUERMNHNRWEtOYkNsOGNNUHRDMHgvZEJqUU9qbUVnL1lrcUpWZnYyV0tE?=
 =?utf-8?B?clg0SlpYTWZ6ZjZVNGxrdk1Yb2s1ZUcveldZZC83V2Z6RTlCRlZqRktHY0x6?=
 =?utf-8?B?d1V5c2ZVV2lCRjFqaUFnQnY0cVU2eXhZdXcvKzNKYVh3ajBRUld2Njdad1RO?=
 =?utf-8?B?aEZmRjdaKy9QTjkwSXliSDhLd1JmYy9lVVNkZHZvQzFhQUxGTjZPTHREemZq?=
 =?utf-8?B?cUFUUFA2bW9YeUdqQzI4c01DaUZDOTltKzRJV1A1MnozS3FoUzZqeFF4UFdn?=
 =?utf-8?B?alJWTS90NzU0QXNlb28vUFRtbTlzVlgwQTRRMy9kY1MzbU9YcmdoMG16V0dY?=
 =?utf-8?B?dHo5bWVqZSt0a2czeXQrNk14Wk9manc1L24wSmdjYkU3Qkt2bzJybldHY2FH?=
 =?utf-8?B?RlpBTHN6Nm85MGNLUFRsMTlZVUIyQVNSOU4xZWlyUmp0TUtLaytuSXJWN09u?=
 =?utf-8?B?QkUzVUFxVGoxdXhnQmdBcmhJTjB6bmRVbFZQNjJrdGtlKzQ2MjlmeW5BVGdm?=
 =?utf-8?B?K0ZidEsyNmZHMllSRlIxbWVJRUQ5bkIvUnE0WXJiMTVFUkpBVnV6ZDNoWmpT?=
 =?utf-8?B?N1VEZjc3SDJBRk9kL21wdjh3S3dpVFRJOVdMbHpZb0JqbnNHQ2JhZENoTnRQ?=
 =?utf-8?B?cmlwWkhPSCtiVHE5N0JXcExRS21rNlpQODFHZnJjVGRWZVlpdW1xTzhCU2JN?=
 =?utf-8?B?Y2QyTnB6RW1wL2pyTjY1UVBLNmtuRUhHc1NtcEFyeXdnK0NaOVg1enNaNnkw?=
 =?utf-8?B?NTNTUmY2MnYxNGlkSVJMYWxUdENoLzVvUzFTS2lLTnVLYzZlQVFUQUhyVDZv?=
 =?utf-8?B?dU5ad2xMWEtjZE12R3Y4SU9XQnNtOFZIcmpUTWU0RmFyOFNxa3Y4L2xMbVRB?=
 =?utf-8?B?V3owTlN3eU40RUJ4N3ZIZUMwTVdoZlF6bHhqTGZPTFY3Tm52VXdhakZBbTJj?=
 =?utf-8?B?TTl5N2ZHMlczWERLRHF3U1FDQnQxQWY2aTRDemVIUWNIYm5HOGhDZldkZG5y?=
 =?utf-8?B?QUhzaWlHS21yUlVxQ3JodTlXOXVWQmlKNGdGV3FUMVVJQzdiTWtCVkcwdExl?=
 =?utf-8?B?SEd1NnAvUUFtanR6NFB0V3BZc01ERVRDdlhXQ2RDc2I0MTRGcHVtalA3d2N6?=
 =?utf-8?B?UnRDVzIyMmJiVDNSQUNBaG1lOVJqcWwzQy9lbzlrYjlBekV5VFBQWDZLeTBU?=
 =?utf-8?B?VzNJNzYzUS81Nk1hSlJzdGFBTEI2bjdtaUFsTzJSeTdWUHo1RDJFOTZUc1pz?=
 =?utf-8?B?NW51a0JvRHhGRG8vZS9WOGpDdTdJL1pqUGt2dm9vNjNsOTh1WklCSEtLeG1t?=
 =?utf-8?Q?TJHeQbHPNFiIeBRn3Yg9tBbFm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6e4b136-d0a5-4e68-a871-08dbe608843b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 18:27:25.7171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ZGzfdyhvfmO2y89omqyrGmpTTbSpBq7OK/1n/zrZz1o3BUeX4zPADytVNQ00goQGrJ+CoLzTmgS+iDG2hIc7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7083
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



On 2023-10-05 13:15, Melissa Wen wrote:
> From: Joshua Ashton <joshua@froggi.es>
> 
> Blend 1D LUT or a pre-defined transfer function (TF) can be set to
> linearize content before blending, so that it's positioned just before
> blending planes in the AMD color mgmt pipeline, and after 3D LUT
> (non-linear space). Shaper and Blend LUTs are 1D LUTs that sandwich 3D
> LUT. Drivers should advertize blend properties according to HW caps.
> 
> There is no blend ROM for pre-defined TF. When setting blend TF (!=
> Identity) and LUT at the same time, the color module will combine the
> pre-defined TF and the custom LUT values into the LUT that's actually
> programmed.
> 
> v3:
> - spell out TF+LUT behavior in the commit and comments (Harry)
> 
> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      | 22 ++++++++++++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 12 +++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 21 +++++++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 36 +++++++++++++++++++
>  4 files changed, 91 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index af70db4f6b4b..dee35d208493 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -402,6 +402,28 @@ struct amdgpu_mode_info {
>  	 * entries for 3D LUT array is the 3D LUT size cubed;
>  	 */
>  	struct drm_property *plane_lut3d_size_property;
> +	/**
> +	 * @plane_blend_lut_property: Plane property for output gamma before
> +	 * blending. Userspace set a blend LUT to convert colors after 3D LUT
> +	 * conversion. It works as a post-3DLUT 1D LUT. With shaper LUT, they
> +	 * are sandwiching 3D LUT with two 1D LUT. If plane_blend_tf_property
> +	 * != Identity TF, AMD color module will combine the user LUT values
> +	 * with pre-defined TF into the LUT parameters to be programmed.
> +	 */
> +	struct drm_property *plane_blend_lut_property;
> +	/**
> +	 * @plane_blend_lut_size_property: Plane property to define the max
> +	 * size of blend LUT as supported by the driver (read-only).
> +	 */
> +	struct drm_property *plane_blend_lut_size_property;
> +	/**
> +	 * @plane_blend_tf_property: Plane property to set a predefined
> +	 * transfer function for pre-blending blend/out_gamma (after applying
> +	 * 3D LUT) with or without LUT. There is no blend ROM, but we can use
> +	 * AMD color modules to program LUT parameters from predefined TF (or
> +	 * from a combination of pre-defined TF and the custom 1D LUT).
> +	 */
> +	struct drm_property *plane_blend_tf_property;
>  };
>  
>  #define AMDGPU_MAX_BL_LEVEL 0xFF
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 0e2a04a3caf3..1b96c742d747 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -800,6 +800,18 @@ struct dm_plane_state {
>  	 * &struct drm_color_lut.
>  	 */
>  	struct drm_property_blob *lut3d;
> +	/**
> +	 * @blend_lut: blend lut lookup table blob. The blob (if not NULL) is an
> +	 * array of &struct drm_color_lut.
> +	 */
> +	struct drm_property_blob *blend_lut;
> +	/**
> +	 * @blend_tf:
> +	 *
> +	 * Pre-defined transfer function for converting plane pixel data before
> +	 * applying blend LUT.
> +	 */
> +	enum amdgpu_transfer_function blend_tf;
>  };
>  
>  struct dm_crtc_state {
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index d3c7f9a13a61..82c554662faa 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -273,6 +273,27 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
>  		return -ENOMEM;
>  	adev->mode_info.plane_lut3d_size_property = prop;
>  
> +	prop = drm_property_create(adev_to_drm(adev),
> +				   DRM_MODE_PROP_BLOB,
> +				   "AMD_PLANE_BLEND_LUT", 0);
> +	if (!prop)
> +		return -ENOMEM;
> +	adev->mode_info.plane_blend_lut_property = prop;
> +
> +	prop = drm_property_create_range(adev_to_drm(adev),
> +					 DRM_MODE_PROP_IMMUTABLE,
> +					 "AMD_PLANE_BLEND_LUT_SIZE", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	adev->mode_info.plane_blend_lut_size_property = prop;
> +
> +	prop = amdgpu_create_tf_property(adev_to_drm(adev),
> +					 "AMD_PLANE_BLEND_TF",
> +					 amdgpu_eotf);
> +	if (!prop)
> +		return -ENOMEM;
> +	adev->mode_info.plane_blend_tf_property = prop;
> +
>  	return 0;
>  }
>  #endif
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index a381b3558bd1..f1070ca7076a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1339,6 +1339,7 @@ static void dm_drm_plane_reset(struct drm_plane *plane)
>  	amdgpu_state->degamma_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
>  	amdgpu_state->hdr_mult = AMDGPU_HDR_MULT_DEFAULT;
>  	amdgpu_state->shaper_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
> +	amdgpu_state->blend_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
>  }
>  
>  static struct drm_plane_state *
> @@ -1364,10 +1365,13 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
>  		drm_property_blob_get(dm_plane_state->shaper_lut);
>  	if (dm_plane_state->lut3d)
>  		drm_property_blob_get(dm_plane_state->lut3d);
> +	if (dm_plane_state->blend_lut)
> +		drm_property_blob_get(dm_plane_state->blend_lut);
>  
>  	dm_plane_state->degamma_tf = old_dm_plane_state->degamma_tf;
>  	dm_plane_state->hdr_mult = old_dm_plane_state->hdr_mult;
>  	dm_plane_state->shaper_tf = old_dm_plane_state->shaper_tf;
> +	dm_plane_state->blend_tf = old_dm_plane_state->blend_tf;
>  
>  	return &dm_plane_state->base;
>  }
> @@ -1442,6 +1446,8 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
>  		drm_property_blob_put(dm_plane_state->lut3d);
>  	if (dm_plane_state->shaper_lut)
>  		drm_property_blob_put(dm_plane_state->shaper_lut);
> +	if (dm_plane_state->blend_lut)
> +		drm_property_blob_put(dm_plane_state->blend_lut);
>  
>  	if (dm_plane_state->dc_state)
>  		dc_plane_state_release(dm_plane_state->dc_state);
> @@ -1488,6 +1494,17 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
>  					   mode_info.plane_lut3d_size_property,
>  					   MAX_COLOR_3DLUT_SIZE);
>  	}
> +
> +	if (dpp_color_caps.ogam_ram) {
> +		drm_object_attach_property(&plane->base,
> +					   mode_info.plane_blend_lut_property, 0);
> +		drm_object_attach_property(&plane->base,
> +					   mode_info.plane_blend_lut_size_property,
> +					   MAX_COLOR_LUT_ENTRIES);
> +		drm_object_attach_property(&plane->base,
> +					   mode_info.plane_blend_tf_property,
> +					   AMDGPU_TRANSFER_FUNCTION_DEFAULT);
> +	}
>  }
>  
>  static int
> @@ -1540,6 +1557,19 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
>  							&replaced);
>  		dm_plane_state->base.color_mgmt_changed |= replaced;
>  		return ret;
> +	} else if (property == adev->mode_info.plane_blend_lut_property) {
> +		ret = drm_property_replace_blob_from_id(plane->dev,
> +							&dm_plane_state->blend_lut,
> +							val, -1,
> +							sizeof(struct drm_color_lut),
> +							&replaced);
> +		dm_plane_state->base.color_mgmt_changed |= replaced;
> +		return ret;
> +	} else if (property == adev->mode_info.plane_blend_tf_property) {
> +		if (dm_plane_state->blend_tf != val) {
> +			dm_plane_state->blend_tf = val;
> +			dm_plane_state->base.color_mgmt_changed = 1;
> +		}
>  	} else {
>  		drm_dbg_atomic(plane->dev,
>  			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
> @@ -1575,6 +1605,12 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
>  	} else 	if (property == adev->mode_info.plane_lut3d_property) {
>  		*val = (dm_plane_state->lut3d) ?
>  			dm_plane_state->lut3d->base.id : 0;
> +	} else 	if (property == adev->mode_info.plane_blend_lut_property) {
> +		*val = (dm_plane_state->blend_lut) ?
> +			dm_plane_state->blend_lut->base.id : 0;
> +	} else if (property == adev->mode_info.plane_blend_tf_property) {
> +		*val = dm_plane_state->blend_tf;
> +
>  	} else {
>  		return -EINVAL;
>  	}

