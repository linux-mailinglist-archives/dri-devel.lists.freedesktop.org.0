Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED79C83D6C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 08:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E08910E36A;
	Tue, 25 Nov 2025 07:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IYrtnGEV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011016.outbound.protection.outlook.com [52.101.52.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECE510E35F;
 Tue, 25 Nov 2025 07:59:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SdzkZ/+HWgnZgIOKsMhBMfdbvzpCMBaGC1i/rGjIHdEk7Y4wcrfKA/yXHuBf3SstfVHhp63lHNPYQXIpzT5Ms7JW2rRGoRmBH1448MbZcW5F6O0Rnujbbrb5+sR1z9NV0CY64CSH4OG+24q7YkPiJMrP3TgS+ppw+vwvsIauOyxrZHt560KndPSvcXPLntvtpEOr2mNh1qjildLRGgXBnxIeGplJeVKYxdQxJgj5nS/DnGgtoAlqi+FeF1oA3hnM+ooNOOavxp2qumEcz1xA1+sB10ebNP2hTZGx123fKRHo6f4R1WeW3pQP+B+X1j6QIcz1gPBq/wMmLu8ABwkzSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmIT4UTM06qOCcAOZTXyKf3kOYqI7fQQNHo6UEFAZEY=;
 b=aqX8cErKBxGnaju40Q+QDua4frWiqBIbK+3DADfaQkEJ8DZ3BSrGkZWs6KERn2812wfSYIkA3/7g3cC7qYFeC8MHSTS/Y6TjyBW3lgpvm64zjPmnp05wmzSXOjc7mx6o1gt0An7DvMXR/rS6mlqpTIX5CKFvo5v3/37mZI+VrhWS3OcFaf7tt9+kjLgNNGiVl5aAn1AZDZkYJj5wfMOgJeYbWqsVYXrW4L3tMPUP/ch3HqngSnbAFR67NeYqv/jHkKMyG5NYITZx1tNpHBNJL0GZ2/aPWgwierd9fVtHRUz3FC2ojdXHNzQMu79RABPvKC0z42COfRmNWzYgeSmY9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmIT4UTM06qOCcAOZTXyKf3kOYqI7fQQNHo6UEFAZEY=;
 b=IYrtnGEVqB/29LCsU/aTNa8G/F1iR9SIXL/cxvD60ckiJazrJj7K5MnmKwdbYp67m/Y/FQvHENVIQGiFYDvGbB216AxrOMJ9Whhw+D5mDLaGfgzqfKbvSK6ubQDxoYoHfFD28zuZFQtFEf48wZpiAX3OuZGxEDrJr2LEXZM7ZR1Yl67AOenc/C13TrHnoCdLC6aMH/OqPnb9CFaV+dlBG+y9075L9iCumsqB4u07w3TKWsvOc9BPrld7a9dms0uFIcS/CBg0hkxltmDKuBHE6yha8OFJelBlNhj+4S6x0jKimFW2dz77Hhp1kzyzFd19b0DibYTjZZgx7hy2w+jGag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN6PR12MB8543.namprd12.prod.outlook.com (2603:10b6:208:47b::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.16; Tue, 25 Nov 2025 07:59:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 07:59:31 +0000
Message-ID: <dfc50417-66ce-44ce-b607-917d678c5631@nvidia.com>
Date: Mon, 24 Nov 2025 23:59:26 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: Move DRM buddy allocator one level up
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@gmail.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20251124234432.1988476-1-joelagnelf@nvidia.com>
 <f73e4536-ec89-4625-96d4-6fa42018e4e4@amd.com>
 <CAPM=9twe3xcVBgrNCT+1_pGECPL-ry_aA2dxBwbKVeai4+S7AQ@mail.gmail.com>
 <24d4f02b-8ecd-4512-a1f0-ba41684ede1d@amd.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <24d4f02b-8ecd-4512-a1f0-ba41684ede1d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:254::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN6PR12MB8543:EE_
X-MS-Office365-Filtering-Correlation-Id: e29cc670-a10a-4e02-4e05-08de2bf890cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUlKSFU4NjZ1eFZ5YWM0OXFYS2ZKMzZacnNIazZxemtjMXNnSjRNOXBXMXdw?=
 =?utf-8?B?U3F6OUxabTByaWdtdUkyOFdzS2xrOEVTWTNTaVpRTEtIR0J1VFRPT2tuTXAz?=
 =?utf-8?B?SVVUMExYTkhFd1lWd1hOQVZHMU1GNFpBRnpxNTJHQ3FyQVdSNVVhOXlhWDB5?=
 =?utf-8?B?Y254ZjI3azFMY3RvVmR2U1I0UU1VUk1iSzk1U0Q0Q0FCdGpGVTR5UWZjMzMy?=
 =?utf-8?B?YlZ2RkI0Z0ZoSVR1Mk9ieFBhZktib0tTcEVGMGhIRWg5RzJ0cDJxQ0VmUG0r?=
 =?utf-8?B?VXhlSm5lOFNrdE9JblN5WmhZYlhzalRZaHp2R2xENHZlR1dqRjlFZWJkOFhw?=
 =?utf-8?B?MUtqT1FEQkkxZ3oyN2FKTTFSL0ZjNk9PMFJMcUp0eVUvMTZUOUdmMVhDNjBZ?=
 =?utf-8?B?OGI2STBoRkJkcEpYVVJpa2JxaHNaNXprUytldmlmRFRvM3hyc3ZDN1NNUEVo?=
 =?utf-8?B?R0pzMllTU3RkTElNMGxtMXNIQy9XSTZ1cjBXdGR5L1B4eVdVSVBlTW1EL0pk?=
 =?utf-8?B?NjQwZ0pmQ0NBSm1VenhoS3duS1dNZzN4WDdQLzV4aHg4Z0hJUkcvOFlQeFAr?=
 =?utf-8?B?UFNaeGtuaDljQmJNTFNsMmtaRUJtMkpSRWF2ejRDR2U3blVnM09uTVhWOGR6?=
 =?utf-8?B?d2RqSnZBNS9lL09FdXZmSWJmaVJBZytFZ05qNU1JY291cGFZWGlORUJGRHkw?=
 =?utf-8?B?ZmVhbHQ0cThEUUtMelRLemVQTmxFNzhLQnhCS3lVYURXcjRMUVV1T1ZXWVhp?=
 =?utf-8?B?elNrYmQvQkF6RVVjQjdWQkhwSURqbVU4Q0ZtUVZNZmFoUHR2SHNoaHV6OGhw?=
 =?utf-8?B?TmpxODQweDk5R2ZVOVlMaUh3MzdnRnh5MzdwcnR5UTZseW5Ta1ZJd2EyRkJv?=
 =?utf-8?B?MS92K29jckNOeHEybmI5SGJ6aXZ1eWRMNm52dzJaOS8wZm9yVGsyRnJTOUNM?=
 =?utf-8?B?N2R5R1RybnMvQWIreDExUDJSL1VkQ1pLUEJoSlM1WXNyeTdWQmk1cGJ2TFBZ?=
 =?utf-8?B?ZkhvR3lPVEJvekxVMklxNlB4RXkxcEJyNXhJWXdmTndxSGlDeU12NmV4UDFQ?=
 =?utf-8?B?eFQrYUNLbzhCVytIWHp1Ly84TUtGOE1DYjlhQnh0ZHlLWmlpd1ViT2FTMDBQ?=
 =?utf-8?B?dkNwU0VOazAva3R0RnlQM1VLZ0tJM2ttK1pqOFZKc21VcWJKS2lnUVYwWTcr?=
 =?utf-8?B?TFBIQVJLOHV3cjR4M2hXWXFlWk1UcW51ZVp4UFVwckdqcUpSVng4b0NoQXMw?=
 =?utf-8?B?R0p3aWJMN1kyMlo1eTN4bUQ2ZE1KeXlVMEZBaGVxSThOMGgyUTZ6bElFam9n?=
 =?utf-8?B?MlIvTXBXVkQ2VjV5TDk5QjRMYXl4RFpHaWQvNUNFaTJzVjlqR2tac1BnU3BY?=
 =?utf-8?B?SGluUC9GUW5YOXZtTyszUkVTY1d2eE9ES0FFV2x4OWd5MzhscGFGbWFWbXg4?=
 =?utf-8?B?TVZIUnpvMWc0K1BsN2RSU2dkTkZGaC9odjNJemUvYVI0dTNzbWs2YVNiQWh5?=
 =?utf-8?B?ZTllUk1zZG1jeTJkVWJjUENNWmNXeWJxV1ozS2dOc2NOUmQ2QzlTZFNMV0Yw?=
 =?utf-8?B?bks2TTB1N01xZmpFdFlyN2liajllWHJBQlRQUXFacWlPdG9WOG1ZMEJ4alRN?=
 =?utf-8?B?ZTk4c0ZzUm43NUJnNGRDRitzSnNpKzByT3NjQi9EVmlQaG5xZnR5YndWaXVB?=
 =?utf-8?B?WjIxcUcxSFZlSE5SSHcwMFJ3OStvODZjWU9NK0RXNTlNdC9VQUFmcE5oTXpz?=
 =?utf-8?B?UWpidzgrTzV3MElkTEh2eWlOYlZiQVdRUmRobUhWR3VCaENPSnZNdXcrYUZZ?=
 =?utf-8?B?WmZ0TjFNZ3V5N3NVY0x4bThwWmhLZzVsaXA4MmFGWEQ5M21JVjBRWkVOQXc1?=
 =?utf-8?B?TllpT3MvQ2RvelNraGFmU0tnYm93SnVqNmVlM0VjTUl3dEJXcjI5UU1DZjgw?=
 =?utf-8?Q?bic4nohr4SACvjFuVN8MlJgQrwERuPNk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(7416014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2hGZnJVblEwWEU1M3pDVWFzRVVGQW5sY1hJOW9FVFcrVS9kUTlXMHgxVzk1?=
 =?utf-8?B?UVBQTTVCalMzL2lIS05mS2VYUWZaT3NESDduWnNkeXEyUUtYMjRsSkhHYURE?=
 =?utf-8?B?TWYvazNySkhvVWV1bG4xRXNKQnI5S0kxeE1PZFZQZXBMemg1VGJTSy9pbmZ4?=
 =?utf-8?B?Uk5JeUNrNGlueE56WXFnSHBTUFh0Sit4Uk82N3doRTNReW11NENPRDhXajdu?=
 =?utf-8?B?MW9nbjg1V1ZjYmNjYm8ycUVGR2JnclNrcEhkbUtFT3JoNjhsb29HR05paWhx?=
 =?utf-8?B?cnh4WGJSNGhSYVozbmltT3FsQjVJb3JqUkNqNm5JWG8ySkg0aUROWmpQelE3?=
 =?utf-8?B?SjJldHBMVWtUd1hTNUJtc0svbUpVSnZPZWQwc1hILzVMemt3TnV3UGZrK0NN?=
 =?utf-8?B?cmt1UHY0UVZyM0JpUktRVXlYbGs5bEJlQUNKdXRXWUtLREVBb25kOUE0N25I?=
 =?utf-8?B?T1BEQTlPdTUrWEZGZ1pnZ092S2ZLNDFDc05RUGNhbDJkVUp2K2dXWkx4UUVE?=
 =?utf-8?B?cjJCeHB2dzJUb3N0UEVsK3krTmZQN2RTdTZDM3ZEUUlRNXJiQTlyZkphSGU1?=
 =?utf-8?B?K3NYOStMN0JiQjNYeGc0M1lHUkw2U3lyQkorVUJkWDZrd1cydGZ5d21uNWF6?=
 =?utf-8?B?VTVKRlhTV001Vmk1Slhmck5NaThiTm1pZ1RGbVJrK21JVmZtUk1WUU00aTY0?=
 =?utf-8?B?UGlRdldObmc0VkdLZ1pmNEk0dktoMWdFelFJa3ZZdkFCSlEvbk43ZTNqTzZo?=
 =?utf-8?B?RzZxUUpBNlE2cVdDYUEzbUFHeUNKYXJrYklFVUpwSm40bHVRS2JjY3c3UWU4?=
 =?utf-8?B?OEo2Q0szTWJIVGg1bzNyaTJlSEx6b0tJYkJYNmdjc3pxMkFIcHZiUE5scVE0?=
 =?utf-8?B?WUx1YlRHR3BPQkVtcGZteTBiN0VNWDllbWg0N05IcHdzWHlhdS94K0diOGc1?=
 =?utf-8?B?MDNyREU1R3R0NFlETnVXNS9DV1RPeTNnSi9IaktGdm54cDZDNGZFeWQrT204?=
 =?utf-8?B?Rm9ZRy9uZ0dyN1JVVjlyNks2dVl5THhtSVdTQzBuMGFFRkRYUHprSDVlSnJ5?=
 =?utf-8?B?Q01GZ3RnbkYwT2FsZ3pCcGVCWjFMVDVpZ3BZcktldFBCbG9tV0xVODMyYldC?=
 =?utf-8?B?ejdDUDlBS016V3dHRkRnWDhkL0Z6NERzN1N4UGlOZllrclc2SU4zMC9FZ0hH?=
 =?utf-8?B?TWFlNlpna0R1Z3R1QWNpUW5TQVFxa2haUlBGUlA1dEFWRkh5OXpRSkF2bzJU?=
 =?utf-8?B?M3Jaei9RVnAzRmI5S0VjRkhXV1FxbkJwZEZWQVUvZGNkUFNuUEcrVmR0clZQ?=
 =?utf-8?B?S0pjYUJDbnB1TnlVdHJTSWxhTWxOcFl4dG81VG0wc1lJcWxzUE5QL3hVTHA4?=
 =?utf-8?B?QjdMZlFza3M1YjR3Z1BQanZCUmxEMUNmWExjSklmOWg2Zyt0dU5EZmd4akZh?=
 =?utf-8?B?ZWxWV2F0YkRCdiszb0Z3eEV2ZGt2VlNrR0FrakF2SWMvY1gvZWQySjNORy90?=
 =?utf-8?B?SEdtYmV4WWo0QjB6TCt6c3NFWS9JUERmMS9NUDhpOW1hbHgxTmZGWm4xZXdU?=
 =?utf-8?B?Y0w0TmdmQ2h4aXlnTHYzR0pmeGdXeHl4dUJGS05PYWExbVptalh0NisyMFBW?=
 =?utf-8?B?cmFhejVFcEtCYkpLR2c4bFRpSm16ZTBRYTV1cks4a215VUlNYVl1RkpXeG1K?=
 =?utf-8?B?aFhPaW5TSVRxQWg2QlAxYy9ReWsyaW93SmxPYlpsUERXOVdJYmdocEJkczRW?=
 =?utf-8?B?UGx6NUZxUkVFc1d0WUVPU2NVY1ppdjhWdGxwVEN4bitzYXpZa0J3d1FzcG43?=
 =?utf-8?B?aVhVSWNjSUNyRnlIelZpR2FFQlFPUjlUZmg1VUtRWFlyRDhyVDlUUlQ4Q00z?=
 =?utf-8?B?bkdPMEIvc2J0SWNFQXlvVzdwSVFQSXRINjhMc1JXa3dVTndGNG1KaTRUa3hs?=
 =?utf-8?B?VGJrRlo1SkFoRjJHbExuazNCd2FPSEx1VDFpRGU4UHMxWUh5aFBzcGllTU5B?=
 =?utf-8?B?YnVFTUVraFNHZzhBaWVFdDUzR01qTFFRSGh6dHdXQ3RVQnFZRWxOdmVuc1Bs?=
 =?utf-8?B?ZVNTNGhQTWc5UGJGdXhZZ1EvVStkMFdnV2dheHA2UklnZzZ6VnFoMmpxdXVs?=
 =?utf-8?B?dlZKd1czK1hjYlJlSS8rRENYQ2loZitNcmUwdURXcHUwUGxXazVJZWhsUUh3?=
 =?utf-8?B?eVE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e29cc670-a10a-4e02-4e05-08de2bf890cc
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 07:59:31.5837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqKFEGGfeR4Qrl6TKrbtenr95cUcl1mrd/gYDL6uX73FB00ZQ2RunvmngEK7qhTdB3uURSzIN5erZIn8qz8sww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8543
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

On 11/24/25 11:54 PM, Christian König wrote:
> On 11/25/25 08:49, Dave Airlie wrote:
>> On Tue, 25 Nov 2025 at 17:45, Christian König <christian.koenig@amd.com> wrote:
...
> My question is why exactly is nova separated into nova-core and nova-drm? That doesn't seem to be necessary in the first place.
> 
The idea is that nova-core allows building up a separate software stack for
VFIO, without pulling in any DRM-specific code that a hypervisor (for example)
wouldn't need. That makes for a smaller, more security-auditable set of code
for that case.

thanks,
-- 
John Hubbard

