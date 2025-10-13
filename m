Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD75FBD1BAC
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 09:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E89D10E07D;
	Mon, 13 Oct 2025 07:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rUHFNbkC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011061.outbound.protection.outlook.com [40.107.208.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354D410E07D;
 Mon, 13 Oct 2025 07:03:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MjPmA5i8OC8sMVSFKcBtzrLuaRAr7zc9sNGfRj3cdj28qLDlymzC9aDoNVR4vfhLChuXayrjsd52nQle7LsRGs/xGUlrQeOsMT+j0lGStrcHLgQYUX/s1Fo/rEjB/QEWMVILvytnWzG85yTW2bsoGyZ7GPz8amf6xAXQEJb3vpTY56e0v4fxnqPkZilz5ecyiDf2KYXoVFAbj8d9VGPYZTyca0iIpaZnAdXWlDAie5HSVvlkEGhAuceLqIUiWTpTDf7epy5pyUIwnlcW2GTg3QCKRRCm4NntXjSwpgBQFeqe28hZreN0V/Zq81rCKC8QlwxIuAkuo4GE4jO4Hj2cWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tk4fiNjQ8+bYKYnAaaaIJjLa/UQH+9WkBuy0gqai7Tc=;
 b=kYO4ksnt7z0BtG9mPG1SW9RiK6UrHTJ88IdtOXWf11EyYlJQCBNCeaX1Qxx+DVPLJl/uxmxVGvm3VlmpDe7K6Nsh3HLq/B/JOuLqq651ZMrJr8sfwundG4n6bML/OJtXxQZMZWqDlyDwLvGq8e8mUMZT3Px14rwmGg2G8LFhJhMNU0jI9UVh7r6g0wjSBDsvPTBjcYg5DBqvIETcCKAsZg7iIScBIi7D2k+TNS6mEq/ZDfptymMFu4wz/n/JG/JSKdchM72vhsLMBzyMhKF3M2eKSwGPVH/s2P9wuANReRTwvtBSd8zx7rJfKQMyhaHDO3wE0mO+HzZT9ufBZxklfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tk4fiNjQ8+bYKYnAaaaIJjLa/UQH+9WkBuy0gqai7Tc=;
 b=rUHFNbkCsM5cuCDwLi+C7RY1f23AhGv0oObMLJiUIVeBU7LbaqMFqcOYzPVe0Z1EPgq2IfXPJHTRS0bWOOOLLhGJuaeaogaR+sX1FbabTxFwl7fKAgp8om/OsN8o8FPElFG4S7/W6Gryjw6N+9KSWLYTBhLJx0FV4dLWoUD57wA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7892.namprd12.prod.outlook.com (2603:10b6:510:27e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 07:03:32 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 07:03:32 +0000
Message-ID: <5ac9dfd7-7f9b-44ba-afcd-eaed9f4ff864@amd.com>
Date: Mon, 13 Oct 2025 09:03:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] drm/amdgpu: Configure max beneficial TTM pool
 allocation order
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
References: <20251008115314.55438-1-tvrtko.ursulin@igalia.com>
 <20251008115314.55438-6-tvrtko.ursulin@igalia.com>
 <aObxU8vEbEQEf7QO@lstrano-desk.jf.intel.com>
 <01bacdec-f1bd-4ddc-a537-6a091c1a1eb8@igalia.com>
 <f32a164197b7d25dff42432007b9926ec5575e2f.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <f32a164197b7d25dff42432007b9926ec5575e2f.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7892:EE_
X-MS-Office365-Filtering-Correlation-Id: ac03ba24-c651-4e65-26c1-08de0a269efd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TU56VjUrdDRUUXdFck9CZS96MWRkT0Z4RFBFS2l2c1FWcEJLb1FBQjRVTXow?=
 =?utf-8?B?MFdJS3FDaVVKWFU5VlQ2Q2pQd0w0cWhRWnJLZXdCTnpHZlZ2aUR6cGJsdStS?=
 =?utf-8?B?TnN6eFhWQUd3ME1wUE9WMmlUeDJrR3Z3THJ5ckxHZUlLSEczbEx3a1hDRzlQ?=
 =?utf-8?B?bU52TGtHYUxRTWdXRTcxMDMyRHNwWVRKNHRVM1dpVm8zQjFtczBiSGw5RE5h?=
 =?utf-8?B?S0daOFBhV2FvNjRhVk8wd096TkdqY0puTGdnSE1OeVRhM3dxeTB0MzFlTUVk?=
 =?utf-8?B?NlFCNS9VT0RsYkNjVXdHVGg4NUUxWnlKUmg5cmtYR1Rwbnoxa0Z6czNNbFFU?=
 =?utf-8?B?OGxFM3dyUGxRY0syUXlWdnYvV0l3ZCtBdXRLZlVTeG8wZFd4TkJUTVFseUpi?=
 =?utf-8?B?d05WQUptdXA4TVZQeXVMTUR2azBTUXZkWk1vU2YwbkZiTktXWitXMVhGZ1cx?=
 =?utf-8?B?QXpodDEwaENsVis3S2cyTitCNnQyemdFbXpLRlRPNmpKZURwS2FleFNGK0cx?=
 =?utf-8?B?MVUvOEhlUjhtMnBrQkRxWElySXIvWE5aNlRSbExMcFBJeng3NFVGaERKOFlt?=
 =?utf-8?B?NWh5Q1RMeDV2VjNtQ2RaVFhuaUx4VmxCWFFSdkthMEhtK0x1K05VVzhzRnRU?=
 =?utf-8?B?U1FVeWhrbGxuL0M2VGZnNVhvOHBBTWQ1SUdJRVo3ZEM1am13TVh0cml6NlBU?=
 =?utf-8?B?aGRNa3ZNOTR4OHQzc2tLUDRKT1g4dlRLZitVVnFoektNZExNTElvWGdBRU9r?=
 =?utf-8?B?K3loa3FEZlZhVGVncTVwR0pEdEpTNjVPdTNZdWhFdjRyd2Nhc2JUdFpRVjc1?=
 =?utf-8?B?ek1nN1VYTW9nVUMydmlEek51eHNTaXRwd1krcnlBcEcvR1hteW1yWFlJMjli?=
 =?utf-8?B?RWI4L3VRR25oMmo0c3JieFlCazVESjdOekUwRUJEbHZhYm1KQXBYMzZueXI0?=
 =?utf-8?B?eC9UNEtIK2JQVnBjbmFiY2tITnRDMWhEK3ZDaVZXYkhVTWxqMGN3em5ZK0Ir?=
 =?utf-8?B?OVhXbjlzMnlYdTJidWxiY0o4QnAxYVdQV3lBSVNLbzRxa0Z2T3dLR0g0WUEr?=
 =?utf-8?B?b2hHU3JLKytUcHM5UWZkT1FLQmtZa29SLzVSV0xrbDFDY3NZVngyVXNhM2tQ?=
 =?utf-8?B?V0ZoMjZBZnJpUDZ0MEVEakdjcWtJZGdYRytUYUhQeHhYQSt4dW1FMDl1aWRE?=
 =?utf-8?B?c0lzV0FjSmhxeFdHL1ZhR28vM1FGM2dIZzBuV09UYU5HZENpQW40RWQraDFN?=
 =?utf-8?B?M2ljSFhvMUtEZEJRQ2VwbytMOTU0L0hCYjVoSDl6WHpEamNqaXlLbWg3a1Ez?=
 =?utf-8?B?UkxFL2hLdTRudkxpUXpOcXYzNEdZMTVzdDFEUElZYUc3M1lDRVlwRVU2U1U3?=
 =?utf-8?B?U2lvTmJkLzdwNDBiUXVUcERIQ0FZVzNVRWFNakNMenAwWWhlbVJlMGlwRWlE?=
 =?utf-8?B?VFlNR0VWMS9pb012UEg2WWRaMVV4OU9EbkcwWkJwSFVwQzlDN09vMzhXWlB2?=
 =?utf-8?B?N1hUQ0twU1FaK0MzYWVtREJhV214c1VMaExDazBSZGxhcTJCcEltYXlsSWhG?=
 =?utf-8?B?RS9iZ3pVbDRyOGk1RXhjSUxEY3lyK0tBcUxWcTc5b2Zhamx1ZmhIV1VYTm5R?=
 =?utf-8?B?dGhPRkZOQUI2dXRzdzF4Y3crUTY2ZnNLT2VFb3VURkNUSGJrUm03UlBySElR?=
 =?utf-8?B?cktjUnExL2xhMWNBTU4zYVgzeERDdUk0ZEl5bk9PaGMwaEEzOFFGKzN0S3Bi?=
 =?utf-8?B?ejZqL0NXRVk2Y2VsTERRRzhWN3UzeWhkaFlucUNBbnc4djZlYUZUR01Ibjlj?=
 =?utf-8?B?RUZoMnByL3NGWm5aYlRGeldRTC9WRTdZQnhoZ2t1bm5xVWs0QXB1SUFRUENH?=
 =?utf-8?B?QVQ4VzRVSmp4K2ozOWFxbklhUkNNTnNPcHVRdXAwOFoyOXJEcjRGMGk0TGNk?=
 =?utf-8?Q?cPs+89r7WeUyn+WHWuhRfnN2wYVmXmXk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzlKZVlQWmlLL2tVRDlPMEZHTWdDOEl4bFlDVlNaSlRZUjJBejhKQ1YxRlg0?=
 =?utf-8?B?dngvdGdiQ0NwWlpHWVFuc3duQ0didU11SXA1a0hDY0dYRnordTVLeGs5OTZo?=
 =?utf-8?B?TUJ6M2lhVFRVeHNwRndGNk5ZUlZEa0FXZndjeVN3VXg0QlNQUjNrc1pQVTJo?=
 =?utf-8?B?am1LeEswYmNLb0t4Ykl1RjRsRWVFL2hoOXNKU3dHTjRhZFY5eDdObE54b3J2?=
 =?utf-8?B?YmlsKzR6OUhIYXlDUFFkYlZWYXkyQ1ArTklzaVRxQlZuU2J5VjI1YjVTc0ds?=
 =?utf-8?B?N2RCNUd1MmdSclJMTDV2RmRobWJvRmRvTHBQRDRFK3UrdWRoeU1Ua1pwV0o2?=
 =?utf-8?B?aXFuZjUvWmlWc283cDhZMjhRL3k0ZHJ5SGVHWUNWTk9rdEgzalRZZGV6UTRl?=
 =?utf-8?B?eTFUa1F4MEFqajZkbzE2UTRzTjJZbEhXNmFoaHo2MEdLS29CSWZlUDNTczAv?=
 =?utf-8?B?RmF5UFc1aWM1TFZTM2lJeTdLaUxUM29KZ2haSnFUb3hrSi9IUjJZMkpDUTla?=
 =?utf-8?B?YUw3T2k2cFpVUER0WWpGcW5Zb1Q1VU9teSs3TlFmcFpkWmVoenNzUFFVZ202?=
 =?utf-8?B?aHBjRnpBcWNrZk02R05ReDdCa0ZGc2VWaUJaK29aVzF0NUFjanprd25zMCtX?=
 =?utf-8?B?cDFqbkVobExmWXI0WUFvTkNqbG92T1VxaEFmaThCYWtybmdHSkxqeTNaWTM2?=
 =?utf-8?B?Z09yTEdyMzJ4bysrVXpPeGcwY0h6Unh4Q1l4cUZIVXVCa0JlVWdjWWFTR1hV?=
 =?utf-8?B?VVJ1RXNXYmdwYzhaK25hM0xXYWIvRXJZK1IzMVBxeXJqK1BEZlhBTGtrZU85?=
 =?utf-8?B?bW1YckdrcWFMUXI4aE9ScVZ4aE8zQ2t1VVpzWW45djRWZDZoZ0Zzb2Q2OVBo?=
 =?utf-8?B?QVhkOGNKSTh4VnNJZHo1dFQxOU1WUjMxL0tRenJHSUhZYkY4aTd6VnNPSlJO?=
 =?utf-8?B?WmdXK25VcVZsQnFqNS9hNGhoa0plaWVMMWIzZGd0MW9CaVlIaTJVNitmQjFH?=
 =?utf-8?B?WTBIZWgvTWdWajMvUWwvRXpCR09OMGxybW1lUTA3aWN3QURJK3pNa0R0ZWdX?=
 =?utf-8?B?SE9tT1NQSWVkMFJueUlwcHZPTTVHZmtGOGp2WUJPdW1FRkNwdWt1My9ybGgv?=
 =?utf-8?B?TkVzT0wzL2ovKzBpRGtFMGtGVjJXUm82ckVwbHpLa2hKWURhSkxQNkRPMGhD?=
 =?utf-8?B?clJJcmNpcWJKMnJXOWNnWTFFaFNwajFqTzA5R1g4LzFjTTFuWTd1NnAzTzZl?=
 =?utf-8?B?QVQ4SitzcHU2dlNLNkZ5TWR2TWtFZTNPTmJrRlM5N0lJL253bXNYdjV3Qytz?=
 =?utf-8?B?cFNaZ1M0b2VrN25ia1N5WEhRdHJ2NXdTN24rNFRKOXN5WWlmQ1hNVXNOb1lr?=
 =?utf-8?B?dE5HWDlIaGppSlBIMm8yM1lRcnhaclRDbzJLcXI3UXNxVkZDbjJjVnA2TTN1?=
 =?utf-8?B?VURuNi9HZHdFUC9KMStKWW94Tjc2eWs0RG1FemoveTJoejgrdnVXdVovRGlr?=
 =?utf-8?B?TzBXeXJQSkY2cU5qVHNyUDZHQmNxVC94UVE5TDhkM1NnUzl2WStRcktuVmVy?=
 =?utf-8?B?MXJaMlBMNUxnMXdPUTFRM2hpM25GUHNmZExBcFRHejBja1VGdml5c3hMaXRP?=
 =?utf-8?B?Ti9DMVZIeVJsNUdRb2RVYm9MY3NqdDBCL3JUTmlrZ2ZJc0swTUdYT05GYjJB?=
 =?utf-8?B?WlYwTFY2YUZ4QWUwM0lxcC9LQ0JsQ2MwZHBsbXQyNjEvbXRZYUs0R09YVUJT?=
 =?utf-8?B?UTY4RU1uREZydnNWUVg4MkJISHRYdWYxUCsxNDZxL2pXaGJTM1o1aCswZGxX?=
 =?utf-8?B?K3dtTHBqTXY4VU5TNDRoZzZTemRPYzJWSllSS1BPdDhXY0tCS3U3ZnlaQlVX?=
 =?utf-8?B?eGx5R2N5Ti9RTW80Mi94NytxenFCaUt2dG5IOEk4a3JTUGhkcW9KTWhoMGRn?=
 =?utf-8?B?Z0Q2VWwzUkxwa083eHZPdTVYWGRCTE1QMFczTjlHMGVpNnVuamFVR0prMDFL?=
 =?utf-8?B?NFRiY3NBeTFXQjd6RnpZU1Y5cUZNY29RSk16aVdTTUFrVkR4K3JZdEhRZUZR?=
 =?utf-8?B?ZEo4dmtZczdvNkk4RWZwY2s5a2ZWQnlrRCt6VC84MlBmeG1qcU8zMW9BdGVX?=
 =?utf-8?Q?IL73yWTRuQ6+n7q/iPysGRR5T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac03ba24-c651-4e65-26c1-08de0a269efd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 07:03:32.7486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+V5+vWdukjNREKQc2m22KI6a/2e4zJyqvNVHIL1RYtQnmUEPVCdQkkve8XVbnnJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7892
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

On 10.10.25 16:14, Thomas Hellström wrote:
> On Thu, 2025-10-09 at 09:58 +0100, Tvrtko Ursulin wrote:
>>
>> On 09/10/2025 00:18, Matthew Brost wrote:
>>> On Wed, Oct 08, 2025 at 12:53:14PM +0100, Tvrtko Ursulin wrote:
>>>> Let the TTM pool allocator know that we can afford for it to
>>>> expend less
>>>> effort for satisfying contiguous allocations larger than 2MiB.
>>>> The latter
>>>> is the maximum relevant PTE entry size and the driver and
>>>> hardware are
>>>> happy to get larger blocks only opportunistically.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
>>>
>>> +Thomas - Seems like we'd want to do this in Xe too?
> 
> Yeah, Indeed.
> 
> While IIRC we can actually set up 1GiB PTEs, I'm not aware of any huge
> benefits from using that compared to 2MiB ones. We certainly want the
> allocator to try pretty hard for 2MiB ones, though.

Yeah same here for AMD GPUs.

There are some obscure use cases for 1GiB on amdgpu, but only for VRAM. And even for VRAM we only guarantee that as best effort.

Regards,
Christian.

> 
> Thanks,
> Thomas
> 
> 
>>>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 5 +++--
>>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> index 948c6d0a422b..723b885210a7 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> @@ -1837,7 +1837,7 @@ static int amdgpu_ttm_pools_init(struct
>>>> amdgpu_device *adev)
>>>>   	for (i = 0; i < adev->gmc.num_mem_partitions; i++) {
>>>>   		ttm_pool_init(&adev->mman.ttm_pools[i], adev-
>>>>> dev,
>>>>   			      adev-
>>>>> gmc.mem_partitions[i].numa.node,
>>>> -			      0);
>>>> +			     
>>>> TTM_POOL_BENEFICIAL_ORDER(get_order(2 * SZ_1M)));
>>>
>>> SZ_2M btw.
>>
>> I thought I grepped exactly to see if that existed but apparently I
>> did 
>> not, thanks!
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>> Matt
>>>
>>>>   	}
>>>>   	return 0;
>>>>   }
>>>> @@ -1931,7 +1931,8 @@ int amdgpu_ttm_init(struct amdgpu_device
>>>> *adev)
>>>>   			       adev_to_drm(adev)->anon_inode-
>>>>> i_mapping,
>>>>   			       adev_to_drm(adev)-
>>>>> vma_offset_manager,
>>>>   			       (adev->need_swiotlb ?
>>>> TTM_POOL_USE_DMA_ALLOC : 0) |
>>>> -			       (dma_addressing_limited(adev-
>>>>> dev) ? TTM_POOL_USE_DMA32 : 0));
>>>> +			       (dma_addressing_limited(adev-
>>>>> dev) ? TTM_POOL_USE_DMA32 : 0) |
>>>> +			      
>>>> TTM_POOL_BENEFICIAL_ORDER(get_order(2 * SZ_1M)));
>>>>   	if (r) {
>>>>   		dev_err(adev->dev,
>>>>   			"failed initializing buffer object
>>>> driver(%d).\n", r);
>>>> -- 
>>>> 2.48.0
>>>>
>>
> 

