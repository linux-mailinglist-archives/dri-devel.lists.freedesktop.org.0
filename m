Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA8D88BEA6
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 11:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2C910E849;
	Tue, 26 Mar 2024 10:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OkKKM3rO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6E010E849;
 Tue, 26 Mar 2024 10:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711447273; x=1742983273;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l3HWpp+0BFfJ3NhCzoKB7ESHilFEUtIx00zb2XTqLJ4=;
 b=OkKKM3rOOfSHXDevYwCGIJX9nYMiKCInnHW/eTEfpDZK46uWW6Md6Mpl
 7F9Bf3rnCyG+okEzdE4Msdpy1AqSh1yJ6w5tPYS0smAvBo59mPkyVUP6m
 QUN9P6SXmvyeM9/Z8Y2x/KcQkIFnVH+lt1TRfBcYI0SlUQe31LkKQD7po
 g+zo45568StqbOgc8DfZ2Ybue7XainDVqybpAw971KQbNG8dWNgzOiJ64
 IMtdSqOw+Th1nWMQRf4qy1YypN1+Am2mhlsEMGt3ZZgUVKrcm6w18u+2l
 0PpeG6k/qnuy/gPX4WVpxaj5Je/O7yuRT7HtNmfDFeehMMPIbm6WLQjOm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6599193"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="6599193"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 03:01:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="16299315"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 03:01:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 03:01:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 03:01:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 03:01:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6qnKBclg175ieTZ1j9hwK7zYPIBNGr/CnQFCG2n5IA6hXq1nhNC+aMzF65N70H2EQZKWn2QG6Gkg0Ptb5TzxrvHeLQ/GOPVikvgxxgkP3ogXgLbVJOoVkhsNIm16fWGUpIdwI7YidaJwvm2JR5nAbxEJdMAiF4RWWMotraIxGTK1mR+Urjp31ViwxHzL1Od1MWj01GkZydmuq+QsQue9ah8MeRA0Xk5zKlhkX+T3wpjbmWh6/c8fyBXDne7NYUIbBP47GnJDVTXxKJeeu8xDNJcxZ5wgitOWSWNv7/qJaiovclWV/2VgTQ4MXdLnRdb1MMGCViUNyrr2HdkSkuU8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VV/sqUNOJS+VzvZPajgfVQLYHvBZNSwyIuln/55LKZc=;
 b=TEOc3cmr5HMAfgH0IQ4dwoLXehxNS47A+ycUJpI7sh53fAkywyBrjYNsam/EKX6PEffDx43oXdKZ0GBFgxh8oNxuMVuhnddumzHdB71KhrkVyBCua3AA23Jnwl3MwDLGihxRW5E76eJCLg4BbggvPEq3bdmCpPylBp1ndkKkrOO9zXrZ7ili/5wfVmROLLWJhQj8L8JXrjWwY9W20Sh0Xd+ioI6B3lONE94rIe/KnJVcwKi4UulFBLz1f3ONmZEeAfJPCkfjWBmQmBwvp12c8ZKAMg/g1FP2dX1iPTkEA8Hhe0O3FtQJG65CtPMGpthb56fg65mTmnT3CC5iRwKflw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 10:00:56 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9%3]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 10:00:56 +0000
