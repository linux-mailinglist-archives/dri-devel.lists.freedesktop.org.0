Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A39B37E72E7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 21:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D347F10E0FD;
	Thu,  9 Nov 2023 20:33:18 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80E910E0FD;
 Thu,  9 Nov 2023 20:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699561990; x=1731097990;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5YBogPZYV80648zY6RHUak1Lx68h+udqJG0XyZddON4=;
 b=Zgi3kubLY9Wovn4CZqBrBJ4Yu7SXDZU3inVQHSB70/q4M5ZhdgPqCpUf
 S+JSf5X3TusdkAEShvPJfITlC2laQanVuKO0bu0a9fafRuUffgJNSd9yA
 SiaEsCx4xAk/HoirLXKpwPOoxCqxSALWv66Wr5k7ZE/Z75kj1HcuKMIc/
 12nj/Jin/znGvrl8XhxE8/h6RAHUuJgteTLqFYY0myW2RDRZbrGg2o8W0
 aheBbsZ2O4Lt+b+NogERwDVXx+PSU7dzggbBTyOPaKbO5UfRu0w3/7T3B
 m+NDsJJd3YHkBQpv290A/dZCuyTxVRlnIGKhDc+aLH6GNduCknfTx6mRh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="387231010"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="387231010"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 12:33:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="907251313"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="907251313"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 12:33:10 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 12:33:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 12:33:09 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 12:33:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VexlgEs+qTFQgzyysQ60fZbVUFJIzJZJMXcgH/sBEGjNKs6G2KKRWTCnqDfbzVWhFh6p+4nbrbr0/47fNyWqD+g3mnrNXSf130LXcFd7aU4gq8+PWn4uA/RcbTIGJVyfow+w66w17H5QRbvUsx54kN8LCRfk5h1JvuwZIuTO7iMGcaGCwHIBiPfDFhBdVwSUpehNOBByYRtzYfxqMfEslXpV1tKQD7Cxnea0aWF1a3HtTQD5dZKYtV+LVYhJ3YpzByThFmYoNayvX0S/0KPZPDwV7/qoZphhuAMQu7Y4EoZdszMqoYUUIOYXWUT+6c0o1SxatmTpbbg5zE30N8gBSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8wcsFZfEZCk3dQJsRtsP5UAvoW35P76nPpbe6dDdIc=;
 b=kMiDgbeE2+5X+qKTFPrHPFbsJ5MmjRizttWZIsRZs00zkKODDjfikevR+6wy+rpt7wwtkg+oxwidcrqvetcE9QPc1tmGUB+Ai0vDEepTEuqfc/U7Rp68Ht3ELxZwzdQEuK/fCcrfBD8wR5iBCFm6NYuqdcFxfLCKabIU2EZFWRurv+pysiTXPpVf80e7oCRveOVURx0E+Ln0vQI719SuIaYu1V3dPJVKZ38Qwt0nMnY56nGBVOd3QZBQwZNX/gRfve7FT11oEX+lhtjnCzw5cGpaFtYHRH7jSWXn+kk1tkVX6ednTkHVGIxMOBsX/sArPVUpwmptvsKxl2IyUn6pSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SN7PR11MB6774.namprd11.prod.outlook.com (2603:10b6:806:265::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Thu, 9 Nov
 2023 20:33:07 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86%6]) with mapi id 15.20.6954.028; Thu, 9 Nov 2023
 20:33:06 +0000
