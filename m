Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE74929C14
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 08:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB3610E1CE;
	Mon,  8 Jul 2024 06:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MghKSXJg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAADA10E1CE
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 06:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720419653; x=1751955653;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=hHeH1N0sbV7OEa8R75AspY/rYtmt4HeytPqNt9N3VQA=;
 b=MghKSXJgmos4oIya0VBIB/c9TGqrGDyVZUN+1n2jymz4H0T5cjrhiK6W
 UNm2olsqj+63RpleA7/cDqJZCuS2/9NZcyInBqIlOYx/pPmumjDI0f5xX
 iEA+MYNTeNrLLkCc9J5jYy/5TdmkNYaJ6HPIl345z4XkKTaktQ62grgtu
 elQl2B4NTQ9wVgbz1sKKSFtNGqx5y6LAvGLN0BKJ+DbgUN9eeNGQ/X0t8
 A/AD1jVT1DRaHR/9nKn+WTCr8ljl0wTxbunUEUIZHzVyruhcMJJcl2+Nk
 afCUhpQDiDb3BDLPmAAvreOyH95xHMKq/caRN9wWQXuT94U+n557ng9g5 g==;
X-CSE-ConnectionGUID: Amovx1udQfu02rCKt2x8hQ==
X-CSE-MsgGUID: oaWFjwaJR8e6qBympLGb5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="28213700"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="28213700"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2024 23:20:53 -0700
X-CSE-ConnectionGUID: NTWvRpDfTiiVLbvg3o+nGg==
X-CSE-MsgGUID: yCIaosocTKSbuNNqQ44t+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="47508029"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jul 2024 23:20:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 7 Jul 2024 23:20:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 7 Jul 2024 23:20:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 7 Jul 2024 23:20:51 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 7 Jul 2024 23:20:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQwfg9teGdIqH+XyYVPqv3PgTj7lGn/zWqDqH6IEckZldWpD6xOGlxjlKRIDTn+L0l8T5h6Bi1ICLEX+Wg3JtU+1Ye2jYL8dgEUylif8oRnJoegSmReOCAimEJOcnIfp/1+S1MtGCcx/qg5XcUd9f0WpX9F8VO+5hp9XdwvjFne9WcDUKCP01yHsLaDF+Rwssqz/dDGZe8xsLI9jjTiPOhd7kHUl5tLPyt8WIOwKBHIQO4+kHLoGbd3kxttukdn3EzKhFM47WePlJAVOghx8kYT9IWgvSwVcdMWW7RPsNnX1cax2oWrO/hm57ZXtlQERup+5ZeOYGq4Nqv1nYnbvkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSyzFZMAHkk9KlSli/+mhKeoMuNeS0uEsOif8ftHRYY=;
 b=bBY+1F5K6x/Y5g3SW67Tu37lj9/UBWGjyyZob3NQZIpqZzy0knNCJ2l7K5qK6O3c6B/Y5WpSbptdkMl+5BpfQjAVSK2oxJR0fFeMWBwYUZBlgYItyYu/20/Jf+AJUEu92zVoMNVZB/4ZORphY+L69ScLJjwimlvLgHpH/rblWaG8jO0u+QN2MY4BzP9uD1ficLxHDViIN81TTMDg5Sj9dWU83hwiVphY1aW0PeBFB59voeO+rO7oNADrkPouPSeq5K29TzG5zXaENEUsxu6MIKCEouINAdtFbHlToeBZeGrQ8hwh172Tj7TCTaALM1wdZJwO2ymvA229P7wUBlNmrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by LV8PR11MB8679.namprd11.prod.outlook.com (2603:10b6:408:1f9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Mon, 8 Jul
 2024 06:20:49 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 06:20:49 +0000
Date: Mon, 8 Jul 2024 14:20:39 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jocelyn Falempe <jfalempe@redhat.com>,
 <ying.huang@intel.com>, <feng.tang@intel.com>, <fengwei.yin@intel.com>,
 <oliver.sang@intel.com>
Subject: [drm-misc:for-linux-next] [drm/ast]  7b8a74bc42:
 unixbench.throughput 4.0% improvement
Message-ID: <202407081414.8fc2a8f-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:54::15) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|LV8PR11MB8679:EE_
X-MS-Office365-Filtering-Correlation-Id: de6f81e6-c3d9-4dfc-c519-08dc9f161bfc
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ffjeH73Mrfwuupbrp5czLlaH+qDmnNXQmO9IT73KrHWpgLWPpf8mBZ8MUm?=
 =?iso-8859-1?Q?4DmYplgwmKOhtm+4BhKhRKVcpBleCdgK0anNjQqQTYJrVbDEpJWEg31LF/?=
 =?iso-8859-1?Q?6pAoDV43K1H+mvDuOZ4LVPqFKNM98tZ+zsUMgY13ZSdiGhX6AtRskCZLix?=
 =?iso-8859-1?Q?xRjfn7Ch9+HUbxDFRiibMEWwRQx7K5ZK9NIe/e8GYuAWDoRX2U4ka9n/P4?=
 =?iso-8859-1?Q?vqKr6NRFVbeQXj30GW4OxM9x++UOEQul0/WPw/LWPZkCYQ9TWFiKfplJzM?=
 =?iso-8859-1?Q?Z+/2/2+G1dIu2D2Uw+TdwhVuAaYiD1ObFKyYQqAG3dvdNvyPMegG1AWuY0?=
 =?iso-8859-1?Q?Jf99b29Fp8dImx4tf7aln3xL2IEvIm1utG3+SoTO+15ip9PeN7TgaSBsmW?=
 =?iso-8859-1?Q?hee3BBmaPCNbRtCdQQdBt5h9DOQlIzy5Srp34oQEliWCjxKl7XfAzp6usA?=
 =?iso-8859-1?Q?nDl7rWHTSdWK9jubbk6D6Hsfftc1A+Xux8HlsS2hBoyWuE4izV1BRH2g8S?=
 =?iso-8859-1?Q?tW6OQNli++uQ+JlsVLDxtiNPS9OimtoG6Jq25F3kiaa8j9C/DEH6yHTcoo?=
 =?iso-8859-1?Q?Vjlil72duRjqswuSddmqIX0ZtHz2GRZs4yMiSwRXN1nAR8ACfI9zHFfLOx?=
 =?iso-8859-1?Q?Q2+sQJBcj0Zaj/oTf7ShnKeViVtmtoWZ37UM/6zv73kHX0PSTpMmKdYJfO?=
 =?iso-8859-1?Q?bHzWCEHgWZhHeW/bUF7aef3MqQuZzk/ma5s37SsjP8hK1fXG3nJF1QkjrW?=
 =?iso-8859-1?Q?B4Wj5vXKXjLmZjGNFoWzg2IdTBCVR0/zUpRagTk360QMnW/0W2rUDkMsuT?=
 =?iso-8859-1?Q?ga7DAn/STuqgmERjzjg9pmnvOgE6xbdtlTlWVHY6Tle2zcpUz4XASDbZPQ?=
 =?iso-8859-1?Q?S85Ub2JtgdM8Rr37wK1+ZdRcZXaac64oq2e1pU9pBy3zZMZb86YYBOrNUM?=
 =?iso-8859-1?Q?e6JAbF88M4Ys+GyhFLgWQZmNuQxPCYRZS2X2YgDgX44j9vk6mYB5HtVeNo?=
 =?iso-8859-1?Q?CvOy855RI2LYmOp4rhScKm4XDi7zVz1pDw4ov90tI6gRoGNZyuZYKaGLZ9?=
 =?iso-8859-1?Q?GfY5NiAAAdhFgSwae2bHaoPvP1elKQPFYovff+fTEaRGgvWFkQraLY9i+y?=
 =?iso-8859-1?Q?oKvAZBAGEswm6+IUjy38f9tefkQSHZmfKgk6FCW6Oq9cF4auVqYjHyjk/G?=
 =?iso-8859-1?Q?5dINncoEcArIkHNbYIWk8rNnQaY51YkiML+XPrj7PQea9r9wNXRvqFgMl4?=
 =?iso-8859-1?Q?dIJ5FkNIILuyM8FbKb76Cjil+rJxaQBvpOfoxYHioXq8ZmAqfAl1KKrQg+?=
 =?iso-8859-1?Q?qUAzRDNNTHyznY46AZ7U1h33hbTy4YV176jSvg2gqQeZ8u8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NP96dwWWQPH4Jt0Z2RxXCJaiWiQzq6EK1KICTiGhxAHzGrsEX6TKKUr1NY?=
 =?iso-8859-1?Q?4GtUCXN32MJNa7VDjYUd3f9diYvoT3JN7slAd967TnI0arB+dWFCeMGaWx?=
 =?iso-8859-1?Q?qmNtAdN+Pn+RCb8ekCxpaR/yUYOMao3lIqVK7T68iqR+VzJxrTYKZYQphI?=
 =?iso-8859-1?Q?yPVrX/olpWmrGdWNfJccdd8TBhTf/Q0M8NPVwZ+r2bODdytzIa/OlHPHYE?=
 =?iso-8859-1?Q?ne1V3BMdsz3g5xcvikG8EeUP9QTIugRTpm1CPagXMtg4Q0BX0MFkBxCnHQ?=
 =?iso-8859-1?Q?AXNUO2TJG2BoFqTSY9wmjG6uQwAxV9IRAkX7A721ZBqoFgfJrm5S2Lh3Rv?=
 =?iso-8859-1?Q?ZCVMIECu65pDoqauRWFRqj+60l3C7gFXKvuQkdQAoQT/+yUeh6SrJ6Fbqs?=
 =?iso-8859-1?Q?ZYWSFhI+PfM2bMTitKr1e6Pck9tqzBtl1MSIdkL5e2A03jD3Z5yd424Vkm?=
 =?iso-8859-1?Q?vU7c5yvnbTKk4wIM7kjaK493ymfXWO9/aDixqRyS/XarPuAbt6jMH/n4UU?=
 =?iso-8859-1?Q?3NZxk/DVE6EEQ7N5b5IhBx5fTNPGnUAAmcSeGJmAU9ROTXZwCay7P9SNSI?=
 =?iso-8859-1?Q?PzZlSdu6kJWviWYqdQ6MdiQDObxD399yI85KSKsl1Sgev8N/8aPWR+cw2C?=
 =?iso-8859-1?Q?b0IykdsskWOFYjHOPHbSghSDEYtS3r4vTzWdGgiWM/2SZD4X87s9TTOmUZ?=
 =?iso-8859-1?Q?/947dwwe8EaMCo8e70mwZn8KLGfGjIBaXYjVJOsPOSx9V+hncD4w3moHOt?=
 =?iso-8859-1?Q?qCPeXziNAG2ikXmkHDzcRJojTG81PGhvLyge9P2gm48LmKG7a82GrUUk5L?=
 =?iso-8859-1?Q?TJZbujyeot788EaJwhYdPNtodMhLIkBysHZSLfnNmfw5PELsPmk8gm1hGM?=
 =?iso-8859-1?Q?Vvn3VO55B43w83XpUagr3KrocyO4VUL1wMYLZUdfXo037zCZnWapvAJlaE?=
 =?iso-8859-1?Q?sE2c17X1HuLTblBgYcIqQdXsnGlw9hd4N76IVWV8Ham6lQDCLvut6iZXwG?=
 =?iso-8859-1?Q?QMGHt1GSD7Cc42sMhBw/edNN8mtNptXjx/ZSDCAjrGByd2/dWe+wJxn6OG?=
 =?iso-8859-1?Q?APn5bf84kIrOcvWvVD+VHROGIPHXNqsmMzOe/yX7Xxe11qnbDULHCiwrjA?=
 =?iso-8859-1?Q?oXNOxOTW3hDQRokGgmi0Mvt/lEV94IY4lCBORslHCuC+ZLtVecdpk0uy98?=
 =?iso-8859-1?Q?CM44FrToIz0wZzIZSzSMo0tE+K15PhIpstAhCnhxdZpBIae0Cd5MlcwPqc?=
 =?iso-8859-1?Q?QpRNzXSjxHJ6wYRgQ+LPtZML5rwO0vGa/HCBp+7nR9twEhTG1hxqkTkN2K?=
 =?iso-8859-1?Q?yebAmFXmSJCPs72dK61Ks3Sxv0URyI67M60jjV0P51V2RzO1wLRkVta0e/?=
 =?iso-8859-1?Q?lE6FpUDKO6FTiH8dWDGf16CDMTfzADhPmYx0vKW2Vk9KEWDo/yO3aAhy8X?=
 =?iso-8859-1?Q?EyqRq8XkBpQ1LIl4Bpcyl095YZRqIcdsf00URLNGHHTKYgoVO1FBSZsh2o?=
 =?iso-8859-1?Q?lcSOdCWRpWN+/3CB/8ryNrbAmRviVEy0FgV5lEq51GrPQYh6X1aj4xSGs7?=
 =?iso-8859-1?Q?xe6GWHTYM2fFqIsFaJvZKlQMOtYvx2/DaEy7/u5dc9i0++OXgA406+MBZj?=
 =?iso-8859-1?Q?RxQPOySKjOMnpjt+lpCIPnNQGXS35rEdACUCM19Yz3tL/kVtGoHsdNlA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de6f81e6-c3d9-4dfc-c519-08dc9f161bfc
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 06:20:49.0570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQ1qlBBJoRXhosR9+drEfJXZCWOv7LifYvN7XIGmHOI422IyAuKAhXI/I36nHpmyyxQuSnQlXNQvN4h/6ZlmrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8679
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

