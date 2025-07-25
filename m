Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F50B11ACD
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 11:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9924810E15E;
	Fri, 25 Jul 2025 09:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="L28BA0w7";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="L28BA0w7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010020.outbound.protection.outlook.com [52.101.69.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB29810E15E
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 09:27:25 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GboB5T2K/1R2qJbp0CcLC6e/o0T0jExYbHerWGa8/fblPtQSRselSwI5Q26YUmSCQ3NI5NFiVCtEbpKyowbz3d6K3Si/Kyc9HdTiYhrSIi6fm5wnLS6ZcCj074YNGIzBdF6mtf/zuAswzlh3cQA8ER3SbOwetqpffWxJtNRAlzFXyFB80X+dz9qEs7o1eEYFPzmN3Ek3kawn6wvjXdIHizr73MvSXphNEb40hjorhOnwWg05uL3IwjP9aQr4nxdEviSaRZGNHmY83w78ugEcIRty6WiWXUaq/vjgeOszO8RJGr4B+E+Rc8tSxFF8tmRgpmqsgbq7jTsxH/mVLJgoTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OogyNLxgPnFbznhnQAefALFeKC/Nf3x2pbH4HZ6ZqOY=;
 b=L3fd3ZS6TxFuMaUi6ErnLZZTN8Dlmn/GJTf9cpZE9eJlFu37j9mF3kGbZFbkw+FCafvwmocSAT7WQpNBmxcxlgEyM+KxylCI6B5CHu9qtQKzwR3gNfQF8YKcWTWyPNRvhj3H1k9VeeAvFy3IoH5Gdf04CW1F5m112mEOvtpYOfjA6h9rgf2zlBKHQpKOEh09J8qyl8IocxJcp+uOXSGhNq3A4SrSjmIM6XWEowdyZwcLWCP2ZUyNPDn+vWKGSoseScL0WAGFKdBM5gVar1MFEz3ynNT0ZbPMYFsAq8OxHdb4rD7SiOaYvDMTfo7RTqVqkFu+5dgwznzBUeoEWxNbWg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OogyNLxgPnFbznhnQAefALFeKC/Nf3x2pbH4HZ6ZqOY=;
 b=L28BA0w704Dl/n7Dqn67cLsnkrXzKg/k8e6ydI678B9rdPtuK9bQltsn93b6Mm1puFuElnWDCY8eOKaWtQ6pJyWp+B5tQV2HylFJxEEBEUmiKAWoFYq8MPcP+pRu1p95FsUBH6tVc68sele3Ll1p9lc6mhAnoQGmAPJq3V6Ath8=
Received: from DU2PR04CA0281.eurprd04.prod.outlook.com (2603:10a6:10:28c::16)
 by DB9PR08MB6490.eurprd08.prod.outlook.com (2603:10a6:10:25a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 09:27:22 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::c8) by DU2PR04CA0281.outlook.office365.com
 (2603:10a6:10:28c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Fri,
 25 Jul 2025 09:27:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Fri, 25 Jul 2025 09:27:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cHHwtRXxoSmV1R5WT2H6JKp1pqPzAe5WhkOWpJRROj+3EIPAEZdEPsLiI+XqrvqDxGdXjhsiDiMy54OG8ObrrYp5ACfz52J75sKNZOCx46KMt9FUlHoIVAAGlc/iBW0U2pOqd1PHtRfxSmuA9R4gf1J4LkbcEX8A62QM/3pD/HVbpzLzJA4qtlEXiwLbIxZ7ZkAZtLlJJHKcWBHX57u9kJZs8fIgmf57tk2Q4jYmwpqHJ03iOKhjz3oBaE2VKAdEk9j/joOPjn0twzXDjokx/9lkoQmhKHvWrf2Y9VhwoqoI5C9qTFn+CbnCpZGQZmAJV4yRAOV4YYs9Vz0A3L5bUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OogyNLxgPnFbznhnQAefALFeKC/Nf3x2pbH4HZ6ZqOY=;
 b=HjfNDzL4fKDvEKieYemrGg/xD8r8gZG3hwfwArF3UN7fU0P3oViqq0xsZ42J9HkykAg4XgUZ8qdEvYvbEeEw5BRFBUg4nCK2v1eFvAszwKCnXw4diWHnJzuWgFHaUl3+DpRzdp7HJ0fZuw2cbWF2ibQSvptNYssGWBqfaFtIwi7GCZPg+kIRWhvQuIh3GrP1zaSlLSMMzYs51gU3QzYPyMBfwUSLE12613m9klh/LEFvkiepGcC5eIno+nAvIJxon067YDeE87gpMSJ/J+hrm+RQ1RCWcsD8B1P1Xm2isGhFH1FeUHg1OKcFz8V8Rl3sJtpuy9DrY5lXWFZq0v3/hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OogyNLxgPnFbznhnQAefALFeKC/Nf3x2pbH4HZ6ZqOY=;
 b=L28BA0w704Dl/n7Dqn67cLsnkrXzKg/k8e6ydI678B9rdPtuK9bQltsn93b6Mm1puFuElnWDCY8eOKaWtQ6pJyWp+B5tQV2HylFJxEEBEUmiKAWoFYq8MPcP+pRu1p95FsUBH6tVc68sele3Ll1p9lc6mhAnoQGmAPJq3V6Ath8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by AS8PR08MB8947.eurprd08.prod.outlook.com (2603:10a6:20b:5b3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Fri, 25 Jul
 2025 09:26:47 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0%4]) with mapi id 15.20.8943.024; Fri, 25 Jul 2025
 09:26:47 +0000
