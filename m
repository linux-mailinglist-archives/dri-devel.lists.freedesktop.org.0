Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E96AC72F0
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 23:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532FB10E6D0;
	Wed, 28 May 2025 21:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mh9JSOOr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA9510E6DD;
 Wed, 28 May 2025 21:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748469005; x=1780005005;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=M54uPaohn87dWsKrVRgVOjXgh3G3zpYZXUEnbzbFH8Y=;
 b=mh9JSOOryfFZVHvNpGxl2q88MGH2DDieXz2EvBJiJVfRgNgAyshgc9DE
 dpk3VIJuKb2hPGY9JUhdJKtM94eGbMiE5bdL7su+cJSCH2xGXabCWNTay
 Da2vhLpxtlw2ZwDH4wGuNY9izcx1UGxhbDQxkctoEOWBwkpsa91n72tbp
 iJyh6NWEW8hEkjjOxS/Wgv7yeqw77gEV1yN/KJIUGopSTTnRZCcwUpVOr
 O7nyqr9Dl+zoiqrwzQ4ypZ5fWZkxm4L2JnnGhmECB7rTBmLc0znM3M87j
 RzS8jAl47UWaIAIE6Br7Ez3yBDBxZPnYwYbhM2UrLicOENI86htYrv0Fw A==;
