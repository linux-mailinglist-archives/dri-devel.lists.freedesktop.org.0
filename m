Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2539C9630DB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 21:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C79810E5B4;
	Wed, 28 Aug 2024 19:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jMRIQP75";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58CD10E08B;
 Wed, 28 Aug 2024 19:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724872717; x=1756408717;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=0x+YZM3RFkmEyW5Ivl1Xbr+TOtV/gCn8iascAG3rKCM=;
 b=jMRIQP752ZP7/XeNVOua9ecL8BDnDdkbXU9J+zTS0pftXTys5u48jFtn
 H2jIZDy7KgwKmUcZ4k5EdNuyeOuu4iMPjLAA43cRr4bPCMFLzxMnfCOG+
 BYs9Bj6BhvzL9kEw6GdfcWLmJ/BJRmmVNyg1LEHxN5mbBODPLHJOGG89p
 4o1ziL9MsEssF0gCEDEAKKNWopPwsfikXyhxQIoNygaUTe1iJp7aFCjbn
 9IakXaChMRgymNtfUrZhIaHChoITTPkjry/ja8YSUSst0jYB7jW4rNZvE
 Nww/vEGIY4MuvB9KqWZDlgFfBlToj3Uw8P6u0lLalGLwLsbp8RfVIOSlr g==;
