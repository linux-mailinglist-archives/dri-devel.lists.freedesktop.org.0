Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 802F1C7AA0E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:51:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B3F10E8CA;
	Fri, 21 Nov 2025 15:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="on1ZFoRS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010021.outbound.protection.outlook.com
 [40.93.198.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8F610E0D4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 15:51:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yrj+mRnDdsspCy5rcW6vvYcWKLOPqyX0G4W+ojcAjkMLK2HzSF62965yVeJs0Gy2IoxrE1/CHm4PHLRk3sv9W9i/5ZB/DPO9NYMXuVoi1Y/SLznpaVf1YNLwCbCfmlkZ66khISWm7oSoQoLZ3xC0UF0Jj7Kxs2ExW9MrtL796Eqe8rzaun9eAGkebr2p+ltSq0sZikSx2Zzk2PBWVWJsESEcBfbhCXQqwqLo/0Yo5sKn7sZ4v4oXRY+WFf8AHknGQgbguwlOHZaw0eEw2/d6GxYbRjJrOo4xHwslR1SKUu4pZN3GICNNGXf1h5G7ht9UIrWitWtEJSFQrbii1SLKoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsvcbpvvxTtN+6YQ2IGpIE75sTjhjeyq2W7EvJeS8Vk=;
 b=ldoCbR3tN/8KrC4iujj3B7OJBFknki6XRrbgQ/04Dr7tYL4XDR+C0CVsAXLw57XmA2xd3oFfLun5ppUwQemuZ208P9ssTqJAzKnFXrlaxyrLzjLCPHMlCLhs2VGAQo6B2G5/FjdqZppd2wQjGUv8s+XE5CPgiYKRnge30Hrn9rEcnEVXx5PIr1LhSiOVM7ohHKx0ILXbUTOhiwHgq/VR1TrvfbkBr+s09K0eIJAEBszhfT0D52Jt8NwIGwfux/YXYoHwQbKT/T4FtHKiMOcfXSQgfTl34ZfgfueeWacx86Lmkr2f+ZddUk5z9ttvwX35XrmeTmZb1rsKknPvH5/IoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsvcbpvvxTtN+6YQ2IGpIE75sTjhjeyq2W7EvJeS8Vk=;
 b=on1ZFoRSSmwClhcjsfGlWQyd7qWwMowqzo/IjRdiFgG/b2z4OmuZ+AfAPqpoH1rYO8IMf7+Tx9J026EPw9ld1Z2KNh6gghYasJLlZZcPJSr7MF3IkrS0QSjnpGCZ0v/hp+CWq6Tqn8fbFZ8WKa7hjWJD3BPOMnS5AfUN/p868tOJrDNki84dF5lAppbZoPg4XdmIk0nm5DL76+fV0P2Y/JuicWqfvjSrjVzneJPGmCjlP6kIjBEQ5jI4OXgw6eZcfTKHP4sDruFC6U2lJnsk7PX1DmBQOSVFG8Cow7KvpPjoEObsU39MCEyi9zPwBCf/jY+IGNzB0K5EBO261XXMow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by DS0PR12MB6439.namprd12.prod.outlook.com (2603:10b6:8:c9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.15; Fri, 21 Nov 2025 15:51:08 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 15:51:07 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex@shazbot.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Will Deacon <will@kernel.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Krishnakant Jaju <kjaju@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, Matt Ochs <mochs@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>, patches@lists.linux.dev,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Shuai Xue <xueshuai@linux.alibaba.com>, Xu Yilun <yilun.xu@linux.intel.com>
Subject: [PATCH v2 0/9] Initial DMABUF support for iommufd
Date: Fri, 21 Nov 2025 11:50:57 -0400
Message-ID: <0-v2-b2c110338e3f+5c2-iommufd_dmabuf_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0326.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::31) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|DS0PR12MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: f6c1ce08-28a2-4088-b29b-08de2915c8e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Jcqd8ZTxofG1Ivi1XuWxDRU7j44c1+uwr2mJCMNKjWZwrnHGnZMZrO0b9E30?=
 =?us-ascii?Q?/YiaDDXbYhnucAXoWF32VZzNNT60Wp8R537UKaTedGBOe7Uy5q7iWkcdUENe?=
 =?us-ascii?Q?pr1+1W69xLYv7jyb6ehtoaZfH0incurRUlLMixWoRMKsOgEOiBocCUBvdQlA?=
 =?us-ascii?Q?f+OXfZcXt7D7WjjRpmIfz2c3J9Sxn122yHogadh+hkhAICivh9MbaBGsUA0W?=
 =?us-ascii?Q?v9AgQ4WpkrX45J9pMYB+RBBevBaq+M9BgLOymoHLutwSbXYAVfkf6I4fG9nm?=
 =?us-ascii?Q?Szl3XWQDTjyl4bFyj9mv0J5Xe4oiY8GbJ77JbRq1GSGLQSHt6pZGQjJmb3qr?=
 =?us-ascii?Q?nfoaU/ZOMHKs62Gda8Ei/x60sHtPs4/zyCKIn0NiAZUWkPqLXVsl5lfnrh5z?=
 =?us-ascii?Q?J/gg9rVvauheYsHZRAF8WsqX+gwUckp10k3DaLNb7wtXRNRPiZs2oOkuBzQX?=
 =?us-ascii?Q?W6F+w01TZ+LLM5GDSctk9wnIFmeSrcafXSzaQsG3se5B1XfiV1cuI1VZWTQE?=
 =?us-ascii?Q?QBTO3luCsLB6EZAoE5UREj1M0tsvQ2ZR4SlRHGLIjgIj7i5dpOVd1QSHgEuw?=
 =?us-ascii?Q?FfPMbGvkldrSrA3+LxahcXNIkCSb+1U7IZIshR/iVJHCvvaD5tunuL1sHGI7?=
 =?us-ascii?Q?hHZrdBFuSJmybodHQWa9GyafW1zqnONBSmbAUIff7c3cbGsRdZzG2Q1f+lwZ?=
 =?us-ascii?Q?z7MBMx93p5EDegxe4F3+9MmY0mYbnNykGWgXfrJkAwe+FQrMU36c7Tq9cucS?=
 =?us-ascii?Q?UeRUYbGn9Cp9p7a3x/zUZdieqpcxgg6w9C4FulvSGOYL8QWGAwxXRcliwene?=
 =?us-ascii?Q?hOo+Z3kB6Y1tEZC0sKTCqCJYi1oOaMtlAkuSItAmRtvONvf6CoxX7T56pdhL?=
 =?us-ascii?Q?uAn723SLlBVhWqR3WB4rYsTVZ1RXqlF1bsonZGzwlpyeBEEoQmp8++LhnG/N?=
 =?us-ascii?Q?4BmKX5ChfJPJ6EtQj6It8ZGPRIU4rMvIGZf28N82R4r/pqLm0guaAMBPNEI/?=
 =?us-ascii?Q?4d/CYcIhveGV//MhfgYP2G3BlMyIdDtKVGS0NaOWYFtAgyt4leanSc/jzVhN?=
 =?us-ascii?Q?aVuyhnsLZyiVvwA0GSuo6AQGIABMxMFLi5BAL8YKE9Y4h5MM2R/c83FdrHGK?=
 =?us-ascii?Q?h2lXMz+B7JdwvFOttdWnJWrnUgjKARcgTSSmJvqDbJqEoMMgb6XXvg8bn/Hb?=
 =?us-ascii?Q?eC+l5sdHzjykB6UfSmWyjVJ8fd4xnAcFdQe+UrFgO0o8brRjzq2a0gEQGq56?=
 =?us-ascii?Q?SlhD9y8D5LVOV+hOmn4VU70JkSPDxXQTiCS2C/9Ion4qPXG1u00xlSEEMoDX?=
 =?us-ascii?Q?jx4H1lwrcH9X93GQLJfvgGp2dzmoYNlcQs7EeAVXtbYPzVQiv6X8NvpRzj1u?=
 =?us-ascii?Q?mhmB6EZQoWjiaJ04pLfJ2nLEgnauzssu+h8szgMX+5dPzg9ViqOwrQuElIi4?=
 =?us-ascii?Q?vgAR1OK0XpPDV/97vmquGHRaSjDVGXikAsV+2TiA75tAqT5XyVOG3JEgF9lj?=
 =?us-ascii?Q?/Dlhf2RVGY00Tdlad7az0Rha7wP/QIyBMfDr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RY3KNbk29hRqedta8J+Ql4R6lEZz0IHL8nyGSZN9NdEf89f/0XMrUuk/knk/?=
 =?us-ascii?Q?OLctgjVSUVb874YkhkFCI/PhepyVW4ajGDtupvS1C4yWEfd4cBNXl0fPNtAj?=
 =?us-ascii?Q?GR8CCUF9nZYzZmkWLXLP4+BPWqW6/m4aXU1QMxPOWyqX7d8XYE5a6qAK/ZTQ?=
 =?us-ascii?Q?zO3L6vYadqBTxUGtTXCglPu5C8sVYCJhP4ekpORsMheY0HH/hL3Ubmf+xtjA?=
 =?us-ascii?Q?d6chhRp1Pg492yS2Q+K/62OaKwtygAVuV0XTMwXdW5d/qMLkgSCW78fqsKXZ?=
 =?us-ascii?Q?1fa9k84bKsvu3DIOrbkaQOpgrDBGonmM4nAzHdl22UHZ0tsuhL8GCDsENh7U?=
 =?us-ascii?Q?WZr/a/eJMspSZ2ybO8zyD/WV/6QqG3jISCVlJiyf8s6fpQNlREevYzQSN7sJ?=
 =?us-ascii?Q?NV0lX81HaA12HpHG2bBER34Qxc5I5W8fmazQ1zkOpkp8Bk93RJZCsuvCnp36?=
 =?us-ascii?Q?v/iDv9R9vyMf5C4Yz7TuL9pCczMMvvwWxGB/FkXktI3KOh8BHlxjBVcs5JJs?=
 =?us-ascii?Q?HR4AuI+Z4XV59hmkgrMKY50BXYfrvfIPOBge9xH/xg4bjtYzwb0L8jjzIe4e?=
 =?us-ascii?Q?59r9SjBLlGAG0BoukMYvRJsx9s3fWW4TiUe/rnoBy9TuI72907kaaVxagv6t?=
 =?us-ascii?Q?/ugYLDFqnlX+5fZmgn5rTze5LEJ22am8ZsHsysb8oT2d0VJoSYg8roHC0tK1?=
 =?us-ascii?Q?qzZ4FfUm+VHVtn4jgsF/mykytyeOOfQgNt096PU9ukGyeC5n3MOfh1jlm5dh?=
 =?us-ascii?Q?TcsUy2dxpRWAMzSnhIt4TxQcRBs+WO+EkKmlyDcvtBL2F/ICF5yefwunkVV6?=
 =?us-ascii?Q?JW0UsmxsVmY9IjDttSeJV4IJZoCzNGyhu5ssLRi9UrUjINSVrTvfLUZcNmcL?=
 =?us-ascii?Q?5aPh3Xw6L0FVWPQu1YigXz+N3vg7TcUDwCYQRSBxtTyv+rkbsvI7qnUM4V7g?=
 =?us-ascii?Q?iY/91yqZec5V+R5QzlMXSXtYud8Ffomb4M2sLAYxmFwvUXjsJ9mT5n3zrpx7?=
 =?us-ascii?Q?4bNphK/esav1R47oCIjZw1rvp9zSjxYD+4kTzX88Yz9w4WMfQpdCN7KfIDKp?=
 =?us-ascii?Q?8092s6lC3X8MiiMp1J2GTd7fi4aLXm9slg1mbZABkAF10qnIcKxxVswZPeDO?=
 =?us-ascii?Q?bf1eVtU2if8LAD0BIN3/WVwDmnOyA9NiTPx39OTpOf9FpEM9U4pQw+L5fjJr?=
 =?us-ascii?Q?1qXD6k5MCzTjOP7LQcDcE4UdD/Q1ZzwGtODtjb3LcRuQixCTon9DeNLMtGDD?=
 =?us-ascii?Q?zs6T8oA0l3SfI0cCaOH9jktZYo+BwnLX37ME8rPXLkb9ZN8XX6n4+3DbkgP+?=
 =?us-ascii?Q?DDtxyFg3hUad5B5YNOftXMeF5AIUr406FkrUV0cIpsULRSZly1ns8/nEw8Wk?=
 =?us-ascii?Q?wcz4UM9luqsvErr8563uWvSeQukUnIoqBOyrnYannzbAgOYyjDzJL3gVADE0?=
 =?us-ascii?Q?kSFz+ZS/4PuXB/Ceu93srT5x6gE9k6e9x5QbJUnHM3jMAZhc9Z1wX1I05qeK?=
 =?us-ascii?Q?fWs5mT3rNxiAD5IB9qdygl4IQ7RVlC7SyVY6Z2Wtxkdx2faaafUqhmQOPar1?=
 =?us-ascii?Q?AJBnuZXM7J2Aop8thaY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c1ce08-28a2-4088-b29b-08de2915c8e4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:51:07.6331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VGbfHjUu1QiBWQxcYn9b6E6eHAN3EXO4k/b6fuGhc4PFweg3F5WAaAUguNEajESe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6439
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

This series is the start of adding full DMABUF support to
iommufd. Currently it is limited to only work with VFIO's DMABUF exporter.
It sits on top of Leon's series to add a DMABUF exporter to VFIO:

   https://lore.kernel.org/all/20251120-dmabuf-vfio-v9-0-d7f71607f371@nvidia.com/

The existing IOMMU_IOAS_MAP_FILE is enhanced to detect DMABUF fd's, but
otherwise works the same as it does today for a memfd. The user can select
a slice of the FD to map into the ioas and if the underliyng alignment
requirements are met it will be placed in the iommu_domain.

Though limited, it is enough to allow a VMM like QEMU to connect MMIO BAR
memory from VFIO to an iommu_domain controlled by iommufd. This is used
for PCI Peer to Peer support in VMs, and is the last feature that the VFIO
type 1 container has that iommufd couldn't do.

The VFIO type1 version extracts raw PFNs from VMAs, which has no lifetime
control and is a use-after-free security problem.

Instead iommufd relies on revokable DMABUFs. Whenever VFIO thinks there
should be no access to the MMIO it can shoot down the mapping in iommufd
which will unmap it from the iommu_domain. There is no automatic remap,
this is a safety protocol so the kernel doesn't get stuck. Userspace is
expected to know it is doing something that will revoke the dmabuf and
map/unmap it around the activity. Eg when QEMU goes to issue FLR it should
do the map/unmap to iommufd.

Since DMABUF is missing some key general features for this use case it
relies on a "private interconnect" between VFIO and iommufd via the
vfio_pci_dma_buf_iommufd_map() call.

The call confirms the DMABUF has revoke semantics and delivers a phys_addr
for the memory suitable for use with iommu_map().

Medium term there is a desire to expand the supported DMABUFs to include
GPU drivers to support DPDK/SPDK type use cases so future series will work
to add a general concept of revoke and a general negotiation of
interconnect to remove vfio_pci_dma_buf_iommufd_map().

I also plan another series to modify iommufd's vfio_compat to
transparently pull a dmabuf out of a VFIO VMA to emulate more of the uAPI
of type1.

The latest series for interconnect negotation to exchange a phys_addr is:
 https://lore.kernel.org/r/20251027044712.1676175-1-vivek.kasireddy@intel.com

And the discussion for design of revoke is here:
 https://lore.kernel.org/dri-devel/20250114173103.GE5556@nvidia.com/

This is on github: https://github.com/jgunthorpe/linux/commits/iommufd_dmabuf

v2:
 - Rebase on Leon's v9
 - Fix mislocking in an iopt_fill_domain() error path
 - Revise the comments around how the sub page offset works
 - Remove a useless WARN_ON in iopt_pages_rw_access()
 - Fixed missed memory free in the selftest
v1: https://patch.msgid.link/r/0-v1-64bed2430cdb+31b-iommufd_dmabuf_jgg@nvidia.com

Jason Gunthorpe (9):
  vfio/pci: Add vfio_pci_dma_buf_iommufd_map()
  iommufd: Add DMABUF to iopt_pages
  iommufd: Do not map/unmap revoked DMABUFs
  iommufd: Allow a DMABUF to be revoked
  iommufd: Allow MMIO pages in a batch
  iommufd: Have pfn_reader process DMABUF iopt_pages
  iommufd: Have iopt_map_file_pages convert the fd to a file
  iommufd: Accept a DMABUF through IOMMU_IOAS_MAP_FILE
  iommufd/selftest: Add some tests for the dmabuf flow

 drivers/iommu/iommufd/io_pagetable.c          |  78 +++-
 drivers/iommu/iommufd/io_pagetable.h          |  54 ++-
 drivers/iommu/iommufd/ioas.c                  |   8 +-
 drivers/iommu/iommufd/iommufd_private.h       |  14 +-
 drivers/iommu/iommufd/iommufd_test.h          |  10 +
 drivers/iommu/iommufd/main.c                  |  10 +
 drivers/iommu/iommufd/pages.c                 | 414 ++++++++++++++++--
 drivers/iommu/iommufd/selftest.c              | 143 ++++++
 drivers/vfio/pci/vfio_pci_dmabuf.c            |  34 ++
 include/linux/vfio_pci_core.h                 |   4 +
 tools/testing/selftests/iommu/iommufd.c       |  43 ++
 tools/testing/selftests/iommu/iommufd_utils.h |  44 ++
 12 files changed, 786 insertions(+), 70 deletions(-)


base-commit: f836737ed56db9e2d5b047c56a31e05af0f3f116
-- 
2.43.0

