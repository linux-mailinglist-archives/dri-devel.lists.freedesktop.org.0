Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB287ACAD21
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 13:21:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25AFC10E4F8;
	Mon,  2 Jun 2025 11:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LCQS/X4g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E62110E4F6;
 Mon,  2 Jun 2025 11:21:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdAivusO5DjUtp1uSFCPOHyUHxUG443PQki1iCwcB/wgTs2wESEioVhreOSyYyI2IYFUuhI6YTdIcfHJkGlY46Vqo71MkuAJvvTyBWaGgdIiG/onYovPh5quNCkyqEqZdCIDndQ+4xa1VcXXwdXb2AUuC3zu3vD1DE/CjbZECXBgjW+V4oe1bOGs3woU5aGST8kbM2LYtKaRSBP1K+kEIWflVcW0g5wtV3RXvRqrL4JNZEwFs9nAehvL07TgLNXzEUuDR1/hoLxLLAdb1jmesmYMOiqJgVPKFGFhrAHhb3s2m8DOtOoXkL5GHZO08jgHk9iAu7/38g0hy0xEGH85Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0H1m0+U13KDNVJgqwlZmr961xiZiuVXxHZa+qkejPyM=;
 b=o576b3KBLdZOknho4xyt0Sk1xkl31Y9f4IPUY2q68DmpzCUyyL9rG6DFhGFoXunfNMZJRestauNrIG7No2JGgRMXR2GTVIMa+OBpSosiOf4AckBPlkkhArCGjb/mx1lm4vLUuRJfon5NGoQSpaFizEibnJaZ0tfbkvbDok64+bky82d1SqdaO0fhpijBCMU1oJ7msqp/t8piWxFn1KU8OZ8FKMhxQ4nyUET/quRG92Tu9CHvUemkhFJ7lUhGC7xkmy+nLKOGLm6eu1/fnOLtJxUkcgelZYMi0AL0/f61p05VMFCN89j9XNai9jYfSpKXdydIEonv3syH4BIAvTCz/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0H1m0+U13KDNVJgqwlZmr961xiZiuVXxHZa+qkejPyM=;
 b=LCQS/X4gM1x2GJSkOPxSXpeFTtPztAP0Spfp9cJkC/ZfxWdWV1HqfleB785UO3xX8BFvs4vBP/5IGSuUngd9MSFxI9qOV5HkomXu7x9oYxgly94RplrO0nDdSQkgiRZLvpFoFsqvRvV6j5DP7q3MR8D6HPEaE3HnpLxtp6xxyOHrUEHiQo9kKrKDMDSNLDdK6G7BLPCTZ4JWZ8HzQd5sFF4Z7P1DjwmAbimciB5oObJ71yHsDOHiyR/jz3j2pE6U/jVremrRXvyUmkuvDkKtBT3UuqEHV0NAulnxQm70khxON9cKiR6VCUzGehHbYUQrC9spmrN/ueYeBEKVIuwpag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7250.namprd12.prod.outlook.com (2603:10b6:806:2aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Mon, 2 Jun
 2025 11:21:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 11:21:11 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Jun 2025 20:21:05 +0900
Message-Id: <DAC0AD24EKFM.3CEVO5ZZ0S5BR@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 09/20] gpu: nova-core: increase BAR0 size to 16MB
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Lyude Paul" <lyude@redhat.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-9-05dfd4f39479@nvidia.com>
 <01a02d519b7a7b93fbc94a043df2a7dadea6e16a.camel@redhat.com>
