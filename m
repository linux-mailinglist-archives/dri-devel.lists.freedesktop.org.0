Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA60C0DB5C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:55:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7088710E484;
	Mon, 27 Oct 2025 12:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fjBdpnKT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012041.outbound.protection.outlook.com [40.107.209.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3208B10E47F;
 Mon, 27 Oct 2025 12:55:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFHKfV0ehiMHhkKCTbQuTQB7u8jkabshcsF7hkKur9WhpSm/WpelQf9H4yW+xrmCfESuDSk6ud6HXacDW19MS/nKr34vwSU+mAwxCrGaGkDziuUeogMn4ggN7HkvU3WcnTXkAhZUaLaXuZak5ELq35SqkhczivhggHwXBSUO6YA3fFJF5Z/daGoenBnM9FwrcumVAvL5MaVZ0GuqW24cNNSjQcNEGJS+z1Tun0Ad67LexWMv0kFBeBWdFSRnVH6waM3MeQL0iBAyJxsJXdZNOgAx3weB2c1EU7exXWVrAkY/9kiiC8GHpDMaqSDtHL4PaYe/xZvZBu03K8RU6lmBAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jb9OeDIoLzw2Okcb4myH/DAK+KrVyk5hcdYuY/9JE0=;
 b=ewiMb0yJCcseVusTZ3RO6/wb303u3MEYkkHm1DZNfCXQDWOQl8U5wmHPRnGdO7U/dBCWAiPkBPfOYEm5qXSAWaK0flgz/aHkRoFP1mGdueii1GWa6KW+JfkjuELVF6n/w/qPPf+etNrpH6nUiTKaB++8E4CD1P69yVsGTU6OlH4Px9PbVSZ2Ybz14cPBkm6keMDCAnMi8j+5PEKgh2/zkvvSAZ1nYStz4ulmjCvZYMSAE1XqcoY4jhsGnbY2JtVUHxC7PWtQH1nHlRBx0w0ag3FsjuOJminVouyrTYzWi0tm3+0dhN/BceLHaZgGigbo3axKQm5Xpb5thTEWGskJyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jb9OeDIoLzw2Okcb4myH/DAK+KrVyk5hcdYuY/9JE0=;
 b=fjBdpnKTLIP+qlp5KcdEknK2LCdxwzto4OQUTHKZhKBFg1al6jabpp0GUeJHjS0otjAsZqu1Qk+TkH7XCl/LAIfwWJk6LYlNEYfvN0Q1YYJWMNzNcOClFjTHLWPzhhVG0oj7aTySwRVGMFih8yvagbpxWdAZpVqcZofs1G85P8+humCrsXCUv5mhOzVYH00wmmz+oU9Gi279RUiqFyV47zP7J+iiQ9VOYes8XlpzLvPxahJQ47bFgMU9+pYKj0LgelD3Bgmytyc0Z3R0AkL6pHd2F9WfMKrb1NA7SH32tyda6YOmVcwII1tOqXUvnfa8Q2eVI5yLaGWM5U9v3qkJeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 12:55:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 12:55:08 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 27 Oct 2025 21:54:46 +0900
Subject: [PATCH v2 6/7] gpu: nova-core: replace use of `as` with functions
 from `num`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-nova-as-v2-6-a26bd1d067a4@nvidia.com>
References: <20251027-nova-as-v2-0-a26bd1d067a4@nvidia.com>
In-Reply-To: <20251027-nova-as-v2-0-a26bd1d067a4@nvidia.com>
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
X-ClientProxiedBy: TYWPR01CA0005.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cfadae6-dee6-4d9f-68b4-08de15580ed7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VThOQnpNcHJwV3hxdFpwZ2d2Ujc4eVYxdUJINmRoQnBjTk5ZQkpDaFZsU29X?=
 =?utf-8?B?NXg3d3g4MmNmd2tyZnR5S3lhZlVtd2FaTy8rWTZxY1E2dkFZekNScHhWQSt6?=
 =?utf-8?B?K25tOFQ3TzQwQ21GNkFyUEsyWEM1cGhuZXVLUnY5SWR0bVh4Q0ttZ1lJL0ZJ?=
 =?utf-8?B?LzNucXZuU2J6ZENzbTdEWEpIdUdWbzkrUW1TVWFTQVFoUGFxeE1XK28zZ0dE?=
 =?utf-8?B?NTNENUQzWnd1SW5mZ1l5QUc3Qk0xaGJJcXQzVC9aYTRSU2N0cEQ4aHlRd2to?=
 =?utf-8?B?SENyaWZybklVaGdiZ2taQXUxWmJoMFI4UklERlZBK0wxb2JIRXhPWFczT1Mx?=
 =?utf-8?B?bGl0cnpwNHFzM01nTnZONmh6Y2JubUUzbVZ2VDJtdWFsMlRKRUZvcVR4dmpU?=
 =?utf-8?B?SVRHeXprV3dydXRkMTVzRUd2TEJNS3UzR0lVZnI2MUxIRGJud3h6dDBrdTk3?=
 =?utf-8?B?Z3R3YUExMlh6dUxzTEtwUkp4Y21nR29zRGRocG9ickdFWXd4MUoyaHk0Ungv?=
 =?utf-8?B?c0x4RGROcVgvSnZZQ0N6Ri9RNThBemsvZkpSeVBRSUpaQzY1QjhwTkhsMmwx?=
 =?utf-8?B?TUNuanRxWFNsWnlWdWlzcExWSkVsck9JV0pqNFZyYVJuVFQ3Tld3eXp5TkJ5?=
 =?utf-8?B?NHBFejJrSXNiV28xTVhjNE56a2JTd3VaeUxzbFJJczRKYTV0cWN2OTcrT2Yw?=
 =?utf-8?B?cEpNVXBrSUNjTWl5WU5pLzd0bnplUzFqc0JUT1FPOXg5VkVVS3VRMFdFZE02?=
 =?utf-8?B?dlJOWE12MGhlVERTdmJ3UU1Mc0U5YVlWYVVaejRycjVCY0M5OWx3UjNRYVlp?=
 =?utf-8?B?dUJma0pTZ0p6Z2RnaWRYNDBtN3hwNHFaMHdYTnhKYkhDMjBSZ3ZzM0d3KzFl?=
 =?utf-8?B?WEw1dlg5L29BTE9pMVpCMUhPRHR2Uk9OakxoVlU5WEFMOGFFMzIwdEd5K3VX?=
 =?utf-8?B?RlIwY1FDRXR5bnFCb2FkM1pvY0hYaXVkL2J6REw3dUVkRkhvdXpzY0VyT0FC?=
 =?utf-8?B?U2NsVDJPN1k4bHVaNjFRZDU4bE1ia2dSM3krN2lKM3Z3VnlQZ29obityWEcv?=
 =?utf-8?B?TzRrK3VaeWlKRGRJZ25zMHJZMjVZaFVCVTJma0lpZTZDMHpoV1MrZEhNblFD?=
 =?utf-8?B?d1NkSW1RVWtpMzdkVGFPL0VCTHd2b0xmQXNFNzI2TVlGNHNOR3dWbmEvb0Fj?=
 =?utf-8?B?OTcxbW1nT1ZyWndTenFGd25FZ3FnZGdxVjF0VzA5K0JVb2Y1UDFrZ3o5NHcw?=
 =?utf-8?B?a2t6QWdua2Z5QVYvMnkwKzFLUS9WTG8xQklEOTR1VEZhdnNJSUNPSURKcE52?=
 =?utf-8?B?bnR1bDFsSzZhaHhrZUFTTDB3bG5sRldoN3pLaUh2aDlIY1Z4ZkI4cjc4NFpj?=
 =?utf-8?B?UDhqbHgyd2hTTTZKNGR6b0lMbDF5ckJob21IT2gveStwSEF0WUl5M3JBVXBR?=
 =?utf-8?B?Y21LTTlQRGVMNDh5ci9PZ3Zqb0IvZTJIbmg2NEg4ZHFMQlc3aTlERjU1TVVP?=
 =?utf-8?B?RTJRNmNHdEtCYWIrR3J0VmhFYVFKc2VpY1EzUng1NG5Qa1MwK0lVMDc2bUZ1?=
 =?utf-8?B?QS9zVDN3alBNWS9VNURldDlyL2V6SUxZcnNpRVZmaUNoMnF4ejZqU3FJOVJi?=
 =?utf-8?B?L2dGaG1iKzFGU2NWVTZOWFF5bnZ2ZUNTTy9kUHhBR3I5eWgvWElGaVBCbHMw?=
 =?utf-8?B?aVhqVEZvZTVqNU5KMVIrVXlhWVF6WTlsOFVFanV5c0ZsV0hpcWY4bmtNek9j?=
 =?utf-8?B?OXRhcmlUYTRrZ0dIMmxaRUx4QjgyQWpuZm1sakNkeFEzdDZ5OGlZSFVjUVJF?=
 =?utf-8?B?UkZIZlc4cmt0VzB3ZUh3RnhwOWQrL1pYc1M0UzdCK29HWnhaOWpGL1hBOHhn?=
 =?utf-8?B?cXZLdEo3MUNQNk9SQVRJaUNZVDdZVlR3QUd1S2JhajRSWkpadnBLcUEybDZZ?=
 =?utf-8?B?WjBTZFVwdlRqTmE2MDhUZVUzQ0g3M2F6Sy9POGViNEhsRjhKWGc4L0xkZ2lU?=
 =?utf-8?Q?NP3RPEsCJVoSEcpH+II7W9MNkbSbKk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUpJTTB6Ty96WmVxRXN2Tm14SGtKdmpkMjRpdkhQYm5NaG5HVmdsdGNVY01l?=
 =?utf-8?B?c2hzYnRVRmpKWGhhbkc4eHVHZGtYbDZKYk9YL3Z4Q3B1dCtJZjhZR0hsbFd5?=
 =?utf-8?B?eEdKeUttSDQxY3g4M0o2NWxtQlF5Mlh4MmkyS2ZTUXBYQUtpVXd5d3NzbUdo?=
 =?utf-8?B?VU12bkh3bXE0c0hKTHFEOU1LVk54L0tnZ3JGdXZpaHN3K2xrMWtQenFBc1pC?=
 =?utf-8?B?aFppeWZySDlXNDkzMkhvSUxyTlQ0RlErV0Rvclk3WXljODM5ZFJlU1loa3lB?=
 =?utf-8?B?WG11YmVFWFEzUDI4d0p6M3FKZkxpdEJWL3U5MEFUK3k4Z1hIdzlicHY4QWxN?=
 =?utf-8?B?amFib3ErVlRBTjNGN0dtdzVTNlhGR3Uzb0JoYXkvSXdFR016T2lEc3VZWXhv?=
 =?utf-8?B?bWFXVSs5ckRTNk5aRnVSRHoxVkpCeUZyQ2dXMmtQRTczQ2luZ3dkUnBuOXZG?=
 =?utf-8?B?Rk01U2F2aVNCem9raW9RaDRid056UFIxOFVBcnNRNlVQNWM0bXBnMHJoam9H?=
 =?utf-8?B?OERtQ1JKaytWY3h2NkE2bGViWmh1ZHVXZW5IanZ3Y3g4ZEpURUVTdkxqR085?=
 =?utf-8?B?dG04U0Y1cWlXdERER0kxNFhoaXZjYjhhNXoyY0RPd09PcnAwNEZOL3M1TFk5?=
 =?utf-8?B?RUZ0QzJTSUNpd1JIeHJTTVFGUXJsc1hia0JQRzhUY3lWV0M0UlA1RUxoTFJa?=
 =?utf-8?B?OFE1NTZmd09NSDloRzcvemFYV1ZSN1dmb1I1dExvdi9ZOVgrTUFBRG9GT2JH?=
 =?utf-8?B?eng2N0x6ZStoRnpXcEVEZ1VYZkoycGtvMVlUK0MzYThCNVlWb0kxVVBzdHZ3?=
 =?utf-8?B?bGdUcEsvRDJ3YmZFdERYV1dFM08rYmdoVWs1L3JYdGRtb2hWaEdqbXNVY2Nx?=
 =?utf-8?B?RkpIYldnZVlaQ2xlQjVHYUYweWtMZXMySjE2bkVpeDNUY2tDcUVCWVR2cm1M?=
 =?utf-8?B?YzhtUmhFQzlESE1WZ1NYcnNHYnZXZnZHU0ZjbytITi9qWXhzTzVjZjltdERD?=
 =?utf-8?B?NXF1cTQ4Y3RJYU81aFdkQ2doVWsvY0dOaEg2TW9ueGFyam0rdjZRMlVuZzhL?=
 =?utf-8?B?SFM4dDB0VU05eWNNRkN4UENCYlE0WThiZ1E5Wktjd0U5WWIxbGROWjR1V241?=
 =?utf-8?B?cGF1Y1lXSnROblR5NmkxM3cvWG50TjV0Rm5JWFZBcnhVWDlLT0F2cGE3R21Y?=
 =?utf-8?B?VkFwdnk2YTVlTEt5c05GWUR4a3NZUGdJQkdNcThqWUwzbEoydU1hRUx0WGRx?=
 =?utf-8?B?UmhGQjdTRWIxeFdXTTlzMkM0cHlJNi9BMDdBT001ekRDT1p2THhnQ3dYdkI0?=
 =?utf-8?B?K2NUc09nSFhQeDFQeHRtbFMwYmRmV2dlZmhCb3JPMUJVV3FhckYwUEVtdEJT?=
 =?utf-8?B?eWlZSDRkcG02NDRuNmlBU2gwZTZFcEk0SlNWME93bHYzRWhYbEJFRzFYV0dK?=
 =?utf-8?B?MFFzWmlXd3ZPZkZLR2JidFRGc2Y3a3dpTE5tUElGR09BZkwvZDNxb3ZRUDFn?=
 =?utf-8?B?Wjg0bGVJZjNLYjF5NlRncFBsN29Nb0dIWGJmQTZlQU5KS3N1UDUvNjVEQkVW?=
 =?utf-8?B?Q2MyUGFaS0E5Q3pGNHN3L1g2MlpLTzZ0TElvMVBOTDVzYUk0NWNLbEpyNzUw?=
 =?utf-8?B?TjNTQTNKWGU2RzdCbmg2ZHdaN2ljbzFGQnk1RW1WMXU1ODNKV2pVSURZRGlN?=
 =?utf-8?B?c3h0bmNEOCsvZEVVQlpFUkdka3lNd2tDKzF0Z0k3MzhVMUkxdWdQU0RBWjFW?=
 =?utf-8?B?RDExS1lyeTE2TVdRYjMxQ2tNdFJqbVNUeFI1emN0ZFplWVB3THhuZUZJMVVa?=
 =?utf-8?B?QklQa2x2ckI1Mzd1TFlEcmM0bnpFNmpMOXMvSkI5WXhnU0wvWWhObFB6bDAr?=
 =?utf-8?B?d2Z3ODVESHA2RHZ6MkM1SER0bGxQbWZab29HMkZVSlMxa1VZVU9GMitNay9y?=
 =?utf-8?B?N0pqQXZtdGRlYmxSRERPVkNlV1IvN0p1SmxVcEtvVHZxKy9ROWRSVG1yQjlh?=
 =?utf-8?B?Y3pNQk1EVUllZlAraVdvajVkNzZJdk9nK0E0aGlNMnhGZUlHL0toNng0eHpF?=
 =?utf-8?B?Rm51RzFzVmNKenczR0JXMEtNdFZHazlVbFliUkxyZHhLNHI0YUpva1Fpdk5q?=
 =?utf-8?B?ZzZDalA1cHUwOEhrNmpiaHhCOGVHUHF4alA2akRhWDBsbEp4OStraitMRDJ4?=
 =?utf-8?Q?MKBqUbaaZrfXer/T/CVk+T86h1NPUZUMZc3B/hyiG3tH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cfadae6-dee6-4d9f-68b4-08de15580ed7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 12:55:08.6431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YEgsWStMKg6bfpH/btG+81778i1v4dHSXz8yfJks3i3hjqcpDNacFQLbEoJgh23G0Is6C4DmaKjltQvzP/DT9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863
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

Use the newly-introduced `num` module to replace the use of `as`
wherever it is safe to do. This ensures that a given conversion cannot
lose data if its source or destination type ever changes.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          |  5 +++--
 drivers/gpu/nova-core/fb.rs              |  7 ++++---
 drivers/gpu/nova-core/firmware.rs        |  7 ++++---
 drivers/gpu/nova-core/firmware/booter.rs | 31 +++++++++++++++++--------------
 drivers/gpu/nova-core/firmware/fwsec.rs  | 11 ++++++-----
 drivers/gpu/nova-core/firmware/gsp.rs    |  5 +++--
 drivers/gpu/nova-core/firmware/riscv.rs  |  7 ++++---
 drivers/gpu/nova-core/regs.rs            |  5 +++--
 drivers/gpu/nova-core/vbios.rs           |  9 +++++----
 9 files changed, 49 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index fb3561cc9746..a44df1ac8873 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -15,6 +15,7 @@
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
 use crate::gpu::Chipset;
+use crate::num::{FromAs, IntoAs};
 use crate::regs;
 use crate::regs::macros::RegisterBase;
 
@@ -442,7 +443,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
             FalconMem::Imem => (load_offsets.src_start, fw.dma_handle()),
             FalconMem::Dmem => (
                 0,
-                fw.dma_handle_with_offset(load_offsets.src_start as usize)?,
+                fw.dma_handle_with_offset(load_offsets.src_start.into_as())?,
             ),
         };
         if dma_start % DmaAddress::from(DMA_LEN) > 0 {
@@ -468,7 +469,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
                 dev_err!(self.dev, "DMA transfer length overflow");
                 return Err(EOVERFLOW);
             }
