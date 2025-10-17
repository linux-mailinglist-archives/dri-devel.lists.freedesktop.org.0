Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BA9BEC06F
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 01:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A2C10E1AF;
	Fri, 17 Oct 2025 23:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="g8j4QTMo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013065.outbound.protection.outlook.com
 [40.93.196.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C968410E1AF
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 23:40:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nWyKZ1s3bB0z0F46+QVf0NLcVvEYxEMjmah3vJxbvcnIufF6RuyUPRU7Ax2oBqPD/avzg2wtq/ILD3EX18dVKHWSBN5BLCI6YykV2tiX2QHNBqWWmyOO/oc/9yL/DbOeigCf1IFSxQZL2QvugYqcXVWveBHiAedwlJ0a4PtMk7A6zlYrWAjKjsZ0qkuFx5APCXQrEV1/ArnkLAtuIDsHxDgJ8ilSEj8uwlKDgjRsRYw71ZUDEHfpYom0A1RQk5rpHhDImuvthtJ9i4MdbRf4hpBNgekl+3PmCb1Gsj/wxQUddpSoGvpoo5C7k5c0nqP0tW4X8THLrYoNOvK0DZcOKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b4uhacFgjnegt4IZUWAQcIlzyMCEyF1jTEN6paSmLLU=;
 b=AVNXWMQ1BWkXcVgkkZf0e9gtqv0HTDfkJCQ7KdxBFxHczkaQ9tpsfx8an+j113flA6TyD6SeUm6dMa5A7cK7HCHg0cNVmrsEUMoiYQr0JqcKCCYRNgLAFrIDzOuqYlZ4IZYHHjGIF1bLVSKDFRwYuLCEoiMY28CuqW5hvtXHad9zEXrfdrHUdRs6f7u02HR0e4kusXcA/eJzHRzlW4p1P/rDCtI2xDk9mAzxaWMjE2J5FEki0xv1VR1/23eeA5yYmVURGCk7w2OYV4OH2x438+dwIx/xpywvqF787F2TNZJFQC8jDKpZhXIer8SDVOEDXzi9Dny+p7f9nhZ39fd+WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4uhacFgjnegt4IZUWAQcIlzyMCEyF1jTEN6paSmLLU=;
 b=g8j4QTMoXfIWXxAr8RPV7UvFrDSLIRbq2HwDgjNE4tZ9xoANKxUrc8jO6EDodHJ2NhkBv+ITDiounC+wnwlbzoMHPQoYanNZbuajpTyYbk5QqCWF0rRW1bN+1JeSx+/8hjujAWFfFm3ZxNS1HZdEkhEG9dUwxZ7C0krAEIVQa7JalBwtyHmbEpOG6Ij1YaobMVAVa/tDRyFS/O1PbsqiM1QAUrxAMh5Ixs/abK4y34qgIL60BkVrYF3yQ64a8XI0Z9Tun/B3F4O7Sg6timo3QqvVkoW/TIeIfU7dj2LPHPe4OW+yvpwws0o0+B3o72f6aFZ0BGVR/he+pYJKzLm5HQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by PH7PR12MB8014.namprd12.prod.outlook.com (2603:10b6:510:27c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 23:40:50 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9228.010; Fri, 17 Oct 2025
 23:40:50 +0000
Date: Fri, 17 Oct 2025 20:40:48 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Alex Williamson <alex.williamson@redhat.com>,
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
Subject: Re: [PATCH v5 9/9] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20251017234048.GA344394@nvidia.com>
References: <cover.1760368250.git.leon@kernel.org>
 <72ecaa13864ca346797e342d23a7929562788148.1760368250.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72ecaa13864ca346797e342d23a7929562788148.1760368250.git.leon@kernel.org>
X-ClientProxiedBy: BLAPR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:208:335::10) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|PH7PR12MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: 7335667a-b140-4946-7537-08de0dd69a85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u0relGhU7zo5CxgW8Hmj8Pp97LthOAW6M/oMhEQwGA0XLFLLH9yt+YChMDp9?=
 =?us-ascii?Q?k7PmSKNuEnKdh9EmB8dSuZIFg5+jw+Ko4lVNh7IpjQ3j/bHAf+MST5say2lj?=
 =?us-ascii?Q?oES5rOUTtoXTKbkH0POtG162aXcX+Pf4OPwcyzadNZLCspKCQBaIQOdyi5Kn?=
 =?us-ascii?Q?KE9kb2TofxkfsDrQFB5aMSTl9GZOTl7f5QwUt5cxc8fwghdQfitRctf3fSgq?=
 =?us-ascii?Q?ZrICN3ytfzIrnJwRcS2CJVfCG38y/dq3R+21nUYa7JrG4r3znXQoDSrw0Fy1?=
 =?us-ascii?Q?gIo0lGia8UIZKSPoO7T9xa+CCOfHFvr8+09e8fbTZqtL9nVPLs1OsnfGYvtU?=
 =?us-ascii?Q?vWd+MEGJxlNGHNDLUZnp11AJWxKeiad6l+GqDDe5uodqYXGzuTDpMEcezLiM?=
 =?us-ascii?Q?zJGbm2l5HrWDe2PzfEH0apraY90nMoBWfohmbogiJ/yMmRr21IaVTnMevBcA?=
 =?us-ascii?Q?DCBzC50t0GeFsv4ZxXLT9wfKQbaVC7zU9nIGFZpnZ6Va5ZG8c4PXqlGqh8Mi?=
 =?us-ascii?Q?VvzcRx0CO5fyqZ/5wmM3QO05NyKw7r4Ueb/nytdN1eTtZwgR7ZNF8RdFr7Fy?=
 =?us-ascii?Q?alaJQN0m2jSfep/sUk7P4eek14tDPTS929iAr73q0OZlB4EpF34x9+GejhFj?=
 =?us-ascii?Q?d6qbNHKwXrhDvYB5y2FNtlRn8vXku9PZ25fk12MgsEPOPcF73FMP+24lad7C?=
 =?us-ascii?Q?6B+at16Q774h1mVvmJqKN1jrFHiMi7RMdv4NsvHZLUskjr+NytZvp0aIpL34?=
 =?us-ascii?Q?iRrQ0n8YneNgKSI1lm5Dt5heIN/5OuQA0PDxRVmouhTlODKyfTabtA2+V6hS?=
 =?us-ascii?Q?YPcdKRJCxrUi1PRfc0OetmopBR+GhbO3VDflsVoMTArt0RI2+tXL8rUQkxzl?=
 =?us-ascii?Q?Obf1iwdqwMbPTTT0AvnVty0fAzNc6ESxXwBDhSZXLgOB08FLiQLhIi+RO1OP?=
 =?us-ascii?Q?qSUX4CdMXKdclpCiHOTDKPBDzCERxjlBV3QxfmexrV20Z1K5zbSlke/ZScKw?=
 =?us-ascii?Q?posStlWPFEIgg98BlF9J/DktlA94LXkJvjR8Ko+Pe3niVhtIuZ1YgNBjBKBP?=
 =?us-ascii?Q?r2cDsSAcFPP59NPONDuEgKoNWXp7PiuHzBxOWzi8rN085I8sKE9+PeV6IfWe?=
 =?us-ascii?Q?2k6+odGXzlDx/7nivFPPfyxjK2ymRFZWQaABLieiVfght0Kgd4ilLDdfamgI?=
 =?us-ascii?Q?/H5Gckjj6bmhZ9DlpZ5iaGfgRFKrr2buvlcB6x+T5O8bMhCqY5vbSuS88DYb?=
 =?us-ascii?Q?q0VQqSErVwlrPWXVmPxdAlHGS6RVSh6Ahk4HlbjKxUjEPvUJta9X3/fNqOEy?=
 =?us-ascii?Q?0LC1ycDYoPYd+nx5Ff+rXLRMVwfvGfB5I9r4KkRPEtaPBuuFVBv+cngY5WQl?=
 =?us-ascii?Q?yaf9Xs4fiHoKIhRASPV/gujOriKwqQSnnFqFOMnAg9FjOghxuyFGNcSS5S7b?=
 =?us-ascii?Q?nGd+urVHWc/7nXw7PPJbcuLJHXpgs5EN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lEKTsYBIWNQ1VK+ABzHCZq4PcJePgOb3GTYPsGep6USPvz0/ZI8KtiScqvsI?=
 =?us-ascii?Q?oJHeiBaqiC8XITleJKi96ULY8UeTujrFM0DLe0iZqieIpLqNGQ27ZcVd/UCc?=
 =?us-ascii?Q?DOj0t0fhTFWaoZXpZbjkU+DmHopxKspG0hHFhVubcibFsQQCkXcLGT/4gBpf?=
 =?us-ascii?Q?8tMuelozRH2dPYHI6gjvmnAeY8XVQkVOtZ8yKwl87eTv0VbqWtccgzJZbJdx?=
 =?us-ascii?Q?u3MXbP5vrQCx/nXGIowc1hoqy5AyLrLSTcrApmnD/BPikqX78CovqJ+LjOtk?=
 =?us-ascii?Q?vy5PP7igu7uRgB2GgydAZ3GgmJdwDyYKGLO228qmCaQT8pzTud2VtiConCxa?=
 =?us-ascii?Q?HSPvIsGPn64cLulRsLQ2rzGJsy7yMM3QX37p3wK2S8Xz8ssLyXYyMTPfzI42?=
 =?us-ascii?Q?xtl2NWskoiEHLdLwD5lkkMx4XaJvJgEOYkFdv6e0naAa8dsmg2O9CzaaWdyx?=
 =?us-ascii?Q?ZSR095GIbm2E9nE8t/rhfSYxjr7zDI87gWMWph/95VOBM0uW4vhphsSlruj1?=
 =?us-ascii?Q?o1vfKcwE005l96Vg4KnMgn9utyCbQEO3LnPeUNJAreo7Ymqi48NsPjCm3Fbi?=
 =?us-ascii?Q?VbIQyeMjQuCikVmZ0Zng7oJbzqMId0j4dzoolVe1Y5maDakky5OBd+2bhMN5?=
 =?us-ascii?Q?CTCgyuNZO15zOGxteauy8xmJNUV+5iyVlBrhS4Pv2zX9JZWNlVdcvYsXk/VK?=
 =?us-ascii?Q?DB5TrUzrKKqsJfGpVLcIGWe61bmcA0e5epaTuwIaKBWI/ndI4oIM8ETM8IfJ?=
 =?us-ascii?Q?1dejEw5Ml5H1MlSqd4eV+Vyz4wOrtY7a/B4nRQNpbvjQV6NAYHBy7pU4Oq6W?=
 =?us-ascii?Q?eIIL3bzElx5Zsjjmgn45KwywtInYskv1l0Z/3iJ1lwQwXv9SZcJl93pz8ZIy?=
 =?us-ascii?Q?vS7WAxcWfJm2wTC84kTGpsCgrIfmvZbQxtZ4bgvJEcIMn/il2udn0p0HwofY?=
 =?us-ascii?Q?UNexsM4btJq5pTseNF9ZGoivODI0400mu+yKLcqnXeI6//dND/+7AbUMgJav?=
 =?us-ascii?Q?lVwG/WpfBGKQwQo4nDZD5XS6rdG1g7y+2NFxwP7WcpH8jG4VrMxzsrgPnBVX?=
 =?us-ascii?Q?8sIu/y1vGV1taX3lv/M6S3TnuZISk8Y5dhPlsbUgo49bS9yGBX2jDMRXnAyy?=
 =?us-ascii?Q?uODkFeP7tIceoR6Cdy0IwUFKXR5roK++SmXmhxGjIi1eWOJa5RqUdQ3/9opc?=
 =?us-ascii?Q?OMFF3UIAMHZIaQq5E08dbSfKbo8PDRjUXN92vO1aUHx6CWZuxirfO7pROdgT?=
 =?us-ascii?Q?xizXtVAZXGrK6mo/CUyfIwnG6GuSr8zGMEiWs4r6edq1/o3nEeHqeeziQnsH?=
 =?us-ascii?Q?9mCcFHWomf1CiCDaAVR2tWIkOmvGGlcrb9M2p8dHwPBbzx5hU2gRo5d9wTXk?=
 =?us-ascii?Q?T+D83Phu/Fdd+IGWX0CihigwLf9agD9STTrvcvvyo5wfYiKPETj0jMSfipKF?=
 =?us-ascii?Q?RJV6laPh1KfpszCXqf35Kb2U9W3CTQimL2zpECT1I1Rs5Ten7C4LYLD4t6Zm?=
 =?us-ascii?Q?G429yvnas7lg+jf2jpuGZETIyu/h8kjW08lDZZEOVazP087zSQ8hBUZpAIS1?=
 =?us-ascii?Q?o5QIEF3pur0MHcCyJo7+domFgpmNMZPmsJ/mXxI8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7335667a-b140-4946-7537-08de0dd69a85
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 23:40:50.3278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mMpK5s2DJZF5w4QR4yzHR0KLISfa5Ht+JQhKpF9zx2leYxaHxXpGj9YzvwEqqdw9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8014
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

On Mon, Oct 13, 2025 at 06:26:11PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Add support for exporting PCI device MMIO regions through dma-buf,
> enabling safe sharing of non-struct page memory with controlled
> lifetime management. This allows RDMA and other subsystems to import
> dma-buf FDs and build them into memory regions for PCI P2P operations.

I was looking at how to address Alex's note about not all drivers
being compatible, and how to enable the non-compatible drivers.

It looks like the simplest thing is to make dma_ranges_to_p2p_phys
into an ops and have the driver provide it. If not provided the no
support.

Drivers with special needs can fill in phys in their own way and get
their own provider.

Sort of like this:

diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index ac10f14417f2f3..6d41cf26b53994 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -147,6 +147,10 @@ static const struct vfio_device_ops vfio_pci_ops = {
 	.pasid_detach_ioas	= vfio_iommufd_physical_pasid_detach_ioas,
 };
 
+static const struct vfio_pci_device_ops vfio_pci_dev_ops = {
+	.get_dmabuf_phys = vfio_pci_core_get_dmabuf_phys,
+};
+
 static int vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	struct vfio_pci_core_device *vdev;
@@ -161,6 +165,7 @@ static int vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return PTR_ERR(vdev);
 
 	dev_set_drvdata(&pdev->dev, vdev);
+	vdev->pci_ops = &vfio_pci_dev_ops;
 	ret = vfio_pci_core_register_device(vdev);
 	if (ret)
 		goto out_put_vdev;
diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index 358856e6b8a820..dad880781a9352 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -309,47 +309,52 @@ int vfio_pci_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
 }
 EXPORT_SYMBOL_GPL(vfio_pci_dma_buf_iommufd_map);
 