In-Reply-To: <01a02d519b7a7b93fbc94a043df2a7dadea6e16a.camel@redhat.com>
X-ClientProxiedBy: TYCPR01CA0031.jpnprd01.prod.outlook.com
 (2603:1096:405:1::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7250:EE_
X-MS-Office365-Filtering-Correlation-Id: ee9626b6-33a2-4ded-a3ee-08dda1c7943c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0RKS0JqbEQvSWl1YTZjMmcydzZSc2JqaUFITk1GM0ZXOGQ5Z0VOY1d1cWJw?=
 =?utf-8?B?aExLNStIcjk1NU9wMVpONVlVbGlpVlhlQy9iTDY5Q2hGays5bXB6MEp2OXRQ?=
 =?utf-8?B?bmU5YWlJU1NMZ0RhWGErcXk1QjBkT1RJRlJSS3RVKzdYRUdBa3dlTldaTFNR?=
 =?utf-8?B?dzVyaGlNUTRxQUxXbmVKN05BSkhKUlNkTlFCSEE4NklTNXJKY1k4UkZrUHdp?=
 =?utf-8?B?S2J0eUJJTlJBS0dWVE9BSVFXR29hVStONzB3YmlNSnFWRXhuaVJFVEE4RHJY?=
 =?utf-8?B?SEYzalZDOUxhejhMQTV0UlVJVy8vMGgrQWVsbWIyeGpKaE1jREJNOTdCMXZ2?=
 =?utf-8?B?b3VXakYvZW9kc0J6Z3R1UUJZSzZPRnBST2I0QllGRHp0VEZIUjJQVzd5NTRr?=
 =?utf-8?B?Z1pxSzBobmtnaGFmV2t4Tk9yaDNlQTF0NjhKMmJneTE0aExOOFlOUng1QkdH?=
 =?utf-8?B?b01PT09wQy9LblpoUHFWWW9RWjRuazdQbEJ2cTlnQUNTTE83c3VDRnJmQ2FG?=
 =?utf-8?B?ZVBOME94M1VTeUUzdExTZjg4STd6QjBzS05zYlJ1VWMxVmc4b0RUN0dNZFd0?=
 =?utf-8?B?Yit4Z3NRSUFTa1AvOUUrN3AwZFBBTjNiMWl5WmRZMFlVZG9OVzNFV2FweUpK?=
 =?utf-8?B?QlVsT3Z5ZGloVXJVTTFPdlAxWE1leGhtL0EvVFJtNitrUGxocnhUc2VVK0pC?=
 =?utf-8?B?NVhycnB5dGhvUDNLRU1rcEduMFg5Rm5KeGtJUTBQRW04cVk1Y2RpS3E2MTQv?=
 =?utf-8?B?ME1KcjQ2YlZHUG9tbnA1RTRhL2ZEL0ZnM2FDUFJiUkZraE5WMDJVMkpBa1p3?=
 =?utf-8?B?dDF1KzNjcEJxOHM3SlNyalVUaGtyOE1IcE8zcTMzWXIvbFJEeUxjTGZBR3kv?=
 =?utf-8?B?MDZZSVFPbjE1SkRiL2x0cmJlR1Zjc2kwaUdsS0pKZ2JqakpJUVRrbjFtNkF5?=
 =?utf-8?B?VWJUZ1lHN2ZGQ3NxR3BhcHd0QkJtNnhVYWtIOTlEZlVhOW16MjA4NFp2aXJW?=
 =?utf-8?B?Mnk5VjF3YVZnNkRTVTQ3UUd1Y08xZlB3dU15cXFVSjVDdWRJa3JwMGJuVUl4?=
 =?utf-8?B?MVhsMlYyNlY1TitzZFpUSWJqTHdvK3RpVWhVeERpdmRxRXNJYXdLU0RpejFV?=
 =?utf-8?B?TFdjRjJZZFF1Sk5TUzl0VlNuTW8vQXErM3dTbHBiVy9iTHhmK3B5UEs2YUoy?=
 =?utf-8?B?WDZnd3pqRFJiaENzek1BU3U5MUhxc0pKNUdxNG1sak83YnhoZUcxaGZNUlFZ?=
 =?utf-8?B?VThPVUJJOWlhMDZTcHVJaDd4amQ2QWVGY2JEWllST0FTZnM1aDJNZklqL1RO?=
 =?utf-8?B?YzNJekRSWXBLakQ5VWRTWGRSSUttejAvMlFQV2hYaEtxd2h2VkhIaU92MDFJ?=
 =?utf-8?B?TGF1T1UwMUN5SDlmcFczWFV6Y1ZVS0hWT2JaNXRFaXRmKzU5S1lINy9rZkd2?=
 =?utf-8?B?WEZyTmVhcTFyT1ZyaG5GdGxrKzIySFp2V3diSGVwRDZxdFFzYUVrd3N5RHdw?=
 =?utf-8?B?QTNueHZjVmcwcDVyV2JxUnNXRVRiZk5mSTRCNXVLRk9sWXJiam1NaklzZ1Rw?=
 =?utf-8?B?TWVxdnV4TVFzODF3U1pXNm9hVkVZbUx3MjgrbXdObWNmNkhLSC9acnBFWjA4?=
 =?utf-8?B?WHErT1NqOHZLUHlwS1c0cHB5aktPdGFFc1IzYmcxKzcvZ253eHhEZzBKTStK?=
 =?utf-8?B?OHE4SzRCNVlIdk1YM2NXTzcxM3VMMXlZQXRYeXpRWkFLcG1NRExpbTZGNGNv?=
 =?utf-8?B?VFk2MXRuWWsrNnNHZWJUVk1OS3dwNXlLZmNNZHIzZkxseDVhcUpkTms5ekdj?=
 =?utf-8?B?KzNaMDlyc1BNdFRYdVcrb2h1S291Qzd0N2w2NkVrZW5nMDBvQ2NmUUhvUnpa?=
 =?utf-8?B?b29KTzhIVGVLV3NBOUMydWFmcWdjNnBPaU1ncjhKdVBwbkRLT3ZsRGlwRWpq?=
 =?utf-8?B?ZjVtOVRvQzhScjl5VEhCRzFNVU1LQ3lrSFdSSkM1K3VmMWgyNk5weDVKa082?=
 =?utf-8?B?R2ZZeFdQYmlnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUJSQUI0NGNsZ1pLdXdJVXVJem9INWoxT3VRK0l3Y1g2bUR6Qy91b0RCbjVk?=
 =?utf-8?B?UzJOTFEyVUxZcGREMmIyYlcrVlRVQkgwbzIyQ2FYdEFQUFdkbkI5OHUrSEZp?=
 =?utf-8?B?QytINGk4TUhrSkFIZGEzYU9wU1p1Sk5menl1ZTQwRzF0bVUwb1VtL1lLcGFZ?=
 =?utf-8?B?dC95elhwMi9ONFJiR3NTYjNNS0xyZVREQVVCVFhBbzJOL1dabUFYR2hPNk03?=
 =?utf-8?B?MUFQaGRuSEx6ZEdpeEx6cGZYOHp5VEF0cTY2SWpTL1lEb0lQZkRCamdkenZt?=
 =?utf-8?B?QXRiUjJWNmFOSlJLckoyeW1qQ0NrZm9Wb3V4UkVOeHh4ZlA1ZlNlUUg4TXFT?=
 =?utf-8?B?emQrcUE3RCtIUzB5dXcyV1RxeHlkNWtRdDZxbmFSSFJaL1ZnVlFPbzJyRFFo?=
 =?utf-8?B?R3FNa29uRjFyRWdSZGNET0xGRnRsSm4zNGlXVXgyenZ4eElwd0hNbVozSnZu?=
 =?utf-8?B?U0RxRk5vL0NQSkZ2MHQ1VXBwS1ltdUNSa0psYWVqTzFNTStrY2hkOGQ5YU9j?=
 =?utf-8?B?WUlLaWJaYWxudlZLU21WTDkvZXl2UEdLTXFkUHhCTTYrOEtFcmN2eEJ1dm1p?=
 =?utf-8?B?MElieDZuZnBSb043WWxrQjVhOXpGM2lRV1NTOGJkcG5vdlcyQkVTbFdTWEdY?=
 =?utf-8?B?ZEJoTTNXN2tabDdXWEc3Q1c3ZXlJU3o1U2pPOGY2SVk4YW5xOVp2QmxSanRU?=
 =?utf-8?B?d3FEa0VpUDIwR3JITmJlU1Ixd20wQ3dJR3IvRXd2TVQ2Tkgrem0zdWZkcGdU?=
 =?utf-8?B?dlFnWGtqSW1HeUN3OXJVVUswa21QODlYaXVQazJJU3h4TzFnV1Z1WC8rTkF5?=
 =?utf-8?B?MmJ3N0xLd3NxQU1vc3NEN0tyWlhDem1VZ1VnQ1g3cC9JSzc2OG1HT1dGMlMv?=
 =?utf-8?B?SEhHRUJnMWN2d3JkT2VTbjZQWnY5a0owTzZaNTNScmI1SWtPandhQWRBbGl4?=
 =?utf-8?B?L1FFVnVaUHRaOWNFWXk0SmwyeFB3R0lJZUJma2NsZGIwYzJyQzcyVjBhUm16?=
 =?utf-8?B?bGV0dU1JRkExK2xONjRJUDRJUG8yK2FNWHUxdnZ2WnRuam9qMXZaUFBVSm4x?=
 =?utf-8?B?OEY2TnloeWFCdDVRcHI0VUdPSTY4dzdaU1pkOEJXNlpmMkxlUmNJQXRPWk9Q?=
 =?utf-8?B?Y2hjNDhsbnRsLzhLRm00ZCtYai9rUnFlS1duRy9GSGpkYkxVcVg3WVg2ZWUy?=
 =?utf-8?B?cnV5aGJTNTJjQk5jZjJab3VTNVF3U3diMzFYMGZyWkJ1MTVjQ0ZJdkpoblJQ?=
 =?utf-8?B?eG5Jb3ZHTUtDSHA4TjhRY0xQRVcrMFRiZ0dDSEFDakZJMVJKWEpMMEtHUE9D?=
 =?utf-8?B?ZlVwRXFTdDd4cWptUjFOTjZPNjdBRFZDcXZMQ2thQksyODA2OHE2aVZXdmtl?=
 =?utf-8?B?SVc2MjJERXRueXJqTmIwa1BrWW9ESFArYmJtcGY4dGQwWGdubFJkQnJjMzVQ?=
 =?utf-8?B?eUNPbnJ2MmZhMWZWTDUxYjBFYmk3VFkxMytMNWZ3VEVKRXFCeFpyS2l0ZUMz?=
 =?utf-8?B?Q3BtNmptNU5xYTFxQnN3cE5OcnpoSnRBVEVJbFJDbjIzc05tSWJ0b3dYWXUx?=
 =?utf-8?B?YW0vemVkRnEyRHdEOTYvWjl3QlE1UEplMjMvL2VEcGpnejNYYndSWHFyYWVj?=
 =?utf-8?B?WEEzZGczVkJ6T0VHZHRpcEwya2NQb0Q3eFhreHNnbmR3bEVMTGlSd1RoNHZk?=
 =?utf-8?B?M2FJajZwbGRoYVFXVnozQlh2WnFOTW5XanRrME9FT215OXo4N2ZPVGIwa2hG?=
 =?utf-8?B?TUNCQ2xNNzEyWnVQbTFkUXNlbDFERThVdkpQZXo2OVMzbXJ4QTdXSkpHYVNS?=
 =?utf-8?B?YTZTa2o5ZlhlZEpKcEdrSk9iOHBhQ0RWbndiejFnNElZZHVVcFU2TTNBR1RS?=
 =?utf-8?B?bHkwSllaQlpsTFRKN2ovdXR3SXU3L29uQ2VjK2VFc1VIdWpoWG0yZngzUHJF?=
 =?utf-8?B?TFZWVUxhaE9DV2VDd0xoY1BIQmtNaW5JWFZmRVpmS2tET0hYRmttNklvcTIw?=
 =?utf-8?B?WUp6TjlCZnNsaHJUUVJTQ2oxSlhJZ3JwcmpPTXFia1hZNjZiQkxITkRvOXRU?=
 =?utf-8?B?dmJDZmlaZ3RjNUlBK3dLdit4Ym52dDFnS3Rna201ZlhFYTRRTlNXK21scTBI?=
 =?utf-8?B?dEl3RCtNZVB6R05CZTh6NXVSZTRJQ2xvWUtrRnl3Q3dZREdCQjFYdWZTejhJ?=
 =?utf-8?Q?hNaHtcNuwnZUKIbfHGOd6EU4KYLhyhCa4rnD8FzsKpyP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee9626b6-33a2-4ded-a3ee-08dda1c7943c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 11:21:11.5272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MlnifMS/GXsAz75LTZuk07Hapk7cs3sau+eMF4cNPS3V/Pzdx2Ltw7UAtp6ywzP/h2YLuNfrCGupf/LEtZx/yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7250
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

On Sat May 31, 2025 at 6:46 AM JST, Lyude Paul wrote:
> On Wed, 2025-05-21 at 15:45 +0900, Alexandre Courbot wrote:
>> =20
>> -const BAR0_SIZE: usize =3D 8;
>> +const BAR0_SIZE: usize =3D 0x1000000;
>>  pub(crate) type Bar0 =3D pci::Bar<BAR0_SIZE>;
>> =20
>
> Hm, considering that you just added additional SZ_* constants wouldn't we=
 want
> to use one of those here instead of 0x1000000?

Absolutely, thanks for pointing it out!
