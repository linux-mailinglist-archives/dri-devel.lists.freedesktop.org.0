Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2278BAC1C9D
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 07:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4002710E6EE;
	Fri, 23 May 2025 05:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJHtqPam";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FCD10E1CB;
 Fri, 23 May 2025 05:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747979324; x=1779515324;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=TsIWSt30mOQv5XtYmPon7FnCmEcLy2kIRTtCccI9Kx4=;
 b=eJHtqPam/yHK2hBJ0xS6XnwqU2HbnWUDNZK8d+RngRNC5JY/zmUXul+F
 yDiODqkIoLrmtQOK/U4z1IUGtM4hgC3X2zYeBuA6V3GsQWYL+P/tzt6sW
 LumLVQnTrA/3zX/rigzYifRK+PVJjrxndu73XlhTgad3wVrUdZzRaMhgV
 EPHS9lv1z1PCJ88xW62P6229uliOYiwNuTR9Qc4k4Q0n8pdfYT+KCUdgp
 CJY8mHvlIUkh/p9QKgiP/mChHbr1fAvJlMeuNiZsgVSs3vvIvIXvL+QP7
 AfSqus/F5aiVOdohDipykzGdGUGIhWkPLhhp9jJecgvr9ZjEJcGTCHFHI A==;
X-CSE-ConnectionGUID: Z8lqrTcZSFa2qwXoq71s9Q==
X-CSE-MsgGUID: 8JYjdWZvSbi/b8U+Yw1MwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50080756"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="50080756"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 22:48:44 -0700
X-CSE-ConnectionGUID: 6Whs3nZRS5uBldVSoebjOQ==
X-CSE-MsgGUID: 6FoCxw5jQ1WklAs3iD0NNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="141485488"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 22:48:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 22:48:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 22:48:43 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 22:48:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckoe1GhlyM8iUYH3F5fljzptwDMxe1uHtfPcen8Gheg7/+Y2/sC2FIUXOVa60seZyn6e/jeEO2ZxfAVLdNCNa4iIE8fGHdhBV4NM/lRVXwa5JLlXfRdE97jSjhCo7RcHy47JVORa7wS5/F9eRXkBuT4qxhYOGyqHl8BM9KvkHQ+Uzuv6oyNC9EMeV35DoEI8iX/lkcbc8VZFasIoVWzwdaeXQtJshjV02V5XNR8NssrVHuadh18CjNWAE+OSq9ee2ds4kfbx9lrCWxljoA6fzIuvccCKufrRBL0Ocjy/msUu77JrRWCYwheZLb/awTm0xp1YVV91mRU5jpjnIj7OOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/9wACcNwCoL95OxWwZBHVkCYuxDJcvtj3S++VdqINw=;
 b=W0AlTrPojaUXceC/MNl48cCU2yCIGMUDWi3uLzzJzLdSc2aeiu6U8u1lbOfOooU5uZHh1yTiQGdd1128pw3hahCevEPB2tIEZAElD+WvSaxBKDEBZEAy6jE3b+0p62XM8+WnZ+yCQpaZCgrjZa1RzlcVi/MK2pYyLn/nZRnYy7Ml9/hpOfBZPuV7uPa9R5Xev8dJAa55E2eW47SFHH9MpbUqQ35Si+RyDNvt8A1TqGbHNnoqH8ZvSorxkniWdK+cnjNHAETwrIPjl4vUakeKeCDLB1IayqonnjSzPxP38OzGsmvlLOgVjj/X8Zs/v/NTCnd0TR0xUL2RemuH3dEt5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA0PR11MB7696.namprd11.prod.outlook.com (2603:10b6:208:403::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Fri, 23 May
 2025 05:47:53 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 05:47:53 +0000
Date: Fri, 23 May 2025 00:47:48 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <uixp5cq7emz32lmwwvq4vbujppugfozhyj3cm2aqzx4lcg7ivn@m2khvf4kvz5p>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR13CA0132.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::17) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA0PR11MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: b62917b2-d2ee-41ad-f107-08dd99bd5c06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9OW7JriXnjP5Wk1C9mpH5oUBLzNCKau4rzUAdG2n79MPhXsrYjXyFk/tgKRd?=
 =?us-ascii?Q?bfoYavNeUQt3fIQIgSX+GGyCiUG8x4ruJEyEZC0/Sb1YMuKLVyDXMlSjZH2/?=
 =?us-ascii?Q?tK+KRc8uaEbHtciXLK/6Lnh35OkirjCr8D9ZCdxwfu95jWJNYpUII7jU0RmB?=
 =?us-ascii?Q?IMIJAQIDY1VZ6xwnRQNvVpPSaIOh0dbUcA4KGS1EusWtaVUIwqZ1LSBMbtEI?=
 =?us-ascii?Q?7rywPJmTLpEi+qoU+EM7iAr5XHNDL+BtGVa0VwbtjAht1ugGGkOSEMgXdUmQ?=
 =?us-ascii?Q?GfJCQN1Pa87VI6jy/nQUd1XVPC36kWfM0PBuDvtIj4XpDQZtado2aE0Fhz+6?=
 =?us-ascii?Q?UkTOyCNBFIPT3PgnvQH4MDx/UEwkIdeyZzd4soFQZRSIyPUL7bOFozbsy7jA?=
 =?us-ascii?Q?Yz8at0uZAuKH4vApAB4wfhzbdeXlhQK30Vfzar9g/nLWis7A0aYNg/XsSAWt?=
 =?us-ascii?Q?jeFE/rwFhotNyha+4CWotLfjMv3L+Bf49eSA0xuffg4giRdfdQgRyopE4GHA?=
 =?us-ascii?Q?klHN7shiLCB1XNl8oOZ7nudpODeyJAwUmwcd5Wvi2a0eJIrck99mlvP/ENiB?=
 =?us-ascii?Q?SjvzFlMmS0ewHmGAIsPwMPm/o1YNpXF1zNs4YJ9yenSNKQqSb1CFst55BX/l?=
 =?us-ascii?Q?n0Mvlmpxr0eP+5kwSVw3KRrpYLM9QZzZFRRVbYZ+BMukYzMA5Uqyao3Yw93a?=
 =?us-ascii?Q?+oSVRJpn83kZVs0Zpr1ZwRQRMC8v6DLQE5OcVkRNbvG5FW7BivDWtOxthZ6W?=
 =?us-ascii?Q?qKfHaRElSOFnUXwJKPP7agyJiXyeENDRlX3panyHdrdVR/V48c5sn1PVQmas?=
 =?us-ascii?Q?Fs3nYRXZoANizlnLkgmBTfheOPdIYIQUN+3XzwLcViYeIHrtJKRP2RhTIw1S?=
 =?us-ascii?Q?NmxB2gYn1n8Ed4yb+KhaI+Muei56yUfzMJ0ocyBSeNVVlCfA+EzKcBkzKYrQ?=
 =?us-ascii?Q?NRYRnI97pd4KMEVBU1U0zBeRdYMyKf4eWKTEAaizWhayiCku6PFs0fbF/WPK?=
 =?us-ascii?Q?hRA4Mr/oK56ozJcw0FOcW4xyWJLJZyl7lmWz5lhrX9GfwDVFcrjJGq+HJJB+?=
 =?us-ascii?Q?W8mKF14gfvRD3aK7PyMyU+/JtsOiyZhv1MbZ660lHEGZNR7dkjy8IoMq3hXq?=
 =?us-ascii?Q?64x5C4RlWByMzVsv6oBcHCuulXkpuoHPaVSETrNtGoIZf1nbDEVOjANTWGuW?=
 =?us-ascii?Q?ZgifCxhiB5qFL5ac7O/VE5Kqk3ksTU9Tm/2JVL1CntYB92/3pIqHhyt/6Vy0?=
 =?us-ascii?Q?byNG4oD75t15kOfSR3tvoswhg90dbbDAFZOthrFOXcfZ+vfMKeIvkB0nG0RJ?=
 =?us-ascii?Q?Frl2VudVmlpOUNcsRcRGD8ztdFjzBTH+y8EW6Fuv9ZBhBBUrWVw6TS7BYpk9?=
 =?us-ascii?Q?48N3+Ek=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YiI2aLCNf7exNA802OeXStndPYl7hYODHj+136YPH/Pb1QTU/BYML5vrQzhk?=
 =?us-ascii?Q?DeLHERZ5O8n/9P3wgkGf2T3cL3a6iCUJVo5imPc3RSUyk0veOK5HpFeTR9oX?=
 =?us-ascii?Q?VZniEH00sPF3N+ZHZHnZ82vj3TJ/uRuNZ2ns4mzCebdqbRYwKGxc+RU9+P5x?=
 =?us-ascii?Q?wBqU8jfmn1q9pDPzZH2NQEhnEkKrmOoS0gMsT0kbG0ehsJSR1fATlcvBfxSU?=
 =?us-ascii?Q?Sn7UNzJ+Nf3ihqoKeNQuWIj8zfTlTgKmKxQKcDoo81pFKT0Zrtg3ZlQbldmD?=
 =?us-ascii?Q?ogvNUiYCbrptp+TGor8iMs2SAt3oVlnqa1+3uuk9b2xQg1X5G8DDgdwglF3t?=
 =?us-ascii?Q?RHSb4tU5BvDm7pvl9Kbm9S+fnDAWhqo95vZ9RQtRpxq7MJCA5iXLR5pU+uof?=
 =?us-ascii?Q?LQ8gD/JvjkNbuoTr7ZF4/JbB1deiOHriubjGPkdI7Wd6G/BqD//uNQPFvzwe?=
 =?us-ascii?Q?VV/0h0owcc7+NCYAe1uBfNU/wpMeET+ftaToI6ESVYyj/glMiwvPEA0pPYHi?=
 =?us-ascii?Q?nzCdGjORoj+ynoy/klCJGt3eo75EYMiiLIN+wY9ANvtTpnofHL18vUgtrurZ?=
 =?us-ascii?Q?6+HKADAcFkyoVluNSzNIUS+61v2UvtswgqPJ/wOZljH7cJEdOtvrBaxuX7yn?=
 =?us-ascii?Q?PPZHdSytxBrM8ds/3cJJDGdt1Ivh6pdqa3mjXte/6AWlUtMWETh1RNlVmEf+?=
 =?us-ascii?Q?4cxWmRwMAut/QDgPXRUoH2XCAnaJIofr+fk5ckUNde43fIKTfpc1zbrhgWtV?=
 =?us-ascii?Q?J+4XuVRfLV4JNQgtHUBvmi5TJmWZ52LSzFJu3NYJquepbgfrtvt44oTlE6d1?=
 =?us-ascii?Q?S9I4KCuFb4P5bx1TGhYgK+fhSQpUg4HIPymhKscar/01cj3onuGx3ScW9ojp?=
 =?us-ascii?Q?d3W8el53VIwL/Bu1iuS8M9ph+ysRf6abEXtPNnXNOX+MaJFw6UchOvETVh4Y?=
 =?us-ascii?Q?KQd9Q7VzEwLqf4i993q/JBenV8NidhBSEM6Z/6/GCSSksFjpFPTB5/QP9vxj?=
 =?us-ascii?Q?RFLxblzMQoDI2Di41OHUepl1Xap7zYrSq5eh+VqTBdSRtLk8S8cG5eNwjTGa?=
 =?us-ascii?Q?pw1CbbHZ0TnTbi+A6XH1bmJD040YaJFVs5N0lPdPKfrkfXnD6gjqfemNvifv?=
 =?us-ascii?Q?rrjJjIRNK0/yMd3YPx9j5sVau2W0GtEQ1HvtqZ3H46lF9d6Ax1AgwEhtwvmR?=
 =?us-ascii?Q?gtgJ3pMc9lGOkx8yIofglyiHQ8op4k8gbjP/EnWtZZJQpFS7yW+keh0qx4t/?=
 =?us-ascii?Q?6wfCb++JNUzxPO7TUGyFI4aA8JAIN4SjAsX1x6+/qTLrgWrdMwivau3ObJDb?=
 =?us-ascii?Q?1zQwV3JSW91+Hk2zc9XjwUuX62uZCKAs07VDJApUe3hZVYaEIwHdMVIpH3on?=
 =?us-ascii?Q?jZB/CdvRmNpeliqu58UO7wmMyrI3DogVATY3uNJsDuCIYjJ46a72z9TEaz/X?=
 =?us-ascii?Q?r6z5IMev6LXppgNV/AL2F1jDA9MNYPC3r0lzwQyK8v5vKzHwk4tEVJIy8r+q?=
 =?us-ascii?Q?8N6mfUp8cAgv5sTWuQUwmD78BRENYhK8/FYTCuYoLOoOSDMP+R6pmIWQXG5o?=
 =?us-ascii?Q?Jz8sYol6mlBWJJDskpschHqCWAJNFAc7p6f6ccwn0Nu3KXWb51j2s7laudNS?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b62917b2-d2ee-41ad-f107-08dd99bd5c06
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 05:47:53.0272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JpGIsWcqrQQhlfVF3/p5w04oYiCctFW2yAkSV4PMk+Ff/fNX/0Y245KOvIBFbi4SSPPF7zDJZ2fSFXVArBIa+QQXAypsiPI8yzDmztnKGZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7696
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

