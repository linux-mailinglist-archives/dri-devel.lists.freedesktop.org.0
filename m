Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA91D0C544
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 22:35:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3847D10E0B1;
	Fri,  9 Jan 2026 21:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QGEBSPQr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011037.outbound.protection.outlook.com [40.107.208.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D7610E0B1;
 Fri,  9 Jan 2026 21:35:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AhIkAUFpMAvKVcXsCBKwm/mDymNmMIMNr+iDyERDmMGaVz/op4ucNQebofaitawGZg8KWPu0fQ9XZnS86Ize1oAv5fGemVQjpPK+yT7wKjAU+2SO0Zm+SX+qJbpwYwmdJ0oUTZ1VC5aqXoOtW4gwApuYxem1wD9GVB2/8dP91LzzJp3ampxW+DY2n/4u92rZzCxlEl+L+Gt/sPc2duh3N7iTTJdQJfBoORzjiM0bp2892xum6ibwZiIHnCFAqG8KOWjHNX9sE4s9RpW4PPqn5+6wvzcDg7+IHESbuEUW2QdZg+h7A5EeINAlUSnq8I715BcOi52sIQ0prpJc+XZvWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDGVtG295pQk/BxY4PzA5WCHQ9jnVHUAsS1QHlsHb1M=;
 b=s+dcPo5MnE+mlvqzmpdktNUVRubu/1njUDpHu9KYblCGNkP23miM5EXKTsRY1NADztn9JNqMfumx8T43sJsuq1pP47RNqKAed15kZND6RCtMkfyGqjL3yya657obQBqZVjKG33COMATHcLDWAfeyfFaXrCuNIpvAu2txicvUxN+z1nPrdd0wTOmtt4JLHuOpalsPYp2CC8W0/mHXjaHzZdU2x+CEdRA2x9vpRZyD50STI1ZSTrE2t+1NFcXuRansuE6pdgfZPo81pbYobzh+QEHUWlAQzwhzfVGFr/mpVgDIUzFSQ/z6jQLSsqHFxE6ZmCyh1pPdESEXTKoUzPTXeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDGVtG295pQk/BxY4PzA5WCHQ9jnVHUAsS1QHlsHb1M=;
 b=QGEBSPQr9Kl1Ve6epBSSrlo4P3W9JY3cCvNwKvcBIvSbANh6zUZlyuJUnfWkIQMrnNuwHVao2QcGNAOWYr/HnBjiH5VdnzNmBUJotYpulZ+GR0Wp31i1SAFfW9JYYXxEk7JVpowYI8hsxN2rRM11jBX+pDNyL1Zq5N+TFjBxGUSoEpYhPmodGNTAxxfOtKjhH3NIxpBV7t2eIXVJ7BlCA7cPiguka/i2VEY1+S88QHUy7DOgSVd3pMzouPSKT9BZJ+g8lx3JWQmBO3HzgChy+TTaEgYSb2nKqXgRCLXgpIoq7HyJfMj5HPGz4tuX6kL+XaslMbvyKDTC+C/KSPaFsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by LV0PR12MB999092.namprd12.prod.outlook.com (2603:10b6:408:32e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 21:35:04 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9478.004; Fri, 9 Jan 2026
 21:35:04 +0000
Message-ID: <4485ba83-a8c7-478f-953f-78d66e84d730@nvidia.com>
Date: Sat, 10 Jan 2026 08:34:57 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] mm: Split device-private and coherent folios
 before freeing
To: Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>
Cc: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260109085605.443316-1-francois.dugast@intel.com>
 <20260109085605.443316-4-francois.dugast@intel.com>
 <d1d80b81-678d-4d28-9ac2-95cb74824e73@redhat.com>
 <DF5A6B81-7811-4654-855F-8EAB76CCCE51@nvidia.com>
 <aWFIW6XCKXPpIinv@lstrano-desk.jf.intel.com>
 <D9ED5F01-E758-4A89-87F2-ABFF5197231D@nvidia.com>
 <aWFSGc7MIUqVsilw@lstrano-desk.jf.intel.com>
 <12A9DCBB-0B59-4D63-9BA8-9F99570AFA80@nvidia.com>
 <aWFe9S2DGwfD2smO@lstrano-desk.jf.intel.com>
 <B8B15539-F97A-4D6B-BF58-FC75397C429F@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <B8B15539-F97A-4D6B-BF58-FC75397C429F@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0051.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::26) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|LV0PR12MB999092:EE_
