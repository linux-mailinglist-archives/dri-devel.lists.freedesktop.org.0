Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF5FAE716D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 23:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A0510E153;
	Tue, 24 Jun 2025 21:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m81cXcJi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF2710E14E;
 Tue, 24 Jun 2025 21:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750799679; x=1782335679;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Rz5Bpd3GzQkfxFLYVACQL0CzO1fVuiE25H1CGfbK7Wg=;
 b=m81cXcJialnc3UHIU4x6AOQ0KHHoDYtmVZYdiEnUCIuFKxOfWyugfsIt
 ckmjS9TZQ+XJYNMKgu0BX13RRDlkak/10MQdyXd63j/MVlF1HPvfIPBO2
 Yz4J2NHgK+si+bOlTx4v7PVkBIXsWbVODYk+AzSsV0IBRlakjqEso/2Kt
 D1IKK14/wuTOohNNcKsQXnwk2lGvPeGD+bVLpqDE6sage/EQvzZw/jtH9
 7aS2MXIQJv9zEvSyP4pBv5X1BqwO+5P8yd/puX4BYthRpeNmRZK3zrSwW
 RRqGPuQOOWzOa4a/uVQ6E+d8Svjl0pcqzQoJ5it1cs1Ikjr+59MmLwhF9 w==;
X-CSE-ConnectionGUID: jlJHQmWASl+s0t6E2AOXcw==
X-CSE-MsgGUID: 8Ycv6VmTSvOsf29C6r0gXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="64113533"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="64113533"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 14:14:38 -0700
X-CSE-ConnectionGUID: SpQV0TkkRNaI4As3GABPQg==
X-CSE-MsgGUID: ZLUZ5LoPQuSm80mryafG9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="156311177"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 14:14:37 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 14:14:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 14:14:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.80) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 14:14:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OW+d6zrCBx7jWJt4t+P/X36WE7PuGUME1eX+yGYRzdlinCAgDlz0h/E7kXC7PuPTlE7dJTVtby0mSTa9O1EdKskkqauGhPGSjT8f/WHW3EHRdsT/cBHsIWfWJSv+DKmEFXtE/0O0sYlWeukF6AoNxyl/GeaCwZLVe8pZtQs5xSem5ZOLdtiMovzW5c2kW2rrIjL/7VooK9Tz4BOt9n4K5sn5q68K4UQPrR4ROnwEHC2bKRiLrZbzsvw3vs4w5N8eyrB+6P3+xdbYbZNDMLoHE4LWIWojHXqK/FvPYJSbs3xZgKuLVt8WzVqTwadt57kyMGOUQNSUkOrQo4qybgPSUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPO6Ub8e+5KvNGw4o4bQrAUhIVqkUA8dS6BljmwIGaM=;
 b=xC5ZbOyeTftKtB1L6VgW27bB7oHGkyaecOcSm1mp5TSbXqGZlwBQRR2VIZM04tqmH4KfmJ6l0lrAx9OQDpwrbHIhJUWqnQwg9tY1YiPewic8rM/VgXAl89VRoojKObpx9kf6+zQKSGo3ubmcYm938nmLcLb8L4pIMwdr+5g7hAtB+hNqF/r37KGqpaLQjccVPxIcyzwOwEPM4QkuQ8VkHmknJCFkkaDnHkktrGKPzvERoVdJgfn5AjaKXSN4gLaY2dHsZElddWb1XuQNAbo698thUn/cVGuMIoWBmAoyxiZWj8rVq9ZJUj8Aba3IKo4vh7BgCUSJuI2Hm9rl2CsuSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB6292.namprd11.prod.outlook.com (2603:10b6:208:3e4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 21:14:30 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 21:14:30 +0000
Date: Tue, 24 Jun 2025 17:14:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Arnd
 Bergmann" <arnd@arndb.de>, Nitin Gote <nitin.r.gote@intel.com>, "Chaitanya
 Kumar Borah" <chaitanya.kumar.borah@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 renjun wang <renjunw0@foxmail.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/i915: reduce stack usage in igt_vma_pin1()
Message-ID: <aFsVMcb79rp8kMpF@intel.com>
References: <20250620113644.3844552-1-arnd@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250620113644.3844552-1-arnd@kernel.org>
X-ClientProxiedBy: SJ0PR13CA0223.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::18) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: 02cda4ee-5c12-4976-14b6-08ddb3641ba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Dll5FNWzXHIVIU+n+aFhBffgPy2AYHG4+zh+psjDumm1EFM1dtmjUkbq2B0j?=
 =?us-ascii?Q?LATgt3CyoBuVIf8cdpw0ztgfaHkKdhHPUgj2RU9s9+AcwphR2tAMm33lF9i+?=
 =?us-ascii?Q?hJwX0pC91Lu8yI5sYreOURviV5OUeV3RHT4bI9f1ObkDEZfyCD+z0nW2kob3?=
 =?us-ascii?Q?rD5OtQvNGTP8elLPvwtuzFlsPaRtYa7sanBpJXFni1/U57HWZmd4JDlLFMtN?=
 =?us-ascii?Q?NSaQNGg+ImFg9T9RzI3tyGQuQXnuUvPC/N3ohDQO2JH5TkHMdzuG45TIIu6L?=
 =?us-ascii?Q?jS7s3tFKg0PXAVwOg9q7drZN5pWhj1e8lIw5iZTXFP9S1m70wokhnxgIO0XV?=
 =?us-ascii?Q?pnTvB0X3fFMhrRBVS9KV64tXrO7MYS9YUBI2OMgpDYsaxb4u+AHc1YR1l8bC?=
 =?us-ascii?Q?mJ8G6ei92hmRytH6bhDeT7bR6aLAO+7ARDMuXztT19Ydf7zfw6gv3jA5jVDQ?=
 =?us-ascii?Q?JR9fu7HQsLTRBOeIiDPFEVQBoxVvnIgu2DnBH+jBQFoS793Q8nTjayqd6KMi?=
 =?us-ascii?Q?VJwgmbxHq3zQHPWf6Pea5gu3vfoJTxljHGjMitfJxyIZtCkdSe1SzYhLjQsB?=
 =?us-ascii?Q?zvlqozq5lspsD3JcpjnTBPIKn+8njISwfUyRuSdWtqrJcS6L6xQw7b25k3hq?=
 =?us-ascii?Q?kuSOsXr3/0ebEoazkvCJVEfDk1Jbq8RbtHC7Z0pIeBx1A44WStOsT1TXb+Um?=
 =?us-ascii?Q?xbyrN9RnHEfIt3AgCZPgZiL7GcSojxEzKuf8ytvZbCPsXdr4HiPrcUBvrtUS?=
 =?us-ascii?Q?l1z2CMKTJLIp554RccP6Tip4YtN8HHjmmmDUsdgw/NY7BBWtOPIIz8leXvVh?=
 =?us-ascii?Q?04VINDAz7L88MxePQ9PDPbjKa0Gb1hsZn2H9LBktJbrCg7e1HLhb+88C95pD?=
 =?us-ascii?Q?8sWzyOqAwujq+JFwirDgklppKY5KjQMjef23FDPwxvyuc9iAJsRYELeLzW6r?=
 =?us-ascii?Q?EB91lrUI5FcmDxR+c/KOk122syEL2Uqbf0V7oo06rTvo2wR5LpkBsjj4xren?=
 =?us-ascii?Q?SEYX7yZ83e38BRZApcqe6Ew9mv8vMHafye/2Zppbr9CX5/yvMJ4tYNLMMlzC?=
 =?us-ascii?Q?ezPI3EF8I3K+UsLeS1aNaMp1PMoo6LRoHS9xQWk2ESIfwswQ25ayywiGbLuj?=
 =?us-ascii?Q?ZyB0LebJrzq/IGZNFP8REdz0Dfjt2eYc6eBCIEgtGjnxG33G9vhAH7jk2SKQ?=
 =?us-ascii?Q?Drj1xp/bqid0gStI9O7WQF7An3QEWwvBuOrrzNtmQhDLBCn3WbhsX3Iz6kDL?=
 =?us-ascii?Q?gCb4nKZszcTHfRR5Xg7aCBL/bRRBJup+dyEVt3UB7dgtYUxWwag+CPPHRCYI?=
 =?us-ascii?Q?EQt1ejEJmh1VSpR/MJdlOdZJ+e9YnTzwAAtHtsBVV9OLVHV0g9q25psL0P1j?=
 =?us-ascii?Q?zNNDa+ptvLj9trskGElXVM+htPkiSO5m11B+ahN6l17L0CTMn2N276n2Jf+V?=
 =?us-ascii?Q?i8UV4plRs88=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NyY0VhS9GF8QzI/ekmpaJJ/zdRD5aRmGEA87YtvXQImpDmlDOhhuloqYGspN?=
 =?us-ascii?Q?CZvsUntMCB/ejfH5/nC4Lbh9+ksnEEReFr2SJZEk90kt5ARVIhffpQMPab21?=
 =?us-ascii?Q?/J3bJpqRTYdfrJUNqdhzd3Aa0X2xZQszUqvkK4LnoIo8EY9HrUXtXy5i+mOq?=
 =?us-ascii?Q?uTKFyKvCvJjU6vPAjZgBF28RBM9eCwYqEaBYTuIGkJAhMgZJUTKct5FkMDWl?=
 =?us-ascii?Q?sskxyqL0NjLVk840DFP5Jp0h93JT8Tc+2OIThLOSmYMobDB1Y9FpBhK9pD0c?=
 =?us-ascii?Q?wtNlddvesVrd2HGKtZHwOioGyJfbk95kqBCvwLCuXMQVKbVP5X6+vPKSWbLO?=
 =?us-ascii?Q?BOZkqZ8Ex6471x0bESm2UIaqMNKfYMRYLAWVRJvQcNrEq5ME2vciGwj0//Q+?=
 =?us-ascii?Q?B23rdb4kcoHiqV3ScVEE6mWnFCnoRV6y+fbDCuJ6WavX5jvLA6b9GyhAHfmK?=
 =?us-ascii?Q?N4WDKiXjfXXKHoWQz+QgySQex0RdZpebzvS+BAZaAaHtCmN3GQDt/+Qufig6?=
 =?us-ascii?Q?wfqPPHxxtkoxEI9lni3VjQ6VEktuTA21sy26koqryBPmAgB/ZorOrVF0FjCv?=
 =?us-ascii?Q?a6W+jJlCMoqN5f0E2VK1L7OSzTsrp3V6VWCGTmM5B+iRWqsC8NCMYrWI402X?=
 =?us-ascii?Q?UiFMK+GQhSfE8xb+YA2ptJCO2FXdXPKFX/6cTJhrwVJujlkuo8J37VGmKbbo?=
 =?us-ascii?Q?ttx1Tu29eVttJwVe5mpBECaOo0JfeDXRXFl6A39cBnKt7hatOjt1BRjrlvBR?=
 =?us-ascii?Q?3F/ge3O0LTEK23BDPKmLOqr5QSB76BcefYtgndiEJH4X54h9U2oe+Yqh8/4p?=
 =?us-ascii?Q?TgAD7YDk/xWtmS5Tuqlsi8bSCIu4AQxnnNJalDrYPaua4sXXqugWwNkZRDJW?=
 =?us-ascii?Q?agkJuJZgNB/2ukTMxhFfbkFsCzZbFhsoxwJiW3O6sNo3/AyX6yl7yEjdU36g?=
 =?us-ascii?Q?AS112ldObrAir+a2d3DW0I9uuOwCT3iyyQurLT9WMXbTzL+OetC2TLC2vLMN?=
 =?us-ascii?Q?R6WIOn8oH6WZImFF0UP3Qj7RmSG4QNFhxCA4RlC0B2OFkvyXibctTYRful3o?=
 =?us-ascii?Q?TgLJ6Ub85FkuWxbcokKlEnQhSaal6uh0AjPlzfPZgLgPdt8AvBavLzszdewI?=
 =?us-ascii?Q?OshoZ5xN2DWY7PyaB9XVYmCIoKblq63mNpMyAONMxWCZ1vaHngKN6P/Przaj?=
 =?us-ascii?Q?KfuARe/YiHkBTFyozoh9EaxNDutQpm8tKKMCjJULhRJOnJ+YSoxS7JsHTqwu?=
 =?us-ascii?Q?DluLA+hXTkG1E5vokyJjCsBNPlBi8YhHMN6US3O31LSLc6uCO5dlNMeXRnso?=
 =?us-ascii?Q?1JFvMeINjD7plwF/R6Ngfa7jE8P4w7t6Kza69UY7DwybN3Oa3ysCbwI+1HeH?=
 =?us-ascii?Q?KioNLdGzclE2hz8RDKDzVNk5CQZtqOu9XY7/8vekJHsWFEQFbPuqVZbC4T4i?=
 =?us-ascii?Q?z0OAabXfZq0fT/Pf4IAwP0C4TDJzvDhiGUGFhboSxKzN6ZdetW+pMhRVODGh?=
 =?us-ascii?Q?iuYIO0eNdwAJks60aAj68tHhVQdgNGwck977cpbVNeE7K6utAskoOThXoA+D?=
 =?us-ascii?Q?PnQzbsNbY6vBc/SbQr5ras2EQFcodyrJ607+RvbwvuwtwO45NZAVG0UKfVBI?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02cda4ee-5c12-4976-14b6-08ddb3641ba8
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 21:14:30.0871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dKELdfefoY3/EyBrtX+VFq4HZ7PD6D9oX3T2WTBk5L8PW+Zkg2ufxqIi5hvTBNuJWyVWg43MuhaQLfqg6yO3BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6292
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

