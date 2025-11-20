Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3ED7C71E44
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 03:51:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E7A10E131;
	Thu, 20 Nov 2025 02:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mgbTYwRh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011036.outbound.protection.outlook.com [52.101.52.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2FE210E131
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 02:50:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eg9pxYbHeU6Mje5m395U41tZzpIZ4aa2vCmnrSOZwT0ATCG2c5q/AJxx1DPJ5P4kyM5gJM6efMiUI7B9B7ir68caugZS4eI4vZwl/y0qvSG6XRQ7/YPxxEs9zMC9k7wKFFjaLJ5SFIjyNAaViwfRDk0LjGsfqs+lrKQDC7bfzykI0Dt+AOQpjwRopRdLQfWxNYrvbh8DiXPmPmhIdxi9C3qEkUbOU/VsLMrU0i56Vnvxi5whgll0CKshnx9AkCd4eJGhs/5fd5EU50UB4XEstDmiWEkdlsjUPGOCQZiYsoV2l7qfoF9iZ9ttelwtKYEalxRHlnndpM49juBhmvI1ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NYmFLIwT/CMiogSg3ztU6g+N8xNixgU5RfO45fAGCM=;
 b=JZK1EJUo4GS7yxcKwZfJGbAKFBIeMLk6ncDPQOJ68NC2kf82aDBhRNhPUs8rIAWGC6WdzZYjwzxkIRNgYePV4jvknCQgJhtJfKjvgP+iBr6dZ1Jjgr6DSH9YLvbMEK0ihXZubqW8q1FijpAJzt5Ds2CY100owkO9786I8YDxHsvktoQBUk+FLJn9elKScAw8IRorsqpj2fyLIJnqO8TsSCvRQ1vzPCBcC7WkO7XrRf20oiRcCPqKg6tD/U6o56AiM3ald6jI3H8KCQxrmujQ1xNdTVhJaZFJeicZRfZC8XKr1aVRlgE814luvnzbdjYBNjp1g4OhWa+nx5Fhge/7Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NYmFLIwT/CMiogSg3ztU6g+N8xNixgU5RfO45fAGCM=;
 b=mgbTYwRhNOcQmu9yM3k2sRMAkZkDbWotDerqw4kdvBhgD+SnDTSD3ewdUlyfEhk1MFEhGFOVmihQoygTx1iMmtB4UxrgrIHpDMEvaHdGr5VYqMSjq5iVZ6B+sLOf+qcREpi4AaoVdlvINmQxoqcCUvFg8CG44AicTsKHLfeT73vX/G1CxY8h1q+ektheg9enhAk+8hhbRe1eiUz81CBFowTp3NLnu2E2TyRh6jBazy0vc8/SWRUMrBs4Uo5MYrm5e24xa3vubq8CNO7p74WgDxo7193Z7r+gg3XMMCkQKEuggVP1VDFCZIr1UkJ4VCnqKjsQ0FuKJxdnw+o/zH2zcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SA0PR12MB4352.namprd12.prod.outlook.com (2603:10b6:806:9c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 02:50:52 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9320.021; Thu, 20 Nov 2025
 02:50:51 +0000
Message-ID: <7ecb3faa-8bc7-4eb1-9342-404a9ff52b97@nvidia.com>
Date: Thu, 20 Nov 2025 13:50:43 +1100
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
References: <20251001065707.920170-1-balbirs@nvidia.com>
 <20251008201740.d9507f4807a73058d4da23a8@linux-foundation.org>
 <a5992f11-5841-4bbf-b190-b5df41b68b0c@nvidia.com>
 <aOePfeoDuRW+prFq@lstrano-desk.jf.intel.com>
 <20251111154326.bc48466a6962fbbffd8ebdd0@linux-foundation.org>
 <7a0f2704-80b5-4cbd-8f3b-ac03692eefd3@nvidia.com>
 <aR5/uUFboeeSwN0z@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <aR5/uUFboeeSwN0z@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:254::18) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SA0PR12MB4352:EE_
X-MS-Office365-Filtering-Correlation-Id: 28aaccfe-38f1-4972-b65f-08de27df9e18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0RhQnpIWWx6VVFNTDkrcTFnYjZ2Mm53Rzg3d1VpU0tHNjlOcW5ZVTYxd1Qv?=
 =?utf-8?B?UGJRZ1RjZStDbTFsMVVWNHQvL3lMWlMvWkJZVmFYSEJRbEdLZDZXaG0rRDd2?=
 =?utf-8?B?alJUM2NMVnpOS2diL3JJZ21IWGNTN2ZsTVlIYlJMWFBiVGhmWUQ3OWNWTVBv?=
 =?utf-8?B?amZtYXlLTnhCZk42VjlUeWVYTFBncjhUenkxMXIzSGtxZll4aG9tMzdFUkI0?=
 =?utf-8?B?ekNETXoxVElSb0NVdXRTQVZiOS9GWnJhRVA3QjdPWWRUWXF5SFFFMFJsVExv?=
 =?utf-8?B?dk1CSFpjUi82L2FrSWVQVmF0UmJrbUZDRCtyQUtPY3NxRG5QclZoV2Qrd1h1?=
 =?utf-8?B?UnBjNUNPekJUTDRkZkNnWjdZWkt5QThlUE5YdDZWTHltRlV0ZnNXZDZMMXZj?=
 =?utf-8?B?bFlQMFIzYk43TkVCV2VFWjNhUHNWM3pYMiswNFdYT3VqcUhLVFF1dWVuSzVa?=
 =?utf-8?B?UXlpTTAyU1JmWk9tU2RISkVkK2xycENPQkFCd0I5YkcrQVh5Sm53S1R6bzRS?=
 =?utf-8?B?OFhrQ3VBbmpLdFhLU1lGZlpSMjBVNXFteElQZklvNWUwTWZkWWVBbC9Ld1RB?=
 =?utf-8?B?bDNWYzg0U1YyTGR2YXFGdnlSZHA2YXY0SUpYekF2QmllOWF6UTFaemVzWFdj?=
 =?utf-8?B?THNYbzlJbk4zaFFJcUovOE0wV0wvc0RGUXJKNlprTXF1OGVQSmkyS0RDOVBp?=
 =?utf-8?B?L2tOcy9nOHhCNXRRZzlIU2h5NmR0bzMyNG9TTkdFMlhZbmdRQWxJaEdqRFFw?=
 =?utf-8?B?dFkrT1UzdElzVVErc1luZUh1ajdxMm1Nc0RJWGptMytiMGRnZXgrOTZUTDdK?=
 =?utf-8?B?RG1hbGtmZ1I5OHVoR3A2RFg5RzFyUkNJZHRxYTZhWENOYm0wd0dhYVZXQ1JV?=
 =?utf-8?B?YjUrSU5XM3NGOTNWdTRJeTZwNGwzT05hM1JNbDg5ZVI2OTZWb2lyUDVhQ0gx?=
 =?utf-8?B?S3FmZ1FheUVyMFBqL3lVa0hZbWpTVE0zOVVPeEd4RHUybU1hR0c1ZjcweUtk?=
 =?utf-8?B?NlFSZzdIN1o4a0lRV0l1c1l5bkdvdENZR1lPcGdDQUl0dlBzbGkxdkN3cGFj?=
 =?utf-8?B?cHdkTDVTUkNMbHBaVkxsaWYyUGQrNnZZZHNNeXM2WUw4V3c5cnBsandLcHhy?=
 =?utf-8?B?ZjFlU3IxZ0hnRmpTaXh2WlExa3RTWC9zYmZ1SU40ODhjejhLL1pleGIwMFRD?=
 =?utf-8?B?SEtTa2c5T1dxRDF2dTRyQkpaUUUwTUxCNWFHckZpeUVVcU4rV1Ewb1hjQVV6?=
 =?utf-8?B?NFBnSWhWU3hXc2Job1NmZmJxQ2hFS2tzZjVuWGtiNEJzSDA3TkJFbWtLZmc0?=
 =?utf-8?B?a1JtUUFDbHJsZFBSakx0ZkNTOTd4Y3EzTXNiRVVrbG1DYk1Ycjg4QmdoTjJO?=
 =?utf-8?B?Z2JIdFlWdGd5eDJDTWNXa00rTVNJNFFNY3YxTnNSVHJUV1cyWituc1pJby8z?=
 =?utf-8?B?TTRXOEdxU29qZ1Awd3F5NHlYT2Mrb2tKcnhyQkFDVGRqQkJLRUx6VHhPbDdq?=
 =?utf-8?B?aTl1aDlPZTROaUdZd2NPS3RMZ25TZjFBRGpxMEl5UjJVRmJCUEZma2lWc3Q1?=
 =?utf-8?B?eG1SOXdSVUhsNm8rVjYzYkwrSmYrdDk4UlZtc2pDOCtOTUEzYlBOUlhFZ0sw?=
 =?utf-8?B?UDMyeVlaRlV4SHIvdWZHTVNNdXNOdzdXQWJtcTlvZEdOeTBaeVNJREVLOU5N?=
 =?utf-8?B?NUcxM0tYOGZkazQvWDJzeWQ5OGNEa2Y5VCtTUGdnRVJHQjJoY0RSS3piYlEw?=
 =?utf-8?B?ODBldlcxbjZtWms2cjFhS0RSV2JvQWhERFh0UkxWS1NqZmd0WFRxRHIzSzh1?=
 =?utf-8?B?d0tINjZ3R280eEpjZXR1c3I5RVZoOHVRemhQdHVEc0xwTTRtdWprQUpiWTBD?=
 =?utf-8?B?VXBTMXJHTndOSExUSk5UTFBFV2Mzd3VFaG1wV0tqNE40TTAyWGJrTTUzL0U4?=
 =?utf-8?Q?vBKonHsomrmHHVwGxFM1qGKJz761Y3kj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGdZeWs1ZGY2OExCOHl4S1lEZWtRTnFUQzNTZ0E3REYzUlVyK05FRlRETmJv?=
 =?utf-8?B?Z1VYMTNXRkVpL0FmUWk4a0N4aU90ZzVlMG96dWZXWUN2aDUyYWNKNlpZdWdu?=
 =?utf-8?B?OFpjdVgyaXdBTC9PVmpoTWJFQUZjRXhRc0lVbTdjZ2VHb0R4UnFsT014dnNF?=
 =?utf-8?B?Z0JnQmwvekRNWk8vbjJpdTN6Q1lGTWw2dEpiQTVaMmZmNkZ5V3ZqaEVRSTJx?=
 =?utf-8?B?WlFMK0NrRXZhZkRheTZ5dmVicHd0K1B2eGlUSXpJTXNhWUxXUDVOSlhpdkFx?=
 =?utf-8?B?S3NUekhsZDU1b09RTktSdHpQanlDMTY2bHFYNmhUaTVWMkhZMFZ2NjlCd2lJ?=
 =?utf-8?B?K2RkdlJhYlVnRXk0L3N1VkRWQytmaUh5YUhrQ0lmSlhnVE1DcFB3QTRwT2Nn?=
 =?utf-8?B?RGEvWWtzREhYVGtmeDlRN0RkekxLbTJvajU1WWhrRmRlSk5uL0h2bWVzSy9v?=
 =?utf-8?B?RGkrU2RiTE1kWUdoazcwdDZQTG5TWk1jUGsvVk9uNzFDUHAzaGoyNVZ2Y1dr?=
 =?utf-8?B?dDQwVzFFZzI2N3BXL3REcWU5RENJOE93Q1QwcVBnYXZKSXlPeFA4TGFFSzhq?=
 =?utf-8?B?YW5Ga1FYM3c5VExUbEpEWHpjNVgxR3YrdHkwZmhjK2FHeDdaZityYXVkNVYz?=
 =?utf-8?B?MkJNTkt5MitLa3RhOTU0Wm4rUjJaeHIvRTZtcGZoL1p4ckZJVWVVMDJHM0lG?=
 =?utf-8?B?TjhKZG9zekYrTTVPa2RBWnRjWE1ubUJYcG1iYVg4M0FnWkN1STdDUStWWFh5?=
 =?utf-8?B?TTdkNmYwbE04ZTJyMCtmS01RaTJ6ckdtYkhkbUU3UzcrWWEzUnpEMXVPbWJ2?=
 =?utf-8?B?ZFgrNk9adFo4RW5vRlBPZjNybFdVNmlkQnhMWEJsRENvaWU5SHlialQvUmtz?=
 =?utf-8?B?Ym1URTRCa1Jid0IvUDE4cnl3YXhuUFpickUyOVNNK3JqUVVaSHp0Njk0czJC?=
 =?utf-8?B?QWJkNzUvc2R0dTVWNGdVNkpHd1dvUUZBYm9yc3V1YWFGcU9ISnBPYU5Zamow?=
 =?utf-8?B?QmxkcEhiTnZJMStDS2xqM2U2b1RSOGcrdm5pQXZoM2Iwam1YMFF2aUh4d0xI?=
 =?utf-8?B?Tzc4N1NoNUE0U3hOc0dsMVRsNE1xa2ZmZXlLaGowYThJd0JkVXhFVys2Ymdm?=
 =?utf-8?B?MExtY3RxSXpwa3VlY1hNM28wa0lYTXQ1ejU0UTFiR3doUTV4eDUrSjZIVHUy?=
 =?utf-8?B?L3JZZ1M1SmZrNE9xN1UyUkRvS1k5REtkZi9sdnVmR2czL1JHV09INE1VTGhP?=
 =?utf-8?B?SmhjVXk1SGxUUnlBSUdSbGRFbXJvd0VsSmJwb1lwRU1GWFgxa0pndmp0ek1N?=
 =?utf-8?B?UTV4UEtIR1l1cXkyUmd0Rkd3ZFBKMU9kQ3MzQnJYazlqVStiS1BtMkxVdXR3?=
 =?utf-8?B?SytlYU1ZdjJ4T3dUTml0d3pGNnRFR2lZTGgzOFlWeVdUMjVuSG5JQXFBQ0d5?=
 =?utf-8?B?Ry9YTmk4VmFJWXhyM2NQRUhnalQrQkdJMHdrTDkxV0J5VXR4Mjg4aU9xLzZC?=
 =?utf-8?B?Szhma2EyR2o3ZmllOTQ4cFBLdll4UkRDbHloZ3MzdEFyZFRXZVR6UDhsTjYz?=
 =?utf-8?B?K1EzTyszYkhCbWtxL3VIRHBWayt5Smt0RThTQW1Sb0dvTC9FcEdQejRNSTF5?=
 =?utf-8?B?ZG9tbVpsa21Ucko2S2FtWEo2UGdCNHBPY1RtU2ZHSUtQNGhIa2xxVEtzN2Zt?=
 =?utf-8?B?Z3F5WTZJWVllV0Q5bmgxVGhZOG5oc1EvWnFhSGVMT2hBWXZxY3R1NS8vMjNx?=
 =?utf-8?B?aWUrZ3FmaTdFVVhTMEVFUUxFWERXdC9wV3BlVDVUaXUrTEVnYmtPZGFVODZW?=
 =?utf-8?B?M09GSHRydThDSFlZbytBdDlIRjNEOTlHL0ZUc3czR0w0blVkTmsrZmsraFlu?=
 =?utf-8?B?MHNTTkJXWjhmU1UzbGdlMFpTTEFINnRWeUtLdWgxendsTW0xamlUc2RiL1hZ?=
 =?utf-8?B?MVFQRjVvVWtneVFoWFU5dkV4Y3BpazBLN1dCWFk4WkFUMmhhcXAyWG5HSE8w?=
 =?utf-8?B?ZVBBaFprTHJqcEc5V1pDb2EwODV0eXBKeHRZcXI2SmIvdlRMdVFhd09qVmJv?=
 =?utf-8?B?YzRERGxxQlh1M1ZUNk15WDdEN0xWdkFNYkVHYjJVQkxweGRHd3VVbXFjMXZu?=
 =?utf-8?B?QXBNYUpYa2ozS1UyK0wyVHhoUkhvbUN1bTJKMU1nZ3NmUERrN0FsT1pBNkkx?=
 =?utf-8?Q?BJWcKtRk7IIlXXKbgX/bCBNxC5rvAsQVfsaC61THP28o?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28aaccfe-38f1-4972-b65f-08de27df9e18
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 02:50:51.7959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ytJHATZnL7Fhnkv16up/CTmKHYSCcTHUdS4ahMyW+7IUy0jOBnLZSj5Whix1YSnwwjp6q2HStSlkgrkptA+M3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4352
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

On 11/20/25 13:40, Matthew Brost wrote:
> On Wed, Nov 12, 2025 at 10:52:43AM +1100, Balbir Singh wrote:
>> On 11/12/25 10:43, Andrew Morton wrote:
>>> On Thu, 9 Oct 2025 03:33:33 -0700 Matthew Brost <matthew.brost@intel.com> wrote:
>>>
>>>>>>> This patch series introduces support for Transparent Huge Page
>>>>>>> (THP) migration in zone device-private memory. The implementation enables
>>>>>>> efficient migration of large folios between system memory and
>>>>>>> device-private memory
>>>>>>
>>>>>> Lots of chatter for the v6 series, but none for v7.  I hope that's a
>>>>>> good sign.
>>>>>>
>>>>>
>>>>> I hope so too, I've tried to address the comments in v6.
>>>>>
>>>>
>>>> Circling back to this series, we will itegrate and test this version.
>>>
>>> How'd it go?
>>>
> 
> My apologies for the delay—I got distracted by other tasks in Xe (my
> driver) and was out for a bit. Unfortunately, this series breaks
> something in the existing core MM code for the Xe SVM implementation. I
> have an extensive test case that hammers on SVM, which fully passes
> prior to applying this series, but fails randomly with the series
> applied (to drm-tip-rc6) due to the below kernel lockup.
> 
> I've tried to trace where the migration PTE gets installed but not
> removed or isolate a test case which causes this failure but no luck so
> far. I'll keep digging as I have time.
> 
> Beyond that, if I enable Xe SVM + THP, it seems to mostly work (though
> the same issue as above eventually occurs), but I do need two additional
> core MM patches—one is new code required for Xe, and the other could be
> considered a bug fix. Those patches can included when Xe merges SVM THP
> support but we need at least not break Xe SVM before this series merges.
> 
> Stack trace:
> 
> INFO: task kworker/u65:2:1642 blocked for more than 30
> seconds.
> [  212.624286]       Tainted: G S      W           6.18.0-rc6-xe+ #1719
> [  212.630561] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> disables this message.
> [  212.638285] task:kworker/u65:2   state:D stack:0     pid:1642
> tgid:1642  ppid:2      task_flags:0x4208060 flags:0x00080000
> [  212.638288] Workqueue: xe_page_fault_work_queue
> xe_pagefault_queue_work [xe]
> [  212.638323] Call Trace:
> [  212.638324]  <TASK>
> [  212.638325]  __schedule+0x4b0/0x990
> [  212.638330]  schedule+0x22/0xd0
> [  212.638331]  io_schedule+0x41/0x60
> [  212.638333]  migration_entry_wait_on_locked+0x1d8/0x2d0
> [  212.638336]  ? __pfx_wake_page_function+0x10/0x10
> [  212.638339]  migration_entry_wait+0xd2/0xe0
> [  212.638341]  hmm_vma_walk_pmd+0x7c9/0x8d0
> [  212.638343]  walk_pgd_range+0x51d/0xa40
> [  212.638345]  __walk_page_range+0x75/0x1e0
> [  212.638347]  walk_page_range_mm+0x138/0x1f0
> [  212.638349]  hmm_range_fault+0x59/0xa0
> [  212.638351]  drm_gpusvm_get_pages+0x194/0x7b0 [drm_gpusvm_helper]
> [  212.638354]  drm_gpusvm_range_get_pages+0x2d/0x40 [drm_gpusvm_helper]
> [  212.638355]  __xe_svm_handle_pagefault+0x259/0x900 [xe]
> [  212.638375]  ? update_load_avg+0x7f/0x6c0
> [  212.638377]  ? update_curr+0x13d/0x170
> [  212.638379]  xe_svm_handle_pagefault+0x37/0x90 [xe]
> [  212.638396]  xe_pagefault_queue_work+0x2da/0x3c0 [xe]
> [  212.638420]  process_one_work+0x16e/0x2e0
> [  212.638422]  worker_thread+0x284/0x410
> [  212.638423]  ? __pfx_worker_thread+0x10/0x10
> [  212.638425]  kthread+0xec/0x210
> [  212.638427]  ? __pfx_kthread+0x10/0x10
> [  212.638428]  ? __pfx_kthread+0x10/0x10
> [  212.638430]  ret_from_fork+0xbd/0x100
> [  212.638433]  ? __pfx_kthread+0x10/0x10
> [  212.638434]  ret_from_fork_asm+0x1a/0x30
> [  212.638436]  </TASK>
> 

Hi, Matt

Thanks for the report, two questions

1. Are you using mm/mm-unstable, we've got some fixes in there (including fixes to remove_migration_pmd())
   - Generally a left behind migration entry is a symptom of a failed migration that did not clean up
     after itself.
2. The stack trace is from hmm_range_fault(), not something that this code touches.

The stack trace shows your code is seeing a migration entry and waiting on it.
Can you please provide a reproducer for the issue? In the form of a test in hmm-tests.c

Have you been able to bisect the issue?

Balbir


> Matt 
> 
>>> Balbir, what's the status here?  It's been a month and this series
>>> still has a "needs a new version" feeling to it.  If so, very soon
>>> please.
>>>
>>
>> I don't think this needs a new revision, I've been testing frequently
>> at my end to see if I can catch any regressions. I have a patch update for
>> mm-migrate_device-add-thp-splitting-during-migration.patch, it can be applied
>> on top or I can send a new version of the patch. I was waiting
>> on any feedback before I sent the patch out, but I'll do it now.
>>
>>> TODOs which I have noted are
>>>
>>> https://lkml.kernel.org/r/aOePfeoDuRW+prFq@lstrano-desk.jf.intel.com
>>
>> This was a clarification on the HMM patch mentioned in the changelog
>>
>>> https://lkml.kernel.org/r/CABzRoyZZ8QLF5PSeDCVxgcnQmF9kFQ3RZdNq0Deik3o9OrK+BQ@mail.gmail.com
>>
>> That's a minor comment on not using a temporary declaration, I don't think we need it, let me know if you feel strongly
>>
>>> https://lkml.kernel.org/r/D2A4B724-E5EF-46D3-9D3F-EBAD9B22371E@nvidia.com
>>
>> I have a patch for this, which I posted, I can do an update and resend it if required (the one mentioned above)
>>
>>> https://lkml.kernel.org/r/62073ca1-5bb6-49e8-b8d4-447c5e0e582e@
>>>
>>
>> I can't seem to open this
>>
>>> plus a general re-read of the
>>> mm-migrate_device-add-thp-splitting-during-migration.patch review
>>> discussion.
>>>
>> That's the patch I have
>>
>> Thanks for following up
>> Balbir

