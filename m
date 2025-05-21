Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 001A6ABEC1A
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 08:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50AA510E03D;
	Wed, 21 May 2025 06:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Tei50g8d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D19D10E5EC;
 Wed, 21 May 2025 06:45:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TcX30vSAreaHPFm+YOBELmnKlsDxguyIG74MI9S+D22YZ7IGNYfxujK58y0qUBx45gMwO//l2kZAS6vlFXlUWRHlg+V3dOU0oYExLVtXqozPOP8Rc8lyunskWSJEHnNTvg3QU/JhnZxc06bvPgcCBDiKLQYNXwT9SaiHZf8XqKolrhfnwD7dPjr56i/wPb2LBvNPgaZpnbrFNP4lOvzL99rJDkKeXQJ7VbQP2QctT/izXuQgz76JoHsg60uj/Eu4HiNcGqhDZje4ARU9ixjBNc5UlXCOTvJMkz5sA++srDLU6w5HEArlDIlSCzcy6ZCeeCRg6huXSGeOn+3yH+1Msg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjebv/H8EUHdqrE0sSSg9XaKMlUN4c2ZcKgHK0vv1w0=;
 b=Ue+IQ/E3iqDoxs24GPmBo4KqIe0srXA1YK+v+cKYacdfKLIm9spHv30PFJkaN+m3+YwtdnKQmu5+AbcvwolVqK0SGemxUxmB1DwQFvFGNeq9NRkic77D2PGq0Tj7wKhSrkq2cpdoqGe6PMV26msLH6a7z88SliC2pqJwfV31AO2WCz3cNk2xzxM4VAjgVANg3O7+HNe9QYTzh6ZOD29iczgNf57XFOB3AC5zCLkGHPVm1bhFoEWL/zmzuvuruVThePxnsGAGPbjyPKIK7l7So3r8aM/S6sf4e2biiK/GvAe0kRf1W7Bo3JXLIEgjoOyegyUFxQZG6SNM6MPxuPVfuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjebv/H8EUHdqrE0sSSg9XaKMlUN4c2ZcKgHK0vv1w0=;
 b=Tei50g8dmtL6hi85s32LT6X/YkLRrlZpGLjKqq/hOsBzvc0ZB8PGgc2xkrbgtBloLqHqNwShcCKxTjJiNVlDq1mzZ1EIRKIbbyPi24mmfJf8jNwCBNz0MskEIfEYeBv5ClbnGMajaC2C6N6WHtMgvNIFolYSu7PtsxQjvtawNDcsWY5DFxysVvp6CRivtaaGEdjTIRv7cWTuPIc2WKAOFuNz/IM9A/kswlyfVsae2TQ6SIS0Rm1eD+5YuOdtHMKxL8RnMOYVzR+VjzPi28qZ85k4nm55PnudJOoACrDd5qs2fxCeW6fyruBXqnBVw7HrLvpx6x3X4ATzQaMFp0+9hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 06:45:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 06:45:06 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 21 May 2025 15:44:56 +0900
Subject: [PATCH v4 01/20] rust: dma: expose the count and size of
 CoherentAllocation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-nova-frts-v4-1-05dfd4f39479@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
