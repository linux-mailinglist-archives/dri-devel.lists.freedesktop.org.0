Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D449898D6F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 19:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5F011327E;
	Thu,  4 Apr 2024 17:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j9QyvMtO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359F910E294;
 Thu,  4 Apr 2024 17:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712252752; x=1743788752;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=xK8yInnuBTfGTOyyUAGMFdUftPKIGKj2nABN8+ceQQo=;
 b=j9QyvMtOpncyZkEPAcVj72j3I4rmEa+VRPHPI9ZzOV5KwgJZaL2BGESY
 VRWC3Fmu4AY95Sa7XfYS2BBnfNVfLAas6ZOPCWNOpo1jC7QXIL8OTmxXg
 BuaXVtxCyM0RrOBiwCBqu98eSZEndlV/Mt8RBe3nDZ5X2F+a68JyTfODI
 AyoMtzWqEu7NyF4maiNyfFw6wcOjA/NUbFyx/p1ANiEqWRIVB1cPZS8tM
 sgA27CFLfR+hvthNaxWDAWiOVoE+JGfKJqF6KoZ7ZM4FKlOQJgkUfWX9L
 xV5wo9/tZmyB7WZ9OkWpCltvKH+O7lhUni5JjJGUmLRRqCCOYrjF72kOk Q==;
