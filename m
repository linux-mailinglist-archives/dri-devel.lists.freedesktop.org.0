Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCC48C0517
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 21:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B73F10FB89;
	Wed,  8 May 2024 19:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWpi4BaX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0818D10F30E;
 Wed,  8 May 2024 19:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715196766; x=1746732766;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=2rrhqoB5wqxq4Wv47RmSh1hKVEGMoWMIBwERT3P/QTQ=;
 b=dWpi4BaXBMj8KHKcuIVcDjDpZASKWlkcb7WFGR+0nKVpYj+jrWrQCdpZ
 GHN2tDqrRZKVwQxsu9SfZ2QLUkcxB5kU5kt6MIPCFQqKhwXIJWX2n6c9B
 1LdstlUbnDKMGS41zzwTRFKWOtRI+04tzBNyPn/Zv3fK7t8dfIvj9gWjT
 pgEWBMv4u6RddBux2yP/AjKCHyVG1zcuaX9LVNVVQxFfp0GUSzVpB9HXW
 7WYn6dYRvl4NbFeuGkaB8VMMdkGSxL6OXlbPOSmj8dX5SSqvnKahRsW9J
 IVIYrurvqKSCJpkFOHegXFX6i0J4ccxlg5zLnxsCan8OOkY2Ng+bnWtgv w==;
