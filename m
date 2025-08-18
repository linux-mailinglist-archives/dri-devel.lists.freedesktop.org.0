Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 981D6B2AB2C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 16:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9289910E45F;
	Mon, 18 Aug 2025 14:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2tF93qOC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B45610E45D;
 Mon, 18 Aug 2025 14:43:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKFndPcLwBKni1Y0K+SJuQtsVWjwl1OZp2zCRQC8qDeQxMhNnn88r6ySPAjZwYjmqqFIFy178Ap161aYZK4UJX9j7fx+Vo4VfA0SRMRA2uAULhxdJRgHKTyUt1PBmJGQzodk98DpoiWlGydX1vIEyfDbqNkYs5RM77RYfJhgg0EGcIh+Mc4CgDhTts0Y9V81KjHd9nvzs/z+ltGv1Sg9hrqHAPTpwUo46jQxCMeZoXyTKLHzZvP+KY3KrgWls+DzdwZAx7VgfJ7L/FdCsnZigNr5rpo75DjSW8iRGAwU3JSxkqvBRneCjx2fGhQBVmm1OZ+MNKTg9SaUApPb0Agz9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcTGsoPxoOzIsECi4KMNSJHZ+KqpS5nS/sWPJB1lqSg=;
 b=fig+l93ikYtFcVGKV5SdiZ5R/03TanuqsXuXo18MYSCMYOMCPpYoQzBXaHd/08mrF9n/b52HjxD+BxBpWphli+NELitK50pQ1R35/mvfbTfEgDhXWCjr2iO73wzFdhmmj7DDtBJV0ppRLf2oMmy/fswsu9t8o7tWkU/dki08NKTQWvKCYwWEWbr7VLW3yb2S7bSa7IceW9qvVois9E/cRBaS14Y2rfrlOFnq0HQ9Ll2RuiAfAs9IzbxQDgShPPI1T5E/J7nvCMpkojbLTrlaJGjehdMwVzFlbPrqwMbU+vcRIYrtrHX43U3IhamlV3Z/nw3r3WO2CP0cwrsFbICX+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcTGsoPxoOzIsECi4KMNSJHZ+KqpS5nS/sWPJB1lqSg=;
 b=2tF93qOC/vxHLVc8eL6Qat/ikKui9uH0YYIoyuAtnwK2XX3UDikrVY5Z/yro4SqEumMulpVGBL/74fKPVQLbKMnjC7uYtX+B5iJMERMti+KMzjb9jRJzhPnKVpQW9dnymwQi+HmSqUjGQPL1n5tBZ5j8teIT9qZuGTBCFhNiDY4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7097.namprd12.prod.outlook.com (2603:10b6:930:51::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 14:43:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 14:43:01 +0000
Message-ID: <c4bac4d8-9c5b-446c-b9a1-1bc7ac6b38ff@amd.com>
Date: Mon, 18 Aug 2025 16:42:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] dma-buf/fence-chain: Speed up processing of rearmed
 callbacks
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20250814094824.217142-6-janusz.krzysztofik@linux.intel.com>
 <20250814094824.217142-10-janusz.krzysztofik@linux.intel.com>
 <0920872a-6f8d-4301-b9fb-c8fa54b7ffe7@amd.com>
 <2443311.NG923GbCHz@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2443311.NG923GbCHz@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR07CA0028.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::38) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7097:EE_
