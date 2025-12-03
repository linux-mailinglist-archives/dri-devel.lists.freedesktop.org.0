Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BCACA0BF5
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 19:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BDC10E807;
	Wed,  3 Dec 2025 18:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ybvh7kjk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8F189146;
 Wed,  3 Dec 2025 18:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764785054; x=1796321054;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Hk7ZBIer0Cb1SUGRRHLT4ypGZNrcZB9z3tpH3rdoTtw=;
 b=Ybvh7kjk3lyOzkmuY0M1MB+xdSCWz/dFCnCrqlycxJTFINMY1Qcz7FUT
 5x/nc+ZSHRsQnXgPdakd8GgYr4jTRshbO7NC9k0vP2+i+R0gQ0oUAt2+W
 npx3Qtp0SPynlZu+pi1dRmiA2yXCFZdUYhCikPWHNvOFN3Byp9afdvccG
 BijgCQUTmmOHMmhWgRr91b0UiDMRDaApzJR20/IabWYNVIhgO1r2TDAzX
 nQ+jgRZkrFOxkIHjsQp8jprZwQ+KUu0ol0u6Bb6tV0KH5D4ExJC0By02D
 7+ccJ6oU56gKL5CdJoZDOcRzQdfduaH3xBOkZAnyJ6zUnJPxIVOzZM55u A==;
X-CSE-ConnectionGUID: MAed4Jb+QOK6bTrAEF48eQ==
X-CSE-MsgGUID: 31GDhNL7RveevSORFGdqOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84187235"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="84187235"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 10:03:59 -0800
X-CSE-ConnectionGUID: +ArR03XTRrailFF9c5pVVg==
X-CSE-MsgGUID: O7QWorwQSpCvz7+FLW3tNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="194674524"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 10:03:53 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 09:31:31 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 09:31:31 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 09:31:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XLFgekbl8RrUBlVGVovBoTEPAnd8ZFJYUVZZCIzKMEm26+e4BWaUuIwoBrnDWtZq9QvyCdlsB7i/8SJTMEsi/Ksgwx2Y4SDUlRFESoQAgwSyVT4z+VH0psiY0Hc7lg3Yf0j8T8uqh+kiBuLR1ITyIZFVbiLjBKgl+Uf7MQt6XsAN3zXaXPBXmqdgjakp/6+7EIaIZZJ0VbDMKMY1FJYXPjkTeqnnYBH0my6D/TrAshOcxRIgPgwgy2iD5bKsZPMyUh//gHP5i/CEKUFO3pw4OaYxca2e9ifWAhyJZTUHY9/By3LwlM8UfpcuvAGRWAUzLpJ+clIAtAMxDvnkM1FYHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xS8Qk1ssKLEurp4tyoe0dmiinN+D3yTkAew8cAif1g=;
 b=CjoW/fYS/DAJd6WdxUHSCVtJKsnl8NAqycsW2mPFiK0yPDAqGxiwKTfz52FirefEPacf16jGe6o7nB7GBc4TwbUVUqb0rhKckdHzKXOX3/XCvok3pZCH6u7Yvjbo3dEibN26abjSQDrJ56aE66KbDkU5SxZiYL5NGwQcIX/8MQK4W+r3kfV1/MM/MjB9WWEuMtic+tmrD+/HRiGMy517e9CBHelNbVfny/wee4L8+YS/9Xx2G2XmivBR/reo1hfCJoCkMw6vYqJInE5ituuzFAolCN4UjdKkMbDYv9SBiR6sZdQVEHBuQ+Mq9J+3RDcg1Q3FQIGdIiR0rKR0XzDsSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYYPR11MB8431.namprd11.prod.outlook.com (2603:10b6:930:c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 17:31:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 17:31:28 +0000
Date: Wed, 3 Dec 2025 09:31:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <phasta@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, "Gustavo
 Padovan" <gustavo@padovan.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 "Alex Deucher" <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, 
 "Simona Vetter" <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, 
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 8/8] drm/xe: Use dma_fence_test_signaled_flag()
Message-ID: <aTBz7UTCoPvzyJcA@lstrano-desk.jf.intel.com>
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-10-phasta@kernel.org>
 <e67b12d1-111f-484a-8374-4152d3b9f328@amd.com>
 <a4655788feddd883f70aa374e4315cfaee59a88c.camel@mailbox.org>
 <d7b6efe8-5343-45a7-b16e-441da15145cd@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7b6efe8-5343-45a7-b16e-441da15145cd@amd.com>
