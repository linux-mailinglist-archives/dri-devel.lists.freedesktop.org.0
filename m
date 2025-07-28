Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FEDB133E3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 07:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9B010E033;
	Mon, 28 Jul 2025 05:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="liPb8bYG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A1E10E033;
 Mon, 28 Jul 2025 05:02:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kimfvGPnc5J34orWYyMYp3c8CcsEaXMQhDu2UeeeQc9XRZQ+KncHn2Ub47xc320ATOrteaxGyz0zyCEUXQ6/7OJOXlq4llboHBIIJ9KEJLNBmPvwSWAa5mUaua30IuczW6rI6R4Mhh2QV0qJ4FxCuRO6FUrcZWDGpw5SMMu/sH2baIrOpjlfaAtfnafUTH4XaEPREBLbpuMF1NUaVq2TngfHhX8RtXEgaZ7HCJ84sCDcBmfYvUm6nEWpPURj7DCh40CcymI9dMIW3yQHw9pCC50ZRa6o0mpB6hJvDtCLgRMY3Odg7PLMCtBctlt4r7G7Xco6QEcNuUYKsUIGgbQtyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJAcbnaqMJjhcTsa2A34sPq/mfO/4zlH2ICgqPGi9bo=;
 b=AYWSHN1dH6TsW/+EApm+rmzgyjX25o2vT//C9dxSksnLt8hZj3AltGJA47ui8V2K6/AcGyXoTewXkRLnF/xgnvQVC70MDN47K1wYzmLKf25XWlB4ahU95/AvXdwfSLeC7saXXNSOjxGj3+ZKdHdTz/E7hAmKc3u/zoXNNGTQcnvfCpwt+0kBuFOqD4I2JXNhiCcNK27wf5xH57HtQgCuE8Fgd1vd/Jam5ALAEB8ltS96aHAVQ3pggX1D0KyWBgw3gILNTUJfyZYRACerXEvP2B59y1d7+FpVI7FOWVLwLRH13JmgwKNiw+KPnAZQaP9qqunw1TpnDHSxBaNiPDCcPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJAcbnaqMJjhcTsa2A34sPq/mfO/4zlH2ICgqPGi9bo=;
 b=liPb8bYG3s4TR4hptW0v19CZyTeH/YmoIObdDqLJm75wiOLOcA04Tqyf3cwy8t/9IgZHGsIkNpepwjf3TNGId/rfPf+yWjcZAEwHqmsIBrSxsY5gVNp6HzUXEmQ57CVtaYcCvCSnvrpN2D6Dp249QQ2sl9ykUMlxVvZK+bb+zW/mee+jmHODGpcqNHhRXMR/fvaWYSxJFkL/21sNBh+gncvr8P8D5NHeVLcIclomu/zJ9cChTV5MZSqAN/Kk+47AgX9vIHGwo4mBT/3W0z6hKperasFh8stDcNCKtpwhqsyp5o7jICvMsKS+z2rynfZs0PZ2nUyNxIN/FSPS7WSMGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB9733.namprd12.prod.outlook.com (2603:10b6:8:225::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 05:02:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8964.023; Mon, 28 Jul 2025
 05:02:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Jul 2025 14:02:43 +0900
Message-Id: <DBNFB659QQI7.29PSPMX9LKLV9@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Beata Michalska"
 <beata.michalska@arm.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 07/19] gpu: nova-core: register: move OFFSET
 declaration to I/O impl block
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
 <20250718-nova-regs-v2-7-7b6a762aa1cd@nvidia.com>
 <856B6814-1782-4FB0-9DD1-BD46C8FE935C@collabora.com>
In-Reply-To: <856B6814-1782-4FB0-9DD1-BD46C8FE935C@collabora.com>
X-ClientProxiedBy: TYCPR01CA0112.jpnprd01.prod.outlook.com
 (2603:1096:405:4::28) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB9733:EE_
