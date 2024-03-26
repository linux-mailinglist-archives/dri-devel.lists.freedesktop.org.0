Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2784788C86A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 17:03:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6D610EDA5;
	Tue, 26 Mar 2024 16:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f19GClu2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DD910EDB2;
 Tue, 26 Mar 2024 16:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711468997; x=1743004997;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mG3sZZLtJKiXnaVfrfjH1Lhhy06fwbKWcOxSsisw92c=;
 b=f19GClu2RUWJ3gXjjpG7h19bO0PCVWP+LHXGy3D9C6RRCk077sJEnrQk
 gL4ZYMIhVOCAkKO0fjwnARqXWlUQ+/kyzNFonMkTuomUVcnqmMrA2irFz
 RxVACpya5vhxpLkXHi7LzcMEOueFkNkF/3M/BuFUL2pm84imG9xpyTVaY
 9/QLhq3o5LkwBA8tu1pQv7sOcbPieYqADddzWop4BR+J9ucvzEkti1T4C
 Oeh6yDSiotBR8VHzU1b+isbSCDc97UsvxczJOQv4YtfQv88BXPR4XlWau
 CSdrq3bEM0bkqp8Mjcl/CrgPGXiUB2ZvGI/EKs3Lq+pEkE5luQCu6tGdx g==;
