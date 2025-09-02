Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5992B3F50A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 08:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ECEB10E59B;
	Tue,  2 Sep 2025 06:10:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="X7oJrzl0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2078.outbound.protection.outlook.com [40.107.212.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3EC10E597;
 Tue,  2 Sep 2025 06:10:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KPxrXMwmP78DYegelXSDTp0OVJlUEVRLVWQJUxmJEDvXw+PL4XW32PuQo/5sCJaazNRaWPbBffOQvY0Jvw6Fb+nxCz9mrjSnVIa92mEsPCCQ050bEwLIHwJsXl1oZPcuKuKNaxulwXFUbhwwAajjhR0QW1vjQR7YZgOGzwNJiruEQSqb7a1edTZqWwAm8NTT5fv9N5o3XzRf834ondO98ylqqYwtfWy0CbhBmQemkdRygQARnyy1BzSdIgJo5ffmxB+9x2mrLbn7IDL7RbQHt/2CyxW+Ce4xtotjIrEw/mUEzBq3R2Qb3hN9mLxBT6eMgm2Q/KQaKjpmo/PBLUa7wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOAwL6a26zujFKe9IOvfwj9cMuNIVY6DhyBjHZ9gFDI=;
 b=ClaWiN8lTUFJVP5jQ3neoh/IUEmsj+z3pqFrlRoIg5f2iwiGl00RXeRj/B9nZ22BEmVRRCgXHJ40JsCVtMs7alMwMnma6WYGRla1/Q2gqdmLWBjvC0PwK2qItAujmSMGgHINEwyXmru3nRVwTYQJPM6piFMqw8ircAlPlPa8LOVY4mv10XoMK6vB//hz3XS8l0bDcbM8gKSQnzmNkBcKByyZhTv+SAPOl9mc3XrLIJs4DNQMj263aCOVvc1uTSwXLUkLeUTvg2wV8Q8ZQlwXOvkbWoP1Mt0wtlNqUq4cwuJM+CNjMlC3NEsTnGaVK7wvWGPQhHyonGxqkog+uVQQ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOAwL6a26zujFKe9IOvfwj9cMuNIVY6DhyBjHZ9gFDI=;
 b=X7oJrzl0dVZUWWF1enNVaSFIkNQqF7msXOc9rxa3yYKPh158VPV1S687ekvBh5Qqloib00eaQWRcu15YngnzMpdky+ZAU9uSpMXZJ2cr/SCUTu8LVMtXliOj6tPr1vmAZGstjRsRkzZWUCNsdrJoVeaRmEZ4cokWkbai81DOvrs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by CY8PR12MB7540.namprd12.prod.outlook.com (2603:10b6:930:97::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 06:10:05 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%6]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 06:10:05 +0000
