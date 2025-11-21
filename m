Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D40C778C1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 07:19:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616C610E110;
	Fri, 21 Nov 2025 06:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lnjgmgTl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC4F10E004;
 Fri, 21 Nov 2025 06:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763705970; x=1795241970;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=2UxoLasGMTUHuzjXdPqkW2MBvQpTkhtdv4DNhwE7QR0=;
 b=lnjgmgTlFBgM2AfyFSIvVBI1fo9GuOGa227VVSPDj6R7qJx2bT/6m5tF
 ik+QcaEHwtI3BW8XV2JUAAAIkQe+1MbWQHNTBm/pZCPOGJYH2OvGWeuqj
 V+7IN0q7bLQ3U6jMrSLjEosr4cjQgwESCs1LuvRAD7E7uumkW4IzAU0uT
 p1OHMsrMp62l3Vaj0s1l2uFyPLB5J7WjRchUngP6f7rHzjU+oYxRFCUnO
 /RrCAEUQZ+6V7Fhfvn0EoRJrL5x/kzloPExSAJvszyUkWeoR4r9cs7sBG
 5hFvPp3ClLE/RaezScVD8lUKm4al1cvYh58c0CaYJbR76sUduicVzxV55 Q==;
X-CSE-ConnectionGUID: fGHMG/kQSViquDeGm8w0OA==
X-CSE-MsgGUID: 6BkpDY2xQg2DyFjeBtZIuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="77154992"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="77154992"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 22:19:30 -0800
X-CSE-ConnectionGUID: EMC4xk/BQuidjSgHidKl/w==
X-CSE-MsgGUID: IrYHvhpiQmOUYp9zUQ5sVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="191295227"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 22:19:30 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 22:19:29 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 22:19:29 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 22:19:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lF5Rt9lFCVuUkiJKy5kMs0gI/jYcvYHvY4yIiXtY0lzw8FePm5FbpSAZu6OPZvcfvl93JVBBBnuiqYfNER6Rs9EF08qLGEY99KANSHrYguwKtqMgM1ZRXwvMTFFz0qKTkj8ie+i1Miy2mk6xcYgwwV2uurTotG4I5Hm6w+Ek7h1MovZtmhWHBMW5npNJ55vzMESkpUh+giEODiUiHzaZL5SRlwkwp1cpxTtCduSFOMIpw4NSBHKA8VdScB9klGf0sjM9GUN1hZPq6uKQes2mGbOqR/pu8jB8d/Xp5Mgp0NIFAhmI9emuNC018a9o7xnKp8mAeFwRDZX2j/ov9KEPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUJGN0rrl6edM15DG2Cck28py5lRX/wOvls8iRSjGDg=;
 b=OURMo+w7F6f/J7zhlSbeRD11ltmSZHI5NOgpvxcEmq2IXHKrZ4OpR5QbEipP2TgUiyg0D7WkU4EJ4Nk9H33qvgM+bNpO/8J/b885zRydQ7zZ3Vg8BM0wQSJxM+ebt6Mps9c3tUjceoX+1qDKwKLKQCm19HOq+Od78mJg4crvJMLGERlNb7tz6ozUHgwAxuABEjP3barvjW9ZZPHMH/UExuwwO6vnEzxRx59nIOliHNYzyefgilkxAGfcurhAAsQbtx7jb1s9LaLE+OAsbnyjSeVXV2/+PleosTORrP8EMMFmwyiyQIbE02rdVsYNX2pEgz1lNp4EUUKj3MVRkx348w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ5PPF1611BC49E.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::812) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 06:19:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 06:19:22 +0000
