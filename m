Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F7AB35287
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 06:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B0810E375;
	Tue, 26 Aug 2025 04:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UeP1jhGm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B284D10E375;
 Tue, 26 Aug 2025 04:08:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l54PqMv6tHFA85TRPSTwJP6QRZDe5e/dopLv/F0ky0ksvlx0i7pYWRqpvVUIhk53pkEUASUJDwHKY9h6uV9PBZNJ9ucc84Eq0o/86zv7Kamyn1Zn2PtL5GlBZYTRHI3i87zfP9YReFiDzezL4/NKSd8a7yHc6QJPvGOBxnOlAlBXymYl9ZD+6uV3AovZ5zs344YPzYKeBtx4N7Urqhf8eQu3g8Y++Qlp1b7Nw9JGdYIVW6B85WWSlVbIf7XnfMRnRoIWcMnuBSs9n4lOcoskWIag3WSr1+xGBGG7GjIt53e5qk3PF28YmcMfMv2jXyJC9LXCesrD8DWnYU11WaCqdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BovK3s9OTwqgRqrItLIpjX2kly4+nlhM29TsaPm5hZU=;
 b=OsaVOwHMiD27O8t5WnfCrEPv+AGrbA/omjnN56C5GNHvAqOGQCGXg+05fYWQi9U1wK8srsSmMMCnN3IeZJy+l6f6pTmiFq8EyKcGK3XcqqtILM3azt3NAtvlVI2KGkf5NczPPFqXDm/DBh3ENe74TesN9Z49REQemG5pfGcD0qSrrvsaw2UmR/o95jj7OgmnPEjIvtFnAln6I4KESZjwr3/O1fQFWKcxgG9zGBk+8zvIAVgoV/pz1qA8yRRsFylhM6n24A+rFCC/ok/fGE2P7KhXkqMVJq7LViLhG3O7uFE2AJ1fmjqXdQRvR/6r9TcOvRe0a9YyHuea3iIrJjtUcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BovK3s9OTwqgRqrItLIpjX2kly4+nlhM29TsaPm5hZU=;
 b=UeP1jhGm/PwufKvzw0WdI185ECDZk5Dl58nfpvPq8j4flcDi3pymAj4UDKvMYXJduYZ+0V/JsCPbXfNt3amrdgtI4USOQSP3UngSNe8hfQ9VzZkeSjAwBeVyKRzR9kMLgrWCxC1dvAEfiAR6rc8okKxV6+tLxV9YzeQW0xTYAnw6DX+uQfSjBI6PK++ePgOX5xfrEL59YLJfxAvEeGje3FFjPCHSg/rg/gt5ugo+66KAla70nztkeNSwznFsp70OpY05n9t89xG7lk4iVfJRR7ZnVBp9pvft8Ef/51xHO5RCkHRW4djurubhNxEb5tS5Earj+jUdXpKVyagewGr5gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7925.namprd12.prod.outlook.com (2603:10b6:8:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 04:08:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 04:08:02 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 26 Aug 2025 13:07:40 +0900
Subject: [PATCH v2 4/8] gpu: nova-core: firmware: process the GSP
 bootloader
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-nova_firmware-v2-4-93566252fe3a@nvidia.com>
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
In-Reply-To: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0075.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ff66d0d-47cb-4f3b-ebb7-08dde45626ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGtvenhsS2lpck9YODZCMzBRQktlc1NVYnJ2WGVJL1pza3JONU5oVXlUdG5Z?=
 =?utf-8?B?TnRKay9UWkF5MUNLMnZTTnI2MlpUWkpCeVZhWEl6VkxoUkpUcFhZbWc2SnpC?=
 =?utf-8?B?TnIzSEljdlFZOUhRWXR1YkUxdzlKWkFOaktKRGttNjdUdStudTlldisvaDZz?=
 =?utf-8?B?Zy81OVk4Z0EraHdHM1hKWWppRmtGUS9RNlE1aFZhOC9ZN0xyNWc2K2ErbTA2?=
 =?utf-8?B?TFFjUjRhdklva08zWDZFNjlFdHNoRWluSzk4aWNIdzMvcmhleWZDbmF5ZWEw?=
 =?utf-8?B?eHBkdFVkYnZPOXIzazlENlA4MFpVVWUvbXRxdGV6OTNPVXk4U1pTTHVsRVhu?=
 =?utf-8?B?TG5pSm9teTdlY2RSdVpLTm9jRlQyRFdPVHI2SFdKNHZWZ0hFcndpcFZKR3Q0?=
 =?utf-8?B?SFh6ZzM5a3poOWFXa0pxSC9EaFEzZ2ZZU0VvbWtZMXhNQ2JuVERVTUV5T0lQ?=
 =?utf-8?B?QkJienBLNFY0TWsrUFVzM0hTeGcrZDU0RkpMTnR3dEhXeDRYTjMvL2hVTXhi?=
 =?utf-8?B?ZWY2Q0lMY2p2bXRnL2k5R0MvYUdMV1BoTzEySkU1SlBoY2xJQXRTU1BUTmlm?=
 =?utf-8?B?clVXZlR1SWtjQWFRaStYdXg0ekppNWFBWHRlN2tubUZobDF2aEN1OXkzcVBT?=
 =?utf-8?B?c1E1N2lVdTkwemRtV3Ewbm4zNkJYZXJJazZvbHFOay92dGxzbjV3bE5FSmxm?=
 =?utf-8?B?WmwyQmZKdXpDekdqcXFONWJHd05LYzBqVm1iMnA1STZkVTV2OEJjMTB1WE1k?=
 =?utf-8?B?OUlVd1M3MjBHZGl6Z20yZ2l4ZEFJQk5GUFZ1RUc2cU5CQjJhK3o1WnVYWG1w?=
 =?utf-8?B?alZpWkxKdUt2c08rRm1tajNUTFZkZjh6cWRLVmU2NElUbHBUYkt0ejVrakRP?=
 =?utf-8?B?cDRMVE5sbCtiaWs1VUt5ejZkS2dPYStFN3VpZjdUaGdBWFlrRFJRbHh5ZzhB?=
 =?utf-8?B?VjlGMko1bmhBYlJlbStabUhQYzltc2tmZU1sZDV4T0dxZk82bHRjNU4wSmE3?=
 =?utf-8?B?TFZtNkhnRkJReDRuTkl6S3VsYXZ1QWpVNUhNblJIL1duL3dXY1JDMTUwUDBV?=
 =?utf-8?B?NC94RWNxNlVUd0xwZnptbjRqWjdPRlJ5R01oY3Y3bWNhUlpOMWtNTnZ5aXM5?=
 =?utf-8?B?Y1JkWCsrcE5EQU1lY1o5RHlITHIxazdtSnFKVDJYc0dETVJMeHlaOWRrc2ZK?=
 =?utf-8?B?T1hCVVloaVFHcTlGd1F5cVpzWkxMVHhmWHhKK0thZkF3ZlZ5Ti9Ob3dYVjlV?=
 =?utf-8?B?MFcrYVdGR0NLMDNFMHpzdzBSU3RtU1N2L0ZOakhpQXFVR01VVjk2U2hIL1ln?=
 =?utf-8?B?TDBZdURxa0MxSi9XblIwNHR4TnU5N3RzNllxTndJamw4TDZya0RYR29DZk1Y?=
 =?utf-8?B?aTRuWnFSMnc3NlcrODJ0UW95RzdsZVFkSXdXOEYxdUo3ZXIzdWMzSytBU3la?=
 =?utf-8?B?RGFwcXFLQ204aTNWcm9JOGNER214UlBsWXlUaC9xNVkxc2gwZnczT2lmZmpP?=
 =?utf-8?B?ZzNBNVJtR2ZTSXp4dFREV0g1MWt0NlljdlpUU3M1TW15S2RCUGEwSDNJdEhn?=
 =?utf-8?B?YjM0VHZwOVZ6YWZFb0QzT3RvYUNQVHdTRFRNWGxLeEtvdDdoWVlRRjhwZzJs?=
 =?utf-8?B?c1VOSWY2VFFHNXcrMllHZzMya0tmckl1WlFwRWNYZFlTSEd4d0ZrdWV0QjFr?=
 =?utf-8?B?UDhPaFdaWkMvbXJBL0dndk4ybEtJejhhQU5jMVNKc1ZTWTJWdE04SnREUlJD?=
 =?utf-8?B?aHBUdnFyZlBxQ0VnUlVxWVpNelFybjdVWmVRTWVpeWxicmw0VFBTTk5UU1B3?=
 =?utf-8?B?ZWlmalF4ankrSTFQbXhxVlYxWFFRMEI1UVh6eW5KbWVHNVZSMFJ0UVZ3Q0hn?=
 =?utf-8?B?TXRFQlA1NzlJcG94M0I4NlBvY3FNcnByNGpJMG44N253ZWpKWGp1OFhRUlhY?=
 =?utf-8?B?aWQ3ZWxtR3prNlpWR2RyVEY0S21nUy9aaWd4dUJhWGNsM01SM1BscmZDUVU0?=
 =?utf-8?B?dFJtYTgxa0xBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NENEOCtZb29qUlNXTXJEbTREblhHQjNNaE4wWHE4R3NySFN1L1BxTXhaWUs0?=
 =?utf-8?B?M01DaFFpRGdvVVFSQWpUTnFheG9QTkc3RlNxcVQzYlM5eURrR1ZKUE1yb0tH?=
 =?utf-8?B?YlBJc295dEdmb3NPUldsc1YzSmR0eXlaTi9IMGJhejhvbnh3VWNQYUxVZTFK?=
 =?utf-8?B?SDBRaU8zNnFSdVRJVUlQdXVOb0xXTHVxWGJHREhpYnNGK09Zbi80MEpScmFD?=
 =?utf-8?B?cXJLWmlHOGNnSEh6YkQrQkJkenNiRFJsWm5kRldmOW95VGl4b0dtbExBWjhE?=
 =?utf-8?B?ajNySjhuMFRlTk8wVUt5SDNvVW1VUEc3elpqZTVRaVFyUW5kc0h1cHQwUmVj?=
 =?utf-8?B?c1NPdW1RWUgvM25rRUlYVTlTSTNVY2VabDRqSitMbTVEYTdqbkVFMEtxa0k4?=
 =?utf-8?B?Mmc3aWhxRWZhaitTMklwdVViOFNvUFZrRHdaV2JzdzhJWU1xN3I5VmRwdWxU?=
 =?utf-8?B?ODdSTUF3ZVd4OE5HcjA0SmhFVzZOMDdvNHAwbHpmdUpyYXhQZ09qYmg1dEJt?=
 =?utf-8?B?TllJZElCd3lCeFJLRnNtN1FLRnJmZWl1a2VwWWhxalNSTVhSTWQrWTU1dGhh?=
 =?utf-8?B?TXBzSlgzY1FISkFkR2JhbjIwaWluUC9RTEZ2UWdrVlM2SGhYZnQ5Y2d3ZGJu?=
 =?utf-8?B?YjkrVXcyMnZsSGZLMzB6ajNseTBEbTVWSXhlOThXcGt3ZVR3WHhsdkNnSFZl?=
 =?utf-8?B?eE1TdE5HU0oxdU9vT3dMdzF5UG00ZWJHMUZHeU9mVFQzQUxicmREd1FEUkw3?=
 =?utf-8?B?NDV4Y0p2R0xoSnlqQmdvYnBPOW9GL0o0bkkrbVNua0YzODRralR0cGtCYkEw?=
 =?utf-8?B?Z1BkYUdWdEhDYlNQakxiYnhXbkhXaElGR0NBVGVweDVHM0h2R3poV0Joa3dn?=
 =?utf-8?B?ekQ5djl3a0VvZEluVCtKZ1NHSDVsYTI0cHl0SGY1dEtMV2dWK3RzaVozbWEz?=
 =?utf-8?B?U21QRU1NN1l6NnBVWVJrdjdrY0RYT2ZwdGtMTXhQMHZoOHIwMkpkK3hSRmU2?=
 =?utf-8?B?aTFHVFZSVVB1dFZkckIrVlo4UU5DUTJaSGFLVTF1S1hwVk1Idm8xT2ZvMVNt?=
 =?utf-8?B?N3ByaVNmb0c0djROUlZSN0JqdHJJUjlnZXY2Um04ZnlYZUNjazNrVWVncHAy?=
 =?utf-8?B?NmtkTllvaEdjWmJlZGNSTUp6dUlzSGc5cmNIdFpZQmJabHRkd1FsM3BIYlpH?=
 =?utf-8?B?OUI5U3oxMkNsMGdrTEFvaTFlTHg3OStHMG1RY1dNSmFWejR3NFZ0Sk9pTVd6?=
 =?utf-8?B?QkxoTkJtWktqY1RpYW9mYmRuRDV1UUZTRE5aWmN6bFkrOUovVkwrVzNSQ05q?=
 =?utf-8?B?ajBSOFdDTzZHd0R3OEExNHJZNXlzaE1abWw4K2NJVExxRkVhNmdzdlRxRnBa?=
 =?utf-8?B?NWswOEZETm1Qc2NkS2JSbTdDNkhpKzZYZjdVM28vZ2VPdUVpWWlZbWhRL0Zy?=
 =?utf-8?B?V0p0RlVTMGQyem1wNTUrSEJiTHpMVmRJZWoxUmlYcGh6Q2JBVzhWeTdTTnM3?=
 =?utf-8?B?NmxkSnRodGUxd2NmTnA5WjVpZXZvRElITnR5eUlEZldMT1FzQkpaWlVoZm5j?=
 =?utf-8?B?Kzk3dXAzMTRESHhQMXI5MXZ5aFZaOFlKTE83T2dnZHZSYlhNN0ppSUV5Y0d6?=
 =?utf-8?B?eE9JeGdUZWlrR0JUL3BsSkg0N0MvcXUzVVM4Uy9jRWFldjJpN0ZnbE1zNnZj?=
 =?utf-8?B?OFhRN2tPKytiSG9YRmlrQitCQ1NJSmRvWUJTK0pkbmNoTU95ZXhJVkRCZTRk?=
 =?utf-8?B?NkRWTkVMeEpBYjdScERtS3hjRmpyRDdqa2tFSFJCOGs3NnZJRkc0ZHhYV0lE?=
 =?utf-8?B?SWYzd2pnYlFsek1FWHhjTUkzaWFoQ3A2c0FTMHI2NFQxODZjVXBVdWt4TjUw?=
 =?utf-8?B?YWV5Y0JNd3A5N1Rka1BCVENCMVJoZVFFVkRSb0lWclhWWkNkVjMxNEY0MTlx?=
 =?utf-8?B?eXhqa1JnblIybjRCQzFEYjhYbVErQnBUbTdhdCtMN1ozL0RTMS9kdU51Q3lP?=
 =?utf-8?B?Yk9KNlNaeWxXTjNQVG9RWjFjVE5LN1ozT1JaSWRsZHRrT2xIMStIRVh5ZjNm?=
 =?utf-8?B?Nklhc3RrS2hTb1E4TVYwNDFXOGNXYVRhWVU2dlZ4OGo5T2l5RWExRXJMeThm?=
 =?utf-8?B?QXc3SVhBOWo1VWpWTEVZRG9NTTVjbjJLL2Nsd1Rjc2RMU2g5NWtpUGhKanFK?=
 =?utf-8?Q?TUDV44gBKHkD2I67AtkDF0y3TMJQP61PgV8Mq4U4q+Rc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff66d0d-47cb-4f3b-ebb7-08dde45626ae
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 04:08:02.5622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHg648wBI9njWxFXfMCGQwxUKr4U38dIoFUsS2OYuOxtJvTCEERnE9n1ljoBS1YrVv1EiG/m2lAq8gMF34OqfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7925
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

The GSP bootloader is a small RISC-V firmware that is loaded by Booter
onto the GSP core and is in charge of loading, validating, and starting
the actual GSP firmware.

It is a regular binary firmware file containing a specific header.
Create a type holding the DMA-mapped firmware as well as useful
information extracted from the header, and hook it into our firmware
structure for later use.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs       |  7 ++-
 drivers/gpu/nova-core/firmware/riscv.rs | 89 +++++++++++++++++++++++++++++++++
 2 files changed, 94 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index be190af1e11aec26c18c85324a185d135a16eabe..9bee0e0a0ab99d10be7e56d366970fdf4c813fc4 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -12,6 +12,7 @@
 use kernel::prelude::*;
 use kernel::str::CString;
 use kernel::transmute::FromBytes;
+use riscv::RiscvFirmware;
 
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
@@ -22,6 +23,7 @@
 
 pub(crate) mod booter;
 pub(crate) mod fwsec;
+pub(crate) mod riscv;
 
 pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
 
@@ -32,7 +34,8 @@ pub(crate) struct Firmware {
     booter_loader: BooterFirmware,
     /// Runs on the sec2 falcon engine to stop and unload a running GSP firmware.
     booter_unloader: BooterFirmware,
-    bootloader: firmware::Firmware,
+    /// GSP bootloader, verifies the GSP firmware before loading and running it.
+    gsp_bootloader: RiscvFirmware,
     gsp: firmware::Firmware,
 }
 
@@ -58,7 +61,7 @@ pub(crate) fn new(
                 .and_then(|fw| BooterFirmware::new(dev, &fw, sec2, bar))?,
             booter_unloader: request("booter_unload")
                 .and_then(|fw| BooterFirmware::new(dev, &fw, sec2, bar))?,
-            bootloader: request("bootloader")?,
+            gsp_bootloader: request("bootloader").and_then(|fw| RiscvFirmware::new(dev, &fw))?,
             gsp: request("gsp")?,
         })
     }
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
new file mode 100644
index 0000000000000000000000000000000000000000..926883230f2fe4e3327713e28b7fae31ebee60bb
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Support for firmware binaries designed to run on a RISC-V cores. Such firmwares have a
+//! dedicated header.
+
+use kernel::device;
+use kernel::firmware::Firmware;
+use kernel::prelude::*;
+use kernel::transmute::FromBytes;
+
+use crate::dma::DmaObject;
+use crate::firmware::BinFirmware;
+
+/// Descriptor for microcode running on a RISC-V core.
+#[repr(C)]
+#[derive(Debug)]
+struct RmRiscvUCodeDesc {
+    version: u32,
+    bootloader_offset: u32,
+    bootloader_size: u32,
+    bootloader_param_offset: u32,
+    bootloader_param_size: u32,
+    riscv_elf_offset: u32,
+    riscv_elf_size: u32,
+    app_version: u32,
+    manifest_offset: u32,
+    manifest_size: u32,
+    monitor_data_offset: u32,
+    monitor_data_size: u32,
+    monitor_code_offset: u32,
+    monitor_code_size: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for RmRiscvUCodeDesc {}
+
+impl RmRiscvUCodeDesc {
+    /// Interprets the header of `bin_fw` as a [`RmRiscvUCodeDesc`] and returns it.
+    ///
+    /// Fails if the header pointed at by `bin_fw` is not within the bounds of the firmware image.
+    fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
+        let offset = bin_fw.hdr.header_offset as usize;
+
+        bin_fw
+            .fw
+            .get(offset..offset + size_of::<Self>())
+            .and_then(Self::from_bytes_copy)
+            .ok_or(EINVAL)
+    }
+}
+
+/// A parsed firmware for a RISC-V core, ready to be loaded and run.
+#[expect(unused)]
+pub(crate) struct RiscvFirmware {
+    /// Offset at which the code starts in the firmware image.
+    code_offset: u32,
+    /// Offset at which the data starts in the firmware image.
+    data_offset: u32,
+    /// Offset at which the manifest starts in the firmware image.
+    manifest_offset: u32,
+    /// Application version.
+    app_version: u32,
+    /// Device-mapped firmware image.
+    ucode: DmaObject,
+}
+
+impl RiscvFirmware {
+    // Parses the RISC-V firmware image contained in `fw`.
+    pub(crate) fn new(dev: &device::Device<device::Bound>, fw: &Firmware) -> Result<Self> {
+        let bin_fw = BinFirmware::new(fw)?;
+
+        let riscv_desc = RmRiscvUCodeDesc::new(&bin_fw)?;
+
+        let ucode = {
+            let start = bin_fw.hdr.data_offset as usize;
+            let len = bin_fw.hdr.data_size as usize;
+
+            DmaObject::from_data(dev, fw.data().get(start..start + len).ok_or(EINVAL)?)?
+        };
+
+        Ok(Self {
+            ucode,
+            code_offset: riscv_desc.monitor_code_offset,
+            data_offset: riscv_desc.monitor_data_offset,
+            manifest_offset: riscv_desc.manifest_offset,
+            app_version: riscv_desc.app_version,
+        })
+    }
+}

-- 
2.50.1