X-CSE-ConnectionGUID: +IRdsy8KR5C+zOoQoXwvrQ==
X-CSE-MsgGUID: 8bifADmfRiOWnk2TXiYm0g==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="10328981"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="10328981"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:03:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="20656832"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 09:03:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 09:03:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 09:03:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 09:03:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 09:03:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqLMflzvIJcRiIhLwUCMUZLfep+PqC7hBhn4NG2LgwqZN2ylyu6UyOek0DhQUUyZUxJwMqhRUxpTKgydEa++GgFK90LOmVUYHYSgxXCHRRUsGi95T0ZyjJfIhkN66YuMZUvsIXHB6IjUBp0JfRYyfcaSKGJDiVdinAkRBnwszOF0TZ5QH9g4SyS1flIvuEUh4xIwVjiDxWu/0Hg7UVoA1miOKqydrDUsS2yQVLLMmaE7QPprF7+1nf7ogN3Sqj0IqsqaDa3DjLtH8Y2UZY8jgR06Vqmc0TTeNT06fQI9VGzUo1kkxfuqht+YDKongsIf6xFpGj4NJ6cDShCdw9ebKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ic9IFU86RX1fthnjveQjJJY+J4F2Ep+bRPEYBlFQRLo=;
 b=IEzKchhTPAKXkVMPmHbYH2jGyqwrTwjkfH1xA7MLNlmsRoi5Sm4FYe5Us/zMEJXsdBb8uCUg21vOR++CGOY4Q+J+CeOsKRZZwVlYvFtGfRgWVsTDytUDpyTDouT1y/XRb41m1b8tAVhLWZoVyAPmIDfGGikXJAkt6HMf8l9pZikQj/KDYYG8tXzs0KuLS4/xtvj0/qv45ar1ENmZbFDHdn5lflb6wPoI32K2pDYD2Bs7RlX+hC9wU7GFrnVFHyIm3w67TePbPEB+J/+IGaZBVMENSRcvngVq4X3gNzs3rDGS2MMfKsPplDxT674QL1c1dVTnfcwObXuGZsUiO1/VNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB5901.namprd11.prod.outlook.com (2603:10b6:510:143::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 26 Mar
 2024 16:03:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.028; Tue, 26 Mar 2024
 16:03:13 +0000
Date: Tue, 26 Mar 2024 09:03:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, John Harrison <John.C.Harrison@intel.com>, 
 <stable@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Tvrtko Ursulin
 <tursulin@ursulin.net>
Subject: Re: [PATCH v6 2/3] drm/i915/gt: Do not generate the command streamer
 for all the CCS
Message-ID: <20240326160310.GC718896@mdroper-desk1.amr.corp.intel.com>
References: <20240313201955.95716-1-andi.shyti@linux.intel.com>
 <20240313201955.95716-3-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240313201955.95716-3-andi.shyti@linux.intel.com>
X-ClientProxiedBy: BYAPR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:a03:114::16) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB5901:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L80HphAS1/Of7W1DHLV6MnkFJn9E+MKlBjPA82L8qBYMpTeNl+AzpmBksVBuJ55mvnPEjVstfFk2qZEpjzAXxJSDgW9SaPir/YnQAI9q7zWzw7ggeADd2c6mesyH7zWfRXRtZZWhGmwHDGpZkVNhivxzBnjR0nq4qyW0Dv4icP9zz6JuDaLpw69gzmbcEgnGIhQNXgxuUdTCJ+sJ/770ZejN8h7JM1zqvFZE0gOWyvPQg1aOOiCR4iKg3O85Q4zsVMJyd0kkVSK1+T898HsjSazhLAOeTk5TVEYFfPxJ58oZA/Ur1rsTK2UrDWxW8aMB7uwnl5RLWMZ/+baIk5PyRLDqA5Odud8a444XFvGc+7DzGfyudKQj9giRgB+OCA79uQFgAPKmAW6bqxJdFwJ655SVo0y4VCkH00grghRT0SxtwXcC4YAt313k5vQs6JlG+zhfCWTAF4+5wvBh03KMmEddMktswU+o5NHae7N4kxd3VzEVUdC/w+ZcaE7u8CuYwbSVcddGFodDbKTH83UmvSwKhMzE7MKdp05zuIpywFRribkRzG1Lrv3cQIr8TSMbiXhPVLolctjIcPXKg4qMXrNGcF9OQKJl+p0m6KQX/kyImFycZHu+rllWT+53aaVbf4WQssLkzad4mOs81BigM6hIpJDbzwXjSS1oUIgksCY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wnSscOsHlJXuJReaGsgovmj5wFT0OAv3koHf4l088Sp/H8q0EXwTOSZuncjV?=
 =?us-ascii?Q?5z0nSi6QZvTsYrko8C5FQJeuIYDXWDCqnevteCLkfiH4qVfa24cQh7ofy1/Y?=
 =?us-ascii?Q?H4aGSv6SxozH0Z+Y2eWbaOGrl5H233F7nzzB916XJVVTVKtNmAHirxg2GSZW?=
 =?us-ascii?Q?aXIuckSo/LWbNfB2iFoLIGG1/ZcHRnp4lN4zmWIGUgEMizPWOemlG6/dCT6P?=
 =?us-ascii?Q?EnL6/UlYCWRtCXddye14M9QENXj6cIS2Gpq3NW9fzzj8ikQIRGUyAbijo5Po?=
 =?us-ascii?Q?rU5FF8d2pM9PbDsyKea71reclc1sSOob6YCrMFzQcYF8Lm8BKrSEYUxGKznf?=
 =?us-ascii?Q?ExpIQq3iP7uhasKvr3d+iC8NQbsUXryOlQRPW/8Lz0WzvQKmqAolAKZNzyiJ?=
 =?us-ascii?Q?1l2pt7IMTElDKHD3Z5x1ipNtOO++H6KTW0PRCJ70TCOl7weMoe9a404uITfh?=
 =?us-ascii?Q?ZO4Ccjk/wljgNqMcPdlKx7xz+iKfTH2lCpJoT8EOL91DGKjC6Y5VDcUSsZy1?=
 =?us-ascii?Q?HOgW3y0clmeEJ6cSo+05gmotIANkQSw4LBbk4YhOxKx5luJw2B775t1RtKLW?=
 =?us-ascii?Q?tixAvsGGkRX6xRh3mBVKHR1tgpXuiSxQgExX0rzKOMCCk0/Alypvi2fQwKAJ?=
 =?us-ascii?Q?xHvsPt0kcUxYWZvc/EuwiErkI8fW0RskwDe5eKwHREFWHLYW5+v9KkkOJm0F?=
 =?us-ascii?Q?qjh6YkZjLX4ZlcOJmsUTE7VxCZeTkoVLKttN+K12qsuK0C3iHbUTVDNob6nB?=
 =?us-ascii?Q?wWLpvp7Rb05uP8JQ8okc4fX1GsygqVyLeh3aytTYtEb0gAjbb2w/Rug4FTrF?=
 =?us-ascii?Q?uYcNRdTyMZIThD/3M5xucQClOv2D6B+aYfhpIdaf09Y5Gzn/E8iRN71lZqvM?=
 =?us-ascii?Q?fSPI0Nsde1PDie0JMU4L8XrV+sgg8ywTWW6TidMX/MSBcyICc7iYx7ZFLHmA?=
 =?us-ascii?Q?0xd6ojvMHPBd1WTIa3B5sqGt7V6L7EO9MaoCzDBSIhBa2JA/wEi4/N7xEo2D?=
 =?us-ascii?Q?zjtKwQ9NIXT/a9oUz86l2MOIJh5othn0BKqcdxUKLAqUT2zy6NMmVFJvLXmg?=
 =?us-ascii?Q?U3la8RKywrI1GbnmhgmC5j8Gb+94UUK1dDrK4pYqCFdMbUqGKke+egMidd7Y?=
 =?us-ascii?Q?sQuCIVSvaZc/K/JaFRc4qS3SWstXyR0l1sK4dZnkXXdkCOZBdgkUUOmY6uUg?=
 =?us-ascii?Q?fYdHvY7EVojE1BZhry+2KCDaOY8dZtc2MN1NBje47hcT+PkFoAZnxbuFfGMx?=
 =?us-ascii?Q?FCwxZC0MCClXEyfIa1hCROjokw7B9s+i38+KKb6bQkgFVu6/025iAjG6QWbN?=
 =?us-ascii?Q?kdq61acNq/HOYiMWxFX10+p6ZSkX8JhWR85hhcPOaCVmS30Rov3s/Ll7xu5a?=
 =?us-ascii?Q?uS+9sJ+NcImPJJ1VYDxNlb0gCxQna1RE5NN7xL789/mMtVNk3xpSNAytP4gU?=
 =?us-ascii?Q?WE0hkPbIEsokdGzUvPQT11bq60a+4CsfYY+zgZ0u3zo/QdEYyJkeelWJQuZ8?=
 =?us-ascii?Q?6cN3L2jmIo5w2Jx0Bxef2oynstNuD9XPkYfAmo06P8wWN7f1/uz08dgli1cE?=
 =?us-ascii?Q?VEw1pULGWDOVCPsmEw73/B/JjzC0uoJ+slJtMs23QwEb69o8QVIHp2AcMomm?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db844535-e4df-4820-ed6c-08dc4dae3d74
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 16:03:13.2545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2HZJO9gC16eZ5Lu9IatVNhZwJCxngsbg0rAaXU18pb+89naTWwsetSP20tYA7pK4ZcLyDhfOA39n4XEQmVdlI+MYY+sRpC0/VdfSmGSCjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5901
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

