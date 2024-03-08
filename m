Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75332875E08
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 07:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8083810F83D;
	Fri,  8 Mar 2024 06:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T53bmhO1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176B710F83D;
 Fri,  8 Mar 2024 06:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709880391; x=1741416391;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rJc548FM2c/9Wr7g6Nbgyet4B1siwb/ScQQvY2jtCLM=;
 b=T53bmhO1LDH/HqYdWKgYpIcbGns/7NHWdwOBg0/bIfixoLt9tPpKOea0
 Zu8LaY2Slnsor09YLQLNgJUHHWu52zPgOrz8jT63l+REPF3XUx/TT6Guv
 ILb2kRPrM8vCEbm4CF7+u0H3eVPwX7oSEoinEtQ/xMaHGq3mwsTrHXF0M
 JbYHKUB957z6Hc8w63fFSNa15tJT9qHzX3Luyy+MtYuOVncL5S2z9vhfq
 pscBt0xfxE0TqHyfqrk6NvFzA22wIOkrmVdHxMGCKoxVPzBU5ZajEencD
 06RIhXstUnpy0BieeOsWU4M83vbZ+OfNGQfKlmFlGkSMu1JOxjljDuYOC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4442199"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4442199"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 22:46:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="41353136"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 22:46:30 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 22:46:30 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 22:46:29 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 22:46:29 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 22:46:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTGGe367U5AyZn4574p3Fl36vZibzb5/1n1T9Omn4Nwn/wwAc0B5f0zx1pJDtzlgkNt4cdiS7BcHnEjOic9LeKPuoHll7ucdBqJFPLcWKRjaWO98h+GmYf2wDqexUzQmbdH/nc9vE4ZE4ipoR3gSjpwXbMI478ZdckIuXboCWd9iqLUlPyXD7skIhOeghfaajHwMkS91Brgxi+DloUUPNz6rrZ7O3CWqR4FRv6u1+6rYxkAC5g0TWvxOD8c6iUjrTPyipxhWrSjK8ITiixqQ+9IxkKpv9ZMui7jnx04EogSQKT15eIjo0145YrOrLPJFtUH/GWQiLv4S+/bp8Oxj/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XroH3HnlqqQ0SFjLZ3uFKkMCh7nDfE68JLkXZibCx+g=;
 b=eq0XG2IjwNYufP50ZhJG9cBw7MtDsNaoDdoD/nq5DdJEq8f8qwSXCczZA0nb423Y+yy0xdA80fO4tGMqnqQK89K0b2HjrJpmr4pvRkThE9m2d+9KFNNfH3UfINb9W8e5Rctjdwzw5e62lQzkLcw2jl9AcucPOpZmrdoPDZrB21xvVV60/+nc6lG+PrYiOQIAfwdkV/pQ4DX1DL0345uQeOca9hpaeMmUmd3+/3ShvxzVfwJ2dQ4eXyMf36hARX+h2E1X/dN0rXa2ynxW36Vjn/wMqVL1EEjdmA7NcjHmwI1bF568P1G9Rkrffor4CtJAwY7TAV7oYmbWYDiWjXIIBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA1PR11MB8327.namprd11.prod.outlook.com (2603:10b6:806:378::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Fri, 8 Mar
 2024 06:46:26 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7386.005; Fri, 8 Mar 2024
 06:46:26 +0000
Message-ID: <505d2628-0394-4c3f-b57e-0517cdb1783e@intel.com>
Date: Fri, 8 Mar 2024 12:16:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 4/9] drm/i915/dp: Add Read/Write support for Adaptive
 Sync SDP
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240307055329.3238634-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240307055329.3238634-5-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240307055329.3238634-5-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::17) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA1PR11MB8327:EE_
X-MS-Office365-Filtering-Correlation-Id: 063bbd0e-2ccf-43e9-2fe2-08dc3f3b7a1b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: slzgc3/fWuio73B68RXoB0D/fn7derf5MoKiRthrF/ttu0cUs5lMIidZGjfd6CW3KKSl7JkkKP2+JpgXBxEwnimCXMnT/y9idslXgn/P5Rqwd2in+NA8CrY5ndfLEveZXBP1PknOz3HAcbuXVVlXjUHqF43TIGqJKozWILsjQj2Ojkl+ZoyGF+nJDtHqT3fjbSKPeTO9PdZqJ/j50MKhuAiVHV//faxwLjbQI181hYtKLyvlEcannPtftcUXMdgKEfoNEOEwf1BE2AMUTeFM9dp3tBR5hAE+wDHVjTgIRnUckE/9TExhoYFqGh0GOUdga/30PslQn1eBT9bi4QoCIR6p2AEZ5Z8VKsgo0wH1T2eu0CL3TSjQj5YMG6CZDtBf+rPqPk1+gNHCSldYe4Kq/RokRy7x9NVMoHPXPhZnQgUp8CkSZIhHW2zgOIWj3NutFpMzwc1Xbef76lP1aSgIMHTzWyEZkOS8y/qbAxtag5QXyIRVwehfPFbC1dzddyxkBupZJ9NxKhhrLVazxODyIjULC7v+29NdY8brmOfFnn85NoHF2CTQBcEBFN5b6SINtGpBwPgWhXfK29+Zoa0T90EwsydrISegxO4ARTiMxfRcWn/uF8i5vocvBvugKXXnPcz7urRFzxLYcNcGoOl3Qg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0dwV2FQMlYxbG1mbG5vTm1wVURPTXhGM2ZBZUVLVTVkQklhNjM3dG02eUd0?=
 =?utf-8?B?SWNVdXpVVTd4OWZjZVBVQ1Z6c0xxcTNidUNGR2hZNmY3aWFJR04vT2dBOGps?=
 =?utf-8?B?V2xWNmU5clR0L3pLelg5NFp5M3A3M0orNnRwRDF1MXBCbnRMWnQ4SjlzMDZr?=
 =?utf-8?B?eXpFOGJ3L2lPODlDMy82NWZpdjNHWFBYRjVOdk9xVkpxVmhmM2RKMXFoWm5I?=
 =?utf-8?B?b1JJY1g1TVB0WkZOQ1ZjT1ZWZ1c4d3dEeUFCNnM2MEVWRlowUkthekg4OHho?=
 =?utf-8?B?M0hKUnFFRGJtREpNc0dCVWp1SFVkMjBoMFp6T1VNdHdhOTFXTkxIdFIyY2Jk?=
 =?utf-8?B?T3R3eGx6cWRDZGYxcDRGZVpnelQ4NHI0UVFybGtqRFF1blhSN1VMYVh2NUdm?=
 =?utf-8?B?VnY1SXhZY2I5Sm1wV09nMDl6RmZRR2VKc1BRR3BIU3BFd0ZISi9VZzJJMlVy?=
 =?utf-8?B?eGJmZENrZkRMR3Y0RjNicEFxTTU3WWJscC90S0lXOHY0ODVjc2QwVXJ6WkRR?=
 =?utf-8?B?RFRudlNyK2FPdWFoMzlCVHlEdnc0eTIxendIdS9TNjkxOHZhNUIvdE9LK2xJ?=
 =?utf-8?B?dnVHUW9jS2NFcmVyOTgrZHZyZHFaUkpSVWthcGttOUZCZ1dYcEVEVDNjQUFi?=
 =?utf-8?B?dHBuUmt2NmtVV3ZMcDQvbUFJQmdURXllK1Z2UGNOQm0vWEtMUERYVmpiMXBE?=
 =?utf-8?B?RjA4ODFtRWRyVHZha1pDT3NnS2V4cXIwOW1yVzhyRTZnektuREp5QzNjMnly?=
 =?utf-8?B?VmsxM2lJMUJuRHBiS3Q3eVlwUy92SU9USERZcUZPYzVOK01zSUtMQnZ6YllX?=
 =?utf-8?B?V3lIdE5QdWlvREVDOEN2aXR4QmNNaFRJZTd0eDhnbloraGNXSnJNbUlweFBI?=
 =?utf-8?B?bzI3d1lrUTNvalJTNDZPdXEzRDEwbmp4NWN0Q3cyVUpwbkxha1hVNkhnbkNw?=
 =?utf-8?B?ZGo4bmJnaHVYZHA0SnRyV2RCanV3ZkF3RWxHSTNQb3M0V0JWSTI4UVpOMVhY?=
 =?utf-8?B?OTg4amVBdjU5U2JhclJwTEd2QTdBV2txOXJKNVM2OUxXVEp3RFJCNVY0eGJW?=
 =?utf-8?B?NXQxblpoN210Y1hnb2lTSkovTitpNWFBSjM3UldCeEVDUnhObXZHempXQnlZ?=
 =?utf-8?B?N2VvRE56UGgvRCtKblVCMjljVmdPNUFoSitqZ1BJL2hwa1dxd3lMK21rSGxN?=
 =?utf-8?B?ZXJQSGoxYUxmTXZRMEs0QzRCSVVIcGlnTDFQZEVvSjFYeWdiTHkrZGNSaXBj?=
 =?utf-8?B?TWJjd1VwY0FsdS9wcXBHR2cvbTRJeXZDaWJ2TFVRSXFBSmJTSU5VRmdoOU9z?=
 =?utf-8?B?M2RzNEw2T0JiTzNJWG1MR1QzYTFEWUZHalA1MCt3V0lzZU1sc1BjMnhOTDBw?=
 =?utf-8?B?SG1VQjRBalBRUlVtRlNQUjNiODdYeGhYMUJnczJkL1EvWlVSMHhwc2IzY2tO?=
 =?utf-8?B?d0gxbGxJaVh3QUUwazc3Szk4TUh3d1NpZHlpWVhoYko5amVzVVQwUDZhOW96?=
 =?utf-8?B?d0NLd2dlR0RWMHVCeVpRb0VOclRPbW5QVmpEdHluM0FFbXZuQWtESHpKK2Q4?=
 =?utf-8?B?TTVkYm5WcXp4M0tQTXdBdE9JMStWbUxzL25ncEdFcHhQeGhueHFucXZzUlpC?=
 =?utf-8?B?YlF5VXh4THU3U24yb2RaUThNUVJaRlFmY21odzlqOTlDV0NRL0VkZDRVdGEr?=
 =?utf-8?B?WFpRc01WYVJQTWxJcGx1S2p0WEJrelY4TUdjVWREeWsrT1B1citxL05La3hq?=
 =?utf-8?B?WHAzNUUzN3NyNmJ0NEZ4cDNNL043NUJNRXAwLzRwcUx6Q2U4UHdMb0tRNWR4?=
 =?utf-8?B?WEVqYnkvRVdqdVVYZ2dsZWhSVG1QSzV2ckk4V1cvUkl6U0FHcjlJWndzMy95?=
 =?utf-8?B?Nm5vTU1xS1pxZDJSK0NWaTMrTE04Qng4VEZIS3VnYmM5QWRFYjdObXcveGV4?=
 =?utf-8?B?ZHFoaWhKejJtMlBvL0VjUmlHVTlDOHpxR05YWFN2ci9zTnNIaXQ2cStFQlJ0?=
 =?utf-8?B?K0ZETWowalJSc2RwNVlaWDhYVkI2T2JaSjlrWTJBWW1oTVhmU01jQ2RoUE14?=
 =?utf-8?B?cEZ2a3plSXJqaDZlMVVTaERxYWZSSjhRSWdnWXJ2OUxoYzhqb3BKM0dEekN1?=
 =?utf-8?B?M0RrK1NyaGJnOVBRZVdhdFd0MUREWEJVeTdMbUF0WFpsd2VnOHBtSEh1Rnk4?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 063bbd0e-2ccf-43e9-2fe2-08dc3f3b7a1b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 06:46:26.5352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EIl5Y5lBB39320lCqtkj++oJZV85X6KzhidIbvKtvhi05K32mSJ3VxvG0KQvm9zw6cEMstCIzW2popuRmbQxf5aCCm87uft/Y6GJAvv4ZQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8327
