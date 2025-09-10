Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ECBB517D6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 15:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19F310E2DC;
	Wed, 10 Sep 2025 13:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rJGVMAPs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF2910E2D9;
 Wed, 10 Sep 2025 13:25:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0Dz1bvUCbSG7waervL0rkBggF3MkDlLnExHEZTjpCyzcUvH1cAbtQm3jTFtHerCnw1ItXCoQSyHkBUoRBehwOL5KZu0UUmlAQtx8WvNv1kbumSSd9G2Y2RDli8sEO6bo1JkWih4L4FE6gSlOwPgvpcdNFOwrqTU1BYY/fLjOrINhwp0dgUo/GHlMXcvMzJnZo7E7OUUA091rwynqFx12dJ2SkAK+6/uqIDV5p4okwyy2kdArpYgLyWkH9N9Aa+zncPPPZaAdIG87kdVElEcsQiZ5MCcfiGEfLaT0mob7NvcRReM5EyBs9zqERCpmDc4sSotyNIah7yG/or61UF96A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssSLwxGl9IDj6aYotbh7MnN7xGtdH2ZIShnkOQjWwtY=;
 b=qr5EA09mjKNT70IAACwJlaciyQb/DsFfhvLa5KNHSUufjis7fbm6dHFOzewwhlbqkVfdj/OQbAsBeN6UfZkPD6x4qgn4o+tTZdCKu/5p3I5Zhn+kthvDNbdryBTQrTJX/Sjh6/foKmq3EUsCcK2Xd8yBwa8HfOZdDMkY/jx91kSH3rWcllBHcOJ8ecR1kwuCI8+7EphKbEUq/7d4GdaVtJG3hLtMwv9mZE96ix3D/4DDIRS0iyoIkzcjHHwO076suPZTA4+9gkeT0lkN9JALnxLRelOBUnjwuIMdvpGGdbTAXLV6fxok72Nd7Z2CtPlHS2qQJRC0Bd0A9fCElPfNqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssSLwxGl9IDj6aYotbh7MnN7xGtdH2ZIShnkOQjWwtY=;
 b=rJGVMAPsM/kpDf9MnbqnTvmGuunGHtCZkUqRNqbGGKvBy6lqEfhwJACBj29kxkBLBBhnMfwdz8e98xAKW5oy23+ihJe75b0cX9xpBAu6OrVk1WHcsl/cKBycLSf9zaaSZOjwSbJ4Yz4D1//YpJD1kMRQASLNJFYX/D5VVKxjqldSGiufrJEykqpY6LOPIBfxCZTHO+Z+iRJKiGPYQwkAsVdjwc2viI3A/b9VCT1//FWh9fcoGEZstuZtwYZoxyojG1SrpKxQaIKDYbGWCcABMXNcC919l8NTr6QWDnXUekXF2svZF0VGkt+nUuIkoAO0RGS2/eySY70mj7anRILDCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BN5PR12MB9539.namprd12.prod.outlook.com (2603:10b6:408:2aa::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 13:25:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 13:25:27 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Sep 2025 22:25:24 +0900
Message-Id: <DCP5K0R9YB31.2VFUFEFOHV8LR@nvidia.com>
Subject: Re: [PATCH v2 1/4] nova-core: bitstruct: Move bitfield-specific
 code from register! into new macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
 <20250903215428.1296517-2-joelagnelf@nvidia.com>
 <DCN39JCF1DIJ.3JESSN7N9WJBP@nvidia.com>
 <3ef9e2c2-560e-4b58-96f8-a6db4236fe0e@nvidia.com>
 <DCNX57PKVO6C.2MYEGBZ26OQ59@nvidia.com> <20250909185532.GA4167211@joelbox2>
