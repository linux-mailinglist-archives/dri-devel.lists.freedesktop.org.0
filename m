Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B168A3900
	for <lists+dri-devel@lfdr.de>; Sat, 13 Apr 2024 01:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FB310F970;
	Fri, 12 Apr 2024 23:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fqzhWMZt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F85910F970
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 23:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712965536; x=1744501536;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xm07zq+uoVrDSTje/2JdF2pBlxF5TQjnhbgMFB+mw74=;
 b=fqzhWMZtyCwMR2NI9K+AJVmI/mM0USPKovUAVMypqsu2Uftc3L8YSbdT
 gj7zMw6azjFCQYxq0u/78aGIiCM6b8mTVGTaht7mwESEWaGCMhDRCuZwn
 m20vd/AUZbVmsqnrSHIrZh3PhE463k8LURsLrI7inKqF1t8hh5YPeo4w6
 WtE2n8jmr0KBIncb/ZngkntA1tyseCuksGAWTQugprvXYUOoXTpBR5Ogu
 P2iUuEKdKbwm+mILzAVwQog5A+PfP27j+KpJtnq8rkcI4POLOt/ltI44+
 3hGCKR0bQ/tJ//1HlrNwM0bIveGCTULN5MLJFq6JutPTc9YolBbmJpAk8 A==;
X-CSE-ConnectionGUID: Z/KfIrC8RVyVqknHCwWpRg==
X-CSE-MsgGUID: kaC9JckcSlqHvuir7QwBdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="19586239"
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; d="scan'208";a="19586239"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 16:45:36 -0700
X-CSE-ConnectionGUID: cA28mD9JRWC9omXOqW+jzA==
X-CSE-MsgGUID: 2/9HZkhARu+2p0byAOk6OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; d="scan'208";a="21449205"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 16:45:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 16:45:34 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 16:45:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 16:45:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 16:45:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EaQQb5okP2ec3C4Pa20o9RA84hC+Xtp3yJNNs02uSeR3aMttkj5LLPbQTNLVSYgp/UWg7CZ+wf+nMkG3DYu4K9wCOU1p0shElHXNd/7vL+TBctvPRprTYU5aUiEHCCUgIO63GEGEh4dWe8vujaN0ivH7pPEHdl3c6L858CQf53wI1+CLDY7FoTgA9oL1OUydTpndNhLfCh12yqRhsTdzh6y1bTcKNQmymMGHQWPF6wNtBOIpAmxBVujgFzWcxQ6v13xABs3yR0MOvyIi7Druf2868eB4ba0qpCReHsg/0oITYRBhpeaEa4n4HlZBNFO+5jcktuzsGrsjquD6002jkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvVpk1ZYQFRcncOQOvmuoCgt0uY1sH6V9MWtDLIjQGU=;
 b=Pz8KvrtnYd9NiSVR5ueSGnFlFJPjf28uOZlbGuxVnjzXXgqmqQiU0JiUR8XBqeuenQOgtHeOXzs25C1ia/YnwMReqOPJG7UcTIyPWX5+D0QU5EnaeYyodVRrKF+N22I0t/lzesrpxNi6fptxEbaCcxQcbhB9iinCVcB4eG0NTaVLoyJR6549f/d4uiORmbBNROfZaatY/LQz8BwFk+Xu69U32iImlccHYxNQ73jTSmjqDOwIN+rYnUyPzg8ZIYNow+tmZp70gAZRufEIOXAQeblz1w6g1JKOHJalmww+bF8P7IQnaWBAU8Dc9MzXOtBniZg5eVLVgwLGEgCUUp0aTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Fri, 12 Apr
 2024 23:45:26 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::b383:e86d:874:245a]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::b383:e86d:874:245a%5]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 23:45:26 +0000
Message-ID: <3c25c8b7-b147-46a0-aafe-c2acc41cfc30@intel.com>
Date: Fri, 12 Apr 2024 16:45:24 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 3/3] net: ethernet: ti: am65-cpsw: Add minimal
 XDP support
To: Julien Panis <jpanis@baylibre.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Russell King
 <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, "John
 Fastabend" <john.fastabend@gmail.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>, Ratheesh Kannoth <rkannoth@marvell.com>, "Naveen
 Mamindlapalli" <naveenm@marvell.com>