X-OriginatorOrg: intel.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/7/2024 11:23 AM, Mitul Golani wrote:
> Add the necessary structures and functions to handle reading and
> unpacking Adaptive Sync Secondary Data Packets. Also add support
> to write and pack AS SDP.
>
> --v2:
> - Correct use of REG_BIT and REG_GENMASK. [Jani]
> - Use as_sdp instead of async. [Jani]
> - Remove unrelated comments and changes. [Jani]
> - Correct code indent. [Jani]
>
> --v3:
> - Update definition names for AS SDP which are starting from
> HSW, as these defines are applicable for ADLP+.(Ankit)
>
> --v4:
> - Remove as_sdp_mode from crtc_state.
> - Drop metadata keyword.
> - For consistency, update ADL_ prefix or post fix as required.
>
> --v5:
> - Check if AS_SDP bit is set in crtc_state->infoframes.enable. If not
>    return.
> - Check for HAS_AS_SDP() before setting VIDEO_DIP_ENABLE_AS_ADL mask.
>
> --v6:
> - Rename intel_read_dp_infoframe_as_sdp to intel_read_dp_as_sdp.
>
> --v7:
> - Add read back for length and vtotal correction.
>
> --v8:
> - Use as_sdp->target_rr & 0xFF.
> - Shift by 8 instead of 32, and drop casting to u64.
> -  Remove changes which are does not belong to this patch.
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

