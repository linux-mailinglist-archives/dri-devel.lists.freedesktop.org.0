Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FD462055C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 01:54:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C3210E399;
	Tue,  8 Nov 2022 00:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA6510E20D;
 Tue,  8 Nov 2022 00:53:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANOF9rB0WSllkYap43urHcYThDyuJhnwvWDXW/qubmuIRthK68qUPVSIqmJD0+gJrMrDVZV6sAW0Z7Iq+mva/VlNS6ATowAmIVYNaD13ZI+nyx25coi6SWknZO7GyBoAwupXAy6lPB5yRxpr4resSboG/ePGW+HM2cGhBH6dXEDTvbGNyUh9uxOl8XvY1xnyKxm4FD51hyy0F+KEtYUrAfbpgi15RJKi1VAfYR/s0RolzZNRtMX++0mTmiEGRxPWGpcjj46NjjOiFRhpChujyDbcpfLvnLF/WxP9R8ZXLMx+qJZ+rPX8TqR5avvKvyZoWsr4bPeSJ5zjpiIZ3uQigg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhLE9lxLEmL7yahCzZ94B3vrfIVYoCRFxM57vKeg/7Q=;
 b=IAgoozGAfmpuOg2acdISF+WLJOJSlH0WkrLNvLnaKUPLuBEq/M2hashDKHroSVVX7xLSLlwEvLKY9APMnp8VKL6yE9q6H+GZCQbXgTME3X68tFdV5+W/KwmfJ/YJondrOg4NLdwrlkjJfseq5P4gCQv0ieXbTKZkhWPDx3WRpTDbAGZI7ebortfxd8FHioUO3iDXN6tGQFIiw3y1RIbk4AS/7Xlwf+jyXh0tDNMkyFcsM7GW8I7W5HH+dhtG5ToixUwOpZgHN6rr8aP6yaH9NTvOonOrqU6l8K94q+RyXApa3xwdB2o4yyXFgowhWDZMLkWrP/UfO8OIFbAujymiiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhLE9lxLEmL7yahCzZ94B3vrfIVYoCRFxM57vKeg/7Q=;
 b=PHWUy+jta23S5U7MI77MRtwT0GPmWDmF/uVHW1uL/5jt3K1IyVxg4973GWfYhMjcRosJAB80OBXPmE0pytmqGOHt5bctDBQU3aDqCFTtChzq/PpCjlEzLRwL8rE09CSR99dCyXxZBDsHw87Su8SBB/WYbD4FnNGhuBgm7rnJz7oUW/VTMFKQFhyVTNv+uSubVhTZDv3QAtSgld812U8CfqyRUc4m/jpV1ZpKAVfUwRE07WoDuSwORLHysJFPnWptkHl1dnXKbOuMWfvtKexzTFkuJtno/bwoJDxgEww8pi/r52sUuAFQXy0H7cuUbSSRSYV5zrHLBvsjalvlFI+UvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ0PR12MB6686.namprd12.prod.outlook.com (2603:10b6:a03:479::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Tue, 8 Nov
 2022 00:53:01 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 00:53:01 +0000
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
Subject: [PATCH v2 08/11] vfio-iommufd: Support iommufd for emulated VFIO
 devices
Date: Mon,  7 Nov 2022 20:52:52 -0400
Message-Id: <8-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:208:32e::16) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ0PR12MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: da4ee302-5b35-4d6b-edd6-08dac1239392
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ilvUNNucIUtYYt5KmXgLBIdhns/SHFF+1EyhO/OKFjsPtEEzqvUQrHEyx6ue5AsodAOkQxTbklTYDz1CQDHvtd/fU1Q+rN6bMYvO8PClrgorUir5N5uAfNxXz6ChR2C9f/itgiTVvCapCCVMqWYNxZ6G8vjI5VMVyCSQYJckZpADGsxx/Svj0e2fAub5y3OuCMFGDfOyesy/Kf0itBszKZmEt0OYCrd6WfAqoWvV3Mf5XkgmI64Fic+BXX9ZUISOMXqCYlPj4bpeQmmEhQyKjR3phgEYetSLhODE/UAf/ATp3u8CkXx9xeA7QHPLQiox70ZJot+3glwVpzgxPIbRCSdhmQoBdp/pGhSeSsLzGNb6FMs/U8s5pM+Y3AtYhd8I8XH+fgEyW3/gjdSzVB3F3P6xtFYS2x9OC3vN5HblKlJGUB2fon9cRtmQuS0cCSHqjL1AGZNIPi4g9jKTcbvARgk1IYOoOxRx/7FtFah6lo6QBmyknrWNeIg4lvpn+217W50rX7U1FCcPCNaJYwiaTP+/q934mPla3Y3isWPeJR3e6z/p8fliZ/Rf02HGThcbjO4uxEocFnbGiJlGE7yF1Raxcs+s1Lw4QGgH9kq1qYa4qDmDBKyoeq8WZgWh74qEceh/7OP8dT2AWzr1HiPZKzPpEu++gs9rth91/4VX9qXb8UyxHUJvgqtWr6yhc4smvPgQASOlyfBFmzkw1/Xpi1BId1gSZsaUSyKNOF1vDe4fRVC7m7WqvbhfebMVOy4zTDiUgaYyz/XoHZFLpZ0Jvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199015)(2616005)(921005)(83380400001)(38100700002)(186003)(2906002)(30864003)(7416002)(7406005)(8936002)(86362001)(5660300002)(478600001)(6666004)(6486002)(26005)(6512007)(6506007)(66476007)(66556008)(8676002)(4326008)(316002)(41300700001)(110136005)(54906003)(66946007)(36756003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p90ie+EGcgNxvjZys+Ifcmn9nYYVa1dZ8irz8oi7ZkMhLMqX3puB/Ss8JWEe?=
 =?us-ascii?Q?HvZk+YBOK6cmkXlwE6CdtHnyHYRA7IufI5NYmHvRhkIqa+GjYizDgtpn0+3V?=
 =?us-ascii?Q?i/bxb2/VaTowxyXFQ6Qkz/814yLyRb4a1brR2zg9xC4Lyz4CKJ7NtcZB3Xck?=
 =?us-ascii?Q?8ZlLJQXeBYTXVtvO/ZjBnmmHdI8izX+6gcRh5nIc6JtrEMXiz7EbVetJ4wj6?=
 =?us-ascii?Q?pqJMCzbf5/c/IVoZ8VPMcjVhJT0rbRp1z/Q2vl5swqHjRrwcNKOEiwT6B4lY?=
 =?us-ascii?Q?8wuEnH6LvTELUUi5UwRSAU0P6mz4xV8NZQZePV6NIXpdp9aUDK32mIEf6p97?=
 =?us-ascii?Q?VJh8ECsT2USbciRJqJELtp9PKyEPUeXpv/YPhGhdgjAowGq4XuCTJEZebp6p?=
 =?us-ascii?Q?Mi7keAGEQU/OJxT33Ft4LUDCRbVcP31XnZwyicNwVFHl7fxZ3552Ftc7dZcL?=
 =?us-ascii?Q?VHbdfdpU55jMgaiW0yNw4Nk3DsXYadgEDLFy87/7IE1pbsJPW9Jh3JEVFo8U?=
 =?us-ascii?Q?WGhY2OvjV0mwjMO6HlGxx5w6PPvI/NYXAf2iwRSCZCCuhVEYGJUuw0WM3/P5?=
 =?us-ascii?Q?5/xcbkTTt39QNOp0dY0Od9Oc32GYKTM56TQXt4iY+shbfvOuTzyaTuzs78eU?=
 =?us-ascii?Q?bBmq3MFwwgVsj2t60VuY0DnqOYxB4ABeGTQMzeA00ZGJL2OoSNnedZsaHpbU?=
 =?us-ascii?Q?UrshfiNF85th7/IQrF5rMU613dsaFuyQt2U6XGgcj/qzIS25XX5OuH6N+W0d?=
 =?us-ascii?Q?GSLGewFijtiA7RSAg50chyPupk060hZ+nIVbgl1MDMROg2XHetSvnx2VDxEE?=
 =?us-ascii?Q?MOCbVu9JyIJdjuZZnWglsPEcQYPtctePI22v1dxcSrLsAte73VIQK0+ulITD?=
 =?us-ascii?Q?bqp9hbmajUXykSn3gZ3owTJifVsO+Ku3tD1Kqa3ATMb7nMkhey7WB69SvpTU?=
 =?us-ascii?Q?+2gt2gF0gyQyfrhUXw9QI9WLUAKBGv+PPawEv3lkrVFXBDotNb03bpgXO4YJ?=
 =?us-ascii?Q?oVOMzpYeSNOVIH1bXg6YfemyV3bReNlBXTH0ZDUnm/ENO5WNhLifgE83oHC0?=
 =?us-ascii?Q?P4ZgjDt8WCCBKsZfGvVM6o48YjcwZJwuZ5R8uB5OXIuOCzMTtxb861tYerAc?=
 =?us-ascii?Q?SYhPuwC1kZFHrcDtEP8Hc3DUYVAm5c46tdjeEH9VFdUFyBTTimbbQ6uh6h34?=
 =?us-ascii?Q?5AUG7MOvj4Kyu12P358Is2C1HZ1z6SWtOtOyIxlxFM+hq4lUHeh/Z1CfDVKD?=
 =?us-ascii?Q?Ve8nqLbFLvMnSbxWzZW3R0/S/v+xHHSGnB78smM8/ELAGaw+3noDr7bl4W7B?=
 =?us-ascii?Q?H9BDhc9Hhxqgn+yA49WTPvW4p0RS4pFl1BNhXB2n2wIpq7aio34OAEkE390g?=
 =?us-ascii?Q?3an6XTzd2NJJnFyafK+hFGSm5Qo09DX/HbRE/dmZa0HMJyyN9sjsbPY/HOjA?=
 =?us-ascii?Q?A/rl/cZdywAjEU4+LthBG7JSO7qvotSM2xupG18zcPiBfoArY/AfbVeBsuPi?=
 =?us-ascii?Q?xnrFbbxgNDJqEhcPeAN/e5FBHI1IbeBrjoygGwOxZ7l1QydlTRG2d3tJFPQB?=
 =?us-ascii?Q?yObtyeJizhd6s0A+v7A=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da4ee302-5b35-4d6b-edd6-08dac1239392
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 00:52:57.2741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: owtAPrT30CT9suREhOG1m+NMNnH4J44ECmWWcMTuxmDPktZZEM4p8qVFhl0cfxoL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6686
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Emulated VFIO devices are calling vfio_register_emulated_iommu_dev() and
consist of all the mdev drivers.

Like the physical drivers, support for iommufd is provided by the driver
supplying the correct standard ops. Provide ops from the core that
duplicate what vfio_register_emulated_iommu_dev() does.

Emulated drivers are where it is more likely to see variation in the
iommfd support ops. For instance IDXD will probably need to setup both a
iommfd_device context linked to a PASID and an iommufd_access context to
support all their mdev operations.

Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c  |   3 +
 drivers/s390/cio/vfio_ccw_ops.c   |   3 +
 drivers/s390/crypto/vfio_ap_ops.c |   3 +
 drivers/vfio/container.c          | 110 +++++-----------------------
 drivers/vfio/iommufd.c            |  58 +++++++++++++++
 drivers/vfio/vfio.h               |  10 ++-
 drivers/vfio/vfio_main.c          | 114 +++++++++++++++++++++++++++++-
 include/linux/vfio.h              |  14 ++++
 8 files changed, 221 insertions(+), 94 deletions(-)

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
index 8772dad6808539..7f3961fd4b5aac 100644
--- a/drivers/vfio/container.c
+++ b/drivers/vfio/container.c
@@ -540,113 +540,41 @@ void vfio_group_unuse_container(struct vfio_group *group)
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
+	struct vfio_iommu_driver *driver = container->iommu_driver;
 
 	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
 		return -E2BIG;
 
-	/* group->container cannot change while a vfio device is open */
-	container = group->container;
-	driver = container->iommu_driver;
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
-	/* group->container cannot change while a vfio device is open */
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
index bf755d0f375c5d..595c7b2146f88c 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -97,3 +97,61 @@ int vfio_iommufd_physical_attach_ioas(struct vfio_device *vdev, u32 *pt_id)
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
+	.needs_pin_pages = 1,
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
index 2f3e35d2f2083d..cf49c5200a4c05 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -771,7 +771,7 @@ static int vfio_group_ioctl_set_container(struct vfio_group *group,
 static const struct file_operations vfio_device_fops;
 
 /* true if the vfio_device has open_device() called but not close_device() */
-bool vfio_assert_device_open(struct vfio_device *device)
+static bool vfio_assert_device_open(struct vfio_device *device)
 {
 	return !WARN_ON_ONCE(!READ_ONCE(device->open_count));
 }
@@ -1875,6 +1875,118 @@ int vfio_set_irqs_validate_and_prepare(struct vfio_irq_set *hdr, int num_irqs,
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
+	/* group->container cannot change while a vfio device is open */
+	if (!pages || !npage || WARN_ON(!vfio_assert_device_open(device)))
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
+		return;
+	}
+	if (device->iommufd_access) {
+		if (WARN_ON(iova > ULONG_MAX))
+			return;
+		iommufd_access_unpin_pages(device->iommufd_access, iova,
+					   npage * PAGE_SIZE);
+		return;
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
2.38.1

