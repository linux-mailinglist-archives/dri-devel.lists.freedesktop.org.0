Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B5C7ECA7E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 19:26:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928AF10E146;
	Wed, 15 Nov 2023 18:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6662710E146;
 Wed, 15 Nov 2023 18:26:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gclH44YpZm6Wz4ck9GApQkAiAA6Rju/lqR6RlnOn1Epoo2vYIuPdCNS2VHAJ/0KEgJuy8Bp33XzrEQrpfWjE9Eqb/yVCea5YNDV4CtJQOB15b4c4VCVs6yukVyhT/wzmTq+ncIML6F7SmwNP2eK+ITcfcMc8QUBIfNf+y5B2QD0O/wRap/wuoVtCdsoB5QvHM8tKi3uDrzTHskn3246nM2Q0GNG+ejXieSPD4jOYXfewJ01iB9/kOl5u29aduGFh/oJXCizqJ0iZ5SVkycj4EoRtX1KFohiRlgJ5dE8NX/EUIImYwJXnC2c7/PGqfAl8C35Hqv4dtyO5jOVzUZwdxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Ef8EFDvNNwDUDZwC5dAmMZD2ReU1kd7q6HCebNwMLQ=;
 b=CI0as2upiLBkr8RKJ3K4OWq/nHUsX4QfDXpLxK5iCyG/QKYWa5gUcZDu2q7dY/LMoOCbsTekSVtKa7IJu+rxjocC5k5TMfgzp9IAZlE/wOuVucdTzkrPCnHy2Ay7zuijd+7z14xv6vjhNCCsQ9OL1Vlz6PJvJbJhNEKpLRr/fA+85N4B00yNmOuDdfhtnIL8u6BxzvndOn+JbJEkYH3V5SgAh5INRz/5TyBoHbMe/wJkQQrghOaiKPf6qnyA0WmZFjHrTc5annHFoxxDbDvOXiDfLYfR+N6zt7+3YJmvfVgM/zTUFCWbvWZc1+4JRR9vVr4PpfJqEfoOubymlKuwJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ef8EFDvNNwDUDZwC5dAmMZD2ReU1kd7q6HCebNwMLQ=;
 b=GVglEH4Ym0mHMcESgAq13UNMyYV4THMyfcoErnhZyJzDfOXoylBlnZfgIbI6IGl/rgqZ1P0g9xKbQ6eP1Dh0m2Vp4wZuQpD/XdYn4I7aaDxL8l5Z6qoPcOJgKEXJzey39CNQ1KQgVn3kiLl6PC/jLiBzmEEH4ExWLXOt+IuRM3I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ0PR12MB7083.namprd12.prod.outlook.com (2603:10b6:a03:4ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.22; Wed, 15 Nov
 2023 18:26:02 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a%5]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 18:26:02 +0000
