Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 386C9B06BBD
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 04:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A6910E248;
	Wed, 16 Jul 2025 02:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q7YSgOLz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39BBD10E248
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 02:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752633271; x=1784169271;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=N9DXdqV994IA21UHmsELmQOkGdBuim/ymx0HC5xV4Rs=;
 b=Q7YSgOLz553c7BN270MyLQ+GA+lJkXKcotxR2IDdwkodzpymIiOIWiol
 Mu9SYGo+KpFHHG93ncSIObzUyev7GsP3WbIQ5BxbpvWiQA3MoW3jzzpY7
 4oOTNbwNn5lftCzpx82Zs0LgeI00HDRLeQLXLVIaqHCxPRz32CojR69Y3
 ZDwCn+Gf3T8zUpMkcaw+uCx6btw19IusAPhhlFmh05IcfLGlmFsq/lFVg
 f9B82q4LrjYlAAoa86NRS7IJ8BKfsAgHNnKhk7jCrXp5FJ9uJX/SNJxMQ
 LtbF/u4fbc9tsYjI/vN5InNfYJv8D6hR8sX6fO1rei1u+NFOPDo3C+DaA A==;
X-CSE-ConnectionGUID: G+48ljnyTWKvQFxttSG8vA==
X-CSE-MsgGUID: Rxf3YX/uTKaJ2XecMZZSSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="42498000"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="42498000"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 19:34:31 -0700
X-CSE-ConnectionGUID: w+VEmoqAQseAeZJ49imQfQ==
X-CSE-MsgGUID: 4dXKgKxKQKyqIG/MhGuVZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="158101440"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 19:34:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 19:34:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 19:34:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.51)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 19:34:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GiLdAC8yvaxFzY7tzdPoImqG5ZvwLPzR0lB6IIQ4e77xJ6Cs58jo3VbFCEIM2d5uAGRiJW+QPHq6Fnhs9k02/oJkFHXYauCes09WxDyR12GmnYvbo+JSgCP1WHC89A7AqN3grn/dGOmoZiaYiY8vNSBmMQzIYXUedVUB0Nk0eLlNAKBC/ZOnDGnQOvyfhDfabMBsPxJqmyVlOVgpKYlaJ7h9yeyvR4c7z49HvTpXt5R/P/lzJGFFMWxhbfmSQJp1MtN2qwd7Vi1ufa3VOyTKfVTS8NSw0skrDCqfFJHFX+aO1Lw5euF9mISvhNidA0YbB2So/UXo02uTc9ZqEo7tqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzG9WrBPEkEQa2IeBaxUK0NCYmCn5svURuIAlzd0U54=;
 b=FzRujrPQASIViGxlN9R3jIxFJwbUoKKCKpGDGoR1WpgkFnXkrjlG5y8NVTMCqym3zH0Uq1GyHkb3KeLCnnRAmmjOV3OYreBUWmxMFdTTfkt9sRS7O9cmCPWVSyBNjrxZ4XZ08dTau8q5J/tiIqMga0S0Fbtz2/TP/5vjHwg6NodbZzIW+gg0fZVrexw92Ni1D0lSf87R53o+wqXfR29t9uKCk8wxE6+0IoSfp6iLRX2GL3fzfcgcTm1hfOFuuuHiwncDW6c3ye1zRI/Lm0pRHEXYQZLNzTx1kwylYXCWr7lgVxf60zxUncVvIR+rrhF+o19UgtzpqRhKXWNWDjnq3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB7811.namprd11.prod.outlook.com (2603:10b6:208:3f9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 16 Jul
 2025 02:34:20 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8901.018; Wed, 16 Jul 2025
 02:34:20 +0000
Date: Wed, 16 Jul 2025 10:34:08 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Haoxiang Li <haoxiang_li2024@163.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
 <dri-devel@lists.freedesktop.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <sam@ravnborg.org>, <linux-kernel@vger.kernel.org>,
 Haoxiang Li <haoxiang_li2024@163.com>, <stable@vger.kernel.org>,
 <oliver.sang@intel.com>
Subject: Re: [PATCH RESEND] drm: Fix potential null pointer dereference
 issues in drm_managed.c
Message-ID: <202507160354.21a14db0-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250703092819.2535786-1-haoxiang_li2024@163.com>
X-ClientProxiedBy: SGBP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::18)
 To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: 922e65a4-a04a-4e42-6e1a-08ddc4114481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X9DksMMqzPhaHeggX3U4t35YRx5pqnqZTRu2uAiz4OH6E0mn7xp0ZJ581gPJ?=
 =?us-ascii?Q?YWFGW5hY6VcSMynMNSDrInbA3+pvt2XqGqTuCu3zbedPrOFpjZN+mam4ttVR?=
 =?us-ascii?Q?ALnVzrOvNnSKjwIWlclxgBm019khpt15U6YvUkAzQvgv7Eo7EA0xZ2xjQfxF?=
 =?us-ascii?Q?GgvJJdTU21Zmp4NFKn7sAjrfmRiQd+ptlNzoIrLrXylvXEUqHqypqljB2+FK?=
 =?us-ascii?Q?zJSuJwJiRPx+GEsA8Xq2NcP0lz91VC0YaoP66vgq8dkjroKJ4ZhND2QrfFsH?=
 =?us-ascii?Q?2slQVvfHy2cXIwnYBwkdH3iugP78xhnxF2PqI9KmuJjVB2GMb05Tn8vqC2A5?=
 =?us-ascii?Q?HWnJt0eUJs/VybsbWWgnHZzVbZx0OKvADWS9aZrctOb/3GSHK55hbGuYtE1d?=
 =?us-ascii?Q?1ck03h39N1AAY/oTFrs+OOdn1oovd749LQcBs11tDL7NMONKDGXjPgW+9GZf?=
 =?us-ascii?Q?DE3uVp925uRrSAYbOaRjoV/vx1oJ5l/A1LVm85jm4ylXo3evhiFmrkKJM/+5?=
 =?us-ascii?Q?5Sg8FSPhgtHTY5kyFzlSTcl8JQ5QDlerNT4O8nnNQD0wEa8ZbZLD7J3Y6YH9?=
 =?us-ascii?Q?wmsork/G+Lp4sxSaZLj3SPcJUFFVmOAR/TVrp0a6NaMuWGQ4lE7NxYEReBIl?=
 =?us-ascii?Q?HDcKcgGmuFZ5wt0x2QmJc+1JCVYpf3Q/2K+H8JNXwBzhGDpv9hk01Z1Jx/Gz?=
 =?us-ascii?Q?IdB3R9SkItxjAM87nJNBVe5ingUo7VlViczVkRCyDSQNXhVgwPTdfrsnEqux?=
 =?us-ascii?Q?EfCpKNvgPv50MpZbiwotngMCIE/Sn0ri24wMFat1roVOjeyxxgdgbvJojkyg?=
 =?us-ascii?Q?afFIG+DBvG6G9jtbtIkTphnsfmvqan1TK58kXTinVe5gLeMBbl9m3oEtebTG?=
 =?us-ascii?Q?dwFtzulgmGE9HKxoOyp6yTRbwdARUBgbSj+F9kXSH74YyiNSQLBsrkdSroaZ?=
 =?us-ascii?Q?OZwLZjpvF9+BzKEGJUQlqD5UO3UzCCtMfQ/aBhxNK+YD7mK8xyMDHrBgCjKR?=
 =?us-ascii?Q?+sSNrfHKlMvzF/j+L5SCvXAOkG5AjlIve3ksPD4B2TWaIdDG0VQ6RNs9FAe2?=
 =?us-ascii?Q?Q+5K8Y50cL0zyKtIekY7ZYP/rhAnZJaKfQtkX7QW8Rrc31UoAxKvOCiSk4aV?=
 =?us-ascii?Q?Vu1DpwJqRjtMZryJkFUgPVc8HDT4o3gBO0KNxCJj03PYzd8TYpML2TSnd3UY?=
 =?us-ascii?Q?+vXClXAyowBqN5zyeOmGlZBlJZ2fN/o/GA9I6vc72d0KzaDMoDLRpE6TSf3L?=
 =?us-ascii?Q?v+yqx2tq3RoC3tfKey7LQl/mUkjqZSKB6DDp5Fv1Ta/1HCOR3M+FIeRAG7uD?=
 =?us-ascii?Q?fOiwTLtgrd4tyVI6yh5XYhW2CEBFKwBrxlLfcmaXHtWGUw4qiTUrVHKTHjDF?=
 =?us-ascii?Q?jD5c9hPShgJcvFGu/MKzYoZpXi2x?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DaMZNPIEliFghccSNsdO3Eu0m5AxL0HJy+d7SXWxR8l3/zSntk+hqXB1T2Zm?=
 =?us-ascii?Q?sWfBPqJC7lKqORMC2Ubf7obVtUmjjfbn7iiJiCNwAMZdP2c5Cux+Kaq/jtJR?=
 =?us-ascii?Q?4/XPYKUeKeB5Lb1Q7Tx8u0jaE4N2qfhp14Pfrk3kNWDe+gExW0h8PI1Aqzr9?=
 =?us-ascii?Q?bP4RhBXvga6AJaeESNF0zapmxnqxX47LgoPhN+Qp/sizPpc12YIK6XWlTq+i?=
 =?us-ascii?Q?NdEn7mofkjoTT+nBlGDJsspPU0Xls53EFbZPQyfory/PjiskbnyaNj2pufql?=
 =?us-ascii?Q?X1FnLJf/yHEGzY2S6PXMHWPAn72Yr/RyHUeMJFw/RTLJ94saqJQBA7GxhOIl?=
 =?us-ascii?Q?SqfaCNs/DUblIzR9nOL3uy3YA9OAesarsBL10vATJgBBeislZzZOyDPFxcCy?=
 =?us-ascii?Q?qr88v+jee7ruXRQsgQe5cpXqENqB2KU7WhtG/NWsvvMiIjd8wF621u70ujlD?=
 =?us-ascii?Q?R/YyiEOH9tvczzaU3OLUlTcHQPFUCaatbL+vXsmvzwqnVXA3nwsu4NNshbPT?=
 =?us-ascii?Q?CL7BLM6IDZkGh/Bwap1NHBPKId0kyoBp7uVP5J1x9CPihuweWPff5kYHz2I8?=
 =?us-ascii?Q?gAd71jfYoldxMlVKPpRLBy2UxbgjNgvi5Ku0kwKdOMI5imxjOBkhhtTFmwtY?=
 =?us-ascii?Q?dD83tzqGKgWlq0PGIUwuaYha0EDtbvKn2LjFEQF93azXTfOSleofCVKe+Nrk?=
 =?us-ascii?Q?j8pdnVirc9nDHiX+YOckSBrhEJE87ZZPLqIf8h2XdWE5VlYAjjEUFSBG/wnf?=
 =?us-ascii?Q?sXJjBy0grXzra1Qze5yeP4/UymrxIn4AXTXKzzdvmvz3ODkdxqOP2dOC3YCm?=
 =?us-ascii?Q?nz4Ds4LC2MZVfdZXgJu1eZYShAPQyGjBYZ1NZylrMrGtoaiPG/4wETRaE8qd?=
 =?us-ascii?Q?jOegqw5NhtHXnR3Kxo0jackQudpUUfMzYt5qrQOX0SP2ctPz42jbAPbl4gEA?=
 =?us-ascii?Q?OKnycmwi+XMTDkZK7nW4U45AYu/1NXhuQ3LJCntG6B8H4ifJn3DdRmXF2m2N?=
 =?us-ascii?Q?HghhdNbSqVV3bWwtO6uZ2YvEd9W5cwtZuLI3fpp2WAH/xvShXVE9Q4AI/DHI?=
 =?us-ascii?Q?SteFMVOkn3OADJBWv8i9BJhBkMtq8NWDYdexAGczFevU7V6YKTThbziDE5vX?=
 =?us-ascii?Q?bFcMmSDJ6Nf0qnkGyM51LQsEZy4eXJ3Kflk9Y3QkCL9RrbyUaPyiSWKIN0mY?=
 =?us-ascii?Q?Xem6liCa8BT5YUQuFZcCo5z1cJIwaGoTdTlg/6BBymSPQqh87oSvREBjZgrp?=
 =?us-ascii?Q?tkyvIzkTARDIrXCZ9e0RJxceqhbCc6wwbexRqILmsRsmQM+y33nxdIx72YNy?=
 =?us-ascii?Q?EPwwoNcRD3WuufMT6vtAsUmt+IH9ahS7Sqe5NkVMAMeNKaSfKoFSicSmQDO5?=
 =?us-ascii?Q?WVGouAPs+4L8XqQngGeknrnJWdnitMscKGVI+bdKjUIgl1uuzDSQHlwO3GwJ?=
 =?us-ascii?Q?S5yHx+S0FjUPNd5CGEDyTOUXTwHSHslBNza2MmFBDeUS7Ck8ibLrgDCCxP73?=
 =?us-ascii?Q?JtPY8heaG3qCVHkTfy9zXxRfPWTzZvF5bbMAR9DFRP3NHnBt/AHoH3D8jH2J?=
 =?us-ascii?Q?XyqRmxOcdPMyhnBQ2xvHPM00F4wT1Q5yMJB30I83XumI9Hij0NHbQlct0lZQ?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 922e65a4-a04a-4e42-6e1a-08ddc4114481
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 02:34:20.4591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FMkp1u9kIhFf5tiE4BvsbErbV3WKsAmzdk/TMfM1lZaxFqkiHZUUMRJM7U1qx1em6ZDh8+niqQD0TqKyw45gaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7811
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

