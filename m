Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9628DABF383
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 13:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D0F10E7E9;
	Wed, 21 May 2025 11:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vzm7klO3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC2210E7E9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 11:56:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GzXYu2zGcSYom5vTYJ1aF5AmtPrRbUzcqlFLuMDKEDZiQSsSo8KdtLTwerWsiJjnOLINXDdV1GJxFt0vIjYaHB3hoStscraf2b5ZJMg77KzNSaG6AY8ukS0aT6A6CMOW+BR+Ro/9cqsJL/JGDMOwys5KHCmLiwmJ5yWjcF45v5hi1+YhywALYFXf2rameAKHF2AGNKUv2zXeKqJCaeUE62uKUackY2Tq6jnbPcmgxAq21eOvgNnVry7wQ7qNsF3puXAPux1O24B3l5+AHEvWAeSmQXKXNTH+vGGgwZYz7jTDEc5pM2E1ex7zjE2idVYE1hYPtmzW6MNT/nHBJiVSvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2prh8SBIO60N6y6oSmrxqdDxZ5yzT13WyIElNK7hAqY=;
 b=NF92pO8DUEN/VYkYFNiZyAkivAbHeEoOCCFAc6Brp3ZSljYbiqx1lyoS+1PaX2KOOIfeKyhCKRgs161g8CFS+ExxVTQrkakTaxEF4uIBZdU63wjm3HbowYNNXvOjROzQ9IfThIFoejLmvMnmnT1oVmuGgn4m5ZC4CAzw8gu1BjZ2wgFJYr068c48sicQKydADspHlLg3mjBjh7A+m5nFpZDPbKQYyqsNVbmXAJmXB2NmhoOsmaByohBcVsDNlzpOF5M8iaexw7hEiM7H8SrcyxwSZdJSyu1/vth+2hpOyM31vHs552lIp9+3xDBUOXjaZtz0eLEFs+GWhdrIWJUVRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2prh8SBIO60N6y6oSmrxqdDxZ5yzT13WyIElNK7hAqY=;
 b=vzm7klO3VPOhr/IiEZt4t+cUKG/EOL8AWcLizRoNpqQIJHTx2C3cDX4rCb5OJscmA/joCNz3RiODvtKJZA2Dyx+YXjH5yu84cNJSemiojuPdrUqxAdEPBdQBWKXKnnYIsoM06lF1aSy6L5vrT8vNmNuX/D3psB7Ukw2MLBxvHxs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BN5PR12MB9537.namprd12.prod.outlook.com (2603:10b6:408:2a9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 11:56:54 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 21 May 2025
 11:56:54 +0000
Message-ID: <d786ff9f-9bf0-42e1-987f-f2091fd90279@amd.com>
Date: Wed, 21 May 2025 13:56:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dmabuf/heaps: implement DMA_BUF_IOCTL_RW_FILE for
 system_heap
To: wangtao <tao.wangtao@honor.com>, "T.J. Mercier" <tjmercier@google.com>
Cc: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "jstultz@google.com" <jstultz@google.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wangbintian(BintianWang)" <bintian.wang@honor.com>,
 yipengxiang <yipengxiang@honor.com>, liulu 00013167 <liulu.liu@honor.com>,
 hanfeng 00012985 <feng.han@honor.com>,
 "amir73il@gmail.com" <amir73il@gmail.com>
References: <20250513092803.2096-1-tao.wangtao@honor.com>
 <fdc8f0a2-5b2f-4898-8090-0d7b888c15d8@amd.com>
 <5b68b2a50d48444b93d97f5d342f37c8@honor.com>
 <ef978301-6a63-451d-9ae6-171968b26a55@amd.com>
 <9f732ac8b90e4e819e0a6a5511ac3f6d@honor.com>
 <50092362-4644-4e47-9c63-fc82ba24e516@amd.com>
 <2755aae2f1674b239569bf1acad765dc@honor.com>
 <2487bad4-81d6-4ea2-96a7-a6ac741c9d9c@amd.com>
 <a3f57102bc6e4588bc7659485feadbc1@honor.com>
 <5c11b50c-2e36-4fd5-943c-086f55adffa8@amd.com>
 <CABdmKX30c_5N34FYMre6Qx5LLLWicsi_XdUdu0QtsOmQ=RcYxQ@mail.gmail.com>
 <375f6aac8c2f4b84814251c5025ae6eb@honor.com>
 <38aa6cf19ce245578264aaa9062aa6dd@honor.com>
 <CABdmKX0nAYDdgq-PHv0HxucfYQzvvTAJjVCo7nQ0UtjwcF02aQ@mail.gmail.com>
 <7198873a044143c7be12f727b469649b@honor.com>
 <fdd7a11b-140c-40bd-a1c1-334d69256b92@amd.com>
 <e61fcdbf71ba4f9dbfef2f521d1b2fc1@honor.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <e61fcdbf71ba4f9dbfef2f521d1b2fc1@honor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0114.namprd03.prod.outlook.com
 (2603:10b6:208:32a::29) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BN5PR12MB9537:EE_
X-MS-Office365-Filtering-Correlation-Id: bc3fc373-fb41-4bf1-fd68-08dd985e9484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nk1CYUcrVnBEN1RpTzFWNjgzaHlrUzFFRmxxNXhpb2xwZ243UVFqN211b3FN?=
 =?utf-8?B?eEt2NVVNNkx6VU5lcHBFaWRYVHBFTGtyQ0xzY01DTDBjZzVVaG9aaWlGdnRE?=
 =?utf-8?B?TVJwbk1SR1IzZzduRjR1d3NIUHd3QmE1Nk5tREpNQjk4akpaeG92diszWHNa?=
 =?utf-8?B?L3l0N2FYSlF6SWFZR0w5bUM0N3J2ODh4aURkdWJsR1FOUGJWSWtMYkV3Q2tL?=
 =?utf-8?B?dWgwb0VrN0daMWd2Vmh5SnJOWHBjeXE5akV4R1ZtYzlaL28xdTVmaExGYnNm?=
 =?utf-8?B?MHBwdnpzZW4vd3pMYmUyUTA2MS9hNUVhZWZ2TUZpU3BTVEdRMm01REI2dXZx?=
 =?utf-8?B?ZmozY3R2NVRSelFGakgvUXBtOUVXeGZGbTVYT2piUnRmY3d6VEY2dENNWWxQ?=
 =?utf-8?B?MS9ueXJQTmE4UzBwNjU0UU1Bd3RLZUFLUTV4ZVFQYnBZbkQ2MHpoZndvS1U4?=
 =?utf-8?B?L2k5bHRhZFFFcDJETk9xSUszbTV1endmai9MclpUd3NRMlNUYkMzYmI1UlY1?=
 =?utf-8?B?TVJ0Tmp0ZFM2VlAwZUF6N2wzaHBQRUlBZC9KaHA5NWplc21BM0dNL3k0aU9V?=
 =?utf-8?B?aTJKUzlMeERtQnNHaXhrZDhYQUlBN3loczFHQVRjODByOVVZWGhMZVBob1JP?=
 =?utf-8?B?RGJobjQ5b21Oa25YcVJnSktSeWZObzBueGJ5L2pJNWhGNUtTRzRyRmVVVHY0?=
 =?utf-8?B?U0gwSUNlYTF3VUw5Y3F6Z0NIODlTR0Jra2NNMHFiUHV5YW9OZjAyT2VjQkQz?=
 =?utf-8?B?UHY0cnltQWNnbHdjRjFCRHNQWk5CczVwRzl6eXRJc1VGOXFJa2xDNUF3aEx3?=
 =?utf-8?B?bHBsVGtWU1l3S1BFYmNQaHh1YW8rYjNuZmVWcTJLc1k1ajdENjV6T3dGS2ta?=
 =?utf-8?B?QkdxL0JraFY5Nm5PSnlydHVjVFNqc1hnQTdVc28yV3pIRkFUUFlaSm9PRS9s?=
 =?utf-8?B?R0R6eHpWTVhDQm5RTnJlUm5IbVIyZDVva2Z6ZDMxYzQzMnBsdHF0QUtPSXdW?=
 =?utf-8?B?emJubXNoSUEyWWJoK3BRWW1qR0h1bURFc2FnQnFEeU5vM0tMbEQ2QVgyRitw?=
 =?utf-8?B?ZFhuVXR2VDVqME9NaEZqLzBWaEJZblZsL0Rwd1Z4S01xNjNyby9LK1U0amRt?=
 =?utf-8?B?Y2QzblUwTTFOVkpHNXpvZVBhc0cyaVlpWDE2RHVxQ3l4ZnFUYi9udTF0SXA0?=
 =?utf-8?B?anluaUEwU0I0N2M4b1RmdFdrUWJlRldXMkJ1bG5sRlhnRlIyVTFhb090NUZU?=
 =?utf-8?B?RkN2RmlMZWxDTGxMU2ovdjhBV3pVMlpTaXcyK2o4eDg2S0ZlcEpEZFc0dU96?=
 =?utf-8?B?Z2dGOGowSVIwRnpZVWw0MGs5YUxUWGtkZEVkUlltVFU5Q2JCeTR1L3U3ZVhR?=
 =?utf-8?B?STVHWHhSNHl6Yk5leE9UOWQxY3J5REJ2c0tSUmhvcDJ5TE1XY04yRkF4S1pM?=
 =?utf-8?B?WFVQNjJSSHRvNzAwQkdGSnBIalVOb202bmIvOVUvV3VvS2ZmWGpTNnRaY252?=
 =?utf-8?B?OTdKOFdvanVaWkhJN1hKdy9OUklkWncycDRLMUFLMzVROEtiUmMxZHNwdFBP?=
 =?utf-8?B?WENON0RwMkI0T1RKREZGZkVFa1dWQzFDNHYyTmdvZnpISW5XcndFdVdrYXEy?=
 =?utf-8?B?Szh6TkQ4MVZ4Smg5SStqMHBGOGpBZUdDOGU4UnRnR2t2cTVqQW5EM0tmSnRM?=
 =?utf-8?B?VFhHY3A2dm9jSW4rTDlxbFJ6TlZnbjVyYytDU2xjcnlhWklSQ3Q5REd3ZEM1?=
 =?utf-8?B?NDJEYXZ3c012eGRFaUw3SU1vUCtYSC91YmIveW4xd0xvcEJFZmx4ODdHcitn?=
 =?utf-8?B?RUt1VTV2U2NmUGlZR2NXNUdiRkpTVHpsZUFiYXpwZ3kzTzlENnJZdktVWkZ0?=
 =?utf-8?B?c21GRHJTOEdqMVVpUXZYWFFNM253S2llc0FuRGRKcWE3UWl4ZXF3NnovUkVl?=
 =?utf-8?Q?OGTEyArG+Ws=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STBZc1BhNXlsenNmSHVBLzV6QWJZVFVaWEpLcDZScmZSM0pWbGs4c3NOdDZD?=
 =?utf-8?B?RjJIVWNQdDRKTzU5V0oxUVRGOS9vS21WY2liMVlxL1MxaUNMSklVUlZzR0Uv?=
 =?utf-8?B?NUxiR1l2ZXEyQkM0VFVDajdIYjRYRWJVS1Rja0dycWlFY2MycnFHbzFSRkRk?=
 =?utf-8?B?L1drUy9UNzU4bzh4cUNRRmRVSE1kSU1QbEhRaWZIb1REK3ZwRlRqWk5mdUZa?=
 =?utf-8?B?UGpTdC9CS1AyOHgzb1JMd2JEMm9vNDg5Z29xYndPUzQvdUNwUHJONmpOemJT?=
 =?utf-8?B?MlZlRTVYc0dKdExJS3lVd3pUb041L00wRUhwbkVBVmxiQ1YwTEFZc25tZFlG?=
 =?utf-8?B?cW15WEVFYTBwUFdKOERIL3V6OWhQeVRXekFLclhQdkwwTFVXSk1HRWRSOWd2?=
 =?utf-8?B?aVZQajFvUDBvVDhqcmlXaXlVU1czUmFqSSswUVAxTllacWVOZHA0QXFkYXIw?=
 =?utf-8?B?dUVBa2hqOGxmbXE2cloyZEJ3V1dJck95L0tmeDY2cDlHZEJ6Q21MTGdrbmlQ?=
 =?utf-8?B?SXpreWZ6Kys5WGFpbGlhVDQ3Q0VWVzZMU0o1enVaKzhWVGRvZHFNdDgrRm03?=
 =?utf-8?B?UTFvd3JmMW14bFdPTks3THJMZDZONkdRUTY1ZjNGajl4N0VTRmdGckMxbytR?=
 =?utf-8?B?Q01KWEdZTkJTQ3FFV1ZxT3UrbC9RRCtrcTVObEt3REZJL01OOHZJQVhUSDBi?=
 =?utf-8?B?RFA3cXNjTi9HOFBIM1dzRDB0WUJ0NCtGQ2hUaXpNMEtKdWtMck5TckJyS25Z?=
 =?utf-8?B?em9pVTRsU25IazVsbGgvMlNwSVhPc1dROFNqclIyVHVicWNsbjFxaVE2NUFM?=
 =?utf-8?B?MVdRY29OVzJ5R0FJeUtqTXYxT2h6NE9WNVRpSXM5ZUJlSmJzVjFsMExubXRk?=
 =?utf-8?B?S2cvWkNRS3pWOG9aTVpTeFFXbExqd2gxZTU4OXNwOVlCN2ZkWjZNb3ozUUlr?=
 =?utf-8?B?R1hRQi9jOXorcEVocXpXSmJ1dE5iT04yU1JaWkNmVXkvVlRISVhFSGVDbjNk?=
 =?utf-8?B?QXFXbGtGbCtLY3EyUnM3VzRjck5ZbTRNbXJpL1ZzaTdUVk5ZSkpEaG4wekhZ?=
 =?utf-8?B?dFlaaDBrVE9nZ0o3Y2tnQzFQeTRnaWg1WWsvemNPaWlRWksrV25OUEtiZ1Nm?=
 =?utf-8?B?ZzcvdVFITFdRRHZqN0VJRWRXQmUvNDRZUHBnTVo2WCtJb05lU3NLMFZFK0tO?=
 =?utf-8?B?NEtqZlpFNEY0UmNhQmVORjRoZzFOR1BqZ2srdHFoOWt0N2ZmMUR3WDQ1Zkhw?=
 =?utf-8?B?OFFGQWkwVy9VdW1qd2hoSDc3Rk5sZ2lsYTMxVUxMRjl1eGVrc1RIOWhqcGNo?=
 =?utf-8?B?Rlp6T2liRTRucnZxTVM4TTVsWHYvUzdZd01NazFuSGRaMWxwSlhQdmlJUUJr?=
 =?utf-8?B?QnlrNEdMbUpzRVc1Z2l0OW9PdWVHVjlRM2h4MU5wZ01BYVl2UTg4Q1o4UEgv?=
 =?utf-8?B?QTFRQllWREl4b01KdUhBUEw4aXhNbkhnUkFHZUgwNWd3eGcrUjA5YlppQ3di?=
 =?utf-8?B?TmRXUlJkRG9jYlhFcXpRNXpIc0RzcC9iYVAzYTFWRHo3UnpVeTg1YmlMcGZM?=
 =?utf-8?B?eUplbTM5bXl3T3ZIQ0Q3UFRPODNvc0pqcTBoYVFmWHY0aE5FUGhpZ0s1ZHFu?=
 =?utf-8?B?MHhiL1ZobVI1elN2dVV0ZlR4aWFWNmtHU2tKSUxydm52ek8zNmszcENvVkM3?=
 =?utf-8?B?ZDAxT3dPOXRKeStWZzl4R0lLeDRXNjVWSkx2K1NFVkw2aExFNXRVL3pLd0sy?=
 =?utf-8?B?Q1RlZWNPaUM3d1ZXb0pJRjZkZktwYU9sVTlEaVM1c25QbDZqR3BMUXlueExq?=
 =?utf-8?B?Q2IvM2hUT3BOQnpRUEFSVkJ1WFNrSkhNc3YwOXNyazJJMitGZ3J6bG9ZQ1hJ?=
 =?utf-8?B?dk90dWl0NDI1OEFOWXVXVWt2RitvbWwyemNneHNUTEVSRFczeENmei9RTm9X?=
 =?utf-8?B?V09OMHZCL2JCNWJRUHlhNi9DdGV3eVd4TXlQcjhGbEVGeVh1bTVCKzdrdkVT?=
 =?utf-8?B?N1pSYlpUY2w5VkQwMEFRRnFreGNvRGRmMTlqcEVld25PcmNqUXowWTZuNUVU?=
 =?utf-8?B?Rko3Z3gxOFExS2hrQ3l6RUw2ekN2N2d0K0RkRjIxSWFkSzB0eUVuWktFZldY?=
 =?utf-8?Q?Bm9h2vGa6qivY1vXFrjIgW/T7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc3fc373-fb41-4bf1-fd68-08dd985e9484
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 11:56:54.4650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1TCI22+QGCF2/WofeV/bMkxBqee7c5MvGzzDW0pS3ndRyULYiqU/Se8PGOf6gYTu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9537
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

On 5/21/25 12:25, wangtao wrote:
> [wangtao] I previously explained that read/sendfile/splice/copy_file_range
> syscalls can't achieve dmabuf direct IO zero-copy.

And why can't you work on improving those syscalls instead of creating a new IOCTL?

> My focus is enabling dmabuf direct I/O for [regular file] <--DMA--> [dmabuf]
> zero-copy.

Yeah and that focus is wrong. You need to work on a general solution to the issue and not specific to your problem.

> Any API achieving this would work. Are there other uAPIs you think
> could help? Could you recommend experts who might offer suggestions?

Well once more: Either work on sendfile or copy_file_range or eventually splice to make it what you want to do.

When that is done we can discuss with the VFS people if that approach is feasible.

But just bypassing the VFS review by implementing a DMA-buf specific IOCTL is a NO-GO. That is clearly not something you can do in any way.

Regards,
Christian.
