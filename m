Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6501B97E5D2
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 08:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5682010E146;
	Mon, 23 Sep 2024 06:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W+lXOYhr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84FA10E146
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 06:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727071348; x=1758607348;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=QQNeKtw8j7VKKQdwwO22w7gSyTE4pBr5fTko1Xx5byc=;
 b=W+lXOYhr0uIQl+Ep7Z8CynwzvhD1gSlZHTpmTAj8YPvcca03e6KLI8jP
 0wwGLjwdcYrsjMWGW2/7rGfed3rHJiq3BKRN60mRvGdf4b/Qfiwof3ZhT
 0DtmjkOYXKywHIvgxZ3JjBjbOcXV0lytr0MLlTTyLEGEy/nu1/oArzRoL
 XaUl50tLczXvcVN/LHrmT1LG1BoTZkW8JQpAxAa2JsJ4nuMdlml86tqRN
 9QXd42kzupcHiuR1MFJBMxc1RMIvWPdYn72cQYJTn3yEtVVDBYXfsDypp
 Vz5f120otaUqiQ7djBg2pEYQ3eiMawAMh92t1wkgVNmdflxIedeUtbDrW g==;
X-CSE-ConnectionGUID: LfVSvVRVQxGkwcYlL9ccbQ==
X-CSE-MsgGUID: iKYLtjUtSkqlFi4yH5PLtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="37374142"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="37374142"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2024 23:02:27 -0700
X-CSE-ConnectionGUID: /Eo2gIUyTZuDa3Ww5Z+udg==
X-CSE-MsgGUID: 6A+y+P9lQOKjlD5WW4CntA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="75905946"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Sep 2024 23:02:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 22 Sep 2024 23:02:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 22 Sep 2024 23:02:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 22 Sep 2024 23:02:26 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 22 Sep 2024 23:02:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iBHgbLuxpj2TdX3+Phj7W5proBGYjAMLx24+N9fgMGxOXs8NNEZVzTSBz+fjnjubtUiZeTF0ibM/Z/7WumR9EeNZJlX7EdJKxYhNI3xhiktd/OtbazLtf+6sBtu+iEupqDAjlW+wX6Upb7WWEU8xPPkc+mb/0D/rkBG+W0O2YHJi/p6jAx60nblf5dmEvBjcl9VeE5fWiqs/qcV/9gxIHQEEpufGF38pCmu5Fpk9OZRd9eLEeJCevHEPUAdCsrfjQalxB2K8e1qKJMNlrxHyh+xn+m0hD6sIg6SCQjzipbkDNqt9q+/vpV4tgA40ZqHKzoQQIFY4+RIEsSFeAVZQoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uwA1xz5prZY7NNc05syM3HQutcl+Wul45M5GZB0k0I=;
 b=ft7Ng99AXG223moHMFdxRhomVm9BvGsExVsM+5adHv+2HnMStEDteJ1lNit+307mw4bjSVOozw7J+3j06UPE5p14x1iqpmpaRaxS/io+RsiV51oAfkvyt0UNTcM1KHsxnUN2/b3zwQ4N0QWVPzJ0quoZ+nb45Hiykf6D9ozMwYoJv/Cgzm2ABBkTez6V/YMhUq9IhxhDSzSaTAInTCm8ZLaNqpdMzoWjkCN/NfQVd1iTnUAvL9hX7Cfz5J3O3paJYCAZ86KI4cblsjWS6CH+5qBDa8IfCAdEGim2uFuKxemx97Yl+20ISGanasoVMTzKzs5C5UTYGBkqjoMNN+N8OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SN7PR11MB8043.namprd11.prod.outlook.com (2603:10b6:806:2ee::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 06:02:24 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 06:02:24 +0000
Date: Mon, 23 Sep 2024 14:02:15 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>, 
 Jocelyn Falempe <jfalempe@redhat.com>, <dri-devel@lists.freedesktop.org>, 
 <oliver.sang@intel.com>
Subject: [linus:master] [drm/ast]  2a2391f857:
 WARNING:at_drivers/gpu/drm/ast/ast_mode.c:#ast_primary_plane_helper_atomic_check[ast]
Message-ID: <202409231329.c40e1dd8-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::15) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SN7PR11MB8043:EE_
X-MS-Office365-Filtering-Correlation-Id: 71e75f87-eb24-4305-974a-08dcdb954b3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AEeU/OwraUGi2vaZv1fNZZD2gwbAfDJn/hAiJiATspjjBVLq8JwcGr3/sqO7?=
 =?us-ascii?Q?lORQFe7I1iLLuHXwLaP7O27p/lyHeg5MBQkdDnjRyDKhFXJT9/B5w/CGpPNa?=
 =?us-ascii?Q?vlAzUgGJL+cZqUbNfWddjgb2IhlM3o6yTDRNngi2MsB4b3PpjOGoeSDxz8oT?=
 =?us-ascii?Q?h3JSR85QNzsNbbci1kV4eMoQL64ZvdYHj9ArvKLXJCDqQrqvtD9YoO+6iA1t?=
 =?us-ascii?Q?FBjnMcvX1RfKupSPJqFwXDrYGy12Amy8X871N0e3WkhKT5s9BE3SgvgkwT8G?=
 =?us-ascii?Q?yEDyzvPfhAEBklNuYio6h7tyd/hWfiJmb/cJCvP37oXKfX6nOEKAxxSYi/fv?=
 =?us-ascii?Q?aRQqVUxT8yTYk8oNHCfkxLxQ0nlrw0r9tj5gT4t8ZcVvpC2hV8dGP/neB87Z?=
 =?us-ascii?Q?IH7lq3JwKpOyoC0LZl1tIJKUTg0sUxITsfRUipdd5eTDnSkM+RIwP1UvvaPj?=
 =?us-ascii?Q?ydaI5MAWW+le85uX/fVv8G8Cx2VmXSHK5U0LGSxyCZ3dzE/CIx9Lc0cMt/p+?=
 =?us-ascii?Q?TUooAeXsjUwLl/tRknkJCCoykqKn7xfWRm73GacNTuvnGMCbWTOOMRisN3JV?=
 =?us-ascii?Q?HPXtwuSHYtEsFCKnsSj/mu7AnEjefptM1NI3WXfmGEZ9Cd9BYi69+DJBkz65?=
 =?us-ascii?Q?U0lLeW8/Frm/Yzc+zprri2bxBrmgpN0xj2HNoYlFLBnb8xYAqWSMxyfggAx6?=
 =?us-ascii?Q?Zbnq64f/OulzRlkRC+IMsH3xsXJ4b3YgWGnty+gABtTti6irk5ARVF07t4tG?=
 =?us-ascii?Q?GC8xxYlksCNjzps1oaHJFKp7ZZitPj0DQZ4YnvvzuOYSCdG/R5caVArVr4TJ?=
 =?us-ascii?Q?+c+XtJFqgJrhDgIRk8Tu6TMDXbMZEyX1QixxeU4qwLZlwGLsJYvwIMeL8P1k?=
 =?us-ascii?Q?KznbVkReWNf7j1/xljvFAK+QuH8cuhAfC11qdnxN0NbFpLedsgAoot0h2AZP?=
 =?us-ascii?Q?NiLaUlSb2zZYbJ50sC3Qfu2j3U1Q9iBfjX2Pll2/bilJxFs8Ky9JX5ibVJD2?=
 =?us-ascii?Q?qctJUvHyoJHc1AHv632YoOb1hznAjfKC3W62jrzDYBlxXwRqmbLlvL2egf4e?=
 =?us-ascii?Q?ACZdQwVLGED+7jCyv64tk0eLLVCKpvyRQoJdD4Z3XlFdwfF4MW4HdmaE954B?=
 =?us-ascii?Q?CRVJDkhgzVVM9VCBwxl07uFh69W8vlbAbkIMHZfUwzIVrwL4jfyMjm5+iWMH?=
 =?us-ascii?Q?JJhKC4Z9OXf7Seff62U8JT5RSN2w270KRoFgq9xwxqp2MOKjfdeppd/t9VGF?=
 =?us-ascii?Q?/OgOQlAWOFPEN2jqGZoBvk6TEWACo3tqS7hSmxwFXiGbqM7oui+5NRhtEfTt?=
 =?us-ascii?Q?Om1OGfurF7ZQalv9EU4Lub5F+V4WojsTabb7Q1IBbn/t6nIVKDRsNYQzU8VV?=
 =?us-ascii?Q?4gUjUAI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yvnmBH8E4hNyhKvRgcRiE4FEwfDpEMdd1hteJm/xZGXWT3OWHnFTF13sKa5M?=
 =?us-ascii?Q?fKQjEEazHzJyGCAwD1DDjBRwpW0GG5yoI/81TS5D3yz5+vMuXo6diy0oENwW?=
 =?us-ascii?Q?45j0AhTDIQJHB9mhM41vIPU9q0EcZxUaoAbshH0BMM5by6U0LJURRvHQ6bI/?=
 =?us-ascii?Q?kfRET3SSqU2mSFMuT8+zfWnTMFbgmRaT3D1MFI3t9p7HtoY7m8hWRkX3lkn5?=
 =?us-ascii?Q?wo7uCLnIExSFs9cvubWccWJtu2b8+yzVmEUZJUOnwalR1z0iSnmdNRjNJtol?=
 =?us-ascii?Q?O28WsuZFj0IgFywqxvsDoQQBzkCKE2urZPl21EowGyuZg+bWis77gAFCmzC9?=
 =?us-ascii?Q?lyhocWu9OCOSFuDR7y2NqFe3Hok17M5krNVtyvG56nUJR1p3UIvHxOaxA3q4?=
 =?us-ascii?Q?rPy6vL/DiZR/YOnWcGrvuuukc/w1miH+E2RA3V6VnSv3dAtdz4ugmRwn/ORX?=
 =?us-ascii?Q?KiWmWVFE9TK9hUR0zgBR3h/z5mLWTqYnsP65DxINpJ3uer/R0hCnAvc54FkN?=
 =?us-ascii?Q?tK6hXyHnvtwIWHoABbRUdQrN1kIEUHYYzqvl1a/wy5YvwioxwSdlPn6dkQdo?=
 =?us-ascii?Q?o2KHgfayEz+f4GLJo5K8lr+eBNO2XNB9HKfgIDsTcvX3ce0lh5K7jS9ebRxs?=
 =?us-ascii?Q?tRoOngYPO1uF8ogO8EZXTLmnhjodGJev/2zBpkZq5S4l8dqbHTg5I0XE/09E?=
 =?us-ascii?Q?sFsElUFxLThBUQ0iauV0Cykd2kxsTD4Gwm04Kgn/sWxJtjGEHa5YcBSChisd?=
 =?us-ascii?Q?nCCRxvZ7BQDymJIBEQFYvEyliQPEvC8FqbF3cR//teS3ehokjmBMO2GKuR6+?=
 =?us-ascii?Q?zrXyDZfqGghnYhM/vvW4sQsWHynuOsd9pIVEfedwNOmFsOopMsptd+oDLZoI?=
 =?us-ascii?Q?TkycNViLLhWfMWP7xjb+5ZiYt8ZREz8Yj6/YTK7k2U0tlj0zIwigJWikCKWW?=
 =?us-ascii?Q?SkxnJiNsatFxxJa4pQ9ncov7Pwl1RLCODiexdhMIykYaFoUdb0Sg0RK+mwId?=
 =?us-ascii?Q?1cIb0O/FLKZah1Z/PvblQH3aKMdfZQ2mCbSLHf1QV2aJZV28avVkXr1Zt4sr?=
 =?us-ascii?Q?EYM938/aeR3u3XkMm3TkRsbWsWHY3IQfgXhM7KaOUo1jCJHZh0553q1qHAdR?=
 =?us-ascii?Q?uwFSn/6nn/CbV8mh5atscJ6pVG0ijJgt2URYOsGhmRjSykNKQkkClcBtcUF3?=
 =?us-ascii?Q?ymvny8WdMHLYO96mLFlqickqhNGo4/9T4oDqsjHNec01X9u5No7TurpP2dBy?=
 =?us-ascii?Q?KUNwMx5a3/PX3IQbeJG2qJ3qmFKm2hLYgwSA/0z6CMDplAEInM0idO2mqGju?=
 =?us-ascii?Q?QEvVQcf/1F/ApGr/I9VYl4vzfB/rcpwCz9Qt9TPARaUHk5UanhBuk/cEJDG+?=
 =?us-ascii?Q?7xXHsc7GxewtzyNCzIDSibMJ/gfbRuW3CrXgwypsjEWWd40Svntn37wGYpRT?=
 =?us-ascii?Q?qoFN5TcEOxWzKLouY3INf7J53hXmPNr4+MowgAazOhazyjajgedrBlbvIrn8?=
 =?us-ascii?Q?P9LWMKvXlqHX7g2pCmWv2NHzoOm9jLh01lai0RRY/sYVAwMU3O+mFNsr8IIb?=
 =?us-ascii?Q?1HHhjMj/EPHuBbFkjrpysbMEYKFW+w+SAAmo2j2KQV0JilvrsiPX3jb39lFJ?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e75f87-eb24-4305-974a-08dcdb954b3c
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 06:02:24.0148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYjunJgywDP+IJtowIdSFxNrGSkjNyLl1r15lz3AlvwJFEkxQs1xjEOtOXlFL8BaU1WhuuvFH4f+wzgImN2zwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8043
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



