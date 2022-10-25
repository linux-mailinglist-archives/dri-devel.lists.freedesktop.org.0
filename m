Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E58F860D40A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 20:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D94510E418;
	Tue, 25 Oct 2022 18:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C5210E1E9;
 Tue, 25 Oct 2022 18:50:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYdj/c0W9iteJZGa30EZEjJCAW1w3/tjYDr2VYjgOfvL3iU5DDda5EJ3MtraEY0RzpKVkZfNVRdkhyrYqVT3H9IdqVQrABUaECtQdSUl3BFEP6wuEdB5iGo3iup62E/er40FuVN48q23woXqBmymgbmWzFuB0/IIAS1IylD5YVOpM2qB0P42hIxghcf8qs0n632jRxOKiqupbXB3V8I5a7Wlu5Ry/i2EpahYqvItHi0oCjM+S10XNzviYfe/hrMXQS3ZvWxqBcMdDrvuhTwC3Obn9ozDqJjtAWKR0Etz9UsLCBExYUvi3u+zNce+VwsP4hxzY1q/y3QxOiNKBsm6lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=be9jcDh97TA3Dx/sgHLGZhdICyhmuRcjFgczyEpRIPE=;
 b=f1OnIph/EVOcXcYI3SPtAy89Ay0k1RQ7WZSUeye2NDBT7B0qiJIROTdANa2bOlDOoXMHJ8O/OQrh3GkPgAnTr4FRKrP9tpRxEeHwPzXkiX5INACPF+7g1GSuqbUy91yJVOYZXGQkYSDvbq7sAyclgt0PqDgLz7qI9tCOz/60iHE/POzOuaA9iGsxyEpUfzeqnO+q/BBXhUN8sYEpdH/SWEi7gXOQnHPo4XJ6HDpuNFw9kHjD3yugfmFlpsqTMkcULyFU8bpP5MUdlwBmtDmlJsU9FqAVqPkoBC0jrAxXX14vOJ8mytG2OpU7GEFoGTsO8EShV7MZ8oouDgK078IS7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=be9jcDh97TA3Dx/sgHLGZhdICyhmuRcjFgczyEpRIPE=;
 b=RnuzT8QDq95P5ZfRkyggOvHFrBT1ojFi2r996uTtlQu7P0+2Hs1eaHMf3GIyEECib2Az2aTnNBsuKJlgGgLF4A1YcmBkg1QES1ovKDV7JcPnWGTAPse0xQH57G4ZjUWRaVF2oRqQmCw0+UXjqcnKmnLgHJnmJGnoR8H+g4atEcCYbmMN5oPzSF5QVVSaW0W9W0Z8byHxeKngx1Bjj2aJtA8h9UKsM5dVBvtPF5om6l49Aqou6Eopt6cKjpQuWKyimWC/5414ogkl9l9IlX0UPEVu845B9o+8u2zknoi1Tmyw1gFQc9Y7LDWAtqL3Ld71eWi+NAqxXyWp5uI6noq5Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ1PR12MB6124.namprd12.prod.outlook.com (2603:10b6:a03:459::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Tue, 25 Oct
 2022 18:50:49 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5746.021; Tue, 25 Oct 2022
 18:50:49 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Diana Craciun <diana.craciun@oss.nxp.com>, dri-devel@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 iommu@lists.linux.dev, Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
 kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 08/10] vfio-iommufd: Support iommufd for emulated VFIO devices
