Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D91A5ACC1EF
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 10:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072CC10E0D4;
	Tue,  3 Jun 2025 08:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tmfVQe8S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2063.outbound.protection.outlook.com [40.107.212.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5C110E0D4;
 Tue,  3 Jun 2025 08:12:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1MMH+0Pv4e9esZWeaH7qWhb0rfBMyGnrTWOh3pGUsyMLkIFCUEd+QMBgsILWDPZ0NLntgZGoGFKMRYLPFMLPnr/3BlgHuHZhoMe9ZOD+QhRqVrAHvN42K0fmSfnxJN6IvcXf0FRk1aVF8tHiPSAIrgiZ6RbPpCU2JPPEhM0O+SBqZUEBbGYLQBg1A2L5MrOwyZm7ysI+GjfqhIgxq1y+7vuyuLDX9ePCWJgXg83n77sqeSOOAPcQ0LQJWoY5UWo2nMEwffYeifnP3w69TzTxCOuOfPNDdc1qhacBnvti0cRE1Vh2RKkTRSn1Ef9dkso6gITmHk0EzHn+gzFBDWaQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeCFC542bweMFO2vVjU9No2sCr+HdR15IkukK5uRZ2k=;
 b=WTxKp+9/3hCiJNkJPJWqXl0NyEYvkHecj4txt9cYkN9XA7WXKYqQR6AAYLh/9kCGNLrJWgQQYvZgqbaDlsYOdJJk+fzMe7aZRBo8CsdYTNvQTd8IFHl1hE19oy4lx+yzDt6MOQ6LR2kAtB5A36Y+kPan5yovNr0XbaKaa/sde4wTl1ZjGj8U/5zM30j9UTIfm/hmAPazSQHH+1kKaYnvOy/Qfylpqie9p41zeNwTsODxA7v+o3P9WrpuJJV8/AbLDVtiEgsBaJMK9JTGKd2SL+/QRkQxFeh8wkaNU4e8M6BqFCZ9C8ck9m2HpfquIQGJPYKJcmzhO/F1C+CTimL0Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeCFC542bweMFO2vVjU9No2sCr+HdR15IkukK5uRZ2k=;
 b=tmfVQe8SYdiNanwUyG1V9+5xahKt+wKFcIOLgQUwLa/C8M6wNfqsw9dUdEBjC3zTOM4kFqmgjnH7ZVs/knPvzqgXJ3mxHPvCoGinVqx0m0Vf/plxbh51LiQLz1e4ZkpaVOCvEa8fhGVyMj7ZamZNdE5jLGg99Tv2aWq+MXKJMaTNHGg7UfpdXXVAxq/O5BULwEJC1oA5FoyO8kb67TlMWrWfl+TS/MzmLq+/qQrYAZEJw21AawM5Q81N1C0Q2mxt9lzp0FWeWIchkvYpjuoJwoiD6Ir5Q3hpMP0nHgRNj566FEhijHpkFP2zC5OL5gKzQhXOxGApD34+eV0+OZxyYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB7221.namprd12.prod.outlook.com (2603:10b6:806:2bd::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Tue, 3 Jun
 2025 08:12:13 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8769.037; Tue, 3 Jun 2025
 08:12:13 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Jun 2025 17:12:09 +0900
Message-Id: <DACQW908WCLA.2JHRLQ3V18FPD@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Shirish Baskaran" <sbaskaran@nvidia.com>
Subject: Re: [PATCH v4 16/20] nova-core: Add support for VBIOS ucode
 extraction for boot
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-16-05dfd4f39479@nvidia.com>
 <aD2oROKpaU8Bmyj-@pollux> <20250602151506.GA779285@joelnvbox>
In-Reply-To: <20250602151506.GA779285@joelnvbox>
X-ClientProxiedBy: OS7PR01CA0289.jpnprd01.prod.outlook.com
 (2603:1096:604:25a::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB7221:EE_
X-MS-Office365-Filtering-Correlation-Id: 8765b9f9-9267-4ff7-753d-08dda2765886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2ZtUzFnejJEOWF1S2xrUDZZV2N6ZjlCNjFKMkNuVHZaOXAxQVdwNEVwZG01?=
 =?utf-8?B?WHFPMHhIL3cwQWZScDB6SGVNM2lFS3Bxb3lIcUNEbzBYRU0zTGxZNEEwMXRV?=
 =?utf-8?B?ZmZ4OEdhUmUvbVprbk55N0k5dU1xYll4WmZDQnlmclVwMFI3NHNtdkJKZ0pN?=
 =?utf-8?B?bnpHTjl4cDFoREZkdGpXd2VvRFR0YWM1bG1YM1ZORmFEZzVjTWZOZTNLQ1Bi?=
 =?utf-8?B?RzR4blI1S1JWZTJ3cUp1VTM3WG1aMk9TU244bXdneUxDbkVCM3JNL0ZNOHJE?=
 =?utf-8?B?QWpwdGk2Z09DRU4zK2VyUllIRGdMcVBBY0lNTFhqUjZIZVNKM1lVUWpudUdO?=
 =?utf-8?B?TlM5UEVvcnFrNE1ZSXBiOXd1NHEwOGlFTXJjdmpvck1YWk1HamNFMTFlZTFC?=
 =?utf-8?B?czVpWmMzdHkzRzNtOEUxZEE3eGVheE1YVXFBa1lGay81MFh2aVdEUUtMVXg3?=
 =?utf-8?B?KzFQV2dCZ3dUWVpIbERhRjFSQ2hTc1FJbUFyMlM5UXJCdkY3Y3VuTm94aXZS?=
 =?utf-8?B?ZHNncEJuQlpFeVl0eWlEb0Ixc1YwUW9NSGJSQ2puL1FXOVlPTHZwbXhQTTFa?=
 =?utf-8?B?WWhrNzFsV0UwTldPR09DRFV6SlRCRG9UR0JjRUkydWs2RDI2aHFnRHViUTVs?=
 =?utf-8?B?ay9vTzNjNTV1RVg4M1VxSUcySmFpOXdkWkNVZnZldnJnR2s1c1pKTXpUT0Mz?=
 =?utf-8?B?bEtNbG5ySHBQQ2dENXM1bXNQZkdwMisxTk02VVU1U3V5Ung4Q01IakRybS9x?=
 =?utf-8?B?SVRObjc3amx6SkZXenFlMnJhb0V6T2RoWEhpSWM3RU9PUDJlcHdjUFJCMWJs?=
 =?utf-8?B?amNMS1pnZ0tmK0xydDZ2QWlHWjVHSHRzL0F2VS82TjhYWHRoeVBUTHJrMHBB?=
 =?utf-8?B?Nmp4NlFjK2VoZm9VNmpYcEtQVnFZYktCcmpyS200RzVQRHJpR0l4b2d0YzF2?=
 =?utf-8?B?bmVnaXpESzU3bEIwaklVVTREblBROGJwS0xZUkI2ZE9vbko1ZC8vWWlhWmEv?=
 =?utf-8?B?SVJ0c2pleHl6VWtQWXVRSCttSjN4eW5qUG9wd1RFU2lCazJ6UVdVUENBaVNm?=
 =?utf-8?B?VVJDSktYbEFBYkFIR2J4WjdPTWhsWk9LNkdjR3hrQmQzaUJmL3ZZa1JESzJv?=
 =?utf-8?B?UTczK0lnRkVjcldndnp1dW1EUS9LUEhaYWFaVEgzVkJNNE9KOHdOTzVQMFJo?=
 =?utf-8?B?Vy9Rb1VJZXRwazFSeE9nSUU1Sy9xSCtJNFIxN2NKQ3pxdHlTK0M0ZWRuN0NH?=
 =?utf-8?B?VC9Yb01UdzVUQ1NVV2lVQlJ4L1IzbXplS0JZSXNJWTcyYVNiTTQzUzdBQUtJ?=
 =?utf-8?B?Q3NwZEg3RHFEcGlKL1FnenhPR3huN0tkbHZFdnhyR3JBNUdsZDlYbkFrd09B?=
 =?utf-8?B?Vkh5eFZ3eGd6cVU2aGpVTkJNOGc2RXhPNnQ2L1NPSWh1Y3h4NGJTRWpLU3BQ?=
 =?utf-8?B?K2J6L0x6cTJYRm5SWkJvZnFyNjNBV2VOWHIvZFp1eGRhMGN0S1UvcDBxeTRK?=
 =?utf-8?B?azgwYTF3UFMyUjArdFpzNEdmbGdzVUwwR0lvTEtkemJkWEd2WENtc0Y0clQ1?=
 =?utf-8?B?eVpkSEM2RTlIZVhtcHptMU9CY1hwQXIzUWJPV1k0c0F0SzArQ2VtaTdxb2JM?=
 =?utf-8?B?L1p5UWovQ2wwME1pYUhPWFdIMVloa2Vqd1NUSWREbzNUd2lvZnB1MUxNR1Bn?=
 =?utf-8?B?c3FEU05zRjV0bnBXem9wVEUxeDNFdnFUdUwxbEFjeTlhV3pJMlBTcS9vN2hF?=
 =?utf-8?B?RDlOTUNTODRWQ0lNbVVISUVnSUZJMmVJSHlxbmxlT3hvMndLRmhGK04wS2I2?=
 =?utf-8?B?d3pWRHRpQTg1SzdxQk1DYVdBN2lzcHB6ZTZOTlR2RVRkbVFTWWpBWVI2MzZ3?=
 =?utf-8?B?NzlNa2tHUGNXKzFQMG5KZkFidlJIUHg1WldITWVnd3paZ0NJbnJPUmk2OXZS?=
 =?utf-8?Q?qahkhqrypUU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDF6eFR4a0NFd1o1OEpLQzNyN2pWY1dSeXVSSnNIOXIrQXkzdERVbG5HaFhY?=
 =?utf-8?B?RWNTYU4vSE1BazZQelhwVk9QNUw5Qlo1ZEVlbllaK2lCRXhUdkx6djZtWXl5?=
 =?utf-8?B?UmdZMFRQa1ZSN2V0QmVMTnJSYXdMaG4wNlgrTVRnZUk3QWlPL1JiQjVabWtv?=
 =?utf-8?B?Z1FsMzFkU3NraS9NbnVLTHlqNkprY2grM0EyMWI0STJtaHpiNmRPeFBiQVpY?=
 =?utf-8?B?OEZvYmJpQ3FyNmdqenFONFQwbzR0OE15bWJCcWh3QnY5M1llUHBBZ2NRWTNy?=
 =?utf-8?B?SEsrZmZmZWVpS0R4N1ZwVHcxMTUzbVhGb0lOM2htZ3hJNWVBMkhNQ0FaK0RO?=
 =?utf-8?B?cjJxcTFTOWJOTTc0MlBsSDIzQjhwYS9sdHB1ajREUE93QlV2YzRIWEg1ZHc5?=
 =?utf-8?B?aDhBV0gzRWFKd2k0S2hlM0NmR09uSFRxRWVmWDFJTnQxWXIxVGNMZnBzN3dL?=
 =?utf-8?B?ZUQ3QkRkcDkvZnU5WTNwdHFqcGVrOWFqMjAyN1NrYVhFdzdZcVVpVFNwSEo0?=
 =?utf-8?B?bFRkZ0NrTmJCMFU0bitwTFh3TUN5anhnRmFQbmpobjEzVkVpRTk4V2xBVTVx?=
 =?utf-8?B?SHRMWTRiYW5Hc1RVRDhQRVZoTTkrTm5vaDFUVkxKRE5EN0dKa2x2Y1dKTzdr?=
 =?utf-8?B?enM3eXJscmd2bTl2eEdqQVB0VDA2US9jdnpaRFI1Q1JTZmR2Q2FibERRODVi?=
 =?utf-8?B?K3ZtTllnTE5iUmJyODRHTFR0MVZ6OE55c3FIZG93NU9rV01mVGNxZUFhd3Zs?=
 =?utf-8?B?ZkVyMHZzWXVKSVlWREpVRmMwdmlLNExmWWhYQU5SU2h1S0JtQTR6dFdtcUxG?=
 =?utf-8?B?SkhPejhlZzZhZW9sZ0pPRUlHUEVqZHRNcnN6VEtVakRJRkJLTWsyTFh5b2tt?=
 =?utf-8?B?SG51VGdNWHRaSzNRaEZGUDFqMTNkaFZJOEdIRWZPb2JycTBDR3dYSSt2Y0RD?=
 =?utf-8?B?a2ZoSlJCR0dobXBNbS9zS2x5UXd3RGhOTXptaXo3UnZPbzlScGhyTzNNTndq?=
 =?utf-8?B?ZXd5Z0hpUTJyQUNKZlNpRmJsUHQ3L0EwckdnQS90N1dNRHZTVm1YeHQ0ZW1K?=
 =?utf-8?B?YTJNbkVkQXF6R2hIa1o4NzdnbjY0bEEyQXNVM3BTREJWUVlla0dLNkRvQVdv?=
 =?utf-8?B?V0dyMVRObDAyZ29xTGxLSHJCN1VHcTBjYmJXL1ZHamJndlYxTllvVW96QXVS?=
 =?utf-8?B?OXRJMlVzNkZkN2Frc3ZNTjNCQXhBK0VSSHFLcEUyUUIyMlJCcmpUU3NzeTRs?=
 =?utf-8?B?bHRhME1pSU4wbnJrWFc2Zzd1UDhRejkxNGN3Y2ZCRnowbnhUOCtjbnVzTFhT?=
 =?utf-8?B?a2p6MjQ1N2czaGpocjBNWHVSVklwY2FYSTJjbFpibmpnRUIycGgrUkp5VGNz?=
 =?utf-8?B?SVczVGpxSmxWWkpybjdMRmNJOVpQWS82aUlXNFlmTUI1K1JkVTNDTUZSYk5H?=
 =?utf-8?B?UnAweVlYR2JEKzZBTloyRGNiWTRYZlo0U1dZZTcxZjZYUk1uRW0zZXE5UWRv?=
 =?utf-8?B?dkcxa1E4OHAweDlwYlZ5WE85T2x0WjJKYlZzNG1yNG5VZlpFT0QzSTBxc21h?=
 =?utf-8?B?OUswNDg0Tm8zd1ZOcUdOSmczWUN1UzUwMGNPcUx4T25xdzA0cWo1czA1QlhD?=
 =?utf-8?B?aDFtTjB6ZDZBb1NsUzZmdEkrNTljUnExT2dIVCtIR2NGTTlaT3F3cXhTUXRn?=
 =?utf-8?B?SGhuck5BMDVyamoyTUZBRGtJeEx2bkYxRUNVTVZWSFlNUjZRWGR2NFVBQkY2?=
 =?utf-8?B?b3lvcnhhbFQvbFRsREp5N0o2MjRQWHRJbmNland0WmcwbVpGaWZtWVUyYW9T?=
 =?utf-8?B?NVQ1Mi9DTzdPTWVHM3lTdkdvMzJ4ZTRMVHRndGgvT0lUeWhJYS9sQTRZQmt2?=
 =?utf-8?B?bFY4aUw1NjkvU0N6QUZtd29VRklReHk0ZkVPblNmTlFkTldJUkxlWFU2UStN?=
 =?utf-8?B?WHl3Rlp6LzZ1dE4vWXBBZktXQ25xZzVLLzFDZ3NkWFF1SnFtdnV6MlhyWVhS?=
 =?utf-8?B?ZnhqNm1CV1Z0enhJeDd3L292MG9LTjFNNFprMXZNaUVhaG4yUTRwVE9GdkQ4?=
 =?utf-8?B?TlJpcDFHZ2hlZFVhNjhRSlBpN0ZTdjllRGoyWVo5dUgzNHFvZ3Fza3QyNHlK?=
 =?utf-8?B?MTZ2MDN3YU9IYWFyUUw2YUNzejhYVkM3SzNYd1lnQVQwaW1OK09UL1VKL1Jt?=
 =?utf-8?Q?LD8/6PAEEuz4eAVBEvSU75YlclydHhHpsDTkZhv9t9hy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8765b9f9-9267-4ff7-753d-08dda2765886
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 08:12:13.3783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QPQe93ZNJz78wwX+BiMWpegCU89+B33hIW7POe8y0xvgp+p9vsQNglL8kRf9iwQc6zMwKtFAaXIA8zlHO7rk8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7221
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

On Tue Jun 3, 2025 at 12:15 AM JST, Joel Fernandes wrote:
> On Mon, Jun 02, 2025 at 03:33:56PM +0200, Danilo Krummrich wrote:
>> On Wed, May 21, 2025 at 03:45:11PM +0900, Alexandre Courbot wrote:
>> > +impl Vbios {
>>=20
>> <snip>
>>=20
>> > +    pub(crate) fn fwsec_header(&self, pdev: &device::Device) -> Resul=
t<&FalconUCodeDescV3> {
>> > +        self.fwsec_image.fwsec_header(pdev)
>> > +    }
>> > +
>> > +    pub(crate) fn fwsec_ucode(&self, pdev: &device::Device) -> Result=
<&[u8]> {
>> > +        self.fwsec_image.fwsec_ucode(pdev, self.fwsec_header(pdev)?)
>> > +    }
>> > +
>> > +    pub(crate) fn fwsec_sigs(&self, pdev: &device::Device) -> Result<=
&[u8]> {
>> > +        self.fwsec_image.fwsec_sigs(pdev, self.fwsec_header(pdev)?)
>> > +    }
>>=20
>> Can't we just implement Deref here? Why do we need this indirection?
>
> We could, but it seems weird to deref a Vbios struct to an FwsecBiosImage
> struct. Conceptually a Vbios is a collection of things and it could have
> future extensions to its struct.

Would it then make sense to make `FwSecBiosImage` public, add an `fn
fwsec_image(&self) -> &FwSecBiosImage` method and have the caller call
its methods directly (maybe renamed to `header`, `ucode` and `sigs`)?
