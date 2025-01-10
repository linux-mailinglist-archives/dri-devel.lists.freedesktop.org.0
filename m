Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C651A09C36
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 21:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A7010F188;
	Fri, 10 Jan 2025 20:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NkxqdSOV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C5010F185
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 20:16:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQqxIyPUBL0Im+hnVt7z/nFfrVJjOv/HHIEXWDmSHeIf39Mop1ZZFahHbZzAtvYfVTZzl+CZeC+bL4mgtrs0WAXfC1dS0cboEEIPO2hs+o9GApdp7YwohLA8jCKo1giWA9W/G7DMaQZBXjWk4/PIlM+PctAE/egPi2HMUTUsCnDAhCryZkG2PhIoL3YQh86bVWXsQ6EKHsfdvaLKd45CZhvXyQ9r8Qk8DCkkxAXvtA0Vmud2i/yujCNvvZAwAdsYdBjj+TMkjK3I49G+d5dtPSxgQniURdd3pGytL5MnbBHlcsRmgFJqgmTfKXs/mi3CGEA2oPFq/6skEKHGqy44Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lq5kJWRP4bpy0p3moq0JZnbmfn+OuJI1xzZ3j80nwWg=;
 b=no5Mm4+SlvjfkhN6fINU6sf+kfPz1BfuHGCEb29RD4Jddifrj4ZOBNuP2fl5RA2BU1Po9eGDTFThx4RFn29FH1BwhL9SQbubSvVA99waTRetP+ZFusUJlQq6uoqyohQt0UtpTxGiNNkaQTRxdnA6uk3Z1mlKpMZX6VMWjkXSQq/O38oiy6uYmb541ZQu24O3i51uGdUHb9RoH723iJds7oYkjHJQ8DqW0BpWEmGso7ios94OZpypWoUJ2QAV1Q61C/e7h/m27SG5EKlcqqdqupEWniOsRFVzFLSB7mJnClrQk55RXeF5/R8j18pmxpJKDmosR6pyaKX4dauxeeWY4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lq5kJWRP4bpy0p3moq0JZnbmfn+OuJI1xzZ3j80nwWg=;
 b=NkxqdSOV1DXYtWBsE+0Xp2Qcnkm2oEb1RTSqGGRF1b4AGcGdsMQQIfsNnHx9V2C4Xr/9pSV9Vs7n1EXUKIGmqFyydoIU4ffn4Pry6Mr3hH6qOmEfXg1Z7gHLt/n/+/gGZXxL36YzvKhDYjlzoXep5ngwDD7VGiImMH3Sm/4VhBDAmRWuhIY+LrBJXNu0qeArCr1JC/GAJY0hyMzQQd82ajotWgc/AgbY8dwntlahW3dGiQ3/1lA7r8ndGkt0pKCs3M4RiXeZiLD33RCfL4tNIg7PXtGAZs0/oA0vgCGa6nSBbB0dlUAprLqlTNFwcEV//BydCKu3e72kKWUfwuVsRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MN0PR12MB5811.namprd12.prod.outlook.com (2603:10b6:208:377::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 20:16:10 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8314.015; Fri, 10 Jan 2025
 20:16:09 +0000
Date: Fri, 10 Jan 2025 16:16:08 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Xu Yilun <yilun.xu@linux.intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, aik@amd.com, yilun.xu@intel.com,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 lukas@wunner.de, yan.y.zhao@intel.com, leon@kernel.org,
 baolu.lu@linux.intel.com, zhenzhong.duan@intel.com, tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <20250110201608.GK5556@nvidia.com>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-2-yilun.xu@linux.intel.com>
 <b1f3c179-31a9-4592-a35b-b96d2e8e8261@amd.com>
 <20250108132358.GP5556@nvidia.com>
 <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
 <20250108145843.GR5556@nvidia.com>
 <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
 <20250108162227.GT5556@nvidia.com>
 <Z368Mmxjqa4U0jHK@yilunxu-OptiPlex-7050>
 <Z4Fz5oiia1JGWIgG@phenom.ffwll.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4Fz5oiia1JGWIgG@phenom.ffwll.local>
