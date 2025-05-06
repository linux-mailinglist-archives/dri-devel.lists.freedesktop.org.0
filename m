Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C14AAADA9
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 04:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF1110E186;
	Tue,  6 May 2025 02:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hslttP7O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B44F10E167;
 Tue,  6 May 2025 02:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746499196; x=1778035196;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IeWbpw8xIFLxfwQnTt69okB4K57wDR13GmI7NR3vpbk=;
 b=hslttP7OXM1mA4y7zfwIJANVXtMWunGpWCDMl7zjUsBkzh+hEYgJxuea
 SmZpD9W5pECg0vB7VFCNDX5quW/UGOs+0GtrnVrf3YmaWnztnIh6ac/SE
 Fq3591/yelTFst6NjWZQIMQfFe1sxjgh6ueUOBaqvrZdcB9yBO8zmcrKX
 lBxeAD8yECsoPjA5qudUJhUp/JfACbEsMIoRhCTlGOC0a6+c9pKVjwgRP
 d+FF7DiVxSkj8pCb+eEzOhuRxQu3y5lHTOgWn3Uwp7ZaPP5dXelE9XM3J
 gfsPkCMa2mcbH8VlJ+Wtyg0jriWcHwb8p+V5N/0aRlFXj07PFGnBYVE2n w==;
X-CSE-ConnectionGUID: T0fHl6e1Q4OubjcnDA/tpA==
X-CSE-MsgGUID: 1BkSjiq1RRu39L+xijFXyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="35760479"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; d="scan'208";a="35760479"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 19:39:53 -0700
X-CSE-ConnectionGUID: tYlQoCpcTLK9x2DyMlPxEA==
X-CSE-MsgGUID: RG7gzVS1Q8u0ZDIaPPeMMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; d="scan'208";a="139485422"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 19:39:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 5 May 2025 19:39:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 5 May 2025 19:39:52 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 5 May 2025 19:39:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SOOgped1/2/4qW8JzZ2tvWhaI15+d5b9zxrlBWojn1eJ095MWmHvu4mgz29EsdO/pb+Cb4D/Z+YTaZ+0zU/Ke8OA7V8Nfc2zuHubRLHwxqpneXqG6gVl0eatqFuGBL7cMD0XQXyM1NYTHgCQi6+0oYpL/rbnQtycc2iVyUV9Z0kr5RrPjGmdCwZCZIK4jMP6mZDFXPQ2x+kZvlsbXrNDwDc37KYYHTXygcfoIWmOdXep9yeZtp1W0Km+29ZrXtKU2OgQDtiWnwDRgAlXn0odbGwzRDDHrdgoikfon1tyPeYr61l81Hk12FnWAPrFI1g8BnF9euR3pUnGjhEPa4pVtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJCMBtxM3LlZjn04SV6GieIsfrHXBIKr7Jt0bJJAe7M=;
 b=nUPzmFDA8UuZEjVJn5WvI8Y5Yw8vgJfvxCfmLyLWJWjnRqF6zyf/YM9Jr1VCptRHhVg0HnFqSQ53uHl3VJCqW4+6yKEAivyWHhO7HeRsnCDEbw1p7dZOUrdlBWLsXYPxIg6vfmCP+jw2S4Hfv1JH0Cc4XX2Zb/FN22iWqcpRl/mQOPS5llaTJfodahWptFTmxazYVg9ivqMlJh1zoyRs6JbGuBZteefeEY+41qETnqD1rXFAGapvvPjazBSa3iDilf+HQfgbQRN1zf5Ox67E94D4v8FOiqh+VSyBJ5rSIYiRA7323qoXQgcwVNlfOtphoHGqrQ9tBw3Fif4ZOnCtcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5784.namprd11.prod.outlook.com (2603:10b6:510:129::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 02:39:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 02:39:45 +0000
Date: Mon, 5 May 2025 19:41:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
CC: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>, Simona Vetter
 <simona@ffwll.ch>, "Melissa Wen" <mwen@igalia.com>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring
 <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 <kernel-dev@igalia.com>, <dri-devel@lists.freedesktop.org>,
 <etnaviv@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/8] drm/sched: Allow drivers to skip the reset and keep
 on running
Message-ID: <aBl2xaVBlYYyBt2o@lstrano-desk.jf.intel.com>
References: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
 <20250503-sched-skip-reset-v1-1-ed0d6701a3fe@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250503-sched-skip-reset-v1-1-ed0d6701a3fe@igalia.com>
