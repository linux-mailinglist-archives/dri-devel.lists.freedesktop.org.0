Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD32BF4039
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 01:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639D410E53D;
	Mon, 20 Oct 2025 23:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UyOBWKez";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010029.outbound.protection.outlook.com
 [52.101.193.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA7E10E53D;
 Mon, 20 Oct 2025 23:23:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E6pyRMOWTm2kY1buvdntTGa7SHhhjrLl5Q5rOoCqhFfheMdwgBt+pk5Rk5nNLrj4yWay35pfCAa36XeQiDy16fNanUnPwEAtZmVd3w3HxfQ/8zFlF+i0nzz8RsJKqlIiRixec3LNgba0RAso9dregK0xFYU9fBXvyj0o6OBtWlF9Ph3dI14jDaSnKGEwx62M6jx7xShiXhKZEC2yRT/sWsuKckO6D9PEiJIs9pM9Wz4owWLntGF6Jq3f39B/CPwWPjcVbrl0lnVQrwBA7rTsV2aYy6V6f0K5jAS2B2zwWalFgAbAFqv+FSNk5ybx14YZgMZF+SaB+lDpM1t2T5q3DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVTO76rnAz8NsD+kKJHzGgLg2Ahx6glMNjYqaT3LSvc=;
 b=H0iH5CvgZwfxvVqx+KC7o0MiKp3i1UyDm5aPHBa5W+r0x3sYYwRpth1KS6x8CciG6wO6QY8+JMThs+J7LzsLbKmP/hm5GhpybLFQ5ubK6j7zDoA3ORWhAW7f+IxKkKqAStFong5GCfvKyaADZrILZasVzUwXegYacteqofgBq0bKMqYUyiDUdkL8yWGhAirTgm+weBriEcDKQGmVOEOzVNxbwQ6Rj030LscR+gK9R7AJHz2mq0MtHsi2/Egx/WD6g+B3Q+rAyKVjMbOWfnAwBRXz4+Xm562MSWxFF+KJBtDQ7bHhQ6Eptxsp6nGep9LieXAWtabHT2fghZBeO7d32w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVTO76rnAz8NsD+kKJHzGgLg2Ahx6glMNjYqaT3LSvc=;
 b=UyOBWKezh8+SLlI+7SBb743Kk2n6cDn5aB9uR4aoglHkvxGaE9sk7UGzzKt+ZRWKkcwta4AW1Q4ybCpYbFw7WAJyvz78vzNCtFeblLSI/RCAwrEYKCp6C6ClDLU5CRg+9FD8VM+spWHGK+JjDYKP2jU62JlMx0hmg65js2Gk8ws2B0QAcq/RnpEkJgZz0IIG/fsc/u5pHpGdNMf+YQ1kEY3Zz1hrr8DXNWi7kKGulOE6PHUizUD/CK5Lwmo496waiOkobGNI2oY60HR2WREJ2JFcRb8IdLoegxd0FDRI7082rmWIEIgAciZ8xqVekoWOw2UWXmTk16nrT6ryk4fv0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ2PR12MB7845.namprd12.prod.outlook.com (2603:10b6:a03:4ce::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 23:23:23 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 23:23:22 +0000
Message-ID: <d57ca5bb-1845-4f38-bf26-a1ec40467f5f@nvidia.com>
Date: Mon, 20 Oct 2025 19:23:20 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] docs: rust: Fix a few grammatical errors
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-2-joelagnelf@nvidia.com>
 <CANiq72nGPeLvrjQB-62Ht8TR7oWPgF9HFO=yPX7TT3faqxnNFg@mail.gmail.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <CANiq72nGPeLvrjQB-62Ht8TR7oWPgF9HFO=yPX7TT3faqxnNFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN8PR15CA0020.namprd15.prod.outlook.com
 (2603:10b6:408:c0::33) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SJ2PR12MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: fc052662-5064-43e5-c6a2-08de102fa984
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXZSZ1ZRaFpEM2R6MEZIMjVoUkpBZGs3VlRZbEI1K1BCNEJEYmpxcThqYm93?=
 =?utf-8?B?NUtvVlMyZlB0S0o1NnRUdlZUQmlGMWVTTmlGSG9VOEtjL1hTMjlzandEOTA4?=
 =?utf-8?B?a0NqUjk1UmxNbEMwYlZJdTlGb051NUphVSszT28xT0R3U1pydXU3UmI4MEMz?=
 =?utf-8?B?RzVPOExMalRNbHpidUNNZzBlVGlHRUNTZFRqR0p4c1c5NzdVQWpLWVdNeitu?=
 =?utf-8?B?ZU1TZ2E1QmpkNzdiRjZ0Y0FEcjFOVm0zdkM3cFcxL3JmS091QURVVE5ESng1?=
 =?utf-8?B?R05ZdDVWU1d2clJoMm5mRUJsQ1pCTWNLWVgxcVdGdTJuZDUvVzRTRTlhdFkv?=
 =?utf-8?B?eTBDOHhyemUyK0xvV2N6T1lJbFUwWFY1MXZnNWRCWG52a3h5YTlXRU02Z3cy?=
 =?utf-8?B?Sk5Ud001TVc5N05sRGQ0NW9NVnNHWWVQUUpsTy9pWG5Yb2tmb3M0U1A5NGw4?=
 =?utf-8?B?RXVXNS9zTlo3c2I4d3ozb2lhOWx2VjVuSXV1SDhPYm96L1VpWVcwUk5LUWtm?=
 =?utf-8?B?Q25mSzdzSzg5WjVIaGNRN2RGVE84bEdacDdhMXNRTi9HU0VKbDF1dWRibGpl?=
 =?utf-8?B?YXZFd0VNb1JoaVExcUpRcEYvZFFDU3VEOG9TRXM5cDMxdyszNkpDZjJlMlBX?=
 =?utf-8?B?d204RjBobkh6QmJKek5iRkh6bEVoL2xVb05zTkxHVW9xbldPRUZpMlB5dkNx?=
 =?utf-8?B?UmhwNVhyLzRvZW9tZTZPWkxpdVRVZXlVZ0pCenZkMFlpYThyRW44UWVyR3hn?=
 =?utf-8?B?M1ZyMlZiRUwzTGR5MUVhcE43bWI4QjZ3akNCRUwzd3VKZmlTc29QbkUwRnBC?=
 =?utf-8?B?SGFkaldnWjJEamNHMG9QWlVKUGtQRTBKREN6RUFRcUdYMllUWjNEUWRmQkxL?=
 =?utf-8?B?bnNOVCsrNG5LdHJsM2lmYnFBaGFwMlpiR2xSTTdZZjN1UW9rdUFpOXNCeENo?=
 =?utf-8?B?cS81bm5pYmFtRExmVzZjSnVZMFYramR1eEFNZFM4MVppb0NKRENpV0Mrdjdx?=
 =?utf-8?B?bHRhek4xU0k3ckN1UTJXaU4rNUVPY29McTJYTjRTeTF5aTdyclpSOTBEVjJY?=
 =?utf-8?B?NzRnQ09YTHBLZnprT2FkcDRmdFBvSWF6N1BVdGQrNGI0a3NFVXZGRGwwSlhG?=
 =?utf-8?B?K3FXbFVtcTNxNXd5YlNYVlg3OU96K0hpT2lSanA3Mm8rTTVsSWsxU1A5YkFw?=
 =?utf-8?B?TmtiWmZxcGVOZnM5ZVpQT3REeFpYVkwrQjN0REdkTTFJSFJMaVlGa0hsZUlS?=
 =?utf-8?B?ZksvQVMyOUZaUmRVaUxjbm50U0ltSDU0SWplcmFoajEzdUl6K21Ja1ducE9k?=
 =?utf-8?B?a3ZxdkdpaE9IbzhaR3BYRnhubVNLOU81WEI3YVlZVUhOT1FkOGtHRW52T3FV?=
 =?utf-8?B?UzZnb2Y2SDcrYWFHRkx5cmJQNUhKWWFTZmgvMmEydmkxSEFCTTB2V1JaRDgz?=
 =?utf-8?B?SWwvUEU3ZHVXUi85dTFsVEZGelM2bW45Qms1MVhUS00yRy9nUzVwL0xxVzBX?=
 =?utf-8?B?Nk11ZWFNaUNtVXROVXJSbU0wNDByZVAzMWNXSWlTNlIyUG1NSHdZek5KWVV2?=
 =?utf-8?B?Tk83SGFaTVNEc2QxVVBwc3NhTlUydzNXMHE4ZEs3RkZIQXNzajFoTnF4MEMv?=
 =?utf-8?B?a2xKdXlxMzVGeXNidUY1NEZFc2pvTW5oMlNTYlB2WDJrczNjK2NVTVlZNVQy?=
 =?utf-8?B?WWg0M1kvQ3ZTMXVUKzhwanpKQmtxTElmYmlGM3B4Q1hESmljY2dBd1dEdVFZ?=
 =?utf-8?B?N2dSd01idEZQUTBzcUFXeUticzFSTFNnMmlOT2FIM1cxV1FCT2ZzbStzc0s4?=
 =?utf-8?B?ekVKRmlvQ0ZrcG9YNWpCTzZ0Qm1SSlZwU1p5WEFzSWtuaTF0UEh4WFN3NG5X?=
 =?utf-8?B?cTA4alF6VDdCSmM4TjR6TThlZ3owOGpMb1o5dGdtVDc3OGtXMEM5Z2IrRkZt?=
 =?utf-8?Q?MqPhnSYTqZUZC+BunxgJdPGFhwct9dNh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUZKTTFYYloxaG9aMFVWZCsyR29kNU9EZ08vdGkvR280ZCt5RGd3THhmMGVs?=
 =?utf-8?B?Z1d0K081VG41V1ptM0djZWloNEdSZk5ZWFgwN08rZWk0c1N2c0NSWUJIeFhx?=
 =?utf-8?B?b1hZOHBiTkpTdU5HbkhwcGphUUlUb3hyeGZmYTQ1SkQrVmZ4TVByanJVMnQ3?=
 =?utf-8?B?NVg1WXZaaVF0TVUvajBjYTZySTRON1VDTjlRYUY2bjBiYjRmaFdjMTNXTjFE?=
 =?utf-8?B?L0xuTUg4OGhxdHlsZXExSlJIR21odkJvcitsUzEyTXJKUUNnWGd5M1VoSVp3?=
 =?utf-8?B?NUNGcE53SUd2R05FUG91RXZybHVaNVNWT1lkd0U3dVdCbk0va3h2bGtUeVBp?=
 =?utf-8?B?YUZzMTRVTGdtam03ZjdUY0h3RHJNYVVpSDZubVFIUVhKdUUrNGt5eEpkTzhC?=
 =?utf-8?B?Nk9BQlBjbXRuR3AwNkhPajNRQnFLRnd5NU1hVzJmcGd6emZUYUQ0NEJXZDR3?=
 =?utf-8?B?WnZuK1liM1ZYSDAwRnFVV1I3Yjl3Y1M4RS92ME9qRlpFejRBK2dvaG9RQzRL?=
 =?utf-8?B?SWdPcWU5YWVDazhkK2lramJLRDN0ZVFhM0pRQksyZFZrMjd2RnpDSXpxSlpO?=
 =?utf-8?B?aTUrUHRkUUorTzc4SmZ4bEZreGZrQWxzdnphdTl4QjI0NGU3MTBUdlF2MXQ5?=
 =?utf-8?B?cC9JT3NYZXd6OGQrVStjYjVRZUhPUzhLdXFxbEx2eXpsQ0JHWFFTeDMxZVRW?=
 =?utf-8?B?MlUxaDJBRU9XTGViaDk3d0NETU9wL25URGExNG9DQ1ZNajdneVgvMXFZYnJt?=
 =?utf-8?B?V2NzSjhrOFZEWFF2RE5pd1FZSW9YQXJ5VnNTdE9pSGtzQWJVS2h1UUhGNjJG?=
 =?utf-8?B?dUxmTUpNWENlKzlXb2dqYVBXbWdidmdWOGNNTEg4UmpZVVlnamdyM2NtSlZF?=
 =?utf-8?B?d1k0TUJMZnJObXF2c2pWeitUMjVJdDUvK0JjdjVjOUFzR0dlam1IZklJcUZR?=
 =?utf-8?B?WHlvZDMrNmJDNk9ZTGs5Q2NYSUhka1lOWUtwMi9WYzNLUUIvVVRlWWNpQitW?=
 =?utf-8?B?b1VtbDhBeVdrcHBJTU1WYkNQVW5GRWNYdHMrZ21Ta3NoWHBZM2dLTTZod0dH?=
 =?utf-8?B?c3BoOHpHTFRoVzFPbjJWcTlPSE5ueURFbldCdTV6NVdQR05yUElEZEpUbFJn?=
 =?utf-8?B?NkY2RU0rZHhlNGw0eVJvamhEeHhEcm8rbndWZkEwd3A0MGNuR2haTU5MNVkw?=
 =?utf-8?B?QUVKYXIxVjJ0ak1HQ1QzU3FyaTk2V0tmeWtnUy9FMmp2NmdGT3RtLzE2eVdr?=
 =?utf-8?B?OThSOVoxaGhOYWszTkRmU0dzVHE5d2Z1YUFab1dCaitWZ3I2cHZMZyt1YWdB?=
 =?utf-8?B?VEIxeW90TkxhYVc2RWIyV0dVanVtNW5iMytsTVdXNk55WjVVczV1Zzc4MzU3?=
 =?utf-8?B?aUlyeTZPbVNrSHRuQUdteFBqcDNNL0RYeldmNGhOSm9tbG5aZFJyRTBXSVNT?=
 =?utf-8?B?dzdPbUw3KytlUXQweGZaY1dFOGhtQ256b2RlNTh4QktkVXhRTlJzS0dzeEo3?=
 =?utf-8?B?N2lJOWVVVTFkZGRtK0dDNE1hM1JIMi8zdENPZmw2cThBcW8xYTlVRUhTQmRs?=
 =?utf-8?B?bm8yeVhSTUM0NC96aW4xUGc3cjcwZWkzWDhRUUpLbytFZDhWSmEyTlBYczNq?=
 =?utf-8?B?bFJoMlozY25yMHBVa21zOEMvSUx5Mk9aVWdaSzh4cnRLUzFnaWJxaUZHOVoz?=
 =?utf-8?B?VEhjY29tMFNFMlpmYWp3NG1yTTZ3cHl2Z3lCOEZWamE3MmJRQlcyZnZ1Tmg4?=
 =?utf-8?B?cUlDdU45OU9pYkpHSmMyNVl5QSsvZ2lKeFR0emVZbmpzbnlUcjNwRXdGejVr?=
 =?utf-8?B?clZJKzFNbklJdDJSaGc2OXFFK25Hc3c4TTFNc0tYQitGVW1RYlZzeDhDZ3I2?=
 =?utf-8?B?aVloTjJtRExuQ0F1TE1lK3ZNbnRBT3JyWUIrV1dvOHJqLytJbHNTOGc2Vzh0?=
 =?utf-8?B?NU5WcnF2YWhOVnYxaFpGU2QzdXpGR003UUFxV1VQdmthVEI1cHh2T1FkYlp6?=
 =?utf-8?B?T0tFb2E2REVnbVFPSGxRTlM5Ui9NUEYzc3JFSGd1Z3JFZXVQLzRmNGFYMExr?=
 =?utf-8?B?azdNR0JTb0lxREt3NWtENjVMdHJJeG1uOUlQUGVTaU5OMUhqVXhNNWxlM2Ry?=
 =?utf-8?Q?IEmBEr65mnVVBgOkdbRnTdKrc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc052662-5064-43e5-c6a2-08de102fa984
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 23:23:22.8563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7jRdZphYjv2L4JGkGYMtkrJQAohBdVEF205o8rCzyV1EmoIz0KFvPF3cUaLdGXdf0FMVKSFles9u2qe38FrqGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7845
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



On 10/20/2025 5:33 PM, Miguel Ojeda wrote:
> On Mon, Oct 20, 2025 at 8:55 PM Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>
>> Fix two grammatical errors in the Rust coding guidelines document.
>>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> 
> In general, please submit independent patches like this one
> independently, e.g. this should go through the Rust tree.

Ack, I will do that. Thanks.
