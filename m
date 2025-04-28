Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2AEA9E5FB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 03:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B3210E1E8;
	Mon, 28 Apr 2025 01:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nsYlQcDE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F43B10E1E8
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 01:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745805199; x=1777341199;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QdW4WAq4KklVKn8QZninb6RwUzk5Zs6JoWRDQzEZQuM=;
 b=nsYlQcDEMb8jDsMhKh2F+O7d9IfSPIkOUTi6PR5h9uG+XDftSeNzdAqE
 cUk9VyPXFkMtd3J7MJFRaZCxLIo8/qt0zsXseJCGB8BhJ7fEtz2EIEtc8
 7Ppb5sSTITicrKE/jvFXYj1Tp2LToxfS5s5jJCayLbwWFMvadejCOB+ih
 PKUpkqK8cBVzKxcz+2cdYdzde4BU6EjjTiRIUYCbOx/+JQLaUmMTKOaoj
 1NzleGHPJK0S44lQLoqIOb26k6cHYkmL/+j5/HPMBoNACNhNf8LO/8WDg
 7sHATWudrFOWPXNDHQOSWvcfuQcXPPB1eN7Rhsq/xY1x4NUc24RwppcoZ A==;
X-CSE-ConnectionGUID: prLHVakMR1uDfOvlqWChrw==
X-CSE-MsgGUID: 0VfV93xiTd6bSjl91bSEdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="58750837"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="58750837"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 18:53:19 -0700
X-CSE-ConnectionGUID: KBh9UxM/T6CHhJreU8axrA==
X-CSE-MsgGUID: DgK1IvIATLqkMK6Oz753lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="138193674"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 18:50:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 27 Apr 2025 18:50:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 27 Apr 2025 18:50:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 27 Apr 2025 18:50:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXRwLiEGJ+EyHAhm2zLD6qwwHzy9gf6NJbdru5yP83gmgTT5s8oU3OPZyMjqS/0k44lQcW58ttObVrGPGc2Ateg3uIZmWxe1z8xZD0wbJj2pa4FkdB1Hh+AVY8dryaWWq+4mjWqqCgQKRvnm5DWrvNdKZjmx5D1DUI54N8m158Fidi9yR03KnKCfWc9sQfEwidtHU5pckqcn1fmAsJlWdlSczQ+gkt0glkVR2DnjwWX7je1+LgBig+TVBxbd4h8qNJvsPvgrTTnOLvcS13RnR2XaGGU/vJPnXwvGy3lGyJK7SIV6hgg5gdIxu9+Rqw4UoQU15D6LQ4S/AMQTHQKmAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYugqqvSdRaXwygctQRKoSpaiJi25+QigVJ4Pp3nMDo=;
 b=whKkjUwn5tyKEJuWh7YFuCA/ofao3bbhTpH4qC661qjMsnwwwvC8L2TsHohb5wZI69sCcnQ8DOql89zTLe6DPliF12xpUhYo56EYbgoK5ZJjf6ejwxyxLLy3QegG/O7IjHAzBMxxMt8hS5xBnilv4R5UNWeHfBc8lD8kaBi5XZQCVB6NtAqq2szFQCn378nzbYvCACZ9MmPBaKFKIF4ORkC6+0i9Uj1XmhBnal4Qa1Md2L4dqjB2B9ghCvkuwFPLqEa6MBDZzo2Vjx4Ssx8UIBb8lRQGF4+Eq+ppIJalMEn4VCh76t1lUamcHtyO+W2EGCi5PK3UbAOmCXISGaRccw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB6050.namprd11.prod.outlook.com (2603:10b6:208:392::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Mon, 28 Apr
 2025 01:50:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 01:50:09 +0000
Date: Sun, 27 Apr 2025 18:51:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
CC: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@listxe_uc_fw_types.hs.freedesktop.org>, <saurabhg.gupta@intel.com>, 
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <jianxun.zhang@intel.com>, <shuicheng.lin@intel.com>,
 <dri-devel@lists.freedesktop.org>, <Michal.Wajdeczko@intel.com>,
 <michal.mrozek@intel.com>, <raag.jadav@intel.com>,
 <john.c.harrison@intel.com>, <ivan.briano@intel.com>,
 <matthew.auld@intel.com>
Subject: Re: [PATCH v23 2/5] drm/xe/xe_gt_pagefault: Move pagefault struct to
 header
Message-ID: <aA7fIr4869zP8LG3@lstrano-desk.jf.intel.com>
References: <20250424204917.172708-1-jonathan.cavitt@intel.com>
 <20250424204917.172708-3-jonathan.cavitt@intel.com>
 <7jwsm2mc6nb5khkhgql6tdb2nb6tlmutprs2x4fjboqoiqxne3@fayagpsyc4a6>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7jwsm2mc6nb5khkhgql6tdb2nb6tlmutprs2x4fjboqoiqxne3@fayagpsyc4a6>
X-ClientProxiedBy: MW4P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB6050:EE_
X-MS-Office365-Filtering-Correlation-Id: 74d7c326-8fac-4e03-48fe-08dd85f701a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?7ttr1QlxY8f/9mtC0H8U9y8VpTIyDkahsDjoapcMyK8s+mj9ZmPdk1x/O5?=
 =?iso-8859-1?Q?4R27mcE/5OR6fAppVwCOw9xpZ4YlcaqFkO2Nd4HCv2XrsuthJf9C4rvLjq?=
 =?iso-8859-1?Q?rBfbBInZA/obBs5WIyYyTWMgIq6r15QhhWaQD2fmXzMzq74wNeMFOFPYKH?=
 =?iso-8859-1?Q?EwjmSrUgBTowpD+VZzRmtljPqPfZA7DbLhOK8+rppJhcxfchY/PjTYkjNo?=
 =?iso-8859-1?Q?mQZf+O5DWS3t0Xln6Ty6xN8WCaqZuljxn6RLMhtZEB/E+Iip73zJJIC+uf?=
 =?iso-8859-1?Q?KZ+MyNkVRuN6ICvG0v18w1kBUoJZ9ZQBykMrftY68suxHaK+7jWGQDV0ht?=
 =?iso-8859-1?Q?yVIuj2tL+iGGV78KDieMOB/5qREaEXEPBEirU3miBh8EGXaQLLg4ErOuQM?=
 =?iso-8859-1?Q?h534T9qEd2u3IoEfw0Rqm0AKOtcPa5SGvqJAgK3DzmwK9ustWqO9yNUBhl?=
 =?iso-8859-1?Q?Zz/ge2nHg0b9dv3zT9t2+XZDDRJT31zivcYHVt6Nq/0vKPTMJgt86TP+ct?=
 =?iso-8859-1?Q?zp7uu4pZ4KK3vX/2A/N581mi07TvEPtuzB8Rxa9WUyiFlfn5IizwSOWZRR?=
 =?iso-8859-1?Q?mUPzw5DyWilNo5w/WAHZN/8JxlBddvQvadWJTrg7o7ESGbAb2QvNyeUo1N?=
 =?iso-8859-1?Q?d3RIUZrk52mBFex8Nmm0pI87sA53oOsNFFwJWIqSlM+wR5Gy0VbviMAK4D?=
 =?iso-8859-1?Q?gJHtW48o/TDv04x01OwCWZbUPyc6kByWgMS1r8Fpu8fLaOe03PNdeXPeKu?=
 =?iso-8859-1?Q?sbkUEY+Q0qMhT23OljwQLsBg90aPrQbdmmVSM/9/tXqguyvVW3Ra1a5ThK?=
 =?iso-8859-1?Q?PMc2FdIVtIpAvVEXUJeIr16TFHMtCt2LgId/Q1MPUUaDeyFp8v5m6+HieG?=
 =?iso-8859-1?Q?ogY793n71ATr+OGt6oQA/6GyVVockmryCQ3CTWUEKXYSVdaqRsl+SUaVO+?=
 =?iso-8859-1?Q?j+OwTGn8mdbTRc/uFFJai20gQFdvh03qArIxqSuRGcMOi1I1oug1ZHW3TU?=
 =?iso-8859-1?Q?EO0YbYdfm65nWor44SzRnuR7uXHdedK3KLAwCdSZ6tbQisGS6m6WTOHQIy?=
 =?iso-8859-1?Q?JwGbVXZSCWq9izP4qwK9yeFwo6zPBHUrci8aVLy3ZVhYHLJ7pg006h2tIT?=
 =?iso-8859-1?Q?prg/Wb4MvV7Q4yM47c65SiR5JXoIX+JtXKdvFSu4RAoHP03jQY7lyoMBsm?=
 =?iso-8859-1?Q?lWZizrHjtrxQRdNYFNjM5VSG/8/rt+xnwelLZxhL47H/U8D9JcPHHIRFGU?=
 =?iso-8859-1?Q?a68GXbmMNnA4XI1dbYz/eOaW0/KzK+fyngpi+0Y3xJMKAK0STkYR4JUn6x?=
 =?iso-8859-1?Q?VnVGP5o2qHG1RrtO55CdGR/sqoVRB6blLZcperQ7zu1/6wuny0T3wFLZ3N?=
 =?iso-8859-1?Q?dg2hpOfZfnnCAqGjTJbGmpGoY7TN7Q4z5xR24IZzLxVplTcv8Xo7hqlLZi?=
 =?iso-8859-1?Q?krTeZ23IjNMqn9L2XqMbC+N6h5pfR5KgD7/1rSm8TaYbRG7BGrzOHl72+f?=
 =?iso-8859-1?Q?8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5LCQg5c0CU8qx6sEYO00EcT3HtPa2JL3zniA8ySfFhen6RMw5hEGhfc/w5?=
 =?iso-8859-1?Q?eEM2GiXxFgZaJImntFAczYqiOwyjfQqkdZXIA0eb1OwkL+M93XmdXcbEGE?=
 =?iso-8859-1?Q?UFl/R0A1Y0MLYK473iomDA/C2mRaphTh9tVNnul5g4nDrbkMags7T8r0uZ?=
 =?iso-8859-1?Q?pT2Cce2UddkmkIozGQUosuyuB3a+EkrwGxp7cLT3SOkNfuej37Pk8wzksH?=
 =?iso-8859-1?Q?glm1TX9yaVbBQnV8NBxg0uzvrbMzRu/pSUFXOAG2tHX9VgYvDeAEcft3cZ?=
 =?iso-8859-1?Q?kLSjz139eA6jXQLnhO4259IXbmL0qDCIm4U0UM03M+59msl5G/abbf/rHl?=
 =?iso-8859-1?Q?9upfkYE0TDhsCc+7ZLe2hTy3l4ie3WlEo2i/MAM803O5vgz9RH2me7Gvb9?=
 =?iso-8859-1?Q?Qe6ztqbO7zUmAelQfMXOofH5ddgHwYe9xAay8gH3Ez6R5nziAXpbLKp5f1?=
 =?iso-8859-1?Q?xwvBsVc4kbZLtNtf0QPy2p1R37yGwjwZHC/U0fWKnlLr7vqiaP2sOa/1Z9?=
 =?iso-8859-1?Q?arLjYLAOkB/+CnUaQeDybZSL2FUzycpzFifbmyIvaEqQy3fmgtfgY1juBI?=
 =?iso-8859-1?Q?zoNCrmi2/UyLVO1YsrSh9f3O2EbsJTOoUH5m8PTdFSN0Ym8eINcHI1avxw?=
 =?iso-8859-1?Q?+QtzkYzO+E/I5+s/+aGcL+MiE284GUT5Kp3B8lXitSXJ54IBJ9u1WFoUMH?=
 =?iso-8859-1?Q?2cBBbylw19MdtgXiclfLZfHjoyinS76MS2K2SLVQrry1rPTwDsegFHaQw/?=
 =?iso-8859-1?Q?7r8j+JAzmahlv98TRHWQQqgSvPEQCcyCAVAz69DPBM21JshVNqmP77bA45?=
 =?iso-8859-1?Q?3dFcm59NJfFI+KyhPwYpvEy3SRzsCfsdtLFNIrb4XauER3WpA7NkQgMYT2?=
 =?iso-8859-1?Q?/j/oz3aS71gZqDEz/c7Dbehm8SU/FA0aLN6B2JC8Rxyw6vlVRz4Cv5YEO3?=
 =?iso-8859-1?Q?/J6u1516Cv8M98hcNUsEU+IzapiNSAaFbDAdiKTHLzM+qq7waZMh9KYsMQ?=
 =?iso-8859-1?Q?OPF5vnnflMjkXk/30RU5jNJJrA7fHJmNblKIxxdp4zs7/KDYD27Mqgf+S0?=
 =?iso-8859-1?Q?HbjDGBAcTXRyBUw2XqTmqUENFTpjP0OKWBbu0+a7sRBVosKc+tupw5ZyST?=
 =?iso-8859-1?Q?uKKvPns9nchi8A8Rth2qtYKFxEqcHcJYiJag9NWuCqHSUVmcUkMI9+EzzO?=
 =?iso-8859-1?Q?Awm6a+MTfAVVia2Tai6kAUExjPICk8GlxHKMwsgUUZ6nMofM+Hnup8/fYN?=
 =?iso-8859-1?Q?oa0qfStR0410nC8fURgCWGY8ojppClS47SBOzctQPPD/L+7laZCcyP++RP?=
 =?iso-8859-1?Q?du1pzT90tIhrhyVkgGSCEUIiKGEQLAopgCj82kHQr64JGdqEUz8sM0kI8P?=
 =?iso-8859-1?Q?b4ExdoMNGf3X7DYt1ET8GVr7uui5wt2j9G0i7YRt6PUUoNReIH+toPjVCI?=
 =?iso-8859-1?Q?4Ki6MKUirVd87xDi4pZK0ruXZKgMabaKrqwtALhWdyOl+R9ITrVJ3GZwUI?=
 =?iso-8859-1?Q?vNusm8LXncbUCqkATgN5PFhAf7hWJBNVakaf0/xThnjZMUn8fD8PR6JRJQ?=
 =?iso-8859-1?Q?uSRPENAa6HnP+7IkkTh3ylETeN8JI196LrIblfGmD0B3AvmZfVCC4usEoM?=
 =?iso-8859-1?Q?UFJcvCNAFI0DIHfQVTR92Mw2+DuwhCfMRxJSMim5KSAuE5qCDNVKCIIw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d7c326-8fac-4e03-48fe-08dd85f701a8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 01:50:09.0707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XqT8Jj3DOxA6ipGqgkzp1VTqlGCZ/EHeA8FDbJHae98AAoHkH3W01O5nYBrWS+igM7n7a/rM6Wk6Lkzl6EaTKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6050
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

On Sun, Apr 27, 2025 at 02:57:22PM +0300, Dafna Hirschfeld wrote:
> On 24.04.2025 20:49, Jonathan Cavitt wrote:
> > Move the pagefault struct from xe_gt_pagefault.c to the
> > xe_gt_pagefault_types.h header file, and move the associated enum values
> > into the regs folder under xe_pagefault_desc.h
> > 
> > Since xe_pagefault_desc.h is being initialized here, also move the
> > xe_guc_pagefault_desc hardware formats to the new file.
> 
> Hi, currently page fault is assumed to be handled by guc only.

Yea, this is layered incorrectly - this is my bad. So in our TLB
invalidation code, also my bad.

> In order to make the descriptor more general, I sent two patches moving
> the descriptor to xe_uc_fw_types.h. [1]
> Maybe my patches could be used instead of this one?
> [1] https://lore.kernel.org/intel-xe/20250209121217.1604458-1-dafna.hirschfeld@intel.com/
>

I think this patch is merged, or will be very shortly. I don't this is
worth holding up, but in general I think the flow should be adjusted to
roughly...

- GuC (or any other PF client) parses PF into HW agnostic format and
  passes it to GT page fault component - I think we drop any fields from
  the current GuC format that are unused by the GT page fault component
- A vfunc is attached too the HW agnostic format which is used to signal
  PF done, in the case of the GuC this issues H2G
- All GuC specific code is removed from GT page fault component

This should allow other firmwares to hook into the generic page fault
code.

Matt
 
> Thanks,
> Dafna
> 
> 
> > 
> > v2:
> > - Normalize names for common header (Matt Brost)
> > 
> > v3:
> > - s/Migrate/Move (Michal W)
> > - s/xe_pagefault/xe_gt_pagefault (Michal W)
> > - Create new header file, xe_gt_pagefault_types.h (Michal W)
> > - Add kernel docs (Michal W)
> > 
> > v4:
> > - Fix includes usage (Michal W)
> > - Reference Bspec (Michal W)
> > 
> > v5:
> > - Convert enums to defines in regs folder (Michal W)
> > - Move xe_guc_pagefault_desc to regs folder (Michal W)
> > 
> > Bspec: 77412
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > Acked-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> > ---
> > drivers/gpu/drm/xe/regs/xe_pagefault_desc.h | 49 +++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_gt_pagefault.c        | 43 ++++--------------
> > drivers/gpu/drm/xe/xe_gt_pagefault_types.h  | 42 ++++++++++++++++++
> > drivers/gpu/drm/xe/xe_guc_fwif.h            | 28 ------------
> > 4 files changed, 100 insertions(+), 62 deletions(-)
> > create mode 100644 drivers/gpu/drm/xe/regs/xe_pagefault_desc.h
> > create mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault_types.h
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_pagefault_desc.h b/drivers/gpu/drm/xe/regs/xe_pagefault_desc.h
> > new file mode 100644
> > index 000000000000..a169ac274e14
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/regs/xe_pagefault_desc.h
> > @@ -0,0 +1,49 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_PAGEFAULT_DESC_H_
> > +#define _XE_PAGEFAULT_DESC_H_
> > +
> > +#include <linux/bits.h>
> > +#include <linux/types.h>
> > +
> > +struct xe_guc_pagefault_desc {
> > +	u32 dw0;
> > +#define PFD_FAULT_LEVEL		GENMASK(2, 0)
> > +#define PFD_SRC_ID		GENMASK(10, 3)
> > +#define PFD_RSVD_0		GENMASK(17, 11)
> > +#define XE2_PFD_TRVA_FAULT	BIT(18)
> > +#define PFD_ENG_INSTANCE	GENMASK(24, 19)
> > +#define PFD_ENG_CLASS		GENMASK(27, 25)
> > +#define PFD_PDATA_LO		GENMASK(31, 28)
> > +
> > +	u32 dw1;
> > +#define PFD_PDATA_HI		GENMASK(11, 0)
> > +#define PFD_PDATA_HI_SHIFT	4
> > +#define PFD_ASID		GENMASK(31, 12)
> > +
> > +	u32 dw2;
> > +#define PFD_ACCESS_TYPE		GENMASK(1, 0)
> > +#define PFD_FAULT_TYPE		GENMASK(3, 2)
> > +#define PFD_VFID		GENMASK(9, 4)
> > +#define PFD_RSVD_1		GENMASK(11, 10)
> > +#define PFD_VIRTUAL_ADDR_LO	GENMASK(31, 12)
> > +#define PFD_VIRTUAL_ADDR_LO_SHIFT 12
> > +
> > +	u32 dw3;
> > +#define PFD_VIRTUAL_ADDR_HI	GENMASK(31, 0)
> > +#define PFD_VIRTUAL_ADDR_HI_SHIFT 32
> > +} __packed;
> > +
> > +#define FLT_ACCESS_TYPE_READ		0u
> > +#define FLT_ACCESS_TYPE_WRITE		1u
> > +#define FLT_ACCESS_TYPE_ATOMIC		2u
> > +#define FLT_ACCESS_TYPE_RESERVED	3u
> > +
> > +#define FLT_TYPE_NOT_PRESENT_FAULT		0u
> > +#define FLT_TYPE_WRITE_ACCESS_VIOLATION		1u
> > +#define FLT_TYPE_ATOMIC_ACCESS_VIOLATION	2u
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index d4e3b7eb165a..93afa54c8780 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -12,8 +12,10 @@
> > #include <drm/drm_managed.h>
> > 
> > #include "abi/guc_actions_abi.h"
> > +#include "regs/xe_pagefault_desc.h"
> > #include "xe_bo.h"
> > #include "xe_gt.h"
> > +#include "xe_gt_pagefault_types.h"
> > #include "xe_gt_stats.h"
> > #include "xe_gt_tlb_invalidation.h"
> > #include "xe_guc.h"
> > @@ -23,33 +25,6 @@
> > #include "xe_trace_bo.h"
> > #include "xe_vm.h"
> > 
> > -struct pagefault {
> > -	u64 page_addr;
> > -	u32 asid;
> > -	u16 pdata;
> > -	u8 vfid;
> > -	u8 access_type;
> > -	u8 fault_type;
> > -	u8 fault_level;
> > -	u8 engine_class;
> > -	u8 engine_instance;
> > -	u8 fault_unsuccessful;
> > -	bool trva_fault;
> > -};
> > -
> > -enum access_type {
> > -	ACCESS_TYPE_READ = 0,
> > -	ACCESS_TYPE_WRITE = 1,
> > -	ACCESS_TYPE_ATOMIC = 2,
> > -	ACCESS_TYPE_RESERVED = 3,
> > -};
> > -
> > -enum fault_type {
> > -	NOT_PRESENT = 0,
> > -	WRITE_ACCESS_VIOLATION = 1,
> > -	ATOMIC_ACCESS_VIOLATION = 2,
> > -};
> > -
> > struct acc {
> > 	u64 va_range_base;
> > 	u32 asid;
> > @@ -61,9 +36,9 @@ struct acc {
> > 	u8 engine_instance;
> > };
> > 
> > -static bool access_is_atomic(enum access_type access_type)
> > +static bool access_is_atomic(u32 access_type)
> > {
> > -	return access_type == ACCESS_TYPE_ATOMIC;
> > +	return access_type == FLT_ACCESS_TYPE_ATOMIC;
> > }
> > 
> > static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
> > @@ -205,7 +180,7 @@ static struct xe_vm *asid_to_vm(struct xe_device *xe, u32 asid)
> > 	return vm;
> > }
> > 
> > -static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> > +static int handle_pagefault(struct xe_gt *gt, struct xe_gt_pagefault *pf)
> > {
> > 	struct xe_device *xe = gt_to_xe(gt);
> > 	struct xe_vm *vm;
> > @@ -237,7 +212,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> > 		goto unlock_vm;
> > 	}
> > 
> > -	if (xe_vma_read_only(vma) && pf->access_type != ACCESS_TYPE_READ) {
> > +	if (xe_vma_read_only(vma) && pf->access_type != FLT_ACCESS_TYPE_READ) {
> > 		err = -EPERM;
> > 		goto unlock_vm;
> > 	}
> > @@ -271,7 +246,7 @@ static int send_pagefault_reply(struct xe_guc *guc,
> > 	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> > }
> > 
> > -static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
> > +static void print_pagefault(struct xe_device *xe, struct xe_gt_pagefault *pf)
> > {
> > 	drm_dbg(&xe->drm, "\n\tASID: %d\n"
> > 		 "\tVFID: %d\n"
> > @@ -291,7 +266,7 @@ static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
> > 
> > #define PF_MSG_LEN_DW	4
> > 
> > -static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
> > +static bool get_pagefault(struct pf_queue *pf_queue, struct xe_gt_pagefault *pf)
> > {
> > 	const struct xe_guc_pagefault_desc *desc;
> > 	bool ret = false;
> > @@ -378,7 +353,7 @@ static void pf_queue_work_func(struct work_struct *w)
> > 	struct xe_gt *gt = pf_queue->gt;
> > 	struct xe_device *xe = gt_to_xe(gt);
> > 	struct xe_guc_pagefault_reply reply = {};
> > -	struct pagefault pf = {};
> > +	struct xe_gt_pagefault pf = {};
> > 	unsigned long threshold;
> > 	int ret;
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault_types.h b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
> > new file mode 100644
> > index 000000000000..b7d41b558de3
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
> > @@ -0,0 +1,42 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2022-2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_GT_PAGEFAULT_TYPES_H_
> > +#define _XE_GT_PAGEFAULT_TYPES_H_
> > +
> > +#include <linux/types.h>
> > +
> > +/**
> > + * struct xe_gt_pagefault - Structure of pagefaults returned by the
> > + * pagefault handler
> > + */
> > +struct xe_gt_pagefault {
> > +	/** @page_addr: faulted address of this pagefault */
> > +	u64 page_addr;
> > +	/** @asid: ASID of this pagefault */
> > +	u32 asid;
> > +	/** @pdata: PDATA of this pagefault */
> > +	u16 pdata;
> > +	/** @vfid: VFID of this pagefault */
> > +	u8 vfid;
> > +	/** @access_type: access type of this pagefault */
> > +	u8 access_type;
> > +	/** @fault_type: fault type of this pagefault */
> > +	u8 fault_type;
> > +	/** @fault_level: fault level of this pagefault */
> > +	u8 fault_level;
> > +	/** @engine_class: engine class this pagefault was reported on */
> > +	u8 engine_class;
> > +	/** @engine_instance: engine instance this pagefault was reported on */
> > +	u8 engine_instance;
> > +	/** @fault_unsuccessful: flag for if the pagefault recovered or not */
> > +	u8 fault_unsuccessful;
> > +	/** @prefetch: unused */
> > +	bool prefetch;
> > +	/** @trva_fault: is set if this is a TRTT fault */
> > +	bool trva_fault;
> > +};
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > index 6f57578b07cb..30ac21bb4f15 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > @@ -290,34 +290,6 @@ enum xe_guc_response_desc_type {
> > 	FAULT_RESPONSE_DESC
> > };
> > 
> > -struct xe_guc_pagefault_desc {
> > -	u32 dw0;
> > -#define PFD_FAULT_LEVEL		GENMASK(2, 0)
> > -#define PFD_SRC_ID		GENMASK(10, 3)
> > -#define PFD_RSVD_0		GENMASK(17, 11)
> > -#define XE2_PFD_TRVA_FAULT	BIT(18)
> > -#define PFD_ENG_INSTANCE	GENMASK(24, 19)
> > -#define PFD_ENG_CLASS		GENMASK(27, 25)
> > -#define PFD_PDATA_LO		GENMASK(31, 28)
> > -
> > -	u32 dw1;
> > -#define PFD_PDATA_HI		GENMASK(11, 0)
> > -#define PFD_PDATA_HI_SHIFT	4
> > -#define PFD_ASID		GENMASK(31, 12)
> > -
> > -	u32 dw2;
> > -#define PFD_ACCESS_TYPE		GENMASK(1, 0)
> > -#define PFD_FAULT_TYPE		GENMASK(3, 2)
> > -#define PFD_VFID		GENMASK(9, 4)
> > -#define PFD_RSVD_1		GENMASK(11, 10)
> > -#define PFD_VIRTUAL_ADDR_LO	GENMASK(31, 12)
> > -#define PFD_VIRTUAL_ADDR_LO_SHIFT 12
> > -
> > -	u32 dw3;
> > -#define PFD_VIRTUAL_ADDR_HI	GENMASK(31, 0)
> > -#define PFD_VIRTUAL_ADDR_HI_SHIFT 32
> > -} __packed;
> > -
> > struct xe_guc_pagefault_reply {
> > 	u32 dw0;
> > #define PFR_VALID		BIT(0)
> > -- 
> > 2.43.0
> > 