CC: <danishanwar@ti.com>, <yuehaibing@huawei.com>, <rogerq@kernel.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
References: <20240223-am65-cpsw-xdp-basic-v9-0-2c194217e325@baylibre.com>
 <20240223-am65-cpsw-xdp-basic-v9-3-2c194217e325@baylibre.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20240223-am65-cpsw-xdp-basic-v9-3-2c194217e325@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0185.namprd04.prod.outlook.com
 (2603:10b6:303:86::10) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|IA1PR11MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d774220-83d8-45bf-3482-08dc5b4aa0fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9/TM/SygjpwsoqEK0Fulaxb2LxEyKmtnpZC8sGedQDDlHTflIQ+Y34MOhN0qXWOxuA9np01PZme/MzJQGAULKVolVumTXNVMjZmptsvE8VkIDpYNf97L3hDpSeGlm1zEXTTv7UNTZXXRyqSVFhQZlMDGWYqA/wsTviZcpIHDttcqbEpPD5yyNecWQF0mp3pPCdwrV37UbhouIqm3X+q4zGFx6fTGB1NvwYM/+8wUV8a5xscZXOJAfzYAGDjNNOW9Hap6+tF4hC2nqAcXEAJM987dbDcQRhtEEtWl6ZV3gcC1A+twCIyM9vw7o4oVmVQ4ep8AZs5v93Cq72N6BDh2wen6fJ4OSL+Z0tI3qemS2BzR20pKqlOJKflQ+v4dryS2ETgEsAbvG5xQBt71UD0S7ONQOVFMn9AblE95JXsYupUlIgGWZBq/jGf3vkFom/6OyD5EzTmc+CZkAuaGfBXniPVYyIwCZGRM31SZB9Me2CKTRWUXssu2hD/cnp6w4sDeaobCrgvJojexhQGcurZ99WrywmZWhT9ubxm3abTdl1cIL288hLeL4V71csJoocwwR5IZ1hhR7OtdxvWd+zooXxGPhQUVQnTlDqLtVisD6suDzG1ihFmMzqa0FPHaI5HoMbjw3OpQ0ToYO/AeSUQP4+ECQ0aNJY1nxk/Fh5STddsqmPsgIxTTBLfUnrk01fn3JmbskTT9rxpouGV1bStieA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5089.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(7416005)(366007)(921011); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGZoVEdmdUdJSUFXdnRGWHl1ZEdScnVZSWdwQzl1aUJ4WUFpUmZzYjU5b0pY?=
 =?utf-8?B?OHA1Nk5NeHY0K1RjTStRTXBUditzWC8xdGM0ZHQ5NHBiRkhNdTRDQ0R5azMy?=
 =?utf-8?B?SDkxdHFXeFhOUG5yZzR0eDNzM2NYRWlGZHQ3VUhwUGVBdG82d240OGN6bFZ6?=
 =?utf-8?B?QVJ2SmpxOWVJWTBDM2tiNWhlbXk0YlE2ci9UbXNWVU0rRTRGNjc3UzVuUUZT?=
 =?utf-8?B?djVFSmZNdzRSTFcvVGd0NTdVb0xTZ3VWSkt1cVNzd2lKRW1sMktPSVpkaC9T?=
 =?utf-8?B?NlpiWDJoVFdMWDlHaFVlbHpuQTN4MnlwWnhRWmVWekQ1R0YrVHdLY0RxcW83?=
 =?utf-8?B?a2JuYjVXZHJMWmlHR0RGTnhaZWcvaXMxRnJWZnYxNDlMMGJHQ0M2eW1meVdC?=
 =?utf-8?B?eXM1NTd3ZnRYZTVGVzk4U1RJTngzb2E5dXMrdGUvUkx4Y2ZubVRSSjJmdVFw?=
 =?utf-8?B?cDRHUTFOcTlmckM2OUVPQW9KaWFnVU0xbUF6M1dTNDdZSWx6d2xaT2dtYVFM?=
 =?utf-8?B?eExpR08reEVpcFZpY0pLSEI1Sm1UMGdBd2tpR1k3M1NXMFR3TVZmcmxXbEdE?=
 =?utf-8?B?ZTVwRUg3SkRQK0dmcHdLd1FRaytyZFJSZGh5bk4wZERBVzZrdlpUTFJPVE1y?=
 =?utf-8?B?VFo2L01OWEY3R1hRdXJnRTBBclNDVHdwdjRVMHU4TFpYL2dMY3NGYndUUTEr?=
 =?utf-8?B?RnE5elgyYzB1SXVCZklFNDQ4bGk4NGVkK1N1am51Q1BQbnhkMU1xOFBmUU5u?=
 =?utf-8?B?Rno2eEMvUWl4Q0pPQkpQTEVGZ09kRG4zN2trUG9ZakdkMFNhZWEvUFVyeVR6?=
 =?utf-8?B?VVJldE9zdDVUNEIwbzZhL29GYm05Ym9PamdMRm9jRURiTzZvNFBOSThEWGFD?=
 =?utf-8?B?c2ZVaXN6OUdUb05UazUrZHdaOW81YzhMd1puTFlMejdzVVd5S0g0a0NCUk1w?=
 =?utf-8?B?KzRDdVJaOENEUVdqZVpyai9HcHZjRCtNODN5N0hFaWY2YzF6b2ZSUDBmREtl?=
 =?utf-8?B?ejVxMnB6QzBydkwxQ0FTd29BS0d3YnpMUHRRS0IyYVlsTnFzd0MvUmNxWFlG?=
 =?utf-8?B?SFNybTMrWDFvNVV5SUd4K2pYSTViNGNXK0NsK1VVZFNYQ3IxN1JYYjJXeXBx?=
 =?utf-8?B?ZjJHTlliYVBGVEJIM3VIcUVmMjFKVmZJcXhWcGh1am9JamZ3cG9obEhYVWpu?=
 =?utf-8?B?Q1U0Y0t5K2NnNlluNkF3ejRzMXFXeE52UXdhd1RuZGdIWTlzWU56NjlqQVc0?=
 =?utf-8?B?Y2h2ZnJCSkxjblZ6aUxLS1FablBqN0dZMFF0RXdCR0YvTEQvWkkyODFJSGxT?=
 =?utf-8?B?UjBMRWROQ1BGbWpMUlFxSTZhUS9KOUVteWhtNm1hbUNBaExKcW11b2RJSm10?=
 =?utf-8?B?cnlybkwySlBUVXRmVWRzTlk3TjE3VllGd0FtZUFlalVQazBBMUF3cEwydjFZ?=
 =?utf-8?B?Nlh4YXY3SnVDcUF2dXAySmZTVmI1NUJKWTFCUmxSYzAyZWg4VUoxYUR3b2Ir?=
 =?utf-8?B?b0U2NWtqQTJLMlBQQy9ZYVByZ1dWYU1qaEFRVHd5M0h3cWQ2NExTT3QvRlk1?=
 =?utf-8?B?VmhlS0EwNVVFa09RR3I4MEFYSUxFZk1XOGJNVVpYV05NeTVLVDdPV3RqZnJz?=
 =?utf-8?B?V2RaVlFPWnVNMlhhcEZkZ3BIZG5JdnBBWHlNZFJDMWwybUw5WCtEb3dYeFJs?=
 =?utf-8?B?SWsxNmFzTFdibE5EdDVnUE1JTW4vRnoyUnhwREF6SUdXb3RnRncrVUZMNThx?=
 =?utf-8?B?dGFYSk5xb0JHSXphSlBFckV2TlNEMjhkSGtDd3QrTHdtOHFxRGxud1JsTVlH?=
 =?utf-8?B?TGFDL0ZVajhQNGxRQ3FVOUF0TlB3OUNGbmdjZUpXN29MZUhLbDk1SktIdEpk?=
 =?utf-8?B?K3MzWWVlT3JWY3VzbTF4UGdldUp6ODM5dW81Tm12YTJwUEZWQ3dxMVd1a0RV?=
 =?utf-8?B?emJkU3N3cW4zdlBvajJUR3Fwa3JoQ3RuTUszWlBRRFIyNS9Wb002cEcrZGpZ?=
 =?utf-8?B?T2VJQjFIR0xVcEhJYkxPeE1KbzFhbU9wSDE5cFhhaSszUlBNVnIrUUpWN1gv?=
 =?utf-8?B?U2M2dlRuL0tadnZPMEpabU9aenVMalpNNUdXK0tSS0pwT2d2U3l4UmVDU3RI?=
 =?utf-8?B?cmtVSXZCeEw3eHdWOW5vMzcyZ1JjOW1vcnlPbnozR2JmZ0o2c20zR09xaU0x?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d774220-83d8-45bf-3482-08dc5b4aa0fc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 23:45:26.7080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jijbpg9Kr5Gy3y4v4lacaq3FbPEotJCbXTQ47hH30JqXFCFbE6uBpBe9/4Jbv95VhvnVqH5g4nD5V/kgzDVt2B0oX1mG4qz6cjtngt3bhYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6396
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



On 4/12/2024 8:38 AM, Julien Panis wrote:
> This patch adds XDP (eXpress Data Path) support to TI AM65 CPSW
> Ethernet driver. The following features are implemented:
> - NETDEV_XDP_ACT_BASIC (XDP_PASS, XDP_TX, XDP_DROP, XDP_ABORTED)
> - NETDEV_XDP_ACT_REDIRECT (XDP_REDIRECT)
> - NETDEV_XDP_ACT_NDO_XMIT (ndo_xdp_xmit callback)
> 
> The page pool memory model is used to get better performance.
> Below are benchmark results obtained for the receiver with iperf3 default
> parameters:
> - Without page pool: 495 Mbits/sec
> - With page pool: 605 Mbits/sec (actually 610 Mbits/sec, with a 5 Mbits/sec
> loss due to extra processing in the hot path to handle XDP).
> 
> Signed-off-by: Julien Panis <jpanis@baylibre.com>

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