X-MS-Office365-Filtering-Correlation-Id: 7be3c072-df6a-4626-9f13-08de4fc6f3b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|10070799003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aldMNmFVcDR6OGxZNjkzaEd3RXJTM3N3cXZ3VlVVTEhHOC9hazVDWFpVeGlE?=
 =?utf-8?B?bW0rcUdqNnppOThkNXJ1d2VNWEZZMll3dTVURXgrMGhjV2djWk5WcDFncnlK?=
 =?utf-8?B?S1lpQUVjS3orOHc1UzBuaEllY241bjVUc1YrMCtpK0pHZUdKaHIrM0xveFY1?=
 =?utf-8?B?dGZCOEdJZXdocEd5czNDSXBKMEFiUnUyd3dLMm5BNDl4K1Z6K254TWRzdU4w?=
 =?utf-8?B?eWloU1IwcjdwWVZ5dnN0d1YxckUxb3FtbnJwcnpNTG0ydXJjSE5zMWc1L1do?=
 =?utf-8?B?cUNPMVVVcnlsa3lyazlVTFQ4MUhNNmc4UTk3T1JzNmdqWEc1T0RjVUw0VndZ?=
 =?utf-8?B?dGJrTG56czFCQVVnL2QyazhhUVNHa2ZnUnh2NjVMQksremZWMzlucExsME1s?=
 =?utf-8?B?bndQS011Z0xsVUZiR2MyaXZLZThmZjloSlBVV20zOCtNdmhNbVhIcU9MekM5?=
 =?utf-8?B?elNOeGd1Wk41NHNpMlNJV3dRVG1pSm9rZ0tJckhQb2xJR05ENk5rVlZJeTRS?=
 =?utf-8?B?c3FvOFlwakpoOGprSzJ5YTI2SDdvanRmdTZWMi93aG9MMXVJTGV2RUYxUzZ4?=
 =?utf-8?B?M3JpVEswUDFWT2ZuMEw3dk1Lc05GNWNPS2Z5UXg5REluSkFsRUhFWnMyTlEw?=
 =?utf-8?B?dklWZTVQY0xBRlZRWkNvdXhwbW5DR1MxUXR3THBwMnY0dmhyeHcyMXFjRVYy?=
 =?utf-8?B?N0hWWUdab2ZuS1VMSHVvUHdnemFaTWtTczdMRXdvUnlESXl2MnhnK2NiV0tz?=
 =?utf-8?B?aW1GcmhDK2ZBS01rUWFlaFFlZnZ3NW1WRzhrQUVNSW9wUENtU2VkWVo5ME5Y?=
 =?utf-8?B?c0Q5NlN1bmtxNHVvNVdWQnN2WnFtZkZVM0dxYU1vSGQ3YVhrdmNNUlRqWWJH?=
 =?utf-8?B?MDd4NXJmM0U2bWNxd2xUUkRXNGhnYnV5eFBRL0R2R1VzaEZGQUcrRktXWm1H?=
 =?utf-8?B?OFRBSEV3Tkt4Uk9TczNsL0w0YkVzOWMvVnBVMjJLS1VUOEk5RlBYSUdmTG5u?=
 =?utf-8?B?N1MyRlFUbGVUM05GZzhrcFUxdlZ4bTFOSHRETVJacm1rZ2ExQklad01mbkU4?=
 =?utf-8?B?V1VrY09LUmFyMVUzMTlZRmxXeFlHZ1RnVDYxVVlDc1h4Y20yN1lBM2Q5cTBW?=
 =?utf-8?B?ejJtUWFFdHVqZkFSSG9VSjJ6UnJmSmt6REl3c3BMUXVaZlBKSUxybGFFN3Q5?=
 =?utf-8?B?QXFKYkZLRHJuNm0rR0NxTlkwWWJnZ1Q5MmJ3c1RESEZDTjRnb2d1b016RFVY?=
 =?utf-8?B?V1BjOUdXM0ZaZlBBM3A3RUhIcDhZTFdHNkRQUlZMRkxLUk93WTFBVlcwcElm?=
 =?utf-8?B?WWg5cS9RTUt4a2VhK2ZZeXJmekFaQWIxYk9IeURrK3FrdjBRUytGTklpZmJY?=
 =?utf-8?B?RTc5dVRvWVhZRzYxdkpsQ1dNUWJabDNUeHdWb0NnRC9BNk9MYjEvbEdoUHYz?=
 =?utf-8?B?emtvM1owS05kdHRLckRjcEhCZHpQUjMrZFdQNEZkU2w3WmFrcGxJZEpFR1JD?=
 =?utf-8?B?Q1ZVcEJFTU1nZzVoTFZmWVcxek1UNHVGRndDR3o4QnVKZENSMTd2RjdJbVZV?=
 =?utf-8?B?UHlWb3N2aWEyeFBTNDlkWGZqU0l2YzRqcHBHTkN1T050RUFTNWM0eTNLK1pz?=
 =?utf-8?B?UzNsaTBDTERPaFdwRytlOS9TSHZ5NVowdjJDUXRLOFdFLzJWQW5JWk1iSFNT?=
 =?utf-8?B?azhqQzNnT09ER1lOeDZrSUpNZktNdEN3VU05bGxWeGRZRHNsYXpWKy9KTjR6?=
 =?utf-8?B?VzQrNG5sZVpyay85U3V5aUpkd3VPUHhJdzN6WnJDVUl2RTVOZjdOT1cwUEt6?=
 =?utf-8?B?OFB6YzVBZXFLT1J4cWF3amR6TFpMYitQZlV6THVFdFZ3R2p1QkFGSExNSTRT?=
 =?utf-8?B?cTY0ZUcwYzR3R243RkdvN3hkZklLc1M0TWFLZDhaVllaWFVVV1E3dENPb2o2?=
 =?utf-8?Q?6IPM/FuWkghA35qHaviuzEkJPwP+p4La?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(10070799003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0drOGVHUHRBOGJTRU5DTHB2ZitiWTVINCtqOUplQ0h3SEd4aStpL3Q3SGI4?=
 =?utf-8?B?aVBFbUF2ZDhuN25vaU5US09ESE8ydEM5VHRPTDZncXdkYVRIbWc0cGRmdVlV?=
 =?utf-8?B?MnpFVk40NWxvajIzU1FhY0ZMT1lPaFdRR1Y3d1MyemNoM3NiTnNSekh1QXEr?=
 =?utf-8?B?SmcvN0luMFpYNEV6U2FzMWpYVmJCT3JZRE5MTDFnRGJOdzVYNno3U3FDTWdq?=
 =?utf-8?B?RFBjc3ByVjBUUkpLK3pzbFZLU0NFY2JEbW9FODlBWjc5NHJoai93Q0ppVGpO?=
 =?utf-8?B?TUJSN0d6MWtqUmRPdGQ3eEY3RFAxRm9oZnNGOTBLbHY4R0lES3JGL2IvMHlC?=
 =?utf-8?B?SjdzZEZ3Qzl3WWRnMjZYS1dpN2RaamZmYkVqNFF5ZDVUQUF2K2d4K3A2NS8z?=
 =?utf-8?B?ekd1M1RJZWZQbmxFaE50QitHRkU0U3E3T245bFZUYnNORHJyV1MxK3hGZksw?=
 =?utf-8?B?aWk5ZzZ6b2xKdkpvTG5sZ0w2WnVpcnhOVWFjZjdyWjJSTGFzV0E2UVN0ZklW?=
 =?utf-8?B?VEZKV3FlM1lwNnZockUwVk1EdG5sMmpIUzc2Q1pKU2JiSWRoMW81MDZPcWdZ?=
 =?utf-8?B?RG5ja2NjNmF4NnVwQTdocGpJZDhxd01LQVkvVWthMG0rVHUwUVpnRUtmSlpN?=
 =?utf-8?B?QzgvOXQrY1VHN3p6YUhjb21URU5Rekt3SDYwQWd1SVZ6WmQwRmhQL1FvT2pN?=
 =?utf-8?B?QXRlVlJWLzlJZ3ZrL1hiejhseHg0ckMxRGJ4NTk5bXhtZnRTcStDMTBSZUJI?=
 =?utf-8?B?cG1SdzhlRzRqWlNhZDdMOENFYk9EVHgzQXJGZDQ2em45UGpZc2M2ZzFtV2Ez?=
 =?utf-8?B?Z3JUNGdXTituaDhCMkFVR3FLa2JTQWJDamVlRmcwQngwUjIwTE5MTmlKQXhp?=
 =?utf-8?B?Z0F4cVVDOElFOFFlalV3VzlVQXIrdGVxcko3YTNVL1I1UExrYmkvZnFaZStw?=
 =?utf-8?B?NUQ5MGxWQVVTbXZoMTZwd0p6akJtWFFWUVBXSy9QcWRGcDZXRGlUK2s0KzBh?=
 =?utf-8?B?TnpkKzlQa2krTGhvZkJOWTh6eEF1MXVISUNmck9IV0dWWjdhWTBnYUt0Q2lV?=
 =?utf-8?B?aHM5a3ZCeHI2eU9yejI3ZEZ4cVZnUjZOdkZZUmhXRFFlL29CYmJYci9lbFdS?=
 =?utf-8?B?UE5QbER1dzdxUi9GajFmblBVSzJLeWFINGkyYVFtbnhnUHBTMldUcVM1ZzlQ?=
 =?utf-8?B?bmhOdmZQMmRKamhwWEJjSk43U25KWFBrMkxuRTdFUjVnOGJuYnBybCtsQjR0?=
 =?utf-8?B?eDlzSVJjM2h3eEg5dGxVMFlPOXh6SmN1VmJtMFVnTTQ0alFCeHByYk1ycDFr?=
 =?utf-8?B?T0UvWVp6OW1BM2JEN3VadkRnTy9FZnhwOThOQkphVGFDa1FpS0ZDNWJwcWtL?=
 =?utf-8?B?Ryt4cUl3MlRNZmI3SHNLbC9ZUVRDTy9TU29ZWGUzRnZ4VDdEaitIVzE4cStZ?=
 =?utf-8?B?M0Nud2V2RjFsQ2o1dnZYYkdRU2FaL0ZMQ1Azc3B6dkQ1Q1ovaC9EQmpXWDN0?=
 =?utf-8?B?SEhQU25lMHpkWFVUUzRndlV0dWVNUzhwVkQ1Q3FJSUdXbFFSUDcxOHQzQVQv?=
 =?utf-8?B?QkUrTGIxTVFZZk1GUEF3WThqRG0wbnNUcG8zazJNWXA0YVBTRjI2WGhVWmRK?=
 =?utf-8?B?aWNOSzMzU3Z6VWV6dURJWW5HbHFyaERIUDRuZmFITnlLbCszM1g1ZDJBUlJU?=
 =?utf-8?B?L1NHV0xPZmVVQTBMYW54NTg5enBVR1hLM2ZxVnp3Y3g2MlYzYVdkUmRTbUpS?=
 =?utf-8?B?MGNUakt2WHNXMlZRTWw1YWthQm53bHFybC83amlnb01KWW1Xb0tvSUhRand1?=
 =?utf-8?B?Z0pabzducTE4eEZpMWpiRzdKaEdXblAwVHZ0S1U0bkg4Q2J3QVBHNjZGNWRP?=
 =?utf-8?B?ZjVyRUpIWDh1WWRGM3BXR3hFRlFoV1pXOEl6aE5LZWp3Q013Y3d4eDJRaHJi?=
 =?utf-8?B?M0tvN05lQmRVd0FIZERUMmxhekJiUDc5ME4rUXFHSWVYV0JHenZHZ0hTRmVj?=
 =?utf-8?B?aEdIdlE5ZEpuWE85Z0pTYWovUHhTbnovUG1YTk1YS1oyVTc4TCtDeUVzSzRZ?=
 =?utf-8?B?VUh4MnNnQURGb09UVk5JWnVoR3VhVUIzWE1HWlpwLytKV0syVDk1emhKWERB?=
 =?utf-8?B?MnpkaFZqaXJnRWFKWXJXZ0laK1FjVTZWSDFSU1JqekxzbGh1Vkc5L2JMY3dT?=
 =?utf-8?B?bW0rUVg3Z3FSeGRFT1BsL2JhRENQVHNNQlBHMWdLMkZueE4xamUrakh0SW9P?=
 =?utf-8?B?QzQzaWl3R0plTFJyY3NZcFdOUmN5dXc4ZzVjRmhSaTEwckNYMU5Fbm5wZHpE?=
 =?utf-8?B?N1Zzb21obVdKbHRhWjRORGRyTXJ5V0xSUTl6VWZMbWNCTmhRTno4YjluTGlI?=
 =?utf-8?Q?XCXUTn7BMFBxPC7lk9e33443meJZ+vxaBJEXbNKiyJnyO?=
X-MS-Exchange-AntiSpam-MessageData-1: ZBfT6+8EnX2fjQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be3c072-df6a-4626-9f13-08de4fc6f3b1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 21:35:04.4800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/9by4LyYOVvobcv5qphfdUEoS8rXck3MlBaxzmdNbqEEk82et0j0QzOaagwjvgn+H3m8lznyYPglxIEtvLYsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999092
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

On 1/10/26 06:15, Zi Yan wrote:
> On 9 Jan 2026, at 15:03, Matthew Brost wrote:
> 
>> On Fri, Jan 09, 2026 at 02:23:49PM -0500, Zi Yan wrote:
>>> On 9 Jan 2026, at 14:08, Matthew Brost wrote:
>>>
>>>> On Fri, Jan 09, 2026 at 01:53:33PM -0500, Zi Yan wrote:
>>>>> On 9 Jan 2026, at 13:26, Matthew Brost wrote:
>>>>>
>>>>>> On Fri, Jan 09, 2026 at 12:28:22PM -0500, Zi Yan wrote:
>>>>>>> On 9 Jan 2026, at 6:09, Mika Penttilä wrote:
>>>>>>>
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On 1/9/26 10:54, Francois Dugast wrote:
>>>>>>>>
>>>>>>>>> From: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>>
>>>>>>>>> Split device-private and coherent folios into individual pages before
>>>>>>>>> freeing so that any order folio can be formed upon the next use of the
>>>>>>>>> pages.
>>>>>>>>>
>>>>>>>>> Cc: Balbir Singh <balbirs@nvidia.com>
>>>>>>>>> Cc: Alistair Popple <apopple@nvidia.com>
>>>>>>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>>>>>>> Cc: David Hildenbrand <david@kernel.org>
>>>>>>>>> Cc: Oscar Salvador <osalvador@suse.de>
>>>>>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>>>>>>> Cc: linux-mm@kvack.org
>>>>>>>>> Cc: linux-cxl@vger.kernel.org
>>>>>>>>> Cc: linux-kernel@vger.kernel.org
>>>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>>>>>>>>> ---
>>>>>>>>>  mm/memremap.c | 2 ++
>>>>>>>>>  1 file changed, 2 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/mm/memremap.c b/mm/memremap.c
>>>>>>>>> index 63c6ab4fdf08..7289cdd6862f 100644
>>>>>>>>> --- a/mm/memremap.c
>>>>>>>>> +++ b/mm/memremap.c
>>>>>>>>> @@ -453,6 +453,8 @@ void free_zone_device_folio(struct folio *folio)
>>>>>>>>>  	case MEMORY_DEVICE_COHERENT:
>>>>>>>>>  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->folio_free))
>>>>>>>>>  			break;
>>>>>>>>> +
>>>>>>>>> +		folio_split_unref(folio);
>>>>>>>>>  		pgmap->ops->folio_free(folio);
>>>>>>>>>  		percpu_ref_put_many(&folio->pgmap->ref, nr);
>>>>>>>>>  		break;
>>>>>>>>
>>>>>>>> This breaks folio_free implementations like nouveau_dmem_folio_free
>>>>>>>> which checks the folio order and act upon that.
>>>>>>>> Maybe add an order parameter to folio_free or let the driver handle the split?
>>>>>>
>>>>>> 'let the driver handle the split?' - I had consisder this as an option.
>>>>>>
>>>>>>>
>>>>>>> Passing an order parameter might be better to avoid exposing core MM internals
>>>>>>> by asking drivers to undo compound pages.
>>>>>>>
>>>>>>
>>>>>> It looks like Nouveau tracks free folios and free pages—something Xe’s
>>>>>> device memory allocator (DRM Buddy) cannot do. I guess this answers my
>>>>>> earlier question of how Nouveau avoids hitting the same bug as Xe / GPU
>>>>>> SVM with respect to reusing folios. It appears Nouveau prefers not to
>>>>>> split the folio, so I’m leaning toward moving this call into the
>>>>>> driver’s folio_free function.
>>>>>
>>>>> No, that creates asymmetric page handling and is error prone.
>>>>>
>>>>
>>>> I agree it is asymmetric and symmetric is likely better.
>>>>
>>>>> In addition, looking at nouveau’s implementation in
>>>>> nouveau_dmem_page_alloc_locked(), it gets a folio from drm->dmem->free_folios,
>>>>> which is never split, and passes it to zone_device_folio_init(). This
>>>>> is wrong, since if the folio is large, it will go through prep_compound_page()
>>>>> again. The bug has not manifested because there is only order-9 large folios.
>>>>> Once mTHP support is added, how is nouveau going to allocate a order-4 folio
>>>>> from a free order-9 folio? Maintain a per-order free folio list and
>>>>> reimplement a buddy allocator? Nevertheless, nouveau’s implementation
>>>>
>>>> The way Nouveau handles memory allocations here looks wrong to me—it
>>>> should probably use DRM Buddy and convert a block buddy to pages rather
>>>> than tracking a free folio list and free page list. But this is not my
>>>> driver.
>>>>
>>>>> is wrong by calling prep_compound_page() on a folio (already compound page).
>>>>>
>>>>
>>>> I don’t disagree that this implementation is questionable.
>>>>
>>>> So what’s the suggestion here—add folio order to folio_free just to
>>>> accommodate Nouveau’s rather odd memory allocation algorithm? That
>>>> doesn’t seem right to me either.
>>>
>>> Splitting the folio in free_zone_device_folio() and passing folio order
>>> to folio_free() make sense to me, since after the split, the folio passed
>>
>> If this is concensous / direction - I can do this but a tree wide
>> change.
>>
>> I do have another question for everyone here - do we think this spliting
>> implementation should be considered a Fixes so this can go into 6.19?
> 
> IMHO, this should be a fix, since it is wrong to call prep_compound_page()
> on a large folio. IIUC this seems to only affect nouveau now, I will let
> them to decide.
> 

