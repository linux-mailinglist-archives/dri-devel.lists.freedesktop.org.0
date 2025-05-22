Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF366AC0CA5
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 15:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE6E10E9AF;
	Thu, 22 May 2025 13:24:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MeO0q7mo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CE910E9AF;
 Thu, 22 May 2025 13:24:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbpyGrtv39o936/ft6ppz97rcllhnHHzzKiE+rc/TyuySEFZg60SCRqTfFjZXLcTTQ3lB7MdkTeoBHPPZc2pdEARNVWC9ZB9Urvw2S1wR1d+KqAZUdnqQRY2p5OWk/oN7VXHloQq3kLiYQdVRIqe5W5FvGEXL/UcJ8OiaZoUtXqKS8KUUpKbL48mNdRjZmRSac/GDbnyOBv5Vfi/aSqkq5QKL28IcUfmcYAvZRPVQjmqHC/CSQtV0dTY5rmPhjdZTQpuSqW738EaKSEFOAVA29B26e5TvPWTDxta7b/M2NmGZ+hsFWpKsg0SqnNvxJ3ycXKF043wFxGcy6jXXUpmbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7YlF0KZACNqxSiVgbF5eZ1W1FRlphmk3rs0D1HRgY8=;
 b=AJKjv6O50KGZA1L8POBAgrZyTKA0rd35xP9mDjlRS4/eOHarV1VFcMAsr7Y2UM7THR1prqIg46H/jGZIt6GpnKk68JycIEDCW+bbNUY1qSPEwqvpu6VHUNigbUr4Atj9NSCmpj1znHn0XIBPzdVofLV0JZkE1Y2L4YcxXw/UYsSzMH06FbawUfTYViaKP9Vsxwf4WS2Cu3d6WznSLULm5RF73YXzC3OqB+tM5d1AstweYhr3pcOOD21sGESfJgf0WN7ocPFyTgVYsdTh6aPwUFfTaG/pQgRT5LXnqFI+TLJe8FC4tPno5avnzmBCwWaXBNSdTNDShpR6ZCAdaiZQeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7YlF0KZACNqxSiVgbF5eZ1W1FRlphmk3rs0D1HRgY8=;
 b=MeO0q7mo9Ftiu+lQkexoN4pa+HqAZGtH0SOAUqBoMHjOod4MlQxZDLvqsgd++1fv+VVAdpW8O/Jzshfpl5l9L0bRBY3XZaTEoybjEJCjE0ZLePhBRzxj/gCp8Uxa21s3sxROAN+qf24t5anmg8DTrdeCoJm3PqY8LCQVDwSR8nI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB7247.namprd12.prod.outlook.com (2603:10b6:806:2bb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 22 May
 2025 13:24:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 13:24:35 +0000
Message-ID: <dcc9f52a-4f46-4f24-bb33-b3af583a1956@amd.com>
Date: Thu, 22 May 2025 15:24:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence
 context
To: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250522112540.161411-2-phasta@kernel.org>
 <20250522112540.161411-3-phasta@kernel.org>
 <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
 <06210b9dc5e5ea8365295b77942c3ca030f02729.camel@mailbox.org>
 <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com> <aC8fpEXYWZ9Oy41J@pollux>
 <ebedece4-9758-47e9-b621-37b40e3f0fc3@amd.com>
 <282de2b9251e3a1b793e02ef23675dace248725b.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <282de2b9251e3a1b793e02ef23675dace248725b.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0322.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::27) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b12b684-38db-4fdf-2ebc-08dd9933fee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFlqa1htcEVHdnVtRUN1T3ZLcFFzVjhTUUxvYVM1T21heHgxYzdrbklpeE01?=
 =?utf-8?B?eDBRYW5Fbkp4aFRiRE5sSUJ3SzRiSm83UkxiNkU4aVZLODVzeHpFRmx0M0Za?=
 =?utf-8?B?WXJqbENsejhkYmxyajk2MjVxb1dYb0JJUXNpM2F6cXJaZGdFbnA4Zjl4UWZ4?=
 =?utf-8?B?OUlRMEplb1JRMk5WOG5HSG01WEFSR05pUVJEZnFBc3dSK0xIN1BhaU80eTV5?=
 =?utf-8?B?MGFNNVdSZjFOZ1dPTXN3Z01MQnd6ajR2YXRPSzhRUUlQVk1qNGZYTm44c0ZX?=
 =?utf-8?B?bGtIS3IvQVliSnk1M1gzN1BiZ3Z6V3hWRU5hU094cVM3dDBTSU84UU9jTnAw?=
 =?utf-8?B?RW5rNlFaditoWG9uelVkNWdpbytJZEJ4d2h3RmVva3pXcmRZWTFpbGtrZDJn?=
 =?utf-8?B?b3JndmlaSlowNnczYjNEQXJqUnMvRFc2U0pva0JlRFdXVGU0TjRkSDZOV0No?=
 =?utf-8?B?eFJjNC9BaW1vZVlETjB5UEhOQTJ6RHZvMWwxVk9SblQ1QnoyWWtUM2NWTnRD?=
 =?utf-8?B?dkxYK2lBSDBKeG0rT0dYdEtMUkxBdDBCSWJnZ1ZNenJyU05hamgwYWNydVJi?=
 =?utf-8?B?WFlCTi81amV4R0RoRU1DdEttejRWQk5JN2Y2RitlTk1PczBpRWpNNEdNY0V6?=
 =?utf-8?B?Lys1TWlPdTJCN2phLzBJMFlXQmJBUktPWXJxOU43WFUyNVc5WVV1RlFjN3B6?=
 =?utf-8?B?cDVYNnM2cFJDc1lEeHdoc0I0VDdCQlhQb0RaVnl6TlZJVitZZHh3UTNsazJy?=
 =?utf-8?B?QmYyelMxQ1FIZHp1ZjRPa0N1dTlWY21NREtkSmN2ZHExRUJISlBRZVhGSU9j?=
 =?utf-8?B?T001NU1HRmRFcXNvQlRidlhjeWFQNVFkc3NhcThRQVBkckZjRXpCeWQ0L0tm?=
 =?utf-8?B?Nzl5OWR0MUp6UHR4cGJjNUtBRnRpaGdsMm0ydDdMSnZFSFFMTkFTSVJKRkZZ?=
 =?utf-8?B?c2ZmTys1YzNpb1F0c2FiNmptMU9ZekZkNDBhSkowZG0va2orWkczVkZOUGo3?=
 =?utf-8?B?ZWo4OWYva2ZQTjEwQVI5UG15RHIwSTRxOEVndmpqNExvdnVKdElKY1hudEY4?=
 =?utf-8?B?WEhmYUptUnlNM1J5SU1vRmZGREl5d21RWldaZVRPaHRtYVZVZW42Sk5Gc2N0?=
 =?utf-8?B?allBSHR2TmhFKzhpcVZ3c3lBQWNTakp5S3FrQThJZGlDNlMxak5Ddm12dmN5?=
 =?utf-8?B?OEJITEYzaCtWWnRmRk51cE03Z3RTRWRnaEprMFY0cjZBcWhBSnJzcm1JOE5q?=
 =?utf-8?B?N1hGR25FSEVDWDJoUDRUaTlrWHUzZnB6M0NkWU02Vm56TFJtZUFzVkdhNlpy?=
 =?utf-8?B?Y2xFVFducG9HY0RQUko3ZXQxMUI0aXdSMlR1cVNjbHg1R25FZzYwcnpyOWtR?=
 =?utf-8?B?MTM0blVNTVljUFBSTXM5UE5zQ3JUSEx5bnV3QmRVWEt5MENaa2xHRlNqU0J0?=
 =?utf-8?B?aUh6TFM0QW1zSGJuaElOR005SzlnNlJFRHQ3OXliVzhIK1Q2UWJFdGNSREFG?=
 =?utf-8?B?YzExTEgxNittVVRDSHlGOFBXMlp4TVUxd2NFd3l5Wk9LUEpRb2hTZlh2NldQ?=
 =?utf-8?B?TGp1MGUyS2VZUVg4QUZNaEhremNmV01ZRnZybXhncjZjaVhIaFU0REt1WVZi?=
 =?utf-8?B?UHVmYzY4TTBDRXFtRUpXREorNlRJMWpzS1BLbUJKYktUWVZCWlMyZC93Tm9G?=
 =?utf-8?B?dlJqRldkSUJaWDhqd0wzalordVorczQveER5YlZEbjFDUloxK2VaZTkzNnFa?=
 =?utf-8?B?QUxqa3UySVNGZ2pnSkl0S2gxNTNMcVNpdkM5enBTQ1krNklaaTRWT2Mvam1t?=
 =?utf-8?B?d0E4eFlCT0xtdGoydTcxRzROTmVPcjFISlZXUkRidkFYQ2dhWkpJMlFDcklE?=
 =?utf-8?B?TGxHbUtaK0VHOWhGTk5paW1oMlRXd1k4VWQ3MnU4Zm80dUl0YkNQRm52R0lo?=
 =?utf-8?Q?3Y3s5qqyvcY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzZJNWErOHYzMWxCY21TQlJTM3paalpYVFVncjdqVFpneVF5UUhqMHcyd1hi?=
 =?utf-8?B?RHlCVTU4RStJaTRibmNnSUtrb2ZjWGkwUGp3SUcyR2pqZTlwNnNrRGhUck5R?=
 =?utf-8?B?aXdoN0ZnNGg5VUczNWVROTF3RkJ1djB4Slhocml0NlZQOVNJTUlwZmdZblFr?=
 =?utf-8?B?eFlzcGJPaTAyUVVIQXBIVk9FTWM2K0h5bkdhalpQNlQ4Vmg0QVAya3pXU1c4?=
 =?utf-8?B?eHl2VGsrTzlhUUdqWFNKb2gvaUFzbEFFd09vdHVaYWhBY1FKeUt6cU83NG95?=
 =?utf-8?B?akJSaytGb3BmM1J4aUdWcFdsdnVwclZSbnlwMmFOcHp6bnNLV0duRGtTNEJT?=
 =?utf-8?B?aitFOHl3bDVqZjdmeUhuQmtkWFVnRnpNd1JpU0Q1dXpnRkVlNVVCQkxoOVdV?=
 =?utf-8?B?WUdscVFJRVp3cjZPbXM5RWxadGZ6ZW4yOHlBRzQ1a3czYnBHdFN5M3A3cW9o?=
 =?utf-8?B?a2luUjdtVjJrdStoWDFzd2w3UzhDb2I4bXRYMmFwS3lRWWNKUzErdHk0S3dI?=
 =?utf-8?B?WFpCNW16a2R0MlNaVU5CL2FNdHp3Y05YKzI2ZDdIUUsrb1U5STVjWDJCUEhE?=
 =?utf-8?B?STdwc28wMjF3cnhaYldnWm1JWHNaKzdDeEs4dG5pTjBTTkRBamN1RDZ3SjQy?=
 =?utf-8?B?dzdYb1gyd3ZSVlN2Wkx0WXlTRTZWaVN5KzY0MGFTeWgwRE4rN1ppa2NNQnY2?=
 =?utf-8?B?NmRqaDdiUzNubXl2US9leHN2R3B3S0FweWJQVU5oaHVMUHg0UVhROWhsZnFs?=
 =?utf-8?B?NS9ON21meXA2ekwrTVIvRVJONEM1RlIvQWJ1dW9ZZWpXMzBpNTZDeVJCdUtw?=
 =?utf-8?B?V3hsVS9jcmZjbmsvUUFXazZJRVlQUUU5TWpUOTdwN3Y4SDk0NEtybFlQS3kr?=
 =?utf-8?B?UGlZSGtieFFGeGc4eXZtU1pFSlNGelUzdGh1OXFEUGdYT3JPQlNUUmRDMXFT?=
 =?utf-8?B?WWUxMEkvSzd6VU0vL1Y4eFVQazY2MytMa1pwbjJ2TWFPTFl6Zkh2ZExoaW5M?=
 =?utf-8?B?c1VKdlZBVnluZW91Szl4VXNROHpOa0x2RldZeCtrajlTNjVXT1N3NVdqRUdu?=
 =?utf-8?B?VEx1cEdndEREOGE3dnFhaUwrRkRaMXBXRk5zUm5VNmMweENKdmQvdXFNMXl1?=
 =?utf-8?B?NXBIWHdNZFR0elNPRFIyV3Y0VjdHL0xKWGFYNzdtQ0hEdmdNNTFQV2dsalZF?=
 =?utf-8?B?SFhab09mdjVNdVl2OHRUa0FTcUJoUHJyUk5rczlSdWpZRS9vUnhaZko4T1E2?=
 =?utf-8?B?bGpXL3ordjlMZUFzRFdweUFNMk9WZXhiMHZTQzRIeWQ2cFMwMlBXeDNjZndL?=
 =?utf-8?B?OStUTW5LMkcvTEkrQWtBNDl6ak5MaVlBTnRocDYzQllqd2Q3WFpZZ2V4bW1V?=
 =?utf-8?B?SENSQlRJdzBlaVhoTEZEYmcrZjNpMndjWUNva29tU3dhRHpiN3QzS1Z5YVEx?=
 =?utf-8?B?Q1RBQW5rUlg4VVFWV01OTEk2YVg5ekpZQlFLa2wxREF0Qmo4bGFGQzg5emtz?=
 =?utf-8?B?LzJ0YW05OER0eXBpQkdNZzRYb0hMNTVEelczQno4cVp1OEJBajNaSWJXdWg1?=
 =?utf-8?B?akN5dVp3WTJrMXdieS96MTRqSFRuWlM2S252OTViVTdQbzVEQytFSzVLYi9a?=
 =?utf-8?B?dmxPRlhxdFFGcmxTS2czcjl2Z1lkTkNEZlFuUmFQd2lLMzFRQUhIeDd3eHNO?=
 =?utf-8?B?R3ZDeFMyd0tmaDVmdEp3Yng0UHRBeURqZzM4TVR4UjIwS2RTOVZZZktubkor?=
 =?utf-8?B?aHFTRW1GUkpnYWd5UU9NcWQxSWhBc2ZPUGNuUUdYaUdaT1g5dmRxc1Jud2kr?=
 =?utf-8?B?MFgrcEpXYnVDTlJIS013SFR1Qk9XUHJDZlI2b0Vld0kzbzVVTFhuOG5MVWxl?=
 =?utf-8?B?Z0EvU2FzSFlSc2x2NEIrZHFwRTJOazY3OTFHSHdHQ2Ztam1uN3pjaWZzc0lO?=
 =?utf-8?B?bkp0TE9UM3RIQXRRUG5EOVdhNGtLaFZ0RisrR0RrMUFzdWNkMmw3U01jMEty?=
 =?utf-8?B?ZEs4MTBTN1lhUUNFRnUwb1JxenIrcXVzNGdrdmxCWVE0cXRBMXVYL0dXZm1X?=
 =?utf-8?B?NlRrU0ExMXhNRk5pMTRHR3FlUmZ0MGZ2eVk5ZlFMYW9WVlgyWXJDcVY4YWlH?=
 =?utf-8?Q?xO9k7qfIl6INur4do8+ijcCq9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b12b684-38db-4fdf-2ebc-08dd9933fee3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 13:24:35.6782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YP+DzqvkFUv6+gNrw3bG02g5n7WttWns/O2JtGUhr2ML1VmckM7r6Y2OPCduscNj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7247
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

