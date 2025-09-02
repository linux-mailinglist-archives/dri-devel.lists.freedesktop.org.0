Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D7EB406E3
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 16:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AACC210E756;
	Tue,  2 Sep 2025 14:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="T8s8NNHz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF8910E75C;
 Tue,  2 Sep 2025 14:32:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XscsDcofDL04J0QMtK3MdTnzmRofA2MXWb601Af77kXowECGJUU9Pp6HoKD9yC8yAt+ExSIH2GYhgzzzPbEXxeZjD6ZNNOS8Q9WKzZzaScgLTIVjeqkkSjM+i6gUcGbxjBp+Y3x1nPtXo9zsB6fin4foHWpCYKqP1Co5Uyd0LqzZQgwt+0yb2Zq0GisYOz6WXrHHSXeogZph3///vE0TmbWyFQvgfrshKV+lNnCgGQZemFDl+U8JjPgP93QZW/JxWZ9WxRfjNuiiUlrTcjBgLP56pBL6ToAiIxd9oqu21VehkO/U12vMIDi2xaKsNq8lNgJK8Yfa20mKHr3yMmbLsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7yJ+ddnFLipqJ+KJx6B70NMSv7LVM9KP/KmYGEcD7k=;
 b=sE2qF5oQkltRK14EUyvuKQ9qy29Hup0OSCOeaUAyffCIB3vXn0aV51LZPUIeTJSQTZYDsEUiz3ebOArNlwv4XXN6sgCaLnOcnJI0lP4JbNtEHru3NgnC+7OwD700MayAWks0KreadeFX1hKReQdCz1Ji61bQVEJaF86ZnpmuPHeTt0/xeo5TSDwTiVQpCbs99CQQdPsjIvgWrxGE1470BzqLdh3m9ALp8em1mvoHhfxTgPwnRdYcPPy5/HZ5MpknePn4tCC3Fsl1LdRSrUPbhpyHsHvkZTS3HP8s0yncJd/b47CBD+pkBTII4eYvCrUNw/zGEkul5+X+b1tjoy/qsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7yJ+ddnFLipqJ+KJx6B70NMSv7LVM9KP/KmYGEcD7k=;
 b=T8s8NNHzOGln6JDPUKNefM2stmVKeeYq6bPl5Mryglw4br6R1Csp/6R534aT2RXdb07v9lU1b3kDNP3zxSXrG4EQ4ogTha6gtPLc1uW/48vdxLs5+fr/dnUCVyRC9cCqclkuRcp0J3erElsRTEuTSc1DwXSNPiKj6wvgONSsDC8m++iQ4gEvoRkarZ0/PB6tiqHQrG5Q+TN2/6SqTb1iX4jyQj3f9An220EB4GZoAP1SS+bYnXPvrI6yCSNtbs1BcBfUNuc0fOb78+qmQkIUo3bT4v9/XhluKIOSJhgyyZTTUdJIYN17AXXz5D9++EGtrEf+gG+JePDBXvFXAGugOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8955.namprd12.prod.outlook.com (2603:10b6:a03:542::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 2 Sep
 2025 14:32:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Tue, 2 Sep 2025
 14:32:24 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 02 Sep 2025 23:32:00 +0900
Subject: [PATCH v3 06/11] gpu: nova-core: firmware: process Booter and
 patch its signature
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-nova_firmware-v3-6-56854d9c5398@nvidia.com>
References: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
In-Reply-To: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP301CA0011.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c52621-b3ed-4c45-22ef-08ddea2d88dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVUwbzAybzFRY3haMitqbncrSGdRbHQ3NkZaY0xxRmlXeXhnVGtGaTFsRFhM?=
 =?utf-8?B?NTk3TmZwc3pCVTJHalpZRjVPN1o1eTNaV0JPV2V0alJJSjJ3Mlhtb29MaTdM?=
 =?utf-8?B?bDhmVFhZSm9ZbWhrcE1tbGo2anVyejdrSzV6Rzhnek9rd2M5SHJ6UW5tc0Jr?=
 =?utf-8?B?OGdyTjBNYnBoYmlGMnhsQjVyakw0MGZGbFhZeHdmckltVGxsMloxdTdXRk8x?=
 =?utf-8?B?eUpLQkY5QTNrT09BbnFYaFZVTXoxTndJRnZ4U0pmZy9XUmVSb0RUQ1B4YkxZ?=
 =?utf-8?B?MTZ5UFV6eTlkUWVQTXNOQ1JHcndveGs1aExVNUs4TzBoQVo5UitZVnFpRlJr?=
 =?utf-8?B?S3p3cUp3WStOTzhqVDFTZXU1YWhqNkpLbVBUaU5oN2wwVEc2OUVXMXhUbHds?=
 =?utf-8?B?eS9lVmJ3eWxaZjQrL2lVbERJYytuU09CdHhROWtSWmNReGRMRWQ1VEh5dGV2?=
 =?utf-8?B?Y1NpOTRuVVhqR3FXbCtkZk9mVnoxWEl5MldBeGFCZWZ1eE1qZVBBVUY0YWow?=
 =?utf-8?B?cDVxNnkwVXhNcGl0b3lWa0h4TDVndmdHMUxWQ2lVYnJEL1I4YlFnZFhHM2xn?=
 =?utf-8?B?UjlhL1NPSGhZb0thUGJtMHEyWTFyVWVNWU1pSXFjUHBUcnZTTlRCV1NhSGtk?=
 =?utf-8?B?MkhGandpZWJVMWp6eFJUQzRudzk4eS9mMjFkK0dxRWgwUDl1UDRuak0vSmZy?=
 =?utf-8?B?K1pEQ00wRWc0RWZST3JVb1hjNjV5SFp0dm8rVkJWRmdGODM0VVA4dTFuZWd6?=
 =?utf-8?B?T09GZm0rSm8yWlYzeEpuYW0vYW40L0Q5NWhGR2RZTkNrUXpjaHArTlR4QXZ6?=
 =?utf-8?B?UW4wajg0Snl0bkJjMDVyWE9mNXQxSlpiVHRHckh6RVBDUkpjbExBT1A4Qmp1?=
 =?utf-8?B?MDA5NGlraTVzOTUvOGZySUlxRzNkNGt3SnBUaUEyNTRrclYzbjJyM0FuNlpT?=
 =?utf-8?B?MDRwWkl1TmZWcDBJTk4xbDJENlcyMUpCSk5reFFmQk9MYUF0VGcxT2lpdUhr?=
 =?utf-8?B?YmVoL21DUCtiRlNGcjdmK2d3T29KcUNSS3puL2RCdG9wdlR4aW1sdnhLaytI?=
 =?utf-8?B?Y05pb1RMZ2lxMmY1YjUzeUxnRlJVbEVESVZwTnRVVXdvTkdQWklTRUhEemNW?=
 =?utf-8?B?MkdodytCdEg5VHBlZmp1Szh2aFRxL3IvdStFS3NqWjJkajlYTGFYMEJ5U2ZE?=
 =?utf-8?B?NTdXK21jYTE1ZmVScFpyV054UlpiZXJwTzA4Yk1pVThvQ3ptc3o0WXhnT253?=
 =?utf-8?B?d1VKNXJ4ZlQ2RXZUVGNWVWZKY1Q3eFhKYWJaNnJNa25sMlNQR2ZBTzl2SUVP?=
 =?utf-8?B?T3A4USt4NGtReE03U3p2QWlZOE4xNDdsc3pDVW9XUnpPeHVsbGJtZ2gxRFpH?=
 =?utf-8?B?eEJndGFaU21KQnNEd0ExREkrS3lFa0dpbzM4R2RydEVZT0lsV0NxN0RERTRS?=
 =?utf-8?B?ZHNvZ3EreHdrSU8yd1Z0RWtLMDEySDJpb2dEQ2UxbmFpMWE0N2VnRWVGYUt1?=
 =?utf-8?B?V0RyMmJYSksvRXR3WUFsVFgzZzNUbys3OWdNUWZlQU02SDBzaW13cUxlOW1V?=
 =?utf-8?B?NElJVUFKSmtTdzZRTEsyWWNXeFFrTHhUaDAwbU4zdnNydkZUazdCSWZnTjlN?=
 =?utf-8?B?Q0NwbnFjZGRsblhPVmRwclVFTFNjbzV4Znl0TFBGb2NiY2NScjlta2RzUGdD?=
 =?utf-8?B?S0tTWnE5czlvbXdPc0VhU3RWTndlbFNVQS9zQ0lSQmhiemhiV0N6ek5lV28z?=
 =?utf-8?B?WGhoZjFtTzR3M3ZXdmlIcFRLejlmakp1T3NiN0JDNkdIMDJobS9SaGtXMmpr?=
 =?utf-8?B?ZmloRTZkUjZtQTB3bWVmQkNtWUN6UUI0cGUyRFlTRGhPem56Tm9pTlUzblkr?=
 =?utf-8?B?RzFscTBDOFlMNmhsZkplSWVSc0VhQnVQOE9VczV4ZFhFb1E1dHNxQ1BVVzJB?=
 =?utf-8?B?YzltQWY5d2YwSTNnSVFpUlArSVI3RGVIQnlVelV3MFBvcStxdTlkQjl2TVd4?=
 =?utf-8?B?eGFXTlhCZ0hRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUJxc3lGTWcvZEZ3aTFWN25rcFJhOHZqbTdVb1FPam5IbENXQVFBSUxLVVpH?=
 =?utf-8?B?azE1MzlUS3haY0FmVG1xV1dZc3duUjdtL20wamRINHUzTjBRTEt4MmNCdXls?=
 =?utf-8?B?enh4dExkWGFyakdEb2hMbkVqV1prNVZmSVJMK3Z1MjFnT2hLT0FxK1VmV2RH?=
 =?utf-8?B?SkhwMFEwc1hjT3BpU1dEUUkyQWZTVUpGSkVacmtSelRDMXBzb1lvVE1NR2N3?=
 =?utf-8?B?VWd6WUNtUlN1RGQ1eFdwQTBMMklPL0R6MlJjM3hjVnF6bkRleFhhZDdQbGFo?=
 =?utf-8?B?SXYxekpsNGxId0p4UWJhMk9Sa1padHB2cnd3eDhpVHI4N1N5V01kbUxaRU4r?=
 =?utf-8?B?elpiTEJQS2xHdEdjL3RSVjFHVmltR2djRFR0WHR6WE5hUUpPWElDS1A4U1Z6?=
 =?utf-8?B?L3pWUzBuSjBYMExtMTBKblNrMm9DUkhSZXBvOUVsby85MWxHMFNFeG1IcU80?=
 =?utf-8?B?K2hMVDkyVFFrbWN2ODVqY0JhMkJLS3JFYlQzcExyK05JT1U1L1U2YWxnY0lm?=
 =?utf-8?B?eVVRSStsRXhBT0FEQng4VDFsOHlYcWxpZG1sRlBPaGJoV1dHbHkzRk9rQi9P?=
 =?utf-8?B?NU5DQ20vQWQ4MUxOSmZxT1RvSnNUeEhKanlRUEZFRlNrdUIzeERGSnc1VTRs?=
 =?utf-8?B?eXhKb2NPTWU2aFlybFRSZnhtMzhUdHJpTTAvQ0Q1N0Z2RmFwOVRtNWZEYzVr?=
 =?utf-8?B?T3N2TVd0Si9RTGx4ZHQ1WTMzYi9acnVBWWpsNlF1YVhocWNkby85ODRWNkFV?=
 =?utf-8?B?ZlFNWWJqVjdHd2oyZDVqc2U0Ulc4Z1NRTmgweUFQS1ZyMUlIeEUrS2tOajVZ?=
 =?utf-8?B?RHIrYnBrZVczcjhBaFdqRStrRG13VjdkSDRHWmh3aUdZc1cxdTVhaXpjSzhv?=
 =?utf-8?B?TCtSaVhXelpHbVhxMDE4cWJ6djJaRjgrU0lJQ09zMVpRbU1WNlhDYkxFenNB?=
 =?utf-8?B?MXhjdUhMc1VyZm53WFZVNjNtRGQzc1hqdkVpQkkvbkNSRnlMZk40ZTNBcnA4?=
 =?utf-8?B?MkZuRkJmU2FzOFBRVlczemlSMWZDTGZTU0F0MG5taHFTRTYzWnhFZUlzcjFo?=
 =?utf-8?B?M3gxK2Z6Vng1QVZhZ0JQeUZ1eW1lRklHazR6UWJQcStuYzQ1WW5XMHlWREZN?=
 =?utf-8?B?VThMd3d6WmtUMlJyelh6WTRJcS9McXpmSnZ2WDJVZFI2RlEwL2lhUm5lNmt1?=
 =?utf-8?B?MmtLeG96NFY3blkxMGFVS3FLRGk3YWJiNEU2OWkwdGJVYWVoNFhBNG1RdkE2?=
 =?utf-8?B?SC9rRXQ2NFhVYUt3RnQyWE5VNFlabUdaaGJ2MTgyUzd4WWUzSU0zZWkyc1dj?=
 =?utf-8?B?WFpzOVIvcGw5SC94VzE3b3JjT0VKMnN3T0llQUxMSlBtdVlyTDJOVVBGY1ZS?=
 =?utf-8?B?em1IaTlOQmQ3c1A1aWs3RjloSFplZUc3THh4eTQxYjl3UnFMYXpUMUFwSDRD?=
 =?utf-8?B?akRtZ0NxdkR6Q2N4d2VhTmVWNURDVE9mTEdNT3BvTzVXRkJRanRQRCtzVkRI?=
 =?utf-8?B?NkgzdTVoRWU5T29yeTJBT09iam9zQzhRS1ZDaUVvRmVWQ0pDVUNCNmlpVEpu?=
 =?utf-8?B?cGd4NU5MK21GZW1tdEs0NzJQdHV4akdrbStTc1JleHoybEdUV0FzcmRsUmR3?=
 =?utf-8?B?aXNpbjdldGlXZ2t1bTJyNERxc2Q5ekVrcEt6M3ovWEhubzhyZ1M4dlM5aVNT?=
 =?utf-8?B?YU9xUCtVRjZhektZSnhxeXJrMCtUVG84cGVCNExUNmdPajBTNXRiYmtod2l3?=
 =?utf-8?B?S0h5VnBhdkcvbjROQTZOTVM3d3NpQ1BGS3pmMkdtakREd1lGc0ZWdEVPeFZw?=
 =?utf-8?B?RjZWSmtiUlJwWTRCVW03MUtReUtpa1AzUGRaVDRWSHpvbXhQYUNCbWtwYm9T?=
 =?utf-8?B?V0kzQytoSXhEK0NOOGNuWlpSdWNJTUZsN2dNSE9za3RDNStPR1A4OVZrQk9s?=
 =?utf-8?B?OCt4SFBETVN0UkNxbHdFVUVWUnFNaUorakx0YWxKemlvNjZISlp6ZkljYUtq?=
 =?utf-8?B?RWVDMnZaVFpQbUtFRXQxdnY5R05mNDE5OE1YeDNISGVWWGswN0J1UnFSZW01?=
 =?utf-8?B?aWRKbGNaeGtXYUlST3g1Qm5aUmc3OVMzdGJVV2sxWWxQekZ0U2V3ZkpQUlBT?=
 =?utf-8?B?b2RjeHZoMTB6T2lzblBRTXdwclZ3dlJaUXl5K25UZENreGFobFpLbzdkRUNH?=
 =?utf-8?Q?dkxwWwMC/8K8n1JoP+2CQHNcZkItG4FKIR2hNLEeFwYd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c52621-b3ed-4c45-22ef-08ddea2d88dc
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:32:24.8808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RslVfj1XTvINhyMLqz50PaAnWd289D61ABMAZelN3D5eqz2z27PamyDkz8MkYMxmUT0ydPIQoaIrolNJCuBKkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8955
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

The Booter signed firmware is an essential part of bringing up the GSP
on Turing and Ampere. It is loaded on the sec2 falcon core and is
responsible for loading and running the RISC-V GSP bootloader into the
GSP core.

Add support for parsing the Booter firmware loaded from userspace, patch
its signatures, and store it into a form that is ready to be loaded and
executed on the sec2 falcon.

Then, move the Booter instance from the `Firmware` struct to the
`start_gsp` method since it doesn't need to be kept after the GSP is
booted.

We do not run Booter yet, as its own payload (the GSP bootloader and
firmware image) still need to be prepared.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          |   4 +-
 drivers/gpu/nova-core/firmware.rs        |   6 +-
 drivers/gpu/nova-core/firmware/booter.rs | 375 +++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs             |  10 +
 4 files changed, 388 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index b16207e7242fe1ac26b8552575b8b4e52f34cf6a..37e6298195e49a9a29e81226abe16cd410c9adbc 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -293,7 +293,7 @@ pub(crate) trait FalconEngine:
 }
 
 /// Represents a portion of the firmware to be loaded into a particular memory (e.g. IMEM or DMEM).
