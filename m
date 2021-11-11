Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B42644D90D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 16:17:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F04E6E2DC;
	Thu, 11 Nov 2021 15:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D35F6E1B1;
 Thu, 11 Nov 2021 15:17:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQspnl/bwk0rXSS+WJOvCNBSZoXuZLRbIRsM/XBColnar1iBiIU0hMpOtHjXhc7VegTzPdXxhvhWKzRpz2K+CJ/NL25oEbLYxzNDcZMZQc+Db6T7koeGuXMEP/MHgZ11D7qeA0QSjN/71HxeNTxAU3msXNK3jtYRHw7cxxWxPR1tzcRwuTDgfPM9OqIVP5/8jXydrGVOv++aRlzhf1/RbFU14UPisCnn7iEC4k2YdZXVBjH+6rFL6aigMo7EaatsQ4spBGdjdkRjDa2JHjpmiOsee/DvfpGPqtQxkwF3I1FMn6ZelZ8eO3Cu1WESkkQiqNX3K8/zgStspkh1h37ABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wZIEw/MLg0oRbON4Zs2rbRgLNyko5ELkgTTQLoHukg=;
 b=YzYDjZzASkM/DP/Fh4hsz2S5/5v8V1ibpCBhWXPY64OqSVw9pCYj1kCn4GhAr9o+KU0Jo0r0a1e1OL6gk5adEQj/aoqQ/1LByZGISLbPV7XQGIbfSzkAuPri5QEaxwVlVjwbxMXih9ngJ9yx7mP5FAj75c3yFDqDMKxXF89x/g3vf0SK1+ggfBM1BGiIftpHo89ErwkKBMaSzBEh0yIyXYMqoa+26ThUOHw2Oo3hTg4AHyFXJLDQMYvkND88xi1ht8QuuVUZue/yLmeS8N33KA6VAxnCzQ9nVWRhCFT6SBPCVYlXYLqMzmDvm2601UgjqOwTZu3jwskv9uayGgg0ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wZIEw/MLg0oRbON4Zs2rbRgLNyko5ELkgTTQLoHukg=;
 b=vJ3ieu1zYpIbK7E3hNErqJ+paWeF7l41Giktf19bUGMhauK7Q6Fvx1pTjRMQPNz3guspwfdq2olp4xG3kIw6rKdvJXla6PBCJo/eGSqFZmuUTu8qFLkK1YEXTqem6NpKj40GfDLCI8aZiZ//qMiYY2+tXJ0KzkHWsll596ljGYA=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5396.namprd12.prod.outlook.com (2603:10b6:303:139::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Thu, 11 Nov
 2021 15:17:22 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975%3]) with mapi id 15.20.4669.016; Thu, 11 Nov 2021
 15:17:21 +0000
Message-ID: <52ce874c-64ae-d7a9-bc4e-255cfa49f410@amd.com>
Date: Thu, 11 Nov 2021 10:17:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC v2 05/22] drm/i915/xelpd: Define Degamma Lut range struct
 for HDR planes
