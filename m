Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 087A5AB53DF
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 13:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F4A10E1D0;
	Tue, 13 May 2025 11:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="A3K4dQQZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A8210E1D0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 11:32:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2WljUeXkQkEfAP2G26FUta0GKgwPvYoU9duBHUBz7NAeCzoHRPYQok2NDcEd9egpnXl0oRcGe/XN/dcHtbOQNpJSOvNxBw/yYrmzScIXXhFhXQ/AJy00+IBFXW4OW0Rxsgbtv1MRUX27IjcGnqWW2gvKBK98xd8RuFqHlJOKS8eI7dKJlEkQnYQqEKSnr8NsKghjo1/2gEJBTylVvHgttrKjj3UiWkCbvQyIG1JBQSP2EDHoPrp1BEti/WJRv8WdK0Tmo253S9iYuLPe0qcZ55k7+BOiLuNvyqbPPe5RTgYKW33OSonmT4GGBHGxL0O8mH3Rrv6qykMxv6TZShLYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1BP2LfU97Du7tyStrCtCYbeMx5ro4/canSYiJgPeU3I=;
 b=n9PnwzztNmnMVuhtplVWvzmID5PoWcoXuTdFfqDk6mOQUqqxKQJTULtlWCSTfM/RNKSxy5TgppUvKnd2codR/F0Z44u6biShXrOjom2hUFocGzU/kFaOB+e8Gl183CtAfOefTLEd3taxQvWO7ONlke3JkMyJVIVHgc1xetpggNyzeabRxHt4SGMoTu7Y2Cgmb0uwyBd7EM2O3kJtuFxEVbgUQEjrCAptggh3VKV1yPnekVtZu1L9rgOpnMpqet4WhNYSZMXemqXab7GTYNQeUL98Ho1LUkIY2SpN/cf67kcnvOLRawncfjMThRS4cuqIoWRh3v0wKSsm+fo82AiL9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BP2LfU97Du7tyStrCtCYbeMx5ro4/canSYiJgPeU3I=;
 b=A3K4dQQZJON2yXZ/qaeF5dA9amSB7vJdsAqX82jbmBevu0/HyxXlRfW/8X99U5yUT6mhMZId6jRWkdu/RFJU+a0lmImcjHue6mzXDK0dTbRHCp5J6eyCI68fR11eAO9o9gHHNJ80V+614HFMPAmY6/sM8IwFyZ+VJkR5o2D1YnI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4313.namprd12.prod.outlook.com (2603:10b6:5:21e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 11:32:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 11:32:15 +0000
Message-ID: <fdc8f0a2-5b2f-4898-8090-0d7b888c15d8@amd.com>
Date: Tue, 13 May 2025 13:32:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dmabuf/heaps: implement DMA_BUF_IOCTL_RW_FILE for
 system_heap
To: wangtao <tao.wangtao@honor.com>, sumit.semwal@linaro.org,
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com,
 tjmercier@google.com
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 bintian.wang@honor.com, yipengxiang@honor.com, liulu.liu@honor.com,
 feng.han@honor.com
References: <20250513092803.2096-1-tao.wangtao@honor.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250513092803.2096-1-tao.wangtao@honor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0350.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::25) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4313:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f6a8e65-b460-431e-8065-08dd9211cfe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2lKMWpVN1lFTmRDVHpDMEo0SFJ6RktOZ1I3YXJyKzYzT0MvMDFMV2U0RGp1?=
 =?utf-8?B?K0trQmJHZEprQmJEd0VsQUdkSWFTc0tKKzJmQlFzdjNod3poak9icE1QQVZG?=
 =?utf-8?B?cEpwRkR6ZmExQnYyaVBFTTFyMWlKdzRUcGZucjk5cS95K3NaZWE2UGJQZnlv?=
 =?utf-8?B?enRoQTJRWnM2eW04TmFFNFZtc2lyMzhGVFUzYW1nS3FHaCtCeVlTT3g3NW02?=
 =?utf-8?B?dzZPdGlLT3cyRisrSWZhc25KMWJSMjdtYzM0R3lrNmZyNGJyam9NMHpDdVBJ?=
 =?utf-8?B?ZFRKc1lpWlhkQlRzMVhNeEJxMkFVclpPYklwN3BUQ0t3TjVDWEZaa1FWbjJ2?=
 =?utf-8?B?b3BzMXVlY1JIUXltVFk3a2hKcUtFQ2N5K0VmdVVaM1g3dVVORHMwZk1KQ1pq?=
 =?utf-8?B?eWd0MFlmWGVuaGxsd3gvcHAwMTNmREcvRXhJZ2tPcUFNMXNDZDZwUzI1VjBz?=
 =?utf-8?B?S1B4MmFFbjE0eWQwbmh6dUxJbGY3amxKSTdOa3VJNTNsc3QrOHk3N0s1Y2s5?=
 =?utf-8?B?MTJUVlBIRytpVFlXaHdWMjcxRXB1bGV1d0kyQyt6RUxaUEdLTEhJSjZsdklH?=
 =?utf-8?B?OXR1MjlLU2dxVCtEUXNqTHNkd01TUnRwRjNXS09zTjViN0c0WFBHNnFzc3g2?=
 =?utf-8?B?VzU4cmQvOGRNMk1TcDlTV2hYcCtGREJTMVVuYUdhTG0zQUxIQlhnUC9oSVoz?=
 =?utf-8?B?UENhMmFZTUwyYmhxQkt3K2RRVTlwaDlkL3U1bWMrVXNhRHdyS01GbWZ1Unox?=
 =?utf-8?B?THo4dU9IM1liUS85VzFxQ1lRY1o2Nm45emo1bmJUZHJxM1BQYnAyYkVVTjQ5?=
 =?utf-8?B?aFlaTFk3NFZRa0JRdENtY3Zhckp5R2hDbzRucm9SNy9TTFBIeC9vK1ZvRGJJ?=
 =?utf-8?B?K0YrcWEwa0hraHVDaGhYU3YzYVpZWjlKRVlSQ2pHdFBCTVJpVVArSFZncUg5?=
 =?utf-8?B?Nm5sMDhRYnRDZGRoN1JCbW1HQWdYb3ArN2lyOUxTMWc5UkE3YThuNHdFbjlG?=
 =?utf-8?B?cXpYcmc1NjFFMEIrZ3BCNlJMUWpHZThJWnh1VkdjOERtYWZGV3FrRzV2QzlK?=
 =?utf-8?B?aDhWbkYwWEo0VDFPclVTOEJoWXFtTTRFNkhvM0xvUVcreXBuaEF3RDY4aVZS?=
 =?utf-8?B?TFdnUXdaNityZGRsRnBrQ01wUjdHT09kdHpRK0NzQjhwakZiS0RCNHplL0h3?=
 =?utf-8?B?R1BvWUEyNng5aG92dTc5Ny8vY1M4TDJ6TnlONTkzUUhUTU5uTis2dGo5ckc0?=
 =?utf-8?B?dENtMVM0KzhmZHFWc0N3ZVVwOEM4UHBNNGlNSmxHWGhQMnpyVlc5aVhja0dM?=
 =?utf-8?B?bnRMWlk2YVZIcXFyaHVUVngxcTlRZHFNUG5ad1cvYTNvYkJtQktVRFZuMWhz?=
 =?utf-8?B?QllwUUVUSGRLV21ZY1pQYXRGS2R3U3hic3NwbkcveEN0OWxwN24ya0FRSEhY?=
 =?utf-8?B?MTFIMTJ1ZXVzMGtxN0VGZ2VLa2hOemRmSDJ4SGozNlYzcEhVdy9abmQ0VDJG?=
 =?utf-8?B?Sk5YckdaQUEyd1JJcTdIcEtyWjN2RmlHNU1obzh3QlQ4SXFEOHo3VzVEMHZY?=
 =?utf-8?B?UnJnS210SGxUWVlTS0prVEZhd3IwK044Wkl5VXJlWFFuMk5rcHA2Vmo0L2k0?=
 =?utf-8?B?aUxvSFUxN29sbTN3eGIyVnBLa01YNU5hNC9VYVZxMGYyMVNSanNoRTYreWNC?=
 =?utf-8?B?U0xMZVltLy9NVDA1VEJaTGI4S2RETDBHc0xic25rYnU1MWdZekVnZ1E5WkF1?=
 =?utf-8?B?cDRzemJpNU9KZzlaTXZDemxWdks4cHc5d043TzE5S0srampqNDZvRlVGeWVp?=
 =?utf-8?B?R3o3elpFRStLWHpaRWtDdFd6dTRZa2o0R2RYQXphRkNhQ2lZVlNVeEdrOW52?=
 =?utf-8?B?QWZBaVRMRWFJM2hidDladVdKWHZmQXZid29aSFRGVFIzMXVLNGFzTmhuWUQr?=
 =?utf-8?Q?Xv7ZxQFMPWc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFJBVHMySW9QVmpKMTFLQURNeEduTDBDd1NLUFY4bGYxc3BaSSs3Rm1RSmFo?=
 =?utf-8?B?NHNOckdJYTNFSUdGNktRTVBzNzhxNkt4bEVCMFpVMzBUZGMyN3VEYkMyQzBC?=
 =?utf-8?B?amtjUG5kWS82UHVlK0xRckNwVzFoMmZnc2oxejhBclV2YTI1bEVDbTNiYW1m?=
 =?utf-8?B?UDYvYXQvWWo4YlJjSHRvbFZlMTlrL3R2Lzh4LzBMNU1WSmZJSUI3KzZPbFEz?=
 =?utf-8?B?MzFwMUxIVGVRYWYzRVFiZis3VEZtSnhVL0k4WVJSQ3lEb2ZsOEkrV010eW00?=
 =?utf-8?B?ZFJjZEFvY3F0N2R5cGNEVzlpai9hcTcwcm9mK3BsNDRWbGNGUjR1YWdzYnBz?=
 =?utf-8?B?RG4zcnNYVUNpMWQrb055R3RCRVl2d3NlTVh4WkdLNFB4eDh5QmR1cXJZdWpu?=
 =?utf-8?B?Qld1czhWeXdZRTN6YjBnQnZrZk1KYmJLQ3dyRHQwWXo3TzhMQXMvRklnUCtY?=
 =?utf-8?B?U3ZxRVRPTWd3RTZiTmdubW91b1VERTA3R2hhSWw1ZWdhSHhrdWJSMGxKMVNm?=
 =?utf-8?B?Q0ltQ2tib05tQXFiNnV1YXd2bGUxNzRwaEtDMm0ydkxsTUJqQ0pBelhUam1n?=
 =?utf-8?B?Z21rQjNYTGtBU3psNkh0YWw4d0Z5dGJoSnlUR25MWHBNc01QalVQb1NLN2Fa?=
 =?utf-8?B?QlJNRlhSRys1SDRYb2kycndUdjh3b3BNWE04bm02VHJkRTc1c2tkZjRrWlJw?=
 =?utf-8?B?dWJpa1VLRmh2aGRwR1lwc2pSbXRDNlkxQkR1TEVLZGV3dkRTYSsvVUgwYXJs?=
 =?utf-8?B?dzIzM0kvQXRweVpFSzVSYllTdnZjOU93WFlOVEFrdlFueUhUUzRwNVZzUjVh?=
 =?utf-8?B?a2JqTjg1R2lpSjdyV3JSc0lhTmZYbEtFenBSbloyQVhFUXVFS29lSzQyNkJ4?=
 =?utf-8?B?TlJVTGwrYTM4dlo4Ti9rRHMxcitsU3JTT3hnZ01lcGNyQ01PUjdKNnpTVllk?=
 =?utf-8?B?ZEhZelVKaVVBMnk3QlZ5YUFZY21UUlZUTE9Od0lXSVZGS1NORk1UbFZMUFky?=
 =?utf-8?B?VFZ2cCsxQVI0OUtkRnI1aWdzOEp3WTFWajVZZXBKQUpLdEoveG1QRmdzT0Jn?=
 =?utf-8?B?SlluV3RTWXJCZngwVFgwbHdVZ1ZzN3cxY0c2bDROaitjSmhKamVEVjFYd2dt?=
 =?utf-8?B?OE9qYnJteGRWRExTcHR1SW1RZXVjQ24xa1dqZWdPSkFZTURPNlU2eXJwSFVp?=
 =?utf-8?B?WDczM2FjbjdTZFNMa2xSYU5rSit1WDZybzFJZUFzN04xUERWUUN3bFZtTHln?=
 =?utf-8?B?aDV4MGl1bzc0SW5nRXlOdmp2OC8wTS9rSHZmTHhoQnFsV01oRFJNR0xzTU1V?=
 =?utf-8?B?NENIa0ZYdG9iaWJndURtdExITzdMVEJKRndEN2FzUHc3TjdXSUpYV2xqVnR3?=
 =?utf-8?B?UEo5WmN0eVQyanVoSnBobUduaWtmdmFoSElSRlc2b0xZNmxqZW4rejhWMnJO?=
 =?utf-8?B?RlBOZ2Z0UHBLUm1LMXpJOHpQVXNRU3VYamlEdTVJMlZ4MEFETTN3UU1SMWVv?=
 =?utf-8?B?TlJxb21oMGZPUUU4Y0hRKzc5R1hSY2cvWk1Ua0VvRXRYQzM3Z2FVb24yZU5V?=
 =?utf-8?B?UUNrZjhsTEhWZGhUbUZHenNkNnFKb0tFWUxJbDN6UnVGOVloWVFOYmU1TW1L?=
 =?utf-8?B?ckcxQldKQUNSWjdjOGZMamQwTWcrZDhPbHNNNWl3R2llUDZhZWZYTnNGQzlp?=
 =?utf-8?B?TnI0VkVjejh2NjRNNXJROW05aGd0eXNWNVFHbm1OeWtBZXNZL0hvK3hwOXFx?=
 =?utf-8?B?ZzNiNFUyalNaemU5OUtCdUlBd21WY2sxdW9xb003SnRjNEhJOXdRRGR5VDlT?=
 =?utf-8?B?WmJPQjR3ZWZzeTJzeTNyY2psY0ZvTi9nMGxiMEJrT2l4aEQ2cmZ0UC9ET3V1?=
 =?utf-8?B?TXJHRG16dlFTQXM2SElWRmJrVDI0N01HMEV6bEsycld4TnJVOThTYTExKzhn?=
 =?utf-8?B?SWJSeE5zZ1V1N3lvNEFESkhuaEZMNmNId3lKVUJ1UG5ONm5uL25OWVVFMHd0?=
 =?utf-8?B?dHBBNGVDenhxem10eVJieFg0aUdFbGxYNEltU25HN2ZUR0FsZ1N4NkdGSllG?=
 =?utf-8?B?c1YyUmdrcElMbGJ1K0RRVDQwbVQ0REtOV1lvQ2ZMZ3hITi9Ub2lTdW5oTVU5?=
 =?utf-8?Q?7OQ6QwK4bEbOam0dYGKQL20k8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f6a8e65-b460-431e-8065-08dd9211cfe8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 11:32:15.8412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3OEl60iRc1OxYCWpyGGh6Wkt3/61r4kF8AYD8zHnHD58LjFyDGucdiR/bKdLiai
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4313
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