Date: Fri, 21 Nov 2025 00:19:17 -0600
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
Message-ID: <uadbrmftcud3wg32c6tje7mmfcr7wgmpnkzxwubk6fletahje2@coek2ciunkvz>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR03CA0172.namprd03.prod.outlook.com
 (2603:10b6:a03:338::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ5PPF1611BC49E:EE_
X-MS-Office365-Filtering-Correlation-Id: 640e9337-5ec1-45eb-ee94-08de28c5e945
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P9fkqOQeSmmER5Vrpt844e5JcFex8U//fnINnGJsPe157cfGUUZ1Yo9UmeKv?=
 =?us-ascii?Q?naWr1KrFmftivoEtCcOcLpnPwAz3LLEnWq1ojDTUCBGaMvFOA/YO7+n6N6Cr?=
 =?us-ascii?Q?lt5PagPndXDrpRNlXyvSDROGqN2YjTb+Fmqlwl/8IYS8y0ZOf2+XVbuOOL37?=
 =?us-ascii?Q?0/OXGgFNjUs3K3r9ZSKZuFNR8tlplXhXYfeYS2t4JglapnyyR3T7DTyl7DNh?=
 =?us-ascii?Q?qcTPuwxuIw/HQ24dcMkPtWwGlWqEJ4SwNAaVq9TTpOwu13XJMnfft+mbrZXA?=
 =?us-ascii?Q?HUiuU1JXbIeBepjHIEJ7BhNF1lIstZCT2EDqqcpvjQ8dlmAo7uXbvRBQhZfm?=
 =?us-ascii?Q?nhTAqLIoU7XX3rkO7CNgopZ6aGYSUePR4sgSQsGbMBs8DA79ai/4FGBRAAGT?=
 =?us-ascii?Q?Iq5QbgTwQdXzMxipEGI5wylng4VqC/evTd5LD94ZVSsVneMV3g4HNfnFO8nd?=
 =?us-ascii?Q?Dbp6lkkUdFgDEJrQao3AUOzPqPTUQhtc1bdCAHIqJpRSsTqBqVkj8TO77LBV?=
 =?us-ascii?Q?Xg7GjvkyTioDbPWJ9l5ShCkCz7YjBhrAfT8CA7AqEkUnyQFY5R7KquK/vofd?=
 =?us-ascii?Q?sx7JrKoWWLvE58UQeVjJsBG/YqKlBtQh3Ls+Ufj2Ylylx6AeXIjoRauwVN5b?=
 =?us-ascii?Q?LDy2YTyI7/IEywRlna8/n8bGOHPN78I4U13lCW9K23ltGsphfZYNCx/KOM1C?=
 =?us-ascii?Q?2/oFI69RPFTOghe5J/0xEy8F56rnU0CAymXt7UpwImaQSBrZnWO1piOHtIym?=
 =?us-ascii?Q?RAnH3R3MA77uvE9vYpzs7RLBTytvKk0NeyUsOR76EHWqs5txu2NQpcr6KduM?=
 =?us-ascii?Q?+34vTaDMIvnwCmSP34S5Aismcuctyi7m6X58Z7Vf+Tu/q4GjePyHHLwQd+Mj?=
 =?us-ascii?Q?LS4bBs2i1GWQOLTkEK6hwYfu+65fgE8NNI6EkhhGdcxrGfRo7h/88gVHoWsi?=
 =?us-ascii?Q?GvWDt051CJOfIr0FLgw93PG7eA01IbxIdPsY7ajk4c6t3OGKqqNKlElIpVgP?=
 =?us-ascii?Q?bcGAs0IVu3isdnVOtWlSFhUeiUhB0HJWffOEYJpLwT4lL7V9dxefGTqKvUqh?=
 =?us-ascii?Q?0fAwaURG4GlsATsiKU+KzjSjmrcmOTSL8HE/xmCwaX9ceuXRR7TBxl3VqdbC?=
 =?us-ascii?Q?cl92oyn4KCBuGxViv5PVIcFceISA65tNzMok/srAQSEhcZa95hBuiqL7Rq/3?=
 =?us-ascii?Q?B+LffB7hV8frzz6yOnmPW7fXhb6ktjgze8cgz2Rn56bji7tjGY7NUuGVy8U4?=
 =?us-ascii?Q?br5eOjASYeKW3pSPqwPX6ubiriHLAGRHCDx2g0oagjyoUvu3m7NZ2rJmcVMn?=
 =?us-ascii?Q?zXNBDNCN5NVtwCpeSpR9L56mftfANJq9vEDOGXf+GEbpJlcynl0O7dp848cW?=
 =?us-ascii?Q?OExVuU9dpVpY9Dwm8/oHrsl7MpYYcvJqnAovaHocbMHj3ccNCA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EDQV0utR78bSpwtn4B/zDggYoz28W86nm/r+NOO+8w3SFHjE51XNYaUxYtU6?=
 =?us-ascii?Q?UbbHXRN6i0cpA5h0+AIyt4ZWvCkR7IeVGvHNrOJS5mSu8R8TBC1eCCIsh/+K?=
 =?us-ascii?Q?oQZOT1qDEtwAWXqIdAYtghK6oxWY4AiAL2FMu0Z0/3muK917XpGF9p5hsmA7?=
 =?us-ascii?Q?XVYplZM+NRX7DWMnMTUG6mSOFzHEVv3JXlqfAjiub9Po9J60vFqgBedcIZ2E?=
 =?us-ascii?Q?nWzVtHX+J2qKSX5WbMkXAC3KJ6SlrzjcOkmx9rpn2YtdULTHCLzBTlFg1XUl?=
 =?us-ascii?Q?wldc/49wzPI3cgPEfGv58a6WsKgkZmYa6Ib7RUYsd1WMrES0xIJRv0dMfRQn?=
 =?us-ascii?Q?2H7Pj59YqLjk/Y/ZXUwU2jiW5JclNiK/vbMGg4/xnjkcaLSSHRSYT37s9Zc/?=
 =?us-ascii?Q?hCXriaZLht+e2ZFYJsfisDIMeDE0UVEpd1WM7+Q/YgdNn/QxfE/CLjBfA91M?=
 =?us-ascii?Q?+9WXK5LXzRgwI0ajv3eEn6TUKJOQkJZH3AKnwXUncWWz1ThwuVmwJ8AaDmic?=
 =?us-ascii?Q?OlwZYKp/qLxCilCTuDOXvAfFv518xvUONM8exQ9zUFPyHSHsTs2rVMZr4Xmj?=
 =?us-ascii?Q?pr2qQIOZwOdny9eHLFl9OTfp6JHr0HqAW2ZCHZ0Mq+n3x1H+Kg3ywULQRNYp?=
 =?us-ascii?Q?jfyghSWlm5DljWLm2vK0ae2TCI6VWwy9/yJH3W9Cn2D4qacDLPACUs5VrtzT?=
 =?us-ascii?Q?mNc78GmYp+cWga8ccIXy9YjgPoYFzn19NXsNJ3p7X7YsUgYaQJ3x6vUCf6An?=
 =?us-ascii?Q?++pxLp4mHD8bxCTXiLP5eDJgStbQM/RANfpMEZF0yg1ZreC2fouWgW8l7++u?=
 =?us-ascii?Q?nN9/rqbHZk6SDJjy8jQOBsgchy90gcb0/Q/eRZJbzD1wX91nPEkXOnd0oqL0?=
 =?us-ascii?Q?n0yPPiRwF2tDuzKgf1IVFNPi423jOA/wTz02Hl3roW/VbQvm8Bj/7kSTGNJa?=
 =?us-ascii?Q?4mg9KAI/oLulbKlCKPh0CmFMzIJPYl4mIbicTTl+maNOJN8zin3BVYxCecIy?=
 =?us-ascii?Q?oKt3s4x3OUx653pz7PjylJLkyb+57RLYPGXEGoFTaxWu6m0EeJmHKGqDd3/d?=
 =?us-ascii?Q?+mtr6R8z+U/01aijuXJ9olixyR6zCLUXhr6uYvthj06rt1yDvBFRtxFSpgpu?=
 =?us-ascii?Q?PQjL+lnQQ4XXWicdXk0/akDcG5EmUvhl3Btf/OfwmR7iovmOViW+X2Iz6QBj?=
 =?us-ascii?Q?1Nqg31QpbUiifWkera0SbIp9vQeINLHLOblxWUCzoPZ8uAOiq4cMD8eywOhq?=
 =?us-ascii?Q?NKXePxeEbRxzRjwaxT2nxA+HWqcBryf7WjzoZdlZvoHvBCXCMglVZxO0drsS?=
 =?us-ascii?Q?CTEl+/M/wcaRy95TyQ1qNXOH9RiobUaz2P3RUD2aRs14ybsZ6S7SLfOgxYKa?=
 =?us-ascii?Q?aj24XkG+0RuP33V3BPFMlw+a5RJ9CUEFn0h/lpHYNf6nzh10U2CfhPYnPwdK?=
 =?us-ascii?Q?PRAdCGcy6asZE2U8D383LUXP5nAWSNgP1axW4Um87DjprmTzZqA2voYFcF4k?=
 =?us-ascii?Q?IkRnC23aF9PctYn+4tNiA1tr7pJm53plMGyApNCE46D8Xl/vtspPrfW1OssT?=
 =?us-ascii?Q?zlKx4RWU3kY6JXnri3jcdL8c3BZ4xbLD1NN8PBB2lqLEDt/j9G1wdcLl15b5?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 640e9337-5ec1-45eb-ee94-08de28c5e945
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 06:19:22.2907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yom7X6vu3GmgayP0lsYdpuo0yNzC8UR3ghp5frwzk4NcsoYF2fGjib8XU78M7vT489JWP4wSWM8lB53Txseqhj6hjz2Yh4a6AOf4fxuxe4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1611BC49E
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

Here are the fixes towards 6.18-rc7.

drm-xe-fixes-2025-11-21:
Driver Changes:
  - Fix out-of-bounds access with BIT() (Shuicheng Lin)
  - Fix kunit test checking wrong condition (Matt Roper)
  - Drop duplicate kconfig select (Shuicheng Lin)
  - Fix guc2host irq handler with MSI-X (Venkata Ramana Nayana)

thanks
Lucas De Marchi

The following changes since commit 6a23ae0a96a600d1d12557add110e0bb6e32730c:

   Linux 6.18-rc6 (2025-11-16 14:25:38 -0800)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-11-21

for you to fetch changes up to 5b38c22687d9287d85dd3bef2fa708bf62cf3895:

   drm/xe/irq: Handle msix vector0 interrupt (2025-11-18 10:05:03 -0800)

----------------------------------------------------------------
Driver Changes:
  - Fix out-of-bounds access with BIT() (Shuicheng Lin)
  - Fix kunit test checking wrong condition (Matt Roper)
  - Drop duplicate kconfig select (Shuicheng Lin)
  - Fix guc2host irq handler with MSI-X (Venkata Ramana Nayana)

----------------------------------------------------------------
Matt Roper (1):
       drm/xe/kunit: Fix forcewake assertion in mocs test

Shuicheng Lin (2):
       drm/xe: Prevent BIT() overflow when handling invalid prefetch region
       drm/xe: Remove duplicate DRM_EXEC selection from Kconfig

Venkata Ramana Nayana (1):
       drm/xe/irq: Handle msix vector0 interrupt

  drivers/gpu/drm/xe/Kconfig         |  1 -
  drivers/gpu/drm/xe/tests/xe_mocs.c |  2 +-
  drivers/gpu/drm/xe/xe_irq.c        | 18 +-----------------
  drivers/gpu/drm/xe/xe_vm.c         |  6 ++++--
  4 files changed, 6 insertions(+), 21 deletions(-)
