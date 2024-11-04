Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC5E9BBC30
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 18:41:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5034D10E49E;
	Mon,  4 Nov 2024 17:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UrQc1Vo4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2074.outbound.protection.outlook.com [40.107.100.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DED10E49E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 17:41:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uOifjqCxv/yojaPVHMQhmYra9rY8cDB1ixa5CVppuKr+2bONc1mDobcLbInciD4llbuPo5QThR+KNLpXKbKNPXgTvTXGWhCGpYlqgLeC4uIz9YaAGMegPpx1RmpC/DaW7o9kmNn7M57KksUuG0FZT97OT5VpbpdpJ0RInTWSPQnoA4O9B2DZrWm5FuUKiuXrzSHt9r42rw3/YiIvfq9bmSgKv0skaRX+mDmLDYuE17aWSY8fn6xuk648wcRC5KOjst7m19cqYYwriWsOBWK108CVet2RVaNjalKfRSJKIGrHYSaXgn7WbZzwtOgf9o0KZTf3c/1XwBCfeu72gBENnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxDCkgbT5dHZOmdk1TCC/CwuNM4sI/Ox9Ymy3HvdqoA=;
 b=PPjjOP6g7tFhkQivIYKhiO2DwRMvJ40Liys+BDaMFE25Y826uvDqD0HogFdb1q00qXTUMKmuoQQB9xSTNud+r7n2Hz5Vn2fh6MXwNgup8fC56waTo5I/LEOwZRdHsCJ7FdegFS8OFQXW5s3pteEb75MWh7DY67JJAJwEWT7zHcXckAqd6HtYWXk/E1FH0Fytw+s/YQiwsQXYpvHXg2bebgDz0Ea6UY70a+oV6yX7WvN0VaaNR7ZVvSU0N+y1C7rFi1WeWU/IAHRFhLCSbyLyxl0UJbq/ouIkmhWB9IvQehBSPXJDYPgiGcD/K2Be2d8AcbQd4f9H1B5yM/xmPksvLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxDCkgbT5dHZOmdk1TCC/CwuNM4sI/Ox9Ymy3HvdqoA=;
 b=UrQc1Vo4LvKoKhXRt7dHnnCQtRM2F9AuCnnyMMOM9tc1bi4MZ8pv+Kl3rDvazFCBOYeptruUoOymWrzeF5VMUDgLdgjKadtoMAKQYMjJnrM+m6UC/njGWtrJctczd/lGABtCbtjtpwPkhK0XgzziROaYk/glc3OAKuwNUs8RBx0Y8wo+E9+uKUES665zXH4twG51aXOZRxoASFRzxbeWjKCWewKKgs9k7kQdLMAXc8rLI6DIx/jLz6R6Ax39LkdFDY+Andz6JTkwGR1G1+53oHct33OEtD2S2FDiH2Fx57xoLgQPQDI3BRBX2SwCiOKyU7FPF/bJRMkbug4imcxQZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Mon, 4 Nov
 2024 17:41:32 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8114.015; Mon, 4 Nov 2024
 17:41:32 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 Will Deacon <will@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: [PATCH v2 0/3] Remove split on unmap behavior
Date: Mon,  4 Nov 2024 13:41:28 -0400
Message-ID: <0-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0416.namprd03.prod.outlook.com
 (2603:10b6:408:111::31) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CY8PR12MB7195:EE_
X-MS-Office365-Filtering-Correlation-Id: 9da33614-15b9-438b-18c9-08dcfcf7ebd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xeMgYsdKa9kcD7vz8qW5MpJHVKigo7sfluFmujjN4P8+A7o9kBxCM4wsOlot?=
 =?us-ascii?Q?ApaY/F41b9jIIWiDi4EJu86ZsVPrHsWcY6Iuv+fkSSayD5Xe5O8aoSs8kDKc?=
 =?us-ascii?Q?+Gx+oXrHVQACSOIkAo+uSaPbogZZJfVUcDBSOPxEkxUWhoUBAsg87XCIT2Ga?=
 =?us-ascii?Q?8EYXbhqZwCeSJCNgsRTzsnqwgUlkejGh/3W/5SKnWudaXvveA4IwX5HG7UuJ?=
 =?us-ascii?Q?klYO/5U7OumfVLpFWbeikJySs/ChNtHqpk4AIdX4tbsE5Q1/3UVS/ciFa3TB?=
 =?us-ascii?Q?zV8Pdvv+KQw0lJpb7RR8yyJzqjSsSB4OLf4sPAasnD0ymNP/5ozfVap8892X?=
 =?us-ascii?Q?aosOhLP5s5suqkasQxR5etyQLT8uFoB+xFOf7/rZg1XdYLjY2qf4g3b6LqIw?=
 =?us-ascii?Q?o2v+uN/9eD/yp6CAd34EBKXl2jBx+cYUWd6kU7u4j5k3FeBJMQbFHwbDVoNQ?=
 =?us-ascii?Q?XtU58+hXiFtxHkqWA60MZhBrZsk89WqQvsL1fuXNyiF1A9ImWKqw7tgBzuAI?=
 =?us-ascii?Q?gKRQhLyVhvbFLlaEUB9vo5bGJSzYL4Xwoh+HaFZa91d/SXj8A8MZRVdIqXkX?=
 =?us-ascii?Q?qggDd4gKH7pGbvstJjBtnd7FJzdw8CEiDqwYHCbe5ksKoy+FwhiBb8MD6AI8?=
 =?us-ascii?Q?xy6EiWWk9jrjC21vYK86VFPUz4/pj6SNJI1KmziuRnHmJ/lcJfnNghnrzulU?=
 =?us-ascii?Q?O9r4Gi3ygFrMJ8S2/mc4ZjXMV9iY4sjMhE+aA+mM50vFtJKT/PbLju5wCdD3?=
 =?us-ascii?Q?EhHCVOmVlUGxi7NQEgaGSQPLjP02QSVwWooZhMpHcNvZfyitFpp2IRYyPM/B?=
 =?us-ascii?Q?oQJDEhcEcbRi2//0HU/fWve2VUua4NEz7JCYpaq37wEBSdzeO1S21KBgE4QA?=
 =?us-ascii?Q?Wv7mnTleeWDTrUaHuMuuzkxQHbVNaxXYkgILaRCvwEdCNwhH3L0S87jvF8ZK?=
 =?us-ascii?Q?RY9Uz7NyCOdOERJ03n1JOp12J1AaSvHWjG3LZVP1+yIDPqgqNyPiJeCy3mLO?=
 =?us-ascii?Q?ee28wNPTLM5PtCWtPs7xjeNXP4Tl96EC/if25WtTP1CqvQBcBRzO5+qaitHa?=
 =?us-ascii?Q?vnm7ESZWSqPoYzL6rEWt/psIsKPosURdqCQBT/KERMaTCvIhIKRys7Ulus40?=
 =?us-ascii?Q?QC1DaBB4eWYFP0HxeObfgOAVCv5EtRpJ5xk3hg10+LRvlWzsm6+mehoQYp8E?=
 =?us-ascii?Q?RfTmIvJCUpeJrDppvnwrqH0jtnTcxjOIj1CwFaVnfw3LMBi5cLGStnY3iB8Z?=
 =?us-ascii?Q?/5ZpJiY8nQKsYjWzw2zoRzlkq/isKTbkwAOFSUCiKOjCjDkevkYqrHLzTXjd?=
 =?us-ascii?Q?wqTaRhCQqB+vjbivGHb2wqX3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V+TvrkY1p63cjm7BZq0xmvpiTI0n70C1gEJu74d7/1A/AxY19yvSX8lQhQkn?=
 =?us-ascii?Q?qgjUSQkYio9p1hThFvNVt3AXrn2TD4hdaUlilEcsUzlgJRi/tChVl6ntB9ki?=
 =?us-ascii?Q?gNriGUz3hXGkOvNFi8luwaMEprl5e4fSM3bIxoF+PtbaASN48UJSBQtHbIQr?=
 =?us-ascii?Q?mXYR4TC6XMkH2M0jHmd11hfuQs7hwe7yY1a2BVy/NVSUc0eQLYhk/k29X291?=
 =?us-ascii?Q?GcyFLCwHkxM/s6r7rjGAeHgSpuhZWHWUiCAy4kJcrK2bEJ4fq0vX8I3oFRlN?=
 =?us-ascii?Q?IR4uxRDcqtbojxdb1qouctilNSVU9FJNQw8zt955ZUqQ0OZ2M4lzXn7lkD+3?=
 =?us-ascii?Q?FuLBjRL5CsmiswsXhmu6LD3OddSEaEqMY9K0/J+7yTrCdouclm/j6gMWNCW1?=
 =?us-ascii?Q?O7PBhw7Oh4/ur5fWVLVUw+Pox4DCc6nb+yo475bRCM8gnOdblQV2oWHshZa+?=
 =?us-ascii?Q?t3eqWFYk36kB9uJWJuW2UkmwTwj024FMaCfnZU5dmiyuvJV9wKLOIQhIwG6t?=
 =?us-ascii?Q?uGEOjcib8h0vkGrWQ1zL8BFXJAsibx9aluV3y/eLbFnXm8+9iCoEZeFarddf?=
 =?us-ascii?Q?ZOnO2rwYWeD+p+h6fYyWEZzI3qoad+Kh5jFiYRhWAjVRv+JUVzpeXm+p8KGJ?=
 =?us-ascii?Q?TjaeAuBxvVK+ubYHrge8bEcLZwPiiaoiNPTrdD+ESi7f9Sz3jCjGZI2WfOYN?=
 =?us-ascii?Q?rxgFgtAEk5FyBPtM93UGS+K1fgbxTDdyePJvDL2rmoWBkkG39kOd0Uh3T9ov?=
 =?us-ascii?Q?n1izCcG8pyXTQfkh3zwwicpP2HmA28cqwg4PP4OCTwfBBC0+nPbxfp7qjjg6?=
 =?us-ascii?Q?LSQNQ94ECX+XB3k+WUdQY9E1ORPIJzv217eVCZSyC+Y38J4Tnp6IVkHfsSQe?=
 =?us-ascii?Q?OhfpPOgtjL0MKRtiu0oI1REcKqmRdgwbw/+OhrnbmUIZNZHrYlD+d/Y1vNUg?=
 =?us-ascii?Q?k5QPYCzYcVe4xMsgHUZyoMo+MWFNuJESCw6tqmweinlh14R08+J2jVnImIym?=
 =?us-ascii?Q?W50hq4WoXDNpoKZbnnkIxwJyJg82Ewm0U0FJlpl8RWmztX+cdDBU1WJlQVYB?=
 =?us-ascii?Q?LF3laFCQf2ae+VzNtuH7y74HA3BdvA2xMUnO2cL1AnNl7D3GMUa5Sdj+7FZ2?=
 =?us-ascii?Q?0G767CcEbC2Hyl4PJwVw809Q8tRe1yaLL/MKKaaBO1y+zMOz/3x5QpZOXMVb?=
 =?us-ascii?Q?cbgWWDEvYDh5BTJzAG+FH6oOmdY5tWsyAE1KnizAuyzJSlL0U/Y1lbe1SYin?=
 =?us-ascii?Q?2PgxL4t6ZLkOO4HS2rwLRsfiTwmET1cxApPlwPsPWAcTltPncQGXV9yOktt6?=
 =?us-ascii?Q?PDTsVrXfD/0XUNHDhrOPHqARU5jwgPySVYmFclL4crO9afapjVWEdYmJ9teG?=
 =?us-ascii?Q?PWdK4p5DD0MhL9T0zSvzjSV2aZEX8x/47kn2CAwpC9jnBfzLBlyFb0zMn7x8?=
 =?us-ascii?Q?2GuTqHPaOPXofveVBG8/TeCGN6wjf+o+SU08vriQs2DVl+fQjmoKzXTEBkIW?=
 =?us-ascii?Q?V9X/vlaMu/AKAKeOpAwz9avVvKLjcjgslv6seAVWyRP9r3Zzez2yyHnHYE54?=
 =?us-ascii?Q?GTs7JCi9klM6nfoPR9vp9fnb9ZBoLHwltowF2RTL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da33614-15b9-438b-18c9-08dcfcf7ebd6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 17:41:32.5657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nPJIPodCfXaQW8vu83i802Af4nR6LvMRwyUr5bfYLuDyAnSgZiPLyrAANQYZk8ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7195
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

This is the result of the discussion on removing split. We agreed that
split is not required, and no application should ask for anything that
would not unmap a full large IOPTE.

Instead of split the two ARM drivers will now WARN_ON and return 0. This
is in contrast to what several other drivers do of removing the whole
IOPTE and returning 0.

The kdoc is updated to describe this.

v2:
 - Use WARN_ON instead of duplicating AMD behavior
 - Add arm-v7s patch
 - Write a kdoc for iommu_unmap()
v1: https://patch.msgid.link/r/0-v1-8c5f369ec2e5+75-arm_no_split_jgg@nvidia.com

Jason Gunthorpe (3):
  iommu/io-pgtable-arm: Remove split on unmap behavior
  iommu/io-pgtable-arm-v7s: Remove split on unmap behavior
  iommu: Add a kdoc to iommu_unmap()

 drivers/iommu/io-pgtable-arm-v7s.c | 125 +----------------------------
 drivers/iommu/io-pgtable-arm.c     |  68 +---------------
 drivers/iommu/iommu.c              |  14 ++++
 3 files changed, 20 insertions(+), 187 deletions(-)


base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
-- 
2.43.0

