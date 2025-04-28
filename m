Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD233A9F35D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 16:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FD510E545;
	Mon, 28 Apr 2025 14:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="grqfAkXS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2067.outbound.protection.outlook.com [40.107.212.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D00D10E51F;
 Mon, 28 Apr 2025 14:27:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vswjsf+3Dt7xEkZJAIkrPZYi83hOnhhx3wHUdfY3GZfiJtZtKylSIUhuy2pm3AVN+nUz3c3y7QqzdoHPx1R1CJNEOS6lWgyP2xFLzAZGWLL9y5TQr+cfli+ScdRj2oQzy2m+TwWJAohvWVHhHW+W0mdJNC6xu2vTOOI+5vuAQN55R1BRRyzfp1fgQqf/sD4sXQ7dAYH1uD4oatPAwH5QcrIKhnyCgtbOBbfXj5cY6tFVA7qcoal15TO9i+b2bxDBdFRw3iGu0nZQcH72CldsxEEPAKuv6Rb+Jc76/FoWQJY0/I2w5fKrW2ekXtWLzaPDtT+SFrSrts5lne8fGu7ewA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPVZc4KehBSw2gCQfabwlDq/MSJWxQp6TL5ZN942Z40=;
 b=TZmrsVzpKSvQB0eGfzh/iH0sXJga9LFWBkTf9mXs+zupsTOimMRRv1xhw8U70bQZyb03RMEP16GsjOuGvRoI8BPzDDRRAFRCHfdOhYVE2Z8jrAkaRgygebm+OGg2SZvMTx8C0cf7QiOLepuXzFZH/sYH3kDsnCjZi2VLj5lfI36k9+pP8Lz1j0Pf1KX5S8P/OunNNvt5UTJlP4g6OwGAniPtSIT2RZbaYQQMenBm5X7oi075E8rlhHwJJWpjFP/d7qye39AEwvloKNpfpl1Xa2/Tnv9AFofszmVGTUTYDRydLXjiVktjXjRodgPLFWh0Mb1FyepgtIorSMx5K7L+Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPVZc4KehBSw2gCQfabwlDq/MSJWxQp6TL5ZN942Z40=;
 b=grqfAkXSrrAev3Fr51cwBuOrCT7OirVZ+5t3VVakXVR5PoHD2Xd8RecZi4l21PeBy0ZYmX+b2s3kbcKNTJCUUJGFQXutcpc4UtOlHuE2pPlWgySfGTaQbJ47Xj9sFpnST2sKNrY1cFAK82e+naOtU5/J9W7+eDq36/m/WV3nGSPE6YU2grbTixm+4K4OHPJnqhuAGtk9OrjBZPxtmFPWAb5wcnIOfJ3QeJiJcmRaNCsHsmtXKI14JH58Z1LdiMTEZVpWcupOeWT17sj/Bbftti9NKMVOkuLh8Vu9gQnxd2H0xLGgdR/XmVJBE8pWthKZ7+qOso3x82vHicI04a9Juw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB5835.namprd12.prod.outlook.com (2603:10b6:208:37a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Mon, 28 Apr
 2025 14:27:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 14:27:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Apr 2025 23:27:26 +0900
Message-Id: <D9ICBZ1DGGVU.2AKUD3X883TMB@nvidia.com>
Subject: Re: [PATCH 06/16] gpu: nova-core: define registers layout using
 helper macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Jonathan Corbet"
 <corbet@lwn.net>, "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs"
 <bskeggs@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-6-ecd1cca23963@nvidia.com>
 <aAdvdczmQYBAS7vs@cassiopeiae>
In-Reply-To: <aAdvdczmQYBAS7vs@cassiopeiae>
X-ClientProxiedBy: TYCP286CA0340.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB5835:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bf375fe-729c-49bb-007f-08dd8660ce55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UThOZ2NWV2hxRDJmTHM4bjF1UXJnSzAxcElnS0habjJCUDN5N1NkeDZ0RmQ3?=
 =?utf-8?B?K0xDTi9yWVJ3WHk2V0hvYlVGSWdtME4zVUQ2dFJkbEZ0STU2ZXRMODQweTY2?=
 =?utf-8?B?bVcycHRua1lkVUw0clVMWVNvYjZHY084MitkRm5SbHBqYjFnZzBuQm1aZ1Ez?=
 =?utf-8?B?Vkg5Rk5nUTh6cjRlb3orcjBUbG90bnJVcGZLcHFmL2VRM2RFWmlIUGNpeVpV?=
 =?utf-8?B?d05vUVR6elRKODRyL09lZXY5bmRFUjdPTi9INWU5RXpVbTVFcndFTkxienhT?=
 =?utf-8?B?M29CVGdPeU9PK3NNTmFwTDVYWEt4Z04zczIxRUZYZmhHQVhIV2lFTDBpSGtw?=
 =?utf-8?B?ZnQxRFpqWGVvY3YvYm1EVGlSc3lSeFRwTkpWeHJCMGh3Q3Z1cnZwaDB5ZVh1?=
 =?utf-8?B?QjhqbnhMZlh4SVU0dnlXcHlydjlsZUpmSWFmR2dtaExLRVVDSHJUWWgvaEtl?=
 =?utf-8?B?TS9ZREwwbUUzVXFMT1lFZnhrMGZyR0NOVEY2dHBKeDF6bmJ3K3Zaa3ZEcFlu?=
 =?utf-8?B?UEhvNjR0bDZjdzBFazZLU1VuYkE5bmhlUnVGUTd0T3VJZzN0UWZDWDYyWkVL?=
 =?utf-8?B?WWNWM3R4WDAvZktIVC9oWUZUWUw2dlo2a1Z5dE5USGFnT1c4TjhWWVJJeGVJ?=
 =?utf-8?B?aEFiT25UUjJVVlpkRzRaUUo3WjZKL0hlYmxJRGtIa3QvMjlDcDd2Q1kzbjFy?=
 =?utf-8?B?NVU3NEVZZVZPa1g4N21xVGZSdlI0TWprWDh4Q0x2NGlhU2dyS3JHREh2S1dN?=
 =?utf-8?B?aitWVERhbmJIR2pMcnJ3STdLbkZGS0hoZXBQaXZveDhtbmluMkpJOXMyQURp?=
 =?utf-8?B?R1lmVENCRG95ZzFmNzI3L1EvWGlYSmtMdndwcEZxMXNDdWVsaTQ1Wnk0eWph?=
 =?utf-8?B?KzhhZVFuU28xUHo2NlNpeXZKOW5xZXZucERWWlhyMWpHYUpVZ1RvOTBHaFhw?=
 =?utf-8?B?U2JVYVpWaHNZaTM1LzgzeXcxQjNObVp0Q0VZb1ZKRFJvQmZ6NS9VRG0xa3NX?=
 =?utf-8?B?YUV0UHYwTkt5RzVBSFdxMnJSUlhEWFN0TGpUdUFtN1dnZDBlUUpvQWdjdkJo?=
 =?utf-8?B?aWxXUHVrSEdzMUx4bWw2M2pSQnZnUGlsR0xiL1pVT24yMFYxYzF1cVdVL2Zx?=
 =?utf-8?B?MXVHeDM2dnM1aHloTWRzcUgrK2UyVTQzSlFQdVZYSXVpYkZNUWlNTnVFeTlL?=
 =?utf-8?B?ZzQzN2QrNWYzUms5d2ZzeTErVjBpbGl4SDVjRHplbCtaaWc2M2wrZDBGVGlB?=
 =?utf-8?B?cUNscUV6WG5wMC9qNWlLRFRzQmdkRzFNMUFZUVpVdVpaMi9HVUFDYUI0NFRL?=
 =?utf-8?B?NVJUdFBkMUhTYlJyc0FtRWtPdVRhMGQ1bDd4d0tGZFI5M1k1MC9iOGF0WUVk?=
 =?utf-8?B?NVFNNlFGRzRqNmhGWmRualZodS9SSG1YT2Z4R3BEdm1tWktWUGVqR2dmYkxo?=
 =?utf-8?B?YVhHSnNibU05SWkyamlFUXBvaFg5SDFWS3pwU0F1RWNjamhDbUpiMUNaY1FP?=
 =?utf-8?B?dXBjdkhvaXdxK1piVnE2aE9aemh6bk1SaFhVY2hvSWw5YnVDdnBiUEhuUERu?=
 =?utf-8?B?ZWJ2RGhFbXpoVE1mVGt0bXlKcXYzMGtSUzdFMlRBSk95ZVlRalp4Zlp2S1Bi?=
 =?utf-8?B?eGlHVWtlSHB2T0pFWEpib2I2aUZFdHhPM1NsVEhqb25lZDdwMjJDSzFJNi9n?=
 =?utf-8?B?WkdmNmxQeW5QcytSMEgxdW9pK3Q2bDQ3U0pvRDk2eEpIQzhMWmdnWFJNZG1F?=
 =?utf-8?B?b0l1WjluVVZWOXRjMGI5Y0xDbWVmZHRFNFBUUnZVL0lhTkJlMUNNaDNMdnRM?=
 =?utf-8?B?Wlg0TmJuclQ5bkdUYXdWd1VORytYbWltR1hia3NLTkFlWFhkTFVyNk1KTVc3?=
 =?utf-8?B?QVRRVm1HT2cvLzUxNm1seTE3NkdHTElGWnhOSkk0cEZxMVVUMDZncjZ6WTg2?=
 =?utf-8?Q?bPdYuAg1vDk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnFOYUVUdFFZalpUVGtjTDl6T2VrUjN2TFdJRElGMjlwd0NTU0FFQ2kzbEdZ?=
 =?utf-8?B?V1liY1g5aFBQVThuSXJmZThpc2ZBWHVianVoR1VTNnBZcXIvcWpjajRDMVll?=
 =?utf-8?B?U2psbzhFd1FCdUp3NWZGWkI4QjNRS0w1ZmppUTY0Qm5ONUk5cGNRN0UrbVVo?=
 =?utf-8?B?eG5QNitlY01Wc2RqanBwQzltUW1hSUp3WXQ2QmlXRExyUElPWE1XQzRtVVVr?=
 =?utf-8?B?SVc1OW1NUlcrUFBDNVRvb2lUNDZXSEhkeEVvVXJnbGh3cVR5NktXc0lSRjZK?=
 =?utf-8?B?a0V1RTFIbTNSOGdYYlpqdFJCUVF6bGFFeVJoUDBqQ1BjNjFkM3d4RnZCS0cv?=
 =?utf-8?B?YlJIZVgrb1VCWWxaK28xZ2dIR1VPOENYUDZQWERRTyt4NGVOTEc1UXFHbXMx?=
 =?utf-8?B?SlFjS2VrS21SQjV3NGlKam5iR05PaENiaGQ4OUtJNDAvUm1XQ3d6eEQ4ZC84?=
 =?utf-8?B?UXpsN2FONFJHS0l2SUE1UDl6K0s2ZlNYekZRcndFM2s2Z25GeGp4SnhKY3gx?=
 =?utf-8?B?cmV5SnNyZ3o3bWhCbEpBbm5ORXVQc0p0UUVETE9NV21jcGJLOEoydVhTZnpK?=
 =?utf-8?B?Z2J2NUxJbENjN091MmYra0xWVkxiWmZqNTRMTitOcEJ4a2RQdmhYMU1vQXJr?=
 =?utf-8?B?SEpFR3JNVDByQWlnTjRWSlliRFA2R1V6Q1p1ZXFBWmdibUh3WW9ucDNkSUdl?=
 =?utf-8?B?NXhGaFhvUmt4TS8xUHNDaEJIYmZGR2Qwek04U0ZibXE4b2VhQkdCTG9aOWJp?=
 =?utf-8?B?UjE0TVF1OHlpT0h2RFdqL3U0dENBUXdQWWNJemUya2Y1b1VIYlZHT2ZNNElq?=
 =?utf-8?B?dWJKc2VNdkdla1Y1L1pyQjFiUy9jMTZ3aXk2WVlpa1cycXlpSFdxVFJra3FH?=
 =?utf-8?B?Q2lrL2NpQ01NVGJDaU9jNGE3c0NCT3hkb3FpekxaNlhVRWVteGZ6MXFRcEVl?=
 =?utf-8?B?NmlpZk5HWDBQekZ1dnRpVllRY28wZ0ZpaWd5MkUyK2RBeG43RFRzYU5PMHAr?=
 =?utf-8?B?MnR2dVo5MTlXSERMUDFnSDZMcnNYM3NIRE5yNm5LeDkra2crOEwvYjgyMkF5?=
 =?utf-8?B?Qkt0WDJiUWlBL0N2cms5Vmp5OW5OQ1R3MjFtd1prYWUrZmlvaVl6VUdJZFcz?=
 =?utf-8?B?RWRPM0d4RnowVlBCQzhnU2JjSTRqeElnbHFMNm55czhKZU1JK2dqcGpaanUz?=
 =?utf-8?B?MHRkVTVnb25ReEp0bkpod2NQRnhIK1VtOGdNdFJVZkRQRGMzNFprOUliNDIr?=
 =?utf-8?B?RTRyNFdBWWhWckNUNmp5bTJKQzdwRktqNHk1cThMU3BGYVdYODc5bVJtNjZD?=
 =?utf-8?B?a1M3UHBTM1ErZVFVc3pBTnNIOTl6MFpDU1N6NXV4UTl4MlFmbXNyK2RMWUhW?=
 =?utf-8?B?K2QzRE5PenJMcHgvbzBrNVlkckR2dW5ONlZ4ZWxVbktROFpTZzdzbEQxK1Mw?=
 =?utf-8?B?OTRIQ05kV1JxbFBvVndKaDJFa1BiaC9lMTdCUngzQnJzRHBzK0g1Wk55blV3?=
 =?utf-8?B?aUZjVk1UMlpIS1RVQnJ1VnovSDNycEVTSnRFcTJ5L2syblRjMFBxektEajVW?=
 =?utf-8?B?d21ISXQyT1pKL2NEWm1JaU5kdXBvRk9xdHcvTm9YWGgwajNUUkJURHhqWFJv?=
 =?utf-8?B?MmpVS2V5RzdTbTEzbC8rUEZuWkpwUWJ6MlI1K2tCWVJpTHI4NzFiSjdxKysr?=
 =?utf-8?B?Wll0b3ROZDU0eHAwNnpqbGwxeHV3YytkMW5zQWVoTE9hL0IrZDVGUlduY0tq?=
 =?utf-8?B?OXpGWi96UjRXUGVuaUk3MkF0WmtFcyt3VTBoNEV2blI3S20vV2NuL2dVQkR3?=
 =?utf-8?B?NnhnbTZWU2xEVW9wZzRkaTFCdVp6cGxNZVlzU2tnejBYWnl4dUh1MFVmMEJa?=
 =?utf-8?B?cGJNNU5zWFhGZmtiUURBeEt1TkNnSkdtZGw5MHdlMDlBTWxmMkp4R3FHMFR6?=
 =?utf-8?B?aFhZVG5xbWdDOWxCTW4zTG5zY25mODRXQk9FYzB5MmQ5aHRNU2F2dnhEclZt?=
 =?utf-8?B?WDNUaURtblVvdDlYZDZEQ0tXUms3amFEQ3NOQ3NKYk55RXhsS2VRRDN5blMv?=
 =?utf-8?B?QWc5dkhtQzBxc3ZWd25VcVdLcjlhb3NPdWhtTGx3VkRGMTgwaFdzbWR4dTFF?=
 =?utf-8?B?eXNXK2sydVBRNGU0YWJ3TTFOOERyS0d6TGYxczgyMVYrZ09FcDg1clJrRU45?=
 =?utf-8?Q?yq1PpqsrKy0daQ8+phCnviRehwIYlMXEjrW3piX5eh/k?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf375fe-729c-49bb-007f-08dd8660ce55
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 14:27:29.9034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oznL7NMnACOZ/eoS20Wy9qwkSn97A6RGO4DjHYRfD1lKgiC3b507/EILKZZI+zVUXjcZktm0BRV5w0TvAPb2dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5835
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

Hi Danilo,

On Tue Apr 22, 2025 at 7:29 PM JST, Danilo Krummrich wrote:
> On Sun, Apr 20, 2025 at 09:19:38PM +0900, Alexandre Courbot wrote:
>> Add the register!() macro, which defines a given register's layout and
>> provide bit-field accessors with a way to convert them to a given type.
>> This macro will allow us to make clear definitions of the registers and
>> manipulate their fields safely.
>>=20
>> The long-term goal is to eventually move it to the kernel crate so it
>> can be used my other drivers as well, but it was agreed to first land it
>> into nova-core and make it mature there.
>>=20
>> To illustrate its usage, use it to define the layout for the Boot0
>> register and use its accessors through the use of the convenience
>> with_bar!() macro, which uses Revocable::try_access() and converts its
>
> s/try_access/try_access_with/

Fixed, thanks.

>
>> returned Option into the proper error as needed.
>
> Using try_access_with() / with_bar! should be a separate patch.

Agreed - done.

>> +register!(Boot0@0x00000000, "Basic revision information about the GPU";
>> +    3:0     minor_rev =3D> as u8, "minor revision of the chip";
>> +    7:4     major_rev =3D> as u8, "major revision of the chip";
>> +    28:20   chipset =3D> try_into Chipset, "chipset model"
>
> Should we preserve the information that this is the combination of two re=
gister
> fields?

I've tried to reproduce what the current code did, but indeed according
to OpenRM these are two different fields, `architecture` and
`implementation`.

There's also more: `architecture` is a split field, with its MSB at a
different index from the rest. Right now the MSB is always 0 but the
lower bits are dangerously close to overflowing.

Thankfully, the macro doesn't prevent from extending its definition with
an extra impl block, so I've done just that to provide the correct
architecture as well as the `chipset` pseudo-field that will be the one
we use in the code anyway.

>
>> +);
>> diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-cor=
e/regs/macros.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..fa9bd6b932048113de997658=
b112885666e694c9
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/regs/macros.rs
>> @@ -0,0 +1,297 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Types and macros to define register layout and accessors.
>> +//!
>> +//! A single register typically includes several fields, which are acce=
ssed through a combination
>> +//! of bit-shift and mask operations that introduce a class of potentia=
l mistakes, notably because
>> +//! not all possible field values are necessarily valid.
>> +//!
>> +//! The macros in this module allow to define, using an intruitive and =
readable syntax, a dedicated
>> +//! type for each register with its own field accessors that can return=
 an error is a field's value
>> +//! is invalid. They also provide a builder type allowing to construct =
a register value to be
>> +//! written by combining valid values for its fields.
>> +
>> +/// Helper macro for the `register` macro.
>> +///
>> +/// Defines the wrapper `$name` type, as well as its relevant implement=
ations (`Debug`, `BitOr`,
>> +/// and conversion to regular `u32`).
>> +macro_rules! __reg_def_common {
>> +    ($name:ident $(, $type_comment:expr)?) =3D> {
>> +        $(
>> +        #[doc=3D$type_comment]
>> +        )?
>> +        #[repr(transparent)]
>> +        #[derive(Clone, Copy, Default)]
>> +        pub(crate) struct $name(u32);
>> +
>> +        // TODO: should we display the raw hex value, then the value of=
 all its fields?
>
> To me it seems useful to have both.

Agreed. However this macro has changed A LOT since this first revision,
and I have used TT bundling to make the rules a bit shorter. This makes
the details of the fields inaccessible from the rule that generates the
Debug implementation...

I'll probably try to rework that later, or when we move the macro into
the kernel crate - meanwhile, I hope we can be excused with just the hex
value.

>
>> +        impl ::core::fmt::Debug for $name {
>> +            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fm=
t::Result {
>> +                f.debug_tuple(stringify!($name))
>> +                    .field(&format_args!("0x{0:x}", &self.0))
>> +                    .finish()
>> +            }
>> +        }
>> +
>> +        impl core::ops::BitOr for $name {
>> +            type Output =3D Self;
>> +
>> +            fn bitor(self, rhs: Self) -> Self::Output {
>> +                Self(self.0 | rhs.0)
>> +            }
>> +        }
>> +
>> +        impl From<$name> for u32 {
>
> Here and in a few more cases below: This needs the full path; also rememb=
er to
> use absolute paths everwhere.

Indeed, thanks for the reminder. I hope I got them all.

>> +            const MASK: u32 =3D ((((1 << $hi) - 1) << 1) + 1) - ((1 << =
$lo) - 1);
>> +            const SHIFT: u32 =3D MASK.trailing_zeros();
>> +            let field =3D (self.0 & MASK) >> SHIFT;
>> +
>> +            $( field as $as_type )?
>> +            $(
>> +            // TODO: it would be nice to throw a compile-time error if =
$hi !=3D $lo as this means we
>> +            // are considering more than one bit but returning a bool..=
.
>
> Would the following work?
>
> 	const _: () =3D {
> 	   build_assert!($hi !=3D $lo);
> 	   ()
> 	};

It does! I can even provide a useful error message. Added this check as
well as the one making sure that $hi >=3D $lo.

>> +macro_rules! register {
>> +    // Create a register at a fixed offset of the MMIO space.
>> +    (
>> +        $name:ident@$offset:expr $(, $type_comment:expr)?
>
> Can we use this as doc-comment?

Oops, I forgot to propagate it somehow. This is fixed.

>
>> +        $(; $hi:tt:$lo:tt $field:ident
>> +            $(=3D> as $as_type:ty)?
>> +            $(=3D> as_bit $bit_type:ty)?
>> +            $(=3D> into $type:ty)?
>> +            $(=3D> try_into $try_type:ty)?
>> +        $(, $field_comment:expr)?)* $(;)?
>> +    ) =3D> {
>> +        __reg_def_common!($name);
>> +
>> +        #[allow(dead_code)]
>> +        impl $name {
>> +            #[inline]
>> +            pub(crate) fn read<const SIZE: usize, T: Deref<Target=3DIo<=
SIZE>>>(bar: &T) -> Self {
>
> Not necessarily a PCI bar, could be any I/O type.

Indeed, renamed to `io`.

>
>> +                Self(bar.read32($offset))
>> +            }
>> +
>> +            #[inline]
>> +            pub(crate) fn write<const SIZE: usize, T: Deref<Target=3DIo=
<SIZE>>>(self, bar: &T) {
>> +                bar.write32(self.0, $offset)
>> +            }
>> +
>> +            #[inline]
>> +            pub(crate) fn alter<const SIZE: usize, T: Deref<Target=3DIo=
<SIZE>>, F: FnOnce(Self) -> Self>(bar: &T, f: F) {
>> +                let reg =3D f(Self::read(bar));
>> +                reg.write(bar);
>> +            }
>> +        }
>> +
>> +        __reg_def_getters!($name; $( $hi:$lo $field $(=3D> as $as_type)=
? $(=3D> as_bit $bit_type)? $(=3D> into $type)? $(=3D> try_into $try_type)?=
 $(, $field_comment)? );*);
>> +
>> +        __reg_def_setters!($name; $( $hi:$lo $field $(=3D> as $as_type)=
? $(=3D> as_bit $bit_type)? $(=3D> into $type)? $(=3D> try_into $try_type)?=
 $(, $field_comment)? );*);
>> +    };
>> +
>> +    // Create a register at a relative offset from a base address.
>> +    (
>> +        $name:ident@+$offset:expr $(, $type_comment:expr)?
>> +        $(; $hi:tt:$lo:tt $field:ident
>> +            $(=3D> as $as_type:ty)?
>> +            $(=3D> as_bit $bit_type:ty)?
>> +            $(=3D> into $type:ty)?
>> +            $(=3D> try_into $try_type:ty)?
>> +        $(, $field_comment:expr)?)* $(;)?
>> +    ) =3D> {
>
> I assume this is for cases where we have multiple instances of the same
> controller, engine, etc. I think it would be good to add a small example =
for
> this one too.

I'll add one.

You probably won't recognize this macro in its next revision. I've
finally read the little book of Rust macros and hopefully it is looking
a bit better - the definition of register fields notable should feel
more natural. All in all I think it is definitely better, but that
doesn't necessarily means it will be easier to review. ^_^;

One note, as agreed on Zulip I will rename all the register names to
capital snake case and disable the `camel_case_types` lint on the `regs`
module, so we use the exact same names as OpenRM. I will also make sure
that the names of the fields match (but will keep the accessors in
non-capital snake case).

In parallel I am also prototyping another design based on ZST constants.
If it works it would allow a few more things like register arrays, a
more natural way to perform I/O, and would remove the naming convention
issues since registers would be accessed by constants which should be
named in capital snake-case anyway. My hope is that this version will be
the one we can use in the kernel crate, but I don't think it will be
ready before a couple of cycles at least (if it works at all), so in the
meantime let's keep refining this one.

Cheers,
Alex.
