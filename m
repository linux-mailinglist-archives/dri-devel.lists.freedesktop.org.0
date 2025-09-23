Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDF5B9711A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 19:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8BB10E678;
	Tue, 23 Sep 2025 17:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EaWxsYjh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010021.outbound.protection.outlook.com [52.101.46.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22FA10E678
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 17:43:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Du0RYRFBCpSbdAbgESBcYV+wI/TJS2Ta6twbcoip1O8k7VxO7aTGyz8hrR37MpzzdIRcTVBefzIOW+sXcfEy4QNrBcd2eu6jIgzssUbmh/edr9t2oy3bQQDuJHTc+6HMJzxC9mZsrN9E2SxnvrWeIdDz9vaY9/N3ibtkjWnlYvdxXnE4pG001+kuQ/9ABjaBjThPSwlhwvL0eDLYHwqye3c8RFul3qpjY0LM4mM24xE5ShOqAyDyJV+hzPfdXT5hFLUquIZSSVDg3VBekIEVVGjS7bdzjTG2dA0RqEPW5JC88qgedpeqB+BnrD26VwyTyizcVhQbj9Ibzts++XYNNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQUh9mweLCM541Cy/QMXzIeHtphgwjD4nkBl8XQfyWs=;
 b=dkv/fvuZPTdDJoqsPdMuXmcSkD9PadBD6g2NWekNH4D12T3KUqMDPqrOHWs9AzYUOEgq8hzsGP5tdUZ+k0OKOC1atNeTwiIEyj+AZKD3QTrD9dI7jpCk6D790YqW6fGMCMKrqfg5A9Mqsdaf/I0IbNEjjcWFkJPbWL3LChIcg/ENcydQtBxoXBphZEeKDPzPhQoJ9YKbFcsExRIpp1OSLsGXD9RugtjdR8oLfEXw1Op/nQYn3VroC1tbtYfsToslNAYFLc42hBwGumo6HW2kucbMmvuUNsVvhcrWcZzfXXLLFLRZk0wExnidhXqpELecmVz/2sSEvL9C/VLCzUXmqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQUh9mweLCM541Cy/QMXzIeHtphgwjD4nkBl8XQfyWs=;
 b=EaWxsYjhFdRAgJ2EpRkUHtF4Beby7fT+ypTCHP5cxxF5eNER4/TdkcvEC99C/nuw2bba8/+25CQ7TQIu32MSKWapOpaJOt3JKrzf8s+TvJZSBGmXxc+nqop2MfZA5KeNviF5AxxQ2FKw8rKvSyEgn2nSHPlC45VmN/QOgwpG6o3z/guDWGXdsWqC+uNLNNimtUW0kfmKyjshDZhlXMAtFQusqofGWzZSQa2V6mITGBibV9O4ndjnHZaITK9E4vtizpCUMqIwVj57xG+AH8aqIO4TldVhoqogc3PbmkOsRccLtgVe1TM5PBoeduypKIVEiYhDUr5amVnACd5Vk3MaWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by SA3PR12MB8045.namprd12.prod.outlook.com (2603:10b6:806:31d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 17:43:35 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 17:43:35 +0000
Date: Tue, 23 Sep 2025 14:43:33 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>,
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
Subject: Re: [PATCH v2 03/10] PCI/P2PDMA: Refactor to separate core P2P
 functionality from memory allocation
Message-ID: <20250923174333.GE2608121@nvidia.com>
References: <cover.1757589589.git.leon@kernel.org>
 <1e2cb89ea76a92949d06a804e3ab97478e7cacbb.1757589589.git.leon@kernel.org>
 <20250922150032.3e3da410.alex.williamson@redhat.com>
 <20250923150414.GA2608121@nvidia.com>
 <20250923113041.38bee711.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923113041.38bee711.alex.williamson@redhat.com>
X-ClientProxiedBy: BYAPR08CA0070.namprd08.prod.outlook.com
 (2603:10b6:a03:117::47) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|SA3PR12MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: cd92416e-4b78-405b-5d65-08ddfac8b881
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0jwefVbBhfCuKzCx4n0Pg8AOBqjBzpKGN4i8l/7K/BateORZTJcOOv2U3mN8?=
 =?us-ascii?Q?GuKAseV4GT2/+7rl8jm1S61Hnn1+I+tyJbaxHWIBRuH1+eqkb/DU9TGYCVsz?=
 =?us-ascii?Q?KqmUKQsv324IwHNfpzyG2SxBjORJPTpfVNRAXUyQVtMWowjbveaFDm3JouU/?=
 =?us-ascii?Q?9aSSwqojb1tPHCnt2RzBc8BjMFEm+NwQhn8aJyzDrfv1i4vlcmceGeRx04FO?=
 =?us-ascii?Q?1dDCvZjI/NmbRG/oBj1ToGW9AtxT5vRalqHFb4g0jn8qCqzf2K8XVv3LT+/x?=
 =?us-ascii?Q?+qnjzs3ck5I33flZtlRwXOBRVo5ey+0o+gsJ9kY1M7ppbk1Tm3e2tSYtBAHW?=
 =?us-ascii?Q?fSqTSpLpwXJt0EUNZuKbJgvL948FWywjDkHASzM9VJw+uwKnoCqvaDl20YKo?=
 =?us-ascii?Q?q88eZrDI9oOnZgIb8Sgsn9Hx+NUzboQ/SwN5cwP/c1IV+nPqx9/j2nU8fgUW?=
 =?us-ascii?Q?i2DKtKfhyDKrR5er8REmXoRDsUbXi3/8x6M0b0VmadzzslIUG2Iskv4G2WMG?=
 =?us-ascii?Q?URoE048AuZbmsojNAfO7JO6qs1poAaz0gpAXtyIK/6pp6PWCBxAqtXPAUzM3?=
 =?us-ascii?Q?+PabFXsK/zkY8zttthF4Qrk6hZ7dia85apKMdxcARtfHAAr0a8jHXpBfe7/X?=
 =?us-ascii?Q?/Dr0Vmmq64nMKqrPlfXGPpV01Ab2eRZCy1paq8PXBSaH0Nhtjeu66ix3vT8H?=
 =?us-ascii?Q?b4UM2om8/pXnnQHSLSU2u0Iz/ecCPsdfyfsNsGi6FpiiRoaPJGGz7klxo0ez?=
 =?us-ascii?Q?2N78cW8cDZ+EwX11A2Zcu1xpdN7SWSljsNmObXjlQIVLRQCKtZ6fUnPBnmFe?=
 =?us-ascii?Q?aRe57WwR7QqOF7Q3EIIEC2JaIGMj4v6K2qDY6aEclL6sh7W2FTY/MBOiWntt?=
 =?us-ascii?Q?q/z9Sfegw1os0dmWrU9wcSwXPgqvrqJ/5DdYUcepg8QpVsgoWbNdPAdGEs8j?=
 =?us-ascii?Q?EOdN2efts4V20PuDNTMx0Oy26QjG6DNrMQ6IpxNiRS7qskzrB3qUZTUl2G9C?=
 =?us-ascii?Q?0tWz9JpElkZLCD0ghgpzYK3RTx1sEFFc0KiMbbtqLcq6HZJLi8MvbcRcYLPp?=
 =?us-ascii?Q?MgApCPH2lFzRK7w9KRHNY6wFCXcY2iDrUAMQ32+doO0evCmLDl7Ns1+nRs7x?=
 =?us-ascii?Q?FohohlMn4SmqGAb7WLemqahpLkbnwuEsyp1Z/n5z4msVShoGE7F5A/omhSL6?=
 =?us-ascii?Q?tksFJocZbtQMC5SI+W7ZiF2k25mWlUD0UJI+uUDjaPIQhoFKgyH9o9iINXV9?=
 =?us-ascii?Q?T1O3LbEjjLXXg2li5hRGvNrPs3D7Popg7n7nL6vb4vW0IicTnItITeslsLpu?=
 =?us-ascii?Q?yc3SHz0o1kasyWpNHQlfpi5Y5tVSfndru39+s9UJs4qMC2hlZZtgc1/y40Vs?=
 =?us-ascii?Q?/IH99uXYQAXVcKmuPpT90DBZLAoGA3tG+ZYhEpJlOF0EJy2kNta4Fa8OUS18?=
 =?us-ascii?Q?pxHNQBP5PQ0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5757.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1GHagwMpjjQQyA95vx6sBGw7kZYNp6GYdqLXCgrw2nB9DQ2PwwEzqVjqGlHQ?=
 =?us-ascii?Q?Zry8FZUGq/GtA2qi27sq9A5qoL/kEIjo4dzFLtM+Uh3Qb55PDD9wBYgsFxnW?=
 =?us-ascii?Q?+NoqHvwgv9+Vjpm+sJPPlkh2fp1CMPMN4eXPQaQKoizmlz3Nuv3CEiAW0QN1?=
 =?us-ascii?Q?ahDjmP+35t/x8ezFO1hnfXWkFUZFk9nfOafdZSKTHoNj7IuMb+d0UK2FHEmD?=
 =?us-ascii?Q?i2mztw85/vsxMEIh2ZnfsEXxPnrLehktQT77PE1YLlqkDuAAatn1exREnUx7?=
 =?us-ascii?Q?ZpUmrby/cPmA2+OqL46iVK9urirGcqFWeMtNVPn8Isf6KpeUddsKLcI8lPX0?=
 =?us-ascii?Q?H3PKAaMYswirLZ0IqL+ojHgK5TpDftfM642Hyfz5igzTJfDcMwpnVJ35MSr4?=
 =?us-ascii?Q?48iXhKOpiW0c3+x1rPh5RK4ZaGLH68lIE3NYmHinynd7O54rD2iFEOUlzIX6?=
 =?us-ascii?Q?c7EtNe6/nxChDj+zj/9wwQgGIqs9lkINqFOMMfFopdgzv6e/XWCQ0UD0oLvU?=
 =?us-ascii?Q?LYq4IZy5QzWp9/LOAg3oMoO8KwzuGjXaHwv8BRX6i8P1AjUKwDukjTzS0t7r?=
 =?us-ascii?Q?cPcrQ4TFYPaHh4uFdthZJVYg5+TcLAbqSSqYNQHbew2ECQkX0T9VRtWD+5E3?=
 =?us-ascii?Q?oZXyLEFJU5gBk7bOZTwsI0IVAYGQLepSb0R2aQaqpFEuASZC883rIShO/6TW?=
 =?us-ascii?Q?bM9kp0l6lyIcHmSOf+N5hbfhLKjVUKToTDytjiDCBA4bt63Z8eHcKJm+Y7DR?=
 =?us-ascii?Q?roljuh4crxVuNl7eaF/EycL6Nu7dvl60l5tDvSCxOzlXCmtj//gUukaNzDnS?=
 =?us-ascii?Q?eL4wIDEFGxPWUo1fQzM86GQ56QQS1K5bVgbi3YVRpCnHLJki+ETI2r5bQ5D9?=
 =?us-ascii?Q?OGNGo5uildPDNazU2sPqjalTQU6P1k8CyMYX5234lz3fSO6EjQxjDd7qGF4I?=
 =?us-ascii?Q?E2fKZoRbKNpFnJjYAGBUsRZrRjbPgL0FfvifHNCq69rPVN3mN7Tukfaf8KIN?=
 =?us-ascii?Q?83WmL4bN7ks1eWRBqG6BAkzB2cWRJqdxeana4OTNuG8W/vxEjB6RX+Q/+d/+?=
 =?us-ascii?Q?7kPTlKJ4tl8PO7LljSB3AgiYJRulzpY9dQOyYBKowsKHNoh/oKrH08zXI/Rz?=
 =?us-ascii?Q?jcSopyABQ/YvNiuLPB5tWZ6ggw/CpfNka5dr6v4Qxy8GG0Ln7p7KM/t/UCOx?=
 =?us-ascii?Q?jAATu9j2TP44TrKL+1Q4adO2MvD8AUOqVxwN7NgObUOqNME8vS057e4D2/Xj?=
 =?us-ascii?Q?g8eVjYaBf7Mdt0pHG/G15uxckMDdOLk+2sGy+/kzxb9qM75B++bO9/9yrPtJ?=
 =?us-ascii?Q?gfCWIFDg0EGfPE02F4IUGOSJEFMVhGrwtJf42I7ZXmWK0xtn6UBue1XnhoLt?=
 =?us-ascii?Q?E6uVknK9iuwunRLrOE+3fb/p19m80jzStT9h7coCvZ8AlyP1lOKPWddHcFko?=
 =?us-ascii?Q?d5jUpYRIMLOQ0Ixol3xZQWgvBrPo6vwUw9wYKG9hT19Ty8g7vO41OqkH8UDf?=
 =?us-ascii?Q?a4v3XNME3Ji/mY975CdKuukejksb6tRqu5eUiko/IcVQdErsCRAyy8bdWK0m?=
 =?us-ascii?Q?IBV3bfKMv4ZQRMIJLQVEyo/ZvG23TdV9zCelh4O+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd92416e-4b78-405b-5d65-08ddfac8b881
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 17:43:35.4927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2xEDAyO0jvobdvQD0MaTXiLy780iTjibHmisclshFOvk9Kf3cywfpNEv+MNKWfl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8045
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

On Tue, Sep 23, 2025 at 11:30:41AM -0600, Alex Williamson wrote:
> On Tue, 23 Sep 2025 12:04:14 -0300
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > On Mon, Sep 22, 2025 at 03:00:32PM -0600, Alex Williamson wrote:
> > > But then later in patch 8/ and again in 10/ why exactly do we cache
> > > the provider on the vfio_pci_core_device rather than ask for it on
> > > demand from the p2pdma?  
> > 
> > It makes the most sense if the P2P is activated once during probe(),
> > it is just a cheap memory allocation, so no reason not to.
> > 
> > If you try to do it on-demand then it will require more locking.
> 
> I'm only wondering about splitting to an "initialize/setup" function
> where providers for each BAR are setup, and a "get provider" interface,
> which doesn't really seem to be a hot path anyway.  Batching could
> still be done to setup all BAR providers at once.

I agree it is a weird interface, but it is close to the existing weird
interface :\

> However, the setup isn't really once per probe(), even in the case of a
> new driver probing we re-use the previously setup providers.  

It uses devm to call pci_p2pdma_release() which NULL's pdev->p2pdma.

Jason