On Wed, Mar 13, 2024 at 09:19:50PM +0100, Andi Shyti wrote:
> We want a fixed load CCS balancing consisting in all slices
> sharing one single user engine. For this reason do not create the
> intel_engine_cs structure with its dedicated command streamer for
> CCS slices beyond the first.
> 
> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: <stable@vger.kernel.org> # v6.2+
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index f553cf4e6449..c4fb31bb6e72 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -966,6 +966,7 @@ int intel_engines_init_mmio(struct intel_gt *gt)
>  	const unsigned int engine_mask = init_engine_mask(gt);
>  	unsigned int mask = 0;
>  	unsigned int i, class;
> +	u8 ccs_instance = 0;
>  	u8 logical_ids[MAX_ENGINE_INSTANCE + 1];
>  	int err;
>  
> @@ -986,6 +987,19 @@ int intel_engines_init_mmio(struct intel_gt *gt)
>  			    !HAS_ENGINE(gt, i))
>  				continue;
>  
> +			/*
> +			 * Do not create the command streamer for CCS slices
> +			 * beyond the first. All the workload submitted to the
> +			 * first engine will be shared among all the slices.
> +			 *
> +			 * Once the user will be allowed to customize the CCS
> +			 * mode, then this check needs to be removed.
> +			 */
> +			if (IS_DG2(i915) &&
> +			    class == COMPUTE_CLASS &&
> +			    ccs_instance++)
> +				continue;

Wouldn't it be more intuitive to drop the non-lowest CCS engines in
init_engine_mask() since that's the function that's dedicated to
building the list of engines we'll use?  Then we don't need to kill the
assertion farther down either.


Matt

> +
>  			err = intel_engine_setup(gt, i,
>  						 logical_ids[instance]);
>  			if (err)
> @@ -996,11 +1010,9 @@ int intel_engines_init_mmio(struct intel_gt *gt)
>  	}
>  
>  	/*
> -	 * Catch failures to update intel_engines table when the new engines
> -	 * are added to the driver by a warning and disabling the forgotten
> -	 * engines.
> +	 * Update the intel_engines table.
>  	 */
> -	if (drm_WARN_ON(&i915->drm, mask != engine_mask))
> +	if (mask != engine_mask)
>  		gt->info.engine_mask = mask;
>  
>  	gt->info.num_engines = hweight32(mask);
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