X-CSE-ConnectionGUID: zQzFWS0MQEGvYcFwN0PY+Q==
X-CSE-MsgGUID: 8wL0rv7kSa6CcWGZtzUJug==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="49627701"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="49627701"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 14:50:05 -0700
X-CSE-ConnectionGUID: cMNRwg9PTlm5LQtUv6570w==
X-CSE-MsgGUID: FZsJ41d5R7qzJo/FoJaRzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="143335582"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 14:50:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 14:50:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 14:50:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.40)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 14:50:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p6h5bHqpH6NI8unpW6FQ5Nk8N+2ekzd6jOFqEtQvXAkYGR+oiWx/qIcO3mlZ5oTVHNkwnVFpvozjvgs8nz1w6G1mMm9P+hAFwg5GBhyfwFavaTErbNcWS7vUp16gg2jZBHPtnE/U4oUH8aRoD9/DoPSxLkyHAFrwPsJYVYK/HfhVAQ1lv3MgagcXu5sN0f6N7zQEuDCY9p+OVtBWB/8s5lXW123RkGDNidiRMYbV4/lrZTVgHFWEye4AB3ZkjYlCZ+UvsRzVapmajd1Jlu1wkW1futDWex1FyoIORjdHvlPWNDm4dtC8y/7Q5uWRea1u9skkUw8iLCl7yDOCTvXzrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRYNIuqYe0JD2y4IRvHWflcDoXGrmVgExjwdn8ks6gs=;
 b=cQ1p15Cp8dGoc8UYLaX9uglTAEjAcFQWhYnHKocCRnxb68oKcc2JOJQY2+2VAHPs4GnLV9INkNuokYZoeYN9wurRNMMVTAtoiX8Ve+PF4jFcjMROzhonN4lYcb2k/pqwRroeeSB4Xmhz/RmU+qSEI+8CFpFC6T2Fo/3L4KFmGiyHp1UB7NLlMFdgt2WmEyolJefEh9DEGYdG4l2d4BGdc9dQlY1CG79D2ckohyj3/U4DfA0FaROvno22QRB4mDbYOyljD7aHKLJ18LvKufmuTN5ByFXClJeDX8PoxiFvMRRfg1sjGC+mjjCE3GYxWnqQPFCdM8oUs8z2NtJCnEQaxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6162.namprd11.prod.outlook.com (2603:10b6:930:29::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 21:50:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Wed, 28 May 2025
 21:50:01 +0000
Date: Wed, 28 May 2025 14:51:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "Pierre-Eric
 Pelloux-Prayer" <pierre-eric.pelloux-prayer@amd.com>, Philipp Stanner
 <phasta@kernel.org>
Subject: Re: [PATCH] drm/xe: Fix NPD when saving default context
Message-ID: <aDeFZevB+TRjiMjC@lstrano-desk.jf.intel.com>
References: <20250528-fix-sched-v1-1-c042ef23ff8b@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250528-fix-sched-v1-1-c042ef23ff8b@intel.com>
X-ClientProxiedBy: SJ0PR05CA0169.namprd05.prod.outlook.com
 (2603:10b6:a03:339::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e045db6-5d85-4763-8e39-08dd9e319920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?o1i1srNSZaW8R8R8o2iWWOKtXi3Iw9OvTFdEYNpz8V4OK7MKOxPD5YHb69?=
 =?iso-8859-1?Q?OvjJgbr6HXncwOuw2TeDW0h4Ovd3x8snUVgGQzzJugaS2gk8gAJPY7epsy?=
 =?iso-8859-1?Q?7O4gVngi7ZLLJ9KROBdurOChuEA1C46lrwYKe0AiVMBPj9UDKNkyQlCh8Q?=
 =?iso-8859-1?Q?7KAyQYQruoyUmudmnrm2htMb3WN15mwHUabmfwtoFPVQQXVj33lGZj4+bm?=
 =?iso-8859-1?Q?K6cxZtVkzUA7wg0kVouXbU/ai7Jv7xdgMageAWXjuSM1jYzkoqXDdTiTdw?=
 =?iso-8859-1?Q?6FGvIMXzO9Bc1UynWLT8LTNAwo4lfFiiscvDuJZhng5qgZMhjg5dRwuEzi?=
 =?iso-8859-1?Q?BMpgwGk9ZDxX7GBK+tJTdhqNQJQoe8g1YJfqwHmJf83XAhHDSrcc4ipoo/?=
 =?iso-8859-1?Q?NScxKSvUFphzRvcUifB610GF5pEBsaTiKPSXMvWAnPR7k2+qf3hmp8zCDZ?=
 =?iso-8859-1?Q?AAg7GKOk7bgCWsfyhudUnRlwHmHuaYzlEoLrWSHWbp/KDBkip1gMgsExaw?=
 =?iso-8859-1?Q?+LTpZt5aFMyTLSTWsPhoAqQAmUb5UmaTSsUAtsi9x26zKDJ7BDdClk6iq8?=
 =?iso-8859-1?Q?+8tSLF0nEkqOi7Ajc4H4/cGqv5iKbm951lEoamrRs95gP/bOpuCfpmbpxQ?=
 =?iso-8859-1?Q?5g3dN4quR7FFOkjbitW6DeItVLzc2kMM9uNCYW70anxTwYmFeuN2i9ewuC?=
 =?iso-8859-1?Q?wEgvmGFcxreHj3fBreL8d+dfUCkOuiaJlRrzlW2kM2xLPGHgGK7X6Jm1U1?=
 =?iso-8859-1?Q?Ce0IfngDlpvpTB1fQygdGv0UEdXpvG7OM3hGCi8+L6CaqOreLseIIbb086?=
 =?iso-8859-1?Q?vliE99Udwq0Bdhk/vp1MwkMncduHoQgM9pQoY/uz1+cpdGvJvO8i+vvw8Q?=
 =?iso-8859-1?Q?NITW8CH+iffdp9bxsPwLMmZYWLy0UcBoB8l/L5ZH2ll7KOOZ01NNfA2otH?=
 =?iso-8859-1?Q?38Oc3zhv9xtdptdV1vbdt5RybwMsFZptL2oETuND2AaL8CM2Hh2x44InHt?=
 =?iso-8859-1?Q?Eip4B65MA3bGsoLXFcemkoyF2/kvF2rj3bCfMBtWafeIgYlnK5ArSp+lXI?=
 =?iso-8859-1?Q?i78B0kAAW8ZlzTsPE5VdvoxKMpNrKkzqqIELndMYh5rvTVdDRF88VEzPUH?=
 =?iso-8859-1?Q?mzmO7FZlBgehy4k3GxzXH0ZDJ118VYh7zYtjeyKHBW+sYFdu7aNLpzoI8m?=
 =?iso-8859-1?Q?2vMtyXDdwe1QUVINyJ4kACrlz4rQevbc1347mr3ra3mCT4IYm2mHtCgEBs?=
 =?iso-8859-1?Q?8oTLtoD3I1XOCIV+o5itzmU+FOt9NT4+rfetrpYfcFPa+D/mRwn/KDAqQG?=
 =?iso-8859-1?Q?TXsTF/qhhOhauRjeHlKPZzSt534zVnaKMdxIFUyo/B6A6CLsKxlUSCTYYo?=
 =?iso-8859-1?Q?Zdr2czZvMtfiRBuMubYoggd914eyk32EAgBNfAzI+Ie2esPzVRddr4gWG7?=
 =?iso-8859-1?Q?Ybzf2vu4C90MYJKOh+UXOKte9lV84jhjNS2qCH9HuJCpz4oF3OyCXcdLZY?=
 =?iso-8859-1?Q?E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4V80iMjeuWOUNHNQioXTS3HNixCZMxj4uT2Gg9ukQWxxY4t6P6iZ7fijKC?=
 =?iso-8859-1?Q?ULOwIRune6rdVYhiR59HMGTYROZeF9GOTKujSWfvR1d++fK/eUCbX/P1SH?=
 =?iso-8859-1?Q?oNb62AeeZ7X+F5hEz7upQBW2Jxx1NeSaxUgF23TMJRiU+Yt0FlkQ/+X7OD?=
 =?iso-8859-1?Q?VeRKwMQbCjD9DJObTreEnUxL4wJ24n4GcnPraAkXx5wcm+B7Kcgx1/Gbxr?=
 =?iso-8859-1?Q?618x1HbV+3ioTxzzRmwWFp+ma63PWH/ZTC73N3W2O6b1wJ0IYz5h3v5WdI?=
 =?iso-8859-1?Q?HSRTeKLrbgObQkDqxP2EG/XcW9NXeIo0k75BHCtgnjX3gXC5nLzZUmzy39?=
 =?iso-8859-1?Q?H3i+8HAIaTRZaYBmuFs2EG/xv64QYSz8LTYeNJ40BSDADkhiMVXFoTG1JM?=
 =?iso-8859-1?Q?w0Eu0cTQ4V1fWGxgbxW85blOX3GfdsntnvjgQc7hlEPWn5H8oi5DvnTfZS?=
 =?iso-8859-1?Q?jcwSkkVZjntp4IdrCKe2hHZf1lplVZOQrAIBjuMu7xiCl5pXMCbRaZEKVW?=
 =?iso-8859-1?Q?W0a2ODpkGhdo1zr6RtgusCTtKVNjA1v9dHaBa535QVU1bAUDPd4ELCWpxD?=
 =?iso-8859-1?Q?wTdJjYCgnfbzl/5427yAoIvg78rPPl97q2591jztB7LPrHh2NLkn79EjbE?=
 =?iso-8859-1?Q?cCPaT24CIKz/IBTi7BCgX37U3wIf75ubCzfPfo2zzZmYC+YlOVK6T1I5oc?=
 =?iso-8859-1?Q?7JUiGyn7a4MXmNpUjt9pSWU9tMOrOlJd6soqsqciEYuOu2CWIrVcl6gLsX?=
 =?iso-8859-1?Q?68zfsF+Is0jB0ZR+n5cHrqbov8HQbi3rH9VV0qkZTfeNYul3T8VPhrGeU2?=
 =?iso-8859-1?Q?AyYwkZyMRcMwZh6/kStk6C3oWmjdE3Gzi75fw8f6/09TFqTRGvJeVSiSfQ?=
 =?iso-8859-1?Q?17Ms+pKgVzqWGGN7v+PHjagfPiOf7wRI3/ebaK/p8lYggi2PBpaAypm3on?=
 =?iso-8859-1?Q?tEf5MjfVOsSlB/vOJo5tPgFXFpyr5Np67Q3K4byimF6QwfLvWlcC4FpZfY?=
 =?iso-8859-1?Q?Vv3XWki867B+OQjBSIhzPTA96WPu2sQWFmuh8wO8OEpbOYiBwsEZhyLnn/?=
 =?iso-8859-1?Q?kVkZ358dFKPBsT6cYgzpOgAWG0BhVRnQWe0jSdOZaczL68F/U3fJnBPEM6?=
 =?iso-8859-1?Q?tbCLE1ElPO4CPuY9m8hACdErbkbqZKqQ5paS90wPB5iJ/M3UOPBmsorhOb?=
 =?iso-8859-1?Q?qQK38xX1mAV89fIruLK204rbG9CYKN+QfwSr4EyP/Mb9AffOfQs3IHGNzV?=
 =?iso-8859-1?Q?P3wL+9lH+TeH2q6z1ecz7fXw+r8vIcxA/8a490tgmH+Nm9q47QVLEjSE1F?=
 =?iso-8859-1?Q?jQHRwAVh9VhAlAqRJ1gR7DbJFYkMUrk+/ej1O837QinegOZA0TuDciwi4w?=
 =?iso-8859-1?Q?Q3baaKbVgqA2EDKGrOtgtlBJr8RZEfmPnvhc7+sN2qAT91NZdWcNWeoDiN?=
 =?iso-8859-1?Q?8Hq+fPDYhdEHwXpLBvJNP6jssvsYxVG0OC5hyhvX7gre9q3mgIh2eTf6MC?=
 =?iso-8859-1?Q?uxw1n/gW/XUu83zLRitEyVi6JUpZzTciI4TWx4/6PNQFd3E7PNhfiOL0qp?=
 =?iso-8859-1?Q?Hc03r3DqzcMeYOCirowD+CL/hHh+Jds2QGVjx0tUDeY9AFsz0kocTh4CIt?=
 =?iso-8859-1?Q?DiVUBaddiyzKLxsYBef/TRq0+ON3X4UFhRcl7s6tus0tqW7kHXAswM2Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e045db6-5d85-4763-8e39-08dd9e319920
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 21:50:01.7716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d1LxxCefrkzk8Q6KlJCMlQ7KGtkTKSjDiiPFY4hrn5ET3zbTzisVx6foX4rFBBasPqeoRuhGT0WLr/Wya0euNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6162
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

On Wed, May 28, 2025 at 02:42:22PM -0700, Lucas De Marchi wrote:
> xef is only valid if it's a job from userspace.  For in-kernel jobs it
> causes a NPD like below:
> 
>         <4> [] RIP: 0010:xe_sched_job_create+0xbd/0x390 [xe]
> 	...
>         <4> [] Call Trace:
>         <4> []  <TASK>
>         <4> []  __xe_bb_create_job+0xa2/0x240 [xe]
>         <4> []  ? find_held_lock+0x31/0x90
>         <4> []  ? xa_find_after+0x12c/0x250
>         <4> []  xe_bb_create_job+0x6e/0x380 [xe]
>         <4> []  ? xa_find_after+0x136/0x250
>         <4> []  ? __drm_dev_dbg+0x7d/0xb0
>         <4> []  xe_gt_record_default_lrcs+0x542/0xb00 [xe]
> 
> Since drm_file starts with 1 for the unique id, just use 0 for the
> in-kernel jobs.
> 
> Fixes: 2956554823ce ("drm/sched: Store the drm client_id in drm_sched_fence")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_sched_job.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index 5921293b25db3..d21bf8f269640 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -114,7 +114,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  	xe_exec_queue_get(job->q);
>  
>  	err = drm_sched_job_init(&job->drm, q->entity, 1, NULL,
> -				 q->xef->drm->client_id);
> +				 q->xef ? q->xef->drm->client_id : 0);
>  	if (err)
>  		goto err_free;
>  
> 
> 
> 
