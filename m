Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53691866F6B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 10:55:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED45F10F013;
	Mon, 26 Feb 2024 09:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PhsEp8Ug";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B0510F014;
 Mon, 26 Feb 2024 09:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708941351; x=1740477351;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x+58+Ooj4Wr+GEpzqNTwmogz4pTGWUUKE8akzcgf6Zg=;
 b=PhsEp8UgeHoYVZ1y7xOhno+GV0cjQyoRa9JQh9QObye4cZEXOhgkAkcR
 YPJBJ1lC6aXcIDzv+19FgKemr345X86+cAaI9cgxX7PUJJ0oQLBmgiqCI
 BH1Hm/HxNC0trOs8j7NxQM3RkPBngsYX7xGV+L5klYViYl/Kmnq++vnwx
 7In3klKQKkN1JbblH2MKS/imQzQU5aO9PI6n41AedDHhIk8rKLd92cw5Y
 fLTXtUJ3fvc5rY17Usizo5RiX311f8MkvQ/QQl34RanlwPtj6BsCW0pw9
 fWm2ofe3IOeH3YB3DR8Pzuo9ljSaIOV4ZUdXzgVARJQCT7RixVCyopMCa A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3077374"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3077374"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 01:55:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="7043004"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2024 01:55:51 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 01:55:49 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 01:55:49 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 01:55:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XC5tQPaJrTQCu54F960tWxE1natxXQAErAC2D7For/PlJP/VohNtu0+x7Td8Ktxxq8c896C3SpdDFEiOzkbOK17hrYxq16kjxxIa+qQ+xB9q2VXhQNDg9p15u3K5lXRAsu9TMl9HX0kL4hQ1Q3DDtfylPQb0a/Dq1fmjqaaplFJEFkbXfIHl9dUEt/3eRYihUruqoB5ZUsnfQ2C2th7jspKdPphsvKT+0YBW6bq05qNtIbaBQRCdelq/ymv3+U16uhwhkY0NCWScHkQkhNxM3xMy1qTx3ZM6w8i/jwC4JHwDQsyFcyDmkCQTzHWmIOz2ZSeIWwDf9+X7p7tgMGeW3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Egvs1ciNrWov0G3F6T057Q6WauZ0N53g7xu9wAb8+6A=;
 b=CCPD8LV3ta3crdUWlPVO/x5OyLMcxYqkqhYRSzoLjT6vVbnz0x2CLIQJqDx4s8KKOSfztJXZIximVKxVwAroX3vx5kNAMKLSvOELnMlPy82i7egT42eFStynttbVR+K/AyfOyZg6PNod26VhRnyDT+6wrtKEOfCqo+M+1LYIoM5hW3G0HVdtNFSmBBSv5dBbjD5dIY0z/8WBwO3cVq489MDTn3Wob9GIZ9BJoSqjIxKzOQXazqUKU9z73Xee3XW/HtSUT0UklxKPIRNaf6IhkgPly4PL92jSBizzYcs9WetKHYXh5y55PHEargPYd6oegm2QTOnE3N+WhjOzfGP08w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by BL1PR11MB5493.namprd11.prod.outlook.com (2603:10b6:208:31f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Mon, 26 Feb
 2024 09:55:47 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7339.023; Mon, 26 Feb 2024
 09:55:47 +0000
Message-ID: <8007818a-ec7c-4ba0-a088-bc04cd99331a@intel.com>
Date: Mon, 26 Feb 2024 15:25:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/i915/display: Compute AS SDP parameters.
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20240222121223.2257958-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240222121223.2257958-5-mitulkumar.ajitkumar.golani@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240222121223.2257958-5-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0214.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::9) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|BL1PR11MB5493:EE_
X-MS-Office365-Filtering-Correlation-Id: f26651ea-4b11-48f3-a6c2-08dc36b11b10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6779DjvJvtMJjVUIH8T99DEVoi0E3rysuqyVtAKQnsYf0RRDDLhOX0E08qLc0C6Usq5TqDJ9DY9EWZ/Rv+TwBQ3ukyOUtZ/Zzb9w5JZI0JZFonoR5tasbH5OYOvRhH0ZkXSAUOnDVq+IylfxsteD+XzTTlg6iOW25Rt5kbAVrOMQ7u45sF9rXRVIFBcnReWE3dnLogOqbONw9+LW1Vqke+YpbJg8N32LtrLwmlUY31PNSJZf76x58WekfiCMoWA0zoCbWTywilFf4jkbWsN75ojiIbgie93NI32hG1qmVZSnts6hlxAfPqokr0Dy4dfIVCaEI6ZgBgmNRp7CO4FHPfm7qTxj2fRvwyHXGMJPu2PGZegzRKokHJbvUZ35BHrX1zY/NH8My3io2K3Oh+8JGu7j/d27wprdS328rrqS0TyI0m8axTQaUVZEykSNg5nm4fNiJ19NmV95JIAQIEMetQ4X7KGHDHtNp/bDRUd3d46XY8Cz6m6pZMp51ZxguRFrnQr3BhzI+0nRxL2Irr9DnDzZylU8iKTvZKx4gumA9kIvml29sNdSCb0+YhTm0lBkKKb0/RTtCfqaeDy47YPUF3P9YP7F8tj+SZM/4X55KL015apixHlBFJ5+Uoub1oDhaelK671sUqFeKXiuGYAAVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEczeExvZWpLOW5Vc0dVdkVIdUtLTGYxL00yMUdabzQwSkRNd3B4eVNiN0hY?=
 =?utf-8?B?Y2VWYlBHV0ljU0dXNFJzNEttcFlURWNMeEY0WWg4WThaTzRIYkNzcnlrZ2Jx?=
 =?utf-8?B?NXJwREovaFpQZmVnb3pqWTlIR1ZyenFGWnNGa0Fta2wvSm9wZThEcjczdlNM?=
 =?utf-8?B?VTR0VmgxQm45OEwrN2NTUzRIZGlHOFB2VDZlMFkrWVJBZ0o4MUtONWo2VzdO?=
 =?utf-8?B?SjM4am0yTFcraHlUMVRWVDlwUDhqN1BuMXFzTlZNVEFodHdpM25CUVpTQTZO?=
 =?utf-8?B?R3dKbFFSUlJDN2FXYXRVSXpJMEpHVnRoK1p2dlA0czhhOWRKaURKVXMrRzJR?=
 =?utf-8?B?QUczcmFtUzNjSnZBVEhiR0FrU1c3Q09JaVA3dy94K0pBMzVHNHpwQkdXL2Qv?=
 =?utf-8?B?M1NuZ25ab28zTjRzR1BVeElMaTl0TXMrVUE4WkdvM3hIMTRGNEF4WjRwZkxp?=
 =?utf-8?B?OU9NMnBDMEZLbHZvczRMRWlQUHJCOHhMWkxwNU5CbDl1QWRzRXlEQ2VuK3Za?=
 =?utf-8?B?RlprTjZqL20xZ0tpT3R3UTMzYnJTVUo2a0UrTW1IaCtyZmtmN2FNL0lYRnNH?=
 =?utf-8?B?eThTNEJ6OE5HNlJuSkR2M0srM21PTmxSOE01MFNRdkoySFBLcHlkWWZGVjU2?=
 =?utf-8?B?bkN6bWFVZmtFWHZvYjZURkpFdlMyZEI5UFR6MTN3bXl6eFBaU09WZ3gvcDJC?=
 =?utf-8?B?eEZ0blU3bURwZ0ZjaFpCOVREbnBLcjVhYmlNZVp6UmY0K1JlOGNYQkQzU0Ez?=
 =?utf-8?B?Z0RsQVZmRDg3dzZLTHg5dlRVNVFscHI0SmQrbUpvVUc2cFk4RDVaSk1kQ1Vm?=
 =?utf-8?B?WnRxdjVoc29HSkVXZnpNN3o0Y2loT2lvVFZxNkIvTHZXN0IvQ2NtTzRwWkt0?=
 =?utf-8?B?Mm82SkV1Y2NtL2FKcENNUnJYN3ZUei9kNUw2S3NEaXlJYWJLZzJveHFOdGlk?=
 =?utf-8?B?S25IdVA4VjRycDNtSnRqUzdjZ0lva1BDYXM3WkwvZVVRZG11UVVmS3BWUWxI?=
 =?utf-8?B?SitVMWhjTVUrVDdFRWVDU3ZNL29qZEplbkFUQzZjS0VTbFI2VksxcURiODBh?=
 =?utf-8?B?TmtXQ3pDNlV0TEU0M0pYK3lhY21uOGtBYURZM3phV0NVc1NhQ1kyVTRzMFBx?=
 =?utf-8?B?MlVzWW04cFBiay9ZRDBMWWdqcXJDQ2FONmU2NDhwSzM2OWtxZGZkeDdwRFhT?=
 =?utf-8?B?eFVuWlA0c3FMcEd6OWIvUVlQMjYzUDVod2xTUnpkbGF6U0xsR09zSXRMUUN4?=
 =?utf-8?B?MWdBeXVaaEQ1NUJGMWNtZHFmMmdzand0MHhTMkdYM1FFRktDWlBJbWd0VlN3?=
 =?utf-8?B?Y1lFMmJSblZ1bko3TFV5MjBuOEpJaEVuKzNPUTRkeFk1VjZDM3F1V2Z3L2pO?=
 =?utf-8?B?alNCVm1SVlVqNzZhQW5BY0lJaXBLZE53blNxUlgwRlpXeXJjOHM4K0hiN0Zr?=
 =?utf-8?B?VjhDQllMOFJlMnowZXpZcG9SbGxJZGYzakdENm9UUHplbVFvOUFqRUNyRFBM?=
 =?utf-8?B?c0tLck85QXhXYUFaOGlBMWNvenloRGY3WjgzVVhMRmp3REFjcEhiTVBVKzNM?=
 =?utf-8?B?QUt1THNhTWhpNHVWS3FQTS81Tjl4T0w4eXpGbVpMc0tVaWNEbHNqMTQ2aG5j?=
 =?utf-8?B?OTRCdm1mS2g5WTFWajNlUW1JR0JnWlJXa0xpakFjNEp4QmRvd0lpQllzY3RI?=
 =?utf-8?B?VFFxTCt5SE44dXkrdHJBTjVWY0dFUWxHdjBleTBFNGJGLzlRWFFjWEVzNkhp?=
 =?utf-8?B?dlJKUUQvUWpYQVJBNHVlbmplZ0ZYK1V1YUliTldIVWw1bUZvWmtnM2g0VkhD?=
 =?utf-8?B?TXBGMERYSlM1Z2xvMlQ1MkhJS2QrVUhUdDdTOEx3b3ZIb2M2Y3lsSk5kaWJY?=
 =?utf-8?B?VUdmcStXTUVxckNSZTFmSWdKUlBHSEZ4eml4dDYzUEhYbVpQajFNdHh3cEp3?=
 =?utf-8?B?RSsyUHdTR2E1QmQwcmhPaklOQmtHSUV5QktNcWdGYWthZDFvZnIxMS9MZ0xy?=
 =?utf-8?B?N3h0aG9ydVRSVjc5ZGlaSG8yK1N0VzAvTU54TUZ5T1N4TlBPQXhtVCtRVmUz?=
 =?utf-8?B?UVYxOThVUVdBQmtZbDErWkFZbVNsY1pmbW8yY29Dakw5Q1E2QVRSajQzSmJl?=
 =?utf-8?B?WDVSNzBoenFWNkg4dThDU3FjQUVmM080Q3RRdmtMdnNHdmdLRlRobFpuakth?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f26651ea-4b11-48f3-a6c2-08dc36b11b10
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 09:55:47.4312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MbaSCsiju5jbzYsquurNubx7XEtg248jVcBlVU22MSztSaf9dSTpZC17DDFwJduDKn1iqfMYtEnCajThA0PZGeAT9RLczSeCab/aCybgkec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5493
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
> Add necessary functions definitions to enable
> and compute AS SDP data. The new `intel_dp_compute_as_sdp`
> function computes AS SDP values based on the display
> configuration, ensuring proper handling of Variable Refresh
> Rate (VRR).
>
> --v2:
> - Add DP_SDP_ADAPTIVE_SYNC to infoframe_type_to_idx().[Ankit]
> - separate patch for intel_read/write_dp_sdp [Ankit].
> - _HSW_VIDEO_DIP_ASYNC_DATA_A should be from ADL onward [Ankit]
> - To fix indentation [Ankit]
>
> --v3:
> - Add VIDEO_DIP_ENABLE_AS_HSW flag to intel_dp_set_infoframes.
>
> --v4:
> - Add HAS_VRR check before write as sdp.
>
> --v5:
> - Add missed HAS_VRR check before read as sdp.
>
> --v6:
> Use Adaptive Sync sink status, which can be
> used as a check for read/write sdp. (Ankit)
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   .../drm/i915/display/intel_display_types.h    |  1 +
>   drivers/gpu/drm/i915/display/intel_dp.c       | 28 +++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_vrr.c      |  4 ++-
>   3 files changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 2accfe41160d..93b4b7dff1d0 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1415,6 +1415,7 @@ struct intel_crtc_state {
>   		u8 pipeline_full;
>   		u16 flipline, vmin, vmax, guardband;
>   		u8 as_sdp_mode;
> +		bool as_sdp_enable;

This is again specific to DP, we can do away with this in vrr struct.

>   	} vrr;
>   
>   	/* Stream Splitter for eDP MSO */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index b370e1da4735..5c1e2301dd52 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2617,6 +2617,33 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
>   	vsc->content_type = DP_CONTENT_TYPE_NOT_DEFINED;
>   }
>   
> +static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
> +				    struct intel_crtc_state *crtc_state,
> +				    const struct drm_connector_state *conn_state)
> +{
> +	struct drm_dp_as_sdp *as_sdp = &crtc_state->infoframes.as_sdp;
> +	struct intel_connector *connector = intel_dp->attached_connector;
> +	const struct drm_display_mode *adjusted_mode =
> +		&crtc_state->hw.adjusted_mode;
> +	int vrefresh = drm_mode_vrefresh(adjusted_mode);
> +
> +	if (!intel_vrr_is_in_range(connector, vrefresh) || !crtc_state->vrr.as_sdp_enable)
> +		return;
> +
> +	as_sdp->sdp_type = DP_SDP_ADAPTIVE_SYNC;
> +	as_sdp->length = 0x9;
> +	as_sdp->mode = crtc_state->vrr.as_sdp_mode;
> +	as_sdp->vtotal = adjusted_mode->vtotal;
> +
> +	if (as_sdp->mode == DP_AS_SDP_AVT_FIXED_VTOTAL) {

Currently we are just supporting DP_AS_SDP_AVT_FIXED_VTOTAL so this 
check is not required.

But we can add a comment mentioning the same.


> +		as_sdp->target_rr = 0;
> +		as_sdp->duration_incr_ms = 0;
> +		as_sdp->duration_incr_ms = 0;
> +	}
> +
> +	crtc_state->infoframes.enable |= intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC);
> +}

