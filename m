Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFBFACD2DF
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 03:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EA410E7AC;
	Wed,  4 Jun 2025 01:11:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AYDlJAm9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D4C10E75C;
 Wed,  4 Jun 2025 01:11:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BY+f5tuQH+inPrekJqwm1wFZca9zDNhKhE42mW011OASh5cYXVTDFpKmVni/0KIe9BLWYACyJI2G6Vyypvh+KD9ptidfSMe1KdYdnH2CfQhjmUYh9XQQBMq6rH2dfc9TYcty53PGn2cBdyEBi0+w7ENy1ID3IfJseM0qzJp8YjJR8XdKazEdoh3NA65Ay0P6Jzxaate3ORqFZw0yIPQ4basrw9j2hTQvBLPlN0E5+ZziePAYaWMsB9DJ/l1egi4PqQi6loKVdjIKVc4LQpfdNBRoXjpUIVuAu0CG0jp2Pc7UUBTHuaC68dUq1rzwCijg3Agk4dBfA0D4+2g71zGXnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ldsb0dBo7IAixmaQyzmNw+kRYkzqIqYe1rATMtmF0oc=;
 b=oJeaXDJmS92ymEldq47K7eQtT0wcKrGU7n5EI4b6mZLk/SsF8ZAO2JftBzzVyV+Go4LwihEHn+y416nnEtxNg6fH0fRfs2nl9fpMjH69TCTC7SbvNVXbn7S44DN3i3MvUNHXMK6CrFigj9ZcTAwE/CTX/wGCr6UUjBz70NiKVzMHTcBwxcC2LAbDrrP+ACTGt/B/RKHciqIP6oHS8LmCnAl9zp+gpI43F0F82QYMY6Fx45kE+nZtdEq6t/hLfNZ8BVo8kDu7Sv70lQJGev0fzPHctMNzJageluTJzIgXsF5S/kiPwSk8Jr/rHwBnTAz5FLGHhdMqMlGWyJOZo/iBTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ldsb0dBo7IAixmaQyzmNw+kRYkzqIqYe1rATMtmF0oc=;
 b=AYDlJAm9Ej19/LrtmHpxd+BHzUjKH5lGupdylnbDJLWZcQqxGo6zu1WPkxNXeqK5n7Md3whTCP4pET2ylAdNEsyBraFrNgqn8oaKZ+fMT4sv5LUal3kz0J4Ow3sxKJLlAiR4TO0SuNL5zCjaIWJgqb/ntFmGdf5Hq9DoRbRGtVYC3RbRVvozQh/duZJQOh4qzg2l+XfeOhYFCNReSRrAHapZpOxaO3rft/eD8oZ15ws8vczD2JbpMun6TwrXKZZt5tGlu3cyl/XsNvTD9cwQLrj6ny08zIENruQClPmqmd4O8yXLhJ7HepHfLQJbWyt1bPBt5ib5ovhrYtJE4kP2rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9028.namprd12.prod.outlook.com (2603:10b6:610:123::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Wed, 4 Jun
 2025 01:11:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 01:11:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Jun 2025 10:11:41 +0900
Message-Id: <DADCKUVFXPLH.2DWHTBQ76T3PD@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 19/20] gpu: nova-core: extract FWSEC from BIOS and
 patch it to run FWSEC-FRTS
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
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-19-05dfd4f39479@nvidia.com>
 <3212029a1f4d671aaa2b48e2e917d5c810f5c769.camel@redhat.com>
