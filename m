Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 800BFD37A2B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 18:32:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C861710E90E;
	Fri, 16 Jan 2026 17:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Vstj32qP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013052.outbound.protection.outlook.com
 [40.107.201.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8229210E164;
 Fri, 16 Jan 2026 17:32:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y64Oj5h9cKBdpz3ACf7HiB+ry7j5zbZmECoWC9zAg2rXphKMS+sygwLGs0mqVtrs6Pa62I3juMhQV+C76WUB4B+yszy6QiKb+l37b6Uc8i6zZ4rkFsP1qGw5DPMxwwk2wtdAHhGsLqoWSCDFy5o1m1QJIRFZ8Ldljd14cwTchKTugK/bKieVf3PxLfpQM+9j5ko6aR0InWSqLMQC0zOF/RTckAfFXe+FBaMqwqRSC0Q6cVRRuiUCpTn8OuTdELEXZjYsho5qfTs1nAeUGjXNAeja7pWEInHCs/1ZZWGkV8078SONHtdYtJqOIwxz8216WVoOz9t7i8Eg6c+Y3F+OBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcOw7W6jmFs44Rl7FsnbH48w1zjMotY2tRk99KF72QU=;
 b=S/VOg9VgRmTAuwvYssfkYpt87+HS6s+IHnc4KkexEw1LOI1dHsVFZuPvLNR/DptypF+RXa2nsVL8lQ6YLjbgdzXt7lAUr0B47x/r/9qTUo0n8HjLKNqxNbQLPpRh8cHchH6zqMaUYZxdHFXEANUx75+t0eXNyMknw8GAxOj6OZETFbCjexU8LfcnVkkD0+i2mcl23ZW6foTB9+MvQuoQPn7DAImWeoP3ir+THYarzySy6YVZW+LiFE/OG7KvMGR5CZEVBOtJRTkwWzwOxzxQcRUu05Er0gmTTpDjfnzLzRd1VQG2DljnKvn9StzBT7bpIyQ1LJvXZ21S/kpFVVRURg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcOw7W6jmFs44Rl7FsnbH48w1zjMotY2tRk99KF72QU=;
 b=Vstj32qPpw3IUEDjT8ZBkGtl8QzI36OZFaxu/fXaKGyilLcqQWBIa03s2+7RuFFpVHSnEUE6FjsxoN9YqK0GokC/arpas09t4XPxFYa7HlTDQm5SJ+/pXAsddsejWmL17WEYS0yMTBtKydBgdioVAFcuXgmOA19n+lplVJ58Yonq2B+Irhq7A6gARPUcnquEEI5NAza9PdLEin1o33dZ1R8DIr3QdbF7d+wPVwX/VgKknoo0AZ/9ZoDaHBrbSEkQA4Qsu/U2BFKuGQit0XU4Vz7yGJcACOefN90fqOoXAcDHuKCdWGa3ehqTg2if1YF6MVHN2mtjBbCMdlJ2nkGHCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DS0PR12MB6534.namprd12.prod.outlook.com (2603:10b6:8:c1::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.4; Fri, 16 Jan 2026 17:32:12 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9499.005; Fri, 16 Jan 2026
 17:32:12 +0000
Message-ID: <f2d58c0d-35e5-434f-bf5d-e261b70aa6ee@nvidia.com>
Date: Fri, 16 Jan 2026 12:32:09 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/6] Unload linux/kernel.h
To: Yury Norov <ynorov@nvidia.com>, Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Leroy <chleroy@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
References: <20260116042510.241009-1-ynorov@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20260116042510.241009-1-ynorov@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR02CA0034.namprd02.prod.outlook.com
 (2603:10b6:207:3c::47) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DS0PR12MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: b7b5bba6-6f6e-4354-43cf-08de55252eea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|1800799024|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3NRbS9uTTFIdTgwSm9sNHdMKzJsSEpKRE5VZjQyVkg5bmFkb0MzODNMK2tJ?=
 =?utf-8?B?bm1YNUJ5Mk1LRmN4TjhRWkFvSlVUTG9NMW5SSmU4aEJxVzRjdlcyL24vZFlG?=
 =?utf-8?B?VW5iSmJ4Uk5MRjJNVzdDcDhxMTh4alhsa3c2ME1aRVlGNStKZTdMNzdnRFpr?=
 =?utf-8?B?dHIvSk1XNW4wV3F4TWphYlc1T05adVMvdWZRQXRnWEFTTWxqamtvMlR1L01h?=
 =?utf-8?B?TlBLcUZpamJzMzBacWwrZkhxVjR5TCt1ZVF0NmNsSnpwaExjYzdhOXF6UHMy?=
 =?utf-8?B?RUNUbkFsL0RYalRnWjFTVit5d3d2UklHd3JRQisyR1VSbERxWGdIcEtqNFhE?=
 =?utf-8?B?a2xaRFBvNmN5QU1Wa043dWp1UW9zaU5mT0FWR0hQOE5XY1NkTVRGMURXd2tN?=
 =?utf-8?B?TXRhc3FnRTB0Q3A4Sjl0cWdBRW1GVW9HWEJVcG03RTVidTQyWjhpWkhQVS84?=
 =?utf-8?B?a2xTZmFlTkZGaXJlUGI5WmZxbHhSc0NCWmpkMFZvdnlwQ1c2RUI5UitEVmZx?=
 =?utf-8?B?S2ZEOWJGVENIdG0yM0R0YXlmb09YeURrWDY0WUpQNCtqZTZmT1hlRm9pY0Uz?=
 =?utf-8?B?VTAwTklmM0JSSERZRDIyNFhSWTZWampFcHh4K0laZ1hYK2d6YmNjWUNXQ3B4?=
 =?utf-8?B?eU40MHNsOEJha0FEMmF0dEp1UmQyc2svOHFNTW1qc3RMeW9FYmxmVUJBL1VK?=
 =?utf-8?B?TS9uV0ovUDg4S3ZyZ25nQXBRNGE3c0lXYzNna2NlQUthQmZIdmlwQmgxSXBM?=
 =?utf-8?B?OGRWeVM2ZmNJT3owZ1hBdGExUktTWUVlZG9oTlpIbEJWejJTbklxQzd5RkZp?=
 =?utf-8?B?V2ZMT3FVQnFWRkJLZURLNkN6V3Z5aDRNbnRNeXdWZVU4VThldzV6bU5xd2dL?=
 =?utf-8?B?L0Z5aENYNDhidklReDVjbzRWaFBxSkNDWG1CMytDYnRzUHJ4em1NeHNieWIr?=
 =?utf-8?B?K2tsZW4wSWFLcFUwWlJHQTBsbHdXY2x1cnVwZ1BiUk9jczNQQTJzbFNzTUU5?=
 =?utf-8?B?c0NrTTlleEdQTCtFRlQzT0dGUGo2SWZGOUtOMTArMnpJM29jMFIxY2dhck9P?=
 =?utf-8?B?QWxqWm40M1lXdkNxWkhLOURaU1l4YW1lMHJuOS9nZldQTjcxM1VMM2JxeVM5?=
 =?utf-8?B?OWw3VnVoeVZZTGNWS2o3ZWd1VzgveUxNTXYyS0ZSYlJLTlJSVUE2NnkwUVAr?=
 =?utf-8?B?Snd2TDFxS216NWcyOFNlQURwNTNPR1VqYkhpVEtOdE8xanRJdWY1WmpvL05O?=
 =?utf-8?B?TGpFNUZ3b2lHc052Q1FJd205cjJhYlRpTXhybTl0OVRoajI5aVFQOEJScGZ0?=
 =?utf-8?B?OVFuRUpiMnVRSC9ZMlRhZzc2elVxRkVNMjZTamtxR0pqanR6dkk5ZGF6VFU2?=
 =?utf-8?B?T2pubG5iSitObnhBWkpRVGRUclVkS1Z4T1VtYUdaZDU0RFpaTjJHTEttTTdO?=
 =?utf-8?B?dG5ZSGUxRmJlN0tZWGhEYXVYSmt1UVJxZWlKc1NhNGpFZFVkVGgzdEM5SU1s?=
 =?utf-8?B?ZEY4cURuR2o3WnpKN2trcHRSZXlyWS9IKzF3OHVMbUtjMnJ0dVlpMUpHSm5Y?=
 =?utf-8?B?aThzWG82bnV4Z2tMNHdwS3hzWjE2UlR6N1dzbnB1MW83d011TENvZno4Ry9N?=
 =?utf-8?B?NzVrZlhCUUpjUFh5UG9nY1pmeTZjVnpydU5ZRUdFWm5mRTZaUEJJdFMzeCtQ?=
 =?utf-8?B?ZFNWQThWcVZueWgya0cxRHpPeHJ2QmY2cDZmY1lUZkhaMnBZNG5ta2ZJSUlY?=
 =?utf-8?B?a1dMNVNHNE5qdVNRL3lBV1NRNUZoT3drTTdZb0t2eXB3MGVQMTJCN0pBQVFn?=
 =?utf-8?B?dmN3NnM1MmY3UDQvc1U2T1c1SDFMVHBVZk1HcHI5WW45LzdyU0xNTEVhdGRZ?=
 =?utf-8?B?RlRHR0pubVBiU3UvSUkxVUlEV0tEbVc1dzhoZkpwdVB1dkw3eTFFbjh3YzZZ?=
 =?utf-8?B?cFI1Mmc0QUNVSWpjMzRJWTNMa1JSWlEzK1lGakt2TWw1OC9VaHZkZWhUZlhm?=
 =?utf-8?B?Z3pZVVJpQkkvcW1kK3ZQcFhxL1pCT3R6OUcxUkswdkllN1RDSThIaFVlQ0Z3?=
 =?utf-8?B?RUZZNyt0cHVBWGl2VWFJbmNKanRqK0VLTUpzOHlqV0tPV1BBTkxXWXRVZkFM?=
 =?utf-8?B?dUhFZTllSVFNeFVPenVRU2dwQ09kdFd4ZTRtRCtvdkcrSG4zRis4RXdDSnFs?=
 =?utf-8?B?MkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzBGa0gyQnRzdk9GSW81Z2t0b3h1Y3JZdFhKcE1uQjVCRnc5WnFuVHlOU1Zj?=
 =?utf-8?B?MFZLZTd4azFsYitCTFEyNVpSWUsxa3lnSXVBUjFNQkZVTnRjbTZOYmcwWlds?=
 =?utf-8?B?cERqSnRGNlZ4T1daUG1LR3BoMW8wV3pPSmFtZXVCTjUwSEljWnErb1p5R1I4?=
 =?utf-8?B?TDFnSHl4d2xoU0NKRStjYXZwdmF3SG80S09lWWQzWlRoY1hqbHZpRG5HaEI0?=
 =?utf-8?B?MFJyYzlmdWdmSGUxMlhGY3RvMldIdWpEZ0RicTJnQUdkbzIzWFdIWEJDVzlQ?=
 =?utf-8?B?NC9kc3JaUDVpdFhTM1ZaeEhka1hFdko4KzJtYWNYNmgzdXNXMDlhVmZPak5j?=
 =?utf-8?B?UU9tc0taZUUyZVR1S2lLUmgvb3I3YlJXTlVvRTJ4NUlZWmhXajZkTHNEbnRs?=
 =?utf-8?B?MXRsUHJQY3J4bzZtUlhIc3lUa3lMdWVjSDZJQm9aMEdCV1VRUlM4V0ozdWJ1?=
 =?utf-8?B?NWduOUxjYnNXZTEwY0NhRzlRLzlUdHo1NC9yVWFLQUJwS2oybjJSQllGcmkz?=
 =?utf-8?B?YmxYV0RKZy9laVNNOXdVQ3hOOUQ1Ty9ySlRjSUZlSmdlTDdha3gzWmU2Wm5Y?=
 =?utf-8?B?cmdsN1VuVWxwa3JDRTNuZklLbXo4Y0RUZGw4cjNNSklMV0JiWjRhNXg4bFdY?=
 =?utf-8?B?TXRxbmhFZ2RpVWhLR3JxRFlOQ0pJY0NpaWxQeEg4bjh3c2xUUFp3ZVo3UlVm?=
 =?utf-8?B?MytaQWdCbGdHakhDQ0FUV1F4Ukt1NUQ2TlVoUlQ3ZDh5a0FYU0Y4dVVUVkxY?=
 =?utf-8?B?WEl4S2ZtMUs2QVE3dUlZaFBWZUpma1ArNS9scithYnQrYUZtdERKWU9VYm1X?=
 =?utf-8?B?U3Uyc1V2YW9aRHZldDV3T3JPd3Y2bUVISTlXNnBETUJqWUlITXR0WUU0S1gx?=
 =?utf-8?B?NHVKaSswU2xaMEs4TlAzdGJvS1NwUW80LzlKSTBhNHV0TW1wVGFkVUl0NDdQ?=
 =?utf-8?B?UzNMbUxMTWRMSzhrTlVHQncyN3dDSVNHNTREMHVPZ1AzOWV6Tnp0VmgwWk4r?=
 =?utf-8?B?TCtNbHVXMUY5VVdRckd5VWdxWTNONVFsMVdUM2xqcytWS3B0SFkwYXNUL2Za?=
 =?utf-8?B?ZHdiaytWRGhuVXI5TUNCTXJ6bzQ3eVR3MmVSTVBtRFZCc0ppL3QxVHROSzE5?=
 =?utf-8?B?NWlSRkpMQ3ZzYTBiMHRIdi9sdFMvTUcrR1pjdHVzamhTYk1yc3c2U0tMK1Jv?=
 =?utf-8?B?MUlXTWVHTnNlczJOc2pPS0t6MUZYdFNsM0FXVW4rd2dqcWdEc2gzRk11eStq?=
 =?utf-8?B?TXErc1BVZlpKSm94TU1ORURjdXRKZU0yNnZlT1hxLzFXcTNyZndYdU9kRXFq?=
 =?utf-8?B?bjlwS3lNK0dISEduNGZIbXZFbVRGVjU2YTRKWWcvZ2E4VElTSkFNcFV2SGJq?=
 =?utf-8?B?MGczQUY0TEVGYVhxaFF5SXYxTWZJNEI5TDVNLy9LUGk4T2tZRjEwbWtVcWFI?=
 =?utf-8?B?U1BkdlJrQWpUcGlZZVl1Qk5qTFdaU1BJZW9Tc0ZaclNnYWJEVzJpd0J4dmtG?=
 =?utf-8?B?M096Qit0WmJRbVV0eFcvcjlXb010MXlJa0V4RWI4R2EvOXRWcHo4ajNmR3ZY?=
 =?utf-8?B?SDNTbVJGM283R0JQR0E2MEgyV2tXSTArNVpaTzN6WWNOU2lROUoxbTFFL3hs?=
 =?utf-8?B?V3ZSSWxOUFczNXZOQ29uWi9WQ3kzdFlrQ0RYem9mSnY5Myswd1hhTGYrTW92?=
 =?utf-8?B?aUZoTjZHQTJ1RDVLWUR1MnJUNElBakxhTG9SUUpUSW4zdEJlb1BCV282Smkv?=
 =?utf-8?B?dWx4SlFBVG1zY1Bkbk9rcytFSVpmUDRjQWhWRzBFVGZ4OVk3OGhZc1ZYY2VM?=
 =?utf-8?B?b2ZtVU40NFc2RTEzNllJZlFIRmxWVU5ud2ZPb04wa2tVSVBNZWRqZitoSEU3?=
 =?utf-8?B?RmJ3b3hBVzJtaGJlelBIWFRpRDlkbWNtemlnaGM2NXV5K21pUTlZQit3Q25p?=
 =?utf-8?B?QlJLRTZXbFI2MHoxM0pGb203ZklETWJvaERsNjczYVhVN2kxQTRCSEhORkxp?=
 =?utf-8?B?ajhyVmo5OWNmS2w5ejA1TUZUbGFzMHJwYjhhZ0t5YjRzYVJ4dDl5VllkOVZL?=
 =?utf-8?B?bWxtNUkxNWVzRVhOdEkzZnc4NDdZb2xtVm9xQ2FkbFVaaTl2NDFRVUF2N2Ex?=
 =?utf-8?B?bXZUSHZJNDZGbXNIaWhXd2V5dk9BMVFBQ0hKeG1SOGFKWk9FblJvN01VVjEv?=
 =?utf-8?B?MnF2ZXo5enpCTnZHTlpwM0xVMUt4b3ZnU25LK29ob2U1aVhUbnBPSVdySFJi?=
 =?utf-8?B?Z0gxS2htakoyeEtieTZvdkdZZUw0Z1l2OFRiWk95Zmt1TkxLNHkyM3V2eU5j?=
 =?utf-8?B?VUJzdUFLNjN3aUFBRThMRzRzeFNQenhFclQrNWNzQUhFaTBMYm4rZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b5bba6-6f6e-4354-43cf-08de55252eea
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 17:32:12.3560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 13MDVbL3rpEH7obwRKdXiUFfnxgPGbur3X2b1jdmkF0PjyY94uuEk9EuTij6yXXN+Z6NjgZeziH+zt/hQ0BVPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6534
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



On 1/15/2026 11:25 PM, Yury Norov wrote:
> kernel.h hosts declarations that can be placed better. This series
> decouples kernel.h with some explicit and implicit dependencies; also,
> moves tracing functionality to a new independent header.
> 
> For testing, see v4.
> 
> v1: https://lore.kernel.org/all/20251129195304.204082-1-yury.norov@gmail.com/
> v2: https://lore.kernel.org/all/20251203162329.280182-1-yury.norov@gmail.com/
> v3: https://lore.kernel.org/all/20251205175237.242022-1-yury.norov@gmail.com/
> v4: https://lore.kernel.org/all/20251225170930.1151781-1-yury.norov@gmail.com/
> v5:
>  - drop v4#7, i.e. keep trace_printk.h included in kernel.h

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

thanks,

 - Joel


> 
> Steven Rostedt (1):
>   tracing: Remove size parameter in __trace_puts()
> 
> Yury Norov (5):
>   kernel.h: drop STACK_MAGIC macro
>   moduleparam: include required headers explicitly
>   kernel.h: move VERIFY_OCTAL_PERMISSIONS() to sysfs.h
>   kernel.h: include linux/instruction_pointer.h explicitly
>   tracing: move tracing declarations from kernel.h to a dedicated header
> 
>  Documentation/filesystems/sysfs.rst           |   2 +-
>  arch/s390/include/asm/processor.h             |   1 +
>  .../drm/i915/gt/selftest_ring_submission.c    |   1 +
>  drivers/gpu/drm/i915/i915_selftest.h          |   2 +
>  include/linux/kernel.h                        | 210 +-----------------
>  include/linux/moduleparam.h                   |   7 +-
>  include/linux/sysfs.h                         |  13 ++
>  include/linux/trace_printk.h                  | 204 +++++++++++++++++
>  include/linux/ww_mutex.h                      |   1 +
>  kernel/trace/trace.c                          |   7 +-
>  kernel/trace/trace.h                          |   2 +-
>  11 files changed, 234 insertions(+), 216 deletions(-)
>  create mode 100644 include/linux/trace_printk.h
> 