Message-ID: <5f999a32-db26-4964-8152-ac06da8beea4@amd.com>
Date: Tue, 2 Sep 2025 11:39:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] drm/buddy: Optimize free block management with RB
 tree
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>
Cc: christian.koenig@amd.com, matthew.auld@intel.com,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, alexander.deucher@amd.com
References: <20250901185604.2222-1-Arunpravin.PaneerSelvam@amd.com>
 <20250901194151.GJ4067720@noisy.programming.kicks-ass.net>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20250901194151.GJ4067720@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ac::11) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|CY8PR12MB7540:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c88d03f-36e6-46ea-ae05-08dde9e75bf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azFWdDdwdTlCMldiOE5KcjFkalprc2t5UVZwK0IrSGpWeHBkaUZVa1QzZmhl?=
 =?utf-8?B?bStPenNSNFlSU3pMSFgzMnRrZ0tYWkx2ekNVV0g5N0pVU1I4RkpFaGVvWGc2?=
 =?utf-8?B?SHhweXpLRG1sOVhQYitOcDlqb250dUwxbHRJMDF6RzJUTVRhMmdDNzNEL3B5?=
 =?utf-8?B?UUxnT2lBdCt3ZnZGRDhsNEhVQWRJZXdXMG5FeUQxeHh0cjRiSmg5TDJZZk4v?=
 =?utf-8?B?TWY0WWZUWUludDBDMW5mK0xsZGNiQkpvbHQzQXRsWXVJYUl6NEVjdmVaM2Z2?=
 =?utf-8?B?V2g0T1ZTNTNyNmdsSnZUb3B3N0N0VXRNUm1DdHlnZk5kcDlCMEdLb1pKdUFy?=
 =?utf-8?B?NWM4a1diRWhVSjN5SGVDOWk1VXFDc21ERW9DKzhkRDhwNFJSU0cwZlFUcXhk?=
 =?utf-8?B?Qi80bXM2d3I4SHZuZjY2MjdpMm1odjFuS2lxdWpIeWNJSVhlb3JYcjZhNUhk?=
 =?utf-8?B?MXFQbUNQYmtuTDB2aDJmUjFBRE9kMk5SbHo5OXdWODgrcHE1SHQ1bDhxUml6?=
 =?utf-8?B?TDJSMVhML3VHQjIyUFAxcE5mZHA1RWNEaWJETEZ3NXNuaERFSFdnM0FnYXNW?=
 =?utf-8?B?dGtHZU55WEtlMThTZmd1NlVTSXJyWXU0WDg0RU5CQnlHSm5wVHNSNkNKUEtn?=
 =?utf-8?B?ajRkaU95ZVljQnRPT0pFaWRGaGlxeHBSd0FUYkZvazlTQ0V1Zk4rQXdPM2Za?=
 =?utf-8?B?elNEbjZ4cStHNEtFSzU1TmVWbWpmdTgxK2dUTTlaSS93N3ppRFd2YXJkSkZx?=
 =?utf-8?B?Y2k2TERxdlVkUEEyQWhmdEpBbDR0NllIdEkvdlZUMmJuV3puR2UvSWRVVTNE?=
 =?utf-8?B?ZWMycjJ1TGx2MVduaUZHZGNzb2JzT2kwMzVSaC9mdUtFMzNaT0JBVmxQN1Fp?=
 =?utf-8?B?TnZWU1BpbGZUckphcVFuVHlROHdkWFJ1KzdJeGw0SnVtdDJnSXVHS3crbkRC?=
 =?utf-8?B?cmMzTFgyNllGdkZNTk5yWS9ZRzh2MTF0a0ZvaWFIcEFpY3Yxd1BXY1RSbllH?=
 =?utf-8?B?WnFHa2RWVmVYMjdYMmNsbTBnSFl6V0FtcWd4Z1hEZmVSRzRQc09CMXFEUEpC?=
 =?utf-8?B?b1VwZkx1ZzNWanFqOW42dkFaL3MrQTcvNWE4alNhNnBOZ2M4UnlxUWprQnYr?=
 =?utf-8?B?TlVJUlo5VVRvTXI2V0NCVlVrRWVpNFZuUnNKUHY5MElKU3hIWVdLTSt0TkNu?=
 =?utf-8?B?MlRkbEZYRDd5YlhCZFBBRmwxM3dPbGtWQTZWM0RkUmVMQmVJZ1E1U1JyUThi?=
 =?utf-8?B?VjJqZS9xLzlBM3lrVHVBSy9WQjdpTk5sbysrekFXVXlIS28ra09HZlRLZ2U2?=
 =?utf-8?B?dnBNRWxNcFhGV2J3eWpMOFllZ0l6YTZwQ2dKRDZCTks4ZWFYTEdUbE5kVjJC?=
 =?utf-8?B?YnVveE9FMUZZMnBXY05LL0xJODV1VjBqRTJORWR1eDh2WXJEd0M4dkhxa3J1?=
 =?utf-8?B?SEVkMUtQSVQyajVKZWFmdTQrWkhzSHI0Zkhsd1NkdStwSUxyV3JIeC83Rm43?=
 =?utf-8?B?QzlEbVlyU1pLQnlzdlVpNTZDRG1vMGorTW1sZnh5aHp0VGl5QytPelFEYjlK?=
 =?utf-8?B?QWxYM1JIUkcyQUFjV1lkYitPSU90c1h4L1lBM3Z3b2p0VldCUytWUWFqMGNj?=
 =?utf-8?B?SlFxZFlRZFo3TFordUhMV2F5d2xjNjZHVmFDa2xFUWtWZllrU011WnN0VUpW?=
 =?utf-8?B?K3B3WTMrQzJ5UldnaFNHOFVOeFhGQXdTUlZNUjB6clBuYnpHMWhLWFdWOW02?=
 =?utf-8?B?WldEaU1JQjI0NmhlMjV0aEhxakZXNEtKc3BNUWpLZ24wblFDbXYrNkthcWdE?=
 =?utf-8?B?RWs5RFpFWW1Zb1Q3a0RhVWpHMkdiYzRCVkhwUWY5SENGM3FMKzF1MnhwajVY?=
 =?utf-8?B?dXBUc1g2SC9VekJTeGRKWkxwRC8rbUtQUUpTZEZRQVhwcmJ0NFhmL001SnJh?=
 =?utf-8?Q?AIxfufvGvvQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGpOWWZMYUUrTkxQL3Z5RFVrMEluODVsUk1ocCtSYnNOa05reVpkWEtvZ1hs?=
 =?utf-8?B?alJQQlBVcW11aXBPZURpY3BjQlZzbmRsN0VFWHAwRVQyWFBTWDNPZWR2M0JZ?=
 =?utf-8?B?dXpXTE8rUzJ5cVFZdWk0OGsvd0MvYXY3cHFKemYvOW1GUlVFMHhUQkdiTEZI?=
 =?utf-8?B?WjF0cDBvaUtvb3FIeERkV2dpKzV1bEVNdjFPbEdRbkJtQmhYbmN0cGZpQmQy?=
 =?utf-8?B?VVpLNURBVGxlejVpRXRPdGJORXFmSENvQWFuTENZaWdqd0ZpQVhXOGZXVFNG?=
 =?utf-8?B?VnJoekpoZUlhMVpuaFF4c25pNmdtaXl2b2x0a0VVWGlieCtjaHdjRkVoZjJq?=
 =?utf-8?B?TVlxd2h6WjY5TUU4aWx6aExmTFJyendmeGZZdXU2bTc3Y0svaUxTTnNWQmpE?=
 =?utf-8?B?RDMrb0RIYVFiNVhSN0tEZE4vVkxjbXRTMEdaaEQva1ZWa1p6UERTdVowYlF6?=
 =?utf-8?B?Wjd3c0lUOWlyNTlkVHRDKzhBSDJQWTR1a1hwZnhyemdMQ2hNNW1XSWYvZnFx?=
 =?utf-8?B?WHdHSm9oNlBjcUZ2VDJDKzExVzBoRHZpSlpvbTZCU1U0b1lKMDYxOWx1YWdI?=
 =?utf-8?B?aWVaV2JDdEthWGdhc2dRd3ZqMDVxRnBNdE13SDRwTW1hblhVMlYxUzZSYThz?=
 =?utf-8?B?U09STFY2MVZaQWp3N0xraUU0ZlVSTUx1NVUwUGlNdENIUU9PQ3gxODhtRzJh?=
 =?utf-8?B?S1JMeWhzUWw1N1dyZWdIM2EvaHZ0Q2swSlpmNGhhUzNLdG0xY2lMMmhTejI0?=
 =?utf-8?B?MFBVRUpjTXpOSjFjM2J6d3dDaDc2aHFIOVZZZlNUWTJOck44Wktzc1BXOEZD?=
 =?utf-8?B?Z01kQXhLSW00UHhDaHpIeURSbkFLV1N4VGVKQVhPRVIwNFZuaksra3RBSzMw?=
 =?utf-8?B?TFJ0bXVvSFlGWEorVlJmM0lMNGMvdUt1K2tLRExXN1ZFOHpXK2d2NExZV3Y4?=
 =?utf-8?B?ZjVmQnpaWWNyU0I2VVc4UGxyV21BVVhLWk5UZ3o4bkRrYnp6NWVHSWNJbTkw?=
 =?utf-8?B?S25KMGRWdmVnMjBZM21YQVF5RElNNGgzbENWYXZqUU45OVJxb0VteDlMc0pV?=
 =?utf-8?B?TklTZ1RibUZaQm1vS2FhRlQ1VFBZWWU0K3kxQldXOHhzdEdtMEFYY1E4ZWZo?=
 =?utf-8?B?YU5CZHBZUldpTkZYVm16OThZUWU5NzFJZStXbjdPOWRZUkIwYjZIVHYrNzRz?=
 =?utf-8?B?UTJ5aDNKNnZlOG16eWh0SUJnU0s3aUwxVmk1alBab0hXRXNBcUhaZ1pYQXZP?=
 =?utf-8?B?bWJOQldkS2NaeEg1OTFZVU1LZ0VET2ZLWFptdSt0UzA1U2tRdUd4WDhPN1pB?=
 =?utf-8?B?Q0tLdlhmUWVFbEVQcmxTTVNEZitBdU9xOVcza2c4SytlYVdtZGt1d3NOcUkw?=
 =?utf-8?B?RnRYSlZ2TWcvUlRvSFQ3NUgvS0N0a3FBQjgrTkE4cDJHZ2JNVHNLazg4N3Q0?=
 =?utf-8?B?UURlenVRMzdXWFdQWGpBT3N5K0txVVp0SjVlZnptR0dJRHJ3OHhZUXBvYlhm?=
 =?utf-8?B?K2JlR1Ard1VmL3UzZmE4NmgxdTlET2FBaUVNVko4N2Y2V2dVOUwvV1g1L0U5?=
 =?utf-8?B?K1N5Nk1FcmxrSEhrYWdRTnNsdjdSblVnTkd4akttREtqQlZ0cnIwak1aVGls?=
 =?utf-8?B?dHBkQUNaTk42cDR3Q2JJS2Q3dDQyUld1ZlZabmhQQW12cDk1MzhiTFA4Njh2?=
 =?utf-8?B?UUVuS1ZvWEQ4N3RNY0lQcW9ObGlnWE5STXRYSjJJTHppOERvZy9TQ1ZFTlJ4?=
 =?utf-8?B?d0dSYTRJaU1tKzhaTHZjZ0hKWVMvSGtrSUFOT05meHVLMzdRNThqNkplSDBj?=
 =?utf-8?B?bUNUYUZnMERnRHBEWmRkU1hpdWVCM01ZOGw1OTlzYkw4QTV2Wk1iS3d4by9T?=
 =?utf-8?B?dCtROG80akZ2TmcwWEtOaHJENFFiT3VJTjVoL3IrV1lJdVlLQXArYk9HRmZG?=
 =?utf-8?B?c2xJTmpIZ0FQQjhRYVFlRkJ0T3Axc21qU3d0dFV6eTdLL1M0dWxVbXlDUEgw?=
 =?utf-8?B?SlFhNTkvYlhvcGtGOGIwelpTY2hrWHBQRThaS2xhMFczbTJ0Z3NsQ3pVRXlu?=
 =?utf-8?B?N2xIQUJjM0Q0RnFmdHRpRXg5ZU1QWjQ4Z1JTOG0zSmdwYnlhak4rTUdkVkJV?=
 =?utf-8?Q?PFWUzxB+NRnUmA/fhLAFCjONM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c88d03f-36e6-46ea-ae05-08dde9e75bf6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 06:10:04.9955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VxPvxNNUxGRkZBSC/Jit53w7MGRWd8d+cns09KZ4q4QJoU0dCutmxgo4PGbVe7FooMl7ML5rX/BK4k/cds0WJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7540
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