Message-ID: <8a65cc81-92cf-48e9-90b7-645a1fc94ef8@arm.com>
Date: Fri, 25 Jul 2025 10:26:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] drm/panthor: Add suspend, resume and reset handling
Content-Language: en-GB
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <cover.1747148172.git.lukas.zapolskas@arm.com>
 <ae6144b6f6ccbd2c035956ce5085ae7fbb5ec96e.1747148172.git.lukas.zapolskas@arm.com>
 <2vdubr5ieiuwmy7j6bogyzhpz27hsvaaeaktuqtuhm3nvgsnkv@jhy2f2pb3hyz>
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
In-Reply-To: <2vdubr5ieiuwmy7j6bogyzhpz27hsvaaeaktuqtuhm3nvgsnkv@jhy2f2pb3hyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0196.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::6) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|AS8PR08MB8947:EE_|DU2PEPF00028D0E:EE_|DB9PR08MB6490:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d86b7d-3157-49d9-94ec-08ddcb5d7587
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?dnhSZ3ZMOE1vV3QvUTdVcWJ1YTJIYUVqNkk3emtoeVB1SDFFQ1R3TjdvN1Yx?=
 =?utf-8?B?eEtDRThpQlpRWjJHWEdJTDA1U3pYc0hDRDJtOFBHSFJrYnZucHdkZDBWbVNZ?=
 =?utf-8?B?WEx6M3lZOGJXTFZHODVuUFlqbkN3Nk9zUGdYSjR5UzdNNEp4alk0RXQ5bTZl?=
 =?utf-8?B?NFY5aExEV004Q3A0aUJ0S2N3eklmVnRCbEUxT1g2YmR0aEFQNDlVeXZmdysr?=
 =?utf-8?B?cU16UUpGb1dHVmE0VmhyNElhM2VxajNXLzhkWlEyMVdkSkZDZUVwMjRwUUlI?=
 =?utf-8?B?eXBmMVpidzA1aGtUR2sxMEo4aWJ6V2pnUUpFbkE3N01kNUxkVjVDcHducktP?=
 =?utf-8?B?cWg3ejI0MU54UTJudm5TdXBzbzZpNmJkeDNoUWRGMHRJdCtCTkIvSkszQnRH?=
 =?utf-8?B?bUJzZVBFd1YyY1Fpc08rTUttbFlqaDZRN2JqQWhOM09IK0h2UUE0S2JzeThF?=
 =?utf-8?B?dmZyS052b1EzWENkSlk3K05vbm9samVNcVplQk1RK0VldXI4RWNRSFBubGZz?=
 =?utf-8?B?Tk12VHhqeDlnSnZvYnVnVkFBdHFRNndaUDF2ZkMxMTNZVHZNUll4SEdxd3NV?=
 =?utf-8?B?azR1Y3Btb2E5U2ZoR3hFa0l0TG4wcEZOeEJBVytPOXdDWE4zMXhKT0hxY1E2?=
 =?utf-8?B?Ly9WVVlveWRiNVZmU0VXLzhQSGczU2IwcHhuc2RCRy9oeitMMWQvYXR3Skly?=
 =?utf-8?B?TVNFNERWZFBCL2JVY1NvdWZSWHFPUktIYWxKWG10Qlo0aXdnTm5wbU5aWVJN?=
 =?utf-8?B?WU5BNG5oU0hZSVZOMnp3NkZXc1ZURHZsWWV6bHNWa1FZMGRNMllCZlV6RHU3?=
 =?utf-8?B?Z1E3N1pYMXlRQnZ1U2hCR21nQldVZmY0OWpOVU5RR0ozTWFLamJINUlUa2R1?=
 =?utf-8?B?c0dvNkQrQ0l2ZUhFT29KYXhrZ3h4d0J1TEkrcDBvL0FHNmtpMGxDZUxzWDJM?=
 =?utf-8?B?NVBLazVsNE90OVd2ejV2V2RnYU5IaFdENHhTd3AvSWM2NE03OXZ0THFGNCt6?=
 =?utf-8?B?b0hmWTV5aDdwSDIycnVvUUdZU2RsaFlvOER1SnNLcitvaUtGS29TcVRud1Fj?=
 =?utf-8?B?ckRtRUxxTENwOWFvT2ZibDVML1dBVUNNZk42R2xFS3VvL3M1RGNHR25JZzQy?=
 =?utf-8?B?ZVhhcWZtSTR2TnFaVnY2SGI4QnhZaU55OHRwbG1hL1RrSjZtc3JTV09jTnNl?=
 =?utf-8?B?bUEyTmY3VXRUZk9vVlFhcnVuYVdyT0hyYTMwK3VpMHMvR3hQZ2FMVXBMaXdL?=
 =?utf-8?B?QzZEREpGaEhaL2dIaEFvblU0dGNnenNQeVRyejhoMTlyMFEvcGtURDJjZ0Nq?=
 =?utf-8?B?TXNGMHc4Zk9hOVVad1RFMDRIVWJKNFBzRGEydE04YVRmVGZZZUlWdWl2bkRV?=
 =?utf-8?B?UklramtIVHY0UEZ1NDdpY3RBWWlCY1dHLzU4aFJxdTJuZ25RczRrbVdXbE4y?=
 =?utf-8?B?TUFoYUNZQXpjUmRGMjNQTVRicDJhTlI3bnZFWm9FREpwZ0pMMkxRc3pSUDdj?=
 =?utf-8?B?eXkwYi9Fa0JBQnpQcm9WMGtXT1NqTUxpUW9CZHE3b3VoQS9iK3dhRjhibWND?=
 =?utf-8?B?T3Rxa1o3THUyT0tJZ0p4YTkvdXh3NURQZWNiQjVCSjQxcXhQSHRGYTNQQkxl?=
 =?utf-8?B?NDNQSXQ5V0ZEekhCYVhpREUxK1EvSThyVDhYV1RBdHgrN0hFbjZNZy9iMWZY?=
 =?utf-8?B?Sml0aFJIVk1FNUZoMllMcjRGaGs2UC9IeU5rdkk0cy85dDc3OGJLNmkvTkRv?=
 =?utf-8?B?enBONEU3WUZsazl0NmR3MHdTSDNhWmJHRHE5T2FCQy9ENnZMbVdIaXp5VHlI?=
 =?utf-8?B?N3ErRitLVUplbXlOenp6aEhXN2ZlTVNlOWN3aGs0dENVdnlKZFUyMTFTanNN?=
 =?utf-8?B?emZZRk1RbTdueFQ0YjhaSU01cFZlNlRxRjRuN2hIcXRjakE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8947
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a4ce4912-1014-49e4-eb59-08ddcb5d60cf
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|35042699022|14060799003|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YU85bW5adnBRNTdUakdxeGFnQWZIakcvVkh1YjREUERqRWFxNnJRK0hsU0cr?=
 =?utf-8?B?aGJQQmpxNzhsSFVZZmQwM3JUNUU3VTlpbmZoZUVrcmg1WGZ0NTVxWkF4SVVE?=
 =?utf-8?B?RDhIQjlaL2luQmZCTWVMK0RsaThTL05CMWtnUFBBRGlnVXVOOTFvbHFHU0xk?=
 =?utf-8?B?STg4K3NpSklYaVNtVDJucDhRVDdtYTRnUGd1bUhzQ2hWMkFOaHpPZ2VnOXoy?=
 =?utf-8?B?b09ZTmlxMzlpVXM2YVBvZlp1SlR0SXdyS3lWSDZFaFNqaWo5S2UxTzJUY2lq?=
 =?utf-8?B?T0w1dEFXZy90Q3NrZjB5TW1zQ21QclJMS3ZqcTdESUZmbUY4SndSSHoxdHBk?=
 =?utf-8?B?bmNXV2NLY0poWHQ1anBHUW1HMGhiN3JVTFFabUpCZGMrVmhKVmRvcjdyeHBN?=
 =?utf-8?B?UWJqR0ZaK0FSS3JxLzU5a0J3WG1adGZaZUg4ajJ1djYzT0diTjJLaXpld2hG?=
 =?utf-8?B?N1FqWGx0VGtiVWpTWElmbnRXY2NibDdhSGlkS0tJTWsyS2dXYW5wcmtLdUZ4?=
 =?utf-8?B?MXZtTWVTSGVEQm9teDl5TVNTOU1QV0Fjcyt6dWx2SXF4Q0RLR2k2UkNVZENJ?=
 =?utf-8?B?QmtVY05nVlVPSFBkbGxEcStseWpRZmROdEEwU3ExZWQwcGZyR1ZldW5ieDA1?=
 =?utf-8?B?S1RLWXc2K0tjWXdOb2pqMUZQS0JvTXVkNFBXUUpicG1EeHNBOU96VHl3cHRu?=
 =?utf-8?B?YWRaZ2xzakFQbXJLbTJQNldiZXdHWVYvdDZEb2t2Z1Q1K1Njcm9uUVRBNm1P?=
 =?utf-8?B?WngwVjdJQlYwMFh5U2M2bXRUWU9tUG5tcmZYY09YUVVVUitubEszY21iQndG?=
 =?utf-8?B?cEl0V1R4U09ka203WnVxNnZwMHBRWkxoWjFYNDdndUY0RVQrbkdaZDZpSmV4?=
 =?utf-8?B?UlVHeUhBNmdRd09vblZLSWg3UEQ1VmpSUUlrckMrS1NVcDRFS2xObENjYVY3?=
 =?utf-8?B?NEZTckdOS0V5Z0U5Y0FRMC81d3dOWTdrYmljeFkxaE1VS05jMFQ1Sk93T3BR?=
 =?utf-8?B?MW9HQXVKQ0NDakFQQ0k0c3VCQ1Z5UGZnUFBGQkdGQjhYUDN3Ri9uRGtrWnY4?=
 =?utf-8?B?a3kxOTlVOXBEekZ6d3FJaVdSTnJ1dmZyWjkrSm1WSlJpbTd6UmswOGU0MW5F?=
 =?utf-8?B?c0IrMmJndXphOUI5Yk5IbVZHNlpVMU1UVEQvYng4bWtOR0dpaFJ1K1I0WUFh?=
 =?utf-8?B?cWRzbDF4Zk1JUjlLWmVIRytNeGVKRGpKMWc4UmRLYmQ1ZlFxS0t6ZTRwMldy?=
 =?utf-8?B?Ui9UU0NPNGxScHd6SjFTcjVMc1F1bm1yaDF6N0oyMkZiaTFKMVZMOUtDa1U1?=
 =?utf-8?B?VzF3ZmVXOWFTVy9YWGx0YXBOelo4WGhXeVNkQVdNaE9BdzJ3eE9qVjQ5enEr?=
 =?utf-8?B?NVdZa3FSeWJUc2ZjaFRMVlZ6MXRYZzVOT1ptckVrUmd2SzVjS0J5SXorNzN1?=
 =?utf-8?B?UjlNdm5yTi9uT3hKbHlNNW1MTnhYS0thNW9qaUlqNjZCTXkwdElyOUVnYjJh?=
 =?utf-8?B?VXMrYStzQktMVHU0WFYwcXFDZS9zaEh4L0JtUUI4YVQ3SksyUThMRnc1KzFG?=
 =?utf-8?B?blN6SUlXajFVM2JDcUE4OVM1Nk5xS1lQdHQ0ZHdvTzVVand3MkcrZTF3MWdw?=
 =?utf-8?B?OXRTWGZVNlRYc2xEZjVmOEhLckpDbVErV1d4aHpqbW1ZT2U0R2RYRjBodnpL?=
 =?utf-8?B?WW5mdEhxVmNwQ216TjVXWVQwUWFhRVl4d2tuTmo1WTF4MXZDaUg4bUZLY2lF?=
 =?utf-8?B?dlVUOFRoa0NHSloyL1R1M2lvVG4yN0NQR1R4ckwzZWRYSytGbmQzbG1lVEh4?=
 =?utf-8?B?cERicVJUbkNLQW5JNzhqZW5BTWdGSVk0ZHdSbCtJelFZcmoxWEVtT1F1QVdE?=
 =?utf-8?B?eWRXWHdYYXBKSGt0Um52eWdYY2lkdUdxNmNnSDdldnR6c214RGNPNmpqUGRx?=
 =?utf-8?B?bUt6L2FMYWZyOWMyYXd4R2dSUHUwYy96b05WSnFwcVpEWlJTUnVEa3lraE03?=
 =?utf-8?B?TkpucHFlVC9qazhIUlkySHZ4b1Y1QkhpTy9IVG41VVZkSmtHSDR1aXJFK2Mv?=
 =?utf-8?Q?Ogq05h?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(35042699022)(14060799003)(82310400026)(36860700013)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 09:27:21.9593 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d86b7d-3157-49d9-94ec-08ddcb5d7587
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6490
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



