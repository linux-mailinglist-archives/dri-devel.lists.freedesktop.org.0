Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282E393AD09
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 09:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCAF10E1B0;
	Wed, 24 Jul 2024 07:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="e8pSK8zj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2089.outbound.protection.outlook.com [40.107.255.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FC610E1B0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 07:13:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtQWHc/zVBc3uJii8w7byXLUk1vg9Oywcpdt6RIyRKT+7wXLQm7wL4m3wjqY+1DFUdLMVKpffXV/SMoTnTWc2Kp8eGCdTjEZ4CzLwwBcMp7gaE80/3jZZv8H3qsa5PiyoY3369z9te/nawIwJ4+bvkgDixgQK76OfhhhMDZe9mgnz9GoAq06n++2y9x7qFIRYtjfxcym9V9Dr/DLdvAvqXxNFP5SN1GJ0BbjkvZx6KPOi+TaPzYtFtluGiuVV9VcwofoGLm3URtGQzJECav5iGxq8zTwSCiKZ0lYPsWy1PwPajIwLGHVEsPUBhYxZmHBoKNfoTbEgzIYD/4y4rs0BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IM11nHPW/9i3m69DcwLPRJO20reDYOF33hSk/XPZjrM=;
 b=JV3PaX7+HseOekxrvzONN9XTLuivWa0Ef+pVU+fyRIeJQiKV/z3hrJc6bzlFMm2pHkKIRA+7P5Xp7SJ1gGde3wGJFdIisgWQc74Z++RhFJsBjI2TlS1/NgxOSa59VeM+QkBmhAgHRt0K33E8VSksbF+cZ7qItMLi+690PtbUd7qyrCN9HVajdcK6WROpeqCXcMdOFZImWMeIQb3MVLuIXFek+LO4Mhv1oh7k707v3PkJj+Al/uibEdct3TV5O7wjfmoQgy1hLL7//3336xBoGdaws47qFRxzTW7vdbBnW0aN7Wx1aEItW5p6TirMopdh0Dbx55Df7lED30QUwjJg+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IM11nHPW/9i3m69DcwLPRJO20reDYOF33hSk/XPZjrM=;
 b=e8pSK8zjiCeOyePz2iu3mXLRv/Qx9MhOTaqfPsFabWooHQqHIanlvQwzW/MzWKi3LJkoojz0+o87Xu3NsYXq9fn3zpdUboPzG4jGNzbNjBq4qm7IGFeANrtzqCG+d6ZfIwzHne41d+F8iGg3rCuDM99Vk57uKZVecxHA+D8FJdaPguEwsuAYtk1rZ58dXkcCFZ/H7gutH0AVA647V0jCrkyaRal/Bp9XignQ5nuhveLLI5uDtq351/SxWEgwLia2g5aBG19QPNkSKY2nGMhVbWDSvqBz51/g/2Xn7wKtyWJ4zhWRJ4BD1hrS0Pa+xu/y4z7o9bZWLNNVcFMb2RZlww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEYPR06MB5672.apcprd06.prod.outlook.com (2603:1096:101:bc::11)
 by TYZPR06MB7273.apcprd06.prod.outlook.com (2603:1096:405:b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 24 Jul
 2024 07:13:02 +0000
Received: from SEYPR06MB5672.apcprd06.prod.outlook.com
 ([fe80::2f0c:5cf2:abb0:d852]) by SEYPR06MB5672.apcprd06.prod.outlook.com
 ([fe80::2f0c:5cf2:abb0:d852%6]) with mapi id 15.20.7784.016; Wed, 24 Jul 2024
 07:13:01 +0000
Message-ID: <276e29fa-1252-4c91-a5e4-eaf367b4fbb0@vivo.com>
Date: Wed, 24 Jul 2024 15:12:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-buf: heaps: DMA_HEAP_IOCTL_ALLOC_READ_FILE
 framework
To: Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <20240711074221.459589-1-link@vivo.com>
 <20240711074221.459589-2-link@vivo.com>
 <5ccbe705-883c-4651-9e66-6b452c414c74@amd.com>
 <ZpTnzkdolpEwFbtu@phenom.ffwll.local>
 <99364176-a7f0-4a17-8889-75ff92d5694e@amd.com>
 <06713006-c5ce-4773-a1b3-ca3bea56ee45@vivo.com>
 <ZpY-CfcDdEhzWpxN@phenom.ffwll.local>
 <b18ad853-90e4-4ad7-b621-2ca8a8111708@vivo.com>
 <Zpff-8LmqK5AD-a8@phenom.ffwll.local> <Zpf5R7fRZZmEwVuR@infradead.org>
From: Huan Yang <link@vivo.com>
In-Reply-To: <Zpf5R7fRZZmEwVuR@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To SEYPR06MB5672.apcprd06.prod.outlook.com (2603:1096:101:bc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR06MB5672:EE_|TYZPR06MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: ffd41735-3177-42a3-eb0a-08dcabb00dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|52116014|7416014|1800799024|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3lFdVNpWWhzYUxhdWRYemo5T05OMmhrRmJnWW1DRkI2RW9iNFpDZVdZMGww?=
 =?utf-8?B?cHJ4a3ZEZDFaM3FwZzNDUUdNRTZsb1d6MlFMZndrRVptZ2lsWVhZWU5mbktV?=
 =?utf-8?B?RnVXSTk1NVlEYlplNVoyV3dMNnRiTjBDcGdjU09aYmxzTTM5a3FCL3Jtb1VL?=
 =?utf-8?B?eXdhMTltb3RuVlAraVFTcDZXdmtKZmg5TlFHMHJUc1RCOHNja1ZSTTRRYXZw?=
 =?utf-8?B?K1FXUkVEZUo4WGNJd0gvYnFDQ3MxNFA3dDB5MXE4TVNsQzQwa3FoSWFYZVBU?=
 =?utf-8?B?Q09RSUtUdUlYcncxZnl5Mjg3L01VTkZ3VkJrZmZDV0RwVHFEZnIyaUZjUDJT?=
 =?utf-8?B?aGdFcXZzakhEeWVjYzBsRklWSWhFQml2ZE5yQXJ0VWRTTW9GVi81RllNbnVW?=
 =?utf-8?B?Z2RnR09OSEE0M3lRSjU0a1N2RVQ0TmJFSEdxVWpsNGI4TjBPVytraFlRK01v?=
 =?utf-8?B?MUR5aDhVWTlsSkJHQVpKTjk3clRyYmF0VWh6Nmd0M2dTeUIxY1NxVkptb3hu?=
 =?utf-8?B?aG9Pc1hVWXltaGVzRjFrREJUYWlaWGZuQm5XYWJ4bGVNbHhtVmJJVFBOUFRp?=
 =?utf-8?B?WjVBZkJCN0VrbGsvbU9FalR6YTVPS0pHRTV3OSsvc3dSNHlscklMYUNTVExW?=
 =?utf-8?B?RnRjam9XVjFCODQ1UG5BZWZHejlXU3hLZHJIRkphZjFPNmJNbXhVRjNyMUw0?=
 =?utf-8?B?bmQ4MFdPNXBrVkxxdjNnMXppeHZuUGZJVFZsK1d0RlRPb2d3SFdCRHBsUFNy?=
 =?utf-8?B?SHRjOWdlYlJEdm04TVpXZUVIUjROeUZGZmVaWkVUNVRaVk1iZjdmY05NcjY4?=
 =?utf-8?B?WVo4Z3lLZHNQMnROM1JGbjhxREhCa3c2bk1kV3k4VDl5R1Q4TjFiZytaeFVv?=
 =?utf-8?B?TnRBVW5QRkVwOEZjRTZJbEtLS3IzaWp3Njd6UHFSNnR5bldBVlE2ZkIzbWtk?=
 =?utf-8?B?TVJaWndQUmJiNkprNjluU3ZBWUhnVVlmZEdvb3lVUEhvMTN5bDFBd1Fycjha?=
 =?utf-8?B?a2U0K2J3ZkJHaXQwTFI0cXBSVkFEa0RWQnBkNmZMZUVMVjc1S2JPVm41QTQy?=
 =?utf-8?B?NFZPMys5TCtMVmtOb1JIOG9LSnJlblVjWXJQc3J6MVBTNDkxN2h2cXo2bnB5?=
 =?utf-8?B?bmxGc3pZOEtCRnpHOVpyektjanl3OHJuc1FweThpekRzUnR6SEN0d3Nxakw4?=
 =?utf-8?B?NjFteHJZaFRyYjRpc2xlMG9BYjhMMWlNcVNSL2IyQnNFck9DNjFVY2FoampO?=
 =?utf-8?B?L1g3M0RuTFFSalgzT3RkRS9QODRpejkxek5Wd3IvcFNycTRsUGIxbWhMcG1h?=
 =?utf-8?B?L0E5dUI3VjhORjZqNEFPUytuYVowSUtVOTBUODJLNW1QbklBTkJZUk1EVmtO?=
 =?utf-8?B?Tzh3eWRtOFlKQk9vZFpkc0k2emp3ZWR3WHdNQmdpZFcreEpHTy9ONCtmMm42?=
 =?utf-8?B?WEtxVkZVdE9ZVk05WmlZQ2FyN2tTcVhhUXlvakIxR2Z2M29uSFdHL25RRU00?=
 =?utf-8?B?am9kYzFBWFphR2lVdGNhSzM3OVdWcWgxaTgyWHdvSS9sb2lUN05WdmlLbUxk?=
 =?utf-8?B?aC9sU0xhdTJ0cXNQNjEvUWI1RG1OUkx1Y3VScmZoYzZ3M2Q2WTB0M1I4NkFO?=
 =?utf-8?B?eFdkdmY4dFNIck13K2gzV0RiOThwVGJKUmZ3clRQZ3NYZjdnMjJYNm9MQ1VH?=
 =?utf-8?B?UFFON2VrcGlBQ0w1VXlKaWhNYnIzTlV2TWxuekMraFhNelh3MmpucDBxQWF2?=
 =?utf-8?B?MkcyWlFyZ0RnLzNwTytHMGoxUE9nMjdRRitrSzd6OWxoOXBLc25MNUNhYUtt?=
 =?utf-8?B?QmgxWTV4ek1SSmtnOGRDZ1RTdGkzUXd4RXZlLzRNUFVXRHFVR3g1MkVYWFg0?=
 =?utf-8?B?Z3dSTjFjaFM3dThCU3hPRkRqY0VhdTFtbVo0YzIzQXdYcUNpbTB2ZFFmTU1a?=
 =?utf-8?Q?wbEq5krEKPI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR06MB5672.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(52116014)(7416014)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlJSakxtOGVmTFdLNE90YmNuMmtsRmJlemFwbHZtYlNxaWdiU3VUOHF5OGNP?=
 =?utf-8?B?ZElodVMwNUVDdDd6LzRPVTJxQ1hRUkxzUERXYUFuSEJROWJsbStUbS9rcXVQ?=
 =?utf-8?B?UEc4QSs0STJBejhVdzBUek5MazQ3ZWJNaDFLOG5vdU9IanczaXg2YnQ2REJS?=
 =?utf-8?B?dlYyRlFkaUwzbEJhdWRqS0ZWTlhDRkN0aUgwQTluaUZjOXQrYjRncUV0Sk83?=
 =?utf-8?B?RVQ0WGR2V2xxNFVzeEh6VDZnbU4vR0VlZklOMVJrSWdXTlNrMVZjRU5wa1V5?=
 =?utf-8?B?VXpmVDhsanN0Uk00eHFHdCs2S01CMW91ZWxGaVArWmVDRGV0ME84WFpPa0ZJ?=
 =?utf-8?B?djQ0eUROWTg3QXZUYjJQWmovUVZsZVdmWEJqUUZwcmgybTNVTTFFODd3V25h?=
 =?utf-8?B?Uk04d3NoQjJqNHdkMm9QRFdwdTAzbW9reDA4OUtvT2s3Rkc0WXZhMFZjYjlQ?=
 =?utf-8?B?ZERBTnVqYmFDRFZUVUZ6cVJNaGRiTkhsREthMmF2NU1YWFZ1aEk3OVMwOGJr?=
 =?utf-8?B?Y1pGVjVMMk1qQ05paXhJdlZTVStOZkk2MFFxNkNSUVJwOGJ3b2kyN0pLd0NL?=
 =?utf-8?B?cGh4YkpDNG9BaXJ1N25uU3VTbVBEVFlWbTY3bHRkRThHdjN4aEgweHVOT0RE?=
 =?utf-8?B?QW5oTHU4c0pma1hWT0oyUWdvMlNxSDJHSHpMb3JtUWZEZlBBZlJEQzlBeElz?=
 =?utf-8?B?dEVsTkNMVjZ2a1JCR3k2U1MwaFVGaFE4YmVaK2FQVUlmRS9tZ3RKUlAzaXNh?=
 =?utf-8?B?VXJGUUxIaDkvMzB4dFE2S3hoMGFYMytJUDQ0T2Q4L0trbWhUUm53M0NzRlk1?=
 =?utf-8?B?bnlicC95aE9GeGgyT2FDMk1IbU1nNTg0RmpZZWdCaE9aVXJneGdISWQ4TFZE?=
 =?utf-8?B?S1pLVUdZMGx0eDU3SkpiUCswcHZpcVVtMHNVVjhGVXg4V0JteG1rMmxpbExJ?=
 =?utf-8?B?WGxsWEV0clEybGpjVTVjTWJuS05kODY5cHhBR09mVEkwOG1Sd2hmTW4xUzhG?=
 =?utf-8?B?d2RBSDlSY2w3Tml2c2ZuSTl5RjVRT3pwNzBFRmNRNm1tcGVTazZtd05TV1ZD?=
 =?utf-8?B?eE9Ga01MN0dyWjZwZFRQdk1KNzhWcGNUOVFOcVNJQ0JjK1JnYzRjL0xxdFpB?=
 =?utf-8?B?eWI3Nk9TMEtJUVVDTVU5S3I0b3dObENJVGxsbHBieWZSV3U5VlA5MGhKdGg5?=
 =?utf-8?B?QXoyVTlQc2dUQ3BXSVZINm5QdWlaS3ZlTmdtdFpmcnRYb3lLZ25mRzRPU0hn?=
 =?utf-8?B?aUJ5T0hNbUxhYzRiNyt4ZEpQYUtFVXRqdlhhS0ZmYmxCUWNMaUUvYkk1VmVC?=
 =?utf-8?B?S012bkFObnBhbDhrY0hiZTF4czVxcUFQdXpGaDZ6VEg4SGd5cjdlY2psZ2Fv?=
 =?utf-8?B?T1BKZGxHcGpKODU1cXhJMkxTTFgrUmZEb2dyeUV6TGZYSStXSFk5VjVFMUQv?=
 =?utf-8?B?cVVHZmttOFpKUk95UVBDQkwzY1RTTmphaDg0cGxVVkVyNDlseUdOYkEwRFlM?=
 =?utf-8?B?M2huc29ZMUdZY090RkVNNThDVFNvaXBOOEZ4Ly9lZ2I5K2tlWUxjR2ZQeHhl?=
 =?utf-8?B?RzVnNEEzeHM5MUI2K04yUG94b2l3U2dlTmxKVXBmbVhxWFlKTjl1emxWdGd6?=
 =?utf-8?B?bm9HaFA2SHI1OXhEZldpcmhKN1F1cVJDWTlmZktsNU9CWGFwMXVxVDlsOG5v?=
 =?utf-8?B?ajFRa3pvSU5IaW01L2RWb1VwVHVNK0gvYmJHVCtHYy9WUVVuZkg0TDBUT3Fi?=
 =?utf-8?B?bEt4Z0p2djlqSko2aXVycnhrMUZUajR3ZUZGM1pRNnhjRzZaT0h4VWtMMWty?=
 =?utf-8?B?bnRGb285UVN1Sm1qVUNlNVFpWFVOc1p4VzR3VTIxQVNsRmhiTzA5OUpZYVFu?=
 =?utf-8?B?aG4vYzNSZGk4MTZoZDVNYmZwZkM4aUovVS9jajZzUUhkU0x4eTJUYzlRdmI5?=
 =?utf-8?B?ejMzQXBMRDNXYnRTTXdiVjJzZ3RabGE2MDcrTncwbDJZRy9IOU1WM1h5N0Vr?=
 =?utf-8?B?YzUwUjhDbjRPejF6dVp0NkhBaExnMXVxc1ZlbllmRnE5ckp3QXV0UitMdXVa?=
 =?utf-8?B?TjF0MStpbnVDREExcVByb0hTNzMzUGE1UTI0bUxGaXBuYUtpdzd4b1dPc0Iv?=
 =?utf-8?Q?bWNFsZ9e6yoQFJnUiWRgYHFD6?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd41735-3177-42a3-eb0a-08dcabb00dd9
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5672.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 07:13:01.6649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKnJL5WcyRUtDbZJ8D3jlMZUfzRCuSd+ZPhJeAnuMM2CTLTaYfYyGlsz0DCJJ+/+3wuj3Jfp8Nvl3wUc85Ncfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7273
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


在 2024/7/18 1:03, Christoph Hellwig 写道:
> copy_file_range only work inside the same file system anyway, so
> it is completely irrelevant here.
>
> What should work just fine is using sendfile (or splice if you like it
> complicated) to write TO the dma buf.  That just iterates over the page
> cache on the source file and calls ->write_iter from the page cache
> pages.  Of course that requires that you actually implement
> ->write_iter, but given that dmabufs support mmaping there I can't
> see why you should not be able to write to it.

This day, I test dma-buf read large file with sendfile. Here are two 
problem I find when read O_DIRECT open file.

1. sendfile/splice transfer data between read and write through a pipe.
     Even if the read process does not generate page cache, an 
equivalent amount of CPU copy is still required.
     This is particularly noticeable in the performance degradation when 
reading large files.

2. Each pipe max_bytes is 64K(in my phone and arch test), This means 
that for each IO, only 64K is read and then copied, resulting in poor IO 
performance.

Based on observations from testing, it takes an average of 7s to perform 
O_DIRECT read of a 3GB file. Trace show much runable and running and 
some I/O between this.

For buffer read large file into dma-buf by sendfile, cost 2.3s, is normal.

Maybe this is not a good way to let dma-buf support direct IO?


>
> Reading FROM the dma buf in that fashion should also work if you provide
> a ->read_iter wire up ->splice_read to copy_splice_read so that it
We current more care abount read file into dma-buf, not write. :)
> doesn't require any page cache.
