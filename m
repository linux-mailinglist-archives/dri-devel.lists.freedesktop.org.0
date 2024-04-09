Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C46189E670
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 01:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC24711287A;
	Tue,  9 Apr 2024 23:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jnHIZ0fd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0016811287A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 23:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712706719; x=1744242719;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k9xjb06HZiBaJhsC1pLRuYw2hs+1p+SWFMzJxnFB3lg=;
 b=jnHIZ0fdTIistM9Ank3ifPR5jeJFdtA7tdY9uzAtQX1pAm4kV1KKyPX5
 XvJxldaD4qHLK7ePATOLkkFstR14vxx5Se+FGkE4UKhA8GEa+e6A4Qy9O
 iO1ms01HzlYhnxxN4MFuqNQXxqdKfiaK28ghyv5knxwpGGTU44Q7qc4MN
 /6ez+HekJwjznHctzk6RnIM+QI3S7qzXcjeJo0iLtjTBlIkEsz+iwMkdi
 8kuB0FCAuqoswx8ponZiNBYbNMfqx1VdFoaKbXMvNqJaioCDJg+6XEckV
 hhLFEyj/vz025YqRimDzf8x69FXRlKiU61w1gYBlPxY+aOMywyrSqZxcY w==;
X-CSE-ConnectionGUID: W5WpKJNMSVCQuBERlC+/PQ==
X-CSE-MsgGUID: xuxTKeZkTgyJF6v8VVbXKA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7903456"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7903456"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 16:51:58 -0700
X-CSE-ConnectionGUID: JCLSSJuJR5aaYRJgdoIMVw==
X-CSE-MsgGUID: pxyI3RnOTS+3KbTJn+Ee9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20813907"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 16:51:58 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 16:51:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 16:51:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 16:51:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 16:51:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVtCSKCwH53r2Aj4XCKK8MSrTLf1ajVDRgcKBvgWDzLTI4RA7elYSKNEK6K0t1IueT43AMhIPXRHO/Y9BrJ/4ACzw+AxC2L9+SieYAySMbPxe6C5cBPFlJgvRop0b4EalMluzZS30i8fCstykuHHmGr8xu7Qx2H5eG70OV3P0DT+Kqccn16zIf7prZ9mGyZmtxfcPLSiqZqYRVcn5yMswZp2z0VNdzIIA+yUZ3BIWkOmXw0pGihVIsHOmo4YjEPgulMxC325jrHqkiKw7zlMfdCI/vGbcNendNKlZB+gKj16oyo/3nK1iKJ77YjqO1EGjhtU8GHc4NybiBInd8IpjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoaUuuzrGYBoKLwOd9uSPxTU34gDwoXBO3kbjamlXnk=;
 b=YKpUazp6j7J2uMYpM5/UE8z0Hie9LIsyavc2VIuTFqkWwdca+r/hwZkrSOEr2Ngxt5TUPk2ZIuGrWiwCgl0K2saP7IYpDoVIbyhAS1sLC0uucbx8cZFsQw/9y91wuX55Ttpv4TgFV6IGTC7IRulZzaykFSfsoozjJ77WW6S2d3LhlU/WvlaPLjD+/jB8BsFReZRWzTBNxJ3vSk3/HltUotojwkK4xsd3SBhYP7f2IqYdQcQLAuSDLd5L2+pYrYZYIXgXIFVJ/fq98b8vCwzPzrtAcVqD/eTEuFAIWGpmRSr25s53goqNEMwG25i1pKcBbJoVUQ6SU9YJoaPt7/vBCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by SN7PR11MB6945.namprd11.prod.outlook.com (2603:10b6:806:2a8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Tue, 9 Apr
 2024 23:51:54 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::b383:e86d:874:245a]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::b383:e86d:874:245a%5]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 23:51:54 +0000