X-MS-Office365-Filtering-Correlation-Id: e9c5ae4c-b9a0-4dd4-96ce-08ddcd93fe4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|7416014|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVhWclgwTWtPUHNoRzh0eFc2K0dUbjc3MExDUXp6TVhDNXc2cW1vZGtjU29x?=
 =?utf-8?B?YUNDTmZ5OCt2TlV0NXk0WVpuQmVRYlNUTG5OUTdLcDJxSVo2d1RVZUxXaThQ?=
 =?utf-8?B?N0RlamRSTlNqQ1RsYU16YnY3S2Q5MGV6aXpnTHZXb25takVoSW1mVnoySzhx?=
 =?utf-8?B?bExjMElZVjR5MDZuVW5GTlBUaHRid3BqcUxXTDQ4MzVtVlNuck9JeHM5UG0z?=
 =?utf-8?B?ZW9FeXkrdWUrMXJkQTZrU3dNRENIeG9GQ1VoWE1sSkRnM29PNXNyM2FNcnVW?=
 =?utf-8?B?eGlSV1RndURLSEZmbXhjK1pIMC9WSEY1UlUrdWN6SzU5aVlYQWh2U3VzaTZw?=
 =?utf-8?B?SEwvbm9vNTNzYnBnWDJCWWhINDNZV0dJUVgvSzI3bU83cGRvQlEvSmU2cG8v?=
 =?utf-8?B?WDY2Z1UvMVZ3dllQQ2ZXdFd0ODdla0puN1pYbzRyYlhaYnYrY2h1b3l5b0x6?=
 =?utf-8?B?SkdUMWpoTlc4VUQrZWN4djBLVlNXWUtycFJNcnVDSFhJUm53LzlMc3R2dXI3?=
 =?utf-8?B?N29EaWRFdVlIeUxYc0RSVGJ0WklBLzlGeGtpc2JCQ0xadVZ2WWJ2V3dHZFJq?=
 =?utf-8?B?bitRcFo4eU1aYWZLa1ljS1FlM1hHTVRGT0swTHo0T2pnaEpaVmxzcjJ4ejJl?=
 =?utf-8?B?MGhLM0o1VGs5ZDJVcUNBR21GdG5BUlNaRm1MZmNTSjQxNmVjMGlhdDhvM0dx?=
 =?utf-8?B?WEJhazUwT0M1QnZpNXpRb05DLzNuRlltM0JMRFExdEFjb0RFa0xvaDBkWlV2?=
 =?utf-8?B?TnFoNWVjRGsxTlJPOWVkYzM1TlI2OWoydlBaVjM4dWJ3OTdld2NlbmVReXJ3?=
 =?utf-8?B?Ny8yOU5xT0N6Ykp1cjNwcUp4eG1VMTJQTVMyRWl6cTRGQWxZcWhFOC9sRHRB?=
 =?utf-8?B?QUhGQVZlMklWVHdXalRIb2dKWElhZW9uR3F1eUlBKzR1QW1SUUUxK0hpNjM0?=
 =?utf-8?B?ZE4ydi9kQmxRU2dmcmtUbXNZVXFnR3BqQlF0ekdmRkZyL2JlYm1XV2ZxQ3V1?=
 =?utf-8?B?RVB0MzBaYnJ0eDkwTExUUjRRWDB1dDhUckhmTUxLNVFDOFBjM2hQck8vdmJB?=
 =?utf-8?B?WlhNOUFzQks0Vk9IcUNibXcyaktGeDU2NHFMM0h1R0VwZ0tMNFRSVGxhV3B3?=
 =?utf-8?B?ZTRtWHdRY3M4WUhHUnA3MHgzT0JSK1JPdUF5U0xJQWNtb2NWdzhFenN3dDJq?=
 =?utf-8?B?T1d5NUhBZFd6ZjdXSE84aVEyMThGTWdJOFVNS0Q4UXRDUUcrdkZXdDZOUkh4?=
 =?utf-8?B?NVFnSmEzOUx5cGJKdDVGS3E2blJ3RldITFY0SXVKWGNQUzhraGwrSVR5VVc5?=
 =?utf-8?B?MkFtRTIzbVVQS0JBbk5ZK1Vsa1Jkd0QwaFZGeUV6em5hTXdCbElKc0UwNnRL?=
 =?utf-8?B?bDhMdXFTLyt5UVpscUtlNy93bjU4ZTVYSTZkbU5SeGlYTWlaZXFvcksxMDlx?=
 =?utf-8?B?NklqZzRxMWJqaXhRZFprL09XVkx4d05wYXVVdHF5VWZCalRWRzhaZzFOR3F1?=
 =?utf-8?B?MmFzSnBSSU1HS2VsZ2toL29QRUd4ZVpjYWdqNCt6N09PckNEeHFHbmFJaDZF?=
 =?utf-8?B?cCtoQkxYRDNOQU5KcWxwN1VTREtFVUNSc0tVVys3RCt6Zkt6OFBDYy8rVkEr?=
 =?utf-8?B?ZXY1WE1lRFdjNlV2dGFFM0E5TmdHQytxakFYVmFxa0JpRFNKL0xaTFpSQ0Q2?=
 =?utf-8?B?eFU4R3N1VGJHQVpENFBsUUN1T1czaDkrZkdlcXZvRnhIRkI0Q2YrUUpxcEpR?=
 =?utf-8?B?OThoL0d3a1ZDK091RWQ4b003Vy96WCtyTTFJcWNXcG9FNmsyWGVnSElPdnRG?=
 =?utf-8?B?WmhPU0gyODRJK1ZaaTVaOGt2UDJJYjRsL1E0Z1FUTkNVVWNabGdNTWhqd2lM?=
 =?utf-8?B?NUhZMVZPdVJER1hUeGJPN3FUV284dUVlMFpwcjlHR0pXZkdMeXhkK0Z5dGJY?=
 =?utf-8?Q?vmoHxRVEArk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkZXSWcvZ01OZkV1Z2piVmxadUJVZ3V0Z0FGL1dyYTRpd1R3dklKRmdEZUpO?=
 =?utf-8?B?L0wrNkszL01wN09ZblZDTW9IOUgvOXUyUW9NTXY3a0JqazFPaWFyU0R4R2xQ?=
 =?utf-8?B?TUlPbTNrTnJmY2JGTnI5ZTZtcDltMzJhbXc2N1BsVDB2YkdKMXMvQmxVUStC?=
 =?utf-8?B?Ym85Nk9vamFHQkVZRWY5REFmYnE4RitTLzBYWWNzWDFqc2dsQURONm13TWFv?=
 =?utf-8?B?WWxURWdTYVNiajRsckZ2Yk5vK1lTYkkrQys2UU9oOE13bWI1NWwzZnY0cnBq?=
 =?utf-8?B?QTRsVHhhQWEzZEt3ZVNXMWJJUkFQcjlhVHJUTEpvL1lCS0JnU3M3YWRMNmUy?=
 =?utf-8?B?VHkzd3Q3K1FZY1lod24ycDhnMGxyOTRoNEtvVWdCNDBOYWtzYlZCZjlKYnMv?=
 =?utf-8?B?bHl6WnZTZzhlN2JZYVRickU2VWxqcGxLVkJNczNNb2xRTG1LUi9pR1h6TWsz?=
 =?utf-8?B?anYxUkFxNmN2SHpNMVNYRVBhaG5iekNLeXRBL1k4OU00dHpkMCtVRWhxVEVB?=
 =?utf-8?B?TWtlT0FhWmJ0b0RLbGMwWG42QUdheFZmWER6SC9lWHBqc2dLbldoWDMzVDcv?=
 =?utf-8?B?dzA5aEw0eWhBVnROZGtpQmx4TjlrOWJZZEZPbmpuMDU0S2I2TWJCQ3dvR21i?=
 =?utf-8?B?U2lzU3V0cTd3cmh3VHVQQ0s4Y3J1aGxEaXpidEgvK2RwaHBsWG13dGY0elA0?=
 =?utf-8?B?L2hkK1RocUZMSjJ1QjhOb25KR0N4SUN6aWZKRkFBOHRFdlVRSUwrSW1KeVpn?=
 =?utf-8?B?MXRoNkU1Sk1RZ3EvTDBUWXlxZHhzY2UySmRrQWljbWwzaG1NYjYxemFzc1BH?=
 =?utf-8?B?WXV6bHFOOHIzb002M3huMkczdlVpZ0VoUWVQRFpDSmZia0g5YTFkOU1JbWtI?=
 =?utf-8?B?MkxXQ0NYL2hIT0FUT21TbU1HaDFXUUtxUkdiSktvLy9hcU1CWWFHWmJJSkNa?=
 =?utf-8?B?NWRHalZzTit3RUd3Yi80TC9YODUzMWNzVWQ5aUhYZnFxektKa0oxWWwwY2hN?=
 =?utf-8?B?UzIyQjZLODQ3TjcyaWFaRUVySkxuMmUxUWdHVVo4cTJ3ZytMM3RDYmhadEdS?=
 =?utf-8?B?eXd1SFdGZ0dFdXV5UU9NWEU3czkxT2hZQWZ4MDZmc2VtbnJuVTQzcmVvR2Qw?=
 =?utf-8?B?NUUxZXRLUlY1Yi85SThMK2EzYzlyUGJEeDNYbWJ2VE1zQ21NYlo3b2JuSVU2?=
 =?utf-8?B?M2hEN3FpaWRXRms0TFJUN3V1cytXODg2MmdIT0ZsSUM2MjQ2QUp5SjNabkt4?=
 =?utf-8?B?WDVWanpiaXN0bW4wNXk5LytpSmZIMFNIY3FDZUt2VFptVGJNYWNtczF6Z1Ny?=
 =?utf-8?B?eW1UdkdlU01mV0U5OW9LREN1M1k2SzM3K3FFTnBINE8wcVhyME9DaU5qWTBP?=
 =?utf-8?B?NXRjU3ZEbjFVTno2dEF2RGU4d0RjSFd5Q0Yxem8rVVM4M2Q0OUFjREtJVEVC?=
 =?utf-8?B?NHh4WHlOQWc3ajdXWHd5TTdtN2NONnM5eUhyTG9uOUFXUXUrNks1RU5SeStE?=
 =?utf-8?B?UkI5Z0Evd28wTlJzOTJIeXlKNHJyQVplWlB3VzJZYzFCd21CK0JJQVNTcE9Q?=
 =?utf-8?B?VTRjMnN5OW1MQk9WUWhLNU5ETFdvUk5kZVNUVnVnL25veXFWQWdxZ056ZXUx?=
 =?utf-8?B?Qi9HWFE3WUkxSmNvdUM4cWlMV20xN292VENhb1MyV294UTNwUnJXQ0R6YTVo?=
 =?utf-8?B?MTZ6SEloWmIvcVluWDJrSG05eU1mckhOa2xmUUsvYk4xRkVidFhGY0xqWFdu?=
 =?utf-8?B?UHZ4TGx5Yk84b3VZaktkWEMwVEJ5TFlRT2VINXlwS2VIdWo3UVdYeVorOURS?=
 =?utf-8?B?Q3kvNEdvdXlFckVVUGJCZ1I4ekJZbGZ1Mk5ralJuTzlMNmVXOTlKVHh1ZGRr?=
 =?utf-8?B?MzhDQTBPYXZLRVlocU5Xa1FEZks0emlTMUpTRnU5YkVoVThrTGpkSThRaSta?=
 =?utf-8?B?dS9jQkNuT09meTJxaE5SS05oVnpHbmIxUG1pcEFKeTlWOFJHWVpVUEQzYWc5?=
 =?utf-8?B?UEdpNlpCTzUzNlJLS1dNalVEajVQdjYxd1VBOVRqbmRnVGhoZER6WGNIYWF0?=
 =?utf-8?B?VDljMWlldjZPVDFSTTlHQWc1QVIwYXpBcTFkRHZOeU5RWnlFdTl4MlNEczMz?=
 =?utf-8?B?WkhXbkxFMTI3bG1LNlBFekwwbjVxeFRHWXhGalhzVmREb0lKVHVZanAwY1dW?=
 =?utf-8?Q?2KOMcidaqPesgKHsbTYECWHEBbz8mWliPIMfuT+6nZQ/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c5ae4c-b9a0-4dd4-96ce-08ddcd93fe4b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 05:02:47.5672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vdz9YrtyhkhegDlhW5RvBxwO4QIzfSoqGvFsg/95/dwEtD3jJW7s30J5wUJkVEO0O5PXXSpcr3oJWPOGhY4U1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9733
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

