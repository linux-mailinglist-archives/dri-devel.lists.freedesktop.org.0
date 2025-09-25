Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F8AB9DBAC
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 08:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3958B10E84C;
	Thu, 25 Sep 2025 06:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Os6M4XdF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F3410E84C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 06:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758783121; x=1790319121;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=hVVPKxe09/o485DeSiltvBqo7HL0ajmbaqs6FqMiPOU=;
 b=Os6M4XdFiOlXWhM65KhvagcpRKHXEQlYG5z38pofC9lnY/BPMVulg9bU
 FSmgbtsw0cp3mw1cs0gG1ptYC9RsDL4Jwmn9WekwXl7a+9o0jbUmsYCN9
 Clj3c7MZtacI6UzcsvXJlhXmwekKEPg92LUS2z59m9Q0HhvLbQKmS6xK3
 g8Ct0si2jrV1UlHV6rGMo6/aqGzairRMHA51vBihB4j0D5Ux+dwzoVuMt
 tKf5YYmOcUWfONZB/gmgIB9ep/M7jyooDF9zZB+BW3X8bLxcqgmpFyKjG
 8CC4pXbdqiWPi3xNEEgy/dKvqUpxMuLgoCYcH2qwmEbg4iAkIlaQOkFhO w==;
X-CSE-ConnectionGUID: b2A+IpSgT4WtSNtqq8dwLQ==
X-CSE-MsgGUID: krrCHS/xT4GsX5Emzwyz9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60983430"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="60983430"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 23:52:00 -0700
X-CSE-ConnectionGUID: uO95aMJOQRmWGsLK0iVqrw==
X-CSE-MsgGUID: XT5+xSEVR52z1SflOce4Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="182408083"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 23:51:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 23:51:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 23:51:58 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.35) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 23:51:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rx2f5SbKTyuid9oLjimcZXg+//Hy1JWbu/T5NTDsE6mog9Krva4IkGxgCZH02vFKecp15b8ttno+uVV2I3caocJcw99F9Zw3r16dNa5UyaOlA5aKRDdYe7jXLWJ/zIbW+CECcbHrb7YZH+ZaRA2xUl2mYoDrwyQMUXBq6Qw3bjegQmGDPVDTOQ/dTQ+HW7twz9jEqcxUOf0hqX/WrhpLbLSpjT5l2h9WYlPY18POmzTrrg7jIV6kZD1zPKPR8ZO3ZUvinFds2V1kZscX6DTVzNSJU8517khXQM+c5+ywehTh2yiAfrLtt1c9sZM0+H3He4hlR8gjN8G+5JNR/yqLFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIUdq50qGVtnSUCuBs057FdBH0NkDcehhaUyTc3DS/E=;
 b=nS7TFWv8eJyvNSBvRF9+dGKVHrERgAMLczqPY+kEtGO0VUo51e9KoaJ3mj0vc+ZJQTfnGOi2rX4upMJrJNzgEYmLNB5lrTCf/0dyH4xHM4+0Gg3t9hjBaCuPo9brcjDftdQt787lYOlQ/nC7/3d3H0uZUlrpaj0JKHqM5NXYmOiaXImh7/no8M6GaBugvnWYHlVnc/RQ0j6h6OSlrpjhBVO0Nqm0UwW6l+oGYa0r0tyJs11G0bFH/7X03lo6MMzQ8/bR5BENkE5+3W839Zr22sUwkaF3Algzv5FlUJnfOFTwdi81FVL9DHUEK+Kc2595mmrmmgc++VmDsK6j+1fbRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW4PR11MB5870.namprd11.prod.outlook.com (2603:10b6:303:187::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 06:51:56 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9137.018; Thu, 25 Sep 2025
 06:51:56 +0000
Date: Thu, 25 Sep 2025 14:51:46 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Marius Vlad <marius.vlad@collabora.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
 <dri-devel@lists.freedesktop.org>, <daniel.stone@collabora.com>,
 <dmitry.baryshkov@oss.qualcomm.com>, <jani.nikula@linux.intel.com>,
 <tzimmermann@suse.de>, <simona.vetter@ffwll.ch>,
 <derek.foreman@collabora.com>, <oliver.sang@intel.com>
Subject: Re: [PATCH 1/2] drm: Introduce a new connector status
Message-ID: <202509251410.fdfbcac3-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250923083636.4749-2-marius.vlad@collabora.com>
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW4PR11MB5870:EE_
X-MS-Office365-Filtering-Correlation-Id: fce6fe19-ccf8-409c-4afa-08ddfc000470
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?909kOPp8PGQAUVtOkR6HZKiGRBAaF6XitOF31CKi7vWLwnfJOIcTY8P3SN+Q?=
 =?us-ascii?Q?ZpZmlVu21ESRYuglUI+0wYggk/CNI5MEmvtPMw9wQK7zy0NWNiVLOhm/YSA5?=
 =?us-ascii?Q?3o2sJaoKJXVnKFc4Azs9KKR8y0VyU8qHf6vHO4o6m0lIKg4qdWAm/Zt3l+KJ?=
 =?us-ascii?Q?IrqUtDJZtlyZHulk01EPGoGiqnPk0g5vn2mYzvNyRcRCY5Iuoptpbt8OSfuz?=
 =?us-ascii?Q?/0jmI+mu/MqSsyfNEnlJh6WD4/fQqg/dkvNE0bjHAWnpfN8I7rtBepML6k+x?=
 =?us-ascii?Q?8WBdA9nvwsXMfDctSqhprNEoY1lH/NP6nkQDx50DI4Dmjtn+sfxsnIgU6iTs?=
 =?us-ascii?Q?HgGfSe0F1jF5u8DcEukmg7SGzFQk6B5bVW7/bR7o49M5xTz2pDm9IR4RkDv+?=
 =?us-ascii?Q?iYI3YrCUYgMw0/W0oDoqzVMBtHcEf9LnU45KVfaiWSpOGzRoNlDh1bYXNk5x?=
 =?us-ascii?Q?tsBBxKL56SJR5Z0KSxhilIcPWV6r5dhglJgW8ZlhZm6irMW1ZreCuEbZhCES?=
 =?us-ascii?Q?YrM8GYXcNdNvit0xjJeWeIjnb45u9QG+6tvnJbfjhIww1QkRLW7Yko21b03A?=
 =?us-ascii?Q?0IEeeNcrvWoXTUAXqPxYpNLXlBqqCjF4iYKpljaJW1Zy6TNWT8aUxKBBULrH?=
 =?us-ascii?Q?41xkcjNr+7otwDD3RCqbd3Q85gKeEWGiPAlZrdda4t0+HroU2b69RpTUntHI?=
 =?us-ascii?Q?FLmRoEoRcxUfHAAAtLjnbUVWjRxP6e2ECB3zGKfoMksGZ92R0Q/R+uSALz6X?=
 =?us-ascii?Q?Yjfg93G6RVB+MdsiZPZK8tFcK8ikPZaowTCvrQuKnzrBAvcSmI/Q20uhoA1m?=
 =?us-ascii?Q?clza+GDd8WnTelpp1oXoL/E71L/IEoPJaoiQzbO5W9ewhLsXD18nW7r4GJb3?=
 =?us-ascii?Q?phivsqYhe+eXkA/maTA4LMJLHHE102Y0ZmCXISHSi6xzB1eIzOMHVhIn597s?=
 =?us-ascii?Q?yvumVpAjEqwPtYf0RSzUqhZ2I1eg6S9+KFzk5LVIWrswxc1uMq4RK7ceceEn?=
 =?us-ascii?Q?5KykW/ANv148hE+uI3O9U+WAyUJhUAymuLhONCQCYOsABCgxHuVFM9l9pPkj?=
 =?us-ascii?Q?gBdxjyuKvhzjTEzvAGH0rV96rjRoVbAsVI8vEsYJAPRgu1EebiEdFAu1jrhc?=
 =?us-ascii?Q?lVNwKl9UFE/Q3Ucu5lmEOsStzqfXxTgb0/0pS2LadbwEqLya3xKwvGQ5tR+q?=
 =?us-ascii?Q?T/7vWd3EVsTF5YhnQ5nqfg0KUvvm09i1oOv+NlXNsYQx9jwJlJqTZLONTxty?=
 =?us-ascii?Q?e4sOosrkkXm8fUvQtHKzW+WCWJGR3EB9xivMFfU34hCCt//DfILNhi0LFHVv?=
 =?us-ascii?Q?hq7Zz7UgWbFqoRamXJGb8ufJB13lT8A//5QbFMkkVicXChG22xMD5bA0sFeb?=
 =?us-ascii?Q?IAP5tXszMQZRd99rC6JJqbaaTs7cl1qXoE4q9Zwcq6Ila4y/bQyuMSwht3RT?=
 =?us-ascii?Q?7h+lSz3EPk4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NhMhnCWDWAN0/0vcaF+APdiW3hV8RTLMX5x3fSPyiWKWVlkSSNZjppmKK9Ba?=
 =?us-ascii?Q?GHnE6FpfyXi9WFkn1rI75JqTa43cwjU8dukBte3qP+P/saxpUS4KzPv9KxU4?=
 =?us-ascii?Q?qhdESR+NENrZSPzDw/KighAwwVeOseAxvQOnUv7c2HzCyZ3sMQA6W6LPAibU?=
 =?us-ascii?Q?LbMBFmLMctwxOhuhVuBfZEVLpdifLGlULHnAqMeeLB8+mMw2D3j314gm59oL?=
 =?us-ascii?Q?+JiuQXDDHqWc15JJeJIoh9WSTT0PrkYl+W8IiA4564ntGwN3m5Gb1tAeAQ3R?=
 =?us-ascii?Q?Vv2dhZJwIwt/sYbtD8I2ncDaTfN0Lx355XgROIFViV2oGTVPWmfz+qMK5gUi?=
 =?us-ascii?Q?4RxTHhjFExDyKjuEfx4DFzPj9GGgQHPk7tujg7Jrhs+EpVWSPmTpTfZ5yXSz?=
 =?us-ascii?Q?3rCg0izOF91Xh432CrNuhJu6HMXTuAWlaBX3xCZWkJp3I7AW4S0abCHtqi+j?=
 =?us-ascii?Q?4lmNp3DPxdA5W+ulbm7Q5tzCnm2mS/FdsiUmU1aQvfe7YMolmFsoGrfFvnlI?=
 =?us-ascii?Q?OXDvjqUq92bHF/UwU3wIvpnTIjuNcqAXamsiNjMrNvfbvcx/wNQWzK/ab7tl?=
 =?us-ascii?Q?4+rV9cx1gx5ouBBkYpC6Pc5MoLVTRfiig0SDYu0l3m2bSEC9x3VMLsm0Oqiy?=
 =?us-ascii?Q?GXkz28tYkRin+tWzJaf9+Ca5NrnmrnxWaEXrfU9SW37nFNHmdDoqfapqzrgu?=
 =?us-ascii?Q?Zg6TuOWx7hQnMd4UYk6MSY+6XNoNPbSZDyeb3avMKEha9M3McM+WFGTCnlT4?=
 =?us-ascii?Q?tBYBZFJNPE6S/9Xw05/O4thlzCGYA62NdeU/DGD/aDyRtODRTZ9gjFTGnALO?=
 =?us-ascii?Q?yx6uPAO2j75jkpwmj+Ds9m8VqpG/g4o+mRfiObM9+YM43G96QM+69+lll840?=
 =?us-ascii?Q?0/vnOtJq+mw68kEHYu9KHo5WgxAVu4vrPMXRSvPNZtV5d+XBWyO82ukjwbWg?=
 =?us-ascii?Q?i+zEwk3ZKth2PIuOShtlv7R42xCVsP8VkcUPzmHVa5yYgPH7/Drnrq/HhVGL?=
 =?us-ascii?Q?XUbWmaizJDwTuAxsaI2ugPhODbPPXtEdv1CoQOrvXUxAlNY0esHjH4OX0LP9?=
 =?us-ascii?Q?Lynec3v0W2K89i6EVBQ2rZ37+2/C2FXsNhRLnWDK/AdnHAEo8xoTefgksHHp?=
 =?us-ascii?Q?J0hX9SWuO5FOixNg2y4AAd5yB1O/Kcd9AmFc8mf9qs/uRDc2uuO3du8Vlkq8?=
 =?us-ascii?Q?ugJFd9fYkuwS6LvXqdeFSoHgjzkwiLmww0k41VoFNVcRdTWj4/IRsKLAbcoW?=
 =?us-ascii?Q?TDN1uSQIl9TMxefvcaVG6xj9UdCDpw0+b8ej3U+A7aWOpGW5hvQ64poXvKJn?=
 =?us-ascii?Q?5nbJ+YMhnCV1/012MwS3ro8nmPXoxhnBXlgZ/g2dduHyOeRIRaIlbwoR/Nvg?=
 =?us-ascii?Q?ihzaZRCduRL5WNB2Wla9t18ct0vcAaGgStvr/TeqvN8HUdIgdI0qOBADPnZQ?=
 =?us-ascii?Q?7cD9gulr5I706jBj7FdELL5Po1GVjCkcQr24K8SjbFFZrf8zlrGOBJFnf4Q2?=
 =?us-ascii?Q?lT2EIYNUPZYuHLwego0aafCnDNvrv6FxwvflFaDgzDX4+GP6Ck213KFCOaNc?=
 =?us-ascii?Q?0lryLnixOYZAAKMAo8h7IPmhL4CU4CvgYM1wwV6oUfLEusDj56xQd4ghUzw4?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fce6fe19-ccf8-409c-4afa-08ddfc000470
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 06:51:56.2745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oGj134dc1sdnpT9S/P66tbioy8OBMMZbVpilyxqDSX4X9z8iFRP2ude6nB9GxRweQbT8cJHuzf4l3lwsQbjC6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5870
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

kernel test robot noticed "WARNING:possible_recursive_locking_detected" on:

commit: 432c7653afa4afe08e59d608db7cbbc321c52149 ("[PATCH 1/2] drm: Introduce a new connector status")
url: https://github.com/intel-lab-lkp/linux/commits/Marius-Vlad/drm-Introduce-a-new-connector-status/20250923-163922
base: git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link: https://lore.kernel.org/all/20250923083636.4749-2-marius.vlad@collabora.com/
patch subject: [PATCH 1/2] drm: Introduce a new connector status

in testcase: boot

config: x86_64-randconfig-074-20250924
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202509251410.fdfbcac3-lkp@intel.com


[   19.416092][    T1] WARNING: possible recursive locking detected
[   19.416406][    T1] 6.17.0-rc2-00290-g432c7653afa4 #1 Not tainted
[   19.416406][    T1] --------------------------------------------
[   19.416406][    T1] swapper/0/1 is trying to acquire lock:
[ 19.416406][ T1] ffff88813b9c84d0 (&dev->mode_config.mutex){+.+.}-{4:4}, at: drm_helper_probe_single_connector_modes (drivers/gpu/drm/drm_probe_helper.c:633) 
[   19.416406][    T1]
[   19.416406][    T1] but task is already holding lock:
[ 19.416406][ T1] ffff88813b9c84d0 (&dev->mode_config.mutex){+.+.}-{4:4}, at: drm_client_modeset_probe (drivers/gpu/drm/drm_client_modeset.c:869) 
[   19.416406][    T1]
[   19.416406][    T1] other info that might help us debug this:
[   19.416406][    T1]  Possible unsafe locking scenario:
[   19.416406][    T1]
[   19.416406][    T1]        CPU0
[   19.416406][    T1]        ----
[   19.416406][    T1]   lock(&dev->mode_config.mutex);
[   19.416406][    T1]
[   19.416406][    T1]  *** DEADLOCK ***
[   19.416406][    T1]
[   19.416406][    T1]  May be due to missing lock nesting notation
[   19.416406][    T1]
[   19.416406][    T1] 6 locks held by swapper/0/1:
[ 19.416406][ T1] #0: ffff88813b9c8320 (&dev->clientlist_mutex){+.+.}-{4:4}, at: drm_client_register (include/linux/list.h:169 drivers/gpu/drm/drm_client.c:128) 
[ 19.416406][ T1] #1: ffff888108a882a0 (&helper->lock){+.+.}-{4:4}, at: drm_fb_helper_initial_config (drivers/gpu/drm/drm_fb_helper.c:1917) 
[ 19.416406][ T1] #2: ffff888108a88098 (&client->modeset_mutex){+.+.}-{4:4}, at: drm_client_modeset_probe (drivers/gpu/drm/drm_client_modeset.c:867) 
[ 19.416406][ T1] #3: ffff88813b9c84d0 (&dev->mode_config.mutex){+.+.}-{4:4}, at: drm_client_modeset_probe (drivers/gpu/drm/drm_client_modeset.c:869) 
[ 19.416406][ T1] #4: ffffc9000001fa78 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_helper_probe_single_connector_modes (drivers/gpu/drm/drm_probe_helper.c:572) 
[ 19.416406][ T1] #5: ffffc9000001faa8 (crtc_ww_class_mutex){+.+.}-{4:4}, at: drm_helper_probe_single_connector_modes (drivers/gpu/drm/drm_probe_helper.c:572) 
[   19.416406][    T1]
[   19.416406][    T1] stack backtrace:
[   19.416406][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-rc2-00290-g432c7653afa4 #1 PREEMPT(none)
[   19.416406][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   19.416406][    T1] Call Trace:
[   19.416406][    T1]  <TASK>
[ 19.416406][ T1] dump_stack_lvl (lib/dump_stack.c:122) 
[ 19.416406][ T1] print_deadlock_bug.cold (kernel/locking/lockdep.c:3044) 
[ 19.416406][ T1] validate_chain (kernel/locking/lockdep.c:3898) 
[ 19.416406][ T1] __lock_acquire (kernel/locking/lockdep.c:5237 (discriminator 1)) 
[ 19.416406][ T1] lock_acquire (kernel/locking/lockdep.c:470 kernel/locking/lockdep.c:5870) 
[ 19.416406][ T1] ? drm_helper_probe_single_connector_modes (drivers/gpu/drm/drm_probe_helper.c:633) 
[ 19.416406][ T1] ? sched_show_task (kernel/sched/core.c:8912) 
[ 19.416406][ T1] ? look_up_lock_class (kernel/locking/lockdep.c:933 (discriminator 28)) 
[ 19.416406][ T1] __mutex_lock (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/jump_label.h:262 include/trace/events/lock.h:95 kernel/locking/mutex.c:600 kernel/locking/mutex.c:760) 
[ 19.416406][ T1] ? drm_helper_probe_single_connector_modes (drivers/gpu/drm/drm_probe_helper.c:633) 
[ 19.416406][ T1] ? look_up_lock_class (kernel/locking/lockdep.c:933 (discriminator 28)) 
[ 19.416406][ T1] ? mutex_lock_io_nested (kernel/locking/mutex.c:759) 
[ 19.416406][ T1] ? drm_print_bits (drivers/gpu/drm/drm_print.c:334) 
[ 19.416406][ T1] ? ww_mutex_lock (kernel/locking/mutex.c:887) 
[ 19.416406][ T1] ? drm_helper_probe_single_connector_modes (drivers/gpu/drm/drm_probe_helper.c:633) 
[ 19.416406][ T1] drm_helper_probe_single_connector_modes (drivers/gpu/drm/drm_probe_helper.c:633) 
[ 19.416406][ T1] ? __drm_helper_update_and_validate (drivers/gpu/drm/drm_probe_helper.c:561) 
[ 19.416406][ T1] ? __kmalloc_noprof (include/trace/events/kmem.h:54 (discriminator 2) mm/slub.c:4366 (discriminator 2) mm/slub.c:4377 (discriminator 2)) 
[ 19.416406][ T1] drm_client_modeset_probe (drivers/gpu/drm/drm_client_modeset.c:869 (discriminator 1)) 
[ 19.416406][ T1] ? drm_client_firmware_config (drivers/gpu/drm/drm_client_modeset.c:818) 
[ 19.416406][ T1] __drm_fb_helper_initial_config_and_unlock (drivers/gpu/drm/drm_fb_helper.c:1830) 
[ 19.416406][ T1] drm_fbdev_client_hotplug (drivers/gpu/drm/clients/drm_fbdev_client.c:53) 
[ 19.416406][ T1] drm_client_register (drivers/gpu/drm/drm_client.c:141) 
[ 19.416406][ T1] drm_fbdev_client_setup (drivers/gpu/drm/clients/drm_fbdev_client.c:167) 
[ 19.416406][ T1] drm_client_setup (drivers/gpu/drm/clients/drm_client_setup.c:47) 
[ 19.416406][ T1] vkms_create (drivers/gpu/drm/vkms/vkms_drv.c:203) 
[ 19.416406][ T1] ? drm_display_helper_module_init (drivers/gpu/drm/vkms/vkms_drv.c:213) 
[ 19.416406][ T1] vkms_init (drivers/gpu/drm/vkms/vkms_drv.c:221) 
[ 19.416406][ T1] do_one_initcall (init/main.c:1269) 
[ 19.416406][ T1] ? trace_event_raw_event_initcall_level (init/main.c:1260) 
[ 19.416406][ T1] do_initcalls (init/main.c:1330 (discriminator 3) init/main.c:1347 (discriminator 3)) 
[ 19.416406][ T1] kernel_init_freeable (init/main.c:1583) 
[ 19.416406][ T1] ? rest_init (init/main.c:1461) 
[ 19.416406][ T1] kernel_init (init/main.c:1471) 
[ 19.416406][ T1] ? rest_init (init/main.c:1461) 
[ 19.416406][ T1] ret_from_fork (arch/x86/kernel/process.c:154) 
[ 19.416406][ T1] ? rest_init (init/main.c:1461) 
[ 19.416406][ T1] ret_from_fork_asm (arch/x86/entry/entry_64.S:255) 
[   19.416406][    T1]  </TASK>
[  984.236393][   T23] INFO: task swapper/0:1 blocked for more than 491 seconds.
[  984.237354][   T23]       Not tainted 6.17.0-rc2-00290-g432c7653afa4 #1
[  984.238322][   T23] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  984.239375][   T23] task:swapper/0       state:D stack:0     pid:1     tgid:1     ppid:0      task_flags:0x0140 flags:0x00004000
[  984.240834][   T23] Call Trace:
[  984.241228][   T23]  <TASK>
[ 984.241634][ T23] __schedule (kernel/sched/core.c:5357 kernel/sched/core.c:6961) 
[ 984.242202][ T23] ? io_schedule_timeout (kernel/sched/core.c:6817) 
[ 984.242846][ T23] ? lock_acquire (include/trace/events/lock.h:24 (discriminator 2) kernel/locking/lockdep.c:5831 (discriminator 2)) 
[ 984.243441][ T23] schedule (kernel/sched/core.c:7044 kernel/sched/core.c:7058) 
[ 984.243975][ T23] schedule_preempt_disabled (kernel/sched/core.c:7116) 
[ 984.244639][ T23] __mutex_lock (kernel/locking/mutex.c:183 kernel/locking/mutex.c:678 kernel/locking/mutex.c:760) 
[ 984.245258][ T23] ? drm_helper_probe_single_connector_modes (drivers/gpu/drm/drm_probe_helper.c:633) 
[ 984.246160][ T23] ? mutex_lock_io_nested (kernel/locking/mutex.c:759) 
[ 984.246876][ T23] ? drm_print_bits (drivers/gpu/drm/drm_print.c:334) 
[ 984.247486][ T23] ? ww_mutex_lock (kernel/locking/mutex.c:887) 
[ 984.248132][ T23] ? ww_mutex_lock (kernel/locking/mutex.c:887) 
[ 984.248681][ T23] ? drm_helper_probe_single_connector_modes (drivers/gpu/drm/drm_probe_helper.c:633) 
[ 984.249557][ T23] drm_helper_probe_single_connector_modes (drivers/gpu/drm/drm_probe_helper.c:633) 
[ 984.250457][ T23] ? __drm_helper_update_and_validate (drivers/gpu/drm/drm_probe_helper.c:561) 
[ 984.251275][ T23] ? __kmalloc_noprof (include/trace/events/kmem.h:54 (discriminator 2) mm/slub.c:4366 (discriminator 2) mm/slub.c:4377 (discriminator 2)) 
[ 984.251990][ T23] drm_client_modeset_probe (drivers/gpu/drm/drm_client_modeset.c:869 (discriminator 1)) 
[ 984.252659][ T23] ? drm_client_firmware_config (drivers/gpu/drm/drm_client_modeset.c:818) 
[ 984.253433][ T23] __drm_fb_helper_initial_config_and_unlock (drivers/gpu/drm/drm_fb_helper.c:1830) 
[ 984.254309][ T23] drm_fbdev_client_hotplug (drivers/gpu/drm/clients/drm_fbdev_client.c:53) 
[ 984.255079][ T23] drm_client_register (drivers/gpu/drm/drm_client.c:141) 
[ 984.255737][ T23] drm_fbdev_client_setup (drivers/gpu/drm/clients/drm_fbdev_client.c:167) 
[ 984.256474][ T23] drm_client_setup (drivers/gpu/drm/clients/drm_client_setup.c:47) 
[ 984.257080][ T23] vkms_create (drivers/gpu/drm/vkms/vkms_drv.c:203) 
[ 984.257646][ T23] ? drm_display_helper_module_init (drivers/gpu/drm/vkms/vkms_drv.c:213) 
[ 984.258477][ T23] vkms_init (drivers/gpu/drm/vkms/vkms_drv.c:221) 
[ 984.258979][ T23] do_one_initcall (init/main.c:1269) 
[ 984.259580][ T23] ? trace_event_raw_event_initcall_level (init/main.c:1260) 
[ 984.260457][ T23] do_initcalls (init/main.c:1330 (discriminator 3) init/main.c:1347 (discriminator 3)) 
[ 984.261031][ T23] kernel_init_freeable (init/main.c:1583) 
[ 984.261730][ T23] ? rest_init (init/main.c:1461) 
[ 984.262250][ T23] kernel_init (init/main.c:1471) 
[ 984.262775][ T23] ? rest_init (init/main.c:1461) 
[ 984.263366][ T23] ret_from_fork (arch/x86/kernel/process.c:154) 
[ 984.263966][ T23] ? rest_init (init/main.c:1461) 
[ 984.264445][ T23] ret_from_fork_asm (arch/x86/entry/entry_64.S:255) 
[  984.265087][   T23]  </TASK>
[  984.265460][   T23] INFO: task swapper/0:1 is blocked on a mutex likely owned by task swapper/0:1.
[  984.266569][   T23] task:swapper/0       state:D stack:0     pid:1     tgid:1     ppid:0      task_flags:0x0140 flags:0x00004000
[  984.267995][   T23] Call Trace:
[  984.268440][   T23]  <TASK>
[ 984.268818][ T23] __schedule (kernel/sched/core.c:5357 kernel/sched/core.c:6961) 
[ 984.269392][ T23] ? io_schedule_timeout (kernel/sched/core.c:6817) 
[ 984.270076][ T23] ? lock_acquire (include/trace/events/lock.h:24 (discriminator 2) kernel/locking/lockdep.c:5831 (discriminator 2)) 
[ 984.270650][ T23] schedule (kernel/sched/core.c:7044 kernel/sched/core.c:7058) 
[ 984.271187][ T23] schedule_preempt_disabled (kernel/sched/core.c:7116) 
[ 984.271938][ T23] __mutex_lock (kernel/locking/mutex.c:183 kernel/locking/mutex.c:678 kernel/locking/mutex.c:760) 
[ 984.272512][ T23] ? drm_helper_probe_single_connector_modes (drivers/gpu/drm/drm_probe_helper.c:633) 
[ 984.273417][ T23] ? mutex_lock_io_nested (kernel/locking/mutex.c:759) 
[ 984.274100][ T23] ? drm_print_bits (drivers/gpu/drm/drm_print.c:334) 
[ 984.274700][ T23] ? ww_mutex_lock (kernel/locking/mutex.c:887) 
[ 984.275321][ T23] ? ww_mutex_lock (kernel/locking/mutex.c:887) 
[ 984.275900][ T23] ? drm_helper_probe_single_connector_modes (drivers/gpu/drm/drm_probe_helper.c:633) 
[ 984.276788][ T23] drm_helper_probe_single_connector_modes (drivers/gpu/drm/drm_probe_helper.c:633) 
[ 984.277636][ T23] ? __drm_helper_update_and_validate (drivers/gpu/drm/drm_probe_helper.c:561) 
[ 984.278471][ T23] ? __kmalloc_noprof (include/trace/events/kmem.h:54 (discriminator 2) mm/slub.c:4366 (discriminator 2) mm/slub.c:4377 (discriminator 2)) 
[ 984.279094][ T23] drm_client_modeset_probe (drivers/gpu/drm/drm_client_modeset.c:869 (discriminator 1)) 
[ 984.279852][ T23] ? drm_client_firmware_config (drivers/gpu/drm/drm_client_modeset.c:818) 
[ 984.280602][ T23] __drm_fb_helper_initial_config_and_unlock (drivers/gpu/drm/drm_fb_helper.c:1830) 
[ 984.281537][ T23] drm_fbdev_client_hotplug (drivers/gpu/drm/clients/drm_fbdev_client.c:53) 
[ 984.282238][ T23] drm_client_register (drivers/gpu/drm/drm_client.c:141) 
[ 984.282887][ T23] drm_fbdev_client_setup (drivers/gpu/drm/clients/drm_fbdev_client.c:167) 
[ 984.283611][ T23] drm_client_setup (drivers/gpu/drm/clients/drm_client_setup.c:47) 
[ 984.284232][ T23] vkms_create (drivers/gpu/drm/vkms/vkms_drv.c:203) 
[ 984.284846][ T23] ? drm_display_helper_module_init (drivers/gpu/drm/vkms/vkms_drv.c:213) 
[ 984.285609][ T23] vkms_init (drivers/gpu/drm/vkms/vkms_drv.c:221) 
[ 984.286136][ T23] do_one_initcall (init/main.c:1269) 
[ 984.286773][ T23] ? trace_event_raw_event_initcall_level (init/main.c:1260) 
[ 984.287581][ T23] do_initcalls (init/main.c:1330 (discriminator 3) init/main.c:1347 (discriminator 3)) 
[ 984.288212][ T23] kernel_init_freeable (init/main.c:1583) 
[ 984.288856][ T23] ? rest_init (init/main.c:1461) 
[ 984.289412][ T23] kernel_init (init/main.c:1471) 
[ 984.289983][ T23] ? rest_init (init/main.c:1461) 
[ 984.290537][ T23] ret_from_fork (arch/x86/kernel/process.c:154) 
[ 984.291124][ T23] ? rest_init (init/main.c:1461) 
[ 984.291735][ T23] ret_from_fork_asm (arch/x86/entry/entry_64.S:255) 
[  984.292371][   T23]  </TASK>
[  984.292826][   T23] INFO: lockdep is turned off.
[ 1045.677903][    C0] BUG: workqueue lockup - pool cpus=0 node=0 flags=0x0 nice=0 stuck for 59s!
[ 1045.680667][    C0] Showing busy workqueues and worker pools:
[ 1045.684192][    C0] workqueue events_power_efficient: flags=0x80
[ 1045.684971][    C0]   pwq 2: cpus=0 node=0 flags=0x0 nice=0 active=3 refcnt=4
[ 1045.684987][    C0]     pending: neigh_managed_work, neigh_periodic_work, do_cache_clean
[ 1045.685083][    C0] Showing backtraces of running workers in stalled CPU-bound worker pools:
[ 1076.396346][    C0] BUG: workqueue lockup - pool cpus=0 node=0 flags=0x0 nice=0 stuck for 89s!
[ 1076.400410][    C0] Showing busy workqueues and worker pools:
[ 1076.401145][    C0] workqueue events: flags=0x0
[ 1076.401765][    C0]   pwq 2: cpus=0 node=0 flags=0x0 nice=0 active=1 refcnt=2
[ 1076.401781][    C0]     pending: stop_one_cpu_nowait_workfn
[ 1076.401795][    C0] workqueue events_power_efficient: flags=0x80
[ 1076.404125][    C0]   pwq 2: cpus=0 node=0 flags=0x0 nice=0 active=3 refcnt=4
[ 1076.404141][    C0]     pending: neigh_managed_work, neigh_periodic_work, do_cache_clean
[ 1076.411517][    C0] Showing backtraces of running workers in stalled CPU-bound worker pools:



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250925/202509251410.fdfbcac3-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

