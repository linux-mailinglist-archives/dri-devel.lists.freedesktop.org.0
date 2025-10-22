Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE69BFBF18
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 14:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BAED10E776;
	Wed, 22 Oct 2025 12:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WZefTqbs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011066.outbound.protection.outlook.com [40.107.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28DA10E0E0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 12:50:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRs/9gD8sGy1PscV8K6D/4XwiVVU24mj5H/G1hdnyIMkInu9Ntf7eWtlcWJd6yli1cRjsKTNI0xtBAmrICx3GXB2cSNWJH2qoiT8wsigWOUNn9+OennCe4Urni0ZYESD63kUvOCWPZLcUSKJRq/UQImHKn+qMGTTigqYUk0sU0wW1rgM4NPXUA7VAJ1WhaMZdaIOVvGFgBOVRa0hGXAx5KV55MJDmn3wtbNlUO43iBYvT/5k+Ae4f4TXFnKOaO8M99Z1bSegNE4DowYOXuw5ubh2VHTTmKJGOMzJdlUhyvkIQq2qWLvoYFi91XwPuvzQavXuof1+Mud/K/bZKJnvNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJ6Dp09PtYyxGhFWuYW+ZMJMH/IsIpalnb0uRHyEvWs=;
 b=QU3hCR0TAumTBf5wzyxpPZTaiZIQwu0Ep+QdL6M6Dev11/zuRnTujD/IGK9Bazj2fj3l4jMcZCazFn2TNroLQhSwovEmbOVZRukEuZKCOk3Vs6QUC9nE2zQrD122v/ykR5NXXjJ8U7tCTGOu5N8Aua7bWlbRm7tzD3G++b+HDpT+2X7iWp+F4TxQZvqkxzFluEA8SyiYXPKTJe2t/0mgUnuVLOY3TtmH3nIFc5UjKMMWGAnilUSiyAZoPwfLVsIoRPl21Fxdv4QPfoawDQsN4TNRY31itJKRqNMnPLmCAaaRgEXxJ6yLR8dm2RynXaasPoKW5aUrVE5ZLUicN/Ueqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJ6Dp09PtYyxGhFWuYW+ZMJMH/IsIpalnb0uRHyEvWs=;
 b=WZefTqbsXkcluMVy9qWvbNwaTPQZtgsSnqJyFtqnvrPwvWooUuQ6z91ryqF53g12ZuovYNiJm1W6VtVT9aKARIVZPSxbmjTClNC7y1qAqTdFa98vIT2SWhPJVKR21mZlt9pOvZQWUKuL0jaghTxetq+AzEt9ms7ktH5+k87z7eVNufRLqwsoOruxlbvm9DQx+j0zJppWZI5tKoZ6Wy6FTDfLZ2Y806w/rPOM9bpgbcLGd6k9ALBfPVHqO7DhnI5bakkwTM4u2fPZy0OD0ZRuc1bV8qZZlGRM14aPEDKIUv7j+tSLNYA5pJCizHV0wKCKw823TzgGVwhNo/4tsDdEqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SJ0PR12MB6760.namprd12.prod.outlook.com (2603:10b6:a03:44c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 12:50:14 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 12:50:14 +0000
Date: Wed, 22 Oct 2025 09:50:12 -0300
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
Message-ID: <20251022125012.GB244727@nvidia.com>
References: <cover.1760368250.git.leon@kernel.org>
 <72ecaa13864ca346797e342d23a7929562788148.1760368250.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72ecaa13864ca346797e342d23a7929562788148.1760368250.git.leon@kernel.org>
X-ClientProxiedBy: BL0PR02CA0046.namprd02.prod.outlook.com
 (2603:10b6:207:3d::23) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SJ0PR12MB6760:EE_
X-MS-Office365-Filtering-Correlation-Id: b4ef060f-373a-4e1b-403d-08de11698b25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4Dr1raJ0jMRFHbOTlSMzM808tvA/ZGbNcIskyJqhB85rctD6/A1r22oS2AKf?=
 =?us-ascii?Q?ChsGvYJ2eC5DHCWbdNTOiWXPG3U5K+0nKc8XDScLTyxPPWHfOkGQf5NrBxzn?=
 =?us-ascii?Q?SDxqiBDuVwdHrhA6faHYCeIVwwZU/R1VxW9B5sj1ttjPOp5oD7KVd5feZ7gq?=
 =?us-ascii?Q?qOYHf93SW6QJGXC2VzLUPTi2cqmYWvWsfBtKzNlBfsQom0HFg51cVPmwmK6/?=
 =?us-ascii?Q?tmmIKR3dgcwKqNm//4JwHsm3ptue2/KVX30xSWZ8taLohg4+r1zXWxuCxJPt?=
 =?us-ascii?Q?ATkGucwP+DjVU5rBvQ4DNgFzAqnWK4g/x6w3U5cDAieblWYgKw8jVfKE7i1h?=
 =?us-ascii?Q?umbGOmvahlSisZxrplj+NQ5HVAJBWOB/XEjwlH956dHLBI0sMQ/yJg0sca9e?=
 =?us-ascii?Q?qI5HDhvKwhu3g4dWZ7kJ/8UTVC1STKA3MYtwJy6KXhoZuluxuQ3YJs4NZif2?=
 =?us-ascii?Q?T6k1rDTRnjJzftavWrpc1yc2B1+g8S2WNDVRLSjDEFLtGiZHgsmK8ZeE+KOX?=
 =?us-ascii?Q?iQsarndqR/8xWd0DGS6VPz0q+BWu/5t5ou5vGGBsK69Mt+z45Vrrps1TN7vD?=
 =?us-ascii?Q?Ch6K5cAY3o+kD6aPXF8YD8Aoj2qRVg4uodd1bqbxa6VdUYFymRb6EPzYgxaa?=
 =?us-ascii?Q?SLqYgCaEehDT+0KqnAB1eEc19vPA4Z8yZMvXJVz6ODPADfYFnmAbNjHacn9M?=
 =?us-ascii?Q?BPl9tT+TWxCgMd85vgUuvDAol6RvkCckIp7VEfryjWtoqcFm5r4dMEc3t9td?=
 =?us-ascii?Q?/UAdMZ5n09zrNbHUIJnU/2qqAiAZqRCAaqGkGj2QVSWfYsql0Qc8rrX6Mp08?=
 =?us-ascii?Q?oZm29xOFQ1ipUStdVR5isiiyj4AruDRUGhJZ4j/eZp7EQWp2Lq4JmTMcYEt4?=
 =?us-ascii?Q?bqovA1slMXmDAkz/bVEucLdiKybaw3Ath6PgIA2tSsdgpYn9SX1e7T5cCBOO?=
 =?us-ascii?Q?P6dKTGUXzEdMQZ1ohT871Gu7bcG/r8vyssiJqr2gPvYqY6TJcI1ob+Pxg4GZ?=
 =?us-ascii?Q?MlKtSRU0SCzB0m0+UNxp7wTVqhfwraikcunVFd2DZrOb3Xty+hUnRzmeL/lz?=
 =?us-ascii?Q?G2OpMiWhmozCOlmhZwLjpbxgEuLZwuKs456yusNS6i8mSSSgzMhbV0QKbXwE?=
 =?us-ascii?Q?nnWL9EkQWyMQCRZKHON7Gijs/qJ9FhXiV4jgioiqQGlQlG1Syx71NnZolHMA?=
 =?us-ascii?Q?OVBBRYny7frBKmsGcK+FRKpgXIQ0PCm6Ta4/EbnyVKMADHobM9bY6MmHKvsH?=
 =?us-ascii?Q?tAczfCzsKqU3sxgG2RPuFzqaggRuKJVVhZaa9gB0d7I/S7MsIYn9gZw/ROpg?=
 =?us-ascii?Q?MOlUk0uHJPRDLz8zGBroTtdJft+XNA5Ivev3FtK+Wi+fCp9nnMWAlKWPYWK9?=
 =?us-ascii?Q?dk4BznlpIzDMTeR7e4aNSwg6exmMSeBY4N73RmtQmv9byEme07cTmxo3gjDx?=
 =?us-ascii?Q?NS9xYjJqMXe7A1sB2wIFht32A245TOUY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EnM6hkcIrT7K6L2RWJQ2aopUSQfyoIeYeU6MxjjHupEN6yOYMCT+AVTueMFt?=
 =?us-ascii?Q?mbfavNZpPcj+l61hIcsvOrQpbjXcf+WI8RgAADLKCYfl3Clq0ptQw5f2t73p?=
 =?us-ascii?Q?1Jt0SpeYXR+HSgAa+hypMAzfOlk0/LLU4tclKLsRwC7v4Ja9bCDV8KueGS0k?=
 =?us-ascii?Q?QLhvc07lCaFc3awtdN59Os6BUM6eJNMEjAZczYqOM8xE59VwTWQXD6rsgQ5H?=
 =?us-ascii?Q?U4XEx+IyePnasIW67ZsXoRNxO8/u1J+Ybp/93itYmH2r3nJmNnq2OBChuOGi?=
 =?us-ascii?Q?ncLTW3LD+wT4pv3UjCjMx4RKKBcshpTooFEsW3z77IjnUbkzCkXaOoHsn1Bu?=
 =?us-ascii?Q?XrMwReg6BhaXzOGPW4MSEEEVFEAdAETcOGx14oD2/yYMwG8qa6B6U/SWRHge?=
 =?us-ascii?Q?iY1Yfd1A885+iVMj9vrOGbaVTE6ltB3IaBI7e3e3oICvp+AVgsIIlpZuYKv/?=
 =?us-ascii?Q?X/B/wWk+vfc+9zBGvhn8pvuWEdPY3Ym4QAUxP4bolxl79ioWcuTjirHDz89r?=
 =?us-ascii?Q?st++LKF8qnpD5hzVnLzTN1r4NQ3j8Y7aQrxhEl7tQUhdWY5zvFT/pEpcD9rM?=
 =?us-ascii?Q?Xwh0baGRuAl0rejkpqH1mUa9vpktGULWbm93NOoZl6RtzycfgaYVj7YDV+x9?=
 =?us-ascii?Q?xEtrZTJ7D5HB4vR0c5N169fKfjGiJi2QBcOuzqNX9lIXrH8LNyaWRBXJ/lVx?=
 =?us-ascii?Q?NzlNl98YOPslGl2kuUV1yAqEIbzTLlUxmaAO7YMazk1BshUxAesb2XQAW5BY?=
 =?us-ascii?Q?8Ed9J2psE9X6zUdnGfBzG2UE99jYKJAnKqXfCUSvHleO6IGqvzN7/RNQpOvL?=
 =?us-ascii?Q?hZofElNnQabHbkdfFGHKSOBQ/C2PIyb69AErAq6jDsDaN8p8My0oydvGY3ZC?=
 =?us-ascii?Q?IgjN08IBgWVABd+w5bOb5g6OTZkPREGZLnPyNVz/ZnY/89GMozf6BePk9B0t?=
 =?us-ascii?Q?ibb8+vBxfFE9al4XMxRwgp2eM/J+E0BCWFYsKG68tJgrqOEqLieuivynLkPs?=
 =?us-ascii?Q?dRaPCKhgpvHTikIlz0M8NCkYhil77VpuN1NZr4rrVdR2JG08Tn1848i+TjBR?=
 =?us-ascii?Q?BXGx0ZaQXCEnVIimR1s6TtZ4JhtrG7GRlrO6+G3jZz0xOklC1UCTjBLJ4N/p?=
 =?us-ascii?Q?0JebwIAITWbPUGsaM/O4f/yNtbBFlb5izNfbjEkf1Scvi4BNux+ToO+++zcx?=
 =?us-ascii?Q?unac9xwqRmvKsDUA0LHYjSYi1+FoMDqpPLTa1ASXNJvxpRL/eBMsuh01pj8Z?=
 =?us-ascii?Q?e+FAZ7oX8K1qKJnR7XWt5vqu00YWyTJBQ5VkGvcEk0PLXaPMFvjU2i0/C4Du?=
 =?us-ascii?Q?V5JYExN/W1XcZGfVJfe5TaLECxUP8xs14B0zh/FSb2L8ud54nrZCH5Aq8gQG?=
 =?us-ascii?Q?1eiFjJzo8AVPBw9A8VEIxZADos5TBG2EDz7MFnr9c6U8EkZLbOXRRN7iPkq6?=
 =?us-ascii?Q?drThfOjWTYUuYCdWe+tsxkx/PtK3DQkppCsR4uPvI502mkrN57gCDKSF87Ws?=
 =?us-ascii?Q?Pn+m2u1/PIRN9NRtM0yc6bKkw2p8PrX+rJPaHEWWGkNIR6sI+uDj+e5s78Fl?=
 =?us-ascii?Q?hEIr3MF3I9XpwkDOWVc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ef060f-373a-4e1b-403d-08de11698b25
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 12:50:13.9646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQBni5vEIKi49NXEFASv7X8GFia5leP6Ri4ele2pz6Jl3HTB2Jv1ubaPT+/EvqG4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6760
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
> 
> The implementation provides a revocable attachment mechanism using
> dma-buf move operations. MMIO regions are normally pinned as BARs
> don't change physical addresses, but access is revoked when the VFIO
> device is closed or a PCI reset is issued. This ensures kernel
> self-defense against potentially hostile userspace.

Let's enhance this:

Currently VFIO can take MMIO regions from the device's BAR and map
them into a PFNMAP VMA with special PTEs. This mapping type ensures
the memory cannot be used with things like pin_user_pages(), hmm, and
so on. In practice only the user process CPU and KVM can safely make
use of these VMA. When VFIO shuts down these VMAs are cleaned by
unmap_mapping_range() to prevent any UAF of the MMIO beyond driver
unbind.

However, VFIO type 1 has an insecure behavior where it uses
follow_pfnmap_*() to fish a MMIO PFN out of a VMA and program it back
into the IOMMU. This has a long history of enabling P2P DMA inside
VMs, but has serious lifetime problems by allowing a UAF of the MMIO
after the VFIO driver has been unbound.

Introduce DMABUF as a new safe way to export a FD based handle for the
MMIO regions. This can be consumed by existing DMABUF importers like
RDMA or DRM without opening an UAF. A following series will add an
importer to iommufd to obsolete the type 1 code and allow safe
UAF-free MMIO P2P in VM cases.

DMABUF has a built in synchronous invalidation mechanism called
move_notify. VFIO keeps track of all drivers importing its MMIO and
can invoke a synchronous invalidation callback to tell the importing
drivers to DMA unmap and forget about the MMIO pfns. This process is
being called revoke. This synchronous invalidation fully prevents any
lifecycle problems. VFIO will do this before unbinding its driver
ensuring there is no UAF of the MMIO beyond the driver lifecycle.

Further, VFIO has additional behavior to block access to the MMIO
during things like Function Level Reset. This is because some poor
platforms may experience a MCE type crash when touching MMIO of a PCI
device that is undergoing a reset. Today this is done by using
unmap_mapping_range() on the VMAs. Extend that into the DMABUF world
and temporarily revoke the MMIO from the DMABUF importers during FLR
as well. This will more robustly prevent an errant P2P from possibly
upsetting the platform.

A DMABUF FD is a prefered handle for MMIO compared to using something
like a pgmap because:
 - VFIO is supported, including its P2P feature, on archs that don't
   support pgmap
 - PCI devices have all sorts of BAR sizes, including ones smaller
   than a section so a pgmap cannot always be created
 - It is undesirable to waste alot of memory for struct pages,
   especially for a case like a GPU with ~100GB of BAR size
 - We want a synchronous revoke semantic to support FLR with light
   hardware requirements

Use the P2P subsystem to help generate the DMA mapping. This is a
significant upgrade over the abuse of dma_map_resource() that has
historically been used by DMABUF exporters. Experience with an OOT
version of this patch shows that real systems do need this. This
approach deals with all the P2P scenarios:
 - Non-zero PCI bus_offset
 - ACS flags routing traffic to the IOMMU
 - ACS flags that bypass the IOMMU - though vfio noiommu is required
   to hit this.

There will be further work to formalize the revoke semantic in
DMABUF. For now this acts like a move_notify dynamic exporter where
importer fault handling will get a failure when they attempt to map.
This means that only fully restartable fault capable importers can
import the VFIO DMABUFs. A future revoke semantic should open this up
to more HW as the HW only needs to invalidate, not handle restartable
faults.

Jason
