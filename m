Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8CBAD6744
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 07:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8B010E71C;
	Thu, 12 Jun 2025 05:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K8JEYEfQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6F310E71C;
 Thu, 12 Jun 2025 05:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749705898; x=1781241898;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aoFcnKw6CgX/b0AwJIphr68lAFhJt10nGZX19u4XjSY=;
 b=K8JEYEfQhAU8SKuSmBh0nTp8FCW/NZAKrN8G5zn3zwymC6YjmcTClhjx
 KKjAaeAp5hdc0h1DWEnP4l6JwVzVILo8xMvt59ZtCtnzf64WP6aSq4/VI
 rqVqOn6DG17v0M9FbM9cqrkjKUpSojpuqQCDtMJO5WxLOheJijZ6hylCn
 8PVSBnatZAN4e3MR/hduPXzjeZr60jjJRIYPKQw0PbNrE1tyC3OrM4kDx
 x1x0fuYexiVrjVaTIRa9bTsTBpNhVlqohnkvv1IjlQOR+6AE1mmI/9lKK
 +vRxMYgdLqhgUY4Wkp4+u2TPQtZy6gQJx5nOdgn2hKYlqYP/kYOnYAWhB g==;
X-CSE-ConnectionGUID: 13HICVb+RGacxJmdEcqGOA==
X-CSE-MsgGUID: /woXtCIERLyLrToDxHD3Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51089282"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="51089282"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 22:24:58 -0700
X-CSE-ConnectionGUID: LXOl77UnTUitk8Do/m1Mog==
X-CSE-MsgGUID: T7yz6AgzQoONKYhx2P7cyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="152560306"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 22:24:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 22:24:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 22:24:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 22:24:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uEITMxceZX3yt57cfH9Ym8l1X8+OUSEcYKcdPpXPlox7JxSO3uVxHK3bYXdx0kQcswblVgbhZrwH3gZAWqVo6/gqgux8j2fKWaDmzz69HLRACTPb3Mp2Kyz/fCKK43jYpAHOCvvb1qasMq+spy8PPvymySHkmN+Mnpf2JOggDOo0U6zjcQ+MRvxRp/P7h/Z4+av1VvAUpmR+NKYkf/5uVTMeMjxd+b8ZYZGr8XeZmeu/zKqdP9Gm3/Xy5cEzCM8xOIzbkGsJqk5/GwIQQyIM5phR2tAyhRD2CcxLC11mgLi6nouC/L2jeBAEW+ZyAZTx4tpMGUpkYffAEb7jctRHJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZ+ptFvHqs6nZHkPy8BDDJUoOBwEr60abFx7Pb1i/Pk=;
 b=fyg5xJe4vGjlN4scUb81fQPgpcfx7nlST0O7DNOBvH1M5EekGlrGwqzKeC/9aUkt2J1PSoqbSzkp9GxvUfIys43uGiyhLaoIPOnT22nAjyPsbhX5HmEDM1imUE+X4fZXro01X+md+NEEMtua6z24XCrGgLGkTA9wnYg0j/U7EDSgw842OC+XvnHFzTlE2ulBhXjsJbFzi1d2vx1O/qMa3lJUmQkHHkZVF6pIEqE5rN2W2YJmLyVH6ZfPSJ6TWErozIJTvpE1XKDUe14bRcjDuibXY7eIbazE5pg4I8O5s5Sy7GZ+GGTctCRW2FoLFb69UC6wY6PAz7TgDuZfUpQ2Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4893.namprd11.prod.outlook.com (2603:10b6:a03:2ac::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 05:24:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 05:24:35 +0000
Date: Thu, 12 Jun 2025 00:24:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Juston Li <justonli@chromium.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Yiwei Zhang <zzyiwei@google.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 1/2] gpu/trace: make TRACE_GPU_MEM configurable
Message-ID: <a4fht42fkkveme565y7zlxh6vbkvv66dsazflnfzryqxugqw4o@jormlryxyje2>
References: <20250611225145.1739201-1-justonli@chromium.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250611225145.1739201-1-justonli@chromium.org>
X-ClientProxiedBy: SJ0P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4893:EE_
X-MS-Office365-Filtering-Correlation-Id: 39581790-d2af-4682-9b26-08dda9716b42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1lW0dRcsRVrs2rEB/TUF0WD93WqlEXGxjhYrQbNJ8GlsYy06qSLqHiysj7Zs?=
 =?us-ascii?Q?qhJjXC/Quz1R10Ru6tR0xi1z7KeYS26JD8Mgfz7Cu7Xs5gib1+Cwu9kM1Hcj?=
 =?us-ascii?Q?QiAtYhp59/+7siaG8U7BBxPwsegNEm2Jh4EOGaxpb+qsLLB3ZMskI9kGpLF2?=
 =?us-ascii?Q?f6bvdDc4kUZXtG4lK8cZIiEPwsIFNNrcpVfUwXhEVuw1aG3P65aJTJaS227O?=
 =?us-ascii?Q?TjzRb+NaCCiRgOPfKMYoY39fRaQnU151zarfeW1ZmibjCAyOPPv8PBjzysxx?=
 =?us-ascii?Q?lkYsR6GInE/z9VUI31CBv6/kuiH9PNPRpBET09ErOkmd23MXaj3ZRlHML47a?=
 =?us-ascii?Q?CyWjOPBNNlz4ccbq1p39JTjHrN/x1ArCjx0CoKqzlTHVRn8RzDDYzBX5OWoe?=
 =?us-ascii?Q?J8gG6rIgk61XIzPOU0sIBmG+FBYGeLIIMqCyWyYfMEqAn8mHItHN0uM9oQYS?=
 =?us-ascii?Q?JcQ83m0Usv7ORcqgJNaOy+QjeDD5Uyl6DDKtCQ10j6XIt2KSmavboKcPpDYQ?=
 =?us-ascii?Q?Dropyi0H7oQsvmLdavkpGfhLcIJSw5pQeCF0WZIi7sms/VKN7pV6PbZdNrBI?=
 =?us-ascii?Q?mOtl8U90p0WjPZIF9EOV2O6aNaW/tYQDJKHt16Ji++a56my2fN2aVkZXKBVZ?=
 =?us-ascii?Q?Vf6K6EHrGJPMRaHCK2t1y53liNySyIzOnM6OiFfwnuFnmIcS3/vc5cZEEKrc?=
 =?us-ascii?Q?WGczhDnn0etmC3qTYSvmoNT/woDYWwb9ySel6KyRMjfJweY4hJMCrhVxWH/K?=
 =?us-ascii?Q?XfKMVopnIYqVhyXCuvFXK30XsXVyvr1scz0N9Ncr4aDrybHvUByjUr+cl3aV?=
 =?us-ascii?Q?hB6/fBswi9ICzgLe4dHsxKu1eGO9MVpXAdpZi7s8BkDsOymmpQefN90cqq7X?=
 =?us-ascii?Q?2J/tMz+Q4nwbQnHuJ5Z4GxobpBaIr1sRYf9dHfeBr9X/eoQkg44fZJjTcPed?=
 =?us-ascii?Q?9w8vrf08gevG5BKo9hs8oEX3hxn31VZjYgaXU9Bk45qq11LplnId67/N8fkD?=
 =?us-ascii?Q?rdOYBbccEZ/UizyNM5Q7cO6PgYs6PDE/npjVJOukSFiqR6Iu62SrS1KddxzQ?=
 =?us-ascii?Q?gP7BTcmctv7b5pdzfTJCpNUG/ebG7fMkumC5GBJXJ3FSIOJRmju6AB0tBnuA?=
 =?us-ascii?Q?MToXaUNnFa9bf/RWhubxhhb+8G+4GdT1gj5z7K/kyOgKh8XtU6sUJN1QfqRp?=
 =?us-ascii?Q?SbPRc9eLWtsnlnYjrPC4Z10RD1MVc1P97Kn+HcOvBnXG1JMBwxUVZX9xBP9O?=
 =?us-ascii?Q?rKn+9Mw267l1mHbhoiBstgYlgxl6qUBAWLavKmqmCPe/zX3MiZHhWeEeUz+w?=
 =?us-ascii?Q?RgRNQAO3sYtrQLf+0h98oGH5SFNTOeU3INP4pql8GRkxybL/cqyqEYKR5jN4?=
 =?us-ascii?Q?e+l2K4JqNKISVmObAo2xvpywR/GB1pRnJINR2p5iBxuHPkJebQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/tGx/cbkdpu5JI+ilF4K0DP6/XFqMhAAZdXW3/RhqDnihxA/2dPKfpybWJro?=
 =?us-ascii?Q?hZxi5F33Uvbqmh0FJoSsi+7z1GAvfECq2BkDHy9tbaVu7vzV7iCzTQvmM4Xk?=
 =?us-ascii?Q?B7nR06wTzuYbhZiBE5fKC1jOOUj9XPDUtHCCOZ1UsLwnzhB+BD43phDfukDW?=
 =?us-ascii?Q?UIQ8q0N3kJZsZUvPoU+q6A+jPeKwQPL10wgy06/LGzVY/Lqyyrtm/D5iXpsY?=
 =?us-ascii?Q?6CgBcwsAM/bX4UxzelyNAjw0iAg/E8TCdb0PCtNS54vb326Y+ajGo4gO/4j6?=
 =?us-ascii?Q?tQczZedqF4/iEFyckS6s2w/Kkp7PSKuFDKvOkKp8re/noQQjpyZKoKEVlgiq?=
 =?us-ascii?Q?JABz4KCAn+5+66OhGHFTItDzwYJMLeNWO334QpesMuMvx1gXof2+KRoXAUOA?=
 =?us-ascii?Q?FKTTKVQQ5ijj5dKU8vYcYyxF399kQXNzBxXHQoZqRiCZxASEFHURrIJ+r1Wz?=
 =?us-ascii?Q?PPErWiYZ9IMQ+3vwDKVepbgNSBgamJ12+Ut1VWPPz5dBGx2WYZxE/yBSxedA?=
 =?us-ascii?Q?iR1DAqNpayhFDgR1XDFtRd2Zdzz5oiIe6JFCmzgODytWZAvtAgdqHlKPMNdi?=
 =?us-ascii?Q?wHb4SKe0VW8MakrIh1IurYeqYqCpqYFqw8yb6BQPQVd7qm8ZtPd4XYGevy9a?=
 =?us-ascii?Q?jjh5IVsBPbRxna+zDvD76uc1MZzSmi+qINbA1z94ZMrMAVg6YN4+CxGmo0jg?=
 =?us-ascii?Q?GJMZn3DOg3IA6GG0QJ+p0PAdPyIl2leMFVQa0kO7UfXohlumvifFfIVswuRP?=
 =?us-ascii?Q?hZgtR6YPOfMy35kPHzzQC4MV8+chVthNNYJ0uqHETU9r5fHCj55/14t2t0od?=
 =?us-ascii?Q?ohJEt2AGzTostMOjjgq+ryK9AyokisC/o/gRUtpnOznrfQS40UyLC7r/4ZsN?=
 =?us-ascii?Q?pWz9HB/vv6EaS2NARDqse26g72MG1Rnd3IUQ9E/weZNqRRdKFWUZviovx8bN?=
 =?us-ascii?Q?/A2GDcCZWb2ibqzQKwbDnEtJtVWObe98QbeBDmR98rNDLiCRRv+MGhySQ0dm?=
 =?us-ascii?Q?mKotMSFKIHXf3cyKG5wNBc775x+ZNczEqa1FSYYeEQCO2+s9b/EOpyUoz/A9?=
 =?us-ascii?Q?A649pZphWoUKpVH3U7/jFybS11+gxOuNqZ2ft1wofBSMg7iYXQo534r7A0ZI?=
 =?us-ascii?Q?vUB/PR5Tv4zhB58Q93j19XyFS0KaSIqKC3WcfgweUSUjjZsa7FYFKV1ysUbg?=
 =?us-ascii?Q?Fsz8zA2lvC8AByQxR0XNcSh+72QVwg3ifEoyZfnsSib6wcfFQn+nfg+WhBKH?=
 =?us-ascii?Q?n1yhHsHhAYJ9TJhnwBUboNfD95PDvVEjj43tdUcTGG5Rc379uZMCvaWC7HXU?=
 =?us-ascii?Q?I2ZPYQVEtF0+Lsiv4i5IW3b9cOQMQOzDdWv3iMFvICexpcpH2PXKtqG43nR6?=
 =?us-ascii?Q?p/97dEjl6N1gexussskp5O/vg/hd05nf61J/01hfpK8O/gnc1xleX35stwtP?=
 =?us-ascii?Q?GEcH2MT+xT5YyMya4wHG6IVn0eez3pUBPA8pYiXv23lb+R+2IhU3zCKRLI5t?=
 =?us-ascii?Q?iU9PtEump1uWWmSLgtEDp+Q00zkenm4yAHZmgHesHU3L4iXCXA6YL7WkTe+Q?=
 =?us-ascii?Q?Jbr+V7b3maL/fkBpbNM6LafqQ5NonriWHIzGOJrabkm0F18g97+b3vE+gmgf?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39581790-d2af-4682-9b26-08dda9716b42
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 05:24:35.3993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HWBlPXRWh9n9JEQPAGDAu/ULYAbf1C3VBsec/rEHFi+xKb/CRs/qTVYs+Si9Hbns5Z0u2ZT6zZ9iqPtZ6uCwBYVgMDmPGWabA1KL2ulpZWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4893
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

