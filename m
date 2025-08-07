Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3481CB1D54B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 11:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E27B10E817;
	Thu,  7 Aug 2025 09:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nyor+5/K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E393010E804;
 Thu,  7 Aug 2025 09:53:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/i5asBy/AGWtP+1O+BRFyU4E5kr5pxnf3mbIGAp2hW2DR0TULIcDB0evj8XAr0AtKhUuvBwhjPr0B3CpOvF4V3aGYDPkDPQI72h+S8FPX3yXr9/MhA7xBuTsCDPxC+M+XnwFa1z27772TC+6deuWw+cV/RQ//YmCK0vnG4Q38vQl+/RjcRzdJeFBs/PQbPOZIMgkv2Amz3E5gbz0kfHYOT8L13WqHk6KvapwX6+Btyksg3JORIabwemCBrEp6sRfqFQVxxY1FQhDOJ/E667lfSsT0kiDfxhW4BNoep4cWkN0mEFrYm9ZzFtBt0GM4c6G21tEmKOlkC7m8x8ejK4hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qide0DHRZ7FVHjV5uQr+mftKy3JupxTbMxd1/pJ3jDI=;
 b=Tobr8G5NXSBLkSXgi3is5hyslRAWFuexmR+7gcgFuIEE/E8yAdc0qbOJewqwvPkPxI24z2qKcZPQ7osO5CxYwsq7JGUFS/eHXmo5tggj0Wey2SXwoOy/7ayPNIoJLCVyZ4M9i7LQ+O96mW58AFvBYugI1mIpiNjkmf6yfGxxfXAdywatbhmRp3fTvVVNCszm8LTc7x/JYV+j79PieiS5gXxkytcisaYy9XiBhBgUWIzNhanTdjDPMg1hJFLBgv8+0QbkuHCUabAA3esiOTUM/DvanV6v1zi6SLJNiCoDAw9bap3DO+Ahok8BY+erhG4ppzg6DIrbYDK+T0jyzKyiTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qide0DHRZ7FVHjV5uQr+mftKy3JupxTbMxd1/pJ3jDI=;
 b=nyor+5/K3BgTLENAW53iniDc9BVCYTtzH/TtBAv7bIjw8HZ8a7UbhvRMdYZyFsJmx2YlvfqE0DMgDBIqjwFMh8Y90rokFAC2hZmLeAYv0yB4nSGUBjDNVOUNp19nsZftVQpQd56pbwhsD061kdJwVj5tgp4fEXcdphwsKhkfvHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4275.namprd12.prod.outlook.com (2603:10b6:a03:20a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Thu, 7 Aug
 2025 09:53:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8989.018; Thu, 7 Aug 2025
 09:53:48 +0000
Message-ID: <d6830af2-52aa-4ca6-85c5-2a4635ce6c7d@amd.com>
Date: Thu, 7 Aug 2025 11:53:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: WIP limit the TTM pool to 32bit CPUs
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: airlied@gmail.com, matthew.brost@intel.com
References: <20250806132838.1831-1-christian.koenig@amd.com>
 <3ff97e0ee433817c0c071c264d3a28622d717dfa.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3ff97e0ee433817c0c071c264d3a28622d717dfa.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0330.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: 6da327bc-b0f7-4f96-8f3f-08ddd5984e55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGw4cERaaDkyS0Y5cno2YkVEdjVjelRQNjFZWUkrTHlucG1Yb3NSbC91enpo?=
 =?utf-8?B?UGk4ajdWaGY4NXVpbE8vSjFIajJWaFhLbCsyUXNka2gyYVhWa3FDdGNQanNz?=
 =?utf-8?B?V3NUeldGY0d0eVFsVnBXeWQzSG9BVHdkK1dTSEtqWUs4azNPa2Y2Y2RTcGJt?=
 =?utf-8?B?OHFiUXNCRUpWNWN3ODh2N0UydTRuVHRKYUswZ0JNZlgvTGRPSkU1RXRVeFJi?=
 =?utf-8?B?dS9kOGgycncxTU8zN3VGeUlmRGNsYmhFTGxpb0FMMjBLR2NNRjgxMk4rQnZV?=
 =?utf-8?B?ZmVqMUcyb3c3S3p0SlJnZ0ZaeXhSajBoZFMwTmJtTlRGSzRkZjJpUE5zemJ1?=
 =?utf-8?B?SnFOdXhNQnFZSGdCU0ExeEF2VSs4bzYvNDFxMlY3TzBVZmhURUdaZlg1M2Zp?=
 =?utf-8?B?b0JabVhjcDR4aVZwZWlnTlFMY1Y2cS95N3hhWGx3MHhkM09QZUJDS2hHQUhW?=
 =?utf-8?B?SVpCNHRmR0RDdjRJWC82UnlJQnBOVnpkUHNOcTAvUWlrM1RocVBjdUdxb1dV?=
 =?utf-8?B?eHlGZ0RCT202YXJIcmRTRWpycWRtdkp2L3pITytuMlY0V2VqOVViZXVjODBs?=
 =?utf-8?B?WTdtTzc1MnkxUVpsNHFNYWt4aXNXK2tyTEd4VDhGblFZeUZLYWZrbkJGV2s2?=
 =?utf-8?B?cnJhR09LdmpEb1hXQnQxditOZmpHbXdUdTBhRW40dzAvRlllY3JIb0ZMSE9z?=
 =?utf-8?B?a2VSV1VVYUZlMlczMVR3Q0w1YWE4L0o1VG1oeWdpVXhHcHJod2FtTFAyTDIz?=
 =?utf-8?B?cTlTSGlkc3Y3ckRuT2VTZi83YUNiTDh4NnZTajFiYUpMZDR1cTBrZGY3ZE5v?=
 =?utf-8?B?NVhZek1KYTVPZUFRWjdmcVNsU2RRbzRiRjdKU3NPK1phL1V3RG1Zemg3dHRV?=
 =?utf-8?B?Y2h4dlJIdE8yT0g0NlJYcGptNWRNUUtmanZEZEhhQmlqd3gzaUZab3RGcFJB?=
 =?utf-8?B?WG5MV2ZFRUsyMGFvTklXQzF5d2d4bDdFRGVtc2t6aXN6RTFkYU16bDZDUzN4?=
 =?utf-8?B?RFV3Sm1LcEFCOVNHNDUyYWJiOTVRRndybjdWbnVKVzlFcGxJZVNkQVF6NXF5?=
 =?utf-8?B?b3pucXB6ZkVqeENadlJKUWdXSEhlRjl5Z2J3ZTFYcTRHT0FBb1JVaEtPYTBq?=
 =?utf-8?B?azNnTERCUU5qUlRaNnY0YzhTaEwvb1ZtWVhVOHR0K3Y2OEdYN05QQkJYSGIr?=
 =?utf-8?B?WlgyTEJoUVRYT0tqL3QzdkJNL3oxdFpNZ08rZEVJUEJsTXFYQy9FcTVoNytw?=
 =?utf-8?B?SitJQmhDa3YxUUtCaDI3THp6T1QyK201Qm90TWQ4blk3QXpOb0dIZ1gvYVNX?=
 =?utf-8?B?N3NEZnpyQ1ZSQjZnd2oxVTFDYzVHYTQyZllCN1BNZ0RTRk9tZ3hMTVY3aDdn?=
 =?utf-8?B?VWZ3bDcyNUpBWGhEZzFmaVY1U29UckplRmRaOUlUWVI5SVFpQmNHcXFhaEJE?=
 =?utf-8?B?bmZySGNlVWRMaU9UNDNQcWxwSUFZUW5wYjBHckFOTkNPK1lXTjJybk1EcXdS?=
 =?utf-8?B?T1ExQjVjRFVpTnNScCtPQ1NpQ0lUaUp2RytWQ3NQUmFGS2V4Q0FZd0pGa0ND?=
 =?utf-8?B?Qjh6dkowTThOTG9kTVNWL1VSOGwxZ2k1YmRpenVjMTZIRUYxWENGSFlQRTJU?=
 =?utf-8?B?UWYyRkIzNEJxbjJDenNmVGZqWEoyaStlUngvWDl1eXBEOUdTNlN4MzhaODVi?=
 =?utf-8?B?WUdSYkI4QXpaMnptQmUzbHRrR1lWSXU4Y0VOQkRPRmN2NE9pSThQcFN0UGdX?=
 =?utf-8?B?ZzlhbmxzMlY3YVdnd0F4QTVqSDFOYkNiaWUvbzJKbWwvQytiKzRFd0RObmxn?=
 =?utf-8?B?SVNpOUQvSWxRbDdQcWMzNGZRUFV3S1hRWm56U0EwSlpJUGx3VTNMZ3BOUTQy?=
 =?utf-8?B?ZVNJY2crWEFQQU9UV0c2eHJjYnR1L0NibGR6SEFuSGxTeHVNQXljRGtmbm5L?=
 =?utf-8?Q?fUuNQynTgtU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1FBVjNsSVFHUzZuWXdkRVcwWUgrRXM5NnJoWDVjSkh0SGFrLzh1dUd4bWdq?=
 =?utf-8?B?Q25nZVhBQmpLM2Ztc3VGblBVaG5tcWRlek44Q1dma3A5QU8rTWNOMTh6MHdZ?=
 =?utf-8?B?cHoydHRXWG5oWU9wcDIxT3Z3SWN4TXlIKzhsWWVST0Q3anNwWk5UQk9QVVZD?=
 =?utf-8?B?Tk56cW82UFU5WHB2Q0s1ZXg5V3VsZ3JIZDhQVEw2VXlBWjRNR0VMNHdFR0d2?=
 =?utf-8?B?L1JwYVh3VW1PSDQ0N0t6Y2VjOFBHQUZwSjBVdDRoeG5PbkxuN2Y3dGVRVHhK?=
 =?utf-8?B?ZWU1MUV6YUpHcFlUdDdTWENndWZQcmxTelNsT3Uram1YRXZIK0szdUdoaFpp?=
 =?utf-8?B?WklQQjBsVkdJd2p3ektSdFVJQTNaNGFhQ1U4Q08xbkw3OGZTQW1XK1NWREpJ?=
 =?utf-8?B?YjhXRFRicFhvOERnTVFKWWlTenBPQ0tuVVRMSmFicmFNbDhKNmNmRE9Dd3k4?=
 =?utf-8?B?NFBEZVBlbEZZanZTbkFCdm4xOXNBdFZsanB4dVV3WkpoQVVYZDVnbzQyWHpl?=
 =?utf-8?B?bzMrbFNyWVZBTFM1SVQzb2JIT3FhQXNFZzYrdy93bWFUS3pQdGpwNFVzc0k5?=
 =?utf-8?B?NjU2a3N2NG1abEhUNGJmMTBvdEl0N2liZFVnbzMvRThmeE9PcnRTeGsrblVX?=
 =?utf-8?B?VHRIcG1Mc2FrRDl1cUdNdmduSzJlZHJETlZQUWlMNGRhZUhkL2ErbExScFFU?=
 =?utf-8?B?eE1wZ3JWeFFncUNNVVRSbWhjU2cxOFYyQytYaU1iOWkrdlh3VlU2QXZDMnVl?=
 =?utf-8?B?Uy8yVTZ5Mk9WSFdIR0RoYW5VTHpQRFdjVUdiNm53MGRVVi9zL2hFbXlpdXMv?=
 =?utf-8?B?bGxxS3c1YWxPdmtSdzA2M3NWcmtjY1BITUlMZmdidWZ4T2NCZUJhekcxT1RC?=
 =?utf-8?B?N0lzVEpWMG93U2YzVlpLRVFSQ2FEZktMeWI1bFU4L2E3Sko1SlJSb1c4VXU4?=
 =?utf-8?B?d1ZNTUxhRnIwejduM0t0Y25lZ0ZwbnFtUzRkSHkrN0RJakdjOU5YSGNSSGFt?=
 =?utf-8?B?bnNYMkRBMkJkN3ZnSHUva1JVcWtnUVJHbUxTN1dpU29oblVWdkJqZ0VVeldv?=
 =?utf-8?B?b255amlrbWtVTDM4aDN6N3h1d25BSWpKMU81cVZDZ1BObFhGSkFndTJnK0I1?=
 =?utf-8?B?Qi9QS3oxc2dCR1BLa0JwRWdRV2JCWjg3VzUyb0VDREtrUzFZT2wxMjVzdUV5?=
 =?utf-8?B?bGFaVHdqdUsxRTZtallYdExVWkhDUDE3VkpoT1c0OCtLeUhjL1BPSWFFOTA4?=
 =?utf-8?B?K29mTGZ2M1c5TVVoRHdWc1VKZVZ6dXBmbDY0cUszdWdPeG9WTDVOVDBqYjVO?=
 =?utf-8?B?Y2lVaTRxS2NFYzBQVzA4RHA5SHZlMlQ4b3lXeWtyNDVtbUVnNllRbVJKV3ZD?=
 =?utf-8?B?VWx1SVZib1NmTXB5MHM2NzRKZjkrMUsvQXZnLzlPM0ZibzF3UXZBQXZMNjBr?=
 =?utf-8?B?Q1ZWTGcxYWdlNVpocFRDM1F3ck5Ra1UzV1hudXFKQk9WZGNCMmFVak5NYTNJ?=
 =?utf-8?B?cFdFQ2R4U2swWUtCUDN2WVVvSmVmdDArQkttV3N0MU4xSzNMMER4eHJkMU5s?=
 =?utf-8?B?LzFwb1k4em5JWHZXRDhqMlAyL2lsSFpmeWloMVNkalFDZjIweEJJMFJBQnJH?=
 =?utf-8?B?QzJrOHcrbDZkU0lNZHJleFdCSVdLeXBhdEVQZllWWjlPWndPZDg3NlVSbCs3?=
 =?utf-8?B?M2Q1L1Nkd0tzUnF6aFhRRXRHVGNhSDFDcjQ3bXN4a044ZkdZWXpTQk9Bc282?=
 =?utf-8?B?UW0zOWRPeklpYUlaRUNrTVZuN3cvL1duZ3NLcnJSVllaRUI5ZzJTM3pxL2E0?=
 =?utf-8?B?ZjYzeCtZR3FxdTJldEZ0bFZseUFnL1NmdGhqNVhxbWRVVnJMY0hCOVBLL21s?=
 =?utf-8?B?dU9ybzlaMGRtTFRscEU0aXhvc05EN0xOTmpRMVZQTFpnR3dPcW5BRERqRE9s?=
 =?utf-8?B?YjJXdGoxOFNQakZtZmMrZEJkWGZQaTlMNS9CUVErNHNoUDRFVmsxRkJKNEVM?=
 =?utf-8?B?bTlsdnpROGVybVR3eXRZdnhjTVBwSGUyaStmOElzNUg4TVljNDdrQUlYNzZR?=
 =?utf-8?B?MGxPQXBMSE1Rc0NQZm85T1U0N1NJWnBMdnhPZmtOOEJmcFZMYUp6aDFkYlFx?=
 =?utf-8?Q?3yEe9ESZTUvj1Q9M5s/cuENI7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da327bc-b0f7-4f96-8f3f-08ddd5984e55
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 09:53:48.4607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0fDfkt0x3kLLTNlIVcgqfNqUvyM/S0U7ubSPYuXWJyxD5g+En7cs0yot2+CKoLgC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4275
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

On 06.08.25 19:43, Thomas Hellström wrote:
> Hi, Christian
> 
> On Wed, 2025-08-06 at 15:28 +0200, Christian König wrote:
>> On some old x86 systems we had the problem that changing the caching
>> flags
>> of system memory requires changing the global MTRR/PAT tables.
>>
>> But on any modern x86 system (CPUs introduced rughly after 2004) we
>> actually don't need that any more and can update the caching flags
>> directly in the PTEs of the CPU mapping. It was just never disabled
>> because of the fear of regressions.
>>
>> We already use the PTE flags for encryption on x86 64bit for quite a
>> while
>> and all other supported platforms (Sparc, PowerPC, ARM, MIPS,
>> LONGARCH)
>> have never done anything different either.
> 
> IIRC from my VMWARE days, changing SEV encryption mode of a page still
> requires changing all mappings including kernel maps?
> __set_memory_enc_pgtable()

IIRC both Intel and AMD sacrifice a bit in the page address for that, e.g. for encryption the most significant bit is used to indicate if a page is encrypted or not.

I'm not aware that we need to change all kernel mappings for encryption, but could be that the hypervisor somehow depends on that.

>>
>> So disable the page pool completely for 64bit systems and just insert
>> a
>> clflush to be on the safe side so that we never return memory with
>> dirty
>> cache lines.
>>
>> Testing on a Ryzen 5 and 7 shows that this has absolutely no
>> performance
>> impact and of hand the AMD CI can't find a problem either.
>>
>> Let's see what the i915 and XE CI systems say to that.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> 
> I don't think we can do this. First Lunar Lake can in some situations,
> just like the old Athlons, write-back clean cache lines which means
> writebacks of speculative prefetches may overwrite GPU data.

So a speculative prefetch because of on an access to an adjacent page could causes the cache line to be fetched and then written back without any change to it?

Well it's surprising that even modern CPU do stuff like that. That could explain some of the problems we had with uncached mappings on ARM and RISC-V.

> LNL makes heavy use of non-coherent GPU mappings for performance.

That is even more surprising. At least on modern Ryzens that doesn't seem to have much performance impact any more at all.

I mean non-cached mappings where original introduced to avoid the extra overhead of going over the front side bus, but that design is long gone.

> Second, IIRC vm_insert_pfn_prot() on X86 will override the given
> caching mode with the last caching mode set for the kernel linear map,
> so if you try to set up a write-combined GPU mapping without a previous
> call to set_pages_xxxxx it will actually end up cached. see
> track_pfn_insert().

That is exactly the same incorrect assumption I made as well.

It's not the linear mapping where that comes from but a separate page attribute table, see /sys/kernel/debug/x86/pat_memtype_list.

Question is why the heck should we do this? I mean we keep an extra rb tree around to overwrite something the driver knows in the first place?

That is basically just tons of extra overhead for nothing as far as I can see.

Thanks for taking a look,
Christian.

> 
> /Thomas
> 
> 
>> ---
>>  drivers/gpu/drm/ttm/ttm_pool.c | 16 +++++++++++-----
>>  1 file changed, 11 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
>> b/drivers/gpu/drm/ttm/ttm_pool.c
>> index baf27c70a419..7487eac29398 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>> @@ -38,7 +38,7 @@
>>  #include <linux/highmem.h>
>>  #include <linux/sched/mm.h>
>>  
>> -#ifdef CONFIG_X86
>> +#ifdef CONFIG_X86_32
>>  #include <asm/set_memory.h>
>>  #endif
>>  
>> @@ -46,6 +46,7 @@
>>  #include <drm/ttm/ttm_pool.h>
>>  #include <drm/ttm/ttm_tt.h>
>>  #include <drm/ttm/ttm_bo.h>
>> +#include <drm/drm_cache.h>
>>  
>>  #include "ttm_module.h"
>>  
>> @@ -192,7 +193,7 @@ static void ttm_pool_free_page(struct ttm_pool
>> *pool, enum ttm_caching caching,
>>  	struct ttm_pool_dma *dma;
>>  	void *vaddr;
>>  
>> -#ifdef CONFIG_X86
>> +#ifdef CONFIG_X86_32
>>  	/* We don't care that set_pages_wb is inefficient here. This
>> is only
>>  	 * used when we have to shrink and CPU overhead is
>> irrelevant then.
>>  	 */
>> @@ -218,7 +219,7 @@ static void ttm_pool_free_page(struct ttm_pool
>> *pool, enum ttm_caching caching,
>>  /* Apply any cpu-caching deferred during page allocation */
>>  static int ttm_pool_apply_caching(struct ttm_pool_alloc_state
>> *alloc)
>>  {
>> -#ifdef CONFIG_X86
>> +#ifdef CONFIG_X86_32
>>  	unsigned int num_pages = alloc->pages - alloc-
>>> caching_divide;
>>  
>>  	if (!num_pages)
>> @@ -232,6 +233,11 @@ static int ttm_pool_apply_caching(struct
>> ttm_pool_alloc_state *alloc)
>>  	case ttm_uncached:
>>  		return set_pages_array_uc(alloc->caching_divide,
>> num_pages);
>>  	}
>> +
>> +#elif defined(CONFIG_X86_64)
>> +	unsigned int num_pages = alloc->pages - alloc-
>>> caching_divide;
>> +
>> +	drm_clflush_pages(alloc->caching_divide, num_pages);
>>  #endif
>>  	alloc->caching_divide = alloc->pages;
>>  	return 0;
>> @@ -342,7 +348,7 @@ static struct ttm_pool_type
>> *ttm_pool_select_type(struct ttm_pool *pool,
>>  	if (pool->use_dma_alloc)
>>  		return &pool->caching[caching].orders[order];
>>  
>> -#ifdef CONFIG_X86
>> +#ifdef CONFIG_X86_32
>>  	switch (caching) {
>>  	case ttm_write_combined:
>>  		if (pool->nid != NUMA_NO_NODE)
>> @@ -980,7 +986,7 @@ long ttm_pool_backup(struct ttm_pool *pool,
>> struct ttm_tt *tt,
>>  	    pool->use_dma_alloc || ttm_tt_is_backed_up(tt))
>>  		return -EBUSY;
>>  
>> -#ifdef CONFIG_X86
>> +#ifdef CONFIG_X86_32
>>  	/* Anything returned to the system needs to be cached. */
>>  	if (tt->caching != ttm_cached)
>>  		set_pages_array_wb(tt->pages, tt->num_pages);
> 