X-ClientProxiedBy: MW3PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:303:2b::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5784:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ea9dc50-477d-4483-32ad-08dd8c474306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?y1siBsKJXcCt8LzvV+MOh2Bs0rmYAmyt6CiEb4YFmEH3RnVzvDEni5gGeK?=
 =?iso-8859-1?Q?f1L+lT4RL0CHZn3ahzvk86dC/R8pBFutaD5rGDcpWU/luzxsnmVwgyJcy9?=
 =?iso-8859-1?Q?dVlKaXaxfwtCfF7Ium/EKkEXfmeVahY8qYcP06dwpDk2t27IE4sjFxhART?=
 =?iso-8859-1?Q?Bxsc6JM711dXWcOQmS0uDA1xNhazk56unDTvmr3POyMPyhvNNbhcA3S9dU?=
 =?iso-8859-1?Q?bLAdX75HcHYAkEQX0DHgXahUxnNuAPhKPVcRhFwn++kzXT2xnHlwzYO+2P?=
 =?iso-8859-1?Q?WWMlcgWBYWigHNFnlu5FahiaLqPuIC4dIXJfI11Yn8aw1j8IqE0flvdPdJ?=
 =?iso-8859-1?Q?YKROUthbn19E/CvBn45/bCvpJCP1SICOkt0pa2tpuMvKmsR81wJznUaggt?=
 =?iso-8859-1?Q?pfOkDJJjSbpNOC6jBjqKnKZJcCHb981RTbaA/5/T0mQtqHRJUFWDyY5DYm?=
 =?iso-8859-1?Q?jSN5FP9Cupm359mHIH1tf91DiFbO8jFXapGEL7NJnZmRZCASI8nVzkBizz?=
 =?iso-8859-1?Q?dFEvjsCGj7x0P7MohGIxvmVxVjHKTUPpFzNAPLe30F8RsRZ20j4c21lObE?=
 =?iso-8859-1?Q?D4VH9vHPndBqyHXc19dSZmkTiaJDiZ1bZ2tq1uylcY2nqP3ktl6Lju02FC?=
 =?iso-8859-1?Q?RatzwlsdDcTC7cnK+Bzzga1kOrnBanDSOf6QTGq/4KayMO2PbjWcYcxDyn?=
 =?iso-8859-1?Q?mlHzCTClqbWtdIE3fyol+2Ie7gQc3vrKtP1b3h0R8xESuJg91mkR2dQr3P?=
 =?iso-8859-1?Q?Q9WUBe1zxrurcMFEktAhTNxpZYjwQW3Ykj0LwhtXyQ7HRQIAaNsUm0TC8a?=
 =?iso-8859-1?Q?gTYMvsNJV81UlzRwzRlpnbymJVdFlONgfoQsxNIj8gmxGRmlv/Hm0RQjRt?=
 =?iso-8859-1?Q?jWF+bAh1m6KdCXDB57ZGYV+IQQitCMXjownUexZTO47ZEXvQtX0NeT80du?=
 =?iso-8859-1?Q?9twVexFNIl0Ydp7w7WKCTts08atZKy7rW0V/jnA3LgEoQhaPIw2BdOggOd?=
 =?iso-8859-1?Q?uu4FKbl7LfNOB8OLbeKZ8oQjyiQLqPPXZzFJMtUR/WcX+oS8fPEYwhqxNS?=
 =?iso-8859-1?Q?XYvJsxRiPUO2jXEZ2uN5GbQlhbuhB8s9fSl+rYL1Dptxs/cYAomLrQbLN+?=
 =?iso-8859-1?Q?t/zuEeEpOwbyOPX40igrmBurDvwNC8XDl7bdBv9ecJ8qlQMo7xMNHzXDjN?=
 =?iso-8859-1?Q?cich5MRYm3Ud2klYCn9k7MHmJ2GwJoE49o5tZmQjzTEWxrUhJTE8ER6hx9?=
 =?iso-8859-1?Q?xNWoo/QaG6dQwYAq1iWJwLKHNRFAfisNMczea+JXlUtlUh0DcZ60G0Ksyo?=
 =?iso-8859-1?Q?WqBZsu/Nnq6dalJ+va9jt8qxJn1WRzlrXdkDk8ogjpHAlDbIaEK8tlTjDm?=
 =?iso-8859-1?Q?jHLeW8liTiAJfL3eZGL9kqC6LOf0reHRuVFti5tIAVTHgQH9kpsDQobZV6?=
 =?iso-8859-1?Q?QNYbzQcVQqIiHVskivYt+xTHRvR6nVNaI9Fq0NjwQVUQ23/IuCk0LO+nhz?=
 =?iso-8859-1?Q?k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qifyadZjtnasppCzd1V+bluNiCRMdsn4zWIyk8eIuSWf08WqmCGgWu4sG8?=
 =?iso-8859-1?Q?3OA65mGngZhR0ng/tf5es93JTcu3iue8MrjR2QG3C30kRTBhMfJx0GlU5H?=
 =?iso-8859-1?Q?lOJ6kT0jDBj4J4YbHWH8x6IpfKl+fqxml7TQXTJrZDBaY3se2n/6C6f5Hh?=
 =?iso-8859-1?Q?tughB1+OGBOp8qGD1y/TDJ1SaDLq5OjVg9ERfkmz04PQYUEoMbKpvrzHzu?=
 =?iso-8859-1?Q?o45iseJKEFAsFe60+f34b2THTAguj7mIxC3lllFAX2z/kvblIH7jhROcmI?=
 =?iso-8859-1?Q?/ow583yfLDdQ11/hi9i5P3gETwnSgx1Q7gI+IZ58How4SdO9PKvYE2Bwn9?=
 =?iso-8859-1?Q?3/re2p5BXQ9pDLjXzp24wZmviUWVqUzYagpr58nKPRyR1ZxC1JhrMjFnOU?=
 =?iso-8859-1?Q?w0FOIOKBlhFPDHkuooqUp9EJ3G9Pd0Ic6uTXtDo7E9Z7n5cCeJFRKXjOce?=
 =?iso-8859-1?Q?FExYwRD2LiPNZuHr4uxn4Hws5D449zr3/+7STg0oJ6p+JoO0YzjCHcQVh6?=
 =?iso-8859-1?Q?zCyiWm5fjpK/pOElL2U5jNwUIQaSAVOZLbzAsQYZDpJ6QpcfuigmjcbF+H?=
 =?iso-8859-1?Q?Q9855vSRoErowZwIBOWtMyY6f2NNhNjiFjp7iEu0t6LtXecFCh9RUMcs3D?=
 =?iso-8859-1?Q?R0Ti/1sqAVcjb5i1pWtvpiyU/DRCrP38wOPR0BKETJhyNLaGXTH2RZpPUQ?=
 =?iso-8859-1?Q?LjbM0/drMj+gV2/BOhxDLqiGxkOFINdhEmcvdKxSN++8uYJJHzYqPyXsTd?=
 =?iso-8859-1?Q?oo4fvFkAeYlAjZFUO5sUltZoAueC8LOIlp8fzn6039BIo/A+22/cyR2crS?=
 =?iso-8859-1?Q?Av05Tew8I8jpGHw/3qmQ+QOKkFtzEgsRTvDC7nSk7E4BsJdqOtY8uQ846j?=
 =?iso-8859-1?Q?bRPMB3oBZvxaE8VKGHNwVG3lDd9kmxIb92KoKcMkxKCBFiK8UWME4xDnF0?=
 =?iso-8859-1?Q?q+SZRXDTNbEA6tA/vC+8jk8J7h7kJadEF6a7TeP1XAuPlc/laxj80Z7WMa?=
 =?iso-8859-1?Q?OxJ1s1K6o4gIsRWBQmQbt4nZKouyHdl29mpH4DmAaR2nQjJUQKaH4WxhAk?=
 =?iso-8859-1?Q?HWoTXQ5lAmV2YMXjLDFVEhh/LH1spETglC5hqnw5nl1upeViNVPdAGHHwQ?=
 =?iso-8859-1?Q?dYpGVWqpn9E/UfvOXnasrpIh69q/gnblulRSPV1npIIzB+OxbfyxM3Q15t?=
 =?iso-8859-1?Q?mDc2DNcsxI6YCFVItj9ZXJWxdAOME//MGqOBMithaJhqq362j0GNN62mQa?=
 =?iso-8859-1?Q?K7P3HMzqSBjGv+vZlRsIfRoAGTfquaJBzmZjBn9uSgQ/83kMb6FYjYw7Gu?=
 =?iso-8859-1?Q?vGgbwwlnv9eseCuJ0yvLU9+TaYEFJHQetUcnEyL4rBX144JzAMXCGRqRB/?=
 =?iso-8859-1?Q?yBLrrISCi18VhbZk2LTYkdWpgDhMobiMa9bRoy8QWdGkDGqx+jBDsP/bDK?=
 =?iso-8859-1?Q?xefLL52XHdEW7FQkKdzQEVEle55lWLLgSRqRNxhhISUp2+e8P4aFrDiS84?=
 =?iso-8859-1?Q?GIL/S5nQxg11GrtILmpoFzCEGLYz0oJFJqti55vyyfUh2NFmPhu9XLlF4G?=
 =?iso-8859-1?Q?LHeekox3VJtfMAhWnLmMrp/NOsFlkJSjJ0L9uEMU301K76oJ2RyK8+gd/A?=
 =?iso-8859-1?Q?ONAXmgibP7SAvAVow6YD64px135ZEyQTsjjvnirYS9uKgL+YoQgz0SVQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea9dc50-477d-4483-32ad-08dd8c474306
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 02:39:45.3592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZJDUV6SesZZAFpGx/QEkUSlVACrfCywb4eaLpCExAP3nFeO47ahBsL5qtw/Uaw96kQXpIcnFvCUgeHKGYmouQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5784
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