X-ClientProxiedBy: BN0PR02CA0053.namprd02.prod.outlook.com
 (2603:10b6:408:e5::28) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MN0PR12MB5811:EE_
X-MS-Office365-Filtering-Correlation-Id: 43bd4b4f-3a9d-454c-7f91-08dd31b39f2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YqHy4Kv4z8z9LiZtFInso85gy9JO9Xq0uurZuf0BOdksDtUi6dUtGP2CVXat?=
 =?us-ascii?Q?ogfFIBeET9huqOW+nIciDuIaC8MVRiuwJlwecn+MMv6mfKVZ0i96+XBeid88?=
 =?us-ascii?Q?VWHFsjFo/A62u1KMVgeWa6iP3nGcFfLQiRIio2Ni+SwvcTJods0kW/a5RJSq?=
 =?us-ascii?Q?XurpBF2aJpxIAWatFlL13bdEbFwRnDAKX6OK431tkC6oNXEKWv5GkKkTM+T1?=
 =?us-ascii?Q?yx8SCYDvhVHaEhV8GbZi7opZNiJMtMkFpP8m+fRPTXV+AmEeSa24KqXHd+i/?=
 =?us-ascii?Q?i3IbwIe0KEyv4fx58jO6cr5llItuFQxmXdqxyGUSjLhCYzW+IaKztMSUrZbh?=
 =?us-ascii?Q?JlkKkhfwUu96i6yI3M9uAg6T0k2+uBTs14Bb2Th1eNVrG+b+WsR+E9P27bFT?=
 =?us-ascii?Q?0XUAk+9FJA+bMiqCtpCsm74HqfIztwI+4ar+mILJU8mpntIj+Ucq4rtacrC9?=
 =?us-ascii?Q?f8+zQiLGexmI0itXAco6gmn7+JrgVGYRtly0mWK8HEmbBBNlVbQvl6phf+3S?=
 =?us-ascii?Q?qCEx6toEThUagKavRU0/Qhl2DDR/jU4X4dYfowsSTbgY5zzuQCmkmL9UErzQ?=
 =?us-ascii?Q?1ZimVxMrXB7qrmOaD2NMzeClTZdpnjNrO1EF3+8+djV91Vp5lDSh86Wso2QO?=
 =?us-ascii?Q?1aIoA1SQE0U8u02u9MIiNPnkssZI79w+zeorgJe9hbsDgZxXdxTwFGnRjJE7?=
 =?us-ascii?Q?hkOLmNAhm/u2gC8xL5vEeVSN2Zc1FpoUODsKtGFsmqneafN+Imnxvdk/7/7i?=
 =?us-ascii?Q?5226WPZiExTrE7uQ80FnsKznYgDRI+up7yznK6adIfhJkmsgU/uqZuwfOXBc?=
 =?us-ascii?Q?HiLIndWqpEvqNdQF5KC8u3hv5WcZWIOqYzkavqLZwQVgJPaSaV0QtpBtZ4Fr?=
 =?us-ascii?Q?rq7hqkdJQCjg7kp9JbXq/pjxfQ28lmO8aCVUPzZuac1zSgHha10Z85GBEhuO?=
 =?us-ascii?Q?PwP7uE12b82DSTq7cbwuQ5WKbyXkwJSKKPUwS97Tekc8zgD/3bdZnE5cKGjl?=
 =?us-ascii?Q?T8z2+txwQUX4uq6felQHBd6GMpsEWKGDuNpXqyYxeMyJUwejkKL1+gQtQndq?=
 =?us-ascii?Q?e7vlrGUUY1l8aNxU/8xoWtKF8mkf+sJ6wBpky9jr5m5jBM7Ug0UsrZEzaT7O?=
 =?us-ascii?Q?LW5va8O1iB2paRVZhGwSA2Ic5ZYkoUuCppJGPw8nf5v8hRkd7o08LbaQH4sW?=
 =?us-ascii?Q?l7AVykLZZ/2NQmtkHKAk/F4oO8dCecQGHKWUpeSzLBRXQhsONwyvXkuCRL0w?=
 =?us-ascii?Q?ie6VTSMmTq8EIPGek3/9rvG5H+l+/AnbqH98lnGx9BOMqp/ZrVJdKO8Anlgy?=
 =?us-ascii?Q?Zfw+ShFUaoYunkTBYe05DUN8JbV0KbCkwj1xn6Q429BQsHdEAUnOOIQsPMKM?=
 =?us-ascii?Q?DQd4naKoHcOGFFrk1CeKfyn5hDs89Ymab7Xen3iO7tQk5eRAIubxDvxQLJPO?=
 =?us-ascii?Q?jhqwIpxVI0U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YLuDTzcZaKpvBT+OARR+f68B7PnvGESmkpentHZnEij47h9emu0hbfVOyOUb?=
 =?us-ascii?Q?Dv+A6hVVcP9S5BecWkVmDk5Nahjc7xp7S4Pgy+f7y4R0fcZkqtQmcAgSLaGf?=
 =?us-ascii?Q?jklqaWfyLn+nhxKKg1x3PiLymaKOTbrdqMeAFReLcc0DIznQiuMPy5HT/2p4?=
 =?us-ascii?Q?pBf0B+49WDmuLvMOR2cGbiFvU1HSoipX7Eq9yH/KtZ5XTG9yvGeeZCSwjM23?=
 =?us-ascii?Q?3/flJKqU7VN/iQxlSdd21d9bEBBEnuHUPsRtFitmhIGxnQM4vQVJiu2AVq4w?=
 =?us-ascii?Q?9jRf1yqwBqeGLzulb2n5fIhtV6oDPtd3nDK01ROB0HvCH2Zmt6/08jT+XrSi?=
 =?us-ascii?Q?7S4bt8hK7jn4WIbFvbFBvK6T+NZlXwbJGkm976n+4EBPs7QrMDVzaEr4l2IS?=
 =?us-ascii?Q?GqGrwTJCQ0bhQKKCEsWP65hFcrKMK5g7d+cO4dg3ycKDe/7Jd3z87R1nSVeL?=
 =?us-ascii?Q?q4q8Y8dapJYq5Wyvktb7+OaOnYC3ePuuicsXH9OtZmSlQfpXBJd5s7xD9QO6?=
 =?us-ascii?Q?q1PeNsijWZ1VC290Byhf6risdlRk12WzmA+acVZnkXggBgfo7ib/DYMUy+ZN?=
 =?us-ascii?Q?kEkbJanmGWn89PFgdxEzPQDD8Fr0/leKoxyhs/nAkappJANLe7czc4O0gjIU?=
 =?us-ascii?Q?kdngdQ2Y+a0RlWamaziTA1v8I0Ndo6m0g9xudvyEGv1NFgXQWJwctvYFwUI0?=
 =?us-ascii?Q?zE+CoL9ezx07XZFy8Ch+GlQ89md6uLRDkR6nE29dAHuiKGoXHB4bo2yhaO4M?=
 =?us-ascii?Q?XN/u1+YlBlGOnPavHN+nAqFMQnvyIDVnsY7RK6x/GAigtx8WFdzspntBV0dv?=
 =?us-ascii?Q?orh5y4fA2v1Dd72xXTWUUzxSp6rgp8QwMfO2fwWQKo9Bb+kSBTXwA22N61lc?=
 =?us-ascii?Q?c10f1flOR/FKieOtw2k0igVdchncx+LFFMOA8ttphAB/cpEDoWV5ZMGPRcZN?=
 =?us-ascii?Q?4EE8RnNdAYMSfJSzgzna63O8Oof+x3OIeHn2en204bRgFV8/WO0aCiq94N91?=
 =?us-ascii?Q?UK/9KjnocCkviIvjDRXB8+yvZ+I7ntCsyMl4Ff0c9b7tDv+Gl0vIt5uZZEs1?=
 =?us-ascii?Q?Ote3I3E5B1R//Osr1QMxYWATxdcJcF2X7HsuDqtfvwzyjukUae/QxkRYQsNC?=
 =?us-ascii?Q?84eZWOmnHzchi+rHqzc2uHMjK+gXHfQgRSCatSpbtJXuIBWZxgPBAID9iUZi?=
 =?us-ascii?Q?Fd6WKB9IDdr//ePpTc8ZeiimbsRL594WCn9lcgyDG8Kkzne2xOM9+OmTIL3m?=
 =?us-ascii?Q?dQXMkqBH6HIoA2h5IlvjL2YA0wqyOwmQUJuLykUmlHChGhyV2x5NSHLiK4OC?=
 =?us-ascii?Q?Z7c+rwFAXt04djqwfpowSyLPzEdAjdsmPjjDp6RIjCybReTGyp4000Na7glQ?=
 =?us-ascii?Q?s4uDSEEubBhzsGWsyHLD+VGA2TqBHSDt2lwcHmEsB+/+9y1BwWdKLpiO6ROV?=
 =?us-ascii?Q?ikjRQMlxC7H1AuPLQXtCtXFibqABq/1ZmTTEXFK46qsDvt/ZPK5CUByJmnWr?=
 =?us-ascii?Q?2+FTAv+iXkHfK55uIn60BjfylZa3qsoV0xmaaw6jx6T8wVYyf9OJydnOCuPc?=
 =?us-ascii?Q?APbNgEhpGtTt6u1laf9gbLdRJriBNDjPQ7SW+L+g?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43bd4b4f-3a9d-454c-7f91-08dd31b39f2d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 20:16:09.7595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JEgyYx+MFkc3kIEP7fGdBYpaz0SYLHvjkvOKYmGjjLAqaZFaslixMVhcgKUQpZJJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5811
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