X-MS-Office365-Filtering-Correlation-Id: 48790f47-a178-4b16-f601-08ddde6587f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVg5QktsZFB1Y2JKR0labk9raEZvbHpBZng2UWR1a2pnVXpsbEplZkxLM3I0?=
 =?utf-8?B?ZE5xMUNnMVFUNWRNNnpsK0RkZ2JzL3JETUVjSCt6ZlZEVnczbFN2N0RJMVRk?=
 =?utf-8?B?bHZkcmgyN2V1VlV6MVI4aUQwRjh4YkdhZFllRkVJTUR2NXBidGFSWE1jZUtp?=
 =?utf-8?B?dDNvei9EbHo2M25jSHloeHhlVU5rRERicllFVDI5SHJkcTkxZHBTOTlFSDha?=
 =?utf-8?B?dkIvWVRzVWs4Q3pTTHJmWFE5eU16RjF3Ky8xZUtYeFBaRWNJN1NHaG16Tkl6?=
 =?utf-8?B?aGt4Z3FwWGw2ZWpnU012NVFEM1pnckNaNTRDTXJhNEQxZW9xNlM4OUN5aUlQ?=
 =?utf-8?B?UVJTTDdpeUMxVVM0ampkQmNkSk05M0k5elZvcFJtS2xic0VoclFJZzFVNXVk?=
 =?utf-8?B?eXlMMTlieTZueE9zUjV6ZnJPMDM5ZjZXbUFxZHdjd2Nrc2RpUkJ1QnFCNzd6?=
 =?utf-8?B?d0JOa3dzNEJsN1YrU3c1WEY4MSt0Z25HcVNJSGtmeENXWm9YeWs1WDVyeVlp?=
 =?utf-8?B?b2xCUHV4SmVHOEN2MzFJUzFvMWJSQmlPYzhGbFhhOC8zLzUzRHl0QXJpOWVF?=
 =?utf-8?B?ZDE4ckhYaXlsTEtpckhQQ1hGRkpLSHdldXZwVEJXTERxUG12VmU0dlI3eFU0?=
 =?utf-8?B?RHNjeVJlSHBKb2hSenk3Rm0vWkVVNktuajJiUWF5b2VXaWJ1eEpXNmtvYVVN?=
 =?utf-8?B?Vmc3ZGI5ZnZ6cFlLYUVSVkdlWUxRQ2liaktlcjNhazFUd3Vib1lYcWZrVEJa?=
 =?utf-8?B?S2swZ3h1ZitaWjlXcS9MY3hNV3U0Mk9DcTcyYW5pVUUrMmloQjltL0gwSFlN?=
 =?utf-8?B?NlI4Q2RXRTZDZUdrTzIrU1FYQWtOeGNFNjJjdUo3dFBrTlRPY29pakp2dkZw?=
 =?utf-8?B?VFJ6YkcrZTJtL1lKbHU5YkJrMm14ckNKS24yTGZBaFByR1l3ZDd0TGRXWnJR?=
 =?utf-8?B?eDYrd2NTNzBpUkZ2VitvMktKSEp2RlpuU05sbVA3bzJsOEFjNll6YnBNeWtx?=
 =?utf-8?B?cnMzQ3Z3cUlWWmp5akl3YlphNHYvZEt5c0lDZ3BTbFpSdUE3cGJva2VBV0ZL?=
 =?utf-8?B?YVZ1RXE1MmRNOWtGMHlYNk1kUlY4NTFDdlBtZHRsc3pVVWFWNmhWaFpUdTFU?=
 =?utf-8?B?NmVHNXBPZ2pyRmpLbThhK0Z2UHAyTFg2MStIY1B4QkRCUmZnQkROYXdrQXE1?=
 =?utf-8?B?ZzZFSURGNGRXV3ZjdWoyQjJrK0hvZG5rR1hON254bzR3cCs5Q0RXSmowVWEv?=
 =?utf-8?B?MXd3RGd5K1EwQ3NMT3hXSWltMlVmVjI2L0FJL1BHZVdSUXZGYUt6WEJIUUds?=
 =?utf-8?B?TXdOaTk2NnBSaVdCWmV6RllZWGdwSGJ2UEtpWm9KNHdRT3JCQnpFZmtSQkFF?=
 =?utf-8?B?amRBb3JhZUxPRDN0Z25mK2lURldpeUxHdEFzc2hPcGxlVTkrZUtJQ3hkUFd4?=
 =?utf-8?B?bmpPckF6cDdSTFlYVmV3SjhsanVwU29zd0VQWTVyY2ZXdVFjZ1FMcGYrOUtG?=
 =?utf-8?B?RndsMG5PT05WNk1lV1dyaFlmU3RCWFpVSTNpYVNPOHBoRzR3WFRITi9YaEtp?=
 =?utf-8?B?R0Q1eUw0OXQrYkRFVm12cXhkS3pBMGNlT2EwMzJkTUx0Y3J5Mng1QkJVU05n?=
 =?utf-8?B?UGx5RXhpclpLTm8zbGpjSkM1MVZudDFHS1hOY3hsQjJCWGhOMzEyaExXZFR5?=
 =?utf-8?B?dmlHZnZUQXVrSUd5U3Y5Qm90b0RHNllzcFNtaW10MWFxaGlKa2Nnd3BYSnFS?=
 =?utf-8?B?am02Ni9GWHVjMlordE5QNEhRcFN5cVRXMlpCeU5jVDdmOEZpOHdMa0RScE9s?=
 =?utf-8?Q?1irsLPvp26K0+PoxKGMwavcDR6lLJDXbVDu/M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTROTEhidDMvQmM2Y04vbVpvR2FQdWdYR0VQS3U5Z25jSHRKbUhEVytHc0tR?=
 =?utf-8?B?cTZ5TTBhU29jWHg3V3lJS094Y0lxbkFGQ2NJd1JWN3o5TVNWTkRXMDF3bFVo?=
 =?utf-8?B?bFVVYlQ1b0tEVjBuTitNMG9PVVo0UVZDT1JPUVhEYnlUdHpscytHV1FZZXhu?=
 =?utf-8?B?V2IzMERydU1ZdlQ0TGZUOXk2K0tPMFRTVmxYVW9NcUJaQW4rTVJLZmlkeHF0?=
 =?utf-8?B?dmZMaE1QQmlCYjJBOUNsM0gvREtudjFNNnlKVzRGdU13aXJ6T0NMVXBHaTZs?=
 =?utf-8?B?S3J6dVJUQ1huKzN6aE1zR1I5TTFQdjNwbUZLeUxPQXVLNmVjNjcxSmIrakxw?=
 =?utf-8?B?RFYrZ2ZtRk5id1NvY1pFUndnNXFHWG94ZjJWSldFVXMzem94eVNIM3FIL1gx?=
 =?utf-8?B?bVZoUklqUlZHTk5aZm1Qa3Uwb0pVeUtOSURjVFhUOEppV24vUXVvQUhDVXV6?=
 =?utf-8?B?VEdrdEk2RDhoUEhEczlxTlhLQ080b1lvYXRwQ1UreFg2QXNIUjBqbUlWR1pP?=
 =?utf-8?B?WFRxU2hpSzhiek1TdXArUTZyNWFRNGI4dG82ckRqSmZsNjFqSVNaa0pZMnRB?=
 =?utf-8?B?aXhabnl6VjZYSzBKanJBUHp3YWcyMWRpai80U3BNUFRNVks0REVrY29lWm5s?=
 =?utf-8?B?LzJlb1FVYyt3RTQ1U0ZVbnh5R0haRmt2aDA4Vmc2SURtSE0wd284eXpqRDVn?=
 =?utf-8?B?TzA5TmZ3ZFJHZFBPZ0Z1TXg3TXZPSFI1SFBLV0NQazFQN3NhQUhPSGZsR3Yx?=
 =?utf-8?B?QlZocFhOSUdHZ2h2dDZHTnBXblY3SS84VFNvdzZGelJWamIvaHRSR2Fib2U3?=
 =?utf-8?B?MWJhTnAvY0hiN0tsRDVsWUw2Qkh5TzQ2NEg4NGNFdmlBSlBON2lMRlY1ZTFu?=
 =?utf-8?B?azJqTXQ1SjFRQlFjNTUrdlk1dWt2M1F4RU5PdE93UU1vaDFEbERjL1o1bGpK?=
 =?utf-8?B?eVpZcDJON1JacHZBV0FRdU03UGJUK0RoZDlLTUI3RXYzeWI3cEVGWjhnTzEz?=
 =?utf-8?B?Y3ZKWDNpWndjOURQR1VBTzF6TEF3Skc0YlRNU1A1WTFINCtRem43Nmp0MEJI?=
 =?utf-8?B?bS85WG0rSTZIa1RvYVQyWjVRNlphYnN0eHdIV3Z0Q2xqY1lZSTFCU1duelBN?=
 =?utf-8?B?L1YzQ1JtVWwxQmxLQXhpMTJ6SGltdkVhaXc4N2g2NllEdXRoTTZJQ0dFTFhP?=
 =?utf-8?B?RWFvZFRCOTVMTHE0UTRRTWpFekZPREZCeVBSaVI4Y0dHTnFkYmNOSEdmMmxy?=
 =?utf-8?B?ZGFrM255dGNjaGhQMG1kTzZ6Q09ubXI2Q3lNRitFWXRRVVRJbzA1UFlRTGxv?=
 =?utf-8?B?aXNPRmU2aUZuT3NZTFluUzJVZHFyQ3lhVXkyOHQ4Q1dSWWp4S21LV2FHSXZv?=
 =?utf-8?B?SGVVWHB3NUxjZjBkTEgrRWgyYnMvbmZVcTdITVVFdU9JWk96OFpQMUM3blZt?=
 =?utf-8?B?U2oxNHk4c3pvcFVMTnhNbEljWDFFblpLemg3OVBvMFgxcVpWbXJwNmpSZFdt?=
 =?utf-8?B?QUpYQUl3OGxJNmFzR1lmTzRKTWs5WStZUVBKK1NLUWYrS2dwQ041QTBHNVQ0?=
 =?utf-8?B?V3lacnlwRG5JdVg4N0NUSlROL0UwdHFwTGpCbXJsdytCenNTUmh2KysrT1JR?=
 =?utf-8?B?WTdmVk5GWFQ2QnpPVE10cGxtNGJqMUpVb1JPK1BsdXRubGJrcFRLRXgwMEhW?=
 =?utf-8?B?WDdFU1FWWHUxZjJQdEVLSnRvdGRCZXNiT3g4MUQrTXJkN00wR0JkRzdJL3RG?=
 =?utf-8?B?emNHNkg5ekpyY1MyTlgrSlM3NytVT1p2NnhHeFpya3RSdUwrRDBIa3BOb0lK?=
 =?utf-8?B?NVdJWWJIWCs0K0kyaGhHSldJOFdBbGQxMWk2bEo0ZUdRbFhBOFl3bUJZNkhH?=
 =?utf-8?B?UDJoaFNuQUVOWU1iQ01ra3V6V1JVYUY2YkJ3OXlSYjhoSjhaSkxyMVVoS1Zp?=
 =?utf-8?B?WXZKaGxoZXZsVlh5Uk1xVWpqRjNDSS9jUXRmb0NoUUFSeDZsWUVPNTBnNnhn?=
 =?utf-8?B?L2NGQ1JKbUlLR01LWjBUSHFlcHJFNDdOSnpzSEtzd3ZBK3hzc2xxZlJJVkxE?=
 =?utf-8?B?dVZvN0FXTUZCS3FWdFdmbHR6THc5VXYvSnJaYjRIQUI5aXRWZ0ZZcG8wTUdS?=
 =?utf-8?Q?vI3ulcY530ZRJ0uQYa0gssvms?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48790f47-a178-4b16-f601-08ddde6587f3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 14:43:01.3119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /chb0O9WPXRUxkDPY1xHH0SFfrBY7dIHIXqqUtWeY9tTYLygEpskzVf/axKeOPoL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7097
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

