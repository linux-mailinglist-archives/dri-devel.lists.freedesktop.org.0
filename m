Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6E5ADA854
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 08:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4452210E2A7;
	Mon, 16 Jun 2025 06:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KcbCcVXa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E22810E060;
 Mon, 16 Jun 2025 06:36:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+w/3lRfCOYXprmQzP4Ib7Ereejq+khAtDeok1DHYKAzjITyeO8mEW/4HOyQZSh321y0Y4JC4vNnRp+G/6LStBrMwiIBvbhNn3ZYiN7GYcMrnboFid6X9pJx7KL0386iGkgQfjn3eQA41PUxnE0xcLO8LDT8UkKD/4kjRxC986QBfeK4Qm3pbDsFrg54m34g46EUjDaA0KtAcRiQb3U2SNJlF4EK8yaiiVYD2o8++opHU/MTpGFfG/T6O2aRgBaem4/iZdILQNn1A2j7Q57DsyUnzT9PLxhoO/yd+8oEYy691Cq6W9NQLOCFVYOGKKZIrIqmJU4tsqPPeaGse1fAkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GrQP2J5plnBLK13OYrG2M+UZbEc+D6zEBOh1z8gKMi8=;
 b=N709rjss6KMcyGvHWX1ylwrNIpgF9SwuHIaUZ2PRDUD+83U3oT7ymAXdsDrHjbtyMPmi20Hjn2nKxNgKRY7I6lgSxI7sXp6Bgys9lqz5OcnAHxf8b4IeAGLFuT+gf9GWBAhs3mbcfDmssEZ1dx8ZwOGNf2WWeOF4KPk0JKsBkOlZ64a7X4iavYaq1EGQxVM1fuIANYsxGzyhm5vM4iob0le1VriSLssl4Cz7KrLr3SsX/3mnWKU9uZ18dgcMJSVnDzF/EwDsQUvRrATZvDZaQEYy+fRuEMNby5RTqcCmRPnyAfANypPe5O3h4F1iHh7pW+iF/XsRjuzajw2e/0Vcow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrQP2J5plnBLK13OYrG2M+UZbEc+D6zEBOh1z8gKMi8=;
 b=KcbCcVXa85sB+QO7i8Y/Os6EXea3pUylOsbt+6b78AcEEEYdm8aL5s7zLL4Lt/bb9bOauyd014kw45aWWI6ydy0oaeFcmWy1mgHx3yyfrtOPy4U1GLPAUx2XuidZVCNKR0l0Oi+YaXTBl5dA9gqY4h2tPpwM/wAAwZVh36FRWhatAiPy0+A2vD8F3SrG3akRA2AeWQ5Igez2XkH/aUKI0WQkke4TFV8WIvB+uAA2cMvG13UXcoQKhtTwXgAwxc12A4JxbWxibs8OEm3NPqxYeFPBaeyMUsqZE9AxY7p9wSPjBUujFATu/E8IIdpdqc9LfVDWS8c6nqQNS7LGEYXXvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB8027.namprd12.prod.outlook.com (2603:10b6:806:32a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 06:36:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 06:36:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Jun 2025 15:36:42 +0900
Message-Id: <DANR08O454U7.2VTTLNPOTD6U@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Benno Lossin"
 <lossin@kernel.org>, "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs"
 <bskeggs@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 05/23] rust: num: add the `fls` operation
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-5-14ba7eaf166b@nvidia.com>
 <CANiq72=3nDR=J2OXu9nWwZW_kcWfZ4KhZ3aS12_dcB=1EP2icQ@mail.gmail.com>
 <DAN1SGG5DPVE.UUW0B523LQHO@nvidia.com>
 <DAN1XS7Z0AFO.3S7PRNH5FWWV4@nvidia.com>
 <CANiq72mpFX2pSuy7JU+Xb_6fCkEA96er6Rsg0bVv+wBBO5OqUw@mail.gmail.com>
