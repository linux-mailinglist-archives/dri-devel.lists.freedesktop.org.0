Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D574BC3144E
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 14:42:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E0410E42F;
	Tue,  4 Nov 2025 13:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TzMqze7z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011007.outbound.protection.outlook.com [40.107.208.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D55510E5E3;
 Tue,  4 Nov 2025 13:42:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXd+/VzM0naGHv0J4LjrRx/lei+AhHixp30+babdALty6S0PhD3W+bBOhPTze9hziUhlTCgwTYID5J2wU6WrklBWig15nURBqMv5dZmH3pEvRS6nkAvTf0HuEQdHHx15Xkdvo2+/mTKiVavOumkgRCJo/VfnmQFb95q5YpNcKhmaar/DUKO6wHJiTe8ReNMY4kIQCiXsN8KsRvBLfIhIx0CjXD7YNQZdyU4ZM+b/VOAv82jyvuyETrOQdE3I9huaRvyLAT2lcMyY9is9mANgblyPCEn4Gqgik0dvZlsbwRgDlA8Kbv7tuTsRQnTOYMspEdQz7DaJIUKFgpWJ2DhASA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8NUd4ZOzrIZmgAIj0ElfrN/7sk/lWlBA1vS9hLkkbE=;
 b=meOBV1R4bO8Qs5VCZgYayvVq652F3lQCNg90s5dq58tA/kXNRJ2KhQ1NxGsCq/Joxt7CghlthIlfUEwJy3X02Rs1MawvnOf3ZqpjPyEdGSDYdNK71DwIXKFFtQZQUGA3XNqK+dVCAGw34gt7Sa71vgnvjbdVUd+kV4tm68yyn5PfAcYquHPGgs1dhnwiZRr+ecqaiQS5oz16rcNwB3/p7Vhzj1F27HS+gAE4wZsSVSzF5Qmdu0X6AgNMS2V5vebEEfQ3RfRI2GrgkVZuvhMTmxBb759L+a+hB/wa86XDdPPhEib6Jd4KpHsW9hRK17f6w9lo0LNW4sV+TW7ZAQO8jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8NUd4ZOzrIZmgAIj0ElfrN/7sk/lWlBA1vS9hLkkbE=;
 b=TzMqze7zyESXHi+6FME9mukBOyQF72JwCs4x8wXM+Itr/gt2TiQgy8Er47J/76nftosoDMadh2WmYQTBbK4yGL6LDNVLJ+rOMzoeJjrvGzsQsAZeHt5rSbH/4n3QoR930FSREH0ZEFECxzRzVcVghWVyehVaSIhCIt3xwXRz923ZG2PxN35RDNKevj+5V4OWKutDdr8ynVWTqZqkrTxxRWMiV/6aB0cc9dLUYirN0UaHvWrgnbi4whFcjw/A3Hu+kr3RmCI/hk/cSnX2Ek8HMDTCQpRghn6hrAdPAVssdFRz68819whmM9Q60MKR5lXf1oJ2Mc6JiXJ4SNWxaHuD8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL1PR12MB5826.namprd12.prod.outlook.com (2603:10b6:208:395::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 13:42:10 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 13:42:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Nov 2025 22:42:05 +0900
Message-Id: <DDZYCRCPYMOL.RMTIF0R404Q4@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, "David Airlie"
 <airlied@gmail.com>, "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Andrea Righi"
 <arighi@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>,
 <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH RFC 1/4] rust: clist: Add abstraction for iterating over
 C linked lists
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-2-joelagnelf@nvidia.com>
 <DDX1WYWQNTAB.BBEICMO8NM30@nvidia.com> <20251104005812.GA2101511@joelbox2>
In-Reply-To: <20251104005812.GA2101511@joelbox2>
X-ClientProxiedBy: TY4PR01CA0020.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL1PR12MB5826:EE_
X-MS-Office365-Filtering-Correlation-Id: f8ff2e12-3100-422b-f7fb-08de1ba7f36d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEJabUg3WDN4WXBmbWtEZ3NiLzhRMStwM1hQUGhYVkVzU3IwVkY3ajVJdktZ?=
 =?utf-8?B?Z3c0bkFzWVFkeGxiTTlpVG9pQytJakk3TW1sMWpzU3d4elIySVA4VGNOdnZD?=
 =?utf-8?B?MzJUQlgxSjNvbXpSQVJFZ1NRWVNrS2pzOGs1QXRQVTBydkNyQThEcExzTFJL?=
 =?utf-8?B?dk1CNUxWZXNpMXBtUEdQZXd5TnZkM2RRTXNNVUZVWWhTRmRhRjJFTVhzUkdH?=
 =?utf-8?B?czFmRitQemFmK2doeDh6Z3UyRlZ1QXhZV093WnJZUVAyRHo3NEhwK25aeFly?=
 =?utf-8?B?bTRLaHpjVy80NXhNOERLZWVtZUtKcnVXSmZYQ0JCdVhyYkE2cU1wQmpzVi8v?=
 =?utf-8?B?R1NmbEluOUU1Zm1VVnVnVnFHTGtMVnVaWG1HdjJrZVpjVzErMEpSczJGcDNO?=
 =?utf-8?B?K0txcUtoSGVJaGlvS1lZQWdQZ3ROWjBmMnFLQ1Y5dXdMcVMyeGlUaUN2L29j?=
 =?utf-8?B?bStlVHQ1T3B3cG1yY080Qm9vaUZCUFord3lsSHlSVHRXc3RLVjhSWEZYMGdB?=
 =?utf-8?B?N1c5UzF5SHJOek4weFBGeXR3YlVLc3JXcDRlSDVlM2FyQkNVZm5GMHFuZ2RF?=
 =?utf-8?B?WEJXRDBVUU83dkRidlJibjBsMDVPSlRibW90VjVKNEFHTXJ3QjVBaDNjb0dj?=
 =?utf-8?B?VlcxcjR3dkF3WjRVUG5FaHRHWGs0S0VMaUFvRHdmNkdpVjAzdVZ2UFVwdUhh?=
 =?utf-8?B?dHh5ZElVS3F6S3QzS1I0NW9DdjJpN2tJNVBzK1hHeXBNT293RUtzVjFYckpi?=
 =?utf-8?B?bXVyUkRraTJxTE9PS3lJVHlMUGZWNDkrYkZHcjhXejZPT1I3QzVMSEFFN3BZ?=
 =?utf-8?B?RHlmancvM2hsMW9IeU5TS1pkQWhxdDV1c0loRElIMUNSVWhhaWZPd1Y1UHg2?=
 =?utf-8?B?clJzU0RtL1VjTXgvbW9rOGt1eFdtOFl3VCt3RjJRdTZ3cUZibnV6MUhabDBa?=
 =?utf-8?B?UDkybWJrRWplMjRLaVo2U29KQVBZSXpoMk55TDlqRlF4UmY2OVVSTGJUT3Z2?=
 =?utf-8?B?ZDdOV05sYjB1Wm1MWGVmMWgrTGRpNGZRbmRhWjc3Y0pjN1lVMGYva0twOE1o?=
 =?utf-8?B?UVNSQXZCTEJpa0QvYWpza1VhVTZVRXhsNjRjUUpTdjhKeFdydUVzTUdIQUJO?=
 =?utf-8?B?Q25MaGNNbUgwMGNYelF1c25ZTTBPWnJmNnVQYnlkZzVNUTNwSDlreXl6eFQv?=
 =?utf-8?B?MlVmdUhMY1piTW13KzdUMjFxTzlsdnRaeSt5Nm8veWNCRmVMenpkdHJQQm0v?=
 =?utf-8?B?L1ZpYWdOYzJ2ZXY3dytMK1RvUTlsZ3puMzlXZlplcUdqVHN5RXlFb0Joc3U4?=
 =?utf-8?B?ZHY2ZXlJaWY4N3UweSsvN0hpM211WlZkQnlNUml5L1NGN3RFdlZCWHZHZ3Uw?=
 =?utf-8?B?V2RVcE1PUHlSbHlERnBPNlZJek5GWCtqZFFVcjA4U0VFc253d3BpbkMrczhl?=
 =?utf-8?B?T0djVDl0a3lxQVUyenZkUUFEaXVjUThUMWVKVW5BRXVERjBoVnBvSS9xYnBQ?=
 =?utf-8?B?d21pWE1SdlhpSWIxQnBOU083cndKQjFqaXZycUluNmNKYzNrdzVmTkZ2SUta?=
 =?utf-8?B?ZEVGZjAremxCd1FJclczblI2allEZ0FBWXVUZ1dwdVNBQ0pDQjhxSVpIaEZW?=
 =?utf-8?B?R2F2S0Z1eGIxdWJJemdyMGkzMCtrUFRMSHlMM1hsTU4rYUYxNytlR3EyN2Jl?=
 =?utf-8?B?cCtNb1YwK0x1WmZwSGVIVnFhbXlFTVZlNVk3eHVHdGhoY1ptTEpHOC9PQTVO?=
 =?utf-8?B?RklYUW05aDZXSlpHczVzTmFaTHpsT1gzS21GampwcTMxWjBWbjRXTlRrK3Fn?=
 =?utf-8?B?Yi8wQVdvWjdaWFV0dnRYcFQvTHEzQ1h2UmRzZGc0ZDZOM3d5eE5ZWTJGTXk5?=
 =?utf-8?B?WXp2d2xjdFRydTVKdDBTYXE1QTRSRTI2ZzNHUWs1T3A0bTVmRk1qbENkeDZI?=
 =?utf-8?Q?3MoYt+j74dhaydhvKCfnbJzT9E7Vgr7J?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVJjMlhwc1FzK2k0YkdOakRZQlpHNkVnU3UxcFY0UUE3cVV0MWx4SklUYW40?=
 =?utf-8?B?RC90b2RWRUNqc2ErMC9VZkRnVTM0N1NXc3ZwTjBiSm9yVm1RcTRUeGUrVE1Q?=
 =?utf-8?B?dTJGOGtIcGpPeFhvaXVnZ2tDZnNoOHp0NUxqek01eFpLNytKVzBPa3ZxQklM?=
 =?utf-8?B?eG5KU1Q5LzBnL0dhZGJiR2g5L01SbTJsdDRZRlIzSkRybnZ3MFVSR2tDajJz?=
 =?utf-8?B?WmJZM3ZMV2hOZjZTb1BhSVIvV0ZoNW50eVoxVlFpaGoyWjdleHhhMmdya2ZQ?=
 =?utf-8?B?R2ZVRlVxZlZLMkRYZnZ2OUxYL3RRbW41dk5oaDFnWjhEU3ZiZS9qalkrbU9R?=
 =?utf-8?B?KzliNDBmVVY2dHVDdUtlSVNCNnM0UHNRKzhPSFkvMTFjYld3VEh1VTVDellp?=
 =?utf-8?B?enBKVlZPQmV6Z3dqL2ZwY01TYXVWTXliUm5nWmNUV2ZOT2FOYkkwcHFJaTFN?=
 =?utf-8?B?a1poWVgzK3ZqdURpTFVPN0I5b2crcjlFT1ltYUZKb21WOHJnREQ4bTRxM0Rn?=
 =?utf-8?B?K1J1ZFNGbVpJWDdyRlVjY2tSa3hJMUFjWjFBL3QyWmRzUWljc1V1YUI1ZGJo?=
 =?utf-8?B?OWlMZGZFaURuUVFwdVEwZTNIeHloLytzenI3YUc2VWtzL1NkUkpnODI3eFkr?=
 =?utf-8?B?blpra3E3UTZlS2g4dDl0SWNjb2xVcGNDMzZFb255WGxpMS84RHgwVzlLSVhp?=
 =?utf-8?B?OGduc0tEWm5HdUVQYzA0U2hDK1hqMWFOZkIwVnc4cXlaamZGRkcyMW82TUV1?=
 =?utf-8?B?UDRJTGFzKzlkZVBmVm52aDg5VHNPTnhaUzUzNlFnZTgyeGY4TUhROU1zVkhR?=
 =?utf-8?B?V25naU1WMVBXZFdyb1prZU9KdDJIS01YK2NuSzdSU1lFVEVIaXRuUE5lZXBl?=
 =?utf-8?B?VmNuMTF3WTZuRXlWbnoxekxTaGd3L29HS3BlZkpqV01pSG1mSnN0MGxwWmZG?=
 =?utf-8?B?TStmWWdoS1lnZ3FWWmtyYXRmbWc3WkNlcUwyaHhCcUl2VFo2R3dFbmlaSDll?=
 =?utf-8?B?NUNza3c5UUs3VmZXVGVVb0hldlZtQjBHMXhSQUNjNitNRXdsYzA3NkZNTmdD?=
 =?utf-8?B?NUdicmF4MnRxWVJyRE5lb2xlckNYTk43T1o4T1dtUW5GbkxidjhCQVZxZzRR?=
 =?utf-8?B?TUN4aDVvR2d4K0QwcE1EOXlhMnFDVDQrZHh4REdVTG1nVmZRV0pBTFpWSnAz?=
 =?utf-8?B?MEExMEp5RWNkTkJSL2hjNVZzNnpETnA4NnVPSEpnNEMxU1pHdGQzVFRSeVFr?=
 =?utf-8?B?a2dsOVZwOFAwUjlRWkFBUXJNR09qYnBkamF6VnZ1bG5UbTRNQ0doRnNzbXFs?=
 =?utf-8?B?c0V5MlhsREZQYlpiNVJJVVl1KzlEY3ZleEhtMVFpWjNPeFRQM1ZvS1RZYU02?=
 =?utf-8?B?Vi9jeG93dGxndVFIUHk4MXozV3hlNkM1Q1FjTnZwbzdBeGRWbHFlU1lhM3hL?=
 =?utf-8?B?a2tEN2tDZmp5ejlpSHRJL3VqSnVFSEUvOE4rYXJJcHF6dktHaUlMd2lOZi9p?=
 =?utf-8?B?ZWh5T2Q0OFExRWdSWlZ5REczQzl3RmgvOCtzaDBUdGtKek1PSUoxb21TbGF4?=
 =?utf-8?B?MHdmMWpJSmRHUWR6Q2kxcGJXNW9lMDdzUnFlUTZaOFpBQmhVWk54SnZKL1lJ?=
 =?utf-8?B?U3pPNUdjc0x6cnRGT3VHaGE1NHZieHV5Nk9iUFh1UXY0MS9Ed0tHZnMwRC9w?=
 =?utf-8?B?SWlqSzBIN21VT0d0b0Iva0ZKQUgvSjN4STFMMEJFYTBnU3VacTJCdk5zVHlo?=
 =?utf-8?B?S3VPZEUxQzRoeEJVOXdaR1BUOUhoSVM1Q2RTRlRQQmdyVHl6TDI2NnhGbjdQ?=
 =?utf-8?B?Ymd2T3JZRlRYSUY1ZHNDYmVmc1lIYnR4NmZySEVGQ2JtSFl3bTFsTTY3ZFdP?=
 =?utf-8?B?QlBKc1ZjSkJaSXVWeXdiTWpsZTRJRmpFc25OOEphbDhGazZvWjYva2E4UExU?=
 =?utf-8?B?SkpnWjJBUVpwS0VWbmVJK3dOVGhzejBrUnpDOVVmSU1qTGhQbjhMTE9OM0FH?=
 =?utf-8?B?SEpxNUFLVnhDQ2RwZkVwM24wdXl2UHBLSXJQaUoxc0JxNnFFdmNKWmJDemlz?=
 =?utf-8?B?UFJuMWxhMC9xMkZDbnBGNXhZUkNJbTJpSkJaWFZ5NXcybk5RL2RaQzdYUEQz?=
 =?utf-8?B?eTlDTWRGOEtEVTBhbjhCUHgxNmpQN2kvUnBkdytNT2IvQnZ1UitJaFAzd2Zx?=
 =?utf-8?Q?0ecZFtwFgLrt/+yuC0tGKxNZ341DXAXjqD94U+sGFcW4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ff2e12-3100-422b-f7fb-08de1ba7f36d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 13:42:09.2470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53Cigc1bE6bu2InK6EQ+yk4CcjLbNIGDkP6bc16keuZLmO+59qmo/t/aiQnehHI4ACbBqCsl76HmrjwtMnKlbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5826
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

On Tue Nov 4, 2025 at 9:58 AM JST, Joel Fernandes wrote:
> On Sat, Nov 01, 2025 at 12:51:32PM +0900, Alexandre Courbot wrote:
>> Hi Joel,
>>=20
>> On Fri Oct 31, 2025 at 4:06 AM JST, Joel Fernandes wrote:
>> <snip>
>> > diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
>> > new file mode 100644
>> > index 000000000000..e6a46974b1ba
>> > --- /dev/null
>> > +++ b/rust/kernel/clist.rs
>> > @@ -0,0 +1,296 @@
>> > +// SPDX-License-Identifier: GPL-2.0
>> > +
>> > +//! List processing module for C list_head linked lists.
>> > +//!
>> > +//! C header: [`include/linux/list.h`](srctree/include/linux/list.h)
>> > +//!
>> > +//! Provides a safe interface for iterating over C's intrusive `list_=
head` structures.
>> > +//! At the moment, supports only read-only iteration.
>> > +//!
>> > +//! # Examples
>> > +//!
>> > +//! ```ignore
>>=20
>> Examples pull double-duty as unit tests, and making them build and run
>> ensures that they never fall out-of-date as the code evolves. Please
>> make sure that they can be built and run. Supporting code that you don't
>> want to show in the doc can be put behind `#`.
>
> Sure, the reason I didn't do it was there are a couple of challenges:
>
> 1. For clist, there is a "C language" component" as well in the
> sample, as these are lists coming from C. I am not sure how to do that as=
 a
> doc example, I might have to emulate a C struct containing a list_head in
> Rust itself. Is that something we're Ok with? After all the purpose of a
> sample, is to show how this could be used to interface with lists coming =
from
> actual C code.

Ah, that's a very valid point.

From the point of view of the documentation reader and the test itself,
I guess it's ok if the C struct is constructed manually from the
bindings as that part won't appear in the generated doc if you put it
behind `#`. So it will render just fine.

What I'm more worried about is that it might be a PITA to write. :/ But
maybe the core folks have an example for how this could be done cleanly
and in a reusable way (i.e. we don't want to duplicate the dummy list
creation code for every example).

>
> 2. For DRM buddy, #1 is not an issue, however CONFIG_DRM_BUDDY has to be
> enabled for the test to work. I have to figure out how to make a doc test=
 be
> kernel CONFIG dependent. What if the CONFIG required is disabled, is ther=
e a
> standard way to make doc tests not fail for features that are disabled? A=
re the
> doc tests skipped in such a situation? Just something I have to figure ou=
t.
> Perhaps wrapping it is #cfg is sufficient.

Tests are not expected to run if the config option of the feature they
test is not enabled - how could they anyway. :) So this part is working
as intended I think.

