Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E93FABEC28
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 08:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E7910E64C;
	Wed, 21 May 2025 06:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BzTX/BMm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C02010E647;
 Wed, 21 May 2025 06:45:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwzOvIItQ1ASrpSNWFFpf515HS0c/SPwkhPLLOmkyX8ACa8HNI/K6yT9AizV4LwNAghZFzUHivTlA9fJoqOkIrpzslDlqqg+GCn5tKgCxfVhZJ2ethBoXfX1ElReffBg6B5e151qa53vYCTNCuv/R9+Fg3IxWaTroQKywvD2ZhhsgccSrg1DPQtKg2aUaK6fSq+ctkJHB5jY386OpeeXP9zl6WfCbhgaEEZQ096w1UNPtSFij4SuhVY1GFGvoYRoOnhCl5f0siFY3j3u7EbtPMG/4CT86UlPYPmCrmxR/DbRZ8yKeZjDYm0C8+5MNUB6WvHQHh0v0Iwyd6gHTKTkBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUQwRVQfVsckGxojxh3ZOLc68gTKsm3jSy5fKVgw/PM=;
 b=BNcU3Qui5oFc+MqAKBrPvNMDcXM0mhhiC5dwTEo/Klh2ORd+E7ubBe/uwtccNtRba+YOhg5skaA7sgaVcD2m1OtNX1q6jGQOTg3NwUFJr+2QWUkg6gDqkNsgFiRI5P0v7n8biGOzC3In6LZfcK9UIOs8SBZdL9NAEgMLbmf7us0nPWLSb/xC1OTA5Ustoidztxv9mE6BxfBmBws+Ba8GnKF3bverpOl+GVdSPuRjB0T/PMnMZQL5LDW7aoOUFfjaXJjUJBLPH0qP1mEl30hMNg7xSGr7ig9UTrnY4egpXy/yvDylAW3JVSJ+rQZwQ3YDXgRrZMJPWQ4YKS7W0+19Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUQwRVQfVsckGxojxh3ZOLc68gTKsm3jSy5fKVgw/PM=;
 b=BzTX/BMmfKPZNxfNLnjIojp1k4Zt4JxiQ/ZZdgATowd+fZF52ANj92YJGHugEWLIJZbeIrWgEjwgPrvqnQ7Uj1dvSjhMQfthaG8CZ33CtV7yHYeTkg+WTWLjWGSVW1ZO5c5eTi2+LuGFBkdkRegJMQ/IOehYS4xoRfqyKhm85atFbi7L3hUAX4VUHYYuYzjW6xsjA4qn43eqEwZAUFZUlXApLcZwrP5oOpYqTL7sIHNIikx2qqG7qynOMYCf4O6Rxox4rZqlcOE9Kedjlz6yCDWlZJzkOWwbutW3Mc7LccJc9TMFFasg2VhAhIKyv7GJoAzJhmq3rYZGPi+3BRBAHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 06:45:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 06:45:28 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 21 May 2025 15:45:02 +0900
