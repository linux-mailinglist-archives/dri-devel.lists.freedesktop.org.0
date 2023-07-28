Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2AD766086
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 02:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1602010E07C;
	Fri, 28 Jul 2023 00:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CF910E07C;
 Fri, 28 Jul 2023 00:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690502998; x=1722038998;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QetQtAdIuP9q/mmipzvwdZh8Vb23o7NTjAgwqSoPbsY=;
 b=kyMysYtCKj2vTODG5KWGuYrrmSKcMUPMpAoEIZjKxypwaWoc2Aag3q7K
 ON97GDrVh0hqNcLXePKpkL4LGP8FPDlf9LHSAIYsgFpKD/floaRmKmP5M
 lowfgUlVf1ncEUui6oIxohuFbatvzga/+j8edHQBQbwl0Xt1zhe8GUJBg
 r9tU5OQTeubn/Ig8RY7Nd/pDvZvj8Thr4TcT9OTyfMU97qB5hOvJ+7E3y
 FRqrehdWi13y5UCuxWCWzTKiB8eElhlmsX+X5atK4JJsLEQNPV1Wb9BZW
 XlPmhBC7G2rv9gkyQn8gkluFoYbw3YU/DSDpGJXgfaqWzDRO5Eq5kRuEt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="372090530"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="372090530"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 17:09:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="1057909975"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="1057909975"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 27 Jul 2023 17:09:53 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 17:09:53 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 17:09:53 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 17:09:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/Bz5w2/bstjwm/o6D0ulTUNsySpy/Gshtqn2wxy+gq87vtfHJmIOvsgwwvyffwMdGGQlz0R9TRp1mV99cOg6+Bt8y7LkO9XVg/LMj2roZnrZYOsfgd1Xy6BbKILq0lcVhMGDRgUNoQPu2eC2NbMyX/XrkNXne0FSCeS6fxCTmipxUO5z8odKVwcFBwK1/8gbIJyJwaGc4nrq8L+p2Z/Cccqh8f3qukFasl7gepkomaBb0I1HqRFvnFVkjsEd9wS1M/Ezy7e3fAZvYokZ6dPA+/dBKckXKIDeuY8ZJkar+6lNBOJQ8LVGI0OsQSdrS7JoDMVaFDysOO6UdcogYjCQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RnYW31CCe3TcQ2maFFzRl5oFqFJ/nk/+yJvWnNweVQs=;
 b=BDqQU7Trzl38xi7BZ82qHXgTYzXZOdkIZUmxnxP4KR81kDUd6tFrAma0K6gNIzukdtO8B9cPPZ9iunVFouaPTz6MnzxGvfqCDVC7wazOPiAJR4w0jIUL+KLwmniFFstpQ21NvYDSX9YWagxbSSXEFpMUULx8tn3WNgsLu1+y0gZPlstEVV3nYUvR4YjHIKZQYw3yy2fjJ6rgR5QIqO85UvAREGILQGpo1zSPQJj3eTTjug0y59hgShDuCec94igFXf7qaChkVe6euNWrezlxOkuHQQIcdkQEWPV5bgvC6WAnBL8utGZLYdp7kkWs/Loqbe+nvjnJY4M1Ni+fffvtsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB8201.namprd11.prod.outlook.com (2603:10b6:8:18a::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.29; Fri, 28 Jul 2023 00:09:51 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 00:09:51 +0000
Date: Thu, 27 Jul 2023 17:09:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [RFC 7/8] drm/i915: Lift the user PAT restriction from
 use_cpu_reloc
Message-ID: <20230728000948.GG138014@mdroper-desk1.amr.corp.intel.com>
References: <20230727145504.1919316-1-tvrtko.ursulin@linux.intel.com>
 <20230727145504.1919316-8-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230727145504.1919316-8-tvrtko.ursulin@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0015.prod.exchangelabs.com (2603:10b6:a02:80::28)
 To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB8201:EE_
X-MS-Office365-Filtering-Correlation-Id: 97ed612e-5387-4d80-c576-08db8efef67d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DVDD44QrUVsXPoLH8HLZlcEDNp8cCyMIgXJNgffWn3DFRbMMJoffd8i7OzTBwjo/MPckkHFaBA3avxj4XU+l+tt/3C8MT5nj91zNq19TqQsxaKGC4lk9A7+Rg9Fb7qEL5o4onFo8hdv1mLcqF8CzW26sAKB5Qw521s1uB3dW0U0bgmuoR+j1nF+37P66jUV7YNHZoQXG6NhSCGIhMczlEV+fVP4qh+Q9ZpGO2RvMB4wYBNxRmcQAIIQ2WTVBSgO7X5O1t8/gKRnz7xQayPXof4tkENtqdfP7QWWsup3cIgVjuBwZHwhfDdM3grOcNnhuQeoXytBwlDsdO3Q66oq6vkAxI/f+FOR20aucYO4g7axW0Aw9hHr2UKIWp5uDqFj09dcRzwD3SutFPB9rGY7CAqeYHSyfr6bNLmsSeBtkF9Gkv50OADKeHBHRUWBpfsbIwuKud/kMSrwTHF5UPCKvcCQupPbk0lYYcUMG427TAomZy/6nFHOWgg1qYybyzobBkcEor6j5FRXVghBKOsOlkfxOgNjp87qCs3c2g9VM6qkfjJFEhSO+xKAimBdSItyS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199021)(41300700001)(66946007)(8936002)(66476007)(8676002)(54906003)(6916009)(66556008)(4326008)(316002)(5660300002)(2906002)(82960400001)(478600001)(6512007)(33656002)(6486002)(6666004)(1076003)(6506007)(26005)(186003)(86362001)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O9m7rze2UEOWntaWzZU0jaofd1fqV+n0i6yqC1shJuFnK7ASYcAmO+3EyXKZ?=
 =?us-ascii?Q?mkrVDrrtkQC+CrMwda4gvvgscFucqVFETeUKMV68upzPkR7nkPOm0ESQ1GcH?=
 =?us-ascii?Q?Oh7sgjsk5s4LyFYKwOQPYp2OX30rQqCQHtoAjsxCLI1IYh7PSdIx9rA6Vdou?=
 =?us-ascii?Q?DAm2Q32EJCAWXoUHnBjStSSdBNobKSV9teFel4YnU0tVpulz4r4PjHsB/Hpb?=
 =?us-ascii?Q?YMPRKKYUeCE1D6faCUVEXuyZqkSgQV1tbvgvIbNR27xCYQZu1W0j0usUTNxW?=
 =?us-ascii?Q?E6n7P3PKZnIyLihX9losg6mIbXhnI3+5ZxQhqce1o1ntfthLPXKm8CJLXVhY?=
 =?us-ascii?Q?7efRpzMhDSP1xJoX76/1wHY7dc3g1DxqoURlkvAahZGHf3zwZL3PmWDHC4ry?=
 =?us-ascii?Q?7RlgM6GsuN6CWLbnmLW44/r7fDr52L8pxiRPoCyWkPUf4oxLrz7QFGH0O+RN?=
 =?us-ascii?Q?c6Hs79BV6y1d2MUY4W8+70FrRcKEhJL+AwLVeQkZafRRnm169yes5sCJu4I8?=
 =?us-ascii?Q?vXqT7UK3FDU5YVBaQjKM8/7pnjRZfaQQ2fhMWlHa4XUCnGw7+nycDgCFz8GK?=
 =?us-ascii?Q?StzpyBIdNOO3+JOGmGyP0bc3jArK+qV9Yohf+eQbt5d2FYZRUsCRoOuyEbyH?=
 =?us-ascii?Q?KKGzaLKYZvZFCaC63Jm6zcXHRVWsk0x+Sbc4DRb3cyjr0bk4MkOoobtdFC8t?=
 =?us-ascii?Q?WGLHF9Ma+mjc7xr6boWpQiR297wxbqM56wGlGQBHx351ECxUtrJJKSgunxm3?=
 =?us-ascii?Q?T61IlFcY7q2VwzzhScn0MnSIyTB7IT+9FfjUb1nFDlE5P7z0jv6ItSZ2k2B9?=
 =?us-ascii?Q?pazniirwIq+vbtK2IldvtXM1LFvoyKBpwL6BJy1OLXcDZC5yqPjk/fRv1Iym?=
 =?us-ascii?Q?uRXVK1tuNSBBubxpO25lNEVp0sjJZkVaRBewJ2+7+p0w0qcXsErc66htuhYv?=
 =?us-ascii?Q?E2FQQkRj0Ehkzn9O1v9jlT9nmTuKLCiMmOoD57EDzyjRcJMG2UfSH5nA92Ae?=
 =?us-ascii?Q?mUXGZHaVV4eaysz42LiOD0OH5PfkW9JSmBnGo5PsUr4yP78dpNVflZ/oI60f?=
 =?us-ascii?Q?ozkkRa+iSbb9m9ksAgACyi463xBvgBANfKB5KqEpIGGrsteAzUVrCYZ8NeWL?=
 =?us-ascii?Q?tcYvZrgBduM3pE0lKiy1eA6/asFzaBbRtHfbigLmS7QpVuHJdh1kFLWZqjVR?=
 =?us-ascii?Q?RHSl29Lp9KvwYUeXlOKcCw1il7nUFWLOEPnc3K+cB7XtC9l7mp0byWG+1a1n?=
 =?us-ascii?Q?qlAMVgqtoReG33LMA0LjjC99lr7lh8ofcfGINE/nGwCk4yWd/SDF4lceLTpa?=
 =?us-ascii?Q?TJaQyghHfY3TnVVlefuGDu/Ge8JAlTa04KJ1nsQ92+wWv2IZwX/8bDi7Xqr7?=
 =?us-ascii?Q?LwMExmCeZXCBKWsOGUFfGuLYk5CL88Lc1T4iQsw4ezOX/RSO39tVWGfoqbfW?=
 =?us-ascii?Q?pOF8LfyqDm7kHIkmAT/GDmuEXIr7CYOo9svr+trNeP2eKP5Qwml/oO/2huSo?=
 =?us-ascii?Q?IV7yadv47ZZlZvVrf2CRJwEAobjFod0jc4Lc7mJyt/1zM6+vMhUGBiwx37MJ?=
 =?us-ascii?Q?21YWR/YSwToi1bl07w63LaicRCl71+VwUUv9Dj76l/Qo9YzeKMzKsZZ8cWsg?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ed612e-5387-4d80-c576-08db8efef67d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 00:09:51.2883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KxtYfiuJ214ECY61nmdloJH7QAhO+Zh/kVprZriRtpVGVTPJ5CrjDS0yeov9VCi7Nj9i3f9g9tiJYPMAOs75U9txm3NCIZGGCF7bWg31OfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8201
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
Cc: Intel-gfx@lists.freedesktop.org, Fei Yang <fei.yang@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023 at 03:55:03PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Now that i915 understands the caching modes behind PAT indices, we can
> refine the check in use_cpu_reloc() to not reject the uncached PAT if it
> was set by userspace.
> 
> Instead it can decide based on the presence of full coherency which
> should be functionally equivalent on legacy platforms. We can ignore WT
> since it is only used by the display, and we can ignore Meteorlake since
> it will fail on the existing "has_llc" condition before the object cache
> mode check.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 9d6e49c8a4c6..f74b33670bad 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -640,16 +640,9 @@ static inline int use_cpu_reloc(const struct reloc_cache *cache,
>  	if (DBG_FORCE_RELOC == FORCE_GTT_RELOC)
>  		return false;
>  
> -	/*
> -	 * For objects created by userspace through GEM_CREATE with pat_index
> -	 * set by set_pat extension, i915_gem_object_has_cache_level() always
> -	 * return true, otherwise the call would fall back to checking whether
> -	 * the object is un-cached.
> -	 */
>  	return (cache->has_llc ||
>  		obj->cache_dirty ||
> -		!(obj->pat_set_by_user ||
> -		  i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC)));
> +		i915_gem_object_has_cache_flag(obj, I915_CACHE_FLAG_COH2W));

My understanding of relocations is minimal, but does 2W actually matter
here (CPU snooping GPU caches)?  I would have expected only 1W coherency
to be necessary (GPU snooping CPU caches)?


Matt

>  }
>  
>  static int eb_reserve_vma(struct i915_execbuffer *eb,
> -- 
> 2.39.2
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