In-Reply-To: <20250909185532.GA4167211@joelbox2>
X-ClientProxiedBy: TYCP286CA0149.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BN5PR12MB9539:EE_
X-MS-Office365-Filtering-Correlation-Id: d190b374-309e-4029-f2ee-08ddf06d81b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2FPMjMxUUZSaXBZT2pKSWNCR3ZUOHluS3lJMVhQM0FLTEI2dGNhSkFmM3E1?=
 =?utf-8?B?aERIZGJ3OWlGVFd0b1E3Y2hBMkRjcTd0bmhxQXRidFg2UVFBcWlQRzZMVkZq?=
 =?utf-8?B?WUF2dHppNS9CYVFSNWdpZWw1L29TZGhuOUo0bGNMYTRQSUNJRVdhZHd2M1lX?=
 =?utf-8?B?NEszQ0gweWxzT1piTGZ2dlFMK3lPNFUvUldqSGxGUEFoRHk4eCtrMVU5bk9s?=
 =?utf-8?B?WExnTGV0KzFabXlKMytkN3JXTnAyQ2dsV01BaVc0cUk3UCtRZTJaWmNXOUJQ?=
 =?utf-8?B?MDhaUDAxZGx5enZUTGJpT091Z3o2RkswT3FzeENvS2RiWTZtbWtNb0NBZ0ln?=
 =?utf-8?B?TGVKTWc1U2tGdTBjUHlzK0RBdk4xcnBWclFmK202UGhDYWZXZzJPcHNXbGli?=
 =?utf-8?B?QzBXTXJ4aW4wT3FtTFIvUUs1ZTYremI1cjFrbVdSM2JxWTRJMTJKOGR3U3Z0?=
 =?utf-8?B?clFBUlZzbDhaNEk5cTBIQzJyRVl1YXg1R3NYbUJrQmk0dUowc0NaeFhQR3pP?=
 =?utf-8?B?WFBudGoraUhLcmQ0Nzlxc1ZYVm1pdkt1UTgrS2hzMHlFRFJ1b0I2L3pDNmFW?=
 =?utf-8?B?YWo1ZVhzNUUxSFJuT2M2dEpCK003bGtPWGlpdXNodGttd2NUam5pTEdNOFUz?=
 =?utf-8?B?K2x0UHpqaEJOT0VjODBOTnpIbEVNMDZLbWYrNThIYWR3blF0NDlsZkg0ejht?=
 =?utf-8?B?VEZ6cmlYTWh6Mlo4c2lNZXlNdWQwemdobmQ2LzNHclltYUl0dFVQb2xaSVdM?=
 =?utf-8?B?SCtRYkVIN004ckJUSlcyNVZlUy9kYkJGUFRxeVVNTjdubUpSRFFSME8zQUE0?=
 =?utf-8?B?Mk55RzZUb1BkZ1JwMnRXUHBJY0xPS0dsNS9iSC9EZld4VHJvMTU3N2RzbUNV?=
 =?utf-8?B?d0JGMkhtelEwcWZ2NnA4NVZEWEpoc0lKdTBWaHlNVnRsZzRZaFVtTVZUSmNm?=
 =?utf-8?B?K213SUwzNjdBWWFPZzVkZ29IQzVUK21TS05hdXhvNGRkMGFuMm1rOVVOYlBx?=
 =?utf-8?B?NlhING1oUW85aWFqV2lyaGk1a0xycHBmRVpib2pWSDdnQXFySmlhTGhxOExk?=
 =?utf-8?B?QzlpKzFxUGVYdVl3eEcxVTA0MTdTYUc2MXdyeHhiTGU2T3VEakR0Y0tTelAz?=
 =?utf-8?B?cUF4UXhDRWJjakhKeFBHbEhLWXVPTExWeDl5OWkrekQ5S0ZMNHkvOG5CN3F3?=
 =?utf-8?B?bS9wTU4vTjJ3WTV3WTA3c3Nkd0ZETjdnQlcrZkxKUU9mQ3RKZmdpSk45Qmt2?=
 =?utf-8?B?Ri9McHcvQkFHVTlJdGdOcElYNkkxSzRyK0pNYmdNODZjMjJ1UUtib3J3eGln?=
 =?utf-8?B?dURHbEZ5N0ZVSnRQTjR0NG9jUjlsNXoxdEVpbmtGdUVGamtjTEVnWjdSRGpR?=
 =?utf-8?B?NS9qMGpoeUNCcHBDaWIramV4SFNCT2pHM1I0WnRsbm4rM3RJR2RCdmJBV2ly?=
 =?utf-8?B?SWdPTWtMYmZGY0N0NUk2OVFKT3BzcS8zdXNCd05HSzd2TjV1VTJFVkdkRjhG?=
 =?utf-8?B?a1dEZkFaRHljMmJMdUJZdCtBKzdaQW5nUE1BQVRJMWR0citqRHJMMHpwck96?=
 =?utf-8?B?a0wrUGJ5cGQrNlRNOG0xRWpxQm1abXIrRWswd1BvazdaYTRXRHZqb1NkSGJY?=
 =?utf-8?B?RkRsc0JRNTBuN0RpN2RqTk1sV296VlREMWJQTUxBdElZanI3Q2I1NkhMWU5o?=
 =?utf-8?B?SzBoLzRJQXVCUDZ4UXJWM2t3M2doN0JrWjAyMnNyWXpHc1hSUjZRdHNrMW1o?=
 =?utf-8?B?Mm12MGsySlRabkxudWRJRjhzdnpmZG5SaWN4aW5FS2hMZ0d0emIzWXBjY2p6?=
 =?utf-8?B?TCtJZTlDUE1KUTRNSnhPSkErY0hkU09KUTlqYWpnWVJ6cHNVMGIzaWM5bnVU?=
 =?utf-8?B?SlZONmJkVXRVUkhDQzE5SG1SVVN0cHNoVDNGY0MrTW9FREJtaHc5SmxtRmVn?=
 =?utf-8?Q?s3xEPBF1/0A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGVlT2NWbXNlalpoQU1TcEtKK0xSQndDUnVSR09tWWRqZFdiR1dBN1NGMnpv?=
 =?utf-8?B?ZGpaNTMxRVB4cmdFL09qa3hrWUQ2SmluRDZqK1FmTlJoU1Y4KzFXbE9FcTM3?=
 =?utf-8?B?cVlIM01UT1NFVitFWXFKWkNDNlgyb3RVc3UyNTdySUZaUUFaUEhKeHJsNkVv?=
 =?utf-8?B?SjI2SWRXd1JDUnpEV2pYWElLYlp4SEE3WG9xVXcrdmJmSEtSTzVseDBjelR6?=
 =?utf-8?B?dU1SWll2M2lqZ2RrbWpmbW1JV2huZGhnWXlCcm5kQUlINjFVTjR3RnlzZ2xp?=
 =?utf-8?B?L2hJeXNVVkUzbi9EWU1lZWkxVEJYWS9ORHpnTzV5TzBwQWZ5VVhjR3RTRUow?=
 =?utf-8?B?UDArOXpTSFFFUldleWFiVWZZVzhUV2FMZjQ1U2xTK3NVQVZLWW5kSUhMeTFp?=
 =?utf-8?B?SlluRVNtYjV0NnQyUE9qeEhCdXdvOFVLWTV1Snc4eXREZ1RPRjNwMDZub2dv?=
 =?utf-8?B?VmpwSTFNdWRUekc1YjJmL2w2UGhFVE9ycXZlTkJLb21wUmx4dVN1cXNQUTRv?=
 =?utf-8?B?aVFFV21rOUZRMlBpOVlZZnJZN3lucit0SFhnc2RGM3ZZQldFclV5UUMvSi8v?=
 =?utf-8?B?ck0rMi9yUktEZko0bENTbDRKcmNTUWllZ2pSZ2ZmQUpsanBOeTlHd3pEeUww?=
 =?utf-8?B?VGU3eDlXaVRLRWw1ZkhJNkwxVVFYbVJSaWNnRDF0M2J1dWpXdFBFK2pOY05H?=
 =?utf-8?B?RU5QY3pGS0E4YVpGSkNNRWhBd2g4NnJJTnNrV1NiaHp4R0cyYWx6QW1tTndL?=
 =?utf-8?B?dW5LTnNoZWV3czNoM09DMlI4QmVlbGZ4UnBTbU4vTXNEWFd1VUVBUnJiQWtT?=
 =?utf-8?B?MW02cHpUQTVOeXpEN1N3YzBBWXp2MDhvYldQbDBjYnNsbUZlNmZiazBpZklq?=
 =?utf-8?B?OEg5NTM3NXcxZ3VjejhMN1ovaG1EczhPVnFmK09aeVFadThNSnJaSjVJT09F?=
 =?utf-8?B?bWdVcTdVT3BsNUYzbTJ6M09oQ0JEaCtLUGxnRHNYM0d1M0dmb3BiWEMxbWw3?=
 =?utf-8?B?azJHeDRoQ0hyZDN2dGo1RGFNdVlCelQwVkVYaG1jRG5NTnZ1Ni9RTitpN2dX?=
 =?utf-8?B?eHExbWErRVNVNEwxVy9GWldrR0Y0dHhoOVBZYVJ6dUo4ZmVndmxGejVmUmJt?=
 =?utf-8?B?MnpLZmxIUk1yTEExbXpMM1F0bUtOV2U4K3hWT2hNTU1YanQzOEVuTU90ck5L?=
 =?utf-8?B?WlNkWFMvSUpIczFlVUVRcWJrWWc1VmpJc3U4UEZsZ0hDVXJVbDczN0NicDRv?=
 =?utf-8?B?RTdpamxtZE1zejBrQkt0b1ExczEyUnBIeWVXd1NNUzdwZnlEUjdYZVBkREt4?=
 =?utf-8?B?bVFWNXlIUnBaQVhrNmhOc0IyU2ZkbzZOS0Q4bXhEbGIwWURaNGdyZ0c5Mlgr?=
 =?utf-8?B?NGRvaXBicTZia1B5Q1MwUVBPV0FueFE5a2QxY3BNZlZKRllKWWlvMFJ4a1R5?=
 =?utf-8?B?RmY5T0QwckFONTlqV2FyUE9EVjdmVURFd2ZnNzJpSWhTY3BKQUV3MUgxYnM4?=
 =?utf-8?B?b0d6K0prZWVLZ0pvNjFqR25VNTdDdkhveGNGbWNXU3kzWkliNlNSZXBWRytJ?=
 =?utf-8?B?SHRESlROTVpST1doaEt0aGN0ZGJrOVNvcnJQSXlzOWNpMkgxKzVzanZpMkNY?=
 =?utf-8?B?dldzOWpnQTg2VEttOGdERzZ0S0wzSmFGV0ZsVnhzOTJFZ0k4cUtwR05PWExx?=
 =?utf-8?B?M0o3NUI1NVBKSEFMMWdZSEtqZWRYYXo3K1RoREp1N0lucXFhclFhRlA5L3BT?=
 =?utf-8?B?a0VnTnVQcjhuYmtnY243dnRQN3YyZmM0YWJkQkc3L01FM0t5NVUwQ0ZEdURX?=
 =?utf-8?B?bFJHN1ZNM3pONHlsZHlYWFVHMGx0SmJ5VUk0Y09rZTFxK1ROeGFGWkhVMisw?=
 =?utf-8?B?S2htNkhhRHNUVGkrRndWeHJGcUNPdjhkNFluMWdtbm9QTE9mM25xdURndkd1?=
 =?utf-8?B?a2tVanJvekd2VVJhUWpEdVppdmlFb2loWk9LaGgvNUppSSthZldKRWdZODVG?=
 =?utf-8?B?Q1RWeklTdjk3VUlreGt3T2gwaE44UnBKQjEyYzBqZS9NVWx3NFpkekRwbkhQ?=
 =?utf-8?B?T1lDTGpmNHd2WkZPTzIwZUlhVHNqS2lKVHdzaTFqMkVOeXdBWFAxUHV3M1hX?=
 =?utf-8?B?dVAvdmNBbzc2SEJDWXg5bXBDSmMwOFdqRDZSWm16c0VaZ2xFZjlzOWdxR0Vo?=
 =?utf-8?Q?QeopN+m1SZQ3CQwS2ykEwDHN4iKAm/HK4sxZCq2Aswkb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d190b374-309e-4029-f2ee-08ddf06d81b1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 13:25:27.7078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xj8gVdX5XMse5MO70ZoRCLCDAkJWDy/WF4NF6QLj5ltMtJny1xLE3KCBf1R5aWUdVSDKi6Kd/D0m8WyLhF/s+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9539
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

