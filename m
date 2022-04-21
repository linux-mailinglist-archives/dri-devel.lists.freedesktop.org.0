Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 934DF50A573
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 18:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89BF10E6EA;
	Thu, 21 Apr 2022 16:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE4510E44B;
 Thu, 21 Apr 2022 16:28:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eweK6weNzlvccVr0lp0+91D3St8usuQMC859ipcEyHnIeA94C0ehSeiOGxmXzU0knW4ep3jkGxDAqiw0WVu1vVMzn+nCJ7UdgNDvQS5wiV/qkv9GDf+qT0mt4z6M44SXgjTf3fYZs5Qpw5nuaO4zT+rMDIo4LgudVPP8txfizE9f7PzdKNQbpLfE3Cf/cqZSfdy7R4fTNqrnZ09+vfNwmqBByCYT+LMijnB0k1zuaTtPoKTcsrJkiPUnVklha1hrhJ9g3in1s0hw/dH1VgYPBVLfgahg/AM4X+PTEcZ3sDhtS7Ttn9eQzQKrNAWBTWuQ/1iMMO1Z2K9nFgD+18ApQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muTvDIUI7vmaD/VqxXrhirSp4G7r5c3WPxTwJnT+FME=;
 b=IcwR4LpRqVQbVu8RLra5NWgQmH7rE8buIDuMLMUiJABfyjc9/qjdBkxOnnRHbGzjMwduA1xchGTKvDhqWPBT9KRu1pEbx3SkemMQ/MxXLLpHxkzSv8cZ2LcTMka9z3FKrcZHjgO1jNAXuXp0yDrdjr/b2Lbirf2YPe8okO060DtUBfqiWdeuN1gtX7v8oUrk9X+eCiSJM3153Ny4JqhZF/I4tjnLi8bH+Vvrfk8uHObnIzheGkofjJ4Dw+D01WXjiVrPQNmRQ7uSk3vSKhlC0nQViYZQ7T2IJOMIVc6In6A47BEkoLz7PJlu20U0L8MvNCujMsJ+6XA5JeKSkqyzIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muTvDIUI7vmaD/VqxXrhirSp4G7r5c3WPxTwJnT+FME=;
 b=lz1B8kXIXmfoqqrPNYXAphuIWtdB4KICZEKSI4Uyx0sR5lIWxth90ghf12EdjElDA9EA5DFDujGk8wFFvR/RgQxF/0hRQE1NDsYlIGticmTl7xyhc92w/pf8dUe+kkjqYRk5fIVt8YOOT/RaHo3ZokpaHPxBdrstgtJpkJ4Wa7vX41jK2V1B+RBK9p24Ty5sT5eQD4UIXgWDuBbGEMUpMsATx0lm+tHI0MeZglBx5THHmfUJxrIMU3B+xM/K97d9jPii+f5UFsSqowX+VFaay/cb2lKhbAh8vOyiStZp9xxkozrJVeHk1sRiXNrs7UL8MWPwPQofVyozYKD6GZ+2KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB2907.namprd12.prod.outlook.com (2603:10b6:5:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 16:28:43 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 16:28:43 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@linux.ie>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
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
Subject: [PATCH v2 1/7] vfio: Make vfio_(un)register_notifier accept a
 vfio_device
Date: Thu, 21 Apr 2022 13:28:32 -0300
Message-Id: <1-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:208:91::40) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04d4db2d-2f3c-413d-2c76-08da23b3fec5
X-MS-TrafficTypeDiagnostic: DM6PR12MB2907:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB2907B125BB10757793EE2F0AC2F49@DM6PR12MB2907.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: scWM3VRHYFmF5ZSBV7samWU3asVaQIfQVpMIn1h1OlNakhdzP7BoJhb6NT27RqVeUNSFTASAyZ9Wsre33Mu9wXl8rmD/igPVUBm5ZQe3xZA6cw8nZzx7Mi3Wt/nIF4zHXEw64dFXCA5toc+gYaSr2REVPUvxiGo/AcLNjhPiZTQ6SWau9CYTMPpvjSKyrtBI7HXErIYblJ/tRQT449971VEm7xFeT1wgpaGi5RZUiikVu4REFfLBsgEs956SrX12Ur5UXEUR8PQLmF+l0Omj1HgPyN4YblH69GmLX+BXXXek/3kFoTzPf5OAazRetn73MHg6l/3xkdaSElYHEn6+24DIo5hy5hzSkaVcGhf5weTSt0yQpjSdRBHQsZhh5zaUyvkKUZccp9WLhEPTO6WrnjHgGDLNxivtas1hjlEyPsEAXH+hcXVjDNNdnZsTTdlyNy/6JhyBrzYdeiF/IIcCPhqP1hRycK7Umei2s8iD9jiJwkw0rEuHG8UyP048oJoIfXMl+UL58WDGQBE+3xEB5nXqtZ8YwKUw1Gd1zOFeKguQrgYlTb7hMJU0NdDU4wsgh6IUknFGwlXhmbS0Gy+0hzG+6NASCI77VobjcW4JCkeQ9NJWDI+pgMYjBQpDAv48MicCZq6Si13MFAlxNfssspN7OnG5wTGe1Ae7AHfhyj06JW6OyhR4MimXHQq8sLDBsAuxI2Vg61hGuj70HGh7jQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(6506007)(316002)(5660300002)(38100700002)(6512007)(54906003)(36756003)(66946007)(86362001)(186003)(921005)(110136005)(508600001)(8936002)(6666004)(2616005)(83380400001)(8676002)(7416002)(7406005)(66556008)(4326008)(26005)(2906002)(66476007)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cQIO+oTc8Qz/gQx3YjCSiM69r3/GNaFrVq4nP2s5GTMkLPO3SU1BSr5NZwRz?=
 =?us-ascii?Q?XnV264UvzV+5ZyY+pvxkFb/gsvIFZyPJQzBu7p2YfH4czqEwqCYeZZIsTPWS?=
 =?us-ascii?Q?SLZDFC88q8nDqFaFG101cH/mWKpjyg2g2Jyqtd84Pbv9Uf1b+ZC80CjJVtzL?=
 =?us-ascii?Q?75/0xWiVaUfpoHY+AmVYzvVRttTG+fcLb2+SEQMHrf58GMGfL+Rx8LP4TAyZ?=
 =?us-ascii?Q?GZP1pkbxoSjoPiXrXCzif4Ewuo3X8TKCgovBKR9iqYKIwF2+o/NvG9oselVg?=
 =?us-ascii?Q?+YKFzHigZYoRGLJB/GOY12HahVVXnGeG3R88lzazBjktmWMDMZMWNelXUBjN?=
 =?us-ascii?Q?U5uP7kaJqhsqmN2xeUCMTM2ecxJ8VDNnlLb07Xti+Vdi3WHtNjaYIVY9dY0d?=
 =?us-ascii?Q?PgLKR2aQ08/sjnkUnZ4OxlWqVncoYoocrUeZNOk5kDObaVSJRTM9P6F/m7/j?=
 =?us-ascii?Q?FXK5K9aa3Z0tOLhmclmQ/bD40ZIcaUvQMkD6mwDl+7OzlRe5Vwg0gYpw/vDZ?=
 =?us-ascii?Q?DGAWkgzSp0O4Z510m6trtPATQpBITKv1v+yVFTx7azYADpazqhL55RmIZbkP?=
 =?us-ascii?Q?GeTdz5HpSAkHrpsBYYkqKBJjUWTmer7ZL/2Hw7qiIyAZw5vCZ2/lmhf0uLio?=
 =?us-ascii?Q?JLNEYiACcD68fw7a7mCWdvToRiQjkkPtrRwcFBUi5PlEc4YFD6mnupRZrZYa?=
 =?us-ascii?Q?fBstcT/i863VsLXR69HA9IfkeTXyLJxqqjp3fyezfHs1jlcAwpthwUBfJzx8?=
 =?us-ascii?Q?DUZlQDEgddUAxAKwhKoJR8w/UMRGpko9IJshdD4f3WMR+HmYdlf7VfFnv1pr?=
 =?us-ascii?Q?C+Ni3E4HrsR96jLfvmcaEJhRcX1I7PSnf2LpWDWeArlu/XlOtveRKNsO0S7V?=
 =?us-ascii?Q?scsl1HAodWPIMNKMBjSJqnzygbaz4m/d+7vhLisyTiguoPxIqUju64Hw0yiu?=
 =?us-ascii?Q?BDqqNMDnf0DtmrKbs/P+tLQoUzjTJZNjFLc66YvyqxAI4pgKWmA861jSijr5?=
 =?us-ascii?Q?Qk259oj05nxbofgd4bcdC6cqs6/7c2+NMJgbhDPQT/ofEfu/kOuEpGroBUwj?=
 =?us-ascii?Q?6YX0RygmBm2evwSVQU2z3a6l76qPBgMJyoz2D9iZU87X+Kzhz8sCf6ZrIu/n?=
 =?us-ascii?Q?fA0GMfYHc0WXwwbGFoXl8A/lwmcvLXipEK+bAxLWvdfPGjzZ8hPIPC2hmFF9?=
 =?us-ascii?Q?JSebB8ydn4Oi62EL5PLJBQq+xX6kCpWH9CU+LfJfOT4ADEDQp5v9ExOq0VUW?=
 =?us-ascii?Q?Z9fRS53l4TCptRhfFwDpvYuGhdDFOwLC500i+KMmzG/De2bMnRwhA8XSXOnI?=
 =?us-ascii?Q?OuwctChHr4c0dWdyuEu58Y7PWgths6cu23O1dcuCZ36iDwujPtpjl8UTC/pq?=
 =?us-ascii?Q?cXCjP2wLp6XvciTZWL5nLyUTkzMNbW8wt3jGDw5ebJdv0t+v5eV4Wx06+xMh?=
 =?us-ascii?Q?gvEZONLzrCKkUDRBhAxZLdJEnZpKS3lPUhswIpHKxxL+gv84trKoHz+YbI6I?=
 =?us-ascii?Q?KjpZNbykkByohuNQDtszLJE0Da+3zABCPP4U7mDLjDea3i16c4xyWg13+Ljm?=
 =?us-ascii?Q?i24vUWnBh69tsyFkZ1+gzHcZi1E+1Xwczetl69MZLMnNHwFNUivEuabRJ8J0?=
 =?us-ascii?Q?lwexMYUtpbl4G7HvIZYToQiazg7YdoghYrCFdlgzac6tuW6JF89prp8js2+b?=
 =?us-ascii?Q?HD/nKkqTJ84Nk7PepKtFTdTntBSX0t4fFYWCEBUM5/nGEU+mGSDJ2fYYVKjS?=
 =?us-ascii?Q?6Xf1yIt1YA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d4db2d-2f3c-413d-2c76-08da23b3fec5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 16:28:40.8195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5XHUXbI+8Smk7GEuVrbhY1X50bvl3eLR9g2MbVn8MJoet3dw67e4oj+UNTVJMpp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2907
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 Eric Farman <farman@linux.ibm.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All callers have a struct vfio_device trivially available, pass it in
directly and avoid calling the expensive vfio_group_get_from_dev().