<snip>
>> > +/// [`Clist`] can have its ownership transferred between threads ([`S=
end`]) if `T: Send`.
>> > +/// But its never [`Sync`] - concurrent Rust threads with `&Clist` co=
uld call C FFI unsafely.
>> > +/// For concurrent access, wrap in a `Mutex` or other synchronization=
 primitive.
>> > +///
>> > +/// # Examples
>> > +///
>> > +/// ```ignore
>> > +/// use kernel::clist::Clist;
>> > +///
>> > +/// // C code provides the populated list_head.
>> > +/// let list =3D unsafe { Clist::<Item>::new(c_list_head) };
>> > +///
>> > +/// // Iterate over items.
>> > +/// for item in list.iter() {
>> > +///     // Process item.
>> > +/// }
>> > +/// ```
>> > +pub struct Clist<T: FromListHead> {
>> > +    head: *mut bindings::list_head,
>> > +    _phantom: PhantomData<T>,
>> > +}
>> > +
>> > +// SAFETY: Safe to send Clist if T is Send (pointer moves, C data sta=
ys in place).
>> > +unsafe impl<T: FromListHead + Send> Send for Clist<T> {}
>> > +
>> > +impl<T: FromListHead> Clist<T> {
>> > +    /// Wrap an existing C list_head pointer without taking ownership=
.
>> > +    ///
>> > +    /// # Safety
>> > +    ///
>> > +    /// Caller must ensure:
>> > +    /// - `head` points to a valid, initialized list_head.
>> > +    /// - `head` remains valid for the lifetime of the returned [`Cli=
st`].
>> > +    /// - The list is not modified by C code while [`Clist`] exists. =
Caller must
>> > +    ///   implement mutual exclusion algorithms if required, to coord=
inate with C.
>> > +    /// - Caller is responsible for requesting or working with C to f=
ree `head` if needed.
>> > +    pub unsafe fn new(head: *mut bindings::list_head) -> Self {
>> > +        // SAFETY: Caller ensures head is valid and initialized
>> > +        Self {
>> > +            head,
>> > +            _phantom: PhantomData,
>> > +        }
>> > +    }
>>=20
>> I am wondering whether `CList` serves an actual purpose beyond providing
>> ` CListIter` to iterate on... Would it make sense to merge both types
>> into a single one that implements `Iterator`?
>>=20
>
> It would force us to store iteration state into `Clist`, I think for that
> reason it would be great to keep them separate IMO.

My comment was more an intuition than a strongly held opinion, so please
use your judgment as you perform the redesign. :) I.e. if it ends up
that one type collapses completely and ends up being a almost empty,
maybe that means we don't need it at all in the end.
