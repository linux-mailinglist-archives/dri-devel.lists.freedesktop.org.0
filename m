Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA10585B306
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 07:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9CF10E157;
	Tue, 20 Feb 2024 06:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kpiaWG7D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5338910E157;
 Tue, 20 Feb 2024 06:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708411409; x=1739947409;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u/Xodb4MDIMQj3xcSeubZkQBtCeGaXIwV0ep9q3Y1MM=;
 b=kpiaWG7DgvjFhQirlj9fnMeonUhhWSR9tOfSXsRGDsdtKVahUrwhGc0x
 pux1W0D6b3xoiiKVwBzwegH40uYexXEyw93yr0OKPjPjn/A6PkTCj4cHw
 QwanqKdEAc8Dx1bKthUwIYAQ9Flfn+yVp71z1lFqqN68Or487jsjF378P
 1MxXxLXyI2Q8wOLNI4vojOzP29cxNZA2LSPSl+9+W+Ttu7ackr+7pGJCw
 g4aa5lCa1iZ908tqdajP6Dc2DhsStj6gZIpeQ/D9zkWf45D81fXNWIDm/
 +NCx83c0OCd9MU3lLfVNJ0gshjphV/Dmz3E2NMef4usWxVj1LSm7u5tq5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2364420"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2364420"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 22:41:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="9380776"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2024 22:41:52 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 22:41:51 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 22:41:51 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 Feb 2024 22:41:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Is+ENrEdcQ5sHr+q9+BO2SJiJo9AWqx2IAYtqg81sMlyqJox5ddlClW/cX2wVytaJi6revrReMW/79OVOh6azOR2HQ9C9WTRGBISruQxCxJR8vV3DcR2aXCQDbepkWByUSB8Obye/3VgpDNGQsX7dMxY//EEUn4nRy2YOCoalSo7zAkRPcOPmEqZ9GZy26m2EYKBy7fI00DKhHFA3sGavio0J8mhUoyndJp1Bo4PuxK0I6c1YYglLO6odjAiyh6OhTBTZ5inW+tV4qdXDHh0lYmeiiDTSwvkgaUh4naulEcwgxPUriRql6gFGSf4iDyXmzE+IknFu7OtONVyfthhmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zu142/QEj4eH/rxsBwxUeXhRPGzp4klz55z8Kmh9D/E=;
 b=efPO7ZbjVbq7CIbB9zA9JKNC2nm6fE8T5jGxs3HocQDEDrmNcczEZK6FgNJ9bsuO5NW9RhpMFRrXvtmhaXxfnbb3IfAQYuVbVDQ8d0LsWAKEgpNx1o7v1mKIhUl8uIcCsEAG5KAA71AvVE4rmafJva58R65s2hVAwiO3IuIv5opXjuFuOOotADCjH818XSaYjA/sK3zHoFGpQFJCNaG54BagTEGFLAD6fC6uOjRmS7hsceFm/lxvhyfeLvlg6KFmWAIRINNw7j82Wt5BdscXwxheM8Uwo5IDx7VS2Re5gHUYTX2OHEIAv5k8j0IgL+i2YMZev2rM7BWTMhNbZpMZog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MW4PR11MB6620.namprd11.prod.outlook.com (2603:10b6:303:1ea::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 06:41:43 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 06:41:43 +0000
Message-ID: <4d1e2f36-ccaa-4d49-b8b9-ce1d8ae20c09@intel.com>
Date: Tue, 20 Feb 2024 12:11:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/i915/dp: Add Read/Write support for Adaptive Sync
 SDP
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20240216142024.1884258-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240216142024.1884258-4-mitulkumar.ajitkumar.golani@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240216142024.1884258-4-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0238.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::8) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|MW4PR11MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c82b623-911c-4b09-be3a-08dc31df001a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: khziqAkF+AIWBGskhDW3WeGcE3oBbV4Sbis+vIa+ETBQqGjd+t86OjGlP27aa2injuuZOJtzwQl1p8QJPcJAce8EmmeQg/3uWbTj+T9uARk8IDTAnirM5VIM6P98ZjYBSrExukJfF1oKL8IHBevjxayQ+U2PxtBpjFU7hbTegEJofTI1TezEQNWgIqR8C+nbOHfk/WJd50kmuTtoEscRT6LjZJh08qG4S+TVZPHtEWH1Eo5zMUFuLz5fH53nu97Q+wRDkug+I1Wn3URFf0z/hR+ncPWa7+qS2445Qt8u40XQ4q7IZyDfYT4rgGgAqPYhRObhQGPlaHp1Zkk397xKoteqZ5Q/RswiFX+gQzU4nnDjtf5lcXGtW+ISw/8IzVlLQQIGUEGVDRUwq4Qa/9mNoLAnxc6TdtxvKfYQJRJUW77QfBx8BSY/BswUMNOI2i7kp6O1ctq+bU4fQZve36AZGmxF25Q9Iw7/AhtkjpfbZf9Q4UiIYmHQ9W5NnBlR7YNJTCR/sVEYG6QyphDhZ56As+uvuVlt84eLa/z7326AacE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2Z6dW9OMzRZcGNFZnhxOU9nTnZ1RGlua2lvZ1MyakRmYlhZdkZySjhLRFo2?=
 =?utf-8?B?QTE2RDI2YVREdEd5NVZuUm8vTmk1TXNMbFJGRGw4WEhnd3h2Z2hKUENSdjBM?=
 =?utf-8?B?eFJTMUdkMkdNZ2liYUJla2VDZnIwdGY2L3FLVFJLZURTbFJ1cVQyU0hiZ2tt?=
 =?utf-8?B?a3NuZ1Izc3ZndnRKYi9wNXJwalZUaDB4emg2WXRMOU5vY1U1OG9BR0k5SE1F?=
 =?utf-8?B?ekZsRnZSNlIvN2JNdm1TRHB0SG9OU3UwcDhrdHo2RWIyK25ScjJaenF6V2ky?=
 =?utf-8?B?RjRqNjhOVFZnOExUMUpTcUdWc205SUdaWGRqL08wQURrSmkvdUlQZEtuSUdU?=
 =?utf-8?B?ZzJqd0pnNmlCSEdpR0FXRmY3R3d2d0p2QTdjU0VoeStsNmhvbDFmMWhLRjJx?=
 =?utf-8?B?WndxVHJ5QTdnMEdqVFQ0LzR3cGhZb1A5SDhieW9mMnREaTAvWXhTdTB3d3ph?=
 =?utf-8?B?aWxHQmlWWDdYQXdObU04Wmc5RE9nN0MxYXVheGZjME9MYnNGWkx6UXlEUTYw?=
 =?utf-8?B?YVoyOVZDZitaVjVkakNJOENaeURKcTdzUFcrbXBIOWxZUU5mU1c1UGVZb0p2?=
 =?utf-8?B?UFdjSkM1clNUTE1Ya1RMZG8xN1VVK2x5WU5lTmhuMTJzb0JGaWhxSjRoMlJ6?=
 =?utf-8?B?bEMvVXR2M1ptU1A3dHU5MFdvV0tNM29QbUU5TG8wcmVtY1NwT0dsY3VTSFdk?=
 =?utf-8?B?MllWaWJyOExkM21LcFd6R2xjUVBxcmZsTlZjQUtabGRWbWFObk9veDhKVGdF?=
 =?utf-8?B?aEx3TVRncGVsT0RKWUd5ZFRGakhHNE4va2k1bFpMT3k2R3ljNzdqWWNNaytP?=
 =?utf-8?B?QVNpU3FXeHhJdVdPZTExVHdBVGliKzcwSHNrS2N1T0wzSERHSjlTTmpNa2Qy?=
 =?utf-8?B?bXlGRlcxU0FvZGROR0hCeFdkd0Fwa2tFRzVTVFVaT1JjZ3d3bUJ0ck1yWDRp?=
 =?utf-8?B?Ri9hRHM4MDhLV2RHRHE0R1M1Z1dMcVFXT2J3cW9HU2dXa1dKVWptQ0NIcXVH?=
 =?utf-8?B?VFFzTHMyUFRJdmFMY2hKL0RmbXcwK0I2MHczbEptUEs1eGk3UXFXQlJOdWlS?=
 =?utf-8?B?ZU1IZWEwZGdGYjN1Y1VSNm1XNmJhN2daL2dHNUNHWGhqVzRIRU96T21UTUl4?=
 =?utf-8?B?T2taTlh0TzVUTis1WDJ5RjByOXdLVndTZWFyMjkreW05QzRlckJ5N2ViZ2hT?=
 =?utf-8?B?c3MzWllWRXZzUWFCV0Q3anR3aHdOdXlDZzNNMndZSmdvMXpacUhUQSt3VTZi?=
 =?utf-8?B?Z2E4T28xL0tiRnJSVjZWVzlXSDNUYmdYc2tMeUlCR1h5UDFUTUdaTHMyaEdw?=
 =?utf-8?B?aENIbWI2WWVKdUtmRDBsYTIwRmZpUm50OEUrdmhNNW9WYlNQZGJnTHRsNUlz?=
 =?utf-8?B?bzh2aUdmWUVwaXpOMTVHT2d3V2U2b29zdW83VHo1cXNOQ1kxTDFGN1hIMTBJ?=
 =?utf-8?B?ZWN0dCtvOWYrVTlaTnZWWmc1QlRLMVVWMnhJMmlPS3ZXaGhEU1RGQXhPNUhF?=
 =?utf-8?B?MEY2VEtkRE93Wlc1ZGhGN2tnbzBUWEtrWitndFQ3NVZYWHVOTDZPR1Raclgy?=
 =?utf-8?B?dmlKcDRVTEVQTFNRLzVPRkxQczBSalNTM0ZhbExQNklZZzVaSFk3alJoYlNs?=
 =?utf-8?B?UVN1d0FyZmZyS3JJZzBFR2xla1NJeHQxVjNlVUlEWk8rNFhnOE5hb1FlN1ZY?=
 =?utf-8?B?VDdLN0NxVjE2ekFCeVdZSUU2MG8ydWR2Rmswa2ZmeVJQLzVmVEU3Ni9DdjdU?=
 =?utf-8?B?ZUpEUzVyWWNJUFQ5cVAvSFZjWGJ6NFRId2hDOTNFWW8yR2tsS1lTdFNkcWVr?=
 =?utf-8?B?VmZpOTF5MmU1UXIvUU9QbmN1MmNsVUVnR3NVaUdTc0w1WGlrNEJBVUhqVWlx?=
 =?utf-8?B?cldDb3FSWVBkRWFGYVNZYTBiRWNmOEIrWlJ1VC9naWF5SndoSEJHVkc0a3Qw?=
 =?utf-8?B?dFFzcjRrTE54T1J6Qkl3bUJIdHZSV2x2R1huS2xJTld2MEVTbkZxbDdPcTFB?=
 =?utf-8?B?bzB6ampzNUUrdVNmK0hYZmFYL0VBcDJ1MjloTURJZHoyTjd6NGlyallmWVV5?=
 =?utf-8?B?allEVkJENGJUbVQwUmUvN3RyV2JXRlFjaGk5aWhYYnBYMTBCU2MwRTBBS3lV?=
 =?utf-8?B?VTdBWmFhOExOSHcxL3owMGtIRE1iNHZEK2RsVG5OaUNpQ0g3Q2FEVWhUYnlu?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c82b623-911c-4b09-be3a-08dc31df001a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 06:41:43.2051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02egVzcc4DBz5W1lmmTZP761d58aojGuw+b82oNTJH8rcRBdkexere/bnO3hKQR9LRrJAJvs/xCaH/JsBY4f7KuQxkYw9OhIdvYkP098a1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6620
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