On Wed, Jun 11, 2025 at 03:51:23PM -0700, Juston Li wrote:
>Move the source to a better place in Device Drivers -> Graphics support
>now that its configurable.
>
>v4:
> - Move source location (Tvrtko)
>
>v3:
> - Patch introduced to replace per-driver config (Lucas)
>
>Signed-off-by: Juston Li <justonli@chromium.org>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/Kconfig           |  2 --
> drivers/gpu/trace/Kconfig | 11 ++++++++++-
> drivers/video/Kconfig     |  1 +
> 3 files changed, 11 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/Kconfig b/drivers/Kconfig
>index 7c556c5ac4fdd..c5edbd2288a19 100644
>--- a/drivers/Kconfig
>+++ b/drivers/Kconfig
>@@ -209,8 +209,6 @@ source "drivers/thunderbolt/Kconfig"
>
> source "drivers/android/Kconfig"
>
>-source "drivers/gpu/trace/Kconfig"
>-
> source "drivers/nvdimm/Kconfig"
>
> source "drivers/dax/Kconfig"
>diff --git a/drivers/gpu/trace/Kconfig b/drivers/gpu/trace/Kconfig
>index c24e9edd022e6..cd3d19c4a201c 100644
>--- a/drivers/gpu/trace/Kconfig
>+++ b/drivers/gpu/trace/Kconfig
>@@ -1,4 +1,13 @@
> # SPDX-License-Identifier: GPL-2.0-only
>
> config TRACE_GPU_MEM
>-	bool
>+	bool "Enable GPU memory usage tracepoints"
>+	default n
>+	help
>+	  Choose this option to enable tracepoints for tracking
>+	  global and per-process GPU memory usage. Intended for
>+	  performance profiling and required for Android.
>+
>+	  Tracepoint availability varies by GPU driver.
>+
>+	  If in doubt, say "N".
>diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
>index 5df981920a945..96adceab2df00 100644
>--- a/drivers/video/Kconfig
>+++ b/drivers/video/Kconfig
>@@ -70,5 +70,6 @@ if FB_CORE || SGI_NEWPORT_CONSOLE
>
> endif
>
>+source "drivers/gpu/trace/Kconfig"
>
> endmenu
>-- 
>2.50.0.rc1.591.g9c95f17f64-goog
>
