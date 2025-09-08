Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38322B48C34
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 13:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5106D10E4CE;
	Mon,  8 Sep 2025 11:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="I/Invlm1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2058.outbound.protection.outlook.com [40.107.95.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CEE10E143;
 Mon,  8 Sep 2025 11:31:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BlX9UaJ+BrrLSyr0Py+RbiYuQPwsiE1AMsV31dpXzEHqwiRwnbzdkHfBPYWE1O92NHIeHa8bBkQnbPnfgVydWqA6mSKbxWn6aFbrMh1Ppt3ouTlVlU58z2Atme9ubvxCoPm1TSvSPoFZrZsVHXatveeTyoW07SfvgFKrZwL7UQVqQYrnB36lpuqGE5cX+ZDVmtCmlgnhLMC2S9F7lyhVxTj6CX1abMKrx3j3Giui2olqHYLV9X4L9tdDi1tpj02xgAfwRjtoOEv7X1puimmZW0O5RwxKUJRDgSlXZfIoPAJvLXQ4UAcSVbi38xFRVYUZU1TJ+L7NgWtVdBxtk8trRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xifO7XYmR5UtbvuTVGi5C0bgKOWyolQy6obN8jNBq+A=;
 b=MaE3LPOa6gX5wtJ4vaTG5diEPeQc/hLEKefSp3ruOP1lkwa77gU3XZ2xSw9TefeD3nhQrBiwXtJ9yZfXMpdTsZLeTuvc4dI7uT6EwZjHCWh4TXGNjyW59Wjh0SBgo/zQAY6tHKgG7mXg4fPtJEUHAb0gW1k29OTC/wdft6j8tijWRYGeQmGHyjrBP+6tDSceLotb0psYp9iENH8VNu5z2V8os/+TIESQwznIBhrTlJsnvjRJ/I9hkNspZwVn9xqcyfXw4HfZNJf7J90fFTGaJN9QXzxJ2woQtUpunsveX5iu5/7pVzuYAEPgG12g+xmGsefSnfmbXmT66sb3GfYibw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xifO7XYmR5UtbvuTVGi5C0bgKOWyolQy6obN8jNBq+A=;
 b=I/Invlm1P9+Ckicn4IqVyOhFgv712cdXSOaDeTIT0iJSTJwdWJQoCACmrTGBmChEE4x8UikWQScxpBdOxb7xoLkp2D1H9AXd3tvttnZNUP4+070aMeSdXCynjPDqrelPyzCW5eQvPBGb/e7nOiSyG1JVGTmDQkT1s4/AGj+hOabyuVDXx3g+dab7I7SbVSq5qsLbywcqvCYDAJ8b1YLJnD0vobpVDKzA7t/16L56IY+3BJsASH+kPz3zxt8GY7tch/WmkdBKHJsgKefC4UZI+zYVsTA0iYB01PDSOisjue1qss6L4IiF4KLwZ+XSvWKPpXQ7Zj/9TumgFStFRSQldA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9)
 by DS7PR12MB8323.namprd12.prod.outlook.com (2603:10b6:8:da::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.19; Mon, 8 Sep 2025 11:31:34 +0000
Received: from CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6]) by CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6%7]) with mapi id 15.20.9094.017; Mon, 8 Sep 2025
 11:31:34 +0000
Date: Mon, 8 Sep 2025 21:31:23 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH 04/10] gpu: nova-core: Add a slice-buffer (sbuffer)
 datastructure
Message-ID: <kxriy5tmcdpbop674gt55tmcfsvdy52dnw6dw6svemj4a52dtf@xhvjfrcjxbgw>
References: <20250827082015.959430-1-apopple@nvidia.com>
 <20250827082015.959430-5-apopple@nvidia.com>
 <aL1kbG0YYy0FQCGM@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aL1kbG0YYy0FQCGM@google.com>