On 5/13/25 11:28, wangtao wrote:
> Support direct file I/O operations for system_heap dma-buf objects.
> Implementation includes:
> 1. Convert sg_table to bio_vec

That is usually illegal for DMA-bufs.

Regards,
Christian.

> 2. Set IOCB_DIRECT when O_DIRECT is supported
> 3. Invoke vfs_iocb_iter_read()/vfs_iocb_iter_write() for actual I/O
> 
> Performance metrics (UFS 4.0 device @4GB/s, Arm64 CPU @1GHz):
> 
> | Metric             |    1MB |    8MB |    64MB |   1024MB |   3072MB |
> |--------------------|-------:|-------:|--------:|---------:|---------:|
> | Buffer Read (us)   |   1658 |   9028 |   69295 |  1019783 |  2978179 |
> | Direct Read (us)   |    707 |   2647 |   18689 |   299627 |   937758 |
> | Buffer Rate (MB/s) |    603 |    886 |     924 |     1004 |     1032 |
> | Direct Rate (MB/s) |   1414 |   3022 |    3425 |     3418 |     3276 |
> 
> Signed-off-by: wangtao <tao.wangtao@honor.com>
> ---
>  drivers/dma-buf/heaps/system_heap.c | 118 ++++++++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
> 
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 26d5dc89ea16..f7b71b9843aa 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -20,6 +20,8 @@
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/vmalloc.h>
> +#include <linux/bvec.h>
> +#include <linux/uio.h>
>  
>  static struct dma_heap *sys_heap;
>  
> @@ -281,6 +283,121 @@ static void system_heap_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
>  	iosys_map_clear(map);
>  }
>  
> +static struct bio_vec *system_heap_init_bvec(struct system_heap_buffer *buffer,
> +			size_t offset, size_t len, int *nr_segs)
> +{
> +	struct sg_table *sgt = &buffer->sg_table;
> +	struct scatterlist *sg;
> +	size_t length = 0;
> +	unsigned int i, k = 0;
> +	struct bio_vec *bvec;
> +	size_t sg_left;
> +	size_t sg_offset;
> +	size_t sg_len;
> +
> +	bvec = kvcalloc(sgt->nents, sizeof(*bvec), GFP_KERNEL);
> +	if (!bvec)
> +		return NULL;
> +
> +	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
> +		length += sg->length;
> +		if (length <= offset)
> +			continue;
> +
> +		sg_left = length - offset;
> +		sg_offset = sg->offset + sg->length - sg_left;
> +		sg_len = min(sg_left, len);
> +
> +		bvec[k].bv_page = sg_page(sg);
> +		bvec[k].bv_len = sg_len;
> +		bvec[k].bv_offset = sg_offset;
> +		k++;
> +
> +		offset += sg_len;
> +		len -= sg_len;
> +		if (len <= 0)
> +			break;
> +	}
> +
> +	*nr_segs = k;
> +	return bvec;
> +}
> +
> +static int system_heap_rw_file(struct system_heap_buffer *buffer, bool is_read,
> +		bool direct_io, struct file *filp, loff_t file_offset,
> +		size_t buf_offset, size_t len)
> +{
> +	struct bio_vec *bvec;
> +	int nr_segs = 0;
> +	struct iov_iter iter;
> +	struct kiocb kiocb;
> +	ssize_t ret = 0;
> +
> +	if (direct_io) {
> +		if (!(filp->f_mode & FMODE_CAN_ODIRECT))
> +			return -EINVAL;
> +	}
> +
> +	bvec = system_heap_init_bvec(buffer, buf_offset, len, &nr_segs);
> +	if (!bvec)
> +		return -ENOMEM;
> +
> +	iov_iter_bvec(&iter, is_read ? ITER_DEST : ITER_SOURCE, bvec, nr_segs, len);
> +	init_sync_kiocb(&kiocb, filp);
> +	kiocb.ki_pos = file_offset;
> +	if (direct_io)
> +		kiocb.ki_flags |= IOCB_DIRECT;
> +
> +	while (kiocb.ki_pos < file_offset + len) {
> +		if (is_read)
> +			ret = vfs_iocb_iter_read(filp, &kiocb, &iter);
> +		else
> +			ret = vfs_iocb_iter_write(filp, &kiocb, &iter);
> +		if (ret <= 0)
> +			break;
> +	}
> +
> +	kvfree(bvec);
> +	return ret < 0 ? ret : 0;
> +}
> +
> +static int system_heap_dma_buf_rw_file(struct dma_buf *dmabuf,
> +			struct dma_buf_rw_file *back)
> +{
> +	struct system_heap_buffer *buffer = dmabuf->priv;
> +	int ret = 0;
> +	__u32 op = back->flags & DMA_BUF_RW_FLAGS_OP_MASK;
> +	bool direct_io = back->flags & DMA_BUF_RW_FLAGS_DIRECT;
> +	struct file *filp;
> +
> +	if (op != DMA_BUF_RW_FLAGS_READ && op != DMA_BUF_RW_FLAGS_WRITE)
> +		return -EINVAL;
> +	if (direct_io) {
> +		if (!PAGE_ALIGNED(back->file_offset) ||
> +			!PAGE_ALIGNED(back->buf_offset) ||
> +			!PAGE_ALIGNED(back->buf_len))
> +		return -EINVAL;
> +	}
> +	if (!back->buf_len || back->buf_len > dmabuf->size ||
> +		back->buf_offset >= dmabuf->size ||
> +		back->buf_offset + back->buf_len > dmabuf->size)
> +		return -EINVAL;
> +	if (back->file_offset + back->buf_len < back->file_offset)
> +		return -EINVAL;
> +
> +	filp = fget(back->fd);
> +	if (!filp)
> +		return -EBADF;
> +
> +	mutex_lock(&buffer->lock);
> +	ret = system_heap_rw_file(buffer, op == DMA_BUF_RW_FLAGS_READ, direct_io,
> +			filp, back->file_offset, back->buf_offset, back->buf_len);
> +	mutex_unlock(&buffer->lock);
> +
> +	fput(filp);
> +	return ret;
> +}
> +
>  static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
>  {
>  	struct system_heap_buffer *buffer = dmabuf->priv;
> @@ -308,6 +425,7 @@ static const struct dma_buf_ops system_heap_buf_ops = {
>  	.mmap = system_heap_mmap,
>  	.vmap = system_heap_vmap,
>  	.vunmap = system_heap_vunmap,
> +	.rw_file = system_heap_dma_buf_rw_file,
>  	.release = system_heap_dma_buf_release,
>  };
>  