Here's the pull request for the drm-xe fixes targeting 6.15-rc8/6.15.
This week we are back to normal, with just a few fixes.

drm-xe-fixes-2025-05-23:
Driver Changes:
- Make sure to check all forcewakes when dumping mocs
- Fix wrong use of read64 on 32b register
- Synchronize Panther Lake PCI IDs

thanks
Lucas De Marchi


The following changes since commit a5806cd506af5a7c19bcd596e4708b5c464bfd21:

   Linux 6.15-rc7 (2025-05-18 13:57:29 -0700)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-05-23

for you to fetch changes up to 027a362fb36b479030beecbaaec30711ddabf8fa:

   drm/xe/ptl: Update the PTL pci id table (2025-05-22 20:54:15 -0700)

----------------------------------------------------------------
Driver Changes:
- Make sure to check all forcewakes when dumping mocs
- Fix wrong use of read64 on 32b register
- Synchronize Panther Lake PCI IDs

----------------------------------------------------------------
Matt Atwood (1):
       drm/xe/ptl: Update the PTL pci id table

Shuicheng Lin (1):
       drm/xe: Use xe_mmio_read32() to read mtcfg register

Tejas Upadhyay (1):
       drm/xe/mocs: Check if all domains awake

  drivers/gpu/drm/xe/xe_mmio.c | 10 +++++-----
  drivers/gpu/drm/xe/xe_mocs.c | 11 ++++++-----
  include/drm/intel/pciids.h   |  4 ++++
  3 files changed, 15 insertions(+), 10 deletions(-)
