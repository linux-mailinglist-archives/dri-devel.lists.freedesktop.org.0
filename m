Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C76FADA76C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 07:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6D110E292;
	Mon, 16 Jun 2025 05:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Jtywh+7Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B81910E291;
 Mon, 16 Jun 2025 05:14:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APECZID0NzaM04i3PJxp1B8mtHUHaFocBzqy9k8WUkKOQdiUv774mgKWNxSNR11wENNW8QORGnTj+8LQc8/CNa/d7IGjxGm0TU2+LkCUVqMDK87YcF6L3Ht0M//BCjj5RZHkx+GH0kX8Y81lEpzgM1xzGolbmTsbz93nPvQktDKYhQR7vFEPwSxAPAGb+Z1OfXPMcFd+h7ibMHl+wU/pke8lXDuuVoFaiAyVQtpsODKAvMzfGtwGU6BjHjcugxNrHXc52zuIGa0TmKSjEwhc7wWVqAbBdxZiNgB/7GJFhQlYor0Y8VMgV3t7mzexOSZfs1++KOokEOarB+scu10OSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtonbrjietZNW5swa/6ksVzAo0YY3zUBI/9NwFIFX/k=;
 b=BmqrhxnFPd9tt1BEdno3bqr+udLKhpRkXVPeZyvoarGUUCYQejQye4iNQe1XMEKQCtUh+azReA3vBvgULkj1JcBcdnOghEtSiYcp7jAEth4fKRZ758ftgYa03RWqfqjYL59A7kvTPDUcLekyict3dydKfsJlbRd/grLWVA7pMU0e4dy3RUn49rn5fYtpxs5ZAxDxMDg4edFlvQJNuYHOe+Jld/56jmiVZrjdj7/qslsf065Gzpq6sW2pHOLjqKC+dNfvKM3W4vWFLriQWjmvkCDumkPVegWv9XQD08Bu+OmI/2Y7GqZ5HMS59qeDfdE2bLqw5XigZgifbbXwHnWfgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtonbrjietZNW5swa/6ksVzAo0YY3zUBI/9NwFIFX/k=;
 b=Jtywh+7Y8z//fxd/VneUf8MXHTiO0VPTQB9w2Lghc5wLxmcMf3IWm65VtcHp9QNOtij5yFLZ8wHb0BII5s3I7tfYzuAUUetARaC/22kPZJBBqZ5PeKbDlk6Cuvz9DzWLoOnaERSkp4AXyyzhvWYM01nIMPvvUyLnwJ3MRgthLSKmAajm9iUdzPLXJLKKa3YF6/40pKhqh37h3c3Z8KP3U5WcGxXgNXGEUGNajcB5SETWsjYdg99kw3Tg5LfEa5e0POb5bkC9LVRVJK04ujsCtWGxjRBfwGH/Yuked4rV4S2h5uz92wax4Uh7dm0Jkw8FAH6v7rfQ0prOWpZPME9+Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7610.namprd12.prod.outlook.com (2603:10b6:930:9a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 05:14:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 05:14:33 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Jun 2025 14:14:29 +0900
Message-Id: <DANP9ATT1T5W.1KP4992E26FTP@nvidia.com>
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
Subject: Re: [PATCH v5 04/23] rust: add new `num` module with `PowerOfTwo` type
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Boqun Feng" <boqun.feng@gmail.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>
 <aErtL6yxLu3Azbsm@tardis.local> <DALGWEM3TD3O.95L77CD6R62S@nvidia.com>
 <aE2sjA4DxFndTZYk@Mac.home>
