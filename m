Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEBBA56EED
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 18:21:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E6E10EC06;
	Fri,  7 Mar 2025 17:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mURnCsLp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE3F10EC0A;
 Fri,  7 Mar 2025 17:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741368100; x=1772904100;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9mU6khbQBpOttOCLcwjXWH5rEHeJmpjIPFuvN30LB+Q=;
 b=mURnCsLpsCAwVRrJa7cr3Zd4E9Hx2VVecbRYCaghO86r2QejZYUJUGBt
 xF7wGlWCBCXDDD7Yz3ZtlQOrShCc1nLumPCnd7JOuCop96lH4gFynb0d5
 0rJzGomwaWejPwVOZODHfucJ71vvdxFxszysvwk40j0bx8Nh1Q8xTXc9L
 /TqgJ6IXuzQUeB+1+sSGnYkY4nH2eRyoqKeOY6TtKGcZTSXiFk8yx1quj
 adEO2kLG/AdKAIj+GONAQ/9XEr4FCupmqFwltlZ+HJirJd9Y1ZjVrj9jt
 wsVtEH+pYKfWBTXJMUiGPMNFbCmrcgtYuI6G+QXAYBnsVUp16xquLlv7K A==;
X-CSE-ConnectionGUID: w9scYmsBQ26psStYw7OyIQ==
X-CSE-MsgGUID: HEXtAIbQT/C7S3sAg0s+CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53061191"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="53061191"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 09:21:39 -0800
X-CSE-ConnectionGUID: WxysmFm/QS+eiJdmzMWVbQ==
X-CSE-MsgGUID: ZSqt+aFFTz+ouBG/8Ba2/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="142618189"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 09:21:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 7 Mar 2025 09:21:38 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 09:21:38 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 09:21:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMdnEc92PSC5Pt7roy/QuGCtiMQ/tE8GcTxT2Oo+8BF0wBPNMOutsq5p3VPjnLV9mgKEKKs0RW6Z+BO2HZLsJvWeVFxc3HV6pPnmB6QgFePeqLEUOx6f1wuruKfATeXBmtXHytcZHY6tNRWO+TmixaF4mw2M/OQgsh1tfaTODLRbk3eZM57Zn4qOkfhBm68WHSIxxZgYCT9ajGsnrbeJiStmqHgwwDlvRcyzLPjG9Or3dL5x+f4GFb5m6y5DFGwCeXIdsDTzVOcLhm7uXFish246N84QWNU8FhskABBOqU1BhpmOFmZzdmoOOT1p+5cN+8FdGXuUzfIWfJ2P+Hk8+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZvTUPJCNxThFa0mNx9ipMSPZ7MZpgJCpW+tb5ydgzw=;
 b=kWvXEa4YALdkZKtklyIz+cWaOS3O/1JDB/QOjB1jWO6Zp4i2hMe3Ut1enpdKRsYvEKPEj+rJ1cle1DmP2Lp9Yelwa0jN3vJEt3HX1+m7xtJwc7QU7whAzJvCAkmWJnR1APZqeYLnEg7Gki9RaFVdkO6NfmfhHoowFcn8FMkTFSDz2RdLvWm+pM4Be8DV6FVL2GE9y0tOAVYNQps8Ldi1ZgYZ0OfnM1H0f89G16Hdsx7V547nqVgB4xW8HKZUMp9zhiNWBVb85J2qgyAPuZG6qMGqTNJjhExRpyNLgheaOgTy5X4e8P4lTe75R55rrvQ2VXcwT/mwvdTBEyOo+EzkSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7891.namprd11.prod.outlook.com (2603:10b6:208:3fa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Fri, 7 Mar
 2025 17:21:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 17:21:36 +0000
Date: Fri, 7 Mar 2025 11:21:31 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, "Stephen
 Rothwell" <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm/gpusvm: Fix kernel-doc
Message-ID: <jtoidoyjvg6htjtomvp4g2l6oiks4qs7ylc2tamcggmv7atngw@eiw4bgmxu3ln>
References: <20250307-fix-svm-kerneldoc-v1-1-c786f73ae910@intel.com>
 <Z8sW4cusxoljxuTu@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Z8sW4cusxoljxuTu@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0279.namprd04.prod.outlook.com
 (2603:10b6:303:89::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7891:EE_
X-MS-Office365-Filtering-Correlation-Id: 2117b985-3701-4e87-5f13-08dd5d9c8381
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xd0hXNASpnENwCBy95e2L/NNsL4cwL5YxVGr9CZeOKI6hvsrIxQhbyScInzF?=
 =?us-ascii?Q?3eNJBrgEON1WhrJDo4tzXvT0NNSyzwD4bHUpNsXQ1y82NeQX8izMZj7FBXMx?=
 =?us-ascii?Q?SVvK2eAJdr++2ODki2QJG7ggNEZzCzz2/d+0kzeheV01x9DcCeu/lBUMJ/HS?=
 =?us-ascii?Q?1ibJ85UC93jv55LxlMU/RZYqhqABm0V2sTHTX7WAFNtIRDxeM0ZOT6Y20+Ls?=
 =?us-ascii?Q?faCS6rWYhaFDwBOR4kan+NWYKpM0sjOIsm4JvT/cTwlP8FN+RoVGimijjiaU?=
 =?us-ascii?Q?urUmzFwwk1ebdDvikqyY4aMt8v5gLr0Eq6UgSs7ZAsm0KzMGrH88W+AD0w9l?=
 =?us-ascii?Q?CBcdioGCFitDjMgYOwMozhUvjItjbLh79i7ufsyVrThQJiLTleQ1frTTEnV2?=
 =?us-ascii?Q?P8qwkNmQl/1VKkbJ+Wj0poUYjF58GaH7a+R5IesRAp6ZWexwRYLraOyt1TS7?=
 =?us-ascii?Q?l3+fMu+79ILZO9Oi3Qv7OFQsoTfHC/g5rSKob3AR3FPg1IhAGM8qZSOtzHXT?=
 =?us-ascii?Q?ibv6eDrwY8JYNSwWuir/QVTYYCDitbu/Qls4W1GjojnlNDvRGBa70wXT0HdQ?=
 =?us-ascii?Q?B6LETt5LOcMZc/Sfghh3e6KRgkDKOvNdy2NuJcIEGXmnb+2HZz9yWKfKwjDi?=
 =?us-ascii?Q?CK5TZi4RrDSWAuu/FJls5Z33+RLQoNoBQIpeYQuGGrqddLZSAgs7v93HIE0v?=
 =?us-ascii?Q?QvkqaeZ7+WzZS79qzUmKljm4CGcEA4jbihKh4lM78Ev70c6qbfNLpmnNQ1QT?=
 =?us-ascii?Q?2CfXEAwfuDyREP3BUlgGkxwcwvqOhyVfofPXEC+w5rDMWDyYexd3l8vL7UyA?=
 =?us-ascii?Q?Vl8MfAN6zY7gJ0LY8OagC/H0VoZGYet0ZRqU8uQTVbrCB6GD+fvxrSTmUAHV?=
 =?us-ascii?Q?Q6g6kjYWm0DnYkcVdLySQAjST01EHMd3h1siezXnWlpRzpvxNheISULSf92o?=
 =?us-ascii?Q?EAmn8kCXtwaRu3ndWXJpjje0mZNeEGN2ujEHTEfcgFsFmfZNuE13BzSqsEnI?=
 =?us-ascii?Q?KFQQW9MhmNfklGDvKGFGi16nJPM5pvms8glgkV1OCQMPhRh6pTdO2m+HDo3R?=
 =?us-ascii?Q?/PDodW7pB2SWE/cKlffVs2Cc8+v8jObmGdB9+GvnVkc4AC/vUqvnuVA0H9Aq?=
 =?us-ascii?Q?fpEQMTHlfJYi2L2A15ExJzd0EmMFRmUALig02HExlSidspRq1nT/MWrdRCDR?=
 =?us-ascii?Q?U8VBkhmUWSyISle6DUAIPrnjHgUM1gli8/7E3ZRGrBDTEVphGM7v6AR6eAYz?=
 =?us-ascii?Q?SURZ2piPo+7VLhXw27+vu8sd2lCwDY2DmJbLkuMYUGNYsMRMjuGAYS7aMv6S?=
 =?us-ascii?Q?JYZ5D2wPgz3JGVDI3BLoiQYoH/yy8bZEGTRlMElS8y3AkJEz+QvXt9hAi1mH?=
 =?us-ascii?Q?DD7O8AuJTXmCI2qSKSFR4cQybSfS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gK0gs1a1d1nMx60qv6xgMefmBgYEHROaiPOi0QMpDzPgpI0/MB40mywXJWZy?=
 =?us-ascii?Q?cuFcB2ytn36TNTZ8Yt+vtbrnKXjPxsKJXPC5BjReUzJjPIqnLTQFZtzmGKjh?=
 =?us-ascii?Q?MA1z2LQfxzd5uGnwtfLBWdBLee2cxPbLZcdc2kNjci7MKtTwsVXWukEb7Eas?=
 =?us-ascii?Q?5KnPbZENIewc1WFbZeTqtdZ0zAYo43LYqIi1haNAmHJjR2y7H9pDtXFdo3lU?=
 =?us-ascii?Q?qsKVwantTQ3BIJ51qwAh8Cx6Y/tIlrMISsPfJYfgnnQwSpXw/fj7ECNFSh7G?=
 =?us-ascii?Q?fkeTD3sMPLuZn4Qz7MfTsu1qCNte2ossvhdekE3szzuqnjeHfsQm5VKhH0Rc?=
 =?us-ascii?Q?YTe54+W5GRV7DuRxXFpxJovSd+GOrL3EfvoU5zQvo7geeBkoKlatqsj6p1zm?=
 =?us-ascii?Q?/ZDd4xGAfbxMzkZu1/fO4mNEBaRSylZCy4J9BBV8pz2McK+1uu902FZlE5hc?=
 =?us-ascii?Q?MIB684zdyq+xRpgoTsIcGhp/4LjacybsZ7LtEWHrYr788n5jljkgfg5/2uk4?=
 =?us-ascii?Q?tXVqqoddPSdCXHLlxSKkjcgpmWj6B3en+cP50GVeqz7gO40LTUpHTkxsReEo?=
 =?us-ascii?Q?ZfNoIBq2DHzYJuvUiSlAhldf4pBtbEg0AudVaPIpfjwJvFNaeFYUxTNVBUOd?=
 =?us-ascii?Q?N8RRLf9ctKkxUd69gb9wpPmEdMfUAEcorCGtIaXGyA9XVFmcL2RUVGopbC81?=
 =?us-ascii?Q?xcwwWF8nv6BFxMn2vZLERKhRwmaW1gvOK5baX6MWkpuC4OHhS4F6iojtxn6d?=
 =?us-ascii?Q?oCOwMKntNbdkKXBV/T4WkPgKnzWxH3YMiQFYKP0R3HMnrgLyRqp4Bglm1Ywz?=
 =?us-ascii?Q?9yZ8w8smyt8BfZlpqd+P3xoejcimPwWfigxkSJjNZLkbAx/PwJrrEnMPqyNK?=
 =?us-ascii?Q?AHXou18ESsMZK49M0FcmhANNhm7XomlLxjbTPfA3o2YXvHuzxxMKZ47cHkud?=
 =?us-ascii?Q?B1gCa47Gyru4anhmBLRYezmTWY/MCZrxEc+32bxXz/jxrxZ/d3miNU//J2yO?=
 =?us-ascii?Q?V3KeF2BgcKqIZkb9XngmO2yiEILE9f5tkzxlMIdrXKfMhFoUk7yO6KhReF3K?=
 =?us-ascii?Q?20r7f4hTwquUn6Zs3MCL+QwSyyLojUPUVNX+GBeyMoMUtxUYTIJGVfQ8YcbU?=
 =?us-ascii?Q?kwifPkRdS/4BCFn6MGnS6FKU6DD3AaIC/garnaFPD/Pxd4fJ3hXf6fwsweNZ?=
 =?us-ascii?Q?KSL2r/eRR2j6AkqD1GnvjP+/0S6FOwPpt+0QZPaKy5IWBgoar1Q1QLqqvD+W?=
 =?us-ascii?Q?Lkf1Po9LuMxCxr/EHpFSi67iwG2q8l/kCCha64emMy8TRaSgpIRQmMyLBaXE?=
 =?us-ascii?Q?CusH4baVL7rxzvzJ8o9IK9xxn5DRz79BQe2F0Z8GJ1fgWfJQmeaWNmsgr/Nj?=
 =?us-ascii?Q?t8jb77iG30uMBgRw2dvLb0SuufIElgkyaV5Wvw+Qt2/yAny9qrEdf+1kYWFM?=
 =?us-ascii?Q?Dkpq2CDQc25r8ryCFKWkFiBP9turm3Mrle9wkf3KyPMMbG3PQAd2ml9nJeEg?=
 =?us-ascii?Q?LdZQeenDgo1m/6A9+acLwUsCb5PzzuPVRo2Zsj9ogPw0pa78W5HrmbYTVGcP?=
 =?us-ascii?Q?KqTQ7yT9hip89bhodgBxbQBpLMpWn9GWswh9b+Qsde2O+ddnkmipUgl7nh7J?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2117b985-3701-4e87-5f13-08dd5d9c8381
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 17:21:36.0085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F8If9cH82qmrB48qw+I+d4jimYMf9fGOCRk9IcgBbR4RmrCcFb0+BOSC4KQW0LtrNfElMU9QbP5IsabLDYc/ry4bgfHZ5bB1bB8DmYU3ZQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7891
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

On Fri, Mar 07, 2025 at 07:55:13AM -0800, Matthew Brost wrote:
>> + * - Device Memory Operations:
>> + *	Define the interface for driver-specific device memory operations
>> + *	release memory, populate pfns, and copy to / from device memory.
>> + *
>> + *	This layer provides interfaces for allocating, mapping, migrating, and
>> + *	releasing memory ranges between the CPU and GPU. It handles all core
>> + *	memory management interactions (DMA mapping, HMM, and migration) and
>> + *	provides driver-specific virtual functions (vfuncs). This infrastructure
>> + *	is sufficient to build the expected driver components for an SVM
>> + *	implementation as detailed below.
>
>I think you have an extra indentation here.
>
>With this fixed:
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>

right... on a quick read I thought it was related to "Device Memory
Operations". I will unindent it.

thanks
Lucas De Marchi
