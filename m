Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1063ABF2853
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 18:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23F910E2B9;
	Mon, 20 Oct 2025 16:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="du6hptbl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010040.outbound.protection.outlook.com [52.101.56.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB06F10E2B9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 16:51:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qMk6zvOemaOF0Fm6KfTz2ZM4fymLsjovKeyuohQT21KDU9sNwYwMb7B9oo7vWU0S4oCQXAQrlOSiHKqMlg0KooQ+HLHWYuwLjTT8W2NFN+qdX69RQUiOzaeM6AQpf0VR5GHyxQf035M2vZV9/MuUTO/Z+vOM4H1wLTH7tg9RNBcymf/GIQBVX41TvQ6Adg2CFIir1DVUZlGVe5CzRRt4Axid9Vn2+VQ9bl3/U6P/9jU9nsx+VcflPgIsOKmXmeYK08rRzHr/kqY9yHDrVcc4WmZrwAY8bkYGUc8AtcnkZFA2IWDK/+usOmInAQ/xzbZ16iR5U6rczyDeZ8Xe+m5bbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ulj4AZhj+fLCNIsYuDNxqHysM7aSluLYnPYmUMiWpc=;
 b=xIKdc3TmTAOZdtuUbhWQwu6++Ni1cS5jFK0R+WRMgFL43B5X4UHg27MZNcUlmeX5lbzmjJTaNXUt86Vd98esncAiCtMsgLoBfvbflw1WAGOUMWTu2vJty0Eh4psuxCeu0u6zvvfTHqbuxK7gt+Kg9lFWFOljkBPBDtqjib7cgqeVN9APsSMuL20bIHPatjGmf4l8lHKUBEEZPEFv6s7KdcfQJCzfF+7RWUE/h4MxEqsBvUxg2RZzdJofeYKgEBL0Sz50W3aIcDxjT53DxNwMlTQJ3yJop+pXQBtoaox6klBFMeNLl/8+x/nZimU8bpUXSWDgsv4X0u91upK5qAHU0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ulj4AZhj+fLCNIsYuDNxqHysM7aSluLYnPYmUMiWpc=;
 b=du6hptblDn5+h2wXcNSFPxP0j2d4m+UPFYdWKIexuOmtPJT0zdEkVECYs+yb0+0T/7vpoIC49D/CFL24hXgVQ6F90tsaXGFfe5KN1uNrezVXcoWTseqgTNjDQPEBaHxz915T3cUNkluA8kkjrfPF6ktM61MwQ0At6j/b2K3/Uluts3zF9S5N5fU8iVHOm5quc51AWgFgBvg17EzCy2ThnNoXR/9q+aY8ywxnmpUfjtTi0ulfrOWq1bjJColnDw/OH6zFFR9A1mYN5l2plnBtEg5Rm39/TG9YULUfES1W3dAOpFAVMsYGnj+tWJg0XcP8/Tk7JTp5rrNhHAn8lmZmmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SJ0PR12MB6757.namprd12.prod.outlook.com (2603:10b6:a03:449::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 16:51:22 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 16:51:22 +0000
Date: Mon, 20 Oct 2025 13:51:20 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Alex Williamson <alex.williamson@redhat.com>,
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
Subject: Re: [PATCH v5 9/9] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20251020165120.GY316284@nvidia.com>
References: <cover.1760368250.git.leon@kernel.org>
 <72ecaa13864ca346797e342d23a7929562788148.1760368250.git.leon@kernel.org>
 <20251017130249.GA309181@nvidia.com> <20251017161358.GC6199@unreal>
 <20251020161516.GU316284@nvidia.com> <20251020164457.GQ6199@unreal>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020164457.GQ6199@unreal>
X-ClientProxiedBy: PH8P221CA0032.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::12) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SJ0PR12MB6757:EE_
X-MS-Office365-Filtering-Correlation-Id: c4910472-5417-46d6-cf79-08de0ff8e605
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l9095uUJ1k0LuIJ449Qbqx5FXEiXM4K4xE2Byq37h8auXQ3L3gawyH8efyfH?=
 =?us-ascii?Q?znupV/LnwQHyba9p3CVWH36iBg8R7y57RUrxfNqWfeK9/jHA4LMR35pyA7Yo?=
 =?us-ascii?Q?kGWC2VCxxaTtFLiSBdb+4EPMvkmc9weR5+MIhwtSHLavFKU86HrZvRY4UYOJ?=
 =?us-ascii?Q?pbmrhVr/7nUgvITE5oNgyyFEulRCJSOQ9zKx0e9giiDJcr0WyAHtAR0/4UQy?=
 =?us-ascii?Q?FbH8PZiftJxYgTy6+PHkuT6sfmGou41Ki0knJaKhEBCq4FBqNjlJ3GJY2VbO?=
 =?us-ascii?Q?YDocpY6v2Ae6ND9mMJgtNVi+NtTh0XXvtbZ6QhhNUKsjffpYFK1x16GYrPtV?=
 =?us-ascii?Q?yzAWWnAWyE4d46L4gp9G+piJ3jLmv1sX+0NGOOUxSnZX97fRlG5dFAhzKObn?=
 =?us-ascii?Q?8ke5tSjjTHyrlULpYDmzzCnnt2MEFdJMvsKAJRu1Jw1b+O1dCJO+6tClzEQ1?=
 =?us-ascii?Q?IeFfPmUEP5UxkJNweVc/Co1Yt/Q0+se7A3OOp7S3f3M3ff37ws0mcmqMPJtz?=
 =?us-ascii?Q?ZZt3J1gums0OI76Z1hDplRwcwSow9f+oJx0kUrRkVSMUtVMWkQWXL4ewg3vg?=
 =?us-ascii?Q?wanjmhZtzgR58urSNhf7PPpO1dCi5blyeEolh1hossXcd0792T3DM7EP/ON9?=
 =?us-ascii?Q?ZrejblWq1QhcRMYUNOoYMXgKlwdmbhfbOWI14kTNMLVAFHc4Db+F1+eg33cg?=
 =?us-ascii?Q?1w9R8gy+Is1nXC398lvdxK2oIaDSVMujrZczU3EXWnrULwkV/+jiXXAhfHB7?=
 =?us-ascii?Q?pOZ/L8WMSIc2K24gHiBIbkUTfi2DrQYRS8vltBQu15vnZipWAwlQPXG4j4V9?=
 =?us-ascii?Q?Yvy53IPfiskHGmmZcsgyhUoHRe4vFk3SjvyVj1TimhseUdmWYGQF6slx++Ou?=
 =?us-ascii?Q?cVQ8ByVFwbzMI8VLt2dhbRO1EguUUFrHoJgiCIeHD7T07ztiL7xmGZIu+BhG?=
 =?us-ascii?Q?Fw3Nf8eVFk9fxrmY72V8dp12v8DcEG7+FpOCr53JA4E6jnR8y0XvSpuQtcmy?=
 =?us-ascii?Q?jjnuGU9zDoyjvPiavCfbGiMKsXH5cH3cea/xZXIQGve9t5VGBz3TsZIohZQV?=
 =?us-ascii?Q?nZrKTD7xU80YzHiXr/rEUID7zvrdfir9JRn9Zi1H0Rml735xH+bG/0+KBo6S?=
 =?us-ascii?Q?CyvfiMIz/Tm/LxE8GSAM6bGSxCISJP2Q2PcHK5erEjivGiFeYc3AOe+dfArV?=
 =?us-ascii?Q?5lfo5YhDryOLEUCSULTIJCSdjs/oxw963ln1YkwWZDLuGSevSZjrqOjWO2Ot?=
 =?us-ascii?Q?BazipfekQ9//6dEJ9mEBhJwQg49Dn1kgSwLoDftdCtw71j8BhzECfukn4ubG?=
 =?us-ascii?Q?nk3N/dPGRr5Dl00v1kNkwZ5b5seHlUDtab8qHCpzewUqSc13nl+MHVmneAkd?=
 =?us-ascii?Q?O7lecCR6fKqJzLYrSF6RSeUj3YLpfIoSyn0oVB67GIeOri0ujrEU7zxUQb5e?=
 =?us-ascii?Q?EOOReIM0ckIYVj+yBxfIOZiGeBu/qw5S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BNkGFVburs+rN16k499yPTfCqaUGVw/tlnGEwIm3z1eCpR7NiRywsYnCp3oU?=
 =?us-ascii?Q?ttEyE1qxQ1MqkXrCVVI8+G/mUhjeCJX3wYMnL3nbpXsqBZCMMi2zLnJuMIMJ?=
 =?us-ascii?Q?KjxnJgixn5Rr7hBHFuwzxJlSazmBzNDgGQO1lHw5sH0AI4EVdntmSgFe9NK8?=
 =?us-ascii?Q?17cyYVazQJjkN9m7dwFAmfO3NayFGCno8LFiupaSCtZ0WobKRWxTvT7FXRMX?=
 =?us-ascii?Q?w+CDFoRyPl2u+y94ry8A0j38LaNm0GawY8WNt0ut+gqgebL6D5B2cLANObE2?=
 =?us-ascii?Q?1x1qbCQcLSVmamqMy9SRqrnwEatGqfPif4UT40RxYvd4RzOpJxZheAJA9fBL?=
 =?us-ascii?Q?3wwVLk1WpPUqaGuSkz676OERxYzYuG8qAe3MEZ1+H+6gpFOsMEyWciF6ed/d?=
 =?us-ascii?Q?JqB3mpGn4umEgdMKB8Me0S/eMK80lmMqtrQLezYZMuDdZCRJwJgp9Xqo4GqU?=
 =?us-ascii?Q?fHoxR0pF8Lg1Gfp2ZaSLcM6w1zdP665oBnkGeNOtvdEtMYr3VHzoJHhV2y9e?=
 =?us-ascii?Q?2ChA+yXF218pYcDFGSdVcOZqaASJ5RzeMirBZB6fsU4ctmQeHGv3iPf27WMb?=
 =?us-ascii?Q?N/uRb6FK0vLn+RN3U+stn8kOiZTNokAfE+kyAOHVPQLV01QUYKUGPehMUXe5?=
 =?us-ascii?Q?54t07swwMGigBQn0elkBJdTtteC0yFs0gV5KtEb8kEU8iuIm+qvdCV02Y9vC?=
 =?us-ascii?Q?hPL3XW9PR19J8MnPATArcKQYmYqByHkNwwjSVIQ9L/6rAC9cRqAiaYUrXc3A?=
 =?us-ascii?Q?s7VoeVg8da6axEG5f129XzWAN/3zjOBimJo+oKlfL+oBb800dZGcrz0D1YzS?=
 =?us-ascii?Q?XBS1Y6QeizA/mL4dNhTCwiXpsyDOcQpKHl+eyfC3qf/5Kpnj3aISs71ERoB+?=
 =?us-ascii?Q?JnwMqEHYw0DnFXF8l2L1tWMj4+870KDGsuNdsg8grotBFcplzrrEE2bCPgoL?=
 =?us-ascii?Q?y+7i0BBryk+bTLhfnGktLE2DyzMHnvm+STcPnp+Xv4XNLg/LpA2C/epN+ome?=
 =?us-ascii?Q?qJtUq/t+pNxveZB80bhxvIsNfevY3QQy/gewdL2cOve6yTVuNMcJOw5mHcHp?=
 =?us-ascii?Q?jKj4n8GIsUqCQVtViiOXgdTePG7HNf38PZZq5zWHR7ATPYf2tMAWoYmskr31?=
 =?us-ascii?Q?Lzt1E+jjLhkCeMIZEquvDv3W1x8GRLq7/3cK7ZgdHNHyDRbF+DjejmCoUoM3?=
 =?us-ascii?Q?0qDms3pxnuN7dpyM+Tf9KM9zrkqgAs/E+uX72SdKhGw/Y1fg3nRI8DO52GBz?=
 =?us-ascii?Q?VcUt5c4d0LBoSgXJHHuOxg8ORCKfnRpjge7aSKX4t1FJM52zYA3L+uhFHRnc?=
 =?us-ascii?Q?7rWQf1dA/Lbfh9X9YFuo457BkuFgoS/OZWKEqxiF4WcFSWlv3WOs1qF2LikP?=
 =?us-ascii?Q?RAkfTyKtD/+IoUjON4R83TPi8d0+bykwKfYlFEWuGqHZhtzA1UEmNsZBRTio?=
 =?us-ascii?Q?Tou0tk0dUuV6z+EPx49Ey7FPr9u/3AgD2KeEz7+rq/xSON1MuGGth6hAwTZB?=
 =?us-ascii?Q?2HXlOiiLaczN+TbFkjJl1oacUb5v1UChlhEV2zHc/QvOeoowKbWfUXo9K5Wj?=
 =?us-ascii?Q?gDvWRg3/9xXiVrPX1vA55ib8QkEmRUg+CcdJppGx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4910472-5417-46d6-cf79-08de0ff8e605
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 16:51:22.1877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iDi9yuglUGP18WFXnFVjhRWfbdsmo9oBIl22Q/8nuGtW8Xjj8PuLyHLI1Y4sf+El
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6757
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

