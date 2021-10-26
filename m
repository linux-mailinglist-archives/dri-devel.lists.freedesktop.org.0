Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E4443BCBB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 23:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548BE6E4A5;
	Tue, 26 Oct 2021 21:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAE16E4A5;
 Tue, 26 Oct 2021 21:58:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="210805008"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="210805008"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 14:58:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="724500944"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga005.fm.intel.com with ESMTP; 26 Oct 2021 14:58:06 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 26 Oct 2021 14:58:06 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 26 Oct 2021 14:58:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 26 Oct 2021 14:58:05 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 26 Oct 2021 14:58:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9qHp77DT/PBsZkZO7D5PjgAL5I7my4UxEDd2lUbOyvS12PmTVREU5/Lh37jA3AuGuTL/pcqwtNF0tO65cZu/GHKfHB767p6xWoG6CZB+IgQffYqH36NqOLiE8lahzVBWJNITag+OmbBKZYJLwUiuQAXtW4no4ncplamBzOnYpvjtgK9odK2ZfoYPjJMpP615d8hGlnXOpGAokkXkxsV/ftkGB3sx3H2B4WCCxHVwplhRuuxfxvl77smiFFQfnQHdWAnr6sMz5s6PVZRS6MLQzXdkdBVmm+3Ld+jEThdwfwn/X4oiIjmnhfJ5MdMZUtardhF0YEXzbrGz8ZkmLtHvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIer6DlRNTfOURiX6Ioj3j19JfGhOEhIZTApilnf9gM=;
 b=jS0a/QrvtoNVxlrEsTp9r+VFvPf1iCUNuz3Qmq+iqWRhgqyw/P78cxi05oPvzf4DPdGzIOxdqb/5gF9MyJAJV/TiBQWY/aOnD7U6RMmlBYG4mIw7qfr76vJRn1xcNJ8XpHwqnCk5N14nGFM6zePkRfFAZhtuEGNC5CVOZXX3Z1ruSqjqtPIsyKipdbiPliGjZiWmFJuWBVHq2s+3AohnGpXCpOfr0KeZEW8m7hs9YiUptUsX+Y1271AVeZDUh0TPIat4iokHAwUbMWIUGZ1qc5eeQNKsUYoZdRlsRxkYcjd4jjEelTZF8OalH6MzCcE0doa8RAra5mabNCSoJQ4AnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIer6DlRNTfOURiX6Ioj3j19JfGhOEhIZTApilnf9gM=;
 b=qot86iRtWS9ioWz7Ten3VwnVJeSZSy93x+B9WqyETTx481Ffpy5pJjXdOv3z2jg4V1H6RynCJLYieXk8B7IRidh8zfBGs82wQhISRfC4z7jnHEUjBtitoEe2BJRwz3tPrbClR+QYdNRt51IH/ikMpYvEF86bPGc+9Wu6RZgsDXE=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5626.namprd11.prod.outlook.com (2603:10b6:510:ee::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Tue, 26 Oct
 2021 21:58:03 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%9]) with mapi id 15.20.4628.018; Tue, 26 Oct 2021
 21:58:03 +0000