-            Some(upper_bound) if upper_bound as usize > fw.size() => {
+            Some(upper_bound) if usize::from_as(upper_bound) > fw.size() => {
                 dev_err!(self.dev, "DMA transfer goes beyond range of DMA object");
                 return Err(EINVAL);
             }
diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 27d9edab8347..1461dd643cae 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -11,6 +11,7 @@
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
 use crate::gpu::Chipset;
+use crate::num::usize_as_u64;
 use crate::regs;
 
 mod hal;
@@ -105,14 +106,14 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
 
         let vga_workspace = {
             let vga_base = {
-                const NV_PRAMIN_SIZE: u64 = SZ_1M as u64;
+                const NV_PRAMIN_SIZE: u64 = usize_as_u64(SZ_1M);
                 let base = fb.end - NV_PRAMIN_SIZE;
 
                 if hal.supports_display(bar) {
                     match regs::NV_PDISP_VGA_WORKSPACE_BASE::read(bar).vga_workspace_addr() {
                         Some(addr) => {
                             if addr < base {
-                                const VBIOS_WORKSPACE_SIZE: u64 = SZ_128K as u64;
+                                const VBIOS_WORKSPACE_SIZE: u64 = usize_as_u64(SZ_128K);
 
                                 // Point workspace address to end of framebuffer.
                                 fb.end - VBIOS_WORKSPACE_SIZE
@@ -132,7 +133,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
 
         let frts = {
             const FRTS_DOWN_ALIGN: Alignment = Alignment::new::<SZ_128K>();
-            const FRTS_SIZE: u64 = SZ_1M as u64;
+            const FRTS_SIZE: u64 = usize_as_u64(SZ_1M);
             let frts_base = vga_workspace.start.align_down(FRTS_DOWN_ALIGN) - FRTS_SIZE;
 
             frts_base..frts_base + FRTS_SIZE
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 4179a74a2342..ae6dbefd9e5a 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -15,6 +15,7 @@
 use crate::dma::DmaObject;
 use crate::falcon::FalconFirmware;
 use crate::gpu;
+use crate::num::{FromAs, IntoAs};
 
 pub(crate) mod booter;
 pub(crate) mod fwsec;
@@ -75,7 +76,7 @@ pub(crate) fn size(&self) -> usize {
         const HDR_SIZE_SHIFT: u32 = 16;
         const HDR_SIZE_MASK: u32 = 0xffff0000;
 
-        ((self.hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT) as usize
+        ((self.hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_as()
     }
 }
 
@@ -190,8 +191,8 @@ fn new(fw: &'a firmware::Firmware) -> Result<Self> {
     /// Returns the data payload of the firmware, or `None` if the data range is out of bounds of
     /// the firmware image.
     fn data(&self) -> Option<&[u8]> {
-        let fw_start = self.hdr.data_offset as usize;
-        let fw_size = self.hdr.data_size as usize;
+        let fw_start = usize::from_as(self.hdr.data_offset);
+        let fw_size = usize::from_as(self.hdr.data_size);
 
         self.fw.get(fw_start..fw_start + fw_size)
     }
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index b4ff1b17e4a0..bab66ed85f10 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -18,6 +18,7 @@
 use crate::falcon::{Falcon, FalconBromParams, FalconFirmware, FalconLoadParams, FalconLoadTarget};
 use crate::firmware::{BinFirmware, FirmwareDmaObject, FirmwareSignature, Signed, Unsigned};
 use crate::gpu::Chipset;
+use crate::num::{FromAs, IntoAs};
 
 /// Local convenience function to return a copy of `S` by reinterpreting the bytes starting at
 /// `offset` in `slice`.
@@ -74,7 +75,7 @@ impl<'a> HsFirmwareV2<'a> {
     ///
     /// Fails if the header pointed at by `bin_fw` is not within the bounds of the firmware image.
     fn new(bin_fw: &BinFirmware<'a>) -> Result<Self> {
-        frombytes_at::<HsHeaderV2>(bin_fw.fw, bin_fw.hdr.header_offset as usize)
+        frombytes_at::<HsHeaderV2>(bin_fw.fw, bin_fw.hdr.header_offset.into_as())
             .map(|hdr| Self { hdr, fw: bin_fw.fw })
     }
 
@@ -83,7 +84,7 @@ fn new(bin_fw: &BinFirmware<'a>) -> Result<Self> {
     /// Fails if the offset of the patch location is outside the bounds of the firmware
     /// image.
     fn patch_location(&self) -> Result<u32> {
-        frombytes_at::<u32>(self.fw, self.hdr.patch_loc_offset as usize)
+        frombytes_at::<u32>(self.fw, self.hdr.patch_loc_offset.into_as())
     }
 
     /// Returns an iterator to the signatures of the firmware. The iterator can be empty if the
@@ -91,19 +92,21 @@ fn patch_location(&self) -> Result<u32> {
     ///
     /// Fails if the pointed signatures are outside the bounds of the firmware image.
     fn signatures_iter(&'a self) -> Result<impl Iterator<Item = BooterSignature<'a>>> {
-        let num_sig = frombytes_at::<u32>(self.fw, self.hdr.num_sig_offset as usize)?;
+        let num_sig = frombytes_at::<u32>(self.fw, self.hdr.num_sig_offset.into_as())?;
         let iter = match self.hdr.sig_prod_size.checked_div(num_sig) {
             // If there are no signatures, return an iterator that will yield zero elements.
             None => (&[] as &[u8]).chunks_exact(1),
             Some(sig_size) => {
-                let patch_sig = frombytes_at::<u32>(self.fw, self.hdr.patch_sig_offset as usize)?;
-                let signatures_start = (self.hdr.sig_prod_offset + patch_sig) as usize;
+                let patch_sig = frombytes_at::<u32>(self.fw, self.hdr.patch_sig_offset.into_as())?;
+                let signatures_start = usize::from_as(self.hdr.sig_prod_offset + patch_sig);
 
                 self.fw
                     // Get signatures range.
-                    .get(signatures_start..signatures_start + self.hdr.sig_prod_size as usize)
+                    .get(
+                        signatures_start..signatures_start + usize::from_as(self.hdr.sig_prod_size),
+                    )
                     .ok_or(EINVAL)?
-                    .chunks_exact(sig_size as usize)
+                    .chunks_exact(sig_size.into_as())
             }
         };
 
@@ -132,9 +135,9 @@ impl HsSignatureParams {
     /// Fails if the meta data parameter of `hs_fw` is outside the bounds of the firmware image, or
     /// if its size doesn't match that of [`HsSignatureParams`].
     fn new(hs_fw: &HsFirmwareV2<'_>) -> Result<Self> {
-        let start = hs_fw.hdr.meta_data_offset as usize;
+        let start = usize::from_as(hs_fw.hdr.meta_data_offset);
         let end = start
-            .checked_add(hs_fw.hdr.meta_data_size as usize)
+            .checked_add(hs_fw.hdr.meta_data_size.into_as())
             .ok_or(EINVAL)?;
 
         hs_fw
@@ -169,7 +172,7 @@ impl HsLoadHeaderV2 {
     ///
     /// Fails if the header pointed at by `hs_fw` is not within the bounds of the firmware image.
     fn new(hs_fw: &HsFirmwareV2<'_>) -> Result<Self> {
-        frombytes_at::<Self>(hs_fw.fw, hs_fw.hdr.header_offset as usize)
+        frombytes_at::<Self>(hs_fw.fw, hs_fw.hdr.header_offset.into_as())
     }
 }
 
@@ -198,12 +201,12 @@ fn new(hs_fw: &HsFirmwareV2<'_>, idx: u32) -> Result<Self> {
         } else {
             frombytes_at::<Self>(
                 hs_fw.fw,
-                (hs_fw.hdr.header_offset as usize)
+                usize::from_as(hs_fw.hdr.header_offset)
                     // Skip the load header...
                     .checked_add(size_of::<HsLoadHeaderV2>())
                     // ... and jump to app header `idx`.
                     .and_then(|offset| {
-                        offset.checked_add((idx as usize).checked_mul(size_of::<Self>())?)
+                        offset.checked_add(usize::from_as(idx).checked_mul(size_of::<Self>())?)
                     })
                     .ok_or(EINVAL)?,
             )
@@ -318,12 +321,12 @@ pub(crate) fn new(
                             dev_err!(dev, "invalid fuse version for Booter firmware\n");
                             return Err(EINVAL);
                         };
-                        signatures.nth(idx as usize)
+                        signatures.nth(idx.into_as())
                     }
                 }
                 .ok_or(EINVAL)?;
 
-                ucode.patch_signature(&signature, patch_loc as usize)?
+                ucode.patch_signature(&signature, patch_loc.into_as())?
             }
         };
 
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index ce78c1563754..ed82e74ccdc9 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -23,6 +23,7 @@
 use crate::falcon::gsp::Gsp;
 use crate::falcon::{Falcon, FalconBromParams, FalconFirmware, FalconLoadParams, FalconLoadTarget};
 use crate::firmware::{FalconUCodeDescV3, FirmwareDmaObject, FirmwareSignature, Signed, Unsigned};
+use crate::num::{FromAs, IntoAs};
 use crate::vbios::Vbios;
 
 const NVFW_FALCON_APPIF_ID_DMEMMAPPER: u32 = 0x4;
@@ -250,7 +251,7 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
         let ucode = bios.fwsec_image().ucode(desc)?;
         let mut dma_object = DmaObject::from_data(dev, ucode)?;
 
-        let hdr_offset = (desc.imem_load_size + desc.interface_offset) as usize;
+        let hdr_offset = usize::from_as(desc.imem_load_size + desc.interface_offset);
         // SAFETY: we have exclusive access to `dma_object`.
         let hdr: &FalconAppifHdrV1 = unsafe { transmute(&dma_object, hdr_offset) }?;
 
@@ -277,7 +278,7 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
             let dmem_mapper: &mut FalconAppifDmemmapperV3 = unsafe {
                 transmute_mut(
                     &mut dma_object,
-                    (desc.imem_load_size + app.dmem_base) as usize,
+                    (desc.imem_load_size + app.dmem_base).into_as(),
                 )
             }?;
 
@@ -285,7 +286,7 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
             let frts_cmd: &mut FrtsCmd = unsafe {
                 transmute_mut(
                     &mut dma_object,
-                    (desc.imem_load_size + dmem_mapper.cmd_in_buffer_offset) as usize,
+                    (desc.imem_load_size + dmem_mapper.cmd_in_buffer_offset).into_as(),
                 )
             }?;
 
@@ -338,7 +339,7 @@ pub(crate) fn new(
         // Patch signature if needed.
         let desc = bios.fwsec_image().header()?;
         let ucode_signed = if desc.signature_count != 0 {
-            let sig_base_img = (desc.imem_load_size + desc.pkc_data_offset) as usize;
+            let sig_base_img = usize::from_as(desc.imem_load_size + desc.pkc_data_offset);
             let desc_sig_versions = u32::from(desc.signature_versions);
             let reg_fuse_version =
                 falcon.signature_reg_fuse_version(bar, desc.engine_id_mask, desc.ucode_id)?;
@@ -369,7 +370,7 @@ pub(crate) fn new(
                 // Mask of the bits of `desc_sig_versions` to preserve.
                 let reg_fuse_version_mask = reg_fuse_version_bit.wrapping_sub(1);
 
-                (desc_sig_versions & reg_fuse_version_mask).count_ones() as usize
+                usize::from_as((desc_sig_versions & reg_fuse_version_mask).count_ones())
             };
 
             dev_dbg!(dev, "patching signature with index {}\n", signature_idx);
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 24c3ea698940..637adf989ee8 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -12,6 +12,7 @@
 use crate::firmware::riscv::RiscvFirmware;
 use crate::gpu::{Architecture, Chipset};
 use crate::gsp::GSP_PAGE_SIZE;
+use crate::num::FromAs;
 
 /// Ad-hoc and temporary module to extract sections from ELF images.
 ///
@@ -232,10 +233,10 @@ pub(crate) fn radix3_dma_handle(&self) -> DmaAddress {
 fn map_into_lvl(sg_table: &SGTable<Owned<VVec<u8>>>, mut dst: VVec<u8>) -> Result<VVec<u8>> {
     for sg_entry in sg_table.iter() {
         // Number of pages we need to map.
-        let num_pages = (sg_entry.dma_len() as usize).div_ceil(GSP_PAGE_SIZE);
+        let num_pages = usize::from_as(sg_entry.dma_len()).div_ceil(GSP_PAGE_SIZE);
 
         for i in 0..num_pages {
-            let entry = sg_entry.dma_address() + (i as u64 * GSP_PAGE_SIZE as u64);
+            let entry = sg_entry.dma_address() + (u64::from_as(i) * u64::from_as(GSP_PAGE_SIZE));
             dst.extend_from_slice(&entry.to_le_bytes(), GFP_KERNEL)?;
         }
     }
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index afb08f5bc4ba..fabb38fa8c55 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -12,6 +12,7 @@
 
 use crate::dma::DmaObject;
 use crate::firmware::BinFirmware;
+use crate::num::FromAs;
 
 /// Descriptor for microcode running on a RISC-V core.
 #[repr(C)]
@@ -41,7 +42,7 @@ impl RmRiscvUCodeDesc {
     ///
     /// Fails if the header pointed at by `bin_fw` is not within the bounds of the firmware image.
     fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
-        let offset = bin_fw.hdr.header_offset as usize;
+        let offset = usize::from_as(bin_fw.hdr.header_offset);
 
         bin_fw
             .fw
@@ -74,8 +75,8 @@ pub(crate) fn new(dev: &device::Device<device::Bound>, fw: &Firmware) -> Result<
         let riscv_desc = RmRiscvUCodeDesc::new(&bin_fw)?;
 
         let ucode = {
-            let start = bin_fw.hdr.data_offset as usize;
-            let len = bin_fw.hdr.data_size as usize;
+            let start = usize::from_as(bin_fw.hdr.data_offset);
+            let len = usize::from_as(bin_fw.hdr.data_size);
 
             DmaObject::from_data(dev, fw.data().get(start..start + len).ok_or(EINVAL)?)?
         };
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 206dab2e1335..b3ed164aa2ac 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -12,6 +12,7 @@
     FalconModSelAlgo, FalconSecurityModel, PFalcon2Base, PFalconBase, PeregrineCoreSelect,
 };
 use crate::gpu::{Architecture, Chipset};
+use crate::num::FromAs;
 use kernel::prelude::*;
 
 // PMC
@@ -75,7 +76,7 @@ impl NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE {
     /// Returns the usable framebuffer size, in bytes.
     pub(crate) fn usable_fb_size(self) -> u64 {
         let size = (u64::from(self.lower_mag()) << u64::from(self.lower_scale()))
-            * kernel::sizes::SZ_1M as u64;
+            * u64::from_as(kernel::sizes::SZ_1M);
 
         if self.ecc_mode_enabled() {
             // Remove the amount of memory reserved for ECC (one per 16 units).
@@ -158,7 +159,7 @@ pub(crate) fn completed(self) -> bool {
 impl NV_USABLE_FB_SIZE_IN_MB {
     /// Returns the usable framebuffer size, in bytes.
     pub(crate) fn usable_fb_size(self) -> u64 {
-        u64::from(self.value()) * kernel::sizes::SZ_1M as u64
+        u64::from(self.value()) * u64::from_as(kernel::sizes::SZ_1M)
     }
 }
 
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index a521c0a4df0f..234a9f29787b 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -5,6 +5,7 @@
 use crate::driver::Bar0;
 use crate::firmware::fwsec::Bcrt30Rsa3kSignature;
 use crate::firmware::FalconUCodeDescV3;
+use crate::num::FromAs;
 use core::convert::TryFrom;
 use kernel::device;
 use kernel::error::Result;
@@ -825,7 +826,7 @@ fn falcon_data_ptr(&self) -> Result<u32> {
 
         let data_ptr = u32::from_le_bytes(bytes);
 
-        if (usize::from_u32(data_ptr)) < self.base.data.len() {
+        if (usize::from_as(data_ptr)) < self.base.data.len() {
             dev_err!(self.base.dev, "Falcon data pointer out of bounds\n");
             return Err(EINVAL);
         }
@@ -953,7 +954,7 @@ fn setup_falcon_data(
         pci_at_image: &PciAtBiosImage,
         first_fwsec: &FwSecBiosBuilder,
     ) -> Result {
-        let mut offset = pci_at_image.falcon_data_ptr()? as usize;
+        let mut offset = usize::from_as(pci_at_image.falcon_data_ptr()?);
         let mut pmu_in_first_fwsec = false;
 
         // The falcon data pointer assumes that the PciAt and FWSEC images
@@ -994,7 +995,7 @@ fn setup_falcon_data(
             .find_entry_by_type(FALCON_UCODE_ENTRY_APPID_FWSEC_PROD)
         {
             Ok(entry) => {
-                let mut ucode_offset = entry.data as usize;
+                let mut ucode_offset = usize::from_as(entry.data);
                 ucode_offset -= pci_at_image.base.data.len();
                 if ucode_offset < first_fwsec.base.data.len() {
                     dev_err!(self.base.dev, "Falcon Ucode offset not in second Fwsec.\n");
@@ -1080,7 +1081,7 @@ pub(crate) fn ucode(&self, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
 
         // The ucode data follows the descriptor.
         let ucode_data_offset = falcon_ucode_offset + desc.size();
-        let size = (desc.imem_load_size + desc.dmem_load_size) as usize;
+        let size = usize::from_as(desc.imem_load_size + desc.dmem_load_size);
 
         // Get the data slice, checking bounds in a single operation.
         self.base

-- 
2.51.0

