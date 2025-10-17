Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C903ABE6158
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 04:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5090210EAE1;
	Fri, 17 Oct 2025 02:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ITjF1svE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010028.outbound.protection.outlook.com [52.101.61.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D9810EAE1;
 Fri, 17 Oct 2025 02:12:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5XDcqeTyhHWEnXSONV18MTSq6rTnJJ2FQIXcvZIr8uYtTRy/iD2CEE9/eQGgCnh074lCdsJ6ChRxzps6Molgiz/1FEcMIunkfQgKq+3dgr2fNF5EyvZJOYAW9pxKLmGksUfX8dP8U/7c4grvSt42qCm3WGU3yIBzCClcavg5gbh931yWNxCW1SvldP6VxUriO1f7kKgYsOih3elR3NnbRBNwBeYp6DZY29XV59/wwkquuFjEI8/NPC3SAG8048zVpBGcRyRohabtNZdhK730VTnvgBYGJ2tGN6REZaRUB/TdO3KOyDryXvWrppZfD0jftCUQR38JVFgpBSFEKNecw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaHHJPEk/RsHk/55/dFAvz5Inl4XWNTkmbAUYVqq0u4=;
 b=AR7eoIUP5UnZOzGgYSG7EC27yEfTQI1Z9wgHmsKCv4xEpD39sJ7t2g2eQr+qqLiiXgj/hJZjVo11OaTxh+xIvCvERpW2tIZsYAgpGhvGjhcpsBV41HOrHgoVSxAtcF7Ntos8+jSNyOipXFnS+ahisS4WRCsA7Gxp0dthebyvr1W2NlxbBOxjafDsuhKrYW7TWJfrlrNQN1vZ7eAD8GybMQlIpzCTN8ZrsCRuWMKHJWtqqUT+Kd1urEB5mPmfzFK/9kTRA0dmJBT2FAglthZeFX+o6NMXJDMvhgnNlsBFBVUURjqMp3tCxv/6VxxcLK723CYsMRdU40iZkTy17H9dcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaHHJPEk/RsHk/55/dFAvz5Inl4XWNTkmbAUYVqq0u4=;
 b=ITjF1svEht4Zlnrg2uoHFSurh1QUebytqt25PmGsp4CwFDRRxopP/LB78R5vMrTICJrJr7B6GDONou61WACVzKHmNzEM3QbyT9MVw126l7ovGD2/Z6mB6m6zipEn5iNkg5MUvIBM80t/pWCxtpFcR0uT8CTlp+m7nFl4Mj+nkmsqKtpsEhmz6nghOWGq/9dZVz2PBEuaq012Izf3n/8AIdMN6G2nilFMA1qjK0TjCJ85HM/QYGI9DMhYkxUY3yQPbnIdp8gyb4ofE+ymn39WyTdT7J/wgKR/NXNTrWxlxXbjjfVc2ZNK/TjiQKjV8edPAvv6mn21INMRpU/OaNNNlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM3PR12MB9389.namprd12.prod.outlook.com (2603:10b6:0:46::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.13; Fri, 17 Oct 2025 02:12:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9228.010; Fri, 17 Oct 2025
 02:12:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Oct 2025 11:12:29 +0900
Message-Id: <DDK8EYINVIKJ.2ZK04J2C06GGR@nvidia.com>
Cc: <viresh.kumar@linaro.org>, <acourbot@nvidia.com>, <ira.weiny@intel.com>,
 <leon@kernel.org>, <daniel.almeida@collabora.com>, <bhelgaas@google.com>,
 <kwilczynski@kernel.org>, <abdiel.janulgue@gmail.com>,
 <robin.murphy@arm.com>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: driver: let probe() return impl PinInit<Self, Error>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251016125544.15559-1-dakr@kernel.org>
In-Reply-To: <20251016125544.15559-1-dakr@kernel.org>
X-ClientProxiedBy: TY4P286CA0049.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM3PR12MB9389:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f28b244-1b89-4058-bc90-08de0d22a1d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUEvL2Vkemh4SGhoK09ybEZyZlJKTXN5Y0crRVh4ODJzTkZaVndvWWxrYVJB?=
 =?utf-8?B?dmRvZE5pSllqcXVLK0puYTNQWjVGMmRFOFNRT3lJOHdMWVE5WWFYSTdSOTNC?=
 =?utf-8?B?WWM2cEpCVnlCSmh0di9ZVVpLN25PZW9uckswQWxYWEc5MGM1NDFmNUp3N0F2?=
 =?utf-8?B?ZXhINGVsL3VVY0tlYmpnMU0rdG1TcHhQaHNnVkJVN1lvZW1oenRCN2U4UXdC?=
 =?utf-8?B?NWdhRlEyQ2c4SDE0L0QyNDRJL3F3eGhtblZpalR2SGpQNXRMazUwcHVNaENr?=
 =?utf-8?B?NEZFaEl3NUl1ZWhwekxrKzN1SXBuVjFQald6TzR6T1RFK0RKZnY3bk1NZ3p3?=
 =?utf-8?B?cy8wamthWWtkWEhESmFpOThIZXN1MTdyWFFQSGZ4SXh5dGdJR0p2Z01uT0Vh?=
 =?utf-8?B?d3FqU1hJRFdtaUN0cGhFdiswcEs4bjROWG1CWERrcU1lZFBUL1FzZytZSVRB?=
 =?utf-8?B?MUFxYTJLOCt4QmxLMWp6Q2RmZmpHMFY5NHl3QlhNTjh0dkFWSDNWbmcwZDg1?=
 =?utf-8?B?aTFDYkRlS3dreGEybFVpRFhBUW5ZVDFTZ3VoekdCT1B6VmxhQk5IQzBmVEdq?=
 =?utf-8?B?cUxpSDV1a2NkWlFNdGM3SVIwakNJWXlqYlE4RW1BVmZOcVBOOERTaG5HTFFE?=
 =?utf-8?B?V1ZqMnhESkpYUzFzSTJQYWI1Y05SQnczbnBkRmhIeGdEQ05MMnZPalAvbWJY?=
 =?utf-8?B?ZVA0MTRIajc4SXBVV3B1dTkvdDlDczFRZU9NUzhOL3A5R1o1NFQ3VitYNTZ6?=
 =?utf-8?B?L2NXYnluQ25UcDg2TXBtUWM0ZG9MT2ZnbGtBcW54Y1FtZTlWeml2L2thVjU2?=
 =?utf-8?B?UVl2cWZKWFo1UXJ2SXFFdXRJaVJZcElLN3FlNjRRWktsZ0RDNFhZRlJjcGNR?=
 =?utf-8?B?L2ZrK0dCcXF1VGpEOEJDd3c3STRaMnRoL3pERjVGdXBMazdkSGpBQzY1VGtw?=
 =?utf-8?B?UENxdUhyZ2FLcml5YzVPOFUyVlQ5Szg2Wm5TNThvMUpiZWpXL0o1Y09NKzly?=
 =?utf-8?B?UmhEQnpiMUVaY0hSRWlLRm1yYnoyUW9rUkdtT1h0VDlmOC9tU2NtMUJpODk1?=
 =?utf-8?B?YXR3Ymp3YUlZUXN0MTM2OG9DWkN2MUQvcUtFVjJTWUJkVDQyNkxoOEtkVk4v?=
 =?utf-8?B?bEhZNlhnOUZsM2x2NEpySFlacTd6M3lBd0xpRFlaaEM3UlpHYmxkMWhNbmhj?=
 =?utf-8?B?TkZaN3FBTGxKNUJBRnFCVE9NQ3lYaW40QW1XeEhydzhoWkY2c0JMbWIyYUFI?=
 =?utf-8?B?M01pazhqWWtucUxHN0xJUjVXSVpVUzBhRTFmUXU1V09GS1F5R2RKQmh0MnFX?=
 =?utf-8?B?ckRRc0pPb1EwMEZsOFRYbnNVVG1WWmNPb1ZsQzJzbnYzak1XTlA0N3dPdTU0?=
 =?utf-8?B?T21LLys1MXNYZzIrZy9RalUyMkRSa205SXJGbGs0TXdhd3hvSTRlTks2em41?=
 =?utf-8?B?bjRsdmFxeENheFgzU0xMRi9IVlVISFAwMTRMMTZWZTNnWWF0ejlwVHB5VE1k?=
 =?utf-8?B?TktFSC9CMVZBaUZMY2tUM09vcGhkTUdSajJoTU0wM0lTSENJbThlZkg0cTZx?=
 =?utf-8?B?UlNkeFo2SDd5NzNzL0Y2Tk9SRVVMTFkzR2dqcktQYlM5KzkwODYrN2IyOGZY?=
 =?utf-8?B?WVNpYS9pYjFaMCt4Z2plaERYbkRIRTNSN2RWZGZYWGNIOTV5d0llejFqZWxI?=
 =?utf-8?B?N2F4cUxBd2lyVVNONlVYdlVGd1JVZitFQjdreG1JTHk2S1JTcUdUT1RobGwy?=
 =?utf-8?B?MzFIaTJYa0NBaHFSNVZPNEpPQkx3Sm9YV2luQU9YMzFzaGZZUkQ2U3lxUVNF?=
 =?utf-8?B?cm1aL2lSbytnWk1RaXFUWEZVV2pwOGdGMTdJK3NoNks1YnJWVi92N3N6enlN?=
 =?utf-8?B?YmozUnpYeUxHK2d4c1JJU3FTazYzS1ZxWDdkK0pxcm9jbnFNMUd3MkdraTNN?=
 =?utf-8?Q?EmYCsQIuE5QRggrllP3066hpNgXwsCkK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVduSytMMjBEb0swazVRZnVYSWxaTkhyYzUyOS9iaWlWL3lqa3h1cEtXNU55?=
 =?utf-8?B?UkN0bmlYZW9jOWc4VFh5d2NpbXEwNTFwdmlaQUVTU2ROUXRmYUNQSUV4TkpJ?=
 =?utf-8?B?VzM5T3liMjVLVzRFVEs0UjY5aFpFWGhETFNJZHBjQlUxcVY5czNhWktxb3hR?=
 =?utf-8?B?RjFCYzFHR0xOK1ZqK3JhMWVSOHllQW5oOUd4YmZkaWJ2NnRQZm95MkwwOFFs?=
 =?utf-8?B?WGFLN0NuUUkyZUpTODNPYXdnVGJDOFdLUUxXRzRNeUhZdXV4Y1hmdmVlS0hK?=
 =?utf-8?B?eTRaTEVIbFFaVjIzNnRPcmwyejZKYk9QT3ZQb1laaFVwNFVsbWJDOHdCUDdK?=
 =?utf-8?B?S2ZkZDhBNXV6eDJEYmxLSFVsSjJZOG0vOFVsaUhhMXN2cFk3OXRGa3JPWThy?=
 =?utf-8?B?ZWlHSzJNV3Q3c3pJRUJFQUdTVGN1eEdzL2xDWklYbVlzc2l2TklSMTNDR01a?=
 =?utf-8?B?RktPMFVKbjc2cGpGR1RUdGhjQktDYWRYRVBjTFZaWGhKdDZFNzF0SDcvTnJ1?=
 =?utf-8?B?OHN2ckUrSzlobU1UYmE1UGgxRGhHVHVFL1dSL2ljQjVRYUVXRXpzSVdRRUc2?=
 =?utf-8?B?Y0VrbGM4NXZkeVhKTm9tb25jV29ua1NzK1VnRHZUdk5GREtpNmtQZU51ZkVu?=
 =?utf-8?B?SHY5d2NnUDU2cGpLbEFRMGMrWlhFMFVKN3BUVjN1RVdPYm5yT1JxbTFDaVdv?=
 =?utf-8?B?cEhnNkdNclhueEZWLy9nU3FxUVlZZmRQZDY1emNGS0ltOGp6VzJtTStYSE4w?=
 =?utf-8?B?RERBMTd5Q0diZk11bU8yMXVleEtsOStEWmZENDBQVDVud1ljcUlueUR0OUtT?=
 =?utf-8?B?Z0RIUXBsNnp2TWRGalYva1BSRGw0cWhRODB4ano3L2NROFlYQy9pZGNzVG1i?=
 =?utf-8?B?SDcrUHgvc2drVjFDOHJBUVhTQmhuYitjZW1FQjY4eXpjVlN1eHhweU1wNjB4?=
 =?utf-8?B?MnUwWFJyb0hRZTFkZ0Q1MDc5MkxaZjJZbExhYTUyLzErVkgyMGROVjU4M3Y1?=
 =?utf-8?B?Qm9wSWJHc1BEZ2ZvdjNpdjBqUkE4MmdnMUtaWThLd2IwUzRVZFQxWHZGeU0x?=
 =?utf-8?B?UGhRV1lVaWhCaEtMaWd1QlgxSUh3YWZ0NGtWY0FnekFoV1BUZnRuSFJLc0Vn?=
 =?utf-8?B?T2RjKzRYZjZBTDdBOUxwSFllYktLZGorc05aWm9IaVlaY3hOckhzS1pMK1lG?=
 =?utf-8?B?NDRDSXRqbFdFcEk1TjFFL1lVSGVTaU02MU84M2x1K1R0cEdtOUJUWU1mT3ZF?=
 =?utf-8?B?eHU5U0s4Qk41SDNaa3hMYlJndVRTSzE2UlhVVlRKTlVVWktCVkZsTnpyaXRy?=
 =?utf-8?B?eFRXK2NMRVREaTdhV1FudjZmV2VYZW1ubGx5UTJsc3poZUVKc2k0NjJNcHVC?=
 =?utf-8?B?dk5vekNpUnNwTGtCSEF3K3diWE5oTnlZUk1mT3dxTTk2ZzkzSlFRV2prVXVO?=
 =?utf-8?B?OGpHQjJqU1dmdUpEOEdnYmtwWmFBcFRCd0cxZFIyRVhkV25vUHhtNnBmcFR0?=
 =?utf-8?B?bzZkb1g3ZTlOTFpmUGtaK3U5ZnJ6b3o0N0gyQkhFc1M0Tll1aWU1N1pWeXNr?=
 =?utf-8?B?SmZLYUd6em5CKzQxeEdpNUJEcEVxRTF3RUdNTjBqei9mN2FUS0JnUVBHUEJX?=
 =?utf-8?B?VlJyVFRtSEJvLzRJckc5UEFCMHhvSTNDbDJuS01rT0N2QktaMjc0YzJrQWRx?=
 =?utf-8?B?VkhGY0tLMWhIMUZMTGl4bGJ0dHBVVmVvMVB6MDdzTU5TZVNYbGFTWjMydXJx?=
 =?utf-8?B?OWhWTkdiUGN1ZWxwTlF4ajVrTVJnNkVBMGtUMkFKNVFMdEhMU0Q4ZUR4UXEv?=
 =?utf-8?B?TEwrNzIxUXA2RUUza0h6ejBuWitoVkpnWHhGV1VyaWcxYTQ4Y1pmd2k4cWt0?=
 =?utf-8?B?WGFTOGJYTStmV0VnMHhNSFdMY0FqMXluY014eFFGaXFJZlFZUFpXT1dOeTJ6?=
 =?utf-8?B?cFBQYktOTkdkY25BWXlCR1l3VWVTU1ZNVmgrc1lwZysrZzRiRFFKdG5IbE5U?=
 =?utf-8?B?b0cyeEJFNzh5aUlicys5dHQ3R09QL1k2amVSRHVXYXdtV1hpRTZiWnZKcHlk?=
 =?utf-8?B?NjB5ZS9IOHg2SjBBM1owbityRjVNN3V6dXB2V3NqQ1hNYUl6N3NLVHRacTV6?=
 =?utf-8?B?N01QSWw5cEN3QTNua3JBSFF6M2ljem9JajZjd1ZOSnQzYmVNbWJrbThRY1p5?=
 =?utf-8?Q?8nlAbHz98I/DJP7tJR+E/DthZgZcfXl/QNW5MwQFbLIO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f28b244-1b89-4058-bc90-08de0d22a1d2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 02:12:32.9899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Kgk4390gGRx1OJXO/LdKDfHcBDNoC8Lk3xeVSRhjugEio042+O0R5P/B6hJJOaCnJdHvzH2EzbZr0ri2WQMYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9389
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

On Thu Oct 16, 2025 at 9:55 PM JST, Danilo Krummrich wrote:
> The driver model defines the lifetime of the private data stored in (and
> owned by) a bus device to be valid from when the driver is bound to a
> device (i.e. from successful probe()) until the driver is unbound from
> the device.
>
> This is already taken care of by the Rust implementation of the driver
> model. However, we still ask drivers to return a Result<Pin<KBox<Self>>>
> from probe().
>
> Unlike in C, where we do not have the concept of initializers, but
> rather deal with uninitialized memory, drivers can just return an
> impl PinInit<Self, Error> instead.
>
> This contributed to more clarity to the fact that a driver returns it's

nit: s/it's/its

> device private data in probe() and the Rust driver model owns the data,
> manages the lifetime and - considering the lifetime - provides (safe)
> accessors for the driver.
>
> Hence, let probe() functions return an impl PinInit<Self, Error> instead
> of Result<Pin<KBox<Self>>>.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Short anecdote: I was curious about measuring the footprint impact of
pin initializers, so I did a `size vmlinux` before and after this patch
to compare the size of the `text` section. This patch removes exactly 60
bytes of binary code, which I guess corresponds to the duplicated `KBox`
allocations that are now gone. It's great to confirm once again how Rust
abstractions are indeed zero-overhead! :)

Also, fwiw,

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