On Sat Jul 26, 2025 at 2:03 AM JST, Daniel Almeida wrote:
>
>
>> On 18 Jul 2025, at 04:26, Alexandre Courbot <acourbot@nvidia.com> wrote:
>>=20
>> The OFFSET const is an I/O property, and having to pass it to the
>> @common rule makes it impossible to make I/O optional, as we want to get
>> to eventually.
>>=20
>> Thus, move OFFSET to the I/O impl block so it is not needed by the
>> @common rule anymore.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>> drivers/gpu/nova-core/regs/macros.rs | 19 +++++++++----------
>> 1 file changed, 9 insertions(+), 10 deletions(-)
>>=20
>> diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-cor=
e/regs/macros.rs
>> index 742afd3ae1a3c798817bbf815945889077ce10d0..4da897787c065e69657ce653=
27e3290af403a615 100644
>> --- a/drivers/gpu/nova-core/regs/macros.rs
>> +++ b/drivers/gpu/nova-core/regs/macros.rs
>> @@ -92,7 +92,7 @@ macro_rules! register {
>>             $($fields:tt)*
>>         }
>>     ) =3D> {
>> -        register!(@common $name @ $offset $(, $comment)?);
>> +        register!(@common $name $(, $comment)?);
>>         register!(@field_accessors $name { $($fields)* });
>>         register!(@io $name @ $offset);
>>     };
>> @@ -103,7 +103,7 @@ macro_rules! register {
>>             $($fields:tt)*
>>         }
>>     ) =3D> {
>> -        register!(@common $name @ $alias::OFFSET $(, $comment)?);
>> +        register!(@common $name $(, $comment)?);
>>         register!(@field_accessors $name { $($fields)* });
>>         register!(@io $name @ $alias::OFFSET);
>>     };
>> @@ -114,7 +114,7 @@ macro_rules! register {
>>             $($fields:tt)*
>>         }
>>     ) =3D> {
>> -        register!(@common $name @ $offset $(, $comment)?);
>> +        register!(@common $name $(, $comment)?);
>>         register!(@field_accessors $name { $($fields)* });
>>         register!(@io $name @ + $offset);
>>     };
>> @@ -125,7 +125,7 @@ macro_rules! register {
>>             $($fields:tt)*
>>         }
>>     ) =3D> {
>> -        register!(@common $name @ $alias::OFFSET $(, $comment)?);
>> +        register!(@common $name $(, $comment)?);
>>         register!(@field_accessors $name { $($fields)* });
>>         register!(@io $name @ + $alias::OFFSET);
>>     };
>> @@ -134,7 +134,7 @@ macro_rules! register {
>>=20
>>     // Defines the wrapper `$name` type, as well as its relevant impleme=
ntations (`Debug`, `BitOr`,
>>     // and conversion to regular `u32`).
>> -    (@common $name:ident @ $offset:expr $(, $comment:literal)?) =3D> {
>> +    (@common $name:ident $(, $comment:literal)?) =3D> {
>>         $(
>>         #[doc=3D$comment]
>>         )?
>> @@ -142,11 +142,6 @@ macro_rules! register {
>>         #[derive(Clone, Copy, Default)]
>>         pub(crate) struct $name(u32);
>>=20
>> -        #[allow(dead_code)]
>> -        impl $name {
>> -            pub(crate) const OFFSET: usize =3D $offset;
>> -        }
>> -
>>         // TODO[REGA]: display the raw hex value, then the value of all =
the fields. This requires
>>         // matching the fields, which will complexify the syntax conside=
rably...
>>         impl ::core::fmt::Debug for $name {
>> @@ -319,6 +314,8 @@ pub(crate) fn [<set_ $field>](mut self, value: $to_t=
ype) -> Self {
>>     (@io $name:ident @ $offset:expr) =3D> {
>>         #[allow(dead_code)]
>>         impl $name {
>> +            pub(crate) const OFFSET: usize =3D $offset;
>> +
>
> Minor suggestion, have you ever though about somehow making this a const
> generic? This saves the space needed to store the actual constant in the
> binary.
>
> Again, not sure whether this is feasible.

A const generic would require a trait to hold it, and would make that
trait implementable several times for the same register, so I'm not
quite sure how that would work...

Besides, we want `OFFSET` to be available for external users to read (in
case they need the register's actual address for whatever reason), and I
don't think this is doable with a const generic.
