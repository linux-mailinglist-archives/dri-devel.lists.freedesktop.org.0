Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E82CDB28807
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 23:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC3610E0A1;
	Fri, 15 Aug 2025 21:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V42aNeKA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80AC10E0A1;
 Fri, 15 Aug 2025 21:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755295148; x=1786831148;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sUYApRgjjFm/xcafnjdqNhZkZWuHrYzqTWTs1bAKIXY=;
 b=V42aNeKAbrSOkADI/yUyG4RAjfVzcw2UIOSb2SIPhxhBo8RgkNrrw9/q
 NfL01D1lmyF1D9h2yyCK3eAeTMZKNgB5rysGlmVNL+0NHHoSlPAYYsmyG
 VD8i+N2CQEnkwYuODMm1m9WrLgd58FG4D1O0LXsxvDWI1sAWvGJIsxFiX
 bi1dU9LGjokU8LI/ojN/OK20OTGk8ofFnbvB/UhLMlG8M7zNl/jlwOPaQ
 VYcqHcHQd6xwQd/7dFZpxtQEo9KNSW7RA6T9EWbGb2QR6szZsGOis0kTQ
 VDX46khZTL9Fk54G62+HX/gc/XNs7US+SqnIF2w9qKRhQJ/3OaZWnuLj7 A==;
X-CSE-ConnectionGUID: yxF8vslQRoCqqA3CVPUuuQ==
X-CSE-MsgGUID: z44sIvLZTAavj+of+H6QLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57573512"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="57573512"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 14:58:42 -0700
X-CSE-ConnectionGUID: WGrut0qJQqOnp8EcFZ+y1Q==
X-CSE-MsgGUID: UO8dEAcrRQKdTzb4orb5gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="166284545"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 14:58:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 14:58:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 14:58:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.43)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 14:58:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iuapWeDjeUFdYF+pojJXjoqsCmQkH+g1EuYblpgawpCstZyJn6A9MHw19BbyQXfuELf7DT7p42ujS2Dqmb0oDiIOti67IS7iuTtHIvUG5Jcpes9yy3s0smtSlWx8fJ/+DrtOkCoNc2fVKpNfzkVRPWEMziH9tTZcu6q//kYTbjF8/9sKS5JVsbiK+80Xpr1qlEl3aeQ/Zx6RpOj6MEVKvEn1yBzKMNmvN+sTVSe2wY3mrrSJrLkW8B/1cETt6fCAH8NkiBne4YuNvBele55De5EBbM7jfjvNVFmvoWfShqxECWAlndBnou7NkUWK+3rHCq9Hwl5oLGgk1HlMg85IFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5qY0dxo+chrSRhrAZ3O7xl6yrcMebXKZrN1Qc9B95c=;
 b=m4oBqdns3SNJmmhagiLVAFNN794SgfHvMG/dcfvKdBK6z258mTyqzEPuNa7SYkGt2C/34Hq6zy9U4oZKTzzxnlY3Lk5TzB8xxuamRBtn/YY5HLSxP7cZNitb+PxA83RdzPlsnJ80WSYzGDrzO8KTHNIv5QKu8F6BHzibWsaGUTzQ51QZn9+O9QvqEheWBjUsGWVZDwTiR39+QcsEleL7+nMzKc2wWPSrtyddSg2RaKblBgbRh1m3VkTrhoB0+TAh+hfiEDbZh+q+E4bwDhLUrlZ9os7klJp84Afp1rqQ/Z/eXPXx5k9gTBiPec02XcnHtrG87pIzr/6ilOwdAtbwWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by BL3PR11MB6316.namprd11.prod.outlook.com (2603:10b6:208:3b3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 21:58:33 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%6]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 21:58:33 +0000
Date: Fri, 15 Aug 2025 17:58:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Alex
 Deucher" <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, <Ruhl@freedesktop.org>, Michael J
 <michael.j.ruhl@intel.com>, Riana Tauro <riana.tauro@intel.com>, Anshuman
 Gupta <anshuman.gupta@intel.com>
Subject: Re: [RFC v5 3/5] drm/xe/RAS: Expose the error counters
Message-ID: <aJ-thMOY5A3RcYNV@intel.com>
References: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
 <20250730064956.1385855-4-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250730064956.1385855-4-aravind.iddamsetty@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0219.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::14) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|BL3PR11MB6316:EE_
