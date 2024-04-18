Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 068268AA5CA
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 01:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB2F10F552;
	Thu, 18 Apr 2024 23:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sr8Nof18";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B87210EE10;
 Thu, 18 Apr 2024 23:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713482873; x=1745018873;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WCOH+kYFTt/W3chsq8NPwQgzYK58knr+hsOGN0z1hLI=;
 b=Sr8Nof185XKoJ5wRSAcQ++n378frMYzYxj22OmAr18ieZ66jo0Zf6VR/
 4JjEj6Mv1KsqMGCSqlAwKXwyySp2UmjoRQcU/3vYnNkoeTFko02uOlSaI
 aZJ9JGjSlPIVCRGKIbPo33L8zaNmsJmRcdsOYOKhfDLUVasP4uAUyf4fj
 hIR1ySphRrJDBTaqOkr4e73eA2jn+LP2AGfXCgwQupKug/R4lD/vao8rf
 SSlVOYFMU3ypmdVw7ZbhkVyRyb/dbxQGMXiaBxgPHcl3tqyCRZ0Mw7NKi
 c4ufzIPctgEdNZt6trCC4HAgO+ilBi2lVNAHTrSikPbgZ4r4ailBZDlT9 Q==;
X-CSE-ConnectionGUID: Rif3yLuAQ7aCN18TGcjj2A==
X-CSE-MsgGUID: QYSRGxxsSDqm3SD8SGrvAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9225743"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9225743"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 16:27:26 -0700
X-CSE-ConnectionGUID: oLt/ZHiLRlSEF+vn7+cemQ==
X-CSE-MsgGUID: tgYc1dW5QJSydr98H5mjbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23211641"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 16:27:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 16:27:25 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 16:27:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 16:27:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 16:27:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/QI5aP22F0l/W+9+IehIUkGwHVHnttGkCmtpL0MRLqKBvWYg2d+BRUPdL666c2bcyds0XtVnAvljZLWhfcc4a9t1UnliLUnc/e1DJmdaNoSd2DZom5y0QVxp75RpOkmzYOfSqDEFmRK2hJ4jS5dei68IYlkce979yk9pn9N0S1ZjjEHR2krUtDGUFpANJiWfja3pl1vqHvdsvUcm+Bs5wRQhiE4E1SshB71goXS/G3G5hpjG5Ve2t/rC2s2xzdHBtqVr4ghw6la7ljQhmj/h9V40qBv4DGjn71aJuRVFxnzhvGZmdI1gDikMHr5O2/HX8sWGSfGDQeKbp/0yHal6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LWRnHU3EsymHwfhZIqkJaBM2jLb5NKPkYjL4A+dgow=;
 b=WusuU9UYqlUvQ0TbUfoipDcsnZ77NqlUn9KW7N7wuscZ2KYmOrAlI/IHWTn+0etxSa06OdymPdtbOlkSobJicTgfjWmKDn81pRX4MogiCpMnzQL6z/LKb+IVUkbeRHBmQRB1M+6CQZxXunKhq22GhvzyZFVQ8qrUdTuq8qM+X7UxU0e50xBBAiuiHCUipY6TKImDnLnekKffcS6Ycl3vNAEZBrK+cR3uD7vvTg8KkaE/uiyySQ6sjhFW0oG+EBsvZMmxWCkxS6eshgybmGTz0DGsQyGj59qAkWXGwq5mf83k7sVQ6a0Cs90mmW4MOCkKUQ69DOcPlS/CaEzOKbMvSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8450.namprd11.prod.outlook.com (2603:10b6:a03:578::13)
 by SA1PR11MB8448.namprd11.prod.outlook.com (2603:10b6:806:3a3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.12; Thu, 18 Apr
 2024 23:27:22 +0000
Received: from SJ2PR11MB8450.namprd11.prod.outlook.com
 ([fe80::ccc5:e88:3bcf:edf2]) by SJ2PR11MB8450.namprd11.prod.outlook.com
 ([fe80::ccc5:e88:3bcf:edf2%3]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 23:27:22 +0000
Message-ID: <df2b36db-5f16-4e93-9ba1-23f3720d24ad@intel.com>
Date: Thu, 18 Apr 2024 16:27:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/i915: Refactor confusing __intel_gt_reset()
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20240418171055.31371-1-nirmoy.das@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240418171055.31371-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::21) To SJ2PR11MB8450.namprd11.prod.outlook.com
 (2603:10b6:a03:578::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8450:EE_|SA1PR11MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f7d2a45-84a9-45b9-b6f4-08dc5fff1906
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: XGp7LnQYFMQiaQS04/NSFwm/vdrEZlbB8rMneI97vTjqjCqG7riZCf6AAdDsUjqNGrogImxIMo23BDDcYO6bE4utXhCATt5hInRle/2qDpE0nROLdmOKhDPhX+8obhFkBnMPUJ9BiaIurq65l8lN/mvvw4j291XLT9VlmnOdP9zXkIPiZ2GXVdZyA2kdeR57EJcxw8DgmK7JqLybGAr57DBjhuNKMSTOMgVh9KAhTerKwZ2HrIanq9cnkYnpX4+Bun6RhLCu+rQRZy2Knn0hG1HqbRK4kWkUNvBqOuVISFydP8HgXzcBG3Omp8dE2JT6ou9Bm810keO8X1uUHZ8NNGNwoy58XIhcaYCUHk5uEkpk8iymRMmgiOFy2G9o1P2HfKsJmyuatXWEdvZw4DicIYkq+L4STrsJiHzfIs+naVyqA54StYqJs/QarNCCp/qvla//aMZyAtWtLhdZ8GapqLl5juwuR3KLv+oeaCeaSqE4jKQ1HdPiBvkFxnslsyv6FGJBAzwWb2k5Yi7ZJFy7yM8cjPvjoFL1y+hP4PWRBt7xuBPdmISk3GzBSGKbjwUQcrfIbMwnwvLNowAJz6M8zdKxHrNEHFFC3ywupyVcrqol3o/nArtZAZoNrVMJepj2G4rq9XmfRhLv96RR6NAlgBHaEUiMvF+NJOOX1zQczBQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB8450.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEtPRG9waFRWbS8xWVB2QXhSdlFFd1MweksxcEtGKytHVmxjUnpmWU9mNzlo?=
 =?utf-8?B?R2FqVTBxVDdkbkV4NlpHYm9pYmxISlhlc3dvbzBScEorVzNNeW1sTEhvV05o?=
 =?utf-8?B?NFpuUmlvRDRBTVB5aUVhOEVVWjhXeHVUOEdSajJCV0FTR1RDWGdIZk54YW51?=
 =?utf-8?B?RXRieW5KUFZOYXg1a1kzUTJ5c3hUWVlPcU5TUkVCMWJGQklzZzVsSmU3SFJ1?=
 =?utf-8?B?bkRhdzl3RkhSaDFqak9RTFI0L1Z3eHdlTERhaUlGMGU2QWhCRU1GcHB0Ykoy?=
 =?utf-8?B?UmpwbDFSOEZ5WGhiUEMrY1A3TlBUUWZ6NURrZlZQV2RTSlZrSk5CTFhZZzVx?=
 =?utf-8?B?TUdiVzliNzExOXIvbnlRcHNSUWVuZVNoc3dodVpnMVZlQlFTTjZCTDRISm1j?=
 =?utf-8?B?T20wYTZ6NW0zWGZScEFBbjB0aDVKSnBkNUhQRDg4WFljN2dJK25OZlZhNGo1?=
 =?utf-8?B?ZmtWdzZvYUFNQm9zWnYwUHNvUmR2WDFwZ0ZlUmllN2xXYjUvbFRPVHhyRkxv?=
 =?utf-8?B?OWk1M0tQOG0vWUlsQU5hVlVNcGcyQVZPQ254NDlIb01tMVptQm1yRWpKejRO?=
 =?utf-8?B?UEZqdnJ6c08xUVdtVjV3NHkyVTFmNVVHRVhFWWFWUnU2WWN6Nzg3T0Z1eXZS?=
 =?utf-8?B?WUJJaGtzcytPQXY0djVLdUtyQlRBTkZvSWJNcnNJaTNrZDVISlhRZFkyRDds?=
 =?utf-8?B?QzJzUjdwY0RMaU5jYTBudUxIS25hM3laMGphS2IzVHlKaDhyM0ljeTJHKzA5?=
 =?utf-8?B?TTZScFNVZFp6VEtBV0N6NmZxb0JjRTU5UjVOZDA1K3o5K3hzbXJGOE1LN1h1?=
 =?utf-8?B?bDlRY1o5czgvSDRwWG9kdHFLa1pLTWt3Y200c1RIZ3U2S3RrUHlXU0ZBTkhQ?=
 =?utf-8?B?RVVvUlJLS3dyLzFhZW8rYzFOYk10NGpFaGNYemFuMlNQS1VrcWNYTjBkUkto?=
 =?utf-8?B?eWdBVVRtenpLS0lSTTlZL2g4c0V1YlQ2VzVzZXlzcS9WZlN5cytXa0R4RVdT?=
 =?utf-8?B?YTZDVkJuZFNRdjNsSktpOWF6TFpqam1KbitRVjRHNlpVM3FwM2xlSmNIdGd2?=
 =?utf-8?B?SmtSVUdTVlE5RnRDUk0xK290VFhkb1pSOFlEWTllK0ZOcnVLL09sTTRXdzFG?=
 =?utf-8?B?WlBtUUFqTnMzY3RhaXhhTEVWMTBOb1QvVDdoZW44TmlkSk9CaDlEZzhJWW5Q?=
 =?utf-8?B?UTdYL3hRUi9kRmhXVDBZR0tlWW4ydW1uODFYL2hlQ2orVXl4enhTQWlBNEdE?=
 =?utf-8?B?YXpZSHRYTjRCWFNzelErM3dPQlVQeTlxU3FaTG1SRkp5dkpuS0dWK1lSTUlZ?=
 =?utf-8?B?K1ZjajJBVFFrVDBNa2owRDliM2dhdXJqaTBiQ010TlBGNXMzbm8rZVlYc0tP?=
 =?utf-8?B?REpYSkl2KzJ0ZmRzMGQrMFFUVWw0ZU5BZ3J5eWx6TW1aNzgwbUQzNGtTbzZm?=
 =?utf-8?B?THVNeEtLZTdtWHFVVmZ1WnVoM2pEcXdZc1F1Q09BMjdTeFo2dlU2SmpvTDkx?=
 =?utf-8?B?d25NaUZUQTU2UWZ1UHVsRC9INi9vaUN3eVZPaUFmZ3RDcWhoTFZQd0lxYlB1?=
 =?utf-8?B?NG5GVUs1VlJqK2pScm5MaHVDeHd0TGpEYnYxbGFnSXZ3WWdyNTgwbnFJK3dm?=
 =?utf-8?B?UE4vb0NJMG84RWFPWFVXaUJCN1E0OUlPMWs3dVZ0RXgvU0ZzTktmZ3gvRHVo?=
 =?utf-8?B?dDNNSTUxb0tvOVFBbDFjQnVpODdqbjFGR0M0RS9zeEZKai9aOTlBYmQrWnox?=
 =?utf-8?B?UFhoRzEvaVBKN2R2U1hTODEzT1BXNHFQS0gxQWpUcGZ2aDI5bWttSFdEdUx0?=
 =?utf-8?B?ZG9wTG5ybFd2NFdxZFpvWmdhWE10am9WQ29KcldyWmYvaSs3YlYrc0pPdkY2?=
 =?utf-8?B?dWRib25jdTM3R0kzTmc3a1lnU3lkNnBiZUV3U25ESVlHSjFJYVAyQytWeGEz?=
 =?utf-8?B?bm5hWjgrT3dkaHpwdmNLWFhpdE5lYmM2QzZSYnNZMTU4bXpkUzkrQkpzeTZH?=
 =?utf-8?B?SlhYcU4xTTFxY1JtdFMzUXdvL0lZZU0xTWxnV3VJcmRYalVqQld2YWNIZlhv?=
 =?utf-8?B?SllGVnJXZ2NoU25iNnloTzcySmUyTFk0TGpUTzBVTUlpYUc2N1FCai92V0F5?=
 =?utf-8?B?aFBNdFhraVRhSU5WcU03QmRkckJwbVkwWVdMNE0rbURmdTF6SzhCWEtmQjBs?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7d2a45-84a9-45b9-b6f4-08dc5fff1906
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8450.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 23:27:22.2067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vRztP8GnMkNqCflK7remcmJE/GXtKR1uWh2yusbAvXFZLbr6qF60BUILQMKtQkywsvlGsPuz83+qxpHzqZ/Xur/BnVJ4rTwJBya4ASNqj9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8448
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

On 4/18/2024 10:10, Nirmoy Das wrote:
> __intel_gt_reset() is really for resetting engines though
> the name might suggest something else. So add two helper functions
> to remove confusions with no functional changes.
Technically you only added one and just moved the other :). It already 
existed, it just wasn't being used everywhere that it could be!

>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
>   .../drm/i915/gt/intel_execlists_submission.c  |  2 +-
>   drivers/gpu/drm/i915/gt/intel_gt.c            |  2 +-
>   drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  2 +-
>   drivers/gpu/drm/i915/gt/intel_reset.c         | 43 ++++++++++++++-----
>   drivers/gpu/drm/i915/gt/intel_reset.h         |  3 +-
>   drivers/gpu/drm/i915/gt/selftest_reset.c      |  2 +-
>   drivers/gpu/drm/i915/i915_driver.c            |  2 +-
>   8 files changed, 41 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 8c44af1c3451..5c8e9ee3b008 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -678,7 +678,7 @@ void intel_engines_release(struct intel_gt *gt)
>   	 */
>   	GEM_BUG_ON(intel_gt_pm_is_awake(gt));
>   	if (!INTEL_INFO(gt->i915)->gpu_reset_clobbers_display)
> -		__intel_gt_reset(gt, ALL_ENGINES);
> +		intel_gt_reset_all_engines(gt);
>   
>   	/* Decouple the backend; but keep the layout for late GPU resets */
>   	for_each_engine(engine, gt, id) {
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 355aab5b38ba..21829439e686 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -2898,7 +2898,7 @@ static void enable_error_interrupt(struct intel_engine_cs *engine)
>   		drm_err(&engine->i915->drm,
>   			"engine '%s' resumed still in error: %08x\n",
>   			engine->name, status);
> -		__intel_gt_reset(engine->gt, engine->mask);
> +		intel_gt_reset_engine(engine);
>   	}
>   
>   	/*
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 580b5141ce1e..626b166e67ef 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -832,7 +832,7 @@ void intel_gt_driver_unregister(struct intel_gt *gt)
>   
>   	/* Scrub all HW state upon release */
>   	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
> -		__intel_gt_reset(gt, ALL_ENGINES);
> +		intel_gt_reset_all_engines(gt);
>   }
>   
>   void intel_gt_driver_release(struct intel_gt *gt)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index 220ac4f92edf..c08fdb65cc69 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -159,7 +159,7 @@ static bool reset_engines(struct intel_gt *gt)
>   	if (INTEL_INFO(gt->i915)->gpu_reset_clobbers_display)
>   		return false;
>   
> -	return __intel_gt_reset(gt, ALL_ENGINES) == 0;
> +	return intel_gt_reset_all_engines(gt) == 0;
>   }
>   
>   static void gt_sanitize(struct intel_gt *gt, bool force)
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index c8e9aa41fdea..b825daace58e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -764,7 +764,7 @@ wa_14015076503_end(struct intel_gt *gt, intel_engine_mask_t engine_mask)
>   			 HECI_H_GS1_ER_PREP, 0);
>   }
>   
> -int __intel_gt_reset(struct intel_gt *gt, intel_engine_mask_t engine_mask)
> +static int __intel_gt_reset(struct intel_gt *gt, intel_engine_mask_t engine_mask)
>   {
>   	const int retries = engine_mask == ALL_ENGINES ? RESET_MAX_RETRIES : 1;
>   	reset_func reset;
> @@ -795,6 +795,34 @@ int __intel_gt_reset(struct intel_gt *gt, intel_engine_mask_t engine_mask)
>   	return ret;
>   }
>   
> +/**
> + * intel_gt_reset_all_engines() - Reset all engines in the given gt.
> + * @gt: the GT to reset all engines for.
> + *
> + * This function resets all engines within the given gt.
> + *
> + * Returns:
> + * Zero on success, negative error code on failure.
> + */
> +int intel_gt_reset_all_engines(struct intel_gt *gt)
> +{
> +	return __intel_gt_reset(gt, ALL_ENGINES);
> +}
> +
> +/**
> + * intel_gt_reset_engine() - Reset a specific engine within a gt.
> + * @engine: engine to be reset.
> + *
> + * This function resets the specified engine within a gt.
> + *
> + * Returns:
> + * Zero on success, negative error code on failure.
> + */
> +int intel_gt_reset_engine(struct intel_engine_cs *engine)
> +{
> +	return __intel_gt_reset(engine->gt, engine->mask);
> +}
> +
You could have just dropped the 'static' from the existing copy of this 
function and added the new version next to it. That would make the diff 
simpler and therefore clearer. Unless you think there is a good reason 
to move the code up here?