Message-ID: <552c0af3-9a03-4211-a7de-8bd1f9d4f5cf@intel.com>
Date: Thu, 9 Nov 2023 12:33:05 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/guc: Add a selftest for
 FAST_REQUEST errors
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20231106235929.454983-1-John.C.Harrison@Intel.com>
 <20231106235929.454983-3-John.C.Harrison@Intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20231106235929.454983-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0045.prod.exchangelabs.com (2603:10b6:a03:94::22)
 To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SN7PR11MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: d54d2458-e680-4ddf-70a9-08dbe1631477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RF4BKU30ojP7NqOWv2+y1WO1VU6SliE7fiIpzV5KKwI/3lbTVB5fyUf/4ndi8Nq+mAjj+HQfBB3Ujvo64W4yRvtUW3Zm1SJWyFt4S3WYwtx+3Vb6L+tpDwIAdZeghnjnAoA4K6y9mEwzhLNrasDkd2FY9p9FZk3E+L6CkY1I+QlqaVt9BlY6GJKsTyGa9Bf2/WEjEchBIKW++BjKN6JJB0X1n255NfiidNM3Dp81mxMt7o0eZ7+lGemimEeRd3L0Zv7s9w5fm6EPd10eprfk2hDweb8RjkM0rriiKw8pgyRo+QJEv9HvtFKIJCt7tx82x/2OY8vKqxhx5TArb1hxPfT5Szh/ZW40g8jSxtIgKrqSw65/5tR3whZMZXhrSy1HvHS7HZWvW3VuHozFxjxOdjGVu7rmtwLK82UmlY3H3eGVWf0CWPEDh2AKHAthPACEyLxQe57/UMwZJ/J3iowVYVh2gq2brrkGzJvOJ3mHbsQ/bNyzt1A3mz7SIEJJn5t9GmrT291A/RkPKStVp++HqNLnA73u8et421m5HuWHexUA+Bj+trPcyMv8O5wLPx+VYFbF8kwNw0znEvJTuGyAKQqLshYwp4zdS/w0wDk3slYh7dZPbcN5XnjLk1lj01S60fVMVSea6SWLV2lVdyc92Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(136003)(366004)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(5660300002)(2906002)(6486002)(478600001)(2616005)(82960400001)(36756003)(26005)(6512007)(53546011)(6506007)(316002)(41300700001)(450100002)(83380400001)(38100700002)(4326008)(8676002)(8936002)(86362001)(31696002)(31686004)(66556008)(66476007)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cC9uOFozdjRLV1J2OHd4U251cy9aWklRMnBhSjNTK1pnTXNmaC8vUGFxVTVW?=
 =?utf-8?B?cFMvTXpBTzd0REJ6RnhxSC9uYUlEVW1lbTFJdDEyVEpZT2NCNGlBTXpTMHdp?=
 =?utf-8?B?VGcyS1pKbE5zakN3SkpqVDZodEV6V3R6Ry8raDlwZStvTzZBZ0t1QzNTMHM0?=
 =?utf-8?B?cExDWVRYQ05adkZZRGlVZTMzREJOdGVaNEJQbVZEemdTRndlWVBqSHE2bUhv?=
 =?utf-8?B?WlV0bm1MelhvSTZ5OThYOVpybkpIM0tiRDVLS3V2VFVpbTArU2N3dFYxdDgw?=
 =?utf-8?B?Qkl5ZUJjQXowZWphbjdxRE9iTHZWa2srOHRkbVVTZUt1Q0swSXQ1VlFZd2ph?=
 =?utf-8?B?cXlVMFMwVDNtQ1NUeUprWWNici9JL2tpcThqbWtJWHBucW1TNysydWlRRXBj?=
 =?utf-8?B?ZWQ2OWlHcERObGl1NUFjdkdFMGk4NVhSaHFQbHFtV0pndldRdVBhOEliS0Fu?=
 =?utf-8?B?aTBaMm9ka0tocmZobjVkR2R4M3R0a3FUQXkyM3R1WmZxdEFmbU9PeTFLKzNN?=
 =?utf-8?B?blFNRm5GSit2TFlsOVlpclQvV2lwcWxFWDdtK0R5dVJUUkdpTi9oZjNidFM1?=
 =?utf-8?B?Qk83eDljQTV5OVZtSURZa0dvTFI4aUo4ZFc0aGtUZVhUeG82Rm15a3VMVXhq?=
 =?utf-8?B?Q0Y5Mjl2VFV4RmtVUUp0WDBZSWFVNFRwOGxIblZiSG1oclZGd1FHMy83bXNn?=
 =?utf-8?B?L0xtTmU4K3N2VzFTWnZkS0dIaWl2aFpXdzhaWDZBRVFBcXBIOTVmTXhkWjR0?=
 =?utf-8?B?a2VEamtxbUt6TW9KaWpLSnNZSUc3S1paeHVWKzFVMWFhQlB0S2dlYjNQT2Vm?=
 =?utf-8?B?OTNaTXV4LzgrUzhRZEhOY1Q0YndkTUtQOTZrc0VVaWlVV2VZQkpoV1RIOU5h?=
 =?utf-8?B?YzQ4L1lnUFdsanRtTzdUMUNRQi9Cc2tPdjJhSHVKaVJ6S2RXRkpkdFhReXpp?=
 =?utf-8?B?UUR2amNDeXVwUkZRTnFoTkEydWJyUG5TSmtsNGdpWmpzNkpFb2FXd09tbTd5?=
 =?utf-8?B?QTJhQTMvZVMwNnJLTmxpSkhMSTcvQm5sRlJPNS9wTVlEQW4xTHhpOENUbjV2?=
 =?utf-8?B?YzFjN0NxV3dIaVJIUitRSTk4a3pDTGUzdllKS1UyUWZmbFFFOHgyN2xIcTNF?=
 =?utf-8?B?SUl4SWFqK3k1R0lWVll1cjhiMUp5SWNSbndhUVFiNm5KWlE4cTBadC9IMEl6?=
 =?utf-8?B?OGRaRkE5K1o1dzlvdHN1SFZQT2xBT24rY0tZdzlsQld2TjE2SGxlTVk5bW5m?=
 =?utf-8?B?TDY4MzBudVVBUDF6bFBhdWFsZExOQWZWakpqTSsxc3R6UnEyRUxpNUJxV3pU?=
 =?utf-8?B?MHJQUWRYejJ6SXNoSGZDaHZndDZvb0M3Z2I0czc0TlZoeDR1elZpeVdVQUd3?=
 =?utf-8?B?RlBiN1JmUS94UGVZcGhMeHJCbW82ZEw3UHFJUjNsSzljbnU5S3IrSkd4TG4v?=
 =?utf-8?B?SkkyR0V4WnJnbXVORjZYZGh6bTNBaU5GRkE3cFdSbEYzakZ5dWJTZXFndk9O?=
 =?utf-8?B?U3hEMnAvR0pnUFVYSGFWeG96WkREWlVVaEJxaFZ4WEd4UHh6RC9iM2x1cmkx?=
 =?utf-8?B?UWxkUEhZNllqeVdMb2dZTnpreEpicWpjVFdLSW96M0hObmV6bXEzZjlWWEdh?=
 =?utf-8?B?N1R1WUlyNWxKUVpxcDlYbUJ3UlNXYWNTM2VVOTJYakFnTWlid3ovODdXSEE3?=
 =?utf-8?B?YnZRenduY0Q4cTIzQ2d2SlhGUkE1Smttd1lkamp2WTM5aDNDempUVDdWTDZo?=
 =?utf-8?B?NUw5WUFRei9TQmh2cFZMdUxYUjlsVWp6ZUs1RFdBYWhxbDFYbUs2YXZzOVdh?=
 =?utf-8?B?MytwdU1YcWFkMWUzUlRWYmRqOGduRnBDMFBXcGNaSHBHekhLbVpIVllsYUJX?=
 =?utf-8?B?VDFVU01UaSsrVExBMVJvb0NIeVNrMmJ0VGUwTERZRlpKU0RwSUc4TmMyNE9L?=
 =?utf-8?B?SHlTVlMzeFpheEVCWlVWVUtRVGc1UkFwQi95RFdmWGhDbmI4NG91eVFuQ3dS?=
 =?utf-8?B?RlNVL0pVVW5aaWZsZUhoRytaMXZsb3h3eWtNc1hzL1NPck1FdlJBMHZFWHBu?=
 =?utf-8?B?TTdjMnJDMHFmaXdYNEJKOGFKWXZoYWdsZW1ZMWxhc0tjM1pDaHR4YkIwNyt6?=
 =?utf-8?B?aG5VTDRXL1FJZXpGYjMzNkY4MUhyS1BYQU44SnRaZkJvcmlGaVhPMVVNdFlK?=
 =?utf-8?Q?TcfI2BCCjen3iEU9FpbcOyA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d54d2458-e680-4ddf-70a9-08dbe1631477
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 20:33:06.5566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IH/3FAWmPgEoWNeGpHIbVj2eXf0U2NMLv1mpa+SQ0mjqKvN5B9neIvs+lnXmEQ0T8xgxdQxDhGnyXRBVJUko/O6O1i4ChHAnf+O4/8ANm+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6774
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/6/2023 3:59 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> There is a mechanism for reporting errors from fire and forget H2G
> messages. This is the only way to find out about almost any error in
> the GuC backend submission path. So it would be useful to know that it
> is working.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h    |   4 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |   9 ++
>   drivers/gpu/drm/i915/gt/uc/selftest_guc.c | 122 ++++++++++++++++++++++
>   3 files changed, 135 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 2b6dfe62c8f2a..e22c12ce245ad 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -297,6 +297,10 @@ struct intel_guc {
>   	 * @number_guc_id_stolen: The number of guc_ids that have been stolen
>   	 */
>   	int number_guc_id_stolen;
> +	/**
> +	 * @fast_response_selftest: Backdoor to CT handler for fast response selftest
> +	 */
> +	u32 fast_response_selftest;
>   #endif
>   };
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 89e314b3756bb..9d958afb78b7f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -1076,6 +1076,15 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
>   		found = true;
>   		break;
>   	}
> +
> +#ifdef CONFIG_DRM_I915_SELFTEST
> +	if (!found && ct_to_guc(ct)->fast_response_selftest) {
> +		CT_DEBUG(ct, "Assuming unsolicited response due to FAST_REQUEST selftest\n");
> +		ct_to_guc(ct)->fast_response_selftest++;
> +		found = 1;

found = true ? it's the same thing, but it's cleaner to assign boolean 
values to bool variables

> +	}
> +#endif
> +
>   	if (!found) {
>   		CT_ERROR(ct, "Unsolicited response message: len %u, data %#x (fence %u, last %u)\n",
>   			 len, hxg[0], fence, ct->requests.last_fence);
> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> index bfb72143566f6..97fbbb396336c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> @@ -286,11 +286,133 @@ static int intel_guc_steal_guc_ids(void *arg)
>   	return ret;
>   }
>   
> +/*
> + * Send a context schedule H2G message with an invalid context id.
> + * This should generate a GUC_RESULT_INVALID_CONTEXT response.
> + */
> +static int bad_h2g(struct intel_guc *guc)
> +{
> +	u32 action[3], len = 0;

AFAICS This is a 2 DW command, so you can use action[2].

> +
> +	action[len++] = INTEL_GUC_ACTION_SCHED_CONTEXT;
> +	action[len++] = 0x12345678;
> +
> +	return intel_guc_send_nb(guc, action, len, 0);
> +}
> +
> +/*
> + * Set a spinner running to make sure the system is alive and active,
> + * then send a bad but asynchronous H2G command and wait to see if an
> + * error response is returned. If no response is received or if the
> + * spinner dies then the test will fail.
> + */
> +#define FAST_RESPONSE_TIMEOUT_MS	1000
> +static int intel_guc_fast_request(void *arg)
> +{
> +	struct intel_gt *gt = arg;
> +	struct intel_context *ce;
> +	struct igt_spinner spin;
> +	struct i915_request *rq;
> +	intel_wakeref_t wakeref;
> +	struct intel_engine_cs *engine = intel_selftest_find_any_engine(gt);
> +	ktime_t before, now, delta;
> +	bool spinning = false;
> +	u64 delta_ms;
> +	int ret = 0;
> +
> +	if (!engine)
> +		return 0;
> +
> +	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
> +
> +	ce = intel_context_create(engine);
> +	if (IS_ERR(ce)) {
> +		ret = PTR_ERR(ce);
> +		gt_err(gt, "Failed to create spinner request: %pe\n", ce);
> +		goto err_pm;
> +	}
> +
> +	ret = igt_spinner_init(&spin, engine->gt);
> +	if (ret) {
> +		gt_err(gt, "Failed to create spinner: %pe\n", ERR_PTR(ret));
> +		goto err_pm;
> +	}
> +	spinning = true;
> +
> +	rq = igt_spinner_create_request(&spin, ce, MI_ARB_CHECK);
> +	intel_context_put(ce);
> +	if (IS_ERR(rq)) {
> +		ret = PTR_ERR(rq);
> +		gt_err(gt, "Failed to create spinner request: %pe\n", rq);
> +		goto err_spin;
> +	}
> +
> +	ret = request_add_spin(rq, &spin);
> +	if (ret) {
> +		gt_err(gt, "Failed to add Spinner request: %pe\n", ERR_PTR(ret));
> +		goto err_rq;
> +	}
> +
> +	gt->uc.guc.fast_response_selftest = 1;
> +
> +	ret = bad_h2g(&gt->uc.guc);
> +	if (ret) {
> +		gt_err(gt, "Failed to send H2G: %pe\n", ERR_PTR(ret));
> +		goto err_rq;
> +	}
> +
> +	before = ktime_get();
> +	while (gt->uc.guc.fast_response_selftest == 1) {
> +		ret = i915_request_wait(rq, 0, 1);
> +		if (ret != -ETIME) {
> +			gt_err(gt, "Request wait failed: %pe\n", ERR_PTR(ret));
> +			goto err_rq;
> +		}
> +		now = ktime_get();
> +		delta = ktime_sub(now, before);
> +		delta_ms = ktime_to_ms(delta);
> +
> +		if (delta_ms > FAST_RESPONSE_TIMEOUT_MS) {
> +			gt_err(gt, "Timed out waiting for fast request error!\n");
> +			ret = -ETIME;
> +			goto err_rq;
> +		}
> +	}


This seems a bit convoluted. Why not just wait for either the request 
completion or the fast_response_selftest value to change?
something like:

ret = wait_for(fast_response_selftest != 1 || i915_request_completed(rq),
                FAST_RESPONSE_TIMEOUT_MS);

if (ret || i915_request_completed(rq))
     // error


Daniele

> +
> +	if (gt->uc.guc.fast_response_selftest != 2) {
> +		gt_err(gt, "Unexpected fast response count: %d\n",
> +		       gt->uc.guc.fast_response_selftest);
> +		goto err_rq;
> +	}
> +
> +	igt_spinner_end(&spin);
> +	spinning = false;
> +
> +	ret = intel_selftest_wait_for_rq(rq);
> +	if (ret) {
> +		gt_err(gt, "Request failed to complete: %pe\n", ERR_PTR(ret));
> +		goto err_rq;
> +	}
> +
> +err_rq:
> +	i915_request_put(rq);
> +
> +err_spin:
> +	if (spinning)
> +		igt_spinner_end(&spin);
> +	igt_spinner_fini(&spin);
> +
> +err_pm:
> +	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
> +	return ret;
> +}
> +
>   int intel_guc_live_selftests(struct drm_i915_private *i915)
>   {
>   	static const struct i915_subtest tests[] = {
>   		SUBTEST(intel_guc_scrub_ctbs),
>   		SUBTEST(intel_guc_steal_guc_ids),
> +		SUBTEST(intel_guc_fast_request),
>   	};
>   	struct intel_gt *gt = to_gt(i915);
>   

