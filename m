Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 464A6A6A755
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 14:39:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730BF10E610;
	Thu, 20 Mar 2025 13:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IVWoCsAK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06E710E610;
 Thu, 20 Mar 2025 13:39:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIy2cMGEg7YNacjhbrLZRYB+Y0p/fVfEO6gyDIrOzPywRiZed5dlJQqjjYT/q1YwkuBPs0SXpi61EvhzoYkGWYFgWiWEvGAMuaU9IaI9rKuNHKQfS82VheSy1MyPi7DDE7prgJ37QQpWVQ2WhEl7ikmKIaYaC5tB8ZLldJQ1Ud1E4xZQckYdvs9PCNZH4e6Jy/sIXIR0beC/YPY7mKOpU/YCcS2MXd+NAy+5FRNyri8tZBgQK0fY5Ln9KkXMxtPXJQ4mF51xsw2xlMBiJofGkRgrckvmz82GlpOo7q/N6qSayHGm4/ItWI3PiyYw992FGPHcS6T3ZqVAwQlLXI+xqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNKljv7IAulyzuCI5l6SulKqrSN+En25SZ/NLxLZec4=;
 b=OJaj7q6I14qC7vrQf/tKOQ5HklqSqH6XlYYhhOTjQt9Low9rO5zNwfq6qGKaxqfMcBAg9/Gj7GgEFdW8jRPOSL/+dxuwEqqTz0dk+IzxpoWQ3+jVe7Lb6g5WJPI14UJVKnkntIMDm4E1K2qVDzrvx+3mbAeMg7EufwAAavHdLdTiUdgnx1elE+YnpOV0FAg+bYRZVGq3SGY6CO/f3CAYTsWT9xjzc35OaGRJMqxCGdJiFQrciDYGzlf99TlVZS/T9KLWfs1EIiU016Z5x+8+UhcsuFD6arfaC41ewcL63eAGqsZ21dgN99N/wjq+DtjMhfiBBJ5dCE+qbeQaEuPr9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNKljv7IAulyzuCI5l6SulKqrSN+En25SZ/NLxLZec4=;
 b=IVWoCsAKV+ejHsYmQ+IfShlIAcKLDlDcnnjeqvsYtwclqw0ghglEYZrcDZNJWXhxvmtpTtJ3Ks1ydZTRHlphavtjCZ2sqteZTbhH3Wf2FIbxWuQn2sXGEVYKh/DsqP0jFEe2PMF7+AHj5nqCRoG5WHMFycc3DJRfs39R1SYBd1UyM8byMTVQ5R7PrIvBwtRTxss4NErxy5b/Znh1csRRFa6R89iVPurhfCOA7OThXuLbEKdQAoYKnCHlXjH9p3rGKE2Qcfmj2jqh/lMeGIhS3OpvZC50BX2LI8z9JKKGLRRHkDPeIHInjT6TF+9n/OpQA5gIPN/upUxJ0kVzp37ngA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6409.namprd12.prod.outlook.com (2603:10b6:208:38b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Thu, 20 Mar
 2025 13:39:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 13:39:35 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 20 Mar 2025 22:39:09 +0900
Subject: [PATCH RFC v3 1/7] rust: add useful ops for u64
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250320-nova_timer-v3-1-79aa2ad25a79@nvidia.com>
References: <20250320-nova_timer-v3-0-79aa2ad25a79@nvidia.com>
In-Reply-To: <20250320-nova_timer-v3-0-79aa2ad25a79@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0181.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: 739001d7-7892-4597-49b2-08dd67b4a75f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDQyR21kTVB1dnBKOW5DNHZ3ajhSVmd5c0hkelJvVHJaVTB2SnhnWjRLOWxv?=
 =?utf-8?B?Y1phVG9WcFdvaUNnMytzUkdmaHNLSzAxMmxtbFlDSWJSNHExN1ExTys2REFn?=
 =?utf-8?B?UXVObkluajdiVFExdjdMUTZXSnZxeFRDYlI5UUZKSHE5RTFWTWpHM1hTUnQv?=
 =?utf-8?B?QWo5ayt1T2Yyb0FhRnV5NnIzcjJrY0hHUkVaUFBXSmJBQms2SVptVzNNN3h6?=
 =?utf-8?B?MWRqKzRiRlNBeVlwTEZJcXl0OFZtUEcvczhyRVlBNW9vNFdyWWNmMi9LcDZ4?=
 =?utf-8?B?eFhvZDBmejRCVVZ6REdPbVEvMlVJbXhYR2RicjZjc2xKZ283ZWUyMlYrdWNq?=
 =?utf-8?B?MjlOMHVqMjQrdlRYMlR2Q3JKcVFUenh2VGhWWVJYNEFKTzdyZVpTbDlsRzRt?=
 =?utf-8?B?Q0N1S1dvSGhUWW1tWllYNXFzR1N1S3NqeUo4WHFLZU5vV2Y0VVRpZmxEZnFv?=
 =?utf-8?B?VlZwUFJGSTBuZDJsb2ZqZWxGOHB0WkNnTU5Fd1lzRy9ValNwclBQVzd6Rm82?=
 =?utf-8?B?d0FoRWRRanZyR3JVQ2dYTlVLanlwdkExUlFBR2c2WlVYeXpFSTFtRnptbWJv?=
 =?utf-8?B?K2xPSnJGaTJ5T3diZWR0ZEYweiswb1MvQjVmbE5NR3d5ZTVwaEl0cXZnVEpM?=
 =?utf-8?B?SkZ6dTZMNWR4VmxIYlVnUUJQQkh3VExVNVNBL09RMkZxY3B2ZUFSN0tMdkJB?=
 =?utf-8?B?dFcwcG02UEU3U3RvWk5YaE9oQTVXS216UDRlVzJYTXBVUVlLMEdlaWZ0S2p2?=
 =?utf-8?B?bURVVk4reFhJQlczT2NrWUdsc3k1UlhTSHlyT3VJaFZUS1krbDF1Y3ZsRG8w?=
 =?utf-8?B?bjlyOHlyY2d4aEtZdFlvQlh2eHFJWHFRaGxvYUFaaFUyb1pwdnB1NjFLZEpJ?=
 =?utf-8?B?Qkp3dGtvaFQzTjh4akRoYXVqK0k0SjBXVU5HU01IQmtxNU12VG9zakNaeTNW?=
 =?utf-8?B?aHg3aXFvM0FnS2I1QnNtUWNKbDcxOUZjNjd1QnBBUnQvQnZCbjdOcXFpaXMv?=
 =?utf-8?B?R25nNkFyb0tOSmdiMjMxLzgvczd0VDQyc0pRSVFvc0FCSmRNZTlPZmlwMTdG?=
 =?utf-8?B?VXZqRE5UVHF3QWVPcUJmYm9SQ1ZHYy9acW9YNzlpTHE2dk5Xa2x6K1hSMWc0?=
 =?utf-8?B?WG5QeERKZlYrZXZYQThUMWVkVWRINE9kSjZwNHEzZm9rWXo5VXY3Mks4bHlT?=
 =?utf-8?B?UU0xcjhVTG5oODhGUi9VVXh6TjA5dzhydm1qTklGbnNBc0FoM1NQaThYMlo2?=
 =?utf-8?B?YjNCemlENFFKWUZBU2FDc1pnY3k0QTJ6RmhIS1V5VXZqazFGZUs0L1BRc3Rx?=
 =?utf-8?B?NXVVTXAxRVAvd3FoQzMyeFcxcU8rVy9SRi9pTjNYZmJBeGVhcTBvdDRPN0Fw?=
 =?utf-8?B?Z0d3R09GUGlFeityWCtYN2xqMGFEYTFmMVFEQVRqTzRuYWoyUzF6bFd5dWFa?=
 =?utf-8?B?WUo1K1ZMY1M0QlBUYXZBQTZ0WmZDMlNIM2ZzcmhBN2FFak1BTkJsNTBEbUVE?=
 =?utf-8?B?NURVSkQ5R2p5TFN3d1ZETE5OVU1iRnBnNyswRS9EcTVpaXIyZUlrczV3MTZz?=
 =?utf-8?B?SlpISE9ZZHZkNDVPNm9BOXZNNkt0Uk9hU1JSU0dzSmVRVDdsOXF2eVVtUTVo?=
 =?utf-8?B?OXA5NlNHR2hSS3Q3YVp1UzBSSHBkOTN5NHJUWmd3WjZLRVJ1MEFrUGJvU3ly?=
 =?utf-8?B?NmxhU3RsL0dQQjZjSkR5NW1JNlRzOUtVSkxEVEJVekJxVk84ajNPZWtpNGNk?=
 =?utf-8?B?TTJ4c0dDb3VqNzF3Yk13QkIyMytCdHVJMVFRT3F3UmpTS2xTc0VaL0hGNDBx?=
 =?utf-8?B?SWk4YlZSM2xkcFBDeWszMUsvUFVhdnU0QWFjZU1SY1NkbVpXcFJ1ZEtNQjhO?=
 =?utf-8?B?Q3cxdHNGS3NzNDVPWitmLzdPc3hOWWJxdDROTDlIY0RkUkpBTGhLN1g0NHlL?=
 =?utf-8?Q?6hrajCjrveA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXVPbkRETDFCV2FCUW1ZaEN2blVzN0ZCOEpvWUNKakRHUC9iZ1FHenpjUDkv?=
 =?utf-8?B?SVlDdEhTNTE3akhCWExPNHhpbmUzN0d5TTArMTgzNEMwOXFOK2Uzd3pXMk56?=
 =?utf-8?B?R3hVUURNVnRhWmRmR25uTThER0xUODRlcmJqd05DaEh6VlE1eVRBdnJLYWVu?=
 =?utf-8?B?b2VWd05ncnVKWHF0NmNUUWcvaXZVSmtXdzNjYnBSVnltZGhTTjkvZWlUVEhq?=
 =?utf-8?B?KzlackZtd1FvYlJFWGYxVFJkRkV3YW1xNHQzMHhpY3RSSzhlNzhZbWQrTklx?=
 =?utf-8?B?VE01ZUJPQ0NJUjZJcENzc0d4T2t1a243TzdTL3lBRWVQQ3dRY0dBeVlsL2pY?=
 =?utf-8?B?ZS9Kd1F5ZWZDTTE4V245UHB3Mnphb3FEdHRNRWsycExERXRwd3E0c2lQUlB5?=
 =?utf-8?B?TmxrRFhiRmZLOUtMNHB0QWk5YTdKNGo0RTlseHRrSTZmaGczNnYvS09ZTEhU?=
 =?utf-8?B?MVVCZTN1UWl6dEhUMnBJUTRFc1ppOE9Cb1J3aWdDRTdnUGgwTTRmSS8rTFpt?=
 =?utf-8?B?a0tvTHpKbHp0QW1IR0FyclhZc0djVUFYcVhWR1VWMHJqMHVHNEFNeUVZU29H?=
 =?utf-8?B?V1p2TTFXZ1FDbE1uWVNnWXlpSzlNR1MxUlNoWXVXTmF3VU9odEVXd0o5cXZw?=
 =?utf-8?B?dkwyWnFIWkQ2anQydnBTL0ZPM3lSOVRSd1k5cTkvR2tjazh1Sm5xRytsd1JK?=
 =?utf-8?B?MCtlWXgvOUd5emticHRUa2piNjhnVy9TZHJLb2VyR2dQNXN4bjRsUDE4WUps?=
 =?utf-8?B?TkpiNVJCZG9PZEZYTFBiN3UvY0JxdmJOMWxJNTJLQmZROGQrSVQwekVHcjIv?=
 =?utf-8?B?ZlZlWkhaZElPQTNTNTk3R1NBdHZMQXBCL0VaNS84QVM1Z1ZhZC94NC9pZVE3?=
 =?utf-8?B?UU9BWmxBV2duK2dRMDUzZVo2dkZ5aVI0SG1panFuMEI2WG5PODVTbmJ1eDRa?=
 =?utf-8?B?UkpQSysxTnJmeDRhSjBiNFNReWpscVlub1BuWnBHWjc5NVJIVWRCSVFNMzFC?=
 =?utf-8?B?TjQrc0JOWDl3ZnhlSWxocENNUXRDazFQeTFsRkZ4QjBMdEtzVHNyZGlxRlVL?=
 =?utf-8?B?czFGQlpkT2lIZ0tPSEIzeHo3OUxjcDZNTzJoZHErcWFJR2ZGbzE4N3JQaERz?=
 =?utf-8?B?Z3NLYzZkUksxbkhhLzFvS0FOaHdYSWFhL1ptQVVsVTZyVDlTSkQrQXhhU0Vy?=
 =?utf-8?B?V0FPZEEyaWxmdnQ5Zi90NDd1bkVDRE5hV253ZkxjS0RDTFZZVkc4bVM4Nncx?=
 =?utf-8?B?TGIyVGhXY0gvdjZHU1dyeGlEYWxpc0Q0ZHdQSjFYNklzMU1Bdlp5NVd3S1kv?=
 =?utf-8?B?Z1RFbUtLM01kb0oyYkJvekVrbmRDYStBMlRmbjZrV0tFdEF5UUpCR1R0SDI4?=
 =?utf-8?B?U01FbXNGT01MNHJrQ0pmWG1wR0ptYmwzREV1ck1TNk5JZyt0QzVQYzZjNGxy?=
 =?utf-8?B?OUo2d011YldCZGdCRVlFdTNzeGZOS290SkxMbittcGxHZ3I0UHhmckZNTDNk?=
 =?utf-8?B?WmM0TnR6SklnUEphZHRJWlBsNlBJbUxPbmM5Y1I3UGs3Z01LVmo2YUFkTW03?=
 =?utf-8?B?SGJZOVNtRUF3NEFOSFp6MjRhOTc2Z24rS2dLNTBKamlDbEJ2N1ltZ3YwRExk?=
 =?utf-8?B?aFlBUVBqdVY4Z0g2dFNhdHlkUFdvSDZmZE1GNHl2VEpJT2liRk4zb3VHZFBz?=
 =?utf-8?B?cEpkQTIxRVpmdmRnanVBOW0zdUY3bCtWVVlNNHNGeEkvbGd2VExXQXpqVm5K?=
 =?utf-8?B?eUNka041bEVuYk0vaHFHcDVPVWFLbE90YTBlSWhhYXl5aGlaeGdnNUZmSXNj?=
 =?utf-8?B?SE54MHdtWUZMcUp3ci9KeEgvL2oyeFpNMDdSM0JZWHNWTEI0dDlYS2l5V1pJ?=
 =?utf-8?B?TDgrRWVlR1VQOGt6MGJVN1BBemZPWXdHbHN3VksxWTdoQVZpdUNJc0VSdmVO?=
 =?utf-8?B?a0RvN1l6MnJnN0tRWndKbWg3a1FqdnEzUkZJSnRxeFBaQVpBUzBXRDMrNU1V?=
 =?utf-8?B?czFkbnhLTWtzYXhheWU0VE1vRjk3Z3Z6QVdjemd4QnpUdmJCcUVvcm56emdS?=
 =?utf-8?B?QXlKMXYyQks3cCtBQjBUWjhSZjBOWHBWYVBoL0NhT1RPNEVCL0xGQTZYc0s1?=
 =?utf-8?B?V05ZNE5ST2lvL1lVcjRuV3hPVEFxeU82RkdlWmFwdnNoY0xCMm9Wc3FOdktX?=
 =?utf-8?Q?8mAJnbxJF3gDWz4VOTQfDkEObhSSQ//dBloONvlyGSas?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 739001d7-7892-4597-49b2-08dd67b4a75f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 13:39:35.7527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5QdC8gMcrVHZzvn4osWM2mG+MAAGJUmo7w+4fnLr2u5EE/w3bLh0v14hTEF2El4rMHenHolk92uy/jv9FOIutg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6409
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

It is common to build a u64 from its high and low parts obtained from
two 32-bit registers. Conversely, it is also common to split a u64 into
two u32s to write them into registers. Add an extension trait for u64
that implement these methods in a new `num` module.

It is expected that this trait will be extended with other useful
operations, and similar extension traits implemented for other types.

Reviewed-by: Sergio González Collado <sergio.collado@gmail.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/lib.rs |  1 +
 rust/kernel/num.rs | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 2fe10df9a45ccd5fa24330f927abdf9dfb874d44..a9499597ed9650f8fae9b2f53fa9abeea05071f4 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -62,6 +62,7 @@
 pub mod miscdevice;
 #[cfg(CONFIG_NET)]
 pub mod net;
+pub mod num;
 pub mod of;
 pub mod page;
 #[cfg(CONFIG_PCI)]
diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
new file mode 100644
index 0000000000000000000000000000000000000000..9b93db6528eef131fb74c1289f1e152cc2a13168
--- /dev/null
+++ b/rust/kernel/num.rs
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Numerical and binary utilities for primitive types.
+
+/// Useful operations for `u64`.
+pub trait U64Ext {
+    /// Build a `u64` by combining its `high` and `low` parts.
+    ///
+    /// ```
+    /// use kernel::num::U64Ext;
+    /// assert_eq!(u64::from_u32s(0x01234567, 0x89abcdef), 0x01234567_89abcdef);
+    /// ```
+    fn from_u32s(high: u32, low: u32) -> Self;
+
+    /// Returns the upper 32 bits of `self`.
+    fn upper_32_bits(self) -> u32;
+
+    /// Returns the lower 32 bits of `self`.
+    fn lower_32_bits(self) -> u32;
+}
+
+impl U64Ext for u64 {
+    fn from_u32s(high: u32, low: u32) -> Self {
+        ((high as u64) << u32::BITS) | low as u64
+    }
+
+    fn upper_32_bits(self) -> u32 {
+        (self >> u32::BITS) as u32
+    }
+
+    fn lower_32_bits(self) -> u32 {
+        self as u32
+    }
+}
+
+/// Same as [`U64Ext::upper_32_bits`], but defined outside of the trait so it can be used in a
+/// `const` context.
+pub const fn upper_32_bits(v: u64) -> u32 {
+    (v >> u32::BITS) as u32
+}
+
+/// Same as [`U64Ext::lower_32_bits`], but defined outside of the trait so it can be used in a
+/// `const` context.
+pub const fn lower_32_bits(v: u64) -> u32 {
+    v as u32
+}
+
+/// Same as [`U64Ext::from_u32s`], but defined outside of the trait so it can be used in a `const`
+/// context.
+pub const fn u64_from_u32s(high: u32, low: u32) -> u64 {
+    ((high as u64) << u32::BITS) | low as u64
+}

-- 
2.48.1