Date: Tue, 25 Oct 2022 15:50:43 -0300
Message-Id: <8-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0280.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::15) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: df3ea0db-8cdb-43ba-d943-08dab6b9d44e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ql28fd+tXyuJ+qwYR1Y+2FwMC1nNTna9CwkT300xKiNsWfJdCmdkJP9qtqQ3c779a30bMxPuTobIVYo/5MwdTAiGP8ctAIBMoc+7Z7iBTCgZ6EeYPabrjQzis9PTWH2jOcMankIfsw8C54ZbkrvXseZsQw3erEY6o7GfYVZFocrS/QXiV83bTsKr77LjGJuR7U7W/ut7J1FoPncMGRbvarCbSeq5bTQncTEAiPMNcwSWPPw4vF01zGv1j3kr22jBYFEIiErwZexLlZREffkT4kkZvR0NZqpYPZdQBI/6+5SMy5kPT2BhkkJin/l5GMhvEAfzMJKS0MNeQaU5P7c3BJgIUYTZrnt3voI/2PmdCb3nSywulTNmUI5C5vKuKKMKhZqcUu72JkYDJkOjL3PAdv+z04KS+DCiVQGN1ANYP7rpnY4rV9kFw+C4chN4JV+igQXXJfjeCYUSSUP1tuZJZZ7xs4o/wePXkP4Ii4ALm3IdxNcxW99vRiMiqISJlfgMHfa5NINdbKKVzVPrhuYNTD5RQHUcT4KNhLhvgsBai0wa8kYcT2gJpoAuwP56eCfm6OakxeRlrMLgsGF243i7cwgl2otm7dRXz3NpUUXjj99eLMMU0UgeRcdjaNWjMmwza0rzFgcWJt9sLSogIB2kJECht0N7jT2YfI6JzTrmjAynLcFK+vNnJzsJktLT7OKv14nGveg7Z/Fm8fcMvPLnQfu4tQAEGjzRMCRH5KmrpDNgCwmJWsZsXbIlYZtVa8k6PP7itxrdLNuUaAjZh/L5Rg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(396003)(136003)(39860400002)(346002)(451199015)(6512007)(26005)(921005)(8936002)(2906002)(6506007)(38100700002)(36756003)(7416002)(30864003)(83380400001)(5660300002)(41300700001)(7406005)(2616005)(478600001)(6486002)(186003)(54906003)(6666004)(316002)(66556008)(66476007)(66946007)(86362001)(8676002)(110136005)(4326008)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zw87f7atuMXyyKDBmjQKbeq95GPaaJBc4biwJN72S2fmxAMSs6qLX5OBR5Tw?=
 =?us-ascii?Q?U9t2ImH/3jjAzdzkc28FFYYRjBK0FQsn2wDRmzsarpBi44YOqnReNC65F6k7?=
 =?us-ascii?Q?XEJW6o8fxBiU+HnBzRIXz3HCHpvwueBmI1/Yv5QYZ9FmMTIgi9dNImvchKhF?=
 =?us-ascii?Q?CWDxS59il0UX3xic8P7zTDNGSlsDbCR79dNd1BzqTiDyd1BVEqmTb715mx88?=
 =?us-ascii?Q?RJBlyVjb65WmJ/j1iGbDc7p8xoMOSBegVrRhyZx0nTrlgqLBul4ATjPNF3r9?=
 =?us-ascii?Q?KDkiXsPxy0oIepusnBOxw+HK9hnc3D3WgvhaZkZTrq9rw7ur1CMiQiX7zsBc?=
 =?us-ascii?Q?gJcWh774tR7K4eaJChZlBdqVOLlX3M4kYeIX38HjZOzfbrDTvMxY4Vchlwej?=
 =?us-ascii?Q?HlLttnLNvUHn3HEe/1/e86a8t0WXUwHyVkkz4ARb3qNtqF/VOmDSBWY52nME?=
 =?us-ascii?Q?+xpFNVXNK4BwGSyGXjS84ebqMUvIpRaitveonj+ojKfzCup/wf4vphqnYilg?=
 =?us-ascii?Q?ExngY3GTY7kB05QVMa6XwzZhsYFZgtGxyPiO2NevxFByIOuShtI2S5kFNb6i?=
 =?us-ascii?Q?c3meXJGcCiKuZq5JTmvwwYnOAGPP/DHfFJR+fY110jxpQkNYdEbnvu+akJ14?=
 =?us-ascii?Q?7XG7L4wD7i6Dc7O2nLYIuh7tjOowOEFKLc4/tD9DS34wD/TF2GxqAg9vOpQE?=
 =?us-ascii?Q?8gTgKEvozOf6xYDZZv0ljpkDRkmUjt9Q94043C4onGS8R6qRPyYZedVfhRFg?=
 =?us-ascii?Q?aubDI86vyDvaZ3P+y6jwqgkyoVFCrHxPnrpiRd9jGe2FBPVPhv4Y7O/RvLqd?=
 =?us-ascii?Q?mXlM/r8t/EWBlj7qAeN0frWzH8aDX6x5KHS11JXZJK3rMKaGjtdRZk+g4Q4K?=
 =?us-ascii?Q?m86MIxElHWXIGeZQeqzBG3OfWk6tTahzA874yGdhXgNf5w2Gu6aRcRWq86Fx?=
 =?us-ascii?Q?cto+fHcE/9tuUdcAqBjxx5HC2G+K1RUKKuoG6RFh/fFv+QsQKXx4ZKnSnL0s?=
 =?us-ascii?Q?IqYTgx0Zxx18WOl26PTJ8dijJ4zCRWcClhm3Fxnuhuq4DbHHzUBnq+ESbfNg?=
 =?us-ascii?Q?GAbEvlmjr4WNbKhU2c0PELwRF8SEYTHsIhn+E7WqRdaPE+iSscOmq3ViJpMv?=
 =?us-ascii?Q?h73DeU8xjJkm9dc6eIUrbI77ioxW1/hW6LMNZ24LIv7JUIP4+/MlnXbZgGur?=
 =?us-ascii?Q?TW6YUv70sahsxE53MZT6tUN2zm46acFv0ZCiofNf39H/KAmmHgpcPRrN2EuQ?=
 =?us-ascii?Q?KkAzG/urKhONfsXxHNe0h3WAnCRQUeODXnLZBcB1KSbIthUItduVtllYhIuS?=
 =?us-ascii?Q?uRe6ovlvkPBg4G7KXLpVB8hMUN4yrhaDz3oq1m0a2sgJ+dmzTYiGD0Hijkt8?=
 =?us-ascii?Q?laV4CSISsXQ8kBTqfT/GoHXR1KrWcKNFan8ghlAQbq6kgje/oNUSGBy7ePWM?=
 =?us-ascii?Q?bdOjaBKWJRosBMJll1QDWCB4i8JUVtLU7Ni0JJbdoSj00ohVdHrGAvMKWJ5s?=
 =?us-ascii?Q?vrRpEhXqh30hgFvwmTNxf658LvbUWSARqbCkHcCru22wsVSAG0Xl2bFRaDOq?=
 =?us-ascii?Q?K4s3bwSiyLIt69CtmzE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df3ea0db-8cdb-43ba-d943-08dab6b9d44e
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 18:50:47.7251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MOlPoMrjZNy0fm6NzjsyK/HbHrU+yVNy53YR8VUg/ZR6qyfCkHZCJJhGgYEnhPBB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6124
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
Cc: Yi Liu <yi.l.liu@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Emulated VFIO devices are calling vfio_register_emulated_iommu_dev() and
consist of all the mdev drivers.

