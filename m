Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44246940BC8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 10:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3096B10E259;
	Tue, 30 Jul 2024 08:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5MHoEJgE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2698610E259
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 08:38:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pu6OJ/X2AmJoolxykfb1mZBm5rHLSRyzacmvGkYdUuX02Qt6grvT8JT9UINvYh/TohR1GkklMPszFyxNAlSl17nynbOI7CZ6KEzLzC4RSZgYvdbl9J+7M6Tn4B2K00X7bSTCbQMLKvGR8vOD3NzZaa9n6E80zABmMr3tNFUQltm+N+ph4JkK9vTSFQdwkHotZeimJfv1HbtR5c22Majhvv1RTVH9rPrxUaqQ25xeGib1Pe5TQG5zD9S0LRSK9h32lStSotnmXMe/wBtD4Opjs+czWpj6Q4JHBizTySDI99gAdws68VpnBestQ6vmGgop0O20gdbBz6LcTgt7n27qKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mEclIIrIVZpabdRq4Bwo6d+Ipqnx018VlugcYXz+r1M=;
 b=ur5cIcdwxp2ZDxx5S0E+qhmHgo3OQ2pObrLJDq/P0Ff3fsonvLlPd7KLE6LBOX3LG3nHcmxMu7pkUpCY84vTBFkQ2VbpHwCNCwj+KA1qvi//A+6zo0beh/J/6OBzw8rU70LsyGuhimVDDsRaptw7Snel+0+or10H0/SIrClinreGGWU9Swj5f+l1wrg6Kj+wHLJUPZlkdfADh2q0nKIaGNjWCBZSQbR126CFTkfyD+7JgsEJvRbemcuBDZj9hQPlmFb6VIvrX2Er+AW4fpyU/eYlsnPXDdho2w06ymn6d/XNr/qY/8jLPW8kT4Iq5VVnGJzxjzAT3/yzgpbwgErOhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mEclIIrIVZpabdRq4Bwo6d+Ipqnx018VlugcYXz+r1M=;
 b=5MHoEJgErnaWUuwcHCKe3DjTtcYdGo5dzno05vaEdCYcNXif+PFfsPxAc2WqqLNpp3rco61fQll1/59BLQO6EY5eYLE++bVC5KvfkB9wlezrzfpiicATrnSiiCqoldRuONd8URqZFNN1xpmZpelPAfOCprq9OMFijyAUgF27V50=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7453.namprd12.prod.outlook.com (2603:10b6:510:20a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.26; Tue, 30 Jul
 2024 08:38:05 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7828.016; Tue, 30 Jul 2024
 08:38:05 +0000
Message-ID: <d5d7674b-eab3-465b-97eb-e33bdbecd7c0@amd.com>
Date: Tue, 30 Jul 2024 10:37:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240730075755.10941-1-link@vivo.com>
 <d2f56198-a3c2-4f7b-9d10-616deb348351@amd.com>
 <966651c0-42fc-4827-bf3e-2170dcf4688c@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <966651c0-42fc-4827-bf3e-2170dcf4688c@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: 642ecd01-5b7f-495c-8498-08dcb072ee6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekFSaDhzYTVuWkZRRFU1S3JDdkJRVmZFTXM2SHhCMkpuV3RqZE1ieG44NzZp?=
 =?utf-8?B?VnF0Snl4cGIvbHFWbk84TmtWQ1dUbUVyN0VGQy9GM3R2SFpXWmx5dGZOZFFq?=
 =?utf-8?B?WmwrT0w5L2JXVnpkOXlmTytma2x0ZWNhTVk1N1pEL0psV0Rsa2hac0Zhc3Uv?=
 =?utf-8?B?eFBBUi91VUVlNEtqL2pGSGlyZHJZa2tJcHYrajZRSHZKby96eDZ4cThlbExC?=
 =?utf-8?B?U2dHTGhiNm11Q3JoMmRuUDlHaS9RK1JOTWJueWMzRHlQMGJBclVOcFRJS2lJ?=
 =?utf-8?B?NS94WWh3aWNFbDFzTTM0bjdMMHBic3VaR2FydGxmRzRsNVV4emdwS3BvTTNy?=
 =?utf-8?B?S2t5eVNQSDdJU2lMbllRRThPVUt5dVA2eDkvbDdBUHRMVW1laFhPM1pxZEJ1?=
 =?utf-8?B?bkhUZ0dKOVh1ZlJVQ3EzeXF5Wi9lMHFSNlZhSGtBQUlrbm9yblB4ZzdJeDZr?=
 =?utf-8?B?UFBseG5hdWlwMnNMcDFHZVNsbnpyc29oYXlRcnRzd3lTNzE2Zmd3Y2lvQ2JI?=
 =?utf-8?B?aGNJY1BORVlaLzRzc2R5SWFVbTZ4WmY2Y21McDY3R01wZ2plaUFDWXRVK0Jt?=
 =?utf-8?B?ZTlEeEFJT0wvYXVPdkw0eXdTOGQ5cFZRS2xKNkdlbVZDV2NkcU04dzJEdzh3?=
 =?utf-8?B?bWUvekVFWGdDVHZtMXBJTEg3SDVPam53dHRUeXdwZSt0Zm9GME5pSGtJRTBn?=
 =?utf-8?B?OFJWMGtaQ0czVjJpcnR6MXJxd2ozZ0hHeStMWnNSNkt6dGlCZDBlcjRicVNu?=
 =?utf-8?B?c1UvVi9Jd1Y4Nmc1U29oWncrU3ljazQvcmo2YVB5SW5RTFVWREJWQkxXSEZG?=
 =?utf-8?B?biszeXNwWE41OU0wK2lLOFo1RTBEUWppVHpsRWEwZmlHWTAwZTRyMC9aZ2pD?=
 =?utf-8?B?VVV6MnQrdTBsak5pczBrVTRxY3E2MnBlSDQ2NUhRVDdaYmFnK24xZFE1cENo?=
 =?utf-8?B?QVM3aFVKYUZ4ZkpqZi9ac3ByaTIwbDJQVFZyaWJ1NFpOT244c3VNTWVhVm8z?=
 =?utf-8?B?dWUrKzc2YnNSTGF3YjB3a0lYQUdkc0c2clJPVTc4NW03Y3hRT09UNys5Z3px?=
 =?utf-8?B?MzN4Sm1YcjNXRW5GdExFV3NzRm5jMDgwcEVSTFB3TEZYem5TSjdwYUJoY2JP?=
 =?utf-8?B?SlB6MG54a1R0MGcxYVB0TittUjZ4c0U0Sy8wSkN5cmZlMUxqVkd1cEd4dGZK?=
 =?utf-8?B?TWRSdTZSMzFnU0dUWUZDUVg5UTVlQWIzYnpjUHJ5RFhVODZCWmUyaGh6VlU5?=
 =?utf-8?B?SzZrMTQwWEVwSWVGblpJdElDOWZSOWVwQm9FV1dBbUVTQjFIdDlyWmNieCtr?=
 =?utf-8?B?Tlhsc2pvSGZaaGpPTU9lWmQxWFpaSHZpMWtsRGNYMk9Dd1NMaDEwWUpBUFZw?=
 =?utf-8?B?YmVNMmYrT01TN25NdDc1T01kQjhuUE0wc2ovdWtKcVhEQ01wKy85eHgyUk82?=
 =?utf-8?B?WHRiYVJYVFVCSmFJNE9yaW5RVGhueTl3MTBxMzNIMVN0elBsazB6REQ3S0xs?=
 =?utf-8?B?NCs4LzZGZEJKdW9oQVFCNUhpbTQ3RGxRSW5zTUZwR0RCWlFFTUk4Vnl2TXhG?=
 =?utf-8?B?b0ZzTmFqZzFQVnBNamY1VVNLYUhPblJCWDVJbHFablRaRG9ob0RJbFY2eGo4?=
 =?utf-8?B?bjRrNCtZeW9tMEJSQXNENmpTUWFvbmV6RUYyMzY3VWdUVmZGQVFJS1FFOEJ3?=
 =?utf-8?B?bVFBU21lNzBWajZYOWZVYkN6cDlZak1vbHBad1hUUVcyU2VRQmhEMWpsemU0?=
 =?utf-8?B?VmN5citoczNsb2F2UkFZMCtUZWpFNjZMK21zN0tQTHFGUHpzd2poYTluOXZZ?=
 =?utf-8?B?bkVWejRZekVFZnoyb2xOdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEFESFRmSCtGamhjUUNSKzhqd21wQS9pWXZxdnh5MitPTXFxNThzWVdPR3hT?=
 =?utf-8?B?cy9XQ2pSL1dWai9PNkEva0cyUFNRZVAzYTVTaVo4MGFaS1VJQzNHRmJ1T09w?=
 =?utf-8?B?YTV1T0Z0cThJY1hYZ295U2V5enMvQmFNbTc3c1V5QjlaZDcxcUJPSlgrZ3dh?=
 =?utf-8?B?UUtUUGo0WlhpL08rYzRtNTR6VEFzWTR5NXBIU3pqNkgxN2tJVUFjNzYvSVZC?=
 =?utf-8?B?NENXUGVRMDhNdjZuakNBWkVzNkUrLzZ0dlhjcTJkek9WbWwvV2dwbXlZK3R5?=
 =?utf-8?B?VlZ4TXJ0UGxqcDRnclYwRWxRV1Y1cU5pSWtjcHRzZ2RYOFpZaldJQmdZK0dx?=
 =?utf-8?B?YkNnZ0ltaGs0cDhUZ1JDL3hhWW9JMWV6V2VqRXIvTStnOEpFQ0w4VHlCcWto?=
 =?utf-8?B?RGN6VWZ0WUowaDh4SVVsSmdtdGdYVVdmSlZYYll0UkhybkRKbUJSY1gxOHZu?=
 =?utf-8?B?eXRGcGNkMUJqeXVWcSs5OVgya0J0VTdFYmVwQlBsYThFbmZVRWZVRjNIdVYr?=
 =?utf-8?B?U2FRZ3ZqQ0ZtVk1mY1NPR0VJcjVZWEdJSFg3S1k5NVplSTJkUnIzUy9mUTJr?=
 =?utf-8?B?RzhlMUlxL0Ztbm1Id290V1pJM1dnNHFyTFdvUytxNklucEErRW1DSkc4ZEpL?=
 =?utf-8?B?RE05cWtjdFg4S1c5bThDWXUwQ1d3a1lxM2YvZ1FkeU96MlZXU1lKRWhLNVA4?=
 =?utf-8?B?eXpsY29YMFJBR05kMGw2dXk3VlFmYlVYbnY3V2RWTUpBdi9tWk5KcWgxWTFP?=
 =?utf-8?B?Z2JSMzYrRE9qbHc3alJFbDdTTkdrS1crK1NBUEpYUCtyWmloUHlWWHJVaW9Y?=
 =?utf-8?B?ZmVCM3REMEhGTzJEWkZSN3FDZzZlSHl4MHlFNUxTTWF3VEphcG0yZkdGWjYy?=
 =?utf-8?B?WlFCNlVjZkN4L3VIMStZQytCMWdwaHV1bFEvVUhKbHVoQzREdThhZ0pIYndN?=
 =?utf-8?B?NG54ODY3djJXWmh0Y2V5eEJDR2JhTTBiOUJFTWp3N0F5NmRsU25yWWtTQndF?=
 =?utf-8?B?SHltNUMzM1JBRDFTdnpDNXlBSmJ6a2FQd085Q0x6a2VxWi9XeDdHZUhXNHpn?=
 =?utf-8?B?N2Vody9OWGdSSkRjUWU3OWFXaExCazVYSHQzS1phb3hYN1pMMFJ1V2hQREh1?=
 =?utf-8?B?WFdnRmkvOWtjNTBuVTRuQzg0RkZrMTY4Nldha1A3amJQWnc2aC9kVXhUaWZ3?=
 =?utf-8?B?cjc2dU5IcWQxM1Z2MHdxa2o1NGtHZExpVFJSYlE5ZmhaUUJYL1g2cUtFMHVP?=
 =?utf-8?B?ejV1dmliRlRvUVRKMkF5NlR6TVZicmVHdTBLejVEUjFzL3BmYTNKQmM0YTEy?=
 =?utf-8?B?aEpmQ0dzMC9hQzd6VUdqTEJRQXpXOXVRM0RvTk5oL0JVMWdUYTM3RGNydTRK?=
 =?utf-8?B?c3ZjelNpUm85SStMZTA0V2p3MkJGMjJZV1VoNkc0ZzhmVVl2UzQ1SkVSR3dN?=
 =?utf-8?B?L2RSdE9KVzBid3phMVhyWDRIY2l1Ykxqa1pwVWVHVW5odmNlRmdGTThib2lN?=
 =?utf-8?B?TXFTU3VHNlc0R1hnU2xCaEQxVmNGZnVLTjhKNEVRdUUzaUxRaGtEbkJGano2?=
 =?utf-8?B?R0xVLy9NYmJWeFVJdEFiTGxVOC92WmJMMTJJeTc2RHl1aHpwK0Z3ZHhyV0Nv?=
 =?utf-8?B?NlJVOHJMYlF2Mnc3WEVCaG1yTnY0cFc5UVp4eEpITzBzYzFJMzhKV3hOMHI0?=
 =?utf-8?B?bW5USlVVYTMyRDBiNnMvVXJQOW1IUXY4R2RvUUNic3BacGFsTGIxM1NjbjdC?=
 =?utf-8?B?U2U1TUFSUW1UZTgyUGRHeGJwcUxGNFFNODN1bmpRdW5lN09BNm9sTDBuS1FY?=
 =?utf-8?B?WEZSdDdrSkRBOFRzTzBneWxJbGRVUVUxU2k5ZndDMnBVTHMxcUI1c28xS20x?=
 =?utf-8?B?TkFGZ1pxV21CVzhhVW1QdUdiQ25wUWloV2I5MmhpUGRCNTRzR1Y0aUx3cG9T?=
 =?utf-8?B?SmZDLzNaVkVYYXVVUlJ5dyszdWVDcFJFckgxSEZ2YU12NHdxNEdEdjRRNXFi?=
 =?utf-8?B?Q2k1cEFsQ3RqSVFIcWVPMEExKzcyVzZ0TlVLeUFxby82dUhocThqbGg0YkVz?=
 =?utf-8?B?ZWQzaGh0RUdzQ2ZqKytIV1RVSWNzU2NPNktsdkI2WmhkTURSdWdiWnppRXE1?=
 =?utf-8?Q?GD3RXsMhILk9E+hw8D3qewogj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 642ecd01-5b7f-495c-8498-08dcb072ee6a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 08:38:05.3177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6pz6+mt4D21pKXbUMLzk4DCJzkTY3OLmm1cW/C0UR4AdCR4AIUugV/zzVX5YnMb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7453
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

Am 30.07.24 um 10:14 schrieb Huan Yang:
> 在 2024/7/30 16:03, Christian König 写道:
>> Am 30.07.24 um 09:57 schrieb Huan Yang:
>>> Background
>>> ====
>>> Some user may need load file into dma-buf, current way is:
>>>    1. allocate a dma-buf, get dma-buf fd
>>>    2. mmap dma-buf fd into user vaddr
>>>    3. read(file_fd, vaddr, fsz)
>>> Due to dma-buf user map can't support direct I/O[1], the file read
>>> must be buffer I/O.
>>>
>>> This means that during the process of reading the file into dma-buf,
>>> page cache needs to be generated, and the corresponding content 
>>> needs to
>>> be first copied to the page cache before being copied to the dma-buf.
>>>
>>> This way worked well when reading relatively small files before, as
>>> the page cache can cache the file content, thus improving performance.
>>>
>>> However, there are new challenges currently, especially as AI models 
>>> are
>>> becoming larger and need to be shared between DMA devices and the CPU
>>> via dma-buf.
>>>
>>> For example, our 7B model file size is around 3.4GB. Using the
>>> previous would mean generating a total of 3.4GB of page cache
>>> (even if it will be reclaimed), and also requiring the copying of 3.4GB
>>> of content between page cache and dma-buf.
>>>
>>> Due to the limited resources of system memory, files in the gigabyte 
>>> range
>>> cannot persist in memory indefinitely, so this portion of page cache 
>>> may
>>> not provide much assistance for subsequent reads. Additionally, the
>>> existence of page cache will consume additional system resources due to
>>> the extra copying required by the CPU.
>>>
>>> Therefore, I think it is necessary for dma-buf to support direct I/O.
>>>
>>> However, direct I/O file reads cannot be performed using the buffer
>>> mmaped by the user space for the dma-buf.[1]
>>>
>>> Here are some discussions on implementing direct I/O using dma-buf:
>>>
>>> mmap[1]
>>> ---
>>> dma-buf never support user map vaddr use of direct I/O.
>>>
>>> udmabuf[2]
>>> ---
>>> Currently, udmabuf can use the memfd method to read files into
>>> dma-buf in direct I/O mode.
>>>
>>> However, if the size is large, the current udmabuf needs to adjust the
>>> corresponding size_limit(default 64MB).
>>> But using udmabuf for files at the 3GB level is not a very good 
>>> approach.
>>> It needs to make some adjustments internally to handle this.[3] Or 
>>> else,
>>> fail create.
>>>
>>> But, it is indeed a viable way to enable dma-buf to support direct I/O.
>>> However, it is necessary to initiate the file read after the memory 
>>> allocation
>>> is completed, and handle race conditions carefully.
>>>
>>> sendfile/splice[4]
>>> ---
>>> Another way to enable dma-buf to support direct I/O is by implementing
>>> splice_write/write_iter in the dma-buf file operations (fops) to adapt
>>> to the sendfile method.
>>> However, the current sendfile/splice calls are based on pipe. When 
>>> using
>>> direct I/O to read a file, the content needs to be copied to the buffer
>>> allocated by the pipe (default 64KB), and then the dma-buf fops'
>>> splice_write needs to be called to write the content into the dma-buf.
>>> This approach requires serially reading the content of file pipe size
>>> into the pipe buffer and then waiting for the dma-buf to be written
>>> before reading the next one.(The I/O performance is relatively weak
>>> under direct I/O.)
>>> Moreover, due to the existence of the pipe buffer, even when using
>>> direct I/O and not needing to generate additional page cache,
>>> there still needs to be a CPU copy.
>>>
>>> copy_file_range[5]
>>> ---
>>> Consider of copy_file_range, It only supports copying files within the
>>> same file system. Similarly, it is not very practical.
>>>
>>>
>>> So, currently, there is no particularly suitable solution on VFS to
>>> allow dma-buf to support direct I/O for large file reads.
>>>
>>> This patchset provides an idea to complete file reads when requesting a
>>> dma-buf.
>>>
>>> Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
>>> ===
>>> This patch provides a method to immediately read the file content after
>>> the dma-buf is allocated, and only returns the dma-buf file descriptor
>>> after the file is fully read.
>>>
>>> Since the dma-buf file descriptor is not returned, no other thread can
>>> access it except for the current thread, so we don't need to worry 
>>> about
>>> race conditions.
>>
>> That is a completely false assumption.
> Can you provide a detailed explanation as to why this assumption is 
> incorrect? thanks.

File descriptors can be guessed and is available to userspace as soon as 
dma_buf_fd() is called.

What could potentially work is to call system_heap_allocate() without 
calling dma_buf_fd(), but I'm not sure if you can then make I/O to the 
underlying pages.

>>
>>>
>>> Map the dma-buf to the vmalloc area and initiate file reads in kernel
>>> space, supporting both buffer I/O and direct I/O.
>>>
>>> This patch adds the DMA_HEAP_ALLOC_AND_READ heap_flag for user.
>>> When a user needs to allocate a dma-buf and read a file, they should
>>> pass this heap flag. As the size of the file being read is fixed, 
>>> there is no
>>> need to pass the 'len' parameter. Instead, The file_fd needs to be 
>>> passed to
>>> indicate to the kernel the file that needs to be read.
>>>
>>> The file open flag determines the mode of file reading.
>>> But, please note that if direct I/O(O_DIRECT) is needed to read the 
>>> file,
>>> the file size must be page aligned. (with patch 2-5, no need)
>>>
>>> Therefore, for the user, len and file_fd are mutually exclusive,
>>> and they are combined using a union.
>>>
>>> Once the user obtains the dma-buf fd, the dma-buf directly contains the
>>> file content.
>>
>> And I'm repeating myself, but this is a complete NAK from my side to 
>> this approach.
>>
>> We pointed out multiple ways of how to implement this cleanly and not 
>> by hacking functionality into the kernel which absolutely doesn't 
>> belong there.
> In this patchset, I have provided performance comparisons of each of 
> these methods.  Can you please provide more opinions?

Either drop the whole approach or change udmabuf to do what you want to do.

Apart from that I don't see a doable way which can be accepted into the 
kernel.

Regards,
Christian.

>>
>> Regards,
>> Christian.
>>
>>>
>>> Patch 1 implement it.
>>>
>>> Patch 2-5 provides an approach for performance improvement.
>>>
>>> The DMA_HEAP_ALLOC_AND_READ_FILE heap flag patch enables us to
>>> synchronously read files using direct I/O.
>>>
>>> This approach helps to save CPU copying and avoid a certain degree of
>>> memory thrashing (page cache generation and reclamation)
>>>
>>> When dealing with large file sizes, the benefits of this approach 
>>> become
>>> particularly significant.
>>>
>>> However, there are currently some methods that can improve performance,
>>> not just save system resources:
>>>
>>> Due to the large file size, for example, a AI 7B model of around 
>>> 3.4GB, the
>>> time taken to allocate DMA-BUF memory will be relatively long. Waiting
>>> for the allocation to complete before reading the file will add to the
>>> overall time consumption. Therefore, the total time for DMA-BUF
>>> allocation and file read can be calculated using the formula
>>>     T(total) = T(alloc) + T(I/O)
>>>
>>> However, if we change our approach, we don't necessarily need to wait
>>> for the DMA-BUF allocation to complete before initiating I/O. In fact,
>>> during the allocation process, we already hold a portion of the page,
>>> which means that waiting for subsequent page allocations to complete
>>> before carrying out file reads is actually unfair to the pages that 
>>> have
>>> already been allocated.
>>>
>>> The allocation of pages is sequential, and the reading of the file is
>>> also sequential, with the content and size corresponding to the file.
>>> This means that the memory location for each page, which holds the
>>> content of a specific position in the file, can be determined at the
>>> time of allocation.
>>>
>>> However, to fully leverage I/O performance, it is best to wait and
>>> gather a certain number of pages before initiating batch processing.
>>>
>>> The default gather size is 128MB. So, ever gathered can see as a 
>>> file read
>>> work, it maps the gather page to the vmalloc area to obtain a 
>>> continuous
>>> virtual address, which is used as a buffer to store the contents of the
>>> corresponding file. So, if using direct I/O to read a file, the file
>>> content will be written directly to the corresponding dma-buf buffer 
>>> memory
>>> without any additional copying.(compare to pipe buffer.)
>>>
>>> Consider other ways to read into dma-buf. If we assume reading after 
>>> mmap
>>> dma-buf, we need to map the pages of the dma-buf to the user virtual
>>> address space. Also, udmabuf memfd need do this operations too.
>>> Even if we support sendfile, the file copy also need buffer, you must
>>> setup it.
>>> So, mapping pages to the vmalloc area does not incur any additional
>>> performance overhead compared to other methods.[6]
>>>
>>> Certainly, the administrator can also modify the gather size through 
>>> patch5.
>>>
>>> The formula for the time taken for system_heap buffer allocation and
>>> file reading through async_read is as follows:
>>>
>>>    T(total) = T(first gather page) + Max(T(remain alloc), T(I/O))
>>>
>>> Compared to the synchronous read:
>>>    T(total) = T(alloc) + T(I/O)
>>>
>>> If the allocation time or I/O time is long, the time difference will be
>>> covered by the maximum value between the allocation and I/O. The other
>>> party will be concealed.
>>>
>>> Therefore, the larger the size of the file that needs to be read, the
>>> greater the corresponding benefits will be.
>>>
>>> How to use
>>> ===
>>> Consider the current pathway for loading model files into DMA-BUF:
>>>    1. open dma-heap, get heap fd
>>>    2. open file, get file_fd(can't use O_DIRECT)
>>>    3. use file len to allocate dma-buf, get dma-buf fd
>>>    4. mmap dma-buf fd, get vaddr
>>>    5. read(file_fd, vaddr, file_size) into dma-buf pages
>>>    6. share, attach, whatever you want
>>>
>>> Use DMA_HEAP_ALLOC_AND_READ_FILE JUST a little change:
>>>    1. open dma-heap, get heap fd
>>>    2. open file, get file_fd(buffer/direct)
>>>    3. allocate dma-buf with DMA_HEAP_ALLOC_AND_READ_FILE heap flag, 
>>> set file_fd
>>>       instead of len. get dma-buf fd(contains file content)
>>>    4. share, attach, whatever you want
>>>
>>> So, test it is easy.
>>>
>>> How to test
>>> ===
>>> The performance comparison will be conducted for the following 
>>> scenarios:
>>>    1. normal
>>>    2. udmabuf with [3] patch
>>>    3. sendfile
>>>    4. only patch 1
>>>    5. patch1 - patch4.
>>>
>>> normal:
>>>    1. open dma-heap, get heap fd
>>>    2. open file, get file_fd(can't use O_DIRECT)
>>>    3. use file len to allocate dma-buf, get dma-buf fd
>>>    4. mmap dma-buf fd, get vaddr
>>>    5. read(file_fd, vaddr, file_size) into dma-buf pages
>>>    6. share, attach, whatever you want
>>>
>>> UDMA-BUF step:
>>>    1. memfd_create
>>>    2. open file(buffer/direct)
>>>    3. udmabuf create
>>>    4. mmap memfd
>>>    5. read file into memfd vaddr
>>>
>>> Sendfile step(need suit splice_write/write_iter, just use to compare):
>>>    1. open dma-heap, get heap fd
>>>    2. open file, get file_fd(buffer/direct)
>>>    3. use file len to allocate dma-buf, get dma-buf fd
>>>    4. sendfile file_fd to dma-buf fd
>>>    6. share, attach, whatever you want
>>>
>>> patch1/patch1-4:
>>>    1. open dma-heap, get heap fd
>>>    2. open file, get file_fd(buffer/direct)
>>>    3. allocate dma-buf with DMA_HEAP_ALLOC_AND_READ_FILE heap flag, 
>>> set file_fd
>>>       instead of len. get dma-buf fd(contains file content)
>>>    4. share, attach, whatever you want
>>>
>>> You can create a file to test it. Compare the performance gap 
>>> between the two.
>>> It is best to compare the differences in file size from KB to MB to GB.
>>>
>>> The following test data will compare the performance differences 
>>> between 512KB,
>>> 8MB, 1GB, and 3GB under various scenarios.
>>>
>>> Performance Test
>>> ===
>>>    12G RAM phone
>>>    UFS4.0(the maximum speed is 4GB/s. ),
>>>    f2fs
>>>    kernel 6.1 with patch[7] (or else, can't support kvec direct I/O 
>>> read.)
>>>    no memory pressure.
>>>    drop_cache is used for each test.
>>>
>>> The average of 5 test results:
>>> | scheme-size         | 512KB(ns)  | 8MB(ns)    | 1GB(ns) | 
>>> 3GB(ns)       |
>>> | ------------------- | ---------- | ---------- | ------------- | 
>>> ------------- |
>>> | normal              | 2,790,861  | 14,535,784 | 1,520,790,492 | 
>>> 3,332,438,754 |
>>> | udmabuf buffer I/O  | 1,704,046  | 11,313,476 | 821,348,000 | 
>>> 2,108,419,923 |
>>> | sendfile buffer I/O | 3,261,261  | 12,112,292 | 1,565,939,938 | 
>>> 3,062,052,984 |
>>> | patch1-4 buffer I/O | 2,064,538  | 10,771,474 | 986,338,800 | 
>>> 2,187,570,861 |
>>> | sendfile direct I/O | 12,844,231 | 37,883,938 | 5,110,299,184 | 
>>> 9,777,661,077 |
>>> | patch1 direct I/O   | 813,215    | 6,962,092  | 2,364,211,877 | 
>>> 5,648,897,554 |
>>> | udmabuf direct I/O  | 1,289,554  | 8,968,138  | 921,480,784 | 
>>> 2,158,305,738 |
>>> | patch1-4 direct I/O | 1,957,661  | 6,581,999  | 520,003,538 | 
>>> 1,400,006,107 |
>
> With this test, sendfile can't give a good help base on pipe buffer.
>
> udmabuf is good, but I think our oem driver can't suit it. (And, AOSP 
> do not open this feature)
>
>
> Anyway, I am sending this patchset in the hope of further discussion.
>
> Thanks.
>
>>>
>>> So, based on the test results:
>>>
>>> When the file is large, the patchset has the highest performance.
>>> Compared to normal, patchset is a 50% improvement;
>>> Compared to normal, patch1 only showed a degradation of 41%.
>>> patch1 typical performance breakdown is as follows:
>>>    1. alloc cost 188,802,693 ns
>>>    2. vmap cost 42,491,385 ns
>>>    3. file read cost 4,180,876,702 ns
>>> Therefore, directly performing a single direct I/O read on a large file
>>> may not be the most optimal way for performance.
>>>
>>> The performance of direct I/O implemented by the sendfile method is 
>>> the worst.
>>>
>>> When file size is small, The difference in performance is not
>>> significant. This is consistent with expectations.
>>>
>>>
>>>
>>> Suggested use cases
>>> ===
>>>    1. When there is a need to read large files and system resources 
>>> are scarce,
>>>       especially when the size of memory is limited.(GB level) In this
>>>       scenario, using direct I/O for file reading can even bring 
>>> performance
>>>       improvements.(may need patch2-3)
>>>    2. For embedded devices with limited RAM, using direct I/O can 
>>> save system
>>>       resources and avoid unnecessary data copying. Therefore, even 
>>> if the
>>>       performance is lower when read small file, it can still be used
>>>       effectively.
>>>    3. If there is sufficient memory, pinning the page cache of the 
>>> model files
>>>       in memory and placing file in the EROFS file system for 
>>> read-only access
>>>       maybe better.(EROFS do not support direct I/O)
>>>
>>>
>>> Changlog
>>> ===
>>>   v1 [8]
>>>   v1->v2:
>>>     Uses the heap flag method for alloc and read instead of adding a 
>>> new
>>>     DMA-buf ioctl command. [9]
>>>     Split the patchset to facilitate review and test.
>>>       patch 1 implement alloc and read, offer heap flag into it.
>>>       patch 2-4 offer async read
>>>       patch 5 can change gather limit.
>>>
>>> Reference
>>> ===
>>> [1] 
>>> https://lore.kernel.org/all/0393cf47-3fa2-4e32-8b3d-d5d5bdece298@amd.com/
>>> [2] https://lore.kernel.org/all/ZpTnzkdolpEwFbtu@phenom.ffwll.local/
>>> [3] https://lore.kernel.org/all/20240725021349.580574-1-link@vivo.com/
>>> [4] https://lore.kernel.org/all/Zpf5R7fRZZmEwVuR@infradead.org/
>>> [5] https://lore.kernel.org/all/ZpiHKY2pGiBuEq4z@infradead.org/
>>> [6] 
>>> https://lore.kernel.org/all/9b70db2e-e562-4771-be6b-1fa8df19e356@amd.com/
>>> [7] 
>>> https://patchew.org/linux/20230209102954.528942-1-dhowells@redhat.com/20230209102954.528942-7-dhowells@redhat.com/
>>> [8] https://lore.kernel.org/all/20240711074221.459589-1-link@vivo.com/
>>> [9] 
>>> https://lore.kernel.org/all/5ccbe705-883c-4651-9e66-6b452c414c74@amd.com/
>>>
>>> Huan Yang (5):
>>>    dma-buf: heaps: Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
>>>    dma-buf: heaps: Introduce async alloc read ops
>>>    dma-buf: heaps: support alloc async read file
>>>    dma-buf: heaps: system_heap alloc support async read
>>>    dma-buf: heaps: configurable async read gather limit
>>>
>>>   drivers/dma-buf/dma-heap.c          | 552 
>>> +++++++++++++++++++++++++++-
>>>   drivers/dma-buf/heaps/system_heap.c |  70 +++-
>>>   include/linux/dma-heap.h            |  53 ++-
>>>   include/uapi/linux/dma-heap.h       |  11 +-
>>>   4 files changed, 673 insertions(+), 13 deletions(-)
>>>
>>>
>>> base-commit: 931a3b3bccc96e7708c82b30b2b5fa82dfd04890
>>

