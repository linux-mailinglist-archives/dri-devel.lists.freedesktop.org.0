Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455678FC35B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 08:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A20E10E0BE;
	Wed,  5 Jun 2024 06:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/bwZI1t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767C810E0BE
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 06:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717568471; x=1749104471;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=4/gXP8a9Z/XMAJ5+EuM1xqrAeThdMKnWZpDTZgS1aLs=;
 b=f/bwZI1tlLswzZuIJAuFIyIKcGliWw1R1JcRA4+CRm66ysWlC1brEtb4
 7qWQKcKgcHV2zJfwJRqePIF+5NDyjmHOJDldnnaNdDDYA61XHpHSK919T
 +J+Mw7G/48rOcRS59UIbphKmQNb45AEwnNt8xrGHi47heALXwfvXdKTU+
 lKMPLAJSG8oEiMX1vG1QWN9lrQclntxjKqT7Aa9F5cAsyUuyx0NhpP5jQ
 FOpHvdecGYKww+5dd6Y11hHa6TY4LGKazFciEcs3ceCWdV3RyRbhgO6o1
 f4N01znUu1AEgr6eQPGNpDGJesJxOnpktVWrgngYlT9hDy2QmJTwV6/Zc g==;
X-CSE-ConnectionGUID: 9Gm1/pDyRuS+KY8/m7gsPw==
X-CSE-MsgGUID: s1SJbtZ4QUyXn9UoQE62Mg==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="36673474"
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="36673474"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 23:21:05 -0700
X-CSE-ConnectionGUID: qN+lOHnQRCqJNK+DhUqCkA==
X-CSE-MsgGUID: Ks3dpqlpRYWVmVMQd6x30g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="37409219"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jun 2024 23:21:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 23:21:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 23:21:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 4 Jun 2024 23:21:03 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 4 Jun 2024 23:21:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tq+wLzZRI4bdIjHRquPtOfuxrVEk3+d1OnlpEVl8SDohpZeYuNYJKefYkmf5iXvf2/cAJ/zklRgP9mCvB2QERqWiFjJ9KWZW52/vJ/WqvPmh5NvgJ02FNweafyRcvCPmBeobV75N9HkUMBMjl4pRTgy8Eouzpdm9/SRsaEOMHSFZHM9Uz9RRy3iDh5ahihtN+JodVK6PKyyrz3ok+szHugdARgKEiEdc3ovoLT9A6lO5sdh6WO4jhYLqbrkY3GlsGthocNgwDy1JDsHvjkZQdKWwiuI3vVzGj87fvaWCpMwcGbdESdZJlYY1SRNxar7v7bEv/C1Hm3oIPNaT+tZbCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+d8dk4gikq0guXw4/yqF+d6KOFraTBYmUAp/EHcchA=;
 b=TS3m9m0qL19Z18dZW4ltpq20VolgO6VGbFFqBr0yaJhZCXWtyQRWwDKWpaaDHFHwYIDBgr6n0x8NnsnmmXLh739+i11zlv+oQEBz6bPsnSJusyE5Xy5sfRzxTTJ6utc17cioFZEmiUqgLG15ki1lCtoP0tbkG2ZK3yPBo97rnuDfPQF1rnAJCnneBh/HQxJForeZUA/Mkp4izPCHb3J0Zh0Ay04hrj482NIFkK/FheGUWCK8iEWlz2A3sDljKZZ3jYuRXaJoglTJVGqRDD7WALxTh7DxMsr9jYXO5i/pxvm9nu5BZJhIBCPcO56pti3nS8ZuWp77mYCCSi/eXXaryw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH0PR11MB5925.namprd11.prod.outlook.com (2603:10b6:510:143::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Wed, 5 Jun
 2024 06:21:00 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 06:21:00 +0000
Date: Wed, 5 Jun 2024 14:20:50 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>, 
 Jocelyn Falempe <jfalempe@redhat.com>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, 
 Maxime Ripard <mripard@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <ying.huang@intel.com>, <feng.tang@intel.com>, <fengwei.yin@intel.com>,
 <oliver.sang@intel.com>
Subject: [linus:master] [drm/ast]  225a8d0bd9:
 phoronix-test-suite.quadray.1.4K.fps -20.7% regression
Message-ID: <202406041618.27dcc912-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0119.apcprd03.prod.outlook.com
 (2603:1096:4:91::23) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH0PR11MB5925:EE_
X-MS-Office365-Filtering-Correlation-Id: 08e08a28-a391-44b7-7866-08dc8527aae0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?0uWS0cFcTtLTyc9MM5SYh4rwD2Pad7RePaX4e7YOQ8SOSjGPSRKq94xJ+I?=
 =?iso-8859-1?Q?pAuz802EA4BnSKt0XKmnSGn7iBCpic14oWvDVXG3yVJnlgl9LPc2XO3Qg5?=
 =?iso-8859-1?Q?RHSbxWBAY5ZDNKmGLm28gMcyJre7CUx05wb3vatYflQ9+eFxx75MAn2aO2?=
 =?iso-8859-1?Q?87R5sL05gacO7PAPBOPU8QyzlaUyn2Ytu31/llFfBMLgLV0V5+jYzgmLKT?=
 =?iso-8859-1?Q?4zNuW2WzjUiXgauQb6Ap+T1CEXzap0uwnZlYjysynWi5F8HhBlsZo8lbSH?=
 =?iso-8859-1?Q?yYKgfsSWveXL0p8pvu64TNsksJDN4qQpEZ6O0dA6nT/EEBbL5AEJGf5B97?=
 =?iso-8859-1?Q?mSegyZrOfzf9Q6ci7uTLl3p5v9DWUY3NQZzTP5FBuwmMu10uzMSIM32MnY?=
 =?iso-8859-1?Q?kbkqL4D2pbOgigPkJ7aAXJVh4MhmugCPDgIJGDQT5oH9kJw0YxZSIJ+daK?=
 =?iso-8859-1?Q?7Jycj//W0t4mtjaDhW0NMssMFvzPdybKBqemcGpKD3CMjPfXbC9LM3dxiV?=
 =?iso-8859-1?Q?tDDTWRuWCXfiTq3uDndnhVS77k4GXy6auiuR2T6UblJxed6mBGjx6nYUmQ?=
 =?iso-8859-1?Q?ctc4m3TfPOx+HmrtzltrHLKvSNjkrWqvKCL5aMoTA+G8+bERFNE5/CLhQD?=
 =?iso-8859-1?Q?M4GMRzxHGddGoy4cbTbTcbI1sM3FL/tr+SL6y5xZBGIGQTBxLIm6MuE13i?=
 =?iso-8859-1?Q?9LceD09FUesOrGe3xtg7V57o0a4HKw/TOcuLksIXADp+RonbkMcG+Nn8PG?=
 =?iso-8859-1?Q?u38tLVBQr9GBVsqHkvN5N8SxupDnyONA6zuI15fNH9DWTxAVpSuRMuotaV?=
 =?iso-8859-1?Q?Xf2408JMd308thQXSAL0Z/P5U5yTaI8jGTl5U7b0OQPiRkmfLqdHUw8AgA?=
 =?iso-8859-1?Q?BYCHmV0ZqwXrEioZqXwGD5/FCcVRb5++oXcwpvmyuclk4tDoQogrma+ZnB?=
 =?iso-8859-1?Q?zyeLb6WeNhaqdq871ShKFF6dLhGkxQ/PEviotSxjG38m7ck6G7m/RBe4J3?=
 =?iso-8859-1?Q?9D2mBrTJrlVpVRT6fJpLm+7Nvwf0G6txAtLQbQGi3ossPAFnJmmpJsX+er?=
 =?iso-8859-1?Q?sdwoxwOnkQzcSF02439t5MWb0xPqONEePPtJvvWSfKAiBnOw0YAl3OmRM2?=
 =?iso-8859-1?Q?DgCXYKXoMe1iWkUh4dEKl8zUxn5EnJCtXb0ec9QZs0jLaO6o6CpJe5A8OL?=
 =?iso-8859-1?Q?w5h/E/rK2BEncgO/mpkPt3y2FKrzC+/NLiAROPeuaZ4eJm56LAzyOaeZEG?=
 =?iso-8859-1?Q?Q+UvkCZSpkXLBt5zEKvTDJlKapdDmpzHrIHQlrHiU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TEH1nZ9eGuStjMeaT6/ap14VHc8D/6o/CdwgddDPYgqLx5aRoR0peUJR2y?=
 =?iso-8859-1?Q?QdzoHz5bZTa7G/iYp6Im5TmeTqnYdu+8Vzd2Lqucht5mPJDntSGDqSaYlJ?=
 =?iso-8859-1?Q?+UXcB8cHbA6mmo0fX8vHaVxK+5P06zyOTpdATgjUzTfhfRfjtkI92c6bSF?=
 =?iso-8859-1?Q?9E3OkV7VuE54/iM9H3jNJaZlrhjaB4PDmWUv5GLIzkc+/gmBMMnf/NbV4j?=
 =?iso-8859-1?Q?ttu642Y0rN6k+ZUHlyezp0ERfEPbFVCfIkI8N3cEfZlKE4f5Td/hmtETfo?=
 =?iso-8859-1?Q?XPdXdPim1GAL/jb9NAbOq4G5qZSZAcwdP1X0pKMN3sodFs6+/8ziuCwUsz?=
 =?iso-8859-1?Q?QnbgKAYFDwTw1FwMbPasZQxiOm/W3lZYpuBt2tUMaLwY900DZddKgoB7km?=
 =?iso-8859-1?Q?H4VKolcO7geNH8knMZvJYbyRYq0sXhzAJHR2u5C2R4B5/BYcULETvj661Y?=
 =?iso-8859-1?Q?mtxUq5K+l95jbg7/O9mrf+FCZj5R5EyE3nK0gmNw3F8UZXcwE3of7BsSSn?=
 =?iso-8859-1?Q?wmlwi/IkcWsgW4rGqcKZphS64RJtk5NUqL7dqESempyP/6HMp3E56cr+68?=
 =?iso-8859-1?Q?htnyJNVZZBn5NDM+DR9PNe+LPRgRHLk0tGf/qcoA9t5MyjavHd+SmHTedj?=
 =?iso-8859-1?Q?zs4LRlq+cC3otl3DZxfxOUHEhQVZl1qbjzPXHKklwxRlvXZBBPSsaUlbgB?=
 =?iso-8859-1?Q?diGg6ygMQ0nL1gdzxN2wfxzqdK+/XqjAdJ27rtm1BS8za+K9XngrPzhevV?=
 =?iso-8859-1?Q?Kn033o/x9i69iff7FErH4lhWkyGsmz29kvuPAKwcXn4xt0BkEyyo3bJ2oz?=
 =?iso-8859-1?Q?HuJwyUVVjI3IHhIJhddjAgvLS5da/fRAsVBY70XOC4p7z4eS2UNRZVa+XC?=
 =?iso-8859-1?Q?DQmRqFJ4chq9QZwFGqJlmgjWJfp/J83HputyQvrgwdIb7KkUCvU10gxTSe?=
 =?iso-8859-1?Q?6z5XVDEwX9bpAfJcN59t0EUkSE43PL0rRzak0Yzmvtqw0bLOIaLsbTJNDS?=
 =?iso-8859-1?Q?4rfl5PIfLJvZ3pMu7MOO2eWhxaFk7yymlafagMhAOJ1YuPlxN/ShxpIEE8?=
 =?iso-8859-1?Q?vmdd1GtZ3+XcZ71WTplqXxQTV38IiiDqaFvqXUzrjwgMFa4eI3y+gAqwyk?=
 =?iso-8859-1?Q?H/qKliwWUyw3USxBY3xdQotyVH4Reulr9TPC+bVrw7yFiYNkDFB+S56y9S?=
 =?iso-8859-1?Q?AlxSi4/9uAo75mh/8xRdryXDEIJvfIJdJr2uiDHROiQaGMcfVj0JbLAl8S?=
 =?iso-8859-1?Q?kcBMtS329bIlBWSwkN3gPnt13L1NQDAXQhwXB8aGugN0c8V26qm5dvFua8?=
 =?iso-8859-1?Q?V/+64SH2yoxpiiW09yRgsh0RnjlDVvNCRZ7b1waEYH6JiRahf0sMAJIH2Z?=
 =?iso-8859-1?Q?yIEa5X/cSUV65miUi9JA0EFanzMoTddnQMnzWKqdYB1X+T3oG2cf8J8FpN?=
 =?iso-8859-1?Q?TNe6IUSLyZSidU1FDoTtypF5HCAYeBQASaK5zKjBDBq2QWTYEVBU5L6jtA?=
 =?iso-8859-1?Q?IeiOLYmwBugmRwXQ+IymxnRvU44ZeWsWBVbOBtKYVXxm7eU1GEBLpUr3uy?=
 =?iso-8859-1?Q?VUrwzy9vRdn/esllr47kfgxI1uFHD6TfKlSQBa1BflAPuD/LksfZF2HhGG?=
 =?iso-8859-1?Q?fWalDhztva8Vj3eQkzgDyHWDpowr/rHfFO3ul6TvYyLqKkL3SMzwL2Cw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e08a28-a391-44b7-7866-08dc8527aae0
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 06:20:59.9965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fNdaOwwGbmEIzcnjM8hbF4mjoak4XWtLflV8hBDIxg0qS+on5/2Tcpvq0rNGO0WiH/dNEoah4pFyRayzQrUcqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5925
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

kernel test robot noticed a -20.7% regression of phoronix-test-suite.quadray.1.4K.fps on:


commit: 225a8d0bd93eb87fe49947069075260031bad8af ("drm/ast: Implement polling for VGA and SIL164 connectors")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[still regression on linus/master cc8ed4d0a8486c7472cd72ec3c19957e509dc68c]

testcase: phoronix-test-suite
test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory
parameters:

	need_x: true
	test: quadray-1.0.0
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202406041618.27dcc912-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240604/202406041618.27dcc912-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/need_x/rootfs/tbox_group/test/testcase:
  gcc-13/performance/x86_64-rhel-8.3/true/debian-12-x86_64-phoronix/lkp-csl-2sp7/quadray-1.0.0/phoronix-test-suite

commit: 
  90170b186f ("drm/ast: Use drm_connector_helper_get_modes()")
  225a8d0bd9 ("drm/ast: Implement polling for VGA and SIL164 connectors")

90170b186ff552ec 225a8d0bd93eb87fe4994706907 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 1.111e+10           +12.9%  1.255e+10        cpuidle..time
     14222           +10.2%      15679        uptime.idle
    163671           -12.8%     142655        meminfo.Active(anon)
      4329 ± 12%     +80.5%       7815 ±  6%  meminfo.Unevictable
      3474 ± 14%    +123.5%       7765 ±  6%  numa-meminfo.node0.Unevictable
    121019 ±  7%     -14.5%     103492 ±  9%  numa-meminfo.node1.SUnreclaim
    867.71 ± 14%    +124.5%       1947 ±  6%  numa-vmstat.node0.nr_unevictable
    867.71 ± 14%    +124.5%       1947 ±  6%  numa-vmstat.node0.nr_zone_unevictable
     30255 ±  7%     -14.5%      25872 ±  9%  numa-vmstat.node1.nr_slab_unreclaimable
     66.62            +8.7       75.29        mpstat.cpu.all.idle%
      0.04 ±  5%      -0.0        0.04 ±  3%  mpstat.cpu.all.iowait%
     31.27            -8.7       22.56        mpstat.cpu.all.usr%
     71.42           -21.8%      55.86        mpstat.max_utilization_pct
     66.94           +12.7%      75.45        vmstat.cpu.id
     30.89           -27.6%      22.35        vmstat.cpu.us
     31.57 ±  7%     -28.2%      22.68 ±  6%  vmstat.procs.r
     38169           -30.2%      26649        vmstat.system.cs
    104008            -1.5%     102498        vmstat.system.in
     56.12           -38.1%      34.74        phoronix-test-suite.quadray.1.1080p.fps
     19.97           -20.7%      15.83        phoronix-test-suite.quadray.1.4K.fps
      4483           -30.9%       3099        phoronix-test-suite.time.involuntary_context_switches
     78630            +8.1%      84966        phoronix-test-suite.time.maximum_resident_set_size
     55806           +14.5%      63914        phoronix-test-suite.time.minor_page_faults
     21.00           +57.1%      33.00        phoronix-test-suite.time.percent_of_cpu_this_job_got
     35.04           +56.0%      54.68        phoronix-test-suite.time.system_time
      7625           -19.0%       6173        phoronix-test-suite.time.voluntary_context_switches
      0.04 ± 10%     +48.9%       0.06 ± 13%  perf-sched.sch_delay.avg.ms.futex_wait_queue.__futex_wait.futex_wait.do_futex
      0.27 ± 12%    +372.4%       1.26 ±  5%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.27 ± 34%     -75.2%       0.07 ±102%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
     11.02 ± 13%    +127.0%      25.02 ± 15%  perf-sched.sch_delay.max.ms.futex_wait_queue.__futex_wait.futex_wait.do_futex
      8.33 ±  3%    +138.9%      19.90 ±  6%  perf-sched.sch_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      2.91 ± 21%     -58.3%       1.21 ± 98%  perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      0.05 ±  6%     +60.2%       0.08 ±  9%  perf-sched.total_sch_delay.average.ms
     11.90 ± 15%    +120.4%      26.23 ± 24%  perf-sched.total_sch_delay.max.ms
     15.05           +22.8%      18.49 ±  3%  perf-sched.total_wait_and_delay.average.ms
     80232           -16.1%      67342        perf-sched.total_wait_and_delay.count.ms
     15.00           +22.7%      18.41 ±  3%  perf-sched.total_wait_time.average.ms
      3.64           +42.3%       5.18 ±  2%  perf-sched.wait_and_delay.avg.ms.futex_wait_queue.__futex_wait.futex_wait.do_futex
     90.00           -17.4%      74.33        perf-sched.wait_and_delay.count.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
     70051           -17.5%      57775        perf-sched.wait_and_delay.count.futex_wait_queue.__futex_wait.futex_wait.do_futex
    602.83 ±  2%     -21.7%     472.17 ±  6%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      1765 ± 11%     -19.4%       1422 ±  7%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
    116.83           -13.6%     101.00        perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    106.50 ±  7%     -18.3%      87.00        perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      3.60           +42.2%       5.12 ±  2%  perf-sched.wait_time.avg.ms.futex_wait_queue.__futex_wait.futex_wait.do_futex
     40914           -12.8%      35675        proc-vmstat.nr_active_anon
     52223            -1.1%      51650        proc-vmstat.nr_mapped
    220939            -1.4%     217941        proc-vmstat.nr_shmem
      1080 ± 12%     +80.7%       1952 ±  6%  proc-vmstat.nr_unevictable
     40914           -12.8%      35675        proc-vmstat.nr_zone_active_anon
      1080 ± 12%     +80.7%       1952 ±  6%  proc-vmstat.nr_zone_unevictable
   2065058            -1.0%    2045042        proc-vmstat.numa_hit
      7695           -17.0%       6387 ±  5%  proc-vmstat.numa_huge_pte_updates
   1965164            -1.0%    1945186        proc-vmstat.numa_local
   1063790 ±  9%     -42.3%     613288 ± 24%  proc-vmstat.numa_pages_migrated
   4964834 ±  2%     -17.8%    4082696 ±  5%  proc-vmstat.numa_pte_updates
   8607074            -5.2%    8158224        proc-vmstat.pgalloc_normal
   1978251            -1.2%    1955447        proc-vmstat.pgfault
   8431195            -5.2%    7991033        proc-vmstat.pgfree
   1063790 ±  9%     -42.3%     613288 ± 24%  proc-vmstat.pgmigrate_success
      1993 ±  8%     -43.1%       1133 ± 27%  proc-vmstat.thp_migration_success
      1294 ± 18%     +53.3%       1983 ± 11%  proc-vmstat.unevictable_pgs_culled
      1542          +167.8%       4129        proc-vmstat.unevictable_pgs_rescued
      1540          +168.1%       4129        proc-vmstat.unevictable_pgs_scanned
 6.281e+09           -26.0%  4.647e+09        perf-stat.i.branch-instructions
  56973457           -14.0%   49001935        perf-stat.i.branch-misses
     10.03 ±  2%      +0.9       10.96 ±  2%  perf-stat.i.cache-miss-rate%
  78657246            -7.8%   72518615        perf-stat.i.cache-references
     38775           -30.5%      26963        perf-stat.i.context-switches
 6.397e+10           -25.5%  4.768e+10        perf-stat.i.cpu-cycles
    239.88           -15.3%     203.11        perf-stat.i.cpu-migrations
      8741           -30.0%       6115        perf-stat.i.cycles-between-cache-misses
 2.556e+10           -27.6%  1.851e+10        perf-stat.i.dTLB-loads
    261339 ±  2%      +5.5%     275626        perf-stat.i.dTLB-store-misses
 7.475e+09           -27.3%  5.432e+09        perf-stat.i.dTLB-stores
 6.955e+10           -27.2%  5.066e+10        perf-stat.i.instructions
    127843 ±  4%     -31.0%      88183 ±  8%  perf-stat.i.instructions-per-iTLB-miss
      0.93            -2.5%       0.91        perf-stat.i.ipc
      0.67           -25.5%       0.50        perf-stat.i.metric.GHz
    817.80 ±  2%      +5.1%     859.37        perf-stat.i.metric.K/sec
    409.53           -27.3%     297.72        perf-stat.i.metric.M/sec
     84.00            -1.8       82.21        perf-stat.i.node-load-miss-rate%
   1384348 ±  2%      -7.2%    1284661 ±  2%  perf-stat.i.node-load-misses
    125510 ±  3%     +24.4%     156182 ±  8%  perf-stat.i.node-loads
     71.29            -3.4       67.93 ±  2%  perf-stat.i.node-store-miss-rate%
    523504           -17.7%     430816 ±  2%  perf-stat.i.node-store-misses
    213144 ±  2%     +15.8%     246785 ±  3%  perf-stat.i.node-stores
      0.11           +39.6%       0.15        perf-stat.overall.MPKI
      0.91            +0.1        1.05        perf-stat.overall.branch-miss-rate%
      9.35            +1.0       10.32        perf-stat.overall.cache-miss-rate%
      0.92            +2.3%       0.94        perf-stat.overall.cpi
      8704           -26.7%       6378        perf-stat.overall.cycles-between-cache-misses
      0.01 ±  3%      +0.0        0.01 ±  2%  perf-stat.overall.dTLB-load-miss-rate%
      0.00            +0.0        0.01        perf-stat.overall.dTLB-store-miss-rate%
    102275 ±  2%     -28.2%      73404 ±  5%  perf-stat.overall.instructions-per-iTLB-miss
      1.09            -2.3%       1.06        perf-stat.overall.ipc
     91.69            -2.5       89.17        perf-stat.overall.node-load-miss-rate%
     71.11            -7.4       63.68 ±  2%  perf-stat.overall.node-store-miss-rate%
  6.25e+09           -26.0%  4.627e+09        perf-stat.ps.branch-instructions
  56661994           -14.0%   48708479        perf-stat.ps.branch-misses
  78223374            -7.8%   72131148        perf-stat.ps.cache-references
     38582           -30.4%      26869        perf-stat.ps.context-switches
 6.366e+10           -25.4%  4.748e+10        perf-stat.ps.cpu-cycles
    238.63           -15.3%     202.10        perf-stat.ps.cpu-migrations
 2.543e+10           -27.5%  1.844e+10        perf-stat.ps.dTLB-loads
    259808 ±  2%      +5.5%     273979        perf-stat.ps.dTLB-store-misses
 7.439e+09           -27.3%   5.41e+09        perf-stat.ps.dTLB-stores
 6.922e+10           -27.1%  5.046e+10        perf-stat.ps.instructions
     10376            -1.3%      10239        perf-stat.ps.minor-faults
   1377413 ±  2%      -7.1%    1279894 ±  2%  perf-stat.ps.node-load-misses
    124856 ±  3%     +24.4%     155291 ±  8%  perf-stat.ps.node-loads
    520916           -17.6%     429190 ±  2%  perf-stat.ps.node-store-misses
    211695 ±  2%     +15.6%     244709 ±  3%  perf-stat.ps.node-stores
     10377            -1.3%      10240        perf-stat.ps.page-faults
 1.202e+13           -27.1%  8.768e+12        perf-stat.total.instructions
    606134           -33.8%     401441        sched_debug.cfs_rq:/.avg_vruntime.avg
    670950 ±  2%     -33.8%     444130 ±  3%  sched_debug.cfs_rq:/.avg_vruntime.max
    563846           -33.6%     374494        sched_debug.cfs_rq:/.avg_vruntime.min
     22319 ±  4%     -31.5%      15287 ±  6%  sched_debug.cfs_rq:/.avg_vruntime.stddev
    103511 ± 34%     +95.3%     202131 ± 22%  sched_debug.cfs_rq:/.load.max
    606134           -33.8%     401441        sched_debug.cfs_rq:/.min_vruntime.avg
    670950 ±  2%     -33.8%     444130 ±  3%  sched_debug.cfs_rq:/.min_vruntime.max
    563846           -33.6%     374494        sched_debug.cfs_rq:/.min_vruntime.min
     22319 ±  4%     -31.5%      15287 ±  6%  sched_debug.cfs_rq:/.min_vruntime.stddev
    264.47 ±  6%     -21.5%     207.64 ± 11%  sched_debug.cfs_rq:/.runnable_avg.avg
    136.83 ±  6%     -34.8%      89.17 ± 23%  sched_debug.cfs_rq:/.runnable_avg.min
    152.37 ±  3%     +16.8%     177.90 ±  5%  sched_debug.cfs_rq:/.runnable_avg.stddev
    259.58 ±  6%     -22.2%     201.97 ± 11%  sched_debug.cfs_rq:/.util_avg.avg
    137.33 ±  6%     -35.4%      88.78 ± 22%  sched_debug.cfs_rq:/.util_avg.min
    140.62 ±  4%     +16.5%     163.84 ±  5%  sched_debug.cfs_rq:/.util_avg.stddev
    592.00 ± 13%     +22.1%     723.11 ±  9%  sched_debug.cfs_rq:/.util_est.max
    547209           -34.8%     356717        sched_debug.cfs_rq:/system.slice.avg_vruntime.avg
    618905 ±  2%     -34.6%     404794 ±  2%  sched_debug.cfs_rq:/system.slice.avg_vruntime.max
    521797           -35.1%     338571        sched_debug.cfs_rq:/system.slice.avg_vruntime.min
     18251 ±  2%     -28.7%      13004 ±  5%  sched_debug.cfs_rq:/system.slice.avg_vruntime.stddev
     56909 ± 28%    +153.6%     144344 ± 82%  sched_debug.cfs_rq:/system.slice.load.max
      9116 ± 29%    +115.2%      19622 ± 64%  sched_debug.cfs_rq:/system.slice.load.stddev
     50.67 ± 16%     +65.7%      83.94 ± 16%  sched_debug.cfs_rq:/system.slice.load_avg.max
      8.45 ± 10%     +56.0%      13.18 ± 15%  sched_debug.cfs_rq:/system.slice.load_avg.stddev
    547209           -34.8%     356717        sched_debug.cfs_rq:/system.slice.min_vruntime.avg
    618905 ±  2%     -34.6%     404794 ±  2%  sched_debug.cfs_rq:/system.slice.min_vruntime.max
    521797           -35.1%     338571        sched_debug.cfs_rq:/system.slice.min_vruntime.min
     18251 ±  2%     -28.7%      13004 ±  5%  sched_debug.cfs_rq:/system.slice.min_vruntime.stddev
    277.76 ±  6%     -20.5%     220.69 ± 11%  sched_debug.cfs_rq:/system.slice.runnable_avg.avg
    136.83 ±  6%     -34.8%      89.17 ± 23%  sched_debug.cfs_rq:/system.slice.runnable_avg.min
    151.58 ±  3%     +17.4%     177.93 ±  5%  sched_debug.cfs_rq:/system.slice.runnable_avg.stddev
     89.17 ± 26%     +88.7%     168.28 ± 21%  sched_debug.cfs_rq:/system.slice.se->avg.load_avg.max
     13.11 ± 17%     +86.5%      24.45 ± 21%  sched_debug.cfs_rq:/system.slice.se->avg.load_avg.stddev
    277.72 ±  6%     -20.6%     220.65 ± 11%  sched_debug.cfs_rq:/system.slice.se->avg.runnable_avg.avg
    136.83 ±  6%     -35.0%      88.94 ± 22%  sched_debug.cfs_rq:/system.slice.se->avg.runnable_avg.min
    151.58 ±  3%     +17.4%     177.94 ±  5%  sched_debug.cfs_rq:/system.slice.se->avg.runnable_avg.stddev
    273.20 ±  6%     -21.2%     215.28 ± 12%  sched_debug.cfs_rq:/system.slice.se->avg.util_avg.avg
    137.33 ±  6%     -35.4%      88.72 ± 22%  sched_debug.cfs_rq:/system.slice.se->avg.util_avg.min
    140.29 ±  4%     +16.9%     164.04 ±  5%  sched_debug.cfs_rq:/system.slice.se->avg.util_avg.stddev
     17958           -20.5%      14275        sched_debug.cfs_rq:/system.slice.se->sum_exec_runtime.avg
     16786           -21.6%      13152        sched_debug.cfs_rq:/system.slice.se->sum_exec_runtime.min
    606216           -33.8%     401503        sched_debug.cfs_rq:/system.slice.se->vruntime.avg
    670950 ±  2%     -33.8%     444130 ±  3%  sched_debug.cfs_rq:/system.slice.se->vruntime.max
    564037           -33.6%     374561        sched_debug.cfs_rq:/system.slice.se->vruntime.min
     22389 ±  4%     -31.7%      15303 ±  6%  sched_debug.cfs_rq:/system.slice.se->vruntime.stddev
     56.83 ± 23%     +70.9%      97.11 ± 30%  sched_debug.cfs_rq:/system.slice.tg_load_avg_contrib.max
      1.39 ±  8%     -52.0%       0.67 ± 28%  sched_debug.cfs_rq:/system.slice.tg_load_avg_contrib.min
      8.85 ± 15%     +57.9%      13.98 ± 25%  sched_debug.cfs_rq:/system.slice.tg_load_avg_contrib.stddev
    273.24 ±  6%     -21.2%     215.31 ± 12%  sched_debug.cfs_rq:/system.slice.util_avg.avg
    137.44 ±  6%     -35.2%      89.06 ± 23%  sched_debug.cfs_rq:/system.slice.util_avg.min
    140.27 ±  4%     +16.9%     164.03 ±  5%  sched_debug.cfs_rq:/system.slice.util_avg.stddev
    551082 ±  2%     -34.5%     361028 ±  2%  sched_debug.cfs_rq:/system.slice/containerd.service.se->vruntime.avg
    571085 ±  3%     -34.5%     374118 ±  3%  sched_debug.cfs_rq:/system.slice/containerd.service.se->vruntime.max
    532487 ±  2%     -34.4%     349458 ±  3%  sched_debug.cfs_rq:/system.slice/containerd.service.se->vruntime.min
    152088 ± 11%     -21.3%     119639 ± 14%  sched_debug.cpu.avg_idle.stddev
      0.26 ± 21%     +29.0%       0.33 ± 10%  sched_debug.cpu.nr_running.stddev
     16071           -20.4%      12797        sched_debug.cpu.nr_switches.avg
     11961 ±  3%     -25.4%       8924        sched_debug.cpu.nr_switches.min
      1.96 ±  3%      -0.2        1.76 ±  4%  perf-profile.calltrace.cycles-pp.pthread_barrier_wait
      1.84 ±  3%      -0.2        1.65 ±  4%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.pthread_barrier_wait
      1.84 ±  3%      -0.2        1.65 ±  4%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.pthread_barrier_wait
      1.74 ±  3%      -0.2        1.55 ±  4%  perf-profile.calltrace.cycles-pp.__futex_wait.futex_wait.do_futex.__x64_sys_futex.do_syscall_64
      1.82 ±  3%      -0.2        1.62 ±  4%  perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.pthread_barrier_wait
      1.81 ±  3%      -0.2        1.62 ±  3%  perf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.pthread_barrier_wait
      1.74 ±  3%      -0.2        1.55 ±  3%  perf-profile.calltrace.cycles-pp.futex_wait.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.91 ±  4%      -0.2        0.75 ±  6%  perf-profile.calltrace.cycles-pp.futex_q_lock.futex_wait_setup.__futex_wait.futex_wait.do_futex
      0.93 ±  4%      -0.2        0.76 ±  6%  perf-profile.calltrace.cycles-pp.futex_wait_setup.__futex_wait.futex_wait.do_futex.__x64_sys_futex
      0.87 ±  4%      -0.2        0.71 ±  6%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.futex_q_lock.futex_wait_setup.__futex_wait
      0.88 ±  4%      -0.2        0.72 ±  6%  perf-profile.calltrace.cycles-pp._raw_spin_lock.futex_q_lock.futex_wait_setup.__futex_wait.futex_wait
      0.62 ±  6%      +0.3        0.90 ± 11%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.62 ±  7%      +0.3        0.91 ± 11%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.94 ±  5%      +0.4        1.36 ± 10%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      1.02 ±  4%      +0.4        1.46 ± 11%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.26 ±100%      +0.5        0.73 ± 12%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      6.71 ±  3%      +1.3        8.05 ±  3%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      1.47 ±  4%      +1.6        3.11 ±  3%  perf-profile.calltrace.cycles-pp.memcpy_toio.drm_fb_memcpy.ast_primary_plane_helper_atomic_update.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail_rpm
      1.48 ±  4%      +1.7        3.17 ±  3%  perf-profile.calltrace.cycles-pp.ast_primary_plane_helper_atomic_update.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail_rpm.ast_mode_config_helper_atomic_commit_tail.commit_tail
      1.49 ±  4%      +1.7        3.18 ±  3%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.ioctl
      1.48 ±  4%      +1.7        3.17 ±  3%  perf-profile.calltrace.cycles-pp.drm_fb_memcpy.ast_primary_plane_helper_atomic_update.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail_rpm.ast_mode_config_helper_atomic_commit_tail
      1.49 ±  4%      +1.7        3.18 ±  3%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.ioctl
      1.49 ±  4%      +1.7        3.18 ±  3%  perf-profile.calltrace.cycles-pp.ioctl
      1.49 ±  4%      +1.7        3.18 ±  3%  perf-profile.calltrace.cycles-pp.__x64_sys_ioctl.do_syscall_64.entry_SYSCALL_64_after_hwframe.ioctl
      1.49 ±  4%      +1.7        3.18 ±  3%  perf-profile.calltrace.cycles-pp.drm_ioctl.__x64_sys_ioctl.do_syscall_64.entry_SYSCALL_64_after_hwframe.ioctl
      1.49 ±  4%      +1.7        3.18 ±  3%  perf-profile.calltrace.cycles-pp.drm_ioctl_kernel.drm_ioctl.__x64_sys_ioctl.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.49 ±  4%      +1.7        3.18 ±  3%  perf-profile.calltrace.cycles-pp.drm_mode_dirtyfb_ioctl.drm_ioctl_kernel.drm_ioctl.__x64_sys_ioctl.do_syscall_64
      1.49 ±  4%      +1.7        3.18 ±  3%  perf-profile.calltrace.cycles-pp.drm_atomic_helper_dirtyfb.drm_mode_dirtyfb_ioctl.drm_ioctl_kernel.drm_ioctl.__x64_sys_ioctl
      1.49 ±  4%      +1.7        3.18 ±  3%  perf-profile.calltrace.cycles-pp.ast_mode_config_helper_atomic_commit_tail.commit_tail.drm_atomic_helper_commit.drm_atomic_commit.drm_atomic_helper_dirtyfb
      1.49 ±  4%      +1.7        3.18 ±  3%  perf-profile.calltrace.cycles-pp.commit_tail.drm_atomic_helper_commit.drm_atomic_commit.drm_atomic_helper_dirtyfb.drm_mode_dirtyfb_ioctl
      1.49 ±  4%      +1.7        3.18 ±  3%  perf-profile.calltrace.cycles-pp.drm_atomic_commit.drm_atomic_helper_dirtyfb.drm_mode_dirtyfb_ioctl.drm_ioctl_kernel.drm_ioctl
      1.49 ±  4%      +1.7        3.18 ±  3%  perf-profile.calltrace.cycles-pp.drm_atomic_helper_commit.drm_atomic_commit.drm_atomic_helper_dirtyfb.drm_mode_dirtyfb_ioctl.drm_ioctl_kernel
      1.49 ±  4%      +1.7        3.18 ±  3%  perf-profile.calltrace.cycles-pp.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail_rpm.ast_mode_config_helper_atomic_commit_tail.commit_tail.drm_atomic_helper_commit
      1.49 ±  4%      +1.7        3.18 ±  3%  perf-profile.calltrace.cycles-pp.drm_atomic_helper_commit_tail_rpm.ast_mode_config_helper_atomic_commit_tail.commit_tail.drm_atomic_helper_commit.drm_atomic_commit
      7.89 ±  3%      +1.8        9.66 ±  4%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      7.96 ±  3%      +1.8        9.78 ±  4%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      8.61 ±  3%      +1.9       10.46 ±  4%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
      8.61 ±  3%      +1.9       10.46 ±  4%  perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
      8.31 ±  3%      +1.9       10.17 ±  4%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      8.60 ±  3%      +1.9       10.46 ±  4%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      8.74 ±  3%      +1.9       10.66 ±  4%  perf-profile.calltrace.cycles-pp.common_startup_64
     85.27            -3.2       82.08        perf-profile.children.cycles-pp.rt_simd_1K4v2::render0
      1.96 ±  3%      -0.2        1.76 ±  4%  perf-profile.children.cycles-pp.pthread_barrier_wait
      1.82 ±  3%      -0.2        1.64 ±  3%  perf-profile.children.cycles-pp.__x64_sys_futex
      1.74 ±  3%      -0.2        1.56 ±  3%  perf-profile.children.cycles-pp.futex_wait
      1.82 ±  3%      -0.2        1.63 ±  3%  perf-profile.children.cycles-pp.do_futex
      1.74 ±  3%      -0.2        1.56 ±  3%  perf-profile.children.cycles-pp.__futex_wait
      1.04 ±  4%      -0.2        0.87 ±  4%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.91 ±  4%      -0.2        0.75 ±  6%  perf-profile.children.cycles-pp.futex_q_lock
      0.93 ±  4%      -0.2        0.76 ±  6%  perf-profile.children.cycles-pp.futex_wait_setup
      1.18 ±  3%      -0.2        1.02 ±  4%  perf-profile.children.cycles-pp._raw_spin_lock
      0.25 ±  4%      -0.1        0.14 ±  9%  perf-profile.children.cycles-pp.update_cfs_group
      0.28 ±  7%      -0.1        0.20 ±  7%  perf-profile.children.cycles-pp.update_load_avg
      0.06 ± 11%      +0.0        0.08 ±  7%  perf-profile.children.cycles-pp.perf_rotate_context
      0.09 ±  7%      +0.0        0.11 ± 15%  perf-profile.children.cycles-pp.run_rebalance_domains
      0.10 ±  9%      +0.0        0.13 ±  8%  perf-profile.children.cycles-pp.update_blocked_averages
      0.10 ±  8%      +0.0        0.13 ± 11%  perf-profile.children.cycles-pp.rebalance_domains
      0.03 ±100%      +0.1        0.08 ± 16%  perf-profile.children.cycles-pp.irq_enter_rcu
      0.02 ±142%      +0.1        0.08 ± 20%  perf-profile.children.cycles-pp.tick_irq_enter
      0.22 ±  3%      +0.1        0.29 ± 11%  perf-profile.children.cycles-pp.__do_softirq
      0.13 ± 16%      +0.1        0.20 ± 27%  perf-profile.children.cycles-pp.rest_init
      0.13 ± 16%      +0.1        0.20 ± 27%  perf-profile.children.cycles-pp.start_kernel
      0.13 ± 16%      +0.1        0.20 ± 27%  perf-profile.children.cycles-pp.x86_64_start_kernel
      0.13 ± 16%      +0.1        0.20 ± 27%  perf-profile.children.cycles-pp.x86_64_start_reservations
      0.24 ±  4%      +0.1        0.32 ± 11%  perf-profile.children.cycles-pp.irq_exit_rcu
      0.14 ±  5%      +0.1        0.22 ±  9%  perf-profile.children.cycles-pp.scheduler_tick
      0.30 ± 12%      +0.2        0.45 ± 15%  perf-profile.children.cycles-pp.update_process_times
      0.52 ±  8%      +0.3        0.78 ± 11%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.65 ±  6%      +0.3        0.96 ± 11%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.66 ±  6%      +0.3        0.96 ± 11%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      1.00 ±  5%      +0.4        1.43 ± 10%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      1.10 ±  4%      +0.5        1.63 ± 10%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      6.80 ±  3%      +1.4        8.19 ±  3%  perf-profile.children.cycles-pp.intel_idle
      3.58 ±  3%      +1.6        5.16 ±  2%  perf-profile.children.cycles-pp.do_syscall_64
      3.59 ±  3%      +1.6        5.17 ±  2%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.49 ±  4%      +1.7        3.18 ±  3%  perf-profile.children.cycles-pp.__x64_sys_ioctl
      1.48 ±  4%      +1.7        3.17 ±  3%  perf-profile.children.cycles-pp.ast_primary_plane_helper_atomic_update
      1.48 ±  4%      +1.7        3.17 ±  3%  perf-profile.children.cycles-pp.drm_fb_memcpy
      1.49 ±  4%      +1.7        3.18 ±  3%  perf-profile.children.cycles-pp.ioctl
      1.48 ±  4%      +1.7        3.17 ±  3%  perf-profile.children.cycles-pp.memcpy_toio
      1.49 ±  4%      +1.7        3.18 ±  3%  perf-profile.children.cycles-pp.drm_ioctl
      1.49 ±  4%      +1.7        3.18 ±  3%  perf-profile.children.cycles-pp.drm_ioctl_kernel
      1.49 ±  4%      +1.7        3.18 ±  3%  perf-profile.children.cycles-pp.drm_mode_dirtyfb_ioctl
      1.49 ±  4%      +1.7        3.18 ±  3%  perf-profile.children.cycles-pp.drm_atomic_helper_dirtyfb
      1.49 ±  4%      +1.7        3.18 ±  3%  perf-profile.children.cycles-pp.ast_mode_config_helper_atomic_commit_tail
      1.49 ±  4%      +1.7        3.18 ±  3%  perf-profile.children.cycles-pp.commit_tail
      1.49 ±  4%      +1.7        3.18 ±  3%  perf-profile.children.cycles-pp.drm_atomic_commit
      1.49 ±  4%      +1.7        3.18 ±  3%  perf-profile.children.cycles-pp.drm_atomic_helper_commit
      1.49 ±  4%      +1.7        3.18 ±  3%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_planes
      1.49 ±  4%      +1.7        3.18 ±  3%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_tail_rpm
      8.61 ±  3%      +1.9       10.46 ±  4%  perf-profile.children.cycles-pp.start_secondary
      8.08 ±  3%      +1.9        9.96 ±  4%  perf-profile.children.cycles-pp.cpuidle_enter_state
      8.08 ±  3%      +1.9        9.97 ±  4%  perf-profile.children.cycles-pp.cpuidle_enter
      8.74 ±  3%      +1.9       10.66 ±  4%  perf-profile.children.cycles-pp.common_startup_64
      8.74 ±  3%      +1.9       10.66 ±  4%  perf-profile.children.cycles-pp.cpu_startup_entry
      8.73 ±  3%      +1.9       10.66 ±  4%  perf-profile.children.cycles-pp.do_idle
      8.44 ±  3%      +1.9       10.37 ±  4%  perf-profile.children.cycles-pp.cpuidle_idle_call
     85.27            -3.2       82.08        perf-profile.self.cycles-pp.rt_simd_1K4v2::render0
      1.04 ±  4%      -0.2        0.86 ±  4%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.25 ±  4%      -0.1        0.14 ±  9%  perf-profile.self.cycles-pp.update_cfs_group
      0.22 ± 10%      -0.1        0.13 ± 11%  perf-profile.self.cycles-pp.update_load_avg
      0.11 ±  4%      +0.1        0.16 ± 13%  perf-profile.self.cycles-pp.cpuidle_enter_state
      6.80 ±  3%      +1.4        8.19 ±  3%  perf-profile.self.cycles-pp.intel_idle
      1.48 ±  4%      +1.7        3.16 ±  3%  perf-profile.self.cycles-pp.memcpy_toio




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