On Wed Sep 10, 2025 at 3:55 AM JST, Joel Fernandes wrote:
> On Tue, Sep 09, 2025 at 11:37:15AM +0900, Alexandre Courbot wrote:
>> On Tue Sep 9, 2025 at 2:16 AM JST, Joel Fernandes wrote:
>> > Hi Alex,
>> >
>> > On 9/7/2025 11:12 PM, Alexandre Courbot wrote:
>> >> On Thu Sep 4, 2025 at 6:54 AM JST, Joel Fernandes wrote:
>> >>> The bitfield-specific into new macro. This will be used to define
>> >>> structs with bitfields, similar to C language.
>> >>>
>> >>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> >>> ---
>> >>>  drivers/gpu/nova-core/bitstruct.rs   | 271 ++++++++++++++++++++++++=
+++
>> >>>  drivers/gpu/nova-core/nova_core.rs   |   3 +
>> >>>  drivers/gpu/nova-core/regs/macros.rs | 247 +-----------------------
>> >>>  3 files changed, 282 insertions(+), 239 deletions(-)
>> >>>  create mode 100644 drivers/gpu/nova-core/bitstruct.rs
>> >>>
>> >>> diff --git a/drivers/gpu/nova-core/bitstruct.rs b/drivers/gpu/nova-c=
ore/bitstruct.rs
>> >>> new file mode 100644
>> >>> index 000000000000..1dd9edab7d07
>> >>> --- /dev/null
>> >>> +++ b/drivers/gpu/nova-core/bitstruct.rs
>> >>> @@ -0,0 +1,271 @@
>> >>> +// SPDX-License-Identifier: GPL-2.0
>> >>> +//
>> >>> +// bitstruct.rs =E2=80=94 Bitfield library for Rust structures
>> >>> +//
>> >>> +// A library that provides support for defining bit fields in Rust
>> >>> +// structures. Also used from things that need bitfields like regis=
ter macro.
>> >>> +///
>> >>> +/// # Syntax
>> >>> +///
>> >>> +/// ```rust
>> >>> +/// bitstruct! {
>> >>> +///     struct ControlReg {
>> >>=20
>> >> The `struct` naming here looks a bit confusing to me - as of this pat=
ch,
>> >> this is a u32, right? And eventually these types will be limited to p=
rimitive types,
>> >> so why not just `ControlReg: u32 {` ?
>> >
>> > This is done in a later patch. This patch is only code movement, in la=
ter patch
>> > we add precisely the syntax you're describing when we add storage type=
s, and
>> > update the register! macro. In this patch bitstruct is only u32.
>>=20
>> My point was, is the `struct` keyword needed at all? Isn't it a bit
>> confusing since these types are technically not Rust structs?
>
> Now that bitstruct has changed to bitfield, I would really insist on leav=
ing
> 'struct' in there.
>
> So it will look like this:
>
> //! bitfield! {
> //!     struct ControlReg {
> //!         3:0       mode        as u8 ?=3D> Mode;
> //!         7         state       as bool =3D> State;
> //!     }
> //! }
>
> Sounds reasonable?

I was about to write "but it not a struct", and then I remembered that
the body of the macro does this:

        pub(crate) struct $name(u32);

... so there goes my argument. :') Just one more thing below.

>
>> I agree the `: u32` can be introduced later, the original `register!`
>> macro did not specify any type information so there is indeed no reason
>> to add it in this patch.
>
> Yep.

When you introduce the types, can you change the syntax from `: u32` to
`(u32)`? That way the declaration becomes

    bitfield! {
        struct ControlReg(u32) {
            ...
        }
    }

... which at least looks like a valid declaration for a Rust struct
that wraps a primitive type. Same for registers, if possible.
