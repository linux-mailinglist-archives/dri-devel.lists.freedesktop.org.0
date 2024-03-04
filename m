Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E6186FEAC
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:16:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1103E10FF48;
	Mon,  4 Mar 2024 10:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RGZmT9L+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0840210FF48;
 Mon,  4 Mar 2024 10:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709547395; x=1741083395;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oJOMaf6x7ziq19Y5yJuzcrBYLWdmpYINekVpWPkU32c=;
 b=RGZmT9L+T8Z4EhF5N3SbYXLnAhB3QsA4BE27RMXf2OCrlmnZBpScPd3l
 VSQ5s6Of9cNrZ7Zx5JATppkwTuD+NTaC7e2HNtTS1c7gnZFPY7FN0t+uN
 SYfNjXasPpYykY4G8cWVPW2UBtHuu8bBSFCt6i36KEnKqdece/rhHlNnN
 +fXuv60n4kzDGgokbTKM964+f0QZTxD7anLelucBPtOGryXDy6lSg0BFC
 4ZRFgW0XKpnxVwczpEEdeQrbVCLfcMxwypLSuIPD9z5uZ7sNvt5aTlfGU
 ONf+jevR8qA88UcGBE7ZF/kXl7pvpwIiBW+hJ3sN6z4Uw5gQdikjrR3bi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="3890767"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="3890767"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 02:16:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="9086601"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 02:16:23 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 02:16:22 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 02:16:22 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 02:16:22 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 02:16:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oXCSSWkC75ZQn2MGJvgK1TR+fYg3HcQSe43Yx0VtBEN1p0CLyC4ZfhHeLJOMqib6XKqoSJdj45wbFbzrSVEfBqyaURcFWLtSF/oYUKmVxHk7UvFueJ+edO9QMioqWFgP7sxvli8d4mknwUVrZgt/tAnxqOPMKv0LowmFm617REOd71VfLoYBXz3/YI7r2s0p07a13zmJILZJKnAV8RIQ7LF6dXXDtrrg7hoysm5Jc2syW8H2h9f33KSceA+BtuuSao3VC7grT54ez3DM7NmHp/POC8SBTnIQbl6haBdPWwTzDZMuyZ5VuNUm/TtLTo21zBXWdfIHuWwLAsgpYaKjdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmD56gyAJ0UboPzXJBgCNSrvgUK7iMDDsGtJc9yInOE=;
 b=NxAL82dZzEwpUoYFOCIrlyPInUy7iIC3CdkZCQK/vUDbvCJV9mPJ75ixNPS1mHfakef5pPzinyoeUk3rFnMnfhbgRQJNUxUkN/zIgDC136IQB3PVD8IJ1KocmgmL/rqiKG2gvRPMIypa/A8FHV4tKILfIEAmeblJCbqwKwuZ18IGZ2N3yuGmjNpbq9kp64XGxIPWvt5qPrT7hndfhdNaSgaADdXfDbIKyKJ1fwMw0bbM55oEVt8qn+DlizADRJUpo4JZ2PQSiNTcGfWqaPaWyTJATX7Bb8UGwXmKQVI43rP1VakF5QOQODdODDru7sNg05L+TsWJea6cYYEeEdlo8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by IA0PR11MB7377.namprd11.prod.outlook.com (2603:10b6:208:433::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Mon, 4 Mar
 2024 10:16:18 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 10:16:18 +0000
Message-ID: <8aeef2f1-32f6-40d1-b1ff-375188655370@intel.com>
Date: Mon, 4 Mar 2024 15:46:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 7/9] drm/i915/display: Add state checker for Adaptive
 Sync SDP
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240301084503.2971826-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240301084503.2971826-8-mitulkumar.ajitkumar.golani@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240301084503.2971826-8-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ME0P282CA0009.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:20d::18) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|IA0PR11MB7377:EE_
X-MS-Office365-Filtering-Correlation-Id: f7f045aa-bdee-4cc3-b8fd-08dc3c3421b9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ePuN4P7A9/4m6TDdNbK+FdhkEKJQOkQL07py/GwMxbeaQtDtNignowtFaPqyYKh8J9/wdbWKLxNcm5dWbdp10aeludcfYucMMZnVD2ExsXbbl0iHBPGl3sM0eyIZxeL3mqeepoXE2bg4a90I2VjFBcSvoKXkVoXBZoQkMghlad2t2KkURqPcHBz+f4HVtbYKxDUb2Oh5aot4yRc8BKrOwARq3acxOpDY6Bi2/WTMWnuVyfUvth1qqdmGURP/y6RFGvxInrhVTP6c8i445WBDnu0UBkPQoRdPQfc7cuCoGjKsZW7cSLsvzN8tQ876GrJhV1ZoAQTQE/d3Cp0l84qDJJbtADUrjXoGrtPomcz7A37f0ViQtfm0eALoHheJGVwnx5oCPfKRy8QoISLtvy2qC6S8HQ4dcydsSQMipX4epxSt1QYR6wHgIlzSPS9szIQvqST49xGh1ARjg3hL1Q5xlhK7r+JzSVdGN/sC1Olk3UWoMJl14eyF/TPG7jzbbvzrGl0oDkhkXlXaB3YfvJogUS6zIHbq+3P8/pQvWCM1+dIqqqjH7JURtmrUzhM4U3e6iRVKJNI1Mckuzb7V5Fio/rSdHI/0orrXS0GCta0K11wr9F8+WIjL3s0bUTr4d4BP2eO+pXW0AgWv4AwFeYjVqdJghr3x1cxC8hBhV5uKQUA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnFmbHlUR1hwQk5MWjNPdnJKbUovQnFQZ3NxMGtIdGMyQnZBMDZBeXljM3Rz?=
 =?utf-8?B?bU1iU3JINHh6RDNkWVdTZ0R4QnlsbEFqdEk3WURBUThJTVlUc3RFVjh6dkw4?=
 =?utf-8?B?ZEE0dGlLYWdkbHVQMUNRcmhhVHZscFd0am9PNjJOYWN1aFRIampzSCsxeGtB?=
 =?utf-8?B?T0MvbVRWTGhndFoxY0hzM3gydUtxUFdOQm1VUHRPRExHdVIzLzVRdkZqTnYw?=
 =?utf-8?B?a0FSTkN5VGF4aEQ4ZFFFblB0S0VZdXVyTmlCYzV1dVRYek9tZG9iZVptZmtT?=
 =?utf-8?B?S2tldlRZWTE0MkE3UWwwdk1JR1d2V2locXAvUFVXaW83eWxpaFhGeE5FN3Jv?=
 =?utf-8?B?M3FwM016c3Y5bGszeGZ3K1QyckFUUml3RHVScDRxcU5ZOXpIMERPd2xhWDNS?=
 =?utf-8?B?RUg1cmFpL3BOZlBsUHZybDU4YUQwS1hWYnhVTHRtSUFocWtRcU1FYTBnUHg0?=
 =?utf-8?B?VzRvaWdwODJlODI3RUVVTHRMdjJNUnRVYmhWU1ovT2FTSW9iZFB0Y0lHZ3VF?=
 =?utf-8?B?NWpuZXkyRTZRa2NtakFDaTZiOWEvOG1XWWZ1QmI3MEsydkVtVFRnYWRMSGla?=
 =?utf-8?B?VVZWNlhtQmJ4bWpVV2VOM0NKcWNYK3Zrb01IVTF0K1cyT1l2aXZXTjdRc1No?=
 =?utf-8?B?V2JIL2gxbWJLL01SeENyWkZ5L2tkQ2pwU1BWZ1J4QkdZcm1EWTdXMG9sUGFD?=
 =?utf-8?B?ZWlyckZ0TDlrSUtvdXJLSW5WelM0b3ZIUncvYTh5dTcrd1hMSGo0N0luZWlD?=
 =?utf-8?B?S1p1YW1tTU9Wd05VMjJlTDU1L2d0QVVtOS9iWldMamEwMXRLbTdmdG5OeG9J?=
 =?utf-8?B?ZmNOUjBuMzVXYUViT1ZQRU1BbWthWDZnb0hwNFBNRVM4VXZYT3RTTlRhK1Bl?=
 =?utf-8?B?bzllUm1UaGx3MVZpTmdsZ0hEWmVRRlc5TEc1c0pyaXc5N0twWTAvVmY3OXNX?=
 =?utf-8?B?cjJ3TU96M3RIM2lMMi9pWG13U2lhNUxEenM2emFaenhjdnlnS05JTkdkdG9P?=
 =?utf-8?B?cXF5eSsvc2w5WndjT01oOUoyZTZIVC9WbGVMUTlaWG9QeDExTk1WQmhSQ1c1?=
 =?utf-8?B?UXlkVFZlYnRvTzF5OGlYT2FqUVJ2SldwT2xYYUdBTk81TTIzdm9EMGRlZ1lx?=
 =?utf-8?B?WmhHSjI2MHVkSDdxOVJNeDBtNzQ5dlVhWXhUNUtkaGtIVGxzZm1xaDlpMC9S?=
 =?utf-8?B?SERzVVJEK3M0WHFBYzFIRkZ6Y2ZvWkhodXhjWmNlcGZPa3p6S3JsZ2RIYUVJ?=
 =?utf-8?B?bmN3ajFHT0wwM1FtQzlOWWxKdlBKaXdXN29lZkxtOVoxS0tCMnhhKzJGSlVC?=
 =?utf-8?B?Ky92L2lNdzVKVUpYeG1iUU9ZdEdYYTBKVzdOMStrTXVCMFg0eVAzQm0vUTgv?=
 =?utf-8?B?YXpIbWF4OTNSWC9BK2FMNzBvUHF6dTVLV1hDdHYrMXkxSHE5OUFsazZaY2ZT?=
 =?utf-8?B?amxEMGFyZmZIYjdnSm9mUk0wL1pJQlVIalRpZ1dQaUlYaGpjK0NWd1BpVmUr?=
 =?utf-8?B?eEFwR1Jlc0N1Qk9RRjQxNENVd2FkVTQwOEVKbU4vY3lZOEJPTFRadng3VjNH?=
 =?utf-8?B?ZXBJWUhyYytGa203VW90aVd2RnlMWTNSeTVQbVlTbENHTG5EQ1pldHZ3bGJZ?=
 =?utf-8?B?eENnS012OXlSTjVQd3hsVkFmT2toOE8wTW40UEhzRTROejdCQVdNVXFVbmNQ?=
 =?utf-8?B?QUVKRkMyRXdmMUs5Wjhodkx1YzZBUGpTdkZvdCswd21tUzVjSFExdEx6OEZ4?=
 =?utf-8?B?YjNnNHlsVHlpSy9TYnlJNWx5anRMRk5tajdUaUs4VDZPQU93MnVSbElBcUZa?=
 =?utf-8?B?NlNtSWV1d2dRU2Zsa1hib05lT0lUYkFYVVZnTFB0bVZuZGlUS3M5bytrcXZr?=
 =?utf-8?B?RWtVbmxaRnQ0cGVwdXlFSGtsdzF6ZEpsUUJVcXplYlAxdFF4YkprKyswSG1u?=
 =?utf-8?B?elF2elVpNGZValBxZUQ3TXZVMURGRUxaZEN2T3B5em9MeDNkNjA0aHpQUEJB?=
 =?utf-8?B?b0wycUhQK0dQK3RiOCt6RG02aUFBQjVqSFFlL0dkN0ZHSnEvSzZicVhLODdh?=
 =?utf-8?B?KythaWgvVDlWUHFRbEhmNGFqRnlRbWh2MC9BSlAyNEF6RDdURVFlb3lueVEv?=
 =?utf-8?B?eExjZmVwbHhZbGt2UERJbGFDNFNJQ3F3NzM3UjBjTWFJenpvNWZJV2EwZ1pw?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f045aa-bdee-4cc3-b8fd-08dc3c3421b9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 10:16:18.4296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UfmoJk1OIyiQcK0feMRO4R8+6c7LWoBHvPp13IvqTtfO2vDq40SmO68MTWt/76LjFSLaJZXx8Ns8P96b51nQPqMNugwZ8sFndQQZAU7MMXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7377
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