kernel test robot noticed "kunit.drm_test_framebuffer_create.ABGR8888_pitch_less_than_min_required.fail" on:

commit: e33530ce8ac50d5155aa7a83f6dcd8b8372279d0 ("[PATCH RESEND] drm: Fix potential null pointer dereference issues in drm_managed.c")
url: https://github.com/intel-lab-lkp/linux/commits/Haoxiang-Li/drm-Fix-potential-null-pointer-dereference-issues-in-drm_managed-c/20250703-173209
base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git b4911fb0b060899e4eebca0151eb56deb86921ec
patch link: https://lore.kernel.org/all/20250703092819.2535786-1-haoxiang_li2024@163.com/
patch subject: [PATCH RESEND] drm: Fix potential null pointer dereference issues in drm_managed.c

in testcase: kunit
version: 
with following parameters:

	group: group-00



config: x86_64-rhel-9.4-kunit
compiler: gcc-12
test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz (Haswell) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)


besides, more issues are observed

b4911fb0b060899e e33530ce8ac50d5155aa7a83f6d
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :6          100%           6:6     kunit.drm_test_fb_build_fourcc_list.XRGB8888_as_native_format.fail
           :6          100%           6:6     kunit.drm_test_fb_build_fourcc_list.convert_alpha_formats.fail
           :6          100%           6:6     kunit.drm_test_fb_build_fourcc_list.fail
           :6          100%           6:6     kunit.drm_test_fb_build_fourcc_list.no_native_formats.fail
           :6          100%           6:6     kunit.drm_test_fb_build_fourcc_list.random_formats.fail
           :6          100%           6:6     kunit.drm_test_fb_build_fourcc_list.remove_duplicates.fail
           :6          100%           6:6     kunit.drm_test_fb_memcpy.drm_format_helper_test.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_check_src_coords.Fail_overflowing_fb_with_source_height.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_check_src_coords.Fail_overflowing_fb_with_source_width.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_check_src_coords.Fail_overflowing_fb_with_x-axis_coordinate.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_check_src_coords.Fail_overflowing_fb_with_y-axis_coordinate.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_check_src_coords.Success_source_fits_into_fb.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_check_src_coords.drm_test_framebuffer_cleanup.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_check_src_coords.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.ABGR8888_Buffer_offset_for_inexistent_plane.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.ABGR8888_Extra_pitches_with_DRM_MODE_FB_MODIFIERS.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.ABGR8888_Extra_pitches_without_DRM_MODE_FB_MODIFIERS.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.ABGR8888_Height_0.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.ABGR8888_Invalid_buffer_handle.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.ABGR8888_Invalid_buffer_modifier_DRM_FORMAT_MOD_SAMSUNG_64_32_TILE.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.ABGR8888_Invalid_flag.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.ABGR8888_Invalid_width.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.ABGR8888_Large_buffer_offset.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.ABGR8888_Out_of_bound_height_*_pitch_combination.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.ABGR8888_Set_DRM_MODE_FB_MODIFIERS_without_modifiers.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.ABGR8888_Valid_buffer_modifier.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.ABGR8888_Width_0.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.ABGR8888_max_sizes.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.ABGR8888_normal_sizes.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.ABGR8888_pitch_greater_than_min_required.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.ABGR8888_pitch_less_than_min_required.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.NV12_Handle_for_inexistent_plane.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.NV12_Handle_for_inexistent_plane_without_DRM_MODE_FB_MODIFIERS.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.NV12_Invalid_modifier/missing_DRM_MODE_FB_MODIFIERS_flag.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.NV12_Invalid_pitch.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.NV12_Max_sizes.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.NV12_Modifier_for_inexistent_plane.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.NV12_Normal_sizes.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.NV12_Valid_modifiers_without_DRM_MODE_FB_MODIFIERS.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.NV12_different_modifier_per-plane.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.NV12_with_DRM_FORMAT_MOD_SAMSUNG_64_32_TILE.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.No_pixel_format.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.X0L2_Handle_for_inexistent_plane.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.X0L2_Invalid_pitch.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.X0L2_Max_sizes.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.X0L2_Modifier_for_inexistent_plane.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.X0L2_Modifier_without_DRM_MODE_FB_MODIFIERS_set.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.X0L2_Normal_sizes.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.X0L2_Offset_for_inexistent_plane_without_DRM_MODE_FB_MODIFIERS_set.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.X0L2_Pitch_greater_than_minimum_required.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.X0L2_Valid_modifier.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.YUV420_10BIT_Invalid_modifier_DRM_FORMAT_MOD_LINEAR.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.YVU420_DRM_MODE_FB_MODIFIERS_set_without_modifier.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.YVU420_Different_buffer_offsets/pitches.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.YVU420_Different_modifiers_per_plane.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.YVU420_Different_pitches.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.YVU420_Invalid_pitch.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.YVU420_Max_sizes.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.YVU420_Modifier_for_inexistent_plane.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.YVU420_Modifier_set_just_for_plane_0_1_with_DRM_MODE_FB_MODIFIERS.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.YVU420_Modifier_set_just_for_plane_0_without_DRM_MODE_FB_MODIFIERS.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.YVU420_Modifier_set_just_for_planes_0_1_without_DRM_MODE_FB_MODIFIERS.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.YVU420_Normal_sizes.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.YVU420_Valid_modifier.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.drm_framebuffer.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.drm_test_framebuffer_free.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.drm_test_framebuffer_init.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.drm_test_framebuffer_init_bad_format.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.drm_test_framebuffer_init_dev_mismatch.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.drm_test_framebuffer_lookup.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.drm_test_framebuffer_lookup_inexistent.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.drm_test_framebuffer_modifiers_not_supported.fail
           :6          100%           6:6     kunit.drm_test_framebuffer_create.fail


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202507160354.21a14db0-lkp@intel.com