On 18.08.25 16:30, Janusz Krzysztofik wrote:
> Hi Christian,
> 
> On Thursday, 14 August 2025 14:24:29 CEST Christian König wrote:
>>
>> On 14.08.25 10:16, Janusz Krzysztofik wrote:
>>> When first user starts waiting on a not yet signaled fence of a chain
>>> link, a dma_fence_chain callback is added to a user fence of that link.
>>> When the user fence of that chain link is then signaled, the chain is
>>> traversed in search for a first not signaled link and the callback is
>>> rearmed on a user fence of that link.
>>>
>>> Since chain fences may be exposed to user space, e.g. over drm_syncobj
>>> IOCTLs, users may start waiting on any link of the chain, then many links
>>> of a chain may have signaling enabled and their callbacks added to their
>>> user fences.  Once an arbitrary user fence is signaled, all
>>> dma_fence_chain callbacks added to it so far must be rearmed to another
>>> user fence of the chain.  In extreme scenarios, when all N links of a
>>> chain are awaited and then signaled in reverse order, the dma_fence_chain
>>> callback may be called up to N * (N + 1) / 2 times (an arithmetic series).
>>>
>>> To avoid that potential excessive accumulation of dma_fence_chain
>>> callbacks, rearm a trimmed-down, signal only callback version to the base
>>> fence of a previous link, if not yet signaled, otherwise just signal the
>>> base fence of the current link instead of traversing the chain in search
>>> for a first not signaled link and moving all callbacks collected so far to
>>> a user fence of that link.
>>
>> Well clear NAK to that! You can easily overflow the kernel stack with that!
> 
> I'll be happy to propose a better solution, but for that I need to understand 
> better your message.  Could you please point out an exact piece of the 
> proposed code and/or describe a scenario where you can see the risk of stack 
> overflow?

