Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A5CA1B79F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 15:11:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE8810E981;
	Fri, 24 Jan 2025 14:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="P9drWF8F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2080.outbound.protection.outlook.com [40.107.96.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C7410E97D;
 Fri, 24 Jan 2025 14:11:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BteMYvvYZaNzjBcTeSalvmy7aisxJEykH1PjVe/7fjHZqcS0SqkG6imNAlwbVIHUnJaXnVK/p/BKANYGt1Q140HE/ZPabiehMZOGr7zZDDfefU5cc/ZcSERewxHZYgYdJtWGl6h1oYHaDJglpmoBMkAOp5axAAKp7nOA/EJh0knjofZEC28o9QNWudcwVj5VyTHn5tO9+JmovGhClZe64MEsC4iAdUrGm4yBEb6A2y8fS0H8VhOf7F2n4C0vIQLjNE9NMeYXq8L0ut9uM6x8M45+WeWNVDjC9VrfqYc9/b14pX8XPNmM88WmU87c0SPwId/7HsF+mTKEIMy4hy9oMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4LrGf1glN9okeiq9ZK6WErNaH+RC8mA1oeTroBqK9U=;
 b=l2wmZ2uAsfUfDm1/7TBJKM56XA0A5i3+T51/jTbuU/FHbP2btdJVtmEpkOxi1WLmsMtW7qsLKIHRu7Q2xR8rUWpuqgv7XMU66NyTv2806g62NO3HbeCICJmqw7Pgn9MUdMctYeby3vQnJPJuLxWYGcgy5+mgNxl2RTnHQk+RUVEyyJOSJ7+Y92h1qa/Up4y7/qDs7FHd0aSr2L9aXgZMiSydbqBK64qs3tVdHNvqd7cem/JvdSI9ufkh1Ccvu5bJNpp4trANT/U4L2ze/hIRO4zE72fGXwSQGIz0Z31e86MR80SRQ2Zeml1p+xLO+K/Iurxvumi1Zr6xsvzaw/j+Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4LrGf1glN9okeiq9ZK6WErNaH+RC8mA1oeTroBqK9U=;
 b=P9drWF8Fym/Kl+BZ0JYltZ4Gz/WzPlS0YpheybupvAfUMdQr4qtQp4XoS7Xf9XKhITrQ3RX+/6TIULNsFA2CwTtnHpxjKOSrTrqcUaU8uEyb6b7eVM/7H6xzrqRg2zkBIAcoNDi0hNmMiFpbBclIm1rmobcwFdqd9wR5OaF/RcK15o0E+R87GErb+90rC+CjFkE9a72a7du1CjDAgz1Oh+EOtuGPIm1gWpBwOdml+6Nh6a/iOg2XxxjxavoeWQ72eilyhL7I7i+aBwXUcXTNmBuTziQT0Q9DYmmfZMw7/yyIoaWSujOqrx4iRmd10HiVoxc7TkIYzknba2hBSUW+xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MN0PR12MB6293.namprd12.prod.outlook.com (2603:10b6:208:3c2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Fri, 24 Jan
 2025 14:11:23 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 14:11:22 +0000
Date: Fri, 24 Jan 2025 10:11:21 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 Alistair Popple <apopple@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
Subject: Re: [Question] Are "device exclusive non-swap entries" / "SVM
 atomics in Nouveau" still getting used in practice?
Message-ID: <20250124141121.GY5556@nvidia.com>
References: <346518a4-a090-4eaa-bc04-634388fd4ca3@redhat.com>
 <Z5JbYC2-slPU0l3n@phenom.ffwll.local>
 <8c6f3838-f194-4a42-845d-10011192a234@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c6f3838-f194-4a42-845d-10011192a234@redhat.com>
X-ClientProxiedBy: BL1PR13CA0245.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::10) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MN0PR12MB6293:EE_
X-MS-Office365-Filtering-Correlation-Id: e26c29a1-7a91-4bfd-af74-08dd3c80fb55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kMbyfC3dECagzoQCmTIsl2skL9Z3wdYcDxHq/tHuHGHDjXG8WNy5IihLoit3?=
 =?us-ascii?Q?ZK9+hXNuVf4uR0zpX7qtSKY//i4OdKHTXPlaVVBgiNSIFNVRvQmN2O4/yx4v?=
 =?us-ascii?Q?jLHpJaHk68Oo9vLVeTQz2wmlF5jpl/tpDFQbmSRopENMK06duzkcLeoSDM2e?=
 =?us-ascii?Q?4pcg5l38bpukk1rAZvPsxeiHsYIgChI+ORHf1mwMCsI/teyUIR7o85+fxeUU?=
 =?us-ascii?Q?TzbNS/EXEPtMc7jP1QbW8o8/eCe6JOzs5PRD61+DcZ4vfbxtnpz92AxVJbzB?=
 =?us-ascii?Q?TbaIEV3ZB7g0FiJyJaI80JeJDbcJC4IKvfC7wZ0bqfMPv2S2EzpGdqBwQJ0V?=
 =?us-ascii?Q?tMWEaexf9//ZRAhOQ+suUj8HYnzaU122g8P5DZ5LVRrJi7l9c4Uh+uRzWBEr?=
 =?us-ascii?Q?TDIaFmT6gFd5hzko5BsDRtSDNw+4kmODwaFNBCUwhp3FsEO1twiYUx3jqUre?=
 =?us-ascii?Q?bT6TThwZ7uIBugCjV+O9asJXuQWbs7wgcVkjFvi3Q+Ku9XMw41ASxNPON8om?=
 =?us-ascii?Q?JUKyXKiE9v4jegW87bJ/8xWRUkeqNuIYkhjcDv3WTyD8k58ZOGHOTUVHggPF?=
 =?us-ascii?Q?YBjv7GtCK8cVIoCFjbPBlnKaFG9zkENxZb4dja3DS6/02cwWbgJorPp9NuAE?=
 =?us-ascii?Q?YLsziQ0wvkVFZjuR+DM7rRNqfm3g7ohEYs/89PHGE+105qol85RrVckl7W5w?=
 =?us-ascii?Q?wNq3MSfDmDEpxvOoSqczdoJCgTugVGKgHFh0WQmeZgabpB5cB1RrEs5LphmQ?=
 =?us-ascii?Q?gX8GaLdpgBe/kUoOQyvBxEBYk9J0yRFp+mx/l6byAwpGsD22xF3yC2iGVPnH?=
 =?us-ascii?Q?XV/rGVi4w86kfohn5Fc+fTqRS+c7Bgx+xxLxQ00Y8ZliI9krrKz2UP0QnDzK?=
 =?us-ascii?Q?6SpzlBpzqTZvVJcrYgNWKpU4dxic+quaytkjtl15ltTt2yNZAmdAwlVi3EJJ?=
 =?us-ascii?Q?xAn4iVJjZ8BUuL0AgwaUd1QzTQdpjtWZOB24ZRpjikFoQQTulZuMNfA0nL4r?=
 =?us-ascii?Q?ktl9rw51ZcP5y9YswokqNeRuWJOlH8pMOMctuz7sU/9GLOE6UiaBgHt30bug?=
 =?us-ascii?Q?1kyrqMp3IpRROfSn7wTSeZVOQkVOT/JXxOTFZvswM3wA+7KTsIfUvdGRoy87?=
 =?us-ascii?Q?p83xszUP9Y9jYneOQBIVdXHjauuJOsorO5l32p7e/CaZtULEI3q+YnF3kFZZ?=
 =?us-ascii?Q?hNtTVfbb2n4xrwuPONqPmpSRN/XJc2NbkrBH2tsd21uqeohJnD8Y9w9MDwyC?=
 =?us-ascii?Q?MJoWGn/1x1uFvwqgfYB92G8oe588MX312C4nKSHI+W0UFeK5v2dUfil1vLTu?=
 =?us-ascii?Q?hTh8pv2aFjlibdUMz7JiBAHTjBoa0HwGmsD2FXIvNk3gc6FcJf2zBmtHBjuG?=
 =?us-ascii?Q?4annYlNyTseDeZbIwJKvdeJ81uz8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XHX3dsPxGWGQjG+kX2cxRXbrOZHASisrNKXycyi/EYBpOgpvUqH4DC2IDiQI?=
 =?us-ascii?Q?+8UFwxbaxx4BQzygNnb0+tZEHaFLTq68CS7FLJNsMxvAKmFpcYNTaNRhSpZI?=
 =?us-ascii?Q?WyAaD0UJGqekYAs+gzWXkTm/UZDrmegBBRPkksfC99lDijDFZf6VV4mvMGwi?=
 =?us-ascii?Q?BckXQj1Eq9Y/5l0SjAWlZvWlbS9thGYpKuK4OfOFhtckkIy42AeDn5PJh1pN?=
 =?us-ascii?Q?Fr4QmHn0/SGPmZrUYIJWCBGRwp/RjS+xxccffKogUePXgytiZ9absz1hx6w7?=
 =?us-ascii?Q?unXGzGArlrPbd+bFI5IFZqzwelWBdTdFvgiDwW90IRa2RuQOu6IjY7Jqf4C6?=
 =?us-ascii?Q?ULDYGm/JbmdCpgjiNfeIlGL7vZ51CdTphlX74lhpvb8B5K9YzvR+CQP5G8mY?=
 =?us-ascii?Q?MOy1vQRBYQ9e1Ma4n6yXpVBb2l0pdli6RW9mFaG+ceziRAArIXXZOUg0uU7C?=
 =?us-ascii?Q?Xt51P8+9ID6bEeeYhN+3wlb4u0tyMeeho5RybtUE8aqYQyrDSoLTFKdsEfdt?=
 =?us-ascii?Q?x22xpMXmhJUppLOBy0aQA68TUPyma/mkizb5bi7QnRMIEgOqietBfwb5SbIa?=
 =?us-ascii?Q?gXtH7TQCLr7zr0CIayhe8618+G7N76tdvBE0OsLLibHrMT8n0yYUBnpQbIPo?=
 =?us-ascii?Q?XZ2Ui/dJkXL4slhiQ9kRol0CLT1cxlZUf2NvnVqpB4GpYTu10nzYjcSdBuuI?=
 =?us-ascii?Q?lSnjtN17u563uENEKB9vOjCw3OUqGi56VFeHUk63rxwTXmdbn10Zyzkp04xZ?=
 =?us-ascii?Q?x93vHQ3enhs+sQ1rcibCJ+5JQYXzBne8gDRRXx6pt21WJJ2HjH6bG6vEYo+L?=
 =?us-ascii?Q?MfB0pipEAZpbeYpFyZR6Yfnr0HuPe47KgK12uAgDCq55XLBk62liUv7dYg0T?=
 =?us-ascii?Q?c0NrpqYzZHp9gQKkTK+wiB8/OXv/E2ddgEds2ft5XLSXUKwvnPB9m1f2JzjY?=
 =?us-ascii?Q?FH+HUf01gjtkHkW241nKxDEdOB+NgzQw4Miu/wAoDcjTbkAZBr6fGWSd8kNr?=
 =?us-ascii?Q?FxaWPv/I7vGhw7h0oLosAVxAxbTK1Fc1B9We6o++DIk+2i6Na7kwNRJyYkBh?=
 =?us-ascii?Q?sKOUoPPT6IAogaCb1NZhFarLeAw9SMSkTJXdn4TiUmia+WdaYrl44Mo+JAP1?=
 =?us-ascii?Q?xkIAovYue765kjaul4vzgrh1lLm6SwTk1/lFpMSnZ/P0xwv8fMCL39jvCjDh?=
 =?us-ascii?Q?SCHvFkDWtsDGlC7CTJ+nQEKq+bu4ETBC7fO1MZJiFqLjjRei2UN+FTnqeSgn?=
 =?us-ascii?Q?1bMkxsn6iZP7+2lKkQ+RHpdtR6C57wWf1PNI93+VJD9h/j2fG1+4yiDBfH3Y?=
 =?us-ascii?Q?Y9UVFkq+5wQjSfayrv35HlOLS0Bogpge4z3Jm077/NXtWnm862jUclxz7xaS?=
 =?us-ascii?Q?Yt2ZNlIZY0AyrtwmqzKrAoUfOWo7xv3UtOqqVjPIBn8DHblcXHDC3Q8C9KDe?=
 =?us-ascii?Q?f0Xp861b/pDFBFW4dQtmG8po/Ja1iHU54VqFhqqnKpPXy7QDehkkvPOteHr+?=
 =?us-ascii?Q?H/2fcNZczEhIJQqI/qDqpUGBAnyL5IIGQFxVmbCOxbkCaDM4DqC8emPoC1wB?=
 =?us-ascii?Q?wGcgQoxf8NgF/Jner4GDMPaHWgIMxfNYmqtb4kxm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e26c29a1-7a91-4bfd-af74-08dd3c80fb55
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 14:11:22.8253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i6Nbp5xSPltFsYNx6ceXTeUM4aVQew2lPk+qpKtjGZZi0yKdLuvvb26BouViRQpR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6293
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

On Fri, Jan 24, 2025 at 11:44:28AM +0100, David Hildenbrand wrote:

> There are other concerns I have (what if the page is pinned and access
> outside of the user space page tables?). Maybe there was not need to handle
> these cases so far.

I think alot of this depends on userspace following some restrictions
so that the pages are always convertible. Presumably if the userspace
breaks things then their atomic using GPU kernels will fault.

So, from a kernel perspective, I'd suggest that creating a reasonable
set of conditions that userspace can follow to have it work reliably
is a reasonable goal.

Jason