To support the unconverted kvmgt mdev driver add
mdev_legacy_get_vfio_device() which will return the vfio_device pointer
vfio_mdev.c puts in the drv_data.

Acked-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Jason J. Herne <jjherne@linux.ibm.com>
Reviewed-by: Tony Krowiak <akrowiak@linux.ibm.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c  | 24 ++++++++++++------------
 drivers/s390/cio/vfio_ccw_ops.c   |  7 +++----
 drivers/s390/crypto/vfio_ap_ops.c | 14 +++++++-------
 drivers/vfio/vfio.c               | 25 +++++++------------------
 include/linux/vfio.h              |  4 ++--
 5 files changed, 31 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 0787ba5c301f5e..1cec4f1fdfaced 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -810,8 +810,8 @@ static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 	vgpu->group_notifier.notifier_call = intel_vgpu_group_notifier;
 
 	events = VFIO_IOMMU_NOTIFY_DMA_UNMAP;
-	ret = vfio_register_notifier(vfio_dev->dev, VFIO_IOMMU_NOTIFY, &events,
-				&vgpu->iommu_notifier);
+	ret = vfio_register_notifier(vfio_dev, VFIO_IOMMU_NOTIFY, &events,
+				     &vgpu->iommu_notifier);
 	if (ret != 0) {
 		gvt_vgpu_err("vfio_register_notifier for iommu failed: %d\n",
 			ret);
@@ -819,8 +819,8 @@ static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 	}
 
 	events = VFIO_GROUP_NOTIFY_SET_KVM;