The sentence "rearm .. to the base fence of a previous link" sounds like you are trying to install a callback on the signaling to the previous chain element.

That is exactly what I pointed out previously where you need to be super careful because when this chain signals the callbacks will execute recursively which means that you can trivially overflow the kernel stack if you have more than a handful of chain elements.

In other words A waits for B, B waits for C, C waits for D etc.... when D finally signals it will call C which in turn calls B which in turn calls A.

Even if the chain is a recursive data structure you absolutely can't use recursion for the handling of it.

Maybe I misunderstood your textual description but reading a sentence like this rings all alarm bells here. Otherwise I can't see what the patch is supposed to be optimizing.

>>
>> Additional to this messing with the fence ops outside of the dma_fence code is an absolute no-go.
> 
> Could you please explain what piece of code you are referring to when you say 
> "messing with the fence ops outside the dma_fence code"?  If not this patch 
> then which particular one of this series did you mean?  I'm assuming you 
> didn't mean drm_syncobj code that I mentioned in my commit descriptions.

See below.

> 
> Thanks,
> Janusz
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
>>> Suggested-by: Chris Wilson <chris.p.wilson@linux.intel.com>
>>> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>>> ---
>>>  drivers/dma-buf/dma-fence-chain.c | 101 +++++++++++++++++++++++++-----
>>>  1 file changed, 84 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
>>> index a8a90acf4f34d..90eff264ee05c 100644
>>> --- a/drivers/dma-buf/dma-fence-chain.c
>>> +++ b/drivers/dma-buf/dma-fence-chain.c
>>> @@ -119,46 +119,113 @@ static const char *dma_fence_chain_get_timeline_name(struct dma_fence *fence)
>>>          return "unbound";
>>>  }
>>>  
>>> -static void dma_fence_chain_irq_work(struct irq_work *work)
>>> +static void signal_irq_work(struct irq_work *work)
>>>  {
>>>  	struct dma_fence_chain *chain;
>>>  
>>>  	chain = container_of(work, typeof(*chain), work);
>>>  
>>> -	/* Try to rearm the callback */
>>> -	if (!dma_fence_chain_enable_signaling(&chain->base))
>>> -		/* Ok, we are done. No more unsignaled fences left */
>>> -		dma_fence_signal(&chain->base);
>>> +	dma_fence_signal(&chain->base);
>>>  	dma_fence_put(&chain->base);
>>>  }
>>>  
>>> -static void dma_fence_chain_cb(struct dma_fence *f, struct dma_fence_cb *cb)
>>> +static void signal_cb(struct dma_fence *f, struct dma_fence_cb *cb)
>>> +{
>>> +	struct dma_fence_chain *chain;
>>> +
>>> +	chain = container_of(cb, typeof(*chain), cb);
>>> +	init_irq_work(&chain->work, signal_irq_work);
>>> +	irq_work_queue(&chain->work);
>>> +}
>>> +
>>> +static void rearm_irq_work(struct irq_work *work)
>>> +{
>>> +	struct dma_fence_chain *chain;
>>> +	struct dma_fence *prev;
>>> +
>>> +	chain = container_of(work, typeof(*chain), work);
>>> +
>>> +	rcu_read_lock();
>>> +	prev = rcu_dereference(chain->prev);
>>> +	if (prev && dma_fence_add_callback(prev, &chain->cb, signal_cb))
>>> +		prev = NULL;
>>> +	rcu_read_unlock();
>>> +	if (prev)
>>> +		return;
>>> +
>>> +	/* Ok, we are done. No more unsignaled fences left */
>>> +	signal_irq_work(work);
>>> +}
>>> +
>>> +static inline bool fence_is_signaled__nested(struct dma_fence *fence)
>>> +{
>>> +	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>> +		return true;
>>> +

>>> +	if (fence->ops->signaled && fence->ops->signaled(fence)) {

Calling this outside of dma-fence.[ch] is a clear no-go.

Regards,
Christian.

>>> +		unsigned long flags;
>>> +
>>> +		spin_lock_irqsave_nested(fence->lock, flags, SINGLE_DEPTH_NESTING);
>>> +		dma_fence_signal_locked(fence);
>>> +		spin_unlock_irqrestore(fence->lock, flags);
>>> +
>>> +		return true;
>>> +	}
>>> +
>>> +	return false;
>>> +}
>>> +
>>> +static bool prev_is_signaled(struct dma_fence_chain *chain)
>>> +{
>>> +	struct dma_fence *prev;
>>> +	bool result;
>>> +
>>> +	rcu_read_lock();
>>> +	prev = rcu_dereference(chain->prev);
>>> +	result = !prev || fence_is_signaled__nested(prev);
>>> +	rcu_read_unlock();
>>> +
>>> +	return result;
>>> +}
>>> +
>>> +static void rearm_or_signal_cb(struct dma_fence *f, struct dma_fence_cb *cb)
>>>  {
>>>  	struct dma_fence_chain *chain;
>>>  
>>>  	chain = container_of(cb, typeof(*chain), cb);
>>> -	init_irq_work(&chain->work, dma_fence_chain_irq_work);
>>> +	if (prev_is_signaled(chain)) {
>>> +		/* Ok, we are done. No more unsignaled fences left */
>>> +		init_irq_work(&chain->work, signal_irq_work);
>>> +	} else {
>>> +		/* Try to rearm the callback */
>>> +		init_irq_work(&chain->work, rearm_irq_work);
>>> +	}
>>> +
>>>  	irq_work_queue(&chain->work);
>>> -	dma_fence_put(f);
>>>  }
>>>  
>>>  static bool dma_fence_chain_enable_signaling(struct dma_fence *fence)
>>>  {
>>>  	struct dma_fence_chain *head = to_dma_fence_chain(fence);
>>> +	int err = -ENOENT;
>>>  
>>> -	dma_fence_get(&head->base);
>>> -	dma_fence_chain_for_each(fence, &head->base) {
>>> -		struct dma_fence *f = dma_fence_chain_contained(fence);
>>> +	if (WARN_ON(!head))
>>> +		return false;
>>>  
>>> -		dma_fence_get(f);
>>> -		if (!dma_fence_add_callback(f, &head->cb, dma_fence_chain_cb)) {
>>> +	dma_fence_get(fence);
>>> +	if (head->fence)
>>> +		err = dma_fence_add_callback(head->fence, &head->cb, rearm_or_signal_cb);
>>> +	if (err) {
>>> +		if (prev_is_signaled(head)) {
>>>  			dma_fence_put(fence);
>>> -			return true;
>>> +		} else {
>>> +			init_irq_work(&head->work, rearm_irq_work);
>>> +			irq_work_queue(&head->work);
>>> +			err = 0;
>>>  		}
>>> -		dma_fence_put(f);
>>>  	}
>>> -	dma_fence_put(&head->base);
>>> -	return false;
>>> +
>>> +	return !err;
>>>  }
>>>  
>>>  static bool dma_fence_chain_signaled(struct dma_fence *fence)
>>
>>
> 
> 
> 
> 