John.

>   bool intel_has_gpu_reset(const struct intel_gt *gt)
>   {
>   	if (!gt->i915->params.reset)
> @@ -978,7 +1006,7 @@ static void __intel_gt_set_wedged(struct intel_gt *gt)
>   
>   	/* Even if the GPU reset fails, it should still stop the engines */
>   	if (!INTEL_INFO(gt->i915)->gpu_reset_clobbers_display)
> -		__intel_gt_reset(gt, ALL_ENGINES);
> +		intel_gt_reset_all_engines(gt);
>   
>   	for_each_engine(engine, gt, id)
>   		engine->submit_request = nop_submit_request;
> @@ -1089,7 +1117,7 @@ static bool __intel_gt_unset_wedged(struct intel_gt *gt)
>   	/* We must reset pending GPU events before restoring our submission */
>   	ok = !HAS_EXECLISTS(gt->i915); /* XXX better agnosticism desired */
>   	if (!INTEL_INFO(gt->i915)->gpu_reset_clobbers_display)
> -		ok = __intel_gt_reset(gt, ALL_ENGINES) == 0;
> +		ok = intel_gt_reset_all_engines(gt) == 0;
>   	if (!ok) {
>   		/*
>   		 * Warn CI about the unrecoverable wedged condition.
> @@ -1133,10 +1161,10 @@ static int do_reset(struct intel_gt *gt, intel_engine_mask_t stalled_mask)
>   {
>   	int err, i;
>   
> -	err = __intel_gt_reset(gt, ALL_ENGINES);
> +	err = intel_gt_reset_all_engines(gt);
>   	for (i = 0; err && i < RESET_MAX_RETRIES; i++) {
>   		msleep(10 * (i + 1));
> -		err = __intel_gt_reset(gt, ALL_ENGINES);
> +		err = intel_gt_reset_all_engines(gt);
>   	}
>   	if (err)
>   		return err;
> @@ -1270,11 +1298,6 @@ void intel_gt_reset(struct intel_gt *gt,
>   	goto finish;
>   }
>   
> -static int intel_gt_reset_engine(struct intel_engine_cs *engine)
> -{
> -	return __intel_gt_reset(engine->gt, engine->mask);
> -}
> -
>   int __intel_engine_reset_bh(struct intel_engine_cs *engine, const char *msg)
>   {
>   	struct intel_gt *gt = engine->gt;
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.h b/drivers/gpu/drm/i915/gt/intel_reset.h
> index f615b30b81c5..c00de353075c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.h
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.h
> @@ -54,7 +54,8 @@ int intel_gt_terminally_wedged(struct intel_gt *gt);
>   void intel_gt_set_wedged_on_init(struct intel_gt *gt);
>   void intel_gt_set_wedged_on_fini(struct intel_gt *gt);
>   
> -int __intel_gt_reset(struct intel_gt *gt, intel_engine_mask_t engine_mask);
> +int intel_gt_reset_engine(struct intel_engine_cs *engine);
> +int intel_gt_reset_all_engines(struct intel_gt *gt);
>   
>   int intel_reset_guc(struct intel_gt *gt);
>   
> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
> index f40de408cd3a..2cfc23c58e90 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
> @@ -281,7 +281,7 @@ static int igt_atomic_reset(void *arg)
>   		awake = reset_prepare(gt);
>   		p->critical_section_begin();
>   
> -		err = __intel_gt_reset(gt, ALL_ENGINES);
> +		err = intel_gt_reset_all_engines(gt);
>   
>   		p->critical_section_end();
>   		reset_finish(gt, awake);
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 4b9233c07a22..622a24305bc2 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -202,7 +202,7 @@ static void sanitize_gpu(struct drm_i915_private *i915)
>   		unsigned int i;
>   
>   		for_each_gt(gt, i915, i)
> -			__intel_gt_reset(gt, ALL_ENGINES);
> +			intel_gt_reset_all_engines(gt);
>   	}
>   }
>   