-#[derive(Debug)]
+#[derive(Debug, Clone)]
 pub(crate) struct FalconLoadTarget {
     /// Offset from the start of the source object to copy from.
     pub(crate) src_start: u32,
@@ -304,7 +304,7 @@ pub(crate) struct FalconLoadTarget {
 }
 
 /// Parameters for the falcon boot ROM.
-#[derive(Debug)]
+#[derive(Debug, Clone)]
 pub(crate) struct FalconBromParams {
     /// Offset in `DMEM`` of the firmware's signature.
     pub(crate) pkc_data_offset: u32,
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 32b685c8757b1106084577c2cc7d5ef6056c1c64..d954b1e98fda82c44f87d2103e31fa717c392d79 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -17,6 +17,7 @@
 use crate::gpu;
 use crate::gpu::Chipset;
 
+pub(crate) mod booter;
 pub(crate) mod fwsec;
 
 pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
@@ -37,8 +38,6 @@ fn request_nv_firmware(
 /// Structure encapsulating the firmware blobs required for the GPU to operate.
 #[expect(dead_code)]
 pub(crate) struct Firmware {
-    booter_load: firmware::Firmware,
-    booter_unload: firmware::Firmware,
     bootloader: firmware::Firmware,
     gsp: firmware::Firmware,
 }
@@ -48,8 +47,6 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<F
         let request = |name| request_nv_firmware(dev, chipset, name, ver);
 
         Ok(Firmware {
-            booter_load: request("booter_load")?,
-            booter_unload: request("booter_unload")?,
             bootloader: request("bootloader")?,
             gsp: request("gsp")?,
         })
@@ -185,7 +182,6 @@ struct BinFirmware<'a> {
     fw: &'a [u8],
 }
 
-#[expect(dead_code)]
 impl<'a> BinFirmware<'a> {
     /// Interpret `fw` as a firmware image starting with a [`BinHdr`], and returns the
     /// corresponding [`BinFirmware`] that can be used to extract its payload.
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
new file mode 100644
index 0000000000000000000000000000000000000000..a4cd9c84bea75b68565778841e78a20cdec9333e
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -0,0 +1,375 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Support for loading and patching the `Booter` firmware. `Booter` is a Heavy Secured firmware
+//! running on [`Sec2`], that is used on Turing/Ampere to load the GSP firmware into the GSP falcon
+//! (and optionally unload it through a separate firmware image).
+
+use core::marker::PhantomData;
+use core::mem::size_of;
+use core::ops::Deref;
+
+use kernel::device;
+use kernel::prelude::*;
+use kernel::transmute::FromBytes;
+
+use crate::dma::DmaObject;
+use crate::driver::Bar0;
+use crate::falcon::sec2::Sec2;
+use crate::falcon::{Falcon, FalconBromParams, FalconFirmware, FalconLoadParams, FalconLoadTarget};
+use crate::firmware::{BinFirmware, FirmwareDmaObject, FirmwareSignature, Signed, Unsigned};
+use crate::gpu::Chipset;
+
+/// Local convenience function to return a copy of `S` by reinterpreting the bytes starting at
+/// `offset` in `slice`.
+fn frombytes_at<S: FromBytes + Sized>(slice: &[u8], offset: usize) -> Result<S> {
+    slice
+        .get(offset..offset + size_of::<S>())
+        .and_then(S::from_bytes_copy)
+        .ok_or(EINVAL)
+}
+
+/// Heavy-Secured firmware header.
+///
+/// Such firmwares have an application-specific payload that needs to be patched with a given
+/// signature.
+#[repr(C)]
+#[derive(Debug, Clone)]
+struct HsHeaderV2 {
+    /// Offset to the start of the signatures.
+    sig_prod_offset: u32,
+    /// Size in bytes of the signatures.
+    sig_prod_size: u32,
+    /// Offset to a `u32` containing the location at which to patch the signature in the microcode
+    /// image.
+    patch_loc_offset: u32,
+    /// Offset to a `u32` containing the index of the signature to patch.
+    patch_sig_offset: u32,
+    /// Start offset to the signature metadata.
+    meta_data_offset: u32,
+    /// Size in bytes of the signature metadata.
+    meta_data_size: u32,
+    /// Offset to a `u32` containing the number of signatures in the signatures section.
+    num_sig_offset: u32,
+    /// Offset of the application-specific header.
+    header_offset: u32,
+    /// Size in bytes of the application-specific header.
+    header_size: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for HsHeaderV2 {}
+
+/// Heavy-Secured Firmware image container.
+///
+/// This provides convenient access to the fields of [`HsHeaderV2`] that are actually indices to
+/// read from in the firmware data.
+struct HsFirmwareV2<'a> {
+    hdr: HsHeaderV2,
+    fw: &'a [u8],
+}
+
+impl<'a> HsFirmwareV2<'a> {
+    /// Interprets the header of `bin_fw` as a [`HsHeaderV2`] and returns an instance of
+    /// `HsFirmwareV2` for further parsing.
+    ///
+    /// Fails if the header pointed at by `bin_fw` is not within the bounds of the firmware image.
+    fn new(bin_fw: &BinFirmware<'a>) -> Result<Self> {
+        frombytes_at::<HsHeaderV2>(bin_fw.fw, bin_fw.hdr.header_offset as usize)
+            .map(|hdr| Self { hdr, fw: bin_fw.fw })
+    }
+
+    /// Returns the location at which the signatures should be patched in the microcode image.
+    ///
+    /// Fails if the offset of the patch location is outside the bounds of the firmware
+    /// image.
+    fn patch_location(&self) -> Result<u32> {
+        frombytes_at::<u32>(self.fw, self.hdr.patch_loc_offset as usize)
+    }
+
+    /// Returns an iterator to the signatures of the firmware. The iterator can be empty if the
+    /// firmware is unsigned.
+    ///
+    /// Fails if the pointed signatures are outside the bounds of the firmware image.
+    fn signatures_iter(&'a self) -> Result<impl Iterator<Item = BooterSignature<'a>>> {
+        let num_sig = frombytes_at::<u32>(self.fw, self.hdr.num_sig_offset as usize)?;
+        let iter = match self.hdr.sig_prod_size.checked_div(num_sig) {
+            // If there are no signatures, return an iterator that will yield zero elements.
+            None => (&[] as &[u8]).chunks_exact(1),
+            Some(sig_size) => {
+                let patch_sig = frombytes_at::<u32>(self.fw, self.hdr.patch_sig_offset as usize)?;
+                let signatures_start = (self.hdr.sig_prod_offset + patch_sig) as usize;
+
+                self.fw
+                    // Get signatures range.
+                    .get(signatures_start..signatures_start + self.hdr.sig_prod_size as usize)
+                    .ok_or(EINVAL)?
+                    .chunks_exact(sig_size as usize)
+            }
+        };
+
+        // Map the byte slices into signatures.
+        Ok(iter.map(BooterSignature))
+    }
+}
+
+/// Signature parameters, as defined in the firmware.
+#[repr(C)]
+struct HsSignatureParams {
+    /// Fuse version to use.
+    fuse_ver: u32,
+    /// Mask of engine IDs this firmware applies to.
+    engine_id_mask: u32,
+    /// ID of the microcode.
+    ucode_id: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for HsSignatureParams {}
+
+impl HsSignatureParams {
+    /// Returns the signature parameters contained in `hs_fw`.
+    ///
+    /// Fails if the meta data parameter of `hs_fw` is outside the bounds of the firmware image, or
+    /// if its size doesn't match that of [`HsSignatureParams`].
+    fn new(hs_fw: &HsFirmwareV2<'_>) -> Result<Self> {
+        let start = hs_fw.hdr.meta_data_offset as usize;
+        let end = start
+            .checked_add(hs_fw.hdr.meta_data_size as usize)
+            .ok_or(EINVAL)?;
+
+        hs_fw
+            .fw
+            .get(start..end)
+            .and_then(Self::from_bytes_copy)
+            .ok_or(EINVAL)
+    }
+}
+
+/// Header for code and data load offsets.
+#[repr(C)]
+#[derive(Debug, Clone)]
+struct HsLoadHeaderV2 {
+    // Offset at which the code starts.
+    os_code_offset: u32,
+    // Total size of the code, for all apps.
+    os_code_size: u32,
+    // Offset at which the data starts.
+    os_data_offset: u32,
+    // Size of the data.
+    os_data_size: u32,
+    // Number of apps following this header. Each app is described by a [`HsLoadHeaderV2App`].
+    num_apps: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for HsLoadHeaderV2 {}
+
+impl HsLoadHeaderV2 {
+    /// Returns the load header contained in `hs_fw`.
+    ///
+    /// Fails if the header pointed at by `hs_fw` is not within the bounds of the firmware image.
+    fn new(hs_fw: &HsFirmwareV2<'_>) -> Result<Self> {
+        frombytes_at::<Self>(hs_fw.fw, hs_fw.hdr.header_offset as usize)
+    }
+}
+
+/// Header for app code loader.
+#[repr(C)]
+#[derive(Debug, Clone)]
+struct HsLoadHeaderV2App {
+    /// Offset at which to load the app code.
+    offset: u32,
+    /// Length in bytes of the app code.
+    len: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for HsLoadHeaderV2App {}
+
+impl HsLoadHeaderV2App {
+    /// Returns the [`HsLoadHeaderV2App`] for app `idx` of `hs_fw`.
+    ///
+    /// Fails if `idx` is larger than the number of apps declared in `hs_fw`, or if the header is
+    /// not within the bounds of the firmware image.
+    fn new(hs_fw: &HsFirmwareV2<'_>, idx: u32) -> Result<Self> {
+        let load_hdr = HsLoadHeaderV2::new(hs_fw)?;
+        if idx >= load_hdr.num_apps {
+            Err(EINVAL)
+        } else {
+            frombytes_at::<Self>(
+                hs_fw.fw,
+                (hs_fw.hdr.header_offset as usize)
+                    // Skip the load header...
+                    .checked_add(size_of::<HsLoadHeaderV2>())
+                    // ... and jump to app header `idx`.
+                    .and_then(|offset| {
+                        offset.checked_add((idx as usize).checked_mul(size_of::<Self>())?)
+                    })
+                    .ok_or(EINVAL)?,
+            )
+        }
+    }
+}
+
+/// Signature for Booter firmware. Their size is encoded into the header and not known a compile
+/// time, so we just wrap a byte slices on which we can implement [`FirmwareSignature`].
+struct BooterSignature<'a>(&'a [u8]);
+
+impl<'a> AsRef<[u8]> for BooterSignature<'a> {
+    fn as_ref(&self) -> &[u8] {
+        self.0
+    }
+}
+
+impl<'a> FirmwareSignature<BooterFirmware> for BooterSignature<'a> {}
+
+/// The `Booter` loader firmware, responsible for loading the GSP.
+pub(crate) struct BooterFirmware {
+    // Load parameters for `IMEM` falcon memory.
+    imem_load_target: FalconLoadTarget,
+    // Load parameters for `DMEM` falcon memory.
+    dmem_load_target: FalconLoadTarget,
+    // BROM falcon parameters.
+    brom_params: FalconBromParams,
+    // Device-mapped firmware image.
+    ucode: FirmwareDmaObject<Self, Signed>,
+}
+
+impl FirmwareDmaObject<BooterFirmware, Unsigned> {
+    fn new_booter(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
+        DmaObject::from_data(dev, data).map(|ucode| Self(ucode, PhantomData))
+    }
+}
+
+#[derive(Copy, Clone, Debug, PartialEq)]
+pub(crate) enum BooterKind {
+    Loader,
+    #[expect(unused)]
+    Unloader,
+}
+
+impl BooterFirmware {
+    /// Parses the Booter firmware contained in `fw`, and patches the correct signature so it is
+    /// ready to be loaded and run on `falcon`.
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        kind: BooterKind,
+        chipset: Chipset,
+        ver: &str,
+        falcon: &Falcon<<Self as FalconFirmware>::Target>,
+        bar: &Bar0,
+    ) -> Result<Self> {
+        let fw_name = match kind {
+            BooterKind::Loader => "booter_load",
+            BooterKind::Unloader => "booter_unload",
+        };
+        let fw = super::request_nv_firmware(dev, chipset, fw_name, ver)?;
+        let bin_fw = BinFirmware::new(&fw)?;
+
+        // The binary firmware embeds a Heavy-Secured firmware.
+        let hs_fw = HsFirmwareV2::new(&bin_fw)?;
+
+        // The Heavy-Secured firmware embeds a firmware load descriptor.
+        let load_hdr = HsLoadHeaderV2::new(&hs_fw)?;
+
+        // Offset in `ucode` where to patch the signature.
+        let patch_loc = hs_fw.patch_location()?;
+
+        let sig_params = HsSignatureParams::new(&hs_fw)?;
+        let brom_params = FalconBromParams {
+            // `load_hdr.os_data_offset` is an absolute index, but `pkc_data_offset` is from the
+            // signature patch location.
+            pkc_data_offset: patch_loc
+                .checked_sub(load_hdr.os_data_offset)
+                .ok_or(EINVAL)?,
+            engine_id_mask: u16::try_from(sig_params.engine_id_mask).map_err(|_| EINVAL)?,
+            ucode_id: u8::try_from(sig_params.ucode_id).map_err(|_| EINVAL)?,
+        };
+        let app0 = HsLoadHeaderV2App::new(&hs_fw, 0)?;
+
+        // Object containing the firmware microcode to be signature-patched.
+        let ucode = bin_fw
+            .data()
+            .ok_or(EINVAL)
+            .and_then(|data| FirmwareDmaObject::<Self, _>::new_booter(dev, data))?;
+
+        let ucode_signed = {
+            let mut signatures = hs_fw.signatures_iter()?.peekable();
+
+            if signatures.peek().is_none() {
+                // If there are no signatures, then the firmware is unsigned.
+                ucode.no_patch_signature()
+            } else {
+                // Obtain the version from the fuse register, and extract the corresponding
+                // signature.
+                let reg_fuse_version = falcon.signature_reg_fuse_version(
+                    bar,
+                    brom_params.engine_id_mask,
+                    brom_params.ucode_id,
+                )?;
+
+                // `0` means the last signature should be used.
+                const FUSE_VERSION_USE_LAST_SIG: u32 = 0;
+                let signature = match reg_fuse_version {
+                    FUSE_VERSION_USE_LAST_SIG => signatures.last(),
+                    // Otherwise hardware fuse version needs to be subtracted to obtain the index.
+                    reg_fuse_version => {
+                        let Some(idx) = sig_params.fuse_ver.checked_sub(reg_fuse_version) else {
+                            dev_err!(dev, "invalid fuse version for Booter firmware\n");
+                            return Err(EINVAL);
+                        };
+                        signatures.nth(idx as usize)
+                    }
+                }
+                .ok_or(EINVAL)?;
+
+                ucode.patch_signature(&signature, patch_loc as usize)?
+            }
+        };
+
+        Ok(Self {
+            imem_load_target: FalconLoadTarget {
+                src_start: app0.offset,
+                dst_start: 0,
+                len: app0.len,
+            },
+            dmem_load_target: FalconLoadTarget {
+                src_start: load_hdr.os_data_offset,
+                dst_start: 0,
+                len: load_hdr.os_data_size,
+            },
+            brom_params,
+            ucode: ucode_signed,
+        })
+    }
+}
+
+impl FalconLoadParams for BooterFirmware {
+    fn imem_load_params(&self) -> FalconLoadTarget {
+        self.imem_load_target.clone()
+    }
+
+    fn dmem_load_params(&self) -> FalconLoadTarget {
+        self.dmem_load_target.clone()
+    }
+
+    fn brom_params(&self) -> FalconBromParams {
+        self.brom_params.clone()
+    }
+
+    fn boot_addr(&self) -> u32 {
+        self.imem_load_target.src_start
+    }
+}
+
+impl Deref for BooterFirmware {
+    type Target = DmaObject;
+
+    fn deref(&self) -> &Self::Target {
+        &self.ucode.0
+    }
+}
+
+impl FalconFirmware for BooterFirmware {
+    type Target = Sec2;
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 709afbe56c7f3b713bb249a022d68d81783d36f5..2f5ae89ab80b237eba5d55351229be78cd471a72 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -6,6 +6,7 @@
 use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
 use crate::fb::FbLayout;
 use crate::fb::SysmemFlush;
+use crate::firmware::booter::{BooterFirmware, BooterKind};
 use crate::firmware::fwsec::{FwsecCommand, FwsecFirmware};
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
 use crate::gfw;
@@ -293,6 +294,15 @@ pub(crate) fn start_gsp(&self, pdev: &pci::Device<device::Bound>) -> Result<()>
 
         self.run_fwsec_frts(dev, bar, &bios, &fb_layout)?;
 
+        let _booter_loader = BooterFirmware::new(
+            dev,
+            BooterKind::Loader,
+            self.spec.chipset,
+            FIRMWARE_VERSION,
+            &self.sec2_falcon,
+            bar,
+        )?;
+
         Ok(())
     }
 

-- 
2.51.0