Agreed, free_zone_device_folio() needs to split the folio on put.


>>
>>> to folio_free() contains no order information, but just the used-to-be
>>> head page and the remaining 511 pages are free. How does Intel Xe driver
>>> handle it without knowing folio order?
>>>
>>
>> It’s a bit convoluted, but folio/page->zone_device_data points to a
>> reference-counted object in GPU SVM. When the object’s reference count
>> drops to zero, we callback into the driver layer to release the memory.
>> In Xe, this is a TTM BO that resolves to a DRM Buddy allocation, which
>> is then released. If it’s not clear, our original allocation size
>> determines the granularity at which we free the backing store.
>>
>>> Do we really need the order info in ->folio_free() if the folio is split
>>> in free_zone_device_folio()? free_zone_device_folio() should just call
>>> ->folio_free() 2^order times to free individual page.
>>>
>>
>> No. If it’s a higher-order folio—let’s say a 2MB folio—we have one
>> reference to our GPU SVM object, so we can free the backing in a single
>> ->folio_free call.
>>
>> Now, if that folio gets split at some point into 4KB pages, then we’d
>> have 512 references to this object set up in the ->folio_split calls.
>> We’d then expect 512 ->folio_free() calls. Same case here: if, for
>> whatever reason, we can’t create a 2MB device page during a 2MB
>> migration and need to create 512 4KB pages so we'd have 512 references
>> to our GPU SVM object.
> 

I still don't follow why the folio_order does not capture the order of the folio.
If the folio is split, we should now have 512 split folios for THP

> Thank you for the explanation. Adding folio order to ->folio_free() makes
> sense to me now.
> 


Balbir
