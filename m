Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3FB88CA64
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 18:11:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549BC10F12C;
	Tue, 26 Mar 2024 17:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KqfIVtqR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DC510F12C;
 Tue, 26 Mar 2024 17:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711473078; x=1743009078;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=q4j6vMxXuBKoqnvs8kfVCUy8/qG6KDtUMrL1DDXBbTw=;
 b=KqfIVtqRjeGfbl5Jov2CZlmI4Mro2vFHADFA3rIOD1p6AhbQ2WQh7KpN
 ytBPxI/NEEW+2j6hQYAWPDrawskDNjmtjGZAIpuQaFiCcVg7002/Xjkpq
 FDmhdIbkg8pxcX6z01r73cUAFkbXp8TdvvwXOiFeRuLU9pD6Z7sQGbwF+
 13TaYnwkI5znH+7n8cKl/IV+Kh9VHFnbmhS/IMtOSH9DT4yFAnYz+Zw9e
 l/Cd+1l74JnyJWgBDysl8oCKAIrQLXgoEAo3/AI5LVnY52kj3zwpl8Rde
 bJF34KWW3T/e0JOTs3CYdOM+Kct1Ijnw6mHbGYSJrjhJezFLdkOeq07H3 A==;
X-CSE-ConnectionGUID: AsDQX6UaTciPWwaL1Prpqw==
X-CSE-MsgGUID: 17UW9l02QD+Yh6z+ZdnZ7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6732043"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="6732043"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 10:11:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="20503278"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 10:11:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 10:11:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 10:11:02 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 10:11:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 10:11:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDAqch4I0iIPWUZk7gxsje3hvRIRCbhg4fljVhm+cBinezAyeSfT3ndVZ7v5PpG1R3arUDy1yqH3ACqSoVcPP8QE93S6LgCm+Rd2/D/Q2UImgzASBEpj6PrTmuxv6o+RKfOWk5AZOftEjFAryHpLyXQqoKilwqTbROTyuLGC5nIDXbUEvLzOaA8E8ZilsQwUexL4fY9DEb57HPpd9j452LOacmeaRCDRymVKRiPYQAPMEFxM8y3DoubW2wN/bHJRDTRY6ag8E72Be1AyMZoRgvFyf91dcJwLAmhsCHxViubTyCjUvzE79mR2BrG6SKVQUOMisfmscpIGFYgYyHuckQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8ahznVoLL+ZG/1mYUskN8+PCERYNxbvdTQOZEdxVFI=;
 b=PIbZI6dL/LpE7S6N5qTwdRmSrSLymQBKjTZRvAsMjxDOY4sfk808ugrTwh9XdNRW2rxzo5NxDdUeswlEfr8Q6coqAXj2BPmUgFqlsLW+TIHWg6Dg9N2yVMMxpJDIQex/YqtsIXIXdxUhe4+gij/AUwODaGUrP7M1yb+GsjJKCWdxJyNx/gIk3/zgt593e/BmuLP8eGGRW77IXckL2op/jwvYirhXuHBVoCvaubiusQoT08kWaPd8QKoxu68o7lcTzF77x8vdWZcylxgiY7XQWt/m+oB5lvQvuZBHQT1cbr5tUnKKX1423bt6ZuWUHjcUPMg1xsD7J6D1U4ainYnOtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB6034.namprd11.prod.outlook.com (2603:10b6:208:375::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 26 Mar
 2024 17:11:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 17:11:00 +0000
Date: Tue, 26 Mar 2024 12:10:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, "Oded
 Gabbay" <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <a47jbz45nry4gjmtyresaraakwnasgngncltmrshbfkx25mhzu@bvay7j3ed7ir>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: BYAPR05CA0063.namprd05.prod.outlook.com
 (2603:10b6:a03:74::40) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB6034:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FYy7sCtR3pRmYtQ3Civ/KeUZ8Mrj0qUoha4x1WtRbJudowI9A69gzqdoK1EvPICabEf2iDYhe3h+6nH+zwXsWgIXaIEAmf+TUu2f10ALH0OSC7yq4sLFr/DXz+0cmao2OhNn+dYt5+2G98Rg2i2C7779MpYLteDCVeDkCwl1M/FZfQ9NtDkWMC26lLNlT3esR41seE04OAmxxzhFw/UMkh59JjczsmjEiqLFQZvOEgSKljV+lSyvqQNLrJk8+pusol6N/6GYdErRtQGEzXcZN6965ubPK8Ap6WBLARqE8+6tvm+bjASCW/n3Vnl020va9aJDTDO/g2q0T4dLqCT3q7rP2dxkLkYvi86u02n60+mRXESAFoj8tckTzLOxn42SkkVgVuKmufyfgVt8pnV/NJUnsYtiPnd6/x2+khXD7ztbayeP79BLp92t8bKHzdjA1bvJSC9nEH6QdP5MGX+Rs9g5IlYAkkXnVV4fc7nT6j/D2y/hVLjkktl80vsvD05mZroYx2RbviQ3NGdGOAp93Q+UaHpYfnK3dpFW0YJUzFM1zjw/2ZLPeRALnAmVd0P4JtV9R9gG6CJn5bzc/E4qKguQ+AaXmtXKN/27AHQHKKU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OGXL0iiSZ+yGhAocCOfZYcDn5uj9YJuh5ZjSLwufq4NUhwbRxWE9gABbAhbW?=
 =?us-ascii?Q?3kgPl24DwMPx377S8weTkcFqeAbeB12VtTmwTAqZ/DrmcCKNvxJ0oNWdoQHs?=
 =?us-ascii?Q?BOu3xfkNwfEuDDeEaNZoLfgcLyn28zWpK9GhYYaC9XIiZa3JfVYbGtplvPz8?=
 =?us-ascii?Q?inIGtBdmmnQt4+HI4JuKMNcF0cxDJidfQEvczm/pdCx0ej0mIQmeKzO8h/Yf?=
 =?us-ascii?Q?O6Vo0BUHsv9yWFCLhCeJpa9j8hS9KyQcN2GNTycdTvMhn5gIoQn6t9LZm6IY?=
 =?us-ascii?Q?i04ODcRb2zcdbIrgcvU5+7y+IWh2BIVZvqiFXmfvqW2oCt2ZZCcR5RcRDHg8?=
 =?us-ascii?Q?m/ScG7Q+QjmCMQJtNd00B6cKj3R5a6R9hf/HwRPFZreV3aCm1hMwMX+lc/y9?=
 =?us-ascii?Q?PNU6QXxpgvpJA3ruCfX12l24uYDltWugZFcuJEBvC1qcxvsg4wyep1MJ5yGP?=
 =?us-ascii?Q?d6nHGiB6e1sgsDUYiwA1uzBrSXOJpIUxPuNWR+R+dglGSFCNOLIfmPCVl8ff?=
 =?us-ascii?Q?NeYM9qiXHwfnCYntnw2crPv1Z8W62UPFUtsXIdPi08icYPOrh4Jon13ocPFq?=
 =?us-ascii?Q?CnS0yRIu4mLoBsGgShTwwncw+48DVW4mXYyWf/UdkHp2Wl6OjyKK3zWQ49BW?=
 =?us-ascii?Q?HF9GPpY5JUHoYYPLctBlQHJtVvDQJPaM8Z64JDgCF+/8ZM0b2/CpYtcfdGAA?=
 =?us-ascii?Q?sOvrGK/D2PCNQCOYp6Jgd4yOmx95oPk2vv5DuotOKT/+YLmtydm2y6BJjnJ2?=
 =?us-ascii?Q?Q3kw228jIiM0sbT06peE+6faB1kg7DcmjEBZtxU26dBkJm41Hfibjo9BE+19?=
 =?us-ascii?Q?GmkoACNwxDufvlyzMNivk7hM1NGsEB6ilOgEoLDi6Cg7LCO1wdYiz0li9plw?=
 =?us-ascii?Q?Xwv4AZBxLqlIPl9OavQRwItHDEirX60jdGDG6GB43DcdRpGqugq9X5EcGm0C?=
 =?us-ascii?Q?Mtq84cuYCqxhyIwhURr/Co1FTdUb8BC09UylxlNBZ97YS6hNwjg2GVJdTJXo?=
 =?us-ascii?Q?kw3Mr6LqKP1qymL+5u/GbgNuPJZFF85PWxWttVazvFuKRde89PIMRMUz458V?=
 =?us-ascii?Q?sgYAZCHz37F1CiIPUX/Xsi6AGOWLJpe5NJikh3PHzPJDX9Q/zs2CiuKPvq8H?=
 =?us-ascii?Q?K6l7mkpRgXdnrbt72isEaXYP7LQdbDybFdK6fUsrUPkGB3eNFCYeVaTZIE7/?=
 =?us-ascii?Q?c7+AGb3VTHVcrz4YMkQ7myK03TamYkPoz5G1HNOSBuzPnCN3wuYZAnDyvQPH?=
 =?us-ascii?Q?8kmF/3cWnTfkQSdbvso1roNhDVjqqULnr5x4SwP2jFILXWgssABFyxwjMS+q?=
 =?us-ascii?Q?8WfDNbE5DyQI4ZIXmCpQCPNUUJVvtk6hZUNJLnxX+Vr+HpdBHarGyJwezX3l?=
 =?us-ascii?Q?zRo/pZASbnEx+Uux3nlKyBrcbkWGcnGaQt2CDW5ucUAYhbmrkBtdZi+hXlMN?=
 =?us-ascii?Q?KOmNhgngH1kKAQaW9lg9jUTwW78E7hE5+TVF3pJcx4WXveDv2UVc9P+N+4xX?=
 =?us-ascii?Q?WDkbXH7zodoWps0+FWpNH1OH/fS9Y569f0nKX1wNqSEKu8Wu1tDfTeev1SR+?=
 =?us-ascii?Q?NSJk2ljTEI3S0FyEZV/WeW9ndEsJCcaEuT+OBqZ+NXcmJ9G3s73bXEoggUMR?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca8b7238-f2c8-47b6-dae3-08dc4db7b5b3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 17:11:00.4349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j10tequtYr0nLhbtBp9zXRGf49g0MypQGNauwAJe8DDs1juXm4QUim3yyM9HxGSratvcKff3QKWmpUekEaIrDKRABhijubwB8R04NPOYJvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6034
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

Please pull the drm-xe-fixes for this week targeting v6.9-rc2. 

drm-xe-fixes-2024-03-26:
- Fix build on mips
- Fix wrong bound checks
- Fix use of msec rather than jiffies
- Remove dead code
The following changes since commit 4cece764965020c22cff7665b18a012006359095:

   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-03-26

for you to fetch changes up to 0d8cf0c924732a045273c6aca6900a340ac88529:

   drm/xe: Fix END redefinition (2024-03-25 13:47:48 -0500)

----------------------------------------------------------------
- Fix build on mips
- Fix wrong bound checks
- Fix use of msec rather than jiffies
- Remove dead code

----------------------------------------------------------------
Lucas De Marchi (1):
       drm/xe: Fix END redefinition

Matthew Auld (5):
       drm/xe/guc_submit: use jiffies for job timeout
       drm/xe/queue: fix engine_class bounds check
       drm/xe/device: fix XE_MAX_GT_PER_TILE check
       drm/xe/device: fix XE_MAX_TILES_PER_DEVICE check
       drm/xe/query: fix gt_id bounds check

Nirmoy Das (1):
       drm/xe: Remove unused xe_bo->props struct

  drivers/gpu/drm/xe/xe_bo.c         | 59 ++++++--------------------------------
  drivers/gpu/drm/xe/xe_bo_types.h   | 19 ------------
  drivers/gpu/drm/xe/xe_device.h     |  4 +--
  drivers/gpu/drm/xe/xe_exec_queue.c |  2 +-
  drivers/gpu/drm/xe/xe_guc_submit.c |  2 +-
  drivers/gpu/drm/xe/xe_lrc.c        | 20 ++++++-------
  drivers/gpu/drm/xe/xe_query.c      |  2 +-
  7 files changed, 23 insertions(+), 85 deletions(-)
