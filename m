Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DA994759E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 08:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D260510E12A;
	Mon,  5 Aug 2024 06:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dn5eCAiN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA72D10E12A;
 Mon,  5 Aug 2024 06:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722840944; x=1754376944;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=+AbkT4NFXZebtyW/Zf5qoRCO6FvkSlHIomxknAZp7Jo=;
 b=Dn5eCAiN8SOG3Gpjaqzq4ViGEbQlX4rauBgJN69JmQgLEsiLy+AltDIB
 Tvy+eb2gGvIu8IAqiFBH20U4ISfXz8dHFyNrbLXWQptXrxbpE57BbkZh7
 tjLqrMC1Vy/wgG+/B++1u5+Z06BpXG5SPMcnT9+9YsM49Qrx7dUEVrQZ4
 nvjCD4QBqp1WZAo7GSL609Lx62tefzp7fRNXMceLVPlucycYdtO3Uv8Vm
 dzb4z3EcgdQUimaBP7Ges8hHNX3uguvWjDvMwOYd0cayY5RvwXwMTDOj3
 QpAG9eMUeA3QzrBmSMvqnEl9Me8eS4bcp0E0uZHMjciG6sa4pKk8CSeMB A==;
X-CSE-ConnectionGUID: +AeYQjdtSNGGKKUkJrv6/A==
X-CSE-MsgGUID: 7v03O6knTySkc8+BAfeZ1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20924525"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="20924525"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2024 23:55:43 -0700
X-CSE-ConnectionGUID: tSfbHmbURoqkj8Z31e6Mpw==
X-CSE-MsgGUID: w87KOHPdQaymTC2Pe0D6RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="55725590"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Aug 2024 23:55:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 4 Aug 2024 23:55:41 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 4 Aug 2024 23:55:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 4 Aug 2024 23:55:41 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 4 Aug 2024 23:55:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xb2N/aWhHrdBUk3Oluw7kTvJz/wOWjyD0y7naKuFVr1x2BxbaBeDfi0VFNFsUf6/QPHCh8HCHCcj0DeKBoc0CN4FJ1HttPTp1/tHJCWQVRyWjVwLb204tEmcG+RARR0fTxKuhEdLenwKPqj4uvyhAMbCErmjoV3UAIjBh70bJP2aoNjSOC8s4g044u2mmGPOR+RKHAyaTn1KU/ro2sfuJRBNxnGdMQzDmmc+0zSG3+CElCfSq4d8RKTTjCO1er6x+7tByqHMY86BaB31rWv1HlsAvxZtEuYI0ONmNN6xocLT0wdfJtg2Wyk7CnCXVq1nu7XV5oA9n8qCtq+Np2aSDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cg+hSgwWRBfdy2t20B7vc2IiHwqwQ8TnFVwPD+iXhUk=;
 b=BF+wnTVPQk281QiZb62bH4W4Sk9AlGHXDhV74AVcdtgF7fEF20gWaHc/EX4Xa9QzskZj/UvIwDs5O1K2DWuwBBoa1EMfM/IdPD7VpaRUbPTIBd8lODhMytviZ8hDvJt8j4DF9QRidmDk9yNcNmokiqZcpKxSpDkJg/LRei8gdr+AhD/d2VTZs3OFSbNtRS55bgN3KYiPs+89ROyeYXRMCvl8r4L0MjOQddwASGuPchZJQxfTMkAB/6IlI6v2eV6aYwktda0REgGM59EyytHhhGQNbVOa0s2ctq2gekNIa0i9W9a4/ZDS8X4bdG2aLYyXTDIkIy3xu990X3iQ4EEBrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW3PR11MB4523.namprd11.prod.outlook.com (2603:10b6:303:5b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Mon, 5 Aug
 2024 06:55:38 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 06:55:38 +0000
Date: Mon, 5 Aug 2024 14:55:26 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <linux-perf-users@vger.kernel.org>, Tvrtko
 Ursulin <tvrtko.ursulin@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, <linux-kernel@vger.kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>, <oliver.sang@intel.com>
Subject: Re: [PATCH 7/7] drm/i915/pmu: Do not set event_init to NULL
Message-ID: <202408051423.839b16eb-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240722210648.80892-8-lucas.demarchi@intel.com>
X-ClientProxiedBy: SI1PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::6) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW3PR11MB4523:EE_
X-MS-Office365-Filtering-Correlation-Id: 506b30cf-b8a7-421c-a253-08dcb51b9c97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mYm9oYvqpX2Crc97768AQSepJzsL4tO1oqaE4lgHgH1AMu1zwBmfrtzR+yO2?=
 =?us-ascii?Q?J/vFxN9gnpmoiWm4XYcvZqbAh3ATZUTWzbqqncJF2NLoSMgPkqqvbytxElFn?=
 =?us-ascii?Q?o5LmdUlRf8XsmNF6TR4rg826qxJa6w55KTQfJRv6q+BzauswdYObj8VtMor8?=
 =?us-ascii?Q?8xNCRifRC1PKzlMlmoR6bj9bg4Lf7RTwqFw3cavqHE6gt7d+qF+NMnHt8vsa?=
 =?us-ascii?Q?ujkOWdGi+f+yDzQ4Ua6ZTbPNreJNVMst5FqWsX5xrJEW+Tk0GHTA0Mgw4tl9?=
 =?us-ascii?Q?iaryqrEtPioS/y/dKTKh1Qrkb1d1u17deK0t8xWQpOt2G332z17daEVRl/is?=
 =?us-ascii?Q?azM5tDTUSNH4kXHYMOSou+DbPyEzz9cvXjO8GX5woKhC5j+4PRiAp1A7GudF?=
 =?us-ascii?Q?NqaCkSFdYsR7yq8W/aCML1j0GXWI5r3LPOWWHuYg+LzPX3KXztrOaYDgEpd2?=
 =?us-ascii?Q?vo3d2YMoiVww1JpZOHsZi+rb8VwSlFQ4t8w+EL+9oXrBo/yUitRW64qjVyKz?=
 =?us-ascii?Q?Syh6o2bge0BAZTkIIGztPqQTDIKjxMc7PP2JrkGOXAhNEYuqdl7ay21N8eeL?=
 =?us-ascii?Q?vU5CCreaPiZVfhv+ghTpSby1vISVjG9a5Ux5D7uvp5K2prFnf5r+WhRLkzIB?=
 =?us-ascii?Q?TLQVsnKGDHraKBn3E+r3jM5Y4CK2wuO3UMjWbj3aZ9wnDVuGD2mmBAb9cX3j?=
 =?us-ascii?Q?8o6wtZ9Ki7jNaGIDJMlWY+6NYMO3POGElYoNxf+2I3v8Cm0OYCc34rQMQguX?=
 =?us-ascii?Q?DoDhrIruNb4hWUS9OahhFfl6CpTHgukbsy7hsmXr8lFu4fr/Z7su7CgtvQZ/?=
 =?us-ascii?Q?QnVKZPmc6PSrDHPwKu3hCBJrDPaLuyAIIVSUpXaO+UPhzpeJgFeNIqJfBcZ4?=
 =?us-ascii?Q?ce4QKd5sGytEPO7JbuY25TrsAtvebGKKnSO8zZv54RRnyGAv54BTiznHDzHe?=
 =?us-ascii?Q?SG0dxOq67E/5LhOSaBacApeqxsQoqqi51EqVCM2OmID3hQ0i9awB5oHFo7ZE?=
 =?us-ascii?Q?Cw3T7EGSO/LrJZUMRiM7bevgsF3XE9LFiCftCFb+dj5WKa6Ns0IILfx8lFka?=
 =?us-ascii?Q?gbIX0tER8CqiReRNaDbu9wL4BO6GZLTGfyrNkNuMNHZmoVBGYaxjsiNpYWsH?=
 =?us-ascii?Q?KNeHawaF9N3PMxjvYE+dxzmFzUggUirGLawRXu2/J2nL3zwAC2/sVfNHTGok?=
 =?us-ascii?Q?80Erj5koYWDqPf6aGRH+pDzpGmaz4FPHnddEquZr7TyQOjCVWE72Hx8qdTvf?=
 =?us-ascii?Q?iHxSRWBlurCCHEoaUZlCwDyYkxrxENG0/lzS6oX5l8MtWhUYH3cy3h7mS1Cv?=
 =?us-ascii?Q?ttWWHI27TxOVr3wefBLVjSWv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JlPfs0PNPjx+k5GGnY9zcQewTxDgnKh9MaCuSbDKb9HR6SRcqQm/G9bMYksi?=
 =?us-ascii?Q?wRf4mbcu+lRnsfdDgJ/u6GDPhE9TS7HjSKSghFEuB6U76IsbgjOFuskTHI6n?=
 =?us-ascii?Q?YcnikQl3wi6sucR3qKgpgHWRSU5uAT3e4SAsc2PI9TuJ0AfnIG2bBV0bpfOQ?=
 =?us-ascii?Q?edjBNewL5onXJ0JfCXzWMZzsHM14vR1gwa/2KVToxYtfMYsHQF1nwlyy1UDV?=
 =?us-ascii?Q?Kc9jjytioHILtOyew4yvbX5DM5KbRn5TGI1GQrZrrl0I3zE5jq3hwZHQf3yp?=
 =?us-ascii?Q?FvMr7PaMQe8bG9wH40grnVSMx1ZXatL6HzRuO5FvAiOhvUUfVd1t/udFcmbF?=
 =?us-ascii?Q?pAywHndEeYJpx2U1IXn38QW6ZZADJBPzJRbIHHpEvyj5SGv+rLOJteX9nsE3?=
 =?us-ascii?Q?U3InAQWFCk/SctLRwtcejZaOLoxbzCpSfKuPoQswD6A3WKBNjYB/Fij4uAC+?=
 =?us-ascii?Q?Z8F6H9aPYvSgXng8KS5flKYMDPXIOV+u0nj1x07OVfUnOw9Fq8g80i5IVi07?=
 =?us-ascii?Q?fh8USzt2yzn4ykmwvEBofgKfEG/Cdwam0ML2y2Xg38+LQiepsxG/Qs5yb5dA?=
 =?us-ascii?Q?19OfYjU84o3SgZ1YHoDFX4PILmYIkZVyLqhTtU6Q7NN6G1NYUvSfHx/J8CTc?=
 =?us-ascii?Q?54/K9JYz8zNF1aawigvQfnwzAVrAN5w6OYef7V5AVOYIn6zYkUuvFf89dWKZ?=
 =?us-ascii?Q?3TBs2l03y4DzhqGzLnkf1GtOTJMED9/8uIJ+A7n/iMC6vROQtGHDrqC0sPeR?=
 =?us-ascii?Q?WgKyxyHMbwFuYMC7PWzGYB2gO6EQwyf/BiTMt4WWCAqVBNEwKr7IlTZMLJgP?=
 =?us-ascii?Q?i/IFe5261nySroFQZFVsv4Oyneg0RmAU41ZXMSWWDZukSpD3mzmXmRO6ItYW?=
 =?us-ascii?Q?oysaEznUNamlbg51NNJAreMy6Z0uRyRSu8GhClRBUSXIuGSy6BIbEYi9CMAe?=
 =?us-ascii?Q?f69cottT9A7k6FOZin0BxCT4p4iXU19aaBrj2Q+SHtHpZnaltdQZUL5crbXu?=
 =?us-ascii?Q?8d6So7Q7oR2W/Mj6Gx6oaFF0WFbobBeBLKUTt7mDPnqAscm4hgG/NY0flbbo?=
 =?us-ascii?Q?p9nLI1Bb9kqeG9juXDg6Fnv2wA35NAsnsWCInqrnt257cYpSNYDzdGHidUyN?=
 =?us-ascii?Q?FiZO1916JbYTRIVTa/oUCybq161Wzk3dK6BggNl63Pdih8TvPjrKeGuQaZs8?=
 =?us-ascii?Q?pXJU2ncxxBIQyHoHt9SFWxIRoIdKtRjKyVqeh0VHeLk7UX7NU4XkOTb8RQRX?=
 =?us-ascii?Q?rDxyx1BWqv67Ef/Jo926H4ovBmehMRaTUvOo6aeBhKpnNK+QCY1oZPs6lwXn?=
 =?us-ascii?Q?QH+zIAomLCGdC5BzulHXMEC+YUiAT3PBaT+BcU2RwHSOxfHstc1Fx3hHdriR?=
 =?us-ascii?Q?3VE+wwlxpnCmWwC8AZsJ/9WpOUzYOj0Kxj3GqamvJGrtB4jkrt03Mjs4+aH1?=
 =?us-ascii?Q?xfz2LEQDkiqWuzx6CqjcfQxD+4cOhtc2EqmOSOen3KZFD30JxkpgBY9Vrpo6?=
 =?us-ascii?Q?qhi8iI6+RPZt7me5mSxjyFWJ9eGPR1Defc/f6mYywGv0/idL6kVUBnPS76X/?=
 =?us-ascii?Q?rOQFzSRBf5BSZ+DoDfUWvupE7AG+CngGolwByfsz6EINO3estE2iEYqsdD+E?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 506b30cf-b8a7-421c-a253-08dcb51b9c97
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 06:55:38.0284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zpNNAaziZenMsrD/7LGEerpHd8YB34UEhQ8atNhAN86/25RjmwBuUtRZTEgfPLN8KGUIW9nBeL7jHj1n9e1big==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4523
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