Subject: [PATCH v4 07/20] gpu: nova-core: expose the offset of each
 register as a type constant
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-nova-frts-v4-7-05dfd4f39479@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
In-Reply-To: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0328.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 317e44da-70fe-4f59-5835-08dd983312d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2ZxZ2ZxS1ZqTFNsQ0tlSUt2UkN2V041Wnp2TmtEMzBlQTMrWlNUVlJQZXV1?=
 =?utf-8?B?cXoreGJiUnVRaVFvVTZ3QzdpNTBDd21WSWcxRmRXUmNlN3NUNndBV2ltU25W?=
 =?utf-8?B?eTZXNGhvbmRVbFViRHlrSGl6QkpOSmJob0ljc0dJMFpHMGNZcXYzbWo3c2o5?=
 =?utf-8?B?SzlxZHZMZWl4S0RhazR4MmhQbmxFN2hsekxteHJKNlIvYWpBY1F2d04xWnA0?=
 =?utf-8?B?R1lsY3BxN2xBbFlUT2l4Tm80ZG5nVUt1KzJLRzlzSXVRUkMzTFZsWVVjV3pB?=
 =?utf-8?B?MWwrbHljV2dlT0l1K0ZWcmxvYko3WXJLZGVZZ1VMVk03YzVyaU9Jb2lzaXJC?=
 =?utf-8?B?dkU1MkRMcUZmSGxVdE1MeEZlSHNLZndzWUFvVm1Sazk2K2FLenNlZXBRVTRX?=
 =?utf-8?B?RHg2d2t3WEFoV3R3WXZwcnVOTE1PYWE0eEtkMU9KZEJFRWo5TENLUk10Y2M0?=
 =?utf-8?B?ekNkZVVpNjFRazNCWVNCR1hqYzFEZzJsaFd1aDNGWDhlNVlEU0hyVGNzYWph?=
 =?utf-8?B?VnUyMlNxWGE4RGIxMWExRmdwMFhyMCtSa3pNLzVDQ2hzeXo2Lyt3WkFmOFpY?=
 =?utf-8?B?QUpkZUI0WGdXU0RGWXJpdzFTZkx6OGtYTVpxRGZscmJYRmp1SmNrOGxncDd4?=
 =?utf-8?B?MEdqR2Y5M2h5SHh3QUhyb3RGSXpCWVJjUnRSNzRGZGQyNTcvZUEvbGprNkVi?=
 =?utf-8?B?QnFiazlmc051Q0tUZVNsZ2JaZ2JMcjA4QUtOMWgySTBGNUhocTVXZ0Z4UGpS?=
 =?utf-8?B?VFJVM1NhalZHQS9lYm1OSUlYM3dsU2xZMi94blkxQlo5WS9BcitkQXVlTFJ1?=
 =?utf-8?B?c0FOYm1zeGZ2NGhDMWliZkE2S2RIelBKakQzOU5nRHU3YWF6eHdTN29vc3hI?=
 =?utf-8?B?VTQwdUZsYXRPN2dtUmpSL3lxNytnS3AwUXI3S0hXNkNLbVRZL29Jc2gyYVUx?=
 =?utf-8?B?UjVnVVl1OThzUi9sWXlnamxFelZHT1N4MXRTRHZqakNLVXR3OXU5ei9HaFNZ?=
 =?utf-8?B?a1l3a25nODJkb2UwVUVVRmd3ODdOQTFsTVI4NDZydzdHNmZqRTlyVFNsdGE2?=
 =?utf-8?B?UlppL0V6QzZ3dXhva1ZtUzlSNGZBcmRLYndmMy9YVWdiN0QxYlM0VWVTN1lI?=
 =?utf-8?B?SHJGUW5CemJWd1o5dUF2dmRpSlBSdnp3NWdVKzZVbFhUem02ejBnbi9SOXlq?=
 =?utf-8?B?REp5a3JoYzN6aFlHS3U1ZVladEM4amkxcHJTZnJteW05amtIc0RsU1dhREVQ?=
 =?utf-8?B?elJmcDEyekMyd0VWMGluc1ZYTzV2SXBscWg2WVhucEJzdlk3eUw5M09hbHNp?=
 =?utf-8?B?YXdaM1U2Q25KdGJ0VEdKYU00WGJZT3c3eTlVNE9qdEdnTmk1NXl5WjQ1cTgy?=
 =?utf-8?B?M0dhQzFrb2svcVE4WllJR28zMXVUcVdLSW5ENHpEZFdoa09MS0s1TTlmY0Ft?=
 =?utf-8?B?NmxqYjEwbE9SUTFtRWk1bGVoVnhyTVZZZTVMSnhBcjl3NUhPZlViSnhGTGE0?=
 =?utf-8?B?MEQvdmh1TnJ1K1JhZDc5ekpGNDRhb3kwaWFCZVl6M01VV1BYbWdaTHJ0TVda?=
 =?utf-8?B?ZnBocFBpMEMwUUFPMS9CV1dWNWNrUy9OVll1clNnVGw3ZmZGMUZwVHFyTDVX?=
 =?utf-8?B?SFFKd2d5QUdROGRCdXBwZTZ0WSt4bTh3dHlWMng0RFNCKy8wOEkxY2s3bHJM?=
 =?utf-8?B?d0RBTkFJNGJxKzhLclUxVVVlRkZZd3kxaHJEKzVSVzcvT3ZpeEVDeFlrdGo0?=
 =?utf-8?B?ZTRMUzdnUjluT1JNd3k2Skl2ekpFTGc0NVZvODFsL1hIcUljbS9IdzlEWk1J?=
 =?utf-8?B?d3BXT0VvQW1NdGhEUXZOT1RucDdVbHpFT0RlSmxoRTFkR3ordUtCRXkvWWc2?=
 =?utf-8?B?bGJlYnc5K2M3THMwZ2pnTUR2eStadmFoSVFJQW5uNHd6ZzdkR1NuaHgzbnAx?=
 =?utf-8?B?RUJSN0FMQVV6T2Rpa3R4Q3lRR3RsZVRURWVxVERSNk5RYlF5ZkpDWmExelBx?=
 =?utf-8?B?a0Z5TUtTcDFnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N013S1Z1UENxYXlDdnhjc2s4TXVPcnJtV0M5QjFna2dOT3F0ZWorQ3RrOFlG?=
 =?utf-8?B?YllJQmtnQk9KYlZTcHRTeklKQWNaeUl0NHJnU2tLekEyb1BwZ2s0RWFQbmJs?=
 =?utf-8?B?N3pVd2cxeHJNOXZDKzNDazN2bkpRL0pSYTQ0YlVzSkJGbExhdm5DY0V2Y05l?=
 =?utf-8?B?WGZHM2NHYzB3OElSNCtRbHFQUko0OVgyb1VXR1R6ZTA4TGdIRzVLdjArcnY0?=
 =?utf-8?B?SDVic29GNkcyUVozSXlkT3h5U3NWSGpnYjIzc0tMakdUWDRxMXRuamh5ZCtS?=
 =?utf-8?B?NHNXdGw4cEZ4U3VIcHpCb0NBQ1VWZFhJVlhlMEwyVzV4RzBKN1RqdnBDN3ZF?=
 =?utf-8?B?VWdPQ2VscVRzQUN4WU52NXluRC9zMEwrejdrUE1oL2JpWEZHS1c4MHI1ajla?=
 =?utf-8?B?SWw0YlBEQWUxZUNGaVIzSi9IRHBSZTlzMVhNMXdoT1dUNnFFZ0hmNHpiNzhW?=
 =?utf-8?B?bnc4eld4emJBVzZHTjNMQVp0RmRlLy9Ybmw3TTZWZ2RRd3lIU2sySTg2c2NE?=
 =?utf-8?B?K3BmejZ0S3lKTU44aEFWRE0xVE1sWnZBMlU2UFdIVTI0aEQ0aTBtSXd6eThk?=
 =?utf-8?B?dThYS2lRWmxPdU8wOU1OUERpTHI3NHM0dCtTVzhqVzM5a3pwVjdWVFlLTFBp?=
 =?utf-8?B?OGtjMzhOTVNMLzdZaVp1YW9URHN5TEVrZHBnTmJqakNtWGxPWkdtcUdnQkdG?=
 =?utf-8?B?RnFRdGJiQzZRcmo5akdGUEV1a0Mvb2lPZTRTZlY1amlzZm9uQUFuRlB6VXho?=
 =?utf-8?B?bDlFMVRNbGMyb2Y2RUNrQVUvVWhKNXNORG9sVzQvSkFLT0dVQUh6Q0xJK1BH?=
 =?utf-8?B?a3ZmTSs1cUlYQnMxcStpL09abHRyRjBtTHU1UjdBVlJKRlFQOUVDRTg5VjFl?=
 =?utf-8?B?TE5OQkFMT01YU29lWDVKbzFQSk9lOEI3Sm1yYXVWSnZmTStHTkswTk9lWTlM?=
 =?utf-8?B?d0lMa21vQWx5Q3hCQzJIbTlFKzBsb0l5aktvd3UxcTBkNkkrM1p4TTgvRlZV?=
 =?utf-8?B?NUh1cWRLT0RoWE5obyt3ZTdEOGo0NFZsbnVxWndpWS9MRjAvNE1NWVhUakhX?=
 =?utf-8?B?b2VtdGlHVFpOL0I5WUFDMmxHMkVNNGJjVXZ1ZTc2aUcwY1hJUk15TGgyWExH?=
 =?utf-8?B?cVVDRE1FcGhTRVNnWDBLbnh6NTlCV1hGbnJvUlZxVmNVbVVpOFU2TFFJNFV1?=
 =?utf-8?B?cTR5L0ZTSFhHaEhHaURaSzZTaEZrSmZoWWsxbzRQRFlsWE5vR3RRNUpZWFB5?=
 =?utf-8?B?dGNBZk9XOVpzL2dkQkpHWEV0N2VrS2wxOHBSYW56emYxUzhrR29QUE1lU1hM?=
 =?utf-8?B?aXBhaFFGbHgyNkRlbllJWWFXQTRJU2NycW5ZcFNub3htbGV6WXJ6Rmd5UXBU?=
 =?utf-8?B?b2x2NGZIMmR3Rnoxblo1dFpaYlJ5THlYdm5jVlBVTWhQRm9FZXAvckFncGcy?=
 =?utf-8?B?MTF5NGpDcmxQNXVYaWpqaDNLYnc2RU95QUJMdXpuZFVHTW5paDFheGZvcEsy?=
 =?utf-8?B?cUNYSkwxUzBCaTV6MXNJZU9WOVdBSWM3Z1ptK0hGS0szaVNObzFpQjZaSlVt?=
 =?utf-8?B?aFZQam9kK1RoOXFVbU1VMTU2czE3SEZiT0xETzYxeWFWYjl1ZzB0U2MrSU5X?=
 =?utf-8?B?Y2NxR0xpM0tJNWlMWkpQSDUydGYvZldkcTJRanl4Q3NuZXdZc2hBMkMzWUY1?=
 =?utf-8?B?MkFNZlUwa0ZlL2xyOHVaR1Z1cndTTHlUbWswTFVLZGhwQjZvSG91Nzk4bElu?=
 =?utf-8?B?TVV2VklFd1plVGdTS2ZYU2Npb0QyUWZuSTR1WDFXdlBLTlFIcjhDRFhjZWcr?=
 =?utf-8?B?NFU0dGFFQXhrZGJZeGE5em5XUkRyNVBZR2JzVzBzV0VPOVdrbGNwNHRHeVc1?=
 =?utf-8?B?ZVVINWprdGNLWTE1V2I2SHlzd1FWMklSMGdRUENYLytHT3RXOTlNdEpuYUdI?=
 =?utf-8?B?cyszaW0rUlpxYkd6cFlZNEJUalNEQmJNTFNsYWhqSHk2UTVpZ1hYTzdWU05H?=
 =?utf-8?B?ZTZEUFJHNHZWZVMrckpNdkVkZVhWSzJhdk42MmdmMTBkL1dscGd3UElRK3Bx?=
 =?utf-8?B?M2w3dWc3MHVMc1d6SHdTRnVSZ1QzWWhUS3dpVTdqN0V4K1VSK2tBNXNEeW13?=
 =?utf-8?B?STRnR3FhS25QSnlKWWlpRlU5bThvdWdOcDhJbFdNV1BYQ214d2hwUFc1eVF3?=
 =?utf-8?Q?beuL4l2tIbme4k4vpIwz9MtWVoOPeDwtCQmbHFULjAnM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 317e44da-70fe-4f59-5835-08dd983312d7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 06:45:28.4719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GeVszUUNBpL83kdYk7+zdQlFxgfkDKsCzXzFrX2zV96cl4jxAMeI6oEReD0OIvgmYOXZaw/gTbklKJb0SGErIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6618
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