Like the physical drivers, support for iommufd is provided by the driver
supplying the correct correct standard ops. Provide ops from the core that
duplicate what vfio_register_emulated_iommu_dev() does.

Emulated drivers are where it is more likely to see variation in the
iommfd support ops. For instance IDXD will probably need to setup both a
iommfd_device context linked to a PASID and an iommufd_access context to
support all their mdev operations.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c  |   3 +
 drivers/s390/cio/vfio_ccw_ops.c   |   3 +
 drivers/s390/crypto/vfio_ap_ops.c |   3 +
 drivers/vfio/container.c          | 108 ++++++-----------------------
 drivers/vfio/iommufd.c            |  57 ++++++++++++++++
 drivers/vfio/vfio.h               |  10 ++-
 drivers/vfio/vfio_main.c          | 110 +++++++++++++++++++++++++++++-
 include/linux/vfio.h              |  14 ++++
 8 files changed, 217 insertions(+), 91 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 7a45e5360caf2d..579b230a0f58d9 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1474,6 +1474,9 @@ static const struct vfio_device_ops intel_vgpu_dev_ops = {
 	.mmap		= intel_vgpu_mmap,
 	.ioctl		= intel_vgpu_ioctl,
 	.dma_unmap	= intel_vgpu_dma_unmap,
+	.bind_iommufd	= vfio_iommufd_emulated_bind,
+	.unbind_iommufd = vfio_iommufd_emulated_unbind,
+	.attach_ioas	= vfio_iommufd_emulated_attach_ioas,
 };
 
 static int intel_vgpu_probe(struct mdev_device *mdev)
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index 6ae4d012d80084..560453d99c24fc 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -588,6 +588,9 @@ static const struct vfio_device_ops vfio_ccw_dev_ops = {
 	.ioctl = vfio_ccw_mdev_ioctl,
 	.request = vfio_ccw_mdev_request,
 	.dma_unmap = vfio_ccw_dma_unmap,
+	.bind_iommufd = vfio_iommufd_emulated_bind,
+	.unbind_iommufd = vfio_iommufd_emulated_unbind,
+	.attach_ioas = vfio_iommufd_emulated_attach_ioas,
 };
 
 struct mdev_driver vfio_ccw_mdev_driver = {
diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index 0b4cc8c597ae67..bb7776d207924f 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -1789,6 +1789,9 @@ static const struct vfio_device_ops vfio_ap_matrix_dev_ops = {
 	.close_device = vfio_ap_mdev_close_device,
 	.ioctl = vfio_ap_mdev_ioctl,
 	.dma_unmap = vfio_ap_mdev_dma_unmap,
+	.bind_iommufd = vfio_iommufd_emulated_bind,
+	.unbind_iommufd = vfio_iommufd_emulated_unbind,
+	.attach_ioas = vfio_iommufd_emulated_attach_ioas,
 };
 
 static struct mdev_driver vfio_ap_matrix_driver = {
diff --git a/drivers/vfio/container.c b/drivers/vfio/container.c
index 8772dad6808539..0388f2e33447eb 100644
--- a/drivers/vfio/container.c
+++ b/drivers/vfio/container.c
@@ -540,113 +540,45 @@ void vfio_group_unuse_container(struct vfio_group *group)
 	fput(group->opened_file);
 }
 
-/*
- * Pin contiguous user pages and return their associated host pages for local
- * domain only.
- * @device [in]  : device
- * @iova [in]    : starting IOVA of user pages to be pinned.
- * @npage [in]   : count of pages to be pinned.  This count should not
- *		   be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
- * @prot [in]    : protection flags
- * @pages[out]   : array of host pages
- * Return error or number of pages pinned.
- *
- * A driver may only call this function if the vfio_device was created
- * by vfio_register_emulated_iommu_dev().
- */
-int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
-		   int npage, int prot, struct page **pages)
+int vfio_container_pin_pages(struct vfio_container *container,
+			     struct iommu_group *iommu_group, dma_addr_t iova,
+			     int npage, int prot, struct page **pages)
 {
-	struct vfio_container *container;
-	struct vfio_group *group = device->group;
-	struct vfio_iommu_driver *driver;
-	int ret;
-
-	if (!pages || !npage || !vfio_assert_device_open(device))
-		return -EINVAL;
+	/* group->container cannot change while a vfio device is open */
+	struct vfio_iommu_driver *driver = container->iommu_driver;
 
 	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
 		return -E2BIG;
 
 	/* group->container cannot change while a vfio device is open */
-	container = group->container;
 	driver = container->iommu_driver;
-	if (likely(driver && driver->ops->pin_pages))
-		ret = driver->ops->pin_pages(container->iommu_data,
-					     group->iommu_group, iova,
-					     npage, prot, pages);
-	else
-		ret = -ENOTTY;
-
-	return ret;
+	if (unlikely(!driver || !driver->ops->pin_pages))
+		return -ENOTTY;
+	return driver->ops->pin_pages(container->iommu_data, iommu_group, iova,
+				      npage, prot, pages);
 }
