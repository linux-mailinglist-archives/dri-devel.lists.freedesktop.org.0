Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED9FC99DFA
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 03:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676F510E507;
	Tue,  2 Dec 2025 02:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jtuEc4lT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010029.outbound.protection.outlook.com [52.101.201.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CDD10E507
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 02:28:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2mrv5Bu4FYU9zBIIwcq+YE5amrlB2EmpRYYWeeE4YzW9/M7N5PjXlKcifz03Ia854zcnDxu9U+NiTq6P/BZiu9yEsDT4Hupc+OjxMFXUsxxllkL48WV44NMbYvSL3eqCIFEglsZuBBJbGVXwCsyQrXYsunmJC9zm5Ai9Go6CnECbYwnndPZ+fEgXldmRNeY/1hd6Bvnd2zy7bvg6UwlU4ZM4VhqrqSjCTYDpp7t6TEjLEYHw/PQq8Hxqu374+DDMgCavpw4d/NiNab8iL/M7U5UUNsHg6/lgebVCpB3lt+Cg3aqVa/oF0GgDP63L3QJjBcGR20veh/SAsPZWN3XOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+bqRLmsYzX/pfBE2SUxhWvyZb7GCjXNOuO2wrdhdyk=;
 b=p9SAQV7rZGoFPv5B2eIe4sQyKZ2WkB7muYbMmInSVXUIFqaTaWPkYEaziEWMVQEr06Sc9Fkvc8IrjJvZ9HTXfyOWkCl6qrC+ekDcV3ihr7wgCyFHhoeMJDP3Jx/titU5T5dg38ck1hBamSpZugcG07Q2Jc7h3BkyrIwNV2djaCBj5T2r2kFgtPVNY3u+2Y2QEA5aFPrP4nWZXoG3UwnVt+ZC+s0KK+uFtKp02l4hkB/1fZskv9m5qIWUhG/7YUrGl9CP1gyhH6HTD4HFMWv0upZEMC2EQoGNRbp9Dv196eSHyTq9rKO8iGbJkxMGoCjvToCco2MbbnKG3onoXJxnpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+bqRLmsYzX/pfBE2SUxhWvyZb7GCjXNOuO2wrdhdyk=;
 b=jtuEc4lT1tvVi/XQ2ielejK2WoJm6ma0h5XVKz5RqvlTLmW0a3hznnHH4auScRIzOKH5HGtmq5uBYaN5gkGvWnv79yFhebvL8yzmY6/0V+Gsa+1wzX6QFpUfYOT6RY4hZA9IhZd93CgkuYDb1euBBpVG625kHCg6DY5/aKnfGYSDzh19vxG4agRhKeDke1++SD1BgIoYp/UrpdlWrJkBbGjWRZ+eOkT2jMsZcarfpwz4kPEl9ZwDMpL3YoPEnUzaHi9+zaSZvjLDNnRVvVYevV2SOBwuHNVOwEpYVeD7aiPkjkwf7GB5cAzbBsuZvF4tymrvdN06voWSCAt84K/8Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 SA1PR12MB6872.namprd12.prod.outlook.com (2603:10b6:806:24c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 02:28:18 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%3]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 02:28:17 +0000
Message-ID: <1d4cb6e3-38d2-45d0-8e27-4f2b9dccd6cf@nvidia.com>
Date: Tue, 2 Dec 2025 13:28:10 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 6/6] mm: Remove device private pages from the physical
 address space
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, matthew.brost@intel.com,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, david@redhat.com, ziy@nvidia.com,
 apopple@nvidia.com, lorenzo.stoakes@oracle.com, lyude@redhat.com,
 dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, willy@infradead.org
References: <20251128044146.80050-1-jniethe@nvidia.com>
 <20251128044146.80050-7-jniethe@nvidia.com>
 <20251128175108.GG812105@ziepe.ca>