On 18/07/2025 16:01, Adrián Larumbe wrote:
> On 16.05.2025 16:49, Lukas Zapolskas wrote:
>> The sampler must disable and re-enable counter sampling around suspends,
>> and must re-program the FW interface after a reset to avoid losing
>> data.
>>
>> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
>> ---
>>  drivers/gpu/drm/panthor/panthor_device.c |   7 +-
>>  drivers/gpu/drm/panthor/panthor_perf.c   | 102 +++++++++++++++++++++++
>>  drivers/gpu/drm/panthor/panthor_perf.h   |   6 ++
>>  3 files changed, 114 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
>> index 7ac985d44655..92624a8717c5 100644
>> --- a/drivers/gpu/drm/panthor/panthor_device.c
>> +++ b/drivers/gpu/drm/panthor/panthor_device.c
>> @@ -139,6 +139,7 @@ static void panthor_device_reset_work(struct work_struct *work)
>>  	if (!drm_dev_enter(&ptdev->base, &cookie))
>>  		return;
>>
>> +	panthor_perf_pre_reset(ptdev);
>>  	panthor_sched_pre_reset(ptdev);
>>  	panthor_fw_pre_reset(ptdev, true);
>>  	panthor_mmu_pre_reset(ptdev);
>> @@ -148,6 +149,7 @@ static void panthor_device_reset_work(struct work_struct *work)
>>  	ret = panthor_fw_post_reset(ptdev);
>>  	atomic_set(&ptdev->reset.pending, 0);
>>  	panthor_sched_post_reset(ptdev, ret != 0);
>> +	panthor_perf_post_reset(ptdev);
>>  	drm_dev_exit(cookie);
>>
>>  	if (ret) {
>> @@ -496,8 +498,10 @@ int panthor_device_resume(struct device *dev)
>>  			ret = panthor_device_resume_hw_components(ptdev);
>>  		}
>>
>> -		if (!ret)
>> +		if (!ret) {
>>  			panthor_sched_resume(ptdev);
>> +			panthor_perf_resume(ptdev);
>> +		}
>>
>>  		drm_dev_exit(cookie);
>>
>> @@ -561,6 +565,7 @@ int panthor_device_suspend(struct device *dev)
>>  		/* We prepare everything as if we were resetting the GPU.
>>  		 * The end of the reset will happen in the resume path though.
>>  		 */
>> +		panthor_perf_suspend(ptdev);
>>  		panthor_sched_suspend(ptdev);
>>  		panthor_fw_suspend(ptdev);
>>  		panthor_mmu_suspend(ptdev);
>> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
>> index 97603b168d2d..438319cf71ab 100644
>> --- a/drivers/gpu/drm/panthor/panthor_perf.c
>> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
>> @@ -1845,6 +1845,76 @@ void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_per
>>  	}
>>  }
>>
>> +static int panthor_perf_sampler_resume(struct panthor_perf_sampler *sampler)
>> +{
>> +	int ret;
>> +
>> +	if (!atomic_read(&sampler->enabled_clients))
>> +		return 0;
>> +
>> +	ret = panthor_perf_fw_start_sampling(sampler->ptdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int panthor_perf_sampler_suspend(struct panthor_perf_sampler *sampler)
>> +{
>> +	int ret;
>> +
>> +	if (!atomic_read(&sampler->enabled_clients))
>> +		return 0;
>> +
>> +	ret = panthor_perf_fw_stop_sampling(sampler->ptdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * panthor_perf_suspend - Prepare the performance counter subsystem for system suspend.
>> + * @ptdev: Panthor device.
>> + *
>> + * Indicate to the performance counters that the system is suspending.
>> + *
>> + * This function must not be used to handle MCU power state transitions: just before MCU goes
>> + * from on to any inactive state, an automatic sample will be performed by the firmware, and
>> + * the performance counter firmware state will be restored on warm boot.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int panthor_perf_suspend(struct panthor_device *ptdev)
>> +{
>> +	struct panthor_perf *perf = ptdev->perf;
>> +
>> +	if (!perf)
>> +		return 0;
>> +
>> +	return panthor_perf_sampler_suspend(&perf->sampler);
>> +}
>> +
>> +/**
>> + * panthor_perf_resume - Resume the performance counter subsystem after system resumption.
>> + * @ptdev: Panthor device.
>> + *
>> + * Indicate to the performance counters that the system has resumed. This must not be used
>> + * to handle MCU state transitions, for the same reasons as detailed in the kerneldoc for
>> + * @panthor_perf_suspend.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int panthor_perf_resume(struct panthor_device *ptdev)
>> +{
>> +	struct panthor_perf *perf = ptdev->perf;
>> +
>> +	if (!perf)
>> +		return 0;
>> +
>> +	return panthor_perf_sampler_resume(&perf->sampler);
>> +}
> 
> In the two previous functions, you return an int, but you never used it
> from where they're called. 

Thanks, will drop the return values from the perf_{suspend,resume} functions.

> Also, in both of them, for the sake of
> coherence, I'd get rid of the *sampler* subcalls because later in
> 'panthor_perf_pre_reset' and 'panthor_perf_post_reset' you manipulate the
> sampler directly without referring it to another function. The functions
> are short enough for us to be able to inline the content of
> 'panthor_perf_sampler_resume' into 'panthor_perf_resume'.
> 

Will do.

>> +
>>  /**
>>   * panthor_perf_unplug - Terminate the performance counter subsystem.
>>   * @ptdev: Panthor device.
>> @@ -1878,3 +1948,35 @@ void panthor_perf_unplug(struct panthor_device *ptdev)
>>
>>  	ptdev->perf = NULL;
>>  }
>> +
>> +void panthor_perf_pre_reset(struct panthor_device *ptdev)
>> +{
>> +	struct panthor_perf_sampler *sampler;
>> +
>> +	if (!ptdev || !ptdev->perf)
>> +		return;
>> +
>> +	sampler = &ptdev->perf->sampler;
>> +
>> +	if (!atomic_read(&sampler->enabled_clients))
>> +		return;
>> +
>> +	panthor_perf_fw_stop_sampling(sampler->ptdev);
>> +}
>> +
>> +void panthor_perf_post_reset(struct panthor_device *ptdev)
>> +{
>> +	struct panthor_perf_sampler *sampler;
>> +
>> +	if (!ptdev || !ptdev->perf)
>> +		return;
> 
> In both this function and the preceding one, ptdev is meant to be
> available by the time they're called, so I'd turn the check of ptdev not
> being null into a drm_WARN().
>

I'll drop the check for the ptdev entirely, since it looks like there will 
be other issues before these functions are even called if it's null, and 
add the drm_WARN_ON_ONCE for the perf pointer, since that should also be 
initialized by this point. 

>> +
>> +	sampler = &ptdev->perf->sampler;
>> +
>> +	if (!atomic_read(&sampler->enabled_clients))
>> +		return;
>> +
>> +	panthor_perf_fw_write_sampler_config(sampler);
>> +
>> +	panthor_perf_fw_start_sampling(sampler->ptdev);
>> +}
>> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
>> index c482198b6fbd..fc08a5440a35 100644
>> --- a/drivers/gpu/drm/panthor/panthor_perf.h
>> +++ b/drivers/gpu/drm/panthor/panthor_perf.h
>> @@ -13,6 +13,8 @@ struct panthor_file;
>>  struct panthor_perf;
>>
>>  int panthor_perf_init(struct panthor_device *ptdev);
>> +int panthor_perf_suspend(struct panthor_device *ptdev);
>> +int panthor_perf_resume(struct panthor_device *ptdev);
>>  void panthor_perf_unplug(struct panthor_device *ptdev);
>>
>>  int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
>> @@ -30,5 +32,9 @@ void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_per
>>
>>  void panthor_perf_report_irq(struct panthor_device *ptdev, u32 status);
>>
>> +void panthor_perf_pre_reset(struct panthor_device *ptdev);
>> +
>> +void panthor_perf_post_reset(struct panthor_device *ptdev);
>> +
>>  #endif /* __PANTHOR_PERF_H__ */
>>
>> --
>> 2.33.0.dirty
> 
> 
> Adrian Larumbe

