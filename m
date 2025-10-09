Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C267BC6FFB
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 02:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E5810E168;
	Thu,  9 Oct 2025 00:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lCfxh7MF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013042.outbound.protection.outlook.com
 [40.107.201.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE98010E8FB;
 Thu,  9 Oct 2025 00:24:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WG+Zmlciz2rfkzMAwx81VG52oFZOhaSC65CFHR17kQst9U9fad1PJ8zlqbQkpM2qFYAT0GwyOrVoNr41Ub1pkOfWBDiVGaUKP9bQ42ZntkmaAyWH0N5ZTVkcTxHDPokHarcnRuFCwzXykJ5L7oazZtPsIcQ0lde2I2l+BmyzUcwrUDWFP7agfaJWRP9gkmxcPbRCIHMXRiVk8fvSXLbTcW6XYBRPmtN1rPEu79RQnakjwJGdug8zr2J+U3ief6Jfv2WHBiRVARvrMZ6G5cEWkVI4XjZ/ZTD83IZPgoK7CEZlgQ7NOiOodCosAUltTTUaTB6SflwFi82BWRM+75NkCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsTJHTmC3nClNyvE/9qD4ZYPRRkjw0VimTiEX4HtXaA=;
 b=rbFpuIg76Ahy1D8LoQYMmVYh/GCnGnR5kdidGZVgs+Z6542zt+EI0IDd1I3mYNoYuO1y3becJGxuQXkKiscr+N3KzTojKBmhHjSdkUM79PiMbShTf3FS3kqJsq98RB85pJreMLgPkWFmlpPxX4ZTvPNYuOVGdTk0CBFs7+LLa0F/4XgCNIV3ra3SqSXXOZE3PIxgYuhEnsieQsvPbIXcoHM16Bb1ssrnKLYcRaJqaa5+sQsQmP7Nd3CZUwvZe3vsjN9c4MQ6gynXuptyzCipA9lecAQbYdXNpxO6n/v9GsUDFSUptBIoBKq/M/4wEU3zF0mvZf/hRjE2M0Ut1rDfiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsTJHTmC3nClNyvE/9qD4ZYPRRkjw0VimTiEX4HtXaA=;
 b=lCfxh7MF+tMLmPY3V7qfhVr4oglHipPfJJzhmpaasGRZjD0/BGehfmPr+5l6ossoA2N42oYp0B9nGhm7OswJU0T8/6W4sKbRe3H5+4aM90e6LhAUqXmyT54c0XG8E1Y2mnx6sYNuJSFyaDJ2lNvxUxEkIbffB1uF7VZG6mFXMR939tUamZP1r0cxXs/9m2m4MhF5HgoCvNd3ft6Hd6em5ko1G/KpXsi5AKXur5NZyiWQGjFACX2EttqfWl5WczdAuE/wVL0RU3M02q6MfrtSczIOsXf6HaPbXcPq3sFD6pt03MYNxxNe9dZ9KR2jeuKLEap8bZHvXT4wAk8jsybNOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH1PPF6D0742E7B.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::613) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Thu, 9 Oct
 2025 00:24:23 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9182.017; Thu, 9 Oct 2025
 00:24:23 +0000
Message-ID: <22e8c33c-b444-4f58-b7ec-6374475e05be@nvidia.com>
Date: Wed, 8 Oct 2025 20:24:20 -0400
User-Agent: Mozilla Thunderbird
From: Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
References: <695CCDCE-A205-4557-AA15-6F102B8CCF0C@nvidia.com>
 <DDCV84IJHUML.126CB1CT0XMX5@kernel.org>
