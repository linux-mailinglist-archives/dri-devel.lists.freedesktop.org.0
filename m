Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF472AD72F6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B7D10E853;
	Thu, 12 Jun 2025 14:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ERZ7ep8z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1990310E855;
 Thu, 12 Jun 2025 14:02:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+JdEk3yfgvWws2gy9tSn6q6sH9mHtOQ4/t+OZyTpqT9Il21+0bHZtpVh6scvI4lz5C8KuJoUxTtrrQuuaI/NqSopjbvVBSNgA2x2BvfYiCwlsaZ0eYDKu3c/NmlCNwB4g8wf0hUKpZLMZFzwUDiOvvTwwTlVU2nKrPT6gwA/93ou+kVAm5kbHQ1x1JgEYqg5HUhoM69I2qyc4W7dWoYfc9u0cthEofQHY26Dm3twpeCXewhFRZ+hw1tyfei21qTxbwoHd1eLTyFIWmzNUhpucy/MjsNtdFUkqPMWSubs0vatY9qJogxlJ1SUVbrJMk5bFeH/SyzM79lKHQAdLrrkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ur6LR0qiyX9jMhQYyK+1znMpt01tGWciW6qyklaxXyk=;
 b=JJEa2g02zPvUuXHsoo/0lXAsJYzY/rRRuaXy7GsNS3az4jI8POSP1JFOT0ASs3xTSpjGR0Aac5JiHME3KhAZQjV/93DuPKafvj1YQ5z4yzdGOAJ7CUUMKtO3+0oHtSVT5cG/IQJkNTiTjv8aVjyiNptiQVE5Q9+YxxGzrzMnbvkgZtgkeC9hHh2d/UDGKZXPQ29lgrzs9nuxkO+kvgoMWsH26+m88sgSveA+Ex2gv0/6IEEtF7nuIKRJmX4quBp/YoGCzLA5JFfI/pQae1qNyGjMoj0MJF6YTMayR1byrAbDQempqTdnke5/s7zTE0KYfEMiNx+Df3L4oQyEU/dS/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ur6LR0qiyX9jMhQYyK+1znMpt01tGWciW6qyklaxXyk=;
 b=ERZ7ep8zFwZd4HruphTQ2zHB8OAtv9pM/noYWuh/zGWIYmy9asg3fCsJdsP4qJ6WI5HJzkMLmV8tqoa87lmzN2ds4HWacPX012lif9izQdv6Cwecr6zSHlI1NJHOCd4yvAkx7f5LW41FiJZDDj+CNuMrnA9xlQIxrPPVTXJEm/ACWRAsvntAWZHmUmxLpGwny4GZckHnAjlTytSwoWImeDxxOI7e4fbPEz7ob/DubIC+mQHTyCUAXWYmfZ6WNBawgPVlONYSUHrvxST64cm/iZgP1j8czw4lj7tg3VzzJKRT25sDl6JVo5kNd0BnuctrhUBH+5JSos3k0y07hsjdGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8458.namprd12.prod.outlook.com (2603:10b6:610:155::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 14:02:55 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 14:02:55 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Jun 2025 23:01:36 +0900
Subject: [PATCH v5 08/23] gpu: nova-core: expose the offset of each
 register as a type constant
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-nova-frts-v5-8-14ba7eaf166b@nvidia.com>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
In-Reply-To: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0079.jpnprd01.prod.outlook.com
 (2603:1096:405:3::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: 103318c5-ae7a-414f-a904-08dda9b9d469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OCsxeGhzd1E2dlA2OWVHeVlUK0R4Vit5SVRLK245aHk5UHk4Nm04Nm1mTnE1?=
 =?utf-8?B?QUFiTURPZVZSZENZMEU0cmVUc1JzRkRtSWoyQTBwRzFoSWlXQ2VjcFIyQ21O?=
 =?utf-8?B?YlJ3L1E0WDRINkpKV1dxK1dFcTlvMjZER2dkU0lRdXdiNzBrbmdmVk9aTzFn?=
 =?utf-8?B?MjR2S3BrZ2hEU0pibGJtcFBIdDJXYWpvZEthNXcwMVZMc2JBZG95TlIzREZF?=
 =?utf-8?B?VlJCTlgzcTNNZS9IanhjaWRMS2ZGWEFWZERUN2crMmFTaFVXVTdDTllySXJN?=
 =?utf-8?B?VHpybDNqblllQm5uTWpmSnduM3J6cFVENHMyV0RWVWs5QVFMYzN2T3dTN0RB?=
 =?utf-8?B?QXJWL0NTOFIzU3NMeFBzWVgzaU4zYzNQeGdJNzRPL1Y5b3ZnOHpvRVYwQzFQ?=
 =?utf-8?B?K0xNL01kRDlsOWticDRKamJ1NW9YNWYyaWltd0RxK0F4dTV4Rm96L2RpUW8y?=
 =?utf-8?B?aittYTUrU0ZXb05mNDVpSW5Sei9aRUl3WVl1a3BDaDg1U2NEczVtSE5jNUc2?=
 =?utf-8?B?UC9ZdEhHWFN6REdWWldjSUsvL014WUx2bk5DN2tCYnVVN2YzZU5qejN6SFUx?=
 =?utf-8?B?ekVodlA3ejk0ckxmM2NxbUxZZkJRWlo3ZDNlcGlLc0lIQkxGU3NYM3ZrMUJZ?=
 =?utf-8?B?Z2xENmlYL3BlTStNa3VjNjNualBLeUlvZ2RBWUtEeWxiSEZVKzNxektpelQ4?=
 =?utf-8?B?eGtGZmZIQ0RkQm9sWkFwajFQSWo1aFlnR3N3Kzd4R2xTVjFQSVovV2RqY0tn?=
 =?utf-8?B?QUJnM2tXczR6TTVhQnlNRzhFMnpkSnAxNEk3blUrSDkyak1kTUJ0QUlJb0lG?=
 =?utf-8?B?ZWFsY1p1K1Nab2ZKSU10ZFlCWkdoVkRUVUdJenJVWnN4bFNPbXpkcTRZQjQw?=
 =?utf-8?B?RjRMTloydWNreWhzNFRubjVxeWRoY082TERERjNURFJJYTFZM3lYSWRLU0tX?=
 =?utf-8?B?R2VEbGNka2g5OCs2QnllZ0FkRXp2ait2MDZHbWFiVGEwSXZ5S09sZUVjMC9D?=
 =?utf-8?B?T3Z0UGw5VnNHTEx5ZzV5UzRQbTF5SC9kWjMycDdKaVJBc05ialpDams3UzRj?=
 =?utf-8?B?VEpPaGFTcjd5eUVaTjhJeWQ1ZDdVWFdOdDJRMFNaMjNNd1h1SCs2Q3J5cVJD?=
 =?utf-8?B?WEt5UktwbXFabmhqKzlSSWgrREQwUVZ4ZGVBUkpWcldhdlUxQnlFS3hHZGVG?=
 =?utf-8?B?QlNCRm85YVhDaFlRdUlWeDdQUmduMUY1UDJhd2Zab2xwUFkwa3FjMUxnbERi?=
 =?utf-8?B?cUp0dWtKQ0s2QlNzT0hBbTl3TUVPSmtWOVlPMzdnUlU4VEJselBrdVVnNnZx?=
 =?utf-8?B?Y2MzSklENmFSL1R2V2MwK0hJQ0pBZXFrTmxDSW15bFdSOCtoVTdrWU1tTUNN?=
 =?utf-8?B?bU1aNmZROGcwd2xnVGNmWjZLR0R2bFVLMUxyVG9ad0JNd0JlNDVvRm9IaW9Y?=
 =?utf-8?B?Y1gwS2NVVDV1UzFReHpFUFBhVXkzUlFydUtLS3FxRzZuZEQ0M0tMdnBEYUFs?=
 =?utf-8?B?NVdub21IWGhWRm5ENTNOT3l3aW5DRk1rbUhQZjlhVDZmdUNIUkx0YXVrNTM1?=
 =?utf-8?B?Rng1UDBjVFVsYlgvb3N4dWRjWGxXaUpiT3U1MFhnOWxjWTlsTExpNXRRRFk0?=
 =?utf-8?B?eXQ3ckt1M3N3eUgybVh3OWgxclVSbjdOVE9vMGViWGQ5Y0VvcE9HZTVuMENG?=
 =?utf-8?B?ajR0YmxVL1BPamE2YkRwQ2NYUWplMlpCNjJXR0RaR1MrSzFYNWxDTmV4RUdI?=
 =?utf-8?B?UGw4WjV4dTVLS3ZrT2d6aEZ0eUU4SDBIK2RsWlZlR3RRY2VjS29nVEJadnlj?=
 =?utf-8?B?ajFqdWEvSVNYMTVhc2NlN1lCMGVNaDV5di9KanlvS2ZYQXk2Z0FFeEtyZyty?=
 =?utf-8?B?dDVoS0hSTWhUSWtsOWlaTTRXbDcrYXNycWJzUDhFeVN6SXp2QWFORkFvT2E0?=
 =?utf-8?B?NUl0dWRaNnZDaHpGTTQ1aWdXMG5aNzl1d0pTSWFsbEx6QmpxSTNCMll5R3VP?=
 =?utf-8?B?d0VjaGsva2RnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0xDeVd0ZDVzRWllQXFIaTNGVE5EU2xUL0lSREZ1L0NCcDAzUFhZZG5qNEF0?=
 =?utf-8?B?YlpFekV6WU1LUkJRaGRDRWxCR1pNYU9jdlJvcUIwQXNUcDJnN284WnhmclRo?=
 =?utf-8?B?N1NuZFE0LzRaZGI4S2c1dDZ2VHJTVlJWaXVlR1BCOU5aWU9HZnF2V0cwNkVN?=
 =?utf-8?B?b2J2RWdBYlZJeGRxS053bXJKeDdaRlEzeE5xaGlQb3dxbkdZbVZTNTcrSlJF?=
 =?utf-8?B?VWtaVDFmWm50ZVNoN1NaY0dqcy84Sld1enlJNlBQY09GRHRWRzQ1RXR1Vi83?=
 =?utf-8?B?TllSQVQzTC96UWo2TDluK0l1Sm9MR3V1UStWczVVRmhwdERsc2oyQ01JMmxm?=
 =?utf-8?B?MDdyWml6czhaWUVMeGZ6R0RsNUI4TEVoZkNjNW5SY3FieWRad1RrazhoVzFT?=
 =?utf-8?B?U3hkV3JOTThja2FvQXpicEpzOWtjR2J6OThHV0lPVGRDNDFJV3A2UFRNc2VT?=
 =?utf-8?B?elhtUjVNcFJWcG96VHNaQVRaeXByOHNNSmlZMTc4a24zV3A5M0VLdHltRnhG?=
 =?utf-8?B?T1l5VDRwSVIzWUxqZVlETURlZVB2SGE2TVROb0pOTmRmQUx1SU9VWE1maFZm?=
 =?utf-8?B?Yks0TEV4dDZqRHl0Tzh0U0lOdmJLemhMMUl3bzl3eGxSK0xFMG9tb1p3QWpy?=
 =?utf-8?B?dWd0dTB4ZkNwQnJYbE13LzZ1aDZRNFE4SXorbDExNGJFQXBwL1k3VVhWSHky?=
 =?utf-8?B?aWwrWjVUcW84UFpycUJOemY3Ti9FZEI1UWJ2ZlF6QWdXSlZadDl0Z2pWdHFM?=
 =?utf-8?B?V0d5RlpRWVh4eitpVElRWHZRQkZtdlV3ZnR3S3U3RGgxNFRlajRBSXAwQXo1?=
 =?utf-8?B?RnRWMXUzQ0lhSVhOTHRyY0plQ3phSk9MbkVPd0ZoNW9tODludVl6eG1SNjRr?=
 =?utf-8?B?c1F5K2RPbkozQXNYS0Q4SFZiRXZRRGNYS25hSi9aTW92clhKanJURFVDNzdJ?=
 =?utf-8?B?aHBxb0VKSUtleFBqRGJqS0V3d0RJWFNzYkhJN29LTldlUUdSMnM1cFkzM09r?=
 =?utf-8?B?aE1OcG9kOEVUM3VVTXdpSFd1alNvTExuYlhLeTd0QURrRkxFRWxzQ3IzQ1N3?=
 =?utf-8?B?VEtSSWNPZTVwSmc5ZjNVcTFMSG9jYW02OEZ1ajNYOUdlMmVjVVNpNVNGaEV5?=
 =?utf-8?B?c1UzOFl4WDJmUktuQTdibDErMkgxOHZaMXl6QVpVZGVDQTJTNkQ0OEJ1OUlN?=
 =?utf-8?B?Qjk0NnZudk4rNng1YjRrRnUyam5rVEU0ZXVoRHRSRldGR2o0bWxOTk5RRS80?=
 =?utf-8?B?WFVHRFZma0l6SWFtUEJTUHV0bDZXb0ZzNXdqYjFlRjJJK0k0NVorTnBLZVk0?=
 =?utf-8?B?emhiQ05iQzdXempYODJ4WnhWT1M5V0FtVkNIend2ejdZZFNUZTMwWUVuK3Zu?=
 =?utf-8?B?Q1ZpdWNWOWx5aEpablRqL1pkVWh1bGF0b1FDYzVWZ1VULy9PdWhXbERjK0Ft?=
 =?utf-8?B?Q3hGU1FJSERkN1ZiVUsvQ3pKTGlqaGx4M1pNRm1ORlZMU2wxL3VQRlA5WnBG?=
 =?utf-8?B?TlR6RDg3OGJURUJBVElDbmxXVW9Sa3NXM1J0MzEySEVSMmVHT2UyY0ZKV2U4?=
 =?utf-8?B?cW1DN1BHT3A2cldMZTN0Tm9Eb1IvSG8yNkFmU3haWGV1RWZRRzkvL0lpNHRR?=
 =?utf-8?B?QXNiZiszVVdNbGlmZmw2VUNOV3JKUHhZZGU0bVExR056QlZJR1ZBTUlFS25B?=
 =?utf-8?B?amRxaHBENFAydTRmdTdNVjZoUXIxUFhiMXA1SGRpc1BDMzF5SzVUL0V5Z1ZQ?=
 =?utf-8?B?enJVSWxUSGMrZ0Y3dktqU0tKcE9uYzl1QUJrR0Q1K0RBMjFLUDQ3dFlCaDBt?=
 =?utf-8?B?N3lOb2RLZFRrNTBBaW8yQWxhT3p4dmpoZWowd2s4WXplZGNDOU9JaFBiRWh2?=
 =?utf-8?B?cG9tR2FmakNZcDdWNmhzMTJJSXh1TlhVM2lYcldQZkxpaFJYMWxLRHRDbks2?=
 =?utf-8?B?SFJwZHdaVmZncXJXenV3UVR6VEJBWVhOQW5TamVPcTBnb1plMlIvaFZqazdy?=
 =?utf-8?B?RlkwbnJXUlRJTGJ4ZlZ4V1l2dGlmR2hJS3VRTVhnNUEzRFZrUHNxQzM1V3NN?=
 =?utf-8?B?cnNWdHBqdGIzOFdhTkY1SzZQQjRsT1NoTFRZa1R6RHBTMnZhUDJ4b3VQcERX?=
 =?utf-8?B?MFFnekhyYzQ2ZGFOKzZiN0Ywb1F5Q29kODMxcDFGdEwwY3FYRnNoby9aQ2Js?=
 =?utf-8?Q?TUY7WIo34ms5Lze+B+SsanlH1rRTsZTpFYcwzKhEh107?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 103318c5-ae7a-414f-a904-08dda9b9d469
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 14:02:55.5649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EyC6ughMQh8EHdp8oGy+rCGXFrVCvxrqH/PR9JvtkP3/rmSMvo9ehQjn0dLRgjVlk92vHMoMp9K49HOkdVXCLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8458
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

Although we want to access registers using the provided methods, it is
sometimes needed to use their raw offset, for instance when working with
a register array.

Expose the offset of each register using a type constant to avoid
resorting to hardcoded values.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index d7f09026390b4ccb1c969f2b29caf07fa9204a77..7cd013f3c90bbd8ca437d4072cae8f11d7946fcd 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -78,7 +78,7 @@ macro_rules! register {
             $($fields:tt)*
         }
     ) => {
-        register!(@common $name $(, $comment)?);
+        register!(@common $name @ $offset $(, $comment)?);
         register!(@field_accessors $name { $($fields)* });
         register!(@io $name @ $offset);
     };
@@ -89,7 +89,7 @@ macro_rules! register {
             $($fields:tt)*
         }
     ) => {
-        register!(@common $name $(, $comment)?);
+        register!(@common $name @ $offset $(, $comment)?);
         register!(@field_accessors $name { $($fields)* });
         register!(@io$name @ + $offset);
     };
@@ -98,7 +98,7 @@ macro_rules! register {
 
     // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`, `BitOr`,
     // and conversion to regular `u32`).
-    (@common $name:ident $(, $comment:literal)?) => {
+    (@common $name:ident @ $offset:literal $(, $comment:literal)?) => {
         $(
         #[doc=$comment]
         )?
@@ -106,6 +106,11 @@ macro_rules! register {
         #[derive(Clone, Copy, Default)]
         pub(crate) struct $name(u32);
 
+        #[allow(dead_code)]
+        impl $name {
+            pub(crate) const OFFSET: usize = $offset;
+        }
+
         // TODO: display the raw hex value, then the value of all the fields. This requires
         // matching the fields, which will complexify the syntax considerably...
         impl ::core::fmt::Debug for $name {

-- 
2.49.0

