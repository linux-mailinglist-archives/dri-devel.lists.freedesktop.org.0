Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C286ADA769
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 07:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D5710E289;
	Mon, 16 Jun 2025 05:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CV571F48";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD5C10E289;
 Mon, 16 Jun 2025 05:14:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kn3PN5AlmUlq/rZb2sLkrEXbkByJOH6fXdG3NpDlsO33ixk23oZwV5bCoXVEmGUc9cmXvvEyeK7R8AXyTmktdNIv5uRtoYEUrB0zScp0Rqt5E5Z0NvOYjWgCJj+l6cluS6bk0UQG9eHUKt01mgjLW5v3B6AB2bed8vR7/zYJcGbEEFdisPba9RYQbK0aPInMKJvmcIEalbdDJwsUuBLZCTNQNlx2OiEfP31hXRjLk8xDhOX6omDytol/JgWaQWRKKxWPGlZQv9wTtMV/Hq9hUDJh9tBvpR3t6DsYK+ky4yl2jt7VtKB7nfrIFv9A8/A27sWbqAZXE0zGK3bNe6IkVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9jADYAQNwfE400LwG2hUM+yDvWjtnHuNrbvDNYGPt4=;
 b=F3QO73DZCmXlGOlvNr0iNb7sjyuD7o8Qsa4TGfLUDbFqg0nwWTmdF/mvuDAjzJyA7VRmcL/x22zOk+6/07lWGigrD4DO51s8fW8rj9PFbu7PiahNGJGxgIvqKgkKTtT2EbBTNsCbQz0z/3m7/DMLeS1z0RxRi/GhGPxRj3Y9TWhCacF2naE7SpJjbHdXzhAT5Kp71kE6ttQaUsa70YJyCYxuhe7Pdc9wkT/z683S5i1KDU9n+aa2GWJL9GA8c8JfuiAbbt8EZ/OINlHOLhYdGt7GDyiz54eyk0kaF0zBSu2k/asvhNM8bTSTBF9l5Nseq0nT5rJo/H6jbeFs2LUgNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9jADYAQNwfE400LwG2hUM+yDvWjtnHuNrbvDNYGPt4=;
 b=CV571F48LSieyvP9xVrkjFmFFtwx2Dl6r0IY2zq7rQGJ3hhnS/51bUwY3UZO+RZKE73Ndpfs8j0RwDYR2Wog/eejoPSy1jzcwqLFvCVGs/vi7dP83Dz63KHwkXUYRbOSDFKWdGG8OH2naTILD+5Gi5qtfxK+UO7Gw81pUvaopWdVKKoy20Ozw31Hzv5Vf4jT0n0oRqKFyJ2Hka+HO9Pf0zxS1e4RBVLovldaSJgOFPAlNsmWiIHT2TthoR82ekwrE/2GOefqu2uLTd1c5zeowfRacsiTKfTjJz+7kjdI79zvBsXPom0lP/J15rCX08ER8BVodpGsxtzhDPqwxspxrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7610.namprd12.prod.outlook.com (2603:10b6:930:9a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 05:14:00 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 05:14:00 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Jun 2025 14:13:56 +0900
Message-Id: <DANP8VIXMJ0Y.3U3ZP64DCB1ZM@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Benno Lossin"
 <lossin@kernel.org>, "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs"
 <bskeggs@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 04/23] rust: add new `num` module with `PowerOfTwo` type
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>
 <CANiq72nS5DR2NxLoba1w83=Qsqzi-gdK7Le=y7BxPxQP5U6Rmg@mail.gmail.com>
