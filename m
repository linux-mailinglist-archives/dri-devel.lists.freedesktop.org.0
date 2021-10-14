Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A7442E126
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 20:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37F26EBFE;
	Thu, 14 Oct 2021 18:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA876EBFE;
 Thu, 14 Oct 2021 18:25:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="208562732"
X-IronPort-AV: E=Sophos;i="5.85,373,1624345200"; d="scan'208";a="208562732"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 11:25:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,373,1624345200"; d="scan'208";a="487554317"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 14 Oct 2021 11:25:00 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 14 Oct 2021 11:25:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 14 Oct 2021 11:25:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 14 Oct 2021 11:24:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqKUbRrGOyUzCk0HVfDHaoNgaKYTrDbYlRsepXZVUU74ezCzUx/0Mho51ghd3GkdwzWZ7yq6jpQ8sndttDB6CgHTMSyCQ4ZTeifc79SjqZhzJK4n1NL1eQPTtCbIsi+6MxmR96xoXqHG+06WZt7VDg8GB497rXsOYeNqq1aL1PZRa1yfbbdNFXPZXkE9b11qpqfN46CD7KALinkXvaldPxOakIs3/FmBjgb632U1gVMdqZjegr81wswIZZT+22jkHRiPEGScjZS9gSjWsf0zav0ycWdCs1JZey3D45hlRz/vEzdhKQrvgpICvfYfz6JJUk/MPwRWVth3BbV5UrlvUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=paT+tAFwUHqto9EURmEVjSzJC4BhW6T3A/KdJgJXrjc=;
 b=EL3A5VSiYcxKvgOGx1gobO2H8SRv0QwVt8UFB2OLV8ajaEn+PPwr6KZgjynwqwg7uiHoF+IfHx0su4wz6rOFPApq3FOqONfdHAy9N5fUl8YWWTod/KL7xaPEG5cLS9BiVyU+bH8Y1MskZKUEqrzbWeDl/JwijIQaZq7WtyjDPQZy4udsTvK7HtOERbuoVj+me9p6qK0kc6gu9X0UvaNYhMzGwGbrS5l9dKtrfYyVOevfNvQi3KlipaH/PTx2xbqciqtj5KZB79eyqBM2XWbAfbX+BCK/7T4EjYeNvZQp28hMSaqz3AlgTG/OId+A+K3z2Eu9uwXh8HYnj9lfhFh4KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=paT+tAFwUHqto9EURmEVjSzJC4BhW6T3A/KdJgJXrjc=;
 b=ZvV8HcHS3kHpWG9X2XapcJ1xSj+XsuVytezCQaUwEFgL07SSit4/R02V3c5PUBx9YeuNB/zvnV1nijhEBAJNuqKOQdGX7x0FAWms1rmUxFtnHX1wQfC6gSJuvkRonlLzHjqK5W8AntX45ZJ1Q6X2HMFeMxvqjmLQwp9OiFAzwvQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5580.namprd11.prod.outlook.com (2603:10b6:510:e5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Thu, 14 Oct
 2021 18:24:58 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.026; Thu, 14 Oct 2021
 18:24:58 +0000
Subject: Re: [PATCH 16/25] drm/i915/guc: Connect UAPI to GuC multi-lrc
 interface
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211014172005.27155-1-matthew.brost@intel.com>
 <20211014172005.27155-17-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <73e367a1-c70e-3682-d423-6d5d1ac03d9d@intel.com>
Date: Thu, 14 Oct 2021 11:24:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211014172005.27155-17-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR10CA0056.namprd10.prod.outlook.com
 (2603:10b6:300:2c::18) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MWHPR10CA0056.namprd10.prod.outlook.com (2603:10b6:300:2c::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.14 via Frontend Transport; Thu, 14 Oct 2021 18:24:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d347996-cd5d-45ad-cc16-08d98f3fed65
X-MS-TrafficTypeDiagnostic: PH0PR11MB5580:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5580BA8F94C1BED65AB43C07BDB89@PH0PR11MB5580.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cOZGrpGKZxR375XLdf7rWkQFLoekmgnciF+5cadPj3nAajXjPi4hj3UsV0Bb7sAyZFaH2p+gvTPnOxnIsJ9M5JrqVbg9yIyU/KUxiO4uT4CW8ns0EsDK9A1espr9pzhliE+DN0uFpB0QND1A+U3ce3ZqiSdIj14kD/zu5NRpJlBaAN8VxTSucLJVr/NzyHk484INH9pUOYXJZqaAL13VIPdWvNB3aCyX+hoVQK5WoVvhXgsHBJrFrLBHrKiPIgFDNCYutf0NCNi8/XhJ7HW6+x2sJvcu5NjvLj/wCD6N//vrZlnPLThzQsiFqvU58AAvF03EWS/z40/USODyG/Q0py9ZJl15bdlSkei2fSr1vRknkRzL6AEs10IRHGtNbQs4TyAkM1Py/YlXXJHjtKSve+n8IbTGRN67BZNLfX6Hb3MH2fv0RY6664hjWOYoSMVdiU3nQ9V40DWR8TVz7VgpWeHk6fBmQrbnwewj6OmukfU5LgBYqCJ4lq92Bh2eaa2wiQ9jNbldbLL0MwGbREiXYXNmmxZ9vPViCIJx+VIlnDNcR1uwMRZrZ1U83dMQvCxSTO7lBhH6p/zT4VhiHYsenZM2Ww+vllmaAwA9YLMVCLxDP2e+kYC9lyDmv/Z86DyP3j592NojxLB0Klvs9OZZAKRF4OHnqoh3FSm2w7Hc0x8bCCF0+btIuLFEVDHQsTS1SFLiT0Y1h3esVzzy+3lgW9Yq3fFE21AQFaeyuYCpzD/INUr6R3ykLvK6B1G9D5OofPtOjaSLITEyBedU2qQOBJCSmhmmhYlbEUchy+kd1b3VRgPbBQqu+EjEilon/U1dMJLbMI2eA6+uje8+wORZL+kv8RSoBNwBUSQvPU2Ad2M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(86362001)(5660300002)(8676002)(316002)(31686004)(53546011)(6486002)(26005)(36756003)(2906002)(30864003)(66946007)(2616005)(66556008)(956004)(66476007)(38100700002)(186003)(508600001)(966005)(83380400001)(31696002)(16576012)(82960400001)(450100002)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU44dHVSV0xxUnlVQmFiLzU5L1kvUG5WV1ZVaWJFMnJOaXBtcFVnWE5SNDFD?=
 =?utf-8?B?cFBOakFSTXRXQm5KWW5EZmpwV05pcXVmMXMvQ1FKYmhvRlcxcDVBc2JlcjhW?=
 =?utf-8?B?MjhZdm4wbmVyUjJwR1RLSDhBUWV2eFVlR2JzODZXd1BkN1Q1aEpNWHF0eFIw?=
 =?utf-8?B?Z3hwVlAvS09RV25uWHVvM1ZLaE9CNTVEUVdFQU5TanRKbytmL3kxOE9IbUxl?=
 =?utf-8?B?Z216WVJrVnJiM3o5Q3hqeWdjVy9nbWJFNVA4VXJ3YWtIaXI3cGRPT1ZFVStz?=
 =?utf-8?B?K0pVbkVXTnFxMEh3eEdJcXpXNTErc1BnS3BGTzFoN2JmRzc2T21EN3h4Qlds?=
 =?utf-8?B?RlE4ZjhRNEpycHJhd3hTS2NraHkzTWp1Vi9MODNmL256NVlYOGY2Rlg2cUZL?=
 =?utf-8?B?VlRUL1NIUDQzb09Ic3l4Ym9xSHA3VzBGaWdCbVA1bWoySEcrSzZZQ3JlSDRW?=
 =?utf-8?B?cVRSTlM0YzhlcDFlai95a3BRdVdEL1VYSWZRSyswbFpCa25BSWJQMlVlbDVl?=
 =?utf-8?B?ekNtMG93MFRJWHRjVmZBdEtFdnRxeFFhSE0zY0h1VWxlL3E3YkFFc2g5a3V3?=
 =?utf-8?B?M0c1L2lTTTB3NTgxMGttbGROb2JBekVlZGlPY2JYeUNxTElyYXQ5dG5LWEVw?=
 =?utf-8?B?S2luMmk1b2MzR0x5aFNOdHVQbzZmWkxyZTNaN0pHcEZkNmYyVitkK21sZ1ZS?=
 =?utf-8?B?OXRUN3NadXE5aXI2TmgwaXFGdEo4YVNJYzBYck5wLzg1Yzg1ZjBzR3ZkNFAr?=
 =?utf-8?B?YVcxaHpMRGxoRzc1SVM2SDlHamltZWhNTWZJTXN3OU5DQlMxeUZ2ckdoWUpw?=
 =?utf-8?B?SHNRZHgrZ1RzMHBFMTFhT3pzZnM3Rk5nUmNucFA5dmNvdysyRmpmNFFrZ2I0?=
 =?utf-8?B?NVcxNzRQd2sxQ3RGS1IrbmFtdDduRVR3SzRDak83WWc0VWpiWThKU1B0dEhq?=
 =?utf-8?B?Q3IvTGVMcXdIRGxoNTQvQmN2YmZFanRnV29zTHl6b3FsdG5PekRUZE5pdlN4?=
 =?utf-8?B?RS9ub29TYXBJYjROZXdqWk9pcE1WRG9jaTFMTkxLM3JxY1R3SXpKZ2xaNHF0?=
 =?utf-8?B?UzJqcldYRHZFSlVYZDVLZmVlcjNSM0t6c2pEengreWd6ckFwMjIyVjluRnZi?=
 =?utf-8?B?b3p1ZENvUGtuV3VCRzg5YThrYm1YV2syNTZWM0lvNzJNRS9sNzZJKzVNQWZM?=
 =?utf-8?B?bVp4UlliOW1JcHJnMmdQckRLRmlIWExsWWlNcXhQRkJROTJGVjdhaFVEb01m?=
 =?utf-8?B?NzBEWXcvVGpvVGIwd2tzUDltV0d1bktDN0twM2NsRDZXZjlUYkpuRXZqZ2Fr?=
 =?utf-8?B?WDEyU3JORXVqd0t1bWY2NnloSGxRMG11SnNMUzlOK3llQi9rTmx6QzRHTU9V?=
 =?utf-8?B?U2xHWDVUNXlJV2l2aFQrblRvdzlNaEtjMWtzNWtHTnpLYmhubG1BTi9JemR0?=
 =?utf-8?B?cURUNDl4MTVMVmdraGZsa1ljOTRkMmpLTUZLTGlLaVFaKzJxY3ltc1M0Zm9C?=
 =?utf-8?B?T20vS3dtMm9jY1pUY1VVUUg5S0k0U0dHN1BlWW1DUXFHUVR2ak5nSDhTdERv?=
 =?utf-8?B?YW8vb2lKVjNVY2R0WEZJcUpCMnlXbUFuZjdXbHp2a2hGY3dneEFNL2ZRUmdt?=
 =?utf-8?B?V0V3VllLVCthR09sQXVaZVpoYS9OUUZ6S3dxaW5yZHQxNDdCa2orelYvOXRu?=
 =?utf-8?B?RHZKOHI1czNOelN5VVZxcTV6ckdUWGV2T0l3L2x3a3IzVW5SZ2puWkZpeWpL?=
 =?utf-8?Q?Wg/2undjAldFulSHeD5c1ywZ61W+yblGfkN1z5p?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d347996-cd5d-45ad-cc16-08d98f3fed65
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 18:24:57.9861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVVOSMZ2Yl/O51FXtI29F29u4J4K7eCi+6nu9V97EEe7ZY00k6MDf6ucPWX1PD6Q1PbFKKCNuEQlqKm/8TrdGsbIJL4fXGBWRG3bkBiwG2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5580
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

On 10/14/2021 10:19, Matthew Brost wrote:
> Introduce 'set parallel submit' extension to connect UAPI to GuC
> multi-lrc interface. Kernel doc in new uAPI should explain it all.
>
> IGT: https://patchwork.freedesktop.org/patch/447008/?series=93071&rev=1
> media UMD: https://github.com/intel/media-driver/pull/1252
>
> v2:
>   (Daniel Vetter)
>    - Add IGT link and placeholder for media UMD link
> v3:
>   (Kernel test robot)
>    - Fix warning in unpin engines call
>   (John Harrison)
>    - Reword a bunch of the kernel doc
> v4:
>   (John Harrison)
>    - Add comment why perma-pin is done after setting gem context
>    - Update some comments / docs for proto contexts
> v5:
>   (John Harrison)
>    - Rework perma-pin comment
>    - Add BUG_IN if context is pinned when setting gem context
IN?

>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c   | 230 +++++++++++++++++-
>   .../gpu/drm/i915/gem/i915_gem_context_types.h |  16 +-
>   drivers/gpu/drm/i915/gt/intel_context_types.h |   9 +-
>   drivers/gpu/drm/i915/gt/intel_engine.h        |  12 +-
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   6 +-
>   .../drm/i915/gt/intel_execlists_submission.c  |   6 +-
>   drivers/gpu/drm/i915/gt/selftest_execlists.c  |  12 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 114 ++++++++-
>   include/uapi/drm/i915_drm.h                   | 131 ++++++++++
>   9 files changed, 505 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index d225d3dd0b40..9a00f11fef46 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -556,9 +556,150 @@ set_proto_ctx_engines_bond(struct i915_user_extension __user *base, void *data)
>   	return 0;
>   }
>   
> +static int
> +set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
> +				      void *data)
> +{
> +	struct i915_context_engines_parallel_submit __user *ext =
> +		container_of_user(base, typeof(*ext), base);
> +	const struct set_proto_ctx_engines *set = data;
> +	struct drm_i915_private *i915 = set->i915;
> +	u64 flags;
> +	int err = 0, n, i, j;
> +	u16 slot, width, num_siblings;
> +	struct intel_engine_cs **siblings = NULL;
> +	intel_engine_mask_t prev_mask;
> +
> +	/* Disabling for now */
> +	return -ENODEV;
> +
> +	/* FIXME: This is NIY for execlists */
> +	if (!(intel_uc_uses_guc_submission(&i915->gt.uc)))
> +		return -ENODEV;
> +
> +	if (get_user(slot, &ext->engine_index))
> +		return -EFAULT;
> +
> +	if (get_user(width, &ext->width))
> +		return -EFAULT;
> +
> +	if (get_user(num_siblings, &ext->num_siblings))
> +		return -EFAULT;
> +
> +	if (slot >= set->num_engines) {
> +		drm_dbg(&i915->drm, "Invalid placement value, %d >= %d\n",
> +			slot, set->num_engines);
> +		return -EINVAL;
> +	}
> +
> +	if (set->engines[slot].type != I915_GEM_ENGINE_TYPE_INVALID) {
> +		drm_dbg(&i915->drm,
> +			"Invalid placement[%d], already occupied\n", slot);
> +		return -EINVAL;
> +	}
> +
> +	if (get_user(flags, &ext->flags))
> +		return -EFAULT;
> +
> +	if (flags) {
> +		drm_dbg(&i915->drm, "Unknown flags 0x%02llx", flags);
> +		return -EINVAL;
> +	}
> +
> +	for (n = 0; n < ARRAY_SIZE(ext->mbz64); n++) {
> +		err = check_user_mbz(&ext->mbz64[n]);
> +		if (err)
> +			return err;
> +	}
> +
> +	if (width < 2) {
> +		drm_dbg(&i915->drm, "Width (%d) < 2\n", width);
> +		return -EINVAL;
> +	}
> +
> +	if (num_siblings < 1) {
> +		drm_dbg(&i915->drm, "Number siblings (%d) < 1\n",
> +			num_siblings);
> +		return -EINVAL;
> +	}
> +
> +	siblings = kmalloc_array(num_siblings * width,
> +				 sizeof(*siblings),
> +				 GFP_KERNEL);
> +	if (!siblings)
> +		return -ENOMEM;
> +
> +	/* Create contexts / engines */
> +	for (i = 0; i < width; ++i) {
> +		intel_engine_mask_t current_mask = 0;
> +		struct i915_engine_class_instance prev_engine;
> +
> +		for (j = 0; j < num_siblings; ++j) {
> +			struct i915_engine_class_instance ci;
> +
> +			n = i * num_siblings + j;
> +			if (copy_from_user(&ci, &ext->engines[n], sizeof(ci))) {
> +				err = -EFAULT;
> +				goto out_err;
> +			}
> +
> +			siblings[n] =
> +				intel_engine_lookup_user(i915, ci.engine_class,
> +							 ci.engine_instance);
> +			if (!siblings[n]) {
> +				drm_dbg(&i915->drm,
> +					"Invalid sibling[%d]: { class:%d, inst:%d }\n",
> +					n, ci.engine_class, ci.engine_instance);
> +				err = -EINVAL;
> +				goto out_err;
> +			}
> +
> +			if (n) {
> +				if (prev_engine.engine_class !=
> +				    ci.engine_class) {
> +					drm_dbg(&i915->drm,
> +						"Mismatched class %d, %d\n",
> +						prev_engine.engine_class,
> +						ci.engine_class);
> +					err = -EINVAL;
> +					goto out_err;
> +				}
> +			}
> +
> +			prev_engine = ci;
> +			current_mask |= siblings[n]->logical_mask;
> +		}
> +
> +		if (i > 0) {
> +			if (current_mask != prev_mask << 1) {
> +				drm_dbg(&i915->drm,
> +					"Non contiguous logical mask 0x%x, 0x%x\n",
> +					prev_mask, current_mask);
> +				err = -EINVAL;
> +				goto out_err;
> +			}
> +		}
> +		prev_mask = current_mask;
> +	}
> +
> +	set->engines[slot].type = I915_GEM_ENGINE_TYPE_PARALLEL;
> +	set->engines[slot].num_siblings = num_siblings;
> +	set->engines[slot].width = width;
> +	set->engines[slot].siblings = siblings;
> +
> +	return 0;
> +
> +out_err:
> +	kfree(siblings);
> +
> +	return err;
> +}
> +
>   static const i915_user_extension_fn set_proto_ctx_engines_extensions[] = {
>   	[I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE] = set_proto_ctx_engines_balance,
>   	[I915_CONTEXT_ENGINES_EXT_BOND] = set_proto_ctx_engines_bond,
> +	[I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT] =
> +		set_proto_ctx_engines_parallel_submit,
>   };
>   
>   static int set_proto_ctx_engines(struct drm_i915_file_private *fpriv,
> @@ -794,6 +935,7 @@ static int intel_context_set_gem(struct intel_context *ce,
>   	GEM_BUG_ON(rcu_access_pointer(ce->gem_context));
>   	RCU_INIT_POINTER(ce->gem_context, ctx);
>   
> +	GEM_BUG_ON(intel_context_is_pinned(ce));
>   	ce->ring_size = SZ_16K;
>   
>   	i915_vm_put(ce->vm);
> @@ -818,6 +960,25 @@ static int intel_context_set_gem(struct intel_context *ce,
>   	return ret;
>   }
>   
> +static void __unpin_engines(struct i915_gem_engines *e, unsigned int count)
> +{
> +	while (count--) {
> +		struct intel_context *ce = e->engines[count], *child;
> +
> +		if (!ce || !test_bit(CONTEXT_PERMA_PIN, &ce->flags))
> +			continue;
> +
> +		for_each_child(ce, child)
> +			intel_context_unpin(child);
> +		intel_context_unpin(ce);
> +	}
> +}
> +
> +static void unpin_engines(struct i915_gem_engines *e)
> +{
> +	__unpin_engines(e, e->num_engines);
> +}
> +
>   static void __free_engines(struct i915_gem_engines *e, unsigned int count)
>   {
>   	while (count--) {
> @@ -933,6 +1094,40 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx,
>   	return err;
>   }
>   
> +static int perma_pin_contexts(struct intel_context *ce)
> +{
> +	struct intel_context *child;
> +	int i = 0, j = 0, ret;
> +
> +	GEM_BUG_ON(!intel_context_is_parent(ce));
> +
> +	ret = intel_context_pin(ce);
> +	if (unlikely(ret))
> +		return ret;
> +
> +	for_each_child(ce, child) {
> +		ret = intel_context_pin(child);
> +		if (unlikely(ret))
> +			goto unwind;
> +		++i;
> +	}
> +
> +	set_bit(CONTEXT_PERMA_PIN, &ce->flags);
> +
> +	return 0;
> +
> +unwind:
> +	intel_context_unpin(ce);
> +	for_each_child(ce, child) {
> +		if (j++ < i)
> +			intel_context_unpin(child);
> +		else
> +			break;
> +	}
> +
> +	return ret;
> +}
> +
>   static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>   					     unsigned int num_engines,
>   					     struct i915_gem_proto_engine *pe)
> @@ -946,7 +1141,7 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>   	e->num_engines = num_engines;
>   
>   	for (n = 0; n < num_engines; n++) {
> -		struct intel_context *ce;
> +		struct intel_context *ce, *child;
>   		int ret;
>   
>   		switch (pe[n].type) {
> @@ -956,7 +1151,13 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>   
>   		case I915_GEM_ENGINE_TYPE_BALANCED:
>   			ce = intel_engine_create_virtual(pe[n].siblings,
> -							 pe[n].num_siblings);
> +							 pe[n].num_siblings, 0);
> +			break;
> +
> +		case I915_GEM_ENGINE_TYPE_PARALLEL:
> +			ce = intel_engine_create_parallel(pe[n].siblings,
> +							  pe[n].num_siblings,
> +							  pe[n].width);
>   			break;
>   
>   		case I915_GEM_ENGINE_TYPE_INVALID:
> @@ -977,6 +1178,30 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>   			err = ERR_PTR(ret);
>   			goto free_engines;
>   		}
> +		for_each_child(ce, child) {
> +			ret = intel_context_set_gem(child, ctx, pe->sseu);
> +			if (ret) {
> +				err = ERR_PTR(ret);
> +				goto free_engines;
> +			}
> +		}
> +
> +		/*
> +		 * XXX: Must be done after calling intel_context_set_gem as that
> +		 * function changes the ring size. The ring is allocated when
> +		 * the context is pinned. If the ring size is changed after
> +		 * allocation we have a mismatch of the ring size and will cause
> +		 * the context to hang. Presumably with a bit of reordering we
> +		 * could move the perma-pin step to the backend function
> +		 * intel_engine_create_parallel.
> +		 */
> +		if (pe[n].type == I915_GEM_ENGINE_TYPE_PARALLEL) {
> +			ret = perma_pin_contexts(ce);
> +			if (ret) {
> +				err = ERR_PTR(ret);
> +				goto free_engines;
> +			}
> +		}
>   	}
>   
>   	return e;
> @@ -1219,6 +1444,7 @@ static void context_close(struct i915_gem_context *ctx)
>   
>   	/* Flush any concurrent set_engines() */
>   	mutex_lock(&ctx->engines_mutex);
> +	unpin_engines(__context_engines_static(ctx));
>   	engines_idle_release(ctx, rcu_replace_pointer(ctx->engines, NULL, 1));
>   	i915_gem_context_set_closed(ctx);
>   	mutex_unlock(&ctx->engines_mutex);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> index a627b09c4680..282cdb8a5c5a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> @@ -78,13 +78,16 @@ enum i915_gem_engine_type {
>   
>   	/** @I915_GEM_ENGINE_TYPE_BALANCED: A load-balanced engine set */
>   	I915_GEM_ENGINE_TYPE_BALANCED,
> +
> +	/** @I915_GEM_ENGINE_TYPE_PARALLEL: A parallel engine set */
> +	I915_GEM_ENGINE_TYPE_PARALLEL,
>   };
>   
>   /**
>    * struct i915_gem_proto_engine - prototype engine
>    *
>    * This struct describes an engine that a context may contain.  Engines
> - * have three types:
> + * have four types:
>    *
>    *  - I915_GEM_ENGINE_TYPE_INVALID: Invalid engines can be created but they
>    *    show up as a NULL in i915_gem_engines::engines[i] and any attempt to
> @@ -97,6 +100,10 @@ enum i915_gem_engine_type {
>    *
>    *  - I915_GEM_ENGINE_TYPE_BALANCED: A load-balanced engine set, described
>    *    i915_gem_proto_engine::num_siblings and i915_gem_proto_engine::siblings.
> + *
> + *  - I915_GEM_ENGINE_TYPE_PARALLEL: A parallel submission engine set, described
> + *    i915_gem_proto_engine::width, i915_gem_proto_engine::num_siblings, and
> + *    i915_gem_proto_engine::siblings.
>    */
>   struct i915_gem_proto_engine {
>   	/** @type: Type of this engine */
> @@ -105,10 +112,13 @@ struct i915_gem_proto_engine {
>   	/** @engine: Engine, for physical */
>   	struct intel_engine_cs *engine;
>   
> -	/** @num_siblings: Number of balanced siblings */
> +	/** @num_siblings: Number of balanced or parallel siblings */
>   	unsigned int num_siblings;
>   
> -	/** @siblings: Balanced siblings */
> +	/** @width: Width of each sibling */
> +	unsigned int width;
> +
> +	/** @siblings: Balanced siblings or num_siblings * width for parallel */
>   	struct intel_engine_cs **siblings;
>   
>   	/** @sseu: Client-set SSEU parameters */
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 8309d1141d0a..1d880303a7e4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -55,9 +55,13 @@ struct intel_context_ops {
>   	void (*reset)(struct intel_context *ce);
>   	void (*destroy)(struct kref *kref);
>   
> -	/* virtual engine/context interface */
> +	/* virtual/parallel engine/context interface */
>   	struct intel_context *(*create_virtual)(struct intel_engine_cs **engine,
> -						unsigned int count);
> +						unsigned int count,
> +						unsigned long flags);
> +	struct intel_context *(*create_parallel)(struct intel_engine_cs **engines,
> +						 unsigned int num_siblings,
> +						 unsigned int width);
>   	struct intel_engine_cs *(*get_sibling)(struct intel_engine_cs *engine,
>   					       unsigned int sibling);
>   };
> @@ -113,6 +117,7 @@ struct intel_context {
>   #define CONTEXT_NOPREEMPT		8
>   #define CONTEXT_LRCA_DIRTY		9
>   #define CONTEXT_GUC_INIT		10
> +#define CONTEXT_PERMA_PIN		11
>   
>   	struct {
>   		u64 timeout_us;
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> index d5ac49c0691e..08559ace0ada 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> @@ -282,9 +282,19 @@ intel_engine_has_preempt_reset(const struct intel_engine_cs *engine)
>   	return intel_engine_has_preemption(engine);
>   }
>   
> +#define FORCE_VIRTUAL	BIT(0)
>   struct intel_context *
>   intel_engine_create_virtual(struct intel_engine_cs **siblings,
> -			    unsigned int count);
> +			    unsigned int count, unsigned long flags);
> +
> +static inline struct intel_context *
> +intel_engine_create_parallel(struct intel_engine_cs **engines,
> +			     unsigned int num_engines,
> +			     unsigned int width)
> +{
> +	GEM_BUG_ON(!engines[0]->cops->create_parallel);
> +	return engines[0]->cops->create_parallel(engines, num_engines, width);
> +}
>   
>   static inline bool
>   intel_virtual_engine_has_heartbeat(const struct intel_engine_cs *engine)
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 2eb798ad068b..ff6753ccb129 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -1953,16 +1953,16 @@ ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine, ktime_t *now)
>   
>   struct intel_context *
>   intel_engine_create_virtual(struct intel_engine_cs **siblings,
> -			    unsigned int count)
> +			    unsigned int count, unsigned long flags)
>   {
>   	if (count == 0)
>   		return ERR_PTR(-EINVAL);
>   
> -	if (count == 1)
> +	if (count == 1 && !(flags & FORCE_VIRTUAL))
>   		return intel_context_create(siblings[0]);
>   
>   	GEM_BUG_ON(!siblings[0]->cops->create_virtual);
> -	return siblings[0]->cops->create_virtual(siblings, count);
> +	return siblings[0]->cops->create_virtual(siblings, count, flags);
>   }
>   
>   struct i915_request *
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 43a74b216efb..bedb80057046 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -201,7 +201,8 @@ static struct virtual_engine *to_virtual_engine(struct intel_engine_cs *engine)
>   }
>   
>   static struct intel_context *
> -execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
> +execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
> +			 unsigned long flags);
>   
>   static struct i915_request *
>   __active_request(const struct intel_timeline * const tl,
> @@ -3784,7 +3785,8 @@ static void virtual_submit_request(struct i915_request *rq)
>   }
>   
>   static struct intel_context *
> -execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
> +execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
> +			 unsigned long flags)
>   {
>   	struct virtual_engine *ve;
>   	unsigned int n;
> diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> index 25a8c4f62b0d..b367ecfa42de 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> @@ -3733,7 +3733,7 @@ static int nop_virtual_engine(struct intel_gt *gt,
>   	GEM_BUG_ON(!nctx || nctx > ARRAY_SIZE(ve));
>   
>   	for (n = 0; n < nctx; n++) {
> -		ve[n] = intel_engine_create_virtual(siblings, nsibling);
> +		ve[n] = intel_engine_create_virtual(siblings, nsibling, 0);
>   		if (IS_ERR(ve[n])) {
>   			err = PTR_ERR(ve[n]);
>   			nctx = n;
> @@ -3929,7 +3929,7 @@ static int mask_virtual_engine(struct intel_gt *gt,
>   	 * restrict it to our desired engine within the virtual engine.
>   	 */
>   
> -	ve = intel_engine_create_virtual(siblings, nsibling);
> +	ve = intel_engine_create_virtual(siblings, nsibling, 0);
>   	if (IS_ERR(ve)) {
>   		err = PTR_ERR(ve);
>   		goto out_close;
> @@ -4060,7 +4060,7 @@ static int slicein_virtual_engine(struct intel_gt *gt,
>   		i915_request_add(rq);
>   	}
>   
> -	ce = intel_engine_create_virtual(siblings, nsibling);
> +	ce = intel_engine_create_virtual(siblings, nsibling, 0);
>   	if (IS_ERR(ce)) {
>   		err = PTR_ERR(ce);
>   		goto out;
> @@ -4112,7 +4112,7 @@ static int sliceout_virtual_engine(struct intel_gt *gt,
>   
>   	/* XXX We do not handle oversubscription and fairness with normal rq */
>   	for (n = 0; n < nsibling; n++) {
> -		ce = intel_engine_create_virtual(siblings, nsibling);
> +		ce = intel_engine_create_virtual(siblings, nsibling, 0);
>   		if (IS_ERR(ce)) {
>   			err = PTR_ERR(ce);
>   			goto out;
> @@ -4214,7 +4214,7 @@ static int preserved_virtual_engine(struct intel_gt *gt,
>   	if (err)
>   		goto out_scratch;
>   
> -	ve = intel_engine_create_virtual(siblings, nsibling);
> +	ve = intel_engine_create_virtual(siblings, nsibling, 0);
>   	if (IS_ERR(ve)) {
>   		err = PTR_ERR(ve);
>   		goto out_scratch;
> @@ -4354,7 +4354,7 @@ static int reset_virtual_engine(struct intel_gt *gt,
>   	if (igt_spinner_init(&spin, gt))
>   		return -ENOMEM;
>   
> -	ve = intel_engine_create_virtual(siblings, nsibling);
> +	ve = intel_engine_create_virtual(siblings, nsibling, 0);
>   	if (IS_ERR(ve)) {
>   		err = PTR_ERR(ve);
>   		goto out_spin;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 938dc34e8d3a..7c12364a017a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -124,7 +124,13 @@ struct guc_virtual_engine {
>   };
>   
>   static struct intel_context *
> -guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
> +guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
> +		   unsigned long flags);
> +
> +static struct intel_context *
> +guc_create_parallel(struct intel_engine_cs **engines,
> +		    unsigned int num_siblings,
> +		    unsigned int width);
>   
>   #define GUC_REQUEST_SIZE 64 /* bytes */
>   
> @@ -2609,6 +2615,7 @@ static const struct intel_context_ops guc_context_ops = {
>   	.destroy = guc_context_destroy,
>   
>   	.create_virtual = guc_create_virtual,
> +	.create_parallel = guc_create_parallel,
>   };
>   
>   static void submit_work_cb(struct irq_work *wrk)
> @@ -2858,8 +2865,6 @@ static const struct intel_context_ops virtual_guc_context_ops = {
>   	.get_sibling = guc_virtual_get_sibling,
>   };
>   
> -/* Future patches will use this function */
> -__maybe_unused
>   static int guc_parent_context_pin(struct intel_context *ce, void *vaddr)
>   {
>   	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
> @@ -2876,8 +2881,6 @@ static int guc_parent_context_pin(struct intel_context *ce, void *vaddr)
>   	return __guc_context_pin(ce, engine, vaddr);
>   }
>   
> -/* Future patches will use this function */
> -__maybe_unused
>   static int guc_child_context_pin(struct intel_context *ce, void *vaddr)
>   {
>   	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
> @@ -2889,8 +2892,6 @@ static int guc_child_context_pin(struct intel_context *ce, void *vaddr)
>   	return __guc_context_pin(ce, engine, vaddr);
>   }
>   
> -/* Future patches will use this function */
> -__maybe_unused
>   static void guc_parent_context_unpin(struct intel_context *ce)
>   {
>   	struct intel_guc *guc = ce_to_guc(ce);
> @@ -2906,8 +2907,6 @@ static void guc_parent_context_unpin(struct intel_context *ce)
>   	lrc_unpin(ce);
>   }
>   
> -/* Future patches will use this function */
> -__maybe_unused
>   static void guc_child_context_unpin(struct intel_context *ce)
>   {
>   	GEM_BUG_ON(context_enabled(ce));
> @@ -2918,8 +2917,6 @@ static void guc_child_context_unpin(struct intel_context *ce)
>   	lrc_unpin(ce);
>   }
>   
> -/* Future patches will use this function */
> -__maybe_unused
>   static void guc_child_context_post_unpin(struct intel_context *ce)
>   {
>   	GEM_BUG_ON(!intel_context_is_child(ce));
> @@ -2930,6 +2927,98 @@ static void guc_child_context_post_unpin(struct intel_context *ce)
>   	intel_context_unpin(ce->parallel.parent);
>   }
>   
> +static void guc_child_context_destroy(struct kref *kref)
> +{
> +	struct intel_context *ce = container_of(kref, typeof(*ce), ref);
> +
> +	__guc_context_destroy(ce);
> +}
> +
> +static const struct intel_context_ops virtual_parent_context_ops = {
> +	.alloc = guc_virtual_context_alloc,
> +
> +	.pre_pin = guc_context_pre_pin,
> +	.pin = guc_parent_context_pin,
> +	.unpin = guc_parent_context_unpin,
> +	.post_unpin = guc_context_post_unpin,
> +
> +	.ban = guc_context_ban,
> +
> +	.cancel_request = guc_context_cancel_request,
> +
> +	.enter = guc_virtual_context_enter,
> +	.exit = guc_virtual_context_exit,
> +
> +	.sched_disable = guc_context_sched_disable,
> +
> +	.destroy = guc_context_destroy,
> +
> +	.get_sibling = guc_virtual_get_sibling,
> +};
> +
> +static const struct intel_context_ops virtual_child_context_ops = {
> +	.alloc = guc_virtual_context_alloc,
> +
> +	.pre_pin = guc_context_pre_pin,
> +	.pin = guc_child_context_pin,
> +	.unpin = guc_child_context_unpin,
> +	.post_unpin = guc_child_context_post_unpin,
> +
> +	.cancel_request = guc_context_cancel_request,
> +
> +	.enter = guc_virtual_context_enter,
> +	.exit = guc_virtual_context_exit,
> +
> +	.destroy = guc_child_context_destroy,
> +
> +	.get_sibling = guc_virtual_get_sibling,
> +};
> +
> +static struct intel_context *
> +guc_create_parallel(struct intel_engine_cs **engines,
> +		    unsigned int num_siblings,
> +		    unsigned int width)
> +{
> +	struct intel_engine_cs **siblings = NULL;
> +	struct intel_context *parent = NULL, *ce, *err;
> +	int i, j;
> +
> +	siblings = kmalloc_array(num_siblings,
> +				 sizeof(*siblings),
> +				 GFP_KERNEL);
> +	if (!siblings)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (i = 0; i < width; ++i) {
> +		for (j = 0; j < num_siblings; ++j)
> +			siblings[j] = engines[i * num_siblings + j];
> +
> +		ce = intel_engine_create_virtual(siblings, num_siblings,
> +						 FORCE_VIRTUAL);
> +		if (!ce) {
> +			err = ERR_PTR(-ENOMEM);
> +			goto unwind;
> +		}
> +
> +		if (i == 0) {
> +			parent = ce;
> +			parent->ops = &virtual_parent_context_ops;
> +		} else {
> +			ce->ops = &virtual_child_context_ops;
> +			intel_context_bind_parent_child(parent, ce);
> +		}
> +	}
> +
> +	kfree(siblings);
> +	return parent;
> +
> +unwind:
> +	if (parent)
> +		intel_context_put(parent);
> +	kfree(siblings);
> +	return err;
> +}
> +
>   static bool
>   guc_irq_enable_breadcrumbs(struct intel_breadcrumbs *b)
>   {
> @@ -3756,7 +3845,8 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
>   }
>   
>   static struct intel_context *
> -guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
> +guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
> +		   unsigned long flags)
>   {
>   	struct guc_virtual_engine *ve;
>   	struct intel_guc *guc;
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 0179f92e0916..c2a63e1584cb 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -1824,6 +1824,7 @@ struct drm_i915_gem_context_param {
>    * Extensions:
>    *   i915_context_engines_load_balance (I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE)
>    *   i915_context_engines_bond (I915_CONTEXT_ENGINES_EXT_BOND)
> + *   i915_context_engines_parallel_submit (I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT)
>    */
>   #define I915_CONTEXT_PARAM_ENGINES	0xa
>   
> @@ -2098,6 +2099,135 @@ struct i915_context_engines_bond {
>   	struct i915_engine_class_instance engines[N__]; \
>   } __attribute__((packed)) name__
>   
> +/**
> + * struct i915_context_engines_parallel_submit - Configure engine for
> + * parallel submission.
> + *
> + * Setup a slot in the context engine map to allow multiple BBs to be submitted
> + * in a single execbuf IOCTL. Those BBs will then be scheduled to run on the GPU
> + * in parallel. Multiple hardware contexts are created internally in the i915 to
> + * run these BBs. Once a slot is configured for N BBs only N BBs can be
> + * submitted in each execbuf IOCTL and this is implicit behavior e.g. The user
> + * doesn't tell the execbuf IOCTL there are N BBs, the execbuf IOCTL knows how
> + * many BBs there are based on the slot's configuration. The N BBs are the last
> + * N buffer objects or first N if I915_EXEC_BATCH_FIRST is set.
> + *
> + * The default placement behavior is to create implicit bonds between each
> + * context if each context maps to more than 1 physical engine (e.g. context is
> + * a virtual engine). Also we only allow contexts of same engine class and these
> + * contexts must be in logically contiguous order. Examples of the placement
> + * behavior are described below. Lastly, the default is to not allow BBs to be
> + * preempted mid-batch. Rather insert coordinated preemption points on all
> + * hardware contexts between each set of BBs. Flags could be added in the future
> + * to change both of these default behaviors.
> + *
> + * Returns -EINVAL if hardware context placement configuration is invalid or if
> + * the placement configuration isn't supported on the platform / submission
> + * interface.
> + * Returns -ENODEV if extension isn't supported on the platform / submission
> + * interface.
> + *
> + * .. code-block:: none
> + *
> + *	Examples syntax:
> + *	CS[X] = generic engine of same class, logical instance X
> + *	INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> + *
> + *	Example 1 pseudo code:
> + *	set_engines(INVALID)
> + *	set_parallel(engine_index=0, width=2, num_siblings=1,
> + *		     engines=CS[0],CS[1])
> + *
> + *	Results in the following valid placement:
> + *	CS[0], CS[1]
> + *
> + *	Example 2 pseudo code:
> + *	set_engines(INVALID)
> + *	set_parallel(engine_index=0, width=2, num_siblings=2,
> + *		     engines=CS[0],CS[2],CS[1],CS[3])
> + *
> + *	Results in the following valid placements:
> + *	CS[0], CS[1]
> + *	CS[2], CS[3]
> + *
> + *	This can be thought of as two virtual engines, each containing two
> + *	engines thereby making a 2D array. However, there are bonds tying the
> + *	entries together and placing restrictions on how they can be scheduled.
> + *	Specifically, the scheduler can choose only vertical columns from the 2D
> + *	array. That is, CS[0] is bonded to CS[1] and CS[2] to CS[3]. So if the
> + *	scheduler wants to submit to CS[0], it must also choose CS[1] and vice
> + *	versa. Same for CS[2] requires also using CS[3].
> + *	VE[0] = CS[0], CS[2]
> + *	VE[1] = CS[1], CS[3]
> + *
> + *	Example 3 pseudo code:
> + *	set_engines(INVALID)
> + *	set_parallel(engine_index=0, width=2, num_siblings=2,
> + *		     engines=CS[0],CS[1],CS[1],CS[3])
> + *
> + *	Results in the following valid and invalid placements:
> + *	CS[0], CS[1]
> + *	CS[1], CS[3] - Not logically contiguous, return -EINVAL
> + */
> +struct i915_context_engines_parallel_submit {
> +	/**
> +	 * @base: base user extension.
> +	 */
> +	struct i915_user_extension base;
> +
> +	/**
> +	 * @engine_index: slot for parallel engine
> +	 */
> +	__u16 engine_index;
> +
> +	/**
> +	 * @width: number of contexts per parallel engine or in other words the
> +	 * number of batches in each submission
> +	 */
> +	__u16 width;
> +
> +	/**
> +	 * @num_siblings: number of siblings per context or in other words the
> +	 * number of possible placements for each submission
> +	 */
> +	__u16 num_siblings;
> +
> +	/**
> +	 * @mbz16: reserved for future use; must be zero
> +	 */
> +	__u16 mbz16;
> +
> +	/**
> +	 * @flags: all undefined flags must be zero, currently not defined flags
> +	 */
> +	__u64 flags;
> +
> +	/**
> +	 * @mbz64: reserved for future use; must be zero
> +	 */
> +	__u64 mbz64[3];
> +
> +	/**
> +	 * @engines: 2-d array of engine instances to configure parallel engine
> +	 *
> +	 * length = width (i) * num_siblings (j)
> +	 * index = j + i * num_siblings
> +	 */
> +	struct i915_engine_class_instance engines[0];
> +
> +} __packed;
> +
> +#define I915_DEFINE_CONTEXT_ENGINES_PARALLEL_SUBMIT(name__, N__) struct { \
> +	struct i915_user_extension base; \
> +	__u16 engine_index; \
> +	__u16 width; \
> +	__u16 num_siblings; \
> +	__u16 mbz16; \
> +	__u64 flags; \
> +	__u64 mbz64[3]; \
> +	struct i915_engine_class_instance engines[N__]; \
> +} __attribute__((packed)) name__
> +
>   /**
>    * DOC: Context Engine Map uAPI
>    *
> @@ -2157,6 +2287,7 @@ struct i915_context_param_engines {
>   	__u64 extensions; /* linked chain of extension blocks, 0 terminates */
>   #define I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE 0 /* see i915_context_engines_load_balance */
>   #define I915_CONTEXT_ENGINES_EXT_BOND 1 /* see i915_context_engines_bond */
> +#define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context_engines_parallel_submit */
>   	struct i915_engine_class_instance engines[0];
>   } __attribute__((packed));
>   

