Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A60D67A10E7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 00:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916FD10E598;
	Thu, 14 Sep 2023 22:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4944D10E598
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 22:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694730342; x=1726266342;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=y/yyl23Cx8UfzSBzbL+suucs3OH24uE0Tqiu+z6a7CE=;
 b=edKoMM/tF4VNSLGxG3fPKDFcbknZtIv1HtzPWgFenf8aRB4oj0e/qjIf
 Ih0PyQU2fUII9nz+8qiybTtWcWQp8zhj9skZVe5U0ekRVxI9D8/DXLVIO
 KFO1rW32NVw4f4l0m2tQjqNLe7MbW0kd3UYfQcstberhAFQ1IADrebVdo
 vOEr8K5tE1b+3F7pqgxMW7T6/717Ujw3ABNLoNb4/ztKNSkCoN8Sf3vv+
 q2PazpCqDyiiP/MzC86VWpQaLOscsILPL4T3V/xmn2bjoqqNDZm5hVS+G
 q3BoV3AVx4tDqS+AaauONrcrMsdlq46GFldr4G6/5WlWMpiWEKVfbG8vk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="376428430"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; d="scan'208";a="376428430"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 15:25:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="721452046"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; d="scan'208";a="721452046"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2023 15:25:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 15:25:40 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 15:25:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 15:25:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 15:25:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEvHXpJRFAdGpSpt3aB4SFTVGfWcZfSH9YUElhLsUbc22cdfxVdfJg93r8kLs2zP+PYHfsw6s2NOoVZXulzOs8rSdChg/Jys+jKt0VO+XAPjpY9hTVzqE4xOEnB1kFUXYoL7wgZ/Tf4iH6fq6I6VYNkqm//ZLeuCKOOA1g8e2BY9TH0mCgLTSQ0Bk3NxJTN+tpupuTBZeeTTz7sVePFEbGmqpt/L6HJEiKwKPOk4hcnpNo29+up4UduQphmdnpJbYdJtiTTCGBBGg+Xz0TkQ2K9aH0Q0Kt7HvpswICicMqbrul7/GIwCWSbQPygjHdAA+PvsXLmf/phbtd+DkLw1bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b48x++tB5NtykQEP3YAmaxdQFeAX2T3wG98wI68j8I4=;
 b=c/O+TuXurWeFrELhIyO1OAIcYst2ajXk/ML29mmXsqphjjUqGVHNRHc9Qcd77nY1oLSL+W8rcHdpyTAqTQ9MXqj4M88rMUrvFIT4my64ut5860vwDFOdewIb1hIOLAzmJNBByy1E2ikRBgtHUcVBA2s1jfRW3z6GY1zxWveKqeHvgqv0zYzXGdQ9X38pye+TuoVYJGB/IR01v3geyyOXfwQF+DlklsMdIxXaxE7wySV6t0HX67PVUUOzHFLXutf/cijSyyroHmWQLha0sC0lmdnak/GX3m+jvTuE8MHAwbYZh+Jr6Ys1WRdpjn1NyhuwJPhhabihUVSRWcARAN5fRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3398.namprd11.prod.outlook.com (2603:10b6:a03:19::19)
 by SA1PR11MB5873.namprd11.prod.outlook.com (2603:10b6:806:228::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Thu, 14 Sep
 2023 22:25:38 +0000
Received: from BYAPR11MB3398.namprd11.prod.outlook.com
 ([fe80::110f:4bac:8cd9:c359]) by BYAPR11MB3398.namprd11.prod.outlook.com
 ([fe80::110f:4bac:8cd9:c359%4]) with mapi id 15.20.6792.021; Thu, 14 Sep 2023
 22:25:38 +0000
Message-ID: <cbb8a2d2-dfa0-5658-515e-220d4cbdcdff@intel.com>
Date: Thu, 14 Sep 2023 15:25:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 1/3] drm/i915/pxp/mtl: Update pxp-firmware response
 timeout
Content-Language: en-US
To: <dri-devel@lists.freedesktop.org>
References: <20230909223848.427849-1-alan.previn.teres.alexis@intel.com>
 <20230909223848.427849-2-alan.previn.teres.alexis@intel.com>