Message-ID: <c9a1cd3e-dc3a-2b2b-ee37-73c0c50f3f60@intel.com>
Date: Tue, 26 Oct 2021 14:58:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.1
Subject: Re: [PATCH] drm/i915/execlists: Weak parallel submission support for
 execlists
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <tvrtko.ursulin@intel.com>, <daniele.ceraolospurio@intel.com>
References: <20211020214751.34602-1-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20211020214751.34602-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0151.namprd03.prod.outlook.com
 (2603:10b6:303:8d::6) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MW4PR03CA0151.namprd03.prod.outlook.com (2603:10b6:303:8d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.22 via Frontend Transport; Tue, 26 Oct 2021 21:58:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d8480a8-f72d-4b67-dc81-08d998cbaf2e
X-MS-TrafficTypeDiagnostic: PH0PR11MB5626:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR11MB56268B8EA82EA60F3CDEB806BD849@PH0PR11MB5626.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RC/kLHZUlLlXXIPlNO4+QBklqlovixWoZQIrrgKBhpV2LPQvZaXjgmQ9489Lj56MHsCt3s9CVTCemmaR7bWB5v2bYR/gFKsvmvOxy2q0KfjP4y6L/AE4UGKb9nmk+NBW+qoa9pZexbtSqipJ3AhFN/CmeTX4zbr8YV9iz4Gdbks4bysfoygC13arE5rv2GURzbJKt/MntIAuitxV55/8VdNwlo1+lir2Meotr5BP64/ByPdbpGYLFg1gnysYA6LXxx5lwhuPKW8UCTrExZfHkAjaKSkaCQ5qYRQ9qo10ZrGEL/QJ53Md8s/SHWYjKzMp4l6kL/6L5/GSmRvw9Pwc9/LZgkyiY17/tSUK3qu8medkUXKK5NjZltriFqhRs5KkoEqlNDFM9iDFx7sQmBTgqfT5d9rAziLPfh/40SIhdm4mErJw3mqoun4iOKel/916r14U0mferrmkHZrz6JLbfA6RxTpFnzXKyAZr0Kj3Wf/Wo/EcseYmeNUrkYcbjjisdFZMN+fMKiLvmlEatldVewMSEVXYVamtU+k0BPYreNpIcajMUmpDxpD/LvqRuhL7lf1xl39fkh7Do8nu/FC0bN17KjVBVxPkrOU0DDms6nLLtwKaWgtFnpnNkeLQcL3L4Rc3pKTWiP0CbcsdzrCAosqIvsKy46yZRzlv1Mv1vZPJTltbLxodoO2+gUQeY3T31ItKgzKHrsZtYNnF1jf0UyR2Ub2j9snB9RZnCusWmqr1G9ahnBdJwr0lQ/UmwXvV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(186003)(66556008)(107886003)(316002)(83380400001)(31686004)(66476007)(508600001)(2906002)(450100002)(31696002)(38100700002)(82960400001)(16576012)(36756003)(6486002)(26005)(8936002)(4326008)(86362001)(2616005)(53546011)(8676002)(5660300002)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUlLZ09TODB5YTYwN2p3MkdHOWtZL3o4bTdJMjRoQUFSczVVelVwL3lOb2s2?=
 =?utf-8?B?UzU1eDhyU3BGK1VLaDRiZHloQml0SmpSM1VYenpxYllWUnZGZkRYZDU0MHAz?=
 =?utf-8?B?ZTlwdjBiNHpNeGdjZWNKNEpqU011Nzhld3A5ZFg3eFlXYnJhckpRYURKbEdo?=
 =?utf-8?B?RmdFT204SVRCSWxZekl4NjArNTR1Q3lYNjRzOG11Yk16UzlRQTBReWFGNi9y?=
 =?utf-8?B?YXM1a3NHRWwvOFNXUnBGa1JLWFhub3BSRWR3SXI1WWxuRVQ5WEdQQmtDRElu?=
 =?utf-8?B?NE5pMXFKYW9zaVJ6ZjFoL1VXc1JlMDFaMGM0ekw2SGhZVjQxbUNOaW1tbTNq?=
 =?utf-8?B?UkNXVnJ0YjJlK21WbER5Qkl4eU12T1psOW9XaEVnelV6eXNkVHVJeDJpMHYr?=
 =?utf-8?B?ekt0Z2VZekFEbmRLdmJGUldMYXhweG5EdnJIa2JINTNVWnBnUnZlR0FGdmxD?=
 =?utf-8?B?a2hNYTltYmhsWVpvYVFpV00wM1BuQWlCNTQ0Nm94ak1JTExmUHdBbGZZMUpt?=
 =?utf-8?B?Z1VNZ2UrSGFpcXNpUk1XaTNrSlZlWU40cVNSRjdUNTM2czhSUmsyQ3N2UTRj?=
 =?utf-8?B?UEp0aUE0R1NnK1VNc3hiM2cyaFIxdTlFbmt1NTJZTS80V29zK2lhVmgwR0lS?=
 =?utf-8?B?c1lBMllJODBJRy9NMzQxSlJpb0xpamR3dXIyY2MxVVY0WFVvTlVNeG0xUTAv?=
 =?utf-8?B?aldXUzI3cFZSNkZMcTNGdzVoQUZvdnAybjk2N2kwZHVxcDVrWS90S3NiWGFp?=
 =?utf-8?B?OXZxRzlOZU5xbUhNN3NIZEZNRzlGdTlkeWpMbmdacXVUbkJ2V05KcUxobWtN?=
 =?utf-8?B?cmdkVTRldStyU1J6bHdacjU5NE1FZVBBbnZLd1JuNDBxa3ZYT05IS0pGMmxr?=
 =?utf-8?B?aHkrNlpvYW11YUJkVjdPeVR0SnJNRVpGUnROQnVrUzJLd0pxMHFZUjQ1dTNN?=
 =?utf-8?B?ZjF6NUxGL3dmRndORFZBeS80dUdKbFdWWHVQMDR6dGtjSVhZSmQybHVrMUJO?=
 =?utf-8?B?VXE3TmhvYVhHWHhORWVGQURDTk00aXpZOU5TdngvMERiazdab2IyMU5hVzlF?=
 =?utf-8?B?TXRhRUVWOFRTU3FHT0krTG05bzVBZUQyaU40Uk40Z3g0L0ZocElaeStJMDlT?=
 =?utf-8?B?R0pHV3k5R1dJNVBMVTM5SWtDRFptL1pUaFJ4NzNDUEU2cW8rcjkzRlc5TVd2?=
 =?utf-8?B?RWNzbUpoNVFsUUZjUER4aU5aZzB4aEx4Z0F2Rk80OHE4WFFOdStpaldJYnBu?=
 =?utf-8?B?dEVxUTA3cUh0RERZdHZUdVd5ZXJKR1FKWEIxYk50T1p0VDR4T2J2aXRJL1FS?=
 =?utf-8?B?S3BXa1RUWWVrRGZ5RmV5L2xMUFRMSENIK0xXSjFPWFBXbHMvMG5mclpTek9T?=
 =?utf-8?B?SDF6ckZZdTZNdk1HRGk3TmZxYzQxMzEwa2c4Nmpwd1poZEtQNXVKcklCQjB3?=
 =?utf-8?B?anZ4UXc1NzRhWWlUVWhlUzFjRTE1TzlhSjExY0Z4bmU1T3M5U3NWQ1pWQkVt?=
 =?utf-8?B?bUt2RGRsOHVqWW43cVlVZU5Bb01XZGVRVkpraEZYeXgweXNXZjI0MHZMZWUw?=
 =?utf-8?B?R3BObjhxU3ZreThnRGRGUkttZm4rVXBxWHg2UFBNZnNNTldNQi91WVpaaW8w?=
 =?utf-8?B?UGN3ZzdxVVV5YmsydDVBSUhTUlZvQyt3RENDVFpaUGhxcjBzS1lSS09XSDFs?=
 =?utf-8?B?TEFxK3FQSmdsMVd2VGxubk1oaG1zcHo0MGxtTzhPUUVzMXB6THpvOU9HQ2Vs?=
 =?utf-8?B?QTIxTWxiODd5UU1mQk1sSE1KeDFQbVVpaDgxdENNZFNDdTRFb1FaSytaNGNC?=
 =?utf-8?B?M0lqU2ZwVXptVG1pVmhyRTVZb1JWVVlaVnN2bTd5RHBlUmkrTHVXZHdtV3M2?=
 =?utf-8?B?enlOYzFyNkxtanovemU2YTErTHJmNXpiNHJ6dCsvTjR4Y0NRNnRiWW5XbUtS?=
 =?utf-8?B?a2tvWEFsTi9hUFpJMmhSdU4zMjFFeEt2d2x3Qy9TdVhjQ09DdXFIenNSMkNR?=
 =?utf-8?B?WGExM1IwVlJLWlNOMzRpRmlPaG0xZmIrVmFEdjhwWjNKcFR6cmRXZmdpdkdO?=
 =?utf-8?B?ckRUeHpIdUxKWENnMkxLeGV1ck80bVlwNTBUSHlFM3R3bjVxZHZWelhHNjBS?=
 =?utf-8?B?aU14SW8zdkNZWm1kaDRselJLVzRNTVg2NnNYSkxKTHlIRzJyMmhudWlSOTFn?=
 =?utf-8?B?aFFWbVRhKzBMdFlEaWQ5Zms1SXBEZitBSFZOVFhvSFREMVd3N1B1dHZnbzl0?=
 =?utf-8?Q?iJV/W8UJStuqFH4FtG5Vr9eCsZz+/gHGEwmWPCSUOM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8480a8-f72d-4b67-dc81-08d998cbaf2e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 21:58:03.6314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5xLFjUgT70M8tU10+meogaLZLwS4CXLjvskfLbkZfKtxduj1umufs7/CVC9cVrP8ZuM3vxi5HTSPSi+PMPEVHcg2iWgAz0HOegIHY590kzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5626
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

On 10/20/2021 14:47, Matthew Brost wrote:
> A weak implementation of parallel submission (multi-bb execbuf IOCTL) for
> execlists. Doing as little as possible to support this interface for
> execlists - basically just passing submit fences between each request
> generated and virtual engines are not allowed. This is on par with what
> is there for the existing (hopefully soon deprecated) bonding interface.
>
> We perma-pin these execlists contexts to align with GuC implementation.
>
> v2:
>   (John Harrison)
>    - Drop siblings array as num_siblings must be 1
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c   | 10 +++--
>   drivers/gpu/drm/i915/gt/intel_context.c       |  4 +-
>   .../drm/i915/gt/intel_execlists_submission.c  | 44 ++++++++++++++++++-
>   drivers/gpu/drm/i915/gt/intel_lrc.c           |  2 +
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  2 -
>   5 files changed, 52 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index fb33d0322960..35e87a7d0ea9 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -570,10 +570,6 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
>   	struct intel_engine_cs **siblings = NULL;
>   	intel_engine_mask_t prev_mask;
>   
> -	/* FIXME: This is NIY for execlists */
> -	if (!(intel_uc_uses_guc_submission(&i915->gt.uc)))
> -		return -ENODEV;
> -
>   	if (get_user(slot, &ext->engine_index))
>   		return -EFAULT;
>   
> @@ -583,6 +579,12 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
>   	if (get_user(num_siblings, &ext->num_siblings))
>   		return -EFAULT;
>   
> +	if (!intel_uc_uses_guc_submission(&i915->gt.uc) && num_siblings != 1) {
> +		drm_dbg(&i915->drm, "Only 1 sibling (%d) supported in non-GuC mode\n",
> +			num_siblings);
> +		return -EINVAL;
> +	}
> +
>   	if (slot >= set->num_engines) {
>   		drm_dbg(&i915->drm, "Invalid placement value, %d >= %d\n",
>   			slot, set->num_engines);
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 5634d14052bc..1bec92e1d8e6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -79,7 +79,8 @@ static int intel_context_active_acquire(struct intel_context *ce)
>   
>   	__i915_active_acquire(&ce->active);
>   
> -	if (intel_context_is_barrier(ce) || intel_engine_uses_guc(ce->engine))
> +	if (intel_context_is_barrier(ce) || intel_engine_uses_guc(ce->engine) ||
> +	    intel_context_is_parallel(ce))
>   		return 0;
>   
>   	/* Preallocate tracking nodes */
> @@ -563,7 +564,6 @@ void intel_context_bind_parent_child(struct intel_context *parent,
>   	 * Callers responsibility to validate that this function is used
>   	 * correctly but we use GEM_BUG_ON here ensure that they do.
>   	 */
> -	GEM_BUG_ON(!intel_engine_uses_guc(parent->engine));
>   	GEM_BUG_ON(intel_context_is_pinned(parent));
>   	GEM_BUG_ON(intel_context_is_child(parent));
>   	GEM_BUG_ON(intel_context_is_pinned(child));
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index bedb80057046..2865b422300d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -927,8 +927,7 @@ static void execlists_submit_ports(struct intel_engine_cs *engine)
>   
>   static bool ctx_single_port_submission(const struct intel_context *ce)
>   {
> -	return (IS_ENABLED(CONFIG_DRM_I915_GVT) &&
> -		intel_context_force_single_submission(ce));
> +	return intel_context_force_single_submission(ce);
I think this is actually going to break GVT.

Not so much this change here but the whole use of single submission 
outside of GVT. It looks like the GVT driver overloads the single 
submission flag to tag requests that it owns. If we start using that 
flag elsewhere when GVT is active, I think that will cause much 
confusion within the GVT code.

The correct fix would be to create a new flag just for GVT usage 
alongside the single submission one. GVT would then set both but only 
check for its own private flag. The parallel code would obviously only 
set the existing single submission flag.


>   }
>   
>   static bool can_merge_ctx(const struct intel_context *prev,
> @@ -2598,6 +2597,46 @@ static void execlists_context_cancel_request(struct intel_context *ce,
>   				      current->comm);
>   }
>   
> +static struct intel_context *
> +execlists_create_parallel(struct intel_engine_cs **engines,
> +			  unsigned int num_siblings,
> +			  unsigned int width)
> +{
> +	struct intel_context *parent = NULL, *ce, *err;
> +	int i;
> +
> +	GEM_BUG_ON(num_siblings != 1);
> +
> +	for (i = 0; i < width; ++i) {
> +		ce = intel_context_create(engines[i]);
> +		if (!ce) {
> +			err = ERR_PTR(-ENOMEM);
> +			goto unwind;
> +		}
> +
> +		if (i == 0)
> +			parent = ce;
> +		else
> +			intel_context_bind_parent_child(parent, ce);
> +	}
> +
> +	parent->parallel.fence_context = dma_fence_context_alloc(1);
> +
> +	intel_context_set_nopreempt(parent);
> +	intel_context_set_single_submission(parent);
Can you explain the need for setting single submission?

John.

> +	for_each_child(parent, ce) {
> +		intel_context_set_nopreempt(ce);
> +		intel_context_set_single_submission(ce);
> +	}
> +
> +	return parent;
> +
> +unwind:
> +	if (parent)
> +		intel_context_put(parent);
> +	return err;
> +}
> +
>   static const struct intel_context_ops execlists_context_ops = {
>   	.flags = COPS_HAS_INFLIGHT,
>   
> @@ -2616,6 +2655,7 @@ static const struct intel_context_ops execlists_context_ops = {
>   	.reset = lrc_reset,
>   	.destroy = lrc_destroy,
>   
> +	.create_parallel = execlists_create_parallel,
>   	.create_virtual = execlists_create_virtual,
>   };
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 56156cf18c41..70f4b309522d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -1065,6 +1065,8 @@ lrc_pin(struct intel_context *ce,
>   
>   void lrc_unpin(struct intel_context *ce)
>   {
> +	if (unlikely(ce->parallel.last_rq))
> +		i915_request_put(ce->parallel.last_rq);
>   	check_redzone((void *)ce->lrc_reg_state - LRC_STATE_OFFSET,
>   		      ce->engine);
>   }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 1341752dc70e..ddc9a97fcc8f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2961,8 +2961,6 @@ static void guc_parent_context_unpin(struct intel_context *ce)
>   	GEM_BUG_ON(!intel_context_is_parent(ce));
>   	GEM_BUG_ON(!intel_engine_is_virtual(ce->engine));
>   
> -	if (ce->parallel.last_rq)
> -		i915_request_put(ce->parallel.last_rq);
>   	unpin_guc_id(guc, ce);
>   	lrc_unpin(ce);
>   }

