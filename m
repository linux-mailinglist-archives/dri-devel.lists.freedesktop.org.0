Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B81A51CD79
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 02:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2D510FE0E;
	Fri,  6 May 2022 00:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062.outbound.protection.outlook.com [40.107.236.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795D510FDEB;
 Fri,  6 May 2022 00:08:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F83c/8/j1qe6fJlz+Pu0f9r/T1EOYel/3ee6zwTUeTWt0Zp+tjIAOpf6IVd7BbdGDA2t7wrg09ZyoPB6UirxoSE1+XQmpu9rTixOx34ZDTmN+Wz1L8viS2ebHhK2cUsa2yE55Rgsye6uhFGSUFenjUFv25Bv1QNKnhucA0WVlJcvvO8N2QcIu27y6vPFLxW2ikxCBp+Xd0QwjL9zyzpQpotGatYsIaDxZGoLM47pLAZORM+JKCOIVFSR7Gu/5A1Q68hsuc9soIDHrpQKca1pz24JC1LHtpksyhhxec5py69/XXcWrsqrgMMrQnwit5EXdHVBgcC3kp6/h6CljokALw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rX3j7rOWSWO7c4hbUYMNBvD/GJno+vvgfbHyrqgd16w=;
 b=U7IZPT6N5intDWNYuhbEA10x+uJ7UdT7TDJEsmZAQGSdUW2ptcoAz0/8ofj6RUFhhj4SDffnMlDnuqkw6ld5MUuiUH7rN8tz5fDlsFdJIvZcOIChAmzQBfRFiT7TKZ5fnU33vRCxm/BaJYgGhMdVF2TSIPET1XyhGnfbHoDfbxqdnV3QeQV2SET5riAvt0NS73zYLtl+N3CDbapTWjOWPghzZLyfQnchI45d/r0ka4H4cmXZ8kpKtB9gHnh3rTiG5fQufgTbkNECYJ5ujQDBW8mhfSkUXejNUAiQMIyUYtQ2DNK8cy70LFzeZRkABfGq43IbMtJ9h0puW1RsZ5bbFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rX3j7rOWSWO7c4hbUYMNBvD/GJno+vvgfbHyrqgd16w=;
 b=Nib7vTME4/3+G4RPZERFEOjwgLLpDpmbUIYUaiacJbcu4ft3L3dU3G26tO7b9GFuWDMG19G/Vsqs7t+bkpHxm/vAaLyFB/i7Jfxx1MeW8NoSS/iIUIzLJgkplrCfh1JeRzLugHKc3sQNBXynUSpYZnhPPIBsvQYOU4wyFhcXGuNt3B1j1H+KfJu/yKt0etSgC7CSkXWfPL5ax0u8JKk1tapq2EubQeZOLE4vMr/Kpm4D8Qe7f8DdjXhWd84OObLVXp4XgeNJLnIDqUZWpidRI5znINcow/si7AkAOF7iiMIhCFvfrI377FY+tKsk66kXrDQbnQjSVu5dy2ov4Bs+4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BYAPR12MB2934.namprd12.prod.outlook.com (2603:10b6:a03:13b::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Fri, 6 May
 2022 00:08:49 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 00:08:49 +0000
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
Subject: [PATCH v4 5/7] drm/i915/gvt: Change from vfio_group_(un)pin_pages to
 vfio_(un)pin_pages
Date: Thu,  5 May 2022 21:08:43 -0300
Message-Id: <5-v4-8045e76bf00b+13d-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <0-v4-8045e76bf00b+13d-vfio_mdev_no_group_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:208:120::35) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01f245fb-4775-4e7b-c9ef-08da2ef4970a
X-MS-TrafficTypeDiagnostic: BYAPR12MB2934:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB29342FB9BEC051249457592CC2C59@BYAPR12MB2934.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Waapk8o2Jy5/7jqWCMX41amOUJHsPXJk/pCkvUhHyMMukiexL9kFUnR+6zrVO4YF8ewA07u6zoJcDL47VI54DiA8EM5/EgdSdtDV014+Ro5EiP8h7bcTwuoFqYXU8MgUpoMG+Tg1AYVfYa54zNgIosm+NsMMjy1bWemSKT7/iF1+dhf8RxVY5IaZL9EZlSF5o6W3Rij5HVoCi9XOZQxkhfENV/NOo/Pe1ASM6nx2zCEqNwm0slcxe+IIkCyEdfhFPONUIeDuM7fK9RdOE3faFR3oRo4Ry3B8u2k0o1qBMu2MPFUMMx7TMQ2tGcNncPwVGKUp6JdrBX0W02fnhFdPPU/fzFhf9vH2wlz9AHAsLVbf9A88IVPtygHhua4HUKoumtIN7ldienz4gPht7SbZmf0Ff4ZU2rmSfyx1L16sG6qHgBlWICBC5yGr4Vu4qDGG5MtpaMb5GfKj9oNcJntD6fJ9687r/fwwaI4Pt/BdpdVcB/SizZupMTOlj0AqOWnTsZwtWgfTBJxQ/RdFY1QduF6DELpJBAlwQkOUxGKOS5tLWlmf323mu0pxgNYI8kVj1L0NIqpF1ZsRTTEaWkYhiumWjTd05Bh/7cSmSJ3KNiW8oABP5P9bp9Xb700R7LYcB8saKkYrCKxkXVJDNZB/iJYUREMN6nwDIHX8fiSBxN8zphLGFha1N9RmkXl0fAc2c9n4yOy3IZUUbk84HMPAsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(2906002)(66946007)(66556008)(54906003)(8676002)(86362001)(110136005)(4326008)(6486002)(38100700002)(508600001)(316002)(66476007)(6666004)(6512007)(6506007)(186003)(2616005)(921005)(26005)(7416002)(8936002)(83380400001)(7406005)(36756003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?djQjSXX8PUiIltogHVtQFwR5No0DMZH7ORS47rwoYB0tHAke83wNRA35fGHe?=
 =?us-ascii?Q?Vel5rIznDu+PPx+LBWWaaas/UcnsdAtDmgSfvRfD8nGKlti/kPxCBTPJpBkm?=
 =?us-ascii?Q?Bo11MECyN85vjwoeitXXbj5PDxlxQkGOEokyOaHffzJS3A/xA3bM7g0z6BNH?=
 =?us-ascii?Q?/FOgpYK60hC0Ncssjx2f8XRDX62cm+PFQijpv72MTWRQ0iXioHi/sN0QsDHg?=
 =?us-ascii?Q?eKGHGSX1hGHEEHxdJoxNnS03QyZQ1MqVjaG//2eM+3e+yXUcn4ixh2/e78qF?=
 =?us-ascii?Q?O3pjk8K9sy5NZ0zUnIjFR5Zy5aWJYecpJ6HWHCJGwK4dpukVpD309sRSXS80?=
 =?us-ascii?Q?zNRWnlY2IjFEySyJKrLS28+aK6VpyA4JI3LVqsDWifEUB+zZL6louKfgExm+?=
 =?us-ascii?Q?JbjXRIDb8SWyuD/7OFJ8UbRYWVUtwT7IYqsHru5p/pdc6OmN6fSDT+p0+YgG?=
 =?us-ascii?Q?z0kReKpsAjsSwwlZnkrZ9i9fGFi468pHK8+mIItIbfLFBwYMFwJElf1VwUDl?=
 =?us-ascii?Q?60dqq7eHuTFbYiy90f2Rof/k4aawi2SrOVEs03Sfl0Og2sgNUIBZVu9MQsz/?=
 =?us-ascii?Q?Ygiaae8stYax5yVdKAnAIOwQ468lFNfBN4xKXOWLLQnpbHhzTnZ38GI34jMy?=
 =?us-ascii?Q?4UgxF+zuIhS1rkIa3f9S29vr4rYNCHFHY4VS7XmoxrwTJnXKi7TlhTJHhhss?=
 =?us-ascii?Q?ZZrNdVTCF+COPS4W/mAxQDKqdgjYyEmq9EasroGfbEumzdllq7kXe0kKEznH?=
 =?us-ascii?Q?DPTDHfdFWX7Xkt+Tj1WCPjleQ+nizhDCKAmQjbXbsOVwJl5JodwOgFhxF7+I?=
 =?us-ascii?Q?btw1N5wHQEzlKhVOKG8+cdHkvFL0oYiflfnsanI8z6QeWDkGFWyZvLrCmZMi?=
 =?us-ascii?Q?z4GByezm50l7k5AADImCge57LA37mIJpEkBXDHvfvPxjBciLhwsnxCw/I8Fp?=
 =?us-ascii?Q?UuCFUxDfQ45Tt3K3CbhLs0hZ3cTCMb9NuwEzw0I2a/tAOUeAPu69vHJE8I2Q?=
 =?us-ascii?Q?xdRBeW0Pjt1as8rz3Iks8T3SSQ8+t+mlsmCsww9o6XtAVqvvzwJrzSJ9Mphd?=
 =?us-ascii?Q?D5bJlPSPyUtNvS7lo2mJKEfAMVlj5iki0Dze1kKSbgFTUmHzWvWphRFzYL7h?=
 =?us-ascii?Q?Ku1uvyG84z7kYUodeBhH6cgsSh7ii6depvpJVrNbwDKB4+CvXfSU861p9NnY?=
 =?us-ascii?Q?H+/6h+Hu5855wIqLXJuDz5OqrycHTgSO2uNzGgvhKUIzj/SJyC/voa3fH4E3?=
 =?us-ascii?Q?t/Hpvvy4USh/RD1GCdw12xr+sw9ahH8BiZngPUuHANjs4uCDadsUdsJbGYvY?=
 =?us-ascii?Q?+VawsuNfep+K1y/rImD03SMkuJM4+rQEDLqfo2hNB9HNG4J39+zEHDfh1oUK?=
 =?us-ascii?Q?uBHqrPzwsa7sNvr2uUNpE5z8qzY260nRgzN6rWQMWZihQ23dUjnDLfho6iho?=
 =?us-ascii?Q?T4DUSMtedODvugIoG9MTbgFaLQHvTVZaK4L+4/9fN9YObaeFB1WjWWvdhsrf?=
 =?us-ascii?Q?+dkNCCgDcYsr4tORW2ESW9XvJQ6XNb5Ac6ESYMbFt7TuYE1T/qmSDnkGK3ON?=
 =?us-ascii?Q?Ls1kGdTk1mqH4aQuVYzeHLa4tc8BvmkIaZrAZoFitw9Z9CazdKCdmfUNGaea?=
 =?us-ascii?Q?modUK9SN9yDSrmtirVc9nrO3jbld+xS3VBCqyJtXHg6+ZGfQTqgntSjuY9Qq?=
 =?us-ascii?Q?t1dMHWwPv2mUYJHBRXgzRrFwEooohASB+tUAdtwgV2bxuo47ThtUtYEnlYoj?=
 =?us-ascii?Q?3vb4/yZBsw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f245fb-4775-4e7b-c9ef-08da2ef4970a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 00:08:46.9966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/OhNmtSWVMZoA/ldNYZWB/F8An/LW4+IvlZiIxStpGJ64IY7H9UozXFG/HMfVRp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2934
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Kevin Tian <kevin.tian@intel.com>,
 Eric Farman <farman@linux.ibm.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the existing vfio_device versions of vfio_(un)pin_pages(). There is no
reason to use a group interface here, kvmgt has easy access to a
vfio_device.

Delete kvmgt_vdev::vfio_group since these calls were the last users.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/gvt.h   |  1 -
 drivers/gpu/drm/i915/gvt/kvmgt.c | 27 ++++++---------------------
 2 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 5a28ee965b7f3e..2af4c83e733c6c 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -231,7 +231,6 @@ struct intel_vgpu {
 	struct kvm *kvm;
 	struct work_struct release_work;
 	atomic_t released;
-	struct vfio_group *vfio_group;
 
 	struct kvm_page_track_notifier_node track_node;
 #define NR_BKT (1 << 18)
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 1cec4f1fdfaced..7655ffa97d5116 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -243,7 +243,7 @@ static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 	for (npage = 0; npage < total_pages; npage++) {
 		unsigned long cur_gfn = gfn + npage;
 
-		ret = vfio_group_unpin_pages(vgpu->vfio_group, &cur_gfn, 1);
+		ret = vfio_unpin_pages(&vgpu->vfio_device, &cur_gfn, 1);
 		drm_WARN_ON(&i915->drm, ret != 1);
 	}
 }
@@ -266,8 +266,8 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long cur_gfn = gfn + npage;
 		unsigned long pfn;
 
-		ret = vfio_group_pin_pages(vgpu->vfio_group, &cur_gfn, 1,
-					   IOMMU_READ | IOMMU_WRITE, &pfn);
+		ret = vfio_pin_pages(&vgpu->vfio_device, &cur_gfn, 1,
+				     IOMMU_READ | IOMMU_WRITE, &pfn);
 		if (ret != 1) {
 			gvt_vgpu_err("vfio_pin_pages failed for gfn 0x%lx, ret %d\n",
 				     cur_gfn, ret);
@@ -804,7 +804,6 @@ static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 	struct intel_vgpu *vgpu = vfio_dev_to_vgpu(vfio_dev);
 	unsigned long events;
 	int ret;
-	struct vfio_group *vfio_group;
 
 	vgpu->iommu_notifier.notifier_call = intel_vgpu_iommu_notifier;
 	vgpu->group_notifier.notifier_call = intel_vgpu_group_notifier;
@@ -827,28 +826,19 @@ static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 		goto undo_iommu;
 	}
 
-	vfio_group =
-		vfio_group_get_external_user_from_dev(vgpu->vfio_device.dev);
-	if (IS_ERR_OR_NULL(vfio_group)) {
-		ret = !vfio_group ? -EFAULT : PTR_ERR(vfio_group);
-		gvt_vgpu_err("vfio_group_get_external_user_from_dev failed\n");
-		goto undo_register;
-	}
-	vgpu->vfio_group = vfio_group;
-
 	ret = -EEXIST;
 	if (vgpu->attached)
-		goto undo_group;
+		goto undo_register;
 
 	ret = -ESRCH;
 	if (!vgpu->kvm || vgpu->kvm->mm != current->mm) {
 		gvt_vgpu_err("KVM is required to use Intel vGPU\n");
-		goto undo_group;
+		goto undo_register;
 	}
 
 	ret = -EEXIST;
 	if (__kvmgt_vgpu_exist(vgpu))
-		goto undo_group;
+		goto undo_register;
 
 	vgpu->attached = true;
 	kvm_get_kvm(vgpu->kvm);
@@ -868,10 +858,6 @@ static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 	atomic_set(&vgpu->released, 0);
 	return 0;
 
-undo_group:
-	vfio_group_put_external_user(vgpu->vfio_group);
-	vgpu->vfio_group = NULL;
-
 undo_register:
 	vfio_unregister_notifier(vfio_dev, VFIO_GROUP_NOTIFY,
 				 &vgpu->group_notifier);
@@ -925,7 +911,6 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 	gvt_cache_destroy(vgpu);
 
 	intel_vgpu_release_msi_eventfd_ctx(vgpu);
-	vfio_group_put_external_user(vgpu->vfio_group);
 
 	vgpu->kvm = NULL;
 	vgpu->attached = false;
-- 
2.36.0