Message-ID: <e60c4a55-09bb-4bd7-a22c-9ab38bea174c@intel.com>
Date: Tue, 9 Apr 2024 16:51:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 0/3] Add minimal XDP support to TI AM65 CPSW
 Ethernet driver
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
References: <20240223-am65-cpsw-xdp-basic-v8-0-f3421b58da09@baylibre.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20240223-am65-cpsw-xdp-basic-v8-0-f3421b58da09@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0030.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::35) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|SN7PR11MB6945:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4q8uNPoAF+zkQI0dcp4IsEsXbKBDdwlK2v3Bc1g74TyP1yA8mBWTmXDYEW3klUd1WJNs+rh7uRRANNZz1+SLIAc8ME4f3zNq4g6FIFFH37ztqczqXjSympEfaCMSdinXRJyuPi4oJKJvf4e5kx0n02M+bRXV9xpzZOKAtf684dmluUgM9Ho0LDCxhVREaFWuC8px7S/1YCZLcQ1poIpDpASoadk6AnOVI1ySd8eA1/Pn2EuEceVyFgxY9D2NWfsjS0CX7wPK0gfhoAMtHrkIK41v/FXG2y5BQSCHy+qK6OzySLIppA5+xAlH+ilJmQmGdz2cl0THtPOvXjgcC6P9ejpcgGHrTxXT+skciblLeV0CZZ+3j5O1UugDe4b1uRTlfvV8Be723wW82pwW6Qwadgq2cIsjfzE6bWAdIk7xImCzMo+FoAdr9rR8Twp8U4tKPAHtilHP11AFinTSOFaRrQ9ZbBj7wKZrYfRoWme8c1yLIsWVIMJub30WiKiFLr+SPdjeESSFn7IRmIKeQGnv6ZQgP4fyPIEPigGDe4nvNUQ9jtgh3xu4vg73af3glRb/3zKJiyGPo0Izftn23IzszKDmmNUATmNMjNicJowHTE5VHR8HK1s8eeab7BSlNjMOnrYGnRIthc/H8UJrssnVz0O2NeVmWwWA0etM/WJxQI80GA5oZaCsWzkUvfNSqqkGkWqkdAVWWr61g6skw2bePQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5089.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(7416005)(921011); DIR:OUT; SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUwxS0I5bktPb2ROZTl5UkZyeStZcHZFS3g3SkVOZzlkNHY3UEJEZTcyd01w?=
 =?utf-8?B?QkgvcW16bnZIMVg5NWlucDVqQlFGMDNCaks3c2VNQVBnN295MzVuakgwM0Fi?=
 =?utf-8?B?UStTRG4xTFk4dHpKV3NQV2dPa09JMmFjc1FNWDFoWVhxNDIwaW1lUVJZbUlt?=
 =?utf-8?B?V3hxS3M1UEZsRFROMTZybG5zS21RUDRkd0FubUx1UmkwT3BRZ1VvOUg5NUow?=
 =?utf-8?B?NHR5TlBiZHRNTDVheWE2S2ZMZVdwQytyYXh2cFNrT09LZzN1YkdFMkppVWhR?=
 =?utf-8?B?ZVN1Y0ZQOHp3Nkpsa0hlT1pGQXNVay9TYUFDbTQ3eHVBMXlKMHhLQmNXUWE3?=
 =?utf-8?B?S1hJVlFqR0dMUGRZUjZVd2FEdU4xRXEyc1REcmYvOWxWYVFqSHI1dVlpV3o3?=
 =?utf-8?B?UFRxa2NGamxYZEw3aG1BbFVqb3R3Q1NURkg4T3ZIYWxYcUkzZllkd1JuQUR6?=
 =?utf-8?B?YUY0dldMMWF1VHByRXQwNldpZndGZ2c2anJIQm1ZTFNiRFE4cU9jRmMwaDlm?=
 =?utf-8?B?UjRaTngxYnVDZ04zU0ZMOXBkUHlCWHNZS1haMEhsNk43TVRDdDdwcXJOMnYz?=
 =?utf-8?B?WlVLRURBVHpIWVNYK3hZbEJuRmIvTjRBWlNPZ0N6WnZKeG4vWlp0ZWRzWEly?=
 =?utf-8?B?cXlYa3JmSTFhUkNXOWlOaUNMQWxrRWRSNk5iVjk3RUhPMksyODlqWnIyUUov?=
 =?utf-8?B?WVJLS3dmV2Y1eE91TUt1akJJemVlTEk2d3JUQlFVOCszZG50SWV1cjJUdGxq?=
 =?utf-8?B?OE9KNzVON09ld1VUTjQ1ZUlreTJmcURpOERpRG1mU292dVdsY0RYQldEUE12?=
 =?utf-8?B?R3JDcVVIVHBtUDF0RXRvam83RGxkSU9FQ2xkVnhGRXNqOHd4NmNoQ0E3aDFa?=
 =?utf-8?B?U2hJK0ZYUUVqdU9xdWgxdUFLYUNQQy9hRzNFYUorR09hMHZaTWpGaWdRVTZK?=
 =?utf-8?B?RUplYUZ6d2s2RXg2b21JSm00RXlBbzVxZUFiSm9xTlZFdlNiZDVybVFBQ2Jv?=
 =?utf-8?B?R1dRMkYweGZoUnZ4cXBxNlhXNnAweHpqcWJ2WHQxYmFPb3VkUlBLc3FHQy9a?=
 =?utf-8?B?L2R6aFRpRGJWcjFWbkFGS2pUZW54b2Z1V0VzYkphL05ibEQvVjVySk9XTFEz?=
 =?utf-8?B?SkVWTmdtbmx2STk3V216RXc5bHdXVXRlc2tPakVQN3NxYnoxMFF5VlNpMkUz?=
 =?utf-8?B?T3hzYXZKZU1zZU0wOG1TalFWWkk0djFqandNVUVFYWlaR1hRMm5Kck1IUHg3?=
 =?utf-8?B?YTdhRU5KWXdXMk52MmRBb2J3Q2FMekVkOG5wamVGSXN4bys2Ly9hejZXTGJD?=
 =?utf-8?B?S3dmUU5UOUpZTXNhbWh6UHNjS29QMmtIWjlHMXVqcGIzQ1djdStEYUFqcWdO?=
 =?utf-8?B?UUtZK3NyTUMzWHkvSzNWQWNBcUVDYnIxRDhDM0hMdHZWd0lyZ1o1OVZYOUdJ?=
 =?utf-8?B?b2lnaEJ1WXpvNGE3MVlHZDZydG5OVlIxYjVjRDMzeUZhUFlpdmdpS1haSGRT?=
 =?utf-8?B?Ni80c3NHUTZXUjJESlBTU1doZVFJMlZTNHoza2FmcjVhbFR5MUNLSGFlbmIz?=
 =?utf-8?B?eFhFMmJkWWdWdlI3eitEVTJtZ0hHbENXaVBiTWVlcGNpdWNNc2w2amF5Sjd0?=
 =?utf-8?B?MkE0U25EZndlSCtuNUdRQWxnNUxwMTlqbUpac2RVL1FScGpFaHlLWUw2a3M4?=
 =?utf-8?B?THZLK2F1am02UGNYa3dkZjJDTWpYTUR3Vy9qb2p5cUhIdWZFb2xQbUNyS1ha?=
 =?utf-8?B?T0ZVMXRQTFVVSllhd2Q1Zmc2RFBBWWw0T1hMS3FGd0ZXaEVxMERuWkVNY0pP?=
 =?utf-8?B?TnZmRGUwcjFncURrUVp0OU44SmtrRlNKN2hPaGdpdHF4NFBkUjl0TjNTWWd3?=
 =?utf-8?B?eHlVUDFYZzJGUjV6QXpLWlljYU11VHJma0EvOGRKamxFNk1FQnVESnM4MzdY?=
 =?utf-8?B?UlJkL082aFhmUHdsZTV5TWhKL1NaUFpVRUQ5ZVR1OUk4QXNTQm9zQ1piUFhz?=
 =?utf-8?B?YlkyVDBLdHdXS0MrV1FKVzE2c3N0VU1DdzBYSXdQbmVsZnJqaG1LVDdSaktz?=
 =?utf-8?B?ditKYThJbmdrTkljeE80QmloaHYzd3YzRzFNa1JJRVMvdm5KK1psZDFTQ05W?=
 =?utf-8?B?eGhLTVByWnJSOGtUNy96K2hEcnZ3ZFVULzRZbkNsVStLdWx4d2JNTWVCa0N5?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55cff187-760e-4815-aed3-08dc58f008e1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 23:51:54.4844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jxlrdkJJ7vQsUOzGkYYO2REn4RaH7HO6Qc3W13hHPFw+etu+5am3deqHy4pmZs8P7tq08n6RyGxS+46pJ2LxeydtnzKOUpQqBj1fWnyVf2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6945
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