On 5/22/25 15:16, Philipp Stanner wrote:
> On Thu, 2025-05-22 at 15:09 +0200, Christian König wrote:
>> On 5/22/25 14:59, Danilo Krummrich wrote:
>>> On Thu, May 22, 2025 at 02:34:33PM +0200, Christian König wrote:
>>>> See all the functions inside include/linux/dma-fence.h can be
>>>> used by everybody. It's basically the public interface of the
>>>> dma_fence object.
>>>
>>> As you write below, in certain cases it is valid to call this from
>>> drivers, so
>>> it's not unreasonable to have it as part of the public API.
>>
>> The question is from which drivers?
>>
>>>> So testing if a fence is signaled without calling the callback is
>>>> only allowed by whoever implemented the fence.
>>>>
>>>> In other words nouveau can test nouveau fences, i915 can test
>>>> i915 fences, amdgpu can test amdgpu fences etc... But if you have
>>>> the wrapper that makes it officially allowed that nouveau starts
>>>> testing i915 fences and that would be problematic.
>>>
>>> In general, I like the  __dma_fence_is_signaled() helper, because
>>> this way we
>>> can document in which cases it is allowed to be used, i.e. the ones
>>> you descibe
>>> above.
>>>
>>> test_bit() can be called by anyone and there is no documentation
>>> comment
>>> explaining that it is only allowed under certain conditions.
>>
>> That's a rather good argument.
>>
>>> Having the __dma_fence_is_signaled() helper properly documented
>>> could get you
>>> rid of having to explain in which case the test_bit() dance is
>>> allowed to do
>>> over and over again. :-)
>>
>> That's an even better argument. 
>>
>>> I also think the name is good, since the '__' prefix already
>>> implies that there
>>> are some restrictions on the use of this helper.
>>
>> I'm still hesitating. Adding something to the API always made it
>> usable by everybody.
>>
>> Now suddenly saying we add that to the include/linux/dma-fence.h
>> header but only certainly code can use it still sounds questionable
>> to me.
> 
> If I understand the current code correctly, the documentation state and
> the question "which driver is allowed to do it?" is the same, because
> the documentation for the signaled callback doesn't specify that:
> 
> 
> 	/**
> 	 * @signaled:
> 	 *
> 	 * Peek whether the fence is signaled, as a fastpath optimization for
> 	 * e.g. dma_fence_wait() or dma_fence_add_callback(). Note that this
> 	 * callback does not need to make any guarantees beyond that a fence
> 	 * once indicates as signalled must always return true from this
> 	 * callback. This callback may return false even if the fence has
> 	 * completed already, in this case information hasn't propogated throug
> 	 * the system yet. See also dma_fence_is_signaled().
> 	 *
> 	 * May set &dma_fence.error if returning true.
> 	 *
> 	 * This callback is optional.
> 	 */
> 	bool (*signaled)(struct dma_fence *fence);
> 
> 
> "optional". What if I don't ipmlement it? Who should implement it?
> 
> If the callback is optional, then dma_fence_is_signaled() is the same
> as __dma_fence_is_signaled().
> 
> IOW, it already needs to be better documented who needs to implement
> the callback and who doesn't. If we get clarity on that, we also get
> clarity on who may use __dma_fence_is_signaled().

Well there is no need to implement it, but when it is implemented the caller *must* call it when polling.

IIRC the background that we didn't allowed this was that we already had the case that users only looked at the signaling bit and then where surprised that it never changed.

Regards,
Christian.

> 
> 
> P.
> 
>>
>> Regards,
>> Christian.
> 