Message-ID: <2a35ee1b-4ef4-49e2-a481-d6929e522f16@intel.com>
Date: Tue, 26 Mar 2024 15:30:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] drm/i915/dp: Fix DSC line buffer depth programming
To: Imre Deak <imre.deak@intel.com>, <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20240320201152.3487892-1-imre.deak@intel.com>
 <20240320201152.3487892-2-imre.deak@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240320201152.3487892-2-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXP287CA0021.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::25) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DM4PR11MB7303:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2h7iBIiq5fBFBHJl0DhLxDqxTwRu/+2Z/PkErfEB/YXeo1uhfphDq5QQblhofJNlxFqqQMV5+nNCuGfNLAtFoTqIxCFQfR5Z7maZLFvFPmLIw4SKEiT/OBCCUqVuuDeLFxTxHtJI0n0yZuil/I01f2kDN5ALHumx1C7qzpxm57N2dd1h2+Vi4fP52V9svBqAdYvYxhhi9tu/IkZykSzFb31u9ijUI9d5ghFKN+rPT7ofGc8QXXXjx3lnGE9//RAOl6fykl6IX70sUlOCW4p8THI26ETJcakZGXaGWqxgawLQgX+drfYDghvQ6vZDdtk9ZkPj9Ewgb7mduEYyBf4i6MXz6+cQH29uob/xpsBSuvOSQr21J5N6/cE5Bq9S22AwaRzZjmScZaW2o5LoHLF1TcmGhzf7a3jzHf9sVeuPmKyPufoox00opGZ8HSYY3JaeUILSJevTnl1fO2lxUj+N4C/wBRFdZvTuQMe04pLoVN46LiI5BDEwKrMQsTeTlrB/bzdem/NTAx6+86p/wr4YMsPyOlXFsVGW7dKINTfvaqk1kGjO5bPbO1hkxdXL9RrXGT+fCe1BibfxrHieMf5xM/UbI3wJeJb2m4GPHC5WLRoFjG36B+gWqKZeKc0IR4YLYn8dTX0IflUc4riUK1Mup9E/CzbWD2+b0tvTJAIIJ9Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWRERUhzVEEvN0hNRGQ1Y25lRzY4aTF5YWlBdkZKZVROK0pscFE2SG1kbGRD?=
 =?utf-8?B?aWlvQkJCRTJVTVFJZnIxRU5rWHlCa0llM2ZJbERFQngvdmlYQUdyT0FmeDJp?=
 =?utf-8?B?bXBIckc5TDBTMHIyMVpOcmRlSnlGOXFpQStmWXhKaHlPTU9EV25GZjZSNG1u?=
 =?utf-8?B?VzR0WUs5ek1sdGYxVWtPODdTUS9WRWdXRHcrVXFmQi96SGxZOVhFVG1LZmNZ?=
 =?utf-8?B?VFUyb2FYejRMWS9ISWxqYlk2aElUR2hwb1RnczZCZmEwcjFIRjlYcGN3UWtV?=
 =?utf-8?B?cWNyUnVvVmJFNzNESDZaU1ZPemIvQ2VDTEIyS2NvWEVLV21JY0tiNkVCNml1?=
 =?utf-8?B?akozSEk3MDhxMGhiejJRL0Y5THhzbXgwc1JCSzlMbHErZy9nS1FmbWNpYnhK?=
 =?utf-8?B?N3MwQVpMWTFxclNwWWNXWXZYQzVJbEk2bnhVaGVvOGVnQ0Z4dVBOTU85blZB?=
 =?utf-8?B?Qnc0RnNOSGxYS3BCN0g3YkFpZlB6VFk4SXV0U09TeVFsY1dpcUxlNFBlM0NI?=
 =?utf-8?B?WURBV3N4bEdWREM0d1NHS2F6OFF6N0lMb090OTdYbEtlVDhtZkxieW50M3pJ?=
 =?utf-8?B?QWtUNkhWYUVCWTVyMHllTmpZNVVLNDRPdEliVWpnVlBWQzM5cXZyU0EyRGlh?=
 =?utf-8?B?WHMweGtmb3hjOG5aejlVYUc1OVFBRElDQjdNakUwaEx6VmlsZ0RKWXFvMGVI?=
 =?utf-8?B?SWNhYkk3czkwdWhPRm5XVHMwWUdzdkNBYWlwS3FWa3BGMmlPdmRDc01wYXc2?=
 =?utf-8?B?VUdIYktlSEZwSVpsZXRkK3pLZnhObzNKam91eEY3R0ZpL2x0bzN0L2RwUS9S?=
 =?utf-8?B?WE1kRlNFMG5wWC83TmZ1aUFHTFRHeTBtc242VnBYNm1KMWhkb0pJOUZiNWFX?=
 =?utf-8?B?MGJZVkhGU0x0cy9NL1JmamE3QlRhdmdPbFlDdTFYVTVkRDd4SktwVS94U2RH?=
 =?utf-8?B?S2hCSFJleE9JZEZtamkvM1lDNXM4Y2kyWWhVTEZSZWNxNUNxODUyTE1rQ2Er?=
 =?utf-8?B?Mkd5N2drb1Q3cGZkWVZHZ1R2ZzZOQ3FUaGlFWmdoVHYyMzh6ODQ3UEZ6a0ND?=
 =?utf-8?B?OU1kdVVjekovU1J0K0NrN3F4NHRHdVYxNW1CZ3pEM0dIZFJpeEVxM1ozTzdU?=
 =?utf-8?B?R2pGMFRyTDY2Ny9OVHpmVWtUQ3ZpRkZwRU9mZnQrMzZEN1plNnFWNzZCUDQr?=
 =?utf-8?B?M25Vc1dMSjd4ZWw1ZE00Q2ZmNzg0dm1VVUloTFVOOHQycVpzYkdNbUtTeDdu?=
 =?utf-8?B?YkN1R3RxUWkzQlNXUUpYQm1EL3Mya3NYZnVUOU1ySG9GRUtjNDJHa21HQ2tH?=
 =?utf-8?B?MENXL2FGYXhBZ2V5NCtaTUhxbUV0Q2ZnV3dOWFV5SWRkejllZUZBa2tvTTZw?=
 =?utf-8?B?MnFjWUVUeS92enFLejRQSmUzNzdrcks0ZmZFM3FYVktjZmNSNzRPanU3RjFN?=
 =?utf-8?B?WlhmQ2s1UDl2STFjWlR1aXJpTnZ1eGd0ajBMU25mc3hPeHVFUWtLQTl0WlJn?=
 =?utf-8?B?bkhYT1FJMS8xK0wxa1MwcitBMXBsNStObHRvT1I5MEUwR3YxV3dhMWFnOTBx?=
 =?utf-8?B?U0Ywdm5rZFFwQ1licEV2Nm1SL0hJOFV3eUZRSG5TODUyM0RIc3RvU0UrYS9s?=
 =?utf-8?B?WFphTUdCTUpEZEVZU0dCcW9vOTk2OEpZYXpBc09VdzYrcE92SmQ2NUN1QlQr?=
 =?utf-8?B?OUw1S1FaWGtwbXpYRmI1Wnd0dk5tN1BkZytHcnFEZXEvWHkvQTd0ODAwNEJ1?=
 =?utf-8?B?eHhhbkNoZ1h4czE5c3VBdWN6ZWVyM3lWMDhrR0FRVmM4VE5INDlSWE1rODdh?=
 =?utf-8?B?K3FrQ3pMb1prcVBoSXo3cHpKWnhNSXVHTCtZclB1TzFzQXVFajZFNlhoeVBm?=
 =?utf-8?B?RWlOckQ0WGQzVHRyek1sOWVyQzFidHpVb05OMUF0WENDZCtyRHBVZ2liajRu?=
 =?utf-8?B?cE51SWZ0KzFaVFBXT216Z1A2WU5NUUM1T1hOMGVKeW1HWktOWFJ4em4ydFN0?=
 =?utf-8?B?TkExb3c4MllYaW9QZ2tmVmV4eHJJT1lqOU1FL1NDQUdQaUxrWHBodFhHYlNq?=
 =?utf-8?B?dlVwemYwMUozeFlJN2g4bGJvdlpzQWFoMDZ6aW92TDJkUDVMMkNUV3NyeGNW?=
 =?utf-8?B?VFpmbHlGb00zYkJSWXpaeDd5czI2eEtabXZGZmF1clJ6Q0hURTA3SVljaGQx?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e843cf45-0fa9-411d-97a6-08dc4d7ba103
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 10:00:56.1374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OKtm5i+ilFzSd3ht/u2Bc4tjjcXND6NW/GghxEFJkbaWUUY3cXQkEApHMSx8N1xhHwed3SRXXNzKZgHVIbPs+rDByVeTM3naxyp0yMxmidQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
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