Message-ID: <5c5071e6-9553-4971-b1fe-d043c559e4ad@amd.com>
Date: Wed, 15 Nov 2023 13:25:57 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/32] drm/amd/display: explicitly define EOTF and
 inverse EOTF
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20231005171527.203657-1-mwen@igalia.com>
 <20231005171527.203657-7-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231005171527.203657-7-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0256.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::23) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ0PR12MB7083:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dbf452d-0327-4c05-797d-08dbe6085256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D6HGBpB0Y/AS4p7LdrlZEzkCjzx7FRwem8O3FhS1uwP1I8k5YPeCv6EcjNsFa8JC5HQHBKNus+FyifmIo46dwn609pCWUffz7zk5HJYfc09L0y1K4Ks1ob0LKvPFQi1ZZSTlLGiiRMWC1ULScVI2RpKBpc43/HadAyQTY2BikDCI4jwwFBAKubWe17xuESbWh70jn0lCt8XACC3wDRKCRRZ9lETGpPdRge8YekNnUIIrov9wh9Ld5lNNJN6wpbPQDTcejwvKcjRXPuaelnMst8+ClgWvtu1fP3OuY7GFUoA8rJYTNS9/Swizgdn3kEfpBDNT45ep01dFFNwvnrxUALngmxRXZ+GaBJUee/LLuSWOO/FWyHP66VHLUhkuzQWDFRH6XxFYwoc+9gny+cAFqzLcMho28CBiQK1b2qRtJjDUlQLtlIEw/6FsmvEebEJyCfkcjtYlSqkPG/7OYZmrjXjKRtpLb9P2SsR/rtthN9WwBfJiFmKGL47HdS505JsxrDVzwQNevs+n6FA5razgoftSa7Ut83+MHQ/r9u4zMxbkVH/GQO+73lmjyJmmS7ZjcxXQ+O1QoKcpVg5qKigU0j8Sr010oR+H/SDBde6NHeeZ/L+D735SSe7JKKu8PqDmhrF+eQrLhoCLAtz2RVjMqoJHaBWyqRoyIVp1yE7UaGg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(136003)(366004)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6512007)(83380400001)(54906003)(316002)(66946007)(66556008)(66476007)(38100700002)(110136005)(8676002)(8936002)(4326008)(6486002)(478600001)(31686004)(36756003)(6666004)(6506007)(53546011)(44832011)(7416002)(86362001)(5660300002)(2616005)(921008)(2906002)(26005)(31696002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dU5DWURNdUpZeS9mUmFQMWR3MkkwNU5xK1VwZ1Z5MkV3ZHJrci9wNlFKMmZZ?=
 =?utf-8?B?aExnSTFjQmpiK0s3OHFOTC9NSEZjMm9DclYwbHlLd1RwYkJ6M0l2aHAxclFO?=
 =?utf-8?B?UVlDOXI3a3NuZ2tCeGIrUEV2QmlValkzK3NTMjY0K2hJcTFPOGJuN3BuOHRZ?=
 =?utf-8?B?WXRONkU4REFoVWhneUgvVkF2ZzhEcytVL0tPMVlWVXU5eTJWbVNRKzluZThn?=
 =?utf-8?B?QkhoZ0dtOWpKOTQ5amo4Qzk5bWFsMUFUamNIeWlRSThpbUtpN0t4TzRZQUR3?=
 =?utf-8?B?ZFJUc2QyUUZVY2VFZUR1VFpKK2wvTWg4Z0NXYktGQXVOTWdPNHpWbnBLb2k2?=
 =?utf-8?B?a2F2MG9RSjZMRFAyK0pZS0E3bk9qRjhuYU9GeTI0U2xNOU0xeExhaWgyTlhD?=
 =?utf-8?B?aFBnTjJoWUhXYjlrS3hRMDhkbWtMMXdxY1MvYUl4QXBCMXduQWRNaHcwbTVn?=
 =?utf-8?B?WWpKZTNjUURJTml6WlBGUFJNTzJseFVSdlZsOXNHdTQvY3F2dEJVQmZzZUpM?=
 =?utf-8?B?Z2VHU1plb1FReFdNb3ZUVllCbURFVFM2eXExUGJWc1FodWZ1bVAyMzRqaU1r?=
 =?utf-8?B?RHNFOUhHaUU1cWZZRjdBbDFjZDJHMGVTMEY3Z09mUHAxa2xyalZOS2EzWUlo?=
 =?utf-8?B?d05tc3RWOUoxMnFFd3pZeFNGaW03c0dsMFRCaHhHbXh3SHVXZDc0Q3hYdEVi?=
 =?utf-8?B?aFg5TTJCSS9kanJXbURIM2NIeUljODlrMnp5YmlpdkNqSVdRdTZYblVxWm5B?=
 =?utf-8?B?TUFhaXdhWk1sOGxHZURrdlM4NmVmNnMxMXRDVTQwcHlwYmlBU3poWWpXZTFL?=
 =?utf-8?B?SGhFMTdFTkFOZ1JMbGRCSVczdnRmc1RhOXBRdFJQWVM0S1ppTm9OTG13Qk1h?=
 =?utf-8?B?Y2dVSFZkV25RSzd5d3VuNEYwMTRZS2RGWVA4NmYxL21VcCtSY3llYkVFWllh?=
 =?utf-8?B?dCtVeVp3ei84SnJMZEtUWFNMemVTTEdPV0ZtVjhZbkJzMktmaHlhaDRBVW1N?=
 =?utf-8?B?SEVPT3lJUnZINi9tQjNhS2JUNkJ5SWRmbnNlazExL0NQVVZ4a2RLM3JIbk5p?=
 =?utf-8?B?L0pOODZDcHVEYVJtN3ErYzhteGE5QXhjd0psY3dHSFZxbmNsaTEzb2lBUEhs?=
 =?utf-8?B?bVpOc1VPYllHN2lzaDVrc0p4d3ZoTHd0UTZyNXVsODg2ZC9qS081eDh0Z3F4?=
 =?utf-8?B?SkVTMzFtLzlCSGFoM3ZOZ0VSbVJJNEZ1UmM0WGdHdnJLNXY4dXdUYjRJMk1s?=
 =?utf-8?B?bUJqT0JpaUFzYTdkM0hOblZaSzlFK2dFejc5UGt4NE5aN0VTZlAxUEVIN2Fu?=
 =?utf-8?B?VkFSUk1NL1IvTlhjeTJTZGxabDVycDJpYVNyaWZzc0ZKSzlmNVlsdVB4cytv?=
 =?utf-8?B?dUNLczNUbFFUbEF3dmxObmpYRm9FeEMzNFdCQ0I5dnRYd2l0ZUNvc3lsazdU?=
 =?utf-8?B?azhEWUNNTklwOWJBc29VUkVkaFA2UkUrbGErY0plSy9JQUhPaVZDQzVYekJp?=
 =?utf-8?B?amcyc1hFLyt5U1hPWHFIb1E5MkVpUkFMbmZkSm1RNWNvdDFmWWMyM3B0cWVG?=
 =?utf-8?B?Z2ZGbVE3eEVZNHlLNXZ5RGhCc2VEQ2llaTBYQ1RNbmVoWTVvSVRkV09FUDRP?=
 =?utf-8?B?dHVIRTFMdmYrY3I0N2Rjc3kxUDBsYkdkSjltVnJ4R3JxU3ZzNERvNXF4dWpL?=
 =?utf-8?B?eGdMSUJvZVYrMmlqcjdGbTYxTU80amlKalFZZlBpMEhONS9tcVRlZVZvckkx?=
 =?utf-8?B?aHExM2ZIbnVFbkM4b09NQzRQSDFIWFlXbHUzdS9ObjlHYVczQVZUMXZzcXoy?=
 =?utf-8?B?aTJULzc3dFRURHJrNDZnMWx4VkpBcEhvN3FrdVk2WURLcnhCMjlFbHM1YVV5?=
 =?utf-8?B?amtDb1RZdkxMMHJ4TG4ybmZNaTNSUTBWRGp2YjF5LzJuSlNzbUlqTGNDUCtU?=
 =?utf-8?B?MlYydG5YcFpIbkJWbW9SUFYxSERTMTErZUFjSGhPeVlZUURQcllYaXZZK0Vv?=
 =?utf-8?B?VVY0aU5mcFdZODJTN2dPUWo2SmYzRlRqREFpZkhTUmRsL2ZiS2JVb29HUEx2?=
 =?utf-8?B?azR3TjZPdmxmOGVPK0Z5Z0s3dDVQeFNlZjBuK2t0THdSaGEveXdkMHJMVHF0?=
 =?utf-8?Q?6iE8BI1mvmPRyWSmpr0Mz2Wme?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dbf452d-0327-4c05-797d-08dbe6085256
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 18:26:02.0701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OPYTDHS9t82Xfe0sEnqroJLJtOYNGEsbz1DRFuQUK28nJoRa0xm/3/ceyg4Z13l/qAX4Au93vqUsGo0qv3H5Lw==
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
> Instead of relying on color block names to get the transfer function
> intention regarding encoding pixel's luminance, define supported
> Electro-Optical Transfer Functions (EOTFs) and inverse EOTFs, that
> includes pure gamma or standardized transfer functions.
> 
> v3:
> - squash linear and unity TFs to identity (Pekka)
> - define the right TFs for BT.709 (Pekka and Harry)
> - add comment about AMD TF coefficients
> 
> Suggested-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 27 +++++---
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 67 ++++++++++++++-----
>  2 files changed, 71 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 4c4cdf7fc6be..fc4f188d397e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -724,16 +724,27 @@ struct amdgpu_dm_wb_connector {
>  
>  extern const struct amdgpu_ip_block_version dm_ip_block;
>  
> +/* enum amdgpu_transfer_function: pre-defined transfer function supported by AMD.
> + *
> + * It includes standardized transfer functions and pure power functions. The
> + * transfer function coefficients are available at modules/color/color_gamma.c
> + */
>  enum amdgpu_transfer_function {
>  	AMDGPU_TRANSFER_FUNCTION_DEFAULT,
> -	AMDGPU_TRANSFER_FUNCTION_SRGB,
> -	AMDGPU_TRANSFER_FUNCTION_BT709,
> -	AMDGPU_TRANSFER_FUNCTION_PQ,
> -	AMDGPU_TRANSFER_FUNCTION_LINEAR,
> -	AMDGPU_TRANSFER_FUNCTION_UNITY,
> -	AMDGPU_TRANSFER_FUNCTION_GAMMA22,
> -	AMDGPU_TRANSFER_FUNCTION_GAMMA24,
> -	AMDGPU_TRANSFER_FUNCTION_GAMMA26,
> +	AMDGPU_TRANSFER_FUNCTION_SRGB_EOTF,
> +	AMDGPU_TRANSFER_FUNCTION_BT709_INV_OETF,
> +	AMDGPU_TRANSFER_FUNCTION_PQ_EOTF,
> +	AMDGPU_TRANSFER_FUNCTION_IDENTITY,
> +	AMDGPU_TRANSFER_FUNCTION_GAMMA22_EOTF,
> +	AMDGPU_TRANSFER_FUNCTION_GAMMA24_EOTF,
> +	AMDGPU_TRANSFER_FUNCTION_GAMMA26_EOTF,
> +	AMDGPU_TRANSFER_FUNCTION_SRGB_INV_EOTF,
> +	AMDGPU_TRANSFER_FUNCTION_BT709_OETF,
> +	AMDGPU_TRANSFER_FUNCTION_PQ_INV_EOTF,
> +	AMDGPU_TRANSFER_FUNCTION_GAMMA22_INV_EOTF,
> +	AMDGPU_TRANSFER_FUNCTION_GAMMA24_INV_EOTF,
> +	AMDGPU_TRANSFER_FUNCTION_GAMMA26_INV_EOTF,
> +        AMDGPU_TRANSFER_FUNCTION_COUNT
>  };
>  
>  struct dm_plane_state {
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 56ce008b9095..d03bdb010e8b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -85,18 +85,57 @@ void amdgpu_dm_init_color_mod(void)
>  }
>  
>  #ifdef AMD_PRIVATE_COLOR
> -static const struct drm_prop_enum_list amdgpu_transfer_function_enum_list[] = {
> -	{ AMDGPU_TRANSFER_FUNCTION_DEFAULT, "Default" },
> -	{ AMDGPU_TRANSFER_FUNCTION_SRGB, "sRGB" },
> -	{ AMDGPU_TRANSFER_FUNCTION_BT709, "BT.709" },
> -	{ AMDGPU_TRANSFER_FUNCTION_PQ, "PQ (Perceptual Quantizer)" },
> -	{ AMDGPU_TRANSFER_FUNCTION_LINEAR, "Linear" },
> -	{ AMDGPU_TRANSFER_FUNCTION_UNITY, "Unity" },
> -	{ AMDGPU_TRANSFER_FUNCTION_GAMMA22, "Gamma 2.2" },
> -	{ AMDGPU_TRANSFER_FUNCTION_GAMMA24, "Gamma 2.4" },
> -	{ AMDGPU_TRANSFER_FUNCTION_GAMMA26, "Gamma 2.6" },
> +static const char * const
> +amdgpu_transfer_function_names[] = {
> +	[AMDGPU_TRANSFER_FUNCTION_DEFAULT]		= "Default",
> +	[AMDGPU_TRANSFER_FUNCTION_IDENTITY]		= "Identity",
> +	[AMDGPU_TRANSFER_FUNCTION_SRGB_EOTF]		= "sRGB EOTF",
> +	[AMDGPU_TRANSFER_FUNCTION_BT709_INV_OETF]	= "BT.709 inv_OETF",
> +	[AMDGPU_TRANSFER_FUNCTION_PQ_EOTF]		= "PQ EOTF",
> +	[AMDGPU_TRANSFER_FUNCTION_GAMMA22_EOTF]		= "Gamma 2.2 EOTF",
> +	[AMDGPU_TRANSFER_FUNCTION_GAMMA24_EOTF]		= "Gamma 2.4 EOTF",
> +	[AMDGPU_TRANSFER_FUNCTION_GAMMA26_EOTF]		= "Gamma 2.6 EOTF",
> +	[AMDGPU_TRANSFER_FUNCTION_SRGB_INV_EOTF]	= "sRGB inv_EOTF",
> +	[AMDGPU_TRANSFER_FUNCTION_BT709_OETF]		= "BT.709 OETF",
> +	[AMDGPU_TRANSFER_FUNCTION_PQ_INV_EOTF]		= "PQ inv_EOTF",
> +	[AMDGPU_TRANSFER_FUNCTION_GAMMA22_INV_EOTF]	= "Gamma 2.2 inv_EOTF",
> +	[AMDGPU_TRANSFER_FUNCTION_GAMMA24_INV_EOTF]	= "Gamma 2.4 inv_EOTF",
> +	[AMDGPU_TRANSFER_FUNCTION_GAMMA26_INV_EOTF]	= "Gamma 2.6 inv_EOTF",
>  };
>  
> +static const u32 amdgpu_eotf =
> +	BIT(AMDGPU_TRANSFER_FUNCTION_SRGB_EOTF) |
> +	BIT(AMDGPU_TRANSFER_FUNCTION_BT709_INV_OETF) |
> +	BIT(AMDGPU_TRANSFER_FUNCTION_PQ_EOTF) |
> +	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA22_EOTF) |
> +	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA24_EOTF) |
> +	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA26_EOTF);
> +
> +static struct drm_property *
> +amdgpu_create_tf_property(struct drm_device *dev,
> +			  const char *name,
> +			  u32 supported_tf)
> +{
> +	u32 transfer_functions = supported_tf |
> +				 BIT(AMDGPU_TRANSFER_FUNCTION_DEFAULT) |
> +				 BIT(AMDGPU_TRANSFER_FUNCTION_IDENTITY);
> +	struct drm_prop_enum_list enum_list[AMDGPU_TRANSFER_FUNCTION_COUNT];
> +	int i, len;
> +
> +	len = 0;
> +	for (i = 0; i < AMDGPU_TRANSFER_FUNCTION_COUNT; i++) {
> +		if ((transfer_functions & BIT(i)) == 0)
> +			continue;
> +
> +		enum_list[len].type = i;
> +		enum_list[len].name = amdgpu_transfer_function_names[i];
> +		len++;
> +	}
> +
> +	return drm_property_create_enum(dev, DRM_MODE_PROP_ENUM,
> +					name, enum_list, len);
> +}
> +
>  int
>  amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
>  {
> @@ -116,11 +155,9 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
>  		return -ENOMEM;
>  	adev->mode_info.plane_degamma_lut_size_property = prop;
>  
> -	prop = drm_property_create_enum(adev_to_drm(adev),
> -					DRM_MODE_PROP_ENUM,
> -					"AMD_PLANE_DEGAMMA_TF",
> -					amdgpu_transfer_function_enum_list,
> -					ARRAY_SIZE(amdgpu_transfer_function_enum_list));
> +	prop = amdgpu_create_tf_property(adev_to_drm(adev),
> +					 "AMD_PLANE_DEGAMMA_TF",
> +					 amdgpu_eotf);
>  	if (!prop)
>  		return -ENOMEM;
>  	adev->mode_info.plane_degamma_tf_property = prop;

