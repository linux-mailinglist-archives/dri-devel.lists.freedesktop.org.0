Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24550D0BD1B
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 19:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCAC610E915;
	Fri,  9 Jan 2026 18:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eEi9hsqz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6276810E266;
 Fri,  9 Jan 2026 18:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767983201; x=1799519201;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NywDssrIOiaDtbjw9j2JeKFheiiZWfjlwzZ7Fd9zJ9A=;
 b=eEi9hsqzawFO6CiCg4uXIiFDjEWZZNmUmMltTHflUfYPJzJ51uZ/Mtis
 OXOVNTlvqOhzneE+SdxQmtNdxMcc+KjeGrM0AhWj4d2a8gKgIt6ACzjOk
 tQzTD4H8ArJbtHY4DPGY6tgY7E27jQSEWFY3vEtpgk3xbLpLIKoqK+Lji
 TxMyNLr8HgMFK9T15+zSLL9HykKaAKv+dshOQnG6kBYlzdxUywBY1IIqI
 bp0U4IoIPVr7wE2Nl9fqJk1J/CY21V0jZoIdI4Ws0pfpDilAryAhbUuVn
 GWQfucg+FKfVwG6hO3U8yxIMlt3+Vuyd9x+Cf5MoYDR9+9aha7kuwKKR4 w==;
X-CSE-ConnectionGUID: pocLqKnxSxSm5bYhvDwfcg==
X-CSE-MsgGUID: JVTC1QqdSAivuPFIM0KpwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="80819917"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="80819917"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 10:26:41 -0800
X-CSE-ConnectionGUID: 5djmvjdXRWSN+hNypdqYrw==
X-CSE-MsgGUID: 7HMJNa8jQCCHO7BTwnkn0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="203326458"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 10:26:41 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 10:26:40 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 10:26:40 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 10:26:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JlLaShTy6D+hz9FeINUmObkUZFa3uNt7yT7Zz2q0X+2d4t3ntbTN0cVNa3LaiipibWLVyGbSTamhwktRcvcNhDasNV5mDgCHasG7pZ67uqyXoOlc9ml1DGSOj/S2suEFovbk0qBoUHH0vvOsVG7L9iMC1wwhrWuP6Ye/8RHu5WbF5wMk2tcUe9/9WYUjcIIbpWtGChMSptZug3w/bi1a3M8IifSSxxwLUU01IY9RtzJLL/NOQMt4FGn61uOlfi5ZjwEQFhOuvf4a/DWYICceSOZAOBjbtS38nHakQ+sIo5GsF2ei1l2ks2j7nDgs43MxPgnEE+1xlxod/2mu93Staw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ov4TlI8JxZKQ/mqwmH29ZLZ4uNJYjYEwkhe50zs/dhw=;
 b=yLYI7P7VT0pjENLRStUH+roxhwoGu88THaJ/rSZdY8REf/oI619NRke7I28ldSu4YYa4uyYiYfFPQR5Mks8n2AKzJ3XA4dIEB2a7sY0Rv1lDR1sqI4lUVkr8heonaSsybKx3amcAerc5TQokngMmDBF9dL2iZ0uJ5myWCNSHrhtA1IAIV8p03aldJG8SHuocqxQv6gz6LCz3+saEdTFZz2f3Lmcofr6Bzo23rrengy/1IES/mF1bopyV+XQQk++0pozul0yMldxd8c1DmISNLLbiwcwhsugGL8T9MJVbRpAqZVR1kJrl1X8kPd4XioWJqgDF+IQI2TNNL2gtiZb3ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4522.namprd11.prod.outlook.com (2603:10b6:303:2d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 18:26:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Fri, 9 Jan 2026
 18:26:38 +0000
Date: Fri, 9 Jan 2026 10:26:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Zi Yan <ziy@nvidia.com>
CC: Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>, Francois Dugast
 <francois.dugast@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Balbir Singh <balbirs@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Andrew Morton
 <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
 <linux-cxl@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/7] mm: Split device-private and coherent folios
 before freeing