On 3/21/2024 1:41 AM, Imre Deak wrote:
> Fix the calculation of the DSC line buffer depth. This is limited both
> by the source's and sink's maximum line buffer depth, but the former one
> was not taken into account. On all Intel platform's the source's maximum
> buffer depth is 13, so the overall limit is simply the minimum of the
> source/sink's limit, regardless of the DSC version.
>
> This leaves the DSI DSC line buffer depth calculation as-is, trusting
> VBT.
>
> On DSC version 1.2 for sinks reporting a maximum line buffer depth of 16
> the line buffer depth was incorrectly programmed as 0, leading to a
> corruption in color gradients / lines on the decompressed screen image.
>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Imre Deak <imre.deak@intel.com>

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

> ---
>   drivers/gpu/drm/i915/display/intel_dp.c | 16 ++++++----------
>   include/drm/display/drm_dsc.h           |  3 ---
>   2 files changed, 6 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index af7ca00e9bc0a..dbe65651bf277 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -89,6 +89,9 @@
>   #define DP_DSC_MAX_ENC_THROUGHPUT_0		340000
>   #define DP_DSC_MAX_ENC_THROUGHPUT_1		400000
>   
> +/* Max DSC line buffer depth supported by HW. */
> +#define INTEL_DP_DSC_MAX_LINE_BUF_DEPTH		13
> +
>   /* DP DSC FEC Overhead factor in ppm = 1/(0.972261) = 1.028530 */
>   #define DP_DSC_FEC_OVERHEAD_FACTOR		1028530
>   
> @@ -1703,7 +1706,6 @@ static int intel_dp_dsc_compute_params(const struct intel_connector *connector,
>   {
>   	struct drm_i915_private *i915 = to_i915(connector->base.dev);
>   	struct drm_dsc_config *vdsc_cfg = &crtc_state->dsc.config;
> -	u8 line_buf_depth;
>   	int ret;
>   
>   	/*
> @@ -1732,20 +1734,14 @@ static int intel_dp_dsc_compute_params(const struct intel_connector *connector,
>   			connector->dp.dsc_dpcd[DP_DSC_DEC_COLOR_FORMAT_CAP - DP_DSC_SUPPORT] &
>   			DP_DSC_RGB;
>   
> -	line_buf_depth = drm_dp_dsc_sink_line_buf_depth(connector->dp.dsc_dpcd);
> -	if (!line_buf_depth) {
> +	vdsc_cfg->line_buf_depth = min(INTEL_DP_DSC_MAX_LINE_BUF_DEPTH,
> +				       drm_dp_dsc_sink_line_buf_depth(connector->dp.dsc_dpcd));
> +	if (!vdsc_cfg->line_buf_depth) {
>   		drm_dbg_kms(&i915->drm,
>   			    "DSC Sink Line Buffer Depth invalid\n");
>   		return -EINVAL;
>   	}
>   
> -	if (vdsc_cfg->dsc_version_minor == 2)
> -		vdsc_cfg->line_buf_depth = (line_buf_depth == DSC_1_2_MAX_LINEBUF_DEPTH_BITS) ?
> -			DSC_1_2_MAX_LINEBUF_DEPTH_VAL : line_buf_depth;
> -	else
> -		vdsc_cfg->line_buf_depth = (line_buf_depth > DSC_1_1_MAX_LINEBUF_DEPTH_BITS) ?
> -			DSC_1_1_MAX_LINEBUF_DEPTH_BITS : line_buf_depth;
> -
>   	vdsc_cfg->block_pred_enable =
>   		connector->dp.dsc_dpcd[DP_DSC_BLK_PREDICTION_SUPPORT - DP_DSC_SUPPORT] &
>   		DP_DSC_BLK_PREDICTION_IS_SUPPORTED;
> diff --git a/include/drm/display/drm_dsc.h b/include/drm/display/drm_dsc.h
> index bc90273d06a62..bbbe7438473d3 100644
> --- a/include/drm/display/drm_dsc.h
> +++ b/include/drm/display/drm_dsc.h
> @@ -40,9 +40,6 @@
>   #define DSC_PPS_RC_RANGE_MINQP_SHIFT		11
>   #define DSC_PPS_RC_RANGE_MAXQP_SHIFT		6
>   #define DSC_PPS_NATIVE_420_SHIFT		1
> -#define DSC_1_2_MAX_LINEBUF_DEPTH_BITS		16
> -#define DSC_1_2_MAX_LINEBUF_DEPTH_VAL		0
> -#define DSC_1_1_MAX_LINEBUF_DEPTH_BITS		13
>   
>   /**
>    * struct drm_dsc_rc_range_parameters - DSC Rate Control range parameters
