Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455AD866EF5
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 10:43:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD0810EFF8;
	Mon, 26 Feb 2024 09:43:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RjS/LPQP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F9E10E689;
 Mon, 26 Feb 2024 09:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708940622; x=1740476622;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r+6A5+ZrWYDRgvfuPU3jei1D2e7cB3GvjWGm7IdcmR4=;
 b=RjS/LPQPoUbPHcjJQtMGFLxi+S7UjFYqQf+iCpnw4JMftzgaWEfYlz/o
 IneIN1juBRXz813t1k4oW0vJQCjahTsPK5/jS4LJadEzTK7kohfx3YLON
 xHuZdRswtJuDjL3SXLnvYjI5HRqZRc1jobLfpejgjsJxKgse6XgYBDTPW
 BTnFPeqlqyoA44RRnro9aqDnP5+8a1cvKO5wS7kTYFisHI+Yx4wydu8WI
 yprcljtepK79IY78vt17zBORzdNFoyQXRXeXofJH1YtXk4sfShiI3b0W9
 vczeiYkbxCwa1+1Ueyfm0Bsj5zuDBZjVKwsjrWLaSD6Aur5LcPTnctPUd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="14346908"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="14346908"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 01:43:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="29791142"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2024 01:43:41 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 01:43:40 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 01:43:40 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 01:43:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5qM+yXzsm+r9jqFADoGvCmUSZks/N4n9XnAVHQn01M7EGTAgBBiKl3j6SCHQ0od0I+jnanEeQZ7cu09Xcyxwhlfr6gWGXkjYrIsXRLQlXOsBoRYvv7etHXVnKSxMJzow9y5jTVUYGYoUJ6nIeA2ZlRj+XFvTg0PcWil+IQRyjksMKqiL/pwYudtGK8QN7jGvUTqV83M4zY9RDdw24QdRm95k/juXvuokFZf4r02g1IVWN8oArpi3/ZixTc+4LrTyHhMMMZWbdzcgDc2Sb2wS0/zZXdFSNX1WAjugxVsE6IUacOSe/tK31vsYTBQazw8T0cZU4z2H+SjkevsfwMROw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWuy6rXqFUQfZ5QjtECcrpH1bnds17v2nxeZKIp7lUU=;
 b=Ei/G661LtEFcXMYbDDAZ0gEBSghY0mvedVsjKScHQUCicXT8iNXoU4P/nGQux/frhM9uJw6MExanx1Hd4pgzNj51OhqYSnjixK6tJQQUSWitJJ3yNKUSGLsAc1v4ZLpRmGH1luKeCxwGsj0U5BpW0ywZAFppSyPJ/FvqGEAZ4Y9BTHsoREI8v4jqpOSS410WKRnI72wBA9O4QlQOdkJjiWPi3kLs0TkVrMWd56+LqROWdGHurdELHpjVpGE3i4rAXIX2o3JMAADczDf585gljs/65bdIWU1zw4eCFG+7HDmIZNdC7C1jo3bPz024mk43OdOfU9g51g3thJH4T2xr4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CY8PR11MB7316.namprd11.prod.outlook.com (2603:10b6:930:9f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.22; Mon, 26 Feb
 2024 09:43:33 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7339.023; Mon, 26 Feb 2024
 09:43:33 +0000
Message-ID: <122ee65d-8f8f-4fae-a81c-50b8f958bdfe@intel.com>
Date: Mon, 26 Feb 2024 15:13:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/i915/dp: Add Read/Write support for Adaptive Sync
 SDP
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20240222121223.2257958-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240222121223.2257958-4-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240222121223.2257958-4-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::22) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CY8PR11MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: f167512c-9402-4119-d3e3-08dc36af65a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p0gOo49u7waWe59BC/7Dn928wHDzcmslgtEDFAixpSLOUwLfKVYuCLuL60XpVpBLx8QEAnaq7KHffBupacVRr7YmnfI5ACVjFY4wXvR8alzrRtTf/wnhcmU1IVKxBDwbci+i8afxEncQXq7p49wLkQDEb5MuJL1rXxsMeZL30PGh7sYCJFUQdYZkahUM6njZ15s+0HZYdSFlMEqhqp+ANptC1xTNPDoe7ppBO9YRfL7RDOsRlC1pLaAIzqTIlqr8in65CKVVRXxxK8e1yz7W+smZiHIesP6sFK/x+DtS0M7cFmCARKpMHBMYkeOramZWAsv/NCM1IMfLxBkGO7bek2cKgjqOWCdYd9WQM+y//4zzVJeBAc5Zu+LLzs63CPEu7ZL5+9ekkLv8mIu3h2SWY+i4SejPUS0457RCoRNg9OAxLIkGOYyVz/MT4XiIY/8GdUD+pGpr2kjws8PjBgGW6Db2oUwspVqXogVtFMJ6BaVCIreVg5+Ntrdc4ZDpxZ74vqhTWeluRqyeCmLvNB1IpRCGfap1THOuFOVA9hG/juVntdAZge5VOR0iB+2Q3iKMuLZEgqVa24+Kulr3xM2ycuA1wkVxV5HbygOHk5XOR/3OR5pFCffueIlyz+B26FDZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3BwcjlZWCs4dU55V05scldVNXk0Q1hNOFkzOW0zQXBwN05Fa1ZKNlpjMyta?=
 =?utf-8?B?WVhlZ21JN1NSU3BLTkZxc3pITHREWjkzZ1R6RUR6YXEyd3VnaUpUVm5Oa3FE?=
 =?utf-8?B?RVp5eVk3d0VZaEJPdnB3OFRDQkcvdnBvbE03QmxpUUhScXl2ZnBUM0MvVk92?=
 =?utf-8?B?NkVCam9FUDZiS0RWSlZ5c20xdmFKYktHNmdpZW5KZi8xWUV2Sy8zRnlwK2pn?=
 =?utf-8?B?aEpldGdVR3czVUZQSXMzNTNxbXJNcmo2bGVJNnZaa3hUNGYwOW9lYVFxaGxl?=
 =?utf-8?B?ZytCVWJFcG0zNGRYQlY5cG5VUSt2MEJlVUpJYjBwQmdQM3ZyLzNNS3BBYXpk?=
 =?utf-8?B?aUt3YTBYaXZTMWFodjQwaVp6dkNZOUpidFVkUlBkVXlLR3kvRWtMVkhQdFov?=
 =?utf-8?B?WDNqcTB1UllydlRBS2xqa05RbURFTGY5WGgrTGtPdDFld1hMNkhQSWFkOXha?=
 =?utf-8?B?eEgrS3lucGoyeTdiZ1VuMnlwdUNpMG03MTdoQXpFdW1UNEJ1SHRtdGZyVDBW?=
 =?utf-8?B?S1ovcWpHT3V2bmdDS3BUSVRDLzZoOVg2NDNVWUhrbVM0aTJhdnF1WVM3Mlhv?=
 =?utf-8?B?eERTL3BKWkdSVS9SNUpGYkxXTGg3MERNY1o3cHZOT1Bhd2krUzY3UllkNnZw?=
 =?utf-8?B?T3VLWXVTR1pyV2w5dXdXWXB5UXNuUnlodlk2TUcyRlVKK3lCYUFwNW9ZTDJi?=
 =?utf-8?B?MGgyWFpCM0ViNm1UanZWb3EvNFB6MDViekM0WTVVNlhBOFdIdlpCdDhOQlFK?=
 =?utf-8?B?OUZCSGxDQ0N2NjNkTExyblZQTVdhWG0zRW9DYkFXWkk5bjNmUm40Sm13RmVk?=
 =?utf-8?B?OWFxU0tXOWYrdkJCb2grQWhhN3AycEprdVhVc3hmdEVtajNzejJMblIvcVQ5?=
 =?utf-8?B?QnNpS1AwSm5KUFZIQVJxZWQyMWZ4MVpDblRhMlFrb0o0d0RtUUFabHc0c1Ns?=
 =?utf-8?B?U3QxWGVTbXdzQzZCWXR3UHhyWFNPVVNsUGtVdis5M2VqS2QxZXc5ajlJQTdQ?=
 =?utf-8?B?S0xHc0U0QkFGdUhVV1EzcVZNbGpCN2NDNDIyaHBoQ0xxYjVkZ05ib1B1eVNH?=
 =?utf-8?B?aFpaayszTVFRbGhXZ24yNm9iWHZXenBZNnQ2UmkzaDFEUWdOSmNvaGMzcXZz?=
 =?utf-8?B?enJxaFpQbjVFeFV3aThEaHFCVnRHazhRQWZ2WDI2bmhxaEQ5c0h6TjBJRTZx?=
 =?utf-8?B?SHlBZVJnYUZtbVFnOTRRaDFsU1VYTEt5d2hKd3UzMllhSi84ZzdMYVJYdUZM?=
 =?utf-8?B?cExRdm5haExFcWZxQUJVdjRmMGIrUWNSbGZvMldmUm5pTU92Mm1SOU52VHBW?=
 =?utf-8?B?S1A5UXpya1NhWFl1ZFJXN1NYeVBOQmRqajlkdFFjZjZRMTdXUE9iSkdMNGha?=
 =?utf-8?B?SitHTXh6WisxQjJSRHhITWpDSlc1NGsyQXRBYVc2SnYrcmx1QTJDcWpzemhB?=
 =?utf-8?B?cmFUNldjRFc3b05jUlR1bldlQlI2OUZaU3FwTkZtMzk2RkhGcTJJbE9IY21E?=
 =?utf-8?B?WUI0V2J5MllwdisyUEZxOXlNS1MyUzRYTmNBenM5eTVOTmszOEtZUEUxZUYz?=
 =?utf-8?B?dXpBMWREYklMeEZSeTZlZTUweTEvTEpCbW4wVXlVMW9IYkpqeGhCYWRvS0pU?=
 =?utf-8?B?QVZyTlprNDloZUo2RzFndVhsdUM4bGRhM0FSTENvUjZidTRETkh2M3lIcmIv?=
 =?utf-8?B?ZDgrdjdpSWw2UXkzM0hoVy9EMnJoWk1iV2VROWxvamx4NHpFWlp1NHNYandu?=
 =?utf-8?B?c2lJMVBVMVUvN3crTDI1MGpkUUZlaWswWXNQcjcxTnNjRVd6ZUJJbmM4T3lp?=
 =?utf-8?B?ZlhqYzNBRnhvZUgwWkNBOFB4Z2lCbjAwbmxNL0JwVG45NGFnZjRHMTlBRkwy?=
 =?utf-8?B?ckVHaFZvSk5WZVBickh5OVFmRDZEN3NGNnJGSXhIZXJDRERybGc5enFUaW53?=
 =?utf-8?B?bWRIcWxWbXJ3MVZqczlLVGM0bHVYR2l0cE9qbjQwQWVSczI4bmwrR29mZWt4?=
 =?utf-8?B?V2sxaWEySms1LzZselBSOXRkTGdudTNKRmhVcmljUmJ5aXAzZURPWnRCbnVX?=
 =?utf-8?B?bGZSRzVnaFVOM0EvYVlJR1JhQlpzQTYyTldrbzRLcWROYmM5YTVuVmNlM25u?=
 =?utf-8?B?c1dWV2xRZDIzVmJTLzRkbGhMQ1NrZ3hRTmV2ZXRLbXNQeWVDQnUrazc2Zytq?=
 =?utf-8?B?cFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f167512c-9402-4119-d3e3-08dc36af65a5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 09:43:33.5855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bo4u8ndc/nk5XgdvydyGZ6orQLTwEqCwFIF/4jJjofBhginArY4AraWwr3qsBmeY8jXT+sb6C+GCGijAUqyjiXvCSVT2sYkVpjGF8SUGV7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7316
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