In-Reply-To: <CANiq72mpFX2pSuy7JU+Xb_6fCkEA96er6Rsg0bVv+wBBO5OqUw@mail.gmail.com>
X-ClientProxiedBy: TYCPR01CA0182.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB8027:EE_
X-MS-Office365-Filtering-Correlation-Id: f41ed769-0b93-4ccf-4cc2-08ddaca029ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVdxTlRFbmo5eDFoQi91b09RSkwxbnczd3YyYTIxY2ZyYzRKZzk3WVcxOFZH?=
 =?utf-8?B?bDFsdjJ2VnRhVytmTkVMYndSamp0OFJrU0dGclExdERGeTlPUjM2Vm1QUldq?=
 =?utf-8?B?SUwzaGFBVE84Rzk5VDdUNlUyM212UHphMzJDZkpJSTAzZElKVHVpWlNtTWV0?=
 =?utf-8?B?VXZzbnpVWTJyWFdwT292bEFlVkFFcGVWZTEyb2k0c2loYlpCV2xmUWhYRXJT?=
 =?utf-8?B?bTJtbEtNWnRZdFhVTWdWbDArSVRoU1grQnNVUERYK2dGaVZOOWtERkxCaE94?=
 =?utf-8?B?cWZUQzZCTmowT2Rub001MENQbHBIcGU4WVo2R3ZpR3V4NU85d0J0ZEtxL0dw?=
 =?utf-8?B?M08xNVYzdVlXekRRZ0ZKMVp4OUZGc0M5Z1FkRzRVa2h4dElsbWx3Z0pyNDFX?=
 =?utf-8?B?QnlzL29tS204YTRoY3cvZCtRbXkzQnlXVVBvSUlXM0NQU0NYR0FHV2JYb2JJ?=
 =?utf-8?B?c0ZMOW5LTmxQMUlEV1NSVEVhRnZIMmhoQTQvY2lOVEJFZ0VlWXRpQU5wb1lK?=
 =?utf-8?B?Y2FlUkxJMHR5cSs5aEszYURMVGRCZ2pjc203bmdIVHAwQVhaWnZCZis3cjky?=
 =?utf-8?B?Snhkc3RsZmRLeXQ2K295cThESG5lL0JjNWhwTkw2YVBRQk04cVQ5K2hDUGlo?=
 =?utf-8?B?dUNVUUlFeWtxMmNGWCtDSVZ6UEJUcmxUamEwQlpoeE1OS0RsRGZEWjNxajNM?=
 =?utf-8?B?MnFzbDJjYUQxTHBydFBDZ3VYa3MyNjE5U0tmblVKWE5tQy9BNWlScHdDaVZz?=
 =?utf-8?B?ZGhJYUsybmRLUmtRWkFCRENOWFNvT28wWGc3YkpkMDZXdyt2RS9SSkNaOTYx?=
 =?utf-8?B?SUZwMFhic0kvc09UTXRraXdGYlE4WUxPenIrcnBXN2UvL21CY1ErSkxjV2pt?=
 =?utf-8?B?UjRZYy9OOFlOTkdIWDBaK0ZQY2xCZDZtaWc0ZnV1MWhBeTBLTHJxcUllYUF0?=
 =?utf-8?B?djdabnhVeGZydTdqb0E0UHh5NEVvUDRaZ2Z2N0pValV6OXZsTkRqeWNQVEFl?=
 =?utf-8?B?Z29CWUtLZUV3UzhTbys1YlU1ZGptRDVTQyszbnRxL21zRlV0cUdNYU5sRisr?=
 =?utf-8?B?dmMyalR0U2NLVmV2MWFYaUhpQlU0eTRyQVA0OHBTRlViQ1J4M3VvNjlIc3hn?=
 =?utf-8?B?ZWVpTHAzRUdSMnV5dE9uajMyOW9CdDd1TWRza2F1QmRjRFA2MnJXVmJpYmxl?=
 =?utf-8?B?UDFDL2ZIM3E5cHJtY043b1VudXF6UkZGMFJiL1lxaWNJUWMzYmhaNWxHd2FX?=
 =?utf-8?B?alE3YlRWSGY2ZEF0WmlzVUlqOGtTcXppRzRnRE01U0FRZ2pCNHA5dExMZEVL?=
 =?utf-8?B?ZkhvYUw5UE9xREdYV3prL3RnUTlVSm5uUkRVU29SWTZqMXN0aUdZL0ZLYjJn?=
 =?utf-8?B?c2praWY1eDdmSnZjUkFLY2VpbDI1V2dzcHRpdWUwQWhjRFhBckhtVW54azl4?=
 =?utf-8?B?L1lRSGRURmhpbWdiOGpLSDlOTjY4MERyQzcxOFcvc21qV2p4QmFSVXRqbHp1?=
 =?utf-8?B?TEtqOVpaeWh5UzRSSVpvdlhGUnZjTGI2anBVdUp2WHVmVnRJb2ZSV0wwNmNZ?=
 =?utf-8?B?R3l6YWd1bVNTUFhUeFM1dDlwejViSGpOcll5Q21XVnliblc3bjI2d2VIOTFU?=
 =?utf-8?B?WHJqN3lRa2V0ZHpBLzJYc0RtaDAxdlEyUkREYlVhd2p4VE80cit5b3hydXhZ?=
 =?utf-8?B?SkxVa2F1QUg3VXhoMkdSemdvNDRyN0VaN1E0UGsvaURndkswZGlESXRKNUYv?=
 =?utf-8?B?Y2kwSE5VMnkxb0l0Z3paK1dMTDI2WGhKeUVlWC9QM0pIM2ZmU2pZUXAweEVE?=
 =?utf-8?B?S0Zhc1I1TStqU1Zac2hsTEduZVlJOFA0UVdHTFgyQmM2ODh2OFo2NEZSTVBG?=
 =?utf-8?B?UWNwMWlXc2RHODJBTUU0cTJvNG1iYk1vWk5Tc3JyOHZOTmJlL0xmOVlqYmhC?=
 =?utf-8?Q?vfR/LZ2oLDo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anNQRGV3SDBUUmZQRjdjNHpoZGJnTStpb3lKM1hOWllGK2gwdkhsZTcyYTVL?=
 =?utf-8?B?UjNLUmUrVVkySXRkNXVwQ2lKYXNaNWlVSHhQRThLMkJkUlREMlF0V0xwRGFk?=
 =?utf-8?B?R2pVeTBSUGRTMGVMeWY5SEszcmtGTng5bXFTVXRHSnZXWmlKc1dFa3orOWFm?=
 =?utf-8?B?eDZORzZTdlVvK244SnV0NEI1em4rTGVvazBwdStuU2xNbUoyaEY4QzNUWnJ1?=
 =?utf-8?B?Z1Z1WHhKVmZ1aWtDTk41ZXZ4QWtHaHF4NUd4cHNwRHR6eTR1UFpjY3dobDhG?=
 =?utf-8?B?OE8xWThzRUExWDFzMEhadndqRXlUY1dqYk8raVF3Q3c5WkhrWE1TSU5TMEtK?=
 =?utf-8?B?c01RbVZwRzg1cnJmdk1NbFlkcVRRSGphMzREN01GMSt4cnVULzdEL0QySjVU?=
 =?utf-8?B?WEQrbFl6WDVHcUVTSXN0SVpweVFaVnpNMzZEVWRERGJBOUdueUZNNzBFL2Zx?=
 =?utf-8?B?OG54SFRoc2JQNkdVdWR4RWEza3dDOXpnWlZqYWoySFpRRTVoMmVnZU9zamFE?=
 =?utf-8?B?ZGF5NitYampjMUMzejFJVmcrc2R1dUREb0liRE1DbExNRG81VlBSYU53Qk1Q?=
 =?utf-8?B?S1ZpYStBU1kzaUdXZzhJZEFlV01wUW1SY0pNbU9yZFcrMWEyK0lINTNRYkVv?=
 =?utf-8?B?WGdJekxoTS9JOEFQalFQWXRIYVdncDRMY2c3KzlsY2FYVnlVZGFyeVBwRUlq?=
 =?utf-8?B?bStnMzlXVTRTUS9RUEpRSS9mTGFwRUVMcU5wSWdkOE5LUFhQeStHMW4xZ1FM?=
 =?utf-8?B?T3VEOG4rbVBhT0JFTkp4Y1MwWmNQVkZuRnRSK3d1bCtJdkYrSSt3VzhGQ1pD?=
 =?utf-8?B?VHh3TkVHOUh4YUYwTDAvQ1hXMFp6cjBuMkRnbklDUFJIMHBJWjdvVnJFWjBr?=
 =?utf-8?B?TDJRNVBPMC9pd2V5UC8vZWFhKzZ6QUREZGw5REp2YU14Q1RzZUdjeTZZMEdx?=
 =?utf-8?B?TW9qa2JmRE01SVJNVlE1M051VHJlYVg5N29uWWcxd3grektpUGtiSG9sTDAz?=
 =?utf-8?B?eVpDTlNRY1VYODJEeWRLNDQvNXdtQzJKVGhDVFloNU96OGFVdVZ2VGZmTVJi?=
 =?utf-8?B?aW1kaThnNGpXbE1DcHFPTUNLYWhtemJDNGQ3eUZ2Q1FOLzg2U3BCb0xZR0VG?=
 =?utf-8?B?c0RKT3FRNUowUnFqSU5nakV1ZzV0U3JBZzBpeUFHSjRZWDdqSkhscExHNW1Y?=
 =?utf-8?B?dTR6YmZzS1crQUc3aVBqYTlHQ1IxV2taY2YyZG52cGNDTExyRXVtTDFCWXNQ?=
 =?utf-8?B?TENDcU9DaXlXRXVlaEx3UHFQOWhKcEduOWdpemp1ZlZKa2VtR0xML1FzTm9o?=
 =?utf-8?B?NTRjV1NVSEhkb0Z6LzBBTGZEeTBJV2ZsWTF3cW5JaDJRenRtQzZ1MmJ2S0Fr?=
 =?utf-8?B?eGFsMUN4NTdHdFJESWlEb293M3U3ZVcvaytkQWpKVndRaEFXTEF3bUdrWG9x?=
 =?utf-8?B?RVFkc3RPVXlXK0d0K2p4MTdmYzV4YjFsWURQNE1vUEhRWjRhZk5NdkZBY2Fu?=
 =?utf-8?B?aFpTbVRWUXYvVTdaU0dzZ0hsN1ZMME5PTnlXTi9CbmNMSTVtOVcxMWJjZnBN?=
 =?utf-8?B?Q3htYVkxUzh2WE05RjRScWRaUXE0VFFJM2hjWDV0VjJoc2g4WW8xN2RoQVlF?=
 =?utf-8?B?cHlkS3U3a3R5b2RpY2dUMzgxcHZuNFlMZFIvQXBjTEdvYURBZzErQlN3U1VO?=
 =?utf-8?B?a2lRT3lTRUlZNlMwbzJHN29IWFFIUUY1c0c5WG15U1NSMm5iMGtSZzM4MEZU?=
 =?utf-8?B?QWlLdGhUaStxU3o5MEpxaGF2eWJaRUZZem5WeFpGYTVwd2JXdHd3RXNQOGkw?=
 =?utf-8?B?djhMZFZnKzJFQjdzVXhKZUk3cHdvR1FraVNIbTkxamRiNzNzVmUyNmF2bzZo?=
 =?utf-8?B?QTFhcERMdXZBNkQ3Q0d4anQraVAxcVhWRlZ5THVVY2xzRmVQRmNtYTBLaE96?=
 =?utf-8?B?bys0dFBpb1VLL05JL3J1SHNKZ1V6Wkt4VkJOU3R4d3pjVklpRDlvSjRqRzV3?=
 =?utf-8?B?dm9nUU9wRHNLK3NHcVZaSGJldm9aUzRwVXAvdUcrZTNXNlFyVEZmUHFMc3V6?=
 =?utf-8?B?OWpnbWc2WXJnZVpJVitBVkp2cGV2bk1vb3JvRU40dm9ZUU5LMm5va2VEejJl?=
 =?utf-8?B?YS9RakNoc2R3bnhuTlAzWDM1MDNaV1hrbUltdWQyc041QU5qZ01jYkpHZmUw?=
 =?utf-8?Q?ibKbAhIS+gDX5Gzu/wTuKnqttZRLH80MaYWkmmcK6ymf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f41ed769-0b93-4ccf-4cc2-08ddaca029ae
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 06:36:45.2163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FP38QwCl7nq5e/Sa2PNsSjF7AzMETrLEDdGb0SKZREc8Vr6YBgDQF/SK+xwIEgxdQZDhOUEyTlWjlPfJUE77jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8027
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

On Sun Jun 15, 2025 at 10:25 PM JST, Miguel Ojeda wrote:
> On Sun, Jun 15, 2025 at 12:58=E2=80=AFPM Alexandre Courbot <acourbot@nvid=
ia.com> wrote:
>>
>> Also, although this will work nicely for `impl_fls!` which is a single
>> function, I'm afraid this won't scale well for `power_of_two_impl!`,
>> which defines 6 functions per type... Any suggestions for this case?
>
> We can always generate the same "cases", i.e. sharing as much as
> possible the lines, and just passing the values (numbers) that
> actually differ, which you then plug into the example line
> concatenating.
>
> The standard library does that for their integer macros, e.g.
>
>     https://doc.rust-lang.org/src/core/num/int_macros.rs.html#3639-3644
>
> If that happened to be too onerous for some reason, then we could
> ignore it for the time being (i.e. we don't need to delay things just
> for that), or we could put them as `#[test]`s to at least have them as
> tests.

Thanks, this appears to work quite nicely (if a bit verbose), and I can
adjust the tests to avoid the need to take extra arguments.