On Mon, Oct 20, 2025 at 07:44:57PM +0300, Leon Romanovsky wrote:
> On Mon, Oct 20, 2025 at 01:15:16PM -0300, Jason Gunthorpe wrote:
> > On Fri, Oct 17, 2025 at 07:13:58PM +0300, Leon Romanovsky wrote:
> > > > static int dma_ranges_to_p2p_phys(struct vfio_pci_dma_buf *priv,
> > > > 				  struct vfio_device_feature_dma_buf *dma_buf,
> > > > 				  struct vfio_region_dma_range *dma_ranges,
> > > > 				  struct p2pdma_provider *provider)
> > > > {
> > > > 	struct pci_dev *pdev = priv->vdev->pdev;
> > > > 	phys_addr_t len = pci_resource_len(pdev, dma_buf->region_index);
> > > > 	phys_addr_t pci_start;
> > > > 	phys_addr_t pci_last;
> > > > 	u32 i;
> > > > 
> > > > 	if (!len)
> > > > 		return -EINVAL;
> > > > 	pci_start = pci_resource_start(pdev, dma_buf->region_index);
> > > > 	pci_last = pci_start + len - 1;
> > > > 	for (i = 0; i < dma_buf->nr_ranges; i++) {
> > > > 		phys_addr_t last;
> > > > 
> > > > 		if (!dma_ranges[i].length)
> > > > 			return -EINVAL;
> > > > 
> > > > 		if (check_add_overflow(pci_start, dma_ranges[i].offset,
> > > > 				       &priv->phys_vec[i].paddr) ||
> > > > 		    check_add_overflow(priv->phys_vec[i].paddr,
> > > > 				       dma_ranges[i].length - 1, &last))
> > > > 			return -EOVERFLOW;
> > > > 		if (last > pci_last)
> > > > 			return -EINVAL;
> > > > 
> > > > 		priv->phys_vec[i].len = dma_ranges[i].length;
> > > > 		priv->size += priv->phys_vec[i].len;
> > > > 	}
> > > > 	priv->nr_ranges = dma_buf->nr_ranges;
> > > > 	priv->provider = provider;
> > > > 	return 0;
> > > > }
> > > 
> > > I have these checks in validate_dmabuf_input(). 
> > > Do you think that I need to add extra checks?
> > 
> > I think they work better in this function, so I'd move them here.
> 
> The main idea for validate_dmabuf_input() is to perform as much as
> possible checks before allocating kernel memory.

Yeah, but it's fine, it can just be turned into a function to safely
compute the total size. It makes more sense to try to validate once we
have the kernel memory and got the physical range from the driver to
copy into the phys.

Jason