In-Reply-To: <aE2sjA4DxFndTZYk@Mac.home>
X-ClientProxiedBy: TYAPR01CA0023.jpnprd01.prod.outlook.com (2603:1096:404::35)
 To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: 8302e75e-b9f7-4eba-54b7-08ddac94adeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzQ5RmRmN3dvTkhKQWRYa0JpcmJkclR0VDdXRkJ5cU52YWZkcjhjNG5xekhw?=
 =?utf-8?B?ZzB0Q1lYcW1OTlpmWEdnTlJjV3FxM2hWem5vd2RXcEE0TDArWmVFTUFSRUdS?=
 =?utf-8?B?WkpMS3E0SXdLRXhmSWZReE9xOGVWMWd2dW9nenRwSlBqd2lCQjVLTHBoZDJr?=
 =?utf-8?B?c2NJRk5pdlJjN3VjU0RKL1lzM3d6dUZTSkwrcXdnNjFRQjJza1p6eXZJNU95?=
 =?utf-8?B?VVo5c2ZoaEZwN3JTSW95Mk93UThSL3pHaWl0TmNCZXJPL2pLVGV6MDhscG5h?=
 =?utf-8?B?TktzYVNrN3ljb28yeEoyZUdvYy9yUmR5NkloeVQ1aTFsZzdXa0lkQk9yRUl2?=
 =?utf-8?B?VkF2MnhlYWdLUTFKWG9pS01uMUY4QTgzQWkvZGFHUHgwZEtjdENGQW4vUjhJ?=
 =?utf-8?B?MnV0cGpmSFlPb2hIZitMU2M5T0I0cjBycUFMVS81ZGhheHZEQ3VuMnZjMytZ?=
 =?utf-8?B?UUNyS3lMa0ZkYXNSTllFdXRVNXpHcXd2cXNZTXk1dGFWK1RWaDFud1JhUGZu?=
 =?utf-8?B?aXo1Z0I4Zk42SFNmYkZCWHRKNXVISDFqVmt5bTdNbGUrRFZLZUd5VWRsMWRv?=
 =?utf-8?B?MjlWWUNKWW9IT2ptV25nb0tqOVJNUXlBbGgwb2g5aUFtUkVsT0NWZ1k4VFdO?=
 =?utf-8?B?OVJHN1N2S0lwWmtGVnVBa2N3VHdKbks4d01ETmh0cEkzT0thdGQxbnhDdmRY?=
 =?utf-8?B?RmxkMk9aZng5RXRHRllzM2ZmcmcxMEV4NXBIams0L2x6MHVmdlFnNHlFM1dk?=
 =?utf-8?B?bkxrc25TaDlxcGZzblBDdzdySEQyQ0ZxUnpIK2xZak9laGJUQlpyd3YxL0RI?=
 =?utf-8?B?SG9TZkcwVXBjYUxHcWZxMUlFWTlld1E3YjRZQlMvOElQSnhEMmJvQU1keXMx?=
 =?utf-8?B?NDB3U0h3WFkwLzIreTQ1K3FIcmpmYnJnODhFQW1rTTJjSDAvR2kzcW05R1lV?=
 =?utf-8?B?Q3RwY1lsOWQybnFQc3ZoLzZnVXdvVFA1K0xhcVZFbVRNSDhEK2puY09xN0Nv?=
 =?utf-8?B?SXNXVkVabHovNFZsUE1rdTQrYlNNcEtOYzk4L3dhU3pWa3d6cFJUU1U0Ykcw?=
 =?utf-8?B?dStiVER0UXZ3ek95NUVLZkFvR0daSHdSTklYRk13NDlNN3l5VEwwMGtVK2lS?=
 =?utf-8?B?bWpMeGl4eWVzRHUxU1d3OUFmNkNTTVd1bHl0VEVpZzFZRDNKM1RieSt2MFd4?=
 =?utf-8?B?NWFXYTN0Ym9oV2JvRDEyanFTNDREN3NETFNLZE1HbmFtZUpyd0U5VkV0QTJ3?=
 =?utf-8?B?S0JvdmpBY2FVdmRQOUpROElMd0ovdmM4TmlvUGgveC9od2h6UmNWVlJCaDNC?=
 =?utf-8?B?WDljNmtMbXJsV2g0bXlDd0pObWNFTU5iUkF1MVNNcXdZTHdBcWdMWHhxcElj?=
 =?utf-8?B?eTEwTVlXcXFWUGZFZlM3VG5PNitYTVlhNWx4bjNnUjRJYjA2cTNab1Y0U3hw?=
 =?utf-8?B?dCtKb0ZJMEljWDFvWHg3SnYzVmljU1FTV0dCYkNnaFQ1OHVqQ2dWUzlpZ3lt?=
 =?utf-8?B?S0x1MkFTQ3loUFZ4Ujcyek5VR2RhUnNZdE9lVjkyRmJTV2xRL056d1l3WUhl?=
 =?utf-8?B?SnZYZmwycXFxWDZFUDNESmJOS003Ym1BVmtON0pDVkxYU1BvbGNCcFpERmhL?=
 =?utf-8?B?U2hLWlBlbEFzUGxnVUNaSXg5ck12L2xkbURmc1dCQ0hjeUVpVzF5d0xLSjJq?=
 =?utf-8?B?ZXduRytDVkdxRmJNYlRvVCt6VjBwSGUrb2hvTXRmNzdWdzVWVmdCTnhVSldD?=
 =?utf-8?B?L2NiMDBaU0M1TCt6R2w3NFZvREgwaXZCdlVZYmZScUZPNTNhaGxkR3Y3eG85?=
 =?utf-8?B?RjhLYlpZbFBOeER6YjFRY2xPVjQrVndwbktzNWtwMTZucmU4VWxLWmFvdER2?=
 =?utf-8?B?aXprcXVUSHRzSEJsNFZqWDFUd2xHZnBGbk9YVW5wVFZ5QVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VS9WMUpNaTdhc0pyT0RPRHpyUnN4QkVsd0cyZ3k4d1AxVk5kTDlEbVNHd05y?=
 =?utf-8?B?WnVWUDhqS1pNMnJqTC9YTU43N0VEaVVMOE9pTnJ0djdXUmRFazNVTlI5VENB?=
 =?utf-8?B?VVNLQ0c1bzdhSSs1d29tRm5QcW5NVTJPMFlkc2didHExemM1VGtKbVUwTmlP?=
 =?utf-8?B?L2NVTHJWZUdyaXhQQTVRcTB3V1FaUVV6WU4xQ05CNWdGWnVtTjYydXZ2Z1BM?=
 =?utf-8?B?VU80SFdTYXJkRjZsZDRUdXpYeEp6Z21ES1Y3Rk02S2hxU3I1ZXI1MFJaOUM3?=
 =?utf-8?B?TmJ4SHJWZUt3eGlEcGJtdFU1bTdqdWZ3M0hPNk9Gd2VxTG10VjlDa3JZZDVW?=
 =?utf-8?B?aHB0a2NjKzVndXNYcnpSYTUwL1dnUmVzS2hSem95bm9PN21aZ3RMZ1ZJMlFh?=
 =?utf-8?B?WjR6eFA2S2F6SzRIOHlqRys5am81S3IwM21uSUZmcm1MTjRVYU5BcXlZZnh2?=
 =?utf-8?B?eUlnZ2g4bkJUNnZjUjVZQ05HcHplR0RrNzE2eHRJVzd5UmZNRkhLU0M4Ni9F?=
 =?utf-8?B?T2ZNNjIwamRQVVBxcmhRckRYRjNORXRCMDU5eHR5VktDVnJSUFJzRFdnaGJy?=
 =?utf-8?B?NEt1QTM2RVF3anhid0UzM1RTU2ozQ281Mk5NZHBHcVo4Syt4ZjdnSkZySVYz?=
 =?utf-8?B?RWoybHRPUHdTdkFtMVpsNENNOERJRk5kWkwzOElrQUFOSjBaaWhNYldzK1Uv?=
 =?utf-8?B?Zkt4YXdNcEUwYUhyV0E3TnhHQXdDQll6RUFEVFppTU5qRTVhdUpTV2NERDlh?=
 =?utf-8?B?V0NaSmdBV0JSL2gxUnRVR1lCL1ZOSklPRlVYZFJqeGVScGV5K1B0QUFDd0kr?=
 =?utf-8?B?aHBXU2Q3ZmtqeVhmbTVNM0hGelVHaGRreFRWSmx0SjdkejFqOS9paGhoVlBq?=
 =?utf-8?B?M1JDU1FsejNqbkYzN2s1NStHSi9oaWdFb1J4Y2Z1L0tuVDBxc25jcy9xZTlj?=
 =?utf-8?B?S0hLdnovWGNmczJWZ0lyRHFxZjQrNUFMUFdjT2c1a1UzNG8vaTBsdDhERzNG?=
 =?utf-8?B?ZGlCeDVaR3prYzBwNWVhWFRHU291N1UyTXJjUHIrTm5CaDMzVFJvT2laM081?=
 =?utf-8?B?aWNKQnVlOWlVaDRFK0lNM3Y2aGQyU2JjYTN1bkQwc0tIM0ZGbW90a3NGaWFw?=
 =?utf-8?B?SFNINkFBR21IUDRHaXJ5R2l5V29xeFpJZHRYYzMrcldjNlZoVDBnMkpTUkt6?=
 =?utf-8?B?VGl2Q2toM0k0R1RqOTNoOXNwWEZCYVo1OGFZOGhEVDBvbkRFOEhNOUlmYjFT?=
 =?utf-8?B?THNNM2hUdVNzYm9MVG5Fa291QmxiUi9vODgvOUdPUGZHVmRuck1hVlNhSmx3?=
 =?utf-8?B?MkJmOHpxNm9yWFdzS2pzTnVZMlV0dUEzV05DMmNRS0xKRU1MSlBmUWtDN09w?=
 =?utf-8?B?azhlY3ZSd0ZwajNtWkx3WVhEbzJOZTl6OXp4TmFBWWlIY1hMQmY1ZkNtc2Nt?=
 =?utf-8?B?UEJ3dXBXeUlaNnUzU3JWd3JVbk11eUt6UVVMTVNnVGN0WG8vQ0xtUDlKKzZU?=
 =?utf-8?B?QmpqUlFEUWRPelpObzdadWpCZ1JaVTBLV2RLTVFuTlpNaG5PUUNpenlpaGlj?=
 =?utf-8?B?ZFAyMkpzK3pFVkxmeWdPcmUvbEFULzRsd3Fma1BqRjlxdEhxS0RZaHFON1kz?=
 =?utf-8?B?RFo1T05vRTVFbU5nVmt0bThFTEN0WXNZdlJqNlVoZStuNVBGVFZscWpIc1Uz?=
 =?utf-8?B?ekQ1N0pTb29iTVJhSlRnN0ZwK1BXdzgrMnIzSTdQN1JZbmhSU0Y2cWJGay9J?=
 =?utf-8?B?WWdsRmsreVJodkpnb2NUK28yaU13YTFBMmdSdU1mVzZadHZVQ1o2QjJwVzJp?=
 =?utf-8?B?ZEZISnFzZnQzVWhuaCtrd0Jsdi90WXBDdFBRWXVlNDhZdy93TjBOM29yNHFX?=
 =?utf-8?B?aUlOKzNFd3NRTFMxYktzWjA0WVVvWnJQK29ma0VoWExkWUlXN3dMN0ZEVTJV?=
 =?utf-8?B?UXM3YXY2dTE0SmdWMFFqSzNDa0ZmWmpDb29SQTZDbkQvcWJyU0RTdzFUV004?=
 =?utf-8?B?MTUxZzFRVFlLaU5iMW41TnE3U2trdkdHYjNLTG9vdjhIMFZ3amxzd0lsZ3hy?=
 =?utf-8?B?OEZHU2pZbml4MDl3M0NGVU12Qklhc0ZxRVpremg2YS9KY1UxNHhZM3lJcUQ2?=
 =?utf-8?B?WXlwOEJ0K3BiS2FMczA3VlBCYnJCSElQK0pjYTcwOUhDMCtGdkJTMll5LzdW?=
 =?utf-8?Q?QoF+JpdiHPmPKKRoaGYjIxYCb31b8D9b0Y57YTAeegHm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8302e75e-b9f7-4eba-54b7-08ddac94adeb
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 05:14:33.0676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cNPtsvpQ52cT1X8R0PrtWAJareSmz/aRSwISDbX68ROu+TTYsBZnS3KqZSdxMev2r6c5tb+VC7cYzRnOh/zAag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7610
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

