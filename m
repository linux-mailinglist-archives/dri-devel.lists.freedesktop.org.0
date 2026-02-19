Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CVtN+Msl2nmvQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 16:31:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECCA1602DD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 16:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698B710E705;
	Thu, 19 Feb 2026 15:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TxHpHVJl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013017.outbound.protection.outlook.com
 [40.93.201.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB01610E700;
 Thu, 19 Feb 2026 15:31:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZb0bANiJz5CUu4epniV52fD5aRw12nA6KNbF/wi3xiD/INEGXiVr/Z+ZeQXoGWphzsfotQUhTCU/RDanA/BEU7llPTvY3aO3RXrgAjfdeOLjEksRxMrPPoGBrOXDnD1slFn8Nvt6mDjEjhhttIKSfdTSu2mNqMrYJs3pHZ+xVYWm2i6ISt1mR3s+k+JHhlrYtlrfoFkt2f1/TBJn4xgLGQ/FD9isx0+Mw2UR6BgcQNV7eBGbb6qZIVR7orB9z48aCIcgftGRbGbVCRPAduEy3iiy11u53h4VTyPHox/+T2dEDbeAsCVA3LmXzyDWbR4Yi7atLaYpSX9gAq56c8wCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+8mdrUjnQ74N7OiAGUVYyToqxk25j8LkWl3Uuvnmbs=;
 b=pqHMHTv/Z7QhvIF9uqkHy9VuyfbIRpi7qgAAI3tAS5GtjG1P/0X6q4lptnHlqXwKDiuNRn1cVTReElLZg069RJZqzuI5KQZnJ367XQex0e6wt/pDbY4c2Axt1gi5P8f1BfmzX4n8uZj0LLu9um7ctNnaDbkiCXfQDeaoNTDvBEnvhDA2UwJyvhXczM/2TEmZW4tlveo5RHm8uNlLKOXB36DYvrmqqqJhhBI4k/cKFaBLxykydgVGU2zGDsz30DoxFnwGDYv8DV+xR6CRBwZW9k2gB8Yz5ivm1cuBV0vi8U1knvQp4oCOrN8Ai0z8qudX9gTF0O6hb1JHq8waY4uhDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+8mdrUjnQ74N7OiAGUVYyToqxk25j8LkWl3Uuvnmbs=;
 b=TxHpHVJl9uKhmWijp24Pb/Je0Hg5xk7g7XIVTsKJ/e2BcFHpj/qlrmynnCRYWBmaZo0tnewma70BecLI9BZ5CHgBzWRLLZedG19gRxbJY74twLRAoUXaPVhlZc57bYFILcQpt8kgRIV6LLGqAs0eZveQWKwjLV8PuPf35j7ABIyzY//03uDiEWnL0+X9n28JagaqZKGSy66bq2Rd4JPboP9bJC4d16BENhb78XfKew9VnJr/nfLpNu+R0GWYz106fR/mQo/iL2IaDWTZNammBdC2Prp7jSxaba/nyuOMFgN+latagOyesRe7+r3ldxgyOy8U45iVPL7AhADo0G4kMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SJ0PR12MB6989.namprd12.prod.outlook.com (2603:10b6:a03:448::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 15:31:34 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 15:31:34 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
 Arun Pravin <arunpravin.paneerselvam@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Subject: Re: [PATCH v10 6/8] rust: gpu: Add GPU buddy allocator bindings
In-Reply-To: <DGIYV00H7ZJJ.36FJ8MINCQ004@kernel.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-7-joelagnelf@nvidia.com>
 <DGIYV00H7ZJJ.36FJ8MINCQ004@kernel.org>
Message-ID: <046ad0dd6163374adbfa914fe62336b3@nvidia.com>
Date: Thu, 19 Feb 2026 10:31:33 -0500
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: IA4P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::8) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SJ0PR12MB6989:EE_
X-MS-Office365-Filtering-Correlation-Id: 35a34df5-edcf-4897-2f16-08de6fcbf6a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VERuQUNEcHFJRGFVdFlvWVlKcWl5b2V6V2ZxbGpjZU5VcC9UdzIxaGxFZjRj?=
 =?utf-8?B?ZjNxeEloczZyZVpSYW9mWjRSNndMcmlkU2d0R0RVMVNxWkdDaVlVMEhHYnQ0?=
 =?utf-8?B?RWVSQWMrZnUzOHlzWjBpQ0RjK3ZXTU5TTDQwUGVqUkE2RjZDQXFYK2dpWUJN?=
 =?utf-8?B?TVAwK1BjNWk0amozZ1FXVC9Hd1pnSTVKVmRPcUZ1azdycm56ODNzQ2toQysy?=
 =?utf-8?B?YjRlaTR3MFZiMExEQ2NEdnRVUHM0cFp5eFkxbkpKWmJ4TE03TktGYjdvL3Jt?=
 =?utf-8?B?WlZXc2RsNmtHTGppMG85QTJNd2M2enZad2xhaFpRcFphR1hldXlEWDEyaDFL?=
 =?utf-8?B?MkFFbXJscitES2JqVE0xcGk2d3NRWml5YUZjZ1V6K0o0cTJhY2tXZmJSdG5l?=
 =?utf-8?B?WVpVL09xQlVaOUUvNFVpdlV5dW8zcVFYU3UzakVNTUpvYXIyNk5JS0lpU2Ru?=
 =?utf-8?B?VmFyVEVwaXN3UnVsS0xYdWtYUTg4UDNwT01WNnpwNk1FekhyS0hQY2dCMllY?=
 =?utf-8?B?VGJGYlcxTW52YjB5cGE5bHBuYlQ0aDI0MDBvTUw5cy9MVk1hSzNVSVRYd3pM?=
 =?utf-8?B?UEEvblZkbkU4U3JsWEtSMzVkVnYvUjNRaUJpbHhwZFpqcTBvUUlpQWVsaXBy?=
 =?utf-8?B?N0l4VDY0UXIwUEdGQ0E3RDNRTXIxOFdwQlpsOW1MeW1yT2V0ZVpiblJCUWEv?=
 =?utf-8?B?UGlQb25yajdESTBuME5hQjYvY1JDS1BkVFgxMWtwMHNSU0R3QXMxUEhXNmVH?=
 =?utf-8?B?NWRQN1VWY1dtZE5TbzhmWmtvbDQvVlJKS21TMi9pV2hINndQcWZrU2M4SDBP?=
 =?utf-8?B?T1dLMEdTZFlEUFdLTDRITlZSWVhWT1hGTDdnTFU3a2VBakpFbk1kd3RRRklK?=
 =?utf-8?B?SHZwcXpBMXdKeldjQmVLWUtPai9VZ2lXcjVjMWw3b3JrbHpYdmVXakJwcCtz?=
 =?utf-8?B?OGxiWWhiMHlYYlB3UXRSMEJlT1NBQnp2ZUdyVDIyWlJoYUM4dlg0dU84TWs4?=
 =?utf-8?B?TS9rVVBxTlhybTZ4NUxaSmQyY05JRVBncURycG1RQXdDaUlNSWt2MGdrUFda?=
 =?utf-8?B?OUh6NndjN3Qxd2tZLzJtSGhDYmx4ZGNxRi9PZGNySlVqbUpFc2EzNUI0M0pZ?=
 =?utf-8?B?ZlEzc1hIZDhUVnpIQmc2SjVLYkNySjhDZ2xaTnIyRmE4VFltL3ZCNUJ0TVI1?=
 =?utf-8?B?WDY3a0xxelJsNEVER1NxSEF4dHNDWk5ieGxZV0s0cUhmcmp6UTgvOVNzQU5s?=
 =?utf-8?B?SG41dEl3aUJLZzRDaHNEYmZiRUNSSDFqTzRRcG12UWJzeXRRUk9iemc0cHJ4?=
 =?utf-8?B?T2kzSWE4Tml4Q2ZSNXZERlFkeW5iaGY5T2VYN09WWkxJZUtNSnU5eDZGVFNY?=
 =?utf-8?B?YytiMlhxam9xanBLdi8vRTMyM0s3QXJ5V1hjZFNlREk4NW9SK1o1TmM2VjFt?=
 =?utf-8?B?SGNRUzE4L3huSS9zVjRISlVGMXVYWDg1a2ZoQUZnQU1NMExkL1pGdzQxUnVF?=
 =?utf-8?B?NEdHSklrK3ZwU3E0Z2dYREllNDVkcXZEYmhRWWRwS3BSUEt3eTRXVGs2ZjRq?=
 =?utf-8?B?UHplNDJWWTdseHhCKzFrUDBVODcrek1WQzloWTdQVU1RT2dWNWFXKzlkdlkz?=
 =?utf-8?B?cmZkMnBsYjJDY1VBazJldEh6NVp0QVN2S1dxRmJORzZYZkVCVHY5U2VtZFh5?=
 =?utf-8?B?anh4clhTLzBQd2FCbVpMWjFVTnloNk9kYnNwZWhFeDl2S3I5L3UwRGo3b05a?=
 =?utf-8?B?WVZWdXE2dWZNemd5eEV3MWhOYjhnL3NkNHpnU0RlRGcvWEZqUlpGYUhhSWZC?=
 =?utf-8?B?VUN5WHZ5NzhIV3VZai9yWC92R1Y3REdZY1NhSWhrTUk4VjJkRW1KTGMrdW1m?=
 =?utf-8?B?RXBaWDF1dThQOVR3cGYrQWx2cmt4SmFHWUZ1a1diNmVxcUlWa1BnZlJadzd0?=
 =?utf-8?B?R3p5WGhOZXZ6YW1uRG9OT2RVcGhDQmV5Ykl3aGFGYUVEWWNIMjY2WjJrdzl0?=
 =?utf-8?B?RXBBQzNOenFVSzl6cVIyL1R1bjFBcXh6bXFFZUc2dmhLK0h5V1dmTHhkcHdj?=
 =?utf-8?B?Tk1WdmtyY2ZCZGtkUkhrTTRuVEZNMndWNWFUVjZqRHAzMnZGV1kxdjc0bVQw?=
 =?utf-8?Q?hvoE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUJIcFBnaFNDM2pCdU5Pd0ZaR0MxZWcrVzdRZndQMzMxRVM2WndLNHpnNERw?=
 =?utf-8?B?RnVCU1NGU04wamZKNFl3cHdVNGxLM1had01lY1JDTWZSSDZiSmNKZ1NSK0oz?=
 =?utf-8?B?QWFPWThRS1M0NXFva21qZTZuc0J2a2VmMG02UU9FUklDSXdkSThGVTQ4VDJN?=
 =?utf-8?B?V3VkQnZnU201cEY5TVJmV1lUUFlGZ1gzdEwreVBrR0E1b3djSmNZRWc1dTVi?=
 =?utf-8?B?cTJRdHU0RUNZK0s2WG1WZDEvcmhiWld3a0dta3Y2QWd2RWhmZDk2T0tPb0VE?=
 =?utf-8?B?UytLclNKSXNqVDI3NGdnNDRPUHhlNGtiWDhTbzMvTjN1enlSUHpBcFB4VlpU?=
 =?utf-8?B?blpyME50akVEQnh3ZHl4NTFXaXM2VGJhcWZFWVdxaDR1TGs1M1NzajZHTm9q?=
 =?utf-8?B?NnNmcFNVb1c4cFAweG5xUkowWWZQTUhMTk4zZ0p5N0ljdll5K1ZJb0kxaUND?=
 =?utf-8?B?VWdmeUJsZ1NjbmJHU3ZIQ3NPZ1ZSMkUzWXN2Y1N2QVdyRWVmTzgwY2F3OXIv?=
 =?utf-8?B?ZTlKMy9COC9jS2twd0sxd0szZWVpSjFGZFp2L3ZiNlBWdUJhbGVrVEI1VDFB?=
 =?utf-8?B?Q0pEOWVKUjF6SUZnM25ZQ1c1VXRmZkhXZzJBTUtWK2hOcSs5Y2ptNzNFSTRG?=
 =?utf-8?B?dDFVTnBiRHJsRUY2ZFdlaUkrRlZtbjZydEFaYVVRSHZGaklhTWthWHg1TG1V?=
 =?utf-8?B?c0VnZUdROElyVHNWWHcwdFA2Ri9YSjFuWSt2WU5QaGYrWXNDaHYzdzVldyta?=
 =?utf-8?B?VHkvd1EyVVI0aUV6RUk3ZnpIUkZJMFBUV2ZtN210VVUrZVcyczRaYi9XL3c4?=
 =?utf-8?B?Sm8ySnBKbjl4RXEwaXdjby9KMnNBNHI3aHB3ZFVNQVF1Q2J6ZGhWVzFkc0Y5?=
 =?utf-8?B?TlN4bnZmWnhkakc4dnhmZmhwZXh6T3ZvN21oeDZmTC9FV1p5RFRHZFZnWmZF?=
 =?utf-8?B?blFDajFDbW1FMXo3KzkxdVo3ZUMzbXltNk5Zb0Y3bWkzNWRQWS9CMmxycVVw?=
 =?utf-8?B?UHRwa2FLc2xRRnpDbTVSUTc1cUpKbWVyc2x5elRXVE5qbEtYYkUvZ2swUXVr?=
 =?utf-8?B?RlNHK0xDQkdYdHRMV1ZzMk80dTJQSE5RY21SeHpIeG5HVnh5cFhMYW9HRUxX?=
 =?utf-8?B?bFJzZE44Syt0YWRQbVFCR1BWY1BqYVZLTnd2Y2F3bE1oMzhMRXVuZk9vZkk4?=
 =?utf-8?B?d2NTZkZ5aDVRaWErTCtYUkk4b2RFOVQ4YTl0VVFic1JYd3hudmRES01CNUJI?=
 =?utf-8?B?L0VMdi9DVFlaR09vS3BVNVI3WTVGdkM1bjhmcENLVjQzRkYzWk9iOXdaZGxS?=
 =?utf-8?B?UE9oZ0hqZkIxQ1BXQUdoK2d4WTRpclJiZG9wbk55UExYd3hhR0d1WWRuMitk?=
 =?utf-8?B?RUtORVJ4MnYrbnkxb2JCYmxTcDAzT3RiaGUxTjYybFNQV0FFblhheGQrSE50?=
 =?utf-8?B?b3U5b0J5ZkRJd013ck1zaDhKMVRmVXo5ZVE3YUpZZFJsa0ZUK1ZGcmw0V0ZT?=
 =?utf-8?B?d1dVZnhud3ZHU2lVeWx4SDJGY2VBTGxPaEdjNUdVM2J1bVlOTlVqamxLTFR4?=
 =?utf-8?B?RWxieDhJNXVDb2szK2QybStMVTZWNnJCOGx2Rk5nektMY21hcHJFZnVBMHRP?=
 =?utf-8?B?cFN4d3pQOTFVa0ovRW5kUWoySVBDTS8xYTBBRE8rVUVGSWZUSU9ib2l1blZD?=
 =?utf-8?B?WjZIMlVxV0tRK1ViRDB6d3FLRm9VbWNDZTFvak84NWFsTXhsQnp1WUkzT004?=
 =?utf-8?B?LzRhNXdXK2hBY1Yvc1Y4NEo2T01KVTB1Q3pxanJVMWlrU09RNTRmM3BHR2tk?=
 =?utf-8?B?YmljSEhZOS9IYnlQczI2QWhNeXdQaG9wUFNnMTFmSUczRTZhVURHdlNTSXpI?=
 =?utf-8?B?RTc2MVZsQzRXSmcxem1EQlRHOHZYU0pQM2t2dzBLZkVKQjBxR2poS3Vsbmpk?=
 =?utf-8?B?a0hodE5KNHZmVlI3alBPOVoyUStkWUVjM3hicXY3N0IrUzcySEZWVE9TbXgv?=
 =?utf-8?B?K3JXbUp3ZVZQR2VSMDMyQm1lRDR0cWk0UEV3Y1FMSWc1UnBJb2hGKzNyeTdu?=
 =?utf-8?B?WGtoMnk2K28xR0NjVXBZanBlanhnbk5FbzJ1WVpicU50azA3SlRWdExiYkY0?=
 =?utf-8?B?L2F6WlREVWdOOWpzcFlIbnM1SzVhenVoMmFwMTVyeEFZMDhCT3ZiSDJyd1dl?=
 =?utf-8?B?S1Mwd3piUzF4U2xtZ25sdUNmK3d1NUhJYlluMXVwUzlTS285Y1F3VVJ1VE0w?=
 =?utf-8?B?c3VWaXRZOTZtOWZFR1FJZDdMcmloSHlRQ3N2ZkxFbC9uanJvT1MraXdJSkRp?=
 =?utf-8?B?Z2VKS2N2dUZncjBsYnM3UHlXTWhXalJ3cWxXVHRTeWZkNkhvMmlwZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a34df5-edcf-4897-2f16-08de6fcbf6a8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 15:31:34.1937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GMM/J2pSDss49Ftp7Epun5nkz1xoxbyJEf1Um0+uufgsZVC8Y1U4C3fDKXfESZ1xFkNqfu7lx4E5qcmRABdI5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6989
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 8ECCA1602DD
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 02:18:31PM +0100, Danilo Krummrich wrote:
> The patch should also update the MAINTAINERS file accordingly.

Will add the MAINTAINERS update for GPU buddy bindings.

Thanks,
Joel
