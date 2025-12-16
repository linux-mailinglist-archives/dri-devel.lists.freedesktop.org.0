Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61975CC0F99
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 06:13:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91AF10E6B0;
	Tue, 16 Dec 2025 05:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HJiXOkiW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012055.outbound.protection.outlook.com [52.101.53.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC63710E6C2;
 Tue, 16 Dec 2025 05:13:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARwtJBJuePkdUbotYWgaf6zzcYXAAAjVb+bGUldzvPUxbePnPkTlE/RCI0+Tif+dzWRVp5jgPU1CBkis5pOoGJq4OPg4UsXW/k7Bz2M13miaMKfs2ElFNGzRq2q88v6u/rIOxi3oIW9wYAI9zF92mW8Po0G45TAWLX2Gf90PXN+N85aXQqCaOZwsZRyQR2f2eflP4NWVRB9sPbzpSSnz+JY8oR2c7AS4GfWP7QDqi2eKpdAmKjcfsYCJ7iZVhWI/JgJOrPzYdG1GadY+PAZuMzviHdU/J4alsKpOx3oQBGz6tP1Uphm7WJhhyC1DJ8MA3AYOLyE8/jiOo5IjmIRQag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6o0DvmZqVPrd8XbiBeZLiyHJr9BDy8ck1P5gyGqqrcI=;
 b=U5SaG3p5zIq12twKJCq/+pMI6SRDQOopjIEJBPTt6ZLd60vvoUG/j7fGixWkjGyXaGGjqueW4ZdAx7VzCnaf6SkDO6/O3OEy1EjpJJyGw+YP9XEpfFCGT+qABDqyaNWsAhCXy9pSbcKeNhu0MyOkn2i3yofy7hRbUqk1PH3ve0AIy0DGLTFm9pu+lYNmlgy/2Pe5VdIZolpPD3G48YYtSDAcDtqwFMhVb6VzbKBhA2JSF7uQu0/1THMUSJhTKHtbBRl0MoNRoc+5pFbhSXBWgb2RJiW1TYhcayJv3LOjYf6ZJK/n6LMcN5hHvOsGKNCRLrhbzb5O2Mv5Eau/OvY8NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6o0DvmZqVPrd8XbiBeZLiyHJr9BDy8ck1P5gyGqqrcI=;
 b=HJiXOkiWDRRg+GaHF0Vgmc8W3BXgpWiRum5fQKc159W8QTur4zmyWIJu+nIKjpUDdRvLfNZiR+vaocxQ3wlYDyW9NTbEK0Kfd+hhZg7me1bnkhRCgWpHrqBw77fpPKvt5ukqkLRns8t432+D+rTgkRhyWP1vsqoiV9GjMN5m8wZT93Gzv5hjTqZBbfJHBZlXm5OcdWUexEaLjn0SyxGI0+MSaZ6WwSXtkvkBV9dcGmuGJYAI3y7Fkf0rwnC7LXyifAYojf+FaBHmqVW1ZA/zTMM4cNmS3/ZWJ3JtVPenzpI9PcEw897KivCuYQ7BXlzot3fqlsIa7RduUkWHohU94w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8816.namprd12.prod.outlook.com (2603:10b6:8:14f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 05:13:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 05:13:47 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 16 Dec 2025 14:13:30 +0900
Subject: [PATCH RFC 4/7] rust: pin-init: allow `dead_code` on projection
 structure
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-nova-unload-v1-4-6a5d823be19d@nvidia.com>
References: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
In-Reply-To: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0049.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8816:EE_
X-MS-Office365-Filtering-Correlation-Id: 196afa72-72d7-441c-15e9-08de3c61e442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajFYUEdXMkxPU2hiN1V4dnlPczErTDEwNnBWWEQzdFN6WEhsWks4ZG1WakVH?=
 =?utf-8?B?eHZpc3I5UzhsZnZrNDEwR3liM1RpL1ZVZVZLQVllUGpTcU1rM0pvN3lHaWVp?=
 =?utf-8?B?NTlRNjY5UVdIRUdCb1R3NkYvQ2E5MlNoU0VWZW8vRm9rVnBZYWhuT1ExeWVu?=
 =?utf-8?B?Zmljc1hlbHdFNDE0dVdONWhSSmdnWk92bXRYSkI5STdGMjhtd0ViWTg1K09P?=
 =?utf-8?B?enFXZC9CU0ZiTU1BSlFBRFNKNVJiK3VRajhmRGkxTWQwMDVaVjlSQ09EOFdo?=
 =?utf-8?B?NmdPUGt6TERuU2plVHdWY01hN0hjL1cwVlcrcGtsSHcrUUh5UDI2bWUySjVn?=
 =?utf-8?B?YldkaW54STJKdXZCR2tjcHh1K1JhQ24waHg5VkhUNVo1YUhhTGFWWWZOR3ZY?=
 =?utf-8?B?bVpHMlYwVzJpQjErTGFVSGh3eUJyeXFOODRkZHhrRjFRS0pmSERQUkJwbDZM?=
 =?utf-8?B?TFR6U0JCTXhJZlZjYXZ0ZHdHNXFBNTBzUHIvclZITUpDVDlQN0h2VlM0N0VF?=
 =?utf-8?B?ZUFVOGRkWEFZVy9OdFhwT1ZWd0p5ZXJKenNMRzQzckxLZFFpUktBNjZVMVc4?=
 =?utf-8?B?WVozOXFjMWUxbmJmM1NKbk1HVlNXcituZzJvTzRiY0dWTkJRMm1QWlhXU3dH?=
 =?utf-8?B?SjhydlFMeXE2YjBaQ1Z3YUYrbjUrMi9adTU2eFhMTzNBd3QzVUtoZ2JjVmpu?=
 =?utf-8?B?ajhtWnMwOWNYekI5ellVNDg0MUpJUVYvOC9qdldaRUJWNDRBc0ZqdlZYSmdY?=
 =?utf-8?B?UlJqRWhmL1FNcS9OVnVteXhxdzVUNHdoNHJmeTA1TlROamVoY3c4Z1FZSnph?=
 =?utf-8?B?dE5UZHJDcDlBV09MY294Rzk4K1Y0d0xUOWM4Y2dLMjI5Um4vWE9BMkRvRDha?=
 =?utf-8?B?TG5yY2VwcXRkS1JCTjZLVjJYNEJjNnM0cXNyaExrZC9QcnI3YnphcHNUUldE?=
 =?utf-8?B?blc5YkYvQThYbWJ2bUhkempiS1I0eGZzQXRCOXh2akJLeEpvQTd0ZElPUlFa?=
 =?utf-8?B?b0Y2UlVhQy8yY1lDeUhpZERlZ2xiSm5BOEloeUIwWThNYXRiTWdXNWFTQ2xB?=
 =?utf-8?B?V1dsWmF1bFN4dHVaYStoeit0WnNwekxZWXprQ2R4YWJUUGhXUjl2QmhLQ2tr?=
 =?utf-8?B?eXhpWWVuVFhiTzlOb0FUekt4aW9zTWliUmhnM2VKaHl6THhQVG9vd3h3VzBq?=
 =?utf-8?B?c3ZIdEkxeTdSUEQ0ZTFFRnhGQXByTzRnY3dFeUxqK3h4OTFoUHRiQXJaQlZV?=
 =?utf-8?B?K2dWL2pIMUFhN1lDYTM5SFJSKzQxcTVySFBlMjlXcEpkZmRIUWQwTDlOWWNZ?=
 =?utf-8?B?aFpkYkhpOWFkeUJZWWpncC9TUWdZWG9DSm5PdDBNVVBSV2FpQXBMdjh2dTlF?=
 =?utf-8?B?ODBlVUxhK1EwODFKdFZBVUk3cUcrTFJUa3hZVEhJaGZmOGNFZ1I4dTBWMGpN?=
 =?utf-8?B?THBnMGxtMUpNc3Z4V01nZ1BpU1orT2JwZjRTYWswSXVSWm9MZWppMElNaThz?=
 =?utf-8?B?cFBqVjlXRVRTc0RiZU5PWTZjU09oYzN6K3YwQW0wTUZZQ0JKVW11ZnR1SlZ2?=
 =?utf-8?B?WWJQL214aTVKQjVrM2prZXhDSzFnMEhpWmRHbTlKVUtHbFM5MEgyRDhMRXpS?=
 =?utf-8?B?STdnaFBlcTZZU05td1BSTTJMREt4QzNzZFV5NFlkOEdGbjY5UTZ2V1MwdjZD?=
 =?utf-8?B?OFZJaEcrTkpsc0trZEZkZVlON0Qxa2V4MUpJa3JsWHpFbndhaGQybndVNEdI?=
 =?utf-8?B?SE81K01qckpYU3JFWThXM3AvYnZWMzRpRlo1bUovTTBYK09NN0w2WVBEM3J3?=
 =?utf-8?B?N1ZhNVkySTY1aXdqVSt5d1B0clowc3ZKUnpoQnNoVUw0TWxVQlNZb3JJd3pU?=
 =?utf-8?B?WUh6M3diazV4aEcwcHFUZ0kzc05vbVlDdVhhemwzelZ3MXB5NEU4bzBmTURY?=
 =?utf-8?B?MytJa0o3SWZscTdqSWt2SjhHT0R0c1dqTGJNNUFodnMzZDI5UHNTME5zN0RX?=
 =?utf-8?Q?myb4xjevZjt96GdW/yseODTtt/IjKw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHBUb2lsRXJPdGI2RnZIQ0d1WVRsalMvWUZYRGdndEplWG9NaVN1RWRnUG5I?=
 =?utf-8?B?dVNocVg0dmRVbVo0Z0N0V1FuSlh0cDRiMFZ4WjZWSW1qeXFJMVREQjBjdU9x?=
 =?utf-8?B?SUdKTXhINDh2aXZiMlFSWXZoMGh1TklvcW1pL2hzR0JhcTRmOU5GZWpwUnNZ?=
 =?utf-8?B?aGdBYTJzYUZyS0JlUHpIaGFueXd3OGdzdHJrcDUzME9lM1ZydDM5dlJHOXdO?=
 =?utf-8?B?SkwvNkJmRHh6SVZwNWlJLzZFYk9OUlVyeXBxUXdKLzhhWlBCZC9UdjcyakN3?=
 =?utf-8?B?Z3lEUThLWk9tMVZhdFIwUUFUSEZ6MUZvNDJ0Rmt2T2NxcXpuVHlBQzAwNDI4?=
 =?utf-8?B?ZGw2dEdjN3VKTFhRaEVLWUFwWi90MU9EdU1RMlY4V0VFZ2ttYnlTWkhNUlp1?=
 =?utf-8?B?VjcydU11MGRmS2pCZDdlNnBla1E2SERNaVJvcnJzYnFDeDdyVkVuVWJIcDlP?=
 =?utf-8?B?cmhuNm4wanYxVHVYMkZoQS9Fa2tOQlZ3YXNiYUVIcDBwelRQcnBFOFdtMk9H?=
 =?utf-8?B?MUhHVm1kNUlyLytEU0szTEFMTGtPUHd6c2REN0I1cGtjU1NrcTBnNEhQUjkz?=
 =?utf-8?B?RXNEQyt0QUxZTi9FU2ZOdmZnN0NhdVVhTG00VUE0QWQ0SnZDa2thQnRLS3Zr?=
 =?utf-8?B?dk9DUG5iRDFsQlVQQVUySjNoWmhza3JsS3loWDljVys5SVJpZVlVZXYwc1p2?=
 =?utf-8?B?a1BTeGlPbmtFc3VRMXZjUDlKRVFoazBjcHgxbzFKY2dvTDluRW1oYTArL1Nn?=
 =?utf-8?B?MG1UTVBDQit1THgyOHgyb2FadXlJTnJlS2ZjdVdsTWM4V3NRcGRFMHNMNnNK?=
 =?utf-8?B?WnZqRk5mdy9LMWpzUVUxcE40VEM5RVVnU1hEK3lLT2hTdXFOdS9YU1dPMi82?=
 =?utf-8?B?SW43cHVvaWpxNzZzSCtmd3F1ZXFTYndkVnlnSFI0Ri9CY203R3BpYmJDOVUr?=
 =?utf-8?B?RkNYVlhpRzB2WG8yaGZQeDBRRnI2ZFZQV2NSc1RBWm8vY1RuLzNycWJEVzdm?=
 =?utf-8?B?ZkdMTnFLbDVPdUF1UHlsSnpvN0E4Q21PMUt3UVlUWTlCRkExNVo1OWl4MnJa?=
 =?utf-8?B?YWhIa1B1OTd2TVZPcUt1RHpiaDlaSXhZeVl6SU9hblA5QklWYmxtWUQ0QnZr?=
 =?utf-8?B?anNHNmV5Nkxsd01NL0V1ZWRTK3ZVRUtHc0o5eklMc3hOcWdGQ0ozcCs4Tk9M?=
 =?utf-8?B?QzZhYTlSS0ZPdzFVbkZ6dHRlL0tPQkM3eWxOaG1URDhQWFBjQmFZRlkxdGVr?=
 =?utf-8?B?YXdFYzlzdWdCRTRZUmNlSDYxTXo5VTgyRUEwTk9KdXNZcjVPSzFWczgrbG53?=
 =?utf-8?B?N0xSaEtUaDJVVkVVT09Ibkp2eElrNE5EQ0lDYkhuQ3RzMmRRaGVYQ0hYWi9s?=
 =?utf-8?B?bitGNzJhVWxSSXVITzVLYnhSVFBPTjM5bHdXWFptN0JrUFQ0VllLY1FOWC9i?=
 =?utf-8?B?T09XVnRhOGRMS3hKSi9jUjA1NVlON3BVWVgrVVprZWtEVW9OenB2NzBDUE1N?=
 =?utf-8?B?N004RG45ejJpeFVya0NiZXVjYUxxUVoyK1lkNTF2WEZ6Um50M1RXTkxUdkhn?=
 =?utf-8?B?azNRZkJDZmpoMmYzbHZnMkhQanlscldpelRBbm9zbmlvSm1scWVBNTYzVmVx?=
 =?utf-8?B?UERSNkg3QnI5aCthdVpNZnZrRzdLSmlwQ0dzN0l5QU9kWWFLd0pLY0lxYTlx?=
 =?utf-8?B?Y25EaVIzYnB4b0RnV1ZxQVhWYjVIaHRidzJ5djNUNHdXL0d3dmRRVDY0MDdr?=
 =?utf-8?B?SHM1OHBJUHBnMzROV0N3Qy9waGRBaXZpWGhaUlpUSXZVcmRINkZIYXFkV0hG?=
 =?utf-8?B?Q3ExNVpLbCtsQjBzeHNRemR5M2c4OW5nVWVFSUhQZFBYdG8rRzUyNmIrNVlO?=
 =?utf-8?B?UThRaWN0V0g0QnhwcE81bWdIV0ZXME83VXFMczNLMDRabUs3WUZlcW1iOFI0?=
 =?utf-8?B?b3YwbVJyMVF5YTZBQkdpcXFzUjBJa2orY1k5MlIxN2dsY2tOSTdZRlBZU05n?=
 =?utf-8?B?WjNqemVneW4rUkJiZ3lUOWluVFh5U0ZoSXRrM0lFenlseHcxZHVCSzlOa2kw?=
 =?utf-8?B?MnltTkVmN3U1alN0bmJMRzQ1Z2w3WnFnTzNKSUZWZnNtaSt5RHpRQWNYdTli?=
 =?utf-8?B?WEhReHNEQTYrWkJ3V3NIWGxNeHFkc1FSeHc4Z2NnWk1IaDVYL05ydjRLMWRr?=
 =?utf-8?Q?Lct58HSGv4PPoXSX1WPdTKw/I/fRBKoiD4VgLcVutpnf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 196afa72-72d7-441c-15e9-08de3c61e442
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 05:13:47.3306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uvzyjYdZCHIMSy1bkQ0cTQuLcY/TKdZb1Q2l9HR0MNDIhywU+uo0LbMXXQSwb9PS6iwAf7pj97YpgoabIRBwUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8816
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

Projection structures are not necessarily (and often not) used in their
entirety. At the moment partial uses result in warnings about the unused
members.

Discard them by allowing `dead_code` on the projection structure

To: Benno Lossin <lossin@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

---
Benno, please let me know if this looks good to you and I will send you
a Github PR for this.
---
 rust/pin-init/src/macros.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/pin-init/src/macros.rs b/rust/pin-init/src/macros.rs
index 682c61a587a0..fe60e570c729 100644
--- a/rust/pin-init/src/macros.rs
+++ b/rust/pin-init/src/macros.rs
@@ -1004,6 +1004,7 @@ fn drop(&mut self) {
         @not_pinned($($(#[$($attr:tt)*])* $fvis:vis $field:ident : $type:ty),* $(,)?),
     ) => {
         $crate::macros::paste! {
+            #[allow(dead_code)]
             #[doc(hidden)]
             $vis struct [< $name Projection >] <'__pin, $($decl_generics)*> {
                 $($(#[$($p_attr)*])* $pvis $p_field : ::core::pin::Pin<&'__pin mut $p_type>,)*

-- 
2.52.0