X-ClientProxiedBy: ME0PR01CA0006.ausprd01.prod.outlook.com
 (2603:10c6:220:212::26) To CY8PR12MB7705.namprd12.prod.outlook.com
 (2603:10b6:930:84::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7705:EE_|DS7PR12MB8323:EE_
X-MS-Office365-Filtering-Correlation-Id: 1904a3e4-14ab-4666-cdd8-08ddeecb43cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007|27256017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CV6hnkeN/rww8PtNlfWKAzVreVjYxKFTpkbnu9oaJM8Of1T0cHjqyK62wrsS?=
 =?us-ascii?Q?YtrB8Bf7x4o/V1TPkdQ0okJItLncPbpeJhcG2r6TF2wmX04Jxw+g/n1ph6Ev?=
 =?us-ascii?Q?HhAoIiRv4aN46/S8cNcbsz2HMjnLINfYm7UytVQg9r1xqu5UrVPnldCeCOXq?=
 =?us-ascii?Q?ADZ8JXZoEdzdx+R5hHsta/En7Ky2e1F69ewtWQWbQDvqLtwifwGLq0LEW8UH?=
 =?us-ascii?Q?h9/VCI095es/IAkykToNx7t2WrAZpOJyvLIAFvy95ST8ZLbMYdEu7JsIRUzk?=
 =?us-ascii?Q?5uiA1ZiESBa6/YRk0y/8ETzRPWgWvbMpjWGW7i59eGuLMiBTpcL1r23zZBwd?=
 =?us-ascii?Q?oSRVJ9Rf9LikL+nQwmEqYr+/VVNkr/6x/V2n4xALrAjb+TEBwueULw8RhY7O?=
 =?us-ascii?Q?YjqpOTUKFLxt4YOroCExj7zIF0OsNNEgpYxOnhp6pmE1SFLyfHSFepxseX4W?=
 =?us-ascii?Q?M64r3CTrwYWn9No/UCvpThV/C9tUH6ZKFEq4qutbSOsZDUf+xUcZK7z56A6e?=
 =?us-ascii?Q?8P/JHsnzXax+1rbojZ0elCDmLYoySGa8opXdKCt1idvKVJPOpkLbqRTfHjGs?=
 =?us-ascii?Q?qiuc9GoMjz6xGBZq+vpxU2wCA+AGFrPSRm4WrsS2KTumgj+JWQ7zG9aFaTqk?=
 =?us-ascii?Q?eBrzVTKiIZhv6c1/fN1q5Vmh+L0bR2ZkipaLnhrEviXyTQ5IuCsKwdSKWpXn?=
 =?us-ascii?Q?gGeT74K08yazZaYMKkKAApJR5valdxkR5acQt4Krs0szsq47SyAxklMmFMGw?=
 =?us-ascii?Q?pEbwba09LeAhFWEKZUV7MGr40+JXO+6RYzlJH3Vq37sgy9J4FrmiiA4d5a2U?=
 =?us-ascii?Q?FEpEgOkP2o/U9DndHhecp6cH0LDKUdobW8B4UAsGgbTa98RUrcbbOkVLni/Q?=
 =?us-ascii?Q?wDRpXLM5DZlb/8GAVA+vONiOXGvYJ0OXspLjY4jF3E7AGB1CSD9erHlDHF9T?=
 =?us-ascii?Q?+qn34PEPcSFM52lF50BzAVP7UuaSi1M17Y6GDKt3JszfXkaJWQ3FPIVDag7q?=
 =?us-ascii?Q?5/hmgZgRtvEQC45CM1J9cm2DydeFGg7/12jS+cprCYbiO6snxLLeHIgQKHwl?=
 =?us-ascii?Q?DwsObiIklUp6nihg1YRtpRWkHNL7vbNhdhmxZ7GdDWSHL8kf08OxJRds1ESi?=
 =?us-ascii?Q?7iwcJbHzaH7i6Yp71pY4PeYGUxVrhYPclsVFTDgMdlJXMSaRV69U3cSOYsrQ?=
 =?us-ascii?Q?i2snRRobo3AXc0WEpnC7Ru5qN0bc28xXegWvmRWv6JE3f0tjkswOUDgbzd8A?=
 =?us-ascii?Q?zT5FIQedrgzJSjeMQNuu342TCj6w6EssSoVJEtfV5Axs5ThUdSrvN3mn5qeO?=
 =?us-ascii?Q?HhsXgiG/hgo4pGS/ZvyIYS+7jQ6oqGVlcxM5dCZou85QEn6yd7730VGBjdf7?=
 =?us-ascii?Q?hlurvXErFOsI8btOwzTAv58A4pbgqtnj+HtBrKHv7WDK5HTk6VHpTjMJ+joo?=
 =?us-ascii?Q?F3HfntiiIOyZQgGKS//o2CgzTGGbLsCHaBlETAnW1bQhLJsBeT2N0Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR12MB7705.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007)(27256017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?apSPLB1lDS6C8Pe4Y07PckaTcRBNgOggUclD1U20+6368f6A1md+WBER2/3Z?=
 =?us-ascii?Q?+bOGQ49sV47JMteHaab0Gtz41spTj6wqybIQxEOGpWsT6dnaY40kCSFUYe/w?=
 =?us-ascii?Q?O0XGM7ypnftWdw/QDBeDhntu0+ThaRaxeaqdeR+hYHH1R7wNlPo3SJ10ZYoZ?=
 =?us-ascii?Q?9KtIRPJ0yJ+roIaYrwB68DEtZZ70zPHmqsIlgyZH9A5lG67mlbIQ8si9l/FX?=
 =?us-ascii?Q?QZ84e9e57ZFNQUQZjs3kPcDbBeq3Q1k4N08lhgiKnwaQtTyKsGvzsO7MOxeF?=
 =?us-ascii?Q?Ew5CQZ0ADDKN/6kK82Tm2JZVe233US01QwCOjlLwMady+fA53+ZC58fD5hli?=
 =?us-ascii?Q?/NZCcSc2W4udPfqsYMnic2mp8dALhlFTGy5AYOLCcgB+UrTNU920ATrClzIp?=
 =?us-ascii?Q?7kke1i3R0SFp/z6jMkpJaGLNDJ9Aqj4Rpk+Wl5k+yndPkxsAFYeLIiWIg8Dw?=
 =?us-ascii?Q?UfJwYEuIohwwtnHvzxc9h2qW4WgXhQdrL+wyYMgHlOf7Lcsco1BxbKySxT9Y?=
 =?us-ascii?Q?rICdjm8v/uD27R4wywejV1E/V3eaqCxLGMVhqrZ167bcw2GhnORNv2O/F/WS?=
 =?us-ascii?Q?3TryC7yjslaY76YF355blHWblmPbjs41/A2q5iLMqGlnY1Sh4XI3eC5tlFMA?=
 =?us-ascii?Q?zMRaAkWByNhgbD4ZdE1oICwens9ev21jmccvu22F1lGX4xglmWspX3MUfXWi?=
 =?us-ascii?Q?oO8ZpT8nM+um25RiTSd9P2DGQuBIE0rZnjgNOtMkIsEPVtVArdQB1DP4Su/Y?=
 =?us-ascii?Q?w+DdC9u9OJScyTNMdyyx5pAmvP/pTUKXubV8Kq8jtoHaRhxFSz8Sl3MVE13l?=
 =?us-ascii?Q?62m8S2/lrnzZ+YvGhfJA/3j67+lsqvYvzDY+ESIpt8dsth5JZjMwgkhvjXhT?=
 =?us-ascii?Q?DikZQwRH9dj1x9RmUGIMZN+GHcTp7zm+4h+fG+mMmz8OCLqu3pRScTn8JD8Y?=
 =?us-ascii?Q?ZL3QYWL3VeenhPkJ1WThAl5VSKAOAmyp5pdTKmO/xhz/KQywfuRNG5AaVobf?=
 =?us-ascii?Q?uIB0Wp9f/uBW1dlhxMk5L3AAwR+CYNiuWWpK7XPQwTkGjk4Ytqxc6/Z3fIob?=
 =?us-ascii?Q?4NLfkYjabSbsPCzf3XM9mIHrhHWBNHd1+4BKYADqiiJRPw9Mdc10JJRcJuZ7?=
 =?us-ascii?Q?BshuKxB4AwR81fuTE4OFt7WvQg5tfR1Ua6TYLiYgbHy/EDXkfViWFun16jm+?=
 =?us-ascii?Q?8qGggQ/D/1kGJ6VDGQo90p5gU1MEbjQ22RLCVPuT15YNSxvzfLnADOENPDMT?=
 =?us-ascii?Q?cIEJ2zBmI6kgD/mz0b/QG/ODS3mrrb3WiHZLBXVcIH0RaqNcte9C3a1S0nOK?=
 =?us-ascii?Q?XaY3TkL2Vghe9h1uwe439sfiYTkv70s2burhF6OwWWlYT0OrC6eJFIzyjr19?=
 =?us-ascii?Q?tkZSHYV0nlPYimvCVokZLIFZMggP1mKBEFm55OAW8w305xbEVrbVsaWN2ZOM?=
 =?us-ascii?Q?TlCRDuaz5xwB5MH8cXQB5RtNZK4LgAiomtEBToDLbZoxrYms0sZbfB937igJ?=
 =?us-ascii?Q?aEMFJgnlJg/qFAUM9a2Z1hrhx4dSNlvmdNgM0+f256rD3I9QfNhkSkvSvhLe?=
 =?us-ascii?Q?sHm5pngeD2SjdeESxWUWdpnqOic2XiF23YqIsrKG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1904a3e4-14ab-4666-cdd8-08ddeecb43cc
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 11:31:34.1868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WU7rRkE6l44/u71GqK8MUSHiMzvS/VjzesLZI9qVSoGqPSw5L26haJn0c7wAu7K1TaIGnH3WSYgguK47Xfazag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8323
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

On 2025-09-07 at 20:54 +1000, Alice Ryhl <aliceryhl@google.com> wrote...
> On Wed, Aug 27, 2025 at 06:20:01PM +1000, Alistair Popple wrote:
> > From: Joel Fernandes <joelagnelf@nvidia.com>
> > 
> > A data structure that can be used to write across multiple slices which
> > may be out of order in memory. This lets SBuffer user correctly and
> > safely write out of memory order, without error-prone tracking of
> > pointers/offsets.
> > 
> >  let mut buf1 = [0u8; 3];
> >  let mut buf2 = [0u8; 5];
> >  let mut sbuffer = SBuffer::new([&mut buf1[..], &mut buf2[..]]);
> > 
> >  let data = b"hellowo";
> >  let result = sbuffer.write(data);
> > 
> > An internal conversion of gsp.rs to use this resulted in a nice -ve delta:
> > gsp.rs: 37 insertions(+), 99 deletions(-)
> > 
> > Co-developed-by: Alistair Popple <apopple@nvidia.com>
> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> > Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> 
> This seems like duplication of the logic in rust/kernel/iov_iter.rs [1].

Conceptually I guess there is some overlap. The thing that's different here
is we don't have any C version of the iovec struct or iov_iter, and AFAICT [1]
doesn't provide any way of creating one from within Rust code.

> Alice
> 
> [1]: https://lore.kernel.org/r/20250822-iov-iter-v5-0-6ce4819c2977@google.com
