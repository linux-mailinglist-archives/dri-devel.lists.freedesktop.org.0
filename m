Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D68620556
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 01:53:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094DF10E393;
	Tue,  8 Nov 2022 00:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2CA410E1FB;
 Tue,  8 Nov 2022 00:53:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mbSRHRK+IEVOz7oeXG85z3xVrXV8oh3CPs2tQAS/m+c/SeWl0TbcRIUyBuPlMkBbYYpmANknaAxcvbnT56/hBvz2/KWk510ZG1Lp941gSak998aFTzL4nJ0igq0JFbssXGz9H+RLHEDHhSt7HyL7ymS2U+9loN5pA0qDEKaylalsuPXewYuxbLMwJFgWRRf8ww1zTs84nzipA5Mi4IJx4593XOGOkaeLyAmqYmdieLmRNOf+yN/ZxD8KOMlDqJ7+q/nT1kNgoaaGZnM/74eRqf0u/NNcVWJeSZskrVP7xkXt8YFPTlL64eFUVfoSEino7i2UHc8K92ScG/rIF/YQmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mC3HWrwodv1qPgkzCtMsoU7B6Zkdi7mxmlfqrBfH9Ms=;
 b=g68wo891xQUfpSpdTOcI0mLwwYoE/Dbn3tDvkXPBZ4b9STnk+FoQGm3I8YAnyZZabdBQYPZdICDF3M/WOYMgiY/17A59FquEC2S5p3ZMn4iTVGSn5PCujS1W1oLz/zWRPp1IGSdzMOLlkU1xA5/iIXd15/NtJukruMP6GVoZTxZ9hxUMj87W8W+SBsd6B6ccQr8dLdS3HXdQ+y2yHlEThzggMjEYd/89907S0KUn+8qZOzr9Ipvm42Uz/m2Awzob4aZ5oJj+pF+in14koIJFqmY9RmIB4hxJZYu1E4KvTE2PY1T++r7mVX8kkMh2qSJh14ZWlPYmVBjPHNcNIPISyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mC3HWrwodv1qPgkzCtMsoU7B6Zkdi7mxmlfqrBfH9Ms=;
 b=qDeqCLhqc27YLAjcKUyc1lGg4JZyDu8BEjHJkvAKnjvnJkliSFvTLVZbt0+qYWjWskQlTrzlxYEvF2viRZU/xfe9iBU4iC5CimrrpnO3+mYgME95BfXfOeNR93QSKKZ+gtibCvi/yyHghtw3YLzGiKYrX3lomDaqI6ARVt7amynEHeQNkuMihFnjL8/aSaxtLYiEcJ6mxJwJ/qmi8HZOdS4EOadSr39UHbotfagCoeJDiI4doSyfji4g3Vw+dwTv7IJ8SaVNQ+H9b7uS6uM4FxPCyPhEDeniMo+7d3nmH363K0XSB285fRsgu6Hwo/CnQHTf461cEewbIT1V5E5yqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ0PR12MB6686.namprd12.prod.outlook.com (2603:10b6:a03:479::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Tue, 8 Nov
 2022 00:52:59 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 00:52:59 +0000
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
Subject: [PATCH v2 03/11] vfio: Rename vfio_device_assign/unassign_container()
Date: Mon,  7 Nov 2022 20:52:47 -0400
Message-Id: <3-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR1501CA0005.namprd15.prod.outlook.com
 (2603:10b6:207:17::18) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ0PR12MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: f3038ec4-71b1-4dc1-4f2d-08dac123935e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 26G+5v5bJ6wOEl+p/ghKyzu50nv1M4fGUNIIMOgwMW1plyAhB7xjYuQ6hfkHc0jVwXX/o2bcGSN18QsM2xb2Y6K70JvO9SBUSrsKj5AQ9p73EzuQcIICYHvPXnTQh3EheXk3B0saYFiyN/6Z7Tt5Fax8MOYMepGPZVLck/hAMcxSZiWZjxK9XFPA5plZfdgSWL3nP25eTlrBphgQu1HeltQrqQalNXNuzHdLF0jAhK02TQTIR9qPxjePDTO69/G8izl8Isi3BWysCZ779m+sCOIDwUFx5jtO3cMEMiSpkT7pBw5o+sLb5+JeDd4c9ubSFA6AgDq/rv24xYhF18cEgo+cUeS4R819ycKYVfskVAYiOlUDlGPkxPTxxFcl6I3MWQQlj3zFqt484Lu2NfBTeFuBzDCvjNobG9bab7l289an0qq5A2BkQ8daDQllSFiPg39xz4RLhp5vlC6hcKyq03BEbROfVuNfWpvkwU0jfo+thz3Lm9I55B8GRLp7eRDSJIumZmEAWS7hoiec4/DXuSQORVUzet1Bcz3K3jVpgwcPHu+AVopDrkY4cAFRR78MSWGZOv6BHVtZ/Op8jlUcPh9mIAlJ+LiSmaSxMSepURXjMrMgFZL5ok4Ud1DhcA0tERxSW8oFlLCFroL17r4wNqI1hFZi+UETJSi2T1KtUPOcsB6I381sD5piHf6o8NwLb9IQl/VR1TJKrPHe/8BGNqs3k4DpWMkOWhJzFVsIzj9oxT/AIQlZjPvdjuUuvGopRvROEjALEOnxsGKIZxLfjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199015)(2616005)(921005)(83380400001)(38100700002)(186003)(2906002)(7416002)(7406005)(8936002)(86362001)(5660300002)(478600001)(6666004)(6486002)(26005)(6512007)(6506007)(66476007)(66556008)(8676002)(4326008)(316002)(41300700001)(110136005)(54906003)(66946007)(36756003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MxUVC4zmjBN/w0K+k+BtgRUARMeMGLN/8PcmF4bzZnkDBZVXrI9MvEAdeQw2?=
 =?us-ascii?Q?BpXdHSvjqa+kRsLmSlryHZiChZzhYVC0OCvEMlflub2GB0Sw1QWjMeuNottk?=
 =?us-ascii?Q?YB7BHaTKZR9ZczjThDDY3EH5Qz3e6oOiaARVJeMQXe/dMXMD4S8JYNyebkqz?=
 =?us-ascii?Q?GjGX4CgCL9Q2NysfLxjiBQ+K6Eal9DWIA7rJ9kaC3CBpyWpb8VAy1zbeS6aF?=
 =?us-ascii?Q?NbKrVtIcvvk2+7XD3xHqJb6SsyaQa13TGdvE+fG8WW4NsaePD2e3ceq96jvO?=
 =?us-ascii?Q?VKrA47vd9UCG66yv96+nL4AsrfYgo8zJmTruB/jWNqzlUcG13PytHn6bGc9O?=
 =?us-ascii?Q?QsM/8gGvidSkoOItr15sOW/M4JKQVX1Gy4rZnPfq5caRhhcqWOP/HkEt4Auu?=
 =?us-ascii?Q?nJg1GJq+PPUOxICCR4y0XB0ZesogM0UGDW7hZWz9VnouINA9txtBOwFq+zxq?=
 =?us-ascii?Q?qXcn65qis2E48XmmKs4QzE0peJ5qF46yCD54wi0jIs2P6YqjtCzwuRS6b8dG?=
 =?us-ascii?Q?wP4xNR5MNtLvlGL5E1CWZXUYpyGf6zdlFCJV/m3NSghnV63DX89RWOlsPXLS?=
 =?us-ascii?Q?R3mtv5eiBwHnRKAjjRu5rTyXtb2CuskLjOvIklzSZM3F/OVRUI3Qk1zCv2gH?=
 =?us-ascii?Q?1xdUZwG8pm+Qr2mmuSrActGwlbOwoxnpZPbiEXE8bwz6sWOcd7V8jhsVzbQm?=
 =?us-ascii?Q?bmQz6HYRoNLcrc+62GGFs5kc70noIGyle4T5q8te73Tkq9VgoWuVFmjTqjIv?=
 =?us-ascii?Q?rOiSYJ4XVJYPPzv0lQF9mfigFsDXwqorgeidDZxsfxavvqx3msBoqI7y4bOe?=
 =?us-ascii?Q?+Cqqj8eRNsUsxVViRqcR4r0WiJYq+GoXqdGRAGBN3L8wny11Jxs56qj/z93i?=
 =?us-ascii?Q?VXMgGYVdny5n8s+/leuL2GTBHoyS+sa4aXY5DhsRGL5KTLn6bgewXpP8+a0G?=
 =?us-ascii?Q?5iVx6064h6CUDiD3fQ87uOaTzcvgY8TyS4DSw4RATukte++i9fdIcZ/8nK2Y?=
 =?us-ascii?Q?Z1Ql3JWQWcf5hJN7snEDWvj1qcHQrmGR4qnBMznc2xs9cdFuEuv8O7Zkkdol?=
 =?us-ascii?Q?lv0/rHtpaeDVkyrWYQFoC3Fce2thmorD+zZa4M6xxs6CY6dmHaUFc9V1awn2?=
 =?us-ascii?Q?+atOcm+7jB1AYdJrJukaNOcgi8wKIC508Nec703EDBo3ivp0L/2fvpeF+jjT?=
 =?us-ascii?Q?17x8rMtsA6FdZTya1aCoUBKcjSMJ2YZFk1VmVJBKIbzvcK6tu/VMegMjGh78?=
 =?us-ascii?Q?/HACKWGWruXGLKYtk1qObKah47UUGERqCJqc1YciY2KYqDmJ430j/U7UW+9d?=
 =?us-ascii?Q?ObzSVzyNd5KK/7c5LXfY7tTUHRXeX1v2wXAOcUyPWSUKMud5e8xF66ouGP8x?=
 =?us-ascii?Q?Q2mHcJjtgBlle4yFwCz4Yf9jjQOSlxd1mi3TyLLqhZX8mEuUjNS5ViGlXwBk?=
 =?us-ascii?Q?Ian/PDElNWo9uYtgbG41A7ak0EVbL3Ogk0+FPgr98UL9bBCQC1QUKC3C21ku?=
 =?us-ascii?Q?1Ff0hcs1nOsO2nDeCclUg0OLURwdwZLVaz90r+bDIte9JK5nDqxOjvV8+4C1?=
 =?us-ascii?Q?AFJIMASvtOnBhqA8Ajk=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3038ec4-71b1-4dc1-4f2d-08dac123935e
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 00:52:56.8513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lmvq8mN9mb3qM5kw5ePBDfGwdNgzlp+I1yApiuDjpoRGWeowkF0p78oJQHDSZTWB
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

These functions don't really assign anything anymore, they just increment
some refcounts and do a sanity check. Call them
vfio_group_[un]use_container()

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Yi Liu <yi.l.liu@intel.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/container.c | 14 ++++++--------
 drivers/vfio/vfio.h      |  4 ++--
 drivers/vfio/vfio_main.c |  6 +++---
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/vfio/container.c b/drivers/vfio/container.c
index dd79a66ec62cad..499777930b08fa 100644
--- a/drivers/vfio/container.c
+++ b/drivers/vfio/container.c
@@ -511,10 +511,8 @@ void vfio_group_detach_container(struct vfio_group *group)
 	vfio_container_put(container);
 }
 
