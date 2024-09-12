Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA9A977533
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 01:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D038710EC76;
	Thu, 12 Sep 2024 23:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AuR7/qxc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBEAA10EC77;
 Thu, 12 Sep 2024 23:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726183415; x=1757719415;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=iYk3RaiAUXvvubxcW2DDn/6g52b0xJMMgCXPP0K/7vg=;
 b=AuR7/qxcX1Cn4UKnBiyQDedR4CZHb7QP/tJ8tqxebElJRk0Mv1g4czIm
 roqseDcDHzPltqRk13qVX8OFpF62s8+1u57dCWfcMqDodzSkEcWSsjTsC
 rfWWtsH2bmbr4vXB3tpnlPz48qqMEAT23UQLjPsz4JOPteuT6bXkA9gbM
 Y2i0lq1p5zgpLsTAqtCIXIwZoTMv4iKFN8nCTdXv0k/hB28mX7vJ2tYW7
 L9LAcXXtZzdPPR18MibUS/VzuozPO9km0UK4NuTd9t5SYiKjIW0OQSxgi
 t9ToZo0MWzlU3FfylEn5wEb97F2oO4pgXB3X+Y2LAsD9xHFvuf0Wvn8+K g==;
X-CSE-ConnectionGUID: /YKTMGwvQzmtYrzw0tqptQ==
X-CSE-MsgGUID: UbLdC54oTWCuDDwN3Wbjxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="47585746"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="47585746"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 16:23:35 -0700
X-CSE-ConnectionGUID: XwCpjVmzQY+g/X8Bd/krxA==
X-CSE-MsgGUID: VwTDTUBsT6SP07dp4u5KMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="67707081"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 16:23:33 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 16:23:32 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 16:23:32 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 16:23:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 16:23:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/7bpNXS6gDNBqWLcJpRiAXkuo++veiLin5lgUTVbGoS5hWJhhg73q/5Zfjk+UQcNBz3kngZSzughHQhNGWpIZj/dpOGBjehc+L2UJp/FtmWv3UElgWWKA2QhCnsmalmxWYh+zDyi9NyLCJKwFYUfN6fIjVe+8kaftaZ7FdWx6m5n1br6PZCItmgHNQtxzkP7sWoosrxlED2DxMcPo2DYgIXOwLETmDSUnfoAeugfOvCf9rowRCgCy5IGiwtBQ++04VZAldXzLJw7gpOwUuoiyh0PtNQyL5E7P8s0yNyWJCH0Eki7aGAnbHGcDCuZkiKyGycy19CT05LTD9RR68Bkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRXjHpyXKHqrktPM8LKGJw2i8iE39OztTnYZ/JIM+Ts=;
 b=ITDQPdadoLhcI/c7+coZopwuktF4TCqHunsDL+/x+89GRmxndgmnhbsglj00Mnr26xcnxcwzMcJoaSgJhh8v+bpTGms+PAm1t2n7bw66BIjGlpMeD7v8KxJmJHF1RxQ2SR/BDHPQ6hZCPjen6iAYleXBzU/ihGq2mWdrUE4TV/42xa8a/ELiotcb5nOzS7qaoNzRe31+j/uH1Np+rcJjxcg/349AWTyhl2vLiAc0kU7toAltWGuh7zkkEr0mo0vnVkxRtKSJ9mKp/F5wufrMrEzLydwhEf9wkoXgWs74xsd+cJz6B04u3Z5Sh0ocBKeEqNNAJDmdqkgREe3EqBIkMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CYYPR11MB8407.namprd11.prod.outlook.com (2603:10b6:930:c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Thu, 12 Sep
 2024 23:23:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7962.017; Thu, 12 Sep 2024
 23:23:30 +0000
Date: Thu, 12 Sep 2024 18:23:17 -0500
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
Subject: [PULL] drm-xe-next-fixes
Message-ID: <az6xs2z6zj3brq2h5wgaaoxwnqktrwbvxoyckrz7gbywsso734@a6v7gytqbcd6>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: MW4PR03CA0292.namprd03.prod.outlook.com
 (2603:10b6:303:b5::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CYYPR11MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b98b17f-1d73-42b2-405e-08dcd381e969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+2Z9MJ8n8aD5zK+EKzh6W6vkBPMyOuTaHKNf9BXsvuwDd9XEDqKLb83/PV4t?=
 =?us-ascii?Q?k/PXoxCC86L6T7puoycRLhWiprQVvCBpsfC2JO8HaWDXenRbQXjNNJZHbmwQ?=
 =?us-ascii?Q?yeN6L0P77itYUS78UUW4P9j5Mo4BkXS5iNrgEOtR/z4FF6UJMtdA10LCOJHz?=
 =?us-ascii?Q?Kuyapr70aIZNQ1NNUU1nHq1LyBvzU5Pv/nnaQG24zM6kZM1HzNqaMc4PSQQW?=
 =?us-ascii?Q?GVF7t/HPgt5MQkCqvgGurxzyVdwK+WCFCH9pKE01OE8cfAbIfGwCnARcn9CN?=
 =?us-ascii?Q?LRkL2Cnl3vJWFSelNuQQJw7RsbOKb4kxJvnkIE+g1y1cXbu0uQWBE5Lz3HkR?=
 =?us-ascii?Q?HEsXd3fhXZC7fSU1JBXNszZcKxgBEyZy3a1qSMyVmfJBR6lBBiYWVdUIeaCg?=
 =?us-ascii?Q?40/ZqBuocIzt9Mc6w5ljVzyDhXwOAE+Nip1C3guejJivg/W6IY4LT7VRuJ6t?=
 =?us-ascii?Q?6xGPB1nnK9AsFXbM3WEcdMLyuGwUC+AtA0yYh1BWHQdymNlcwmWqkAc7v7FG?=
 =?us-ascii?Q?mo9mAXkTKKpUyUd4lhPxwOjawgLjQ11ElsIDpk7wm7iesLh/B24KYvS80+11?=
 =?us-ascii?Q?zEW20P4E9u2YUnRX1MtPSl1qt0KRr9008OOueVdIf3gSH+u8TROlJtwodI7K?=
 =?us-ascii?Q?a7v2auWgikMcE2tm0lbp5BPvdDUpnDRJ3JKADyXqfUtLTo3EVKNwTrOh8PzL?=
 =?us-ascii?Q?6c1LzN9SlQSdIseunyEUCXQah7NXvH2Pp/TI9xRREKyqxWSR3y5eZTwRlqE6?=
 =?us-ascii?Q?sPcVHH0DTVly2zZBuoxdIutKkbad5WzJpbjLFCsAsJgq+zCqggijn1aiSIdY?=
 =?us-ascii?Q?5QNpIR9q4XDAp7lXbyaDGZbH5Ix2iXUeUZfoK7hh99dbeSz3x07OLg5+Hln8?=
 =?us-ascii?Q?3OJ16onmX4fQDm+tQLMP7GnxuVHGnhaEG+eMH8/4c+8rdrLeuYDcTMEy90SV?=
 =?us-ascii?Q?rcAKIKAisSJOKsdYrhiHERKq5VcaqIo7qhUFR7Gm50QrBkA57S/VbAT4s6Rs?=
 =?us-ascii?Q?DI/nuH2FRXtzQckbd89Ris2biEqOE3pjXD/kXsIpSIZKVdCJxT+zYK/Ztn59?=
 =?us-ascii?Q?zbnsbMir+sJ0MQVW0ebV4VYySj+euMm68ltlYtUNiQ85BEmtoA+qcLF02b1h?=
 =?us-ascii?Q?ccGvjitqODxKNO+cCfjUidG+0Ql67Sgc6atTFQEMpSmv1ZQQ2kfmGqapxw6K?=
 =?us-ascii?Q?ZJDKY0CEMpX4hKJl8VPrm70Kngv8391UnN4evmSHL5Gj9i8WIwN054UYgquf?=
 =?us-ascii?Q?qL6oo7u1Ak/0FlukR6cLb7pJqb6KsXbzOgY2B6xbrQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EGFwUW/bsSXzIi0TPGrOWkCHVLR6a5ThvGi3H8huHr9gimXZuEOyAGEquxyG?=
 =?us-ascii?Q?JakINonj3T0dwongmSzRYVVdDbEPbnwALOD93XeodA59KF9EMmIVEoe3rZya?=
 =?us-ascii?Q?ZVZ3G/UdPE+PHi0LU03U7pb6NHyfPggxreMK7morunuaqZtQCRAXynU5VnkL?=
 =?us-ascii?Q?57f1fJNdzSje9lULQ3pU+9FtV1OCR81Kp0XXl4JCakNXzT5t7p3LgqbYYKRk?=
 =?us-ascii?Q?bui/upc192Hogcp6jnFGQYNkBN1L5cyzHn2jUeN1CVhTbjCDlcrbCy4kBfor?=
 =?us-ascii?Q?336TeCfCn2A7+VwbZsMJncBm0C+XMlJ5vvH5BuiKTwravh1tuzCEZ6ttgGP4?=
 =?us-ascii?Q?sVPz8UB//Mv7qmdo1f6EzEKhqja3+oSunrZE8pEs5FPrExgnsp6Dx+nT6pAz?=
 =?us-ascii?Q?N7GDpWpra9HrqCSwi56+ly7Bih2LLDeFDKwQIANwf6IY6sr1bMl3nQSaP98r?=
 =?us-ascii?Q?0/TE/XJadP9E3cW/jBiFI698UK31jvJqTEMHNoegOW/XOpoIPMdxFjYO3Ze9?=
 =?us-ascii?Q?1tThh8O7ccHWCUBfnanU/Ap08r3PpjF3dCwg7tI5z7y9rMu7egJdH4Utuaqk?=
 =?us-ascii?Q?X522b4LA5hWygV3ewNGezBu2k5tg1iscBwY8fYRPs95fRDbBxGuhTcMSnMgK?=
 =?us-ascii?Q?d0uCEu8Vbk+dfcVJEurRGkD5ghGdpUqvr78sUIbTbr0CxidZLB0UG+OwSGlm?=
 =?us-ascii?Q?3DkKyDW6Ckq8hnAEV4tW0CVZxTIuf/EJT877YqOPqbVhZ+GWnHNJb+QwS5HX?=
 =?us-ascii?Q?ErsimN7tWL1GIS51Of0d7hGVIhWjDivR3TB6AebCavYhYwEPDu+WdjXKxwyv?=
 =?us-ascii?Q?w63fWPtP091jJMA+Un1tZgE9zO7JqvYIQPw99XJKQKENc9yquHIiA+tnmmbh?=
 =?us-ascii?Q?Ik+Yl7934ZarcRRgJwT/JpkrG8jMRb0GDnVWdZZEVWo6niY9+cP+panlma5N?=
 =?us-ascii?Q?vJsPF+Kajm3iW+kGD5xvDhw5Ndm3RpGSnF7FAvfnc4hzBipJwKd0nE7SXd7M?=
 =?us-ascii?Q?ac1B0+qmHSACHiVo9oiXRqx/SyWD3ebr78kOzAbHVLv4Rp0Ucst496mvdPtx?=
 =?us-ascii?Q?quAF89RW7r1xfbdv0cEX8FHCOTZ30Q7JDzEej4M75KhEjt1bY6krzAm+7MZL?=
 =?us-ascii?Q?/FShyr1SYUjixKjQPG4uZ/7m7Eissh6ozbmvyevNXWr4s03hnTq0MjBqi9g9?=
 =?us-ascii?Q?BeQgn08pm/hOAlnmeg+NuOglK/S/7mBfUytqiQXTIIuRywMMdPIpdFI+G/1d?=
 =?us-ascii?Q?N88Nqdbnk57Z1+QrXJXp/E7273TVSr7WST+424SL528WckTUEvhfAfpfiw3C?=
 =?us-ascii?Q?/Pw2zgpzbzmN4A2UE068yWZUhzM0fkur0/kICB2yCHyVc/0ay9Ip+LRlUaTl?=
 =?us-ascii?Q?qtyhfX0xrLwJoWQ/RKNNVrsPQz7fISLU5JIk0E+Plwvwvo34kEVDCRhKH5pt?=
 =?us-ascii?Q?vldaWn2sBdgVua2fuupLUBTv3s4escybovLpLtf7SOFdh9V2N027Tfmzk+uO?=
 =?us-ascii?Q?MdfJRomzetUOt1983deOXKI/E5pBK8gYeniPHEAEHeFnJRNHeenBDdyr6gsn?=
 =?us-ascii?Q?WQ9LjP144LIUMM/O0jzubbBY4Ymc/J/vHQCu6GPoQEoM8h/F78teCOYAI/FW?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b98b17f-1d73-42b2-405e-08dcd381e969
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 23:23:30.4126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bdcqN1DbqSUQVhKKiqrAciqFu8iPkHmYW6NdzuiRqEeAhzYVWv0UX0IMd36Jl+dCHBiNfGHfBYQnTrPbGUQrRR6+LZAxBLVHhesDyu5n3p8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8407
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

Hi Dave and Simona,

Fixes for 6.12 cycle. Very normal fixes, mostly on error paths.
Maybe something different from previous pull requests is the addition of
the workaround, which we were not doing since they don't have a "Fixes"
trailer. However as we are enabling Xe2 platforms starting with this
release, we are being more careful and adding them when they are really
needed.

Thanks
Lucas De Marchi

drm-xe-next-fixes-2024-09-12:
Driver Changes:
- Fix usefafter-free when provisioning VF (Matthew Auld)
- Suppress rpm warning on false positive (Rodrigo)
- Fix memleak on ioctl error path (Dafna)
- Fix use-after-free while inserting ggtt (Michal Wajdeczko)
- Add Wa_15016589081 workaround (Tejas)
- Fix error path on suspend (Maarten)
The following changes since commit b615b9c36cae0468491547206406a909a9a37f26:

   Merge v6.11-rc7 into drm-next (2024-09-11 09:18:15 +0200)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2024-09-12

for you to fetch changes up to f1a4dceeb2bd4b4478e4f0c77dac55569d153fb3:

   drm/xe: Fix missing conversion to xe_display_pm_runtime_resume (2024-09-12 18:04:36 -0500)

----------------------------------------------------------------
Driver Changes:
- Fix usefafter-free when provisioning VF (Matthew Auld)
- Suppress rpm warning on false positive (Rodrigo)
- Fix memleak on ioctl error path (Dafna)
- Fix use-after-free while inserting ggtt (Michal Wajdeczko)
- Add Wa_15016589081 workaround (Tejas)
- Fix error path on suspend (Maarten)

----------------------------------------------------------------
Arnd Bergmann (1):
       drm/xe: fix build warning with CONFIG_PM=n

Dafna Hirschfeld (1):
       drm/xe: fix missing 'xe_vm_put'

Maarten Lankhorst (1):
       drm/xe: Fix missing conversion to xe_display_pm_runtime_resume

Matthew Auld (1):
       drm/xe: prevent potential UAF in pf_provision_vf_ggtt()

Michal Wajdeczko (1):
       drm/xe: Don't keep stale pointer to bo->ggtt_node

Rodrigo Vivi (1):
       drm/xe: Suppress missing outer rpm protection warning

Tejas Upadhyay (1):
       drm/xe/xe2hpg: Add Wa_15016589081

  drivers/gpu/drm/xe/regs/xe_gt_regs.h       |  1 +
  drivers/gpu/drm/xe/xe_exec_queue.c         |  4 +++-
  drivers/gpu/drm/xe/xe_ggtt.c               |  7 +++++--
  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  8 ++++----
  drivers/gpu/drm/xe/xe_pm.c                 | 23 +++++++++++++++++++++--
  drivers/gpu/drm/xe/xe_wa.c                 |  4 ++++
  6 files changed, 38 insertions(+), 9 deletions(-)
