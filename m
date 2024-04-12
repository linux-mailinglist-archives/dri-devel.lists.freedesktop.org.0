Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D008A38FC
	for <lists+dri-devel@lfdr.de>; Sat, 13 Apr 2024 01:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DD510E2AC;
	Fri, 12 Apr 2024 23:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mo5g3lGw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677EE10E2AC
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 23:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712965356; x=1744501356;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HWBvuvMR0ncMP/D0akmJJ5fP5VjGjLluzlkMjwCqyPk=;
 b=mo5g3lGwVfH8N8nsi/PpuRkyPJAC2lR/GgeY2RwaSascRkORytYJMFsW
 yz7l5dp7ipd2r+gv/2d0xUc7tpEN2UlSD0219qtVDtgpjv+q9EkT559rI
 08XincGBEF/D4VQaEFCqtT321PBUe+2N7zGH3/XJlkeJ0rKn7nLVLzDzb
 FqNDuzWHPjVssmdXHtseRfD2SJBQVWIBPcG4QqnJJBJfI1Dmdz9o96Asn
 hNUUd2PqVXVivzVgTN2yDbMB26r9wCR5oSMIQbBfSh3dnx3KnYY2aHgSr
 pRAzDoTAjY/SGfhq1tRi5JWt08WyPge/WN5FAe05zt/JpmDsr3nDWIThF A==;
X-CSE-ConnectionGUID: UqAW6o3RS129UiX4Eo6s6A==
X-CSE-MsgGUID: ORtPYW2CT5SuRGfdEoz/qQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="12286584"
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; d="scan'208";a="12286584"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 16:42:35 -0700
X-CSE-ConnectionGUID: 9/o+DUlsQZWJkbgj8qVrfQ==
X-CSE-MsgGUID: xGmkVrBRSTaCjXxzuxMhZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; d="scan'208";a="25925344"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 16:42:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 16:42:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 16:42:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 16:42:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 16:42:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYKFe4RtZmTq2tDd5sZSpM8jdPxFEIxJmLrrPIv1SkNGnzL85lk2Rr8HfHtiX/o1i+HU4tKHSnUCQ5+pAKFiaVq5jYJyGUOMphjoN4oKvRuXHLeLZKtx5+T5J7+lK1c0jFmKKS2yh0f12za16e/XPi4wdVoxEqR2jux6kF4vcKE9rZSvwofQOROL5wIYPHTMtX0vCVtEVzPruDwGjqLlJYgxGkzpmrOB8j0UWwqGXJdc9KY7D4AE3JU98auF22rGjkoxg0dnBq1+LZdyog2DFsXLZnrzzXNICP8bxaQClcPf/hy6lVtQsLTfZzooPcmdRqUxB/HvFTcvJ3SjaSpkQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKQv65t4dRkzZEjnp8zoEegoJzzCBi3TbvTwU/nZEwg=;
 b=LV1VU+sCethF3doVe4CK/6sRyYhGMDMrSMedEoO241jLKfcDwAcz5bXG4N2JTcFGBFFYwdxlbw92PreKSLAmvpAD3pUBL+h6v5giCJnaJet26kWdEbQfIfYhprCz0oc37PRdvPqSvrc+t2xgqyf3lKHcUW1RIJr1Y6HBkidre5eI4vvlp6izURoXNlzOE+nJL+GfNjZ5xTZvR8kNzPQI9rNxhDe02ODVGovBjSD/KcCWLchUfWYAT1RfBBKim7xJP6im1ip0m+v6Dt9YFAIW9i5x3wpR+xgFSfzuLtTo8RrG2S3MkRvafcLOokKLg491VQIa4Ped3rZBJkYk3MhW2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by DS0PR11MB7580.namprd11.prod.outlook.com (2603:10b6:8:148::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Fri, 12 Apr
 2024 23:41:59 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::b383:e86d:874:245a]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::b383:e86d:874:245a%5]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 23:41:59 +0000