-EXPORT_SYMBOL(vfio_pin_pages);
 
-/*
- * Unpin contiguous host pages for local domain only.
- * @device [in]  : device
- * @iova [in]    : starting address of user pages to be unpinned.
- * @npage [in]   : count of pages to be unpinned.  This count should not
- *                 be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
- */
-void vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova, int npage)
+void vfio_container_unpin_pages(struct vfio_container *container,
+				dma_addr_t iova, int npage)
 {
-	struct vfio_container *container;
-	struct vfio_iommu_driver *driver;
-
 	if (WARN_ON(npage <= 0 || npage > VFIO_PIN_PAGES_MAX_ENTRIES))
 		return;
 
-	if (WARN_ON(!vfio_assert_device_open(device)))
-		return;
-
-	/* group->container cannot change while a vfio device is open */
-	container = device->group->container;
-	driver = container->iommu_driver;
-
-	driver->ops->unpin_pages(container->iommu_data, iova, npage);
+	container->iommu_driver->ops->unpin_pages(container->iommu_data, iova,
+						  npage);
 }
-EXPORT_SYMBOL(vfio_unpin_pages);
 
-/*
- * This interface allows the CPUs to perform some sort of virtual DMA on
- * behalf of the device.
- *
- * CPUs read/write from/into a range of IOVAs pointing to user space memory
- * into/from a kernel buffer.
- *
- * As the read/write of user space memory is conducted via the CPUs and is
- * not a real device DMA, it is not necessary to pin the user space memory.
- *
- * @device [in]		: VFIO device
- * @iova [in]		: base IOVA of a user space buffer
- * @data [in]		: pointer to kernel buffer
- * @len [in]		: kernel buffer length
- * @write		: indicate read or write
- * Return error code on failure or 0 on success.
- */
-int vfio_dma_rw(struct vfio_device *device, dma_addr_t iova, void *data,
-		size_t len, bool write)
+int vfio_container_dma_rw(struct vfio_container *container, dma_addr_t iova,
+			  void *data, size_t len, bool write)
 {
-	struct vfio_container *container;
-	struct vfio_iommu_driver *driver;
-	int ret = 0;
-
-	if (!data || len <= 0 || !vfio_assert_device_open(device))
-		return -EINVAL;
-
 	/* group->container cannot change while a vfio device is open */
-	container = device->group->container;
-	driver = container->iommu_driver;
+	struct vfio_iommu_driver *driver = container->iommu_driver;
 
-	if (likely(driver && driver->ops->dma_rw))
-		ret = driver->ops->dma_rw(container->iommu_data,
-					  iova, data, len, write);
-	else
-		ret = -ENOTTY;
-	return ret;
+	if (unlikely(!driver || !driver->ops->dma_rw))
+		return -ENOTTY;
+	return driver->ops->dma_rw(container->iommu_data, iova, data, len,
+				   write);
 }