In-Reply-To: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0202.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: ff9d6899-e35e-4d5c-da9c-08dd983304e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1AyenMyVW16TDQvdE9hdDlmdk0xS04yUTRvV25yQlcrOC9iMjZwL09IL09t?=
 =?utf-8?B?RXpVbU1YdStyb2lleHVpSjhJZkJwT1ZpWmhFMEd5S3FKa3hFU0ZycUQ0c0M1?=
 =?utf-8?B?K2xuWEVKdnJOWmFiaHVJVlpXRFdhZ3F0c2d0RTdqdk9ZWlFKb3FKUFprNklH?=
 =?utf-8?B?ZTZ0dmI5OW1IVmFEZGh0WkFQQjBkbE9VUUJnZ3ZQR1I5cG1BQVRlaWdYdkFr?=
 =?utf-8?B?bHJYWUhBb21yZEdlTXJEcysvc2ZFaXd1STJZK0NEYVo1ZHNFOGp1N3IrcXRT?=
 =?utf-8?B?NVhrM1loSDMzaFRabUFteXIwWHl2THZuQUZBZlZkWkJMZy9EdVFCV3ZnOXhF?=
 =?utf-8?B?MVc0bUxoU0Npckd3b042ZEd6TGFmNXp5Mit0ZE9aK0toY2wwS0pDTUF1N29m?=
 =?utf-8?B?U0NQRnFtYlUvWG5TZGVsZVlFV3ZUcTlnNjhJeGs3T3FzSUNSOWtzd0lVYnpj?=
 =?utf-8?B?WlBlYXY1TXFjbkU4QkZSQ3cwY1Bnd3Fkejd5QTJ1aXFtNUFHSFllNDZadTFE?=
 =?utf-8?B?QUZKc0doTzYrVDVBUkRnUmcxSHVxWXhoRG9XMm5HZnRYN0c5M2RpeHJJa3Rq?=
 =?utf-8?B?NGU3NWhJNXZMRXhId2VacjFsMnQwekhlWDNzSXQzMVl5Um13OUY1cUFQbFF6?=
 =?utf-8?B?ZVhJVnZGczU1SWxqV3A4VDNRRDZsd21JRzMxY0paVzlSckdjWUdJb3pxWm9F?=
 =?utf-8?B?dmxyTHovaWdmTlNoM0RybUx1WjVydHMrUWpLK2UyVDdUWGp1M1hNS3JyaGRS?=
 =?utf-8?B?dUxNWng2dzIvN1V5SUZlT054aTVqSWk2bDRqckZ5TTgrOU4raWZ4bEtPbWFZ?=
 =?utf-8?B?ZWd6TlJrR0EyelNqOHVBWUQ5NVIzeGRtQ3dDS0hSbk1ZdEk5UnlJbHU4SEJK?=
 =?utf-8?B?aDhrMnd0bjVyZ2xpbjlWeVdxVFMxVHZSbldhdEwvVTh6L3VKNFJzY1U3YUJG?=
 =?utf-8?B?SnhlSit3T3hGbEFKZW9HbDZxajNxZE5EVnhVU1g1TFpicGdyNEpZUzFvZ1ZL?=
 =?utf-8?B?ZGcydTZScmZWUGFGQWg5Nm1nbkF5eC8rUVJkWmEvcExwRzZtMXZielpkaGRq?=
 =?utf-8?B?VGsxWDBUdk9wNW0wa2YwN29JMHhyaVJOaDlTbyt3VkRiUHJzM0NVcXpnekNB?=
 =?utf-8?B?dnJYcWo2RFEvRjI3RnB3TnJBZlZ6MlBQbXZYNjM3Q0c2Qlp4aUs5MTJ6SHhR?=
 =?utf-8?B?eEM3S0dWZThBaWt3L1BjUEw0ZzBhb0dnZ3lTbFdsSUtCZXZoSEtiU2dSQ1ZK?=
 =?utf-8?B?QkpTL3Z4aDhaa3c4aGlOc2dCTkRJcitMQ1J5eTNhMGllQW1yTFdVamMzb3o4?=
 =?utf-8?B?dFdyalZIQitnalNYUnJDOW8vamxaZzFSNVRCMklHTmtOczJ6a0Q3N2FUK1Iw?=
 =?utf-8?B?S1BodU5xQ0Vhc0RkUFhVblJNM3JYNGRiNE9PalBSYnpWMDVCNzR3b0ZQNVM5?=
 =?utf-8?B?YmZyS1F5ejZzQWx4dmVJb3ZvcnlQMy9tdkNFb1NUd2JHZmRvVlNaTFNOQU1s?=
 =?utf-8?B?VFM0d21vY2ZJVkQ0cllld2tucGdxTzUrZTkzSVgrQm4rcU1qR21YcGcyUXlt?=
 =?utf-8?B?cy83NnZuMzRSRUxRRFBYSG9XMnE2bGliSnlLdy9rSldrdk5RK3RESE5vSU04?=
 =?utf-8?B?ekFqQzdYNlJkVFl5TFFIV1B5eUV2V1JkbVBEa1lpSkl2d2R6Nlh3Z1VPMGhF?=
 =?utf-8?B?ZWtzTTlBTStjbDZadTNocHZrUC9DK1NVQTJ6enhVK2hKM3JMc0R4bGQ0NVBV?=
 =?utf-8?B?TXc1dFVjWXdxOXNpM2pIenZkQ3JQZFp4ckFTQ0RMeFdOcHFCeVpGakJ2T2hS?=
 =?utf-8?B?dStxWmJGNm9Lbm5HR2pKZlRxc05Pb254Rm02WEdFTUVYR1k4aGtYaVhSdkh3?=
 =?utf-8?B?OUFrUHFZOFVpVkhSV0t3QTlrdzdMb1B2MGRJelpwSDE4MXNZMi9rNWRwWDVV?=
 =?utf-8?B?cmJMUUtjM2hmQzdRaEFOSTNYb3Z1Q1ZOT1B4T0l5UzlxSlN6RFR2dkVQeXdj?=
 =?utf-8?B?WThiY0ZtUlN3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVdxTk45YVU1czR6ZWliNTZURzRlVUtXb3dvYThLeEtmc3QzbFppbUtDREF2?=
 =?utf-8?B?OFZyOVI2UEtTR3BrTUIyczJpMExQamFWSG5GR3psVnJtWUZmVlhHSDlXN2Vr?=
 =?utf-8?B?T1A1cFhqeDlxYlBnNG1LalBGaVlzRldvaXNhL1JUZGVhRG5HZ0kwOTdnYmZo?=
 =?utf-8?B?SXJvb1BtZXhxYTBHa2ZDcUo4OUpzc0pWTnQrc0dOOWFYQWx6Z3hNcndZRUhX?=
 =?utf-8?B?VGFGNEVrZkRmV1dkSmVqVjNncnVwaFh6RUYxeVYrRUxHdGhvc2xkZUZvbk44?=
 =?utf-8?B?cnRIU0x2cElUK1pRYnpUbmg0azMxQktSbEMzZ2E3Z09CZ05IdExuWE5kS2Yy?=
 =?utf-8?B?ZmIxTzVRQmJPUFBPb05NZzBTc1VQTXd0OHpwY21waHFQdkxQLzl1eUZzampk?=
 =?utf-8?B?SWRYdlN6bEMzaVB5Ym5CYUl3U3l6cDFZbDFaUnRHeFJDaXp5T0pQdGNkY3Mr?=
 =?utf-8?B?eHM1RjFQWTl6SzNMMFFSVUthdDQ2ZEx1YzQ3czVXck16TDV2US9VUkt1V1JJ?=
 =?utf-8?B?aGcvMlQ1R3haV09mVWZWV3c1SFBMTjhFd1R0RURaNmNOM1VpSDBHZmJabjRq?=
 =?utf-8?B?Q0xJdTd4bXQzT1VvVVA3WXZacks2ZHJya0xibWxyNzVZOXJuS3hNY0JNaHhD?=
 =?utf-8?B?azhMLzRTcDlCRHNPM3lmbFBOVlNBVmRUMUZVWExTWVdWTUJwTlBtUVR6ZkVl?=
 =?utf-8?B?NFpNWkJwWjJVQ2k3Y2hEdDl0WkxhMTFzRC9Jc3VydDV2MHBmbVRHRVQycWh4?=
 =?utf-8?B?cDBxcVZUNnNVdUMzZXhCdW1pdmFNTm1iZmlyeWhESFNHeDFCc3pHb0Zaaith?=
 =?utf-8?B?WngvL2pybmdCU094TVZCRENRbDhheXk1N1FqUEJIZnkrOHNyajZ3ak9heEor?=
 =?utf-8?B?MXpMQ2NIdGZPYjJCWm5xVVpUSjgxODdra2I4dGZlbTlzeUxNLy8ycjhSWGNj?=
 =?utf-8?B?T2JoL2xMN3AyNisrYUVMaGQ2NHVHZ3l3dHE1N1AvbzZUL2Q4c3BPZUwvTmls?=
 =?utf-8?B?M3ZpZlJ6cXZWbTY0bVB0U1c0bW82T2FTZXdGK0V6TjVQZTkxTGlyRXVvTlJz?=
 =?utf-8?B?dmd2Q09SM2VscFVFQVJ2SUw4d1RVTTRndnNhakpzV0xBVVFZcTRjVnVMNGw0?=
 =?utf-8?B?Wm9EWXo5M0NNT3VneEpsc2p3d1lmL1ZhY3o1SGZuSTRWY01xY0VYVGd4SERO?=
 =?utf-8?B?c29MalNqRjFMZWllaVJrczYrREZtQ0szRFRMZTZxT3NKUHdDbjVwaTU1V1FP?=
 =?utf-8?B?T2QyeEN0VXlJeU90MXptZHp3OUlMQlJPM0hIcFpxNXlsMzdrU05xeGtFYjFZ?=
 =?utf-8?B?YlpJbTZzVmR6VlJHOWhVM1FSZjhxN2JVT1R5blQrQjBtOGFBU2FWMU5uU2Vv?=
 =?utf-8?B?WENSUFNjOEprUlUwVnZtL1p3eXk5ODE2bWMzejZJRk1ISm1IOFVOd3hhQUlO?=
 =?utf-8?B?bkZGbGJkQytieG9GcFRGMVVWTlUxUDFlSlRBa3paZ0hlWjFJNVBsbG4wN1dT?=
 =?utf-8?B?bnFLMnlRMHAzcmJmL1lnRGJPY1VNd01MVFdYZFdKblZPTEk0K0ZuTk9uUFVE?=
 =?utf-8?B?NDJCK1IwT0dnd1l1UW4vdVVFb1ZFMDJuVGVHZ0xkZEZ0VzB6TVhPUGQ4aTBK?=
 =?utf-8?B?ZGdrQmRkbGY5cEtzZVBFZEwxMzd2b3lRS01LaTVnczQ5SzV6T2l2Y0NZNERZ?=
 =?utf-8?B?VDA2MkFuYW9yeGptTXRLZWJpTkpMQ3hJNDFBeUN6R0FkT1pkQkZmdzNxUmJt?=
 =?utf-8?B?TzNXK05EQlFLYkZPRXVqS2RibytpNjB2dGVPbjJiaGQwcnpQTTlOQWFaTVhm?=
 =?utf-8?B?ejIzSXlIQzNnVkNPbDc2cHU1OFh2WW1heHdOb01KcnZud2tIMURxbGdJbGlr?=
 =?utf-8?B?MWwzdlEyZWU5Q0szTmc1UTFYUERkYjg0dFloYXk4WkVGR3VrQ3I0L3hSMkNy?=
 =?utf-8?B?WFVOV3g5eUJ2blZPdm14QXFyNjJQWm1qQnAyaWhQbTJkaU9DVUxXZVZmbU1h?=
 =?utf-8?B?ZmsweXNnaEx2QjlBcis1WGhYcWpYM2IvaXQyRGpGblQzQjJGM3BFejdSVU1C?=
 =?utf-8?B?aEhYblNHeUN0emlPS3ZvemFOcGJmK1JnTjE0NFBoVm04WVhWVTREZUVEemU5?=
 =?utf-8?B?TXVVWHB1WUJpZFhSUUt3VGhnaEg5TkZoa1U3Wjl6dDc5dm5hdUNWNDJQT2Yv?=
 =?utf-8?Q?f4Z6RewuIePiqRPfoGJ5612TeK9jf2Ot7Yc8x02pwQ32?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff9d6899-e35e-4d5c-da9c-08dd983304e7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 06:45:06.2775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZ9ZuN/3Iu1HmNqZBGBVIesmtyjwzuaVJdJBOOK5Z43WuuSlAG+AT8DrfHFRaSSmOgqUNvvCfOydOrukXrQ2CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6618
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