X-MS-Office365-Filtering-Correlation-Id: d1c56872-6a8b-47e5-15db-08dddc46e057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cK6opUIUv4di6bESSM95Pbk2Z1ej4rHThRnwkJyJshadHm7ZfGBhDltqizlB?=
 =?us-ascii?Q?EXaEMPYFrA84yGj9jK7TJiGbCTHuy/U+PrSkjSMB/6CCLrlKMMS72wUIISI0?=
 =?us-ascii?Q?aGDnZUuRsAt/NQ+Z1DhQCnYC8ID4WitZWkfRE5Zzkdcx7FLwM69WSQDAUdEy?=
 =?us-ascii?Q?JothICn/RmF9b178jUyFgnq7jI3cNId+7V0l3SJaqEaNefzwCQdTjXvvLJ6l?=
 =?us-ascii?Q?Ckw2WNZx+yeMaW8qJBfqBhnA1j33ekIyeEmNK49cen9IoJWVjdwbOh5ry07p?=
 =?us-ascii?Q?a/WGyYBs7y25NOvyDky7mM4oKxN4yGdFqD5jZrhy+cTKMmDH6VlQ4MH46m8r?=
 =?us-ascii?Q?w+L0YZWLyYWaNi3gzqEpb1SO4yXK+mEQgTMHOJ1PmObrMVxVrMJ5MGrCibBH?=
 =?us-ascii?Q?JOcC3LT762a/zkqmYIGgkEOPEHIDeGYGVzInK9+ERNIdhr/E5bDeF83KSbb8?=
 =?us-ascii?Q?uQZQj10hQk6DvDOd4j8brtjaanJBSmX8G2AaJHHO61oll+9wALJPzbjZZcU9?=
 =?us-ascii?Q?7oCsYquogH+gNHECX5uhb58qLYp22O0F+Qu4+g43kyfYD1HyXR1bmoE8UtwO?=
 =?us-ascii?Q?xA00AFB1nMtXvQGGF28/qr53hlOxAOEzvu0Lfi8wYDTRR0lO2o4/QR0K4FX7?=
 =?us-ascii?Q?Qp04ETO3q18EmqeHxm9H8WL7ucQndzAqXAgw3upv8sTrBH4bxtzRlxi32qzV?=
 =?us-ascii?Q?oHkSqYf7gP7m46LP/7iaGA6HWSIGOi3ZTgYBciPLORs30XBqNZBcxPolDMGb?=
 =?us-ascii?Q?+FE5nylXXSYwAWmitMjX2MdwE4gsh+iFICCBltZphauzPryaasn6oI72OqVY?=
 =?us-ascii?Q?h27p1D16v814DV7OUBgNU/3ncQQqgU3yEFwXNsooTxCUHBEtGF7frZCVUqm0?=
 =?us-ascii?Q?wpzWiNaLDGvvIPIOjOLxqxKclVte7pK2AwqH98zOmUIbM5wz1tJ9ogRp34qG?=
 =?us-ascii?Q?wGZfNjk3ggD2pXqrMMSriZlwQtovYiHcC0JBM5GjXgy5q75N48R8Z5Rz8W3g?=
 =?us-ascii?Q?OWTUI5qKqJ5ty3xXed9ScofaicKfY1knT4QzcZBy1el6xQz1RleomxWBGCA0?=
 =?us-ascii?Q?RDVpEm0nqiP6pc54fkZtjhvxfISSEmsSwqc4zQflb5nuJICv+w9lTwV+T0P4?=
 =?us-ascii?Q?sXRDTQqfRRoDITSwMIa0npkhXOQgpKT+UWUX7+ulLMWMTW5lzC+Nkgg+w1Ib?=
 =?us-ascii?Q?q1/BVI1pTtcCO7UoXHeCwTA1cXShLsyt08ysmVNPct/fxXCKSJCvSvIfbW9R?=
 =?us-ascii?Q?Dbdx/kcg/qStFmUGpDVUr+QL9Eqxa14L5aJ3ZjdUC7DI5FuGxvTyUAGyeTYu?=
 =?us-ascii?Q?BAFtabVLoAs0z5iDhwweugn8oB8Jpq+uF7hoqD7k5h3YZM9Jnkm8hrQ0ha8O?=
 =?us-ascii?Q?MRqHC5Lu5WKYgD1bTO3PWp+Zpff+vfmRQ2cLbCbb2OX3Hjl6s5P+PTQl63dm?=
 =?us-ascii?Q?uoaFm/SCv0c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AEUuhqA4iWRRmchZbkmKDU4I7sm8XPcighmB4qGXIExY2/bJnI93345AZOKs?=
 =?us-ascii?Q?ffzUy+c2FEgoleHkZULTqpMcW39X6tKxX7fVsAttl0UMzedy7cY4HxhmkasY?=
 =?us-ascii?Q?cY/Wbv3U+OUssgf/9mVO/KTVZyse6eiytSfDnszl+sZPnlFLOczXgm6/mafv?=
 =?us-ascii?Q?pqjUvPHL/0deVbgBNL7AUPJKvst0nmrsiyD1xoNtpUKQBhLmMEQWbddBGTQl?=
 =?us-ascii?Q?0maPCGrugr3uvqZaBHqzJbHSEQGGjaG9jWFAevHt2iJhQUdHMWhoJ7C32lXV?=
 =?us-ascii?Q?Bwm+nJlbqCW0w3/U8k/stQ04BmgHpG1gUuQfnrMhEkNIzqo9aQtminY4Dg9W?=
 =?us-ascii?Q?k+qtRC0nCQ8zXl9ytq3dn0eqt3oteqV8UNAAA23ucQErfRkb6/Zk0+XiYxWc?=
 =?us-ascii?Q?MwUzvhMr3yJUe3EPvUFw9iklkHz+NEokdlMCJ2/F5jRem0zHcmaHNl9+c1Ib?=
 =?us-ascii?Q?KIO/MwlYIFm3BuGp2cvAsJpVUwmr6KwxcR7mXZC+q0rZKuVH91xLZPVeCnFD?=
 =?us-ascii?Q?vmkeMPrVprfGurGiPsz/2t7GtmmHBtShTxM1FU+mLEWzmqWFIXCnxIiJy8Mq?=
 =?us-ascii?Q?kPRwDf01nPdFYSIpPdV2t26gVXdeYZozZdxIp/5Cny1KA2Vx2xf+82Mtd2q6?=
 =?us-ascii?Q?u7rHTjbaWt/KDCRHfR8fVcjSpNY7vbbwHibwNlmmtsCoIw8OVepBmWZbwPLu?=
 =?us-ascii?Q?ex6eCB3keKUJm02Pv8PqBpn1Phwb/2BLRUkgVZh5Q5uWEg4lFigUylG2Fvlr?=
 =?us-ascii?Q?GANJlyrgl2EjIzCFpWjmjSITxHgFT3LFOUH1DunoXh1fgf1oRu7l1Wdyc1jL?=
 =?us-ascii?Q?u43NSyD5on4wbtfJt81EYVgbhQmIT2i7aAy48ljF+tH2oUnc1nV90f7dXjVp?=
 =?us-ascii?Q?VaDEM8ELrLl3q0z/n5HTCOewrTVM0NLuGS/03t7uhlU+RSJC5hB38Tf5H1Mj?=
 =?us-ascii?Q?ysI7K22rFjl9g55gdgFuUB4wkkHavvmmnr/VGiCAEDAZUM8Os1B2LPAKXQG7?=
 =?us-ascii?Q?mLhMH+qlJc0xqbLvKsHelQv4h3w2YPjmSyhRwauuN/ry4eWRTtkZMDuPAN3F?=
 =?us-ascii?Q?y7IrMVNSd2F7n5fgdb3QCcH2gguIK1tB7kgKfF3QaK4pUYqdVBKVP1eTx9c+?=
 =?us-ascii?Q?Pn2ohqp/Kpo9Vzwf96sMqc/UCJy3KtmVOMpQQ855VDeCc0byahqNOELVS3o0?=
 =?us-ascii?Q?Tq44XAOyJkWhn1GqiuMphUEz7Ene4x8Rtoz7Mh6EG0JtCNxr63ENaV4dhUh9?=
 =?us-ascii?Q?Gok/jDyKr7Xi7hiDtQ48xY2m0NMmlW2q2GSEdFPdrFaHdHmp250HJJ+NJlnX?=
 =?us-ascii?Q?hihuROdBHDBYdSuj7fUf82SWSu81UBnJ2Kdy2iskwt11GBEKc4dmyCmhj9tr?=
 =?us-ascii?Q?F25tot7IjEpPRj4fgfbw7LTzzsIWqabE3FxnkRrJPwa9vGghK41vJwQVlUus?=
 =?us-ascii?Q?+w6lH2jktYkTSLWTPPMTSDKrW1AP56UZg9dF7X0LkGE7Mwe4qm0+4FEtyTjH?=
 =?us-ascii?Q?mZYDDGuGrUpzj3ymAfN6rqzXFeYH2qJgIcZmGRoQvdNDY0Ja0oVbvelPtkh6?=
 =?us-ascii?Q?8SF3kVUz/2fq/tn27/S6UNcGY4wR0j7su49ryfJi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1c56872-6a8b-47e5-15db-08dddc46e057
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 21:58:32.9309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sPTAiQkkA5kn2BBlNlAuGpJ5C9u5wmF5uiGmsgYdnJxVUmh1m4YH8GkMag2SlQNAAn3nx/lw3rNSWMpr+J8ZIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6316
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