-EXPORT_SYMBOL(vfio_dma_rw);
 
 int __init vfio_container_init(void)
 {
diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index 8280bb32ee677c..40eb6931ab2321 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -102,3 +102,60 @@ int vfio_iommufd_physical_attach_ioas(struct vfio_device *vdev, u32 *pt_id)
 	return iommufd_device_attach(vdev->iommufd_device, pt_id, flags);
 }
 EXPORT_SYMBOL_GPL(vfio_iommufd_physical_attach_ioas);
+
+/*
+ * The emulated standard ops mean that vfio_device is going to use the
+ * "mdev path" and will call vfio_pin_pages()/vfio_dma_rw(). Drivers using this
+ * ops set should call vfio_register_emulated_iommu_dev().
+ */
+
+static void vfio_emulated_unmap(void *data, unsigned long iova,
+				unsigned long length)
+{
+	struct vfio_device *vdev = data;
+
+	vdev->ops->dma_unmap(vdev, iova, length);
+}
+
+static const struct iommufd_access_ops vfio_user_ops = {
+	.unmap = vfio_emulated_unmap,
+};
+
+int vfio_iommufd_emulated_bind(struct vfio_device *vdev,
+			       struct iommufd_ctx *ictx, u32 *out_device_id)
+{
+	lockdep_assert_held(&vdev->dev_set->lock);
+
+	vdev->iommufd_ictx = ictx;
+	iommufd_ctx_get(ictx);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vfio_iommufd_emulated_bind);
+
+void vfio_iommufd_emulated_unbind(struct vfio_device *vdev)
+{
+	lockdep_assert_held(&vdev->dev_set->lock);
+
+	if (vdev->iommufd_access) {
+		iommufd_access_destroy(vdev->iommufd_access);
+		vdev->iommufd_access = NULL;
+	}
+	iommufd_ctx_put(vdev->iommufd_ictx);
+	vdev->iommufd_ictx = NULL;
+}
+EXPORT_SYMBOL_GPL(vfio_iommufd_emulated_unbind);
+
+int vfio_iommufd_emulated_attach_ioas(struct vfio_device *vdev, u32 *pt_id)
+{
+	struct iommufd_access *user;
+
+	lockdep_assert_held(&vdev->dev_set->lock);
+
+	user = iommufd_access_create(vdev->iommufd_ictx, *pt_id, &vfio_user_ops,
+				     vdev);
+	if (IS_ERR(user))
+		return PTR_ERR(user);
+	vdev->iommufd_access = user;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vfio_iommufd_emulated_attach_ioas);
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 809f2e8523968e..d57a08afb5cf5c 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -111,8 +111,6 @@ struct vfio_iommu_driver {
 int vfio_register_iommu_driver(const struct vfio_iommu_driver_ops *ops);
 void vfio_unregister_iommu_driver(const struct vfio_iommu_driver_ops *ops);
 
-bool vfio_assert_device_open(struct vfio_device *device);
-
 struct vfio_container *vfio_container_from_file(struct file *filep);
 int vfio_group_use_container(struct vfio_group *group);
 void vfio_group_unuse_container(struct vfio_group *group);
@@ -121,6 +119,14 @@ int vfio_container_attach_group(struct vfio_container *container,
 void vfio_group_detach_container(struct vfio_group *group);
 void vfio_device_container_register(struct vfio_device *device);
 void vfio_device_container_unregister(struct vfio_device *device);
+int vfio_container_pin_pages(struct vfio_container *container,
+			     struct iommu_group *iommu_group, dma_addr_t iova,
+			     int npage, int prot, struct page **pages);
+void vfio_container_unpin_pages(struct vfio_container *container,
+				dma_addr_t iova, int npage);
+int vfio_container_dma_rw(struct vfio_container *container, dma_addr_t iova,
+			  void *data, size_t len, bool write);
+
 int __init vfio_container_init(void);
 void vfio_container_cleanup(void);
 
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index bfbda04af1ffda..9b837efbddb6db 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -766,7 +766,7 @@ static int vfio_group_ioctl_set_container(struct vfio_group *group,
 static const struct file_operations vfio_device_fops;
 
 /* true if the vfio_device has open_device() called but not close_device() */
-bool vfio_assert_device_open(struct vfio_device *device)
+static bool vfio_assert_device_open(struct vfio_device *device)
 {
 	return !WARN_ON_ONCE(!READ_ONCE(device->open_count));
 }
@@ -1861,6 +1861,114 @@ int vfio_set_irqs_validate_and_prepare(struct vfio_irq_set *hdr, int num_irqs,
 }
 EXPORT_SYMBOL(vfio_set_irqs_validate_and_prepare);
 
+/*
+ * Pin contiguous user pages and return their associated host pages for local
+ * domain only.
+ * @device [in]  : device
+ * @iova [in]    : starting IOVA of user pages to be pinned.
+ * @npage [in]   : count of pages to be pinned.  This count should not
+ *		   be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
+ * @prot [in]    : protection flags
+ * @pages[out]   : array of host pages
+ * Return error or number of pages pinned.
+ *
+ * A driver may only call this function if the vfio_device was created
+ * by vfio_register_emulated_iommu_dev() due to vfio_container_pin_pages().
+ */
+int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
+		   int npage, int prot, struct page **pages)
+{
+	if (!pages || !npage || !vfio_assert_device_open(device))
+		return -EINVAL;
+	if (device->group->container)
+		return vfio_container_pin_pages(device->group->container,
+						device->group->iommu_group,
+						iova, npage, prot, pages);
+	if (device->iommufd_access) {
+		int ret;
+
+		if (iova > ULONG_MAX)
+			return -EINVAL;
+		ret = iommufd_access_pin_pages(
+			device->iommufd_access, iova, npage * PAGE_SIZE, pages,
+			(prot & IOMMU_WRITE) ? IOMMUFD_ACCESS_RW_WRITE : 0);
+		if (ret)
+			return ret;
+		return npage;
+	}
+	return -EINVAL;
+}
+EXPORT_SYMBOL(vfio_pin_pages);
+
+/*
+ * Unpin contiguous host pages for local domain only.
+ * @device [in]  : device
+ * @iova [in]    : starting address of user pages to be unpinned.
+ * @npage [in]   : count of pages to be unpinned.  This count should not
+ *                 be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
+ */
+void vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova, int npage)
+{
+	if (WARN_ON(!vfio_assert_device_open(device)))
+		return;
+
+	if (device->group->container) {
+		vfio_container_unpin_pages(device->group->container, iova,
+					   npage);
+	} else if (device->iommufd_access) {
+		if (WARN_ON(iova > ULONG_MAX))
+			return;
+		iommufd_access_unpin_pages(device->iommufd_access, iova,
+					   npage * PAGE_SIZE);
+	}
+}
+EXPORT_SYMBOL(vfio_unpin_pages);
+
+/*
+ * This interface allows the CPUs to perform some sort of virtual DMA on
+ * behalf of the device.
+ *
+ * CPUs read/write from/into a range of IOVAs pointing to user space memory
+ * into/from a kernel buffer.
+ *
+ * As the read/write of user space memory is conducted via the CPUs and is
+ * not a real device DMA, it is not necessary to pin the user space memory.
+ *
+ * @device [in]		: VFIO device
+ * @iova [in]		: base IOVA of a user space buffer
+ * @data [in]		: pointer to kernel buffer
+ * @len [in]		: kernel buffer length
+ * @write		: indicate read or write
+ * Return error code on failure or 0 on success.
+ */
+int vfio_dma_rw(struct vfio_device *device, dma_addr_t iova, void *data,
+		size_t len, bool write)
+{
+	if (!data || len <= 0 || !vfio_assert_device_open(device))
+		return -EINVAL;
+
+	if (device->group->container)
+		return vfio_container_dma_rw(device->group->container, iova,
+					     data, len, write);
+
+	if (device->iommufd_access) {
+		unsigned int flags = 0;
+
+		if (iova > ULONG_MAX)
+			return -EINVAL;
+
+		/* VFIO historically tries to auto-detect a kthread */
+		if (!current->mm)
+			flags |= IOMMUFD_ACCESS_RW_KTHREAD;
+		if (write)
+			flags |= IOMMUFD_ACCESS_RW_WRITE;
+		return iommufd_access_rw(device->iommufd_access, iova, data,
+					 len, flags);
+	}
+	return -EINVAL;
+}
+EXPORT_SYMBOL(vfio_dma_rw);
+
 /*
  * Module/class support
  */
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index a7fc4d747dc226..d5f84f98c0fa8f 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -19,6 +19,7 @@
 struct kvm;
 struct iommufd_ctx;
 struct iommufd_device;
+struct iommufd_access;
 
 /*
  * VFIO devices can be placed in a set, this allows all devices to share this
@@ -56,8 +57,10 @@ struct vfio_device {
 	struct completion comp;
 	struct list_head group_next;
 	struct list_head iommu_entry;
+	struct iommufd_access *iommufd_access;
 #if IS_ENABLED(CONFIG_IOMMUFD)
 	struct iommufd_device *iommufd_device;
+	struct iommufd_ctx *iommufd_ictx;
 	bool iommufd_attached;
 #endif
 };
@@ -111,6 +114,10 @@ int vfio_iommufd_physical_bind(struct vfio_device *vdev,
 			       struct iommufd_ctx *ictx, u32 *out_device_id);
 void vfio_iommufd_physical_unbind(struct vfio_device *vdev);
 int vfio_iommufd_physical_attach_ioas(struct vfio_device *vdev, u32 *pt_id);
+int vfio_iommufd_emulated_bind(struct vfio_device *vdev,
+			       struct iommufd_ctx *ictx, u32 *out_device_id);
+void vfio_iommufd_emulated_unbind(struct vfio_device *vdev);
+int vfio_iommufd_emulated_attach_ioas(struct vfio_device *vdev, u32 *pt_id);
 #else
 #define vfio_iommufd_physical_bind                                      \
 	((int (*)(struct vfio_device *vdev, struct iommufd_ctx *ictx,   \
@@ -119,6 +126,13 @@ int vfio_iommufd_physical_attach_ioas(struct vfio_device *vdev, u32 *pt_id);
 	((void (*)(struct vfio_device *vdev)) NULL)
 #define vfio_iommufd_physical_attach_ioas \
 	((int (*)(struct vfio_device *vdev, u32 *pt_id)) NULL)
+#define vfio_iommufd_emulated_bind                                      \
+	((int (*)(struct vfio_device *vdev, struct iommufd_ctx *ictx,   \
+		  u32 *out_device_id)) NULL)
+#define vfio_iommufd_emulated_unbind \
+	((void (*)(struct vfio_device *vdev)) NULL)
+#define vfio_iommufd_emulated_attach_ioas \
+	((int (*)(struct vfio_device *vdev, u32 *pt_id)) NULL)
 #endif
 
 /**
-- 
2.38.0