Content-Language: en-US
From: Jordan Niethe <jniethe@nvidia.com>
In-Reply-To: <20251128175108.GG812105@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0009.namprd10.prod.outlook.com
 (2603:10b6:a03:255::14) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|SA1PR12MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: 944c3eb3-daf4-41b1-f9bb-08de314a740d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmhTUXo3UjVqVkhXQ1JvS3JDeWNGVXVmVVJJSGFmS0xUQnUwWktRZ0FhVzF6?=
 =?utf-8?B?VThRYTdXVExiV3lFTjBPSVBrQnYzaHFEdHJSb1lwcWNBTVhSUFc5elN6UkQx?=
 =?utf-8?B?Q2pJVEJZQkxYS2hiQUNHb2l5V3FGdmRpNHRjRWQ0a3pLWDF6S3BxT1FsMmQy?=
 =?utf-8?B?ODVxQnYwdUU2aHBHRVpHUDBBZ0lzU3lFVVNCNjdIWHljNnI4WkwreXpsNStQ?=
 =?utf-8?B?S1hSNUtTU24yeU5LaFF0RlArQTZCY0NMT0w3WUE5VzZOWE44K1hsSXZua0RH?=
 =?utf-8?B?NFo3TEU3OUswMXEyU3hLbDUyWEkrSzI4YmpuMnVWY2tuOHNYa1hvZkdXUDdx?=
 =?utf-8?B?QzFaZ2xpWU9nOWowSUgwNXNNTDRnNE0yUlRhbFJaUXdOYTQ2MThzdmF6MVpF?=
 =?utf-8?B?eGhzaXFkNkJRNFJrT043ZkY0TFZ0bi84N0psYVNRTURQd1hPZWxuSEErQlRD?=
 =?utf-8?B?SUJQN2ZEc2FRN09aWmtaN09JU1p0aWU0ZlJ0dVNOZENoekUrcXVhTVN1TUha?=
 =?utf-8?B?OXFySXFBajZ6b0RmQnoyTzNPRzlyczhoUlZCZmJzS2NUOFNReUo1UnlnZFNQ?=
 =?utf-8?B?OUlvQUgrcUFQa1RPNDZMdURETnBuaUx2bm1RQzhPUnVqV2VQYnVzVDQ5bER1?=
 =?utf-8?B?NWxlcGRRYzB6aFcyeHBwQmoydnNtcVRyUU0ra3dFZWxlZ0RSTTBwb0k1UDJ1?=
 =?utf-8?B?WHlHYkhjRzBuYldPd0YxaG1KQmN6UXRmYzR3Qmk1ejVDcjlJRFNueEhsMk9C?=
 =?utf-8?B?ZWkzc3JQZ05DSnkrSjFoZXZrQjFDV0plU00rV0RyN3ljM2xJbGhxVW0xODJ4?=
 =?utf-8?B?eE5mTFNVQnZMSjNWWUFHM2UwZ3NteGJjZVFkMWpJQmd4aUk4NklUeTlRK2RO?=
 =?utf-8?B?R2VmbTZWOGt6Q2NQMHF3eEk4ZHFWenNJRzcxWGM4SllCUGpTNHJqdmpsMldR?=
 =?utf-8?B?WXdVdlYwemozbzhZT1dSSExLdEVaQ3ppSkxwUURXVkVML2hjam5yV0VoSEJP?=
 =?utf-8?B?RUFVSUJ6b3MxU00rMmdHMGYzTEpYYzdpN0FMUmxkeWZDcEROc25GNllWaVA5?=
 =?utf-8?B?OFZuM3BGbHZyUFYydGU1TW1qd0d1NEZtWnJvOFFEMFRoeEdTb1lnd3VjRXFQ?=
 =?utf-8?B?TmJhSFlNazNkckVSNzNnM0pYZmVyeURZS2ZZTitzalAxUTRNKzNoZjhwZmZJ?=
 =?utf-8?B?Ky9pL0pReUMyLzBvaXQ1d0txYkxJVEJmb2JkSDN5OVp0RTBnMWpiZHNxWWJu?=
 =?utf-8?B?aC9qUDcwK3pzTTRBSnpES3ZDRzdyS1FLRm5UK3U3V0JlVjhkUXozenhnUEVG?=
 =?utf-8?B?R2c1UmQycFBzYTlyaVc2bEtQT0lTWENVVVJOcVFVeUwrQzJnSjJDNG54TkZu?=
 =?utf-8?B?aXl4eURBdWJVN1EvWk1HUFdZODZKc2pPd0JJMTNmRGFDUlM4Sit3NTVabXdl?=
 =?utf-8?B?QVNpTklmdktUNVJuR1JwWGtuZEVnN1dteWdrdnd0TlM0UUtTMUtJTEZyc21Y?=
 =?utf-8?B?dTZwV3N6UTUvV0lXb25LNVBOUDhjb3NYSHZtazNBNzAwRW1CdU42b2lzdzFE?=
 =?utf-8?B?STlsWGxvVmpGOCt4OUdLT3ZreDRBdjdxYlB1d1QzL3lKcElTUFhMREVDSU41?=
 =?utf-8?B?K2xZQ2E2S0RwdXJCNTVCYmFqNk82c0ZWVGxBbWlEZklRS3FHWGwxcWVnK3Iv?=
 =?utf-8?B?VHlRWVUwSGVoR0x2Z3RBM0JoOHQyQ0o0S0pZWVJGWUNpem5wMWpZMDhtNm9o?=
 =?utf-8?B?UmJzUHJKTE1ENnpUYlFWMHBjTC9vaXlHdTZnZFlyMWVFdjU4Q0V3WmRaQTRl?=
 =?utf-8?B?REZVS3JtOTdPSExGdzBDdUpaaFJ4SE5tUW45Y0JJSFZyZVMwVHlzYzZzU3pE?=
 =?utf-8?B?OHlYMWkyY0JsQ1hBdE9NMnVTc0RUWFNKYzArYW5TMGh3SUhTNUhTODZrNzVK?=
 =?utf-8?Q?KtlRNmz9B9YL0NHSgOtSj8qxIJSMzONI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejc4RjRuUVBwUGRuWTBwWTVxSVUrN0E2SkZzTDh3aHNuY2EwdFVnNW1ENDln?=
 =?utf-8?B?ekpucWRJa0xoMUdXVTBYdEVWZDZRdk1QTUY2WDVrMHJRYW56YnlxNytycno0?=
 =?utf-8?B?UzhWQnluam5Gc3dHUHN2d1Uvd205eGxqay9HS1hxc2t5am9mQ3hDK3Z0R1U1?=
 =?utf-8?B?ZFlPS1JKTTdEMEd5WGFsRFRhM25nNHR0ZWJZWExKN1dQVkZGbkdOYXpWNUFq?=
 =?utf-8?B?RlB0cGVtSGg3RjF3dm9jUHBLbSt1czV6cGwxVHlJTHZhbytXWkNKbEJrU05q?=
 =?utf-8?B?VytndjNTSWFzcUNlR0lOY2ZoenB1ZjhaZlFKVlp1WG5McTIzZS9XdVIyK0Nv?=
 =?utf-8?B?SkdVdWxKV0EyMnRPeUxvVy9SNi85dHVndkQ2S1ZpLzhiRkdveTd6N09CNmxE?=
 =?utf-8?B?Zk01WENiUG9UZTNldHhlM1dab0lMMzRwUmV5cmJpOURjaU9FbUIxYUNvS0dY?=
 =?utf-8?B?bExRVkpiQWhyOFZVRHh5TmhWRE15TnZHdVRRbG9qTit6enNxeWtQUEMyd2hW?=
 =?utf-8?B?TUpDVG4reGZydWRGdU8vdC9Fa1JpZXJKQ2NZSVB6VExsVXZleGZJYzJLM3dG?=
 =?utf-8?B?aWNjU0w0RXdjYXhRTmoxd2hHWkRkSDVobE5kUlR6bWV4QVNFY2pTOGdjQXFr?=
 =?utf-8?B?djR4TGNWdUpEQnNEa0Z4ZHNCRnpJeC9YcGRFNldjRFl0cDBPeTF3ZW9EOTVN?=
 =?utf-8?B?Wm5JTjJ2dlRQMmpSL2pEc0JJc2N4MmQrWWw2MTl6TDBjbXdJR3BuWUV0enRk?=
 =?utf-8?B?RU9VdnRsOGVkcDhBOFJoS0QweGJiSlRjL2ZQQ2lFSCsvMWF1RlN3NjUveHhi?=
 =?utf-8?B?aFdzNW44dDd5ZXV0ZmtBQWQ0S1lUbmhDL3VyMW95MzdTbnFxb28vZzBxV2th?=
 =?utf-8?B?d3pjczVWdEhXMVd2K0p6eXhXaHZ0RE85QU5XMWlZOEtPSkhtZmY4YmF0bS95?=
 =?utf-8?B?Um81VDJmbytReTFPZHVzdExOZXdITDNYUHlrdFNLcDM3YUIyV3piMmVhNE9F?=
 =?utf-8?B?ZkxmN2E1bHl0MHpLVXRNdmlQY2ZGcTR6MytCSkhNZlh1ZDl6UFplUnBEdFNS?=
 =?utf-8?B?U2xlSWFuVTd3amx2MS9qeXlJaEd2c3h3SHFkS3pwZFNwK3VKSXhUMVBnMGJY?=
 =?utf-8?B?Q2REbGErdmUyVE5ZZ1dXYnNCaUVXYzgzRmFJTG5Jc3RLekdqMlZGcFNXbWNl?=
 =?utf-8?B?bkE3Yll2Qnl6UVdFQnRqRHUyRC9aeWl5S0EzMzZNRGJUUjdKWlJqc0FhM1ZU?=
 =?utf-8?B?Z21SMWF3THNvbGxQUktBLys5UnpuWmxLaUFtNHJ0SmZRQkJBb2Z4b2hpK3dR?=
 =?utf-8?B?Tm4wbXJ4RkJCd0FKNVNySjI4RDFOcktoS1krMVJ5akl2QkFnRGVGSWNEU3h6?=
 =?utf-8?B?R0xSQTB3ZHJERjcyb1dsMkdUUERBald0YldFcFVuNG5MRnlZODByOUdHTUpY?=
 =?utf-8?B?R1NYblkvY0RnT21uK2t0L2FTYWM2ZjVlNThscVdza0duVFFTYzJtVm5ldzF3?=
 =?utf-8?B?Uk1OOUlpZzR4aXFFMHRpczAxOHdNOFY2MWY0WlZqNklkMjJJRXlSSVpBR3E1?=
 =?utf-8?B?WEs4UFRJT1JzelVacTQ3Qk9DR2hUTFExRXJidktNS0xkd1QveUJqVFB3U0dL?=
 =?utf-8?B?QVF3amRSMkVPbFphUUZEeUFVZG4xQk1XN01WV3JsY3FKZys3R0lDWFlUNkxh?=
 =?utf-8?B?OW1VT1RNVU5PWUo4ajkzaGRzYUZQYVhzdkdaOXdKN1lJT0VBWXdKa3NpejhF?=
 =?utf-8?B?U21JUGt5cUgySjV6NmpITmI2YUxBNFFwMm85d05WWitIRXNxS1d3NFBRVDNi?=
 =?utf-8?B?YTVTZG42VlFkR1pkSWxGMDBJT3FISDQ2KzlKWnprSTRublBSQzB4TkJ6WGRt?=
 =?utf-8?B?SW9mMUV1OHU4S1VJck4wQ1dTWUx4UmZCaEZJb3EwVGxvNmZMY29VR3ptSWxI?=
 =?utf-8?B?ZC8yLzFWcTNhVTYrdy9uMHA3byt0YURidHB4Z1MxZkZLZEdIR01UVDFiYXpW?=
 =?utf-8?B?QndYNlZJS2VUZWJHNHdvbVpSK0VMc0FsMFp6REt1Tk1vREd6cXpCTVB1M2Q1?=
 =?utf-8?B?eGNEbzlra210NWozUC95QWJFaCs5MzIwdnpwM2VCSERmMGJSVWVBOFRoOWZO?=
 =?utf-8?Q?A456a6d6xiArHa4aev8aQz+Di?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 944c3eb3-daf4-41b1-f9bb-08de314a740d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 02:28:17.8946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sjos2Se1Ek6BZVwpeJPCLHsJWoYCZAwmbStjiSg9yke3dQFpAkge8D/ozGOrpzYHyOOfgIFsGJLd0W8ITpDwzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6872
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

