Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7F47ECA83
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 19:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA4F10E55E;
	Wed, 15 Nov 2023 18:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA85310E557;
 Wed, 15 Nov 2023 18:26:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OWhJS/5EXPuBnl3B2HGGJUEHD9+521Z76ohMQr3wvo2DPAaTZDMTIW0K3rzm+zx5ozUS8JVUk3HrITMI8ejvDrTRGHdZFOttTT9dwtzwDmde5z7bNCUON6JDFRMbkLU+Jnd0mDUj5c0pXU+YWh/6LwGsEIP4iw89jlT+mBhD+dewDNpSAvJBukiZqaMV44cp4671YMWkFp+gdeQJ6ro5CDFbFl+wT18Ai85JY2JxgZv1HREgd/LpX4aotwrDFkLC4DIUWsW2OupqNM+3y5/lA3HaTJ8L1FlXkS8LR9cuwZVw3dLr9urGB+gw8SbDZMZc7y3482Wa7FYfR7YPRaZMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Skfk8+gBaJGU6c/knX/gMtReOfr2PFKkZvyobSv4XPs=;
 b=Upw0kiyApba8B+KOFpyPOaDw7UGQJx8gJtqkiy8TlADb9mof2n50XtVGXM4htftdBBdLsSzPA8eNKjlHUUgK450TVnVyzk87zCcFrxxze0JbBADyx2B7Ymx4tdxUWtzFy2SG9UmjSWgBSBNmdHoQaQFG/WIzJyvlV2RI6mCa2d8NZC8R8Tx8LYlt4gwkQENJR1+NZJirgjnnWG7svAKarPA4meoisr9KxAJZkTGi663bvLiVHO3xh9v04A1mIJwuGZE35hfGRx7xraa4rm3np7kdfAI8QfqzHcGQbLgWDuaKKDBFNLvv/gg8vJ6ql+o2+CtYlyiJtykbQgqcFPbtrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Skfk8+gBaJGU6c/knX/gMtReOfr2PFKkZvyobSv4XPs=;
 b=WApGt8oPuCUX9+fV4qUcBa4AFaLpOlIqSJj6N+3DYLprW29iJmQrbVTOI4OwslcqNhmQNYxLSF+L2T0dcCiIkYXvU8aB3ueLnajfgpb5vWCEOo4gKb5wxIsj3l5SI1+V1FwDMpTb7dOo6TDyYpWuP3CSMhdunGBiIvm2t3z1W2g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ0PR12MB7083.namprd12.prod.outlook.com (2603:10b6:a03:4ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.22; Wed, 15 Nov
 2023 18:26:53 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a%5]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 18:26:53 +0000
Message-ID: <64654c3e-6813-4d40-b7bf-f73e36c59e6f@amd.com>
Date: Wed, 15 Nov 2023 13:26:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/32] drm/amd/display: add plane HDR multiplier
 driver-specific property
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20231005171527.203657-1-mwen@igalia.com>
 <20231005171527.203657-9-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231005171527.203657-9-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0256.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::23) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ0PR12MB7083:EE_