On Wed, Jul 30, 2025 at 12:19:54PM +0530, Aravind Iddamsetty wrote:
> We expose the various error counters supported on a hardware via genl
> subsytem through the registered commands to userspace. The
> DRM_RAS_CMD_QUERY lists the error names with config id,
> DRM_RAD_CMD_READ_ONE returns the counter value for the requested config
> id and the DRM_RAS_CMD_READ_ALL lists the counters for all errors along
> with their names and config ids.
> 
> v2: Rebase
> 
> v3:
> 1. presently xe_list_errors fills blank data for IGFX, prevent it by
> having an early check of IS_DGFX (Michael J. Ruhl)
> 2. update errors from all sources
> 
> v4: Check QUERY param, if its normal return not supported.
> 
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_error.c |  15 +-
>  drivers/gpu/drm/xe/xe_netlink.c  | 509 ++++++++++++++++++++++++++++++-
>  include/uapi/drm/xe_drm.h        |  85 ++++++
>  3 files changed, 602 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 6a7cd59caac1..bdd9c88674b2 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -531,16 +531,21 @@ static void xe_clear_all_soc_errors(struct xe_device *xe)
>  
>  		while (hw_err < HARDWARE_ERROR_MAX) {
>  			for (i = 0; i < XE_SOC_NUM_IEH; i++)
> -				xe_mmio_write32(&gt->tile->mmio, SOC_GSYSEVTCTL_REG(base, slave_base, i),
> +				xe_mmio_write32(&gt->tile->mmio,
> +						SOC_GSYSEVTCTL_REG(base, slave_base, i),
>  						~REG_BIT(hw_err));
>  
> -			xe_mmio_write32(&gt->tile->mmio, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err),
> +			xe_mmio_write32(&gt->tile->mmio,
> +					SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err),
>  					REG_GENMASK(31, 0));
> -			xe_mmio_write32(&gt->tile->mmio, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err),
> +			xe_mmio_write32(&gt->tile->mmio,
> +					SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err),
>  					REG_GENMASK(31, 0));
> -			xe_mmio_write32(&gt->tile->mmio, SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
> +			xe_mmio_write32(&gt->tile->mmio,
> +					SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
>  					REG_GENMASK(31, 0));
> -			xe_mmio_write32(&gt->tile->mmio, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
> +			xe_mmio_write32(&gt->tile->mmio,
> +					SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
>  					REG_GENMASK(31, 0));

probably a fixup for the patch in the other series?
Which btw it was hard to understand the dependency. We should make this series indepentent
of the other one.

>  			hw_err++;
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_netlink.c b/drivers/gpu/drm/xe/xe_netlink.c
> index 9e588fb19631..20240875284a 100644
> --- a/drivers/gpu/drm/xe/xe_netlink.c
> +++ b/drivers/gpu/drm/xe/xe_netlink.c
> @@ -6,16 +6,521 @@
>  #include <net/genetlink.h>
>  #include <uapi/drm/drm_netlink.h>
>  
> +#include <drm/xe_drm.h>
> +
>  #include "xe_device.h"
>  
> -static int xe_genl_list_errors(struct drm_device *drm, struct sk_buff *msg, struct genl_info *info)
> +#define MAX_ERROR_NAME	100
> +
> +static const char * const xe_hw_error_events[] = {
> +		[DRM_XE_GENL_GT_ERROR_CORRECTABLE_L3_SNG] = "correctable-l3-sng",
> +		[DRM_XE_GENL_GT_ERROR_CORRECTABLE_GUC] = "correctable-guc",
> +		[DRM_XE_GENL_GT_ERROR_CORRECTABLE_SAMPLER] = "correctable-sampler",
> +		[DRM_XE_GENL_GT_ERROR_CORRECTABLE_SLM] = "correctable-slm",
> +		[DRM_XE_GENL_GT_ERROR_CORRECTABLE_EU_IC] = "correctable-eu-ic",
> +		[DRM_XE_GENL_GT_ERROR_CORRECTABLE_EU_GRF] = "correctable-eu-grf",
> +		[DRM_XE_GENL_GT_ERROR_FATAL_ARR_BIST] = "fatal-array-bist",
> +		[DRM_XE_GENL_GT_ERROR_FATAL_L3_DOUB] = "fatal-l3-double",
> +		[DRM_XE_GENL_GT_ERROR_FATAL_L3_ECC_CHK] = "fatal-l3-ecc-checker",
> +		[DRM_XE_GENL_GT_ERROR_FATAL_GUC] = "fatal-guc",
> +		[DRM_XE_GENL_GT_ERROR_FATAL_IDI_PAR] = "fatal-idi-parity",
> +		[DRM_XE_GENL_GT_ERROR_FATAL_SQIDI] = "fatal-sqidi",
> +		[DRM_XE_GENL_GT_ERROR_FATAL_SAMPLER] = "fatal-sampler",
> +		[DRM_XE_GENL_GT_ERROR_FATAL_SLM] = "fatal-slm",
> +		[DRM_XE_GENL_GT_ERROR_FATAL_EU_IC] = "fatal-eu-ic",
> +		[DRM_XE_GENL_GT_ERROR_FATAL_EU_GRF] = "fatal-eu-grf",
> +		[DRM_XE_GENL_GT_ERROR_FATAL_FPU] = "fatal-fpu",
> +		[DRM_XE_GENL_GT_ERROR_FATAL_TLB] = "fatal-tlb",
> +		[DRM_XE_GENL_GT_ERROR_FATAL_L3_FABRIC] = "fatal-l3-fabric",
> +		[DRM_XE_GENL_GT_ERROR_CORRECTABLE_SUBSLICE] = "correctable-subslice",
> +		[DRM_XE_GENL_GT_ERROR_CORRECTABLE_L3BANK] = "correctable-l3bank",
> +		[DRM_XE_GENL_GT_ERROR_FATAL_SUBSLICE] = "fatal-subslice",
> +		[DRM_XE_GENL_GT_ERROR_FATAL_L3BANK] = "fatal-l3bank",
> +		[DRM_XE_GENL_SGUNIT_ERROR_CORRECTABLE] = "sgunit-correctable",
> +		[DRM_XE_GENL_SGUNIT_ERROR_NONFATAL] = "sgunit-nonfatal",
> +		[DRM_XE_GENL_SGUNIT_ERROR_FATAL] = "sgunit-fatal",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_CSC_PSF_CMD] = "soc-nonfatal-csc-psf-cmd-parity",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_CSC_PSF_CMP] = "soc-nonfatal-csc-psf-unexpected-completion",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_CSC_PSF_REQ] = "soc-nonfatal-csc-psf-unsupported-request",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_ANR_MDFI] = "soc-nonfatal-anr-mdfi",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_MDFI_T2T] = "soc-nonfatal-mdfi-t2t",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_MDFI_T2C] = "soc-nonfatal-mdfi-t2c",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 0)] = "soc-nonfatal-hbm-ss0-0",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 1)] = "soc-nonfatal-hbm-ss0-1",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 2)] = "soc-nonfatal-hbm-ss0-2",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 3)] = "soc-nonfatal-hbm-ss0-3",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 4)] = "soc-nonfatal-hbm-ss0-4",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 5)] = "soc-nonfatal-hbm-ss0-5",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 6)] = "soc-nonfatal-hbm-ss0-6",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 7)] = "soc-nonfatal-hbm-ss0-7",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 8)] = "soc-nonfatal-hbm-ss1-0",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 9)] = "soc-nonfatal-hbm-ss1-1",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 10)] = "soc-nonfatal-hbm-ss1-2",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 11)] = "soc-nonfatal-hbm-ss1-3",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 12)] = "soc-nonfatal-hbm-ss1-4",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 13)] = "soc-nonfatal-hbm-ss1-5",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 14)] = "soc-nonfatal-hbm-ss1-6",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 15)] = "soc-nonfatal-hbm-ss1-7",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 0)] = "soc-nonfatal-hbm-ss2-0",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 1)] = "soc-nonfatal-hbm-ss2-1",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 2)] = "soc-nonfatal-hbm-ss2-2",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 3)] = "soc-nonfatal-hbm-ss2-3",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 4)] = "soc-nonfatal-hbm-ss2-4",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 5)] = "soc-nonfatal-hbm-ss2-5",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 6)] = "soc-nonfatal-hbm-ss2-6",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 7)] = "soc-nonfatal-hbm-ss2-7",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 8)] = "soc-nonfatal-hbm-ss3-0",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 9)] = "soc-nonfatal-hbm-ss3-1",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 10)] = "soc-nonfatal-hbm-ss3-2",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 11)] = "soc-nonfatal-hbm-ss3-3",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 12)] = "soc-nonfatal-hbm-ss3-4",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 13)] = "soc-nonfatal-hbm-ss3-5",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 14)] = "soc-nonfatal-hbm-ss3-6",
> +		[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 15)] = "soc-nonfatal-hbm-ss3-7",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_CSC_PSF_CMD] = "soc-fatal-csc-psf-cmd-parity",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_CSC_PSF_CMP] = "soc-fatal-csc-psf-unexpected-completion",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_CSC_PSF_REQ] = "soc-fatal-csc-psf-unsupported-request",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_PUNIT] = "soc-fatal-punit",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_PCIE_PSF_CMD] = "soc-fatal-pcie-psf-command-parity",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_PCIE_PSF_CMP] = "soc-fatal-pcie-psf-unexpected-completion",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_PCIE_PSF_REQ] = "soc-fatal-pcie-psf-unsupported-request",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_ANR_MDFI] = "soc-fatal-anr-mdfi",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_MDFI_T2T] = "soc-fatal-mdfi-t2t",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_MDFI_T2C] = "soc-fatal-mdfi-t2c",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_PCIE_AER] = "soc-fatal-malformed-pcie-aer",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_PCIE_ERR] = "soc-fatal-malformed-pcie-err",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_UR_COND] = "soc-fatal-ur-condition-ieh",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_SERR_SRCS] = "soc-fatal-from-serr-sources",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 0)] = "soc-fatal-hbm-ss0-0",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 1)] = "soc-fatal-hbm-ss0-1",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 2)] = "soc-fatal-hbm-ss0-2",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 3)] = "soc-fatal-hbm-ss0-3",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 4)] = "soc-fatal-hbm-ss0-4",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 5)] = "soc-fatal-hbm-ss0-5",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 6)] = "soc-fatal-hbm-ss0-6",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 7)] = "soc-fatal-hbm-ss0-7",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 8)] = "soc-fatal-hbm-ss1-0",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 9)] = "soc-fatal-hbm-ss1-1",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 10)] = "soc-fatal-hbm-ss1-2",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 11)] = "soc-fatal-hbm-ss1-3",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 12)] = "soc-fatal-hbm-ss1-4",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 13)] = "soc-fatal-hbm-ss1-5",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 14)] = "soc-fatal-hbm-ss1-6",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 15)] = "soc-fatal-hbm-ss1-7",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 0)] = "soc-fatal-hbm-ss2-0",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 1)] = "soc-fatal-hbm-ss2-1",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 2)] = "soc-fatal-hbm-ss2-2",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 3)] = "soc-fatal-hbm-ss2-3",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 4)] = "soc-fatal-hbm-ss2-4",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 5)] = "soc-fatal-hbm-ss2-5",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 6)] = "soc-fatal-hbm-ss2-6",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 7)] = "soc-fatal-hbm-ss2-7",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 8)] = "soc-fatal-hbm-ss3-0",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 9)] = "soc-fatal-hbm-ss3-1",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 10)] = "soc-fatal-hbm-ss3-2",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 11)] = "soc-fatal-hbm-ss3-3",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 12)] = "soc-fatal-hbm-ss3-4",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 13)] = "soc-fatal-hbm-ss3-5",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 14)] = "soc-fatal-hbm-ss3-6",
> +		[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 15)] = "soc-fatal-hbm-ss3-7",
> +		[DRM_XE_GENL_GSC_ERROR_CORRECTABLE_SRAM_ECC] = "gsc-correctable-sram-ecc",
> +		[DRM_XE_GENL_GSC_ERROR_NONFATAL_MIA_SHUTDOWN] = "gsc-nonfatal-mia-shutdown",
> +		[DRM_XE_GENL_GSC_ERROR_NONFATAL_MIA_INTERNAL] = "gsc-nonfatal-mia-internal",
> +		[DRM_XE_GENL_GSC_ERROR_NONFATAL_SRAM_ECC] = "gsc-nonfatal-sram-ecc",
> +		[DRM_XE_GENL_GSC_ERROR_NONFATAL_WDG_TIMEOUT] = "gsc-nonfatal-wdg-timeout",
> +		[DRM_XE_GENL_GSC_ERROR_NONFATAL_ROM_PARITY] = "gsc-nonfatal-rom-parity",
> +		[DRM_XE_GENL_GSC_ERROR_NONFATAL_UCODE_PARITY] = "gsc-nonfatal-ucode-parity",
> +		[DRM_XE_GENL_GSC_ERROR_NONFATAL_VLT_GLITCH] = "gsc-nonfatal-vlt-glitch",
> +		[DRM_XE_GENL_GSC_ERROR_NONFATAL_FUSE_PULL] = "gsc-nonfatal-fuse-pull",
> +		[DRM_XE_GENL_GSC_ERROR_NONFATAL_FUSE_CRC_CHECK] = "gsc-nonfatal-fuse-crc-check",
> +		[DRM_XE_GENL_GSC_ERROR_NONFATAL_SELF_MBIST] = "gsc-nonfatal-self-mbist",
> +		[DRM_XE_GENL_GSC_ERROR_NONFATAL_AON_RF_PARITY] = "gsc-nonfatal-aon-parity",
> +		[DRM_XE_GENL_SGGI_ERROR_NONFATAL] = "sggi-nonfatal-data-parity",
> +		[DRM_XE_GENL_SGLI_ERROR_NONFATAL] = "sgli-nonfatal-data-parity",
> +		[DRM_XE_GENL_SGCI_ERROR_NONFATAL] = "sgci-nonfatal-data-parity",
> +		[DRM_XE_GENL_MERT_ERROR_NONFATAL] = "mert-nonfatal-data-parity",
> +		[DRM_XE_GENL_SGGI_ERROR_FATAL] = "sggi-fatal-data-parity",
> +		[DRM_XE_GENL_SGLI_ERROR_FATAL] = "sgli-fatal-data-parity",
> +		[DRM_XE_GENL_SGCI_ERROR_FATAL] = "sgci-fatal-data-parity",
> +		[DRM_XE_GENL_MERT_ERROR_FATAL] = "mert-nonfatal-data-parity",
> +};
> +
> +static const unsigned long xe_hw_error_map[] = {
> +	[DRM_XE_GENL_GT_ERROR_CORRECTABLE_L3_SNG] = XE_HW_ERR_GT_CORR_L3_SNG,
> +	[DRM_XE_GENL_GT_ERROR_CORRECTABLE_GUC] = XE_HW_ERR_GT_CORR_GUC,
> +	[DRM_XE_GENL_GT_ERROR_CORRECTABLE_SAMPLER] = XE_HW_ERR_GT_CORR_SAMPLER,
> +	[DRM_XE_GENL_GT_ERROR_CORRECTABLE_SLM] = XE_HW_ERR_GT_CORR_SLM,
> +	[DRM_XE_GENL_GT_ERROR_CORRECTABLE_EU_IC] = XE_HW_ERR_GT_CORR_EU_IC,
> +	[DRM_XE_GENL_GT_ERROR_CORRECTABLE_EU_GRF] = XE_HW_ERR_GT_CORR_EU_GRF,
> +	[DRM_XE_GENL_GT_ERROR_FATAL_ARR_BIST] = XE_HW_ERR_GT_FATAL_ARR_BIST,
> +	[DRM_XE_GENL_GT_ERROR_FATAL_L3_DOUB] = XE_HW_ERR_GT_FATAL_L3_DOUB,
> +	[DRM_XE_GENL_GT_ERROR_FATAL_L3_ECC_CHK] = XE_HW_ERR_GT_FATAL_L3_ECC_CHK,
> +	[DRM_XE_GENL_GT_ERROR_FATAL_GUC] = XE_HW_ERR_GT_FATAL_GUC,
> +	[DRM_XE_GENL_GT_ERROR_FATAL_IDI_PAR] = XE_HW_ERR_GT_FATAL_IDI_PAR,
> +	[DRM_XE_GENL_GT_ERROR_FATAL_SQIDI] = XE_HW_ERR_GT_FATAL_SQIDI,
> +	[DRM_XE_GENL_GT_ERROR_FATAL_SAMPLER] = XE_HW_ERR_GT_FATAL_SAMPLER,
> +	[DRM_XE_GENL_GT_ERROR_FATAL_SLM] = XE_HW_ERR_GT_FATAL_SLM,
> +	[DRM_XE_GENL_GT_ERROR_FATAL_EU_IC] = XE_HW_ERR_GT_FATAL_EU_IC,
> +	[DRM_XE_GENL_GT_ERROR_FATAL_EU_GRF] = XE_HW_ERR_GT_FATAL_EU_GRF,
> +	[DRM_XE_GENL_GT_ERROR_FATAL_FPU] = XE_HW_ERR_GT_FATAL_FPU,
> +	[DRM_XE_GENL_GT_ERROR_FATAL_TLB] = XE_HW_ERR_GT_FATAL_TLB,
> +	[DRM_XE_GENL_GT_ERROR_FATAL_L3_FABRIC] = XE_HW_ERR_GT_FATAL_L3_FABRIC,
> +	[DRM_XE_GENL_GT_ERROR_CORRECTABLE_SUBSLICE] = XE_HW_ERR_GT_CORR_SUBSLICE,
> +	[DRM_XE_GENL_GT_ERROR_CORRECTABLE_L3BANK] = XE_HW_ERR_GT_CORR_L3BANK,
> +	[DRM_XE_GENL_GT_ERROR_FATAL_SUBSLICE] = XE_HW_ERR_GT_FATAL_SUBSLICE,
> +	[DRM_XE_GENL_GT_ERROR_FATAL_L3BANK] = XE_HW_ERR_GT_FATAL_L3BANK,
> +	[DRM_XE_GENL_SGUNIT_ERROR_CORRECTABLE] = XE_HW_ERR_TILE_CORR_SGUNIT,
> +	[DRM_XE_GENL_SGUNIT_ERROR_NONFATAL] = XE_HW_ERR_TILE_NONFATAL_SGUNIT,
> +	[DRM_XE_GENL_SGUNIT_ERROR_FATAL] = XE_HW_ERR_TILE_FATAL_SGUNIT,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_CSC_PSF_CMD] = XE_HW_ERR_SOC_NONFATAL_CSC_PSF_CMD,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_CSC_PSF_CMP] = XE_HW_ERR_SOC_NONFATAL_CSC_PSF_CMP,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_CSC_PSF_REQ] = XE_HW_ERR_SOC_NONFATAL_CSC_PSF_REQ,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_ANR_MDFI] = XE_HW_ERR_SOC_NONFATAL_ANR_MDFI,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_MDFI_T2T] = XE_HW_ERR_SOC_NONFATAL_MDFI_T2T,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_MDFI_T2C] = XE_HW_ERR_SOC_NONFATAL_MDFI_T2C,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 0)] = XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL0,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 1)] = XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL1,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 2)] = XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL2,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 3)] = XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL3,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 4)] = XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL4,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 5)] = XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL5,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 6)] = XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL6,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 7)] = XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL7,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 8)] = XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL0,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 9)] = XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL1,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 10)] = XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL2,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 11)] = XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL3,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 12)] = XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL4,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 13)] = XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL5,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 14)] = XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL6,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(0, 15)] = XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL7,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 0)] = XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL0,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 1)] = XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL1,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 2)] = XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL2,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 3)] = XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL3,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 4)] = XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL4,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 5)] = XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL5,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 6)] = XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL6,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 7)] = XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL7,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 8)] = XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL0,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 9)] = XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL1,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 10)] = XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL2,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 11)] = XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL3,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 12)] = XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL4,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 13)] = XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL5,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 14)] = XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL6,
> +	[DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 15)] = XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL7,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_CSC_PSF_CMD] = XE_HW_ERR_SOC_FATAL_CSC_PSF_CMD,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_CSC_PSF_CMP] = XE_HW_ERR_SOC_FATAL_CSC_PSF_CMP,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_CSC_PSF_REQ] = XE_HW_ERR_SOC_FATAL_CSC_PSF_REQ,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_PUNIT] = XE_HW_ERR_SOC_FATAL_PUNIT,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_PCIE_PSF_CMD] = XE_HW_ERR_SOC_FATAL_PCIE_PSF_CMD,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_PCIE_PSF_CMP] = XE_HW_ERR_SOC_FATAL_PCIE_PSF_CMP,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_PCIE_PSF_REQ] = XE_HW_ERR_SOC_FATAL_PCIE_PSF_REQ,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_ANR_MDFI] = XE_HW_ERR_SOC_FATAL_ANR_MDFI,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_MDFI_T2T] = XE_HW_ERR_SOC_FATAL_MDFI_T2T,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_MDFI_T2C] = XE_HW_ERR_SOC_FATAL_MDFI_T2C,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_PCIE_AER] = XE_HW_ERR_SOC_FATAL_PCIE_AER,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_PCIE_ERR] = XE_HW_ERR_SOC_FATAL_PCIE_ERR,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_UR_COND] = XE_HW_ERR_SOC_FATAL_UR_COND,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_SERR_SRCS] = XE_HW_ERR_SOC_FATAL_SERR_SRCS,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 0)] = XE_HW_ERR_SOC_FATAL_HBM0_CHNL0,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 1)] = XE_HW_ERR_SOC_FATAL_HBM0_CHNL1,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 2)] = XE_HW_ERR_SOC_FATAL_HBM0_CHNL2,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 3)] = XE_HW_ERR_SOC_FATAL_HBM0_CHNL3,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 4)] = XE_HW_ERR_SOC_FATAL_HBM0_CHNL4,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 5)] = XE_HW_ERR_SOC_FATAL_HBM0_CHNL5,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 6)] = XE_HW_ERR_SOC_FATAL_HBM0_CHNL6,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 7)] = XE_HW_ERR_SOC_FATAL_HBM0_CHNL7,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 8)] = XE_HW_ERR_SOC_FATAL_HBM1_CHNL0,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 9)] = XE_HW_ERR_SOC_FATAL_HBM1_CHNL1,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 10)] = XE_HW_ERR_SOC_FATAL_HBM1_CHNL2,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 11)] = XE_HW_ERR_SOC_FATAL_HBM1_CHNL3,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 12)] = XE_HW_ERR_SOC_FATAL_HBM1_CHNL4,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 13)] = XE_HW_ERR_SOC_FATAL_HBM1_CHNL5,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 14)] = XE_HW_ERR_SOC_FATAL_HBM1_CHNL6,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(0, 15)] = XE_HW_ERR_SOC_FATAL_HBM1_CHNL7,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 0)] = XE_HW_ERR_SOC_FATAL_HBM2_CHNL0,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 1)] = XE_HW_ERR_SOC_FATAL_HBM2_CHNL1,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 2)] = XE_HW_ERR_SOC_FATAL_HBM2_CHNL2,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 3)] = XE_HW_ERR_SOC_FATAL_HBM2_CHNL3,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 4)] = XE_HW_ERR_SOC_FATAL_HBM2_CHNL4,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 5)] = XE_HW_ERR_SOC_FATAL_HBM2_CHNL5,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 6)] = XE_HW_ERR_SOC_FATAL_HBM2_CHNL6,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 7)] = XE_HW_ERR_SOC_FATAL_HBM2_CHNL7,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 8)] = XE_HW_ERR_SOC_FATAL_HBM3_CHNL0,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 9)] = XE_HW_ERR_SOC_FATAL_HBM3_CHNL1,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 10)] = XE_HW_ERR_SOC_FATAL_HBM3_CHNL2,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 11)] = XE_HW_ERR_SOC_FATAL_HBM3_CHNL3,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 12)] = XE_HW_ERR_SOC_FATAL_HBM3_CHNL4,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 13)] = XE_HW_ERR_SOC_FATAL_HBM3_CHNL5,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 14)] = XE_HW_ERR_SOC_FATAL_HBM3_CHNL6,
> +	[DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 15)] = XE_HW_ERR_SOC_FATAL_HBM3_CHNL7,
> +	[DRM_XE_GENL_GSC_ERROR_CORRECTABLE_SRAM_ECC] = XE_HW_ERR_GSC_CORR_SRAM,
> +	[DRM_XE_GENL_GSC_ERROR_NONFATAL_MIA_SHUTDOWN] = XE_HW_ERR_GSC_NONFATAL_MIA_SHUTDOWN,
> +	[DRM_XE_GENL_GSC_ERROR_NONFATAL_MIA_INTERNAL] = XE_HW_ERR_GSC_NONFATAL_MIA_INTERNAL,
> +	[DRM_XE_GENL_GSC_ERROR_NONFATAL_SRAM_ECC] = XE_HW_ERR_GSC_NONFATAL_SRAM,
> +	[DRM_XE_GENL_GSC_ERROR_NONFATAL_WDG_TIMEOUT] = XE_HW_ERR_GSC_NONFATAL_WDG,
> +	[DRM_XE_GENL_GSC_ERROR_NONFATAL_ROM_PARITY] = XE_HW_ERR_GSC_NONFATAL_ROM_PARITY,
> +	[DRM_XE_GENL_GSC_ERROR_NONFATAL_UCODE_PARITY] = XE_HW_ERR_GSC_NONFATAL_UCODE_PARITY,
> +	[DRM_XE_GENL_GSC_ERROR_NONFATAL_VLT_GLITCH] = XE_HW_ERR_GSC_NONFATAL_VLT_GLITCH,
> +	[DRM_XE_GENL_GSC_ERROR_NONFATAL_FUSE_PULL] = XE_HW_ERR_GSC_NONFATAL_FUSE_PULL,
> +	[DRM_XE_GENL_GSC_ERROR_NONFATAL_FUSE_CRC_CHECK] = XE_HW_ERR_GSC_NONFATAL_FUSE_CRC,
> +	[DRM_XE_GENL_GSC_ERROR_NONFATAL_SELF_MBIST] = XE_HW_ERR_GSC_NONFATAL_SELF_MBIST,
> +	[DRM_XE_GENL_GSC_ERROR_NONFATAL_AON_RF_PARITY] = XE_HW_ERR_GSC_NONFATAL_AON_RF_PARITY,
> +	[DRM_XE_GENL_SGGI_ERROR_NONFATAL] = XE_HW_ERR_TILE_NONFATAL_SGGI,
> +	[DRM_XE_GENL_SGLI_ERROR_NONFATAL] = XE_HW_ERR_TILE_NONFATAL_SGLI,
> +	[DRM_XE_GENL_SGCI_ERROR_NONFATAL] = XE_HW_ERR_TILE_NONFATAL_SGCI,
> +	[DRM_XE_GENL_MERT_ERROR_NONFATAL] = XE_HW_ERR_TILE_NONFATAL_MERT,
> +	[DRM_XE_GENL_SGGI_ERROR_FATAL] = XE_HW_ERR_TILE_FATAL_SGGI,
> +	[DRM_XE_GENL_SGLI_ERROR_FATAL] = XE_HW_ERR_TILE_FATAL_SGLI,
> +	[DRM_XE_GENL_SGCI_ERROR_FATAL] = XE_HW_ERR_TILE_FATAL_SGCI,
> +	[DRM_XE_GENL_MERT_ERROR_FATAL] = XE_HW_ERR_TILE_FATAL_MERT,
> +};