On 2/22/2024 5:42 PM, Mitul Golani wrote:
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
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   .../drm/i915/display/intel_display_types.h    |  1 +
>   drivers/gpu/drm/i915/display/intel_dp.c       | 89 ++++++++++++++++++-
>   drivers/gpu/drm/i915/display/intel_hdmi.c     | 12 ++-
>   drivers/gpu/drm/i915/display/intel_vrr.c      |  5 ++
>   drivers/gpu/drm/i915/i915_reg.h               |  8 ++
>   5 files changed, 111 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index a6991bc3f07b..2accfe41160d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1414,6 +1414,7 @@ struct intel_crtc_state {
>   		bool enable, in_range;
>   		u8 pipeline_full;
>   		u16 flipline, vmin, vmax, guardband;
> +		u8 as_sdp_mode;


I think this is DP specific, lets not add this thing here.


>   	} vrr;
>   
>   	/* Stream Splitter for eDP MSO */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 217196196e50..b370e1da4735 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -95,7 +95,6 @@
>   #define INTEL_DP_RESOLUTION_STANDARD	(2 << INTEL_DP_RESOLUTION_SHIFT_MASK)
>   #define INTEL_DP_RESOLUTION_FAILSAFE	(3 << INTEL_DP_RESOLUTION_SHIFT_MASK)
>   
> -
>   /* Constants for DP DSC configurations */
>   static const u8 valid_dsc_bpp[] = {6, 8, 10, 12, 15};
>   
> @@ -4089,6 +4088,32 @@ intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
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
> +	sdp->db[3] = as_sdp->target_rr;
> +	sdp->db[4] = (as_sdp->target_rr >> 8) & 0x3;
> +
> +	return length;
> +}
> +
>   static ssize_t intel_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
>   				     struct dp_sdp *sdp, size_t size)
>   {
> @@ -4256,6 +4281,10 @@ static void intel_write_dp_sdp(struct intel_encoder *encoder,
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
> @@ -4276,7 +4305,8 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
>   	i915_reg_t reg = HSW_TVIDEO_DIP_CTL(crtc_state->cpu_transcoder);
>   	u32 dip_enable = VIDEO_DIP_ENABLE_AVI_HSW | VIDEO_DIP_ENABLE_GCP_HSW |
>   			 VIDEO_DIP_ENABLE_VS_HSW | VIDEO_DIP_ENABLE_GMP_HSW |
> -			 VIDEO_DIP_ENABLE_SPD_HSW | VIDEO_DIP_ENABLE_DRM_GLK;
> +			 VIDEO_DIP_ENABLE_SPD_HSW | VIDEO_DIP_ENABLE_DRM_GLK |
> +			 VIDEO_DIP_ENABLE_ADAPTIVE_SYNC;
>   	u32 val = intel_de_read(dev_priv, reg) & ~dip_enable;
>   
>   	/* TODO: Sanitize DSC enabling wrt. intel_dsc_dp_pps_write(). */
> @@ -4298,6 +4328,36 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
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
> +	as_sdp->mode = sdp->db[0] & AS_SDP_OP_MODE;
> +	as_sdp->vtotal = ((u64)sdp->db[2] << 32) | (u64)sdp->db[1];
> +	as_sdp->target_rr = (u64)sdp->db[3] | ((u64)sdp->db[4] & 0x3);
> +
> +	return 0;
> +}
> +
>   static int intel_dp_vsc_sdp_unpack(struct drm_dp_vsc_sdp *vsc,
>   				   const void *buffer, size_t size)
>   {
> @@ -4368,6 +4428,27 @@ static int intel_dp_vsc_sdp_unpack(struct drm_dp_vsc_sdp *vsc,
>   	return 0;
>   }
>   
> +static int
> +intel_read_dp_metadata_infoframe_as_sdp(struct intel_encoder *encoder,


Drop metadata here.


> +					struct intel_crtc_state *crtc_state,
> +					struct drm_dp_as_sdp *as_sdp)
> +{
> +	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
> +	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
> +	unsigned int type = DP_SDP_ADAPTIVE_SYNC;
> +	struct dp_sdp sdp = {};
> +	int ret;
> +
> +	dig_port->read_infoframe(encoder, crtc_state, type, &sdp,
> +				 sizeof(sdp));
> +
> +	ret = intel_dp_as_sdp_unpack(as_sdp, &sdp, sizeof(sdp));
> +	if (ret)
> +		drm_dbg_kms(&dev_priv->drm, "Failed to unpack DP AS SDP\n");
> +
> +	return ret;
> +}
> +
>   static int
>   intel_dp_hdr_metadata_infoframe_sdp_unpack(struct hdmi_drm_infoframe *drm_infoframe,
>   					   const void *buffer, size_t size)
> @@ -4474,6 +4555,10 @@ void intel_read_dp_sdp(struct intel_encoder *encoder,
>   		intel_read_dp_hdr_metadata_infoframe_sdp(encoder, crtc_state,
>   							 &crtc_state->infoframes.drm.drm);
>   		break;
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		intel_read_dp_metadata_infoframe_as_sdp(encoder, crtc_state,
> +							&crtc_state->infoframes.as_sdp);
> +		break;
>   	default:
>   		MISSING_CASE(type);
>   		break;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 7020e5806109..69e0876f43aa 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -137,6 +137,8 @@ static u32 hsw_infoframe_enable(unsigned int type)
>   		return VIDEO_DIP_ENABLE_GMP_HSW;
>   	case DP_SDP_VSC:
>   		return VIDEO_DIP_ENABLE_VSC_HSW;
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		return VIDEO_DIP_ENABLE_ADAPTIVE_SYNC;
>   	case DP_SDP_PPS:
>   		return VDIP_ENABLE_PPS;
>   	case HDMI_INFOFRAME_TYPE_AVI:
> @@ -164,6 +166,8 @@ hsw_dip_data_reg(struct drm_i915_private *dev_priv,
>   		return HSW_TVIDEO_DIP_GMP_DATA(cpu_transcoder, i);
>   	case DP_SDP_VSC:
>   		return HSW_TVIDEO_DIP_VSC_DATA(cpu_transcoder, i);
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		return TVIDEO_DIP_AS_SDP_DATA(cpu_transcoder, i);
>   	case DP_SDP_PPS:
>   		return ICL_VIDEO_DIP_PPS_DATA(cpu_transcoder, i);
>   	case HDMI_INFOFRAME_TYPE_AVI:
> @@ -186,6 +190,8 @@ static int hsw_dip_data_size(struct drm_i915_private *dev_priv,
>   	switch (type) {
>   	case DP_SDP_VSC:
>   		return VIDEO_DIP_VSC_DATA_SIZE;
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		return VIDEO_DIP_ASYNC_DATA_SIZE;
>   	case DP_SDP_PPS:
>   		return VIDEO_DIP_PPS_DATA_SIZE;
>   	case HDMI_PACKET_TYPE_GAMUT_METADATA:
> @@ -558,7 +564,8 @@ static u32 hsw_infoframes_enabled(struct intel_encoder *encoder,
>   
>   	mask = (VIDEO_DIP_ENABLE_VSC_HSW | VIDEO_DIP_ENABLE_AVI_HSW |
>   		VIDEO_DIP_ENABLE_GCP_HSW | VIDEO_DIP_ENABLE_VS_HSW |
> -		VIDEO_DIP_ENABLE_GMP_HSW | VIDEO_DIP_ENABLE_SPD_HSW);
> +		VIDEO_DIP_ENABLE_GMP_HSW | VIDEO_DIP_ENABLE_SPD_HSW |
> +		VIDEO_DIP_ENABLE_ADAPTIVE_SYNC);
>   
>   	if (DISPLAY_VER(dev_priv) >= 10)
>   		mask |= VIDEO_DIP_ENABLE_DRM_GLK;
> @@ -570,6 +577,7 @@ static const u8 infoframe_type_to_idx[] = {
>   	HDMI_PACKET_TYPE_GENERAL_CONTROL,
>   	HDMI_PACKET_TYPE_GAMUT_METADATA,
>   	DP_SDP_VSC,
> +	DP_SDP_ADAPTIVE_SYNC,
>   	HDMI_INFOFRAME_TYPE_AVI,
>   	HDMI_INFOFRAME_TYPE_SPD,
>   	HDMI_INFOFRAME_TYPE_VENDOR,
> @@ -1212,7 +1220,7 @@ static void hsw_set_infoframes(struct intel_encoder *encoder,
>   	val &= ~(VIDEO_DIP_ENABLE_VSC_HSW | VIDEO_DIP_ENABLE_AVI_HSW |
>   		 VIDEO_DIP_ENABLE_GCP_HSW | VIDEO_DIP_ENABLE_VS_HSW |
>   		 VIDEO_DIP_ENABLE_GMP_HSW | VIDEO_DIP_ENABLE_SPD_HSW |
> -		 VIDEO_DIP_ENABLE_DRM_GLK);
> +		 VIDEO_DIP_ENABLE_DRM_GLK | VIDEO_DIP_ENABLE_ADAPTIVE_SYNC);
>   
>   	if (!enable) {
>   		intel_de_write(dev_priv, reg, val);
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 5d905f932cb4..d2ab7e571e62 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -113,6 +113,7 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
>   	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
>   	struct intel_connector *connector =
>   		to_intel_connector(conn_state->connector);
> +	struct intel_dp *intel_dp = intel_attached_dp(connector);
>   	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
>   	const struct drm_display_info *info = &connector->base.display_info;
>   	int vmin, vmax;
> @@ -165,6 +166,10 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
>   	if (crtc_state->uapi.vrr_enabled) {
>   		crtc_state->vrr.enable = true;
>   		crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
> +
> +		if (drm_dp_as_sdp_supported(&intel_dp->aux, intel_dp->dpcd))
> +			crtc_state->vrr.as_sdp_mode =
> +						DP_AS_SDP_AVT_DYNAMIC_VTOTAL;
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index e00557e1a57f..c02ea07af4c2 100644
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
> +#define   VIDEO_DIP_ENABLE_ADAPTIVE_SYNC	REG_BIT(23)

For consistency, perhaps VIDEO_DIP_ENABLE_ADAPTIVE_SYNC_ADL would be better.

Same with others macros below.

Regards,

Ankit

>   
>   /* Panel fitting */
>   #define PFIT_CONTROL	_MMIO(DISPLAY_MMIO_BASE(dev_priv) + 0x61230)
> @@ -5040,6 +5043,7 @@
>   #define _HSW_VIDEO_DIP_SPD_DATA_A	0x602A0
>   #define _HSW_VIDEO_DIP_GMP_DATA_A	0x602E0
>   #define _HSW_VIDEO_DIP_VSC_DATA_A	0x60320
> +#define	_VIDEO_DIP_AS_SDP_DATA_A	0x60484
>   #define _GLK_VIDEO_DIP_DRM_DATA_A	0x60440
>   #define _HSW_VIDEO_DIP_AVI_ECC_A	0x60240
>   #define _HSW_VIDEO_DIP_VS_ECC_A		0x60280
> @@ -5054,6 +5058,7 @@
>   #define _HSW_VIDEO_DIP_SPD_DATA_B	0x612A0
>   #define _HSW_VIDEO_DIP_GMP_DATA_B	0x612E0
>   #define _HSW_VIDEO_DIP_VSC_DATA_B	0x61320
> +#define	_VIDEO_DIP_AS_SDP_DATA_B	0x61484
>   #define _GLK_VIDEO_DIP_DRM_DATA_B	0x61440
>   #define _HSW_VIDEO_DIP_BVI_ECC_B	0x61240
>   #define _HSW_VIDEO_DIP_VS_ECC_B		0x61280
> @@ -5083,6 +5088,9 @@
>   #define GLK_TVIDEO_DIP_DRM_DATA(trans, i)	_MMIO_TRANS2(trans, _GLK_VIDEO_DIP_DRM_DATA_A + (i) * 4)
>   #define ICL_VIDEO_DIP_PPS_DATA(trans, i)	_MMIO_TRANS2(trans, _ICL_VIDEO_DIP_PPS_DATA_A + (i) * 4)
>   #define ICL_VIDEO_DIP_PPS_ECC(trans, i)		_MMIO_TRANS2(trans, _ICL_VIDEO_DIP_PPS_ECC_A + (i) * 4)
> +/*ADLP and later: */
> +#define TVIDEO_DIP_AS_SDP_DATA(trans, i)	_MMIO_TRANS2(trans,\
> +							     _VIDEO_DIP_AS_SDP_DATA_A + (i) * 4)
>   
>   #define _HSW_STEREO_3D_CTL_A		0x70020
>   #define   S3D_ENABLE			(1 << 31)
