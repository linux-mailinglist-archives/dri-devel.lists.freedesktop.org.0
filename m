Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ED23C951F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 02:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B432F6E550;
	Thu, 15 Jul 2021 00:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF81B6E516;
 Thu, 15 Jul 2021 00:20:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OM0ZcKR5yN5O2is0Nl+N1SO9aj25RxokStFiSlQZXGSRg8Ba11JbwXKt9Af96s+RLstzuftWbl9SGzVOCIh4TMjKDOHj7qxjU6t7oanzatm57+l7YMW3p4DaUiZQBKMNFhUG8KrEuMtNvVMjc0HPGIig+scKMWr+x0QiFCM5/zmFDjOMz6OvWBs8lvBw1w4yPBUK9cFJp5ALBcttGlrW+9FRlOKj6+WYkQ/975/2quq5doFhcRnsE7q0ib8hEWubswCVJog4QWov/iM3AnK2ldrwpqOOC4b/bw4l+LPBhSvpPeEF0yyjybNSVM6VV48l7jPcaVEVDnfKYQKSEJ8iew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TM2PVJURkDWq6j7394ivSAZ1BdF4hej2yhw25SJ2dmA=;
 b=QK6urmmqJ9/evaPW1iIYw+R//n469pnUgwZ6ZKyX0cYc6/P0XdlKGvJQ8YlilGHRl16/gNtLP6VD0OdnFjMx1YRb6g70DICAJg7NSZvIX7GaLG4jYxyLLS12WldKL/V2qPyWO/VakwvYsgJ7JfbF10mOxPkabIgtnMFowh22MhbyQbW62o3wOxEV1owZzQn7O+sTT4EcyabT2FE1HP6tkuge70zdhhnoSJ3NXyNVoaEjo2eC69pb6+jdpjPQyOfTXWaKylHXSbEvPl+myOa7Qtf7E3Rdqg8t71DPn0jnCJDiD11e3RBZI6v3//4HLvFBXDDfSUBqS2AhLg7g2h3UNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TM2PVJURkDWq6j7394ivSAZ1BdF4hej2yhw25SJ2dmA=;
 b=iw1r0Z9RmEnA3nARa0M0cgtpl0g59bQf5wzBAJ+++n2PgsW9ctbXBE0cInHtJPaoo5+2xd1Pye9aepM/uIu/4T37D0OFMDQp2ua4EnSsIWmDVM65AgIBCdeG8b3mt3f6FTADEFvSvt+SBJxBHE1qhvqz6O7eNv37DRkvRUdJyoceKTshu4QB9qlguHkrKhVS+txafWg+0Nzm1dBI06ZT64Zjvg4+HEjFKiawYdq7Nt1ODsKUJCe32g3IqwBXa+mdkOfLYDytooxrQf1Tw9FfReu8Wcne6Mf4cMMo2pDaYhb2OuLuqGyl9SP5tq2coOmmS6dLPqhpBCUelWKaHopyxA==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5555.namprd12.prod.outlook.com (2603:10b6:208:1c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Thu, 15 Jul
 2021 00:20:48 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 00:20:47 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, Diana Craciun <diana.craciun@oss.nxp.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>,
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
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 05/13] vfio/fsl: Move to the device set infrastructure
Date: Wed, 14 Jul 2021 21:20:34 -0300
Message-Id: <5-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR04CA0117.namprd04.prod.outlook.com
 (2603:10b6:610:75::32) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 CH0PR04CA0117.namprd04.prod.outlook.com (2603:10b6:610:75::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 00:20:44 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m3p7K-002UxO-IT; Wed, 14 Jul 2021 21:20:42 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6be95ccb-b601-47e2-0cf4-08d9472662bd
X-MS-TrafficTypeDiagnostic: BL0PR12MB5555:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB5555542AB060A865E67172EEC2129@BL0PR12MB5555.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C6IAKcv8yyQQ1jk+WEgHbh6+9fqE7onQXWfj7W8uMVNIK6YITeDclLrSaUsksyW3zJ64PDVtqdCp/Og3nDLy3PyFmkV/XOCeebV3pwsH/IOTV/7j4N+u9e2O9DU+Y756yxSSR4muL+hjT+/vH35WLhtrGGbAOHIUFNa7CJn6EmGw2HRvgoDscf9aOvjLS/gtRZjRyeihUxdDHX4aDalo6HiTAihJR0E01xCDFXKcVB29fodr8XlwFPrEm6mz8xkkkGKa8lNG5Pf8pUKNwCp6pHKt5eibJ8q/SlnK7O+dqEN1PWE1Tbc1x0CrAJn3oi5KXAEyDJLOl3mkt5EeLsTjzPaKj7z9X2s5WsJ0ogz1jlrg8VcEADMAk1W0WKYnWjwhkyZe+A8ryjSKhkvr7LaoddW8nGiaT50IoMqWfAyUDb6dHqhifXaf5LflePYBAWDGVUgw7moFPe/vKx3jmQMING8YVMQAUjuvgHjsph1U5b5bC+zD7VaKpB39LK1l9pIL5Gfth7iwnXccUt7n01FCaRYKX+kjfXYwLOr5J2tOa3EEwd8YLhlBxb5yZFN2xNozHZxVKZqgFaLx0UEg2d/8e5SukuZg0S98vxSDLhOa3kSOxO7Ge80KqW3Dq7QneHwgijNo7LYBjMLkW7VwLXGiHupvtNvy9XNRel0XuI8Km/xafjr75u7n6GmT73ndmTMGmAm9stu/xMse3n/qxPUb4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(83380400001)(2616005)(426003)(316002)(107886003)(2906002)(478600001)(4326008)(7416002)(7406005)(38100700002)(36756003)(5660300002)(66556008)(66476007)(66946007)(921005)(9746002)(26005)(8936002)(110136005)(54906003)(8676002)(9786002)(86362001)(6666004)(186003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qQBq3nmJFheJP+uqj5CphcsdsXIcbWAbYDxcDsfTXgvyktJWVmIC15MPl12d?=
 =?us-ascii?Q?H/uBGXHuSsWNEd3jf0cuU+QfeBskrRyc3FbXEJ1rmmmbJ61uQklB6q8Ycxe7?=
 =?us-ascii?Q?MqtHx3G990llyZ0GA6vAKvhQfX9VOwZtpMQQyqXhc4WfM6O4laWWzbg5prr7?=
 =?us-ascii?Q?64tVTgIIgeM7NWIJ70YIPoixU0BhdmcyXprGHqtSKBtORYfTU/+VrEfamQ7s?=
 =?us-ascii?Q?LsWRgvtOv4fOpcO8qqb9pD8LBTXSop3/tiyxzaVY/LdIK/rgeVQLnmOusSro?=
 =?us-ascii?Q?A/QmB9Lb2KVjRTkSkvcfS3FMqFlWRvyb3Be/jz01dIeS4ArzMTQ62UXY11JG?=
 =?us-ascii?Q?xLWzzX0ka+AjRQ8lTcvf8GK057FOLVfPKmDvvr2tiNp3XwzpxSij1k1KiT2p?=
 =?us-ascii?Q?b9j3EC088+ULmyesvnSbyFvctgTwbE1uSvOxqNS45dwz2QRnTcbpwWatg8A3?=
 =?us-ascii?Q?FRqy5YhetegOsTnPKeaiYFEkD9KQddAHyqlsn0AlGBHVQBph7FNpn5/xL2qp?=
 =?us-ascii?Q?1UmF46sDqUy3ofa8KYLiVsA73DrntplpFWkZ68Mtdq4s1dO3ltz/kZ2du1XQ?=
 =?us-ascii?Q?eSe/F4RFkkdxhb6iUjLi9ivC7V7vxtmpPCWhbQBb1r7ObuzbxMapHc3oPCYJ?=
 =?us-ascii?Q?l5DUvE7WeVYJDWoPSeFnABwMWHR5v6lD+fR8cZdYvm2rafMbu01u0wxSFKsU?=
 =?us-ascii?Q?xHhuJ3qbz9KTKLWCyH7/7odazL/mgUCCZ1C0qpdUwXxIu9PjXsLKkpCrmlRI?=
 =?us-ascii?Q?lsFX3TnI8aJ0jE76wKLRJzhq2eMr06P8AJ8Loy2nlIA949r0hlwEjS37g4dA?=
 =?us-ascii?Q?GzeHOie12bxMYhd44r0oqM+S1VaXdijtfvKO30Pfb7wOErQP78+epG1IzrFt?=
 =?us-ascii?Q?XAQlfyVKK/qfjB4rlgSWpHwaZhKkBmO22Pl0aZLc/7wAIhiX9rvOHprHqvtQ?=
 =?us-ascii?Q?G2JfdMm9hKv6Z8M9V3l3uFXNudXFZwQVBhHjitlQODQ4VOOl28fP63lvlB0h?=
 =?us-ascii?Q?XYW31vUV+Y0ahu1xwDUfyRWBOQTPan9H7L2B9cbLcKOztF0bRv60yJn8T9O/?=
 =?us-ascii?Q?sMdJOJxYRFbn3E2T6kYyscchC++LJ8r/knW8x0hZOUE4qs4MeBGJN4S/GdoA?=
 =?us-ascii?Q?lP26MPYLGfDklB/Sd7ZVBfYbszvsiijX2BBRHrxT1UGILbUqkivFODyo0bth?=
 =?us-ascii?Q?lnR0hAHmijmo53DJI6rUmiXPjfFYTQU5wr0MVeUwKK1dvsRbD7S7XvDt1nG/?=
 =?us-ascii?Q?jed/ctu3EZ4ob4tdbqT3SAyNl/gYUZGccNMY8Q1z1zjoOkDqvy0qrpN4jL6s?=
 =?us-ascii?Q?IXxM5i4NwXnYlvSAbAuuDk86?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be95ccb-b601-47e2-0cf4-08d9472662bd
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 00:20:44.3439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uBBOvKMy5INt8TollOU5tfkC+j0z8Kq3OEvAL+wcA8bWprItofj8N0J3WqNN1ff+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5555
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Leon Romanovsky <leonro@nvidia.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

FSL uses the internal reflck to implement the open_device() functionality,
conversion to the core code is straightforward.

The decision on which set to be part of is trivially based on the
is_fsl_mc_bus_dprc() and we use a 'struct device *' pointer as the set_id.

It isn't entirely clear what the device set lock is actually protecting,
but I think it is related to the interrupt setup.

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/fsl-mc/vfio_fsl_mc.c         | 152 ++++------------------
 drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c    |   6 +-
 drivers/vfio/fsl-mc/vfio_fsl_mc_private.h |   7 -
 3 files changed, 26 insertions(+), 139 deletions(-)

diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
index 3d2be06e1bc146..49b93de05d5d62 100644
--- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
+++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
@@ -19,81 +19,10 @@
 
 static struct fsl_mc_driver vfio_fsl_mc_driver;
 
-static DEFINE_MUTEX(reflck_lock);
-
-static void vfio_fsl_mc_reflck_get(struct vfio_fsl_mc_reflck *reflck)
-{
-	kref_get(&reflck->kref);
-}
-
-static void vfio_fsl_mc_reflck_release(struct kref *kref)
-{
-	struct vfio_fsl_mc_reflck *reflck = container_of(kref,
-						      struct vfio_fsl_mc_reflck,
-						      kref);
-
-	mutex_destroy(&reflck->lock);
-	kfree(reflck);
-	mutex_unlock(&reflck_lock);
-}
-
-static void vfio_fsl_mc_reflck_put(struct vfio_fsl_mc_reflck *reflck)
-{
-	kref_put_mutex(&reflck->kref, vfio_fsl_mc_reflck_release, &reflck_lock);
-}
-
-static struct vfio_fsl_mc_reflck *vfio_fsl_mc_reflck_alloc(void)
-{
-	struct vfio_fsl_mc_reflck *reflck;
-
-	reflck = kzalloc(sizeof(*reflck), GFP_KERNEL);
-	if (!reflck)
-		return ERR_PTR(-ENOMEM);
-
-	kref_init(&reflck->kref);
-	mutex_init(&reflck->lock);
-
-	return reflck;
-}
-
-static int vfio_fsl_mc_reflck_attach(struct vfio_fsl_mc_device *vdev)
-{
-	int ret = 0;
-
-	mutex_lock(&reflck_lock);
-	if (is_fsl_mc_bus_dprc(vdev->mc_dev)) {
-		vdev->reflck = vfio_fsl_mc_reflck_alloc();
-		ret = PTR_ERR_OR_ZERO(vdev->reflck);
-	} else {
-		struct device *mc_cont_dev = vdev->mc_dev->dev.parent;
-		struct vfio_device *device;
-		struct vfio_fsl_mc_device *cont_vdev;
-
-		device = vfio_device_get_from_dev(mc_cont_dev);
-		if (!device) {
-			ret = -ENODEV;
-			goto unlock;
-		}
-
-		cont_vdev =
-			container_of(device, struct vfio_fsl_mc_device, vdev);
-		if (!cont_vdev || !cont_vdev->reflck) {
-			vfio_device_put(device);
-			ret = -ENODEV;
-			goto unlock;
-		}
-		vfio_fsl_mc_reflck_get(cont_vdev->reflck);
-		vdev->reflck = cont_vdev->reflck;
-		vfio_device_put(device);
-	}
-
-unlock:
-	mutex_unlock(&reflck_lock);
-	return ret;
-}
-
-static int vfio_fsl_mc_regions_init(struct vfio_fsl_mc_device *vdev)
+static int vfio_fsl_mc_open_device(struct vfio_device *core_vdev)
 {
+	struct vfio_fsl_mc_device *vdev =
+		container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
 	struct fsl_mc_device *mc_dev = vdev->mc_dev;
 	int count = mc_dev->obj_desc.region_count;
 	int i;
@@ -136,58 +65,30 @@ static void vfio_fsl_mc_regions_cleanup(struct vfio_fsl_mc_device *vdev)
 	kfree(vdev->regions);
 }
 
-static int vfio_fsl_mc_open(struct vfio_device *core_vdev)
-{
-	struct vfio_fsl_mc_device *vdev =
-		container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
-	int ret = 0;
-
-	mutex_lock(&vdev->reflck->lock);
-	if (!vdev->refcnt) {
-		ret = vfio_fsl_mc_regions_init(vdev);
-		if (ret)
-			goto out;
-	}
-	vdev->refcnt++;
-out:
-	mutex_unlock(&vdev->reflck->lock);
 
-	return ret;
-}
-
-static void vfio_fsl_mc_release(struct vfio_device *core_vdev)
+static void vfio_fsl_mc_close_device(struct vfio_device *core_vdev)
 {
 	struct vfio_fsl_mc_device *vdev =
 		container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
+	struct fsl_mc_device *mc_dev = vdev->mc_dev;
+	struct device *cont_dev = fsl_mc_cont_dev(&mc_dev->dev);
+	struct fsl_mc_device *mc_cont = to_fsl_mc_device(cont_dev);
 	int ret;
 
-	mutex_lock(&vdev->reflck->lock);
+	vfio_fsl_mc_regions_cleanup(vdev);
 
-	if (!(--vdev->refcnt)) {
-		struct fsl_mc_device *mc_dev = vdev->mc_dev;
-		struct device *cont_dev = fsl_mc_cont_dev(&mc_dev->dev);
-		struct fsl_mc_device *mc_cont = to_fsl_mc_device(cont_dev);
-
-		vfio_fsl_mc_regions_cleanup(vdev);
+	/* reset the device before cleaning up the interrupts */
+	ret = dprc_reset_container(mc_cont->mc_io, 0, mc_cont->mc_handle,
+				   mc_cont->obj_desc.id,
+				   DPRC_RESET_OPTION_NON_RECURSIVE);
 
-		/* reset the device before cleaning up the interrupts */
-		ret = dprc_reset_container(mc_cont->mc_io, 0,
-		      mc_cont->mc_handle,
-			  mc_cont->obj_desc.id,
-			  DPRC_RESET_OPTION_NON_RECURSIVE);
+	if (WARN_ON(ret))
+		dev_warn(&mc_cont->dev,
+			 "VFIO_FLS_MC: reset device has failed (%d)\n", ret);
 
-		if (ret) {
-			dev_warn(&mc_cont->dev, "VFIO_FLS_MC: reset device has failed (%d)\n",
-				 ret);
-			WARN_ON(1);
-		}
+	vfio_fsl_mc_irqs_cleanup(vdev);
 
-		vfio_fsl_mc_irqs_cleanup(vdev);
-
-		fsl_mc_cleanup_irq_pool(mc_cont);
-	}
-
-	mutex_unlock(&vdev->reflck->lock);
+	fsl_mc_cleanup_irq_pool(mc_cont);
 }
 
 static long vfio_fsl_mc_ioctl(struct vfio_device *core_vdev,
@@ -504,8 +405,8 @@ static int vfio_fsl_mc_mmap(struct vfio_device *core_vdev,
 
 static const struct vfio_device_ops vfio_fsl_mc_ops = {
 	.name		= "vfio-fsl-mc",
-	.open		= vfio_fsl_mc_open,
-	.release	= vfio_fsl_mc_release,
+	.open_device	= vfio_fsl_mc_open_device,
+	.close_device	= vfio_fsl_mc_close_device,
 	.ioctl		= vfio_fsl_mc_ioctl,
 	.read		= vfio_fsl_mc_read,
 	.write		= vfio_fsl_mc_write,
@@ -625,13 +526,15 @@ static int vfio_fsl_mc_probe(struct fsl_mc_device *mc_dev)
 	vdev->mc_dev = mc_dev;
 	mutex_init(&vdev->igate);
 
-	ret = vfio_fsl_mc_reflck_attach(vdev);
+	ret = vfio_assign_device_set(&vdev->vdev, is_fsl_mc_bus_dprc(mc_dev) ?
+							  &mc_dev->dev :
+							  mc_dev->dev.parent);
 	if (ret)
 		goto out_uninit;
 
 	ret = vfio_fsl_mc_init_device(vdev);
 	if (ret)
-		goto out_reflck;
+		goto out_uninit;
 
 	ret = vfio_register_group_dev(&vdev->vdev);
 	if (ret) {
@@ -639,12 +542,6 @@ static int vfio_fsl_mc_probe(struct fsl_mc_device *mc_dev)
 		goto out_device;
 	}
 
-	/*
-	 * This triggers recursion into vfio_fsl_mc_probe() on another device
-	 * and the vfio_fsl_mc_reflck_attach() must succeed, which relies on the
-	 * vfio_add_group_dev() above. It has no impact on this vdev, so it is
-	 * safe to be after the vfio device is made live.
-	 */
 	ret = vfio_fsl_mc_scan_container(mc_dev);
 	if (ret)
 		goto out_group_dev;
@@ -655,8 +552,6 @@ static int vfio_fsl_mc_probe(struct fsl_mc_device *mc_dev)
 	vfio_unregister_group_dev(&vdev->vdev);
 out_device:
 	vfio_fsl_uninit_device(vdev);
-out_reflck:
-	vfio_fsl_mc_reflck_put(vdev->reflck);
 out_uninit:
 	vfio_uninit_group_dev(&vdev->vdev);
 	kfree(vdev);
@@ -676,7 +571,6 @@ static int vfio_fsl_mc_remove(struct fsl_mc_device *mc_dev)
 	dprc_remove_devices(mc_dev, NULL, 0);
 	vfio_fsl_uninit_device(vdev);
 	vfio_uninit_group_dev(&vdev->vdev);
-	vfio_fsl_mc_reflck_put(vdev->reflck);
 
 	kfree(vdev);
 	vfio_iommu_group_put(mc_dev->dev.iommu_group, dev);
diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c b/drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c
index 0d9f3002df7f51..77e584093a233d 100644
--- a/drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c
+++ b/drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c
@@ -120,7 +120,7 @@ static int vfio_fsl_mc_set_irq_trigger(struct vfio_fsl_mc_device *vdev,
 	if (start != 0 || count != 1)
 		return -EINVAL;
 
-	mutex_lock(&vdev->reflck->lock);
+	mutex_lock(&vdev->vdev.dev_set->lock);
 	ret = fsl_mc_populate_irq_pool(mc_cont,
 			FSL_MC_IRQ_POOL_MAX_TOTAL_IRQS);
 	if (ret)
@@ -129,7 +129,7 @@ static int vfio_fsl_mc_set_irq_trigger(struct vfio_fsl_mc_device *vdev,
 	ret = vfio_fsl_mc_irqs_allocate(vdev);
 	if (ret)
 		goto unlock;
-	mutex_unlock(&vdev->reflck->lock);
+	mutex_unlock(&vdev->vdev.dev_set->lock);
 
 	if (flags & VFIO_IRQ_SET_DATA_EVENTFD) {
 		s32 fd = *(s32 *)data;
@@ -154,7 +154,7 @@ static int vfio_fsl_mc_set_irq_trigger(struct vfio_fsl_mc_device *vdev,
 	return 0;
 
 unlock:
-	mutex_unlock(&vdev->reflck->lock);
+	mutex_unlock(&vdev->vdev.dev_set->lock);
 	return ret;
 
 }
diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc_private.h b/drivers/vfio/fsl-mc/vfio_fsl_mc_private.h
index 89700e00e77d10..4ad63ececb914b 100644
--- a/drivers/vfio/fsl-mc/vfio_fsl_mc_private.h
+++ b/drivers/vfio/fsl-mc/vfio_fsl_mc_private.h
@@ -22,11 +22,6 @@ struct vfio_fsl_mc_irq {
 	char            *name;
 };
 
-struct vfio_fsl_mc_reflck {
-	struct kref		kref;
-	struct mutex		lock;
-};
-
 struct vfio_fsl_mc_region {
 	u32			flags;
 	u32			type;
@@ -39,9 +34,7 @@ struct vfio_fsl_mc_device {
 	struct vfio_device		vdev;
 	struct fsl_mc_device		*mc_dev;
 	struct notifier_block        nb;
-	int				refcnt;
 	struct vfio_fsl_mc_region	*regions;
-	struct vfio_fsl_mc_reflck   *reflck;
 	struct mutex         igate;
 	struct vfio_fsl_mc_irq      *mc_irqs;
 };
-- 
2.32.0