-static int dma_ranges_to_p2p_phys(struct vfio_pci_dma_buf *priv,
-				  struct vfio_device_feature_dma_buf *dma_buf,
+int vfio_pci_core_get_dmabuf_phys(struct vfio_pci_core_device *vdev,
+				  struct p2pdma_provider **provider,
+				  unsigned int region_index,
+				  struct phys_vec *phys_vec,
 				  struct vfio_region_dma_range *dma_ranges,
-				  struct p2pdma_provider *provider)
+				  size_t nr_ranges)
 {
-	struct pci_dev *pdev = priv->vdev->pdev;
-	phys_addr_t len = pci_resource_len(pdev, dma_buf->region_index);
+	struct pci_dev *pdev = vdev->pdev;
+	phys_addr_t len = pci_resource_len(pdev, region_index);
 	phys_addr_t pci_start;
 	phys_addr_t pci_last;
 	u32 i;
 
 	if (!len)
 		return -EINVAL;
-	pci_start = pci_resource_start(pdev, dma_buf->region_index);
+
+	*provider = pcim_p2pdma_provider(pdev, region_index);
+	if (!*provider)
+		return -EINVAL;
+
+	pci_start = pci_resource_start(pdev, region_index);
 	pci_last = pci_start + len - 1;
-	for (i = 0; i < dma_buf->nr_ranges; i++) {
+	for (i = 0; i < nr_ranges; i++) {
 		phys_addr_t last;
 
 		if (!dma_ranges[i].length)
 			return -EINVAL;
 
 		if (check_add_overflow(pci_start, dma_ranges[i].offset,
-				       &priv->phys_vec[i].paddr) ||
-		    check_add_overflow(priv->phys_vec[i].paddr,
+				       &phys_vec[i].paddr) ||
+		    check_add_overflow(phys_vec[i].paddr,
 				       dma_ranges[i].length - 1, &last))
 			return -EOVERFLOW;
 		if (last > pci_last)
 			return -EINVAL;
 
-		priv->phys_vec[i].len = dma_ranges[i].length;
-		priv->size += priv->phys_vec[i].len;
+		phys_vec[i].len = dma_ranges[i].length;
 	}
-	priv->nr_ranges = dma_buf->nr_ranges;
-	priv->provider = provider;
 	return 0;
 }
+EXPORT_SYMBOL_GPL(vfio_pci_core_get_dmabuf_phys);
 
 static int validate_dmabuf_input(struct vfio_pci_core_device *vdev,
 				 struct vfio_device_feature_dma_buf *dma_buf,
 				 struct vfio_region_dma_range *dma_ranges,
-				 struct p2pdma_provider **provider)
+				 size_t *lengthp)
 {
 	struct pci_dev *pdev = vdev->pdev;
 	u32 bar = dma_buf->region_index;
@@ -365,10 +370,6 @@ static int validate_dmabuf_input(struct vfio_pci_core_device *vdev,
 	if (bar >= VFIO_PCI_ROM_REGION_INDEX)
 		return -ENODEV;
 
-	*provider = pcim_p2pdma_provider(pdev, bar);
-	if (!*provider)
-		return -EINVAL;
-
 	bar_size = pci_resource_len(pdev, bar);
 	for (i = 0; i < dma_buf->nr_ranges; i++) {
 		u64 offset = dma_ranges[i].offset;
@@ -397,6 +398,7 @@ static int validate_dmabuf_input(struct vfio_pci_core_device *vdev,
 	if (overflows_type(length, size_t) || length & DMA_IOVA_USE_SWIOTLB)
 		return -EINVAL;
 
+	*lengthp = length;
 	return 0;
 }
 
@@ -407,10 +409,13 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 	struct vfio_device_feature_dma_buf get_dma_buf = {};
 	struct vfio_region_dma_range *dma_ranges;
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
-	struct p2pdma_provider *provider;
 	struct vfio_pci_dma_buf *priv;
+	size_t length;
 	int ret;
 
+	if (!vdev->pci_ops->get_dmabuf_phys)
+		return -EOPNOTSUPP;
+
 	ret = vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_GET,
 				 sizeof(get_dma_buf));
 	if (ret != 1)
@@ -427,7 +432,7 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 	if (IS_ERR(dma_ranges))
 		return PTR_ERR(dma_ranges);
 
-	ret = validate_dmabuf_input(vdev, &get_dma_buf, dma_ranges, &provider);
+	ret = validate_dmabuf_input(vdev, &get_dma_buf, dma_ranges, &length);
 	if (ret)
 		goto err_free_ranges;
 
@@ -444,10 +449,16 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 	}
 
 	priv->vdev = vdev;
-	ret = dma_ranges_to_p2p_phys(priv, &get_dma_buf, dma_ranges, provider);
+	priv->nr_ranges = get_dma_buf.nr_ranges;
+	priv->size = length;
+	ret = vdev->pci_ops->get_dmabuf_phys(vdev, &priv->provider,
+					     get_dma_buf.region_index,
+					     priv->phys_vec, dma_ranges,
+					     priv->nr_ranges);
 	if (ret)
 		goto err_free_phys;
 
+
 	kfree(dma_ranges);
 	dma_ranges = NULL;
 
diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
index 37ce02e30c7632..4ea2095381eb24 100644
--- a/include/linux/vfio_pci_core.h
+++ b/include/linux/vfio_pci_core.h
@@ -26,6 +26,7 @@
 
 struct vfio_pci_core_device;
 struct vfio_pci_region;
+struct p2pdma_provider;
 
 struct vfio_pci_regops {
 	ssize_t (*rw)(struct vfio_pci_core_device *vdev, char __user *buf,
@@ -49,9 +50,26 @@ struct vfio_pci_region {
 	u32				flags;
 };
 
+struct vfio_pci_device_ops {
+	int (*get_dmabuf_phys)(struct vfio_pci_core_device *vdev,
+			       struct p2pdma_provider **provider,
+			       unsigned int region_index,
+			       struct phys_vec *phys_vec,
+			       struct vfio_region_dma_range *dma_ranges,
+			       size_t nr_ranges);
+};
+
+int vfio_pci_core_get_dmabuf_phys(struct vfio_pci_core_device *vdev,
+				  struct p2pdma_provider **provider,
+				  unsigned int region_index,
+				  struct phys_vec *phys_vec,
+				  struct vfio_region_dma_range *dma_ranges,
+				  size_t nr_ranges);
+
 struct vfio_pci_core_device {
 	struct vfio_device	vdev;
 	struct pci_dev		*pdev;
+	const struct vfio_pci_device_ops *pci_ops;
 	void __iomem		*barmap[PCI_STD_NUM_BARS];
 	bool			bar_mmap_supported[PCI_STD_NUM_BARS];
 	u8			*pci_config_map;