Hi,

On 29/11/25 04:51, Jason Gunthorpe wrote:
> On Fri, Nov 28, 2025 at 03:41:46PM +1100, Jordan Niethe wrote:
>> Introduce helpers:
>>
>>    - device_private_page_to_offset()
>>    - device_private_folio_to_offset()
>>
>> to take a given device private page / folio and return its offset within
>> the device private address space (this is essentially a PFN within the
>> device private address space).
> 
> It would be nice if we rarely/never needed to see number space outside
> the pte itself or the internal helpers..

Outside of the PTE itself, one of the use cases for the PFNs themselves
is range checking. Like we see in mm/page_vma_mapped.c:check_pte().

> 
> Like, I don't think there should be stuff like this:
> 
>>   					entry = make_writable_migration_device_private_entry(
>> -								page_to_pfn(page));
>> +								device_private_page_to_offset(page));
> 
> make_writable_migration_device_private_entry() should accept the
> struct page as the handle?

That would be more clean - I'll give it a try.

> 
> If it really is needed I think it should have its own dedicated type
> and not be intermixed with normal pfns..

One consideration here is for things like range checking the PFNs, the
logic remains the same for device PFNs and the normal PFNs.
If we represent the device PFNs as a unique type, ideally we'd like to
still avoid introducing too much special handling.

Potentially I could see something like a tagged union for memory indices 
like ...

enum memory_index_type {
         MEMORY_INDEX_TYPE_PFN,
         MEMORY_INDEX_TYPE_DEVICE_MEMORY_INDEX,
};

union memory_index {
         unsigned long pfn;
         unsigned long device_memory_index;
         enum memory_index_type type;
};

... if we wanted to introduce a dedicated type.

Another possibility could be to avoid exposing the PFN for cases like
this.

For example if we went back to struct page_vma_mapped_walk containing a
folio / struct page instead of a passing in a pfn then we could 
introduce some helper
like ...

         bool swap_entry_contains_folio(struct folio *folio, swp_entry_t 
entry);

... that handles both device memory and normal memory and use that in
check_pte().

Thanks,
Jordan.


> 
> Jason