Content-Language: en-US
In-Reply-To: <DDCV84IJHUML.126CB1CT0XMX5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::29) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH1PPF6D0742E7B:EE_
X-MS-Office365-Filtering-Correlation-Id: 84f14172-78d3-47bb-d37c-08de06ca3286
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGJ2M1drdkZnY1UyWEJHZXlmNlgzeFhaalhRQjgyVXJkUFZBb3NDSC9IVytW?=
 =?utf-8?B?R3FUZVFEbnBNakh3TDRSSVVrZ1hBcXpza0F5TXF5cUNuUmE1T1JRYnVqM0NH?=
 =?utf-8?B?MmZSTDFUeVRlc0xseHV3UHZwaXFUenVPVlBXK3hGSnVGdHZDcDRlZVByTnIr?=
 =?utf-8?B?V2hWNlc3NnQxbXNtQ0VrcS9pUlFiQkQrOFpRWXJEaE8vZTRnbzVBUEJmYWkw?=
 =?utf-8?B?S3ZRRkViMHdRUDMvcHd4MTlsMzZPT2pndkFwOUJLb2RkeGlVeVJKSjBsRzNt?=
 =?utf-8?B?eHlNMmZnb04vWVc2T2d1ZUNIYTY3L1d6Z3R2enR1N2FJaXFrYS9FSDJIa2FV?=
 =?utf-8?B?QStMR0FOUzI1L1JnSURIYTNtditxMnhSZ3VjQWZtc1BLNkJVOGNwWXNFaTZq?=
 =?utf-8?B?emkwWFBuNmRQWEIxTzhzRnRxZHJ4QUdRb1Ixa3BBdUdIV3RvVU51WG9iT1Vr?=
 =?utf-8?B?SFd2UEtlUGt4endSMGRNZ1MyL3hYVW8xVFZWbGdhWisxMDNaZ2U5Z1g2Z3pl?=
 =?utf-8?B?amhvUnhaYlczNlZOUEVhNVhrT3d5alFtSkp1Z1lMMjM0RXQ4N3RUUVIwUFk1?=
 =?utf-8?B?SktGdlJwa1g5c05EVHZXVDU2SCs4K0tTSlNVNGFnZGxsQVN2T1NyWWdMQmY4?=
 =?utf-8?B?VndibEloREtXMEh0R3FxUXlOT3c1YU5ZY1Q0N3FoMDUyOFVWRFFpZFhVRjlh?=
 =?utf-8?B?L1ZaWjdSa0tJQXhHMFZyVlZmQU5lQ2xBNUV5ZU5ZRDlCOVZtR3BiUnJNdDdm?=
 =?utf-8?B?aWZsS1djOEpDeWd6NHlYdmdOTmhoOVI1WlZkUTNaY091eWlDN2ttdWwrWDNG?=
 =?utf-8?B?a05iMFlUZ1FDVEE1UEpVWnZQQ3RiZk8yWEM0MDJiNkR4K2JKUDgybm5wYTU4?=
 =?utf-8?B?WmcwNHFIY0Vvc09GOCt3amNISzE4azNxME4yaHpJOXNXdGQxN2F4ZVFxa3oz?=
 =?utf-8?B?TXZXNlMyY25oTGhUWnRxWHkxNHEvV0ljamkwbVd2NFd5aytBbUw0QnRONTVl?=
 =?utf-8?B?eUdoK3p0UHh2VmNMc2Y0UDlpOUpGWTBMbkx1Nm5waERSdDU0UFVHQVBtc05U?=
 =?utf-8?B?dnJYT09ITGZEeVVjZkREOGVseXY4UzR6azM4dDUrNUg2UnhibFhWYTVjcUtj?=
 =?utf-8?B?Y0ZGYWM3YXZ2bmZ2OWxGSjhMbFpES0JMMFpYaEt0Ri82d0lRYmpCT2NSWU9F?=
 =?utf-8?B?MndVbjNEb1duN1NvaFpJamZjeTBQS3RyYlJSU1dON0dLMUFLeGYydEJod2hH?=
 =?utf-8?B?YVFONG0wVktreUpvY2YyYklSc0JGY1BsSTBoSCtLYXNYSEdpRkJxd0htU0VY?=
 =?utf-8?B?bXdyTGNNSCtzcDd4bHFkRGFjT3daYm5OT29Hc2J2Z2ZNWXFBNnNPTG9kVnVy?=
 =?utf-8?B?NlVrVDU2U3VuQmptRVBlazZHekJxa2ZsNThTcEpLVFZBNG1BdXI5Y3lMeEdp?=
 =?utf-8?B?dHpack5oT3pXNWFjS0VKa1N1dGxCa0lhWnBuaDJBZHJ0QTZRb24zRUZRdVBq?=
 =?utf-8?B?eU1wQ0dwUDFJN0tRaVRKUWMvWXZlcVB4eEJYZ1ZTNWdvM1cveE1oQWEvMGxr?=
 =?utf-8?B?SzFrRklKc3pqMVBiRkc3WVNiZnBLZktGajJITklhV3EvVlRSME5EcUxEWU0z?=
 =?utf-8?B?dVZWaHREdjBwcmhPbjhWU2o1d1BhTFNxejREc0xpRGZiOFFxRVRFVU9ZbG9x?=
 =?utf-8?B?NXNVeDl3R1hmdjZyL2hyZVNEZmxCblNHYzd4R0NId1J3UEZLaDZ4aWFlVUFO?=
 =?utf-8?B?a1VkK05hSUJ3QVNsMm9JRW1iRkhwS3BXdldPUUhxK3hsa3l4RVg1RFZDMVpj?=
 =?utf-8?B?VHBUcExobk1GZi9UTGtycGxBSXhJUW1sSm1QRnBDeDNJSGFITHdHR3MrRHVu?=
 =?utf-8?B?RjRLS200bWhpNjZaSjRVcW5MWFl5SS9SbTVDdGFWV3pQeEIxUFloMWM4U0lK?=
 =?utf-8?Q?qBf/1Ajz1C+eqavUP+XTk6VA/BBt+g3c?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXd5SUZZVjNFTm95TzltWUsxODJWdWJIZFlPOUsvbllob2RPZWFwU0srY2NS?=
 =?utf-8?B?TjZQZVVWWVBSTzZLUjhXNlhZNlRianB6ckpDZVl1V0VTa0kvYlJXSE1HbGl1?=
 =?utf-8?B?MElHK205NEpXRGhTdlN5ZkJmaXdTZ1ZnSzJWWGJzbmljWTVER0QrS0RDK1BI?=
 =?utf-8?B?cDhWS3djaEQrRENRRThjaDFXZnNaU2NpWWE4SlkxMkVJRC93TTV0WU44UDJI?=
 =?utf-8?B?TmM1UndLelpyUHJHMU4va3VOeDdZVERWbGxaaG1WVUgyMGJtRTRjME9zek9X?=
 =?utf-8?B?ZjF3cW9kRzNCOWR0RVVLNGZidHRGbXNvWit6TmgrblFxc0ZPcDgzaVp2V0lz?=
 =?utf-8?B?d0o2S0EzdnJGMlRtL1VDZVd4bHBRUUNvL0NGNkk4V3RXajRYNW9EWXozY3FY?=
 =?utf-8?B?dGo5M2doUlNyMlUyNzFQYjN4SlpFYldOMGNQZmpkazhqRlNuNUc5OUJXVjgx?=
 =?utf-8?B?eW50b09yekxPdWtTZTJLVU5KTGVRUHIwMlVwK281MkhqSmM4ZjFpVVNyci9n?=
 =?utf-8?B?ejJhNWZtNFFGaTZrVEhhcTJadFhINllscW52MTQwcWhCUG85eDJMT2JxbXhl?=
 =?utf-8?B?NDc1My8zaXRXbmZmbEhtbGxqQjJFcEc3UjRkcEp5cXpLeFJxcWpib3Y5S2dj?=
 =?utf-8?B?MTJaZXVTdHVlRXJVZkNKckh4eUMxbmZneWhPbWx0SThpUk9oN2tKUXhGMHJn?=
 =?utf-8?B?UDZHVTFOOG43M0RCWERPRGxSWmRoM1NxNE5TYzBQY3hMR1ZYNllGSlUzZFpi?=
 =?utf-8?B?Q05BelR0V2Q5Z1J6aE93SFZkdmg3VHRwU2t2SS85TW1kUnM1MmYwaXI1amRL?=
 =?utf-8?B?eGlwbnhrbTVkNU9RSzZ2MGZWVjd1MlRlWWc5VEpKTnhKbmlDMCtwWEZyNko5?=
 =?utf-8?B?QUhrUXA3L3V1MXR2MGlwWWl0bUNDL1d3VW9zcHh0alFGMlJSRkFUM1JadXpT?=
 =?utf-8?B?OUxldzE2V3RvRkY0VzlxOXNtaXMxNGVQQ0l3M2hKTlY0c09WZWRkWFdMZEJO?=
 =?utf-8?B?dG9WbDNLZytidTdrRGNXY1l5UE8zM2JjalRGbDB5eTRkNXVmeU9FaXpkdERy?=
 =?utf-8?B?a004WjJkYVhDTkxsZ1FEWWNER3ZNMi9kZUFJN1ZWSUlackl5WDI0c1dxWU03?=
 =?utf-8?B?Q0x4SlhzV05MMTh4cDRJZXc3VzVUeXRaME5JSDYvWDN4MzJvVkUzcnQ4L0VS?=
 =?utf-8?B?WWUvenBaaUlMVkhQdHFjcitVRXFhaWFmcEdmbkhmT25yem9MQ3YyV0VlUlpE?=
 =?utf-8?B?UXlqK3J2TkhpR2ozUi92VmpOMGRMckgrSjJxczd4cXI0Z214ODgrS251K1lC?=
 =?utf-8?B?R2loRWNuRitpV0Z2UFIwZytWNFhWRmpDRHpGVGFGSlhLejFBMUNRNUdOZlpk?=
 =?utf-8?B?NnpLOW93aUx2L0dVUTBpTEFldjF2NVlHeFZCTGE3eXVmVnVnRFV3cU5CVkxG?=
 =?utf-8?B?R0RvRWRLbHNMViszdGkweTZpZG1QNDZGMGpMY0dleWFNZFRRMDN2UUpOUTM2?=
 =?utf-8?B?V3p5eURvdVJBcWpLWmFtaEdTWm93M1hINzlqK2Q4dytKT1JsMUpqSlR6Ykpl?=
 =?utf-8?B?YUVXSmpYcUIyQ3AyK3hkOGllWWsvQWYxMC83WjgrcFdRUDRZQ3ZKSXgrVkFH?=
 =?utf-8?B?aHVzbnAwYXpSc3VEbTdwRDFsUlNjL3ZvOHc1dWUvbHQ4UldvSUpaU0VtVnFL?=
 =?utf-8?B?b2tvQW5wVG8za0grVFd1SFBPWGVDdzR3WUJSMXQ4aVV6RWM1a0tqY1hYZ1pG?=
 =?utf-8?B?L0o5MGZDcVRGTW5yYWVWVFVlVW95amc5enJYTnp2ZUowQkY5RkVHR1cya29J?=
 =?utf-8?B?V2QrRThaTm9Oa3h5UlhZZ0NvUzFScFVaRERpSER4Mkw1aWJueTF4dlBnQkgv?=
 =?utf-8?B?b29iaUg4d01sRjJGNDBXcHZhQnBaMVc4c1NhZ0JPUHpvQUg0K0JkQ1ZEVm9O?=
 =?utf-8?B?TmQzbnh1cGJFQU96bmxFMmxKRU5QajI3WTEvcWNjclBtblRXTXgySTRQcjlw?=
 =?utf-8?B?UDI4R2xMM3dEVGRjQmNjSWVwanFtQ0V0MVQwcmx2d0hmT2NZeVplMGxSMkJP?=
 =?utf-8?B?U25SR3RKaUNXcGVNVC9yRWlhMSt1MFVMcDVHdDdFWStPMlg2SE1tS0NEZTFa?=
 =?utf-8?B?bFh3Z1FIVS9HUGFpdTBqbi9OOE5ybEFPKzlEank4U3FyZEZwWkFQYnJjS3RR?=
 =?utf-8?B?WUE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f14172-78d3-47bb-d37c-08de06ca3286
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 00:24:23.5941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1LB4ciwYUZ8+ru2eguayGXi3BmaFsfsHrDyRz9D6jh+Aa9ySKy2ybs1CSBnLlyHKi48/aFUAyRYX7KxaNmjTtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF6D0742E7B
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

On 10/8/2025 6:23 AM, Danilo Krummrich wrote:
> On Wed Oct 8, 2025 at 1:37 AM CEST, Joel Fernandes wrote:
>> The Nvidia GPU architecture is little-endian (including MMU structures in VRAM).
> 
> Yes, I'm aware (and I'd assume that there is no reason to ever change that).
> 
> Just for the complete picture, there's also some endianness switch in the
> NV_PMC_BOOT_1 register I think?

You are referring to old GPUs. NV_PMC_BOOT_1 does not have endianness switch for
Turing and later.

>> All the CPU architectures our drivers support are expected to be little-endian.
> 
> Technically, all Rust supported architectures are indeed little-endian.
> 

Ok.

> However, the only constraint for the Nova project as by now is 64-bit only.

Ok.

Modern Nvidia GPUs only boot on x86 and ARM CPUs. There is BIOS/UEFI support
also that is needed for specific CPU architectures.

If we want to add a Kconfig patch enabling Nova only on x86/ARM, that'll be Ok
with me.

hope this helps, thanks,

 - Joel