> ---
>   .../drm/i915/display/intel_display_device.h   |  1 +
>   drivers/gpu/drm/i915/display/intel_dp.c       | 92 +++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_hdmi.c     | 14 ++-
>   drivers/gpu/drm/i915/i915_reg.h               |  8 ++
>   4 files changed, 114 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
> index fe4268813786..6399fbc6c738 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
> @@ -68,6 +68,7 @@ struct drm_printer;
>   #define HAS_TRANSCODER(i915, trans)	((DISPLAY_RUNTIME_INFO(i915)->cpu_transcoder_mask & \
>   					  BIT(trans)) != 0)
>   #define HAS_VRR(i915)			(DISPLAY_VER(i915) >= 11)
> +#define HAS_AS_SDP(i915)		(DISPLAY_VER(i915) >= 13)
>   #define INTEL_NUM_PIPES(i915)		(hweight8(DISPLAY_RUNTIME_INFO(i915)->pipe_mask))
>   #define I915_HAS_HOTPLUG(i915)		(DISPLAY_INFO(i915)->has_hotplug)
>   #define OVERLAY_NEEDS_PHYSICAL(i915)	(DISPLAY_INFO(i915)->overlay_needs_physical)
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index b485ec320085..4a8638502d04 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4127,6 +4127,32 @@ intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
>   	return false;
>   }
>   
> +static ssize_t intel_dp_as_sdp_pack(const struct drm_dp_as_sdp *as_sdp,
> +				    struct dp_sdp *sdp, size_t size)
> +{
> +	size_t length = sizeof(struct dp_sdp);
> +
> +	if (size < length)
> +		return -ENOSPC;
> +
> +	memset(sdp, 0, size);
> +
> +	/* Prepare AS (Adaptive Sync) SDP Header */
> +	sdp->sdp_header.HB0 = 0;
> +	sdp->sdp_header.HB1 = as_sdp->sdp_type;
> +	sdp->sdp_header.HB2 = 0x02;
> +	sdp->sdp_header.HB3 = as_sdp->length;
> +
> +	/* Fill AS (Adaptive Sync) SDP Payload */
> +	sdp->db[0] = as_sdp->mode;
> +	sdp->db[1] = as_sdp->vtotal & 0xFF;
> +	sdp->db[2] = (as_sdp->vtotal >> 8) & 0xFF;
> +	sdp->db[3] = as_sdp->target_rr & 0xFF;
> +	sdp->db[4] = (as_sdp->target_rr >> 8) & 0x3;
> +
> +	return length;
> +}
> +
>   static ssize_t
>   intel_dp_hdr_metadata_infoframe_sdp_pack(struct drm_i915_private *i915,
>   					 const struct hdmi_drm_infoframe *drm_infoframe,
> @@ -4226,6 +4252,10 @@ static void intel_write_dp_sdp(struct intel_encoder *encoder,
>   							       &crtc_state->infoframes.drm.drm,
>   							       &sdp, sizeof(sdp));
>   		break;
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		len = intel_dp_as_sdp_pack(&crtc_state->infoframes.as_sdp, &sdp,
> +					   sizeof(sdp));
> +		break;
>   	default:
>   		MISSING_CASE(type);
>   		return;
> @@ -4247,6 +4277,10 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
>   	u32 dip_enable = VIDEO_DIP_ENABLE_AVI_HSW | VIDEO_DIP_ENABLE_GCP_HSW |
>   			 VIDEO_DIP_ENABLE_VS_HSW | VIDEO_DIP_ENABLE_GMP_HSW |
>   			 VIDEO_DIP_ENABLE_SPD_HSW | VIDEO_DIP_ENABLE_DRM_GLK;
> +
> +	if (HAS_AS_SDP(dev_priv))
> +		dip_enable |= VIDEO_DIP_ENABLE_AS_ADL;
> +
>   	u32 val = intel_de_read(dev_priv, reg) & ~dip_enable;
>   
>   	/* TODO: Sanitize DSC enabling wrt. intel_dsc_dp_pps_write(). */
> @@ -4268,6 +4302,37 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
>   	intel_write_dp_sdp(encoder, crtc_state, HDMI_PACKET_TYPE_GAMUT_METADATA);
>   }
>   
> +static
> +int intel_dp_as_sdp_unpack(struct drm_dp_as_sdp *as_sdp,
> +			   const void *buffer, size_t size)
> +{
> +	const struct dp_sdp *sdp = buffer;
> +
> +	if (size < sizeof(struct dp_sdp))
> +		return -EINVAL;
> +
> +	memset(as_sdp, 0, sizeof(*as_sdp));
> +
> +	if (sdp->sdp_header.HB0 != 0)
> +		return -EINVAL;
> +
> +	if (sdp->sdp_header.HB1 != DP_SDP_ADAPTIVE_SYNC)
> +		return -EINVAL;
> +
> +	if (sdp->sdp_header.HB2 != 0x02)
> +		return -EINVAL;
> +
> +	if ((sdp->sdp_header.HB3 & 0x3F) != 9)
> +		return -EINVAL;
> +
> +	as_sdp->length = sdp->sdp_header.HB3 & DP_ADAPTIVE_SYNC_SDP_LENGTH;
> +	as_sdp->mode = sdp->db[0] & DP_ADAPTIVE_SYNC_SDP_OPERATION_MODE;
> +	as_sdp->vtotal = (sdp->db[2] << 8) | sdp->db[1];
> +	as_sdp->target_rr = (u64)sdp->db[3] | ((u64)sdp->db[4] & 0x3);
> +
> +	return 0;
> +}
> +
>   static int intel_dp_vsc_sdp_unpack(struct drm_dp_vsc_sdp *vsc,
>   				   const void *buffer, size_t size)
>   {
> @@ -4338,6 +4403,29 @@ static int intel_dp_vsc_sdp_unpack(struct drm_dp_vsc_sdp *vsc,
>   	return 0;
>   }
>   
> +static void
> +intel_read_dp_as_sdp(struct intel_encoder *encoder,
> +		     struct intel_crtc_state *crtc_state,
> +		     struct drm_dp_as_sdp *as_sdp)
> +{
> +	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
> +	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
> +	unsigned int type = DP_SDP_ADAPTIVE_SYNC;
> +	struct dp_sdp sdp = {};
> +	int ret;
> +
> +	if ((crtc_state->infoframes.enable &
> +	     intel_hdmi_infoframe_enable(type)) == 0)
> +		return;
> +
> +	dig_port->read_infoframe(encoder, crtc_state, type, &sdp,
> +				 sizeof(sdp));
> +
> +	ret = intel_dp_as_sdp_unpack(as_sdp, &sdp, sizeof(sdp));
> +	if (ret)
> +		drm_dbg_kms(&dev_priv->drm, "Failed to unpack DP AS SDP\n");
> +}
> +
>   static int
>   intel_dp_hdr_metadata_infoframe_sdp_unpack(struct hdmi_drm_infoframe *drm_infoframe,
>   					   const void *buffer, size_t size)
> @@ -4444,6 +4532,10 @@ void intel_read_dp_sdp(struct intel_encoder *encoder,
>   		intel_read_dp_hdr_metadata_infoframe_sdp(encoder, crtc_state,
>   							 &crtc_state->infoframes.drm.drm);
>   		break;
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		intel_read_dp_as_sdp(encoder, crtc_state,
> +				     &crtc_state->infoframes.as_sdp);
> +		break;
>   	default:
>   		MISSING_CASE(type);
>   		break;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 90d2236fede3..18c35dd43ecb 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -114,6 +114,8 @@ static u32 g4x_infoframe_enable(unsigned int type)
>   		return VIDEO_DIP_ENABLE_GAMUT;
>   	case DP_SDP_VSC:
>   		return 0;
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		return 0;
>   	case HDMI_INFOFRAME_TYPE_AVI:
>   		return VIDEO_DIP_ENABLE_AVI;
>   	case HDMI_INFOFRAME_TYPE_SPD:
> @@ -137,6 +139,8 @@ static u32 hsw_infoframe_enable(unsigned int type)
>   		return VIDEO_DIP_ENABLE_GMP_HSW;
>   	case DP_SDP_VSC:
>   		return VIDEO_DIP_ENABLE_VSC_HSW;
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		return VIDEO_DIP_ENABLE_AS_ADL;
>   	case DP_SDP_PPS:
>   		return VDIP_ENABLE_PPS;
>   	case HDMI_INFOFRAME_TYPE_AVI:
> @@ -164,6 +168,8 @@ hsw_dip_data_reg(struct drm_i915_private *dev_priv,
>   		return HSW_TVIDEO_DIP_GMP_DATA(cpu_transcoder, i);
>   	case DP_SDP_VSC:
>   		return HSW_TVIDEO_DIP_VSC_DATA(cpu_transcoder, i);
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		return ADL_TVIDEO_DIP_AS_SDP_DATA(cpu_transcoder, i);
>   	case DP_SDP_PPS:
>   		return ICL_VIDEO_DIP_PPS_DATA(cpu_transcoder, i);
>   	case HDMI_INFOFRAME_TYPE_AVI:
> @@ -186,6 +192,8 @@ static int hsw_dip_data_size(struct drm_i915_private *dev_priv,
>   	switch (type) {
>   	case DP_SDP_VSC:
>   		return VIDEO_DIP_VSC_DATA_SIZE;
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		return VIDEO_DIP_ASYNC_DATA_SIZE;
>   	case DP_SDP_PPS:
>   		return VIDEO_DIP_PPS_DATA_SIZE;
>   	case HDMI_PACKET_TYPE_GAMUT_METADATA:
> @@ -563,6 +571,9 @@ static u32 hsw_infoframes_enabled(struct intel_encoder *encoder,
>   	if (DISPLAY_VER(dev_priv) >= 10)
>   		mask |= VIDEO_DIP_ENABLE_DRM_GLK;
>   
> +	if (HAS_AS_SDP(dev_priv))
> +		mask |= VIDEO_DIP_ENABLE_AS_ADL;
> +
>   	return val & mask;
>   }
>   
> @@ -570,6 +581,7 @@ static const u8 infoframe_type_to_idx[] = {
>   	HDMI_PACKET_TYPE_GENERAL_CONTROL,
>   	HDMI_PACKET_TYPE_GAMUT_METADATA,
>   	DP_SDP_VSC,
> +	DP_SDP_ADAPTIVE_SYNC,
>   	HDMI_INFOFRAME_TYPE_AVI,
>   	HDMI_INFOFRAME_TYPE_SPD,
>   	HDMI_INFOFRAME_TYPE_VENDOR,
> @@ -1212,7 +1224,7 @@ static void hsw_set_infoframes(struct intel_encoder *encoder,
>   	val &= ~(VIDEO_DIP_ENABLE_VSC_HSW | VIDEO_DIP_ENABLE_AVI_HSW |
>   		 VIDEO_DIP_ENABLE_GCP_HSW | VIDEO_DIP_ENABLE_VS_HSW |
>   		 VIDEO_DIP_ENABLE_GMP_HSW | VIDEO_DIP_ENABLE_SPD_HSW |
> -		 VIDEO_DIP_ENABLE_DRM_GLK);
> +		 VIDEO_DIP_ENABLE_DRM_GLK | VIDEO_DIP_ENABLE_AS_ADL);
>   
>   	if (!enable) {
>   		intel_de_write(dev_priv, reg, val);
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index e00557e1a57f..dce276236707 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -2312,6 +2312,7 @@
>    * (Haswell and newer) to see which VIDEO_DIP_DATA byte corresponds to each byte
>    * of the infoframe structure specified by CEA-861. */
>   #define   VIDEO_DIP_DATA_SIZE	32
> +#define   VIDEO_DIP_ASYNC_DATA_SIZE	36
>   #define   VIDEO_DIP_GMP_DATA_SIZE	36
>   #define   VIDEO_DIP_VSC_DATA_SIZE	36
>   #define   VIDEO_DIP_PPS_DATA_SIZE	132
> @@ -2350,6 +2351,8 @@
>   #define   VIDEO_DIP_ENABLE_VS_HSW	(1 << 8)
>   #define   VIDEO_DIP_ENABLE_GMP_HSW	(1 << 4)
>   #define   VIDEO_DIP_ENABLE_SPD_HSW	(1 << 0)
> +/* ADL and later: */
> +#define   VIDEO_DIP_ENABLE_AS_ADL	REG_BIT(23)
>   
>   /* Panel fitting */
>   #define PFIT_CONTROL	_MMIO(DISPLAY_MMIO_BASE(dev_priv) + 0x61230)
> @@ -5040,6 +5043,7 @@
>   #define _HSW_VIDEO_DIP_SPD_DATA_A	0x602A0
>   #define _HSW_VIDEO_DIP_GMP_DATA_A	0x602E0
>   #define _HSW_VIDEO_DIP_VSC_DATA_A	0x60320
> +#define	_ADL_VIDEO_DIP_AS_DATA_A	0x60484
>   #define _GLK_VIDEO_DIP_DRM_DATA_A	0x60440
>   #define _HSW_VIDEO_DIP_AVI_ECC_A	0x60240
>   #define _HSW_VIDEO_DIP_VS_ECC_A		0x60280
> @@ -5054,6 +5058,7 @@
>   #define _HSW_VIDEO_DIP_SPD_DATA_B	0x612A0
>   #define _HSW_VIDEO_DIP_GMP_DATA_B	0x612E0
>   #define _HSW_VIDEO_DIP_VSC_DATA_B	0x61320
> +#define _ADL_VIDEO_DIP_AS_DATA_B	0x61484
>   #define _GLK_VIDEO_DIP_DRM_DATA_B	0x61440
>   #define _HSW_VIDEO_DIP_BVI_ECC_B	0x61240
>   #define _HSW_VIDEO_DIP_VS_ECC_B		0x61280
> @@ -5083,6 +5088,9 @@
>   #define GLK_TVIDEO_DIP_DRM_DATA(trans, i)	_MMIO_TRANS2(trans, _GLK_VIDEO_DIP_DRM_DATA_A + (i) * 4)
>   #define ICL_VIDEO_DIP_PPS_DATA(trans, i)	_MMIO_TRANS2(trans, _ICL_VIDEO_DIP_PPS_DATA_A + (i) * 4)
>   #define ICL_VIDEO_DIP_PPS_ECC(trans, i)		_MMIO_TRANS2(trans, _ICL_VIDEO_DIP_PPS_ECC_A + (i) * 4)
> +/*ADLP and later: */
> +#define ADL_TVIDEO_DIP_AS_SDP_DATA(trans, i)	_MMIO_TRANS2(trans,\
> +							     _ADL_VIDEO_DIP_AS_DATA_A + (i) * 4)
>   
>   #define _HSW_STEREO_3D_CTL_A		0x70020
>   #define   S3D_ENABLE			(1 << 31)
