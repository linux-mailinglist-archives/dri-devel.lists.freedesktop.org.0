Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E35C46EEC
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C07C10E3B8;
	Mon, 10 Nov 2025 13:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kpsXstvR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011014.outbound.protection.outlook.com [52.101.52.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEC710E3B4;
 Mon, 10 Nov 2025 13:35:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ew5mlWGo1TNcYPkJ6CvYqTNtW3EezV52AWuryzKcaYuNjFt2HstqKV9eSIs6Bmfbf5ATbLEzJIhZaq1NXTGZU8NMj5Hu+ahoLDLFRK5Osg7+zgAE5VJu40RwTck0vzaMU7475gjOEkAynJlpTL6grM2jgaW4ty3kU0THO0cjVkQDSr8zCmamWv/MrkxQW9Rc8Uwxdx/SuN7HewLTl0aa6p75hpc305LbBp0BFSN5cuH/+VxBOzxFbIXLS2iHGfmJ3syyx9BAGt/8ur0pueg2rvFczuLZ4Wd5vqJqAa/hu77mISvfYa9wyU1kZWjk1Fyv1w9bDbP8J4ouF046WoP3Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqBxLmE5Vh76KSTkKSvx92+Dqt7xcvt2/oeT4qycq60=;
 b=rgKkqq7AM5DmMmhLw7e0e8+l+COasE62T7gnfzkJFwVP79KfHL1AFGdxb0L8y9p6wmn8lQ0R6tmM2Z+y3PehF0B4EtDTE3LxXGV5kUeTYpsJGh/HKQPtQVwMTn0vng0hkIB2zcxncfkjV6myD/SLx4KK7ALCqbpycvLQf75/Ky7S3KiibW48RCrg7VNIcJQiH3fLxqfn5tY4OAJpapcQ7D9rIby9iiul2pyEy4uEWNJVd+8k7rMKL2rD6w33lxOXOX1M+uXe9ASwqxirITFGU38+0HmAArEQG8F6cNdJtKlMEUcARDHYb5VlQsjNgJNSzdu8Rdp3M039DrN/TZmCXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqBxLmE5Vh76KSTkKSvx92+Dqt7xcvt2/oeT4qycq60=;
 b=kpsXstvRww17io0jhxbOxMdJIpIkBHIfXnhSdSzfvX9CFWWsi7YFo4CmNbk+/V0ueQEAohf4XZ5VBy2PWbNO15CvsUYGWp5OfbW0A91j90lVDneuWpCpk0WxD2sjyeVQ6fYYPL2Br8Q+Ho2yqDNiKpZcOUfqWxli321eFqSXvh/iR+5NTvY3dcUcAhx6B1E+ZPW/18txuzTYILVq2lHkEsQ4nt/Ix2CgwAJomXFj0VTW+MT+le4JYnk6L8kEgcgtXBuC/vpW03YxVkitxThE8qcxbVER1JRl4u+8dc5h88DQvYkneS1SFNJ9jlZFOdwIeHU3u+Gig/wS5BFSFsNgiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH2PR12MB4055.namprd12.prod.outlook.com (2603:10b6:610:78::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 13:35:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 13:35:12 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 10 Nov 2025 22:34:22 +0900
Subject: [PATCH v9 14/15] gpu: nova-core: falcon: Add support to write
 firmware version
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-gsp_boot-v9-14-8ae4058e3c0e@nvidia.com>
References: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
In-Reply-To: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0067.jpnprd01.prod.outlook.com
 (2603:1096:405:370::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH2PR12MB4055:EE_
X-MS-Office365-Filtering-Correlation-Id: 22aa4e57-3b93-48ed-eabf-08de205df94b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUhEY3VCb3NFR1JXcUNXNU9kZlU2SkRQc0ZuTU9vaGZLYUxUZzl6SXpBRE82?=
 =?utf-8?B?YVZ0UjgvdTRZYWxBKy9Ja0lRelJVM0U2d2xib1FMYmFtVlk5U0QvQXJ5RGVQ?=
 =?utf-8?B?Rng3eDNEZ21HRVRkamM0dDI1T3FrUTVIUWtJRUZvM1QzMSt5SDJ6OUFoZUJI?=
 =?utf-8?B?d1QvTjZmT0tobzBKaHVVdFg2WVVqMEpQaHZ1bGhudTlhbnBFaFArVHNHTCtJ?=
 =?utf-8?B?RjhFZEZ0TFY1RnVVQUZwRmEzdmZIVnBESTV5OUVQM0hhb3V1SzdzSDk2OVM3?=
 =?utf-8?B?UEIwQmUwTi9abkxtNVFaaGJpd3kxUzg2c3RnaHQ3VWNmZ2JDeFIxa1ZjNnFr?=
 =?utf-8?B?eDZOU2dKaWZGckdaU1A5d2xVQ2d5emJCbndEbWFIQTIrL240M3lhMXZlNCs3?=
 =?utf-8?B?YU16NC9sMDB2dDBZbVhpS0Z3UUdVcHV6ZHMwUm5KV1h1bmZmbEdXaE9EQnVm?=
 =?utf-8?B?Y0ZWcHNUN2lQdEl3MGlLbURVTnpyaXZwMGJYUVdjeWEzNmZOZHd2L1BaYk1y?=
 =?utf-8?B?Z25HSlA1Y2RKajVuNEFoM3VLM2dPK04vZ1RNSCt6UW9vOU15VFJURmxPZTZq?=
 =?utf-8?B?S0ZxRHEvZFYwWUJWQXpTcDRpZ3VjdTJ2QTNyeUlBTVlGQ0kzUHo0OEZ0M2J6?=
 =?utf-8?B?azk1b29EbWlxU1hFbks4Qnk0RDdTT0NmbW5LQm1DQ3lWQ3drcER4U3pzaGJI?=
 =?utf-8?B?UkF0U1VDUER1RmJJUkRiYkx1SXlldTQvK3BDVTdzRk54NGVtU1M5RmJ0NEZY?=
 =?utf-8?B?QTcwYTRMQVBhK2QxU2hSNUQ3NkIyalF2ZzQxUDBZUEhPb3ZGR2VtZVhyS0Nj?=
 =?utf-8?B?YVFENlpSY2wzSGZPMnZtTTBLUFJrL3lTd2plK0h0ZHVkOG9MOGZzRVkvRnhI?=
 =?utf-8?B?TGdsbHFCQnY4MksycEdTMVUwRmtEa29KLzhibXRhQ1lVcXN0L2hSWUNBUm9M?=
 =?utf-8?B?cUdOc0owcnIwc1Q5WlExUkJ1Z003TmdEMFBRZklGenlsbWROSVBDNk5HSm82?=
 =?utf-8?B?U3FncmFHam5ZM0pFcHc4Tko5VGJaSHRtWkNTenRSdUN6Y0VNQk5YdkptVzZ1?=
 =?utf-8?B?YnJ4VmxiS2VJeDFWcHN0dC9RdUYrU3ZjV3NTRllTbm9xT2VOdnpSTUtxUlg1?=
 =?utf-8?B?V3Nrc0NQUnBJNkxKVy92VWlsWVpUWFN4NjA5bTAvWHpZVXUxWE1OZTc2ZTlY?=
 =?utf-8?B?M2xMeitaMWE3SHdTSDg1OUUrZnVmckMzRGkrNFBnb3FjNGZHYTYxOXFEdzh2?=
 =?utf-8?B?UUFRYTFHY09Ka2VQcnp4Mmt2cUNybW5La3RhdTkvZjhnaUFmMWR4T01hR0Uy?=
 =?utf-8?B?M3E4cTdHTzFaeXc3RWF5UXB6UjRlWkl4WkptZVBkZ0FEYW5VcVF4dDRHOGxQ?=
 =?utf-8?B?ZENYQmpIVjUyb0ErVllLcGdIMWJMZzRqRTAxUWg1TnpUL2I0bzRTTDdjRXc1?=
 =?utf-8?B?UzcrWTJqOW9IWVZaU2RXZlN2TTk3OThuMlR1bnpVS1Rkc0g5WDZkRWljU2Fh?=
 =?utf-8?B?K2I3b0l1Z1d0MTdtNDJNUXp2REF4bGk0OUtaUkovOGwrUUZlODdqVE9CVjVY?=
 =?utf-8?B?ODRMRWVhU01HcXdFVWM4dVdCcDV6WHViRFJObnJkTGdRdElVeGlqWlFtWG80?=
 =?utf-8?B?MmpSVjUrbVhLaHYzVm5vdkNCa1k3NEFSd1dwTml3OTQyZXI2Z0FPOE1DTmMz?=
 =?utf-8?B?QVV5MDgwdGNnUVBOQ28vdURLb3piNDcrTCtZZWR5YzJZbG9YcFh5RjhIS3Fr?=
 =?utf-8?B?c21ucHdiak9LTStyM0Y2c1lHc2x3amNjbjhnL0M5VS9SL28wR2xuYURhODRB?=
 =?utf-8?B?ZmlTZzljVkVYQVAxTGhCZjFzd1N0U2VXc3FVVG91ejh1QzNycjVLU1Q0MnZp?=
 =?utf-8?B?WDdqd2xpbDdKYlY1bkN2VlRMT2xlK1JLTzdaUkJiTG5RTGRQbEZxMjFDTVlP?=
 =?utf-8?B?VWJpQjFYeWlZMTQvNGVoY0pRNHYveFcyUng5RjFGbUlQdWxmVnNidGRWekJE?=
 =?utf-8?Q?57XKeFCYRgCFyvvvH3OEmIrILTbJJ8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHJrZzRVSEJYU1MzQTFLUGZuTlBUL2xQSUlaMXh4eGJGdm9vcDg0QW52TkZY?=
 =?utf-8?B?TjZ0dTcxa1cvNG1BaWdIdEtCRDBSeUxnV0EwcmpQT2x3ZHQ1QmtRYjBjT0xm?=
 =?utf-8?B?VWNYZUkwbHhpOGMwcE9wK2s5TndoVnpCYW03UmZRUUdIbEtDamRpQW9DSmVK?=
 =?utf-8?B?YlBISks3amp0Uk1ZcDZyQWxKUmF2QkRaN09vUGJ2K0lKa0l2aGhWUW1JQ0ZC?=
 =?utf-8?B?UG1oOG5rWFNnNHNTQWh4c3VXaCsybCtyVk1NUzhPV1JYb3R6eVdKVHBJQVEy?=
 =?utf-8?B?YVNHenBwWm8zZnRPUUZ5WHZIRG5QTVBWbndQN2JuNU9LTDZJUlZIR042b3Bl?=
 =?utf-8?B?UEVKUGZ1NVBxN2U3cDJwbHJKTElJYkh2bVJyYzJXdllDaElHSUtZdGNTakdi?=
 =?utf-8?B?a2JDdkRtOEhBMHpJdFk0cnZnd1puTTRZWmRPa2tFamN6K2VVZFdUSjZGOGRW?=
 =?utf-8?B?QXlRQnJoeWV4TllxdXROYnhucHR1UytpTHNjZkxOZ2Q2YjB5dHBidVdaOEJ5?=
 =?utf-8?B?NFo5ZGM1TGZxWnBnWUx1T29PVzNadHVzckRnWVY3ckJaVTQrUDJnT05vem9C?=
 =?utf-8?B?TkpTZElFQ1hvODlhOHdHT3hXVDg0bUQ1VEo5NlNIbk9GNFBmODhHYnFNVHR6?=
 =?utf-8?B?MUlSYy8yQk05RjRPY2tXTVJ1ekI2QXUzejZVdU5oeEVoNFJvRkVRKzhoTUFI?=
 =?utf-8?B?amdNWW80aUgxcDZISGVPMVA5clZaajVVRkhCZnhWM3oybGJDN1M4b2ljWVFO?=
 =?utf-8?B?UG1uYS9YZFNnNENCS0RudG40QU9MRSs3cHZ4eWltYlBoTUZuRndGNEtGY2R0?=
 =?utf-8?B?WG41bU5WNG1wSGtTL1FCZGwxazJQZTFSUXZWSVFaU2ZabFpWMGdGdkN4NS9a?=
 =?utf-8?B?c3JzQ3JwWllqRWlUbmZGQVFuN1BuNWJ3bHdQYnlkNHZUK1V0N2hvaFhEeE9Q?=
 =?utf-8?B?OFk1UHZOK202b0MvOVJIZ09Hc3diWmdTNDVWZEhZSUNRZUI1K25nL3lwK1JM?=
 =?utf-8?B?R2ZoYXVXRGNVUXVpZUdTZFB3SDRJSEhBOVJCNWU4Y2pFbTlIZm9rRDlwdDRt?=
 =?utf-8?B?bTFiU25YcEpCazJWOXdLMzV5SFVlMnpxSFBSbkh5bnRLUzFwTDlvZm0yZXRD?=
 =?utf-8?B?YmNQS2dKSTZ5R3BkUEVvbXNaNWkxZ0didVNSQkhLTGU2NmkrRExzc1ZpY2U3?=
 =?utf-8?B?YnllcDdjNkY5MXBlR1ZBZWJjMGtVMDRxWG1yMlhMRVkyb0M4Z1FXZVQvWlc1?=
 =?utf-8?B?RFJPdU41SGNmSGNSanA4NXFzT1NHNllEOUl5S2NrOUE1SkREenFsTWtJQ1ZQ?=
 =?utf-8?B?cDJGWjl3a2tGeURyWU1QcU0yL2d2c3hBS2JHMFQ4S29RUmlGR1BJVkc5OWpx?=
 =?utf-8?B?aVJmVmhYeVVzaUc2d2NSSDdGZmY0K1NlazhlZlFhOU5Ld25LZU9mRFpPTDln?=
 =?utf-8?B?RFRWaE9tQXB5WG5yTjY4UWtJT1J2L2o4V1BQMkxyckxZVGd1TjBpRUZuNFEx?=
 =?utf-8?B?ZjdCZXQ2ZklQVEsvVTZRKzNUN1puaXF0bUVCVzBLOTBWTGVzQWhJRndXeVFu?=
 =?utf-8?B?UHBBeW5ZWFp3U3FhS0hGUmRwZmo5NVV1NTFHSFZmMVVTbStya1NqRUxiUmsx?=
 =?utf-8?B?bzA4RGp5ZmJ1aUhwQkpoajFHM1RYWTdoU0EwaGY5ZGlkVUpQZFFrNWlieFhS?=
 =?utf-8?B?Q3licmIwOEdqZGlucGFkWDlybmlPVjRmOEwrUnVVaDZnSVlrYmpqYXR2NG4y?=
 =?utf-8?B?TjBpUVM0d1B4TzJtSGpZUUh2NUlzZDgyQW5YMmZhN29LZklSK2xoZ3JrMjYx?=
 =?utf-8?B?NEF1T0pGcWt4bGx0L0FpcytRVjZrSTJRdGM3Z201a25IV0RnWnhFTkxiRGNG?=
 =?utf-8?B?bGZsbndwM1MvVVQxZWx2enZDdjE3RFFRdnQ1MXcwK3lOVmZjNGI5SWhiaEhY?=
 =?utf-8?B?b2ZEY0s2RDk2Vk9xbFc0WDdjMWV4WkxMTDZ1a0FZcDZMeCtZY0FBbGozVVhq?=
 =?utf-8?B?Wk5jV3A2QzNJMXAxbmFZSTlMZFZqRGZKTGcyV0F2WnpUenpOcW1HTmVxOUk3?=
 =?utf-8?B?V3RHbXl5QlBiVEl0aTE5VEZXdndqSmFMa0VBdExSMnBTYkNOOUJlTmxnOEJ2?=
 =?utf-8?B?azNJbllMMStpN0VlVHFVVFkyWU96Y0xMbXpuRnFldDEzYmtMNDNqNll6SmhR?=
 =?utf-8?Q?GbmTj8c7gMxLKz34IJs4moBA1iTaOKgjP1GtSDMgf7cJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22aa4e57-3b93-48ed-eabf-08de205df94b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 13:35:12.1163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s1jelJhcgbUiYkdgOg3tJpz9JMmKofLbK6cLttjkUEwXzvf1fBNsz4f8b8U6OKSy3WL/4G6v5g/noiJ6/9ZyiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4055
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

From: Joel Fernandes <joelagnelf@nvidia.com>

This will be needed by both the GSP boot code as well as GSP resume code
in the sequencer.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 8 ++++++++
 drivers/gpu/nova-core/regs.rs   | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 4c1f36073533..31904e1d804b 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -621,4 +621,12 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
         let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
         cpuctl.active_stat()
     }
+
+    /// Write the application version to the OS register.
+    #[expect(dead_code)]
+    pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) {
+        regs::NV_PFALCON_FALCON_OS::default()
+            .set_value(app_version)
+            .write(bar, &E::ID);
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 5d5ba766cd61..274e53a1a44d 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -230,6 +230,12 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
     31:0    value as u32;
 });
 
+// Used to store version information about the firmware running
+// on the Falcon processor.
+register!(NV_PFALCON_FALCON_OS @ PFalconBase[0x00000080] {
+    31:0    value as u32;
+});
+
 register!(NV_PFALCON_FALCON_RM @ PFalconBase[0x00000084] {
     31:0    value as u32;
 });

-- 
2.51.2