In-Reply-To: <CANiq72nS5DR2NxLoba1w83=Qsqzi-gdK7Le=y7BxPxQP5U6Rmg@mail.gmail.com>
X-ClientProxiedBy: TY4PR01CA0036.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: d48e330b-25a6-4d13-87e2-08ddac949a3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmEzYWpQSVFGRUhsVDVZa1RKUVVPS1FDNjFEaVdRNytXajVGK0EySHgvNEZy?=
 =?utf-8?B?emN2S3EyNkhzNUFEbmEwR0hoRHgrUHBPYWNUTExkNWJoeWFmQUd3RjJuNW1k?=
 =?utf-8?B?QjZ6ZzU1dENtdUxycWhEZ2tvd09zcnRmZnZpbktRTkx3b2NFWHVQZ0ZGaVRR?=
 =?utf-8?B?RC9vTkptWEVwVE5BVytCYjJvYUxRTnFlYngvcWtpYTBpdC9KSFJnakdiYmcy?=
 =?utf-8?B?V1dHZUMxeEdZbzV1Q25FaEMxN3BoKzQ5SG1idnRFZDdSL1ZVQ2FBQmxpZDJG?=
 =?utf-8?B?cnFZcWh4NlIwWHo4clQ5VUNmN1BGZlBReVFHdW1iR041Yy8wSG5GSWh3NTJn?=
 =?utf-8?B?cDQ5UG9vVFE4NXRTTVJrM3k0NEt4QUtWTmMxOVM0WWphSEZTQWtDNE1qNFJD?=
 =?utf-8?B?R2xmTjJXckl1Kzh5QTM4UUxLRkp0L3V0b1pGMWpwOExnazRXUW9mTTNEQ0xz?=
 =?utf-8?B?QWw3d1hIemhtdXlpb2E3K1hVTFVjUkhTZWRNVTNhUHNOcDEyYTZTWjZpRkow?=
 =?utf-8?B?aXlmb1hwOVliSmVoZWpLcW92bjk5RUYxRHNEMnE5RE1KUDNOZUVoN0lKT1pz?=
 =?utf-8?B?MU9jUXFMM2pJc0txYi9ZRHBJK1JMZEQvRGFmdm9SMkgycmJhU2JjdlVoMjlH?=
 =?utf-8?B?QTdjQkZMVXlib0xKREJtT2NleFl1a1VFM3Z4S1VRQ1hGUGJGKzZ3R3hIMFpw?=
 =?utf-8?B?WktNaTZFRW5ITUNyVEgvQ3B5dHR0M1pTelRCLys1SzM3TW5kOHdsa2hUMnNm?=
 =?utf-8?B?ZkpZN1hBeXdWUGp5VWYvR0NUdlgwdm9zanNaNFlMcEFwS0RaK2tuU283akUy?=
 =?utf-8?B?cE15RW1ZYUdMcDhRYm1LQXNteEJIVHA5RGpnbFBCd1IyajlsU1cxV3lmdXF0?=
 =?utf-8?B?QXovVitBOTN1T3BYblFXMG0wK1lEZC9MNlNTYWdndmN6RjAzZTR6YUVERzlh?=
 =?utf-8?B?MmZkQXU2Q0M0M2J5K3BEV1AyTFBlbG5Uclh1WTF0VFMzZkV3eGFsUnVhR2U3?=
 =?utf-8?B?TEhZdnhFMmpZb2ljSW5vQ1V0TlNKZ2U2TytnbDNNMVd4bStmazRhaDRTR2Vq?=
 =?utf-8?B?WVdxdmZ5UWRvZGpuZEhVZVAvYjNxUG05UFptVXpoaXUzZlA4QUp3dW5YdWRt?=
 =?utf-8?B?eUtNNHlQLzY2YTcwZGlOVFZGZ0VDK081UkpsNzlsbjdJUmpOYlFDRURvYXhz?=
 =?utf-8?B?ZStCODB5VW9xY29WUEttOE16ME5kLzI0V1pwQXREVkdud1hKNmNscVBrd1RI?=
 =?utf-8?B?STRJYUd1RG5uSmg2aDNQdTJIRnhEdTZNZjUzclZtYll0eDdsOXpSbk5HTlpq?=
 =?utf-8?B?T3FvMkJEQU1leU9OV1hvbjFmSkVhODdkWjNhSU5ZTU5lcmtNZmJCYlIrQTZX?=
 =?utf-8?B?dDRkOUJnY1k0Y3FVS2VjQUl5dHRhandRajJDSFkreTNHeG55L3oxbG5JTmF4?=
 =?utf-8?B?NWlFUW9ybTdCZmVtQ01kZW43a1BzNGNhZGJSZmI4ZlpNeXRmNlRrVzlIM1RU?=
 =?utf-8?B?VHlwMUxlY0tTNHgxSS9jTVB1aXU0bXFjZ2laR2k3RkhYcmdaZVpCSWpUNGw3?=
 =?utf-8?B?c2J0Q0xaWVdJMmFSL2Q1WjV1NzJlZnpWS1JLaVREemJIL2ZEUUNlNVhKcnB5?=
 =?utf-8?B?bkp2SjRVcVE2ZzRzZ1NxSnB3VTZXOFRaWjJ1cVV3WE1GY1VZbW16c2Q1VFVm?=
 =?utf-8?B?c2RBaVM4dmpvRVhMekpyMDBOK0RTZmwyWnUxdjZsOW9iRWIvQ0I4QmlLQ1JB?=
 =?utf-8?B?N2xFd2d2U09TYitENXBVTXVaQ1B1RjU1QjBTL2liRUlveGNuY0pXVUJyR1Ix?=
 =?utf-8?B?RDBFTTRLVnRVeXZhK1ExWFNaOVYrQ1AzWlRqN21XNXZqWnhZUkowdk5VYk9G?=
 =?utf-8?B?bFd0Z1YySDhYZjhUeHpHbDc3TGtqOVVRSzNUd0xaZkpxNFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmw4VnlSL0hiTklQSjFRS1JQZnhqOExXdEdpWGw0eGoyUkoyZDNBZ3VRdDRs?=
 =?utf-8?B?eCtscm00cGlWOGpzMnh3RzFvVEFPRlozaVRjbkVpWFFFRmRlY3gxWk04RzVZ?=
 =?utf-8?B?Y1RMOGFleUZSc21ER0JQVTMvVFhHWm1MaUdWYmdQYnlKeVpEY2dvcmplR0JD?=
 =?utf-8?B?OUowUlF6SERpZ0NDdGhabVhoTTJBTnpOdmJ0ZVdQR0FRQTRyVzBtUlR3MTNP?=
 =?utf-8?B?eGN1NVlvWDZBSFlyZDhoV1JTdnlRL3YxLzhheVpMU20vaDFOcHJkSWtLTm9k?=
 =?utf-8?B?bFUwLzJaRVNkc3ZhNW9JTENKQlBQSGhBRGxBWXVrV2N6eld3ZHBKUzRZWXRh?=
 =?utf-8?B?OExvYlNXM3ArYzVvL1QrV0hiWmF3ZERSK1BXelNmNTJWZzZCc2RJeE1iK2R4?=
 =?utf-8?B?L2d2dU1OWkJqRXJ4dit6T0NTSnVNbXpja0JkRm1OcEFGdnR5SXh0K0kzVFVu?=
 =?utf-8?B?L3F5UnlTSjhEWkc1NUZaUnV3eTUwR1lRM0k4Qkh0S0FyeFJ3TUJ0MHlSQ3U4?=
 =?utf-8?B?b0Y4MHVWelJtOENaZ0dZcnBFVm54Nk9UeGN5ejNyMVNjRSswNUp0SzZXL01u?=
 =?utf-8?B?T3NGeURYdm94SHNrZGR6K0hudVo3cUd1dlNpL1RaalVhSHdPcEljRmNsNExp?=
 =?utf-8?B?UHB2SmFJMXgvZHFpLzBUTk93VXZWUWpBU1lLKzFDb1U3UjRRWEdzd2dhb2la?=
 =?utf-8?B?b3k5SjJac2FKMjhxSnp3TkduRVdtL3docFJ3QVllcUtSRGFDdlhGRWhDbER6?=
 =?utf-8?B?dzZhSzhQcWNXcHVtMDJOQXRrU0pNb0dDVzFGeWx6b1ZqamlzeTVNdU9NdHYx?=
 =?utf-8?B?SVRWUEc0bkUxT2h2eDNKbjcyYW4ycWdFdHVDVWhyc0l3OGlqRjBTQVJTdzhW?=
 =?utf-8?B?WG4zWHl2THN4YmFSV2lNMitHRWlHVnNYNTl1VjkxYnBoeE93VEcxZG5QSS9I?=
 =?utf-8?B?UWhsR0ZiNFNQbE5lY0tMTW16U3BzcXhzamw4TDlSWUljaUlUZUdYZDdyeEdo?=
 =?utf-8?B?SEt3TmxPYUpWaUl2d2o0WkNvZzV0QjZrTFJXSjVyWWZkUnoxSXFXaGlOcm8x?=
 =?utf-8?B?SGJNYkRobkpWK2NxeFRQMFE5M216bWtHRnNXZnA0YTBHOVV6enhCUC84REU2?=
 =?utf-8?B?V05qVUVoc2lMQW85djVaN3JSNVdXcHRrQ2d5L2l1RVZlWXk0ZUJtRzhiaVM3?=
 =?utf-8?B?ZVYyOWlQNnFqTnB6eDcwYVNaVUhwMldYTTU2b29VT1AzWks1K2JRWStOM2o4?=
 =?utf-8?B?KytkeTNiTzVZR3VkNUFZN0NmcjFKd2tXRTllRjN2RjVkQjZaQ3pmUENWSnFl?=
 =?utf-8?B?VHlMQTQrOUY5MG5DekQrSW1ObVBDYlF5NUovc3kya0pJaVluSlY4T1JTam1l?=
 =?utf-8?B?ODV4TG16bythS2I1R29BL01LQW1aa2tKd2R3a3hxSWh5QWVEdGNIMFhCbjJv?=
 =?utf-8?B?ZEtHWTV3L3ZHbW5OUkJYeFN1ZlBCY0VwRjFXYitVem83Q2tTa2pPZ21IN21M?=
 =?utf-8?B?V0JkVU91b0JHRGk4NitsZWQzZ3d0Mll2cmJ6NHpBVkVheEJ0SlpVRUJoT1dB?=
 =?utf-8?B?NEVhc0FKNXYwMVJhOHlTdUJrRURoT1d0UW5RSGtNNDNGY2I3aTI4Q1p0bkJK?=
 =?utf-8?B?a29zMGJBS2NIdXFrbEtnblpRWE9rUk9CSUd1dWFOSDgvNHJaeEg2NnFEckRy?=
 =?utf-8?B?YnRxeEdvZUVLOEkvcjdjUExhaGtMc1d4KzBEVGxJU2ozZHBKWXEwZ0xxV0Jp?=
 =?utf-8?B?VG00MFR1cTR3dTNIMk84ZmE3QURuWlBTZy9OdUhicWFzek9YTUpjdVFJV0Vt?=
 =?utf-8?B?c0xCUlpGYWh0RENNeUsvMXkrUXhMZTJJdVZRZi9mc012cjhDQnZLcUlEWDVR?=
 =?utf-8?B?MkF0Z0NRaEhUK0JsczBqL283emZlN0RSVUR5bUdjSjZrVkU5WHNLS0FqM3pt?=
 =?utf-8?B?V0diYnRaTE05djZrdENiLzVoZ2kvTHBxYmxDcVd4UWFTYll6c0wxbWtlSkt3?=
 =?utf-8?B?anNid3lZVnlyUi9DbW1ucDlGbVAwK3hzcU1KeVRmUDl3cjB0UXBqZFI4NE03?=
 =?utf-8?B?NGE4eVNTT2lyY2pMdzN0Q2Uvcko3YzRLWmR0dEoya004Tlc3aDJ6eDR2dFE1?=
 =?utf-8?B?eDNFVUxUV0FKdEFIdDdnSUZUeE9LNDRLV2RBcklIeHh0QnB4dXlIcUN3QS91?=
 =?utf-8?Q?ONREWtEA2BfahHJXJ3lTZjPbVFkzSiV/Zs57f4ONelY4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d48e330b-25a6-4d13-87e2-08ddac949a3d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 05:14:00.2015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15L3w3kpsAQ7hGyynF2Z/kvwllgiWb0tRoVXn4+g41CmAULrxs33rBIufj27Vx113ig6ZbnWad0ft8nWlKtqng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7610
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

On Sun Jun 15, 2025 at 10:32 PM JST, Miguel Ojeda wrote:
> On Thu, Jun 12, 2025 at 4:02=E2=80=AFPM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> +                /// assert_eq!(PowerOfTwo::<u32>::try_new(16).unwrap().=
value(), 16);
>
> By the way, we are trying to write examples close to normal kernel
> code as possible, so could you please use `?` here instead of
> `unwrap()`?
>
> It is not a big deal, when within `assert`s, but there is value in not
> showing any `unwrap()`s, and to spot easily places where we actually
> do `unwrap()`.

The fact that `try_new` returns an `Option` makes it a bit difficult to do
nicely - one would have to add a verbose `ok_or` to turn it into a
`Result`.

But that doesn't matter as this test can be (better) written as follows:

    assert_eq!(PowerOfTwo::<u32>::try_new(16), Some(PowerOfTwo::<u32>::new(=
16)));

And all is well.

> Also, please use intra-doc links wherever they may work, e.g. I think
> [`PowerOfTwo`] and [`None`] will work.

Added the links where relevant, sorry for the omission!