These properties are very useful to have and should be accessible.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/dma.rs | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 605e01e35715667f93297fd9ec49d8e7032e0910..2a60eefa47dfc1f836c30ee342e26c6ff3e9b13a 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -129,6 +129,10 @@ pub mod attrs {
 //
 // Hence, find a way to revoke the device resources of a `CoherentAllocation`, but not the
 // entire `CoherentAllocation` including the allocated memory itself.
+//
+// # Invariants
+//
+// The size in bytes of the allocation is equal to `size_of::<T> * count()`.
 pub struct CoherentAllocation<T: AsBytes + FromBytes> {
     dev: ARef<Device>,
     dma_handle: bindings::dma_addr_t,
@@ -201,6 +205,20 @@ pub fn alloc_coherent(
         CoherentAllocation::alloc_attrs(dev, count, gfp_flags, Attrs(0))
     }
 
+    /// Returns the number of elements `T` in this allocation.
+    ///
+    /// Note that this is not the size of the allocation in bytes, which is provided by
+    /// [`Self::size`].
+    pub fn count(&self) -> usize {
+        self.count
+    }
+
+    /// Returns the size in bytes of this allocation.
+    pub fn size(&self) -> usize {
+        // As per the invariants of `CoherentAllocation`.
+        self.count * core::mem::size_of::<T>()
+    }
+
     /// Returns the base address to the allocated region in the CPU's virtual address space.
     pub fn start_ptr(&self) -> *const T {
         self.cpu_addr

-- 
2.49.0