On 9/2/2025 1:11 AM, Peter Zijlstra wrote:
> On Tue, Sep 02, 2025 at 12:26:04AM +0530, Arunpravin Paneer Selvam wrote:
>> Replace the freelist (O(n)) used for free block management with a
>> red-black tree, providing more efficient O(log n) search, insert,
>> and delete operations. This improves scalability and performance
>> when managing large numbers of free blocks per order (e.g., hundreds
>> or thousands).
> Did you consider the interval tree?

In this allocator, free blocks are tracked individually by order and not 
as arbitrary ranges. The

operations are keyed insert/delete/lookup, for which an rbtree is 
sufficient and simper, AFAIK.

>
>
>> @@ -41,23 +43,53 @@ static void drm_block_free(struct drm_buddy *mm,
>>   	kmem_cache_free(slab_blocks, block);
>>   }
>>   
>> -static void list_insert_sorted(struct drm_buddy *mm,
>> -			       struct drm_buddy_block *block)
>> +static void rbtree_insert(struct drm_buddy *mm,
>> +			  struct drm_buddy_block *block)
>>   {
>> +	struct rb_root *root = &mm->free_tree[drm_buddy_block_order(block)];
>> +	struct rb_node **link = &root->rb_node;
>> +	struct rb_node *parent = NULL;
>>   	struct drm_buddy_block *node;
>> -	struct list_head *head;
>> +	u64 offset;
>> +
>> +	offset = drm_buddy_block_offset(block);
>>   
>> -	head = &mm->free_list[drm_buddy_block_order(block)];
>> -	if (list_empty(head)) {
>> -		list_add(&block->link, head);
>> -		return;
>> +	while (*link) {
>> +		parent = *link;
>> +		node = rb_entry(parent, struct drm_buddy_block, rb);
>> +
>> +		if (offset < drm_buddy_block_offset(node))
>> +			link = &parent->rb_left;
>> +		else
>> +			link = &parent->rb_right;
>>   	}
>>   
>> -	list_for_each_entry(node, head, link)
>> -		if (drm_buddy_block_offset(block) < drm_buddy_block_offset(node))
>> -			break;
>> +	rb_link_node(&block->rb, parent, link);
>> +	rb_insert_color(&block->rb, root);
>> +}
> static inline bool __drm_bb_less(const struct drm_buddy_block *a,
> 				 const struct drm_buddy_block *b)
> {
> 	return drm_buddy_block_offset(a) < drm_buddy_block_offset(b);
> }
>
> #define __node_2_drm_bb(node) rb_entry((node), struct drm_buddy_block, rb)
>
> static inline bool rb_drm_bb_less(struct rb_node *a, const struct rb_node *b)
> {
> 	return __drm_bb_less(__node_2_drm_bb(a), __node_2_drm_bb(b));
> }
>
> static void rbtree_insert(struct drm_buddy *mm, struct drm_buddy_block *block)
> {
> 	rb_add(block->rb, &mm->free_tree[drm_buddy_block_order(block)], rb_drm_bb_less);
> }
>
>> +
>> +static void rbtree_remove(struct drm_buddy *mm,
>> +			  struct drm_buddy_block *block)
>> +{
>> +	struct rb_root *root;
>> +
>> +	root = &mm->free_tree[drm_buddy_block_order(block)];
>> +	rb_erase(&block->rb, root);
>>   
>> -	__list_add(&block->link, node->link.prev, &node->link);
>> +	RB_CLEAR_NODE(&block->rb);
>> +}
>> +
>> +static inline struct drm_buddy_block *
>> +rbtree_last_entry(struct drm_buddy *mm, unsigned int order)
>> +{
>> +	struct rb_node *node = rb_last(&mm->free_tree[order]);
>> +
>> +	return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
>> +}
> rb_add_cached() caches the leftmost entry, if you invert the key, the
> last is first.

With inversion, the in-tree ordering changes from natural ascending 
offsets to descending,

which can break assumptions in existing buddy allocator code that 
expects ascending order.

>
>> diff --git a/include/linux/rbtree.h b/include/linux/rbtree.h
>> index 8d2ba3749866..17190bb4837c 100644
>> --- a/include/linux/rbtree.h
>> +++ b/include/linux/rbtree.h
>> @@ -79,6 +79,62 @@ static inline void rb_link_node_rcu(struct rb_node *node, struct rb_node *parent
>>   	   ____ptr ? rb_entry(____ptr, type, member) : NULL; \
>>   	})
>>   
>> +/**
>> + * rbtree_for_each_entry - iterate in-order over rb_root of given type
>> + *
>> + * @pos:	the 'type *' to use as a loop cursor.
>> + * @root:	'rb_root *' of the rbtree.
>> + * @member:	the name of the rb_node field within 'type'.
>> + */
>> +#define rbtree_for_each_entry(pos, root, member) \
>> +	for ((pos) = rb_entry_safe(rb_first(root), typeof(*(pos)), member); \
>> +	     (pos); \
>> +	     (pos) = rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member))
>> +
>> +/**
>> + * rbtree_reverse_for_each_entry - iterate in reverse in-order over rb_root
>> + * of given type
>> + *
>> + * @pos:	the 'type *' to use as a loop cursor.
>> + * @root:	'rb_root *' of the rbtree.
>> + * @member:	the name of the rb_node field within 'type'.
>> + */
>> +#define rbtree_reverse_for_each_entry(pos, root, member) \
>> +	for ((pos) = rb_entry_safe(rb_last(root), typeof(*(pos)), member); \
>> +	     (pos); \
>> +	     (pos) = rb_entry_safe(rb_prev(&(pos)->member), typeof(*(pos)), member))
>> +
>> +/**
>> + * rbtree_for_each_entry_safe - iterate in-order over rb_root safe against removal
>> + *
>> + * @pos:	the 'type *' to use as a loop cursor
>> + * @n:		another 'type *' to use as temporary storage
>> + * @root:	'rb_root *' of the rbtree
>> + * @member:	the name of the rb_node field within 'type'
>> + */
>> +#define rbtree_for_each_entry_safe(pos, n, root, member) \
>> +	for ((pos) = rb_entry_safe(rb_first(root), typeof(*(pos)), member), \
>> +	     (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member) : NULL; \
>> +	     (pos); \
>> +	     (pos) = (n), \
>> +	     (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member) : NULL)
>> +
>> +/**
>> + * rbtree_reverse_for_each_entry_safe - iterate in reverse in-order over rb_root
>> + * safe against removal
>> + *
>> + * @pos:	the struct type * to use as a loop cursor.
>> + * @n:		another struct type * to use as temporary storage.
>> + * @root:	pointer to struct rb_root to iterate.
>> + * @member:	name of the rb_node field within the struct.
>> + */
>> +#define rbtree_reverse_for_each_entry_safe(pos, n, root, member) \
>> +	for ((pos) = rb_entry_safe(rb_last(root), typeof(*(pos)), member), \
>> +	     (n) = (pos) ? rb_entry_safe(rb_prev(&(pos)->member), typeof(*(pos)), member) : NULL; \
>> +	     (pos); \
>> +	     (pos) = (n), \
>> +	     (n) = (pos) ? rb_entry_safe(rb_prev(&(pos)->member), typeof(*(pos)), member) : NULL)
>> +
> Not really a fan of these. That's typically a sign you're doing it
> wrong. Full tree iteration is actually slower than linked list.

I understand your concern about full-tree iteration being slower than a 
list walk. In our current use cases, though,

the cost is not on the hot path and performance is comparable or even 
better to list traversal. We occasionally need

to walk the full set of blocks to perform specific operations, and these 
macros make that code simpler and

less error-prone. They aren't meant to replace targeted lookups or 
bounded walks, just to cover where a full

traversal is necessary.

Thanks,

Arun.