On 4/8/2024 2:38 AM, Julien Panis wrote:
> This patch adds XDP support to TI AM65 CPSW Ethernet driver.
> 
> The following features are implemented: NETDEV_XDP_ACT_BASIC,
> NETDEV_XDP_ACT_REDIRECT, and NETDEV_XDP_ACT_NDO_XMIT.
> 
> Zero-copy and non-linear XDP buffer supports are NOT implemented.
> 
> Besides, the page pool memory model is used to get better performance.
> 
> Signed-off-by: Julien Panis <jpanis@baylibre.com>
> ---

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

> Changes in v8:
> - Fix some warnings reported by patchwork.
> - Link to v7: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v7-0-c3857c82dadb@baylibre.com
> 
> Changes in v7:
> - Move xdp_do_flush() function call in am65_cpsw_nuss_rx_poll().
> - Link to v6: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v6-0-212eeff5bd5f@baylibre.com
> 
> Changes in v6:
> - In k3_cppi_*() functions, use const qualifier when the content of
> pool is not modified.
> - Add allow_direct bool parameter to am65_cpsw_alloc_skb() function
> for direct use by page_pool_put_full_page().
> - Link to v5: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v5-0-bc1739170bc6@baylibre.com
> 
> Changes in v5:
> - In k3_cppi_desc_pool_destroy(), free memory allocated for desc_infos.
> - Link to v4: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v4-0-2e45e5dec048@baylibre.com
> 
> Changes in v4:
> - Add skb_mark_for_recycle() in am65_cpsw_nuss_rx_packets() function.
> - Specify napi page pool parameter in am65_cpsw_create_xdp_rxqs() function.
> - Add benchmark numbers (with VS without page pool) in the commit description.
> - Add xdp_do_flush() in am65_cpsw_run_xdp() function for XDP_REDIRECT case.
> - Link to v3: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v3-0-5d944a9d84a0@baylibre.com
> 
> Changes in v3:
> - Fix a potential issue with TX buffer type, which is now set for each buffer.
> - Link to v2: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v2-0-01c6caacabb6@baylibre.com
> 
> Changes in v2:
> - Use page pool memory model instead of MEM_TYPE_PAGE_ORDER0.
> - In am65_cpsw_alloc_skb(), release reference on the page pool page
> in case of error returned by build_skb().
> - [nit] Cleanup am65_cpsw_nuss_common_open/stop() functions.
> - [nit] Arrange local variables in reverse xmas tree order.
> - Link to v1: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v1-1-9f0b6cbda310@baylibre.com
> 
> ---
> Julien Panis (3):
>       net: ethernet: ti: Add accessors for struct k3_cppi_desc_pool members
>       net: ethernet: ti: Add desc_infos member to struct k3_cppi_desc_pool
>       net: ethernet: ti: am65-cpsw: Add minimal XDP support
> 
>  drivers/net/ethernet/ti/am65-cpsw-nuss.c    | 569 +++++++++++++++++++++++++---
>  drivers/net/ethernet/ti/am65-cpsw-nuss.h    |  13 +
>  drivers/net/ethernet/ti/k3-cppi-desc-pool.c |  41 ++
>  drivers/net/ethernet/ti/k3-cppi-desc-pool.h |   6 +
>  4 files changed, 578 insertions(+), 51 deletions(-)
> ---
> base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
> change-id: 20240223-am65-cpsw-xdp-basic-4db828508b48
> 
> Best regards,
