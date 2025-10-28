Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AEFC1536F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 15:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C2710E19C;
	Tue, 28 Oct 2025 14:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ko5lX9ig";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010018.outbound.protection.outlook.com [52.101.201.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C46A10E10F;
 Tue, 28 Oct 2025 14:44:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzg+gGw5qqYoGTZWdTNbvAQ3+x6zwHZRfg/0PnOHsno30PxtVqsvIKsV5KpWXeJMcxYWeg/rtjgrmkyWTFAsxMOLZgHXltZO2HwfsqXgMw53PwHfpJ7oRdhIvVPirNLzMvbLGo/ktKWVP+/s5xcnEs3D/0Wp4VxtRt840haxyTKtMMQKDJaTZJ0iME6I6Wlz52dFB/6panSyqMfjt3c2WMfHf6LnnzIb0a53RqwPK1BvrPhMuLGjWTU+xPMjyvqHJdaJmTyKzOszB96cvxQ4jUTJXKMLMiaQxBLrz149P9lAl+7X34yIoQ2bN+FcqpJ+dpNGhp/0rDZ3IFuj9taVPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6Vo3DYYQ9ZtX7b4cE4LqATmKBc/Wv+rR4TSSRCTpKk=;
 b=PIIWiIWvH3ylJ6uig5gtK2a0uJMdp37vDWR31NoodpNQo0AL3lgk+dFbISbBD3kWn9c2sBLkkkS7YhHIdgbIUSNspWRtcRcoVEiGidYx3ll+L9PYsq6H1SHZVIM072f3Y40n3ITI5nNPZ41YfoURQqDUOOZriOKNEboLRJV3OMajOZ+rdtW/BytdglzlKYgJ69IYhtanBqh0ORsm6NevpuD0rCKYL9hwWlPqeFbk+LDZ1Auup3xbeVqWq1s/R5IUmwcUfYbZMcjYb+0r3VT9BqMFyYRBgisBHtDVB/3iY4dgg7RH/srYyLqdCo/eapJ1Br58SmMCG2nmxOY6i9hiCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6Vo3DYYQ9ZtX7b4cE4LqATmKBc/Wv+rR4TSSRCTpKk=;
 b=Ko5lX9iglZCzyaIuPZQa4qHHjY+GF/8iUjS/Mi2vEr45Vq3zqNpO23vkZC5CIkOH0X4imcDzdnsEKGJS532hwGbZ7itHZ5VodwB2jAwGsCO0xqHdm+R8Q1+b8RnRzF2VTgH+yPJyh+J3bTZ4APYbrEwfteX3NhxDDPTYodrImSNDVwFi9+LVWN0FaclH47ueGZDJkz5OA+Hkxx7RqAzlWMKhT56+Za+xPlbIYiEK5aHs1R12Iv9B3TqTd0JnUQ0/WP7tTKRAgQHE3O9mNquIFFdkzHp9ur9mZ0GJ8waUe9R95b5ZbMugH2eoGBbC3sYzPgwpX8cbk48VSzkuQt1ZyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB7280.namprd12.prod.outlook.com (2603:10b6:510:220::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 14:44:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 14:44:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Oct 2025 23:44:30 +0900
Message-Id: <DDU1AQDW78QI.1CBHEW03926H0@nvidia.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Matthew Wilcox" <willy@infradead.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 5/7] gpu: nova-core: add extra conversion functions and
 traits
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
 <20251026-nova-as-v1-5-60c78726462d@nvidia.com>
 <CANiq72mgoW_TyWf9Nv=5t3Qij_dsDjicNpGsa=F1t+sg23vxSA@mail.gmail.com>
 <de796658-ed1d-41f1-b153-f3d1089656ba@nvidia.com>
In-Reply-To: <de796658-ed1d-41f1-b153-f3d1089656ba@nvidia.com>
X-ClientProxiedBy: TY4P301CA0007.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: 719b0d8a-dffa-4e2f-2e61-08de1630827d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R21VTE10emk0NmlrcTgzVWxjZXc0UXhFcHNYSDZZb3dZclo2dFI3VmV3RDgv?=
 =?utf-8?B?a1cxKzZhY3hmekwzSytWT2xMSWwwRHBtZGNCeUZ4NW1pSGFuc2M2VStFQyt5?=
 =?utf-8?B?K3RFQjE1Ui9kUEtvZmN1YWppUjVSY3gzYXZmSmR4U2ljRHNvd2YzeGovTDZx?=
 =?utf-8?B?TW43UXhsYzJETDY1blJDcytVSGpDeWJnZ3RtbWdZMnovRXlMZC96L1l6UHVH?=
 =?utf-8?B?Z0h1UkYwRldQYTEwUzEwaUlLalZTSlhJalhhbFUyT2lXcUR5VkwrSW8xU2JC?=
 =?utf-8?B?OGNFeHdYZDUrZE9JNWYwMEZXZnpucjlUaXZ4UERXTE8yVnB4RUMzZXdNVFF6?=
 =?utf-8?B?czBkVGR6eVV4ZG1uUDIrdENRT0lRZFczc1J5K29VRmt6OVNoaEdUZUYvd0ZM?=
 =?utf-8?B?Ly9YaGRha21kTUF6cUlHZFd5TlpJSGNDTnAxRW4wR0FIZ05QUndFVVh2ZnRl?=
 =?utf-8?B?QkxGUmtuZjZxUVFiZFZsNm0ySk1saVNxN083YzFBNmdkQlBySWI4bVVucVNo?=
 =?utf-8?B?SXVkT2lxTDNUb1R6c0Z5WkJiSWVTTlhiWmJNVjZzbHY4RGNoelFGKzkybGY2?=
 =?utf-8?B?Q3dBMmxUMXlIY3dlaUk3Tis5bURZQ2JZd05KQjBURDNqTDhoV0IvcEV0bElO?=
 =?utf-8?B?cmVNcFJ0Z3kvc1VxTEE1amhrbm9kdjBJTW94dW95S3R4eS9HZ3FkNS9FMGZY?=
 =?utf-8?B?bGRtZkVGQXRFNnRZbngwM3AxbjhBMDQ3N0hPMWswbVVVTlRKU1g2NjZ0SFBh?=
 =?utf-8?B?OHlXOWhLWFFLN1pMbFBOV3gvalQ0SE90S05OeGdMKzgrU28yUEx5RGdIMk5s?=
 =?utf-8?B?V1hQcEpzZ3I2aWJtK3FDVXpHMWtDOXdnV08wREFqaWxNNW82UTRxUGU3RmFG?=
 =?utf-8?B?L2MwSEkxUFBNeEpvN0x4amtoVjhMOU9CdzE1cFdYNEUvUW9RWmpYOHFTRVJr?=
 =?utf-8?B?ZkgwdkdlZjhRYjR2bDJoSEQ0bkZSUlBVTEZNZ2QrWTNqYk94UFV2VkRTeXVw?=
 =?utf-8?B?RDZlRGFSNjUzZ0RURG00MnBKYXo2SFErWWdsWi81eU5MekpiRndUd09XSGxQ?=
 =?utf-8?B?U1lHb1ZWZDk4QnhCRWc3OHRxNXpZRm13MHVzWUs5QmVyaDh4Y3IycGd4K1Ny?=
 =?utf-8?B?aEpLZXhHK2xxN2p3eXk3M2IvNnpFN2FPTlUrcjNySGhFR2RrV1VWR0VKaVdv?=
 =?utf-8?B?QW1aVFg5cGkvSFMyTTJ0anZsQW1LU2hxSzJFdnRNTDdRLzI3Q2tCd2JSam9i?=
 =?utf-8?B?TzcyWTRuYmd3YW5qVVBoNng1Qkhkc0RtcnBnQ1BwR09EMEZPT3ZDWlJ0SFY5?=
 =?utf-8?B?VVlJYXpQaFNjVGt6L3dFbUdEdU5uR2kwbVhma25lVE0vbTR5a3lxdWNCd01O?=
 =?utf-8?B?MEpKOURRWjRiOVE1UnNvZms1ZmVoU080a3BIcFNLS3VoM3MyMG9YMnRkbVNy?=
 =?utf-8?B?ckYwUXFzaTJFWVk0RkdSdjFtMDE3SXd6ZkMzTERSMjdTM1QrVE1tVURCQU1p?=
 =?utf-8?B?dnVzUDdQRmNiQ3VQSkpMWXU2ejNNSkdpREl6WWpCaHJzYjFFMExiWDgvTkR0?=
 =?utf-8?B?WUhqWnZJMDZmUEx3RHRKclVuT3lobE1reUVXajB2OG9RcXpBbno4ZjFTM1Vh?=
 =?utf-8?B?ZGp6UFNmRlZwQTZCbU9ZRExRVUlmNml0S0ExUEhJVktvakd3eWc4c0FodCtr?=
 =?utf-8?B?QytPWXI4cm40YWhwS0UwaVVJOXUyYjdYQTg0a3lLc0RaZ3lrR1BzeDVuS1F1?=
 =?utf-8?B?dzBuU2Z2NnQ0T3NMZklpbmtxRU9rWGZaVXJ5VnUyRUR1bjBhN1NQQnZQQUU3?=
 =?utf-8?B?c3FoVzZOS25pZFRoTjFYckpXR3kyMUNDN3JwTnh2MXZVdlBOZ2ltaUgzYkE0?=
 =?utf-8?B?KzlvTDhiQzFQSmFMSUxFc2ppU3U2UE5PcjJKcGdXWlVhT1NPbHJrMTZHSkM0?=
 =?utf-8?Q?eDeWFpA9lTbb0CKEJv6qvYnHGpxTkFvS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VllscGM1QTkrdDdSRXd6NlY2TkttekI0MlJtNlplTTQ3TXB0cUVlSHFOTTdE?=
 =?utf-8?B?S3dYVlkycGJlZjRNY0JsYTE5NXpWMWhGQUNzVHhDbGE1di9vbERJdC9PSkNq?=
 =?utf-8?B?SlhxK3hyU1h6dGtTMkVwRGFGZEFlQzJURCt4SDNESUxwbi96bE9BNERRWW5V?=
 =?utf-8?B?U2IwMnV5YnBMK1gzNUwyVDlpcHZDYXp3UEJYMDhXY2Y3QjdxRHhMU0x0VWNj?=
 =?utf-8?B?NDBrUHhRd0dyazdZZkpWa2dMV0ZiMmFFbEZoS3hteXlhS2xHRldsTzRGRlFC?=
 =?utf-8?B?WnRKNTlJSm1TNXVKZVZnOUQ2L3h0S1c0S3I0Y2pZanZXNjdEZjhiYkVWZG5X?=
 =?utf-8?B?SlpxMTRIa1lDWm1OK0x1RHpVTHFSTzJzVE5NcW12aGo1bXUybmhhOGJnYmRU?=
 =?utf-8?B?MVRacEpDbUJkWUZPOXUyOWlZaXlhcG9xeHlidDFtUnNzN0d0N2xmUG1vVTli?=
 =?utf-8?B?YnB3clh3S1N5RkYxcVV2UTFib0pTUHFseXQzNU9FZGZjZTJXUVNXVVRpZDk1?=
 =?utf-8?B?Z2F1TkVNa29xVDlTQ3BKREdFeGVFL1hBWTQzcUF4aGhwcjBHS3VrUXNDVC9u?=
 =?utf-8?B?MlZNMDhabWNOaDRSdS91YTg5TDZVeXJncnBGUUlTdzhVRWdRTGxRbnV1eUEv?=
 =?utf-8?B?M3pTQzZtWlJSSTI5cFlwR0NmV1M3d2xjbmVtbjAwRTVOYk5CSlRqQnl5STlD?=
 =?utf-8?B?VmpxNGtLT054NDRyVllyTG0wN0FleFRsdS9aVnNIcWZOOUI0S0ZacHY2Mnp6?=
 =?utf-8?B?bmFpWjNFbGt2ZmRjd2NjREdzYk13TGNiZkNtQWxJNlRqZnlOdlRqVnBIZTJt?=
 =?utf-8?B?UG8reDdkUU9iSzhTZkFvR3F2UlFxYnNzQWpvNGRXQVBKaHBrM1E1b0kzMDVj?=
 =?utf-8?B?cDRHcEFzSlJWd2psM2Jlak9HbE1UYmdVN3FheDl3aGRRYWxaaTNVcEdsUVhi?=
 =?utf-8?B?YWRrMC9uT3paamd2OHNjakxIeTBjRUQzRXlIUWI2Q1BRSkUvOWEzNXlNUko4?=
 =?utf-8?B?KytDcHByTEw3STlTdWdUTG53eC9DVHhZT0NEUkVYdE1NWkhjbEx1UkxYU2dX?=
 =?utf-8?B?S1diLytvT29ZV0ZSMFptZjZrSkorZmtLa0FIcE16bndHL2hxM1cxai90NVBt?=
 =?utf-8?B?VnpwcnFWakhXZUVJU2E5OTZ3a0FBMTRvZHVkZG1Kdk5DaFdEMERCWWxaWDk3?=
 =?utf-8?B?ZjJDVWRPN2ZUWEd4cmNTcVVYenBVdEFaVEZBZlE2RFFDcG5SOWdpWHgyYnJG?=
 =?utf-8?B?eFppVVZiSVgyM2xidkZnaG5EajdJTC9TbDNyc2tkSUFBdmlLempHN3lOSWZO?=
 =?utf-8?B?UHAvNXhKTFZFTEZKMlNQaHJ5bE9Xb3hMK0JNUmROY1NhVFc1OVhYSWRxWEpq?=
 =?utf-8?B?NTZSSFd1ZzVKbTRWNE1IUWlkMlg2ZmVvQlRLRXc2ZUorR1FTbEtVSnAxQ2VD?=
 =?utf-8?B?T2hGQ2IyY2E3S09RWDFTTWlKempHbkFKMU94YnFyYm03alJPc2M0ZnJJZERp?=
 =?utf-8?B?SmtScWM2STJBNThKb05xOWV2ajR4RnMrSWsvU1JDaE95Q1JVYzMvdk9XWkRp?=
 =?utf-8?B?VlNJWGtRbTZMMjU3NVROdWVJeVN1WVRDUERGa2FXNTgxZjhQUEVWNm85M3ZG?=
 =?utf-8?B?QUd1b01UN3lXS0VmTHRzU2pyYStnRlZoMXpBUHIwemdmVk5DdU52Z2RJMjZH?=
 =?utf-8?B?ZlFtTzJyQlc1R1RtczJ4M1czTnRyL1lYUmszSjNUZ2dRYUh5SmxaeEY0d000?=
 =?utf-8?B?L21CNFF4WFZBVCtZNFFoeExiTlNoVG4zN1gxRndJdE1MQ0RGMnp5Vk13MWNX?=
 =?utf-8?B?TG1KdlN6dDFrSjdmKzdTQXdabE1jbk9RYldoNWhJWjJJbW41bW5hU2NmaVRr?=
 =?utf-8?B?QU9aUmh3dTBQcTZ3aEp3YzNSTmplRXZ4azE3SnVqelFYL1I5Z1V3TXl3RVJY?=
 =?utf-8?B?dm1ob21IZTdBWFRPc0hIc0hKaHoxUG1iODkxcTZsUUJkUGh2Wm9FSmxXVjBv?=
 =?utf-8?B?NW9CN28yUGhIUGtjYWVTa1pPWVV1SU5BK1JFdlhzbjFTaWRSOFcrcElNNVYw?=
 =?utf-8?B?WmovSTYrbFVYOWFoSndMMVg5V0VpZ3ZZejB6S283bnVSNjNESzBDdzNkWjNv?=
 =?utf-8?B?WTZQSEQxZ1NKMUtUYXFIQnIxdDBCTW50Ky93TVU1aXR1bGZiTkhZbmpjallW?=
 =?utf-8?Q?4Sw252ppUMKxdyOegruq3wczKhVFVCS9CT+Gt0AIn5Tp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 719b0d8a-dffa-4e2f-2e61-08de1630827d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 14:44:34.1070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zvrHLnThs49VRYmLb1JD0u4DpdanymfugBG2hrXDy9cNwyibrxbvSKH5x9m7jDB22b5uVHflz28vAtmTExg84w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7280
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

On Tue Oct 28, 2025 at 3:46 AM JST, John Hubbard wrote:
> On 10/26/25 9:44 AM, Miguel Ojeda wrote:
>> On Sun, Oct 26, 2025 at 3:40=E2=80=AFPM Alexandre Courbot <acourbot@nvid=
ia.com> wrote:
> ...
>
>> Regarding the `.into_as()` name, it makes sense, but it can be a bit
>> surprising when reading out of context... The standalone functions are
>> super clear, in comparison. But I am not sure what could be better.
>> `into_in_this_arch()` or similar could emphasize that this will only
>> work in certain architectures, i.e. it is "an `into()` for this arch"
>> rather than the general one.
>> That would go well with the idea that you didn't implement it for
>> other obvious types, which I guess was to avoid developers using this
>> instead of `into()` by mistake, right?
>>=20
>
> Exactly: the into-as, from-as naming suffers from *appearing* to be
> familiar and readable, but actually, the naming gives no hint as to=20
> what it is really doing--nor how it is subtly different from the
> basic from/as/into standard conversions.
>
> Instead, we need to add something (almost anything) to the name, to
> make it clearly different from the from/as/into.
>
> into_for_arch() goes in that direction, for example.

I'd like to get more input on that, for I am not sure how we can stay
succint in the naming, while carrying the relevant information.
`into_arch` does not sound much more explanatory than `into_as` - the
intent with the latter was to say "I would normally have done an `as`,
but instead here is a method that attests that this operations is indeed
lossless and safe".

The best naming scheme I could think of is to have the methods carry the
source or destination types: e.g. `from_usize` or `into_usize` (like the
standalone functions), but that would require defining as many traits,
and increase the number of imports - if we go that way, we might just as
well drop the traits completely and use the standalone functions.

`into_native` also comes to mind, but like `arch`, it can mean many
things depending on the context.

... I think I still believe that `into_as` is the clearest name, once
one has read the documentation for the trait - which one should be
expected to do anyway. :)
