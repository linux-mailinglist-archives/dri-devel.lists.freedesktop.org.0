Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EF5AD8F22
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 16:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3F310E9DE;
	Fri, 13 Jun 2025 14:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lIZBr1Y+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2049.outbound.protection.outlook.com [40.107.95.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D0210E9DA;
 Fri, 13 Jun 2025 14:16:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQkFgyQhvXJj1i0bG3+HHLpmnewb8LNQhmRzS/xwoYfFUBIGuo78PxFigblm0FQSO28gF3yqY6lDNVN5gHRVO7jzhsC/Dpqlk4diW56I8ICotrajiqWOYv06+YVU1X32WQwcfqIqYbC3eEJacwySbKTSibpwOP/NYzXn8rfcJWr+4+Sac1P0DFzsCG5Wsuq9kbPQ5u6W960I3eyAFIeAwvKtZs/AsFFmSXqqnr0RrdN0uRQ6PzELOf0/tSDurQXMP/40D+8HolenwZ1RNQmgCi+vGKvAgYOcDvzghV0SUcychZ6wRuO6WzJta8xgmsHNE+XmuwpsvfZpIo9mdDvwPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+iAreg8rNyRX77tlTfIV4xV6vzcab1XMnf7PNNQTTus=;
 b=nPtof24OSnP9LSugyE22pr9VsC/Xzp2l9W08DiqiS2xJG5Jn2bdMFnG+WIXH3UMR7ief7Hr5mHV9LovKW+tkwMDmHrkVVWAlkcmnhQjADH8ZREknYDNEY01ntdGToUBeQK4xj24lbB3w79sHZLPb92bvzL0e7O872QdGA5zgeAc8ugwvEci9nbv8hIjNwWXeOLhEf6U54DGewzbElESwkPTOtWVojg8SJSQp36Y9ulXiV0t/P12/xy3nONP+ZaXtvPP/Kq9e5lxligq+qgcHnthj+CW+w60qFMUgxiEemutsrcT5NWUz9CGWiHTP9JY9VpU8HclaX37i6f4Q0qs5cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+iAreg8rNyRX77tlTfIV4xV6vzcab1XMnf7PNNQTTus=;
 b=lIZBr1Y+gzIirAnc/3rXRjp0Rs/Lcs1FuC4CbNAx4npYi8u6NvRx9BhimvO6zSYyBURnYeXn/bn6VdzDgX+iIyqUfymp88A2xRAdOwy6oiiHT/wo8KrzJLdjSBmD1i1ilWsqzGwYrzrOVJy04bjIVYjT5peRW8+NBY1UUwb/Sls3KfQtDIo4gP1U5pkVFSG+pRy3VxVODOmYEJgS7otC6aqm1CXwMeuYmtTQ/7lOi+VZu9/d7uefYWdFS3SgjRizLRg2UswCxdO6X2ISI6Yw5P7nr3DJwVZ4ZvsPqvA0BMpj3Wg4RJwk9ArXGwyD3P0WJe4xInBaQPI5pA4Lf1oASg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7355.namprd12.prod.outlook.com (2603:10b6:510:20e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Fri, 13 Jun
 2025 14:16:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:16:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Jun 2025 23:16:10 +0900
Message-Id: <DALGWEM3TD3O.95L77CD6R62S@nvidia.com>
Subject: Re: [PATCH v5 04/23] rust: add new `num` module with `PowerOfTwo` type
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Boqun Feng" <boqun.feng@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Benno
 Lossin" <lossin@kernel.org>, "John Hubbard" <jhubbard@nvidia.com>, "Ben
 Skeggs" <bskeggs@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>
 <aErtL6yxLu3Azbsm@tardis.local>
In-Reply-To: <aErtL6yxLu3Azbsm@tardis.local>
X-ClientProxiedBy: TYCPR01CA0023.jpnprd01.prod.outlook.com (2603:1096:405::35)
 To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7355:EE_
X-MS-Office365-Filtering-Correlation-Id: ba09e14e-f250-47df-a9b0-08ddaa84da53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUUzVlg3S0N2SnY4VGVROGJEUlIvcUs2ekQvN1Qyb2N4VEF5blVzS2E3N2ZE?=
 =?utf-8?B?MmJ1S1ZxMDU5ZTgyM3pUZTZmdUp3V0ZVYnh5SXM1OG95aUlTVlBEUVFScUF3?=
 =?utf-8?B?dThFZmRIUGJjbVZDd0h2NHoyRHJ5OWE5TWQvZStXTWM2T3dGMzdESlpPNGVn?=
 =?utf-8?B?TlVlMlpaQXNMUVpTbVlFU2FRKzdsakJ6bm5yQ3AxeHdEQzM2bGlCbGJOWTFh?=
 =?utf-8?B?b1BGYUhTVW1NNjR4K2JTZHFJOURiSW1nSGNvdUloYW12SDJ6T3R2Y1lKb2Fm?=
 =?utf-8?B?VThpQVRFQUZ0VWJPWk1tWldQMTZJa1ZGcDRTRWJZNzN0blJzKzkwdElQMjJs?=
 =?utf-8?B?ajZEUzA4L0NlZyt0WlJ2MnlFNUxaTWg3ajI2MTF5Q21NQVlaM05rUHBnSEtu?=
 =?utf-8?B?Rk1Yd25Sakl1Vmoyd2UyaGhSQ1lZN3JwSFhiWXNmOTdOV1NXK3Q2RlBZdE1E?=
 =?utf-8?B?dVcrMnhRWEN2UFo0RW9FT3hCK015WnorYWpKazBHMzY5YkV6M1ptbkZnRGlV?=
 =?utf-8?B?K0hjRlBpblJLZ1VQT0xBWWg4eUJmRTFick1lVVEyMUtkM09qbERCZWZXaTRm?=
 =?utf-8?B?Z2xrK3l3bzljNnQzL09UUFJJNjltVC9JZi92MFJNMXdkS3YrbFBNWXhtNEU2?=
 =?utf-8?B?S2tZWWFBbitYdjc5SkF3WnlHa2xXd3AwVWl1cU9kVS9YbHFSbWgwbFc0ZWF2?=
 =?utf-8?B?Um52MXlTU3FGRVMwOFpNbXlucFlPdURFeUFWVFRDdEhra0wzK3U0RzFHL0RI?=
 =?utf-8?B?QVRrTEhkMHFoNG5vTkN4eWZCdlcwdkVWRlptNVNsNjI0eXJQdVNlWGFMQ0Rm?=
 =?utf-8?B?NDM4TkJpTzROc0VPZENEUTJFanJMKytJdHZXdmxrSjFqZGZhcTdCMThGTkcx?=
 =?utf-8?B?OHREMkRNQzRjTUM2Q3oycmNQdnlSS083NXF2YzN0UFcyZWlOb2NDMTdDTjVS?=
 =?utf-8?B?NWZxQUF2dmNtVjU1UC9TTElVZGpVbUFVUXZ3STBjSFZPSmE2anBDNkwybGQz?=
 =?utf-8?B?aEVnTGYwWUFDd1I5SlQ4dzNKWGJ4djE1QmxkZXJBeWVSVTFrYmpSY1MrdU9D?=
 =?utf-8?B?V29KaE1xYjVZRzB3SGlGa1JJTXQvM0E4SzJsZEZJaFcrZThCWjZ2cysrb3g3?=
 =?utf-8?B?cXh3ZldBMjFuZHZ4ZWxGVS83R2VEbFF3a2dXNm9FUUtyVktBVlUxaXY5Skpx?=
 =?utf-8?B?Ukd4QWIrM1ZXdXg4VzBuM3IycTR3TituYnhlVTJHeFFvR3FIZGRFdE4zQ0VF?=
 =?utf-8?B?NGhJSzRMcjJ2aDNTbEhnR2ZSbTJtVzg5QlVkTEJmSHRscnY2ekdyelJNQzdi?=
 =?utf-8?B?VktmYjF4dlBkSnZsNHRaWkFyVS9YcjhLZFBoV2RoeHdVaUdMVm1sNFZNZ1J3?=
 =?utf-8?B?aEFvaFRyYU5KNFJPYkUyalB5VEZnWmNiVHlRU01MdzJVQ2tzRlp0cGVNZGlN?=
 =?utf-8?B?Mzl5VXJlOUd2b2l1L3VwdGFQYzU4QjNzRFZmYzV5R3p0OU9PNnhXV0F5dGxy?=
 =?utf-8?B?ZUM0Q0krak1GcXFob0tMZjFmaTVkUHdxZ2tPWHNJN28yV2RQb3g3WUtGeUQx?=
 =?utf-8?B?SmFXb0FESzQwaXlqcFdTV0VCdEtYRmtIOUgzeFZEc2h3K0RRS254NkdWN3hH?=
 =?utf-8?B?VWo4RXU2U09aZUJiYWF1eW9FcmxXbEpGcElseUZ2NFFFOXhmTlgrSDVoVDNG?=
 =?utf-8?B?WnlaSEJ3T3FVU05QRmVJRmZlQ21TRHdCQWxsVkE1WTNtVnRMYlo2RXEzTExr?=
 =?utf-8?B?OFBWeXNra2d5MWc4REVleFUvbVc0UHBtOHl4OUtWd210NnVuVG1PeEgreUw2?=
 =?utf-8?B?a3JTaUo2VElNUWMrNnFqdXh4ZXNzVmRtS09BUU0vU1poVFdYRWdYYkJZbFI5?=
 =?utf-8?B?dDFjNlZSNW1OOTl2VisxTTc1ZytMMVlQbm8wZVlzNmZQR0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2dsNVY4T2xYWnY5clhVN0phUnhNd1RmR0NmOFZzMlJJZFJEUEhjVk5OQjEw?=
 =?utf-8?B?ZFNma0k4Q3pxOVM3dWZFb2FIeDRCWXEwNWZLTkJUblplenJ1RU5LY2lPWkU1?=
 =?utf-8?B?dVA1L3JJWGNFWnpzWWt2U3c2QUJsTWVHZnlWUU9qeXk2Q2FqczBNRXh6ZmYz?=
 =?utf-8?B?b0RTaDhSalNBRUtBOXdRbmRoMmYvQ253V3p2cVBGUUxPd3llZW9LbFRTaDJu?=
 =?utf-8?B?MFIwOUYvU0pFcnFaeTBrUkQvSDBmZXhoRWt5Nm1MNS9FdkdyanFpWDhxUUVB?=
 =?utf-8?B?cmV1bWNUNmZFTDQvejQxNUtlZE5YbERmaVNhK2hpeGhxcTFKVUdyUVlibmNT?=
 =?utf-8?B?dE1VQVN5NWNyYUlpQUJIdWxwWXZvUHRnMlhPN0RXRWlkT3pzNVBqNkhmSlE1?=
 =?utf-8?B?UGxBU1RqYk1rNmExa0g4R01VNExJbEE5TEFVbnoranhCeXQzdlVkdDlyellL?=
 =?utf-8?B?dVJFWTgzR2J0UnllTlo2OXowWGFyMWVHSXdiNmRTblU1RWNiaElZdWwrQ0du?=
 =?utf-8?B?R3hCdDZrblFLSnB4RHkxQmFLNDIycjYxRHNWU2R0VVl3bFpxZUdnRGw5TjNl?=
 =?utf-8?B?WXN6Nm1Uc3FuaHhjWmV0a2JvMjcwV1g2WDkzODZUWElUczd6ZmE4OERKUkJ4?=
 =?utf-8?B?L2l1dzJSTlZFb2hvbXVmZUl0Mm44K0k2c2wwV0wzOW5oa3JwaVBuamtyK0lZ?=
 =?utf-8?B?VkZyK0hsM2VPRndscWdTRnIzOVBJZWhNYlV6UC9qMUVmUjNSbTI1WTRpNUZn?=
 =?utf-8?B?OEdiMHRFanBxeHBQbWNnaGZoQk9XMXQ1Z1N2Y3djb0h3WTNmTjNLZFFlNG85?=
 =?utf-8?B?a2VwWERVa25XcGs3MDYraHhhYXpLVjF3T2R0UHJyZ1VPek9UclAzR0tlZlVj?=
 =?utf-8?B?YWFsK1J2ZDN1SDdMd1NCQVU3cWw3cHNGOC9CeWVKOStxbXBwazFQNUhaVGpL?=
 =?utf-8?B?c3liQkl4dHVMblM5a3N5YStxQVlDN2Zrd2ZJRldWYnRzUS8vVEtyWEszRmpo?=
 =?utf-8?B?Ni9QNEQyNE5MbDZQbE9NOXcwNVh2MDdzWjhRTXJsYjVVWXpvSnlockNCMGN1?=
 =?utf-8?B?c3dPMXF5a2NTTmhHcTN5OEFmcW5yN1UzK1Q1dkpWZmxET21say9LcGJWY0xU?=
 =?utf-8?B?cDBqc0MzTTJaTnRSTjlVZHlMczdIbWM5M3JQUzVtdnVNemRTa1p3VzNya0RL?=
 =?utf-8?B?NWRVSFB1N1hZaTk3RkxzTWg2OHZWMlIyZ0Jiekcza3JFNzNSQS9weWlwWC9h?=
 =?utf-8?B?bVFUR0RqQmFyQ0VFYkFNUU1aSm56KzhvYXNGYkhhS2hWNTJJd3p0S0ZjU3hi?=
 =?utf-8?B?VWdaNjBWbnk3ZzNvUkdnYzJUUEpxV2wraU5CaytUUXJqWjBpMi92Y3BsYUxN?=
 =?utf-8?B?SXhHRVVxN3VBblBlYnN1K1lzcE9peE1BNEFGS0o1V3FxaGJ0M21iMjU3ZU95?=
 =?utf-8?B?aXFvT1VqMWRWTzByajFYUDNoOVpCV29FQlczUmdDU0cwaWZ5cVNFRkJTbS9Z?=
 =?utf-8?B?dmpVWnRPVXlRSTdxSG5naDNKNDVOaVYrWjJMeEtJS1VmQzZRR1NQdGw0cDVu?=
 =?utf-8?B?U2VpR210aXdqOWNaYXkvam9KUzQwdkVGMjhoREg4TVlrVGVqRkQwZU5nb0x4?=
 =?utf-8?B?T1FVRzMvODVYZ1F1dzY3VGRSRktXWVFmakltemVqcGg2OEpOSzlvMmtjTjZ1?=
 =?utf-8?B?eXhycVdURnlTUFl5SEwzczhkN1Zsd1ovNUFTVzdHRzBrOXU3cERYbFBHcXRy?=
 =?utf-8?B?UmVoUFJDZXhuS3ZWaWh3YUYyOXVBOGk0VjdPOU8ycE9CdXliSE1MZndjb2kw?=
 =?utf-8?B?SXlxTGJicWx1amVvZ2RnOC96eTl4dzB0b0FaNGFQZ3pWWHNPZHladm5DTFB5?=
 =?utf-8?B?NTRFSW1VM3FLUEFFcUtvZ1ZZVExTVWo5cTRWTjIrVXpncnpOK3FJbUErQmdi?=
 =?utf-8?B?Z2JTT2JYOW1oZVZrZEU2Yk5MUDJlNmM5VVlaOHphYXVBNk8rdFZpK0hycDNY?=
 =?utf-8?B?bUhiVVplWk50dDdpcVlWUGZNT1pqUzRVUURYWm44YUViS29pMmMxcUJLRnhk?=
 =?utf-8?B?eWdYbWdUZkZENktrcWhuUGlkMi9JSHZ2UVBiblZXa2RPUXlQTnVxV2ZvVTZi?=
 =?utf-8?B?cUJUQnBqYy9BRkYwWjRDaThWdG02Z1cvOHRENnNzRUlJZCs2Smh4UFY5MCtj?=
 =?utf-8?Q?ePT/4IXd7dT5MPZs55SPR2K+C6N7Xc06n5ZkizvxNqbG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba09e14e-f250-47df-a9b0-08ddaa84da53
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:16:14.2188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Ml4aOgRSxt+oFgpDL4dyrq14c1SujbKGCqYcCLSpyz6laCsVDtDYEQWm5lofeeaQWT0DtvJstrLJin8xgGUAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7355
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

On Fri Jun 13, 2025 at 12:07 AM JST, Boqun Feng wrote:
> On Thu, Jun 12, 2025 at 11:01:32PM +0900, Alexandre Courbot wrote:
>> Introduce the `num` module, featuring the `PowerOfTwo` unsigned wrapper
>> that guarantees (at build-time or runtime) that a value is a power of
>> two.
>>=20
>> Such a property is often useful to maintain. In the context of the
>> kernel, powers of two are often used to align addresses or sizes up and
>> down, or to create masks. These operations are provided by this type.
>>=20
>> It is introduced to be first used by the nova-core driver.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  rust/kernel/lib.rs |   1 +
>>  rust/kernel/num.rs | 173 ++++++++++++++++++++++++++++++++++++++++++++++=
+++++++
>>  2 files changed, 174 insertions(+)
>>=20
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index 6b4774b2b1c37f4da1866e993be6230bc6715841..2955f65da1278dd4cba1e427=
2ff178b8211a892c 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -89,6 +89,7 @@
>>  pub mod mm;
>>  #[cfg(CONFIG_NET)]
>>  pub mod net;
>> +pub mod num;
>>  pub mod of;
>>  #[cfg(CONFIG_PM_OPP)]
>>  pub mod opp;
>> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..ee0f67ad1a89e69f5f8d2077=
eba5541b472e7d8a
>> --- /dev/null
>> +++ b/rust/kernel/num.rs
>> @@ -0,0 +1,173 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Numerical and binary utilities for primitive types.
>> +
>> +use crate::build_assert;
>> +use core::borrow::Borrow;
>> +use core::fmt::Debug;
>> +use core::hash::Hash;
>> +use core::ops::Deref;
>> +
>> +/// An unsigned integer which is guaranteed to be a power of 2.
>> +#[derive(Debug, Clone, Copy)]
>> +#[repr(transparent)]
>> +pub struct PowerOfTwo<T>(T);
>> +
>> +macro_rules! power_of_two_impl {
>> +    ($($t:ty),+) =3D> {
>> +        $(
>> +            impl PowerOfTwo<$t> {
>> +                /// Validates that `v` is a power of two at build-time,=
 and returns it wrapped into
>> +                /// `PowerOfTwo`.
>> +                ///
>> +                /// A build error is triggered if `v` cannot be asserte=
d to be a power of two.
>> +                ///
>> +                /// # Examples
>> +                ///
>> +                /// ```
>> +                /// use kernel::num::PowerOfTwo;
>> +                ///
>> +                /// let v =3D PowerOfTwo::<u32>::new(256);
>> +                /// assert_eq!(v.value(), 256);
>> +                /// ```
>> +                #[inline(always)]
>> +                pub const fn new(v: $t) -> Self {
>
> Then this function should be unsafe, because an invalid `v` can create
> an invalid PowerOfTwo.

Doesn't the `build_assert` below allow us to keep this method safe,
since it will fail at build-time if it cannot be asserted that `v` is a
power of two?

>
>> +                    build_assert!(v.count_ones() =3D=3D 1);
>> +                    Self(v)
>> +                }
>> +
>> +                /// Validates that `v` is a power of two at runtime, an=
d returns it wrapped into
>> +                /// `PowerOfTwo`.
>> +                ///
>> +                /// `None` is returned if `v` was not a power of two.
>> +                ///
>> +                /// # Examples
>> +                ///
>> +                /// ```
>> +                /// use kernel::num::PowerOfTwo;
>> +                ///
>> +                /// assert_eq!(PowerOfTwo::<u32>::try_new(16).unwrap().=
value(), 16);
>> +                /// assert_eq!(PowerOfTwo::<u32>::try_new(15), None);
>> +                /// ```
>> +                #[inline(always)]
>> +                pub const fn try_new(v: $t) -> Option<Self> {
>> +                    match v.count_ones() {
>> +                        1 =3D> Some(Self(v)),
>> +                        _ =3D> None,
>> +                    }
>> +                }
>> +
>> +                /// Returns the value of this instance.
>> +                ///
>> +                /// It is guaranteed to be a power of two.
>> +                ///
>> +                /// # Examples
>> +                ///
>> +                /// ```
>> +                /// use kernel::num::PowerOfTwo;
>> +                ///
>> +                /// let v =3D PowerOfTwo::<u32>::new(256);
>> +                /// assert_eq!(v.value(), 256);
>> +                /// ```
>> +                #[inline(always)]
>> +                pub const fn value(&self) -> $t {
>> +                    self.0
>> +                }
>> +
>> +                /// Returns the mask corresponding to `self.value() - 1=
`.
>> +                #[inline(always)]
>> +                pub const fn mask(&self) -> $t {
>> +                    self.0.wrapping_sub(1)
>> +                }
>> +
>> +                /// Aligns `self` down to `alignment`.
>> +                ///
>> +                /// # Examples
>> +                ///
>> +                /// ```
>> +                /// use kernel::num::PowerOfTwo;
>> +                ///
>> +                /// assert_eq!(PowerOfTwo::<u32>::new(0x1000).align_dow=
n(0x4fff), 0x4000);
>> +                /// ```
>> +                #[inline(always)]
>> +                pub const fn align_down(self, value: $t) -> $t {
>
> I'm late to party, but could we instead implement:
>
>     pub const fn round_down<i32>(value: i32, shift: i32) -> i32 {
>         value & !((1 << shift) - 1)
>     }
>
>     pub const fn round_up<i32>(value: i32, shift: i32) -> i32 {
>         let mask =3D (1 << shift) - 1;
>         value.wrapping_add(mask) & !mask
>     }
>
> ? It's much harder to pass an invalid alignment with this.

It also forces you to think in terms of shifts instead of values - i.e.
you cannot round to `0x1000` as it commonly done in the kernel, now you
need to do some mental gymnastics to know it is actually a shift of `12`.
Being able to use the actual value to round to is more familiar (and
natural) to me.
