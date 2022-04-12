Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 422454FE537
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 17:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D1010E37F;
	Tue, 12 Apr 2022 15:53:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EECF10E589;
 Tue, 12 Apr 2022 15:53:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbek2IcKC92bgHPPGT1K85QmEC+hit+cQOlIOS5GHVgZV8wtnarlO0tQw4PYeD8mx7o7gAGNG3Jzrv1PEt4hrs/5Z4Y7zMe1RIAC25ODYuE0H+8cXnRJjCx/bojjYPLbvAl7eSUGUeVikScJnp5gIhwkJRCSJd4GnMorcqG/HIMXx+ID1728FJEIeO8Fgcavszf8z6me/gSgUpgG3yL6ufmV3I6CrF6vg3aJLivK/7HiaTz5LL2jJmtdMsl6tqHK93R6bMXGsmVavNL2iYJQnNYiZDeDR6SfScF77Ysa6gpBJEI2QjfhpC2KLUdUV3ioMUFaytyScyuqIEprqb7r/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PEjkobyvXuYb5cQFa0iZCp/D8cFwN6cS9HgIe1OHag=;
 b=QmdhhSLUuxNyIhrwxHTn4ooHortMWEDGdiEJUMYWvkSYYHOVjYr2VURgi90xakI8W5F3znrIlTOO+PJCHyhRy34Xni2FV0mrzOqnSfpI3+cpAEL0McgnDOAP+ESCTuwroqSXbZ2RVfJ42eEuBvjYrAVS+xKWuwFB+yFEAoPv3jEctWH+IO6Pw/rJgctOvbYizUIGjoiOgCVeYhLC2dat1TJ4cYMZa1A2O6Mc2CbV/7v9zhEWX7BS+DJFXLZ5GCoYl7089EOHLURJWqc0MvLX5CSBhY85VKgTd8L7GgPlQhY81fmHBp8alycFXdWpOrnuQdL8OVpKU23Vk6GrlVHBRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PEjkobyvXuYb5cQFa0iZCp/D8cFwN6cS9HgIe1OHag=;
 b=Llil5kvOB9qgkz15zOWe0LqXdsDWCMx1SHW3+YtPDWZuQfnFpnZ6DxIusqtxyv3MWWToMSANWSzWBukgAOjCCJKlVv0cSblbBFypXDh/YYXJPl9khRTGppkQC6/vZZOJbecLQzVQvo8udUP3pcdUfvU715o5eCvf3X3ujCgPD6zGCdp8SlhZcRv+IIv2JgibPLp9UMCqkHo/Wo/lOAyXhMf0lbkuVImluskXuul6PQ0YOwJXlb2XpoSEHdXd6o5WSoeDCAb5QCa4oST6jvb0XlzQ5wuLz9e1oV+T0/uTq/hJulz6Q9L+osd/mIYtROX7LK1VhbtlcO/CIpio//F/XQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB4181.namprd12.prod.outlook.com (2603:10b6:610:a8::16)
 by DM6PR12MB4172.namprd12.prod.outlook.com (2603:10b6:5:212::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 15:53:39 +0000
Received: from CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::c911:71b5:78e6:3a38]) by CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::c911:71b5:78e6:3a38%8]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 15:53:38 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-doc@vger.kernel.org,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 1/9] vfio: Make vfio_(un)register_notifier accept a vfio_device
Date: Tue, 12 Apr 2022 12:53:28 -0300
Message-Id: <1-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <0-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:208:32e::18) To CH2PR12MB4181.namprd12.prod.outlook.com
 (2603:10b6:610:a8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e17776c-9202-4099-a647-08da1c9c9b61
X-MS-TrafficTypeDiagnostic: DM6PR12MB4172:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4172CCBECE5D8D2F4C634513C2ED9@DM6PR12MB4172.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KZfJdqvTXbkw9AXuuoEVmMSVqfwjtavftzCljQALOsb9UpfsW+/mqfKSYpt1NH7zmwAsibHdRmxvPKxHcbVyG1oEPkoQ6BwOBTPV0Pgwt//NltzZepERBPNbrzuHfxdxd5LB4tiU7qZk2MtSFkaq6Y6H/jaLx1T3y5Ov3kAFdsR3zpsCE72kzgYhG2DdaxEnc3C2lHtN+EHKn3eUkWzu+phprT/QGaUvxNxCBcw+KWGU1N/AIPnwWfMhEaX7USUkkCJrxOHstjgQlXpf4Hn3ZTnjYsV6sDKkBQV0LYJ2uR6By2+xsLK1W5VYMij5X7WX4ckgF/vvJzV+hQWMscaWSpu1gOmOztIXVBUB7K3nDdHmGZqDf1I4bWQpcteQ2eLWB8PazW/1I0Y93tWK5LwiO9M/Gr0pJhqlkgBq+3hgs5uIZHCp25SSCfbY3aCesW1FeJXwvx0V/ZRhW2TyHBB1H14AnY9+QJyHnFgfubsrlCbwpY8a+TLx8k4Y8sqNoHiZvi/J+5Iba1ljcVEab15AIIwW8iP4jKJzrCk5/xIZvky+J1y6usLW9opdyK5KfQUd//ljNe1G7mnMgBobe0Rosddn8r++BP7hXT2K+NYFi011SclQfDjswTJYz/YgG1Ijcu6kneEoi4VpUBSuXZtdDVY/GkOsXcqpEfYbCw0pkMtUbg1K2vpwnzIsjmvl0oBDVS5MLB9h6GLv9ibXX13/rA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4181.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(6486002)(6506007)(6666004)(66946007)(66476007)(4326008)(66556008)(26005)(186003)(36756003)(83380400001)(8676002)(316002)(54906003)(86362001)(8936002)(6512007)(2616005)(921005)(110136005)(7416002)(5660300002)(38100700002)(2906002)(7406005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j2eGSonroG5dDVB1IFHBlyl2Lni7Unzf2e6OUB4SMdSmMWNBZVq7d0FMNo6R?=
 =?us-ascii?Q?2YOyAANTHKOcHejA/SEZIejF4EbSBtr5WpMPPGH1nU0Avu72C4C8OLMPmXZ7?=
 =?us-ascii?Q?pQK0e0e3ap3pkCWV+e3JJr+NGGDTVdd5r2tbb02R9VUMOWRSTXtAUPYODwlp?=
 =?us-ascii?Q?rw/lXuqUi86yTkQwbEbRo8iuKL2Jgbrg/9hEFX/kajouL2E0j49+56owiCjo?=
 =?us-ascii?Q?aBsci/O2rmbR/JwU4RZQGTeHpi7TZn1JrAIujUlvgV5vB/0gjY3MHz80sAig?=
 =?us-ascii?Q?9SdcNmURauKPDBotLT6Z/1uQLBPAkzjOU+evpTof2RPXlcRmhnjpulVS1CUp?=
 =?us-ascii?Q?EC7VW0paqkasgdPrrq3pS8QEGW1wAM0eOh06ZxNIgnJYDB0fuaGPkXa4fGYX?=
 =?us-ascii?Q?atGXx/DSmAVUgEVjDiU6psQSmPVY4DA3ftvT9TmOYqMtAcO+el9TDUfb3OxS?=
 =?us-ascii?Q?yd+gzdTHSAZzXaxnG900UJdIXXhJ3tvBagXJ9e7d3LlivpOYIsJkCmkNpZa5?=
 =?us-ascii?Q?nS4QOB0E0Jvci+bvASMOxPEJOAOT/qhQN3YEWqDCS8SjzIICVm3my4ap4X/i?=
 =?us-ascii?Q?Ob3IKuqg8UCcqTcDsfw7NcZPtoL5aOL32R1Pz95YaIu6YB8VCaAL3IyxhvGE?=
 =?us-ascii?Q?A8IG8IYfRszPHnhkOR0UKr5D+V5pUcYBi9MVKZXl5fb5UdgvSrJ1Mut0987w?=
 =?us-ascii?Q?a8JRqrc1khIJtKMaKS6GzLFLwMcUTwFKNgVpsmd66atpsN6YdGRqb/X/rYAC?=
 =?us-ascii?Q?nmywdSzGNB9gzsy/aMdNMEzHYhDRd/2iUXOs/pfa0cj+p6u6BeoXVx7WxSno?=
 =?us-ascii?Q?cUjHTJEpICpKVlOiEpA49bGVgS6t+ZpAh3vHjawBF5bDKoDBluTHSSFEzG+L?=
 =?us-ascii?Q?izbwYcJH6WonOK+SefmStzTSwTRe89qhApsN7H7pWhe38TYfmG+KCnOBkOuH?=
 =?us-ascii?Q?l+G5+aN3xpEmzcGpVgz275iUrpQopC5HFQSURqzGF7Ev6iaxfzZ9Uqov8P81?=
 =?us-ascii?Q?OJcvT1RpEx5kFmYjIFU9hXa/kFOuTgH98z0Gyfxloh+6QcBW1MzuK4qlt4Sk?=
 =?us-ascii?Q?CR30/upqPPMPbmi/G5R4LBbXkxKS6Bw9PJ5uZRTH37ONEjITyxieF0StUm8R?=
 =?us-ascii?Q?S8psSGf7Ggka+mK3ZUxN7CoRLWn3pAhQagRZPxadbiMQ8gjMPWzE+7yvqG5i?=
 =?us-ascii?Q?x9+XAHAAt3eXO/SjRiNlYzcDl8IIN8FqyxVY1CJkwObpnYs3nOYsVZu3YVYg?=
 =?us-ascii?Q?5U5KFuuO75x94iLxmILDQM0QPKGrqvtxr+DFLTBocoJEaRgoCHLroMGGNfOw?=
 =?us-ascii?Q?gDXHY9IIWqdJbSDDbtcCqoJcnw1vsRV+8HOnMIJ4GbWJLwKVYmcGC+lZ0gnl?=
 =?us-ascii?Q?LzGJIE9e0eszwsy1PjwH4ELfCYwtHDZFjh/I7kpV0kFpDK9KXsvjPo8qpiae?=
 =?us-ascii?Q?yrIeGMdRoKwVvrdNKD0YlI3r/rPp6vzfAPDr1LjT7SgPDF+6Z/NA0YVpmCph?=
 =?us-ascii?Q?SgCbkpYedDk4C8BBQzTX7s/XkG/uTnsDSJBDBPnTyWJQ+2ERXT68OLxaDrmq?=
 =?us-ascii?Q?/KmA9EyAL7KdexZg2aKH2TOSrrvtDOB/JyM0cZ9asjNwao+L3zjcrz3VGTOm?=
 =?us-ascii?Q?mC0mSiIEz124d4k/l3tPNDOTUqzZ4XbaVuagMIS6xzuWucz4OpMEzkZZT76Z?=
 =?us-ascii?Q?YwKEU7yok9Yntggi0kbH2xL2WhIRLxuxS99cRyYBhXrvASzybZj+yKBRcDjo?=
 =?us-ascii?Q?gNqmg3r1Cg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e17776c-9202-4099-a647-08da1c9c9b61
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4181.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 15:53:37.6034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RC5x9C5aeJ4EIRC6TeRU8X9NHFtoOw1Mwrr1VixJuhbDT3GvWV1T9VqkU2fCmf/F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4172
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All callers have a struct vfio_device trivially available, pass it in
directly and avoid calling the expensive vfio_group_get_from_dev().

To support the unconverted kvmgt mdev driver add
mdev_legacy_get_vfio_device() which will return the vfio_device pointer
vfio_mdev.c puts in the drv_data.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c  | 15 +++++++++------
 drivers/s390/cio/vfio_ccw_ops.c   |  7 +++----
 drivers/s390/crypto/vfio_ap_ops.c | 14 +++++++-------
 drivers/vfio/mdev/vfio_mdev.c     | 12 ++++++++++++
 drivers/vfio/vfio.c               | 25 +++++++------------------
 include/linux/mdev.h              |  1 +
 include/linux/vfio.h              |  4 ++--
 7 files changed, 41 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 057ec449010458..bb59d21cf898ab 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -904,6 +904,7 @@ static int intel_vgpu_group_notifier(struct notifier_block *nb,
 
 static int intel_vgpu_open_device(struct mdev_device *mdev)
 {
+	struct vfio_device *vfio_dev = mdev_legacy_get_vfio_device(mdev);
 	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
 	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 	unsigned long events;
@@ -914,7 +915,7 @@ static int intel_vgpu_open_device(struct mdev_device *mdev)
 	vdev->group_notifier.notifier_call = intel_vgpu_group_notifier;
 
 	events = VFIO_IOMMU_NOTIFY_DMA_UNMAP;
-	ret = vfio_register_notifier(mdev_dev(mdev), VFIO_IOMMU_NOTIFY, &events,
+	ret = vfio_register_notifier(vfio_dev, VFIO_IOMMU_NOTIFY, &events,
 				&vdev->iommu_notifier);
 	if (ret != 0) {
 		gvt_vgpu_err("vfio_register_notifier for iommu failed: %d\n",
@@ -923,7 +924,7 @@ static int intel_vgpu_open_device(struct mdev_device *mdev)
 	}
 
 	events = VFIO_GROUP_NOTIFY_SET_KVM;
-	ret = vfio_register_notifier(mdev_dev(mdev), VFIO_GROUP_NOTIFY, &events,
+	ret = vfio_register_notifier(vfio_dev, VFIO_GROUP_NOTIFY, &events,
 				&vdev->group_notifier);
 	if (ret != 0) {
 		gvt_vgpu_err("vfio_register_notifier for group failed: %d\n",
@@ -961,11 +962,11 @@ static int intel_vgpu_open_device(struct mdev_device *mdev)
 	vdev->vfio_group = NULL;
 
 undo_register:
-	vfio_unregister_notifier(mdev_dev(mdev), VFIO_GROUP_NOTIFY,
+	vfio_unregister_notifier(vfio_dev, VFIO_GROUP_NOTIFY,
 					&vdev->group_notifier);
 
 undo_iommu:
-	vfio_unregister_notifier(mdev_dev(mdev), VFIO_IOMMU_NOTIFY,
+	vfio_unregister_notifier(vfio_dev, VFIO_IOMMU_NOTIFY,
 					&vdev->iommu_notifier);
 out:
 	return ret;
@@ -988,6 +989,7 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 	struct drm_i915_private *i915 = vgpu->gvt->gt->i915;
 	struct kvmgt_guest_info *info;
+	struct vfio_device *vfio_dev;
 	int ret;
 
 	if (!handle_valid(vgpu->handle))
@@ -998,12 +1000,13 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 
 	intel_gvt_ops->vgpu_release(vgpu);
 
-	ret = vfio_unregister_notifier(mdev_dev(vdev->mdev), VFIO_IOMMU_NOTIFY,
+	vfio_dev = mdev_legacy_get_vfio_device(vdev->mdev);
+	ret = vfio_unregister_notifier(vfio_dev, VFIO_IOMMU_NOTIFY,
 					&vdev->iommu_notifier);
 	drm_WARN(&i915->drm, ret,
 		 "vfio_unregister_notifier for iommu failed: %d\n", ret);
 
-	ret = vfio_unregister_notifier(mdev_dev(vdev->mdev), VFIO_GROUP_NOTIFY,
+	ret = vfio_unregister_notifier(vfio_dev, VFIO_GROUP_NOTIFY,
 					&vdev->group_notifier);
 	drm_WARN(&i915->drm, ret,
 		 "vfio_unregister_notifier for group failed: %d\n", ret);
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index d8589afac272f1..e1ce24d8fb2555 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -183,7 +183,7 @@ static int vfio_ccw_mdev_open_device(struct vfio_device *vdev)
 
 	private->nb.notifier_call = vfio_ccw_mdev_notifier;
 
-	ret = vfio_register_notifier(vdev->dev, VFIO_IOMMU_NOTIFY,
+	ret = vfio_register_notifier(vdev, VFIO_IOMMU_NOTIFY,
 				     &events, &private->nb);
 	if (ret)
 		return ret;
@@ -204,8 +204,7 @@ static int vfio_ccw_mdev_open_device(struct vfio_device *vdev)
 
 out_unregister:
 	vfio_ccw_unregister_dev_regions(private);
-	vfio_unregister_notifier(vdev->dev, VFIO_IOMMU_NOTIFY,
-				 &private->nb);
+	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY, &private->nb);
 	return ret;
 }
 
@@ -223,7 +222,7 @@ static void vfio_ccw_mdev_close_device(struct vfio_device *vdev)
 
 	cp_free(&private->cp);
 	vfio_ccw_unregister_dev_regions(private);
-	vfio_unregister_notifier(vdev->dev, VFIO_IOMMU_NOTIFY, &private->nb);
+	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY, &private->nb);
 }
 
 static ssize_t vfio_ccw_mdev_read_io_region(struct vfio_ccw_private *private,
diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index 6e08d04b605d6e..69768061cd7bd9 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -1406,21 +1406,21 @@ static int vfio_ap_mdev_open_device(struct vfio_device *vdev)
 	matrix_mdev->group_notifier.notifier_call = vfio_ap_mdev_group_notifier;
 	events = VFIO_GROUP_NOTIFY_SET_KVM;
 
-	ret = vfio_register_notifier(vdev->dev, VFIO_GROUP_NOTIFY,
-				     &events, &matrix_mdev->group_notifier);
+	ret = vfio_register_notifier(vdev, VFIO_GROUP_NOTIFY, &events,
+				     &matrix_mdev->group_notifier);
 	if (ret)
 		return ret;
 
 	matrix_mdev->iommu_notifier.notifier_call = vfio_ap_mdev_iommu_notifier;
 	events = VFIO_IOMMU_NOTIFY_DMA_UNMAP;
-	ret = vfio_register_notifier(vdev->dev, VFIO_IOMMU_NOTIFY,
-				     &events, &matrix_mdev->iommu_notifier);
+	ret = vfio_register_notifier(vdev, VFIO_IOMMU_NOTIFY, &events,
+				     &matrix_mdev->iommu_notifier);
 	if (ret)
 		goto out_unregister_group;
 	return 0;
 
 out_unregister_group:
-	vfio_unregister_notifier(vdev->dev, VFIO_GROUP_NOTIFY,
+	vfio_unregister_notifier(vdev, VFIO_GROUP_NOTIFY,
 				 &matrix_mdev->group_notifier);
 	return ret;
 }
@@ -1430,9 +1430,9 @@ static void vfio_ap_mdev_close_device(struct vfio_device *vdev)
 	struct ap_matrix_mdev *matrix_mdev =
 		container_of(vdev, struct ap_matrix_mdev, vdev);
 
-	vfio_unregister_notifier(vdev->dev, VFIO_IOMMU_NOTIFY,
+	vfio_unregister_notifier(vdev, VFIO_IOMMU_NOTIFY,
 				 &matrix_mdev->iommu_notifier);
-	vfio_unregister_notifier(vdev->dev, VFIO_GROUP_NOTIFY,
+	vfio_unregister_notifier(vdev, VFIO_GROUP_NOTIFY,
 				 &matrix_mdev->group_notifier);
 	vfio_ap_mdev_unset_kvm(matrix_mdev);
 }
diff --git a/drivers/vfio/mdev/vfio_mdev.c b/drivers/vfio/mdev/vfio_mdev.c
index a90e24b0c851d3..91605c1e8c8f94 100644
--- a/drivers/vfio/mdev/vfio_mdev.c
+++ b/drivers/vfio/mdev/vfio_mdev.c
@@ -17,6 +17,18 @@
 
 #include "mdev_private.h"
 
+/*
+ * Return the struct vfio_device for the mdev when using the legacy
+ * vfio_mdev_dev_ops path. No new callers to this function should be added.
+ */
+struct vfio_device *mdev_legacy_get_vfio_device(struct mdev_device *mdev)
+{
+	if (WARN_ON(mdev->dev.driver != &vfio_mdev_driver.driver))
+		return NULL;
+	return dev_get_drvdata(&mdev->dev);
+}
+EXPORT_SYMBOL_GPL(mdev_legacy_get_vfio_device);
+
 static int vfio_mdev_open_device(struct vfio_device *core_vdev)
 {
 	struct mdev_device *mdev = to_mdev_device(core_vdev->dev);
diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index a4555014bd1e72..8a5c46aa2bef61 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -2484,19 +2484,15 @@ static int vfio_unregister_group_notifier(struct vfio_group *group,
 	return ret;
 }
 
-int vfio_register_notifier(struct device *dev, enum vfio_notify_type type,
+int vfio_register_notifier(struct vfio_device *dev, enum vfio_notify_type type,
 			   unsigned long *events, struct notifier_block *nb)
 {
-	struct vfio_group *group;
+	struct vfio_group *group = dev->group;
 	int ret;
 
-	if (!dev || !nb || !events || (*events == 0))
+	if (!nb || !events || (*events == 0))
 		return -EINVAL;
 
-	group = vfio_group_get_from_dev(dev);
-	if (!group)
-		return -ENODEV;
-
 	switch (type) {
 	case VFIO_IOMMU_NOTIFY:
 		ret = vfio_register_iommu_notifier(group, events, nb);
@@ -2507,25 +2503,20 @@ int vfio_register_notifier(struct device *dev, enum vfio_notify_type type,
 	default:
 		ret = -EINVAL;
 	}
-
-	vfio_group_put(group);
 	return ret;
 }
 EXPORT_SYMBOL(vfio_register_notifier);
 
-int vfio_unregister_notifier(struct device *dev, enum vfio_notify_type type,
+int vfio_unregister_notifier(struct vfio_device *dev,
+			     enum vfio_notify_type type,
 			     struct notifier_block *nb)
 {
-	struct vfio_group *group;
+	struct vfio_group *group = dev->group;
 	int ret;
 
-	if (!dev || !nb)
+	if (!nb)
 		return -EINVAL;
 
-	group = vfio_group_get_from_dev(dev);
-	if (!group)
-		return -ENODEV;
-
 	switch (type) {
 	case VFIO_IOMMU_NOTIFY:
 		ret = vfio_unregister_iommu_notifier(group, nb);
@@ -2536,8 +2527,6 @@ int vfio_unregister_notifier(struct device *dev, enum vfio_notify_type type,
 	default:
 		ret = -EINVAL;
 	}
-
-	vfio_group_put(group);
 	return ret;
 }
 EXPORT_SYMBOL(vfio_unregister_notifier);
diff --git a/include/linux/mdev.h b/include/linux/mdev.h
index 15d03f6532d073..67d07220a28f29 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -29,6 +29,7 @@ static inline struct mdev_device *to_mdev_device(struct device *dev)
 unsigned int mdev_get_type_group_id(struct mdev_device *mdev);
 unsigned int mtype_get_type_group_id(struct mdev_type *mtype);
 struct device *mtype_get_parent_dev(struct mdev_type *mtype);
+struct vfio_device *mdev_legacy_get_vfio_device(struct mdev_device *mdev);
 
 /**
  * struct mdev_parent_ops - Structure to be registered for each parent device to
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 66dda06ec42d1b..748ec0e0293aea 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -178,11 +178,11 @@ enum vfio_notify_type {
 /* events for VFIO_GROUP_NOTIFY */
 #define VFIO_GROUP_NOTIFY_SET_KVM	BIT(0)
 
-extern int vfio_register_notifier(struct device *dev,
+extern int vfio_register_notifier(struct vfio_device *dev,
 				  enum vfio_notify_type type,
 				  unsigned long *required_events,
 				  struct notifier_block *nb);
-extern int vfio_unregister_notifier(struct device *dev,
+extern int vfio_unregister_notifier(struct vfio_device *dev,
 				    enum vfio_notify_type type,
 				    struct notifier_block *nb);
 
-- 
2.35.1