X-ClientProxiedBy: MW4PR04CA0249.namprd04.prod.outlook.com
 (2603:10b6:303:88::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYYPR11MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: aa977513-a7bf-4dca-6fe2-08de3291caa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Gg7NWhi+05k68ex7+HSKK+0LsX5a5jXM1863imNl11HlcNrZMSuccHgAfv?=
 =?iso-8859-1?Q?bLkCPGpxRqDEqBbWrrtqgMMolLRsrDFj7xE8LHeY4sVWVQuHe9VsArWEOR?=
 =?iso-8859-1?Q?16yVNG4v2vi1H1h7xpGHyvMNB6lmvPm8s1gIutmyFEzpN1Dsjvyf9RFYkb?=
 =?iso-8859-1?Q?G1qCITKTpSxUZCQT5T6CFEJMd6yIcwEjBEIiNvIuGCGDimqba1Tvm0L4d3?=
 =?iso-8859-1?Q?ziRVcvEHIm2ZsE6uutCUS6e809qN2qvTipweDPxoHBBce1rSe52RBDrGSO?=
 =?iso-8859-1?Q?ir84eIX4ZbKM/0PyhveHk+PC33Rj/KD5CEnm8JuuQ8f25HNvD+Yjy3Hi8b?=
 =?iso-8859-1?Q?dFplD8nYzxqqw46gVAu2NOD5nKl+qHZRKY9XQWiYYqsWrjm+4UOA43LrZl?=
 =?iso-8859-1?Q?pVcovK3SlAP8w/HaYzysqTbkM7l5dyL00fRYfigzEgwHUE96VviBcBXFoI?=
 =?iso-8859-1?Q?FHfCqMGvwQE9M1Fc1vJcZSRu//fbsgTeGoxvJ7fTLVKGuq0kG1tRR6m4q5?=
 =?iso-8859-1?Q?QnqSmmzLUHEbgD0CmVO/MdTAydSTCJRudmqtcw8k6SLF1qQt9+GGUo8pjg?=
 =?iso-8859-1?Q?rzliWcs2rZ0k0H8/zhI2ELDXnXb40byP/Cx62nPp+YtKWIfTYeCP1LTa8q?=
 =?iso-8859-1?Q?RKPQAyLsm7ya9W+osv0YJmJ2U+lCnAMGVQvQHdVJTGuXJZ2s55elFi4z9k?=
 =?iso-8859-1?Q?8cLe4ZQnDTR52c/fNgvBoP1i5ETjDuYQ8y5nEvoTzfTVlb4V/kdeg87M/Q?=
 =?iso-8859-1?Q?PhKWXq8LyvZSI2aAp7z6+KmnLcSC3Qg8mjUJShd3Snq9Lzorf5iUuPvYLN?=
 =?iso-8859-1?Q?buAVhaQq5iJywRwK2NWKeG93vjFfLs9BXZl985TYxowwMSkmENxocDzvnz?=
 =?iso-8859-1?Q?X/R09of1yg/8lzGiip3kdyD8LdXgcmXoA+2ouqiL68o2Ax7bYS2+Dm/5Bb?=
 =?iso-8859-1?Q?KuzBuk+S6HESG6FfHJXa5ONGskQJfWc2rBfBMhhDDNMoDgp9aJl2xjOIKC?=
 =?iso-8859-1?Q?00XFc1eP2yLkPfpnj6REAHFgCc5JRFGRdXv+LTrwIZ96LnuZY+Z70uKqqv?=
 =?iso-8859-1?Q?UYB8kGXKtmS5fGz2TbHBJ8HhIgVZP2Lfk8kzoUtsaiAuj7q7xWz7nUDq0p?=
 =?iso-8859-1?Q?mxfGAQ6KyOPYMz4+3F5Ksypf287z0P2sq1wAF7fXXxdS2aDMMOA6jOj+Ia?=
 =?iso-8859-1?Q?Xs0dOFI4qGBho755cRdhJVLX3RoIFZJ2NkETdNjutXrZGw68l5auRuqdhu?=
 =?iso-8859-1?Q?+j50l/TzFQLjyUxNPt2qj6mHla2RmasYH5+6FQKQ+XES74RgvjpRdgvVRl?=
 =?iso-8859-1?Q?0QmypQNWFelhKHDO/7aWJ48WqyOjHvA4y1lQXenrD3muBtl86PLueDZ8Ql?=
 =?iso-8859-1?Q?ohEZQjIFwtkboF9anz08Gl1gTu2ylmtMVdEQbKIE0xoP0Etr5ICctx6ZT3?=
 =?iso-8859-1?Q?/JAGxLhflHnO4HJLpR2feWkxmhWPJQbasfzePNOtr5QkUFfbk/qHwqEyq7?=
 =?iso-8859-1?Q?rm2T+IVxzFKgb+2DyuTuHh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dAYv9SZk28+nhOb1HLzuaPIIKrfzFJ87Nw1AM/Hvt44JwdvBoJut5wxvhm?=
 =?iso-8859-1?Q?CtBX0YKOHVvll5scng3z5rfYvJ2GmsEqwICxoZvXe1zZ1odtXOS5HvhAOt?=
 =?iso-8859-1?Q?D2oMq1Kwy3MXIHV/PE14+gTSPKpXDWNww54YafWPkoA5FmdPOTXybmlOkF?=
 =?iso-8859-1?Q?TwKUwQi7JtSIZkeygfeksbtMUBolrXv9EcBZoTrtHByrOAuJUByORhiq0q?=
 =?iso-8859-1?Q?l7PsJLf4l8Nyj5hXDyQpA4LS14MlYTlTCw2poRwf5buA6BkiO73w5CRznP?=
 =?iso-8859-1?Q?639cEom+Yj6MZExq7wd3VFgDHfNccTSq/3N07A+4TJxk9yodLwFCG6h2RC?=
 =?iso-8859-1?Q?0CVaPg/MltA22y4Ltnzmib45JO1Srdky7DZJOEXwww0dgHcF8fR7OxASGz?=
 =?iso-8859-1?Q?opmgQmx0IUFPnvXz6vht44roXP1A86UlQ9WnsZ7Ji6KCob+1smKur1zICa?=
 =?iso-8859-1?Q?7aMorGNcpl4Yxmalpe9Y9zWIE5MVZTan96KJt4hxkfyBaaTej54CDylgVg?=
 =?iso-8859-1?Q?vgz1D4HCaVuT7YESr/g221i3ACWj6zg9VeC1GSYTCfcxJNCMAezFDhn2sN?=
 =?iso-8859-1?Q?gNSLlxoIOj972+h4ygMHwi+iJZrgbG/E/8qoeKmRsXZXgabroWqeN6FKDj?=
 =?iso-8859-1?Q?TL/6+g5Ed+WVCpiPIbeNrb+vEg9hMr1lXnr/xIxeBKGu2hdczO0mosw5Le?=
 =?iso-8859-1?Q?6pHLaVx9D0nac+JAbJJqFAo8VQudKmYJ8bwHDffG9IRze3GIazqZhsQ48b?=
 =?iso-8859-1?Q?6EPgf7Tieu8N5Gf8HRDcQuNodTz2aobms2mUf3v6znyLdsdDUgTpW0+ow2?=
 =?iso-8859-1?Q?tjTZDQ0v3vXRnYRwfhiWnCQ+uLpUn6z1bvmiR9CuJeqCXLQrnWB1+i0IOw?=
 =?iso-8859-1?Q?edPl1H1mYAVkclm8hDTz9EfV+URpgoNGRdAZNnOHC5y/u3lxlaWGpRbsXI?=
 =?iso-8859-1?Q?1fSPMJRVenC3cE1Qq+Ou+xrR8s8+PDVrXp8bN8icYhFSVFiYPaL/cju+t0?=
 =?iso-8859-1?Q?skWNZvTUehBbmvT48LD4xgVGyzfn1DyMJLmvt+eiGTUJxeAT5S1LACnfVO?=
 =?iso-8859-1?Q?tCgWljI1xH+/9IhPqnX+kPry2MgKG7canoy0jLCT3vDg9JNm/I57TCPaHX?=
 =?iso-8859-1?Q?7rnBhSahYbeM/pvAy7Sjr+0p1Htheye+INcGJPmE1w5ef/HhvIAuXtizFA?=
 =?iso-8859-1?Q?HEC8V6RpSDjqn3uH3Oqa7zt0mKXN39GVPzPeKvO4QCF3XDGyTxB3Yj64pn?=
 =?iso-8859-1?Q?TgmSo1wTAcxKAxe5GqeZX1AVwe4+yQhGgXMAFF71IvsQGIaDO0Shyi5QdR?=
 =?iso-8859-1?Q?ydN/DhespEW8QpbBCNHMGIaQKuBAocn35OikLZeeXR+MYiLknp76/tLp63?=
 =?iso-8859-1?Q?/O2OcdTCvAu+CNSmntDBEOtcTyjnMfkijVPgRkd44ZQm9+Nd5n1koPL7d5?=
 =?iso-8859-1?Q?LEbjfcLZDtGerpcuYdiymLX5MCtsgAVHa3mm0Wu8RIhaWrIO6IdHUTPvPV?=
 =?iso-8859-1?Q?uuzqObdq5I0BA2SP+TLxiMsecUslsfzAYEpMMWw9yYhswtPdSIf2KBrZUl?=
 =?iso-8859-1?Q?/muZ54G2hmb14xeK+DbTGRnQzgpUJnjgMp9R9tgWwPXII1wgIAIMzF2zdf?=
 =?iso-8859-1?Q?yTAmBiabQ3pmDLTaw1ZUuYWfv/UJy5yonnJjPOFI4tNgFNBWuKELqIrg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa977513-a7bf-4dca-6fe2-08de3291caa8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 17:31:28.5924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7hHitfz/IZQsBBWTEDlXixzcc3lVKyerVChXRD480uwaiXTnqnNl9xpu20t25sxfXrJT+XlBIzOeEFcVUXP7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8431
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

On Wed, Dec 03, 2025 at 04:24:26PM +0100, Christian König wrote:
> On 12/3/25 16:18, Philipp Stanner wrote:
> > On Wed, 2025-12-03 at 14:15 +0100, Christian König wrote:
> >> On 12/1/25 11:50, Philipp Stanner wrote:
> >>> There is a new dma_fence helper which simplifies testing for a fence's
> >>> signaled_flag. Use it in xe.
> >>>
> >>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> >>
> >> Acked-by: Christian König <christian.koenig@amd.com>
> > 
> > This series would then be completely reviewed, it seems. So one could
> > push it. Question is just who and where, and what to do about the merge
> > conflict with intel.
> 
> I think as long as it isn't a major merge conflict push it to drm-misc-next and make sure that drm-tip had the correct conflict resolution.
> 
> > Matthew?
> 
> Should have the last word on this when it's an XE merge conflict.
> 

It isn't pressing to get this patch into Xe as it is just an addition
compared to patch 4 which I believe is actually required for
functionality in Xe. So to avoid conflicts maybe just push the first 7
and for patch 8 once these patches propagate to drm-xe-next, I'll rebase
the last patch and push it into our tree.

Matt

> Christian.
> 
> > 
> > 
> > P.
> > 
> >>
> >>> ---
> >>>  drivers/gpu/drm/xe/xe_exec_queue.c | 9 +++------
> >>>  drivers/gpu/drm/xe/xe_pt.c         | 3 +--
> >>>  drivers/gpu/drm/xe/xe_sched_job.c  | 2 +-
> >>>  3 files changed, 5 insertions(+), 9 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> >>> index cb5f204c08ed..06736f52fbaa 100644
> >>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> >>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> >>> @@ -1037,8 +1037,7 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
> >>>  
> >>>  	xe_exec_queue_last_fence_lockdep_assert(q, vm);
> >>>  
> >>> -	if (q->last_fence &&
> >>> -	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags))
> >>> +	if (q->last_fence && dma_fence_test_signaled_flag(q->last_fence))
> >>>  		xe_exec_queue_last_fence_put(q, vm);
> >>>  
> >>>  	fence = q->last_fence ? q->last_fence : dma_fence_get_stub();
> >>> @@ -1064,8 +1063,7 @@ struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *
> >>>  
> >>>  	lockdep_assert_held_write(&q->hwe->hw_engine_group->mode_sem);
> >>>  
> >>> -	if (q->last_fence &&
> >>> -	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags))
> >>> +	if (q->last_fence && dma_fence_test_signaled_flag(q->last_fence))
> >>>  		xe_exec_queue_last_fence_put_unlocked(q);
> >>>  
> >>>  	fence = q->last_fence ? q->last_fence : dma_fence_get_stub();
> >>> @@ -1106,8 +1104,7 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
> >>>  
> >>>  	fence = xe_exec_queue_last_fence_get(q, vm);
> >>>  	if (fence) {
> >>> -		err = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) ?
> >>> -			0 : -ETIME;
> >>> +		err = dma_fence_test_signaled_flag(fence) ? 0 : -ETIME;
> >>>  		dma_fence_put(fence);
> >>>  	}
> >>>  
> >>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> >>> index 07f96bda638a..1ca2dec18e51 100644
> >>> --- a/drivers/gpu/drm/xe/xe_pt.c
> >>> +++ b/drivers/gpu/drm/xe/xe_pt.c
> >>> @@ -1208,8 +1208,7 @@ static bool no_in_syncs(struct xe_sync_entry *syncs, u32 num_syncs)
> >>>  	for (i = 0; i < num_syncs; i++) {
> >>>  		struct dma_fence *fence = syncs[i].fence;
> >>>  
> >>> -		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> >>> -				       &fence->flags))
> >>> +		if (fence && !dma_fence_test_signaled_flag(fence))
> >>>  			return false;
> >>>  	}
> >>>  
> >>> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> >>> index d21bf8f26964..1c9ba49a325b 100644
> >>> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> >>> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> >>> @@ -188,7 +188,7 @@ static bool xe_fence_set_error(struct dma_fence *fence, int error)
> >>>  	bool signaled;
> >>>  
> >>>  	spin_lock_irqsave(fence->lock, irq_flags);
> >>> -	signaled = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
> >>> +	signaled = dma_fence_test_signaled_flag(fence);
> >>>  	if (!signaled)
> >>>  		dma_fence_set_error(fence, error);
> >>>  	spin_unlock_irqrestore(fence->lock, irq_flags);
> >>
> > 
> 