On 3/1/2024 2:15 PM, Mitul Golani wrote:
> Enable infoframe and add state checker for Adaptive Sync
> SDP enablement.
>
> --v1:
> - crtc_state->infoframes.enable, to add on correct place holder.
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_display.c | 46 ++++++++++++++++++++
>   1 file changed, 46 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index ab2f52d21bad..88158f06bf82 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -4791,6 +4791,17 @@ intel_compare_dp_vsc_sdp(const struct drm_dp_vsc_sdp *a,
>   		a->content_type == b->content_type;
>   }
>   
> +static bool
> +intel_compare_dp_as_sdp(const struct drm_dp_as_sdp *a,
> +			const struct drm_dp_as_sdp *b)
> +{
> +	return a->vtotal == b->vtotal &&
> +		a->target_rr == b->target_rr &&
> +		a->duration_incr_ms == b->duration_incr_ms &&
> +		a->duration_decr_ms == b->duration_decr_ms &&
> +		a->mode == b->mode;
> +}
> +
>   static bool
>   intel_compare_buffer(const u8 *a, const u8 *b, size_t len)
>   {
> @@ -4846,6 +4857,30 @@ pipe_config_dp_vsc_sdp_mismatch(struct drm_i915_private *i915,
>   	drm_dp_vsc_sdp_log(&p, b);
>   }
>   
> +static void
> +pipe_config_dp_as_sdp_mismatch(struct drm_i915_private *i915,
> +			       bool fastset, const char *name,
> +			       const struct drm_dp_as_sdp *a,
> +			       const struct drm_dp_as_sdp *b)
> +{
> +	struct drm_printer p;
> +
> +	if (fastset) {
> +		p = drm_dbg_printer(&i915->drm, DRM_UT_KMS, NULL);
> +
> +		drm_printf(&p, "fastset requirement not met in %s dp sdp\n", name);
> +	} else {
> +		p = drm_err_printer(&i915->drm, NULL);
> +
> +		drm_printf(&p, "mismatch in %s dp sdp\n", name);
> +	}
> +
> +	drm_printf(&p, "expected:\n");
> +	drm_dp_as_sdp_log(&p, a);
> +	drm_printf(&p, "found:\n");
> +	drm_dp_as_sdp_log(&p, b);
> +}
> +
>   /* Returns the length up to and including the last differing byte */
>   static size_t
>   memcmp_diff_len(const u8 *a, const u8 *b, size_t len)
> @@ -5099,6 +5134,16 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
>   	} \
>   } while (0)
>   
> +#define PIPE_CONF_CHECK_DP_AS_SDP(name) do { \
> +	if (!intel_compare_dp_as_sdp(&current_config->infoframes.name, \
> +				      &pipe_config->infoframes.name)) { \
> +		pipe_config_dp_as_sdp_mismatch(dev_priv, fastset, __stringify(name), \
> +						&current_config->infoframes.name, \
> +						&pipe_config->infoframes.name); \
> +		ret = false; \
> +	} \
> +} while (0)
> +
>   #define PIPE_CONF_CHECK_BUFFER(name, len) do { \
>   	BUILD_BUG_ON(sizeof(current_config->name) != (len)); \
>   	BUILD_BUG_ON(sizeof(pipe_config->name) != (len)); \
> @@ -5280,6 +5325,7 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
>   	PIPE_CONF_CHECK_INFOFRAME(hdmi);
>   	PIPE_CONF_CHECK_INFOFRAME(drm);
>   	PIPE_CONF_CHECK_DP_VSC_SDP(vsc);
> +	PIPE_CONF_CHECK_DP_AS_SDP(as_sdp);
>   
>   	PIPE_CONF_CHECK_X(sync_mode_slaves_mask);
>   	PIPE_CONF_CHECK_I(master_transcoder);