kernel test robot noticed a 4.0% improvement of unixbench.throughput on:


commit: 7b8a74bc42016173ddb4872d113f132c8ca59fc1 ("drm/ast: Program mode for AST DP in atomic_mode_set")
git://anongit.freedesktop.org/drm/drm-misc for-linux-next

testcase: unixbench
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
parameters:

	runtime: 300s
	nr_task: 1
	test: 2d-window
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240708/202407081414.8fc2a8f-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-13/performance/x86_64-rhel-8.3/1/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/2d-window/unixbench

commit: 
  2a7e5f4531 ("drm/ast: Implement atomic enable/disable for encoders")
  7b8a74bc42 ("drm/ast: Program mode for AST DP in atomic_mode_set")

2a7e5f45314cfd99 7b8a74bc42016173ddb4872d113 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      0.18            -0.0        0.16        mpstat.cpu.all.sys%
      2094            +4.0%       2177        unixbench.score
      3141            +4.0%       3266        unixbench.throughput
    215.57 ±  2%     -14.9%     183.46 ±  2%  unixbench.time.system_time
    318.37           +10.8%     352.81        unixbench.time.user_time
   1753586            +4.3%    1829782        unixbench.workload
 2.037e+09           +12.4%  2.289e+09        perf-stat.i.branch-instructions
      0.56 ±  2%      -0.0        0.54        perf-stat.i.branch-miss-rate%
  11300458            +2.9%   11628854        perf-stat.i.branch-misses
      0.65            -7.8%       0.60        perf-stat.i.cpi
 9.653e+09           +12.0%  1.081e+10        perf-stat.i.instructions
      2.19           +12.3%       2.46        perf-stat.i.ipc
      0.03 ±  4%     -11.6%       0.03 ±  5%  perf-stat.overall.MPKI
      0.56 ±  2%      -0.0        0.51        perf-stat.overall.branch-miss-rate%
      0.47           -10.5%       0.42        perf-stat.overall.cpi
      2.12           +11.7%       2.37        perf-stat.overall.ipc
   3086774            +7.8%    3326418        perf-stat.overall.path-length
 2.031e+09           +12.4%  2.283e+09        perf-stat.ps.branch-instructions
  11277892            +2.9%   11606260        perf-stat.ps.branch-misses
 9.625e+09           +12.0%  1.078e+10        perf-stat.ps.instructions
 5.413e+12 ±  2%     +12.4%  6.086e+12        perf-stat.total.instructions
      0.24 ± 43%      -0.2        0.00        perf-profile.children.cycles-pp.ast_dp_set_mode




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

