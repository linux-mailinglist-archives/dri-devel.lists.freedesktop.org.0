Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC961C0AA90
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 15:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D1810E07E;
	Sun, 26 Oct 2025 14:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dEf5b4iw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010055.outbound.protection.outlook.com
 [52.101.193.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0E910E066;
 Sun, 26 Oct 2025 14:39:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FcQtt9PaXF3hnkMhCnfJ3F7uve4WC2tbHv4HvHmLEzKKSMPQ7Dks7FDqrOc1GjsEKyQEMFJdD9qLerEHNKMB58/J5fNpRZ88liM/TZemif1qS2ceYkDLHUHldn3eNn9C0QxVJu7GKaltqthFxKQKaBWDDyMpnfxbOel9mevGayVsiAbTVFmZmwA0VaTPzTsgFU7v6KxqIHMpptME7sq4I++TbNLNivfjh0dQNB/1T8eiBUMzp6QeV/H8PSgx/lOIJbMtmIU84JwoB6p9vvVUkb0eke6t1mH3cIr0qeS7b/X92ySElvVqKKU1dkl+AdKveumjE0qup5a1ztposnLQJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nh8oyPiztPhLI92s3w0fFoN4/nq3yZg9f0k7buHATI=;
 b=bRU6MwR36/OUgkdPnoPgREBlw2LYt/kLK2KWJdDTvLdCKqY4f8w6dwGkX4u9baHi7+bkTiTmiAcFnynNs1S9Xe781mOlexiogK1xo8V9Wljmewm4bGeHX5Q8Jer7J14DIS7qRaJd/jj3+DaaDqC35Va0noqbXqgVH6w330/IKmNt2mdAG2dctwotYhXnoFdNzwQUjYvucQ0pQR7U09uDc7jzEQ5Hit0q2pM3Ji1P016tnv7p17C73CUha8IphPFQfGm42wJbV1nVreo1ZZsrsPByE6G/QqUZrX/n4eTCPaEmtLtMNQqjIpeY9NeAfOhvkMXp06OL7mI35TR8ZSjSuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nh8oyPiztPhLI92s3w0fFoN4/nq3yZg9f0k7buHATI=;
 b=dEf5b4iwbyMwWRR+KHBued6duod7BuAAQYb8OYEXMP++Eylrwquf9+e1iZkCPEHH9JwIaMijEnKBzJMEuOFGFH/WHo80BWYpAbG0dJqox9SS6Fomzgenl9b1tG2Hz7rQv/MMEO8WCe5BLYTY1Z8aUHnA+f9S4FFBMqxOYevhBIOXEbPMHyf0J7tVzs+jodHtCnOtKSHaHRxEn/kaUx3IJOXr1rw/TSObLwBsR394mgkxY8QhkO9F3aZWnwn6kB9dkUBXg2LEUx+YKHo8usp+5UXktv9dXP8ZN2DzWI1438DlWHHfA1bvra90A8P/cPJG3j/5Qmpr6FNLS2LKfpFhhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by CH2PR12MB4168.namprd12.prod.outlook.com (2603:10b6:610:a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Sun, 26 Oct
 2025 14:39:33 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9253.017; Sun, 26 Oct 2025
 14:39:33 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 0/7] gpu: nova-core: remove use of `as` for integer conversions
Date: Sun, 26 Oct 2025 23:39:05 +0900
Message-Id: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIky/mgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyMj3bz8skTdxGJdi9TkVBNDEyMLc6NEJaDqgqLUtMwKsEnRsbW1ABu
 otqJZAAAA
X-Change-ID: 20251022-nova-as-8ece4142872a
To: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY1PR01CA0183.jpnprd01.prod.outlook.com (2603:1096:403::13)
 To BY5PR12MB3986.namprd12.prod.outlook.com
 (2603:10b6:a03:195::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|CH2PR12MB4168:EE_
X-MS-Office365-Filtering-Correlation-Id: 12e3dfc5-7a75-45fe-5cbf-08de149d794a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTN0ZGVoeVhnbUMvMzJWTG1Hby9xTkdEUWNEOWg2S1UxZTdMQ1cwWEZjRmYw?=
 =?utf-8?B?VlBHdnZCdXJtQTNkelQ0QWFlKytINjB4RGNwVFp2Zi84akJYbFRpcjlLckg2?=
 =?utf-8?B?alFsWHk2akRxdjBmd2w4RnMxVERqWnBiZmgwUzl3QlBhTnYrc0M5U3poQ0Rr?=
 =?utf-8?B?NFNlTXgwM1R2a0tIUXN5cXBLM2syN1d4UElLYTZOckkxOGlGc2ZvcEtMMGZy?=
 =?utf-8?B?MFMvRnEzS01QQXpqdlROSk5OcjhlUDkxbmpvcDVqSzlMdWJlMEdDSk1lWUta?=
 =?utf-8?B?dVp0ajJjT3RNTWJCb3JLYXdHU04wK2hCWUtQd2pUdWhPMG5yMzRIUkQ5R0to?=
 =?utf-8?B?czVMMWlIYndJSlBPKzM5ZGZ4MkJ0dlN0N1EyMkZZU0hyS3hldDMyeTcrZUVI?=
 =?utf-8?B?MGNwSkllREI4S051WHF6c3FZYzUxcVZNWmdaeU9ERTFuMjMyclNSVmIyRkNI?=
 =?utf-8?B?dURIczBQZGdDa1dnUlpaRDZ3WXIxeFBKQ3UycVdYd2pQd3pzM3B2MjF4clFn?=
 =?utf-8?B?WEVsS0R6bU9WY1VhUkpJeTdPRmVONGNwNEJ6QmxMbnBVTS9uZG1haFp5N1Bu?=
 =?utf-8?B?RjlDQ1BhNnJyVXBTTWdaK0VQdmVtcEU3VEVzMHk4MGtPcENONHpiTFVBRTdx?=
 =?utf-8?B?MnB3VUh5aGtjUDNCL3IrYnpTektXM1JRZm1QRDMxcnQzRTJhSkRCWkw4VXFs?=
 =?utf-8?B?L2FlWUkvVTFwNkNCSkIycnpLVG8veUtXWHozY3M3NWprbVh0R3BERVBINE92?=
 =?utf-8?B?cnBHTTRBd1N2Wk9Ncjhpb0VWUmdRajJEY2todklkS3J1dTBxM0sxM3N3V1RI?=
 =?utf-8?B?UE9FUHZRbVhiWWVmalNyVWphUE12TXhKNTJ1U3pyTVJPWjhhUGMwZVJTK0FO?=
 =?utf-8?B?aXIzUHZadHRnQVZyZXJEZ1UvVjhzakdBR2krZ1JwWjI3eHQ3dzZ2WWRnWXlL?=
 =?utf-8?B?V1VWQndJL1lSY2psS0QvQ2ZFTDlwT213bEVWK3AxV0IvZmorREQwbGV0UENH?=
 =?utf-8?B?NnUxbWFGc2Z6RTlORnJ0RmNEd1diRTMrR1dWRnExLy9QM3N4a1RUTjMzMzdq?=
 =?utf-8?B?UEphRGRXUE8vbG9DUmJKVE8xVjU2TGJhTEJoNkwzSzlLc2M4dFNQRTcvVXFF?=
 =?utf-8?B?dGZKNWQyaE1aSkZrY3FqRzBMWk45ZFdxempkZXNBRlBuSW41b3dCRVcya0c4?=
 =?utf-8?B?Nm5MbmNQaUlFdVlnWnhUZ3lmUVA0bnhreFVWbXY5OUY0S1BLOS96ZzdJTndn?=
 =?utf-8?B?Zkx3bXpycEFiWjBiQ0hJRzB5VnhkbDl0WEdiU0NtOW15QUVvN2JIK2l1WmN2?=
 =?utf-8?B?NVU0empyOXVyWXFBVEZJVmJHaWxUbVpDdGFkelZPbXU0YkovT21HcCtRbDl5?=
 =?utf-8?B?ZnhibVdVdEZFMkNxL0E2cnRqMHg2NGovOXJBWm81VEtuZjZLOGYwYmVSQWNv?=
 =?utf-8?B?MGp0b3hCcXliUnYxR3ZIL3B1dGhPVDcwcG1sdXlDYTBMY2h6UUV1SGVvQS9y?=
 =?utf-8?B?RUVMVmIrVnJYQk9KbEsxKzN3QTFJSys0U1dyajNEcGlKUXBXeWVmWGNmczJL?=
 =?utf-8?B?TnQvOGZkUkR6NDZKenRBWk5KeXBKK1R1U05TamlreUhBZmF0eWVzZ2JYanN1?=
 =?utf-8?B?K2NsSVFkT1VKRTdjU3ZWWHhYSGREQW05bE5pdFhOM25OZC9nVzJwRnlkNkNN?=
 =?utf-8?B?Ymw5aEJ6eXdhaTZRMFJKZWtLUnpGVTRCaE1XTTl2cDY3ajdURWN4d3NTQUdV?=
 =?utf-8?B?cjFISnRhOXNZUERSVGY1cTRtZUR5cnk5QW9hY0hPRkZsRmVQWG1EaEhnWE1G?=
 =?utf-8?B?YlM0eXFhVjNTSUhtbUtoNlBKMDFqRE5Ea1JhckpYWFdRME1ydENPbm9xcUdT?=
 =?utf-8?B?WUgybHdGWGtEakNxZHhXR0RUdVdQU25CK2ZYeGRtUW9hRFpRK3NaY0hHcjVj?=
 =?utf-8?B?UUxnUGRZZEZOL0NUeVBWODY0V3BWQ25LR0cwTTUzZGVIYkF6U3F3QU1MU3pH?=
 =?utf-8?B?b3FmRWltbUQyUWxkK1RXRFBqb1hhQVBNOHc5U3pvVi9VUko1ZkY3U0pkRjZF?=
 =?utf-8?Q?PUpNBp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(7416014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFJDSW1HTzYwcVgzbW84NWE2dTFaWGlKTmZUdC8xcGhzSzQ0TUdxOG5wZm5F?=
 =?utf-8?B?TUhYblhjWmJHQ2VQeDhRWVgyQy9NMWFnV2J3UHVxOHdOb2E2OFpmam5mekN0?=
 =?utf-8?B?eVU0RHU0VS9FWnNDR3c2S0dyc1gxT3R4aVVxcDdETXVxLzAxeE85WXNtTFdn?=
 =?utf-8?B?Mk5JRDhxMnZLc1k0Q0FVR3ZLNFFQZVl6cDd1WThwbGtrY0ZSV0JVTEtZK3Er?=
 =?utf-8?B?YmFwVUx2SnFqWGlQaXBxVGhwZk9QbDlwcnRPWmhXaVAyaVdpeGhUTlpCaGlI?=
 =?utf-8?B?b2Z3OFMrdXRIT200TnBsZlFKWUFmTGtVaE5VRlYwdzUzYW1EQmlXQUpJWDRH?=
 =?utf-8?B?akViOVhCWDBPR0pzY1F3dGU1bkVEVFlPelNGdXoxbWVWQndBWWNKb3dNRlgx?=
 =?utf-8?B?Uk1oRTRRY1UycmlDYXZQZ1U5OUpJY1FmZ2padlpYSktYZHErTDNBMXpQSmNj?=
 =?utf-8?B?YS85TklSWXJLbEFzM1ZZYlNPbDJwRjVNVEVZNzdEVUE1M2wrQmgyTnhiT0Vr?=
 =?utf-8?B?R0xkYmNPcVZhY2xuVm1MN0RVaG5tUmdHUHRoZ1EwWDlpY1h0Sjlka2lzSy9U?=
 =?utf-8?B?Q2RVdDdONldzN3ZVeXo0L25yYTlhWWZvakt2V1J5QkdaZ3JvWUlaUnhNNFVC?=
 =?utf-8?B?Y09xOVZzVGNidTBndXN1ZkI1N21qcTN1WnpKUUhkbmRnQWlTT3NBVTVJR3Jn?=
 =?utf-8?B?bzZkVlVPcHZlc003VWh1ZHR5bmI0ZExMTC93MS9lKzI4S2xYR1NBZ09TZ2hB?=
 =?utf-8?B?Q2V3QWZuVkNHRGpESUloM3BnZzRPVXIzRkttMVdnTTg0ZVZuY3prOVFwMFlZ?=
 =?utf-8?B?bXJNb0FDcWNvODNYV3d1Uy83RjByY25rQXQ3aUlNRmFuL1RaVWJMemRyWkRK?=
 =?utf-8?B?Q2pwVDBqTXdYRXE2eUlJTjNMdTBLczU2cWtxcWFqVGt6K0pKZ1NmWnR3YmpJ?=
 =?utf-8?B?L3UxWHc2SkJsUngzcVFPTFBlUm5NaVUycjZMZEJtbTcwSldKNS9EemlvcVN1?=
 =?utf-8?B?eE1LRjRQeU1BYWxuenlXcXNOdDVDcE5mMmdWdDZjOERNT2drQVBOT1JiRlZr?=
 =?utf-8?B?Tldub2lnazlBN3FoazdidnZYNVJWSU94cUtjZlprNlE3c1FCSkdBb2xGLzNW?=
 =?utf-8?B?VVJiRU4rUnlzSFJMNTZLNGc2RjV0VkJxaDVEbWxQYk1iUGVtRHYwN0xMaVJL?=
 =?utf-8?B?SThQM3JrbWVWMHVVMkxaa2U4MjJuNUNPbm9EdDQ1eFFhTENOTkVTOVNDdTE2?=
 =?utf-8?B?N1JoT0R3eGlEWXFmSDIrWFpZVUdJMkxLOFhha01penVvbVZLRlJlVmRmT3BC?=
 =?utf-8?B?Y290MVVMaVpPV0ZpOEU1WnJWaVFVRDlqdnpHQkNuM1VVSXBJQjJuOGVBQW9K?=
 =?utf-8?B?OVB0bEo4cS9yUWxZMnczQzRPZUlwaFNaMVJwaXhJM0plOUVqYlo5K2FRRG1l?=
 =?utf-8?B?aDhHMXV6VG1MRWdMWXRGMzBJVnlyOFByWFRFVzBjMXV0VkxCWTk0Y3o5NFd3?=
 =?utf-8?B?RGgyYnJrR1BDZGpCZDllWEdndUJ5NWJpbVRZSjVvdWNENjBPOE9jVGtDSURP?=
 =?utf-8?B?VmNSWXJhOWp0ZzVDTVNxc3VRL1AzZWxoRCtON2gzdnJuMjIxM3ZkUkFtS0Mz?=
 =?utf-8?B?WjJWZGxGNkliWEhoUFVVSGQ5LzgwQVd2MDY2WFVlRFZ6alNXb3ZjU3Ntb281?=
 =?utf-8?B?N0lCQ1JrNzRNK0M1bnBLaVlzWmk5aVhCUkJoNXdPUkFCUmRqSTZnZUdjVldw?=
 =?utf-8?B?RVNLNlF3cDMwYlQ1aUJpcEthOE1Gb0FtQ29oN0NKdDZtdi95YkxuSi90cHlm?=
 =?utf-8?B?TVorVDQ1dy9YOWQwbys0Q3FoWUllWk9ibjZKbjJCdzkxMmRnbGI0bDZIZFc4?=
 =?utf-8?B?UnZnck44QVFXQ0xWRzZydGFka09EZVNpUmRxeTBaSXRMSUhrVWZLUVA1amNw?=
 =?utf-8?B?THFvUlBBTldxR0p0d0hKZVpFYncyaG1BVmhHajVLNjZxWTNTeUtaM1hVT01H?=
 =?utf-8?B?SDZ1b08yQzBDdWhBblVvNC9zZ1htb0t0Y2FBUllJNy9CR1QxV1hwZGtDTEhm?=
 =?utf-8?B?V3kwZ2tDR0NRZnZvby9rQlBvVlVEMlRweUIzUVFPZjJJTUMzbEgyZHFaSXlQ?=
 =?utf-8?B?bCt5V3ZnQnNoc0RFMnlKUDJNSG1Jdnc1VWZYY0VIOE9xOFZjUVZBenZZN2Rx?=
 =?utf-8?Q?97YUM/4zPwoj6fBNR1AzpfqdhKopLCNfzn6NOHS0DowM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e3dfc5-7a75-45fe-5cbf-08de149d794a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3986.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2025 14:39:33.1733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6gYfs3a/tcTarwF+qo9oxrjOMHjfwYXmhLNQWA+KLDAjL1mZ1p4LwahzcM9XEXLYlBb80f3jexa6wrYGKsc5DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4168
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

Using the `as` operator for integer conversions is discouraged, as it
silently strips data if the destination type is smaller than the source.
Many such conversions can be replaced with `from`/`into` or (when
justified) `try_from`/`try_into`, but these traits cannot unfortunately
cover all conversions satisfyingly.

There is for instance the case of converting a `usize` to `u64`, which,
in the case of the kernel today, is completely lossless but cannot be
done because the Rust standard library does not provide a `From`
implementation for conversions that are not future-proof.

Still, in the kernel it is very practical to be able to perform such
conversions when they are safe to do for the current build target.

This patchset tries to eradicate the use of `as` in nova-core, by using
existing means and introducing new ones.

The first 4 patches use the already-available `From` and `TryFrom` trait
where it is possible or advisable.

The fifth patch introduces a new module that proposes conversion
functions for those that are infallible under the current build target.
This is done through a set of const functions, and the `FromAs` and
`IntoAs` extension traits which, as their names lightly suggest, offer
conversion for those types on which the `as` operator can be used
losslessly.

This new module is put to use in the sixth patch.

The idea was first suggested by Danilo, and I hope I captured it
properly. :)

As Danilo suggested, this could eventually find its place in the kernel
crate if the implementation is deemed to be fit, but for now let's
review and let it mature in nova-core.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Link: https://lore.kernel.org/rust-for-linux/DDK4KADWJHMG.1FUPL3SDR26XF@kernel.org/
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Alexandre Courbot (7):
      gpu: nova-core: replace `as` with `from` conversions where possible
      gpu: nova-core: vbios: remove unneeded u8 conversions
      gpu: nova-core: vbios: add conversion to u8 for BiosImageType
      gpu: nova-core: use `try_from` instead of `as` for u32 conversions
      gpu: nova-core: add extra conversion functions and traits
      gpu: nova-core: replace use of `as` with functions from `num`
      gpu: nova-core: justify remaining uses of `as`

 drivers/gpu/nova-core/falcon.rs           |   9 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs |   6 +-
 drivers/gpu/nova-core/fb.rs               |   7 +-
 drivers/gpu/nova-core/fb/hal/ga100.rs     |   4 +
 drivers/gpu/nova-core/fb/hal/tu102.rs     |  16 ++-
 drivers/gpu/nova-core/firmware.rs         |   7 +-
 drivers/gpu/nova-core/firmware/booter.rs  |  31 +++---
 drivers/gpu/nova-core/firmware/fwsec.rs   |  23 ++---
 drivers/gpu/nova-core/firmware/gsp.rs     |   5 +-
 drivers/gpu/nova-core/firmware/riscv.rs   |   7 +-
 drivers/gpu/nova-core/nova_core.rs        |   1 +
 drivers/gpu/nova-core/num.rs              | 159 ++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/regs.rs             |   5 +-
 drivers/gpu/nova-core/vbios.rs            |  60 ++++++-----
 14 files changed, 261 insertions(+), 79 deletions(-)
---
base-commit: ca16b15e78f4dee1631c0a68693f5e7d9b3bb3ec
change-id: 20251022-nova-as-8ece4142872a

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