From: "Balasubrawmanian, Vivaik" <vivaik.balasubrawmanian@intel.com>
In-Reply-To: <20230909223848.427849-2-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR16CA0021.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::34) To BYAPR11MB3398.namprd11.prod.outlook.com
 (2603:10b6:a03:19::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3398:EE_|SA1PR11MB5873:EE_
X-MS-Office365-Filtering-Correlation-Id: ac33dad7-c43d-499c-bd2d-08dbb5718573
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X2fmFgiZwpfc2YehFr+OdjuzrcsKMOXhZVXom50vn+rGmZtyA17hYUKaxqr1xJFX31P1BNAJ6NG3iolhT2Jhe0MsBFdMJIchc6gJoNU5t8S2A1tQjRk2jOMj3frYvtO35PdUQPJuVizntzMFjNHZaC3wYuDxhN1aohQ26gRfVKEeFJxx3PuW41GoWKS+e3ddURipQI3fjVL0kpHtrmm+okovE/LK8nBe5dATFYELmZo+5DcQOOikQha1LjVZHxG4eEvFts/efDB2DXvZbcp4B4m53bgQgOW6RHVtajRyoyu7FTm3ckfQso6exhCzTc6JStbpaf+EzXJg4XTahSmpwcDyAExToEfSwq+cjqMFNAWHJ9PdUfTzpwFQesjrs8kRkVwnJ0Es32tL8m6e+6naQZoeDZ38UX9oqxUMoG2kxKCQTMFnNBsa9HaE52VeUHZNMjynXGUThMzrtsgE5n3mnRfac6nzMc95h6eyhRGWhHR9Py9Q5hrH0zVWqCkzjsaA+7NSAjUh+8SFjhckuptarudRUqVlzOI9WEzD3ilYMtP/BUhqLBvam2Gn3HzI0xt9d/jx36T0OemWL01TulVdj69b9E1CFZuWpZ5iQv3lV5qRvhT0RguOmfaQYnZD9verNbjo2SgOULolq5NHbaC2+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3398.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199024)(186009)(1800799009)(6506007)(6512007)(6486002)(53546011)(6666004)(38100700002)(83380400001)(86362001)(82960400001)(31696002)(36756003)(2616005)(26005)(31686004)(6916009)(8936002)(15650500001)(41300700001)(316002)(66476007)(8676002)(478600001)(5660300002)(66946007)(2906002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnY4QnNQbi9QWGdoYStHVUNqWjN0RVhhRWw4UGRnMlYyMm1vOHVuc0d1MDhp?=
 =?utf-8?B?RmR0R3poZmRBTFFZaWdtamlXaXZ2RjNaTmxZQlNhcFF0dFhpRzhEdjhqT0VY?=
 =?utf-8?B?NDZoSlFBdVQzYjZpVGx1cFc3MXlXa25LNFdjd1JoUzI4UTd3SkUrUEtUdkEr?=
 =?utf-8?B?OFVxZUNrYU96eHQvMUUxRjgwOGhDZVVOSWhOU3hISkJVcUw1cUdOYzNGT3lv?=
 =?utf-8?B?amkzYmxwUXloZWNWblRVVXljVTdRN25uZ000aURSWllYbVMwcjhvLzJwU0RO?=
 =?utf-8?B?cnZrajNkakVPSVBEb3pyNDluT3phakxMc1Z1d3ZiOG4wY2VubmJtUzJtOFcv?=
 =?utf-8?B?YmFOVzNjczhZNFZ1V01pRm93NmRhUVR0dWJTd0VQSVZrNm5QZkY5R0UwcXo3?=
 =?utf-8?B?NWtLa2twU01ERDhWWjBpZ3NzTG5sY3dKNjFjTnBzMHJSM2o5OW55aXArNFd0?=
 =?utf-8?B?bWtCQkpTSWllek9ld1RoVXdDUkNicWw3YjVaUEFzZTFSdXRmUDNxeTJncitr?=
 =?utf-8?B?cjJqdmREeXR1R05aSWhwM00yMHZHclR1VkM2Q05zT05Td2hHK285VGsvQ0JP?=
 =?utf-8?B?LzhkczlwYU9VTkdOSjkvdnNmZ1JCTFNOMjJWTHI4L21wR2ljL3pIRnpuTjdF?=
 =?utf-8?B?dHF5a2VhMG0rNEVMU3BEcVZvYzViQVZYOEkxbEN6YW55Y0I5STN3U0N2UHlv?=
 =?utf-8?B?WGxLeU9ESFBzTlRmc0Jqc0pNelZlUHFGNjkzZS9yZjUxNUZCSysyN2xtWkQ4?=
 =?utf-8?B?VVdKT2Q3TlBHOHhTYm1TYURMR1hwbk9IcU80RjduRFVQQmFUbFRSVWkxR2xB?=
 =?utf-8?B?anN2MFdMN3J2QmEvcFRpdzZiUjFTdGhDK1hXM0F2Z3Bhc0o3S3BTNDI0ODFw?=
 =?utf-8?B?akhMbmI2Q0lxRGVnSkJ6WDRDdklMQisvc1ZsbFE0M25zNTVsSjQzVmpRRmlh?=
 =?utf-8?B?NWUvZUhCMGZXaklINDY4b0llWEFVVGZjcXZmVkRiUjhwdS9tUUpqT0dGMXNs?=
 =?utf-8?B?aVJ5bWlUdWsyUDhMYnhqTWs5bkt4RnhiUHNacWVNY3g0TmZYeEZ2cHlzRzdU?=
 =?utf-8?B?ODhQRlcyb3BXRXpDcjNrdWcxaDEzM1NkeTVxRE5sRDMyYnM2aDNCVFFXL3RI?=
 =?utf-8?B?SGJkNlNuQ1Fhd0hEVGhVR0VHb0VuZ0V3VFBiT1l0MWlRczY2S2JDdWFTckli?=
 =?utf-8?B?NFdDN0hYOXdPVFZqNDlSWTZwK1ZHVlhncnFtUEpJczEvdWljTjZUUDh6SVd6?=
 =?utf-8?B?cGVtU2NIemxJb0txN05hMWZTcW16a1BZN3loWTd4dGcyZ2ZvcFpBVWVGV2FW?=
 =?utf-8?B?SjYrS0x3VGs5WnNDWFhpem9QdGpCelJDUXNSekJNZzlhVGpidU1UekRNT1VX?=
 =?utf-8?B?QTZEampLNGhXUlY4SElUazIzK3VuM1drcXZnZWR4Y2pqSE91ZFVlb1ZQSEVy?=
 =?utf-8?B?c3dMZC9SSXdpV0NyTjE4aitJU0dlUzBSelNsdGgxNDBTcURTaXBraUE1OElo?=
 =?utf-8?B?d1BjSFlkMVdwSWxNdTM0SHl1elVsK2RzVnZsNEF3WlNydUJ5UmtsVnd3aEZW?=
 =?utf-8?B?UjZsd0VWSTA4RXpIYTI1d0RqNm81K1dhcDJHY3hDUFlTNkQweFBQZGVNZ0Ru?=
 =?utf-8?B?ZTNOdlZoZDRld2hwTVBKeGRtK21XN1VTbkJKNDBrb2h4VitnRDVKODEvZjJO?=
 =?utf-8?B?TGtsTDV4WlhZWkMxekYzQUlscytwYXpuUU42RjVsTUhOVHFNWW1ZdEoyNlJq?=
 =?utf-8?B?c09YTlg5L0Jwa0hmVE04MHREa3ZQWG1KUDM3dFVwKzdYMjRrTnB5bjFlL2Jr?=
 =?utf-8?B?Wi8vRE92WWlrZlZnazVHNG01YmYzbm05ZEhEazNrSnhLbHNzdW1aSHVpeEZB?=
 =?utf-8?B?RFoweGJoZlp5UjQwem1RQW5DY2RRVHRqQW5lVnJnV0VKckhEQzZwMGQ0ZWcx?=
 =?utf-8?B?L1dTMjg2eFZnSWo2NEhFQ0RYZ0JmTkYrSHFBVWZJcUhieW8zaDZiS2NsaEcr?=
 =?utf-8?B?SlM4dXJxLzVGQlVwUHMvNzdpQ0RoVXY5aW82aWw2eDRmRGZaRUhZRlEwNWhj?=
 =?utf-8?B?cVR1NzdRNDN2T2Rha3lZUXRJc0VDQWRRamowcE5qTGhiYUhwYlZGR1A0Uzgx?=
 =?utf-8?B?LzlJbVI0aDd6Rkc3Smp2Mk9PSkJnR0ZFejRwWDBsTG84cUJMS1dZbjB3QWtm?=
 =?utf-8?Q?WD76UOw/97L5qij4CNnY/Ck=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac33dad7-c43d-499c-bd2d-08dbb5718573
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3398.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 22:25:37.9230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZYqpR083aLbQXgAU0uFeWpnZj6KnyQeLw5bv8d1tFghH6t5AQzQuFojA4GgfaCj+ZVeoH0HFFuFAVSWDdPVn4egT576BG8DVFxRsHuNv6YCCy2hMJlAXqjNTeQWNs5N7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5873
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

On 9/9/2023 3:38 PM, Alan Previn wrote:
> Update the max GSC-fw response time to match updated internal
> fw specs. Because this response time is an SLA on the firmware,
> not inclusive of i915->GuC->HW handoff latency, when submitting
> requests to the GSC fw via intel_gsc_uc_heci_cmd_submit helpers,
> start the count after the request hits the GSC command streamer.
> Also, move GSC_REPLY_LATENCY_MS definition from pxp header to
> intel_gsc_uc_heci_cmd_submit.h since its for any GSC HECI packet.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c | 20 +++++++++++++++++--
>   .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h |  6 ++++++
>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h    | 11 ++++++----
>   3 files changed, 31 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
> index 89ed5ee9cded..fe6a2f78cea0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
> @@ -81,8 +81,17 @@ int intel_gsc_uc_heci_cmd_submit_packet(struct intel_gsc_uc *gsc, u64 addr_in,
>   
>   	i915_request_add(rq);
>   
> -	if (!err && i915_request_wait(rq, 0, msecs_to_jiffies(500)) < 0)
> -		err = -ETIME;
> +	if (!err) {
> +		/*
> +		 * Start timeout for i915_request_wait only after considering one possible
> +		 * pending GSC-HECI submission cycle on the other (non-privileged) path.
> +		 */
> +		if (wait_for(i915_request_started(rq), GSC_HECI_REPLY_LATENCY_MS))
> +			drm_dbg(&gsc_uc_to_gt(gsc)->i915->drm,
> +				"Delay in gsc-heci-priv submission to gsccs-hw");
> +		if (i915_request_wait(rq, 0, msecs_to_jiffies(500)) < 0)
> +			err = -ETIME;
> +	}
>   
>   	i915_request_put(rq);
>   
> @@ -186,6 +195,13 @@ intel_gsc_uc_heci_cmd_submit_nonpriv(struct intel_gsc_uc *gsc,
>   	i915_request_add(rq);
>   
>   	if (!err) {
> +		/*
> +		 * Start timeout for i915_request_wait only after considering one possible
> +		 * pending GSC-HECI submission cycle on the other (privileged) path.
> +		 */
> +		if (wait_for(i915_request_started(rq), GSC_HECI_REPLY_LATENCY_MS))
> +			drm_dbg(&gsc_uc_to_gt(gsc)->i915->drm,
> +				"Delay in gsc-heci-non-priv submission to gsccs-hw");
>   		if (i915_request_wait(rq, I915_WAIT_INTERRUPTIBLE,
>   				      msecs_to_jiffies(timeout_ms)) < 0)
>   			err = -ETIME;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
> index 09d3fbdad05a..5ae5c5d9608b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
> @@ -12,6 +12,12 @@ struct i915_vma;
>   struct intel_context;
>   struct intel_gsc_uc;
>   
> +#define GSC_HECI_REPLY_LATENCY_MS 350
> +/*
> + * Max FW response time is 350ms, but this should be counted from the time the
> + * command has hit the GSC-CS hardware, not the preceding handoff to GuC CTB.
> + */
> +
>   struct intel_gsc_mtl_header {
>   	u32 validity_marker;
>   #define GSC_HECI_VALIDITY_MARKER 0xA578875A
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> index 298ad38e6c7d..a4f17b3ea286 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> @@ -8,16 +8,19 @@
>   
>   #include <linux/types.h>
>   
> +#include "gt/uc/intel_gsc_uc_heci_cmd_submit.h"
> +
>   struct intel_pxp;
>   
> -#define GSC_REPLY_LATENCY_MS 210
> +#define GSC_REPLY_LATENCY_MS GSC_HECI_REPLY_LATENCY_MS
>   /*
> - * Max FW response time is 200ms, to which we add 10ms to account for overhead
> - * such as request preparation, GuC submission to hw and pipeline completion times.
> + * Max FW response time is 350ms, but this should be counted from the time the
> + * command has hit the GSC-CS hardware, not the preceding handoff to GuC CTB.
>    */
>   #define GSC_PENDING_RETRY_MAXCOUNT 40
>   #define GSC_PENDING_RETRY_PAUSE_MS 50
> -#define GSCFW_MAX_ROUND_TRIP_LATENCY_MS (GSC_PENDING_RETRY_MAXCOUNT * GSC_PENDING_RETRY_PAUSE_MS)
> +#define GSCFW_MAX_ROUND_TRIP_LATENCY_MS (GSC_REPLY_LATENCY_MS + \
> +					 (GSC_PENDING_RETRY_MAXCOUNT * GSC_PENDING_RETRY_PAUSE_MS))
>   
>   #ifdef CONFIG_DRM_I915_PXP
>   void intel_pxp_gsccs_fini(struct intel_pxp *pxp);

Reviewed-by: Balasubrawmanian, Vivaik 
<vivaik.balasubrawmanian@intel.com> 
<mailto:vivaik.balasubrawmanian@intel.com>

