Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1F0765F30
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 00:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE9910E627;
	Thu, 27 Jul 2023 22:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D2F10E627;
 Thu, 27 Jul 2023 22:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690496363; x=1722032363;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sStEtnL5cDVGcvnx7lBzSw/4SLumL8UdFiRzMCoywyg=;
 b=Au+v2B+Jvz7MIUvP/edH0qxiz5XWkjW3P8efNVHiBmaD+5pZTnHwfdcr
 CqRM9RZe9UeFpSI75Fo9NEQZyJ/tDxfFNccHNbc2gZcMqU0pZgFUNpNB6
 jRb2hc0ffUklxJbuPwrVeFCtj/ka2fNtrMJM5UmUF30IDurDz4m9sXFBM
 wLFcUO2w4ryOCZn6pidEwYyPLzan95R2ueh7iIOJMxVBLouDVDHBfqNbD
 j770ao3SOfi2L+GTZLOrWIq5xn7cz8ebCUH0BKxk+s+MjuCo7cD4B5z9X
 2kxwdKmiUDUzuwlnet0eZgM3cKyMRSOdi3C1DpRzQtyUOV9CsQoQuSGb7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="454812432"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="454812432"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 15:19:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="870615306"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2023 15:19:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 15:19:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 15:19:22 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 15:19:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifBMhBY7qfUlQHD9oZofTVcbjnCTfEX2+ozWs8Tn3FZYKOj0+DmQhr0Ec1HtgFKE464e7jdKcKau1dPFNR6WEGSWKRqIwIwSSDuBXzBRISF+5JIFk8oKTT8uidcPPhckza2wpb1fEdpQP8ut1lHtG/MHO8LzrYF0DBPxsAwgb0p2hQV2bxQqk7TJCGTxfdeiGZxboRVjRrCMWlRgkLb/EzxnxYl9kKGv8rwyiOxR9FHeMCxRv9ASt4K1KepRrSZY02D/52r+/7XiOQmUEKJx3hACAPutc1ZuQBcMINpTtr/Z5/4U2tWaVziJJ+z+ERsoubg4SU6zueOOXfPKcrFb5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1n5Dl1m/zJl5aakmSsdXDAT8+s0ko4H1ZkrRZOz/ZM=;
 b=bbNqU5FP9HW5z6GmagK8yeljdJ18ED0vFpzdIuPSbF/08rVDKQx/on4xnMBfNqbwKABN/zSBSI5NVGkemypgvXlR/mHWOGdmb2MooGEocqTBoRW+mqYnhPuUuxgMJgN8/WyqeWoCvemLeiMpduuMl9++kQoaHM7kDgoem9jq3nYHR4/f/0kYcWWHp+9esb4Zlse9z0KHnxhi7KTJEDfQhYtaBimkNf8f33E9aCqaRTob5uVOcdYMD5xvs21nMQRjTpLLG+ivw/pzrLN87zYmC2Eph/OD9valO0zgboTR+bLTYMzi+/CDDmRY8wfu6orZC8bFS4WyNdzZT2qIy7i4kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB8551.namprd11.prod.outlook.com (2603:10b6:510:30d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 22:19:20 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 22:19:20 +0000
Date: Thu, 27 Jul 2023 15:19:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [RFC 1/8] drm/i915: Skip clflush after GPU writes on Meteorlake
Message-ID: <20230727221916.GA138014@mdroper-desk1.amr.corp.intel.com>
References: <20230727145504.1919316-1-tvrtko.ursulin@linux.intel.com>
 <20230727145504.1919316-2-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230727145504.1919316-2-tvrtko.ursulin@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::15) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB8551:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a0ede69-eb86-4937-d129-08db8eef859e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uJwACaks0vIAr9x5DR4GmEP41Wimi8oms/Y81suzifcgrU2VlXbO3hjaAFGaxyyCF0aph1wnCqlT/tgLazBDO/hyV/EgDpWgWsr8C87jfZ/0H7Hlemjoe+sSp++ZxQPzG3s4749q6Ul5bidKqm2eXrb4dd+fi6c73Xs8pbhujpkpmoMfbQ4IcB8l7JXIb5GsL4s+v18dx567Ur/LBXhewr4R6cEK+Hp6pjVRU2ggdnx0LuKy5WKKnhkkH4SWFtzBv9wspNb+JKOdnP/BZrpqzavD76zFI1w8LU30zGPObQtp8hQFOb36aZiy3+2cjAk0v/L0Kp2gpPystcEyjC+zpa1SHH4VKWjSeX/Tv9MWzGjjP71eyMGpuZB+s1coe63m6BG4pNcZ36CLPk9q7ujG5E01zgS7rZGsZ0jjD+9qiZV8AdRQ8HM4IF/gCEbd8AnpAzZtGVZlOAP5Cd3rOYQrVzjlWEiIzFCIBS4CL+QkqV8kobaOV3mKjtowSBWncx967zb7nwY3QITRLrGrs/0WBF6NaXGjU8hQ6AVHwR8JejJwMpKI+EjRhZ0nHJo1lHlA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(39860400002)(366004)(376002)(136003)(451199021)(26005)(6506007)(1076003)(66574015)(478600001)(82960400001)(186003)(54906003)(6666004)(6486002)(66556008)(66476007)(4326008)(6916009)(83380400001)(38100700002)(66946007)(6512007)(5660300002)(41300700001)(33656002)(316002)(2906002)(8676002)(8936002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7lI6ZQHN7cAiYPSBqTWlCTPU4tcaVYnsnzY1UNIZ9I1l9Z3jwOLpyeZ8VN?=
 =?iso-8859-1?Q?MiA/BWjyheeV8GjZwpiyIvbIKJGAikrPRrO5H6dO2zUp6Z79mfbDg0tXtd?=
 =?iso-8859-1?Q?r6giGKT88WGuHn6I89r6Oyz0FXz3QB74YUAyIly4AyihlnNEkCFQbc3We4?=
 =?iso-8859-1?Q?j+cibWFJf3qqWjQZb9QRc35DraL3dBtB1Cl6u5GsRKFdogSxegse4W2LEd?=
 =?iso-8859-1?Q?XuIZRKFcI7SUEvADNy0PIfdAT/wC1fAE7DP/ceeXOLUCguN/D8aIyQ2bmS?=
 =?iso-8859-1?Q?j2uMCParxQJPMQv7TXGNr13m/oxRs3KfNS0Z3rf8nrYxJZZCUJegpkySp8?=
 =?iso-8859-1?Q?4OVRjqejbYPrmCSOCJ53XNFB5QcSdQxQOYeEkVXU4/ykh/dRJzX7Y0i0Xe?=
 =?iso-8859-1?Q?emFt/08oymDBN4WafqOtelJdsqAeP1E+iyM4gWPKA5LtPZCcJJ/y/mkfTT?=
 =?iso-8859-1?Q?HHboXyn6eVRbJRMjOoiqG5eWGImjDbLfyqh9NNn5jbUQ6DGO1YOYUfvLmm?=
 =?iso-8859-1?Q?7XNO8r0qfD9HjUgGsSf3Zs6AWN0DMaLfLnyfxW4IXvyovQjQwoCHli/ej0?=
 =?iso-8859-1?Q?uw4dpX8yrB7suMLw0WdM9pXLy00Gv139fN44dJu7gjahuapyZ5J6bE8k+O?=
 =?iso-8859-1?Q?aEOSA8tkLBWx9w4yJC9qBsJ7BecLOkG3WuJJ34hRXShGjrrb8wal47uk3J?=
 =?iso-8859-1?Q?eg7HUt9U5nbEafq6Q1y7Zh0OjTTIEOODmzgLDu6ILpN7rSwRBi/Xqfnwyp?=
 =?iso-8859-1?Q?XNvGA7MrpZ9npoHdSw/IbuTEeYr9+8AOxg1Y2U8jOY7UsC4L5wRDoIyHbW?=
 =?iso-8859-1?Q?urQVS9GoqUND3CTyGRpDGsMFeUzfp0gVhXwbH4P5RSkIjRqAR5MbwJFl63?=
 =?iso-8859-1?Q?wNJqykhd94eeNnIR9QvcXBWwgsKmCu5Caff+6JuPoJwIGCUdKK6IswvK5S?=
 =?iso-8859-1?Q?RBruzYV/AvIQjb1i58kilSWXWrIpKN6pYXgQ40R+epHpHkqYLd+LZm6F7t?=
 =?iso-8859-1?Q?a0QA9dsoRPwWVXHlCSpUCp0GQHgmONh8bC7qPJRdypCzwKs7OaJoqw/XEd?=
 =?iso-8859-1?Q?Rgn7zIoDGpo1rmCHRBgfn9+WEJW80NexioaBqwZlYiFIL/IRAsC9yh3GMI?=
 =?iso-8859-1?Q?MBD4Gm/Y3HPsAcDFqcydG4TXK7D8u4iIi/XI0ngJrKL1JAPUHDRBasBFh8?=
 =?iso-8859-1?Q?2kRndNJk9jvJhSyATHk3oQFrvhyTgBgT07cFHPu2Zq/Kz3OgxN4V28f9Qh?=
 =?iso-8859-1?Q?bA8lxW5eaTrNnR9xGg+zUb54Jq+82OlJKd6xNaCmOA+UqgmBs2B0F1QI3J?=
 =?iso-8859-1?Q?gWgCssbM4is6UaYOYDUjjvgRsihYMYqApjxpOadnrvr8yv3pY+kyMoZgDC?=
 =?iso-8859-1?Q?+guivRHqN0cbdYDc9edQqMrULLIiAzaca7hENXC2+T9/Xgaqf969Psy0p5?=
 =?iso-8859-1?Q?UqvfIL8BUEAOasikIpUsaklwOOlmqSaPbnQ4KLJh8JOEJWtXXvf+ss16N+?=
 =?iso-8859-1?Q?OTsjnfefA5jWYSeDC0XYT5KZsNjcAbcDIKxFegiy3SgvMtSbOrhVbLwBn9?=
 =?iso-8859-1?Q?HAeZIdkGRUSpXOzUCt6BEV4Sw8VFQokluw2rbbET7RCxTrgM90K1ncg1Zx?=
 =?iso-8859-1?Q?ZcxrWcJ/CXC59wUZIey/VBXO0SmayQ++mKEBrf/XNfcIDJbY15sGgO9g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a0ede69-eb86-4937-d129-08db8eef859e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 22:19:19.5389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0FFuTpB/iA0kuL3bgV+eWYM1ZUODESNR/acEuSVQaudXxdAwbV7hVGHasZemmPnx6vN6YApg6CrPncmaV0zVIDLvNXXX4OSsvVLQZd1r1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8551
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 Fei Yang <fei.yang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023 at 03:54:57PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> On Meteorlake CPU cache will not contain stale data after GPU access since
> write-invalidate protocol is used, which means there is no need to flush
> before potentially transitioning the buffer to a non-coherent domain.
> 
> Use the opportunity to documet the situation on discrete too.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_domain.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> index ffddec1d2a76..57db9c581bf6 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> @@ -24,9 +24,22 @@ static bool gpu_write_needs_clflush(struct drm_i915_gem_object *obj)
>  {
>  	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>  
> +	/*
> +	 * Discrete GPUs never dirty the CPU cache.
> +	 */
>  	if (IS_DGFX(i915))
>  		return false;
>  
> +	/*
> +	 * Cache snooping on Meteorlake is using write-invalidate so GPU writes
> +	 * never end up in the CPU cache.
> +	 *
> +	 * QQQ: Do other snooping platforms behave identicaly and could we
> +	 *      therefore write this as "if !HAS_LLC(i915) && HAS_SNOOP(i915)"?
> +	 */
> +	if (IS_METEORLAKE(i915))
> +		return false;
> +
>  	/*
>  	 * For objects created by userspace through GEM_CREATE with pat_index
>  	 * set by set_pat extension, i915_gem_object_has_cache_level() will
> -- 
> 2.39.2
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
