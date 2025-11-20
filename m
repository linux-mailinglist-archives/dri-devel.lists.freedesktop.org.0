Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01605C724AB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 07:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4244910E29A;
	Thu, 20 Nov 2025 06:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WnFoE2W9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011046.outbound.protection.outlook.com [40.107.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C7410E29A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 06:03:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mr/VKpGFWubP0enLme+I8CxKEj4/sZsmwtQl71Cc6PpHMFQJ9bijUsQ5WNu5C08BCbZpBA8yLPLsfmsphnhy9nFHIejrreZ6vQ1Dzmqke0//iAsDuksLuyFZf1oD8/PF7LivsuXTVTChVehAYPc4Vqx8pRVZIfUrw8Zv8XIuRtMkXYxaQKMTlj3nm5f5De1HYmh4dZhZtxq9pO6cV39KsmRXsX+2192+iFukZ8XczSfGepj6pwlZUbAe11RV5MJEy6Gas8BRr6aT2fHB5H+rnN1qAEa8lzsPHkJA+jcHcvbEEGeqwoqw6beqyCiYFb8tPA5lz1PNemqte167pr6b5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gH3zn6kZmlYWIHx3F/+wMkeqssKndlqKc6LhnmQil6Q=;
 b=iv05Y1gjNvrlhUKgM92ktdG6WpN8MmwR0QeToT4eT6WatYwO9k/JKfstxTgQgmh69GrxXILUvUAaVZ8x9dO5dVqN8f58BpdAQpufqG56nmDe2+GOJBn3BN1rWljv5nfhGPODGUfeOKiKZof+ZzKW2n+DCEaByNSBqK8Savz2Zk6cTwTHUWZ856ON6ZQ0Sx99aOr6zioLyZ3m3reRGQNuODZRVE2a1wQ6kv932YSDd5J61Nc87O2MsYyrOuAIJtHZCYA0U825Y39Ulsxe75bGQdyj0IyLcbUnBaaTis2XH2+mLw/C5piBXmBiQZ4o7dkO1sjysF3L4YcLy8MfYBEE/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gH3zn6kZmlYWIHx3F/+wMkeqssKndlqKc6LhnmQil6Q=;
 b=WnFoE2W9OP4NAS903kYGf/6V7zwgAiwWh46jqTK9KRscEJYHbPO5oCe7qWgCdtLDQneyILqJ9kjpeKZ9ahhXRfwT5jxmFXHlfj5KKwLz0zQb0YfYqEXbZ1BmHv7FLFInTKU6FMTQho5e0xMo5sBoy1Cbw9hN3YMQhU3KYMjjuMTm/EFDhaGyaA1Zidl/qGRRl6tWs6516jP+U2D5yhJwlasFqIhPokqVHAVuA9CpkcJaKHg7OclkSXyLw195W0h2vuDeHm2gOiY3bMHNFjy6DY+4OHybdn5txFzLjHSAEenP3Di50BkOU8DfMrTtQ2YtZYO2U5McSvugivd90D9Gjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by MN0PR12MB6248.namprd12.prod.outlook.com (2603:10b6:208:3c0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 06:03:44 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 06:03:44 +0000
Message-ID: <aac2caec-0909-40ef-978e-97fdb34e1937@nvidia.com>
Date: Thu, 20 Nov 2025 17:03:36 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [v7 00/16] mm: support device-private THP
To: Matthew Brost <matthew.brost@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20251008201740.d9507f4807a73058d4da23a8@linux-foundation.org>
 <a5992f11-5841-4bbf-b190-b5df41b68b0c@nvidia.com>
 <aOePfeoDuRW+prFq@lstrano-desk.jf.intel.com>
 <20251111154326.bc48466a6962fbbffd8ebdd0@linux-foundation.org>
 <7a0f2704-80b5-4cbd-8f3b-ac03692eefd3@nvidia.com>
 <aR5/uUFboeeSwN0z@lstrano-desk.jf.intel.com>
 <7ecb3faa-8bc7-4eb1-9342-404a9ff52b97@nvidia.com>
 <24d8d39b-5ebe-4f29-93ff-3f7ca2a9b1cc@nvidia.com>
 <aR6HtvxhmVxUvd+h@lstrano-desk.jf.intel.com>
 <e8efd187-237c-47c7-ab99-33183e0988df@nvidia.com>
 <aR6szF6Ga8K2ZRjR@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <aR6szF6Ga8K2ZRjR@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0230.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::25) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|MN0PR12MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 99144c2c-486d-4859-33fc-08de27fa8fc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|10070799003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXFER3duczYzMnVHNXRjWGg1d3YzcmVQRXVBSXBwNXFiYVR3YmVZRGZIYU03?=
 =?utf-8?B?bDBRS0grYk1zNE5PREZ3OVA0dnlvWGJIb3lBTDZqbC93eEkxUHZQbk1lZjk5?=
 =?utf-8?B?YUt0ZVVtM1VTZzlYMlRnUXJ2SU9iVGQwRTZkNVJCTFN3ekhsZ1g4RnFtb2Ex?=
 =?utf-8?B?bitRa3dlYnJZMzluNGRjMExIb3cyK1VnOHpwSnFZOENFTXBYR3BSMVF2b2xW?=
 =?utf-8?B?Wk1LNWRYU0F5T2tCQzAzQjduZnViN2pveDZiRk9obXQyMEN1SmVybmRCYXRm?=
 =?utf-8?B?WTN0UEtFUUwzT05aeUR6d00yRUd6MUdBd3Q1K1JtWjhTblFJSGdpRUxETFFu?=
 =?utf-8?B?SWpjVGlzNzhsckRFZEJVaGVEaVBqYzhMQzYvaWE3K3NPWWlnQ1JVdzQyRHFH?=
 =?utf-8?B?VnpWbEN5VkNwOGl0OCtqR2J0d2ZjbmpLVjB1OUdUQ3dsY1JFMk1ZQUhBaGhk?=
 =?utf-8?B?NnFLb0thMnc1Rlc0elRlUVJpVUlzb0JxaVUvejByK2VzaDNRcVMzODVNVnVI?=
 =?utf-8?B?M0VGNU1sMW9kRTBabFF2dW1uQW9KMUNNQmZEd2g5TEFJRkJGQ2t4dVZ6SW5o?=
 =?utf-8?B?dnJjV3hkMkREQ0xhOXpybDhaWGVPWU9KZ1dBNDk0SGFZOFZwNUhQUnVXUzhw?=
 =?utf-8?B?NnVDTkh2ODZESTlzKzF4cWdvank2NkxyTVd3eStWNUQwNW9Gb1hrQnZTdXVC?=
 =?utf-8?B?eEVKSk1INWhsamYzOWU2NkNTM2hlQjJMQlJ0RWQrQkJyU1I0WGU5emgvK0Rm?=
 =?utf-8?B?VHJOYTZOMWZmcC9vNW5MdTNmQlFjNlBoYkZVQjZWRTFCUGkvMjhUaERTWTc1?=
 =?utf-8?B?c0Z5NG8vcFhITGhueS9nZVQwTjJNVXpXdlpwWXFXZG5sd1ZWVXBMWFkyTEJp?=
 =?utf-8?B?My9FNkRtdFlZemk4dytCb1RPTTdiSWw3Z3RYMTR6b0NKU3ZyQUJQN0RyWUlx?=
 =?utf-8?B?d0VRK0s0VzZjaHBmd1Ryb0llbVJ3bXFXc0k3U1psUFBWOVdycS9yRENOZExY?=
 =?utf-8?B?eXk2UnFqTjRMQjJkRmdiTENZZ0g1bHVWOEdSWHN6NWNjTWQyNjBPVUtKL1Nm?=
 =?utf-8?B?TmJ1LzVKbHNqV3hJdm5hZ2RSbnlFMlB1QjRMcUx6Q1ZiSGpnTklJQkFjMmNv?=
 =?utf-8?B?UlRBRzg0aFdrWjlsRzV1bndSdXN5RDFqUXF6WlRVZ0haaEdBYmxSVm5JdTJi?=
 =?utf-8?B?bzRHQU9qRks0bmdabWY1cmhIa25zY0l4Z21kai90dnd0YUVPR21XN3M2VTE1?=
 =?utf-8?B?bmhzSmRYNmJjZ0gzanY3L0FLN0tGQzZUbFBTRFNpUWE2NjA5NXpoZ3NuM3Jz?=
 =?utf-8?B?UkhGa3hiQjhXcVBNMy9ORTEvRVFjODMrM2JRQjJJRW9FVStqVTUxOUdVazlv?=
 =?utf-8?B?aXRRRkl3WU9zZ09aUTZ5ZlJ3c2VnbUo0S29tYlpGUk14VFlIVVl0djBRT3hC?=
 =?utf-8?B?QlNkN09WS1huam00dkt3c3ZKOWxGaWJIa0hnTktZTjE4b1hUYUkzeW5YZHVW?=
 =?utf-8?B?ZTlwckNPWjJYWjVuVXA4OUoxeWxoZnNJUGpjS1JSYUM4cnJIRFh1aERTVnJq?=
 =?utf-8?B?R3ZNd3VzNzlKMDNKdDhRcXlheEplc25RcytmOWF0cHY1M1JQOEJLR24xbDZI?=
 =?utf-8?B?SHVnOVRSV2Z3R3hKdHdrSC9HNTBFYUpCUjBTbUp4aWpVNW4zNDBJSXFnZENH?=
 =?utf-8?B?TUc0NTM0MFUzYWZFYWZsM2tYQms2NnBTd2diVDUxa3hFMCtnSlpEL3JKU2tG?=
 =?utf-8?B?NTJGTW41Qnh5MEdjZDVudGdFL2xVaEJobDdYSndXYXp0amkvSzBGTVhSYkcv?=
 =?utf-8?B?aHB0N0xKQUhKR2txUU5Ra3BCRXlnMHRKMnA4VDFWYlRnWU9DWHB0Qy9IcWVN?=
 =?utf-8?B?bmpNOHEvLytjMEs1SGlNRGowZFdwOUgrc2c4cFFHeG4zdGJ0Q0N5eHI5clRr?=
 =?utf-8?Q?Mz41hBncGpLynXDqe/3LybjSiW1sFdGO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(10070799003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDAvNXptU3lGR01lbWRYVE50RWY0eDRpSWU0b2xOaVlONTVqalIwMlJOVTN0?=
 =?utf-8?B?MVpxbGJHVmpJakFqSUVWdkg3RC9lNjFPYXE2RkVneFZJMzRQRlUwNnUvZURY?=
 =?utf-8?B?UFlGVWQxb3l4Z2ttY3drYmtLcytBSEE1Q3RYaElLUm5kYlFvQW4xOEsxUlRE?=
 =?utf-8?B?RUtVVDdXNVpqSm5jR1FPVmo3TVJlOCtBdzRKVlRudTFDU0ZTREs1cjdxSEVo?=
 =?utf-8?B?Vi9RN2YybFdicWxOSzA0VzVVWkxHS2xEaFFPOVR6dFZobkRMTE5uY2NVVW5t?=
 =?utf-8?B?MEo3VWdNcWxicmpVU01XM3ErSC9UT0dwako0cXdjaWhNSVQySnB2ajBRRjds?=
 =?utf-8?B?WStmZXhGZXJCVStYcmFkbVZFc0NFb2Fqb0lOVkxjcUV1d1c5eFV4WkJFdWpq?=
 =?utf-8?B?MDhlczZvQzRROTExL1N6UnN1NDhuTkRWMk42Q21MZHpOMWJhR21LRm5vN0M3?=
 =?utf-8?B?eSs2S0hwUXRXTzNYck9iSDNpK2J2Mmd0ZjRLa0RmY2hXSHQ2czJtSS9NaWRl?=
 =?utf-8?B?dmlCNUdUMDR2cjZObzVrbENGWjRtaWN5aWllOE5SNHQzd0tXZUVnR3pVZXZO?=
 =?utf-8?B?WmloNkNRK3R0em1jb0NPYTlCZkk0aHR4MzZKajF2UHF0MEpwb3Jub2MvK1Vp?=
 =?utf-8?B?RmVmWW9KbXhOOFJsRU9Mbk5qejNnR2oxcUpIVkJkZndNM0Rnb3Z3amo0OGRF?=
 =?utf-8?B?a05WSVZwVnRhNFNMdGhHdlVaaWY4L3pjbkxNWm5JMjNVOUtLUGJ4NWdmZnRv?=
 =?utf-8?B?VFFOUTQ0TGtiVTRnK0wrOEZZdEVxbHJNSVU4b1pOUWF3RFlmSEdKb1dXekpE?=
 =?utf-8?B?My83dldja1Y3M2NKY1dvbG1MVTU2eC9mdmRhTkdla1hleTlZYmFxNmJvY09X?=
 =?utf-8?B?OEw0Yk1qY055eFRIamcxUGNhS3IrVm9vSklEazBUYVlzK1pVRFJaYTc5cnMx?=
 =?utf-8?B?RkFWM3N5R3VmdmE3a1U4b0NldTNYUDYzQUtqeHlZbzZlWkx2Y3RJbFUvLzl2?=
 =?utf-8?B?RE10OWJXaWhxZU82V0FRN2Y1UllBVGptUmZRRHhpSlhEM25EQ2I0OXZZSlZ0?=
 =?utf-8?B?WW13TGZyY09XMWFSN2Rua3h1a0lZWjlkaWJia05TS3o3My93bE9sencxY3BO?=
 =?utf-8?B?dDVCNHl2RTVmSGdnOG9IbUY3NDc5N25Ka3NIY0VVQytUK2VveS84d2RYemZI?=
 =?utf-8?B?NHBwbktmaVhiTmdzeEhlS05QTENycVBJMFVnS1dMZ21tcUFjc0NMZ3QySzV3?=
 =?utf-8?B?YnBIRy81d25UYi9tVWV3T1RIUUhKRXVOcVhaa0l1NFNFL1R1dmhDcHdKWVEv?=
 =?utf-8?B?SkpoQmYwek1MWDZhNitIVTZ6Zis2OTR2Y2loY25UOFV3NUtRd2wrSi9MQWZG?=
 =?utf-8?B?MDVpMmRIdktqRVlHR1p2TUFlaThWT3JTOGV3QmNJRjRLU0JmbjlLRVBTdEp2?=
 =?utf-8?B?ekxzZmRpekREMXNwVk9ySWFQa0g1b05aSjhYeWNIT0Y1Tmd6ZzZUaTBORTJR?=
 =?utf-8?B?U0g4OXR2UGlHeXNzSHFtTVRPVXJuTGs0Szk5UVNiSVJVUDA2clcyZjBlalNy?=
 =?utf-8?B?bnNUWENCdVIvQVV0WUVjZ2Q3LzNmWDR3VktkY0ZGZ0h6bHdZK3ZRdTI3TzF1?=
 =?utf-8?B?V21BNTJ4alJlWTR4UWtaSFlQMjNnMkxlY0xPQ0NIcFZGUWQ5eEkzakJkSXo5?=
 =?utf-8?B?ZTIvVmZpUXR6aTZVKzZHc0dyN0ZmOUc1NWJITDkzRXprNExvQVZzR2tXZmxB?=
 =?utf-8?B?THJ6dlNGelY4bCtNSHJaeWlWcXZZSzFoR1lvcyswaXAvYzlDTEVxNld2NE9Q?=
 =?utf-8?B?TzYrbDN4ZXAycENNTklYK3RHL1hOTkpKU1ZCVkNoNEdId0haNW9scnZPc3pa?=
 =?utf-8?B?dUJ2ZWZmaVBqRXk1R2FZTkNyUTdEQjgybmJXSDBXYTlXa0MzNkhtNytTZ3Jo?=
 =?utf-8?B?R2xOaXQ5T09iMDYzZ1B6RlBEMnBjb2lVU20xdFBGVkdubHhzRFZObmRCc21J?=
 =?utf-8?B?c0dwWG0zQ0oxYTNxd1FKc0o5TXU1ZTRKeDdkbGZXYjJHam9tcVgyd1JMakdH?=
 =?utf-8?B?L3BPa3hlc2tmUTZwR3dVL1NIcVRkM2hrY09CVERSM0RzVWEvalZFUzJ5c1ZB?=
 =?utf-8?B?dkxDUndpblNFV2U1bWxtbWFtbVdpZHB3YXIwaE9pRTdERVJsNHJOMmVIeEZK?=
 =?utf-8?Q?DJYNrxPhhja/niDeA/ZGdjS/XLiwgMri4n1m7hZyJkSd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99144c2c-486d-4859-33fc-08de27fa8fc3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 06:03:44.1595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51ITyF8dpRDKFUNzsKg6rCXFqthEh+k8PkrfyeHJW49WYmBNrK5U7oFAxjFGg50ms9HG6Og+Su1RKmlo+Il4HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6248
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

On 11/20/25 16:53, Matthew Brost wrote:
> On Thu, Nov 20, 2025 at 02:58:58PM +1100, Balbir Singh wrote:
>> On 11/20/25 14:15, Matthew Brost wrote:
>>> On Thu, Nov 20, 2025 at 01:59:09PM +1100, Balbir Singh wrote:
>>>> On 11/20/25 13:50, Balbir Singh wrote:
>>>>> On 11/20/25 13:40, Matthew Brost wrote:
>>>>>> On Wed, Nov 12, 2025 at 10:52:43AM +1100, Balbir Singh wrote:
>>>>>>> On 11/12/25 10:43, Andrew Morton wrote:
>>>>>>>> On Thu, 9 Oct 2025 03:33:33 -0700 Matthew Brost <matthew.brost@intel.com> wrote:
>>>>>>>>
>>>>>>>>>>>> This patch series introduces support for Transparent Huge Page
>>>>>>>>>>>> (THP) migration in zone device-private memory. The implementation enables
>>>>>>>>>>>> efficient migration of large folios between system memory and
>>>>>>>>>>>> device-private memory
>>>>>>>>>>>
>>>>>>>>>>> Lots of chatter for the v6 series, but none for v7.  I hope that's a
>>>>>>>>>>> good sign.
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> I hope so too, I've tried to address the comments in v6.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Circling back to this series, we will itegrate and test this version.
>>>>>>>>
>>>>>>>> How'd it go?
>>>>>>>>
>>>>>>
>>>>>> My apologies for the delay—I got distracted by other tasks in Xe (my
>>>>>> driver) and was out for a bit. Unfortunately, this series breaks
>>>>>> something in the existing core MM code for the Xe SVM implementation. I
>>>>>> have an extensive test case that hammers on SVM, which fully passes
>>>>>> prior to applying this series, but fails randomly with the series
>>>>>> applied (to drm-tip-rc6) due to the below kernel lockup.
>>>>>>
>>>>>> I've tried to trace where the migration PTE gets installed but not
>>>>>> removed or isolate a test case which causes this failure but no luck so
>>>>>> far. I'll keep digging as I have time.
>>>>>>
>>>>>> Beyond that, if I enable Xe SVM + THP, it seems to mostly work (though
>>>>>> the same issue as above eventually occurs), but I do need two additional
>>>>>> core MM patches—one is new code required for Xe, and the other could be
>>>>>> considered a bug fix. Those patches can included when Xe merges SVM THP
>>>>>> support but we need at least not break Xe SVM before this series merges.
>>>>>>
>>>>>> Stack trace:
>>>>>>
>>>>>> INFO: task kworker/u65:2:1642 blocked for more than 30
>>>>>> seconds.
>>>>>> [  212.624286]       Tainted: G S      W           6.18.0-rc6-xe+ #1719
>>>>>> [  212.630561] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
>>>>>> disables this message.
>>>>>> [  212.638285] task:kworker/u65:2   state:D stack:0     pid:1642
>>>>>> tgid:1642  ppid:2      task_flags:0x4208060 flags:0x00080000
>>>>>> [  212.638288] Workqueue: xe_page_fault_work_queue
>>>>>> xe_pagefault_queue_work [xe]
>>>>>> [  212.638323] Call Trace:
>>>>>> [  212.638324]  <TASK>
>>>>>> [  212.638325]  __schedule+0x4b0/0x990
>>>>>> [  212.638330]  schedule+0x22/0xd0
>>>>>> [  212.638331]  io_schedule+0x41/0x60
>>>>>> [  212.638333]  migration_entry_wait_on_locked+0x1d8/0x2d0
>>>>>> [  212.638336]  ? __pfx_wake_page_function+0x10/0x10
>>>>>> [  212.638339]  migration_entry_wait+0xd2/0xe0
>>>>>> [  212.638341]  hmm_vma_walk_pmd+0x7c9/0x8d0
>>>>>> [  212.638343]  walk_pgd_range+0x51d/0xa40
>>>>>> [  212.638345]  __walk_page_range+0x75/0x1e0
>>>>>> [  212.638347]  walk_page_range_mm+0x138/0x1f0
>>>>>> [  212.638349]  hmm_range_fault+0x59/0xa0
>>>>>> [  212.638351]  drm_gpusvm_get_pages+0x194/0x7b0 [drm_gpusvm_helper]
>>>>>> [  212.638354]  drm_gpusvm_range_get_pages+0x2d/0x40 [drm_gpusvm_helper]
>>>>>> [  212.638355]  __xe_svm_handle_pagefault+0x259/0x900 [xe]
>>>>>> [  212.638375]  ? update_load_avg+0x7f/0x6c0
>>>>>> [  212.638377]  ? update_curr+0x13d/0x170
>>>>>> [  212.638379]  xe_svm_handle_pagefault+0x37/0x90 [xe]
>>>>>> [  212.638396]  xe_pagefault_queue_work+0x2da/0x3c0 [xe]
>>>>>> [  212.638420]  process_one_work+0x16e/0x2e0
>>>>>> [  212.638422]  worker_thread+0x284/0x410
>>>>>> [  212.638423]  ? __pfx_worker_thread+0x10/0x10
>>>>>> [  212.638425]  kthread+0xec/0x210
>>>>>> [  212.638427]  ? __pfx_kthread+0x10/0x10
>>>>>> [  212.638428]  ? __pfx_kthread+0x10/0x10
>>>>>> [  212.638430]  ret_from_fork+0xbd/0x100
>>>>>> [  212.638433]  ? __pfx_kthread+0x10/0x10
>>>>>> [  212.638434]  ret_from_fork_asm+0x1a/0x30
>>>>>> [  212.638436]  </TASK>
>>>>>>
>>>>>
>>>>> Hi, Matt
>>>>>
>>>>> Thanks for the report, two questions
>>>>>
>>>>> 1. Are you using mm/mm-unstable, we've got some fixes in there (including fixes to remove_migration_pmd())
>>>
>>> remove_migration_pmd - This is a PTE migration entry.
>>>
>>
>> I don't have your symbols, I thought we were hitting, the following condition in the walk
>>
>> 	if (thp_migration_supported() && pmd_is_migration_entry(pmd)) {
>>
>> But sounds like you are not, PMD/THP has not been enabled in this case
>>
> 
> No, migration_entry_wait rather than pmd_migration_entry_wait.
> 
>>
>>>>>    - Generally a left behind migration entry is a symptom of a failed migration that did not clean up
>>>>>      after itself.
>>>
>>> I'm on drm-tip as I generally need the latest version of my driver
>>> because of the speed we move at.
>>>
>>> Yes, I agree it looks like somehow a migration PTE is not getting
>>> properly removed.
>>>
>>> I'm happy to cherry pick any patches that you think might be helpful
>>> into my tree.
>>>
>>
>> Could you try the mm/mm-new tree with the current xe driver?
>>
> 
> Unfortunately, this is a tough one. We land a lot of patches in Xe/DRM,
> so bringing the driver up to date with an MM branch is difficult, and
> I’m not an expert at merging branches. It would be nice if, in the DRM
> flow, we could merge patches from outside our subsystem into a
> bleeding-edge kernel for the things we typically care about—but we’d
> need a maintainer to sign up for that.
> 
>> In general, w.r.t failure, I would check for the following
>>
>> 1. Are the dst_pfns in migrate_vma_pages() setup correctly by the device driver?
>> 2. Any failures in folio_migrate_mapping()?
>> 3. In migrate_vma_finalize() check to see if remove_migration_ptes() failed
>>
>> If (3) fails that will explain the left over migration entries
>>
> 
> Good tips, but think I got it via biscet.
> 
> Offending patch is:
> 
> 'mm/migrate_device: handle partially mapped folios during collection'
> 
> The failing test case involves some remap-related issue. It’s a
> parameterized test, so I honestly couldn’t tell you exactly what it’s
> doing beyond the fact that it seems nonsensical but stresses remap. I
> thought commit '66d81853fa3d selftests/mm/hmm-tests: partial unmap,
> mremap and anon_write tests' would catch this, but it looks like I need
> to make the remap HMM test cases a bit more robust—similar to my
> driver-side tests. I can take an action item to follow up on this.
> 
> Good news, I can tell you how to fix this...
> 
> In 'mm/migrate_device: handle partially mapped folios during collection': 
> 
> 109 +#if 0
> 110 +                       folio = page ? page_folio(page) : NULL;
> 111 +                       if (folio && folio_test_large(folio)) {
> 112 +                               int ret;
> 113 +
> 114 +                               pte_unmap_unlock(ptep, ptl);
> 115 +                               ret = migrate_vma_split_folio(folio,
> 116 +								  migrate->fault_page);
> 117 +
> 118 +                               if (ret) {
> 119 +                                       ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
> 120 +                                       goto next;
> 121 +                               }
> 122 +
> 123 +                               addr = start;
> 124 +                               goto again;
> 125 +                       }
> 126 +#endif
> 
> You can probably just delete this and use my patch below, but if you
> want to try fixing it with a quick look: if migrate_vma_split_folio
> fails, you probably need to collect a hole. On success, you likely want
> to continue executing the remainder of the loop. I can try playing with
> this tomorrow, but it’s late here.
> 
> I had privately sent you a version of this patch as a fix for Xe, and
> this one seems to work:
> 
> [PATCH] mm/migrate: Split THP found in middle of PMD during page collection
> 
> The migrate layer is not coded to handle a THP found in the middle of a
> PMD. This can occur if a user manipulates mappings with mremap(). If a
> THP is found mid-PMD during page collection, split it.
> 
> Cc: Balbir Singh <balbirs@nvidia.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  mm/migrate_device.c | 37 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index abd9f6850db6..9ffc025bad50 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -65,6 +65,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>         struct vm_area_struct *vma = walk->vma;
>         struct mm_struct *mm = vma->vm_mm;
>         unsigned long addr = start, unmapped = 0;
> +       struct folio *split_folio = NULL;
>         spinlock_t *ptl;
>         pte_t *ptep;
> 
> @@ -107,10 +108,11 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>                 }
>         }
> 
> -       ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
> +       ptep = pte_offset_map_lock(mm, pmdp, start, &ptl);
>         if (!ptep)
>                 goto again;
>         arch_enter_lazy_mmu_mode();
> +       ptep += (addr - start) / PAGE_SIZE;
> 
>         for (; addr < end; addr += PAGE_SIZE, ptep++) {
>                 struct dev_pagemap *pgmap;
> @@ -209,6 +211,11 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>                         bool anon_exclusive;
>                         pte_t swp_pte;
> 
> +                       if (folio_order(folio)) {
> +                               split_folio = folio;
> +                               goto split;
> +                       }
> +
>                         flush_cache_page(vma, addr, pte_pfn(pte));
>                         anon_exclusive = folio_test_anon(folio) &&
>                                           PageAnonExclusive(page);
> @@ -287,8 +294,34 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>         if (unmapped)
>                 flush_tlb_range(walk->vma, start, end);
> 
> +split:
>         arch_leave_lazy_mmu_mode();
> -       pte_unmap_unlock(ptep - 1, ptl);
> +       pte_unmap_unlock(ptep - 1 + !!split_folio, ptl);
> +
> +       /*
> +        * XXX: No clean way to support higher-order folios that don't match PMD
> +        * boundaries for now — split them instead. Once mTHP support lands, add
> +        * proper support for this case.
> +        *
> +        * The test, which exposed this as problematic, remapped (memremap) a
> +        * large folio to an unaligned address, resulting in the folio being
> +        * found in the middle of the PTEs. The requested number of pages was
> +        * less than the folio size. Likely to be handled gracefully by upper
> +        * layers eventually, but not yet.
> +        */
> +       if (split_folio) {
> +               int ret;
> +
> +               ret = split_folio(split_folio);
> +               if (fault_folio != split_folio)
> +                       folio_unlock(split_folio);
> +               folio_put(split_folio);
> +               if (ret)
> +                       return migrate_vma_collect_skip(addr, end, walk);
> +
> +               split_folio = NULL;
> +               goto again;
> +       }
> 
>         return 0;
>  }
> 
> If I apply the #if 0 change along with my patch above (plus one core
> MM patch needed for Xe that adds a support function), Xe SVM fully
> passes our test cases with both THP enabled and disabled.
> 
Excellent work! Since you found this, do you mind sending the fix to Andrew as a fixup
to the original patch. Since I don't have the test case, I have no way of validating the
change or any change on top of it would continue to work

FYI: The original code does something similar, I might be missing the 
migrate_vma_collect_skip() bits.

Thanks!
Balbir


