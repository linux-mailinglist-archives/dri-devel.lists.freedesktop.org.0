Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6901AADC4A1
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 10:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC3410E19E;
	Tue, 17 Jun 2025 08:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WEC84by6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B7010E02B;
 Tue, 17 Jun 2025 08:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750148709; x=1781684709;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=uPKSxscyYjb+2IQNBolyeoxNCvOorUZ8+XLbRW9X9+c=;
 b=WEC84by6mtKtCVwX1nJ2j+BSnx8KCeslRYNHAEpkx8M6LPEIf2hdjb6R
 5qkivMLxi27DlfX9JKOfQVVcMtrtiQiNbxV0OVXk53ivOhLQbPiTAlHuu
 PYfVlGq8g+MVdOCQLdja4tqUSVL/3TRJFKp4/pACPTm/XLOH2MZC8HtV8
 rUP3lC5nsW7uA61jOUmB/gtliLOSwPjFDU+gPKTnslfMonrQ4Dhs8C9//
 wS0mEjZ+XKE6KxHFNd+gHifn874KYCKhmwU1nCsQhcCTEz1Xgug2nVzDx
 tcmEF8lnZy1nCyO1SHAEPjyKs4uyrRSuKIlujExxIa6jM73aLQIuDMJRR g==;
X-CSE-ConnectionGUID: UyqgcFGYScKlIwypspAECg==
X-CSE-MsgGUID: h1WuG+e5TcGKMKiMdhKrcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52018043"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="52018043"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 01:25:08 -0700
X-CSE-ConnectionGUID: FKFNbhJNS8+4lzSQ5gORuw==
X-CSE-MsgGUID: eZJeplSYTbS8u1Ou5+c2aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="149175847"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 01:25:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 01:25:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 01:25:02 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.67)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 01:24:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vD9JXpkmnNdNmHBzdmz8zH4PL/iDtxCvFEYUSjDLUKDxudc5mchFP13MCxEGQ/j/fQCQ5JTVefbBVhwThza+unNLssmj3Sbee4H2oVOntflyQnLjY2hVp28KKcv7xQLyIP0lH+xlTx6X3womJE/mzF9MjIMYO9GiSXhdJ0kg2Vz2HMtUr7nS1g7ivnfb1cps6p1gfoBfuNKKOVudGRKyQpO7vjnj/WSkTS/AI1ZIh9bp65VWXBWVhTfcG8fNI6tqNmJMk5+tOLJCfilpkcpuGW6YtIdvDILKD+9V7tsI0xuCWtBq5gqIf0Qg+NoAgpzVpQXatwifR76NGZX3ZpyUbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3CmOqLb8pOJ7i9YfHi2/RV39IVyiQ/I2LsgBGw3l0Jg=;
 b=asQhsQtjtrYLLq7KXcSZYwCGjvTGVfbwu55dGOnxIc9mAJAN3hfHlrVjmn+IUkXohOpwcR0LLu6fH4bZd7Fdi57qSRO0dHuyXUpzWbiMMc6aQUuHIo2T1V5jabBWA+ZtnPjXt5GiuAjTcYh74nTgvH3yZMXWxi6fd+ENuaZUgYxJ0IUOGzS3YN3anda8NNM5CiptMMQqqK08y83AmE3dYbJn1kUTvAOqj6DOdYd/3LrzK8kdHYR5hkg3+HqEU6mNF0fSSIpqWYKcDV7uy8P334+qyBHdGvzqrQAX/q+EI5k06A/8RD4fy5wOvzoOzhOEexSLU7anl9CrfStZozRZHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH0PR11MB5013.namprd11.prod.outlook.com (2603:10b6:510:30::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 08:24:28 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8792.034; Tue, 17 Jun 2025
 08:24:28 +0000
Date: Tue, 17 Jun 2025 16:24:13 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jeff Layton <jlayton@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Krzysztof Karas
 <krzysztof.karas@intel.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, "Qasim
 Ijaz" <qasdev00@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Andrew
 Lunn <andrew@lunn.ch>, <netdev@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>, "Jeff
 Layton" <jlayton@kernel.org>, <oliver.sang@intel.com>
Subject: Re: [PATCH v14 6/9] ref_tracker: automatically register a file in
 debugfs for a ref_tracker_dir
Message-ID: <202506171517.a1e85b6f-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250610-reftrack-dbgfs-v14-6-efb532861428@kernel.org>
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH0PR11MB5013:EE_
X-MS-Office365-Filtering-Correlation-Id: 43a5807b-53f0-4cea-3b16-08ddad7860bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1l/CCmnBeo0ECRxAL+2nCIWU4IMz+mkcTUOgLQvvx1DPnn/RkT3l0LMzARNp?=
 =?us-ascii?Q?wTHe7mAOB9zz6Rz0754MZzvh6CgGrTdtM4+7izyvHc0UK3KJcbe4zUDB+Dpg?=
 =?us-ascii?Q?empfnYB1jC/eoQ26gguFM0X4RGVVGOI9TcavUWicOl/2KMPLxZFDE2NyOG0Z?=
 =?us-ascii?Q?7SHU+DJ9FW+ZJlij00zPb7Ek3TiYDdkw1lvShoNGrUpdV6BhidALEyxNpAMv?=
 =?us-ascii?Q?PhqOzSSD1OnBwsiy0+ilD59Nb18/40Dy7Fl6nbu1DO5wi4kh6JnWQ/G6nynO?=
 =?us-ascii?Q?rx2Rp2vQg4+ksJEHjiHEx5x5zhgCTuTvs3eZuVV1X4yRq5t0gVMgotLJ41gm?=
 =?us-ascii?Q?75gc87FGX96wpbwgPgZWspSXp7k0AKSZE3ppIjBKyVX3xwDycd6afN0h3huq?=
 =?us-ascii?Q?Tz2JbjFp25TcIREZ6RJtiITYjJA6dXQGqPS4W5dpheG/Wr525MTf9m0pUmQv?=
 =?us-ascii?Q?Ehp+KMaJnw15RArK4oiqag9Vm+CCxJPNSq9d2muooRVX9+V900/Zim3Knp+p?=
 =?us-ascii?Q?X853qjwP0/sp4duTJvXY/fH+iwn+C+svsb+yWAdeAWhW+s5bwVb4ds4Jbzgp?=
 =?us-ascii?Q?rAtwwB+S6M7sBB5DugqqdMMw+EKVqqYMqRIIJg4zjkPdRmSmfqrT8as6Nlh1?=
 =?us-ascii?Q?evesHICJSRuVRKz1uL94tQqBbkPKkgXIW82Da7WXssmuj1qZDv7rexX/h4XF?=
 =?us-ascii?Q?4uAP4fOly/+p/PWLeBw38/TOryt35hNJNHD4glXgEm5ugPJtlUB6QWll9Mjc?=
 =?us-ascii?Q?98HgJck86qXlSTkWewY7Juz3RpPQ0LE9F7FQcYWHpbMtu9OjqwqDBnZmwCZP?=
 =?us-ascii?Q?ebTm/6wAAGY/per/YZtlYCNfNHgnIP2+Gp+OR9d0kFYcQoXn4OsQ58vcuqiF?=
 =?us-ascii?Q?9ug54wX+GDyCLdKP9+x6/2IyUWsGpBZ/IzynQ/xE3iGrBWet47QI1utpwyK6?=
 =?us-ascii?Q?eNztrKAlfz0g+fmpURrSdW5oc0QuqyuR3C2YXxf2ABVK2JrzHIyhaOKlaL/0?=
 =?us-ascii?Q?XLpHhO2NFvOZHF4N/xtFJ6OcAwp6e2gdkzg1VSR9ZVYHxNSRkA3y02GsqHDk?=
 =?us-ascii?Q?MQMeIQdFgdKxQ6YRbKBzNgEB4mkKODBrU3qWFRMQjZoP37bKHFAlWC1Q8g6N?=
 =?us-ascii?Q?8FzeNt7egr7yDh9Wz2057LDtTzXj7e9l34VC62b3yOnznFwDf6SDWNha4IfV?=
 =?us-ascii?Q?uZDiiMCoetgtOPW50PnRnFvaWMwz/aPHFfeylAE0YsF8nJIWtPi1zzpkDzV8?=
 =?us-ascii?Q?0ZZVcnVSm6bymsK2TwujSl1lEn8KX9eU697NBFpZ5g17W1H95wG0hgD4o3xm?=
 =?us-ascii?Q?eo/1wgBCwyqdCDEj34JEq8byExQtxz7leJ0H3w0yC5h2ODiQ3JUsUl2a2gRE?=
 =?us-ascii?Q?6R+/BXrULphvz1UKCLxnv/y2t+vy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/M2XI7+AOH9rpgN63QijMhShb+ijRbR2QKFqHlxVmpkTGRxhp33iYhJPMPSJ?=
 =?us-ascii?Q?KN0HPSgM14WV6+CGl5ed+ZvKqN/Ks43+1QbV4f5Ia9WjAYBnLg6giXUW9Eyz?=
 =?us-ascii?Q?G7UJjoi/nwSITsvw7YHJI+nO3cBGaKibz66WX3Iqv8O7/4zuSJ/y6w9/9Qrr?=
 =?us-ascii?Q?TgUtg/pZB0T9Gs5yTd5AubyOVHd6HCV0CrKydyZIiphUFZU1umTwGxAGbLHI?=
 =?us-ascii?Q?uUd+v4P1k/j6vBoZMOEaISCaMgYKjtk+QH3g307oJ/eHLOKb4c7JJA2Su8Tm?=
 =?us-ascii?Q?cryf6Q3GzqArBDmjHZbKPWFJloPf9zyaabobhdJ+UTvLszKc7xhpVKHXS4OD?=
 =?us-ascii?Q?TT4jDOIG1sI3gXz8Gm+bP6s7JPAEKCzedAi0CCTiQTiolm9TA6ECnAwy+JIF?=
 =?us-ascii?Q?eClY4Min7cUwqklo1JcbEFTTJjtzSAwXdwX2njhSW9JZtMnV7nSajpsifkWN?=
 =?us-ascii?Q?Vqi4+ARJ3pbzBrHl1SuqiLKvomaOOkHGW336qFlHfke1DqTbkFo4KuKToXJC?=
 =?us-ascii?Q?bcSA51B0STu2/NAVuX26LJzlYb4toOEVDAuTRryoy5wMIi9OVOHbyHyqMZHR?=
 =?us-ascii?Q?bn85xQFXqORQ8Jsd5mtt3jALawE05M4xe9uSfZ4d+zmZlPn55Gu+whfpWlON?=
 =?us-ascii?Q?CkhOG+wVOjgLRG9mSnnMIQYvbrfvBpfVrXd67Lhq3LC10nY8zCervpgfAH43?=
 =?us-ascii?Q?0JqQWUXLQ3TyoV+exSylRzLwYR+YWQV4zpcNgJjqFnc/Nba2F8ZRMfC1upLz?=
 =?us-ascii?Q?9ca4fevqJ+97v3hSqkNDlXsk7EW87wUd1Loo/Q4v+ZQ7oqHHt1MB6ut1s0Yt?=
 =?us-ascii?Q?wgUV1/JzKNxg3a0Pv+sjt86LqmfSv9XdeSqPkV2+NhRF+MdXQNV+EgHDJCSK?=
 =?us-ascii?Q?QEN3s5VavGLspnxCoow85XUDRFdxBGcP0AEpnqjcrInAG0chA3DmX6uX7CbF?=
 =?us-ascii?Q?S1QRoEFYD1/Cm7KvlO5UGfcKNz0i+g5SmuslsBkRNlMET1hOqyhE+nxSO9wk?=
 =?us-ascii?Q?nrd8ZOppIkxy2Uw67+ZWyhrrOD4xGBmpRcYGHOlyd0AsLTDr0WD9TNd/2oXp?=
 =?us-ascii?Q?yctIlw7Hlj4YKpIfpItuEwnjMy26qXC+7INsn/PPOiDHEbLGYeMXIrlxxD+j?=
 =?us-ascii?Q?IMJs2ScsG8SRCK1ne/YfgcNqfHN3wvB7m/9Wj1gkcPBoLHpwA7ochTrbkF3B?=
 =?us-ascii?Q?qtSuuc/JhAkp5L91qWupANDVK3wWkIvs9HC7LVWqHVKyweqB/lZtbfVhLUa4?=
 =?us-ascii?Q?tacsesUNIQacDTjOYp6YED3xkzTzg0v6VBWfcEjrzJ2QEl+uoIEMvkrELr1m?=
 =?us-ascii?Q?R+hDpfqUJdiKGIdPQag+c91uOalUZC9w++2ZAs1FtFfoVGuImO9VxLuwg/1C?=
 =?us-ascii?Q?lL5zyJ9RDNyM8zC2+wJJn2JjXor+zQwoWPu4yAF83UK9xamZeZ7vETd4itjQ?=
 =?us-ascii?Q?oNY9BpYRr3GY5Fy/wEPNp2YIrPCP7S36De9jxfldnnvFkWKiOkOif7iKnJB8?=
 =?us-ascii?Q?zOfhGIpPMcSZ0hLUAADWfGB2i5pQeRPdn07tnGzUC38GVFMPUNaOjC1LjPoS?=
 =?us-ascii?Q?cLS18BfTRfc2w8jJG1cWXYCmhvEBuS9seQpqW6+V+RKTqPlIf8dDeMdbVFt1?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a5807b-53f0-4cea-3b16-08ddad7860bc
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 08:24:28.8206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/ADEn7JoxNyuoK3JqZ22sHxbcosx+Zl4ugRgBfAbqgOw5pQ/fXyJWV0ELG522XxKRaf+lg2JjaYkaVdgH4Nlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5013
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

kernel test robot noticed "BUG:spinlock_trylock_failure_on_UP_on_CPU" on:

commit: 1d67742f4a90af28c0f655a9ed8d730459b1f220 ("[PATCH v14 6/9] ref_tracker: automatically register a file in debugfs for a ref_tracker_dir")
url: https://github.com/intel-lab-lkp/linux/commits/Jeff-Layton/ref_tracker-don-t-use-pK-in-pr_ostream-output/20250610-230236
patch link: https://lore.kernel.org/all/20250610-reftrack-dbgfs-v14-6-efb532861428@kernel.org/
patch subject: [PATCH v14 6/9] ref_tracker: automatically register a file in debugfs for a ref_tracker_dir

in testcase: boot

config: i386-randconfig-051-20250611
compiler: clang-20
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+------------+------------+
|                                             | ac254e0747 | 1d67742f4a |
+---------------------------------------------+------------+------------+
| BUG:spinlock_trylock_failure_on_UP_on_CPU   | 0          | 12         |
| WARNING:at_kernel/workqueue.c:#__queue_work | 0          | 12         |
| EIP:__queue_work                            | 0          | 12         |
+---------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202506171517.a1e85b6f-lkp@intel.com


[   13.649422][    T1] BUG: spinlock trylock failure on UP on CPU#0, swapper/1
[ 13.650195][ T1] lock: debugfs_dentries+0x0/0x34, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0 
[   13.651211][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted 6.15.0-13749-g1d67742f4a90 #1 PREEMPT(undef)
[   13.652340][    T1] Call Trace:
[ 13.652705][ T1] __dump_stack (lib/dump_stack.c:95) 
[ 13.653206][ T1] dump_stack_lvl (lib/dump_stack.c:123) 
[ 13.653363][ T1] dump_stack (lib/dump_stack.c:129) 
[ 13.653363][ T1] spin_dump (kernel/locking/spinlock_debug.c:71) 
[ 13.653363][ T1] do_raw_spin_trylock (kernel/locking/spinlock_debug.c:?) 
[ 13.653363][ T1] ? xa_set_mark (lib/xarray.c:2075 lib/xarray.c:2146) 
[ 13.653363][ T1] _raw_spin_lock (include/linux/spinlock_api_smp.h:134 kernel/locking/spinlock.c:154) 
[ 13.653363][ T1] xa_set_mark (lib/xarray.c:2075 lib/xarray.c:2146) 
[ 13.653363][ T1] ref_tracker_dir_exit (include/linux/workqueue.h:723 lib/ref_tracker.c:53 lib/ref_tracker.c:221) 
[ 13.653363][ T1] ? kvfree (mm/slub.c:5059) 
[ 13.653363][ T1] free_netdev (net/core/dev.c:11880) 
[ 13.653363][ T1] free_arcdev (drivers/net/arcnet/arcnet.c:503) 
[ 13.653363][ T1] com90io_init (drivers/net/arcnet/com90io.c:401) 
[ 13.653363][ T1] do_one_initcall (init/main.c:1273) 
[ 13.653363][ T1] ? com90io_setup (drivers/net/arcnet/com90io.c:384) 
[ 13.653363][ T1] ? __lock_acquire (kernel/locking/lockdep.c:4677) 
[ 13.653363][ T1] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 13.653363][ T1] ? sched_clock_noinstr (arch/x86/kernel/tsc.c:271) 
[ 13.653363][ T1] ? local_clock_noinstr (kernel/sched/clock.c:269 kernel/sched/clock.c:306) 
[ 13.653363][ T1] ? __lock_acquire (kernel/locking/lockdep.c:4677) 
[ 13.653363][ T1] ? local_clock_noinstr (kernel/sched/clock.c:269 kernel/sched/clock.c:306) 
[ 13.653363][ T1] ? __this_cpu_preempt_check (lib/smp_processor_id.c:67) 
[ 13.653363][ T1] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 13.653363][ T1] ? sched_clock_noinstr (arch/x86/kernel/tsc.c:271) 
[ 13.653363][ T1] ? local_clock_noinstr (kernel/sched/clock.c:269 kernel/sched/clock.c:306) 
[ 13.653363][ T1] ? __this_cpu_preempt_check (lib/smp_processor_id.c:67) 
[ 13.653363][ T1] ? irqtime_account_irq (kernel/sched/cputime.c:?) 
[ 13.653363][ T1] ? __this_cpu_preempt_check (lib/smp_processor_id.c:67) 
[ 13.653363][ T1] ? lockdep_hardirqs_on (kernel/locking/lockdep.c:4475) 
[ 13.653363][ T1] ? trace_hardirqs_on (kernel/trace/trace_preemptirq.c:80) 
[ 13.653363][ T1] ? irqentry_exit (kernel/entry/common.c:?) 
[ 13.653363][ T1] ? vmware_sched_clock (arch/x86/kernel/apic/apic.c:1050) 
[ 13.653363][ T1] ? sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1050) 
[ 13.653363][ T1] ? handle_exception (arch/x86/entry/entry_32.S:1048) 
[ 13.653363][ T1] ? strlen (arch/x86/lib/string_32.c:?) 
[ 13.653363][ T1] ? next_arg (lib/cmdline.c:273) 
[ 13.653363][ T1] ? parameq (kernel/params.c:90 kernel/params.c:99) 
[ 13.653363][ T1] ? parse_args (kernel/params.c:153) 
[ 13.653363][ T1] do_initcall_level (init/main.c:1334) 
[ 13.653363][ T1] do_initcalls (init/main.c:1348) 
[ 13.653363][ T1] do_basic_setup (init/main.c:1371) 
[ 13.653363][ T1] kernel_init_freeable (init/main.c:1585) 
[ 13.653363][ T1] ? rest_init (init/main.c:1465) 
[ 13.653363][ T1] kernel_init (init/main.c:1475) 
[ 13.653363][ T1] ret_from_fork (arch/x86/kernel/process.c:154) 
[ 13.653363][ T1] ? debug_smp_processor_id (lib/smp_processor_id.c:60) 
[ 13.653363][ T1] ? rest_init (init/main.c:1465) 
[ 13.653363][ T1] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 13.653363][ T1] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   13.679093][    T1] ------------[ cut here ]------------
[ 13.679700][ T1] WARNING: CPU: 0 PID: 1 at kernel/workqueue.c:2325 __queue_work (kernel/workqueue.c:2325) 
[   13.680616][    T1] Modules linked in:
[   13.681057][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted 6.15.0-13749-g1d67742f4a90 #1 PREEMPT(undef)
[ 13.682176][ T1] EIP: __queue_work (kernel/workqueue.c:2325) 
[ 13.682700][ T1] Code: 4d ec 8b 40 04 89 45 f0 31 db 39 c8 0f 95 c3 b8 98 9f dd d5 89 da 31 c9 6a 00 e8 d4 de 11 00 83 c4 04 8b 45 ec 39 45 f0 74 1a <0f> 0b b8 b0 9f dd d5 89 da 31 c9 6a 00 e8 b7 de 11 00 83 c4 04 e9
All code
========
   0:	4d ec                	rex.WRB in (%dx),%al
   2:	8b 40 04             	mov    0x4(%rax),%eax
   5:	89 45 f0             	mov    %eax,-0x10(%rbp)
   8:	31 db                	xor    %ebx,%ebx
   a:	39 c8                	cmp    %ecx,%eax
   c:	0f 95 c3             	setne  %bl
   f:	b8 98 9f dd d5       	mov    $0xd5dd9f98,%eax
  14:	89 da                	mov    %ebx,%edx
  16:	31 c9                	xor    %ecx,%ecx
  18:	6a 00                	push   $0x0
  1a:	e8 d4 de 11 00       	call   0x11def3
  1f:	83 c4 04             	add    $0x4,%esp
  22:	8b 45 ec             	mov    -0x14(%rbp),%eax
  25:	39 45 f0             	cmp    %eax,-0x10(%rbp)
  28:	74 1a                	je     0x44
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	b8 b0 9f dd d5       	mov    $0xd5dd9fb0,%eax
  31:	89 da                	mov    %ebx,%edx
  33:	31 c9                	xor    %ecx,%ecx
  35:	6a 00                	push   $0x0
  37:	e8 b7 de 11 00       	call   0x11def3
  3c:	83 c4 04             	add    $0x4,%esp
  3f:	e9                   	.byte 0xe9

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	b8 b0 9f dd d5       	mov    $0xd5dd9fb0,%eax
   7:	89 da                	mov    %ebx,%edx
   9:	31 c9                	xor    %ecx,%ecx
   b:	6a 00                	push   $0x0
   d:	e8 b7 de 11 00       	call   0x11dec9
  12:	83 c4 04             	add    $0x4,%esp
  15:	e9                   	.byte 0xe9
[   13.683052][    T1] EAX: d67dc32c EBX: 00000001 ECX: 00000000 EDX: 00000000
[   13.683052][    T1] ESI: c0321000 EDI: d576af44 EBP: c03a7b9c ESP: c03a7b7c
[   13.683052][    T1] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010017
[   13.683052][    T1] CR0: 80050033 CR2: b7ded3d5 CR3: 16086000 CR4: 000406d0
[   13.683052][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[   13.683052][    T1] DR6: fffe0ff0 DR7: 00000400
[   13.683052][    T1] Call Trace:
[ 13.683052][ T1] queue_work_on (kernel/workqueue.c:2392) 
[ 13.683052][ T1] ref_tracker_dir_exit (lib/ref_tracker.c:222) 
[ 13.683052][ T1] ? kvfree (mm/slub.c:5059) 
[ 13.683052][ T1] free_netdev (net/core/dev.c:11880) 
[ 13.683052][ T1] free_arcdev (drivers/net/arcnet/arcnet.c:503) 
[ 13.683052][ T1] com90io_init (drivers/net/arcnet/com90io.c:401) 
[ 13.683052][ T1] do_one_initcall (init/main.c:1273) 
[ 13.683052][ T1] ? com90io_setup (drivers/net/arcnet/com90io.c:384) 
[ 13.683052][ T1] ? __lock_acquire (kernel/locking/lockdep.c:4677) 
[ 13.683052][ T1] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 13.683052][ T1] ? sched_clock_noinstr (arch/x86/kernel/tsc.c:271) 
[ 13.683052][ T1] ? local_clock_noinstr (kernel/sched/clock.c:269 kernel/sched/clock.c:306) 
[ 13.683052][ T1] ? __lock_acquire (kernel/locking/lockdep.c:4677) 
[ 13.683052][ T1] ? local_clock_noinstr (kernel/sched/clock.c:269 kernel/sched/clock.c:306) 
[ 13.683052][ T1] ? __this_cpu_preempt_check (lib/smp_processor_id.c:67) 
[ 13.683052][ T1] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 13.683052][ T1] ? sched_clock_noinstr (arch/x86/kernel/tsc.c:271) 
[ 13.683052][ T1] ? local_clock_noinstr (kernel/sched/clock.c:269 kernel/sched/clock.c:306) 
[ 13.683052][ T1] ? __this_cpu_preempt_check (lib/smp_processor_id.c:67) 
[ 13.683052][ T1] ? irqtime_account_irq (kernel/sched/cputime.c:?) 
[ 13.683052][ T1] ? __this_cpu_preempt_check (lib/smp_processor_id.c:67) 
[ 13.683052][ T1] ? lockdep_hardirqs_on (kernel/locking/lockdep.c:4475) 
[ 13.683052][ T1] ? trace_hardirqs_on (kernel/trace/trace_preemptirq.c:80) 
[ 13.683052][ T1] ? irqentry_exit (kernel/entry/common.c:?) 
[ 13.683052][ T1] ? vmware_sched_clock (arch/x86/kernel/apic/apic.c:1050) 
[ 13.683052][ T1] ? sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1050) 
[ 13.683052][ T1] ? handle_exception (arch/x86/entry/entry_32.S:1048) 
[ 13.683052][ T1] ? strlen (arch/x86/lib/string_32.c:?) 
[ 13.683052][ T1] ? next_arg (lib/cmdline.c:273) 
[ 13.683052][ T1] ? parameq (kernel/params.c:90 kernel/params.c:99) 
[ 13.683052][ T1] ? parse_args (kernel/params.c:153) 
[ 13.683052][ T1] do_initcall_level (init/main.c:1334) 
[ 13.683052][ T1] do_initcalls (init/main.c:1348) 
[ 13.683052][ T1] do_basic_setup (init/main.c:1371) 
[ 13.683052][ T1] kernel_init_freeable (init/main.c:1585) 
[ 13.683052][ T1] ? rest_init (init/main.c:1465) 
[ 13.683052][ T1] kernel_init (init/main.c:1475) 
[ 13.683052][ T1] ret_from_fork (arch/x86/kernel/process.c:154) 
[ 13.683052][ T1] ? debug_smp_processor_id (lib/smp_processor_id.c:60) 
[ 13.683052][ T1] ? rest_init (init/main.c:1465) 
[ 13.683052][ T1] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 13.683052][ T1] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   13.683052][    T1] irq event stamp: 81333
[ 13.683052][ T1] hardirqs last enabled at (81333): _raw_spin_unlock_irqrestore (arch/x86/include/asm/irqflags.h:19 arch/x86/include/asm/irqflags.h:109 arch/x86/include/asm/irqflags.h:151 include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:194) 
[ 13.683052][ T1] hardirqs last disabled at (81332): kvfree_call_rcu (mm/slab_common.c:1443 mm/slab_common.c:1834 mm/slab_common.c:1963) 
[ 13.683052][ T1] softirqs last enabled at (80274): handle_softirqs (arch/x86/include/asm/preempt.h:27 kernel/softirq.c:426 kernel/softirq.c:607) 
[ 13.683052][ T1] softirqs last disabled at (80265): __do_softirq (kernel/softirq.c:614) 
[   13.683052][    T1] ---[ end trace 0000000000000000 ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250617/202506171517.a1e85b6f-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

