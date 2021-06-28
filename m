Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4913B64E1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 17:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4D26E499;
	Mon, 28 Jun 2021 15:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8351C6E0A1;
 Mon, 28 Jun 2021 15:14:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AN9hx5wQ+EBAM9LFreP3f5cHNeZaMF02vjrru4zHeox2TXbHB7/jJNnSJKA/aIjbVMsPYAGOG91z8m6gvk1tweRziuhzykqOdL3QpWyocdzVCPdqjS/zIE7TfSoL4ldGO3qYabXtw2niG5lWVTiNvVcfBgXdp3SlMYBr/pbgwwIzOzphxqej+zxGmCbt4vGLmUEE7K+Hvw0UauVdGhVqg8niIebNK0C/FF2IvFASx6l7qFAJGWKuslGybQd+SDAFap8RGwG+riIBHfjrCKR8ODH8fW9PbCAXF/u7G358fdkHHlIcJXa1/Np7Q7nYRrRMcNgy3f//mv+AmFw9/+UjTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWCryGTSRJURVf1dsvczAd0A0/wgY2sbdXWgBTaxPfU=;
 b=h89mWYQhLE36HxJlWE0FupteFI2celu4AVX4RAnhuboBrC1qBg0jLVnqu47/NgHvkFblMrPk4EDTCIrNVXZhDXdbKWx3Lba7wyvKdUTPISdAL1ye9Psur5J+B91QlJHKwwtG6sxT0t6TDnvNr3cMQ87SPumQvrQX8+IYirhjyDF3Rd9ka76yhnM3iPW57cvWFPWcpTawmnzEAnZEtZtAspiv0owqAUvAKQwXNvToXZjw4H1Wo3bUzbOBNRFWWDqSnlYK5I0bqmxBxB0TGth5tL+NkErHC5PkdQeA8aJW0iroaxi/4fTIO6MyVXiWYkjlsdqJ5eXakm7DoGD2hqRYJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWCryGTSRJURVf1dsvczAd0A0/wgY2sbdXWgBTaxPfU=;
 b=vtSCbh+dmx1IZH5FiyVEP6cs7+I15RmxIZ3wRuED8RrFgdxAfEE9XTbW/y+fGiHBarRzRBKZeuIt1HXfXVH1fnstuRHg3zbfkhkIVoR+iNu6XOM7h3qZ76FNriV0updQxItCZk4wIx5yuxkuBrkGEZkoBw1sx6FhzGbI1/CzZDo=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5441.namprd12.prod.outlook.com (2603:10b6:303:13b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Mon, 28 Jun
 2021 15:14:53 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::401d:c7a2:6495:650b]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::401d:c7a2:6495:650b%3]) with mapi id 15.20.4264.019; Mon, 28 Jun 2021
 15:14:52 +0000
Subject: Re: [PATCH 04/21] drm/i915/xelpd: Define Degamma Lut range struct for
 HDR planes
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210601105218.29185-1-uma.shankar@intel.com>
 <20210601105218.29185-5-uma.shankar@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <cac45158-a7b9-c92e-eaf6-1067c29497e5@amd.com>
Date: Mon, 28 Jun 2021 11:14:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210601105218.29185-5-uma.shankar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [198.200.67.154]
X-ClientProxiedBy: YQBPR01CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::37) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.50.3] (198.200.67.154) by
 YQBPR01CA0137.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:1::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 15:14:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b43545d0-ad35-41ef-42d0-08d93a477aa8