Hello,

kernel test robot noticed "WARNING:at_drivers/gpu/drm/ast/ast_mode.c:#ast_primary_plane_helper_atomic_check[ast]" on:

commit: 2a2391f857cdc5cf16f8df030944cef8d3d2bc30 ("drm/ast: vga: Transparently handle BMC support")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      88264981f2082248e892a706b2c5004650faac54]
[test failed on linux-next/master 62f92d634458a1e308bb699986b9147a6d670457]

in testcase: igt
version: igt-x86_64-73e21b2bb-1_20240623
with following parameters:

	group: group-23



compiler: gcc-12
test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202409231329.c40e1dd8-oliver.sang@intel.com



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240923/202409231329.c40e1dd8-oliver.sang@intel.com


[  250.121296][ T3960] ------------[ cut here ]------------
[  250.121299][ T3960] ast 0000:02:00.0: [drm] drm_WARN_ON(new_plane_state->crtc)
[  250.121343][ T3960] WARNING: CPU: 72 PID: 3960 at drivers/gpu/drm/ast/ast_mode.c:618 ast_primary_plane_helper_atomic_check+0x2e0/0x410 [ast]
[  250.121353][ T3960] Modules linked in: kmem device_dax nd_pmem dax_pmem nd_btt i915 drm_buddy intel_gtt drm_display_helper ttm video intel_rapl_msr intel_rapl_common intel_uncore_frequency intel_uncore_frequency_common x86_pkg_temp_thermal intel_powerclamp btrfs coretemp blake2b_generic xor zstd_compress raid6_pq libcrc32c sd_mod kvm_intel sg kvm crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel sha512_ssse3 rapl ast ahci ipmi_ssif drm_shmem_helper libahci mei_me acpi_power_meter intel_cstate intel_th_gth i2c_i801 intel_th_pci ioatdma intel_uncore dax_hmem libata drm_kms_helper mei intel_pch_thermal i2c_smbus intel_vsec intel_th dca wmi ipmi_si acpi_ipmi nfit ipmi_devintf libnvdimm ipmi_msghandler acpi_pad joydev binfmt_misc drm fuse loop dm_mod ip_tables
[  250.121407][ T3960] CPU: 72 UID: 0 PID: 3960 Comm: kms_cursor_lega Not tainted 6.11.0-rc2-00356-g2a2391f857cd #1
[  250.121411][ T3960] RIP: 0010:ast_primary_plane_helper_atomic_check+0x2e0/0x410 [ast]
[  250.121417][ T3960] Code: 48 8b 6b 50 48 85 ed 74 59 48 89 df e8 29 d9 8d c1 48 c7 c1 20 23 12 c1 48 89 ea 48 c7 c7 80 23 12 c1 48 89 c6 e8 a0 47 0d c0 <0f> 0b b8 ea ff ff ff e9 55 ff ff ff 48 89 34 24 e8 1b 39 98 c0 48
[  250.121420][ T3960] RSP: 0018:ffa0000026b1f8f8 EFLAGS: 00010282
[  250.121423][ T3960] RAX: 0000000000000000 RBX: ff1100017299a0c8 RCX: 0000000000000027
[  250.121425][ T3960] RDX: 0000000000000027 RSI: 0000000000000004 RDI: ff11000c3f430b08
[  250.121427][ T3960] RBP: ff11000113c335a0 R08: 0000000000000001 R09: ffe21c0187e86161
[  250.121428][ T3960] R10: ff11000c3f430b0b R11: 0000000000000014 R12: ff1100018f9db000
[  250.121430][ T3960] R13: ff11000215a30000 R14: ff1100018f9d8808 R15: ff11000215a30688
[  250.121432][ T3960] FS:  00007f5cb09fe8c0(0000) GS:ff11000c3f400000(0000) knlGS:0000000000000000
[  250.121434][ T3960] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  250.121435][ T3960] CR2: 00007f5cb0942000 CR3: 00000001451d6004 CR4: 0000000000771ef0
[  250.121437][ T3960] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  250.121438][ T3960] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  250.121439][ T3960] PKRU: 55555554
[  250.121441][ T3960] Call Trace:
[  250.121442][ T3960]  <TASK>
[  250.121444][ T3960]  ? __warn+0xcc/0x260
[  250.121450][ T3960]  ? ast_primary_plane_helper_atomic_check+0x2e0/0x410 [ast]
[  250.121455][ T3960]  ? report_bug+0x261/0x2c0
[  250.121461][ T3960]  ? handle_bug+0x3c/0x70
[  250.121465][ T3960]  ? exc_invalid_op+0x17/0x40
[  250.121468][ T3960]  ? asm_exc_invalid_op+0x1a/0x20
[  250.121473][ T3960]  ? ast_primary_plane_helper_atomic_check+0x2e0/0x410 [ast]
[  250.121478][ T3960]  ? ast_primary_plane_helper_atomic_check+0x2e0/0x410 [ast]
[  250.121483][ T3960]  drm_atomic_helper_check_planes+0x30a/0x8f0 [drm_kms_helper]
[  250.121503][ T3960]  drm_atomic_helper_check+0x7a/0x120 [drm_kms_helper]
[  250.121517][ T3960]  ? __pfx_drm_atomic_helper_check+0x10/0x10 [drm_kms_helper]
[  250.121530][ T3960]  drm_atomic_check_only+0x5ac/0x11a0 [drm]
[  250.121580][ T3960]  ? __pfx___drm_dev_dbg+0x10/0x10 [drm]
[  250.121621][ T3960]  drm_atomic_commit+0x114/0x2b0 [drm]
[  250.121654][ T3960]  ? __pfx_drm_atomic_commit+0x10/0x10 [drm]
[  250.121692][ T3960]  ? __pfx___drm_printfn_info+0x10/0x10 [drm]
[  250.121732][ T3960]  drm_mode_atomic_ioctl+0x985/0xe80 [drm]
[  250.121765][ T3960]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10 [drm]
[  250.121797][ T3960]  ? __drm_mode_object_find+0xdc/0x300 [drm]
[  250.121839][ T3960]  ? __pfx___drm_mode_object_find+0x10/0x10 [drm]
[  250.121879][ T3960]  ? __pfx___might_resched+0x10/0x10
[  250.121883][ T3960]  ? __pfx_drm_mode_obj_get_properties_ioctl+0x10/0x10 [drm]
[  250.121925][ T3960]  ? drm_mode_getproperty_ioctl+0x2c2/0x680 [drm]
[  250.121965][ T3960]  ? __pfx___drm_dev_dbg+0x10/0x10 [drm]
[  250.122002][ T3960]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10 [drm]
[  250.122034][ T3960]  drm_ioctl_kernel+0x16c/0x2e0 [drm]
[  250.122079][ T3960]  ? __pfx_drm_ioctl_kernel+0x10/0x10 [drm]
[  250.122121][ T3960]  drm_ioctl+0x4cc/0xac0 [drm]
[  250.122165][ T3960]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10 [drm]
[  250.122199][ T3960]  ? do_vmi_munmap+0x17b/0x2f0
[  250.122204][ T3960]  ? __pfx_drm_ioctl+0x10/0x10 [drm]
[  250.122257][ T3960]  ? __fget_light+0x57/0x420
[  250.122262][ T3960]  __x64_sys_ioctl+0x134/0x1b0
[  250.122265][ T3960]  do_syscall_64+0x5f/0x170
[  250.122271][ T3960]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  250.122273][ T3960] RIP: 0033:0x7f5cb2d92c5b
[  250.122276][ T3960] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
[  250.122278][ T3960] RSP: 002b:00007fff688b2e80 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[  250.122280][ T3960] RAX: ffffffffffffffda RBX: 000055ecf1f74580 RCX: 00007f5cb2d92c5b
[  250.122282][ T3960] RDX: 00007fff688b2f20 RSI: 00000000c03864bc RDI: 0000000000000004
[  250.122283][ T3960] RBP: 00007fff688b2f20 R08: 0000000000000004 R09: 0000000000000004
[  250.122284][ T3960] R10: 000055ecf1eec010 R11: 0000000000000246 R12: 00000000c03864bc
[  250.122286][ T3960] R13: 0000000000000004 R14: 000055ecf1f81ea0 R15: 000055ecf1f75d10
[  250.122288][ T3960]  </TASK>
[  250.122289][ T3960] ---[ end trace 0000000000000000 ]---


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