In-Reply-To: <3212029a1f4d671aaa2b48e2e917d5c810f5c769.camel@redhat.com>
X-ClientProxiedBy: TYCP286CA0254.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9028:EE_
X-MS-Office365-Filtering-Correlation-Id: 18979ed9-7a67-42bf-a29e-08dda304c644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWY5czV5dmZLbmZ4UTYwM1FHMlExNXUwY0taREJON09LWDRUVlpLeTBmNUpv?=
 =?utf-8?B?OTFxUHVpT0t6dCtJZE9OcTJZSXZvSStrd0Z6YmZTV3ZFK0l2eThoKy92Wmpq?=
 =?utf-8?B?T1hGUXN3N0VRbjFreVAydUhzd0xxb3dLdFVsczU0M0dhdmd6a0l2UWRYN3pk?=
 =?utf-8?B?TmJoZVYrZzFJN0VYdVd6MHlLM2RDSjg4S0FOby9xYlVGNTNzNkgxYTQwcmkw?=
 =?utf-8?B?NERTZGJKQ3krUWt0RTdzQkNpMStmTzFRVmh6SU8vSmh5YkJCQmJNMzlTalNq?=
 =?utf-8?B?ODA3TEtrdC9NQUZHUnhPRTRXVWN1b3NrazZ4Q2ZjeFFBOGZ0R3NtR2NKdU1O?=
 =?utf-8?B?Z01WWFR5eVdFaTBjQ0xrZDNqUVdiZlFIb05aZk5obitheGlLQ25kMXpCUUJO?=
 =?utf-8?B?RkRSZXJuWHR6NEQrRTI2N3hBVjVpVGdwUGYyUmVWaUZGTXdVZ0FlZGhhb2x3?=
 =?utf-8?B?U05KS3RSYXRFVFFhMGJ4MTJnL2UveklhODc1elhZU1ZSZitsdVdBaDhxSzg1?=
 =?utf-8?B?OXNNVmdkMm5zdEFBNElwMFRteXVrQmNGRlpkZXFUWjZLV0ozMTViVm8zRDFK?=
 =?utf-8?B?Q3Y2anZoRmRROE5TeGt3SFRnTjZYNlZHZWdwY3dvL0s3VHBoWEFHekk0TS96?=
 =?utf-8?B?Z1pRZzFsNzlESFFocklzVmQ5RmtrRnFZYzMrcGtqTnNEL2FIMGV1eG4xTUdp?=
 =?utf-8?B?THliTVRqWnJmM0w5OC81TnR4NzlEVEhZL3F3Rll2UmVrM0htbU8vTXl5eWw4?=
 =?utf-8?B?SU1OVzB0SmNlNTdsczBZaFhESWRBZ3VPUy9TcXNPeVFkdnhwMUVZemRQU1Fq?=
 =?utf-8?B?R3ZZenFXci9oSVpBUjdSSEJtZldJeWxEaVJBcC9nV25jMnVmQ0xYaG5BYit0?=
 =?utf-8?B?eVVqWm1jTHBRNFViaXYwQjVjckQxVm5ydDk1OGdPM3RNZzZabHpuV2JzTjZw?=
 =?utf-8?B?OEVud1RtQXBrWkNsblB2M21QODlFU1pEOXhnWEJrYlgzdDUvZCtXYWxSUFdz?=
 =?utf-8?B?c0hhS1Rya2djaW52citIVzVoQmdQTFc0djU1amhWT011VEpMNWxVZHBiQVZE?=
 =?utf-8?B?OFhkVWxMekd5V0FyRUxwMVJrSElScEtRUGtRM0xjQVIveFA0Z3czUnoyOG42?=
 =?utf-8?B?WmdxYVROdjQvN0NGSXNqVjJwUFJzVkhHdkMrWlNZVkVPbnVtaVpwYnhnYzcx?=
 =?utf-8?B?YXVkOVg2MlIvcUpyZllqcjdpYU1PdW1FM1Nwd3h6dm82YmZFSWtiQVlmREpK?=
 =?utf-8?B?Tlc3cGpJRW5lSWtYbUdJanRiSWF1bHppWWVjeTllcGZ1WG9CZFFGSloxelUx?=
 =?utf-8?B?VVR0dEZMbEk3MlpCZG5BZ21jQlBRaWo4bUNIaEZBU3pCN3lzVldaZFJHTGpN?=
 =?utf-8?B?ekFacUFGaDJwU0lmTUgvZEkvK0pQUjhOVG9EQTFaNjNBMmFYL1ZaSGJwMEZv?=
 =?utf-8?B?U2haVHhTWDB0U09haXB6S01rR0M1VUpBUHlWTFpFT0hlY3pub2oxcElQNE9C?=
 =?utf-8?B?VkYyR2Zuc3N5eWFyRHExKzA5UllnbGV4Y3U2cWhjVHhVcEJ4REZWSjl3RG95?=
 =?utf-8?B?YnMraVNDZ01mcTEyb2tEcmJpVVozSTRhZGw2SnhrcXcwck5SeHlTNTdyNEMz?=
 =?utf-8?B?K3ZXQmJQSXBHOGQ4QlJtNXNBOHF6eVlxekltMTlNQnJ3S09yRmwrV3ZOR1h6?=
 =?utf-8?B?STFZTm1UaWRJM21pVDBReHFURVM1NXhKUWluVHAwdjhaWGN6a01QU3RDaEVV?=
 =?utf-8?B?MnFUalRLTzZhQjFJSjQ1aTRpbXA1bVp2T05aN1M5aVFvWk9XOTZOYnQ3SFhW?=
 =?utf-8?B?ZGZaaXd5aG9td0FQUXdHV2M3VnZiQjA5SGV2dWFMS0tpSGpsa1NvdDVzS2VT?=
 =?utf-8?B?QTVoeFJjZ2ZkU3J4NGxFTS9VNHBVM3VSYzZKS0ZWbE9SS3FUQjlMK3gxcWl1?=
 =?utf-8?B?clp3UDhWdnZWaEF1WDRCSnE0c1l5T3crR1RzM1VHelg1b01TaWZHQUJVaWhR?=
 =?utf-8?B?dlBXV2ppbC9nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Kzl5NlVzT2syV2ppS2ZDM0g3eEZ0cmpwYWtNU3hJUzh3UFFxL25hRzl5L3Zh?=
 =?utf-8?B?b0I5ejdSRmVmZG9EbzZiUU5RdjhvbjZqdzU2c2ttSlVkc2UrRlBXNmZRdXVG?=
 =?utf-8?B?N0c1QVU5Tmg4WjNiSzRCSVZBWWZVU1lCMzdXQUo2QmIwYTNnakR3RUNrcVJk?=
 =?utf-8?B?YzN3dkh6ZER1eEVEQ1hHUTB0c0lLZjdjMFFnL3NSYzVMREdUWXdqQjdvZTZ1?=
 =?utf-8?B?eXlHRE9jbUg4VnE1NktxU1htOUtHZW9FRmEwTHZlZE1Kb1lxRzgxa1VwSkRp?=
 =?utf-8?B?dTJCWXcwVTZMYXU3dlVhdXY0YkdRUkNmeHNtblNrTFE4UXpjbTIwcExEUGF1?=
 =?utf-8?B?UEtWRkVCV3FDdGFGWkpvSkdINjhUb1RkeDRXNnF3VUJvbzFkeW9FNlFkeGVU?=
 =?utf-8?B?akQzbDgrTGdMVi9JTVpTbmtHVzZuL2tsOUd3ZGExeUgwZm1HeHJQdjF2bVFS?=
 =?utf-8?B?TnpHVFJCelc2UE9VNDRUOGJCOUZGRnB5QWxYNjMxeDF2OWVHNWhIcFVaL3JO?=
 =?utf-8?B?cktNYzQ5dFZRejBFTGNtTkxURUhjWWZFemxPTWJDZXUya0JJaUFsekovSkdH?=
 =?utf-8?B?b3ZweWZ4MlFkT0lGdlRaV0pmdGJOOEEwRml0MEx5VzdINGRCdVlkZmgxSTN0?=
 =?utf-8?B?Si9jY3JvK0JvbFVRdnhsUDJxTDRUS2RaREo3Rk9mY2NOZnp5L3hiQXBtV2x2?=
 =?utf-8?B?TzA3NVRjd0NyZ2dKQXprZFpaN093Yk9DU09kZjlCMFNTS1Z0VndFNklKRGdi?=
 =?utf-8?B?NEJSeFNiYndxUk1RWk5WQWc4MHdIU0wvY2R2bHNXTlFRbldRWEszQkNCVnZv?=
 =?utf-8?B?YnoxSjhJTHo2OTJYbHA0WWpOLzNtQzV2QWJXZXNTd3U1MTI2bTEyT1dieFlT?=
 =?utf-8?B?M1VzRHJhRkRTWmFuNG1uQ0lEckxpeXo2OWN2b2VvSGZXT1VrbCtESHc1bjBk?=
 =?utf-8?B?N2dGYlBaSVRoS1JTaEFWYXRNalh5M25GVDlVTC9xVVhtVmpXNURQeFBtaGhQ?=
 =?utf-8?B?RXFwOWZoeit0YVdSbi90eHNKcWxwTStIRG1naHducGNPbkdUMzVMdWRhZHpq?=
 =?utf-8?B?UFY3Q3lRVHFnMGdRQ01vZ2p1ckdFaUJtQWQ2d1RCanRSZm1qY2s2TkFOREoz?=
 =?utf-8?B?ZSs0TTcxVGVNZEFqTEJRV2prM2NyTDBDaDFoYVNaRWxFOTFoQ0JUaFduWWdI?=
 =?utf-8?B?R1h4Wmxzb29TTE5acnFpU29YK2xiK1pNZ0NXZ2V3anRqZFNOQndZZDQ1Um9G?=
 =?utf-8?B?YUdPVnFCcW9wTWk4dktHL1hUdUFpWEw4dkZqZzkxRWFLeVpqQXZxbmdUSGZ0?=
 =?utf-8?B?ek1xUzFBNFpyZnlTK2U2Yi92V29YSEdPclQzZ0x1QTNyWklKT2V3VzUwcC9O?=
 =?utf-8?B?R2hMTkRWSVZsL2lWaEtScmtSS21XTE5wajJka0MzenFnVHMxRC9zSFZycUNk?=
 =?utf-8?B?eVZaa1E0dzBWbTEvV28rQ0craEpZRVpRa3JLTUZCemZiemc2ekI0MWpqeW1s?=
 =?utf-8?B?TXMvKzArSXJCM2FqUnZibDFZVkcyYVhKdFZBUG4yMWtDZjdlbGZWenMrL0JI?=
 =?utf-8?B?Tnd5NmpKc1kyTWJEVTZwdk4xQkROQUZORlc0MVI3dXhxQ1Y0NjBUalNXd2lv?=
 =?utf-8?B?N0svYVlqSUZVT01mbURXNCsrL0ZzWUFZMUVYbFlpUHZMM0ZwRXYvbmY1THVG?=
 =?utf-8?B?ZFFTNDkxR3MraEhMZ2ZFWVc0V2haQWV1d25wRyt0OVR0STk5Mmhzbng5UnVX?=
 =?utf-8?B?OG9WeW5kQUxpL0Y2RUFVNC8rek9rK1FDckZoMEswZG0zdDRPSHZKT3Q2SW80?=
 =?utf-8?B?elJkSVlKQ2NsdmlacUQ3YUd3T2Znb01FVWVsZ2tvbXIzRm1iL2RoTmFQWDcv?=
 =?utf-8?B?cS9BeC9rRm5vcThYMVN3WE5ORk5CZHBhVm0zdjRwTXJpK092clZXWnZkWjhJ?=
 =?utf-8?B?b1E2VndQV1JKbmhDVUNXQk0rYzkrT0xGM1h6REVqVFVZY3JHd1pXKysvKzRm?=
 =?utf-8?B?MVdVWkFGY3I0T0tqem1idUM4ZlZOWlBoVCszTExCUk1wbjVCMVJHb3czNDB4?=
 =?utf-8?B?YnpKdFJ3M0VMd3F4cXlka05sRkpWdkRBbHY1R293c3lnYm1BSEloUitDTzFw?=
 =?utf-8?B?cjlKcStmZXE1RURKdzhJZTdPR1lSQ1dqODFPcEpkM3MyZzFMOEpqVmJHUzZ2?=
 =?utf-8?Q?w8khq9T2iJ1JUlflonQCIj1Jr50Kb668916fyP408Tj5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18979ed9-7a67-42bf-a29e-08dda304c644
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 01:11:46.2750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sTXf3PcmYLN+Me0GzF1Ghj7UGedHGs5Xtdx0iCYyT9DtuJ6VHbePl8+hrfAVq/v2zUw3PcmLxyPoQVgkuU0nQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9028
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

