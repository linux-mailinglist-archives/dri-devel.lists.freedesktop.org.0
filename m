Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A219427D7
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 09:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E42910E444;
	Wed, 31 Jul 2024 07:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="QuHujXif";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2060.outbound.protection.outlook.com [40.107.215.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCE110E483
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 07:27:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZRi2NNxT3RgoTuaMT43IuJjeLsXLGGaLl4hqliiVqVQHNK65mbqDFZmMzM/7Wb5Zlh83o1E6+hkho3vWNHmlFDiX6cR1r9Q1NDXlsfQaubziBND2f+CHvbqLPkHV37B31HvTNNuZi48C/Y3DC9fzQskni9H4Tvn1vWFzwwnhGxLNlj34xs2fEGkpagoRyz8qdCGRkvusd+bQY0xhykb4L54akdyYxd/cIvT5b2MPb+YU86u9RNozoF64d2jBF5TWQwlt7ei6cXho8YZcZwSwDMgA/f0BHGOTvAp7t2b3L5xT35UHKPUqgqV6I4aCUsQAi6IGlHje6PH9tjJwoptlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IiR7Nrb+jHHK8sOmS4gU7yRe4z6702oVIznsfXKphrs=;
 b=jy8XEQNky6ciGIk5cthVMRUwZRhvXuvD8xDb+sr86yaN14TOJ9wWnxJdlUW8KhnGC34ZsAsz9Twv6zuAWke47KhdK9uEqVQq9gzQ7xDHNNcz799Lb4+AOonZqxnbT2SAgewb5W1AfLMMhx51ffgGehsxbVGdnXMy+iPthp6ijnCKhXhKby2SoYIX0amnPWqr1OJxKiHDj9Z1CGA3uK4yzTlc1nvsT32JWjlEDxSGb1vJe51KSRss770xguQt6TtzWWEaKCxtRaBFfIUheO+P2ohcuLqjL+wl7C++0S2r4YXJKidHdyjd3IglpILvkDLiokro0xeH+SnLC+B13qyFag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiR7Nrb+jHHK8sOmS4gU7yRe4z6702oVIznsfXKphrs=;
 b=QuHujXifjscP93/CSXhbr9H/lNP7gS8r+/UOIXgz8PnuJuM3n3mzz10x6oYoXpLfNQEngVqaN0dqLAXAyStwd0w0xVqn4tRQKW5MUJeXfBsV18r/O5iwDdwx/BVy98+S7VgD/VtXfAtt0NpUuhOc9KaDW+x9MmbnLdKI/S1RToMJ3yhZhHvjIWPsgLlPajWm6ycyax2HWLFPmDnfQEd21wiwCmKRk+bNqoLQKMxDjEv4Xvvjtwf1R4NXm4EacxeCjAQ5Wixu/QzpQ1i4FYtqe44OVKJcLCX08dNxboDoe3s2TeBLr2nrKvuOQ2sa53sVYp54BLyshdFldcbUKMnH+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SEYPR06MB6228.apcprd06.prod.outlook.com (2603:1096:101:c5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.26; Wed, 31 Jul
 2024 07:27:04 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 07:27:04 +0000
Message-ID: <36424d42-9d9a-4656-a090-82af9044db8e@vivo.com>
Date: Wed, 31 Jul 2024 15:26:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] udmabuf: use kmem_cache to alloc udmabuf folio
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240731062642.1164140-1-link@vivo.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <20240731062642.1164140-1-link@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0171.apcprd04.prod.outlook.com (2603:1096:4::33)
 To PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SEYPR06MB6228:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c233e57-3446-46ab-f47a-08dcb1322cd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3VMQWZ1SGdMQm5na2N1ekorTENERUN5ODlaU2dEK3ozeHVqRWNkQnVTY2dj?=
 =?utf-8?B?TkxrRk00UzRCN2ZJZ0grcFRYNGZla1dPSkU0dXh4ancrQ2QzU3N2amNDbzR3?=
 =?utf-8?B?U2hzMHBhdTZqNGxYc3VacHBVZXhzdHVJTXptVDBhaW9ZQzNGUFdvdzlLV3R4?=
 =?utf-8?B?Wkp4Ylc1Zi9pMmtIQmR6YmhIWFArK2VKM1l0Z3FwTDZsRkdmbEtSODI4NSsv?=
 =?utf-8?B?YkRVb2kyTGZUZitIK05nYXhXSyt6WUtlOHpyRlVmY2J3K3FiS0FkTTZPL1Fp?=
 =?utf-8?B?Q3hvQkRjNUZvU3hNZ2F2RmQrT2NCeHhhNkE2K0NMTFZDbHp3MS91Z0NmR3Bs?=
 =?utf-8?B?SlkvSXoyeWkyVCsrVUlNc080T1FDb2Y4eG5IV1hndTI0TWdRTys3MmpzUkhF?=
 =?utf-8?B?UjAvOXh2eHQ0QXZGaHF3V29FNWxxQlhGdGVzamdRcjc3Yml6cUgrb3RUT09F?=
 =?utf-8?B?NXBFbnFQd25UcDJkcS9GdWFJRi9NQ0dlRXJ5TitBbVlFTTJOTHRYWE5uZ09G?=
 =?utf-8?B?bHpoUnkxQ3hHQnJrUXBzRTVhRUZCTkozQ210Vk1XZ1JXZjhCZmxGaGoxQlBU?=
 =?utf-8?B?SFJQRGtLOHVTbGptQXNPazlwb0c3NDhwQjZSV3FWOExPblpJMWFtQkcvYy82?=
 =?utf-8?B?NmlTODI0N3JRcVJSNGNmTzROWmdkbFhxelZyUnhWMnQvcTFnRGE4Vm5TMitj?=
 =?utf-8?B?YlE3VGZDTUtyYTRhcFJLTXhialZxcVdoOUFkbGlGTmNhZG5TNU9rRjdyTmJp?=
 =?utf-8?B?azJvdnc2V2R5eTgyTi9wY3hHZkdwb3I4TzdnLzdMMXZqOVNZS0kyaDhjOFdw?=
 =?utf-8?B?b1QxN0ltWXloZUI4T1QraVpwRnVrUWtoQnBvY3M1aDB5WGNvaENQQXQ5SHBZ?=
 =?utf-8?B?UzdKYVpUNTg4aDRpRTI1d3pnYXZnVlRyTW1SbWNqT1R3MmgzS3Z4MjVudUlR?=
 =?utf-8?B?b1hqY1U4L2NVSjlNOFlWTFRNWlpVUmE2TTgyN29IbU83TmxSQmhZdDZ1QW1U?=
 =?utf-8?B?akE2eEgwWkZFKzlINnIxaWhrNWZmcHdFUzZmRndjMUxldHFLNThTQnRBNG9z?=
 =?utf-8?B?TmlGMFc2b01jQXFkWEY3ZGRCdEZydzdzdlQ5UGxhZWVMbWZKY2xkQ3RKVHBE?=
 =?utf-8?B?eUJ6ZEszdlkyUm51WmpCVmZIL1hDQTl1S0FLVU9vaXpkUjNGSloyTlc1WEd2?=
 =?utf-8?B?SFJjd0s2TjRQcDZzVmtGWGQvYWNHMUFWVnJGcVFvZmthUVhwVUhCaVZIVm5H?=
 =?utf-8?B?OHVjNE1aY0NDTjFiVkZyRHZ3cFJ0cDdKeDYvQnlyL0xjZWVYNWJ6cmxtekpO?=
 =?utf-8?B?MFNmL29MWDFWR0NHaGpwbURvejBRTHhaOE5rbWE4WTY2cysrWTJwUGN4dC9R?=
 =?utf-8?B?V1NOcy9aMVI4di9jTWtrbC9PL2hNVWVlc1NzSEFlSzQzRmp3N0tGdUpnWVov?=
 =?utf-8?B?bnBJbTNFTWcrMVMraXNvWE1RVWZuaGdaSGo2aGhGeXhNTFViSHVPY3NyZ2FD?=
 =?utf-8?B?Y21iYTZSblVaUlh5NWo2ZEhHc0lXSzNHMEdTRjExL2JWeGEvSkVsdVBHWi90?=
 =?utf-8?B?aWE4Z0NkK296VnpaK3c3Z0NEYTdSRlhVK2FqSjhTQUc0VjhsMUJEZ2lPNWs3?=
 =?utf-8?B?Qmx1THZRbUx1aGYvd0gxMW1lbENES0tGaVRnSTN6em5sYXFxZlhFN25UOE40?=
 =?utf-8?B?Tlg4azltQzFrZnIxNEt2WXBxWXpseGhnOGJtYXh5UWE1TE1UVm5COFUvalRH?=
 =?utf-8?B?dGt0YU9VMFd5c2t4SHBxd0NpUE9XL3MrMUd3Z0JiR0ZNWGFVdkErc2pyZDVp?=
 =?utf-8?B?ZkZ2NFdFbENFZCtwREhtbTd3MFgwZXJWN3R3Q2hNNmtkS0NXTGpsbStmMFBL?=
 =?utf-8?B?bWpqWk82Y3JrcWdZMVhFZEtWbUZOVFhxakl1T0svK3FDZFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnlyYW8xMFpkNmdtd0hWRktEZ3BsTDJJYXRvNG51cHVVYnExb29sTHQrcDdF?=
 =?utf-8?B?RHl0bUNpeW1ZTk55SXdpNHlEMEd5d2FJWUdpSXBWWVUrVitYc3FhWHF1TXFI?=
 =?utf-8?B?K2tWK2FQdFVGa1FNV0N0dDNHZXZoWlYvbHVnanhRc214MzZ1T0poeGtwQ0g2?=
 =?utf-8?B?ZzAvQzNGZmNlQzV2bUp2cnpBVUVFV1JscHhqaHlJaW9RZDlYclZ1WU95Ni90?=
 =?utf-8?B?SlU0T2lTZ1Q4VWIyeVk3dUY4dlY3K0hMeFVkM2h1cVpnOFoyRllpN1phNU5o?=
 =?utf-8?B?bm5EeVNERFdDTmVyUmMxK1M4ZHh1VnJIeHk4ejdSNUVSbXUzazcvQVhqUVk1?=
 =?utf-8?B?MTJGc1F0bzVZLzFQeU43TExQbEVWUkRyTHFTRnNlcVBteUxCKzU1RGpvTExl?=
 =?utf-8?B?azBPcFNuZjhXU0xmTDByVHlaRnRtekpZV2pYRzc5MlB6MHJLTnZFeWRFV1dC?=
 =?utf-8?B?WWMwcldWb0tubGRPZFNyRkhlV3FDV0MzUXF3RU5HVlNXVDREVllMM1QyL0hr?=
 =?utf-8?B?VlQ2ZmoxYzhiUG8zeUNNbWhoZzJScTFERlo3VXJPQUhqbEo5eWRqSzczNndZ?=
 =?utf-8?B?clBEVUg2c0hiYTJsTDNkb0E5czVnVVlrWjZTU2ZpZ3o0ajl4RGNxTXZkRitz?=
 =?utf-8?B?MTJFblJOd0xZanVsa1hiVnp2ZUNDUTUxM05TN3ovS0hEell6eUc2Zk1SZDMy?=
 =?utf-8?B?QmErNVBhYzE0MnIva1Ric1lBbGR0Ky9PWTRTdWtoWDIzeWUrNW1pYkhJRHZl?=
 =?utf-8?B?TGlWeTVXa21Qazlvd25kSi9STVlZT3lnZHkwbTgxbmlkUHdUZ21BaCtOMzFO?=
 =?utf-8?B?RzVHR2RZVnZUZGpuSUFINFVDT0NWZ0tVRVZwOVJoTVJWelkwN3NDclp0MUZr?=
 =?utf-8?B?aURvSUZxZ1owUTRxRENrbUN6aEhISGRSUjFkQkw0L1V6S2I0c3lYcXlaNXpL?=
 =?utf-8?B?NDJ0ZE5wRm9YQThrVTdUOVlrMFc4RHlZN0ZRWDVCR0tRTWdteWNBR0Rjb3JC?=
 =?utf-8?B?bms4RER2b0lqenJ0UFhQdHR3VFlaSlhiREwxZ3pWdGdWWnl6RGtJZVhpZ2U2?=
 =?utf-8?B?UER5bE41UFNvR2FjQmJRcytJeDg4S2d2OWJlUEQ2WTN5cksyUmFLQzBNVkd6?=
 =?utf-8?B?M2tlZHM5OUlUY3Mvc3h1MDVPanRNaWorNkFBRlhrVk56SmNEOG5sS0VoVHNl?=
 =?utf-8?B?Z1BPN0c2MVhzNjArcmMxWllJR1l0S1BwMUp0UEI0MzhPeWw2TGlwSTZ0OFJE?=
 =?utf-8?B?ZTVCUnRaaWh4NEhjYkVMWnB5Uzl5cVBlc2xiN0pLaGpLdGpSV1NPN1NkYnFW?=
 =?utf-8?B?aEdDWUNObFZMWTlqQnZVaUdOUUhRTnFIOXRQTnNyNDFWOXdYRXRORnU1TXN2?=
 =?utf-8?B?VFN2YnUyVCtYNFNISmFwQzZJVXpDMGNDaWRKbVVvKyt4Umt3M3NvYWE4Y1hE?=
 =?utf-8?B?YTRYY0EvWUpGL3VVNVJGMHA1OTNnOFU3S1dYTkZSOWNVaW84L3ZtaTh2RWZr?=
 =?utf-8?B?RFRTc2xlV1hZSldkOE9CM1Boa2hiN1kwYnBLcFA0MW9xNHN1WGhQRHZVSG1O?=
 =?utf-8?B?WFBueVVtS01ienVVbWdSRmFTNXdhRmU3MVEzK2JseW43YnZYczYyWHprNVdk?=
 =?utf-8?B?ZlkrUTVUMFJzcnp3WXI1QkZyTkJ4YUNwTk1aa2xvS2o2ZjM5REhuVk5XWVFp?=
 =?utf-8?B?NmkxTjRkUW90dUFGUEhqUEVJS1FPN3R1NWZJU3JHK25pNlN0SWRkdld5VWVi?=
 =?utf-8?B?Z0hjeUpkNllHWE9ib2VlczUyMzNhcmQvSUsvcC9FREZZN3BQTUVuc3F1eVM2?=
 =?utf-8?B?c0dZWVRHWmlhbGZ5cXh1Sm5NV1g4bXNQTTZLczZkbldhSHprM0o2ZFE4YUM5?=
 =?utf-8?B?Mzd3ZlErOHRXd1A4dkx5NjFLczhKMXRYUDIvN2xpUVRVVWdaRG1TaU1LTmpt?=
 =?utf-8?B?Y0VJS2pVMCtQQzh2TTRRRjVzRGlYOE1vY2kySzd2VWp1MlBmL29ndTY0OXJ2?=
 =?utf-8?B?RGhrYmROTkh1bXp2ZmhoOW0zcGMzZEo2dldGZlo2YnJxQlBlMHRKS3JrVmFp?=
 =?utf-8?B?V3FLWHR1ZFR0aGdvZUx6aEdnbWFsanpaK2NSbHltbFVKdTJURDlJdHB0eTJF?=
 =?utf-8?Q?i7k6Ujlz4I2FXFInkx6J2Q8am?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c233e57-3446-46ab-f47a-08dcb1322cd1
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 07:27:04.0510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5cKpYcwEkFfBxdqg7XrP7UJ5IypDO7yv2bpkFfYR0j1c3N1OA4FBI1DKZJvchWEJBOEtbdwnngC7acx7jhSySw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6228
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


在 2024/7/31 14:26, Huan Yang 写道:
> The current udmabuf_folio contains a list_head and the corresponding
> folio pointer, with a size of 24 bytes. udmabuf_folio uses kmalloc to
> allocate memory.
>
> However, kmalloc is a public pool, starting from 64 bytes. This means
> that each udmabuf_folio allocation will waste 40 bytes.

The description here is incorrect. kmalloc pool is 8 16 32, and so on.

So, each udmabuf_folio(24bytes) use kmalloc will waste 8bytes, not 40.

>
> Considering that each udmabuf creates a folio corresponding to a
> udmabuf_folio, the wasted memory can be significant in the case of
> memory fragmentation.
>
> Furthermore, if udmabuf is frequently used, the allocation and
> deallocation of udmabuf_folio will also be frequent.
>
> Therefore, this patch adds a kmem_cache dedicated to the allocation and
> deallocation of udmabuf_folio.This is expected to improve the
> performance of allocation and deallocation within the expected range,
> while also avoiding memory waste.
>
> Signed-off-by: Huan Yang <link@vivo.com>
> ---
> v2 -> v1: fix double unregister, remove unlikely
>
>   drivers/dma-buf/udmabuf.c | 19 +++++++++++++++----
>   1 file changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 047c3cd2ceff..c112c58ef09a 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -24,6 +24,8 @@ static int size_limit_mb = 64;
>   module_param(size_limit_mb, int, 0644);
>   MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Default is 64.");
>   
> +static struct kmem_cache *udmabuf_folio_cachep;
> +
>   struct udmabuf {
>   	pgoff_t pagecount;
>   	struct folio **folios;
> @@ -169,7 +171,7 @@ static void unpin_all_folios(struct list_head *unpin_list)
>   		unpin_folio(ubuf_folio->folio);
>   
>   		list_del(&ubuf_folio->list);
> -		kfree(ubuf_folio);
> +		kmem_cache_free(udmabuf_folio_cachep, ubuf_folio);
>   	}
>   }
>   
> @@ -178,7 +180,7 @@ static int add_to_unpin_list(struct list_head *unpin_list,
>   {
>   	struct udmabuf_folio *ubuf_folio;
>   
> -	ubuf_folio = kzalloc(sizeof(*ubuf_folio), GFP_KERNEL);
> +	ubuf_folio = kmem_cache_alloc(udmabuf_folio_cachep, GFP_KERNEL);
>   	if (!ubuf_folio)
>   		return -ENOMEM;
>   
> @@ -491,11 +493,20 @@ static int __init udmabuf_dev_init(void)
>   					   DMA_BIT_MASK(64));
>   	if (ret < 0) {
>   		pr_err("Could not setup DMA mask for udmabuf device\n");
> -		misc_deregister(&udmabuf_misc);
> -		return ret;
> +		goto err;
> +	}
> +
> +	udmabuf_folio_cachep = KMEM_CACHE(udmabuf_folio, 0);
> +	if (!udmabuf_folio_cachep) {
> +		ret = -ENOMEM;
> +		goto err;
>   	}
>   
>   	return 0;
> +
> +err:
> +	misc_deregister(&udmabuf_misc);
> +	return ret;
>   }
>   
>   static void __exit udmabuf_dev_exit(void)
>
> base-commit: cd19ac2f903276b820f5d0d89de0c896c27036ed