Message-ID: <1bda40f4-3f42-4785-8663-d1f40a75d98a@intel.com>
Date: Fri, 12 Apr 2024 16:41:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 2/3] net: ethernet: ti: Add desc_infos member
 to struct k3_cppi_desc_pool
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
 <20240223-am65-cpsw-xdp-basic-v9-2-2c194217e325@baylibre.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20240223-am65-cpsw-xdp-basic-v9-2-2c194217e325@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR2101CA0018.namprd21.prod.outlook.com
 (2603:10b6:302:1::31) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|DS0PR11MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: 550a3be4-9216-406d-f4cc-08dc5b4a2584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NaO1UCjusjLcjZL86RvKzYAwp9V0Vzw9gJqO92/2LPl3ez2cJf+hgwLwvEE1u7OpbDs8JD1M8qzIOFP7sv2Qzw/yfZqhzqIRfgba3BwO94mgtV7lvMR8l+2H35t56+4sBVao6ShEcJWGqChomQ8UsXjHnLwciyye+FV+TKux1VbZILC3TRHLOV7fYcUbNIRJwcxliNQA8fb/wYU+krMqSzg22EFvxYHaOv+zVPhr2rdKzo/pxBJ1eHiKkO+M/yfPJEeRbkk/IPiy27DPfwaFqaH2+2Ri9fZGKG6Kj7/Iu5A9pONJO1iPQ08u3GanaXyES6NN10BIH23YbUlvGymEwY7f1B7LPAkGvYzJu6YTAHz5riLGQtAtmpMquNKVVv2QcVLGy8vFUMgxf7Q7WCa27YbnUrQP++I5CdNng5zb6o4TWGSlGOWourIhhWCXRsioy8Y/jVrQsMlShgUl2Ux6coKgUI3CHk5Us9pJsI5a2uG7zLyAsAXGcUYiIp3dvaD01Hxfexd3jRwA+yBVp1ZB/V8xqOzpnoY9opnhaZVA77vUHtjLVOG6KNAe2YlQOdnQsZYSre/ROpKgid9B8reqGgCfO7IbzkAAgctuLRnoHcI3elh2cWYOv0z15wtOHF1zzOOsJmwz9rnsaYe+1ezjMcXC6hY8mcNlPHSVTIpndi5fypEVwvGac1Bm9fqLbcGtuFNNddZTgpvlfYxQvoLPVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5089.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(376005)(366007)(921011); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0tmYjJLbnFLRTJKTDZKOHBUWEc2ZHdEc1cyWGdCMmJwOXBuZWF4dWJJZVVa?=
 =?utf-8?B?cDU4VmEvMnJsb2RyTTgxaVNoc0p5Q0dNdU83VDIvNzJGVDc1TkJSUXMySVd0?=
 =?utf-8?B?djRwZTRsQ2hlYnNZQjVwTjRSNUhMNlorM3ZBNUUwT1ZYdU1Nc2Vkd0g4N281?=
 =?utf-8?B?TUhuSFExSGdDcGlaK0lreGVmN3ZudjB0QXVzSytkZHc4eVV4dmluTy9ySzR3?=
 =?utf-8?B?N0xMSGkrVmJ0ekhpTVVZa283VjYrQmt1UVhlZmFjSzZnd2JrYXgvMFJqWSt6?=
 =?utf-8?B?ZTlvV1o0WFZtVFlGUDRHNGpodUJRSUNjWkVsRkl0NUVoREp6MjV5eUdGajdy?=
 =?utf-8?B?QmNHYUFnWU9Pb2lwcTdaNGVpTzF6WFVpQ3F0bzhxazFEemFiRnFpUGZRZXNv?=
 =?utf-8?B?VkNEdTVEVnJDNlVmbEo0am9YaXZzS00rNXpNdk5SQlV3UkJqcnR4cHh0Yjd4?=
 =?utf-8?B?WVo1VmtsWEp1OEJvdHdIOTVQa1gzRXBCbkE3ZkRxWjV5dDIxMTZZa283bEZX?=
 =?utf-8?B?NDlzTzlqVW1zbGhyZm16U2tkRGl4VUpVWFBYcHQ5TDNKM2xKcGtYZjdheUNS?=
 =?utf-8?B?YkxWeGhVSER2dDlRNmtFWmNmQVhPbFpWbXpXVFlpM0Q5Kzkrb0NJc1dBWjJY?=
 =?utf-8?B?QkxXU3dqTDQvdHVEWnhPRDZGbzBkUFM1Sm8yNWNFaTJmTCt2ZVVWZXBtUXA4?=
 =?utf-8?B?TExFN0srbWU3UFZKNUZHZlhLOXNzSFVUVm1maHVHdlVvcVJtY3V2ai82UDdB?=
 =?utf-8?B?Wm9aZTBLd3U4dm5ocmlYNFZwVFp3UHRsRXBnUjQzbGN5dElBYkwvcWpZVW5Y?=
 =?utf-8?B?MmhRUzFtRGpmSm9oYUdWaU9HS1ZReE1rUWNGY2FpU2hZQlFZRmQ0Nkg4bjdI?=
 =?utf-8?B?M3pLaXFQbnZldDl1Si9kd1VHcHlpOGM1cC9EbE9VZFpGQit2QVJMRFRERE1h?=
 =?utf-8?B?YzVNa2gyRFh3NXUwL1o2Ris4QVhFY1dmdG00anp4MWRSWnlXTGxEOXhJMHZP?=
 =?utf-8?B?ZVV3aE1tb3RSYVA5SjVUc01CM1ROMHVUbXJMZzM5cGltVkRYT21IbjI3Q21R?=
 =?utf-8?B?dW82aGdaeVlpa1VncVlWZXM1ancrSjBmK0hoVDczZWRqc2hEN2NGdmpzbFJV?=
 =?utf-8?B?cExFeEd6c3pwZUZ5NmgzSVVGMWJEK2ZLU1NsckdrVzJVbW1kaE5pTmljVzFE?=
 =?utf-8?B?aGhEeVpHUEswTnFscjVPZ2hna0hxRkxaS1hDNDAvMERiSVl1OTgwdnM2b25H?=
 =?utf-8?B?UlUvMG5jdXUzZTJ6VzFnU3g1M3ZGY1QzaGZOZkU4S3Zmell3TkJ4WHllZklB?=
 =?utf-8?B?RFNRZHZvbkNSY0pLNkJvNzlVYXhCb01nRS9WSzZ6bEVZam1wTmFEc2FEM3lQ?=
 =?utf-8?B?UjFqQytNd0xUR0ErajIwZUZMS0tUeHBVT1E0VzA0L0dyb29mc1Z3SUxEZEwy?=
 =?utf-8?B?T21zOVZXSDN4MHBRS0lpNmVKSExQL2ZNdXBxRXhObGZxUnM5VGM2V3RqZ3NT?=
 =?utf-8?B?S1JXb1pVNEVsNkY1T2lxNnBsaGFLR2RUV00zWW9nS0ZjRm9yZ09YMXVZMzFP?=
 =?utf-8?B?WWFGdGYxY3gvTFc0T3hYaXU0RFQrejl2UkRMQ1FtRUhPempoMDByN1lHRGMy?=
 =?utf-8?B?TWFBU2lSbnovTUFJcnp0NVpGcGpwMW5zejFzZnZYS1BTVGk2dXJNcW1LSTho?=
 =?utf-8?B?bWlTd2FNVVErTGsybnE3bmFvOXhYdWVOZmR0TDU5T0orVTlydlFsWFFVcExL?=
 =?utf-8?B?SVQzNk51WGRCMFgyV21SK29OTGJwSUdGeWY4bGpMZHl3LzhSVSt5UVY0Z2gr?=
 =?utf-8?B?cURVNU9tZktDV2xETEM2YVB4Kzh5ZjhzNkUzb2JDclovSTZTQ0F2MVFBR2Qw?=
 =?utf-8?B?eTVvbnVsQWNnejZ3WnpLV2FyVjhPMTZidC8xbWRjUnJWckhKMklBSW1vTjhl?=
 =?utf-8?B?WkxQcG01aW8vT05LZ1dyUDI5Z2IyQ2lEY1Bnck1ETVFwRUVyS2xWYzUyK29z?=
 =?utf-8?B?RHlEM3o5b2lUZWxaMnorUllYN0JrQTZhL0hxUTQwWktJSlZDRS84NnowMkc1?=
 =?utf-8?B?UWZNeExHRjMxU1MyUnNmdU9vSVp1RkxkaHAwMVBzNE9NNWsyY25jaGhMRzdt?=
 =?utf-8?B?anNPeFRWWjRDY2hldC8xT0c5VkdwVFpoMnhMQjZhSWVyUk1US3ZXS2EyaG1V?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 550a3be4-9216-406d-f4cc-08dc5b4a2584
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 23:41:59.5948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZF//DBXqhD8sLqbM8knPKH8zvi1dAioNv8sUvMcNwsN99oDkorHLi3wl1hmmIx0ZifPP90+oCqkdYmyx4RNGo1TnV5vJOsHI7VkDWNpBV/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7580
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
> This patch introduces a member and the related accessors which can be
> used to store descriptor specific additional information. This member
> can store, for instance, an ID to differentiate a skb TX buffer type
> from a xdpf TX buffer type.
> 
> Signed-off-by: Julien Panis <jpanis@baylibre.com>
> ---
>  drivers/net/ethernet/ti/k3-cppi-desc-pool.c | 34 ++++++++++++++++++++++++-----
>  drivers/net/ethernet/ti/k3-cppi-desc-pool.h |  4 ++++
>  2 files changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c b/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
> index 414bcac9dcc6..739bae8e11ee 100644
> --- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
> +++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
> @@ -22,6 +22,7 @@ struct k3_cppi_desc_pool {
>  	size_t			mem_size;
>  	size_t			num_desc;
>  	struct gen_pool		*gen_pool;
> +	void			**desc_infos;
>  };
>  
>  void k3_cppi_desc_pool_destroy(struct k3_cppi_desc_pool *pool)
> @@ -37,7 +38,11 @@ void k3_cppi_desc_pool_destroy(struct k3_cppi_desc_pool *pool)
>  		dma_free_coherent(pool->dev, pool->mem_size, pool->cpumem,
>  				  pool->dma_addr);
>  
> +	kfree(pool->desc_infos);
> +
>  	gen_pool_destroy(pool->gen_pool);	/* frees pool->name */
> +
> +	kfree(pool);
>  }
>  EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_destroy);
>  
> @@ -50,7 +55,7 @@ k3_cppi_desc_pool_create_name(struct device *dev, size_t size,
>  	const char *pool_name = NULL;
>  	int ret = -ENOMEM;
>  
> -	pool = devm_kzalloc(dev, sizeof(*pool), GFP_KERNEL);
> +	pool = kzalloc(sizeof(*pool), GFP_KERNEL);

You could refactor pool to use the new __free cleanup annotations along
with return_no_free() to automatically handle cleanup of the pool when
the function exits on an error state. It's pretty recent, and i don't
think its strictly necessary to do here just thought I'd point it out.

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

>  	if (!pool)
>  		return ERR_PTR(ret);
>  
> @@ -62,18 +67,21 @@ k3_cppi_desc_pool_create_name(struct device *dev, size_t size,
>  	pool_name = kstrdup_const(name ? name : dev_name(pool->dev),
>  				  GFP_KERNEL);
>  	if (!pool_name)
> -		return ERR_PTR(-ENOMEM);
> +		goto gen_pool_create_fail;
>  
>  	pool->gen_pool = gen_pool_create(ilog2(pool->desc_size), -1);
>  	if (!pool->gen_pool) {
> -		ret = -ENOMEM;
> -		dev_err(pool->dev, "pool create failed %d\n", ret);
>  		kfree_const(pool_name);
>  		goto gen_pool_create_fail;
>  	}
>  
>  	pool->gen_pool->name = pool_name;
>  
> +	pool->desc_infos = kcalloc(pool->num_desc,
> +				   sizeof(*pool->desc_infos), GFP_KERNEL);
> +	if (!pool->desc_infos)
> +		goto gen_pool_desc_infos_alloc_fail;
> +
>  	pool->cpumem = dma_alloc_coherent(pool->dev, pool->mem_size,
>  					  &pool->dma_addr, GFP_KERNEL);
>  
> @@ -94,9 +102,11 @@ k3_cppi_desc_pool_create_name(struct device *dev, size_t size,
>  	dma_free_coherent(pool->dev, pool->mem_size, pool->cpumem,
>  			  pool->dma_addr);
>  dma_alloc_fail:
> +	kfree(pool->desc_infos);
> +gen_pool_desc_infos_alloc_fail:
>  	gen_pool_destroy(pool->gen_pool);	/* frees pool->name */
>  gen_pool_create_fail:
> -	devm_kfree(pool->dev, pool);
> +	kfree(pool);
>  	return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_create_name);
> @@ -144,5 +154,19 @@ void *k3_cppi_desc_pool_cpuaddr(const struct k3_cppi_desc_pool *pool)
>  }
>  EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_cpuaddr);
>  
> +void k3_cppi_desc_pool_desc_info_set(struct k3_cppi_desc_pool *pool,
> +				     int desc_idx, void *info)
> +{
> +	pool->desc_infos[desc_idx] = info;
> +}
> +EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_desc_info_set);
> +
> +void *k3_cppi_desc_pool_desc_info(const struct k3_cppi_desc_pool *pool,
> +				  int desc_idx)
> +{
> +	return pool->desc_infos[desc_idx];
> +}
> +EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_desc_info);
> +
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("TI K3 CPPI5 descriptors pool API");
> diff --git a/drivers/net/ethernet/ti/k3-cppi-desc-pool.h b/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
> index 3c6aed0bed71..851d352b338b 100644
> --- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
> +++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
> @@ -28,5 +28,9 @@ void k3_cppi_desc_pool_free(struct k3_cppi_desc_pool *pool, void *addr);
>  size_t k3_cppi_desc_pool_avail(struct k3_cppi_desc_pool *pool);
>  size_t k3_cppi_desc_pool_desc_size(const struct k3_cppi_desc_pool *pool);
>  void *k3_cppi_desc_pool_cpuaddr(const struct k3_cppi_desc_pool *pool);
> +void k3_cppi_desc_pool_desc_info_set(struct k3_cppi_desc_pool *pool,
> +				     int desc_idx, void *info);
> +void *k3_cppi_desc_pool_desc_info(const struct k3_cppi_desc_pool *pool,
> +				  int desc_idx);
>  
>  #endif /* K3_CPPI_DESC_POOL_H_ */
> 