Content-Language: en-US
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-6-uma.shankar@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20210906213904.27918-6-uma.shankar@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0282.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::18) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0282.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:68::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Thu, 11 Nov 2021 15:17:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb1d7c74-92f0-4b51-c78c-08d9a5265bb2
X-MS-TrafficTypeDiagnostic: CO6PR12MB5396:
X-Microsoft-Antispam-PRVS: <CO6PR12MB5396FAB18F9B9957AFCDF1028C949@CO6PR12MB5396.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ng+1MNaCbHSWUxL9CDGmgx2TkBQzHGVK2u5lz2C/YQqtGCAPsEefWHEsS5/SlaWydkvdQFMRcw/tj99UojHQiQCTxcS0a6Vjx89oAMOI1DhcyUyGS0D1lF7Hya/3SboygTGm0alsy3xeoEBlamxiS8ySjEPXpBth4ylO7zMdew12ZMsqcvEx6cFK+AM4nU1X4GBfc8seswH8k6DXGC4FWRJxt2r1vj9C+pWhefy5ovK9mf1+hvFrH+0CITNVHT63wYuyY0CGVH/2eT3woNjHXL2riWfiVZX7BBmlmuSDnG6gUSAqlcrG4UqaBc8llG8B9Adk0Z6lF6tBh6bQiaiFtyHsapMy8bqX61GW+YMjz7uXV+IhhRT9WJmK9qPYiea6IfeRZX0Eykf8KEvnRfflNyo7x+4z6dmfLNP05cjLy0KULSxHnTEeHPmhizXbZPV5VaJwA8qZVrHJF81g1cM8uPTpg1JMmoBRGfYK9dFG5YucHTs0iyO17QoLiHnTUvB70fxZDkVuD1YWc0rgGc6ND00lKsE7ECYVG4BOpurLIbxj59f+aDppHcCLHGw+oxND9ROsKG09OUuf8tEyBhmD6n/vCQEYYx2Hwg8qSsdBDkcoIPobiPG0wwEM3tIttq94iPGjDb77xpUUQdbn6F7FujNFXZM27iScHQWWQJRaklTXelscbzkeDmRqSAS0zEbUuYRV1XRYEWrGBtm5Bm6OT+PaDh6Ds7p6LokMVIFcWDs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(38100700002)(8936002)(2616005)(16576012)(86362001)(316002)(31696002)(186003)(8676002)(6486002)(66946007)(66556008)(66476007)(6666004)(26005)(44832011)(5660300002)(4326008)(508600001)(53546011)(83380400001)(2906002)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzVlcjNucDFIYkt6RVg0UXY0VzVKd0h6MU5uck93NEJad04rSG5MNzROd3JK?=
 =?utf-8?B?bDJ6STV0MWMxUk42SWZjVmg1OWhwN0xPWkhvdnBjQ3ZBdW1PZnpjV3BXNUZ6?=
 =?utf-8?B?aExJdEF1Mlg5bjdsbFB3ZzEwWWRUdFNLU1lPZHpKVUNTRTFlZHBFSXFNVS8w?=
 =?utf-8?B?cVUwbzgvUCthV21xQXJZcVcwMFZ5RlNpcHAxTzhBOU5ZQno1MXNVd0x6VXl4?=
 =?utf-8?B?d2VQeWkzQzVMOG1UUUltL0NqcERhN3U5RkY3amFQWlhkYzlTeE5Ucm4rWHR3?=
 =?utf-8?B?VUI2YWFVU21MNDRYWklKU29JaXQvNGV1MjhmVTlHSGNVekZmTnpJY2ZqdWNl?=
 =?utf-8?B?OEV3ajQrcTlKcFlPMVJvQXhlSjg5bDBYWXU2RENXb0Q1blpicGxnS0h5T3Bo?=
 =?utf-8?B?OWMwVDhUUEx2Ulk1dVR6clhvWXQ4US9uOGJySDNhRzhIWStmaVcyL1VUdWpi?=
 =?utf-8?B?QWE2d2tQejdaOVdVYXJOKzB0eVJpTWtJbHJmWmgzc2VWSTFnb2NKNVpWM1Uw?=
 =?utf-8?B?MGN4M2VRcEJWVjlJMkNWNWs4T3lWaDNzd3c4K1MvSnBsSGFhVU9tZ1I0SkZ0?=
 =?utf-8?B?QzBNeTBxLzFDWGxZK0RhMUlGTCtIWWpMd2s2M1dQVnl1SE5LaWQycEpON3Nv?=
 =?utf-8?B?b0p0WXFOemFRakF0YW90cC9IOGcvR1dGMVpPSS9ubCtmd2JJOW9veFFacEht?=
 =?utf-8?B?cVZtOXQ5WkVZM2ZlOGhndkJtVlYyaDBTbjVZRWd0V200L3RuSDlxNEhzaWFY?=
 =?utf-8?B?MVkraUdUSkxFTnhpcnlPeE5WeThrQ0R2VVNrM3UzUlBpSk5Mcy95dEhINEpR?=
 =?utf-8?B?Y20wR2ZLQlZLZ3ozN3Naa1Z1T095OWxBUWc1emxuWDBENUJXWCtveWRmZ05z?=
 =?utf-8?B?aVRjN0U3dVh2RUhWQllDeHZOWXA0VXY5V2YzWFYxZUdHZmlKczdRV3czQmRw?=
 =?utf-8?B?VVFvVXQxdkxtTDNzTkQyZTBCeW5LMy91MFBxNGlGQUFYcHV2WkpMSGtXVElC?=
 =?utf-8?B?WlE2RE9hNmJHblhWVDBtNWw2cVhvSml2WE9CemxDY2N3MmtHRndPOUcwVEFu?=
 =?utf-8?B?ZGs0MlVHNDRoazBWYUlta1FONmdYODJxQitrc3BNeGFZNjRyUnNyb2NWbXlr?=
 =?utf-8?B?bGx1KzJhTUVjeUE2KzU2NDkwbExHa3haOENhcUJwQnNDY0JrczgraGNDZVly?=
 =?utf-8?B?RVN1SW1tems5bXhtc2tyNmpJSnVPVkQySWs0ZHcyMVREMXFRVXhDNCtTRWVF?=
 =?utf-8?B?UWVIMGdXclU3d283L3VSeHE4RjNaTjh4WVhBa2dBdzFyeFBDcmVXR2xuN3ZK?=
 =?utf-8?B?alhaSHplTzhvczl4VlRIai9RR1dPYVhpZkNHaThhVlZBTHE4WHJKOHhVQnVJ?=
 =?utf-8?B?N2RMdEUxZFBpaXBvSmdicDVvZ2hDY1BtKzhMbEhzTDhGaDIzblJyRWJCS1hC?=
 =?utf-8?B?TzRXRkxIdTlWRVloQjhoVzQxZFRlUktaSExvQ1lUR3FCQ0tBNWdWbFFuYnZM?=
 =?utf-8?B?aG5keUNDckM0NTl0VVNNWm5STDVVRUFRYVNrVnJxZHVGMWF3TEo4OWdXa1R2?=
 =?utf-8?B?dkdmWDJjSHpPOUVDcmZNOUNhalliSTlGamdlcG9HVjNsdVFlbHUxMWZzRkha?=
 =?utf-8?B?Z3dHdlVJU0I5cU9SajdRSW1UMHFLV0Yzb09jMzNtcDhlZmRtVHlzK2JieFBv?=
 =?utf-8?B?N1E3V3hQYVY1anpWSDdJK25BZzlzUVRWbVJNWW5JMGtsMUxuMEMxc3ZxMXZF?=
 =?utf-8?B?TEVIQVZHVmViQkViZkVxV2szWm1kM0tBaUlZODNCbEUybDZkdlhWS21HM0pm?=
 =?utf-8?B?bkRrY05JMlJ5SVp1MWlhSk1RdXNrY0JnY3NSYVB0aXZJdk5OOGtIall3MElj?=
 =?utf-8?B?YUhrZW5IVFE1QTVtK1ZRZSt3ZVR5ZTlsNUx2M2FvQkhSNElmTUVPSkxub1di?=
 =?utf-8?B?Y3BFMml5S3diQTluOUJBeGlVd2NuZ2hvclllbU1BTjZNN3dacnJyY1lCMkR5?=
 =?utf-8?B?ZmxQVW9LMkhvVG55ZUF3YkEzVHQ1ZTl6MlBLT2p1UDVNSVNQNU9wQVcxbkRt?=
 =?utf-8?B?TG9pbDRGR3JBSjZFd25hM2tVTEZtU2poV2RZQ2djY3V1bWdBWGhpVTVmOThZ?=
 =?utf-8?B?ZUVVV01ZL1FadEZCUnQyMk9kQ0UwUXl2L3ZHRzAyVjBmbU9RRWVSQTRtKzRF?=
 =?utf-8?Q?2DHFkchodgPLXEguYU5D0E0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1d7c74-92f0-4b51-c78c-08d9a5265bb2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 15:17:21.8824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R5Z3uCp3gVQPJFUbyhWAbr8GqsVrW2TVGb8cFcGaCuB29KUGaudsnCvE66COhnXqBnYNh0NJhdoKMamv/BseSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5396
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
Cc: sebastian@sebastianwick.net, Shashank.Sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-09-06 17:38, Uma Shankar wrote:
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
> index afcb4bf3826c..6403bd74324b 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -2092,6 +2092,58 @@ static void icl_read_luts(struct intel_crtc_state *crtc_state)
>  	}
>  }
>  
> + /* FIXME input bpc? */
> +__maybe_unused
> +static const struct drm_color_lut_range d13_degamma_hdr[] = {
> +	/* segment 1 */
> +	{
> +		.flags = (DRM_MODE_LUT_GAMMA |
> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> +			  DRM_MODE_LUT_INTERPOLATE |
> +			  DRM_MODE_LUT_NON_DECREASING),
> +		.count = 128,
> +		.input_bpc = 24, .output_bpc = 16,
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

If I understand this right, userspace would need this definition in order
to populate the degamma blob. Should this sit in a UAPI header?

Harry

> +
>  void intel_color_init(struct intel_crtc *crtc)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
> 

