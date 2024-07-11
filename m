Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A4F92E2E6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 11:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EF510E9AF;
	Thu, 11 Jul 2024 09:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pFv+TKe4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2042.outbound.protection.outlook.com [40.107.212.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E19710E9AF
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 09:00:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VV8jxv6xfTNR6Z93/wTsWtWVBx1O0urTzhT/H00OGatoFU4NIoIr7Bn40gnaUB0CHj52zr4pxJ4S3IvMfUhNLxBdAqTIEPoyor1LwETq4J8zQXq4jLe5uGvraGrg9Z6NlFk79swrRyJK0zqAB8vhFTEU+LDRK05KvxMfThYw7AUkmRqvLrgmomPs5DkQ8+N/KU/vW9m//8E2bIM2dWw0xqmWW6t1U8jszm4Q0qnqd0ws7xJGAH2V8YHaddl98NCnR+ZlW/6I76AGAOjSFrgrQ3gl8Jq3Vi+CE4jELXh8zMOE79pHMBe/ptbBMN3F0v69XmTe4bXesktvoXkL6LUK5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blFVDfr8B8MmfAC81fA4E8IZ5GIeOr7KonJ++Tl6iTM=;
 b=EVadGlMbPNSntEmLtkdEpZW93JT2ZSFlmhS8tgLfpBqfydFvhKNLa4gXfy+MZ1GkLLUnZJwXxtB5lmTMM1oE0knWolbYhnu4bdicdlflROOP7RuWl6iM6upkc2uZ5SbGjphJHLWDD8eVUeliowXGm3bu/IllJllr2slCNKsxMHz/0Wer603pq2IA8OU4QG/lf+c7ZiQCPGjBYw8Il4uDm2rT2ndYz+pu6HcDwOQsILMy5e4D6168qa+edrQtUOchC04B2rS+4YX6v9O3mpEdmiW7oBMcibCNTKM9VhsNcqcmDq8MRqWFv6WAhSLtnQaTloInGgNksqtn2COMwnDJYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blFVDfr8B8MmfAC81fA4E8IZ5GIeOr7KonJ++Tl6iTM=;
 b=pFv+TKe4pVVfF4I38UXpuJMHr13xcHsQgyXdg8joKqbBKpnbUFEzNSNfYNeMs/u6eCC/f9REPJ6yZ2I60xznRyE7HLftSdomLnqLy8SwFo7Tkr6bF8wHCDottXZH7S8RfTCngja2uhT2v7+awBsZbiY9zX3uC5C42K3hgB5az3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6384.namprd12.prod.outlook.com (2603:10b6:930:3c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Thu, 11 Jul
 2024 09:00:08 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 09:00:08 +0000
Message-ID: <5ccbe705-883c-4651-9e66-6b452c414c74@amd.com>
Date: Thu, 11 Jul 2024 11:00:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-buf: heaps: DMA_HEAP_IOCTL_ALLOC_READ_FILE
 framework
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240711074221.459589-1-link@vivo.com>
 <20240711074221.459589-2-link@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240711074221.459589-2-link@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0215.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6384:EE_
X-MS-Office365-Filtering-Correlation-Id: ebc475f4-6cec-44eb-31a3-08dca187dd17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amtsY3hFdmMxTU9PU243RklxbHRBaFo2Ymk3N1Z6R0xxaWZleC80VjdEMFVZ?=
 =?utf-8?B?MEYvUzFzVi9DUVp6ellkZXp5ckdQbHdESmE1MXJQSDZGRktOMVVMTXZsbjE4?=
 =?utf-8?B?ODkzcVlPNTMycmtPbkhjSTM0S2F0WFk0M0VudE5IUU84VzUrbXBxWk9MUnoz?=
 =?utf-8?B?MHlGb29WMXp0SjdubUV0ci92NWJ5Y1d6bkY4VnVmL0E1VnhXSzhPYThENGRp?=
 =?utf-8?B?bDloZWttblhWbFkzTmhGODVOUGpybktjbkprc3VCTjMxVkJUNWF3Q2xocEY3?=
 =?utf-8?B?STlvckgzVDFGWEpaVEN6SSsxY09OeFhZVWNDaEdsT1BodDdFc09pVm5LUEFt?=
 =?utf-8?B?MUNORVR2WXQ3ZE9oUmhFS21za1c1S1lITlRocDU3Vnd6WGoyc0ZCOTJ1Rnlj?=
 =?utf-8?B?ZHcrZ3QxdUdTWUhudTk3NE5oYit0bXJvMHNHcnlUNTVYNTZGRUFVcjNRKzVr?=
 =?utf-8?B?VzREUTlBSjlFNmJKb2ozOEVWbVZmbmV0OEZIZTVWTHdNMkdCUVVuVjV5cFlW?=
 =?utf-8?B?enFJR01KcCtrcVh0QmpINkVPNk15UlRYcE5UMldJQ0dmNFZJMmY0MFhrSWVM?=
 =?utf-8?B?Y3RBUTcxSmVtNDkyUlhKSmM2Q1dUbFJZNk9vZlVuRDhoYVZPbGZvUGV2MDl0?=
 =?utf-8?B?Q2lxb2ZjK05zSmt6UEE4ZU9pQ3dGK05nQUJSdEg1QkZmNlRZbXVQN2s1TUsv?=
 =?utf-8?B?T240ajR0d1Z1dnI3Z2ppMkVsTHlNa3Y2aDFlTFRFZ2pJUlhJSE5NY1VCNlNE?=
 =?utf-8?B?YjR6alkwcldPUklzdktrUXloNjhSekpKcm4zcllIVjRYN2FMcjBSQkxLRUQ3?=
 =?utf-8?B?NkwxYlBycWdUNlFMYmpXK0RZc2VLNDExZ0ovN3N0bzVLdEV1NlFYVTIwS2Iy?=
 =?utf-8?B?WkdYc0FyN3VMTWRwZ2ptQnV3STRlS1NKRVI5TTZybXJ5RDNJNy8xOVM4Zmxp?=
 =?utf-8?B?K0hsVTJ0THI5SmJNbXJ2QVNxVStaQTJCOS9WRThqZXBEc2FjOU5FN0M5YWNH?=
 =?utf-8?B?dlZIOEJydk93ekkxRDZ6QTQ3SFhnQmM2Zk01d3BPMU52V2NlRkYwTXQrWHBy?=
 =?utf-8?B?enBkYm5reVQzb1hrK011VUFHOUhZbS9VSkY2ME5SNnU1WWpKcmx3SjRjYWRJ?=
 =?utf-8?B?SUtCc09pcXZrWHVLeDZ0VUFWUjVucjBEa2VBYUJYZnJQL3BLd0g1K1lxR1lT?=
 =?utf-8?B?ZTAyaCtJN2pOZmpjLzRnSXA1U3BLeW4zR2ttakhEUm1OTytRTmo0SEMzSCs3?=
 =?utf-8?B?OHJWd0VHdEVtRzFtY2RMbWluMEx4Zkp6citWdjJtclY4a0MzeGp5VXZmTkMr?=
 =?utf-8?B?TXc5ZzVBbldPOWFuNERnUWw4Sk1kVHJmT25rWHFEQ3I5WjgySXRsdDBxLzFE?=
 =?utf-8?B?em9pUytiQ3ViNlBGYVQyT0VvSDVjYVdKSnlEY2NJWTYydmVDM1hsUjdpL2sy?=
 =?utf-8?B?NitXNWxIaGJGS0lBdU1aOFRGOWRBU3o3WVBKUjRYakVsZVpDVkpPSzVSUFJy?=
 =?utf-8?B?YnMydXM5MTA2ckNzUDFPeUowak5VbzFOUmcyOGc1aE5JVmg0S0dvREg3VHB4?=
 =?utf-8?B?ZStZNWtlM1FFUWttWVpJZVFpSDlxTk1FSHVsSHZVZC9EYUFkdmhxbUgrZkFu?=
 =?utf-8?B?WFJ3dStZVXRZenpLOWE0a2JVZmh1NkVJaFFWc2tqMFQ3VGVRSFdJNU9LeXBh?=
 =?utf-8?B?Y3BNaDRrbkJXNnFGS3dqZEVlZng5Q05lV2hMbTVxQ0I3R0lyK0F4REZsakxK?=
 =?utf-8?B?eU15NGtXbWowSHljVXBZZis0QWFlVExZSkI2UzI0N1NCeTVWODgyMDkzSDdX?=
 =?utf-8?B?R1k3UjdBSzcxRituREludHkzNE9zTVdJV1JMaWdCR2F5NnA3RGZPUjRNYkxZ?=
 =?utf-8?Q?ithTIJhQFFNxH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmtMNGR1OC81ZHpQdXlEN0kvb09ZTDBUWis0bTNBd3M2Qzg0N1gzVDBCakE1?=
 =?utf-8?B?YjVIRk05ZkN1U1NGSnZZM2RMalhMaUhwRVg4S2pIK3p3M0FFaXZlT0FzSFFO?=
 =?utf-8?B?cUNpalJQZU1sS3JENThqSjgxZWVXWVYweEtFbjl3SHhuZzl0Q3RnV3N5aVhT?=
 =?utf-8?B?SlR3K2RuSElkbTRMMlpPOW5MV041cFU0d2V0MDZhdmE3aERqaW8vcjZyOUVr?=
 =?utf-8?B?alVNdC9uMFg4Mi9oK2N1eHpVdEVWT3FLMk9wcUNUeE1SUWd3eE54V0k5cWRE?=
 =?utf-8?B?a0thM2dJc1BVU3lkU0dnVng3UEVZRlFNWGovcDI0ZjVjZVpnaVdXMVduUitC?=
 =?utf-8?B?Tk1LdG9BY1BzNDVHajkrNWk0UnNoWU5KKzFxR1EzZWwvSHdhM1dnS3RyZTI0?=
 =?utf-8?B?bHRrV0pOMUNsNjFzbllIdmtpdFFSdWJydFBPL2pEUlRrLzFyQlE5c29TeWhp?=
 =?utf-8?B?dGp0M2s5ZCs1ZE9ycUVIdzhJZDhqanVzRGdJZjVNaHhiRUdNZ0NLT09CMFV0?=
 =?utf-8?B?NU1yMTBpOWxleEpjQWhwZUw1QkRTTHpjaGM3WWc0NGgvWkZLQ1I0b0RMdDBh?=
 =?utf-8?B?U0tmNFRtVjVaaGR1RVcwMVFUY0c1dHB3MkZISGpKUFZpVmdwcFV5TTZVQnF4?=
 =?utf-8?B?SUxCdERLRzhLWSt2SisxalRJeHR4RXhzQlhtS0J0b0ZsZS9PV3huc3cyamJD?=
 =?utf-8?B?aEpOWUhQR1YxVVVHeFJYT3hCdkJ5VjJ4U3U3UFhiYS9wc3ZvdFRRYWdMd3JW?=
 =?utf-8?B?MDkwcnhvNVI4UzkyWHBReGZKMVU0N3ZPYVAxQTlIdmt6cDdqMkQxblVidW9o?=
 =?utf-8?B?OFVWOVluY2ZNY2F0ZnpkeFlIL2ZXYWM0QTN0eTBlMG4wYkNMdmphdnJ5Mm50?=
 =?utf-8?B?Z202b21OeVlXendaUEFnc0tHRG5JSG5HU1E1Sk8xN3pWM3FncVozV2NJenRU?=
 =?utf-8?B?QkVDVEJlTnQwRXlCRU5aVGtzT0RuR0FHam1UVUZPVzNBWGw5dGJtMGh4bTM2?=
 =?utf-8?B?OCtsMzR6eWtxVmRvb1RLYThkK1AvS0NKR1ZOV0paZXhuN2Z2MHJBV3puSjFa?=
 =?utf-8?B?UW0vb0djWmpUdVZIMDFSeG85d2lvNnUyT0M0dmpGdE55Vml5MGdTQ2FXQ2Nw?=
 =?utf-8?B?TWNwNmQzRGlJKzVTYnJCUER6cWpUTTlZWGdLTXpaZjZwS1IrK0ZhSCs1SndG?=
 =?utf-8?B?eEJkYzlyS2NUL2tLekVGUC9XTDdNdFVEeTRvZld2cVhGNDE3RkRteGhWa0xs?=
 =?utf-8?B?cEJwbVFWMEhkMFZUNk5UUFRZUS9abCtDZ3YxRnl3RlhHTVhoT21NSGpJbVY1?=
 =?utf-8?B?VnN5WTJoTHVuRGsyZFZLZ3RKYWtxb2k5cUZSUnB5SWd4cGl3clV4TEVNSzVk?=
 =?utf-8?B?cjFRdVJuZGdGQnRTZ2JoU1o0emNEM2w2ejVmelVjWEZhTklRZ3ZQM3RBaU5l?=
 =?utf-8?B?czk3YlJqVmVqVVBTWDdUaGZlTHBJRml4SG5Mb1VjMDNPZitwcEdISGExZ1B2?=
 =?utf-8?B?NzhBZWVIWjZZYW1oTnE5YkNJQWZhVnVZaG92ZWdXbS9yZysxdHR6cUZFZ3dv?=
 =?utf-8?B?cWZ6N2QxcUpiK3g3cE9Wa25MZzhWb0lwNEZSU0ZZck5odElRSzFrLzIraC9v?=
 =?utf-8?B?ZHc0MExEanlTTjFIK1doRFZsRHZFakV6MDFKQ3VpZE9tTERDMFpXU1RtSjNr?=
 =?utf-8?B?cDdlVWxLN0N3WklReFp5ZmJTaVZMNjFpVEpwTWd5TDJVQWpvdlpLU0FlTVJH?=
 =?utf-8?B?WDZ4SDhuV2pmTjh4QUFra1gvSEJtZFh5K0FFYlloZC9MN2ZMYTQ5NW1qN09P?=
 =?utf-8?B?K29MQlpzMFdaL3VPNFJLUUV0L1NKR1FMS2VMQ1FRR3FRM3hEMzN3U3BaUUx4?=
 =?utf-8?B?MkNReFhLVHVDV3VjVzM1TlRENlpYU1pHVHBxUXF1S21XSWNwUjNSWXU0aFY0?=
 =?utf-8?B?Unh0OCtZM3UzdXFlaWE0TkdjOThyMUl6bnRlQWdHUWhkZ2ZXaFMvNlpuRVI5?=
 =?utf-8?B?ZXlJQy9TWkIxYzRobmtBMWNwbDNzV1BNRmxqN1hqOFVyUm02ZDJ5dTVyeVQx?=
 =?utf-8?B?MHdoa1BXMnJWVmtSTVYzSGgzSUFYb0d5R0ZGTG5vSUFnamNiRjQ2dGRpNk1o?=
 =?utf-8?Q?Znz+qxPHx+zf6Q/tG9xSmZye1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc475f4-6cec-44eb-31a3-08dca187dd17
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 09:00:08.4468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: slw+bFVczxc64jQsW/M83MDQJwb4kv2CB1FWPhnZCQbtShX2gicz0J6TQ3hszHRP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6384
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

Am 11.07.24 um 09:42 schrieb Huan Yang:
> Some user may need load file into dma-buf, current
> way is:
>    1. allocate a dma-buf, get dma-buf fd
>    2. mmap dma-buf fd into vaddr
>    3. read(file_fd, vaddr, fsz)
> This is too heavy if fsz reached to GB.

You need to describe a bit more why that is to heavy. I can only assume 
you need to save memory bandwidth and avoid the extra copy with the CPU.

> This patch implement a feature called DMA_HEAP_IOCTL_ALLOC_READ_FILE.
> User need to offer a file_fd which you want to load into dma-buf, then,
> it promise if you got a dma-buf fd, it will contains the file content.

Interesting idea, that has at least more potential than trying to enable 
direct I/O on mmap()ed DMA-bufs.

The approach with the new IOCTL might not work because it is a very 
specialized use case.

But IIRC there was a copy_file_range callback in the file_operations 
structure you could use for that. I'm just not sure when and how that's 
used with the copy_file_range() system call.

Regards,
Christian.

>
> Notice, file_fd depends on user how to open this file. So, both buffer
> I/O and Direct I/O is supported.
>
> Signed-off-by: Huan Yang <link@vivo.com>
> ---
>   drivers/dma-buf/dma-heap.c    | 525 +++++++++++++++++++++++++++++++++-
>   include/linux/dma-heap.h      |  57 +++-
>   include/uapi/linux/dma-heap.h |  32 +++
>   3 files changed, 611 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 2298ca5e112e..abe17281adb8 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -15,9 +15,11 @@
>   #include <linux/list.h>
>   #include <linux/slab.h>
>   #include <linux/nospec.h>
> +#include <linux/highmem.h>
>   #include <linux/uaccess.h>
>   #include <linux/syscalls.h>
>   #include <linux/dma-heap.h>
> +#include <linux/vmalloc.h>
>   #include <uapi/linux/dma-heap.h>
>   
>   #define DEVNAME "dma_heap"
> @@ -43,12 +45,462 @@ struct dma_heap {
>   	struct cdev heap_cdev;
>   };
>   
> +/**
> + * struct dma_heap_file - wrap the file, read task for dma_heap allocate use.
> + * @file:		file to read from.
> + *
> + * @cred:		kthread use, user cred copy to use for the read.
> + *
> + * @max_batch:		maximum batch size to read, if collect match batch,
> + *			trigger read, default 128MB, must below file size.
> + *
> + * @fsz:		file size.
> + *
> + * @direct:		use direct IO?
> + */
> +struct dma_heap_file {
> +	struct file *file;
> +	struct cred *cred;
> +	size_t max_batch;
> +	size_t fsz;
> +	bool direct;
> +};
> +
> +/**
> + * struct dma_heap_file_work - represents a dma_heap file read real work.
> + * @vaddr:		contigous virtual address alloc by vmap, file read need.
> + *
> + * @start_size:		file read start offset, same to @dma_heap_file_task->roffset.
> + *
> + * @need_size:		file read need size, same to @dma_heap_file_task->rsize.
> + *
> + * @heap_file:		file wrapper.
> + *
> + * @list:		child node of @dma_heap_file_control->works.
> + *
> + * @refp:		same @dma_heap_file_task->ref, if end of read, put ref.
> + *
> + * @failp:		if any work io failed, set it true, pointp @dma_heap_file_task->fail.
> + */
> +struct dma_heap_file_work {
> +	void *vaddr;
> +	ssize_t start_size;
> +	ssize_t need_size;
> +	struct dma_heap_file *heap_file;
> +	struct list_head list;
> +	atomic_t *refp;
> +	bool *failp;
> +};
> +
> +/**
> + * struct dma_heap_file_task - represents a dma_heap file read process
> + * @ref:		current file work counter, if zero, allocate and read
> + *			done.
> + *
> + * @roffset:		last read offset, current prepared work' begin file
> + *			start offset.
> + *
> + * @rsize:		current allocated page size use to read, if reach rbatch,
> + *			trigger commit.
> + *
> + * @rbatch:		current prepared work's batch, below @dma_heap_file's
> + *			batch.
> + *
> + * @heap_file:		current dma_heap_file
> + *
> + * @parray:		used for vmap, size is @dma_heap_file's batch's number
> + *			pages.(this is maximum). Due to single thread file read,
> + *			one page array reuse each work prepare is OK.
> + *			Each index in parray is PAGE_SIZE.(vmap need)
> + *
> + * @pindex:		current allocated page filled in @parray's index.
> + *
> + * @fail:		any work failed when file read?
> + *
> + * dma_heap_file_task is the production of file read, will prepare each work
> + * during allocate dma_buf pages, if match current batch, then trigger commit
> + * and prepare next work. After all batch queued, user going on prepare dma_buf
> + * and so on, but before return dma_buf fd, need to wait file read end and
> + * check read result.
> + */
> +struct dma_heap_file_task {
> +	atomic_t ref;
> +	size_t roffset;
> +	size_t rsize;
> +	size_t rbatch;
> +	struct dma_heap_file *heap_file;
> +	struct page **parray;
> +	unsigned int pindex;
> +	bool fail;
> +};
> +
> +/**
> + * struct dma_heap_file_control - global control of dma_heap file read.
> + * @works:		@dma_heap_file_work's list head.
> + *
> + * @lock:		only lock for @works.
> + *
> + * @threadwq:		wait queue for @work_thread, if commit work, @work_thread
> + *			wakeup and read this work's file contains.
> + *
> + * @workwq:		used for main thread wait for file read end, if allocation
> + *			end before file read. @dma_heap_file_task ref effect this.
> + *
> + * @work_thread:	file read kthread. the dma_heap_file_task work's consumer.
> + *
> + * @heap_fwork_cachep:	@dma_heap_file_work's cachep, it's alloc/free frequently.
> + *
> + * @nr_work:		global number of how many work committed.
> + */
> +struct dma_heap_file_control {
> +	struct list_head works;
> +	spinlock_t lock;
> +	wait_queue_head_t threadwq;
> +	wait_queue_head_t workwq;
> +	struct task_struct *work_thread;
> +	struct kmem_cache *heap_fwork_cachep;
> +	atomic_t nr_work;
> +};
> +
> +static struct dma_heap_file_control *heap_fctl;
>   static LIST_HEAD(heap_list);
>   static DEFINE_MUTEX(heap_list_lock);
>   static dev_t dma_heap_devt;
>   static struct class *dma_heap_class;
>   static DEFINE_XARRAY_ALLOC(dma_heap_minors);
>   
> +/**
> + * map_pages_to_vaddr - map each scatter page into contiguous virtual address.
> + * @heap_ftask:		prepared and need to commit's work.
> + *
> + * Cached pages need to trigger file read, this function map each scatter page
> + * into contiguous virtual address, so that file read can easy use.
> + * Now that we get vaddr page, cached pages can return to original user, so we
> + * will not effect dma-buf export even if file read not end.
> + */
> +static void *map_pages_to_vaddr(struct dma_heap_file_task *heap_ftask)
> +{
> +	return vmap(heap_ftask->parray, heap_ftask->pindex, VM_MAP,
> +		    PAGE_KERNEL);
> +}
> +
> +bool dma_heap_prepare_file_read(struct dma_heap_file_task *heap_ftask,
> +				struct page *page)
> +{
> +	struct page **array = heap_ftask->parray;
> +	int index = heap_ftask->pindex;
> +	int num = compound_nr(page), i;
> +	unsigned long sz = page_size(page);
> +
> +	heap_ftask->rsize += sz;
> +	for (i = 0; i < num; ++i)
> +		array[index++] = &page[i];
> +	heap_ftask->pindex = index;
> +
> +	return heap_ftask->rsize >= heap_ftask->rbatch;
> +}
> +
> +static struct dma_heap_file_work *
> +init_file_work(struct dma_heap_file_task *heap_ftask)
> +{
> +	struct dma_heap_file_work *heap_fwork;
> +	struct dma_heap_file *heap_file = heap_ftask->heap_file;
> +
> +	if (READ_ONCE(heap_ftask->fail))
> +		return NULL;
> +
> +	heap_fwork = kmem_cache_alloc(heap_fctl->heap_fwork_cachep, GFP_KERNEL);
> +	if (unlikely(!heap_fwork))
> +		return NULL;
> +
> +	heap_fwork->vaddr = map_pages_to_vaddr(heap_ftask);
> +	if (unlikely(!heap_fwork->vaddr)) {
> +		kmem_cache_free(heap_fctl->heap_fwork_cachep, heap_fwork);
> +		return NULL;
> +	}
> +
> +	heap_fwork->heap_file = heap_file;
> +	heap_fwork->start_size = heap_ftask->roffset;
> +	heap_fwork->need_size = heap_ftask->rsize;
> +	heap_fwork->refp = &heap_ftask->ref;
> +	heap_fwork->failp = &heap_ftask->fail;
> +	atomic_inc(&heap_ftask->ref);
> +	return heap_fwork;
> +}
> +
> +static void destroy_file_work(struct dma_heap_file_work *heap_fwork)
> +{
> +	vunmap(heap_fwork->vaddr);
> +	atomic_dec(heap_fwork->refp);
> +	wake_up(&heap_fctl->workwq);
> +
> +	kmem_cache_free(heap_fctl->heap_fwork_cachep, heap_fwork);
> +}
> +
> +int dma_heap_submit_file_read(struct dma_heap_file_task *heap_ftask)
> +{
> +	struct dma_heap_file_work *heap_fwork = init_file_work(heap_ftask);
> +	struct page *last = NULL;
> +	struct dma_heap_file *heap_file = heap_ftask->heap_file;
> +	size_t start = heap_ftask->roffset;
> +	struct file *file = heap_file->file;
> +	size_t fsz = heap_file->fsz;
> +
> +	if (unlikely(!heap_fwork))
> +		return -ENOMEM;
> +
> +	/**
> +	 * If file size is not page aligned, direct io can't process the tail.
> +	 * So, if reach to tail, remain the last page use buffer read.
> +	 */
> +	if (heap_file->direct && start + heap_ftask->rsize > fsz) {
> +		heap_fwork->need_size -= PAGE_SIZE;
> +		last = heap_ftask->parray[heap_ftask->pindex - 1];
> +	}
> +
> +	spin_lock(&heap_fctl->lock);
> +	list_add_tail(&heap_fwork->list, &heap_fctl->works);
> +	spin_unlock(&heap_fctl->lock);
> +	atomic_inc(&heap_fctl->nr_work);
> +
> +	wake_up(&heap_fctl->threadwq);
> +
> +	if (last) {
> +		char *buf, *pathp;
> +		ssize_t err;
> +		void *buffer;
> +
> +		buf = kmalloc(PATH_MAX, GFP_KERNEL);
> +		if (unlikely(!buf))
> +			return -ENOMEM;
> +
> +		start = PAGE_ALIGN_DOWN(fsz);
> +
> +		pathp = file_path(file, buf, PATH_MAX);
> +		if (IS_ERR(pathp)) {
> +			kfree(buf);
> +			return PTR_ERR(pathp);
> +		}
> +
> +		buffer = kmap_local_page(last); // use page's kaddr.
> +		err = kernel_read_file_from_path(pathp, start, &buffer,
> +						 fsz - start, &fsz,
> +						 READING_POLICY);
> +		kunmap_local(buffer);
> +		kfree(buf);
> +		if (err < 0) {
> +			pr_err("failed to use buffer kernel_read_file %s, err=%ld, [%ld, %ld], f_sz=%ld\n",
> +			       pathp, err, start, fsz, fsz);
> +
> +			return err;
> +		}
> +	}
> +
> +	heap_ftask->roffset += heap_ftask->rsize;
> +	heap_ftask->rsize = 0;
> +	heap_ftask->pindex = 0;
> +	heap_ftask->rbatch = min_t(size_t,
> +				   PAGE_ALIGN(fsz) - heap_ftask->roffset,
> +				   heap_ftask->rbatch);
> +	return 0;
> +}
> +
> +bool dma_heap_wait_for_file_read(struct dma_heap_file_task *heap_ftask)
> +{
> +	wait_event_freezable(heap_fctl->workwq,
> +			     atomic_read(&heap_ftask->ref) == 0);
> +	return heap_ftask->fail;
> +}
> +
> +bool dma_heap_destroy_file_read(struct dma_heap_file_task *heap_ftask)
> +{
> +	bool fail;
> +
> +	dma_heap_wait_for_file_read(heap_ftask);
> +	fail = heap_ftask->fail;
> +	kvfree(heap_ftask->parray);
> +	kfree(heap_ftask);
> +	return fail;
> +}
> +
> +struct dma_heap_file_task *
> +dma_heap_declare_file_read(struct dma_heap_file *heap_file)
> +{
> +	struct dma_heap_file_task *heap_ftask =
> +		kzalloc(sizeof(*heap_ftask), GFP_KERNEL);
> +	if (unlikely(!heap_ftask))
> +		return NULL;
> +
> +	/**
> +	 * Batch is the maximum size which we prepare work will meet.
> +	 * So, direct alloc this number's page array is OK.
> +	 */
> +	heap_ftask->parray = kvmalloc_array(heap_file->max_batch >> PAGE_SHIFT,
> +					    sizeof(struct page *), GFP_KERNEL);
> +	if (unlikely(!heap_ftask->parray))
> +		goto put;
> +
> +	heap_ftask->heap_file = heap_file;
> +	heap_ftask->rbatch = heap_file->max_batch;
> +	return heap_ftask;
> +put:
> +	kfree(heap_ftask);
> +	return NULL;
> +}
> +
> +static void __work_this_io(struct dma_heap_file_work *heap_fwork)
> +{
> +	struct dma_heap_file *heap_file = heap_fwork->heap_file;
> +	struct file *file = heap_file->file;
> +	ssize_t start = heap_fwork->start_size;
> +	ssize_t size = heap_fwork->need_size;
> +	void *buffer = heap_fwork->vaddr;
> +	const struct cred *old_cred;
> +	ssize_t err;
> +
> +	// use real task's cred to read this file.
> +	old_cred = override_creds(heap_file->cred);
> +	err = kernel_read_file(file, start, &buffer, size, &heap_file->fsz,
> +			       READING_POLICY);
> +	if (err < 0) {
> +		pr_err("use kernel_read_file, err=%ld, [%ld, %ld], f_sz=%ld\n",
> +		       err, start, (start + size), heap_file->fsz);
> +		WRITE_ONCE(*heap_fwork->failp, true);
> +	}
> +	// recovery to my cred.
> +	revert_creds(old_cred);
> +}
> +
> +static int dma_heap_file_control_thread(void *data)
> +{
> +	struct dma_heap_file_control *heap_fctl =
> +		(struct dma_heap_file_control *)data;
> +	struct dma_heap_file_work *worker, *tmp;
> +	int nr_work;
> +
> +	LIST_HEAD(pages);
> +	LIST_HEAD(workers);
> +
> +	while (true) {
> +		wait_event_freezable(heap_fctl->threadwq,
> +				     atomic_read(&heap_fctl->nr_work) > 0);
> +recheck:
> +		spin_lock(&heap_fctl->lock);
> +		list_splice_init(&heap_fctl->works, &workers);
> +		spin_unlock(&heap_fctl->lock);
> +
> +		if (unlikely(kthread_should_stop())) {
> +			list_for_each_entry_safe(worker, tmp, &workers, list) {
> +				list_del(&worker->list);
> +				destroy_file_work(worker);
> +			}
> +			break;
> +		}
> +
> +		nr_work = 0;
> +		list_for_each_entry_safe(worker, tmp, &workers, list) {
> +			++nr_work;
> +			list_del(&worker->list);
> +			__work_this_io(worker);
> +
> +			destroy_file_work(worker);
> +		}
> +		atomic_sub(nr_work, &heap_fctl->nr_work);
> +
> +		if (atomic_read(&heap_fctl->nr_work) > 0)
> +			goto recheck;
> +	}
> +	return 0;
> +}
> +
> +size_t dma_heap_file_size(struct dma_heap_file *heap_file)
> +{
> +	return heap_file->fsz;
> +}
> +
> +static int prepare_dma_heap_file(struct dma_heap_file *heap_file, int file_fd,
> +				 size_t batch)
> +{
> +	struct file *file;
> +	size_t fsz;
> +	int ret;
> +
> +	file = fget(file_fd);
> +	if (!file)
> +		return -EINVAL;
> +
> +	fsz = i_size_read(file_inode(file));
> +	if (fsz < batch) {
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
> +	/**
> +	 * Selinux block our read, but actually we are reading the stand-in
> +	 * for this file.
> +	 * So save current's cred and when going to read, override mine, and
> +	 * end of read, revert.
> +	 */
> +	heap_file->cred = prepare_kernel_cred(current);
> +	if (unlikely(!heap_file->cred)) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +
> +	heap_file->file = file;
> +	heap_file->max_batch = batch;
> +	heap_file->fsz = fsz;
> +
> +	heap_file->direct = file->f_flags & O_DIRECT;
> +
> +#define DMA_HEAP_SUGGEST_DIRECT_IO_SIZE (1UL << 30)
> +	if (!heap_file->direct && fsz >= DMA_HEAP_SUGGEST_DIRECT_IO_SIZE)
> +		pr_warn("alloc read file better to use O_DIRECT to read larget file\n");
> +
> +	return 0;
> +
> +err:
> +	fput(file);
> +	return ret;
> +}
> +
> +static void destroy_dma_heap_file(struct dma_heap_file *heap_file)
> +{
> +	fput(heap_file->file);
> +	put_cred(heap_file->cred);
> +}
> +
> +static int dma_heap_buffer_alloc_read_file(struct dma_heap *heap, int file_fd,
> +					   size_t batch, unsigned int fd_flags,
> +					   unsigned int heap_flags)
> +{
> +	struct dma_buf *dmabuf;
> +	int fd;
> +	struct dma_heap_file heap_file;
> +
> +	fd = prepare_dma_heap_file(&heap_file, file_fd, batch);
> +	if (fd)
> +		goto error_file;
> +
> +	dmabuf = heap->ops->allocate_read_file(heap, &heap_file, fd_flags,
> +					       heap_flags);
> +	if (IS_ERR(dmabuf)) {
> +		fd = PTR_ERR(dmabuf);
> +		goto error;
> +	}
> +
> +	fd = dma_buf_fd(dmabuf, fd_flags);
> +	if (fd < 0) {
> +		dma_buf_put(dmabuf);
> +		/* just return, as put will call release and that will free */
> +	}
> +
> +error:
> +	destroy_dma_heap_file(&heap_file);
> +error_file:
> +	return fd;
> +}
> +
>   static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
>   				 u32 fd_flags,
>   				 u64 heap_flags)
> @@ -93,6 +545,38 @@ static int dma_heap_open(struct inode *inode, struct file *file)
>   	return 0;
>   }
>   
> +static long dma_heap_ioctl_allocate_read_file(struct file *file, void *data)
> +{
> +	struct dma_heap_allocation_file_data *heap_allocation_file = data;
> +	struct dma_heap *heap = file->private_data;
> +	int fd;
> +
> +	if (heap_allocation_file->fd || !heap_allocation_file->file_fd)
> +		return -EINVAL;
> +
> +	if (heap_allocation_file->fd_flags & ~DMA_HEAP_VALID_FD_FLAGS)
> +		return -EINVAL;
> +
> +	if (heap_allocation_file->heap_flags & ~DMA_HEAP_VALID_HEAP_FLAGS)
> +		return -EINVAL;
> +
> +	if (!heap->ops->allocate_read_file)
> +		return -EINVAL;
> +
> +	fd = dma_heap_buffer_alloc_read_file(
> +		heap, heap_allocation_file->file_fd,
> +		heap_allocation_file->batch ?
> +			PAGE_ALIGN(heap_allocation_file->batch) :
> +			DEFAULT_ADI_BATCH,
> +		heap_allocation_file->fd_flags,
> +		heap_allocation_file->heap_flags);
> +	if (fd < 0)
> +		return fd;
> +
> +	heap_allocation_file->fd = fd;
> +	return 0;
> +}
> +
>   static long dma_heap_ioctl_allocate(struct file *file, void *data)
>   {
>   	struct dma_heap_allocation_data *heap_allocation = data;
> @@ -121,6 +605,7 @@ static long dma_heap_ioctl_allocate(struct file *file, void *data)
>   
>   static unsigned int dma_heap_ioctl_cmds[] = {
>   	DMA_HEAP_IOCTL_ALLOC,
> +	DMA_HEAP_IOCTL_ALLOC_AND_READ,
>   };
>   
>   static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
> @@ -170,6 +655,9 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
>   	case DMA_HEAP_IOCTL_ALLOC:
>   		ret = dma_heap_ioctl_allocate(file, kdata);
>   		break;
> +	case DMA_HEAP_IOCTL_ALLOC_AND_READ:
> +		ret = dma_heap_ioctl_allocate_read_file(file, kdata);
> +		break;
>   	default:
>   		ret = -ENOTTY;
>   		goto err;
> @@ -316,11 +804,44 @@ static int dma_heap_init(void)
>   
>   	dma_heap_class = class_create(DEVNAME);
>   	if (IS_ERR(dma_heap_class)) {
> -		unregister_chrdev_region(dma_heap_devt, NUM_HEAP_MINORS);
> -		return PTR_ERR(dma_heap_class);
> +		ret = PTR_ERR(dma_heap_class);
> +		goto fail_class;
>   	}
>   	dma_heap_class->devnode = dma_heap_devnode;
>   
> +	heap_fctl = kzalloc(sizeof(*heap_fctl), GFP_KERNEL);
> +	if (unlikely(!heap_fctl)) {
> +		ret =  -ENOMEM;
> +		goto fail_alloc;
> +	}
> +
> +	INIT_LIST_HEAD(&heap_fctl->works);
> +	init_waitqueue_head(&heap_fctl->threadwq);
> +	init_waitqueue_head(&heap_fctl->workwq);
> +
> +	heap_fctl->work_thread = kthread_run(dma_heap_file_control_thread,
> +					     heap_fctl, "heap_fwork_t");
> +	if (IS_ERR(heap_fctl->work_thread)) {
> +		ret = -ENOMEM;
> +		goto fail_thread;
> +	}
> +
> +	heap_fctl->heap_fwork_cachep = KMEM_CACHE(dma_heap_file_work, 0);
> +	if (unlikely(!heap_fctl->heap_fwork_cachep)) {
> +		ret = -ENOMEM;
> +		goto fail_cache;
> +	}
> +
>   	return 0;
> +
> +fail_cache:
> +	kthread_stop(heap_fctl->work_thread);
> +fail_thread:
> +	kfree(heap_fctl);
> +fail_alloc:
> +	class_destroy(dma_heap_class);
> +fail_class:
> +	unregister_chrdev_region(dma_heap_devt, NUM_HEAP_MINORS);
> +	return ret;
>   }
>   subsys_initcall(dma_heap_init);
> diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> index 064bad725061..9c25383f816c 100644
> --- a/include/linux/dma-heap.h
> +++ b/include/linux/dma-heap.h
> @@ -12,12 +12,17 @@
>   #include <linux/cdev.h>
>   #include <linux/types.h>
>   
> +#define DEFAULT_ADI_BATCH (128 << 20)
> +
>   struct dma_heap;
> +struct dma_heap_file_task;
> +struct dma_heap_file;
>   
>   /**
>    * struct dma_heap_ops - ops to operate on a given heap
>    * @allocate:		allocate dmabuf and return struct dma_buf ptr
> - *
> + * @allocate_read_file: allocate dmabuf and read file, then return struct
> + * dma_buf ptr.
>    * allocate returns dmabuf on success, ERR_PTR(-errno) on error.
>    */
>   struct dma_heap_ops {
> @@ -25,6 +30,11 @@ struct dma_heap_ops {
>   				    unsigned long len,
>   				    u32 fd_flags,
>   				    u64 heap_flags);
> +
> +	struct dma_buf *(*allocate_read_file)(struct dma_heap *heap,
> +					      struct dma_heap_file *heap_file,
> +					      u32 fd_flags,
> +					      u64 heap_flags);
>   };
>   
>   /**
> @@ -65,4 +75,49 @@ const char *dma_heap_get_name(struct dma_heap *heap);
>    */
>   struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
>   
> +/**
> + * dma_heap_destroy_file_read - waits for a file read to complete then destroy it
> + * Returns: true if the file read failed, false otherwise
> + */
> +bool dma_heap_destroy_file_read(struct dma_heap_file_task *heap_ftask);
> +
> +/**
> + * dma_heap_wait_for_file_read - waits for a file read to complete
> + * Returns: true if the file read failed, false otherwise
> + */
> +bool dma_heap_wait_for_file_read(struct dma_heap_file_task *heap_ftask);
> +
> +/**
> + * dma_heap_alloc_file_read - Declare a task to read file when allocate pages.
> + * @heap_file:		target file to read
> + *
> + * Return NULL if failed, otherwise return a struct pointer.
> + */
> +struct dma_heap_file_task *
> +dma_heap_declare_file_read(struct dma_heap_file *heap_file);
> +
> +/**
> + * dma_heap_prepare_file_read - cache each allocated page until we meet this batch.
> + * @heap_ftask:		prepared and need to commit's work.
> + * @page:		current allocated page. don't care which order.
> + *
> + * Returns true if reach to batch, false so go on prepare.
> + */
> +bool dma_heap_prepare_file_read(struct dma_heap_file_task *heap_ftask,
> +				struct page *page);
> +
> +/**
> + * dma_heap_commit_file_read -  prepare collect enough memory, going to trigger IO
> + * @heap_ftask:			info that current IO needs
> + *
> + * This commit will also check if reach to tail read.
> + * For direct I/O submissions, it is necessary to pay attention to file reads
> + * that are not page-aligned. For the unaligned portion of the read, buffer IO
> + * needs to be triggered.
> + * Returns:
> + *   0 if all right, -errno if something wrong
> + */
> +int dma_heap_submit_file_read(struct dma_heap_file_task *heap_ftask);
> +size_t dma_heap_file_size(struct dma_heap_file *heap_file);
> +
>   #endif /* _DMA_HEAPS_H */
> diff --git a/include/uapi/linux/dma-heap.h b/include/uapi/linux/dma-heap.h
> index a4cf716a49fa..8c20e8b74eed 100644
> --- a/include/uapi/linux/dma-heap.h
> +++ b/include/uapi/linux/dma-heap.h
> @@ -39,6 +39,27 @@ struct dma_heap_allocation_data {
>   	__u64 heap_flags;
>   };
>   
> +/**
> + * struct dma_heap_allocation_file_data - metadata passed from userspace for
> + *                                      allocations and read file
> + * @fd:			will be populated with a fd which provides the
> + *			handle to the allocated dma-buf
> + * @file_fd:		file descriptor to read from(suggested to use O_DIRECT open file)
> + * @batch:		how many memory alloced then file read(bytes), default 128MB
> + *			will auto aligned to PAGE_SIZE
> + * @fd_flags:		file descriptor flags used when allocating
> + * @heap_flags:		flags passed to heap
> + *
> + * Provided by userspace as an argument to the ioctl
> + */
> +struct dma_heap_allocation_file_data {
> +	__u32 fd;
> +	__u32 file_fd;
> +	__u32 batch;
> +	__u32 fd_flags;
> +	__u64 heap_flags;
> +};
> +
>   #define DMA_HEAP_IOC_MAGIC		'H'
>   
>   /**
> @@ -50,4 +71,15 @@ struct dma_heap_allocation_data {
>   #define DMA_HEAP_IOCTL_ALLOC	_IOWR(DMA_HEAP_IOC_MAGIC, 0x0,\
>   				      struct dma_heap_allocation_data)
>   
> +/**
> + * DOC: DMA_HEAP_IOCTL_ALLOC_AND_READ - allocate memory from pool and both
> + *					read file when allocate memory.
> + *
> + * Takes a dma_heap_allocation_file_data struct and returns it with the fd field
> + * populated with the dmabuf handle of the allocation. When return, the dma-buf
> + * content is read from file.
> + */
> +#define DMA_HEAP_IOCTL_ALLOC_AND_READ \
> +	_IOWR(DMA_HEAP_IOC_MAGIC, 0x1, struct dma_heap_allocation_file_data)
> +
>   #endif /* _UAPI_LINUX_DMABUF_POOL_H */