probably deserves a separate header file?

> +
> +static unsigned int config_gt_id(const u64 config)
> +{
> +	return config >> __XE_GENL_GT_SHIFT;
> +}
> +
> +static u64 config_counter(const u64 config)
> +{
> +	return config & ~(~0ULL << __XE_GENL_GT_SHIFT);
> +}
> +
> +static bool is_gt_error(const u64 config)
> +{
> +	unsigned int error;
> +
> +	error = config_counter(config);
> +	if (error <= DRM_XE_GENL_GT_ERROR_FATAL_FPU)
> +		return true;
> +
> +	return false;
> +}
> +
> +static bool is_gt_vector_error(const u64 config)
> +{
> +	unsigned int error;
> +
> +	error = config_counter(config);
> +	if (error >= DRM_XE_GENL_GT_ERROR_FATAL_TLB &&
> +	    error <= DRM_XE_GENL_GT_ERROR_FATAL_L3BANK)
> +		return true;
> +
> +	return false;
> +}
> +
> +static bool is_pvc_invalid_gt_errors(const u64 config)
> +{
> +	switch (config_counter(config)) {
> +	case DRM_XE_GENL_GT_ERROR_CORRECTABLE_L3_SNG:
> +	case DRM_XE_GENL_GT_ERROR_CORRECTABLE_SAMPLER:
> +	case DRM_XE_GENL_GT_ERROR_FATAL_ARR_BIST:
> +	case DRM_XE_GENL_GT_ERROR_FATAL_L3_DOUB:
> +	case DRM_XE_GENL_GT_ERROR_FATAL_L3_ECC_CHK:
> +	case DRM_XE_GENL_GT_ERROR_FATAL_IDI_PAR:
> +	case DRM_XE_GENL_GT_ERROR_FATAL_SQIDI:
> +	case DRM_XE_GENL_GT_ERROR_FATAL_SAMPLER:
> +	case DRM_XE_GENL_GT_ERROR_FATAL_EU_IC:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool is_gsc_hw_error(const u64 config)
> +{
> +	if (config_counter(config) >= DRM_XE_GENL_GSC_ERROR_CORRECTABLE_SRAM_ECC &&
> +	    config_counter(config) <= DRM_XE_GENL_GSC_ERROR_NONFATAL_AON_RF_PARITY)
> +		return true;
> +
> +	return false;
> +}
> +
> +static bool is_soc_error(const u64 config)
>  {
> +	if (config_counter(config) >= DRM_XE_GENL_SOC_ERROR_NONFATAL_CSC_PSF_CMD &&
> +	    config_counter(config) <= DRM_XE_GENL_SOC_ERROR_FATAL_HBM(1, 15))
> +		return true;
> +
> +	return false;
> +}
> +
> +static int
> +config_status(struct xe_device *xe, u64 config)
> +{
> +	unsigned int gt_id = config_gt_id(config);
> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
> +
> +	if (!IS_DGFX(xe))
> +		return -ENODEV;
> +
> +	if (gt->info.type == XE_GT_TYPE_UNINITIALIZED)
> +		return -ENOENT;
> +
> +	/* GSC HW ERRORS are present on root tile of
> +	 * platform supporting MEMORY SPARING only
> +	 */
> +	if (is_gsc_hw_error(config) && !(xe->info.platform == XE_PVC && !gt_id))
> +		return -ENODEV;
> +
> +	/* GT vectors error  are valid on Platforms supporting error vectors only */
> +	if (is_gt_vector_error(config) && xe->info.platform != XE_PVC)
> +		return -ENODEV;
> +
> +	/* Skip gt errors not supported on pvc */
> +	if (is_pvc_invalid_gt_errors(config) && xe->info.platform == XE_PVC)
> +		return  -ENODEV;
> +
> +	/* FATAL FPU error is valid on PVC only */
> +	if (config_counter(config) == DRM_XE_GENL_GT_ERROR_FATAL_FPU &&
> +	    !(xe->info.platform == XE_PVC))
> +		return -ENODEV;
> +
> +	if (is_soc_error(config) && !(xe->info.platform == XE_PVC))
> +		return -ENODEV;
> +
> +	return (config_counter(config) >=
> +			ARRAY_SIZE(xe_hw_error_map)) ? -ENOENT : 0;
> +}
> +
> +static u64 get_counter_value(struct xe_device *xe, u64 config)
> +{
> +	const unsigned int gt_id = config_gt_id(config);
> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
> +	unsigned int id = config_counter(config);
> +
> +	if (is_gt_error(config) || is_gt_vector_error(config))
> +		return xa_to_value(xa_load(&gt->errors.hw_error, xe_hw_error_map[id]));
> +
> +	return xa_to_value(xa_load(&gt->tile->errors.hw_error, xe_hw_error_map[id]));
> +}
> +
> +static int fill_error_details(struct xe_device *xe, struct genl_info *info, struct sk_buff *new_msg)
> +{
> +	struct nlattr *entry_attr;
> +	bool counter = false;
> +	struct xe_gt *gt;
> +	int i, j;
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(xe_hw_error_events) !=
> +		     ARRAY_SIZE(xe_hw_error_map));
> +
> +	if (info->genlhdr->cmd == DRM_RAS_CMD_READ_ALL)
> +		counter = true;
> +
> +	entry_attr = nla_nest_start(new_msg, DRM_RAS_ATTR_QUERY_REPLY);
> +	if (!entry_attr)
> +		return -EMSGSIZE;
> +
> +	for_each_gt(gt, xe, j) {
> +		char str[MAX_ERROR_NAME];
> +		u64 val;
> +
> +		for (i = 0; i < ARRAY_SIZE(xe_hw_error_events); i++) {
> +			u64 config = DRM_XE_HW_ERROR(j, i);
> +
> +			if (config_status(xe, config))
> +				continue;
> +
> +			/* should this be cleared everytime */
> +			snprintf(str, sizeof(str), "error-gt%d-%s", j, xe_hw_error_events[i]);
> +
> +			if (nla_put_string(new_msg, DRM_RAS_ATTR_ERROR_NAME, str))
> +				goto err;
> +			if (nla_put_u64_64bit(new_msg, DRM_RAS_ATTR_ERROR_ID, config, DRM_ATTR_PAD))
> +				goto err;
> +			if (counter) {
> +				val = get_counter_value(xe, config);
> +				if (nla_put_u64_64bit(new_msg, DRM_RAS_ATTR_ERROR_VALUE, val,
> +						      DRM_ATTR_PAD))
> +					goto err;
> +			}
> +		}
> +	}
> +
> +	nla_nest_end(new_msg, entry_attr);
> +
>  	return 0;
> +err:
> +	drm_dbg_driver(&xe->drm, "msg buff is small\n");
> +	nla_nest_cancel(new_msg, entry_attr);
> +	nlmsg_free(new_msg);
> +
> +	return -EMSGSIZE;
> +}
> +
> +static int xe_genl_list_errors(struct drm_device *drm, struct sk_buff *msg, struct genl_info *info)
> +{
> +	struct xe_device *xe = to_xe_device(drm);
> +	size_t msg_size = NLMSG_DEFAULT_SIZE;
> +	enum drm_cmd_request_type query_type;
> +	struct sk_buff *new_msg;
> +	int retries = 2;
> +	void *usrhdr;
> +	int ret = 0;
> +
> +	if (!IS_DGFX(xe))
> +		return -ENODEV;
> +
> +	/* Support verbose only errors */
> +	query_type = nla_get_u8(info->attrs[DRM_RAS_ATTR_QUERY]);
> +	if (query_type == DRM_RAS_CMD_QUERY_NORMAL)
> +		return -EOPNOTSUPP;
> +
> +	do {
> +		new_msg = drm_genl_alloc_msg(drm, info, msg_size, &usrhdr);
> +		if (!new_msg)
> +			return -ENOMEM;
> +
> +		ret = fill_error_details(xe, info, new_msg);
> +		if (!ret)
> +			break;
> +
> +		msg_size += NLMSG_DEFAULT_SIZE;
> +	} while (retries--);
> +
> +	if (!ret)
> +		ret = drm_genl_reply(new_msg, info, usrhdr);
> +
> +	return ret;
>  }
>  
>  static int xe_genl_read_error(struct drm_device *drm, struct sk_buff *msg, struct genl_info *info)
>  {
> -	return 0;
> +	struct xe_device *xe = to_xe_device(drm);
> +	size_t msg_size = NLMSG_DEFAULT_SIZE;
> +	struct sk_buff *new_msg;
> +	void *usrhdr;
> +	int ret = 0;
> +	int retries = 2;
> +	u64 config, val;
> +
> +	if (info->genlhdr->cmd == DRM_RAS_CMD_READ_BLOCK)
> +		return -EOPNOTSUPP;
> +
> +	config = nla_get_u64(info->attrs[DRM_RAS_ATTR_ERROR_ID]);
> +	ret = config_status(xe, config);
> +	if (ret)
> +		return ret;
> +	do {
> +		new_msg = drm_genl_alloc_msg(drm, info, msg_size, &usrhdr);
> +		if (!new_msg)
> +			return -ENOMEM;
> +
> +		val = get_counter_value(xe, config);
> +		if (nla_put_u64_64bit(new_msg, DRM_RAS_ATTR_ERROR_VALUE, val, DRM_ATTR_PAD)) {
> +			msg_size += NLMSG_DEFAULT_SIZE;
> +			continue;
> +		}
> +
> +		break;
> +	} while (retries--);
> +
> +	ret = drm_genl_reply(new_msg, info, usrhdr);
> +
> +	return ret;
>  }

this .c without any public function and no .h was what draw my attention that
there was something wrong with the registration process. We need to have init and finish
per component.

>  
>  /* driver callbacks to DRM netlink commands*/
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index e2426413488f..d352a96e4826 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1974,6 +1974,91 @@ struct drm_xe_query_eu_stall {
>  	__u64 sampling_rates[];
>  };
>  
> +/*
> + * Top bits of every counter are GT id.
> + */
> +#define __XE_GENL_GT_SHIFT	(56)
> +/**
> + * DOC: XE GENL netlink event IDs
> + * TODO: Add more details

yes, please it is hard to understand why here.

And also I have the feeling that this deserves to be together with
the other definitions above all together in a separate header.
perhaps even per platform?!

> + */
> +#define DRM_XE_HW_ERROR(gt, id) \
> +	((id) | ((__u64)(gt) << __XE_GENL_GT_SHIFT))
> +
> +#define DRM_XE_GENL_GT_ERROR_CORRECTABLE_L3_SNG		(0)
> +#define DRM_XE_GENL_GT_ERROR_CORRECTABLE_GUC			(1)
> +#define DRM_XE_GENL_GT_ERROR_CORRECTABLE_SAMPLER		(2)
> +#define DRM_XE_GENL_GT_ERROR_CORRECTABLE_SLM			(3)
> +#define DRM_XE_GENL_GT_ERROR_CORRECTABLE_EU_IC		(4)
> +#define DRM_XE_GENL_GT_ERROR_CORRECTABLE_EU_GRF		(5)
> +#define DRM_XE_GENL_GT_ERROR_FATAL_ARR_BIST			(6)
> +#define DRM_XE_GENL_GT_ERROR_FATAL_L3_DOUB			(7)
> +#define DRM_XE_GENL_GT_ERROR_FATAL_L3_ECC_CHK		(8)
> +#define DRM_XE_GENL_GT_ERROR_FATAL_GUC			(9)
> +#define DRM_XE_GENL_GT_ERROR_FATAL_IDI_PAR			(10)
> +#define DRM_XE_GENL_GT_ERROR_FATAL_SQIDI			(11)
> +#define DRM_XE_GENL_GT_ERROR_FATAL_SAMPLER			(12)
> +#define DRM_XE_GENL_GT_ERROR_FATAL_SLM			(13)
> +#define DRM_XE_GENL_GT_ERROR_FATAL_EU_IC			(14)
> +#define DRM_XE_GENL_GT_ERROR_FATAL_EU_GRF			(15)
> +#define DRM_XE_GENL_GT_ERROR_FATAL_FPU			(16)
> +#define DRM_XE_GENL_GT_ERROR_FATAL_TLB			(17)
> +#define DRM_XE_GENL_GT_ERROR_FATAL_L3_FABRIC			(18)
> +#define DRM_XE_GENL_GT_ERROR_CORRECTABLE_SUBSLICE		(19)
> +#define DRM_XE_GENL_GT_ERROR_CORRECTABLE_L3BANK		(20)
> +#define DRM_XE_GENL_GT_ERROR_FATAL_SUBSLICE			(21)
> +#define DRM_XE_GENL_GT_ERROR_FATAL_L3BANK			(22)
> +#define DRM_XE_GENL_SGUNIT_ERROR_CORRECTABLE			(23)
> +#define DRM_XE_GENL_SGUNIT_ERROR_NONFATAL			(24)
> +#define DRM_XE_GENL_SGUNIT_ERROR_FATAL			(25)
> +#define DRM_XE_GENL_SOC_ERROR_NONFATAL_CSC_PSF_CMD		(26)
> +#define DRM_XE_GENL_SOC_ERROR_NONFATAL_CSC_PSF_CMP		(27)
> +#define DRM_XE_GENL_SOC_ERROR_NONFATAL_CSC_PSF_REQ		(28)
> +#define DRM_XE_GENL_SOC_ERROR_NONFATAL_ANR_MDFI		(29)
> +#define DRM_XE_GENL_SOC_ERROR_NONFATAL_MDFI_T2T		(30)
> +#define DRM_XE_GENL_SOC_ERROR_NONFATAL_MDFI_T2C		(31)
> +#define DRM_XE_GENL_SOC_ERROR_FATAL_CSC_PSF_CMD		(32)
> +#define DRM_XE_GENL_SOC_ERROR_FATAL_CSC_PSF_CMP		(33)
> +#define DRM_XE_GENL_SOC_ERROR_FATAL_CSC_PSF_REQ		(34)
> +#define DRM_XE_GENL_SOC_ERROR_FATAL_PUNIT			(35)
> +#define DRM_XE_GENL_SOC_ERROR_FATAL_PCIE_PSF_CMD		(36)
> +#define DRM_XE_GENL_SOC_ERROR_FATAL_PCIE_PSF_CMP		(37)
> +#define DRM_XE_GENL_SOC_ERROR_FATAL_PCIE_PSF_REQ		(38)
> +#define DRM_XE_GENL_SOC_ERROR_FATAL_ANR_MDFI			(39)
> +#define DRM_XE_GENL_SOC_ERROR_FATAL_MDFI_T2T			(40)
> +#define DRM_XE_GENL_SOC_ERROR_FATAL_MDFI_T2C			(41)
> +#define DRM_XE_GENL_SOC_ERROR_FATAL_PCIE_AER			(42)
> +#define DRM_XE_GENL_SOC_ERROR_FATAL_PCIE_ERR			(43)
> +#define DRM_XE_GENL_SOC_ERROR_FATAL_UR_COND			(44)
> +#define DRM_XE_GENL_SOC_ERROR_FATAL_SERR_SRCS		(45)
> +
> +#define DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(ss, n)\
> +		(DRM_XE_GENL_SOC_ERROR_FATAL_SERR_SRCS + 0x1 + (ss) * 0x10 + (n))
> +#define DRM_XE_GENL_SOC_ERROR_FATAL_HBM(ss, n)\
> +		(DRM_XE_GENL_SOC_ERROR_NONFATAL_HBM(1, 15) + 0x1 + (ss) * 0x10 + (n))
> +
> +/* 109 is the last ID used by SOC errors */
> +#define DRM_XE_GENL_GSC_ERROR_CORRECTABLE_SRAM_ECC		(110)
> +#define DRM_XE_GENL_GSC_ERROR_NONFATAL_MIA_SHUTDOWN		(111)
> +#define DRM_XE_GENL_GSC_ERROR_NONFATAL_MIA_INTERNAL		(112)
> +#define DRM_XE_GENL_GSC_ERROR_NONFATAL_SRAM_ECC		(113)
> +#define DRM_XE_GENL_GSC_ERROR_NONFATAL_WDG_TIMEOUT		(114)
> +#define DRM_XE_GENL_GSC_ERROR_NONFATAL_ROM_PARITY		(115)
> +#define DRM_XE_GENL_GSC_ERROR_NONFATAL_UCODE_PARITY		(116)
> +#define DRM_XE_GENL_GSC_ERROR_NONFATAL_VLT_GLITCH		(117)
> +#define DRM_XE_GENL_GSC_ERROR_NONFATAL_FUSE_PULL		(118)
> +#define DRM_XE_GENL_GSC_ERROR_NONFATAL_FUSE_CRC_CHECK	(119)
> +#define DRM_XE_GENL_GSC_ERROR_NONFATAL_SELF_MBIST		(120)
> +#define DRM_XE_GENL_GSC_ERROR_NONFATAL_AON_RF_PARITY		(121)
> +#define DRM_XE_GENL_SGGI_ERROR_NONFATAL			(122)
> +#define DRM_XE_GENL_SGLI_ERROR_NONFATAL			(123)
> +#define DRM_XE_GENL_SGCI_ERROR_NONFATAL			(124)
> +#define DRM_XE_GENL_MERT_ERROR_NONFATAL			(125)
> +#define DRM_XE_GENL_SGGI_ERROR_FATAL				(126)
> +#define DRM_XE_GENL_SGLI_ERROR_FATAL				(127)
> +#define DRM_XE_GENL_SGCI_ERROR_FATAL				(128)
> +#define DRM_XE_GENL_MERT_ERROR_FATAL				(129)
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.25.1
> 