X-CSE-ConnectionGUID: 5XZoosXfQFWq5ld3FnN30Q==
X-CSE-MsgGUID: 4yCb2M6BSqK7aQKYy7wFqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34045489"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="34045489"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 12:18:36 -0700
X-CSE-ConnectionGUID: n8de7+qWSzSQDtNPDB9wtg==
X-CSE-MsgGUID: MuaZAHvbQCmzoCLqxoEyew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="63506053"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 12:18:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 12:18:35 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 12:18:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 12:18:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 12:18:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WtIikygW6fiTiQhXA/lOYmukA9WJjoM3LqGi97hWIWZrS+63fsHjVo8Avy2+31vsYIEYLopTvjAwypFp1cf3V59j1vsKfPIgCdqIZE5GpKbF/sT2QIrNtEPXmX4ZxzsOEt5PK9sdP2e1uBot39L4HxaPuPfZ7zHMitew4HrUYJbHKOv4bYhOtVEX0zdPQerQqq6tz+tZXGAsaKEGXkucwyRzP7kb4IA+iLVQs+1GeAdFOEL0xubMuN6DuH0+0rEnVlAtugTwiAVH+8AY++Bsik0QnxRqz/JJExJvJ+ToyS2lzK8EI3BOaAF5uNjh8XbgmbU/9Iz8d/q2vRKUI80NIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6yIG9VSnSx5u4pK+IHm2OFLudZ5kSGKTLJcTUUSdScs=;
 b=xgq0/0jo4AW2AI09+SmFDynAMv9Pe/LOJBx8JdczhwH8SJ5EVPTxyKBrOjG7ymltVaDkctyYZ3i+abIZCutuSQuEeYRsQO1j/zoEEw5I1GrBZsB1yEitkt+3vvVKV+3j+vA6m7JATKHOX2XwMSNR6zifr/k26ESIBUBuzezmJ7A9IcOvzsknPzbrISCgjF/MPmcNcnjUVYxSwT5fYNuF84D0MdMWC4SZPU76KRFMVn+L5fQfnGfWsJmzeQ2m/1qVusXmQSP7UXyhySTnBCnH3gE9lik2RyQNrmXs39Hcp9T7sOT1bHTqoJZCV0R0ALX+PifWuz4kdczPsdZULx15WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CYXPR11MB8753.namprd11.prod.outlook.com (2603:10b6:930:d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Wed, 28 Aug
 2024 19:18:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 19:18:31 +0000
Date: Wed, 28 Aug 2024 14:18:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-next
Message-ID: <wd42jsh4i3q5zlrmi2cljejohdsrqc6hvtxf76lbxsp3ibrgmz@y54fa7wwxgsd>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0075.namprd04.prod.outlook.com
 (2603:10b6:303:6b::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CYXPR11MB8753:EE_
X-MS-Office365-Filtering-Correlation-Id: b827836f-048a-47f4-f8df-08dcc796343a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?vcsb2ASirJxqbTRs3PtGPl2IeLWdhCBQqJKHH/nNKQeIxiw2Kl2NAOuDCp?=
 =?iso-8859-1?Q?n6QXeKa+JEuyj1nMPYqV4fOYjALfsXThLex+nYpu0f4THCm2oRn5usVvS0?=
 =?iso-8859-1?Q?rlVVGe1e3dXQw1UvMi6G9cIzDzHbZpMZrE9HjzdKIRflHgg9i/2xfPsGbu?=
 =?iso-8859-1?Q?GZgQKjhTFgROR8n9gXSMPxMU5F+kQuBwCHUf4atb4nzMvskEoBNRwtDgnQ?=
 =?iso-8859-1?Q?QUWaPCf9Ks0DL6ItpEE9/A7fti75Iv3b52dE07lxpKUozKbK2nkulhtzH/?=
 =?iso-8859-1?Q?1A1EJtcUzegLICzs7Sxc0NlStEo+9HlO2Z+hkDV5Sw/8TWKXWl4QfIIGQ7?=
 =?iso-8859-1?Q?ZsTa5pz37dCDku65ZE+gTINabWolQ3dHmCCf4i+NPhpeRyCJ/8lFHym0Pm?=
 =?iso-8859-1?Q?ukJuemDviv0KPgu+YwfQKa7tKCCgdOIc5ll++xWZU6495peE45Dbx2Yb89?=
 =?iso-8859-1?Q?sZc1K3mk6/9s8ZIaa3021tyVbrDt4UXUKRkryG35LaQL+iBfAIp93XaiPv?=
 =?iso-8859-1?Q?gg6NrQI8iQ/6t+ti6hIqVS1LbZX05GjIE4XcQ1ozbBkDb2LyoNgQJRdgDj?=
 =?iso-8859-1?Q?GFMkHu2KNOrkfz2ejIhhOgXe3r97QdQdqjSFH1g46ueO7M2ZpSF/sqf7ig?=
 =?iso-8859-1?Q?X6Vk/aKxBiLymGJ43ifTkYFrdc1IQhjN6lUEVmAL+CWMDH6lGntYF2hd1M?=
 =?iso-8859-1?Q?LIxfSqJhBr1XtWeE9debeO1XnBLKUsCj5OUg+JFjUv/H19/zu3qBKtFg7Z?=
 =?iso-8859-1?Q?kGbll/AUfvw6kvv5YXHSBek4rsoUQk0phgA7kvHCl/QclXAl4XoORatW2D?=
 =?iso-8859-1?Q?wZqxizXFjya8QVcN55tMKr987u/gLOIwbG0N9Gphjng3u5OLtKsxjWXBHD?=
 =?iso-8859-1?Q?ZT0Wizo+LCSLkqQtFYu3F00+MTzWSinzZu25yWdIW3oOo+Il+fm5/gSp5X?=
 =?iso-8859-1?Q?Oi6FceIJLvym1rQzr2XGAERlL1FJTU0E8OaJXt3KztD5f5Mrhke31n7yZ+?=
 =?iso-8859-1?Q?LlhMgR4ZLI2CDl++j2uMWM3zaxjcCt7ne0LxI+CW4rmKSFDu7FfvQvjONN?=
 =?iso-8859-1?Q?VxyOEwAb7/qc25JoFPIkJFtiE7ppGmzqMvdaOpVftQJoLOnArwgIgngZd6?=
 =?iso-8859-1?Q?+ye3c0ofu+PZBf+K3R8JAQsfl2O77XpSNQ2NlwBWXLAeEhYxURBLiK/QDr?=
 =?iso-8859-1?Q?CqrU375Jdso9OZp9cIpKaGyAAjiuq+SVsrcRHlzSAVvZnS+OUXvZP2HK43?=
 =?iso-8859-1?Q?BEorYmNDT2RHpY3K1QcLNnQX4qJ56o0AlgKSZF01Kv9cesoVykx0RBXKnv?=
 =?iso-8859-1?Q?SWSpswaM2GJ5+maDgJ42bjDpIM6N06R+A4b8/J63+/OIfR8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?g6qJ12ki8B0o8fOEA2gvMGi6EucfGacqHLFk+jHCYq/ZlOyjUweNDvth82?=
 =?iso-8859-1?Q?QBKG8MI5PUn8wnlTVT+t/IuixiZpCipopxNlF0KjZqGp1yzdAxS+dJ0TYf?=
 =?iso-8859-1?Q?jvb4q7EB+qbjlPjYxAG9g0JMyiWQLJAnLJ/DRljPxTd4JYLef+3ABPHLNv?=
 =?iso-8859-1?Q?7KxLh5n6z3ldxfKOj3q3D+V6FWsYdOTCxvCd37mAPHSx86qk6SObBIpVbz?=
 =?iso-8859-1?Q?/r/MtnIptsXnjdGtqLgkWyPAA150+GVd/f8aWuhmnop2ROWke5ELxN9uIy?=
 =?iso-8859-1?Q?5q0+sObcL1zayxNgig/hl3RBPCI0Il9nAl1uJHA5SFBsMBRIhkI9+jwm/M?=
 =?iso-8859-1?Q?pDTVxMhfI63YlnG/pl50pbJdEBUJ/KyC6MeeR8d/IXsiLMoCyKHauQxOSN?=
 =?iso-8859-1?Q?ISvaTkhiMqKkW6Dyv9cxlZyX91Pn3QEG5zJzHzr4KKXHRvLh5C6Jlc05be?=
 =?iso-8859-1?Q?+oyC+Bv6YGUmK0/Mr0Vrcp8cVAkMJE9ArHAPpusX1lLGJ6NNaCX7UVZzVW?=
 =?iso-8859-1?Q?gvlJ/5k9tIpfDYKA2HNU0PWuO88yH6KtysaCJuOUTC4mf9runaCfza7Npy?=
 =?iso-8859-1?Q?b6wzHGT1nyipyLmspEwgqraPQ42MWB1LZ8d225sgV90oemGpHkSJOdJWhe?=
 =?iso-8859-1?Q?jK+XKG2clBR2HKPVmppBW6eF+2cgsAcYwoJRFirm0gnJ1Or55nNB+lEYjZ?=
 =?iso-8859-1?Q?teoylUVRBRG68Rm5fycWQkA6bB6jQehQRFSPj2cvlHEx5tq0J3ViyzMsHC?=
 =?iso-8859-1?Q?wBwmKYnRuyL65KHOqDd6I2dsRLc/aVIPNGLFPZB9Bkb/bhY7Vxobyqz/ww?=
 =?iso-8859-1?Q?LO1Ffcw+2pRNFhBoWKUtYAXr0qnZLodyqofzvX+uUpdSCgnH9XKVXVr6rH?=
 =?iso-8859-1?Q?FYL6lu2CdsFZNzvVRl9z1jcokWF89Nyw06pKrmWzugVJ4sPKuGKVXREl1y?=
 =?iso-8859-1?Q?ROaO/uTDardSMA5/IDEAHD53ElZ6LNPOw+sJ5yPGBJQzSGmwhH2zts6cTf?=
 =?iso-8859-1?Q?B9zSM69ur1c5JgXErxCyE7r/rMVRu2DpHpscmG/kyamPpsFFdxxJALfyEF?=
 =?iso-8859-1?Q?topafA3Vdjev8b035KUuZizbKx+Omuck691J7edz6EN4Wf0U1oWHw6ahX7?=
 =?iso-8859-1?Q?q4v+ugtJdv8YrRiDA2gVmaRTUdtZrvu/fiNJJvPeMrY8p4HwrCM/p1FscM?=
 =?iso-8859-1?Q?cY9uaTf5sBIf+yUdyUok9aBocFWZizqdyNxDGcttb7YQ4JiSUwtCcfBhUw?=
 =?iso-8859-1?Q?URG69vhA9sgvr6LgzS+9Z55nQOPjX/HtDKpnOdxSTzSjWk5284VPWFf7E6?=
 =?iso-8859-1?Q?v8GrhNj1UnTKAcoG/NcQ8iLcmBGXOGGGfV1UJSnI/qkXQx1jRqmAiiVEfx?=
 =?iso-8859-1?Q?BalNThon2KiNxYnzjeWgwof/sUngWvx5JKln5zMLtTdaGtk6p/dSudqHyN?=
 =?iso-8859-1?Q?N7wcfBIDE32wnxtdtRFdWPlQL6sjvQ8SDYACRpfJaB2O/amrWllDlHHTUf?=
 =?iso-8859-1?Q?Palh0jArauwoAiTjSRrwamevrJ8cpiA921q7hDNVrQjKUivAQhwgpIxryt?=
 =?iso-8859-1?Q?zM6Ch71h/lH+ARwC4uQtPdVwltMrMDF+Gsfph6ziozQFUvS7JZL7lfPHXA?=
 =?iso-8859-1?Q?d9CCGJr9ttRaFHnqDdzdFHxCeUFNAGWpwFn9utjIhpabiwfY/s8NTKYA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b827836f-048a-47f4-f8df-08dcc796343a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 19:18:31.7080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FlbvgFS1FSWOkxB0tXr3SRt0qboLCr4mWIM5ysboztkjUZIrnbnkbZs8OIV5lylQtGbgiYV2BCF9uz62/5fYgOqG+UdDrq+nU/iGo5q7ZZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8753
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

Second drm-xe-next pull request for the 6.12 cycle. This includes the
pull request from last week since it was not applied due to the ttm
patch. That patch is now reverted and replacement on the back burner.

The only UAPI change is actually a fix for building with gcc 5.

Aside from the additional fixes compared to last week, 2 important
patches to remove the force_probe requirement for LNL and BMG.  Those
are the first platforms to be officially supported by the xe driver: one
integrated and one discrete. For BMG there are still some necessary
changes going through the drm-intel-next pull request later this week.

Cheers,
Lucas De Marchi

drm-xe-next-2024-08-28:
UAPI Changes:
- Fix OA format masks which were breaking build with gcc-5

Cross-subsystem Changes:

Driver Changes:
- Use dma_fence_chain_free in chain fence unused as a sync (Matthew Brost)
- Refactor hw engine lookup and mmio access to be used in more places
   (Dominik, Matt Auld, Mika Kuoppala)
- Enable priority mem read for Xe2 and later (Pallavi Mishra)
- Fix PL1 disable flow in xe_hwmon_power_max_write (Karthik)
- Fix refcount and speedup devcoredump (Matthew Brost)
- Add performance tuning changes to Xe2 (Akshata, Shekhar)
- Fix OA sysfs entry (Ashutosh)
- Add first GuC firmware support for BMG (Julia)
- Bump minimum GuC firmware for platforms under force_probe to match LNL
   and BMG (Julia)
- Fix access check on user fence creation (Nirmoy)
- Add/document workarounds for Xe2 (Julia, Daniele, John, Tejas)
- Document workaround and use proper WA infra (Matt Roper)
- Fix VF configuration on media GT (Michal Wajdeczko)
- Fix VM dma-resv lock (Matthew Brost)
- Allow suspend/resume exec queue backend op to be called multiple times
   (Matthew Brost)
- Add GT stats to debugfs (Nirmoy)
- Add hwconfig to debugfs (Matt Roper)
- Compile out all debugfs code with ONFIG_DEUBG_FS=n (Lucas)
- Remove dead kunit code (Jani Nikula)
- Refactor drvdata storing to help display (Jani Nikula)
- Cleanup unsused xe parameter in pte handling (Himal)
- Rename s/enable_display/probe_display/ for clarity (Lucas)
- Fix missing MCR annotation in couple of registers (Tejas)
- Fix DGFX display suspend/resume (Maarten)
- Prepare exec_queue_kill for PXP handling (Daniele)
- Fix devm/drmm issues (Daniele, Matthew Brost)
- Fix tile and ggtt fini sequences (Matthew Brost)
- Fix crashes when probing without firmware in place (Daniele, Matthew Brost)
- Use xe_managed for kernel BOs (Daniele, Matthew Brost)
- Future-proof dss_per_group calculation by using hwconfig (Matt Roper)
- Use reserved copy engine for user binds on faulting devices
   (Matthew Brost)
- Allow mixing dma-fence jobs and long-running faulting jobs (Francois)
- Cleanup redundant arg when creating use BO (Nirmoy)
- Prevent UAF around preempt fence (Auld)
- Fix display suspend/resume (Maarten)
- Use vma_pages() helper (Thorsten)
- Calculate pagefault queue size (Stuart, Matthew Auld)
- Fix missing pagefault wq destroy (Stuart)
- Fix lifetime handling of HW fence ctx (Matthew Brost)
- Fix order destroy order for jobs (Matthew Brost)
- Fix TLB invalidation for media GT (Matthew Brost)
- Document GGTT (Rodrigo Vivi)
- Refactor GGTT layering and fix runtime outer protection (Rodrigo Vivi)
- Handle HPD polling on display pm runtime suspend/resume (Imre, Vinod)
- Drop unrequired NULL checks (Apoorva, Himal)
- Use separate rpm lockdep map for non-d3cold-capable devices (Thomas Hellström)
- Support "nomodeset" kernel command-line option (Thomas Zimmermann)
- Drop force_probe requirement for LNL and BMG (Lucas, Balasubramani)
The following changes since commit a809b92ee0f84c3f655b16a8b4d04bc3665d954a:

   Merge tag 'drm-intel-next-2024-08-13' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next (2024-08-16 12:56:42 +1000)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2024-08-28

for you to fetch changes up to 3adcf970dc7ec0469ec3116a5a8be9161d17a335:

   drm/xe/bmg: Drop force_probe requirement (2024-08-28 10:47:03 -0700)

----------------------------------------------------------------
UAPI Changes:
- Fix OA format masks which were breaking build with gcc-5

Cross-subsystem Changes:

Driver Changes:
- Use dma_fence_chain_free in chain fence unused as a sync (Matthew Brost)
- Refactor hw engine lookup and mmio access to be used in more places
   (Dominik, Matt Auld, Mika Kuoppala)
- Enable priority mem read for Xe2 and later (Pallavi Mishra)
- Fix PL1 disable flow in xe_hwmon_power_max_write (Karthik)
- Fix refcount and speedup devcoredump (Matthew Brost)
- Add performance tuning changes to Xe2 (Akshata, Shekhar)
- Fix OA sysfs entry (Ashutosh)
- Add first GuC firmware support for BMG (Julia)
- Bump minimum GuC firmware for platforms under force_probe to match LNL
   and BMG (Julia)
- Fix access check on user fence creation (Nirmoy)
- Add/document workarounds for Xe2 (Julia, Daniele, John, Tejas)
- Document workaround and use proper WA infra (Matt Roper)
- Fix VF configuration on media GT (Michal Wajdeczko)
- Fix VM dma-resv lock (Matthew Brost)
- Allow suspend/resume exec queue backend op to be called multiple times
   (Matthew Brost)
- Add GT stats to debugfs (Nirmoy)
- Add hwconfig to debugfs (Matt Roper)
- Compile out all debugfs code with ONFIG_DEUBG_FS=n (Lucas)
- Remove dead kunit code (Jani Nikula)
- Refactor drvdata storing to help display (Jani Nikula)
- Cleanup unsused xe parameter in pte handling (Himal)
- Rename s/enable_display/probe_display/ for clarity (Lucas)
- Fix missing MCR annotation in couple of registers (Tejas)
- Fix DGFX display suspend/resume (Maarten)
- Prepare exec_queue_kill for PXP handling (Daniele)
- Fix devm/drmm issues (Daniele, Matthew Brost)
- Fix tile and ggtt fini sequences (Matthew Brost)
- Fix crashes when probing without firmware in place (Daniele, Matthew Brost)
- Use xe_managed for kernel BOs (Daniele, Matthew Brost)
- Future-proof dss_per_group calculation by using hwconfig (Matt Roper)
- Use reserved copy engine for user binds on faulting devices
   (Matthew Brost)
- Allow mixing dma-fence jobs and long-running faulting jobs (Francois)
- Cleanup redundant arg when creating use BO (Nirmoy)
- Prevent UAF around preempt fence (Auld)
- Fix display suspend/resume (Maarten)
- Use vma_pages() helper (Thorsten)
- Calculate pagefault queue size (Stuart, Matthew Auld)
- Fix missing pagefault wq destroy (Stuart)
- Fix lifetime handling of HW fence ctx (Matthew Brost)
- Fix order destroy order for jobs (Matthew Brost)
- Fix TLB invalidation for media GT (Matthew Brost)
- Document GGTT (Rodrigo Vivi)
- Refactor GGTT layering and fix runtime outer protection (Rodrigo Vivi)
- Handle HPD polling on display pm runtime suspend/resume (Imre, Vinod)
- Drop unrequired NULL checks (Apoorva, Himal)
- Use separate rpm lockdep map for non-d3cold-capable devices (Thomas Hellström)
- Support "nomodeset" kernel command-line option (Thomas Zimmermann)
- Drop force_probe requirement for LNL and BMG (Lucas, Balasubramani)

----------------------------------------------------------------
Akshata Jahagirdar (1):
       drm/xe/xe2: Introduce performance changes

Apoorva Singh (1):
       drm/xe: Remove NULL check of lrc->bo in xe_lrc_snapshot_capture()

Ashutosh Dixit (1):
       drm/xe/observation: Drop empty sysctl table entry

Balasubramani Vivekanandan (1):
       drm/xe/bmg: Drop force_probe requirement

Daniele Ceraolo Spurio (5):
       drm/xe: fix WA 14018094691
       drm/xe: Make exec_queue_kill safe to call twice
       drm/xe: use devm instead of drmm for managed bo
       drm/xe/uc: Use managed bo for HuC and GSC objects
       drm/xe/uc: Use devm to register cleanup that includes exec_queues

Dominik Grzegorzek (2):
       drm/xe: Move and export xe_hw_engine lookup.
       drm/xe: Export xe_hw_engine's mmio accessors

Francois Dugast (11):
       drm/xe/hw_engine_group: Introduce xe_hw_engine_group
       drm/xe/guc_submit: Make suspend_wait interruptible
       'drm/xe/hw_engine_group: Register hw engine group's exec queues
       drm/xe/hw_engine_group: Add helper to suspend faulting LR jobs
       drm/xe/exec_queue: Remove duplicated code
       drm/xe/exec_queue: Prepare last fence for hw engine group resume context
       drm/xe/hw_engine_group: Add helper to wait for dma fence jobs
       drm/xe/hw_engine_group: Ensure safe transition between execution modes
       drm/xe/exec: Switch hw engine group execution mode upon job submission
       drm/xe/vm: Remove restriction that all VMs must be faulting if one is
       drm/xe/device: Remove unused xe_device::usm::num_vm_in_*

Himal Prasad Ghimiray (5):
       drm/xe: Remove unused xe parameter
       drm/xe: Remove extra dma_fence_put on xe_sync_entry_add_deps failure
       drm/xe: Remove unrequired NULL checks in xe_sync_entry_cleanup
       drm/xe: Remove unrequired NULL check in xe_sched_job_free_fences
       drm/xe: Fix NPD in ggtt_node_remove()

Imre Deak (2):
       drm/xe: Suspend/resume user access only during system s/r
       drm/xe: Handle polling only for system s/r in xe_display_pm_suspend/resume()

Jani Nikula (3):
       drm/xe/tests: remove unused leftover xe_call_for_each_device()
       drm/xe: use pdev_to_xe_device() instead of pci_get_drvdata() directly
       drm/xe: add kdev_to_xe_device() helper and use it

Julia Filipchuk (3):
       drm/xe/guc: Bump minimum required GuC version to v70.29.2
       drm/xe/guc: Define GuC version v70.29.2 for BMG
       drm/xe/guc: Enable w/a 14022293748 and 22019794406

Karthik Poosa (1):
       drm/xe/hwmon: Fix PL1 disable flow in xe_hwmon_power_max_write

Lucas De Marchi (4):
       drm/xe: Allow to compile out debugfs
       drm/xe: Rename enable_display module param
       Merge drm/drm-next into drm-xe-next
       drm/xe/lnl: Drop force_probe requirement

Maarten Lankhorst (2):
       drm/xe/display: Match i915 driver suspend/resume sequences better
       drm/xe/display: Make display suspend/resume work on discrete

Matt Roper (3):
       drm/xe: Name and document Wa_14019789679
       drm/xe: Add debugfs to dump GuC's hwconfig
       drm/xe/mcr: Try to derive dss_per_grp from hwconfig attributes

Matthew Auld (3):
       drm/xe: fix engine_class bounds check again
       drm/xe: prevent UAF around preempt fence
       drm/xe: fixup xe_alloc_pf_queue

Matthew Brost (24):
       drm/xe: Use dma_fence_chain_free in chain fence unused as a sync
       drm/xe: Take ref to VM in delayed snapshot
       drm/printer: Allow NULL data in devcoredump printer
       drm/xe: Faster devcoredump
       drm/xe: Only check last fence on user binds
       drm/xe: Move VM dma-resv lock from xe_exec_queue_create to __xe_exec_queue_init
       drm/xe: Add xe_sched_msg_lock/unlock helper
       drm/xe: Reinit msg link when processing a message
       drm/xe: Add xe_sched_add_msg_locked helper
       drm/xe: Only enable scheduling upon resume if needed
       drm/xe: Allow suspend / resume to be safely called multiple times
       drm/xe: Fix tile fini sequence
       drm/xe: Use for_each_remote_tile rather than manual check
       drm/xe: Use reserved copy engine for user binds on faulting devices
       drm/xe: Drop HW fence pointer to HW fence ctx
       drm/xe: Free job before xe_exec_queue_put
       drm/xe: Invalidate media_gt TLBs
       drm/xe: Invalidate media_gt TLBs in PT code
       Revert "drm/xe: Invalidate media_gt TLBs in PT code"
       drm/xe: Move ggtt_fini to devm managed
       drm/xe: Set firmware state to loadable before registering guc_fini_hw
       drm/xe: Drop warn on xe_guc_pc_gucrc_disable in guc pc fini
       drm/xe: Move hw_engine_fini to devm managed
       drm/xe: Update xe_sa to use xe_managed_bo_create_pin_map

Michal Wajdeczko (1):
       drm/xe/pf: Fix VF config validation on multi-GT platforms

Mika Kuoppala (1):
       drm/xe: Add kernel doc for xe_hw_engine_lookup

Nathan Chancellor (1):
       drm/xe: Fix total initialization in xe_ggtt_print_holes()

Nirmoy Das (9):
       drm/xe: Fix access_ok check in user_fence_create
       drm/xe/gt: Add APIs for printing stats over debugfs
       drm/xe: Add stats for tlb invalidation count
       drm/xe/migrate: Parameterize ccs and bo data clear in xe_migrate_clear()
       drm/xe: Remove redundant param from xe_bo_create_user
       drm/ttm: Add a flag to allow drivers to skip clear-on-free
       drm/xe/lnl: Offload system clear page activity to GPU
       Revert "drm/xe/lnl: Offload system clear page activity to GPU"
       Revert "drm/ttm: Add a flag to allow drivers to skip clear-on-free"

Pallavi Mishra (1):
       drm/xe/xe2: Enable Priority Mem Read

Rodrigo Vivi (12):
       drm/xe: Removed unused xe_ggtt_printk
       drm/xe: Introduce GGTT documentation
       drm/xe: Remove unnecessary drm_mm.h includes
       drm/{i915, xe}: Avoid direct inspection of dpt_vma from outside dpt
       drm/xe: Encapsulate drm_mm_node inside xe_ggtt_node
       drm/xe: Rename xe_ggtt_node related functions
       drm/xe: Limit drm_mm_node_allocated access to xe_ggtt_node
       drm/xe: Introduce xe_ggtt_largest_hole
       drm/xe: Introduce xe_ggtt_print_holes
       drm/xe: Refactor xe_ggtt balloon functions to make the node clear
       drm/xe: Make xe_ggtt_node struct independent
       drm/xe: Fix missing runtime outer protection for ggtt_remove_node

Shekhar Chauhan (1):
       drm/xe/xe2: Add performance turning changes

Stuart Summers (3):
       drm/xe: Fix missing workqueue destroy in xe_gt_pagefault
       drm/xe: Use topology to determine page fault queue size
       drm/xe/guc: Bump the G2H queue size to account for page faults

Tejas Upadhyay (4):
       drm/xe/xe2hpg: Add Wa_14021821874
       drm/xe: Move enable host l2 VRAM post MCR init
       drm/xe: Write all slices if its mcr register
       drm/xe: Define STATELESS_COMPRESSION_CTRL as mcr register

Thomas Hellström (1):
       drm/xe: Use separate rpm lockdep map for non-d3cold-capable devices

Thomas Zimmermann (1):
       drm/xe: Support 'nomodeset' kernel command-line option

Thorsten Blum (1):
       drm/xe/oa: Use vma_pages() helper function in xe_oa_mmap()

Vinod Govindapillai (1):
       drm/xe/display: handle HPD polling in display runtime suspend/resume

  Documentation/gpu/xe/xe_mm.rst                     |  15 +
  drivers/gpu/drm/drm_print.c                        |  13 +-
  drivers/gpu/drm/i915/display/intel_dpt.c           |   4 +
  drivers/gpu/drm/i915/display/intel_dpt.h           |   3 +
  drivers/gpu/drm/i915/display/skl_universal_plane.c |   3 +-
  drivers/gpu/drm/xe/Makefile                        |  18 +-
  drivers/gpu/drm/xe/abi/guc_klvs_abi.h              |   1 +
  drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h  |   7 +-
  drivers/gpu/drm/xe/display/xe_display.c            | 115 +++--
  drivers/gpu/drm/xe/display/xe_display.h            |   4 +
  drivers/gpu/drm/xe/display/xe_fb_pin.c             |  50 ++-
  drivers/gpu/drm/xe/regs/xe_engine_regs.h           |   1 +
  drivers/gpu/drm/xe/regs/xe_gt_regs.h               |  10 +-
  drivers/gpu/drm/xe/tests/xe_bo.c                   |   8 +-
  drivers/gpu/drm/xe/tests/xe_dma_buf.c              |   2 +-
  drivers/gpu/drm/xe/tests/xe_migrate.c              |  24 +-
  drivers/gpu/drm/xe/tests/xe_pci.c                  |  52 ---
  drivers/gpu/drm/xe/tests/xe_pci_test.h             |   1 -
  drivers/gpu/drm/xe/xe_bo.c                         |  26 +-
  drivers/gpu/drm/xe/xe_bo.h                         |  10 +-
  drivers/gpu/drm/xe/xe_bo_types.h                   |   5 +-
  drivers/gpu/drm/xe/xe_debugfs.h                    |   4 +
  drivers/gpu/drm/xe/xe_devcoredump.c                | 111 +++--
  drivers/gpu/drm/xe/xe_devcoredump_types.h          |   8 +
  drivers/gpu/drm/xe/xe_device.c                     |   5 +-
  drivers/gpu/drm/xe/xe_device.h                     |  15 +-
  drivers/gpu/drm/xe/xe_device_types.h               |  17 +-
  drivers/gpu/drm/xe/xe_exec.c                       |  20 +-
  drivers/gpu/drm/xe/xe_exec_queue.c                 | 237 +++++-----
  drivers/gpu/drm/xe/xe_exec_queue.h                 |   8 +-
  drivers/gpu/drm/xe/xe_exec_queue_types.h           |   4 +-
  drivers/gpu/drm/xe/xe_ggtt.c                       | 487 ++++++++++++++++-----
  drivers/gpu/drm/xe/xe_ggtt.h                       |  28 +-
  drivers/gpu/drm/xe/xe_ggtt_types.h                 |  54 ++-
  drivers/gpu/drm/xe/xe_gpu_scheduler.c              |  23 +-
  drivers/gpu/drm/xe/xe_gpu_scheduler.h              |  12 +
  drivers/gpu/drm/xe/xe_gsc.c                        |  20 +-
  drivers/gpu/drm/xe/xe_gsc_proxy.c                  |  45 +-
  drivers/gpu/drm/xe/xe_gt.c                         |  10 +-
  drivers/gpu/drm/xe/xe_gt_debugfs.c                 |  13 +
  drivers/gpu/drm/xe/xe_gt_mcr.c                     |  40 +-
  drivers/gpu/drm/xe/xe_gt_pagefault.c               |  75 +++-
  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         | 119 ++---
  drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h   |   5 +-
  drivers/gpu/drm/xe/xe_gt_sriov_vf.c                |  44 +-
  drivers/gpu/drm/xe/xe_gt_stats.c                   |  49 +++
  drivers/gpu/drm/xe/xe_gt_stats.h                   |  29 ++
  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |   2 +
  drivers/gpu/drm/xe/xe_gt_types.h                   |  24 +-
  drivers/gpu/drm/xe/xe_guc.c                        |   4 +-
  drivers/gpu/drm/xe/xe_guc.h                        |  10 +
  drivers/gpu/drm/xe/xe_guc_ads.c                    |   6 +
  drivers/gpu/drm/xe/xe_guc_ct.c                     |  12 +-
  drivers/gpu/drm/xe/xe_guc_hwconfig.c               |  97 ++++
  drivers/gpu/drm/xe/xe_guc_hwconfig.h               |   3 +
  drivers/gpu/drm/xe/xe_guc_pc.c                     |   2 +-
  drivers/gpu/drm/xe/xe_guc_submit.c                 |  62 ++-
  drivers/gpu/drm/xe/xe_huc.c                        |  19 +-
  drivers/gpu/drm/xe/xe_hw_engine.c                  | 149 +++++--
  drivers/gpu/drm/xe/xe_hw_engine.h                  |  10 +
  drivers/gpu/drm/xe/xe_hw_engine_group.c            | 372 ++++++++++++++++
  drivers/gpu/drm/xe/xe_hw_engine_group.h            |  29 ++
  drivers/gpu/drm/xe/xe_hw_engine_group_types.h      |  51 +++
  drivers/gpu/drm/xe/xe_hw_engine_types.h            |   2 +
  drivers/gpu/drm/xe/xe_hw_fence.c                   |   9 +-
  drivers/gpu/drm/xe/xe_hw_fence_types.h             |   7 +-
  drivers/gpu/drm/xe/xe_hwmon.c                      |   3 +-
  drivers/gpu/drm/xe/xe_lrc.c                        |  50 ++-
  drivers/gpu/drm/xe/xe_migrate.c                    |  29 +-
  drivers/gpu/drm/xe/xe_migrate.h                    |   9 +-
  drivers/gpu/drm/xe/xe_mmio.c                       |   4 +-
  drivers/gpu/drm/xe/xe_module.c                     |  54 ++-
  drivers/gpu/drm/xe/xe_module.h                     |   2 +-
  drivers/gpu/drm/xe/xe_oa.c                         |   3 +-
  drivers/gpu/drm/xe/xe_observation.c                |   1 -
  drivers/gpu/drm/xe/xe_pci.c                        |  12 +-
  drivers/gpu/drm/xe/xe_pm.c                         |  99 ++++-
  drivers/gpu/drm/xe/xe_pm.h                         |   1 +
  drivers/gpu/drm/xe/xe_preempt_fence.c              |   3 +-
  drivers/gpu/drm/xe/xe_preempt_fence_types.h        |   2 +
  drivers/gpu/drm/xe/xe_pt.c                         |  10 +-
  drivers/gpu/drm/xe/xe_res_cursor.h                 |   1 -
  drivers/gpu/drm/xe/xe_sa.c                         |  13 +-
  drivers/gpu/drm/xe/xe_sa_types.h                   |   1 +
  drivers/gpu/drm/xe/xe_sched_job.c                  |   6 +-
  drivers/gpu/drm/xe/xe_sync.c                       |  21 +-
  drivers/gpu/drm/xe/xe_trace.h                      |   2 +-
  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c             |   1 -
  drivers/gpu/drm/xe/xe_tuning.c                     |  13 +-
  drivers/gpu/drm/xe/xe_uc_fw.c                      |  28 +-
  drivers/gpu/drm/xe/xe_vm.c                         |  90 ++--
  drivers/gpu/drm/xe/xe_wa.c                         |   4 +
  drivers/gpu/drm/xe/xe_wa_oob.rules                 |   6 +
  include/drm/drm_print.h                            |  54 ++-
  94 files changed, 2381 insertions(+), 865 deletions(-)
  create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.c
  create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.h
  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.c
  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.h
  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group_types.h
