Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8382E64A551
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 17:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1927510E143;
	Mon, 12 Dec 2022 16:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2042.outbound.protection.outlook.com [40.107.102.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1694310E0FE;
 Mon, 12 Dec 2022 16:53:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0Wf5Uy9CCRWljXJ7G1roTY06Uw8/OE7rFeh824eNIKdvMLecYpU7+EDKWCLAvZMnWfQ82IyACPxBMioy4onA/iC28bvIY2SIkQZkxmLfhrgOP9gWfb8UvT58QOx0R/nktX0vglxIPkRihaIC2vEFVbeNkSR46tieV1cFpjbl50kjXmOzaIVRXTdggzGgKFr5fmPqX9E1R2Hl5xpmmj+Zy7zl9w112Tbo3a0ekXYB/LbMEs3WluWm763eb73yIuDzujGmi6EEhYTJiYGbQdNv1F8AUqY2gsI7VbiSIQB/FwXWD+mrFdOJf0pdK/G+FxeZstIqpW+/ycQKaGCG+vT5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Og7PpXcuEWZIia8/JU8TQXK4kA1HlcTT3z+g3VHxYSs=;
 b=YCWxsKUw7+vmlaG3xtRmulxn8hoGPy0dDfI6iPyKo2nPX5qe5HXnO4QhXAUFHWHQSUitaoVgyim6771vsAIoHNU7jLGYdT+18YoVzWF0PYXiI87A2xax+UymIkSuoNV2iNxynHM31Vf1ZGZV9TmFOXcn7PdELzVFuHg9pN1zMQlsfNMonn7KqtrZBq5YJ59ExKEtMFDV2dmQQPXCE4L76L+JdN3CcaHVu7gIKHAf7wXc4wjPOWtYT3xtSOh17tK4CgSQzrayNVmAuAzcqTajfUgRHm+js1cTy43kL2C0qTDaX7Ha7Jz324UG1rEnJ+o9aF/a+KMIa+74gRsDniaUnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Og7PpXcuEWZIia8/JU8TQXK4kA1HlcTT3z+g3VHxYSs=;
 b=mD4GcsjQoxNVZkAuGkYmzp11Aw5hcKa23AT6NhL1/nY42JxsHwVCIVSYhiErQTroLRedAYUIXgHGkks+BNHuOfL1erQVRwgdpbLwieUKZbHnXJocR3a0QYaehWE5cOJTaW58rgKfIAjxfRvJFVkPxaemHW5IBv7JTvVa/jF8JgM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ2PR12MB8157.namprd12.prod.outlook.com (2603:10b6:a03:4fa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 12 Dec
 2022 16:53:40 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::2d6a:70d0:eb90:9dca]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::2d6a:70d0:eb90:9dca%9]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 16:53:40 +0000
Message-ID: <926aa687-e99f-1e4d-a133-22ab884e60b6@amd.com>
Date: Mon, 12 Dec 2022 11:53:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2] drm/display: Add missing Adaptive Sync DPCD definitions
Content-Language: en-US
To: Sung Joon Kim <Sungjoon.Kim@amd.com>, rodrigo.siqueira@amd.com,
 alexander.deucher@amd.com