On 2/16/2024 7:50 PM, Mitul Golani wrote:
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
>   drivers/gpu/drm/i915/display/intel_dp.c   | 95 ++++++++++++++++++++++-
>   drivers/gpu/drm/i915/display/intel_hdmi.c | 12 ++-
>   drivers/gpu/drm/i915/i915_reg.h           |  8 ++
>   include/drm/display/drm_dp.h              |  2 +-
>   include/drm/display/drm_dp_helper.h       |  2 +
>   5 files changed, 114 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 217196196e50..d68fb9d45054 100644
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
> @@ -4089,6 +4088,34 @@ intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
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
> +	sdp->db[1] = 0x0;
> +	sdp->db[1] = as_sdp->vtotal & 0xFF;
> +	sdp->db[2] = (as_sdp->vtotal >> 8) & 0xF;
> +	sdp->db[3] = 0x0;
> +	sdp->db[4] = 0x0;
> +	sdp->db[7] = 0x0;
> +	sdp->db[8] = 0x0;
> +
> +	return length;
> +}
> +
>   static ssize_t intel_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
>   				     struct dp_sdp *sdp, size_t size)
>   {
> @@ -4256,6 +4283,10 @@ static void intel_write_dp_sdp(struct intel_encoder *encoder,
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
> @@ -4276,7 +4307,8 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
>   	i915_reg_t reg = HSW_TVIDEO_DIP_CTL(crtc_state->cpu_transcoder);
>   	u32 dip_enable = VIDEO_DIP_ENABLE_AVI_HSW | VIDEO_DIP_ENABLE_GCP_HSW |
>   			 VIDEO_DIP_ENABLE_VS_HSW | VIDEO_DIP_ENABLE_GMP_HSW |
> -			 VIDEO_DIP_ENABLE_SPD_HSW | VIDEO_DIP_ENABLE_DRM_GLK;
> +			 VIDEO_DIP_ENABLE_SPD_HSW | VIDEO_DIP_ENABLE_DRM_GLK |
> +			 VIDEO_DIP_ENABLE_ADAPTIVE_SYNC;
>   	u32 val = intel_de_read(dev_priv, reg) & ~dip_enable;
>   
>   	/* TODO: Sanitize DSC enabling wrt. intel_dsc_dp_pps_write(). */
> @@ -4298,6 +4330,40 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
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
> +	if ((sdp->db[0] & AS_SDP_OP_MODE) != 0x0)
> +		return -EINVAL;
> +
> +	as_sdp->vtotal = ((u64)sdp->db[2] << 32) | (u64)sdp->db[1];
> +	as_sdp->target_rr = 0;
> +	as_sdp->duration_incr_ms = 0;
> +	as_sdp->duration_decr_ms = 0;
> +
> +	return 0;
> +}
> +
>   static int intel_dp_vsc_sdp_unpack(struct drm_dp_vsc_sdp *vsc,
>   				   const void *buffer, size_t size)
>   {
> @@ -4368,6 +4434,27 @@ static int intel_dp_vsc_sdp_unpack(struct drm_dp_vsc_sdp *vsc,
>   	return 0;
>   }
>   
> +static int
> +intel_read_dp_metadata_infoframe_as_sdp(struct intel_encoder *encoder,

We dont need to add 'metadata'  here.


> +					struct intel_crtc_state *crtc_state,
> +					struct drm_dp_as_sdp *as_sdp)
> +{
> +	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
> +	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
> +	unsigned int type = DP_SDP_ADAPTIVE_SYNC;
> +	struct dp_sdp sdp = {};
> +	int ret;
> +

Here there should be a check if as sdp is enable is set or not.

The check in last patch should be removed.


Regards,

Ankit


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
> @@ -4474,6 +4561,10 @@ void intel_read_dp_sdp(struct intel_encoder *encoder,
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
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index af6790fb4791..6f4a3e95906c 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -1578,7 +1578,7 @@ enum drm_dp_phy {
>   #define DP_SDP_AUDIO_COPYMANAGEMENT	0x05 /* DP 1.2 */
>   #define DP_SDP_ISRC			0x06 /* DP 1.2 */
>   #define DP_SDP_VSC			0x07 /* DP 1.2 */
> -#define DP_SDP_ADAPTIVE_SYNC    0x22 /* DP 1.4 */
> +#define DP_SDP_ADAPTIVE_SYNC		0x22 /* DP 1.4 */
>   #define DP_SDP_CAMERA_GENERIC(i)	(0x08 + (i)) /* 0-7, DP 1.3 */
>   #define DP_SDP_PPS			0x10 /* DP 1.4 */
>   #define DP_SDP_VSC_EXT_VESA		0x20 /* DP 1.4 */
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 8a692a86d8d6..a4e0b18bba3a 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -839,6 +839,8 @@ int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8 color_spc);
>   #define DRM_DP_BW_OVERHEAD_FEC		BIT(3)
>   #define DRM_DP_BW_OVERHEAD_DSC		BIT(4)
>   
> +#define AS_SDP_OP_MODE				GENMASK(1, 0)
> +
>   int drm_dp_bw_overhead(int lane_count, int hactive,
>   		       int dsc_slice_count,
>   		       int bpp_x16, unsigned long flags);