(part of full log)

[  137.733532]         KTAP version 1
[  137.743385]         # Subtest: drm_test_framebuffer_create
[  137.744157]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  137.767882]         not ok 1 ABGR8888 normal sizes
[  137.768882]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  137.791777]         not ok 2 ABGR8888 max sizes
[  137.792684]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  137.815217]         not ok 3 ABGR8888 pitch greater than min required
[  137.816102]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  137.840600]         not ok 4 ABGR8888 pitch less than min required
[  137.841336]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  137.865608]         not ok 5 ABGR8888 Invalid width
[  137.866324]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  137.889284]         not ok 6 ABGR8888 Invalid buffer handle
[  137.890013]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  137.913751]         not ok 7 No pixel format
[  137.914407]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  137.936719]         not ok 8 ABGR8888 Width 0
[  137.937549]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  137.960134]         not ok 9 ABGR8888 Height 0
[  137.961342]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  137.983942]         not ok 10 ABGR8888 Out of bound height * pitch combination
[  137.984877]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.010085]         not ok 11 ABGR8888 Large buffer offset
[  138.010805]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.034402]         not ok 12 ABGR8888 Buffer offset for inexistent plane
[  138.035121]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.060049]         not ok 13 ABGR8888 Invalid flag
[  138.061100]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.084131]         not ok 14 ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[  138.084993]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.110649]         not ok 15 ABGR8888 Valid buffer modifier
[  138.111393]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.135217]         not ok 16 ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[  138.135933]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.162947]         not ok 17 ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[  138.163630]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.189522]         not ok 18 ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[  138.190235]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.215622]         not ok 19 NV12 Normal sizes
[  138.216403]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.239195]         not ok 20 NV12 Max sizes
[  138.240023]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.262575]         not ok 21 NV12 Invalid pitch
[  138.263258]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.286058]         not ok 22 NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[  138.287019]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.313103]         not ok 23 NV12 different  modifier per-plane
[  138.313926]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.337915]         not ok 24 NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[  138.339024]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.363845]         not ok 25 NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[  138.364927]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.390321]         not ok 26 NV12 Modifier for inexistent plane
[  138.390992]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.415040]         not ok 27 NV12 Handle for inexistent plane
[  138.415717]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.439640]         not ok 28 NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[  138.440361]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.467024]         not ok 29 YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[  138.467691]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.493216]         not ok 30 YVU420 Normal sizes
[  138.494137]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.516948]         not ok 31 YVU420 Max sizes
[  138.517886]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.540344]         not ok 32 YVU420 Invalid pitch
[  138.541003]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.563878]         not ok 33 YVU420 Different pitches
[  138.564688]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.587901]         not ok 34 YVU420 Different buffer offsets/pitches
[  138.589052]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.613521]         not ok 35 YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[  138.614198]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.641089]         not ok 36 YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[  138.642154]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.669373]         not ok 37 YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[  138.670279]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.697162]         not ok 38 YVU420 Valid modifier
[  138.697838]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.720852]         not ok 39 YVU420 Different modifiers per plane
[  138.721447]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.746307]         not ok 40 YVU420 Modifier for inexistent plane
[  138.747165]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.771457]         not ok 41 YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
[  138.772098]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.798108]         not ok 42 X0L2 Normal sizes
[  138.798677]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.821384]         not ok 43 X0L2 Max sizes
[  138.822002]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.844273]         not ok 44 X0L2 Invalid pitch
[  138.844919]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.867733]         not ok 45 X0L2 Pitch greater than minimum required
[  138.868358]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.893003]         not ok 46 X0L2 Handle for inexistent plane
[  138.893837]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.917784]         not ok 47 X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[  138.918775]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.945711]         not ok 48 X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[  138.946324]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.971458]         not ok 49 X0L2 Valid modifier
[  138.972065]     # drm_test_framebuffer_create: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  138.995030]         not ok 50 X0L2 Modifier for inexistent plane
[  138.995048]     # drm_test_framebuffer_create: pass:0 fail:50 skip:0 total:50
[  139.001755]     not ok 3 drm_test_framebuffer_create
[  139.010357]     # drm_test_framebuffer_free: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  139.033318]     not ok 4 drm_test_framebuffer_free
[  139.034199]     # drm_test_framebuffer_init: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  139.056932]     not ok 5 drm_test_framebuffer_init
[  139.057721]     # drm_test_framebuffer_init_bad_format: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  139.081362]     not ok 6 drm_test_framebuffer_init_bad_format
[  139.082208]     # drm_test_framebuffer_init_dev_mismatch: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  139.107079]     not ok 7 drm_test_framebuffer_init_dev_mismatch
[  139.108058]     # drm_test_framebuffer_lookup: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  139.132003]     not ok 8 drm_test_framebuffer_lookup
[  139.133189]     # drm_test_framebuffer_lookup_inexistent: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  139.157294]     not ok 9 drm_test_framebuffer_lookup_inexistent
[  139.158145]     # drm_test_framebuffer_modifiers_not_supported: ASSERTION FAILED at drivers/gpu/drm/tests/drm_framebuffer_test.c:389
                   Expected priv is not error, but is: -12
[  139.183665]     not ok 10 drm_test_framebuffer_modifiers_not_supported
[  139.183680] # drm_framebuffer: pass:0 fail:10 skip:0 total:10
[  139.190902] # Totals: pass:0 fail:63 skip:0 total:63
[  139.197336] not ok 1 drm_framebuffer



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250716/202507160354.21a14db0-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