On Wed Jun 4, 2025 at 6:32 AM JST, Lyude Paul wrote:
<snip>
>> +unsafe fn transmute<'a, 'b, T: Sized + FromBytes>(
>> +    fw: &'a DmaObject,
>> +    offset: usize,
>> +) -> Result<&'b T> {
>> +    if offset + core::mem::size_of::<T>() > fw.size() {
>> +        return Err(EINVAL);
>> +    }
>> +    if (fw.start_ptr() as usize + offset) % core::mem::align_of::<T>() =
!=3D 0 {
>> +        return Err(EINVAL);
>> +    }
>> +
>> +    // SAFETY: we have checked that the pointer is properly aligned tha=
t its pointed memory is
>> +    // large enough the contains an instance of `T`, which implements `=
FromBytes`.
>> +    Ok(unsafe { &*(fw.start_ptr().add(offset) as *const T) })
>
> Why not .cast()?

No reason - fixed, thanks!

>
>> +}
>> +
>> +/// Reinterpret the area starting from `offset` in `fw` as a mutable in=
stance of `T` (which must
>> +/// implement [`FromBytes`]) and return a reference to it.
>> +///
>> +/// # Safety
>> +///
>> +/// Callers must ensure that the region of memory returned is not read =
or written for as long as
>> +/// the returned reference is alive.
>> +unsafe fn transmute_mut<'a, 'b, T: Sized + FromBytes>(
>> +    fw: &'a mut DmaObject,
>> +    offset: usize,
>> +) -> Result<&'b mut T> {
>> +    if offset + core::mem::size_of::<T>() > fw.size() {
>> +        return Err(EINVAL);
>> +    }
>> +    if (fw.start_ptr_mut() as usize + offset) % core::mem::align_of::<T=
>() !=3D 0 {
>> +        return Err(EINVAL);
>> +    }
>> +
>> +    // SAFETY: we have checked that the pointer is properly aligned tha=
t its pointed memory is
>> +    // large enough the contains an instance of `T`, which implements `=
FromBytes`.
>> +    Ok(unsafe { &mut *(fw.start_ptr_mut().add(offset) as *mut T) })
>> +}
>> +
>> +impl FirmwareDmaObject<FwsecFirmware> {
>> +    /// Patch the Fwsec firmware image in `fw` to run the command `cmd`=
.
>> +    fn patch_command(&mut self, v3_desc: &FalconUCodeDescV3, cmd: Fwsec=
Command) -> Result<()> {
>> +        let hdr_offset =3D (v3_desc.imem_load_size + v3_desc.interface_=
offset) as usize;
>> +        // SAFETY: we have an exclusive reference to `self`, and no cal=
ler should have shared
>> +        // `self` with the hardware yet.
>> +        let hdr: &FalconAppifHdrV1 =3D unsafe { transmute(&self.0, hdr_=
offset) }?;
>> +
>> +        if hdr.version !=3D 1 {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        // Find the DMEM mapper section in the firmware.
>> +        for i in 0..hdr.entry_count as usize {
>> +            let app: &FalconAppifV1 =3D
>> +            // SAFETY: we have an exclusive reference to `self`, and no=
 caller should have shared
>> +            // `self` with the hardware yet.
>> +            unsafe {
>> +                transmute(
>> +                    &self.0,
>> +                    hdr_offset + hdr.header_size as usize + i * hdr.ent=
ry_size as usize
>> +                )
>> +            }?;
>> +
>> +            if app.id !=3D NVFW_FALCON_APPIF_ID_DMEMMAPPER {
>> +                continue;
>> +            }
>> +
>> +            // SAFETY: we have an exclusive reference to `self`, and no=
 caller should have shared
>> +            // `self` with the hardware yet.
>> +            let dmem_mapper: &mut FalconAppifDmemmapperV3 =3D unsafe {
>> +                transmute_mut(
>> +                    &mut self.0,
>> +                    (v3_desc.imem_load_size + app.dmem_base) as usize,
>> +                )
>> +            }?;
>> +
>> +            // SAFETY: we have an exclusive reference to `self`, and no=
 caller should have shared
>> +            // `self` with the hardware yet.
>> +            let frts_cmd: &mut FrtsCmd =3D unsafe {
>> +                transmute_mut(
>> +                    &mut self.0,
>> +                    (v3_desc.imem_load_size + dmem_mapper.cmd_in_buffer=
_offset) as usize,
>> +                )
>> +            }?;
>> +
>> +            frts_cmd.read_vbios =3D ReadVbios {
>> +                ver: 1,
>> +                hdr: core::mem::size_of::<ReadVbios>() as u32,
>
> I think if we're using size_of and align_of this many times it would be w=
orth
> just importing it

Indeed, especially since they seem to already be imported by the kernel
prelude.

>
>> +                addr: 0,
>> +                size: 0,
>> +                flags: 2,
>> +            };
>> +
>> +            dmem_mapper.init_cmd =3D match cmd {
>> +                FwsecCommand::Frts {
>> +                    frts_addr,
>> +                    frts_size,
>> +                } =3D> {
>> +                    frts_cmd.frts_region =3D FrtsRegion {
>> +                        ver: 1,
>> +                        hdr: core::mem::size_of::<FrtsRegion>() as u32,
>> +                        addr: (frts_addr >> 12) as u32,
>> +                        size: (frts_size >> 12) as u32,
>> +                        ftype: NVFW_FRTS_CMD_REGION_TYPE_FB,
>> +                    };
>> +
>> +                    NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS
>> +                }
>> +                FwsecCommand::Sb =3D> NVFW_FALCON_APPIF_DMEMMAPPER_CMD_=
SB,
>> +            };
>> +
>> +            // Return early as we found and patched the DMEMMAPPER regi=
on.
>> +            return Ok(());
>> +        }
>> +
>> +        Err(ENOTSUPP)
>> +    }
>> +}
>> +
>> +/// The FWSEC microcode, extracted from the BIOS and to be run on the G=
SP falcon.
>> +///
>> +/// It is responsible for e.g. carving out the WPR2 region as the first=
 step of the GSP bootflow.
>> +pub(crate) struct FwsecFirmware {
>> +    desc: FalconUCodeDescV3,
>> +    ucode: FirmwareDmaObject<Self>,
>> +}
>> +
>> +impl FalconLoadParams for FwsecFirmware {
>> +    fn imem_load_params(&self) -> FalconLoadTarget {
>> +        FalconLoadTarget {
>> +            src_start: 0,
>> +            dst_start: self.desc.imem_phys_base,
>> +            len: self.desc.imem_load_size,
>> +        }
>> +    }
>> +
>> +    fn dmem_load_params(&self) -> FalconLoadTarget {
>> +        FalconLoadTarget {
>> +            src_start: self.desc.imem_load_size,
>> +            dst_start: self.desc.dmem_phys_base,
>> +            len: Layout::from_size_align(self.desc.dmem_load_size as us=
ize, 256)
>> +                // Cannot panic, as 256 is non-zero and a power of 2.
>> +                .unwrap()
>
> Why not just unwrap_unchecked() then? Or do we still want a possible pani=
c
> here just to make sure we didn't make a mistake?

`unwrap_unchecked` requires an `unsafe` block, which I think it not
really worth here. I'd expect the compiler to optimize the `unwrap` out
anyway.

