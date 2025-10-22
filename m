Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D172CBFBAB9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 13:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039E810E763;
	Wed, 22 Oct 2025 11:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OCWFBLFF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010020.outbound.protection.outlook.com [52.101.46.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9BB10E764
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 11:39:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aLKXpbgDB+BpZjjvsMpwKh2k7u+wjda9dcfPV+AeVCIDTk1MF8qmxxmTPpAZWAqu6fZwQ3ZX2Hba7e0PRYLmmUmNUmPHgKnQn9ixORhqhEZc5icHlaDQ6KE4fyrO6KFMBsaohjCqqk1AC2V6ubdp+Fgb2MUH5KDPBVqoeCqt9JQyFdAqiwYDDtvmANWyl+yHLdAt6wW4wUsWXZWYnFjTCxPmiNQQhD3N3jkdax36B7n6qn/kO2ipIwpY9m2oZ1Jb+ebKp2Fe/TzJoMyFmRehWeaAvQcqsMyBkcacem42BDUaXFKUe+vMbNdeIsIDcQlrs08hXqlGh0iLHnuUW18dGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTtVOw2VIMWaeIE4dqsLwPxGHKwqdsL8xGT9i4GE9zE=;
 b=a2ZvGoBa+xRrjTc/v1F8IX3zxPSLogpT4fQW/bleWRzrH6S+pHzcjnLbgUstYAcSt489PlKEMJMrcTxO2fzCuWCOKi5f9Pt72/20Lq3w6qL3Rms3MEdJr1HE0i3fxteo1GBacilOFNlBdgg0w/047Sr1p1iCgao6bjCCLY+iGUPf99W9FqBfNkE1nNv2NNgmbvo2mvk7J7TLLDeE9Oo/1S6kCsZ0cB9uSjcdac0c4QrcmunA42rB5iNSmZUSGy8pM9HV5IrG7uSQZ5LfFMN108chEzaUqeC+/PjuCOHaKxZOeUkK67OU1ET18oJa3PIbXphXZc20VvX1fsTrACk7vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTtVOw2VIMWaeIE4dqsLwPxGHKwqdsL8xGT9i4GE9zE=;
 b=OCWFBLFFIjQ4wkj9rtX9dBLGVFPQEU6eHPc4TVgl3V8I3gWQpeoqBbNg+OILssVzTCRQ4shOKl9er/oGJA8tN19Ww1jBDoIDByPwJ6t1qN+MvfaiKBmb2nl2DgziU4P/J4WgwLgogC87IaMZFBE/cbHhE5l01FwKt79wX3QgwFiJm8+aEvXIX9Yqude7/4AE1r8Yhf9iucuJOcglSCLYEIBLuRCu6h/ETkWSbuh1MTPRRAcSCQjBVXWXP+nPJ8e4Mpi7Znb2tr6GOAlZsbNB1wb29LYsGYnuLal0BLwlO+XjATfzRsIRuu8MSlfym1fu7/0uq6XU9XYGDBQbq5nB8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by MN6PR12MB8491.namprd12.prod.outlook.com (2603:10b6:208:46f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 22 Oct
 2025 11:39:00 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 11:39:00 +0000
Date: Wed, 22 Oct 2025 08:38:59 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Leon Romanovsky <leon@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Leon Romanovsky <leonro@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org,
 linux-pci@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 8/9] vfio/pci: Enable peer-to-peer DMA transactions by
 default
Message-ID: <20251022113859.GC21107@nvidia.com>
References: <cover.1760368250.git.leon@kernel.org>
 <a04c44aa4625a6edfadaf9c9e2c2afb460ad1857.1760368250.git.leon@kernel.org>
 <aPHjG2PS5DVgcG93@infradead.org>
 <20251017115524.GG3901471@nvidia.com>
 <aPYq0jQZOrn-lUJW@infradead.org>
 <20251020130855.GM316284@nvidia.com>
 <aPiDACJHZY7Gu4y1@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPiDACJHZY7Gu4y1@infradead.org>
X-ClientProxiedBy: BL0PR02CA0071.namprd02.prod.outlook.com
 (2603:10b6:207:3d::48) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|MN6PR12MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: 31b0f1f5-ddd0-4ed7-193d-08de115f97a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WMFVrojgk1zDebrVlDS8NJyKw1YfCDj574XDv5e9S00BAUwEas1ta8n83in6?=
 =?us-ascii?Q?mzgx/51yxz3FtlistESu4M5u/zBwzLpYo6E9A8xXTuMzHGNm429Eg5BC/9wK?=
 =?us-ascii?Q?igTta7zj6flTAHlEHGls3sycZ84Ff9ugAjQB6ekPt5f+fwqTp8PecbqUkFoK?=
 =?us-ascii?Q?zf8nczicMTF8yqexx7Dnrg2Xt/TdPtsUPz6d1LVyloCBONZtCLUiJIxNpgKl?=
 =?us-ascii?Q?Vla+4Cw2AWDqOcFIqxQF3HbY3DYBOg0oqKuV4Bj3J/n8H+pmPGQeeJAAk0Fi?=
 =?us-ascii?Q?/mp/CyqpvbhJNLJZE9FzWFiE5ryjBGnvNBluUklkjKqfB+VJbbt7Z5Xg4bl/?=
 =?us-ascii?Q?3WRH/3Oqe2I1IxCIPQQQYZYqgykDjcxuJsBAY8QAVzpoQfaC66q83aDtfcIh?=
 =?us-ascii?Q?HZJ4y1pp692Q86q/WrsxUEIVztUk0pJFlKE6bCjOE3Dfum2FmrxTOwQwYqcO?=
 =?us-ascii?Q?fCZJRNCedycl6ZewV4amCHs0dtY5FosB8WukI61QZs4BMl9O9K2sG7uydk2/?=
 =?us-ascii?Q?uIinxSi4FhAqt3PHVuZNs/A1yABeFxNszTg2UrhwACseB184/Q6rTTi8WAFq?=
 =?us-ascii?Q?t0x63mk53TdHgtD+ebjXbiTpALYKTi5+rTEJUsDEFjh82K1yADzS4ZDIZcop?=
 =?us-ascii?Q?MOoYoegc3h/S5g7O4tR8yMjZH157yL9fR9eIsR1Zw34cTuchELN29urNqcD2?=
 =?us-ascii?Q?DBOG8jqHZBK/8dNLLYnZo1tGW/w/dzy9ukg9j0el3ADog88FnK43fV5lNddf?=
 =?us-ascii?Q?c2M171KxOZ/AsKGDyg5mwjWM/5/sa8X1yExkUu7lwvmaWBISdi6J7NqSI7mN?=
 =?us-ascii?Q?v/YF8R3xfqlNfxhRso7NtrNVlICI47nSvmWM+7l7ZIGcivf0Nhze1uYQns+v?=
 =?us-ascii?Q?ve+CRRm+hu1TNYnGsXipuGa4SozBZW6ZiypaHONpuuZ/iyOCv4P/9mIkTKAr?=
 =?us-ascii?Q?k4Mu5pKWly9imK3M4I+hZV7Hu1RMjAmpzMvXXqHFemGZXFuXxlz3kKb3z8yE?=
 =?us-ascii?Q?Vy41Q4PJhUrMPmAIY8WYlQHBlS0ZvAHQg6J92D/DEEzUXssNswmi8YIfF5mT?=
 =?us-ascii?Q?RLYXX3lGYchr29xbGPfJffOVbLnMkbWSXPvZmaEzW8tPlQkxpdNbH+ZTjMyv?=
 =?us-ascii?Q?ODbjJfQpsHqdbc+VR6gjKcvweQvwsqVFgNu0Z5D03s76ULFdXGRmGFbg0Qsr?=
 =?us-ascii?Q?S4SjfRu7cmUeQBy5Iag4E13lpbU6kDKWoqTj8KgzJJU+cM4bXDhse0aT917a?=
 =?us-ascii?Q?0EbaO3jSh/d4ovL+PQo4nbeW8gz2msIqhzlQK6FpM8h2ETAaDpoMDWL1rLkK?=
 =?us-ascii?Q?TdliszJZ2gQp2sJJ1tl2lYFjTwmgeC710DHEQd6lPUdjchwNgbZYXAHNb5jW?=
 =?us-ascii?Q?0ZnRgdLZf4SBOFPlK5iZM6y+EXMZPpGLgPkkiFHFssFaMI2jh1r1BrujNVU/?=
 =?us-ascii?Q?jxkTyCT8grAKwg7vCI05zlrs6z57hgix?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JAp/cLBxMF3eGCTANBuxo3pwIRjMinlOdttteNo+BHFFFPqFijjyghIWEQX3?=
 =?us-ascii?Q?OGyufYZ07tTO74JmoLiCMZ9KcIuL4yjZDfPb0bqyBvwqX+KxAhlOcI9OJeqh?=
 =?us-ascii?Q?JdpaFu5fHvXJlrkp8RtlFFpDQH5b/4wbNMxZBcjhIktisq3mZh8ZjjInq7ip?=
 =?us-ascii?Q?uN34OPqAs1eOXh6sFiyiuJXtKgS1fWQgqt9/XdYg40q8kuVL0NVXpFQ+PTpP?=
 =?us-ascii?Q?HN55GIyvfFQWks54S/tZudvQT5+tpqY8pTWXQEA6of2fGZsWIsqRbLHiSycC?=
 =?us-ascii?Q?/CVk8L0rdi0/H9dQnPehSu51+nCKCU48GIJZOYqXx+0ch5/5Z0iQ0QbqcKBc?=
 =?us-ascii?Q?pfTd1tGxY3JBNWaeoSvyiVmvmWTz/d4dlWNveFl7AdqIN3QVZxMFz6TfbOdj?=
 =?us-ascii?Q?i1ThSWJmtMnENi0Du2Wp1qq9Y5GFnxq94mwg51L29O2jLwYQWtFW7Uc2kxDR?=
 =?us-ascii?Q?3VK75rvX/aNhLxhA3Ll3oWswdlLTkCeGF/a/OBiwUhGK9/XWlooUBwx6k6Pg?=
 =?us-ascii?Q?bLzpUVpHoIucIn+JVVJ4/a+Qb/rjWwHLnA6kSYi99W59WXe3sAcpeZqWZBhI?=
 =?us-ascii?Q?5Svn/NjSeA7tFw3pwwtMFcpRTrHCjQULq5cAS2NYqEY4/EC08H+Qrk6WH1Jb?=
 =?us-ascii?Q?HkwZHLF78lNrxbO8ZKlmggmUnA5GT+dq+SnDWLcEugRyfZjVTswQ4/EE2abN?=
 =?us-ascii?Q?PJANte8FmFgzibkcv3q/JQJQ3D4NV2CDu0B88dwCh/URreBXBRFbWpTEc5zB?=
 =?us-ascii?Q?AX3F9nRaTrkW0t4qP1+LUNAp90gZVG21vtVtHSBHnw6PkBiW5Nuy/5NGmpLp?=
 =?us-ascii?Q?joQTWzLYF9t7W2k0qdDZoJXk0s8U+pF4bIodSZsKl/Xk+UF0rj83oXDMZC4f?=
 =?us-ascii?Q?LL+7w90NR2dDRa23J64AIOOGv5RBQH4qOxhwZ307Qawub3d/TVW0xXM7fyXd?=
 =?us-ascii?Q?jxwolhBt0kRuWLirg2Yw7jH1qASgSesX5Zi9LikJgN31lIVPBCKB5dtJcw3K?=
 =?us-ascii?Q?WgK87jWb5H8mkeWeY1PS6/ZGSne3mfzFhmFN1m8+OOHwcOqa42tiTK5uJzP1?=
 =?us-ascii?Q?D+skafbLBsjF0ZjudgCnpQeXpxG6bMNfEwK7G8G8MR3r37rrdZz3jocxS7ee?=
 =?us-ascii?Q?70TDXAydA6nwtOahD0L+5dg5xNPVshN7yw3CmdWVDhJKKys7IcG1xMMLH7be?=
 =?us-ascii?Q?ylM9e6bJhcz+ChKIDpFPb0Wpvmw0bo3h9qVqO8uiEbnQTUbD7NUm/M4CRK/j?=
 =?us-ascii?Q?JIvKULXrKFVmLRrbgHFlD2plx8ylbXkfuSmnrnaq0BNr/Hh8Ca8VoEVyX5WN?=
 =?us-ascii?Q?LuLtXiQ0434+ayMgDySOLGRz2oBC6DQzx0tAWvEZF157E8JQzDHrvX1OpHMx?=
 =?us-ascii?Q?RVTvpDKk5gDQybiObaXfs1sOg+vPArOy5I90QhmQ8MPHgpjy/tsru1PnIFf2?=
 =?us-ascii?Q?Q5lEz2/JbP3az3ysVQma3hz6ED646KYo2rmxNEbn1fOtw+G+zHyrjRKb9k6K?=
 =?us-ascii?Q?FZuro+8oJbIdw0Ow9WMflXZm0+80aXLoI6XExt4/lZfTEcPI/qt9UEYcFeNM?=
 =?us-ascii?Q?Kq2R+IL95pthnwY/yO4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b0f1f5-ddd0-4ed7-193d-08de115f97a9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 11:39:00.2985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AwVvZjaUxHfam7TjsvxTg8wT8OApxG23hlxOU7s69X5Z6j8su1yaRymRsM12q/cJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8491
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

On Wed, Oct 22, 2025 at 12:08:48AM -0700, Christoph Hellwig wrote:
> On Mon, Oct 20, 2025 at 10:08:55AM -0300, Jason Gunthorpe wrote:
> > Sure, but this should be handled by the P2P subsystem and PCI quirks,
> > IMHO. It isn't VFIOs job.. If people complain about broken HW then it
> > is easy to add those things.
> 
> I think it is.  You now open up behavior generally that previously
> had specific drivers in charge.

It has always been available in VFIO. This series is fixing it up to
not have the lifetime bugs.

> > IDK where Intel GPU lands on this, but VFIO has always supported P2P
> 
> How?

It uses follow_pfnmap_start()/etc to fish the MMIO PFNs out of a VMA and
stick them into the iommu.

Jason