We will need to add this to state checker, something like 
PIPE_CONF_CHECK_DP_AS_SDP and add function to compare the adaptive sync 
sdp struct.


Regards,

Ankit

> +
>   static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
>   				     struct intel_crtc_state *crtc_state,
>   				     const struct drm_connector_state *conn_state)
> @@ -2942,6 +2969,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
>   		g4x_dp_set_clock(encoder, pipe_config);
>   
>   	intel_vrr_compute_config(pipe_config, conn_state);
> +	intel_dp_compute_as_sdp(intel_dp, pipe_config, conn_state);
>   	intel_psr_compute_config(intel_dp, pipe_config, conn_state);
>   	intel_dp_drrs_compute_config(connector, pipe_config, link_bpp_x16);
>   	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index d2ab7e571e62..08e3ba69bd30 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -167,9 +167,11 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
>   		crtc_state->vrr.enable = true;
>   		crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
>   
> -		if (drm_dp_as_sdp_supported(&intel_dp->aux, intel_dp->dpcd))
> +		if (drm_dp_as_sdp_supported(&intel_dp->aux, intel_dp->dpcd)) {
> +			crtc_state->vrr.as_sdp_enable = true;
>   			crtc_state->vrr.as_sdp_mode =
>   						DP_AS_SDP_AVT_DYNAMIC_VTOTAL;
> +		}
>   	}
>   }
>   