On Sat, May 03, 2025 at 05:59:52PM -0300, Maíra Canal wrote:
> When the DRM scheduler times out, it's possible that the GPU isn't hung;
> instead, a job may still be running, and there may be no valid reason to
> reset the hardware. This can occur in two situations:
> 
>   1. The GPU exposes some mechanism that ensures the GPU is still making
>      progress. By checking this mechanism, we can safely skip the reset,
>      rearm the timeout, and allow the job to continue running until
>      completion. This is the case for v3d and Etnaviv.
>   2. TDR has fired before the IRQ that signals the fence. Consequently,
>      the job actually finishes, but it triggers a timeout before signaling
>      the completion fence.
> 

We have both of these cases in Xe too. We implement the requeuing in Xe
via driver side function - xe_sched_add_pending_job but this looks
better and will make use of this.

> These two scenarios are problematic because we remove the job from the
> `sched->pending_list` before calling `sched->ops->timedout_job()`. This
> means that when the job finally signals completion (e.g. in the IRQ
> handler), the scheduler won't call `sched->ops->free_job()`. As a result,
> the job and its resources won't be freed, leading to a memory leak.
> 
> To resolve this issue, we create a new `drm_gpu_sched_stat` that allows a
> driver to skip the reset. This new status will indicate that the job
> should be reinserted into the pending list, and the driver will still
> signal its completion.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 14 ++++++++++++++
>  include/drm/gpu_scheduler.h            |  2 ++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 829579c41c6b5d8b2abce5ad373c7017469b7680..68ca827d77e32187a034309f881135dbc639a9b4 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -568,6 +568,17 @@ static void drm_sched_job_timedout(struct work_struct *work)
>  			job->sched->ops->free_job(job);
>  			sched->free_guilty = false;
>  		}
> +
> +		/*
> +		 * If the driver indicated that the GPU is still running and wants to skip
> +		 * the reset, reinsert the job back into the pending list and realarm the
> +		 * timeout.
> +		 */
> +		if (status == DRM_GPU_SCHED_STAT_RUNNING) {
> +			spin_lock(&sched->job_list_lock);
> +			list_add(&job->list, &sched->pending_list);
> +			spin_unlock(&sched->job_list_lock);
> +		}
>  	} else {
>  		spin_unlock(&sched->job_list_lock);
>  	}
> @@ -590,6 +601,9 @@ static void drm_sched_job_timedout(struct work_struct *work)
>   * This function is typically used for reset recovery (see the docu of
>   * drm_sched_backend_ops.timedout_job() for details). Do not call it for
>   * scheduler teardown, i.e., before calling drm_sched_fini().
> + *
> + * As it's used for reset recovery, drm_sched_stop() shouldn't be called
> + * if the scheduler skipped the timeout (DRM_SCHED_STAT_RUNNING).
>   */
>  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>  {
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 1a7e377d4cbb4fc12ed93c548b236970217945e8..fe9043b6d43141bee831b5fc16b927202a507d51 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -389,11 +389,13 @@ struct drm_sched_job {
>   * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
>   * @DRM_GPU_SCHED_STAT_NOMINAL: Operation succeeded.
>   * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available anymore.
> + * @DRM_GPU_SCHED_STAT_RUNNING: GPU is still running, so skip the reset.
>   */
>  enum drm_gpu_sched_stat {
>  	DRM_GPU_SCHED_STAT_NONE,
>  	DRM_GPU_SCHED_STAT_NOMINAL,
>  	DRM_GPU_SCHED_STAT_ENODEV,
> +	DRM_GPU_SCHED_STAT_RUNNING,
>  };
>  
>  /**
> 
> -- 
> 2.49.0
> 
