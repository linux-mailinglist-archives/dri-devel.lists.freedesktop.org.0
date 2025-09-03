Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53378B41650
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 09:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA6C10E3D6;
	Wed,  3 Sep 2025 07:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qAI2edrI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD0610E1FB;
 Wed,  3 Sep 2025 07:21:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sVYqTqXYErLsjyZ4dGLvz5LK/Ku5K2MEmyHq2fPl8ShNKiUgX5cbkBWUOOceZJXztl4Cy+ZA6oh1TvYTkAemLdq4v9IngnZLU373TexkOIkdeLLs0LctRKnsQWVUIgpOsntEE7O1tn3uz+feNEPzTuTRroQMn/2Y20+ImB9ESBw5oHqMXRP+f5SY81HRXx81A8gZUf6H7dOyTuCUx8Hsp7vdGe0IF1T5ZMqWMsPNPdfDfz673qrPNKymHFBAJJNp2F9cVqm/ibLV0KclNsopESzzEZk+w8xEnReu0SSV9NTuSw7koMFzx1SGZkKc3Xh2Yd0+1Hdzix/zJmWzKGSrpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qao3MHR0qcFVsnEIL5KMebRYsSj138zi0O/h33cYZiU=;
 b=YScIBgiGPoy2haLyarDVy3X8NQjBJ0nzP5Ss+iYH8Rj9io9G7lTmQplSi0p9CITeb1Zb/ndlfASIcgPLTVSBfDjKikz16t8Wp5xXC4GSUpYL3EplQ6MvNvnXHS2VmwvJ3FK4lR7bmeSmCK3AZw8d41DBLzh3tT1oBlSJfTgVbkoIKd61OvaE4NJaRVZEqJUizSq/uZ2/UOTiKX3/EpojAiiIkKX7tjIf0nkLf0nOt7AcfAaEhBuhGL5WxD71c/SGOiifuX7swxB4BxO2v9Fjkx2OUtGGd+Q8IuQsuS3u2aFCHqSGt5hMgC8cDDQKKv4F2afDTfUKUnCJ5aAfqKZXYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qao3MHR0qcFVsnEIL5KMebRYsSj138zi0O/h33cYZiU=;
 b=qAI2edrI4Dg6aT8rdmug9b4xAQD5yCQi4/pwKzA9ZMt9r3V/rkd5gziAO7ZxeKkUAwoe/HI6YRw2enBTUS50McxGiKQzL/o7eg3jwykBl8Ftrwc2BO22krECuzN+TSMSdq/9QrqeCfnEEtzcrFKGsnzvkdCdLxq9pZPMDiL7Ekx1pfs5OoDJueN9qlVBPAsfjRK+In91HXRWmlFHZX2knFw1xh48zKg1VN+mR2XUpk0y/R6WWCAk7pwE27lFb5zCpNELiH/sTVcmp1SayXGxBfEHJLm1PsMPpCO7F4xI5KlKf4Oy95mphH2Y7/KSZDLHHjiCC7CTBD2jjxNViA0NJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB6566.namprd12.prod.outlook.com (2603:10b6:8:8d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 07:21:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Wed, 3 Sep 2025
 07:21:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Sep 2025 16:21:48 +0900
Message-Id: <DCIZFT5QJ4DT.1XDNISKTQKK56@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 02/11] gpu: nova-core: move GSP boot code out of
 `Gpu` constructor
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
 <20250902-nova_firmware-v3-2-56854d9c5398@nvidia.com>
 <DCIKSL18GE9A.2R4BAGR56YVPF@kernel.org>
 <DCIZ5VVLACXO.1L0QTYM5YVRQV@nvidia.com>
