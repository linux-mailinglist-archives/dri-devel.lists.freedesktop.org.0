Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5C6BFB9D2
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 13:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1258510E75C;
	Wed, 22 Oct 2025 11:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N2xBDLtb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011023.outbound.protection.outlook.com
 [40.93.194.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1011A10E758;
 Wed, 22 Oct 2025 11:22:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EEtwY3S5HUKwvtBXJw+KdFN4CsmhbJfdPxx+NNJsAspksp/7y8Pq7G4S6Pi5ZS29djHtHZHQ9fZVtNmO00dVHEvPZH92i/uVs3Bm0YBwYjq5b09CmqcCbUj+iJITSrPHjPTPXs65MTjPYBhW3MP9MNeoFS/f525Xu5kLLsp8ZrsW7BoBw1OHInQwgnzdkXr2TpdLFDN5uq+Yff+xbQKaSwasEp/c7lDZHJiT+66g7+NsK+uc+rXY8X8JPysc2QwWvHVPR4+axK6UFJEkreCkDK1K1FH5e7qsAnbsav5SX+dfcBtSxxGd9ZQze8lVuIuvnSI8/HmaPBVyWbws5/0EYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02OILc88f5NYejsM3snffQxxTYzeLrpQ54tGbAlvR2Q=;
 b=umU9F8zh2ZJXHfAJc1ajiMs9YqkNhbDecYiQufS34YHuOto0Iudl63+AyYgzmrJamj/XK5RsJgYgT6cloawmsXIVjaqD1Q3xr0dfzNV71Ykt1IDw1zJRbvi6Iy3EwkqzuUeY0H5knDgEKLZOxXj1IGYECApuLkqrrhz7GQHGYbMjDC1GYD4CUR/pVsxkhVosP8h29260hjFshwjJ/yUi5twxhr8xXqrOAkVtgoyzcN3Mr9kyVhPHzM1uSmVVyFuUflTTZWCcJqBcS/zlZ2X9kFfSHliNuDZj6+0VrOOcY4ZL+8WeAhJxZadCC3s6Jd3mqiyCztHAhgvN/gO0RXWrVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02OILc88f5NYejsM3snffQxxTYzeLrpQ54tGbAlvR2Q=;
 b=N2xBDLtbCitjBKB9wiDR/WUsHJ4yg4FBmmSeAklsPIv3BcU7AUJ1FouNCHP/OfqGTnh2teoEir9U/nzXE4tvozJduQYQN4qqMiEtX5QsnKIc10UUa0jZ4IuRbNJlTqYTfKZcYjnZmiYXkNrG8of83/sm/0DSjfDZsWqW53+rlfCrX4KmWbIGkbaiOxoITt+R5lKODlTsfRH92GfdyVkyvwqaKzhCCtJoUPfd433XB1wBgyG6KRHzFy1sdPifN67CceZWaICPe/a4QgGaEYs4RDCePsQlbMxlfCyMqh4AYUvpu1EDGQxPNcIS37kx4YA4wMugpJMn6V2OjmO/NraMCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8593.namprd12.prod.outlook.com (2603:10b6:510:1b1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 11:22:03 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 11:22:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Oct 2025 20:21:59 +0900
Message-Id: <DDOT8EL6RMYA.3SR2XSN6953HA@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH 7/7] nova-core: mm: Add data structures for page table
 management
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-8-joelagnelf@nvidia.com>
In-Reply-To: <20251020185539.49986-8-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP286CA0097.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8593:EE_
X-MS-Office365-Filtering-Correlation-Id: affec945-4465-40f1-cf68-08de115d3963
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0hvb3liUmVBZXgyOEJVbURXZW9hU1M5NTlBUzR3TlJkK2YvR1B2eXVBR2ZU?=
 =?utf-8?B?M1RvVXRQbmo5b2cxOVVRUGxRM2tXQU9WdTU2RitiL0ltU3RrZGFOMUlQYms3?=
 =?utf-8?B?QTlQUzdueFo5R3ZTa2E1MVQ3KzNsM0tGRXZwWXNLZ1pjYVNrcXpOay8rVVl5?=
 =?utf-8?B?WDAzcXM5N1U4Vk4zS3RoNW5TWkFnend0U1orMWw5R0NZWVFPc2wzK0JNNlpa?=
 =?utf-8?B?Q1FWcS8yREpMQml4UjU4WGpyd1Y4UGp2c1BGclpacnRKTzNTKzZsSWEwcDEr?=
 =?utf-8?B?Q2xhdFIvQll3UWUxT2dLUHdsQXo1RFlsbFpqSm5XcUdIZ2J3Q1FSTU5yeUxw?=
 =?utf-8?B?ek1lcXhOWm1Hd1hvVEQ0dHpxVmRMbytYWHVzN2FUTzNONDN2MVhUc3FWVEN1?=
 =?utf-8?B?SC80akg4azdSVURoQ2JldjEvYi9hRTJ3Z1Zyc3NIWmxNeGNnS3hhNjlrSWxz?=
 =?utf-8?B?T2pSVjNIQzRmYWJOaWRLMU1YdTBSdDlGNGk3amZFN3hHRDJaY0JVZlREa090?=
 =?utf-8?B?U3A1QW84R3BacDdDalhpNTE4NEhzaUZKenZBREthL3N4cGhZeklxQnlWcUJl?=
 =?utf-8?B?cEFXejA5cnBXT2dxQWxNM3FRNVhEdmQrSzd4bkpubHFVWEZTcWhRYWZhRXFp?=
 =?utf-8?B?ejZrMnlYYmpodHliV2tnbnVOKzJVWldXYStZcE9oMHA5UklxcEJnNjdBNEgz?=
 =?utf-8?B?ekZzd3pjODNHSFdLT3FjK3IwSlQ3aTUvMVVPTEJYaWxGaDhKNHk5c3B4UzNj?=
 =?utf-8?B?dFBqdnRIbEd5Sk1QODFpVmFDNVlMQnBDUUVEOXJFVkgzT0ZSM3RlRHMxL3lv?=
 =?utf-8?B?VUNHNWJKTStNcDJqQ1BtM1ZKWmpWK3ZLRjhHbnRCeXROVzM2ZUtiQy9LLzhH?=
 =?utf-8?B?U09wR05TNHpxQklmMmttV0JhYThqa3Bybms0bG9ZZllwZ25od0dhbm1zZVJk?=
 =?utf-8?B?YUdZS0pTaXhCK1F6VmpvUGlqOFpZeFFCcWo3K3NUTmJPaTZad1FBMVZ5cG01?=
 =?utf-8?B?M3JHOVU5UGFDOUNhMGg1azM5RkJEQWxXYmtULy9YZ2pXVkk0bTZWVkxsUGs3?=
 =?utf-8?B?YlBrWVBuQ0RGWmcvZGVweDFNcHowYW1CRU9xekV4bW0yMkZqejAwTHVqOC9M?=
 =?utf-8?B?ZWVCK0pKYlpOUndYUXY3by9rRXk4d0RiY3lWN0lkdU5uUmRKT2IxbmxDeEVF?=
 =?utf-8?B?MDNVeDB4cFBMZytJMFNVcHV4cThSRXZsM21rN29ZZlVray9jM1ZVcmVOTDM3?=
 =?utf-8?B?MjBLbWNGZ0FsS0g5U0JoMURCVnh1ZlI2MzVJRDBmVlZXOSt0QjBhNFZjbzU4?=
 =?utf-8?B?TnhTSlNHZnI1WUdBMndxK0hmRndkMDdwY1NNcjZwdTA2cXdNQkkrc3MwK0dM?=
 =?utf-8?B?MUJSTkVvMkQxdVYyYjllZlJnYnBxSGc4WnRlRlRhdWoycHdFVGp5QUJBamZO?=
 =?utf-8?B?SUFuS0FnNVMveHRJT2VPaUg5MHdBT1Y3RHZGWkFCakVza0lvRmNya2VlVllj?=
 =?utf-8?B?OEsxY2hlZUxiUjlZd2VRZkd1Z3NLLzhQZUFTRUdBcDJDVzRWMVpudjNaOVhT?=
 =?utf-8?B?OXgwaTNIeUt2RkdjMllPTVN4c2VkSmphdU5ZY3h4c2xlSElwOEpEdklQT2VY?=
 =?utf-8?B?SStvTFlaQ3doaFVWaTVrbFBDUytOd2xLMFBUM1FmZk1WQjk1ZjdyUjBLNHNJ?=
 =?utf-8?B?bXZGR1kveFVrZVd0dkVHM3FPYXNmbDBzcXJtR3FoS1AwRXhpT3hkR2lVRTc4?=
 =?utf-8?B?WG5OMG9LZFJiQ0pqTkZHTlF4Q3hhbVhwTytPcVlhbExmYnVwMnVNcHJISmVK?=
 =?utf-8?B?bUh3cUZKeUdIUG8yTWpXNlZldXF2bERQUUQ2M3BHeVpjSUFmSTFuZ1hua2FF?=
 =?utf-8?B?K2FwSUt3VVJObWNvOEZ4amlVWHlzMjF1UzdCZUhIWTNSeitXcy9rTFZyZG1L?=
 =?utf-8?Q?EbLCGCqDr/pfrb+cqDr6bzHNyVEISO8q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXBiZEJlYk1GYkZlRjFKejVJeFk1QXl5Kzk3L2Vobkt6RWd2ZE45RVUrZmhD?=
 =?utf-8?B?OXhyZjVJTGJlaGppb2FiaUxwYnRqdzk1dXNrMjJjcDVBNHJHWkw1bjZqa2pp?=
 =?utf-8?B?RzRncmI1Q2NoTHFqU0hVbGxlTE00NFZUaldBTWJIWStsMk1lc0tybmdYTE5N?=
 =?utf-8?B?WHJmWHBQVzBUMlZ2UUZKYVdMTlpEWE8ydURpMlJLejExMTJkclZZRlBsbkl4?=
 =?utf-8?B?a3lZT1VXbGNHejg1YXpRQU5nWEdCRDZDVmtjcm14QmpxRms1bitnbzlWYTJD?=
 =?utf-8?B?L2pWeVBoVVNCd2ZZNnJIR3RUdXBnUGVQNEJxUlRqUFpvRzRLelNlZGR3aUJn?=
 =?utf-8?B?ZndyYllWQjV4TTJlWlB4Tk1ZT0NBMDYyYndSclh0N2E2c1NIRFVxTWpnTkN3?=
 =?utf-8?B?Um83WHBzalFFRGpXYnhrcjNpbThpOUpFWEdHV092S1VSb1VEdmJ5WEI1Tlk5?=
 =?utf-8?B?bUltUlFxWWE0NDhTeVBiaWdLMENIWTZiOFdNdnZ6S3hpVWo2bVF0MWFqc2g3?=
 =?utf-8?B?L2w5dFU4bFkxb1RoTDZuMFhPZU5RYWIwVnJBaFE4NVltQ0ozNVNFRE1qNUVo?=
 =?utf-8?B?NndpOFg2anlodUJyMVZaR1YrSDlOWEFWNHo0U1VJVnI5NXkxdzFIM0ZYOWdV?=
 =?utf-8?B?dzhrRlB0bjZ1UUtabU1mSzQvWlRZbXdjaWRxN3V2YnJsS3FMSE01TGpsRk15?=
 =?utf-8?B?V1hXS2JoR2hjc29MZGxUYW5rUUc1TmtIQ3NVR1ZpWTZLQ0JYNHA5UklXZC9r?=
 =?utf-8?B?akpqUkpVemNQWXAvZVFQQlZac2pXVFgvcmdGK2pnZVliU3pWYlJ5VEk4Y1ds?=
 =?utf-8?B?RmlrODZrZHFWbWo2ZUVPT3l5V2tKUGtaVDZ6c0p4WFhZd1dUT21WZTdpUm1o?=
 =?utf-8?B?blIwSVF1NVRmdFVwMi9jdFB2cHhDUkFYUjBGNnkvc3NTQnhvL25GY1VOaDI5?=
 =?utf-8?B?VDhTTVQ2ZlMrZm1HME1sZzN6Uy8zUXRacG53dW9ZVE9WZEcvS1UxbFZIVnd6?=
 =?utf-8?B?N1FaYkFpbExHSkZ4ZVpnbnE3ZUFvTysvbWM3RUpXT0NpdW5vc3BCNzBNQk5D?=
 =?utf-8?B?RytDTVAzOEtsZ0V3ZGdWaUdJVFF1bW1iN05iaWlHcmJtSitQRWpxMWZRMTBB?=
 =?utf-8?B?S3c3cjRpemtxcmcrak5iZXdNT0dkRG5keEFPT01aU0l2OEhkck5CRmR5b0VI?=
 =?utf-8?B?c2RlMWc4REtUZG1YdkRLL3NuVFZDdW0xbzBabEw3alN1SkdncjZDQXZiZk42?=
 =?utf-8?B?NUNGWHQzbUdRVlhWLy9SaUpuU3ROUGZyUnVPOGNIeS8yU2U0aStPOVlsU0RD?=
 =?utf-8?B?dnJPWWRnY1gxWVR1N3ByQXdobDRoSTFLWWZHc242aWdybFdLMThHNWJPcHZZ?=
 =?utf-8?B?RGhxRmZOajZyd0VSZ3BRL01LVHljeHIvWXcyek5YZGhHS1lXNThGOStscWEr?=
 =?utf-8?B?NTAxS05iT3FlbXlpazdYYVFaRlR3YjR6S2UyWEpzbjFRZE94alJmT0dqUGhv?=
 =?utf-8?B?Q3VyM0h2V0F2RHM3MWZudUt5THJRZ1kzU2hNS1ROZWFoRkRsOEZ4anVYRUNB?=
 =?utf-8?B?ZHluS2FZUXNsb3JhclhoRlB4Sk9kOHo4YU5nbnFnZEYyM0JzUFBrUW5LM0VD?=
 =?utf-8?B?S2d4RjlDM1M4RExsdXEzUTluYy8wNE9OYXpxaFl0TjlPZkY1SVVGdzlmaXZJ?=
 =?utf-8?B?MGxZcGpWdHRQYUNFNEtBTzNyQTh0Zzk5Y3ZtZm0rcEx5Y1FvZ2NFL2Y3STh0?=
 =?utf-8?B?dFJYWnNSYi9KU1p4MzR2bVBEK25yZEoxUmhMWXVkMXUwcVN6OVpXci9ZR1hv?=
 =?utf-8?B?VnNYR3NXVWZocVdna05HRUlYaUhkZThzc1A2aUtieVg5MW0yTEEraEZteGtU?=
 =?utf-8?B?ZUJMRnBhdm9ZZ1V3dk1MdEFOVXRlNGMvR2l4bXZzNHppZFNIZDdyVGtCdXYy?=
 =?utf-8?B?MWdaYVRGNnhQWHFxUmJMM2tlVGNKa1RWUklBWW5wSXRiSzFOWmFPblJsL0ZX?=
 =?utf-8?B?RFVQNlM1T0IxaCtiWnI4b1hMWnZxak5YUjlCOFNza0VWQ1RTeEJHU3VvYmhF?=
 =?utf-8?B?bWFoOG9CemJmWm9oZEVnOHNWWnM4bHZ2cjl4ZEUvWFdaRXdtbEtQMlhVL3Fu?=
 =?utf-8?B?Z2poaDdTQ0o0c3hqSDVnM1c5dHB3bXN6NktJRFdyYXJQT0tNUHZFb1dOY0J6?=
 =?utf-8?Q?xgXii09cpc4RenQGuJ1WP+xGlHhykzsdGvGGCzXrK0WK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: affec945-4465-40f1-cf68-08de115d3963
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 11:22:02.9426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m6mkZEPZwKZLyOJiKVTjCIIZlUsPL2q8AAhZqaK2qxWmeOr9oGk47JBBGujJjf/1XxZtLjMcWP6OllCCdIJ5Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8593
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

On Tue Oct 21, 2025 at 3:55 AM JST, Joel Fernandes wrote:
<snip>
> +#![expect(dead_code)]
> +
> +/// Memory size constants
> +pub(crate) const KB: usize =3D 1024;
> +pub(crate) const MB: usize =3D KB * 1024;

You can use `kernel::types::SZ_1K` and `SZ_1M` instead.

> +
> +/// Page size: 4 KiB
> +pub(crate) const PAGE_SIZE: usize =3D 4 * KB;

SZ_4K exists as well. :)

