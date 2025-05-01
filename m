Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8483AA5EBC
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 14:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A7610E839;
	Thu,  1 May 2025 12:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bHW3kcox";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5E410E82C;
 Thu,  1 May 2025 12:59:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISkzso8wATDcHpyHE7rS6S8eTfc8N1lZgv2WvHNrUdcNaJgWpCoFjWmi3OkJ/9sdvdF7cAel42+8cBxWdgKdbbTMGkeiZEfDRyi+vl5N1eNs8jtBRiU3Yw92qnzzj/4PybKT/oEAJ8xULb0UffAl4gzKwAu6/xXYB02yxPbBRwIH4EloRxAOvFaRmVOI/MnLf4YUik3tjnCdlKnYVU01ip4qlm9r9J1bUI22WUmGolXD4LZVPI4aZvGHIieCTrfExRrRYfHqKPTDGnSc8sKyRm4G7pZcSH4r/4Jv7cHquX+knLWxswX0S/5gmzc8UhfUrjy1MJVjhh3nfGMQJlY+ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DiZI8pM4Zu/6ZqF08uy2+0TbE30HzmhD1uWG+Lm3eBw=;
 b=ud7pek353SZqARxw/J8u6ypf97Zp23MaYN3berQZjsaogIjZXm4W7RpjzgC5SPS02u8qNSSEhnDtytsNNqTZ6crU8PdPIoPewj9pWFZ7DTXfAujx1J6n8qZUCIyBwIsVOOwGz98C0IIuqA2ZRIUwAtv9uPIAHVZDjmL8E5AYeZzsreQpd/i77sBd+I6/93vPOOgwyxRszIE3gZiRRfdzRt8bNkIhowuzpI7acTI71QnAFNe9Ir5pnjeI+hBwdoEIo5Aq/Hc4wzXtgTaJTrX8x9Nc5zqA+GgFY0aLawHr/K1KP1JvKIBA3KHdqBliDzkAqdZLqNiJa6lHjZLZG0SgOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DiZI8pM4Zu/6ZqF08uy2+0TbE30HzmhD1uWG+Lm3eBw=;
 b=bHW3kcoxCBG7Ut37o0Lmgw10pbobj0QAdJrPE+Qg7WlbHP+h7bU1gx/Od1cq4sSFNZ15Tos4eufM3+7RgcHEvNGlK5mklCW9OgCfJGjMrU1bMIglMztxavDONzvq3m5Z3/iu4RGAOQzsj4pdlhQVOY3xb6CfcJZ65QwfKFkWjsLICGU8ZbZKVQQjuAADB10XtCildU2aqJmsiUk/SBmjy2IG7qITXPlZH7CycQBbcXCl6AknHW1AtJvsm2I7mKfW6iQtwwyu6fVCZ0/e4bAfLirCHHVqN2vOj5tpgDjDj3cwSOhNLvRzQT9B65z5sIOP5wONWowdu2/d00RdgewUEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6442.namprd12.prod.outlook.com (2603:10b6:510:1fa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Thu, 1 May
 2025 12:59:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 12:59:06 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 01 May 2025 21:58:23 +0900
Subject: [PATCH v2 05/21] gpu: nova-core: take bound device in Gpu::new
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-nova-frts-v2-5-b4a137175337@nvidia.com>
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
In-Reply-To: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0209.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: d60be859-d093-4f79-c4d9-08dd88aff489
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enpJc253UTdXcHFEY2NtYThxM2tnbXNKdXlJK0xiRVdFR3IvY2ZVUjFuZmM0?=
 =?utf-8?B?aGZucnBFWTVRUHluTFJqZVRCME9PYlB0WDltTTBEdkw4QVcxTEZVaXhReDJz?=
 =?utf-8?B?S0FmVFY2ZGtEU2N3cmxrT2psLzI1VmlZRE5oc1B0SkMya00vVXhJNmtpTEwx?=
 =?utf-8?B?T3JJNEh5ZUQ2SzMvZDgydWEwWlloWG9ERGxxTGNuVjVvQmxlSWxNN3dzaUcw?=
 =?utf-8?B?aHpUNzRvSEcvcVdpMUkzSTJCb25NZzFzNFJYRmpjRjVkN3Jmb1FXblB1K244?=
 =?utf-8?B?Tm4wRmQ5RzdRYVJLdnVuTWU1TmJNa0tHVy9BU2FXdld4OVNCdXJhakFDV2dJ?=
 =?utf-8?B?WU1MTDJMSFN4dm1ST0s4TGJ3SmNuQ2RKcklkL1BzV25JNVgxOGlJVEJ0anE0?=
 =?utf-8?B?ck5vTS8rK1ZRU1ZIVUVpMGZNYk03MEJHb0ticElPQ3l1bHlhM09iNUJBVEtw?=
 =?utf-8?B?cGI4aytsOHpkdjdpMHBzbGV0aFowMTA4ZTJUaVJJaEZSUkgzc2ptcXVudGk4?=
 =?utf-8?B?QVFhK1kvenRzRDhKa3BqcXRpRE1nVTcwZjlybjcwL1RDYS9NeWJnc05JUFMz?=
 =?utf-8?B?TXBzTzJhdS8wWFRkcDdidzRqWEFPZ2t5THFaSnhJeENtYTF3MUErT1daY0px?=
 =?utf-8?B?aG9NM3B2VTc5L0RBYkJqeXFoMmdSRG5MS2YwK2w5OEdtRDZUSjlTRnREZnJw?=
 =?utf-8?B?YnRXMW0wUm9tSGtkRElHN09qUFdGbVBsNlU5YitnbHVMa0ZheElEQ1ZPMDNU?=
 =?utf-8?B?V1dUV2Q4bm9oQXFMeHpVTCtkUm9yaUFLejhlRmVUY09KeEdmeDdiMXZVN2l6?=
 =?utf-8?B?cUhaOHR6TXF3NlVuU1V3cmJRTFZKajRqalBlVnJ0UjhxbFRWZkJGbmhoVFZR?=
 =?utf-8?B?UlNDdHRnTnZQQ0tRQXhwcTFzNGc4UmpDZVYvb3F3K2txYVY2OWdJbGhtajM0?=
 =?utf-8?B?M1YwN2xscHlvTDJUb3RYQjBlSnFSUFlSOVovdHFiK0NmcEpEZXNkYmJHaG5z?=
 =?utf-8?B?cFRUQmNCRlVLcmt3bEZGQkRFemJIT3RiSWlwV2VkWDdqV1o1Z28xZTV2ZU5K?=
 =?utf-8?B?ZVMxYkZ2UTB2Ris5Ui9SRXY0eGVQVnQycjc1MDNyRDRYUHF3dWRDMmRoc0JU?=
 =?utf-8?B?cXk3WDVBWW9JMko0UXJHSGtpUWFZT1A0UEZiSHpSNXppVE90bGd6UlRhaXFV?=
 =?utf-8?B?ZHZmbmJaay9ydjdQUllqRXROM21nSzVseWlqcnJhU29Ga0xFVVI5MGtNcHlY?=
 =?utf-8?B?UlFMY3ZrMU03OERyUTNxcXpPZlk1ZlVacXpFMHRwSmNPUGVEcjB1RzBxUzUx?=
 =?utf-8?B?cG5tUW9MaEh2VzRrNzkyYVNsdG4yNUhFMGVPNlN4bFZXMlMwcjZtdXVxZHo1?=
 =?utf-8?B?WUc0UnRKKzdNcE1FN05xQ2tveDFsR1Y5ZFJ5K2p0eHo2MHJrcmxhcEpCcW5h?=
 =?utf-8?B?V3JyZ2FZeWVjTWJiSGJMKzJkWXZ1MlFmeHlHM2RIVllyZFNKSEJYNU5sREdk?=
 =?utf-8?B?NGtReFFBRWxiVXhuVWpXVTYrVzhXbi9oTVdzeWs3UGFkMnJoUEhsQmV0ZnZO?=
 =?utf-8?B?MUpUZ2JOZWhvVDdwcWVRK0ZrWlA3MHdnNXNhZktJSmRMUHZMRU9Td1hVWkZj?=
 =?utf-8?B?RGpyV2ZBeDBteHcxeFFOUXhVcGNmZ3BVUjA2V2duRlo4Q25XNW1qSXhkeGkv?=
 =?utf-8?B?T3VnbzI5NWtSRkhoL0RiZXVnbDFDZHp6WWdpVFRraWxGUnFaZm5TcjZPZWRG?=
 =?utf-8?B?a1JSS1pWWXozRVNBUVVLNDFZL1NLUWRucHNMb3ZlaWxKaEFTZXdFVTEycDFS?=
 =?utf-8?B?c1RYOFkybEt2VnJhR1pwTmdCcDR2TGQyYU81bHFYNzV3UGFpV0I5MGwxS1dW?=
 =?utf-8?B?N0VNdDJRSlBqaWNiWFVHSmdZL2tEY1lxRGk3ZWtkbjlBRlRjOWZLSVByenI5?=
 =?utf-8?B?NHJabEhZWSs3aFJSMjhvNGpQSTRWQ0lGcWxIdlhBN2h4Z2FiZHJqMXhwTG82?=
 =?utf-8?B?MDgvcG5PdVlnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUQwMXFWOGVEV2VpRWRHRWtLaU01ejYyQkNTazV2UStJNkt2TWl2TEd3NGJN?=
 =?utf-8?B?WGI1ZW1PcFRhZ2x5NnlZLytlWjdhTHk5dzVqd0dMQ2tGdDk0L09pWGU0SkRE?=
 =?utf-8?B?YS9WSjkrNVMrbmdkSFBwdGhQdHdHRjFpOTI3L09CY0FGTVBHYWxsQ3VRdGZP?=
 =?utf-8?B?MkFBaU9UWVEwb1pPYjNoSjNOY1RCK0srUG1PdHlweW11UEY5TGR3V09ubWlB?=
 =?utf-8?B?Q0xQbXNiV3A4OWI5QmNsd01WeHp4Ym01b2FaMWNzUHA5dXBVY0FqVWJkd0Zq?=
 =?utf-8?B?aVFmYm1aQTc5eFJ0T2ZRN3o5VGluSmxHS2h3WTRzWG9JdUJJUzdNY3hGWjZi?=
 =?utf-8?B?WWdDcit5blRjdENJUzBJTjA3enJFT0JHZXY4eFVlU2h5blJYTmpiNkNvVSsw?=
 =?utf-8?B?cGtmVmI5eERxOFVpeHhFZjR6enJ3c2V4eExneWpNYk4yQTdiWFhJcm1KR2NC?=
 =?utf-8?B?UVVnUjhwQjZDbzlRdnB2bitEUFJDT3RHMlN5WmpvMVpwaU1xeXNXaW8wVjQ1?=
 =?utf-8?B?aW1tWnpCSTczeVFBVTJNaFFuaGg4cWhuM0xrZ25zVTlrRml1T0E3YytRZnpP?=
 =?utf-8?B?ZWNvb1VDUmpXYjV5MWFtYmNnVFBOYnpEQVhjK3IwUjU5QVNTeER1R0srV0th?=
 =?utf-8?B?amNTVWZqR3orQlZFNkJFa3lxZ3NVZVJvWHQ3NWJKUDJjYUxEaFZ6M1JlZTQy?=
 =?utf-8?B?cmVFWXYwcmYwL1dEZHVKSlJqUCtHVGpEbnRMV05PSy9aTHdRL044c1JPSkkv?=
 =?utf-8?B?ZCtvdWlrSnpqWjU0cFJZOW1GaTBHL3BxcElLOVhoK29lSGgyZGpSTGZxSjdB?=
 =?utf-8?B?Rm5RVVpJWU5mNS8zRkt6a3N4a3N6NEpNSkg2blNyQnRUUU1BZjVqd0tqOXVp?=
 =?utf-8?B?eW1RZ0ZRMGVTUXJ5WldKMXVIYjZ2ZjdoM29pZXFENDBoRnBQY2QrU1l3WkFI?=
 =?utf-8?B?dDJReE9SSVBVS3JHcHNQWTBLTE1uVGZab2hYM1pOQjBWOEMxU3I0ZStxS3Zw?=
 =?utf-8?B?NTNWOFBoS0Q4cmMwQUtsQlJCdnVhU1BOVncvSXlGSzdYVDhrc3VwVVhVY0JE?=
 =?utf-8?B?VDlmYno0TWdxMVRXSkl1VGE1d1owRlEwUnVTOWo4WmIxMEQ1aWFONWU1alJZ?=
 =?utf-8?B?M0FRYzVmZkVQVUNyQWFDVnlGRU8vQkhHeXR3dUNvd05oSi9GRFlGQkl2MXlv?=
 =?utf-8?B?UUhnZ2I4bGIxYm5rMlFPaUZVRXhmWGpnL0M4TXFZaHFVbVRYVmltQllmbTE4?=
 =?utf-8?B?MnNZQzVnM1ZaOVB1eVRUUjNlbURDcGxRZFIrR1hUUm0zTUlsbzhCbzFuQXJU?=
 =?utf-8?B?bXRQeVhpN2h0bzVjZkx1RFJDWnducjNoWmhCaFMralFwNnV6VGlwb2pXY21X?=
 =?utf-8?B?SEdMbHhjSm83b1dDbnZwazRIa3hLOEdnRXR0ZXZiYUp6eXB6bWdMd216QlNJ?=
 =?utf-8?B?WTRZbHNmSWpQR3RxQkNVMlp1VDRGRXRtUWkvK1hpd2FRTnJ0YkVOS29rM2dy?=
 =?utf-8?B?eXBqUlorZVhnVXBSUFFQdGdrQ0lCaGR4YmZsblZZaHpZMEdYd2xoU2tLOXpU?=
 =?utf-8?B?UWJEVnJsY0NyOTlYTU5KRzVpeS85LzcrQm5TWHZzbzIwTU9QUmNCN0FzaDhZ?=
 =?utf-8?B?N2liSWVkT0lvemd3Vjc0MDY4SVpDeUdvaVIzZ2dwWDJYeEVFbnlESW80MHpH?=
 =?utf-8?B?TjJ1ZE5xL0JhVGxjVzRCUm00M1MvUE1TemM5bDdaZDZrbGxBU2RLdUhQR29o?=
 =?utf-8?B?dk5xUytidU1xUTZsUGF2dXpVM0xxWTZSMm5qL1pRMjR3RC9MMzdKTEZmNEZF?=
 =?utf-8?B?Vkt2MCt1MGovRDZEWmVsQnRuODFMT0lSUWJmN0wvZmFIRlVHdGtGdFlGcEcx?=
 =?utf-8?B?V3BYQTdVelFUeHIzYTZ2U1JYOU9rNE1ZaFN0MFdRRUhzV0ovdnpUdEtyQWJT?=
 =?utf-8?B?bHQ2b1V2Nmw0WURJQXg5eE8zWjdGRFNIVXhtNDZLWTdpQUlXZ3lEYWxNQmFx?=
 =?utf-8?B?R29LZFhWWktoSDc4VWwrK1dBRW1WaXNUczluYVozVXdLZG1uOGtGVDZ2WkN0?=
 =?utf-8?B?azJyUkJPdnhva1FtNEZ2aGZQN01yYThrQmdOOFIyVUREdmlKcEJJTFplRUdn?=
 =?utf-8?B?Vk9HTWZuSFFSOXFCOEZCN00rekxFSGE1ZWpqb0lVazZvdCt3dElwaW43N2VZ?=
 =?utf-8?Q?4aHV/hV/JrXPb/dMYuXuvtHF4yI9jPQVm2PH6dSkZq2f?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d60be859-d093-4f79-c4d9-08dd88aff489
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 12:59:06.2378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wP2SKriypZrSm+eijyZHtDoZYAA/O7zvlNRCCtXHvASMN3KzTL7ytOEO8u75qnplu+tB4X5tl+kA4gOEnKoLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6442
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

We will need to perform things like allocating DMA memory during device
creation, so make sure to take the device context that will allow us to
perform these actions.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9fe6aedaa9563799c2624d461d4e37ee9b094909..19a17cdc204b013482c0d307c5838cf3044c8cc8 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -183,7 +183,10 @@ pub(crate) struct Gpu {
 }
 
 impl Gpu {
-    pub(crate) fn new(pdev: &pci::Device, bar: Devres<Bar0>) -> Result<impl PinInit<Self>> {
+    pub(crate) fn new(
+        pdev: &pci::Device<device::Bound>,
+        bar: Devres<Bar0>,
+    ) -> Result<impl PinInit<Self>> {
         let spec = Spec::new(&bar)?;
         let fw = Firmware::new(pdev.as_ref(), &spec, "535.113.01")?;
 

-- 
2.49.0