-	ret = vfio_register_notifier(vfio_dev->dev, VFIO_GROUP_NOTIFY, &events,
-				&vgpu->group_notifier);
+	ret = vfio_register_notifier(vfio_dev, VFIO_GROUP_NOTIFY, &events,
+				     &vgpu->group_notifier);
 	if (ret != 0) {
 		gvt_vgpu_err("vfio_register_notifier for group failed: %d\n",
 			ret);
@@ -873,12 +873,12 @@ static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 	vgpu->vfio_group = NULL;
 
 undo_register:
-	vfio_unregister_notifier(vfio_dev->dev, VFIO_GROUP_NOTIFY,
-					&vgpu->group_notifier);
+	vfio_unregister_notifier(vfio_dev, VFIO_GROUP_NOTIFY,
+				 &vgpu->group_notifier);
 
 undo_iommu:
-	vfio_unregister_notifier(vfio_dev->dev, VFIO_IOMMU_NOTIFY,
-					&vgpu->iommu_notifier);
+	vfio_unregister_notifier(vfio_dev, VFIO_IOMMU_NOTIFY,
+				 &vgpu->iommu_notifier);
 out:
 	return ret;
 }
@@ -907,13 +907,13 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 
 	intel_gvt_release_vgpu(vgpu);
 
-	ret = vfio_unregister_notifier(vgpu->vfio_device.dev, VFIO_IOMMU_NOTIFY,
-					&vgpu->iommu_notifier);
+	ret = vfio_unregister_notifier(&vgpu->vfio_device, VFIO_IOMMU_NOTIFY,
+				       &vgpu->iommu_notifier);
 	drm_WARN(&i915->drm, ret,
 		 "vfio_unregister_notifier for iommu failed: %d\n", ret);
 
-	ret = vfio_unregister_notifier(vgpu->vfio_device.dev, VFIO_GROUP_NOTIFY,
-					&vgpu->group_notifier);
+	ret = vfio_unregister_notifier(&vgpu->vfio_device, VFIO_GROUP_NOTIFY,
+				       &vgpu->group_notifier);
 	drm_WARN(&i915->drm, ret,
 		 "vfio_unregister_notifier for group failed: %d\n", ret);
 
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index c4d60cdbf247bf..b49e2e9db2dc6f 100644
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
index ee0a3bf8f476ca..bfa7ee6ef532d9 100644
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
2.36.0