-int vfio_device_assign_container(struct vfio_device *device)
+int vfio_group_use_container(struct vfio_group *group)
 {
-	struct vfio_group *group = device->group;
-
 	lockdep_assert_held(&group->group_lock);
 
 	if (!group->container || !group->container->iommu_driver ||
@@ -529,13 +527,13 @@ int vfio_device_assign_container(struct vfio_device *device)
 	return 0;
 }
 
-void vfio_device_unassign_container(struct vfio_device *device)
+void vfio_group_unuse_container(struct vfio_group *group)
 {
-	lockdep_assert_held_write(&device->group->group_lock);
+	lockdep_assert_held(&group->group_lock);
 
-	WARN_ON(device->group->container_users <= 1);
-	device->group->container_users--;
-	fput(device->group->opened_file);
+	WARN_ON(group->container_users <= 1);
+	group->container_users--;
+	fput(group->opened_file);
 }
 
 /*
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index bcad54bbab08c4..f95f4925b83bbd 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -112,8 +112,8 @@ void vfio_unregister_iommu_driver(const struct vfio_iommu_driver_ops *ops);
 bool vfio_assert_device_open(struct vfio_device *device);
 
 struct vfio_container *vfio_container_from_file(struct file *filep);
-int vfio_device_assign_container(struct vfio_device *device);
-void vfio_device_unassign_container(struct vfio_device *device);
+int vfio_group_use_container(struct vfio_group *group);
+void vfio_group_unuse_container(struct vfio_group *group);
 int vfio_container_attach_group(struct vfio_container *container,
 				struct vfio_group *group);
 void vfio_group_detach_container(struct vfio_group *group);
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 717c7f404feeea..8c2dcb481ae10b 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -749,7 +749,7 @@ static int vfio_device_first_open(struct vfio_device *device)
 	 * during close_device.
 	 */
 	mutex_lock(&device->group->group_lock);
-	ret = vfio_device_assign_container(device);
+	ret = vfio_group_use_container(device->group);
 	if (ret)
 		goto err_module_put;
 
@@ -765,7 +765,7 @@ static int vfio_device_first_open(struct vfio_device *device)
 
 err_container:
 	device->kvm = NULL;
-	vfio_device_unassign_container(device);
+	vfio_group_unuse_container(device->group);
 err_module_put:
 	mutex_unlock(&device->group->group_lock);
 	module_put(device->dev->driver->owner);
@@ -781,7 +781,7 @@ static void vfio_device_last_close(struct vfio_device *device)
 	if (device->ops->close_device)
 		device->ops->close_device(device);
 	device->kvm = NULL;
-	vfio_device_unassign_container(device);
+	vfio_group_unuse_container(device->group);
 	mutex_unlock(&device->group->group_lock);
 	module_put(device->dev->driver->owner);
 }
-- 
2.38.1