References: <20221209220021.4413-1-Sungjoon.Kim@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20221209220021.4413-1-Sungjoon.Kim@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0042.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::19) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ2PR12MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: 1500fe05-3aca-45ba-7d2c-08dadc616a09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rWUGtUpvj+f1I/9yBE9Jj1uIXu7j1QsgZn9mSszmwlAnYIzZ+1eRpCedL3h1YNSqho8Qif/me9C9fXzR0DG7151xn+l0xU/V5jfNdtBCis9jPJhuOTP/GBKw0he5xXS8JHHBOKcJ7ITCmftGuvXQRoIQYgvgEiZvGaP1gTsmHrmGALYXl8f0ZuV01kM9s8Ey7UGynNuM2uzg6LyMGEAsRxlrWVPv5lVHbBN2MYquYCqLqjRgEW2Pn7qt2yrG9/g/lKGlIHMZ8k2fjzpUJxL1U/Sx7OApBYH2xxxmugZa9LpDCKo8GODdWKiZVq95VLhu2lrO5mUvKwwFY59MvGVx0hxIMPbwbu5L/Cjgn/f7ISO5EoMCVjYzoF/2SYakwQoLdQgr+nSKewbfUXUpA+S7+q2cF6S0EwHJI9Q0cpW1m1OmpzSBmBhClQK/tD7ybM/FS83WieYQIbqq2AhBjs2wjSIa0RCQR0wvFQHLjHocM8Unh6y7TN11uXHsk6OVnVoZXapabD2QlS/xgR6OKERV/MwJmI2R0uHspotwkMQwNKVz6si0lMw4/XOLI2sYqcqJjeLiMZyr7BW1a8lQJBR1Rxx6coS9jmU4WL5EaD4M5sX19+AoDA1Ee1R7aNqs5vtyzgPyhyHlzBypuosFiCXHMAk0mcnYan4qLQQJLo7riTUfcaeRRx3aCGIOKJRwc/h6qAY2dKMLa4eKMLfyGFZjDO09Wc9yw/9SWKaCXSf3UZ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199015)(6506007)(31696002)(53546011)(86362001)(36756003)(6486002)(26005)(44832011)(6666004)(66476007)(8676002)(66556008)(2906002)(4326008)(8936002)(316002)(450100002)(66946007)(5660300002)(6636002)(186003)(38100700002)(41300700001)(2616005)(478600001)(6512007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGdyVFJLWUtzcjFTVmtPc2RGcUU5eEZ5cTVibW5ybEhkNEVrdE1TSnlKeVph?=
 =?utf-8?B?UWtVWE5zS0pHYjB1bTNpMG84Z3BtNE1NR3U3RGpYY2kwWWI4ZmcyYU1pTFo3?=
 =?utf-8?B?U1lrUXZlOTU2UWJBdklBZDd6R1lwSlVqbmYxU0k4S0h5TVdjbGk2TXRQd0xz?=
 =?utf-8?B?ZzJ6ZElUMUM2dWRodUpHeXN0MFZLY2Nxbk5NOE12Vm1wRkdVazdoYmRTcTdP?=
 =?utf-8?B?Yk1yUkZCV3lKck9yK3ZkeFF5K204Si9wOVE2ZDZGTktmYnhWOWRYZTNkejZw?=
 =?utf-8?B?Ym1obWdXOFZwSVJBenoxQllOZ29qWnFWV1ZYTnJwdEhueTgxU2ZQR1RmSG9x?=
 =?utf-8?B?OUNoeENKb1hXN2hRTitBNEUvNFpPd21US1hkRElNdEQxVS9wUU82OHBLTjJz?=
 =?utf-8?B?bDBTY29TS0NEeWt3UE1uQ1YzNERjNWJud3B3TDRBRjlJQ1NoeHlSODU4NW4y?=
 =?utf-8?B?dTZiNGNWOFNVV0dseGRlRW5PdThQMUZwWVJycUlIK25DNW0weXJoL1dzL1JE?=
 =?utf-8?B?YlBSbmE2Y1hvQnUvWlpvREZTZDRVa1lZcE9HOG1TTE1FaUdSeW1RS2YwR3Ay?=
 =?utf-8?B?YmZzOGhpTTUwMzk3ZG82aSt6T0xPWWs5TEo4aXk5L1NqQ1BsTWJDc0RWRGY1?=
 =?utf-8?B?ZURrcVRCTHRBalQ0cndYcDFGc2JvNys5ODVvSzZzSSt3WHBsS1MvM0FhRzNi?=
 =?utf-8?B?dWw1cmgrRGYwZVdsSG5GMFFSbEtyNDViMHdoQkpwMlJ4SHJEQm44UnFZUjNP?=
 =?utf-8?B?ckVxZnkrWFQvc3d3cjVtTWd4K0YwTm04MlBTMmcwVmZMd2lGd1RJL2ZNS1ZB?=
 =?utf-8?B?OWpQZ3NRcDRlejltS1RBK2o2akpyVWtUaWZ1dFNxeFJlakNlc0kyekVORmlT?=
 =?utf-8?B?T2FKYkZ0eTJkVElGUnM0ZFVhVkpiampaVW5leWcxK1N4cTlDYkpGYjFCU3NM?=
 =?utf-8?B?L1ZnNnA3ak9oQjV1VVRsUlVKQkdiVzJpUXcwZ2tkbXV3M2RBRmY4b1Y1NmxP?=
 =?utf-8?B?bDkzeEtLSTZOc0gwakw5elQzYnJ6V3d4a3JCRVg4R1FGYnlTOWUxT2Y3MzBL?=
 =?utf-8?B?OGlZSWRqWHdVdm5aYktSbDhldy9FNEhWWDBrYVA4c05YWjBoNHFvNFEzWHBZ?=
 =?utf-8?B?NjNvNks4N1FtUUVnUjRqYlF2TmJTMTdodS82MVNEaTlneWRnYUN5dTFlakNQ?=
 =?utf-8?B?Smo4LzByYVVQSG1WSTV6bDUrY2U0dS9nMkNSSW1SZnNFMHJVS0R1My9jVU9R?=
 =?utf-8?B?Zml2aUxNQ0ZzQWp5L09IU3VodnJEWmttbytkRGhMUExMaWJTdGpHNVNidVJx?=
 =?utf-8?B?dVFBU3JXOHlzRnRRVGJtL05UWm9nckxzYXRxTzU3akdhU2NtQ21ZUXpVd3Ux?=
 =?utf-8?B?dGY4djFMVXNOdm5mK2RWNk5ROHFjYWFldlhOOENsQ3B4OHhPcXNKQ3NUYlpj?=
 =?utf-8?B?VHNCK01nbUw5ZmpmSW9xQk9qeGRuU0l0SDRkRHRKOEZ4d2I1bTlpUHovbnQx?=
 =?utf-8?B?SHZ1VEtjbkU2cjJSWjI5eCt6YU1xVTVSSjQ5dE53RTFjci9WNmZCT2UzUWEy?=
 =?utf-8?B?Wi93djVRTjQzSUtMRndpR3hQbUJkZSswZiszaENxVXB6bHo4c1VOY3FJeVU1?=
 =?utf-8?B?bnFaNis2QlM5TEVJcUUxOE5RdjRKNFo1MjI3Mmc2WTA5MkRhQ21FbmV1d3Yv?=
 =?utf-8?B?RjdwTGRITlN4d3pCcU1UNU9iTzVScDJMMXJzNS95Qzg0Ry9FTDFzWDdqOEN4?=
 =?utf-8?B?ZnRqcTNlYzRURCt0blpkaHU3cWUwanJCTVFoa3NveExRd3NaTTR3Tzh2K2U4?=
 =?utf-8?B?YXRuZUR0YWVYZTRSSUg0dHJmN3JjeU1zbXpiTVFieUUyZjNtQy8rRStoZWpP?=
 =?utf-8?B?VlZ0aXRjcHRtUzBnN0JJTVdYYzNQTVNwc1UwMlhUaGNpejhUYmlkVDVyVEUw?=
 =?utf-8?B?akozRTVtY0xFNEtJK0prT1dNMXRIU1hLb3pRRXIxRk1PUkhYSHZ3UmYwNFpH?=
 =?utf-8?B?V29NWVpDcldqNjJ3ekFRVHoza0F2aE0ybU5ENURYYU1TWEo2YWVUL21oSnMw?=
 =?utf-8?B?QXZ2V0ZGYklsSGx4WEhPOVAzM2RnN3ZTcHlZRG83WVZSOU9CUFd3NHFhcll5?=
 =?utf-8?Q?QhksYRDiJK4wSvQFUSQCAq11W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1500fe05-3aca-45ba-7d2c-08dadc616a09
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 16:53:40.4029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BTB/uys/J4/LFYWWZSaWlSZeIEqr0HHSowopW70SnwuVMSul6Slbv3DSnP5LuXGDjDuMxxf0JDKtYycMLdM6ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8157
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nikola.cornij@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/9/22 17:00, Sung Joon Kim wrote:
> The missing DPCD defintions from DP2.0 spec is as follows:
> 
> DOWNSPREAD_CTRL (107h):
> 	FIXED_VTOTAL_AS_SDP_EN_IN_PR_ACTIVE (bit 6)
> 		For sink devices that support Adaptive-Sync operation
> 		and Panel Replay
> 
> DPRX_FEATURE_ENUMERATION_LIST_CONT_1 (2214h):
> 	ADAPTIVE_SYNC_SDP_SUPPORTED (bit 0)
> 		Bit to check sink device has Adaptive-Sync capability
> 	AS_SDP_FIRST_HALF_LINE_OR_3840_PIXEL_CYCLE_WINDOW_NOT_SUPPORTED (bit 1)
> 		A sink device that clears this bit will generate VSync pulse
> 		leading edge of the HDMI output on the line count at which
> 		Adaptive-Sync SDP is received as long as source device transmits
> 		Adaptive-Sync SDP either in first line or first 3840 pixel cycles
> 		of the line whichever occurs first.
> 	VSC_EXT_SDP_FRAMEWORK_VERSION_1_SUPPORTED (bit 4)
> 		Bit to check sink device has SDP framework version 1 capability

You're missing your Signed-off-by. Make sure to add it before pushing.

With that fixed this is:
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  include/drm/display/drm_dp.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 4d0abe4c7ea9..1bd6f9af0b46 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -603,6 +603,7 @@
>  
>  #define DP_DOWNSPREAD_CTRL		    0x107
>  # define DP_SPREAD_AMP_0_5		    (1 << 4)
> +# define DP_FIXED_VTOTAL_AS_SDP_EN_IN_PR_ACTIVE  (1 << 6)
>  # define DP_MSA_TIMING_PAR_IGNORE_EN	    (1 << 7) /* eDP */
>  
>  #define DP_MAIN_LINK_CHANNEL_CODING_SET	    0x108
> @@ -1105,6 +1106,11 @@
>  # define DP_VSC_EXT_CEA_SDP_SUPPORTED			(1 << 6)  /* DP 1.4 */
>  # define DP_VSC_EXT_CEA_SDP_CHAINING_SUPPORTED		(1 << 7)  /* DP 1.4 */
>  
> +#define DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1         0x2214 /* 2.0 E11 */
> +# define DP_ADAPTIVE_SYNC_SDP_SUPPORTED    (1 << 0)
> +# define DP_AS_SDP_FIRST_HALF_LINE_OR_3840_PIXEL_CYCLE_WINDOW_NOT_SUPPORTED (1 << 1)
> +# define DP_VSC_EXT_SDP_FRAMEWORK_VERSION_1_SUPPORTED  (1 << 4)
> +
>  #define DP_128B132B_SUPPORTED_LINK_RATES       0x2215 /* 2.0 */
>  # define DP_UHBR10                             (1 << 0)
>  # define DP_UHBR20                             (1 << 1)