X-MS-TrafficTypeDiagnostic: CO6PR12MB5441:
X-Microsoft-Antispam-PRVS: <CO6PR12MB54418A426E758156F96376088C039@CO6PR12MB5441.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qj3jEi8O2JRc4Tfr727oCJ67FGJbQdd4wOLqZhiY6X0GdG9s0Qezytn/OKPIxnD8D4j6++mJP4N96ooF7G4V3tZDo85cq4SPQbJ6nQIx5gB5vvZhVccXGmAJsMnWRvBd3f566DBzmTT7VfI/CZu/8Ldbw4WfqxYwwmj1d8YgKDqVd2EXZk3+HQ2td3BA3zioVmQfHSfYGgpFN/x4v6Wf+BbdOP3JOCDNOJJVkTU5Dzqu7EuzXQ4LNxhTPo4So9x/rqPzoyy95WuE14jWfr3p0hElbRrzVfj8CLhGfWpoLxDD4ysMpx2U8kSlur+LLYCFQ3CuZ8cqQNKQSThZ+60Bn8jj61xQKeHVrxGSL7Ozi3EGXmfelybTSB162zbrHVFANPW0NaXX7osbmZiwN5190dbldEKnZ+7W6fZrcylXxSr8bB5ATyJ4rp/O6nOA51J1FL2iyNHACVxDaMSaQQBYrwpHAhQ2IyJSGy81u8vAmOt87PVHETjECWMTS6J/l9mwBrJjc01HfSEg41vlnSvJxKzd8IMY7lUup4Fgipf2wRCg4hQtBwbbAYpTqMBg9P7qFy971UX09Xn8to5QhtJLEXpZzsrs7m/6GPixviVePOBrIKOoKScFLFPyJPO1ZA8fm4rKRSBkcjCz2Nj9UxiuomCYO5PpsoDoxsV1eHJw1WYRdYSPcyASb09Aydz9YNDTnUejZRG5WC5yga591F62nQ+TM5ECWbrU0ToHqLYNZU0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(44832011)(38100700002)(4326008)(2616005)(36756003)(5660300002)(86362001)(16526019)(53546011)(186003)(31686004)(26005)(66946007)(316002)(31696002)(6486002)(16576012)(66476007)(8936002)(478600001)(66556008)(8676002)(956004)(2906002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1NiZk1EREtpSVFRM3E1QjV4aUhOejI1bnp2YW9TY2tFbytwRnJDNnFiRUxz?=
 =?utf-8?B?SWMxeUR1YkpXNUlRTHBlV3ErWkVFZXRNZThIKy9TaFc3SmxJVmhaMzhNNG91?=
 =?utf-8?B?V3Nka1hYZEhKdVUrckYvN2xXNGtRSXZtTk8zVW9BWWVMT1Irdm5mNzlubVcy?=
 =?utf-8?B?RGc5aG9jUml2eE8wTTBTaTIrazF4ak10TFBLc2htQVk1dUdMdERXT0syZ2xG?=
 =?utf-8?B?VzR5QnZNcU5tbXhWVVFDOE1SbHd6NlBTOHhrbTNYOWFjcjcyZW5aT2M1Vkdw?=
 =?utf-8?B?L1BpQ2RwdjU1SEpCY2hqMXNvbXo1Uno3WERidVVQazlYS28rYTRJZ0hEMGVZ?=
 =?utf-8?B?NHNUVHRDQzhCNFVJaFJnRi9lUTVZT3VURFZjRFJMa2laWnoybHRtb0Yvd0hQ?=
 =?utf-8?B?V056aW9Sa1FWOWZrVlJKSFlMc3BMRTBJNmhkNkpSNE1aRjNneVFIS3QvenlZ?=
 =?utf-8?B?WWY1ZisvY2t6dkhXNHRjekRwdmVPT0JBdkVwQk1Mc2wrZzJoMDAzdGx0bnpv?=
 =?utf-8?B?OWNyWW4yNnkzK2dLYlNIVzZJUUhJVFp3REJJRnlJVnUvTEx1TXNId2lraVor?=
 =?utf-8?B?WGZ4S3VwQkxybWkwMGszaXBHenpRVkxmaVI4R0UvSDMybkRURVY2bTdja0hR?=
 =?utf-8?B?KzdxRFRINTBhbVo2WDRNcnlIYmVTUzRLajdXenM2ZGNpY3dFc0JnWHdVM0xG?=
 =?utf-8?B?Q1BDUGE1KzQ4R0tHRmMzSElDcTkySjlWRUlNalBkTWNjbWtkUi9mRzlpNlBL?=
 =?utf-8?B?UllNRllHSTE0ekg4YVZXZ3FCNUFwdWY4OUJwR2prMWpxaEZPSWRPR2FEdHJo?=
 =?utf-8?B?dE1mS0RXMldReGR5eFhHak9ScHVtQzBJZGQvV01vMHZkaW5OMkZpaUxpN2I1?=
 =?utf-8?B?YUpRRzJlbkVlYUdwbmdRUFNvQkVobXpPbWcyS1laV3ZMdG9ZT3hCOGcxT1Jq?=
 =?utf-8?B?bnExQ2V2RlFhcnlwNXBkUkxZY25FY2xra29RcGltQ0hNcWJuRldwRmtEckdy?=
 =?utf-8?B?cEVNV0JJTGYxTGJuZG1ZZUk1cFk5WXhSakNtZ2RCN2wxWVZmcHR4SU1PUnZm?=
 =?utf-8?B?VVB4b1BySVJnQXdyVzltdkl5NWd1dThBcVBtcTgrUVNaOElyWkVrMkJkZXRo?=
 =?utf-8?B?SXlSS2hUTUU5R1ZLZHlQNDRnUDhOZzdudDJHVjk3RHF0MGo3VUFCU0tQN0I1?=
 =?utf-8?B?cUF0aDhBUWxXcmlLa3UxMlBUNCt0cXdDYWFKWExhZ1Axd0Y5YWxObjFpd2hq?=
 =?utf-8?B?UUZPUGNOUnEyenE3dmUwN1MrSktLTFhnRkFOT3F0a05KRDJQUkw5RGNhK2lw?=
 =?utf-8?B?dEtOVy9ncURHTmhHQ0ptRmc4aDh4TzArRFd4SnhlbFhWVStRRjNOQ2ZlakpO?=
 =?utf-8?B?RmthaG5sR0MwQS92dnNubDlGbTc3U0JKTTBuV0VDUDFVamxXZFJ6UXhhNHhL?=
 =?utf-8?B?YXR5a3ArcUdYVVFqMFZJSFNmUnZwelc3MDlPUVJFN2FIZXdyKzYvZUtJd1hP?=
 =?utf-8?B?T2hPRDNockRkWGd4YlJSR3RlUGs0ZEZ1VEFGRXB2NytmT2tPK1pDL0tzNmtp?=
 =?utf-8?B?Uit5UXdUK0JlQzl3Q011Q2VUWFZKdGNPUUFqWFJSelAyRVF4MXhsQmlqcFMx?=
 =?utf-8?B?ZHdwRGVxa0ROSXJEMit2SFpJN3dRQlJBc1BIZVhNZTJDaGhMVUJKYVlqTlZu?=
 =?utf-8?B?a01TLzJXMTFNVENIbVpySFFBbjJ1QjMvNVpBbVQxN2ovdWdLYzNFK242K0di?=
 =?utf-8?Q?vAR65dYutH5r5IHThKXg6zKy5gF3l8fnYjt8Dwj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b43545d0-ad35-41ef-42d0-08d93a477aa8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 15:14:52.7330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xkCkTv/NQU5kE64o6uTD0ObDJkXB2AlbaEzrFka01guzpQS7XQTLhrduWrWLM5taPhN+NF89HeU+dKU2PZqbWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5441
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
Cc: bhanuprakash.modem@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-01 6:52 a.m., Uma Shankar wrote:
> Define the structure with XE_LPD degamma lut ranges. HDR and SDR
> planes have different capabilities, implemented respective
> structure for the HDR planes.
> 
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
> index dab892d2251b..c735d06a6b54 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -2093,6 +2093,58 @@ static void icl_read_luts(struct intel_crtc_state *crtc_state)
>  	}
>  }
>  
> + /* FIXME input bpc? */
> +__maybe_unused
> +static const struct drm_color_lut_range d13_degamma_hdr[] = {
> +	/* segment 1 */
> +	{
> +		.flags = (DRM_MODE_LUT_GAMMA |

Why are these using DRM_MODE_LUT_GAMMA and not DRM_MODE_LUT_DEGAMMA when
the lut_type for this LUT is LUT_TYPE_DEGAMMA?


> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> +			  DRM_MODE_LUT_INTERPOLATE |
> +			  DRM_MODE_LUT_NON_DECREASING),
> +		.count = 128,
> +		.input_bpc = 24, .output_bpc = 16,

Why do we need more than 16 bpc for LUT? FP16 is enough to represent HDR in 
linear space. Wouldn't 16 bpc be enough?


> +		.start = 0, .end = (1 << 24) - 1,
> +		.min = 0, .max = (1 << 24) - 1,
> +	},
> +	/* segment 2 */
> +	{
> +		.flags = (DRM_MODE_LUT_GAMMA |
> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> +			  DRM_MODE_LUT_INTERPOLATE |
> +			  DRM_MODE_LUT_REUSE_LAST |
> +			  DRM_MODE_LUT_NON_DECREASING),
> +		.count = 1,
> +		.input_bpc = 24, .output_bpc = 16,
> +		.start = (1 << 24) - 1, .end = 1 << 24,
> +		.min = 0, .max = (1 << 27) - 1,

How can max be 1 << 27 if input_bpc is 24?

Harry

> +	},
> +	/* Segment 3 */
> +	{
> +		.flags = (DRM_MODE_LUT_GAMMA |
> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> +			  DRM_MODE_LUT_INTERPOLATE |
> +			  DRM_MODE_LUT_REUSE_LAST |
> +			  DRM_MODE_LUT_NON_DECREASING),
> +		.count = 1,
> +		.input_bpc = 24, .output_bpc = 16,
> +		.start = 1 << 24, .end = 3 << 24,
> +		.min = 0, .max = (1 << 27) - 1,
> +	},
> +	/* Segment 4 */
> +	{
> +		.flags = (DRM_MODE_LUT_GAMMA |
> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> +			  DRM_MODE_LUT_INTERPOLATE |
> +			  DRM_MODE_LUT_REUSE_LAST |
> +			  DRM_MODE_LUT_NON_DECREASING),
> +		.count = 1,
> +		.input_bpc = 24, .output_bpc = 16,
> +		.start = 3 << 24, .end = 7 << 24,
> +		.min = 0, .max = (1 << 27) - 1,
> +	},
> +};
> +
>  void intel_color_init(struct intel_crtc *crtc)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
> 