On Fri, Jan 10, 2025 at 08:24:22PM +0100, Simona Vetter wrote:
> On Thu, Jan 09, 2025 at 01:56:02AM +0800, Xu Yilun wrote:
> > > > > 5) iommufd and kvm are both using CPU addresses without DMA. No
> > > > > exporter mapping is possible
> > > > 
> > > > We have customers using both KVM and XEN with DMA-buf, so I can clearly
> > > > confirm that this isn't true.
> > > 
> > > Today they are mmaping the dma-buf into a VMA and then using KVM's
> > > follow_pfn() flow to extract the CPU pfn from the PTE. Any mmapable
> > > dma-buf must have a CPU PFN.
> > 
> > Yes, the final target for KVM is still the CPU PFN, just with the help
> > of CPU mapping table.
> > 
> > I also found the xen gntdev-dmabuf is calculating pfn from mapped
> > sgt.
> 
> See the comment, it's ok because it's a fake device with fake iommu and
> the xen code has special knowledge to peek behind the curtain.

        /*
         * Now convert sgt to array of gfns without accessing underlying pages.
         * It is not allowed to access the underlying struct page of an sg table
         * exported by DMA-buf, but since we deal with special Xen dma device here
         * (not a normal physical one) look at the dma addresses in the sg table
         * and then calculate gfns directly from them.
         */
        for_each_sgtable_dma_page(sgt, &sg_iter, 0) {
                dma_addr_t addr = sg_page_iter_dma_address(&sg_iter);
                unsigned long pfn = bfn_to_pfn(XEN_PFN_DOWN(dma_to_phys(dev, addr)));

*barf*

Can we please all agree that is a horrible abuse of the DMA API and
lets not point it as some acceptable "solution"? KVM and iommufd do
not have fake struct devices with fake iommus.

Jason