X-MS-Office365-Filtering-Correlation-Id: ee6c2a40-03c9-416f-5b2d-08dbe60870d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KKJNOSMdtfexWaPkFRCEq4aBnAO6kPMB1dfRaInbE6Bt9JQCFIsJmFhFuN3Yx11NYfzKGGV0DycVCPWpNWjJnGwe9VEeB6Ed6ppR1B7zzNqb2CoWYtiXgulgNTCa1A34LtAAKr+3tglYH9FHeqntVRDhnwFsxYttEYJkp7fYLJ+WMSDKC+5bllEP/QT1gcDeNv/YxkRCMzp5mBLffH6Ut6fXjLpv5P28WjZ/dEPhsMAva3UdE9lSUc4Cd62TleccM0uS77i8NNm+8he52b6rd7tti5h+H6xBJPE+VzaCBlDYQAX8D5m1XvxuevssyaO+H7tuvu92UXfww0gQdgZH+0LVy8S8fAqGMPPMLJNvfTREmMy/QtlA/S1Oeup462cpC6xsQjlm6DpN18l0LieeEuFNDDg/h9WZEdRQdkwn4CIC+6NstVRabhqycxV22x4Juz+Vj70fy/vK6oX6PHvIKjq2UPqThI8EFfb4M6okwSwi5m4zKnXFhdY3R2yJjl9Bfi4/BUP76x2fuEM6py6bGMizOVkvt8A9MyMZ1t2EQZQFTiI+iSz62BZwBz+2W+yg5uYmFDDWAv3svITbJx9qUDgYvPVMdgYKuJGcuejww2QVf6GNG5kd+b6/b0ZBE3VFGSHN9IcIi+isMLM95P3H/EkhGZBuo74t0qRCE5bAWYU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(136003)(366004)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6512007)(83380400001)(54906003)(316002)(66946007)(66556008)(66476007)(38100700002)(110136005)(8676002)(8936002)(4326008)(6486002)(478600001)(31686004)(36756003)(6506007)(53546011)(44832011)(7416002)(86362001)(5660300002)(2616005)(921008)(2906002)(26005)(31696002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHZIcm1LZjlJaTB3M2ExSU9mci80b0NmNEk2akxUTlFLN1p4K215ZTZCT1h6?=
 =?utf-8?B?cG5lMEJNMkpyenNORW9EVnkxQXlRZ3dKMTNnZHg5Nkg2cHFKc1BNcXhTbk1C?=
 =?utf-8?B?N21sZGdHWU8yczY1Z0dhRFQzTXlxL1MwVSt1NUFsZlVScThBNGxMWk1DV1FD?=
 =?utf-8?B?VTZGdmtqUExpdDRrc1ovdEJydXpHOVVhYzNoY3Y3ZmtSTHUzK3B4MjZQMS9n?=
 =?utf-8?B?M1hVWk8zRnJRdzFUYnJvRFRGR3VMMndYazMwV3lPZWs1OEFOemV0UGhUYVZY?=
 =?utf-8?B?QWU2WEdtYlBjVGwra3RiRC84SE1sR0k0SkhES2tBUFZTK1A2ME5ab1ZGSVVE?=
 =?utf-8?B?bVNBbVNFdzZhN1ZhV1VjbldHM1hWUlJtZG84eVhzRFNqK1loMHBCWFNoN2Vk?=
 =?utf-8?B?TFJmdjJyMFhndVpNUGJpZTVJQVdDb09hOVl4Sy9mbGRyU0dMZVIvc0ExeXds?=
 =?utf-8?B?dkVGUmV5OWZ0Q0VEYWhGQ0N3aWlzanhQa09zZm5WbTlTNnZWS25VYUJBLzVN?=
 =?utf-8?B?UHMrQVRCZ1Iwa1p5Z3BqNjQ0a0VVRDZoWVQzMHFzN0d0dCtxVzZVaTNJS2dX?=
 =?utf-8?B?TVhHUWJVUmdHK3pnTUROUVAwSnJsNUJMM0craFBtMCtlbGlLeVJIUjlOS3BM?=
 =?utf-8?B?eTNBTUlvT3ozb3BVU3RKMVUveVBpR1hEbFYxV284ejdFNnJKNTFtYi9WaGd4?=
 =?utf-8?B?b2QzN3JmMHR0UTN5bmN6NWVmTnN1dlo1UGR6NGIxbUE5T1BweHcrdkh4dFcy?=
 =?utf-8?B?Nnc2QXJJZEhuZ3RNb0VMdFYyVEw5a0tKbGRyREtHV09TdUQwcHMrV2Z2U1M1?=
 =?utf-8?B?QnZYSWNoVXRVbUNpaklaWk1hK1AzNHVHcE5tbDlwUnRRZFFtbjZEYTlKeHFp?=
 =?utf-8?B?YmV0ZXU3aUJVUEYzN1huZEN3TjVZdjFjd3loUHVteG5NRTZWMTVvT2JWT01Z?=
 =?utf-8?B?VkhsbDF4SGEvdmxmMlh0Z2hBaHQram1TaWgyVEFxblZFTWN1TDFmaFF4MTJ0?=
 =?utf-8?B?clpoNXphbUE0bkRReEJtclJOOFFNRnluM2RNU3ZHVWV5dWtLc252dEx6OHBS?=
 =?utf-8?B?WjkyN1JrN2swc2E0MVdhY0x6MzNoZlhZL1JUNHBXVVcrY1I3cGFDWEZFZ0Jz?=
 =?utf-8?B?cmw1bUoyajBuTU9PZjd1c0djdFVGcHRRWDV2L1VXWWhhRG45dG1CbVRHV3RO?=
 =?utf-8?B?QndWYmdQSm9Ec3c4NlJxUzVDMm95MXk2WDBaTEw3eUNvbzFrdlVuclVqUHda?=
 =?utf-8?B?Q2FkaHRGUVdsRHl5MGZuNVdzQ1VJZU8zUEJiYTluRnZuSmhLc2hYb2xhMjNa?=
 =?utf-8?B?bzhNZGdxQ3M3OXYvWjFyUGxqVWg4R09pY3FBdEZobVd2NGhESmlOUmRPUHl2?=
 =?utf-8?B?OEdlUlNSME5KTHRzT0pqUWdxMjMxbXZBdXV1THBEbDgzb3VhblRuWitSYnUw?=
 =?utf-8?B?SXVDVStBNi82dUZjcHNrN2VBUCt5SnpUUjl4MFNWNEpiVXpNQW0yRnZYNzNs?=
 =?utf-8?B?V0daRmdhbS9UNFQ1aUFrdDNqRmlsbk4vV0JjSU9hMVVYakhDdzdnK1pwWVI3?=
 =?utf-8?B?RTBFWlBIUjJsNlV1Zis2M0gxTFd4L2tZU1RqNFZJR0w1ZlF1WlI1VFpCS0FQ?=
 =?utf-8?B?MStNNURQdkM3cVNWMkxQS3BsWTR2a1lDcVVQd3JGZXJBRlAxVkZUMXU5UFlE?=
 =?utf-8?B?a0E5a0lWUGt0VWFaa1hQNklOQ1hjRnVvbEEvUVIwdDBpNXdKNE1rSzdSK1RM?=
 =?utf-8?B?a3lXRU45Uml3alRKUVh3TytEa0RiVE9PZFFadFJFK015OFZGbmxJVlFvN0U3?=
 =?utf-8?B?OWdsNWZIckI5Tk4vdStKRlhja3pqVUZNY3JaeWdNZlRPUG9CcjVidGRZRzFw?=
 =?utf-8?B?a3V6Q0lSRHhXdi93Mk9TUUhkWk5YdU1vWWhxMFFEQ2QvVGdJZm50SU5kdXJm?=
 =?utf-8?B?Y25TaXZ0ZnJaR1ZXMDF5WURPL0RmcU8vTnhhbTVoWkNldzF0dU4ydmczNWZa?=
 =?utf-8?B?YlY2ZHY2T1diSk1zYXhITE5RdzgreDFrVXVOZ1hzbUNYM3hWaDlhU2w4K0E3?=
 =?utf-8?B?bWl3RllkdGtMZ1NpMXQyU25WelBOYS9TUEF3M2wyM1lqN2IyMDVFbHhXNjlI?=
 =?utf-8?Q?TCwE94u5Fw0Rb0fN9lqIGpfHE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6c2a40-03c9-416f-5b2d-08dbe60870d7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 18:26:53.1987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: plhvg8r0SAhu3/LQH8C2ZiQVXF1aQkwJhHbkkK+O7BaNWhx7TF9udaNSr9AEcA06nHRkK9qrXk5ssQnHl/Jqog==
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
> Multiplier to 'gain' the plane. When PQ is decoded using the fixed func
> transfer function to the internal FP16 fb, 1.0 -> 80 nits (on AMD at
> least) When sRGB is decoded, 1.0 -> 1.0.  Therefore, 1.0 multiplier = 80
> nits for SDR content. So if you want, 203 nits for SDR content, pass in
> (203.0 / 80.0).
> 
> v4:
> - comment about the PQ TF need for L-to-NL (from Harry's review)
> 
> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> Co-developed-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h        |  4 ++++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h   | 17 +++++++++++++++++
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c |  6 ++++++
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 13 +++++++++++++
>  4 files changed, 40 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index 9b6fab86c6c3..62044d41da75 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -359,6 +359,10 @@ struct amdgpu_mode_info {
>  	 * to go from scanout/encoded values to linear values.
>  	 */
>  	struct drm_property *plane_degamma_tf_property;
> +	/**
> +	 * @plane_hdr_mult_property:
> +	 */
> +	struct drm_property *plane_hdr_mult_property;
>  };
>  
>  #define AMDGPU_MAX_BL_LEVEL 0xFF
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index fc4f188d397e..bb2ce843369d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -55,6 +55,9 @@
>  #define HDMI_AMD_VENDOR_SPECIFIC_DATA_BLOCK_IEEE_REGISTRATION_ID 0x00001A
>  #define AMD_VSDB_VERSION_3_FEATURECAP_REPLAYMODE 0x40
>  #define HDMI_AMD_VENDOR_SPECIFIC_DATA_BLOCK_VERSION_3 0x3
> +
> +#define AMDGPU_HDR_MULT_DEFAULT (0x100000000LL)
> +
>  /*
>  #include "include/amdgpu_dal_power_if.h"
>  #include "amdgpu_dm_irq.h"
> @@ -767,6 +770,20 @@ struct dm_plane_state {
>  	 * linearize.
>  	 */
>  	enum amdgpu_transfer_function degamma_tf;
> +	/**
> +	 * @hdr_mult:
> +	 *
> +	 * Multiplier to 'gain' the plane.  When PQ is decoded using the fixed
> +	 * func transfer function to the internal FP16 fb, 1.0 -> 80 nits (on
> +	 * AMD at least). When sRGB is decoded, 1.0 -> 1.0, obviously.
> +	 * Therefore, 1.0 multiplier = 80 nits for SDR content.  So if you
> +	 * want, 203 nits for SDR content, pass in (203.0 / 80.0).  Format is
> +	 * S31.32 sign-magnitude.
> +	 *
> +	 * HDR multiplier can wide range beyond [0.0, 1.0]. This means that PQ
> +	 * TF is needed for any subsequent linear-to-non-linear transforms.
> +	 */
> +	__u64 hdr_mult;
>  };
>  
>  struct dm_crtc_state {
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index d5dbd20a6766..caf49a044ab4 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -224,6 +224,12 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
>  		return -ENOMEM;
>  	adev->mode_info.plane_degamma_tf_property = prop;
>  
> +	prop = drm_property_create_range(adev_to_drm(adev),
> +					 0, "AMD_PLANE_HDR_MULT", 0, U64_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	adev->mode_info.plane_hdr_mult_property = prop;
> +
>  	return 0;
>  }
>  #endif
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 04af6db8cffd..ae64d4b73360 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1337,6 +1337,7 @@ static void dm_drm_plane_reset(struct drm_plane *plane)
>  
>  	__drm_atomic_helper_plane_reset(plane, &amdgpu_state->base);
>  	amdgpu_state->degamma_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
> +	amdgpu_state->hdr_mult = AMDGPU_HDR_MULT_DEFAULT;
>  }
>  
>  static struct drm_plane_state *
> @@ -1360,6 +1361,7 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
>  		drm_property_blob_get(dm_plane_state->degamma_lut);
>  
>  	dm_plane_state->degamma_tf = old_dm_plane_state->degamma_tf;
> +	dm_plane_state->hdr_mult = old_dm_plane_state->hdr_mult;
>  
>  	return &dm_plane_state->base;
>  }
> @@ -1456,6 +1458,10 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
>  					   dm->adev->mode_info.plane_degamma_tf_property,
>  					   AMDGPU_TRANSFER_FUNCTION_DEFAULT);
>  	}
> +	/* HDR MULT is always available */
> +	drm_object_attach_property(&plane->base,
> +				   dm->adev->mode_info.plane_hdr_mult_property,
> +				   AMDGPU_HDR_MULT_DEFAULT);
>  }
>  
>  static int
> @@ -1482,6 +1488,11 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
>  			dm_plane_state->degamma_tf = val;
>  			dm_plane_state->base.color_mgmt_changed = 1;
>  		}
> +	} else if (property == adev->mode_info.plane_hdr_mult_property) {
> +		if (dm_plane_state->hdr_mult != val) {
> +			dm_plane_state->hdr_mult = val;
> +			dm_plane_state->base.color_mgmt_changed = 1;
> +		}
>  	} else {
>  		drm_dbg_atomic(plane->dev,
>  			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
> @@ -1507,6 +1518,8 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
>  			dm_plane_state->degamma_lut->base.id : 0;
>  	} else if (property == adev->mode_info.plane_degamma_tf_property) {
>  		*val = dm_plane_state->degamma_tf;
> +	} else if (property == adev->mode_info.plane_hdr_mult_property) {
> +		*val = dm_plane_state->hdr_mult;
>  	} else {
>  		return -EINVAL;
>  	}