Message-ID: <aWFIW6XCKXPpIinv@lstrano-desk.jf.intel.com>
References: <20260109085605.443316-1-francois.dugast@intel.com>
 <20260109085605.443316-4-francois.dugast@intel.com>
 <d1d80b81-678d-4d28-9ac2-95cb74824e73@redhat.com>
 <DF5A6B81-7811-4654-855F-8EAB76CCCE51@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DF5A6B81-7811-4654-855F-8EAB76CCCE51@nvidia.com>
X-ClientProxiedBy: SJ0PR03CA0115.namprd03.prod.outlook.com
 (2603:10b6:a03:333::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4522:EE_
X-MS-Office365-Filtering-Correlation-Id: ae8813d5-95dd-4252-d7a5-08de4faca0bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFhsYWx3Qlh1ZzVLK09DR3FvQXVHc1NVQkppbVR4RERaWC9aOHRaTU5YSVdN?=
 =?utf-8?B?Z0VPdVpsODJlanJheFZMZ05uNk4rUk15OWJUek05cmV3RThmNEo2a1lvTXE5?=
 =?utf-8?B?Zk1MSk94ZG1qQmZtak5JMC9sK0cxcVdpcGkwMUY0bW8rMUpvRmxCWHJnZDRn?=
 =?utf-8?B?Tk1OTHJPSkp5WW9uTlJGWUZrdkZ1Q0FJVVdpRmtFYzc2L1ZnVHNPZFdGb1Zw?=
 =?utf-8?B?V3BybURkUVJSSWJKdUR0VVdZU3Nnd2NkazRTQkFld1QzT090RFpMMWFKWk1O?=
 =?utf-8?B?Z3lzMnF2YkNVK2Y2WkNUZzdNWTJRdTR2cmowZEZrblFwSjcrNERFZVpSbWx2?=
 =?utf-8?B?ZU9JMHVWZGRPV25HWlE2QXZIM2xJQUxaMTYzRUM2bmd0bDhjZi9wN21pNzkv?=
 =?utf-8?B?QzNrd3l1VHJmOWhidGNTaW1nS1h6Y2ZBL29VdmtNUGJiWjRHcG54eWg0djJE?=
 =?utf-8?B?MWhjL2RkRmRvNWl4VHllam9vdVBFb0RVK3pGb3Z1dlhwTHUyRzQxZW45T1NQ?=
 =?utf-8?B?dUJ5dTlJSmtQWHQrZDJUY3JCK1UwL3MzWFNLU21nYnExSWp3TDdjanZ2QWh6?=
 =?utf-8?B?aVhDSGcwZjFzaDNmSTBqTjFNUkVBWkQydko1WVBRT3ByYnJHaWdQZklReW5k?=
 =?utf-8?B?RjlnaFRJZnhiR1hPdlA2VVZmMXF4dStOdW1vZFBubVRzK1c0YnVGZ21meG1y?=
 =?utf-8?B?MUdDSmMzanRyS0pnb0R5em5hak85aWZOQThmYnAwRVN4aG1JdHFLditvV1Rn?=
 =?utf-8?B?aGIwZ3NzbXNhU2VMOEgwWFI2RUlqYng5LzI5L1QwSDFRa1BKK2lHc3hwSkVH?=
 =?utf-8?B?WDJndUtQY3Y0ZmRmbDduOG9kWHVFMlp5UjZoRndXV2xnNFFJK2tNY09lRk1Q?=
 =?utf-8?B?dllSR3NsRlZ0QVByZElJb3ltdXRBZmRTOStVMkd0Mkh0ZTlpc0tYTkh0dlM4?=
 =?utf-8?B?VjhWcGxuVlZHZi91WlZGQ01ZamJaekttRTRJZC9VVytoSjRMK2w1R2RUaTBN?=
 =?utf-8?B?QVUxdkkxNmdJdWVwL0YyWXY5d1hwaHhWRmpzLzZlR1YyZ3NxMFFDUDVmWnoy?=
 =?utf-8?B?RERiK1JpK21ZTi9SZDI0cjdSWExpRG5ic1dnU0o5NlFiM2p4ZWg5ZllGYXVV?=
 =?utf-8?B?d05Pa0l6emMwNWFUZ0xNZFlnQytPVEV6alh4eGlvRWNGQmY3dFErdDFDTkZh?=
 =?utf-8?B?RzBhRWhLb2cyMTFFNklXUDdrVUpRL1A3NG84RDNJVWs5WURMdzhhYThSdHE1?=
 =?utf-8?B?WHZkbm51c1phd0lFY1kxYkFtSnZEYWlMN0pxOEs3Q2NTdGh3NVpWTGVaekNv?=
 =?utf-8?B?ekZJV3c0aXFyUXVTdnM1RjVReWx1ZXQ3VlhBWWxuZFZmUko0R2xVeEx1Nyta?=
 =?utf-8?B?c293OTJxdjNHRVNQYk1OMTlSTWMwd3JzVUYvTmdjdVJBc2hjdi82OTh0REsw?=
 =?utf-8?B?UnRQSzNyR2hXQVQzSTFjU2tUT21td2wxdWR1NzNrNTRVYmliZUNndjNGM1ZR?=
 =?utf-8?B?bFdqSGJPVGtGSGpvUFJlSlN5RXg1RFJQaWxWMm5Hd2hLQTljUDllTVN0Nm9M?=
 =?utf-8?B?U1kyaXZscE5MajJjQktSMHZTZkIzN1d0eFE4VnpmYk5ZZnZ0QnVSSlBmaFAw?=
 =?utf-8?B?TnNaRjN1VmpaZlZGYXVlUEt0c3I1SDNXWkNHL0lvMUMrbC9SY0s3Wi9zTnNE?=
 =?utf-8?B?MWo3QXdqU2kvb1NmTXdMaFpyL3UrN3JnOE5XN3UwWkdDc0FnN1pMdXdmL0Q3?=
 =?utf-8?B?WEcrSTB4ZG1jdHhLZk1zSmZEK0hnUHg5YU1LWkVZdElTRjVRKzg0TUtYbXhZ?=
 =?utf-8?B?MnVGUVRWQVhQZmJPVDJTVE82cmo3bXlLd2ZEbDNEWURKL0NZbXR6SGJoWjg1?=
 =?utf-8?B?WGRURUQ2d25tekhkUzJlSWFSS1JHTTdSMGJ3SUViKzZNektZQmRWcS9YUUZL?=
 =?utf-8?Q?X08cDVf9KqnT8bZiQuUDMELMESvbjbsi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEszNmFKZ2JWMGpUM083bjNadTJHa3drM0FCM1VTUjhqV3RNbFowTUdycE1P?=
 =?utf-8?B?b0M0ZWgzZnJoSEhKZEVhWXNPVHh1Y0JoYXNnZ3V0RXcrUmdTOGlWNi84emF2?=
 =?utf-8?B?eXlyU2xYMVlkcmsrZHpCUUI4RytBTC9GamhjZ3pSR1I1NG1XcHdNMWJieFVm?=
 =?utf-8?B?ZGRyamU1NTB1aW5xeHVoUkhudGRVVlFxMVNEcmFlVitrcHREWXBpN2pCN2d5?=
 =?utf-8?B?NXExRGJCbjI5YksxWUR0UXF0TndXbC9aNkxGdUErZkJZRlVMUEZmTE1sSkJT?=
 =?utf-8?B?azNFQnZUTnB4RDVwK0x4K2VrUnhZVGlXU3E0KzdzNUZ5QWZzNEphU3lwYmxV?=
 =?utf-8?B?Z1FCNzY0OXFOVnJSYXZyUmM5UFBIOUhvbWlRNE1nZWF2bS9Mbm5ZNUFtWWpO?=
 =?utf-8?B?RFlDbjI3VEdTSm9Kb2ZtQzR5Y0lWY2pONTdSL2JjcVYrbE15cjBzWUZZcVdk?=
 =?utf-8?B?ck5TSm9VZ1QxRnN4VzRJKzBxbUozOE0rL1hidTdOc3JGa3RkQkxiWlJwc1Vk?=
 =?utf-8?B?aUQ0dEp6RHpOYjZNRWFaTi9pZVZhU3ZXUGgycDYySTJTT082cEl6WVZkSWxH?=
 =?utf-8?B?VWduVys0SDl2S05rdDVyam9oV05JTm45VitPdEk1TWNabEE5aFVKSTRyRXNQ?=
 =?utf-8?B?dXN5WDZmMFV0WWR1a3dhK1hWQnRzWUFQZlhQNHlqNENjWGVRbVZGMEIyaEV6?=
 =?utf-8?B?MkdvVnc5NzJOMjcyQmlDc052Z25qYVI5dU41SlpvdEFyYVVOelRRSC9zYTln?=
 =?utf-8?B?blpUYm1pZnRwbFllSE1TVytlUmFteG1GVUkzU3hGZFd1U0tmdmNTVEJtNWNZ?=
 =?utf-8?B?T2cybWQybFJ1bW5LT2szN0o0eG1mZVJONTU2NXFGdXpXNFdBc0NHblk2N3Rt?=
 =?utf-8?B?dnpLUnVnYjdaSzZlVnRuNmFOOWdvT1JhcVY3aWczaytCdU9Lc2Y5UFNpTWVO?=
 =?utf-8?B?aXN4MHk3MHZKMUpoWG5HaTd4QkVqV3owbWRRQ01YbllCc1ZGbXI3QVlNa04z?=
 =?utf-8?B?djYraGF0cENuRGdvNXc3N2lrbUpCYi8xVkMwbjgxeThSeHNFc3JoY2VXU1Ew?=
 =?utf-8?B?UWJQUlp4eXkzYUo3RWxuL3NoRktVLzB4QjZVZ1JscnRCMjl3N3pod2w5bjBp?=
 =?utf-8?B?ZStadDgrRUJGeDFrcHV4dkxhUnBoZTBveXB4c0pFS2hnNy8vWGxCbEY0aVRq?=
 =?utf-8?B?WXphVnRnRXN4c0pYVnhNVEYrMDVlRGJYbmdjK2poRkh3STNMMjNxa3J0elFN?=
 =?utf-8?B?TFV6aThVc205T3F2N1BBdllhQkEwTGFxemVneVphdG5KZ3Z4VGNUQ0wzYy9D?=
 =?utf-8?B?WXlyMGF0NEhjYkpiSHNvRm5BM2Z0dy84VEJ6MHkxdGRNY3BDYzZsbi8rYXVO?=
 =?utf-8?B?enBhZGttNlkzZlU5ZnlrZTQ4V2dnc0xsVFRJVjZvdXBNY2NLMU9ZdStYcDVW?=
 =?utf-8?B?RXRUMC83TXNOd2FDSmYxUkhBbUxMTHhuM3AwcWpoVTVMWk5mWnZqVFJLcUtw?=
 =?utf-8?B?emhMQnBNR0pJSUdPdnJwd3lPSDVYT1VRdHE2RlZ5dlkxTVdWSVJlVzluL3pY?=
 =?utf-8?B?cmNZc3BxMUxTLzhtd1N2WkVRMzY1bWx2bk5Ebk1RR3hPMzhsV01MQ3VVanB3?=
 =?utf-8?B?bmFJKzFRYklRelBVUFdkOThlRTFwbzlaNWd1UXk1NVRaVTlkK2EzN3NnVk5o?=
 =?utf-8?B?NmhQYng1ZUdyeVU5SER4Zm5NdFZ3WlhkbkxsTEpkWDhsd0I2TjY1MGZNQzhw?=
 =?utf-8?B?TnVXL29MNUNDUFhQTXhUQkgxdFdEWEZaRTVKdHdFMWs1VDNta2VCSk5uUkc1?=
 =?utf-8?B?eVNKQ1FySEFvMkRUSjR5ZTBnZU9vZkJEZXhoQ0VOdmkyOVdjSm1xaDNKS1dM?=
 =?utf-8?B?UlF4ZlFxYXlsT00wSEQrYXZybEhxamd1MTB5WGFuZG5uZ2lqMWVmYlRwdDh4?=
 =?utf-8?B?WUtKLzhYdDMvUDVjZ1IxQVY1Y2pIY0Q3SVJaY3BJT2J2dG5nd080WFVFb0ps?=
 =?utf-8?B?bW9XdGVTcUl3Q3lSVll6a1FFa3MyT0w4OVpRRWFyTVhob0JxUnlQcmo5amF4?=
 =?utf-8?B?c2dkT3k5b3BUTDNMTTA5dmVMQmZyejJ2dlpYY0hORWxrekpJUWpwVDd3QVpJ?=
 =?utf-8?B?OU81Q2w5YmxLMlArc0llb1JNU1pWTTJheG1ISU1VTzh6OGQ3Q2FIVEdzekI4?=
 =?utf-8?B?ZlZFSzNiS3JlOHlQMU42RTdQeW9pRkhYUk5LQlpCK2d2WW5uRk90ais5Zk1G?=
 =?utf-8?B?ZklCMC95b1RTd0tCOWI5d011WExRendTbUpCQ2g5cFlIeElnS2RUbjVjeXFt?=
 =?utf-8?B?YTluck1CVjRHalFtUDQyVzJTeGVnd29qNlE2eXRjTDZ6N1YvVG5UZHNqYUJY?=
 =?utf-8?Q?aDUFsI+sRi2RP4rA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8813d5-95dd-4252-d7a5-08de4faca0bc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 18:26:38.4269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 44cB4V6sfBlzr2O3zAi6mrLAS+hrdSHDWYG8tETAH/sFpivMvfm3zJz0pT1dSKQQNTaRqYbkroYbaj+1yRqz4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4522
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

On Fri, Jan 09, 2026 at 12:28:22PM -0500, Zi Yan wrote:
> On 9 Jan 2026, at 6:09, Mika Penttilä wrote:
> 
> > Hi,
> >
> > On 1/9/26 10:54, Francois Dugast wrote:
> >
> >> From: Matthew Brost <matthew.brost@intel.com>
> >>
> >> Split device-private and coherent folios into individual pages before
> >> freeing so that any order folio can be formed upon the next use of the
> >> pages.
> >>
> >> Cc: Balbir Singh <balbirs@nvidia.com>
> >> Cc: Alistair Popple <apopple@nvidia.com>
> >> Cc: Zi Yan <ziy@nvidia.com>
> >> Cc: David Hildenbrand <david@kernel.org>
> >> Cc: Oscar Salvador <osalvador@suse.de>
> >> Cc: Andrew Morton <akpm@linux-foundation.org>
> >> Cc: linux-mm@kvack.org
> >> Cc: linux-cxl@vger.kernel.org
> >> Cc: linux-kernel@vger.kernel.org
> >> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> >> ---
> >>  mm/memremap.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/mm/memremap.c b/mm/memremap.c
> >> index 63c6ab4fdf08..7289cdd6862f 100644
> >> --- a/mm/memremap.c
> >> +++ b/mm/memremap.c
> >> @@ -453,6 +453,8 @@ void free_zone_device_folio(struct folio *folio)
> >>  	case MEMORY_DEVICE_COHERENT:
> >>  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->folio_free))
> >>  			break;
> >> +
> >> +		folio_split_unref(folio);
> >>  		pgmap->ops->folio_free(folio);
> >>  		percpu_ref_put_many(&folio->pgmap->ref, nr);
> >>  		break;
> >
> > This breaks folio_free implementations like nouveau_dmem_folio_free
> > which checks the folio order and act upon that.
> > Maybe add an order parameter to folio_free or let the driver handle the split?

'let the driver handle the split?' - I had consisder this as an option.

> 
> Passing an order parameter might be better to avoid exposing core MM internals
> by asking drivers to undo compound pages.
> 

It looks like Nouveau tracks free folios and free pages—something Xe’s
device memory allocator (DRM Buddy) cannot do. I guess this answers my
earlier question of how Nouveau avoids hitting the same bug as Xe / GPU
SVM with respect to reusing folios. It appears Nouveau prefers not to
split the folio, so I’m leaning toward moving this call into the
driver’s folio_free function.

Matt

> Best Regards,
> Yan, Zi
