Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E05BCA7E8E2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 19:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A2010E53A;
	Mon,  7 Apr 2025 17:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZQbQTI9M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCFE10E53A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 17:49:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AGtLJtBAs7PNJFJWKD1/IeeG0GUJrYVIxS95byOo4AD3F+evzbxkcEL82cMXsFi2G5GqXwu2BhcW3WjN7yqmHB4E6WOgHwoBxGsdU7+tfAH5rM2uDjroqUcxRBc6vYuV0Ix8yKPUPlfqNzoQkAEoqWi5xBF+Nk1fKG+H720u6VkIDMCri1fn020agKpRykruodsjaEK51A1gt2xMhDgtHLxuwXOAsg8I+SvtKWD6Drimd1HjqjeFFaX+iGJYj0Q+VZ6TDBnWp/SpanM5L2FQCRzhorlnyso545/wjghvVPCfxvecA+1lPXoNs6jZMw0+GvPnzwiiqd2I6XPw0GCVHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxL8xffSbv0kms3ytkGlEm3mM6S4gneI5WToDV/EfMM=;
 b=auonyQUvRgvCUfZk7B7t3s/M+Df9IL5aTMhytDQUJQW+Ze4oNqJ5ZyFEGNcYGT5sz4pX9ewQaW71yioEVfR+Vk3iMo/x2fYtthre2n6IPP06Oe+goCfwoUZdZ3VDIMmNyJEN/gNaDEyhyoP0UQL/XYN4Ex0RnGs/i3moI4Ud3WR/7x30vsg1DtufKee4CY8NnQlVMxvuNhzCB1FCttdnNBcILarsbU1dzcpvXldAc3XXvJHJLmUTvZESeenN/CIxCwdBJBjTRy8XnJZR5VDDiyHY2h95RaIcYjkN7Vosty3P/7OujQu+aARIDSpDqf/JXgUYmiDyCjNDTnMTe33ykg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxL8xffSbv0kms3ytkGlEm3mM6S4gneI5WToDV/EfMM=;
 b=ZQbQTI9M9HFVuwhlTtCHHdQp/uFLmbUn5FUCxTUNliaoMokkxxcEREbxqlPuBsmq1wo9XQsfxvA/fDQBAzDAZtr+4wEFX57xMyLxPj56TBj4dAop01+91krS2hji8/vi2FoYjpmyPGzTUzOAotz3DUX1+ydjGnz8bk7/veXj3u8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7610.namprd12.prod.outlook.com (2603:10b6:930:9a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Mon, 7 Apr
 2025 17:49:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 17:49:23 +0000
Message-ID: <784b3f08-38f7-4479-9e83-03937fa2d19a@amd.com>
Date: Mon, 7 Apr 2025 19:49:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dma-buf: heaps: system: Remove global variable
To: Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20250407-dma-buf-ecc-heap-v3-0-97cdd36a5f29@kernel.org>
 <20250407-dma-buf-ecc-heap-v3-1-97cdd36a5f29@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250407-dma-buf-ecc-heap-v3-1-97cdd36a5f29@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: 2299aa62-1503-482b-9edc-08dd75fc87be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGpwby9jYUdJc0N1STNyelI4c0Uxb0hEbDhBZ3JSckh3QWx2SXQyaG12bXlY?=
 =?utf-8?B?Ti9renpaSklyU0M1eEFJN0pkTE0rcjdzODhZZytySjJ0cFhUdHVIMlNSay9C?=
 =?utf-8?B?YVdGTEs3TGMwL2ppSSt3VVdZeGliSElnNkNTQVhGa2ZiUjBrZWJ6MmtxVFI4?=
 =?utf-8?B?WWY5YmpVaWdWaDlueEswKzZJODhQSHNOSnNIbVpjQ1huVWJyWG5QWURPM1pt?=
 =?utf-8?B?QTlqRDE2MXV0WmZ1V25xeUFWK1NOdGZKL1VWcnFQNUpzZkZRYnB6Uy9MVjZv?=
 =?utf-8?B?a1REaEpleEE5MUUrUDVhakFBY2ZZNy96N0RPZnoxOVAvUGlmbjVsRzRxV3Jz?=
 =?utf-8?B?NFE2ZlBvS3BLK1BrclA4WXRhRURsNE5MUWNKYnFRbTJkSisxTjFMZUYrQ2dz?=
 =?utf-8?B?WHRCN0dJd3J1K1dXWGVwZWZSc29oQzRSTEFtWHNvaFlrVjZlSmp0dG9tM09m?=
 =?utf-8?B?S1Q5RU9MS0JpWGUvRVk4NGJHOVdVWUZyVTZNbXBpb1UxcmpHM1phVWZ1UDNx?=
 =?utf-8?B?dFlsem1CZG1RdWhUanJpNmlXS3BJQlVya1dQL2xVMGNzQ01WUzd6T2FPR0kx?=
 =?utf-8?B?SHFpSERXRlY5dWQyeFd3Yzd6c09sYnlUYVVrZVd5cjJKT3k5SGVnRVA3MGRH?=
 =?utf-8?B?RGdHU0JwYkdJZFR0MGJuaTR1anYyUnJSTVZFV3Ryb2dCd1JLZCtUd0tJVW1I?=
 =?utf-8?B?aWhjcm90bDNNQVI1enRwUW4rdXllLzk2YTJ1eVdmNUx0Wi9TMkhyaHFWTUtv?=
 =?utf-8?B?SGxJZDAydmJVaklnSytyU3NTY2lwU0lJd1dEU1BoenN5V0g1K2VIYnRFM0xD?=
 =?utf-8?B?bTEvanBMNFhRekllclNOY2hoemFGUTdNdVR0VlZqZ3d6MW5tUE1iN2xxV2dC?=
 =?utf-8?B?VVMwWlNJSnd2V3lSbXZPQnliUklCaStWVEVQdXprYlk4S2dWdVNUR3JqVEx4?=
 =?utf-8?B?V0VwNndxRWhnU2IwOVd5WEtJV3VoUnl2andzWkp5dk5jZU9VWjJNQlE5OUlX?=
 =?utf-8?B?UkJOQ1UvcmZGRWF5cUYyRDdwL294b0FWc293Szc0T3NSTHRxVFV4d1E2Lzda?=
 =?utf-8?B?bEVVQXQ5K1FRRTB1b1ptaC8zT0ZiK2ptMEw4dU94OTl2NDQwdTcwTzFYaDUx?=
 =?utf-8?B?YXBia1R4WGF2T0FZU0lqUDZEeVRvUVBBUTBDTnFBOFpYL3lPL3ZlNldVUkJw?=
 =?utf-8?B?eTNNUkwvU2VCNExSUi9ma2R6U1IrM0dhbkZyMlhKSWFIMFdmMm9ycDZLU3hn?=
 =?utf-8?B?blNqUk5mU0pvUld5enNZNmt5U2JPRjRkc2x6TmRmY0l0b1FtRkdJYjk4WStm?=
 =?utf-8?B?MkdJb0xiallQUGR0VXhucUNuc2RJTTJUQkJ4Z1pCS3llUXZZb0dTeHRJamcw?=
 =?utf-8?B?TE9rL3pRMTcyb1RsNEV1T0EvajFhM01od2ZVWmM3TUN6WHVFT2tGZ2dlclJo?=
 =?utf-8?B?N2FtK0o0UGM3aDluSTBOTGRXeWVlV2FGbWdzelFVckZXTk0vWXlvT0pUVnhW?=
 =?utf-8?B?R05NSDM5bExadmVFbXdtZ2RhWDhKV2cyN0JwZkJVQjFCUEx1dU5qUU0xL1B0?=
 =?utf-8?B?cS90akJrSTJhbnp1ZVhVSmxadUlJM09KVXlrNUlOaVNqUUJ3TWtPcWpOMTdJ?=
 =?utf-8?B?b1JrRUpSWHdzNGpQL3NWN1lLdTk1Z2czRVg5SVRVQ0VTWHBhSm9XRS8zMXZu?=
 =?utf-8?B?WU1Ld0xGalMxSEFRNUgyRTFRbnVEM2xrenRXRVVaSDRmVExpdyt4ZVBpaEJB?=
 =?utf-8?B?WDR4VHpnbk4wWUhnQmZSS2JYWEF4SEJHTEJzUzZiaGZFcFBrMEpnRVpmbnpV?=
 =?utf-8?B?b0FQVW55NmlNSWplenBNYXhYNWcyWmxKQ09oNFV3dDZNYktPKzJFeXdhSGl2?=
 =?utf-8?Q?aZUS7KMXMrLKb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUViQzdnV051bGgwTnowWEhlbC9FS2h2L2htckpsUWpmUkYybDBsS0ZKbGtK?=
 =?utf-8?B?dzUydUpPa2I4d3lBUlVjRTh5cjJJRDVpRlgwZjRCemw0NzhDYkVpNGFCRUNQ?=
 =?utf-8?B?NGM2cGVZcG4xbHpxTEZNVkdlQU5kd1pUaTU3MVJ4L0E4dFRjbUFqdUFzY2N4?=
 =?utf-8?B?eDJ1a2lHUVo4TFQxd1VzbUNzeFcxd0hZVXpYcW5JWVRmditmM2pmUS80MUdC?=
 =?utf-8?B?SC9UNjBUMGVFT3M0cndpR2JMOE5WWERYZjRjbUlrdVlMcG5yMm5TcGdnN2x4?=
 =?utf-8?B?TWcwOVJsWG82eGtIdU0zc3dGUGtZbUpVSkFnUXVPWVc2KzhoSnp4bEVGWHhO?=
 =?utf-8?B?cmd3MWdTZGw4T3FrNmMvaHFSRjZIczFaWVplS0craHoxeEZmQ2FxUGdsYzNY?=
 =?utf-8?B?cDFFM2lvOUJKYmhnQVQ2TUVUYkJodzArM0ZTWHJFNUNNNGUvN2RyVk1tTHVp?=
 =?utf-8?B?WU02RUovaFcyaHdBQ20yM2Fld2RVMTE3MmtNMkZ0M2ZGbVFBZ3lkV1VraTRQ?=
 =?utf-8?B?UVRCMTFZOFFTcnliZ2RZWmg4bXhWakozQVZyNUo2ZE1FWXZYU1FFMklKaHpt?=
 =?utf-8?B?eVJucytWa05yb0pRQVBxaEZCWStDMlFudVJhMlZwVnFuUCs0cW5ZazJmOHhK?=
 =?utf-8?B?ZUx6VTQ1aTVGOTNmcE9IQXI3SExIUWZXMzJacU44cTFwbCt3bkZJWnpLVlJH?=
 =?utf-8?B?R3Fqc0xlS0lDeTZHaW5XZkNyaXZhZkZvNTg0Tk96S3VzaDRveGgyNmowdDhy?=
 =?utf-8?B?MGw0SEIvNTR4aFgwNWRZNzczbGgyeTVjanFQc0l0akkydFcwZTU5L1k3cWt2?=
 =?utf-8?B?Z2N2N3BLWWF2S1pBcDBDb0pDcU50TEZiVmhlNHJkNS9XL1ZQZ3R6c2VuYkZj?=
 =?utf-8?B?Ty8yUFNNNE5ORTFVTVQ4bzFlOVJlU1FtZCtoMnBJTkRycGFnNSt3WWJROVRo?=
 =?utf-8?B?aEN5UVBsNGtnVDdwejlKMmYxSFphOVNBRTNHanpKQ3FBU1drNkJna1poamxz?=
 =?utf-8?B?ZXZYcSs2aFNVeGtFRHc1RGZMKzg2OERIVmM1cFhQcStQOGgyRnhnaExyanRx?=
 =?utf-8?B?UDNFZFVJVTBDdURvVThqb0hHQUkxV01nR0VmSlZxTHhhRUNzWjhLUndMZ3Bk?=
 =?utf-8?B?RkpMeC9jMDlnTnUySWxqY0NEazB4ZHQrRi96dDlDUjQ3ZTFVcXRSbEJETVBj?=
 =?utf-8?B?dDFjZlBCWWUxNzRONUhJL3M0bVhsSXozenlXSG40NTRuUE5yRFJzc1E1dEJv?=
 =?utf-8?B?b04xdmltUDhIMWpkSzVGZkkrbEFpL1BCbnVOVlF1QUlmbWZhUU1sYWg4TkpB?=
 =?utf-8?B?L3FSN2ZJdzN2amhEMHphSE04b0RuZThkMFRnTVNzSjNYVUZMa1NDdlNzN09E?=
 =?utf-8?B?V0RYSzFiYnFER21RakVYS0FpRmlVb1lBbHA0N0ROWHBLRTFjdHdFK0JSMGZB?=
 =?utf-8?B?QzF6TThpdWw1SnVEMDdFTzlOODMrZEdzNlVDWW5BRzhRSE1yY3ZQY3pmMDB1?=
 =?utf-8?B?WUhFWnBEbUREZGloak1sNEs2a0d4bWQrYWxpZTQrMUQxazFpT0o1dVNGS3dB?=
 =?utf-8?B?OXMyczN2dHVVSmpENUF0cDIvQ3dVNWVYcld2R00ybktFeFlUTTI3K0hMUzE4?=
 =?utf-8?B?am5CWG5DZjlCMm83bkdQQkJhdzZXNzdGL3F1UlBpVVp2V3RCQXFrSHV4RlE1?=
 =?utf-8?B?VVhPRUpqQXNMb3NEYldFT1lkWWVidHJEMlJuSTFiQ2pQeElUTjMwR1JPaFFv?=
 =?utf-8?B?UlNBZmZXVCtPajFoZktjckNaTTBhZzUxcXVkU2gwbGxSWGlxYmowU0d5cDdD?=
 =?utf-8?B?ZDkreWhITnBOUytLV3lFMGFueHlRQUVWVU9sblhKZVJISFpzRFdWSnZFdlNN?=
 =?utf-8?B?b3crMUxWRTN1eW8zNG82T1hDNE9PUC9XTzE1Q0IwalF6ZnFHZnplL0JiNUkx?=
 =?utf-8?B?MTA1VDlRTDg1eDM5L3pJU0pDSnVoRWpFQkttTUNzTE9GdEpFU1NISTAxRS85?=
 =?utf-8?B?WEJpbGZFWW5BT1R4cVgrU1BPOHA1dWJaT3c2STZidlB3RE1FcTNUMmJETlMv?=
 =?utf-8?B?S3Q2Tyt4a0ZBK2JUVHlVVFo5TjZBTEROdlc1MHFWa0RRL0xnUWg5djBnNzQ4?=
 =?utf-8?Q?bXwg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2299aa62-1503-482b-9edc-08dd75fc87be
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 17:49:22.8875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HdKHArvAvHaYNVBBRDxv73SohEhEsFS2rkfQyObprHrjv3MuXuRPgcFu9pQga8I6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7610
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

Am 07.04.25 um 18:29 schrieb Maxime Ripard:
> The system heap is storing its struct dma_heap pointer in a global
> variable but isn't using it anywhere.
>
> Let's move the global variable into system_heap_create() to make it
> local.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

Going to push this one to drm-misc-next, but I can't judge if in any way possible if patch #2 is correct or not.

Regards,
Christian.

> ---
>  drivers/dma-buf/heaps/system_heap.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 26d5dc89ea1663a0d078e3a5723ca3d8d12b935f..82b1b714300d6ff5f3e543059dd8215ceaa00c69 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -19,12 +19,10 @@
>  #include <linux/module.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/vmalloc.h>
>  
> -static struct dma_heap *sys_heap;
> -
>  struct system_heap_buffer {
>  	struct dma_heap *heap;
>  	struct list_head attachments;
>  	struct mutex lock;
>  	unsigned long len;
> @@ -422,10 +420,11 @@ static const struct dma_heap_ops system_heap_ops = {
>  };
>  
>  static int __init system_heap_create(void)
>  {
>  	struct dma_heap_export_info exp_info;
> +	struct dma_heap *sys_heap;
>  
>  	exp_info.name = "system";
>  	exp_info.ops = &system_heap_ops;
>  	exp_info.priv = NULL;
>  
>