X-CSE-ConnectionGUID: SLVgH7OJTDiWV3FK1tssyQ==
X-CSE-MsgGUID: 8fV8VhTmRW2VZZJU9GlJmQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="30024541"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="30024541"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 10:45:51 -0700
X-CSE-ConnectionGUID: BFEpgWW8RGSsTxZiyoaQSg==
X-CSE-MsgGUID: 4uJGXxnJRVy8jy38+FU5Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="18771905"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 10:45:52 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 10:45:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 10:45:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 10:45:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6FPjK1PdBUafCDUoWBN3jtu7Vya8No3nDnuMsvFFutME+0G0kvdxWG/VxcqYMt3II5SDgeglUtqePbApOQdcqYyn7xaUzxSE/amtjbDmLDAYV6SfpitxllENrF3iE9S+vDp9u1V6HvqDDLYJcNV/Syn2V6RkfHWJzBUtHvIcAZ9LN9e9xTAWIE7un78GFjkf1+bgktUbpqhOw/MwzhJr0LbwH7mzrFLv2eZHyjAFJ/ymjiea0BT8b25Y88uhpWvA8NdGWK/G79L06Y/w5dqQdEUzI2+WuQoR9k9WoM2kztZuwONLqOMxmXASHfPWzLM1UjCWD0FZhJl/OxJ5FTN7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uw5c1OTLIZvGXg62/zAM0bS01Od84kpHSqGt4iBAU7Y=;
 b=jf83W3MLY1j5KGENfDEYiI9Uu8AVS2wwJ7z6/fQrUE9hmkuj/+xCFYWI7FK371rrPWE7crClqMTwAmwi3AOgUOj8Pv5GolyRs8wDMR/RZJxJHxpWjToRKMG3M9N2xw8L3RqK+33d9POJr88/9l7Qr0IgTsL2au6j303wT3vMtxk15TCWuUmGsFCK39AjYwLYMu6kfesxF1QO5cESWgsAKBHoEEBNYW3Q5SjEpbIH/50+BAe2oTIyA+T/OatlhHzPyNBSPk7oMofhslc9I0HY2yl3aI/VbeJSNPUHynuqviyk2fQXT4oyI/xdOM6d84YRt6mb8tD+6QJCcXWUGuKEHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5006.namprd11.prod.outlook.com (2603:10b6:a03:2db::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Thu, 4 Apr
 2024 17:45:48 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 17:45:48 +0000
Date: Thu, 4 Apr 2024 13:45:44 -0400
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
Message-ID: <Zg7nSK5oTmWfKPPI@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0453.namprd03.prod.outlook.com
 (2603:10b6:408:139::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5006:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5MpBmG4jfTqYQABEFF4RnXjhXMvrBBlLN4FxD1WFS2+9kVpdEEoegDb8lOPu7/bpNWtlY2ZA9Hg5UQTML/7bGpGW7rq35JIbVCIqXk+1OyZNuUltp256bvo67/SNdeF1DvVcoxlf7imCToov4L80nbyTG7gKPEcNX7pcWMj1jYikh6GHfmwe6366ZWtX5W89xG9AvY5cxFt3QzyUG0zT1HxlZFCVxyLvB1L2RlGoPyIeDt3jOHO5LJ2IL9psoL7DLkbrEeShEHr3jwiaarBQ2IvSi/hcXoW0b22+5YE5foL6r/DBpoyavkzml7eNxoeGgjrnfYmL+9fNNh1ziQT+tKJLv5Mt7l3Mp9Ouv7CPIz/YGeGCy0R/8LVGvMOxG5tTfO8PMNmQRKQTYl68HZ/7vzS1jTIkV/t5OmbVPtDX0rLx7ykBexYN5yC/SkJq3oeFz0hVm2684fsfmB1qbx02l/n+nnc6xgxqK0JoBZGHSNg79WwC48QEiUj8i9e0+544zR7D6ubSpu7uz+nmCCucHUG8mwMcpj3GJl4KKxK9uNIJjIfgpN/rI171NA9Da2ax/k9xmFTt9kQs9GUoHUUvWGKHqWApL8A5Lov50whLDxw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?P9r8na2dkOVByL0iUy0qWrh0zvsj/93zgSXYG7mnhLnr7Hs1xBC5KEQId5?=
 =?iso-8859-1?Q?H9kwzWFZFi9jS0ivOK46mHKSc8I31SMJdVfAQfx441RQhCU51qYMxy+MYw?=
 =?iso-8859-1?Q?kYBtTwmMD2LhvGeV4j53iwLnz/izSqSb05+sO357AXfRJekgoU588YHogE?=
 =?iso-8859-1?Q?FLNQFVXH+9ZSGIQnH6o1SZYxOpJe3Tzer/3ha9u66TDvkSrNsKyEwrN/OS?=
 =?iso-8859-1?Q?rZhIXbnHMbk/9nLfwKD1jIuKqXwvIInCp28aUoCRnFcgrvxIkc2iGlGCIu?=
 =?iso-8859-1?Q?/3qhgav3jnJk0I6XW3rMa8s7hrBWvVuvEE/BF+6gy417HARn+Y/ljvQJaj?=
 =?iso-8859-1?Q?qTK1h6djImQT7b9/KqhUO+rh7OOj8wmx2C+tfIQz7bg8kAFOd4AzpVtp3X?=
 =?iso-8859-1?Q?CCLeuNXFWpItUKm7G3PI8BESq2YClUwyh6P0Vx01A7Oym0rBTWI9cN4mZn?=
 =?iso-8859-1?Q?2MekP+ZOfh2PlmsmGTD6DiyC4FO8JZBC5tuTMkASKZijZdK7j+5PDb7GIT?=
 =?iso-8859-1?Q?wT3PYusqVZ3rkidZSKTnvWRZinIiRYSqr2jUSbGIry2c8NVTUh9JleK6lQ?=
 =?iso-8859-1?Q?4aZWqdg7gHsHW3Gu8gIy93PIq9/bBKFBSDsBCRjEjpaD3sNJq1M2Y0M2o1?=
 =?iso-8859-1?Q?ZXMPJdiXpw/yPmoXFNqI1ubz8TQ5f0WZXGBMxHgCyNOPRbkXNTmSD7Ifpv?=
 =?iso-8859-1?Q?C8UNGTqOUsDbRIxgbj0pSEs2kHpdHaU4tLDCn/zPRGzYZD34BT1hQF1cQU?=
 =?iso-8859-1?Q?csVwJW0LLNIznckV3bMT1vwztCqjyDTsw0H/ZrbuhibZuWiIFfVYgKtel+?=
 =?iso-8859-1?Q?vpaMowcAshdN3v46h2aoOe6sG9q5kYrPUsW8UKphxciA2Ai+RbtMoJCDwm?=
 =?iso-8859-1?Q?Xi5KpowvErB02+CzEBBSgvA0eJWiob30nzParYXtniR0bH4jT9mH511Vea?=
 =?iso-8859-1?Q?HbwrGFOQwciqURkRt41bd6g8e25BK+NuHEM3Gtideo8ZEe7BVTTMAdj33l?=
 =?iso-8859-1?Q?b4cnjkgu2T2y2Rc2aJlDRwobip4SNBsVBNv0ez7xxKGA/gXyJmWWoU/lkP?=
 =?iso-8859-1?Q?rLYjesVCqy9VhuiLZR3eDDcw4OtgphW3FCTz2MwSNVC+kiNW62DAWg9YOx?=
 =?iso-8859-1?Q?b4fI5uGrSuXb5f9KQJC77HBtHRupXi6uRdNDPXEkBpv9E0VpcvXq/x7feG?=
 =?iso-8859-1?Q?cW2HNz5y36l5QvyTEliU7jKKbWvjXfU38jEyN24ab/NuQtfrBsHK2UGhYB?=
 =?iso-8859-1?Q?J9pYRhYd/GID99SI+DIeP4Uz1JHu7W5wDcezpoaV2WpjUdmsbe0pwwlGOR?=
 =?iso-8859-1?Q?oLxrmGE7gTso0P9ReIDN2+Uc32Rj8yE7W1eZaxFZeB0kDMJj6z7KOmZsVf?=
 =?iso-8859-1?Q?GJC+dP3X3vYwMOjeA/HEzDwaLCSPBecKj/xK2brUemWtpgm2wLIxLAtpko?=
 =?iso-8859-1?Q?6Q0G88N83A7ByeBQTsuXAj/VWmNU+qXW4TKaaE7XraB9nu1V7J7hL3CImD?=
 =?iso-8859-1?Q?3rRwI1Cm06nmnZHCsoOinIRQpeilrGt076AgesEFhpnGKL7X3aZZ0bJ+Sp?=
 =?iso-8859-1?Q?yLj8ogkx6NGICUT98EFMV/iExcy23R5I/W2IMUWlyEmFcxqcWtVxRw7r0k?=
 =?iso-8859-1?Q?wa0qEjYppm/vSsezdtAXHkUreBo4COXOMy9sUBMMxfIoyvKBNDzRCd7Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6321f3e3-cb5a-430f-9455-08dc54cf0fc6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 17:45:48.1357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++PE9uoOLt2GiXGP+iwLkMKn0wFpu28gQhNhQ4eqJqKlkpxUQDM6sXcIKtbIh8IgZdmw0Xm0Fy78PjtohQt/AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5006
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

Here goes drm-intel-fixes-2024-04-04:

Display fixes:
- A few DisplayPort related fixes (Imre, Arun, Ankit, Ville)
- eDP PSR fixes (Jouni)

Core/GT fixes:
- Remove some VM space restrictions on older platforms (Andi)
- Disable automatic load CCS load balancing (Andi)

Thanks,
Rodrigo.

The following changes since commit 39cd87c4eb2b893354f3b850f916353f2658ae6f:

  Linux 6.9-rc2 (2024-03-31 14:32:39 -0700)

are available in the Git repository at:

  https://anongit.freedesktop.org/git/drm/drm-intel tags/drm-intel-fixes-2024-04-04

for you to fetch changes up to 99f855082f228cdcecd6ab768d3b8b505e0eb028:

  drm/i915/mst: Reject FEC+MST on ICL (2024-04-03 14:26:11 -0400)

----------------------------------------------------------------
Display fixes:
- A few DisplayPort related fixes (Imre, Arun, Ankit, Ville)
- eDP PSR fixes (Jouni)

Core/GT fixes:
- Remove some VM space restrictions on older platforms (Andi)
- Disable automatic load CCS load balancing (Andi)

----------------------------------------------------------------
Andi Shyti (4):
      drm/i915/gt: Limit the reserved VM space to only the platforms that need it
      drm/i915/gt: Disable HW load balancing for CCS
      drm/i915/gt: Do not generate the command streamer for all the CCS
      drm/i915/gt: Enable only one CCS for compute workload

Ankit Nautiyal (1):
      drm/i915/dp: Fix the computation for compressed_bpp for DISPLAY < 13

Arun R Murthy (1):
      drm/i915/dp: Remove support for UHBR13.5

Imre Deak (1):
      drm/i915/dp: Fix DSC state HW readout for SST connectors

Jouni Högander (3):
      drm/i915/psr: Calculate PIPE_SRCSZ_ERLY_TPT value
      drm/i915/psr: Move writing early transport pipe src
      drm/i915/psr: Fix intel_psr2_sel_fetch_et_alignment usage

Ville Syrjälä (2):
      drm/i915/mst: Limit MST+DSC to TGL+
      drm/i915/mst: Reject FEC+MST on ICL

 drivers/gpu/drm/i915/Makefile                      |  1 +
 drivers/gpu/drm/i915/display/intel_display.c       |  9 ---
 .../gpu/drm/i915/display/intel_display_device.h    |  1 +
 drivers/gpu/drm/i915/display/intel_display_types.h |  2 +
 drivers/gpu/drm/i915/display/intel_dp.c            | 11 +--
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  2 +-
 drivers/gpu/drm/i915/display/intel_psr.c           | 78 ++++++++++++++++------
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |  3 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          | 17 +++++
 drivers/gpu/drm/i915/gt/intel_gt.c                 |  6 ++
 drivers/gpu/drm/i915/gt/intel_gt.h                 |  9 +--
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c        | 39 +++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h        | 13 ++++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |  6 ++
 drivers/gpu/drm/i915/gt/intel_workarounds.c        | 30 ++++++++-
 15 files changed, 185 insertions(+), 42 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