X-CSE-ConnectionGUID: buqZU1zqTtax+6XoXPXl4w==
X-CSE-MsgGUID: B0EfrPdETLGDCBDAcUsk7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11433920"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="11433920"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 12:32:45 -0700
X-CSE-ConnectionGUID: 3imf9UslR2GbsnyxQczufg==
X-CSE-MsgGUID: Bfv2tO4gQAqhDhIE/HDrtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="28950920"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 12:32:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 12:32:44 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 12:32:44 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 12:32:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aB8//7cBC+Hr+I7DbTkjDrUWBWL0yWVG+yp8qnvMASc3tdgFxqvcrI1OaKmVQ+lO6qC9FBCsIUiMZTXj0Icbv+WDU2rbrZEnFgfTJiQYWBN3iqK/LlV2bvKE4eJcUpkWqYHsAn+VjA64OUrFFu0m8OB9++5auEmBL6GSmVmBacmN1Uv4enkMZujlW/zoCZq3AkCPW5TvnQMjJ31atKE58UtiwIBBE+v81Dg/KyLOtS+iYLnvn2aYASRRBVc5KE221kLW4oTxqrYgu3XBpTg7CASj7db0/SP0GnMdB72e24/xGeUaEBTApNi69f4iYNDjNsr9seK4RsT9Qa4ppxEOFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yr1W5FTGg0COwa7etX6ExUIeCKB/5KVjFb926JaJbYs=;
 b=kAawndgI6H3a7NClNwnD688SyXIy3aLUWB8QnHrz3PVycPWwjuyl9sM4WPuwx84gZAwTlwqZXLPOZfXnC9PH3OBrHmlj1b/9FMdpmN/kuVd3f+M9iAyxwUEW2WOpZYeY+Vw4cU8oeG8ozBE0tkt+btwbuf+9JnVYlpon9IhA7/qU7sE7tIJKythygWtPm3Yd71argMJgFfX0K8TpyPel7LFkP81OBLLUz9JxX2oSdqlCFaSHq/of5pGiGZ7tvbaUSThrpEBhT+fxQbgWc4WjUo5g+ffzcvW9JBXNi9rI9vfGr98XBLNj5rQ6fB3eohy08KFLOPDncm4I9rHYGG2afg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6428.namprd11.prod.outlook.com (2603:10b6:510:1f4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Wed, 8 May
 2024 19:32:42 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 19:32:42 +0000
Date: Wed, 8 May 2024 15:32:36 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-intel-fixes
Message-ID: <ZjvTVEmQeVKVB2jx@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: MW4PR03CA0109.namprd03.prod.outlook.com
 (2603:10b6:303:b7::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ee59e26-83e7-4d1f-3d4d-08dc6f95a0c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|7416005|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fBio0EPbr48oA44yQEHQ+JHC5U2KCPYtwdCGsMCf7/2Hi0683Ly4Dj6uU9pA?=
 =?us-ascii?Q?yNqUgVwvV+4wRgZatFWIf3jbgvp3uZNUQPHQvrby1DdnMhsyAKzxRjVGGTUn?=
 =?us-ascii?Q?UbhR3xWQcRVBtVLT0TC+usINDNZlQ3Hj4/pRz4/qzyay6VmEnh9bFGVE/nRG?=
 =?us-ascii?Q?t8+Cl1n7idL68xn9qiJniPa6gUvKEKfMPpfRJfRmI5aRTVtIGU273ejKjT8O?=
 =?us-ascii?Q?Qh8fosk4scshjVWkwx+9Ggq+XwEOxKhsCpTcVmQQfIanG3vsIGLSrr2ZMCqc?=
 =?us-ascii?Q?xj8wnMKyj+RCuVMFLRXq4FacgP31cxYsLDrRDLp+owU/qXcSzp9rKgzTuJp+?=
 =?us-ascii?Q?sgriKMBtLfFL+ZCAFbQi4WUA/WnQtWER24Jv2QvJk+dTFO340xiNsWfoY5N6?=
 =?us-ascii?Q?6LeYN5GMGa+v+D9ND3nmjXtdvUcjoh6GY35DofWuZBJypE11UFiV/eGtqYv1?=
 =?us-ascii?Q?+/Dje3gUf/nLOopyVm0Vvk0yyol0oVU6+KnTrmvmqA0nz0+VSti2a6dUmLZg?=
 =?us-ascii?Q?jlABTNrFUS5V/chkpL40gcCSB3CkrUQqjG1+rd1TJy7LpIBTBY6uHBgQPAyi?=
 =?us-ascii?Q?O8vO7+nSg4SeQTSN5XTtdSSYZ+eFCMJbOyomWVQ3AXabA5JCP8goR0aYH8sF?=
 =?us-ascii?Q?uLre9SClvukrSnHRoluA1SxTVVubkuGaj+2tK9uLYZuWu99SuXdzk5xA5U+A?=
 =?us-ascii?Q?BQnQZ17HCxWdokJwVmEc02N/x+171dsN/VS/iTDbzXWdnqj8vUReFZokPDsJ?=
 =?us-ascii?Q?0a7LVXIAURBvz7/fhMYvqotlTR/J3j1G01g+DA/jotDlWQZlEi5DBRuXjCfF?=
 =?us-ascii?Q?Ytfj27hO+z7hO/LZuRcMCedw4KAz1bmtIdWqJ1Pf4di1qkd5YXzIGa4G6gvX?=
 =?us-ascii?Q?+bvYkKKQaU3WG44cQyrpupcYsaMdwoEGHLM52nPloRneQGncWnmYLbX79td/?=
 =?us-ascii?Q?tL7CqhskCX+hXG6NyMwZd/aoDUhJ72al/VB4dpBes2uDpj0rYUWHGQQ4sjHT?=
 =?us-ascii?Q?0sKXhjEsqlENZBDBEAHOpAJnCJ1jEPk2LXnxvns8CdsmmHs3sNjzSirTFbdZ?=
 =?us-ascii?Q?EwBeI8SpBbzQssUedfu0jlJ5BNoZP0RdYDvn9L822lem1ygAS3WHnFhNtdLw?=
 =?us-ascii?Q?unDXXbQPboVKoWoyUGYXklqG2TRlgfg2tTH743Nm9hAJkCdoyRYzMBvByvbT?=
 =?us-ascii?Q?98huF5EvmmNvrgv+H1tB30l75UyJJ6LDQzlcma9xdvmw9JzTcNcA2Iv2/ek?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(7416005)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e4JeFhK5ts1uOUboNkGU8iqVHkl+ZidS/N8OiG93LBnRGRSevRLR9Ggyve+B?=
 =?us-ascii?Q?Jm0+1R2s1ctKZjEYE57mk/hrWl+twlQ7L1UfSEr6qalqyg6NHk0Xf0CBVofX?=
 =?us-ascii?Q?Gir9h2+069vD7sLhakB7kwr2sc+X38JVNG/m4WdKw/nNNToFbciy7kutmZi7?=
 =?us-ascii?Q?+Wzn/5dF8E/fgl1Aa2JIzcCm59ZDxjguFiqmFtr2DfWMOkCTyjercs05GMbQ?=
 =?us-ascii?Q?adeMfftne7oWxwWhdaFWhA+Qt2elLQBDHbp1kdE885IKZXKC15Ysb60ZJ2sS?=
 =?us-ascii?Q?AG8qOa7g5kViMImx7zVfwVhHWzHnbPIgruEm8J8dWigiLTHhm9x2v9+/WYox?=
 =?us-ascii?Q?sZLHBENdf3btKx+Wa4h/H+35ArUZigT6dMkFwF5ZWUIIv+d5FC3of7zYuGQ8?=
 =?us-ascii?Q?BYGlSrjPOB3AQxfhNY5GpIlM/YaRRuo8fXrJmQ8/io6ZeLcPS6GvJeh9sacA?=
 =?us-ascii?Q?L/Uk1v4Inb80y3RlPebtocrZvs/xv9mI8XltjjdIXHcFOofn0vS5FPjDEk+G?=
 =?us-ascii?Q?uy35SPs5QFRtyzt7m2REB0Z+4l6Liu3av+xEDdZ20mPx446HkjDC2/pGw1d8?=
 =?us-ascii?Q?PkcEixcecDydq1TxhWH3tjyl0Cj0Qxm5/YeKD4bUKg2SW4Pr07KV1+/2fOtQ?=
 =?us-ascii?Q?9Wl2qmhFVeBjHpu6YxkE1HmgrvNs2iUZ1O1vUsy2LMuCwnmc58yuQu7zD+j+?=
 =?us-ascii?Q?KYB9MUsV1LapufPnZ9m15FzzyBSbJbHDWt5oIRegX9gCgDJisUQNNq75tYC/?=
 =?us-ascii?Q?f0nAG7t1muGYKWkQHZFruGJUNsF4ZpkcBvt0hSezfyp5cdS3wGhhQHldtI19?=
 =?us-ascii?Q?rWRNvqjPuJptGG70+IBcxFEh2JiN9btSprp+C/EHb4tW1MQAbjELdvr1svgH?=
 =?us-ascii?Q?1MpDqpBGjGwD8ySsaj86OM6WDdkM4Rvmow09FZyeXVgnGu4a0QNm9w08wdhq?=
 =?us-ascii?Q?LkMeoJI2F6paoIsc/CTgTY3JZJX9NLy2QOQJa1iEN4Ev1F3mdRVY8BOnxpsJ?=
 =?us-ascii?Q?R51PzoXgBua8R1rW1Zo567R1XyCbGDQ9Wy7Mp0PinyiLa8E3Ic4/91eQsDm0?=
 =?us-ascii?Q?TjBN5U/tco39mloHcrNN/0C6uJaHeEvXAhZu+GthGvpQcpJVFunmfQ6CISoz?=
 =?us-ascii?Q?JvpquFWallNdRiys7S9hjPVz16b5LZNeAZIg7USiYppM7RrPkmkf4O+qecGS?=
 =?us-ascii?Q?w/FYqSeA4rlx+Dc0SFHJQkZ53TNpnZk6p4FpfMKQAjyobLQwngk1zq9pXHo+?=
 =?us-ascii?Q?Dp61L1THULyo182L+TZTk2B0psqYvvk6Uqz67C/Vevd0iSpMvy33y8I5vRGj?=
 =?us-ascii?Q?RTd4xj2/zGEEJtpgzOpKNW+DwVMrob/gtXG2PtgxL0191xsfnwlehJPECXK6?=
 =?us-ascii?Q?gH9qX6Ev7EmSkEORArKV6kzIRgtDxCHsrHJnftI7moR4kSlBJS+ICTPvtRsL?=
 =?us-ascii?Q?xzrzay3QE2Qd39c4kz0t8MiLZUfD3Jxlys2AsHOm/tTBL7SWAAoPsD/pUFc8?=
 =?us-ascii?Q?zE12ZWJ8OS9wZirPe0uREJ7erRgf6yYSTn3VwJYrICUsPr2wlQMGUGWUPol5?=
 =?us-ascii?Q?zNCTUQaRRFiQdsGCi7ExU8k0VfQRBEsfT4DrkixG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee59e26-83e7-4d1f-3d4d-08dc6f95a0c2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 19:32:42.0295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mEw//KJ8KMimi3jb7K/qyMImf7dfhORExpCXLa1mnxHH6vs2qeLhEyXrtS3g7kxAN5gvDXgnTFFd3JZ5bq2P3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6428
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

Hi Dave and Sima,

Here goes our last fixes for v6.9.

drm-intel-fixes-2024-05-08:
- Automate CCS Mode setting during engine resets (Andi)
- Fix audio time stamp programming for DP (Chaitanya)
- Fix parsing backlight BDB data (Karthikeyan)
The following changes since commit dd5a440a31fae6e459c0d6271dddd62825505361:

  Linux 6.9-rc7 (2024-05-05 14:06:01 -0700)

are available in the Git repository at:

  https://anongit.freedesktop.org/git/drm/drm-intel tags/drm-intel-fixes-2024-05-08

for you to fetch changes up to 43b26bdd2ee5cfca80939be910d5b23a50cd7f9d:

  drm/i915/bios: Fix parsing backlight BDB data (2024-05-07 09:42:27 -0400)

----------------------------------------------------------------
- Automate CCS Mode setting during engine resets (Andi)
- Fix audio time stamp programming for DP (Chaitanya)
- Fix parsing backlight BDB data (Karthikeyan)

----------------------------------------------------------------
Andi Shyti (1):
      drm/i915/gt: Automate CCS Mode setting during engine resets

Chaitanya Kumar Borah (1):
      drm/i915/audio: Fix audio time stamp programming for DP

Karthikeyan Ramasubramanian (1):
      drm/i915/bios: Fix parsing backlight BDB data

 drivers/gpu/drm/i915/display/intel_audio.c    | 113 ++------------------------
 drivers/gpu/drm/i915/display/intel_bios.c     |  19 +----
 drivers/gpu/drm/i915/display/intel_vbt_defs.h |   5 --
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c   |   6 +-
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h   |   2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |   4 +-
 6 files changed, 19 insertions(+), 130 deletions(-)