On Fri, Jun 20, 2025 at 01:36:38PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The igt_vma_pin1() function has a rather high stack usage, which gets
> in the way of reducing the default warning limit:
> 
> In file included from drivers/gpu/drm/i915/i915_vma.c:2285:
> drivers/gpu/drm/i915/selftests/i915_vma.c:257:12: error: stack frame size (1288) exceeds limit (1280) in 'igt_vma_pin1' [-Werror,-Wframe-larger-than]
> 
> There are two things going on here:
> 
>  - The on-stack modes[] array is really large itself and gets constructed
>    for every call, using around 1000 bytes itself depending on the configuration.
> 
>  - The call to i915_vma_pin() gets inlined and adds another 200 bytes for
>    the i915_gem_ww_ctx structure since commit 7d1c2618eac5 ("drm/i915: Take
>    reservation lock around i915_vma_pin.")
> 
> The second one is easy enough to change, by moving the function into the
> appropriate .c file. Since it is already large enough to not always be
> inlined, this seems like a good idea regardless, reducing both the code size
> and the internal stack usage of each of its 67 callers.

indeed way to much for the inline.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Also pushing to drm-intel-next right now...

> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/i915/i915_vma.c | 20 ++++++++++++++++++++
>  drivers/gpu/drm/i915/i915_vma.h | 22 ++--------------------
>  2 files changed, 22 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 632e316f8b05..25e97031d76e 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -1607,6 +1607,26 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>  	return err;
>  }
>  
> +int i915_vma_pin(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
> +{
> +	struct i915_gem_ww_ctx ww;
> +	int err;
> +
> +	i915_gem_ww_ctx_init(&ww, true);
> +retry:
> +	err = i915_gem_object_lock(vma->obj, &ww);
> +	if (!err)
> +		err = i915_vma_pin_ww(vma, &ww, size, alignment, flags);
> +	if (err == -EDEADLK) {
> +		err = i915_gem_ww_ctx_backoff(&ww);
> +		if (!err)
> +			goto retry;
> +	}
> +	i915_gem_ww_ctx_fini(&ww);
> +
> +	return err;
> +}
> +
>  static void flush_idle_contexts(struct intel_gt *gt)
>  {
>  	struct intel_engine_cs *engine;
> diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
> index 6a6be8048aa8..14ccbd0636bb 100644
> --- a/drivers/gpu/drm/i915/i915_vma.h
> +++ b/drivers/gpu/drm/i915/i915_vma.h
> @@ -289,26 +289,8 @@ int __must_check
>  i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>  		u64 size, u64 alignment, u64 flags);
>  
> -static inline int __must_check
> -i915_vma_pin(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
> -{
> -	struct i915_gem_ww_ctx ww;
> -	int err;
> -
> -	i915_gem_ww_ctx_init(&ww, true);
> -retry:
> -	err = i915_gem_object_lock(vma->obj, &ww);
> -	if (!err)
> -		err = i915_vma_pin_ww(vma, &ww, size, alignment, flags);
> -	if (err == -EDEADLK) {
> -		err = i915_gem_ww_ctx_backoff(&ww);
> -		if (!err)
> -			goto retry;
> -	}
> -	i915_gem_ww_ctx_fini(&ww);
> -
> -	return err;
> -}
> +int __must_check
> +i915_vma_pin(struct i915_vma *vma, u64 size, u64 alignment, u64 flags);
>  
>  int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>  		  u32 align, unsigned int flags);
> -- 
> 2.39.5
> 