In-Reply-To: <DCIZ5VVLACXO.1L0QTYM5YVRQV@nvidia.com>
X-ClientProxiedBy: OS7PR01CA0208.jpnprd01.prod.outlook.com
 (2603:1096:604:24a::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB6566:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b085481-956c-460a-6ad1-08ddeaba8d96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2dzSENVcWhhVWJpQ2Y5QUVRaVhtZG5GTlNKK1Blb2VIWWFBamJmbjNUaTRY?=
 =?utf-8?B?bkJHSFZrdWRUSzRwZnBTbnFNdkVRMWRqNnlUYlJhNVJTNU0zWVRYM1drR1E2?=
 =?utf-8?B?L1kvRXJPdDVUNW93VUoyK1UrWWJzRDhCVWRnWnQ5Tnp2RC9nWWRnM3dhdXE3?=
 =?utf-8?B?ekxMeGVXSjdIS25NRy95MS8xMXF6anY0MHMwWWRtQVJNaktmMlFMb2pmc292?=
 =?utf-8?B?Ulk2MjhSSk5WK2dRZTZ4M2lyaGRJbVh5QWZ4TWEzWFF2SFhBa29XY3FLSGg0?=
 =?utf-8?B?aXhvNjVZWk14bU0yc25UOS9HZ3UyQmFaWmkzSjhad0tLUXBlWWFGaUd5SkdY?=
 =?utf-8?B?a3dVbjVkRTVKUzdoMXVEWW92emt2NTZva25WZ0hEWWdrWm0zZ1k2cEpWY2c0?=
 =?utf-8?B?QUZGUnN5Z1ZXVTlCemNqajNBei9ZdUVsYkQvSGczcFRJMm1COGE5M3RiaEtO?=
 =?utf-8?B?QUZwT29EbXgrZ1VYcDJOMC9YSU5qN01rOEwxdW9lWjBmZnFtN09icHk0Um1P?=
 =?utf-8?B?bWoyNTBJTEVKaVZjTVlPZ3duNnlmNWFHWEZQeUdOSEZGTVFlUHhYUzNwYXpE?=
 =?utf-8?B?a1ArbFhsSVNQRXJVQ21WTHFaQWpaZkJXVW5qRGllYWZrNlFoaVIwelplYlRx?=
 =?utf-8?B?Z0VsbEMxdWFBZ0lRck5hamJKK09PMis1WmdPQjluclVnOUNHbElSNzBRTStF?=
 =?utf-8?B?ellMU3FKVXQ5TEJmMG9aUm5sbXNiWDBRa1VIQklsM2ZKbWNNWHhvYnh2UmhZ?=
 =?utf-8?B?QmEwSk1LSmtRRnB4WnVQRWxrNWl3MHdFYVN3czJFSUxiYnR4a0dZbEg1OXhJ?=
 =?utf-8?B?SVBmWi9GanZPaUNBSThLMHpTTzU5cWdRNDBvWWxzZ2pDLzZuVmFSNEVnNGxo?=
 =?utf-8?B?aVZmNFh5L2VyUVBiUm9WWUYycTFyUEJRMnRpZFFyem93clkySk5qMW56U0F4?=
 =?utf-8?B?VXRORGNOekRXZi9MQ1F2eWFnUmVhcUlJRzRabzc1Umh5MnM5dFMyMkl0VEg5?=
 =?utf-8?B?eDhTR1lqRkdPYWdsQTZzRDQ5MGduTVd5czFWaUp4WWdiN3hQNXFHSHE0amtJ?=
 =?utf-8?B?SmFLMFliWTlIa1ZQQ2YzVTBRYkNwaitRUWpFUTlWeE1KV0RiVHJiTmd5NXlq?=
 =?utf-8?B?V3dCWm1ZOGR4eHdrZ1ZEUjI0YnpXYlh6WGM5SHU3OUxtdmtMZmU3TllBemty?=
 =?utf-8?B?SzVzMzgwOEVPZS9YVHVTZ1JrQWhMdkN4UWJFYldWM0dPRk91eUxwM1NhUVZk?=
 =?utf-8?B?QlJtVTJtRm1iSWN2b3FCZWF2WjE4a3ppYUNrQmdYM0JtZDdmb0RMTVF5bFNl?=
 =?utf-8?B?YTVWVFNKU0FvVXhSbTZtTHpxRW92NVZ5K2hyc1VMcHRBRHpXMFd0WEMvUWNm?=
 =?utf-8?B?dUlFTDRZblNjNEViMldmMjZUNzhJQXpCVHpOaTJqUDgxUTVBZWQxdFpwUGJF?=
 =?utf-8?B?WVZoUVRQV2F3b08vNmg5dEJLeU9EWXdaTzR1R2VyZGJtY3VtcGxnK2s4dGhj?=
 =?utf-8?B?YkE0OUNTUFFvYkdNVDBBNk1mSlo3bGxNMWlBajZsSHoxRFEyUGtLRm4rOTI1?=
 =?utf-8?B?VmR2TkpzRW9qUGJjZ1NyY05BOEpUMWJDdTBHV09YcWtCc3JuamlFTjk2aExS?=
 =?utf-8?B?WXRKYzM2c2dQQ0NhK1ptUGpJVVB0RHJudmlVa3UyWlI2NlNqOUswWURaZUFm?=
 =?utf-8?B?TnBBeEM4YTBtTC9lNmJWZFIvUHNCUFlHY1M3TDBGeVpTRHFaY25wOVBwSVJN?=
 =?utf-8?B?U2RpWmpKWUZxczJoWE5SSXF1WGgzbWRUb0pJVkxXS0hCbHMvNU1jaWFsS0gv?=
 =?utf-8?B?c2x5eGlrbXJYbjhrZ2RMNDh4TnlEYW5BTUZpYStTRE9CYmxyaWNvNHE2dzVK?=
 =?utf-8?B?V1loV3BDME1jQ044N3VxUkordEtPdDFBTUdaV213TkgvWXBYMlpWSHgyRmVU?=
 =?utf-8?Q?J0LMAcpg8ZE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjRCTG1XQlkrb1BlUVp6NkNpeWV3NWRSd2d6dFQ2VFFJMFVBcnJ1WkVLOXIz?=
 =?utf-8?B?QkZlb2FqQWljdFN0akRZaVFZQmtLMExZNU12Q0t4TXdMZSs1cHVzci9iUzlu?=
 =?utf-8?B?RVRXSUlPeTJzcm42NVZpRmtGSVhMdGowaGg0TUdpYUxGKy91T2JBS1lBcURt?=
 =?utf-8?B?czZEOFBUbTdjWElLMTdGb3I4ejVVOCtKY0lIek5iMjR2R2xVTzQzZHpHbnR5?=
 =?utf-8?B?aXlaY29yeHVidm1pQVhhY0F0c25nU3RuSFJtTFc2d0ZmTUpkMTIvMkwvT0x1?=
 =?utf-8?B?a0UwbmFxYnpxQ04xR3F2T0wydGJYUHpCS05KRFYyWHB1YnVFU09yS0VhSWxo?=
 =?utf-8?B?c3NUenhOQWhsclhlMUw5L0hiakdYZ2JjOU1uUzdsVmhra0dERmEvcnN6VkVz?=
 =?utf-8?B?SWRXYnBkYVJJaHl1aXRWYzI4MnhlZCtvZ09lS3NIZlFjWHM1SGVBQVY1d0pQ?=
 =?utf-8?B?Q2pjazJObWNaMzFTU1p6Z0dYNnZublg3c3hRYVlYRkNXVVhPSW1tZkhrVWE3?=
 =?utf-8?B?QzNVWGp2MUlvSm83U3IvV1Q4QytBbnd1M0JQc2xMdjg2d0NUei9ITXEyRWJt?=
 =?utf-8?B?UEhyZUd0MzRZbFM0anBjTmQxTFlwWHArVG9waXBkRFNZTnZFejNyUThqTUhR?=
 =?utf-8?B?cGlWbjRIVGtrZjEyUUk4QXBITWhINHJucVQ0RVFCbFRaWEF6RnVRM2p4RkU4?=
 =?utf-8?B?NHJtUTNsTHh1a1c5S1dNUVg0cmgydXRvVDFxMmFMNjB1MzdrekV0dm95VWd1?=
 =?utf-8?B?dWYybHJtSDNBZ3pZVWdtR051UXlLbkFnQlJnQmpUeU55d1JFOGRVNU0wakJS?=
 =?utf-8?B?V1BjeEE1RHNPQlVDSUhhV2dlbVNRNVFiTlZOZ0lldlZDcEwxYXRsMGdjWmdX?=
 =?utf-8?B?cFFrTlBIaXNGa2RLckJGcE5NS1BlU2hpME0xQkc0Q3dMbDh0SExTZjgyMlVm?=
 =?utf-8?B?Tm1MTTM4TU5BYURJY0FkYStmb0h4a3V4T3pNZWxoS1VBZjQ5MkZhWVlVWlJi?=
 =?utf-8?B?QUpjTFpUVE1wWmlzWndmcmswZEVoSFZ2U1gxc01CZFM2SUx6UFBKUlJkZ3RV?=
 =?utf-8?B?dS9QWEl1ckNlN1JsS2tFT29EV2xCSEdyKytnSC9SMkxUTmlJcWlRUmlDTmJE?=
 =?utf-8?B?SjhaclBqWmRwVEtiSXdYUXVwcXJnRktoMTlLMWRTcXdLcXV0QkloYzVuNFJ2?=
 =?utf-8?B?Q1pDNGdKVTl1VUczbVBya05IQTRmeC9IZFIrS2QwazFqNDhYT0JuM0IvOGdI?=
 =?utf-8?B?MlBsaVlOVnY0d3Y2R1RBWkxITEFKOEExcUJXTlFGSC9yY2x2OUlwbXNIa283?=
 =?utf-8?B?UnBwUGFqWjhSbDVOalBSNS85M0tTR1Q1L01SNmFScW1xaU1zRk5iaC9GNHBo?=
 =?utf-8?B?UzdEM05sNlBmaG9wYXJGL3pML3ZqeFJselhOZENiK0RWNmU1UmZ1U1JxYjRK?=
 =?utf-8?B?MTRtc2JLOGRiSHYwdGlrcUQvdUdXZ05EVzRMOTVDc1MxVEQwSVlOVk13djVY?=
 =?utf-8?B?cnl3Z1ZiUmswQUJ5MjBOcUVtemVWVitvZ2I0aHJNMm84azV0aU5NUFZLWDAz?=
 =?utf-8?B?VE9wN2lJTHQ0UGJrN1ovdEdRejIyNzhxdklVaDVzZHBKMXBJWjkzM1MrSHVI?=
 =?utf-8?B?dXdCTjdmbHRuT2FuUU5neTVhZ2RTd1JlWHVnM2NqYlF2c2ZvS09seEVMZStS?=
 =?utf-8?B?b2VWVXduZURvQnJtY0F3SGRLdkxGNU8yTVhnNHBqeVB3OWUxK3gwdXJ1Wjht?=
 =?utf-8?B?aWdwOUh5aHVrd2MwOUhucUh0eXJ3Nng5dWRsRk05RWpqL2JtREdKNnVQN2h2?=
 =?utf-8?B?U1FqWCtncFZRYWxQOHFOZnRoMXRFSG5mTTN2bk1aVDRyQ1NESmZGak5UcUl4?=
 =?utf-8?B?K2t1WGhIaFRZbXhuMWVVVmp4YkYvSWl6ZDFvL1ZsOUUyUG1qL1dCQ0VGQjlJ?=
 =?utf-8?B?eE5sZ3hsYmxoTVRzZkIzRGgvWlJnMnVXMGZyMEgxTldCZG1HT2hmZERHSGF0?=
 =?utf-8?B?MllPb1krQmowR25tdGNKK0QrUko3MGhjdHhIeGRnZTZFQjd6d2lWbU5PeEsx?=
 =?utf-8?B?bUkyU0NPWHhmcU5DczdXSEJ5eExoRzVPNDhjNm1CS1dsZ2IyeUtDMFludmNv?=
 =?utf-8?B?Z1FrUFVCZ00wMERQSXJ1NVBsV1NKOWhTYUZVUzBkSmthN0tsQXgwZ2xiY3l6?=
 =?utf-8?Q?SoBeiIZkPtyp82hW8Jd/6twRAIvxHlHjuBA6K/FTbq6a?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b085481-956c-460a-6ad1-08ddeaba8d96
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 07:21:51.9475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LMwKrb1s6jPDurgl6lbT3nUY08Mf1Y0D14KaGLIvNVA9tx/gTU3yrud3FToj1ORISUir4Onw1kT2aR67NxklEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6566
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

On Wed Sep 3, 2025 at 4:08 PM JST, Alexandre Courbot wrote:
> On Wed Sep 3, 2025 at 4:53 AM JST, Danilo Krummrich wrote:
>> On Tue Sep 2, 2025 at 4:31 PM CEST, Alexandre Courbot wrote:
>>> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/dr=
iver.rs
>>> index 274989ea1fb4a5e3e6678a08920ddc76d2809ab2..1062014c0a488e959379f00=
9c2e8029ffaa1e2f8 100644
>>> --- a/drivers/gpu/nova-core/driver.rs
>>> +++ b/drivers/gpu/nova-core/driver.rs
>>> @@ -6,6 +6,8 @@
>>> =20
>>>  #[pin_data]
>>>  pub(crate) struct NovaCore {
>>> +    // Placeholder for the real `Gsp` object once it is built.
>>> +    pub(crate) gsp: (),
>>>      #[pin]
>>>      pub(crate) gpu: Gpu,
>>>      _reg: auxiliary::Registration,
>>> @@ -40,8 +42,14 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdI=
nfo) -> Result<Pin<KBox<Self
>>>          )?;
>>> =20
>>>          let this =3D KBox::pin_init(
>>> -            try_pin_init!(Self {
>>> +            try_pin_init!(&this in Self {
>>>                  gpu <- Gpu::new(pdev, bar)?,
>>> +                gsp <- {
>>> +                    // SAFETY: `this.gpu` is initialized to a valid va=
lue.
>>> +                    let gpu =3D unsafe { &(*this.as_ptr()).gpu };
>>> +
>>> +                    gpu.start_gsp(pdev)?
>>> +                },
>>
>> Please use pin_chain() [1] for this.
>
> Sorry, but I couldn't figure out how I can use pin_chain here (and
> couldn't find any relevant example in the kernel code either). Can you
> elaborate a bit?

To be more specific on what I don't get: I see how pin_chain could be
used to initialize a structure which dependent member can take a
temporary value (like a pointer set to `null`), but in this case `gsp`
must be initialized with the result of `start_gsp`, and there is no
"default" valid value for it meanwhile (I use `()` as its type, but it
is a temporary placeholder). But maybe I am just misunderstanding
something about how `pin_chain` can be used.