kernel test robot noticed "INFO:trying_to_register_non-static_key" on:

commit: a236f4d92e214998f7606430282249580f709423 ("[PATCH 7/7] drm/i915/pmu: Do not set event_init to NULL")
url: https://github.com/intel-lab-lkp/linux/commits/Lucas-De-Marchi/perf-core-Add-pmu-get-put/20240723-051755
base: https://git.kernel.org/cgit/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link: https://lore.kernel.org/all/20240722210648.80892-8-lucas.demarchi@intel.com/
patch subject: [PATCH 7/7] drm/i915/pmu: Do not set event_init to NULL

in testcase: kernel-selftests
version: kernel-selftests-x86_64-977d51cf-1_20240508
with following parameters:

	group: locking



compiler: gcc-13
test machine: 4 threads Intel(R) Xeon(R) CPU E3-1225 v5 @ 3.30GHz (Skylake) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202408051423.839b16eb-oliver.sang@intel.com


[   45.439542][  T194] INFO: trying to register non-static key.
[   45.445246][  T194] The code is fine but needs lockdep annotation, or maybe
[   45.452244][  T194] you didn't initialize this object before use?
[   45.458370][  T194] turning off the locking correctness validator.
[   45.464586][  T194] CPU: 3 PID: 194 Comm: (udev-worker) Tainted: G S                 6.10.0-rc3-00133-ga236f4d92e21 #1
[   45.475322][  T194] Hardware name: HP HP Z238 Microtower Workstation/8183, BIOS N51 Ver. 01.63 10/05/2017
[   45.484923][  T194] Call Trace:
[   45.488094][  T194]  <TASK>
[ 45.490908][ T194] dump_stack_lvl (lib/dump_stack.c:118) 
[ 45.495297][ T194] register_lock_class (kernel/locking/lockdep.c:1290) 
[ 45.500377][ T194] ? lock_acquire (kernel/locking/lockdep.c:467 (discriminator 4) kernel/locking/lockdep.c:5756 (discriminator 4) kernel/locking/lockdep.c:5719 (discriminator 4)) 
[ 45.504938][ T194] ? intel_display_power_get (drivers/gpu/drm/i915/display/intel_display_power.c:504 drivers/gpu/drm/i915/display/intel_display_power.c:532) i915
[ 45.511333][ T194] ? __pfx_register_lock_class (kernel/locking/lockdep.c:1276) 
[ 45.516848][ T194] ? __pfx_lock_acquire (kernel/locking/lockdep.c:5722) 
[ 45.521748][ T194] ? lock_is_held_type (kernel/locking/lockdep.c:5495 (discriminator 1) kernel/locking/lockdep.c:5825 (discriminator 1)) 
[ 45.526654][ T194] ? find_held_lock (kernel/locking/lockdep.c:5244 (discriminator 1)) 
[ 45.531306][ T194] __lock_acquire (kernel/locking/lockdep.c:5015) 
[ 45.535870][ T194] ? trace_contention_end (include/trace/events/lock.h:122 (discriminator 2)) 
[ 45.541042][ T194] ? __mutex_lock (arch/x86/include/asm/preempt.h:94 (discriminator 1) kernel/locking/mutex.c:618 (discriminator 1) kernel/locking/mutex.c:752 (discriminator 1)) 
[ 45.545688][ T194] lock_acquire (kernel/locking/lockdep.c:467 (discriminator 4) kernel/locking/lockdep.c:5756 (discriminator 4) kernel/locking/lockdep.c:5719 (discriminator 4)) 
[ 45.550069][ T194] ? i915_pmu_gt_unparked (drivers/gpu/drm/i915/i915_pmu.c:336) i915
[ 45.556233][ T194] ? __pfx_lock_acquire (kernel/locking/lockdep.c:5722) 
[ 45.561162][ T194] ? __pfx___mutex_unlock_slowpath (kernel/locking/mutex.c:907) 
[ 45.567023][ T194] ? __pfx_intel_display_power_grab_async_put_ref (drivers/gpu/drm/i915/display/intel_display_power.c:471) i915
[ 45.575181][ T194] _raw_spin_lock_irq (include/linux/spinlock_api_smp.h:120 kernel/locking/spinlock.c:170) 
[ 45.579937][ T194] ? i915_pmu_gt_unparked (drivers/gpu/drm/i915/i915_pmu.c:336) i915
[ 45.586041][ T194] i915_pmu_gt_unparked (drivers/gpu/drm/i915/i915_pmu.c:336) i915
[ 45.591960][ T194] __gt_unpark (drivers/gpu/drm/i915/gt/intel_gt_pm.c:93) i915
[ 45.597075][ T194] __intel_wakeref_get_first (drivers/gpu/drm/i915/intel_wakeref.c:32) i915
[ 45.603498][ T194] intel_gt_resume (drivers/gpu/drm/i915/gt/intel_gt_pm.c:259) i915
[ 45.609021][ T194] ? __pfx_intel_execlists_submission_setup (drivers/gpu/drm/i915/gt/intel_execlists_submission.c:3541) i915
[ 45.616560][ T194] intel_gt_init (drivers/gpu/drm/i915/gt/intel_gt.c:740) i915
[ 45.621888][ T194] i915_gem_init (drivers/gpu/drm/i915/i915_gem.c:1193) i915
[ 45.627261][ T194] i915_driver_probe (drivers/gpu/drm/i915/i915_driver.c:798) i915
[ 45.632922][ T194] ? __pfx_i915_driver_probe (drivers/gpu/drm/i915/i915_driver.c:750) i915
[ 45.639091][ T194] ? drm_privacy_screen_get (drivers/gpu/drm/drm_privacy_screen.c:168) drm
[ 45.645110][ T194] ? intel_display_driver_probe_defer (drivers/gpu/drm/i915/display/intel_display_driver.c:81) i915
[ 45.652258][ T194] ? i915_pci_probe (drivers/gpu/drm/i915/i915_pci.c:998 (discriminator 1)) i915
[ 45.657875][ T194] ? __pfx_i915_pci_probe (drivers/gpu/drm/i915/i915_pci.c:959) i915
[ 45.663785][ T194] local_pci_probe (drivers/pci/pci-driver.c:324) 
[ 45.668340][ T194] pci_call_probe (drivers/pci/pci-driver.c:392 (discriminator 1)) 
[ 45.672893][ T194] ? __pfx_do_raw_spin_lock (kernel/locking/spinlock_debug.c:114) 
[ 45.678141][ T194] ? __pfx_pci_call_probe (drivers/pci/pci-driver.c:352) 
[ 45.683232][ T194] ? pci_match_device (drivers/pci/pci-driver.c:159) 
[ 45.688169][ T194] ? pci_match_device (drivers/pci/pci-driver.c:159 (discriminator 1)) 
[ 45.693077][ T194] ? kernfs_put (arch/x86/include/asm/atomic.h:67 (discriminator 1) include/linux/atomic/atomic-arch-fallback.h:2278 (discriminator 1) include/linux/atomic/atomic-instrumented.h:1384 (discriminator 1) fs/kernfs/dir.c:557 (discriminator 1)) 
[ 45.697294][ T194] pci_device_probe (drivers/pci/pci-driver.c:452) 
[ 45.701942][ T194] ? pci_dma_configure (drivers/pci/pci-driver.c:1656) 
[ 45.706941][ T194] really_probe (drivers/base/dd.c:578 drivers/base/dd.c:656) 
[ 45.711328][ T194] __driver_probe_device (drivers/base/dd.c:798) 
[ 45.716492][ T194] driver_probe_device (drivers/base/dd.c:828) 
[ 45.721401][ T194] __driver_attach (drivers/base/dd.c:1215) 
[ 45.726051][ T194] ? __pfx___driver_attach (drivers/base/dd.c:1155) 
[ 45.731235][ T194] bus_for_each_dev (drivers/base/bus.c:367) 
[ 45.735991][ T194] ? lockdep_init_map_type (kernel/locking/lockdep.c:4892 (discriminator 1)) 
[ 45.741332][ T194] ? __pfx_bus_for_each_dev (drivers/base/bus.c:356) 
[ 45.746592][ T194] ? bus_add_driver (drivers/base/bus.c:672) 
[ 45.751332][ T194] bus_add_driver (drivers/base/bus.c:673) 
[ 45.755895][ T194] driver_register (drivers/base/driver.c:246) 
[ 45.760539][ T194] i915_init (drivers/gpu/drm/i915/i915_driver.c:1436) i915
[ 45.765494][ T194] ? __pfx_i915_init (drivers/gpu/drm/i915/i915_config.c:13) i915
[ 45.770985][ T194] do_one_initcall (init/main.c:1267) 
[ 45.775534][ T194] ? asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/idtentry.h:702) 
[ 45.781568][ T194] ? __pfx_do_one_initcall (init/main.c:1258) 
[ 45.786741][ T194] ? kasan_unpoison (mm/kasan/shadow.c:156 mm/kasan/shadow.c:182) 
[ 45.791304][ T194] do_init_module (kernel/module/main.c:2541) 
[ 45.795868][ T194] init_module_from_file (kernel/module/main.c:3173) 
[ 45.800951][ T194] ? __pfx_init_module_from_file (kernel/module/main.c:3149) 
[ 45.806647][ T194] ? __lock_release+0x103/0x440 
[ 45.811991][ T194] ? idempotent_init_module (kernel/module/main.c:3119 kernel/module/main.c:3184) 
[ 45.817423][ T194] ? idempotent_init_module (kernel/module/main.c:3119 kernel/module/main.c:3184) 
[ 45.822857][ T194] ? do_raw_spin_unlock (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/atomic/atomic-instrumented.h:33 include/asm-generic/qspinlock.h:57 kernel/locking/spinlock_debug.c:101 kernel/locking/spinlock_debug.c:141) 
[ 45.827853][ T194] idempotent_init_module (kernel/module/main.c:3190) 
[ 45.833104][ T194] ? __pfx_idempotent_init_module (kernel/module/main.c:3177) 
[ 45.838879][ T194] ? __seccomp_filter (arch/x86/include/asm/bitops.h:227 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 kernel/seccomp.c:359 kernel/seccomp.c:386 kernel/seccomp.c:418 kernel/seccomp.c:1222) 
[ 45.843791][ T194] ? security_capable (security/security.c:1036 (discriminator 13)) 
[ 45.848531][ T194] __x64_sys_finit_module (include/linux/file.h:47 kernel/module/main.c:3212 kernel/module/main.c:3194 kernel/module/main.c:3194) 
[ 45.853704][ T194] do_syscall_64 (arch/x86/entry/common.c:52 (discriminator 1) arch/x86/entry/common.c:83 (discriminator 1)) 
[ 45.858092][ T194] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
[   45.863871][  T194] RIP: 0033:0x7f5179545719
[ 45.868164][ T194] Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b7 06 0d 00 f7 d8 64 89 01 48
All code
========
   0:	08 89 e8 5b 5d c3    	or     %cl,-0x3ca2a418(%rcx)
   6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
   d:	00 00 00 
  10:	90                   	nop
  11:	48 89 f8             	mov    %rdi,%rax
  14:	48 89 f7             	mov    %rsi,%rdi
  17:	48 89 d6             	mov    %rdx,%rsi
  1a:	48 89 ca             	mov    %rcx,%rdx
  1d:	4d 89 c2             	mov    %r8,%r10
  20:	4d 89 c8             	mov    %r9,%r8
  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
  28:	0f 05                	syscall 
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
  30:	73 01                	jae    0x33
  32:	c3                   	retq   
  33:	48 8b 0d b7 06 0d 00 	mov    0xd06b7(%rip),%rcx        # 0xd06f1
  3a:	f7 d8                	neg    %eax
  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	73 01                	jae    0x9
   8:	c3                   	retq   
   9:	48 8b 0d b7 06 0d 00 	mov    0xd06b7(%rip),%rcx        # 0xd06c7
  10:	f7 d8                	neg    %eax
  12:	64 89 01             	mov    %eax,%fs:(%rcx)
  15:	48                   	rex.W


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240805/202408051423.839b16eb-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

