Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2836AE3913
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 10:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF46B10E05E;
	Mon, 23 Jun 2025 08:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IqovGrNM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2052.outbound.protection.outlook.com [40.107.96.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA5610E05E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 08:54:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ruUYfB/icBkjHLvr4auglkc+1EJUKAxmqovCHyD8+IxwBB8H10Ou4kiRIRrom1hR+6izvPaV/WS/BJE8lWbjr8MqoxCPfEWrItTZngIh9q6sNStvhaLbiK0k603YAH71gQB1NWA/V13Oy2JBbCgmuyT4J9w/XaeO13mT9HM60s5kcilIrXPbzs2L5rZ7PW1fPJUCbHAeKsf2gjK1pSABOq+AsTLXLGLn27oqL6bbE09RygmCcjesXPyfXGw3Nu2SL9yguIoilvMbVTqVp/3Pk4URWsTfeU61Njr8h8ExavEnoM3EIHa2J3S2kTCD+XVmCZq5dBIpMzdWnbNJjBXFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z29lo/FMVUpO4QZWbzUKbvyg1jPJOPDZr62NSR12s5o=;
 b=HLyqfrnftNveiIM/JpF91cdOi/iQ/bqGMocLq7wRScQkLMp/kowwQkbdjY5ZtGNKCtACaiMEG25kLZBYp0aEukJ2ssKBWQxhsoJvDWkhLlBOhfYyFyPIIoRQSyHTyWYe+nRHCz/KmB393JT8wj5ntbXF+88/GX4JDnGi8qKrqJqfrR1xW+fl0KO54xLQ/L08HPUKacRiddA5SwbGfxrhQTtjoLMfMjGc6QaM/6OBjszrJhXsdYcwSQ6frd2zuyb8TO9CW/u2rTAz0vbSIVtY3TxKweIX5aSNpeVBAeJsbMxuqsoU7H5Ul6ceSArOjblRx27v4i6slPDNIPVCmYLH+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z29lo/FMVUpO4QZWbzUKbvyg1jPJOPDZr62NSR12s5o=;
 b=IqovGrNMtnqCYMie3EEgWQA5bhDlT6fXB+ApdJ87LxHEt1Y3715gSc3SZY0dXPmN7SL31JswrSMRaDdCoqw+uxLSneDic69CZFOb30rZY15UUholutnzXX6Oh2A6pncHWE7MTXLUG2RpZ8Se7EQAICLlkqsyuJMEWfV6cSKby6E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB6988.namprd12.prod.outlook.com (2603:10b6:510:1bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Mon, 23 Jun
 2025 08:54:28 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 08:54:28 +0000
Message-ID: <724720cd-eb05-4fc0-85a1-f6b60649b1ad@amd.com>
Date: Mon, 23 Jun 2025 10:54:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm: add gpu active/reclaim per-node stat counters (v2)
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>, Matthew Brost
 <matthew.brost@intel.com>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
References: <20250619072026.635133-1-airlied@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250619072026.635133-1-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB6988:EE_
X-MS-Office365-Filtering-Correlation-Id: 1231c5e3-9c70-4ebd-7a8b-08ddb2338fdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGJocERUWEl3OHhTeHB5U0d4OFdiT2JCOUQ5MHd1czhjSXBHSEltbTdUY2lt?=
 =?utf-8?B?STNXTHVIdTVSRW9hWStabHBuL0ZoVlVQWmljZko1bHA3NUcvYTRtYlR1T2Vo?=
 =?utf-8?B?cVRVNFZBbGdyQ0NaNUcxQWRLN0ZQeFNueUN4K1NTYXpWYWd6Q3VLMElicjRZ?=
 =?utf-8?B?UVBOMWxCdGlHWm1OY2w0UENmNjdKblZweC9xMVhXRVluNERHRnFTRDFKbk12?=
 =?utf-8?B?VE1rL2t0T1o4clg3eTBSQkM5R0EwSHZMZTRHQzhuRmhsU28rSmhaOW9pU1g1?=
 =?utf-8?B?ZkNreFNEVnFaSHAzaXVVNW1hMjBOd0VUaHZCaTI4U2c0UjVyRiswN2pXUUVP?=
 =?utf-8?B?TTJBcklQcUgxTmNmM0Z4VTA0SmZGaUdLK2dKNno5VjBaYXV5dXkzcStFajFW?=
 =?utf-8?B?S1ZVNU1YM2tEWXJzNDE3dEkxM3NmaWdNdE5GK1JrejdNdkNhK2lTRzVEQysr?=
 =?utf-8?B?TCs1b2V4UktHRVhscUFSZzJBdHVpZE1YOG1oQ2VIVXRVYWg5cnlFSWd5RTF0?=
 =?utf-8?B?QUZWVHg1amwzbHdrYVlzbUZmNkV3UzVncXE0cloxYlVvL2hPcFNCYzJrcVdw?=
 =?utf-8?B?S2NiTGJ6eUpoRWdFcFhxOEYxeXEwNWhGd2hLYnJyUnBnemtPZUdoNGFMM2NF?=
 =?utf-8?B?Q3lzT0FsYUFiTUg2UC92M1pCV0toMStYckNwekhRUWRGbURYTnR3b3dlN0xq?=
 =?utf-8?B?eVpIZEVvNmRIMXFtV0lQWHhsMmFRSGVOUzA1ZGdBRWptZ2J3ZWhNMW9QWkJv?=
 =?utf-8?B?MGNFckhtU3RjUVpTMkVHUGpVUFNQZ3YvaDFmUlZ4OWh5YVMvcW9SdDRiZ2tq?=
 =?utf-8?B?d25lQ2lOR1A3YjB1b3VGK3FiQzZjUjZnUWJoSXBOdGFyenpWVGlyajc4Mmhz?=
 =?utf-8?B?OXNYRGdGSHFXUDByRWMvY05idFZUU0tvR2w1VjFiMkxOSnNBbHZWWkhGVGxm?=
 =?utf-8?B?Y1BGYXg1bTZFZEpxK3dHT2VXNkg0SmQzNHJtcldMQ1lVSVcvWm42eGZxTVlx?=
 =?utf-8?B?SUM3eU1zZUFFLzBPd1V0aGZ6NUZDczNmbDV3WnVEakNkS0twQVgza09vcFVi?=
 =?utf-8?B?NXhxU2M2ZzFpRVhhSGpSSUNLRnFHSGF2d1ZzN01KMTNtdE4rOElrVmRadnBt?=
 =?utf-8?B?L25GQ1JGNkszT3k0Wmd4ZWxnTVFRdHl4NmZTdDVnWHlJRnFUT2YzZzBCWUZ3?=
 =?utf-8?B?RkFIK3AwMUYxYWw5aEliZ0wvR2dRRWRDSDJsNnZ0N0QvZm1ySEU3K2JOU3Y0?=
 =?utf-8?B?NDJkTHRXdmZlcTB1ZW94L3h5TWNJOWdZNXc4RTBLNHpIZGE1d0JwRXJVMndL?=
 =?utf-8?B?L20yanlnaGdNcS9sSWd2YmZNMVIwdDlXRUdNME9HZXM1TDZkQyszLzRNMlc1?=
 =?utf-8?B?cXVMeWFNSnF1c2Z3aDUyNTg3OW5RakFaN0F4VGVTMS9nMSs1Z1dGT2JKWEsx?=
 =?utf-8?B?SE9scjN3dks0UGNTOUVpMWlDS01BZ1NYbm5XdVIreTRJMGlCQVVqRzBuOUJx?=
 =?utf-8?B?MGdtTDRHd3pzZmZBTGF1OFBZTEk1bDVQUHA2TzlnRU54QVl2RXk0ZmVxUTNL?=
 =?utf-8?B?cFN6cXA2NHU5YmhrMXFCVXFNL1NqTm10RzdqbkxBZElVSENGMzZmZ2hmQVFa?=
 =?utf-8?B?UFV6YjU1SHhwd1JVZk53OFAzVVVZd21oSlhpWjhQdjhjeEFkR1dQbHRXR293?=
 =?utf-8?B?Y1VxOFlGZnpSeXdxTnppSHJGcXlMenJyeWpoQ3ZuYmRvYmw0eWVvWEZsdmhh?=
 =?utf-8?B?TUEzaXk2ZTVWaFNVbEFBWXdQU3owN3VKTHhrci82ZWJFNm5CWFZvYUV1czln?=
 =?utf-8?B?RCt0blcyZWdVQ1Bsb0ZTSURoaldYZVU5YW00eHZQYThMMndSWmZ5dTFnNkU1?=
 =?utf-8?B?ZmN2VnpueEM2T3RjVGk0VG85ZHFhUXh5MmwzN01DQnFGTThsMkJhS0NOVzBK?=
 =?utf-8?Q?0uxJcnZ9Zak=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWJXalRSNm9lSEJZUVpHcC9EbGlFYkpQKzRrRUtORkI3UjBoczRKRjdZNWFk?=
 =?utf-8?B?eVNKWlJGNDV5SlVtSnBUbk83ak1nak5PWktkQzhHQnYwOXpxNGhNc1NtUVI5?=
 =?utf-8?B?UjBuUFlDei9nT2x1U1dvSUtyR2ZoUVRSWDQwUGgvdlhGUVRRR0ZUWU91VS9a?=
 =?utf-8?B?Q3BleFZiVWlyVVg3d1VHOHRYeC9DVmQ0SGpBaWdJNm5jUkpjT3VLY1dST3dp?=
 =?utf-8?B?bHg5NWZzWVhrVk0xVTBTRzBGOGtLbFdNelBodWNPR0cyckFvS1FlcUM2M04z?=
 =?utf-8?B?OGZrUlZ4MXg0akZSRnlGbU5uWjNGYnhpQ1g5ZkwrY1djeWZGb2Q2TDdhRU1h?=
 =?utf-8?B?d3RBeXFYVDA0WHVsVi9HUWF4dTV0M09CdHFCSnhQN1BTNFpOSHN5T3NQaERo?=
 =?utf-8?B?Uk9nYXN4bk1DQTJPNUVNdDZlZmFURHNkTEFQdDZPRm95aituRE1XdVhDNjl1?=
 =?utf-8?B?MkM4aUE2dXlWWHl6MEZiRkhFZUF1WUZ6OEt2MmF5NmN5cC9rRHJkTUdNWG9Y?=
 =?utf-8?B?cVpuRXJUN0dTTkthT3BoZ05XeXFwSlJuVGtCTUJVT1pGazVhWkQ1bFVpdzBy?=
 =?utf-8?B?eEFWM1FOZUV5dHBkNzEwUXRJLytYMnVDempyeWFmV3FISnl1TW10cWJMZEZT?=
 =?utf-8?B?dnRZUkZ0d2RXeDJ0eHp3dDJUdWp4c3IyeTRQazhFamhHNkEwZVdmMjFRNGVh?=
 =?utf-8?B?QjNrby90d2dLMG1wZnMzOVhyYWx0VGl0RnFkS0ZCUEx6bHB5cUo2SEcwMUVK?=
 =?utf-8?B?NmVIeVE2Tm9mMFVuODlQOXdsVFZOQmNVYTJNWE4zZGdQN2hoY2drclFxK0dN?=
 =?utf-8?B?Wi9Fcko4eTd1ZjRsUnBRTTAzeUYyVDBlQk52NUk3R1BPMmF1ME1CTSt2MWxm?=
 =?utf-8?B?VUw3aVBSQkNkeFNJWmNnNU01ZmhnVis4ZW56RVh1RUlkekk4WFpkRXRDVVZj?=
 =?utf-8?B?SFJRWGVHejY1RFA1ekpWYXBsaHVGZTBxTFdBUXFCNEdaSmVpS3VSbzh6N0Y4?=
 =?utf-8?B?bEo0cDlNVGRZK1d4V05PUkhxSGwxWWVTVXVzL2NPeWRSSEF5WXdpb1BFTmRs?=
 =?utf-8?B?WnNOUmg0ZXhtOUFaVWVCZGRZZ09JYlB5MUI4K2dyR1VjWDlBTlVKakZzTFhj?=
 =?utf-8?B?OFFWdzc5UkRzaUJ4TmlDbTh5b3VPcXA4UmphVjB3Z2tjT2hoMEI5RjJwWnNi?=
 =?utf-8?B?ZjJzVC8zQy80Y0tyQ251UEdxLytlaU5JRGRSVGxkTWMySElmcEZ1S1dlblRF?=
 =?utf-8?B?L1lFcnJ6SEpyWkNNSnlhOTd3VUxSVnRBbnFzY1dxb2g5a1dtcG11d2NOMS9S?=
 =?utf-8?B?YlZPaHFnM3NvbGhWM253M01KeTJEclhxdFlxQ2FDay9MdnpUZnM4UFoxRnh2?=
 =?utf-8?B?SlFVUlhTc3FHbUpHWFFVRGVzQU9scURRd2hoMEl1d1QrZUJRR0ZkdHhQZnU1?=
 =?utf-8?B?ZFYvNjFLS0JIdzN2OW1XRCs5NGNnN2pQNittM3ViQU5EdWpaQ3ZsUWhmWXdO?=
 =?utf-8?B?U3psUmFoUEdPOHpERjdlR1Y2aDhDbWtWVFlVdDVoZlpvY0ZQYUs1d2I4YzA5?=
 =?utf-8?B?T2szUlVQc2xqWVlMWEQvbDU4VlErUjNicEpSUHIwZFIwQjBaOG1CWVQvVVJV?=
 =?utf-8?B?d3ZLZERjUFhreGw0TUVjT2hoK2xKY01vdTI3OGpjT083U3ZaUFcrNGJoQzBI?=
 =?utf-8?B?d3dTQ0l5Q0pWbGlQcEFMUmM4WW1WdmxiUEhPU1pMczl2SGt2OWFJL0FJTitS?=
 =?utf-8?B?WnhBcXJ0SDhTdCtUSitQMjFPR2U0cmMzVnZUUzlSa3JjMWZuakNjeGluRnB0?=
 =?utf-8?B?eXdSSzdLU21xVWFVcU9iSUo1UVdscUZraFIycndpRWcwWCtCVXpNbVluY0cw?=
 =?utf-8?B?c3RSakFmdGFSWlNqc0t3MndvWjBUSW5QRmtocjNJYURQUWtkL003K2sveXZZ?=
 =?utf-8?B?UzZRdXBVNXRSK0ZGTUZJdzYrOGJVYy8wQWF0b3laRlRiTGxYVHM4cTNKWVhu?=
 =?utf-8?B?ZW9HWkM0YXJQYkhENUFRSGlFV3hxK2prRDgvUnRweWl6ZlpZRGdtMTZ4OHJX?=
 =?utf-8?B?RHk0NCthbkhtdHpSaTZ0cWtKRTAzMW5WSjVLNnN6cTFwcU91MnpJaWpSN0xl?=
 =?utf-8?Q?eyFE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1231c5e3-9c70-4ebd-7a8b-08ddb2338fdb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 08:54:28.5018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUIwLeYqG2yXDBJHUMGnn9XCr1Q7afUn4SBVQegFAnz19O59XDnlBeuKtruU5OXF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6988
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

On 6/19/25 09:20, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> While discussing memcg intergration with gpu memory allocations,
> it was pointed out that there was no numa/system counters for
> GPU memory allocations.
> 
> With more integrated memory GPU server systems turning up, and
> more requirements for memory tracking it seems we should start
> closing the gap.
> 
> Add two counters to track GPU per-node system memory allocations.
> 
> The first is currently allocated to GPU objects, and the second
> is for memory that is stored in GPU page pools that can be reclaimed,
> by the shrinker.
> 
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: linux-mm@kvack.org
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> 
> ---
> 
> v2: add more info to the documentation on this memory.
> 
> I'd like to get acks to merge this via the drm tree, if possible,
> 
> Dave.
> ---
>  Documentation/filesystems/proc.rst | 8 ++++++++
>  drivers/base/node.c                | 5 +++++
>  fs/proc/meminfo.c                  | 6 ++++++
>  include/linux/mmzone.h             | 2 ++
>  mm/show_mem.c                      | 9 +++++++--
>  mm/vmstat.c                        | 2 ++
>  6 files changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
> index 5236cb52e357..7cc5a9185190 100644
> --- a/Documentation/filesystems/proc.rst
> +++ b/Documentation/filesystems/proc.rst
> @@ -1095,6 +1095,8 @@ Example output. You may not have all of these fields.
>      CmaFree:               0 kB
>      Unaccepted:            0 kB
>      Balloon:               0 kB
> +    GPUActive:             0 kB
> +    GPUReclaim:            0 kB

Active certainly makes sense, but I think we should rather disable the pool on newer CPUs than adding reclaimable memory here.

Regards,
Christian.

>      HugePages_Total:       0
>      HugePages_Free:        0
>      HugePages_Rsvd:        0
> @@ -1273,6 +1275,12 @@ Unaccepted
>                Memory that has not been accepted by the guest
>  Balloon
>                Memory returned to Host by VM Balloon Drivers
> +GPUActive
> +              System memory allocated to active GPU objects
> +GPUReclaim
> +              System memory stored in GPU pools for reuse. This memory is not
> +              counted in GPUActive. It is shrinker reclaimable memory kept in a reuse
> +              pool because it has non-standard page table attributes, like WC or UC.
>  HugePages_Total, HugePages_Free, HugePages_Rsvd, HugePages_Surp, Hugepagesize, Hugetlb
>                See Documentation/admin-guide/mm/hugetlbpage.rst.
>  DirectMap4k, DirectMap2M, DirectMap1G
> diff --git a/drivers/base/node.c b/drivers/base/node.c
> index c19094481630..64406862314b 100644
> --- a/drivers/base/node.c
> +++ b/drivers/base/node.c
> @@ -463,6 +463,8 @@ static ssize_t node_read_meminfo(struct device *dev,
>  #ifdef CONFIG_UNACCEPTED_MEMORY
>  			     "Node %d Unaccepted:     %8lu kB\n"
>  #endif
> +			     "Node %d GPUActive:      %8lu kB\n"
> +			     "Node %d GPUReclaim:     %8lu kB\n"
>  			     ,
>  			     nid, K(node_page_state(pgdat, NR_FILE_DIRTY)),
>  			     nid, K(node_page_state(pgdat, NR_WRITEBACK)),
> @@ -496,6 +498,9 @@ static ssize_t node_read_meminfo(struct device *dev,
>  			     ,
>  			     nid, K(sum_zone_node_page_state(nid, NR_UNACCEPTED))
>  #endif
> +			     ,
> +			     nid, K(node_page_state(pgdat, NR_GPU_ACTIVE)),
> +			     nid, K(node_page_state(pgdat, NR_GPU_RECLAIM))
>  			    );
>  	len += hugetlb_report_node_meminfo(buf, len, nid);
>  	return len;
> diff --git a/fs/proc/meminfo.c b/fs/proc/meminfo.c
> index bc2bc60c36cc..334948744e55 100644
> --- a/fs/proc/meminfo.c
> +++ b/fs/proc/meminfo.c
> @@ -164,6 +164,12 @@ static int meminfo_proc_show(struct seq_file *m, void *v)
>  	show_val_kb(m, "Balloon:        ",
>  		    global_node_page_state(NR_BALLOON_PAGES));
>  
> +	show_val_kb(m, "GPUActive:      ",
> +		    global_node_page_state(NR_GPU_ACTIVE));
> +
> +	show_val_kb(m, "GPUReclaim:     ",
> +		    global_node_page_state(NR_GPU_RECLAIM));
> +
>  	hugetlb_report_meminfo(m);
>  
>  	arch_report_meminfo(m);
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 283913d42d7b..458a3465dd8f 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -241,6 +241,8 @@ enum node_stat_item {
>  	NR_HUGETLB,
>  #endif
>  	NR_BALLOON_PAGES,
> +	NR_GPU_ACTIVE,          /* GPU pages assigned to an object */
> +	NR_GPU_RECLAIM,         /* GPU pages in shrinkable pools */
>  	NR_VM_NODE_STAT_ITEMS
>  };
>  
> diff --git a/mm/show_mem.c b/mm/show_mem.c
> index 0cf8bf5d832d..072d33a50148 100644
> --- a/mm/show_mem.c
> +++ b/mm/show_mem.c
> @@ -255,7 +255,9 @@ static void show_free_areas(unsigned int filter, nodemask_t *nodemask, int max_z
>  			" sec_pagetables:%lukB"
>  			" all_unreclaimable? %s"
>  			" Balloon:%lukB"
> -			"\n",
> +		        " gpu_active:%lukB"
> +		        " gpu_reclaim:%lukB"
> +		        "\n",
>  			pgdat->node_id,
>  			K(node_page_state(pgdat, NR_ACTIVE_ANON)),
>  			K(node_page_state(pgdat, NR_INACTIVE_ANON)),
> @@ -281,7 +283,10 @@ static void show_free_areas(unsigned int filter, nodemask_t *nodemask, int max_z
>  			K(node_page_state(pgdat, NR_PAGETABLE)),
>  			K(node_page_state(pgdat, NR_SECONDARY_PAGETABLE)),
>  			str_yes_no(pgdat->kswapd_failures >= MAX_RECLAIM_RETRIES),
> -			K(node_page_state(pgdat, NR_BALLOON_PAGES)));
> +		        K(node_page_state(pgdat, NR_BALLOON_PAGES)),
> +		        K(node_page_state(pgdat, NR_GPU_ACTIVE)),
> +			K(node_page_state(pgdat, NR_GPU_RECLAIM)));
> +
>  	}
>  
>  	for_each_populated_zone(zone) {
> diff --git a/mm/vmstat.c b/mm/vmstat.c
> index 429ae5339bfe..25a74cf29473 100644
> --- a/mm/vmstat.c
> +++ b/mm/vmstat.c
> @@ -1281,6 +1281,8 @@ const char * const vmstat_text[] = {
>  	"nr_hugetlb",
>  #endif
>  	"nr_balloon_pages",
> +	"nr_gpu_active",
> +	"nr_gpu_reclaim",
>  	/* system-wide enum vm_stat_item counters */
>  	"nr_dirty_threshold",
>  	"nr_dirty_background_threshold",