On Sun Jun 15, 2025 at 2:08 AM JST, Boqun Feng wrote:
> On Fri, Jun 13, 2025 at 11:16:10PM +0900, Alexandre Courbot wrote:
> [...]
>> >> +                /// Aligns `self` down to `alignment`.
>> >> +                ///
>> >> +                /// # Examples
>> >> +                ///
>> >> +                /// ```
>> >> +                /// use kernel::num::PowerOfTwo;
>> >> +                ///
>> >> +                /// assert_eq!(PowerOfTwo::<u32>::new(0x1000).align_=
down(0x4fff), 0x4000);
>> >> +                /// ```
>> >> +                #[inline(always)]
>> >> +                pub const fn align_down(self, value: $t) -> $t {
>> >
>> > I'm late to party, but could we instead implement:
>> >
>> >     pub const fn round_down<i32>(value: i32, shift: i32) -> i32 {
>> >         value & !((1 << shift) - 1)
>> >     }
>> >
>> >     pub const fn round_up<i32>(value: i32, shift: i32) -> i32 {
>> >         let mask =3D (1 << shift) - 1;
>> >         value.wrapping_add(mask) & !mask
>> >     }
>> >
>> > ? It's much harder to pass an invalid alignment with this.
>>=20
>> It also forces you to think in terms of shifts instead of values - i.e.
>> you cannot round to `0x1000` as it commonly done in the kernel, now you
>
> Well, for const values, you can always define:
>
>    const ROUND_SHIFT_0X1000: i32 =3D 12;
>
> because `0x1000` is just a name ;-)
>
> or we define an Alignment in term of the shift:
>
>     pub struct Alignment {
>         shift: i8,
>     }
>
>     ipml Alignment {
>         pub const new(shift: i8) -> Self {
>             Self { shift }
>         }
>     }
>
> then
>
>     const ALIGN_0x1000: Alignment =3D Alignment::new(12);

Now you take the risk that due to a typo the name of the constant does
not match the alignment - something you cannot have if you use values
directly (and if one wants to reason in terms of alignment, they can do
`PowerOfTwo::<u32>::new(1 << 12)`, or we can even add an alternative
constructor for that).

>
> and
>
>     pub const fn round_down_i32(value: i32, align: Alignment) -> i32 {
>         ...
>     }
>
> My point was that instead of the value itself, we can always use the
> shift to represent a power of two, and that would avoid troubles when we
> need to check the internal representation.

Storing the shift instead of the value means that we need to recreate
the latter every time we need to access it (e.g. to apply a mask).

>
> That said, after some experiments by myself, I haven't found any
> significant difference between shift representations vs value
> representations. So no strong reason of using a shift representation.

I'm open to any representation but AFAICT there is no obvious benefit
(and a slight drawback when requesting the value) in representing these
as a shift.
