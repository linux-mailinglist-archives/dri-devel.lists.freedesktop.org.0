Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A38620569
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 01:54:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDD410E3AE;
	Tue,  8 Nov 2022 00:53:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEF210E381;
 Tue,  8 Nov 2022 00:53:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhmsC6X8Jkcy8qS5x9zYuPCit/cJM+G2EbbE3Ewb3rEU3pOtquHnFIuFedqlGI6w3RGeE6PAIiXznqd9dPx9tbHdcpy+DmKTjGv4aMotufm+mRnKxflEYtXMo7+UYMwjD2hNCtoMuINRIybMXjPBatVfAWuK0u6Ilz3POrUgCDa1V7CVSNEl99jq18FV0j0Ab4iy0366DlY8N2DD+wQREUaSUVERwhGLAicIuUEwdRQ3kqawMXa+ZJ64ruK0gpPwuIvHf2tpGpKYjbK+70bOSnSOL8wcKcGk/VxNCRPkNukg2X4GpD6xndfFUWftWLoDqVcx674UqeEtVkAh0t6Plw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MNlH6lQNfC/xypoqYrci9gQNkIkhwL8/2HCUoUA7F4=;
 b=BQeY7jSLE05DBrQGk2zLveNw5JU1nrkPLLjtA7Z35pJlUjyuW8hH5KTfno6PPyqaRwlFseRpxwVsqtEOwCJQzJFjeQFCaNhCEDuHKD6SkkKoXzFxx5+tfC/KLNpslsGCR9uPCO7HwN5hNyoOdmXLq7+6Wff76gfshUw/wDmkln2yF+L3mtKlDkH9PAZE7JEHanUIMj/oP/85t+4jhhfkPiWJVuPAmsQf6q42s08l0KwEfjCvRkWIVwpo1yQ9kxXj/msS6+wY5a6cDi8iCCjJqEZCFmNMkUAnt5kMK5L5+PueHyDu4MHXPF1moOKArmXPt1jiWnM6T6ZYN31NOIS0Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MNlH6lQNfC/xypoqYrci9gQNkIkhwL8/2HCUoUA7F4=;
 b=dEAHYT4sIZOzvlvZMi7ozJOCGFqEBhaSH/U+ManSoYwgIqL7YOEuqgmeXIdBIkPAbguvXgW5g6/Dz8xfVqRNmazMeQnsU7F2urAUB3Sg6OuLMbhOmL6xDX54rXsDCE2QV4+DUpNou9AaDSnuLBUrzhzs5ihXyA23Gwyoml8u1sQUo8mEyf01sRRmpvfaB+TFCoQbrXa5vTBOM05fvhV0jGe4/v+SN5vv2u1pEyMgRconbYgHsSe+ee6CRF+qrY3S13DtfWaMY7Ztux9MH8f1ZJjHhgPffv1nfGcetpURKCYiW77O4cAW3XrB4bz+hhRKhZpwm1yApqbDvEV6WulIpQ==
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
Subject: [PATCH v2 05/11] vfio: Use IOMMU_CAP_ENFORCE_CACHE_COHERENCY for
 vfio_file_enforced_coherent()
Date: Mon,  7 Nov 2022 20:52:49 -0400
Message-Id: <5-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0144.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::29) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ0PR12MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e9543b5-4436-45f1-13b2-08dac1239363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6LcXNRg5CRlkrv0tKlG+z1QNjVi6Mhqtj7QMb8/cuMPR1bzBCOIwErFXDm4Q9wsqGc18dESDYbCQ0n5TWI+EAnEohwHgEM76TkXXHg64K2Ig27zPl86LW+YCWLsVNEu4fO+fZgn2sfnKu60P/aUzY+m0cgrhrSdwxjHR2ZbV/aIOIC0n51pfz8e410iPIJNijQGCkZ+rjIvZa9AgkkYMEgVStkEFcuq3YOly3upCDrKg3AkkUWs1HFzMEVEMIPGNbvqjUvb3TD6SsGTBT3UeadPrGKxkzwB/7bNQ4W/LAVjBosldE5D1640l6aonmjnN779EahNWww8+CZL/EtBr2H6hspsdP0I0wn7lmf1wKjgz1IMpOaRTI8OCvv7aipjXciEULTSo9ByYLHjtG2e9cqXJPwiIigTv5OKi05npP416jlCKKa3PK2bkCduA1ce8ZoYwJT9x46adSZ6hMgeWcy07oU+zGe1I5kpbiwZ9d1yO9I2ipgv2sAtHI6Sa5SQAs9WYnva5xC6wseJIX3+r8Dtt78Mqurco/gAAnRZEvQJhdKEPPa53hzvHrbeEZUP0ocuEpItbAzVVKCM3Af6a8OYHctxC5kVgEKv8gU9QUY7oaOers/HNBlUsQOhLZAzmZ/2ijnNIrhpxqkCNqCcfGfi3gKwYRAswN0T2puU6OXgGXclBSTUokH3SiWvRLudPH885L0cNjVyxRUtI/4uTZ7h5aceohhsCFArvDt+naDg82SHwYBTDRIz82iEWn9zLMuh8ICOOgi04tfQONlBNqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199015)(2616005)(921005)(83380400001)(38100700002)(186003)(2906002)(7416002)(7406005)(8936002)(86362001)(5660300002)(478600001)(6666004)(6486002)(26005)(6512007)(6506007)(66476007)(66556008)(8676002)(4326008)(316002)(41300700001)(110136005)(54906003)(66946007)(36756003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IE7cjEUzMsCNiRQWKaEi3KqtDZcjJnNuxoIGeVWDmNUsaWBgoE1NGzaziG1q?=
 =?us-ascii?Q?CuSPXau4EFEy6QvPIANOU3x3m4AVADFuWuYDTk/GdCu9OEEbFhUwcDRnYJV6?=
 =?us-ascii?Q?GjW0pYg9Zg5BCZfr/xbmHGpXD9SXs3OoXYgFdz886DKz8XmBuQ6Fdt6QHd6l?=
 =?us-ascii?Q?l2sNTBgVnW/NcOeq+xquy46nFbmTTlC9R/cialTSi79P16TOFYzXNaBiQw4N?=
 =?us-ascii?Q?wGLHlaOEd62T/EM0AzPCj4bsw+WcNuGzBIc0iSccxnqbSVqzx0+pmruF3SE4?=
 =?us-ascii?Q?Xhr346aBEAOnvbxtAuhLKMz2OzXkxXx1tfW/3MhOX0ehF/7T8VeMPOvFY+im?=
 =?us-ascii?Q?gi1oUN2JL7SFyg/F874CnzuVzVuIhnW8BfaUS3QcVtMAonJh3EGIrblkvoeB?=
 =?us-ascii?Q?Xr2/4pFjfooliEkDX//2kYeOAE1t5b75q02w5EV3b5ogFUQMQusouzuqdik5?=
 =?us-ascii?Q?fPkNIQAr1CO/pDVerSRK6x6wfCeAPaG5VxKMNeMMPbWum8OvK+DniN/3fLF8?=
 =?us-ascii?Q?j5sVxhRECkx5wGi9VoT2jZ38AcIx0qFmLHwvd66E1u1TK5MyVQ+blQ6yr1b9?=
 =?us-ascii?Q?k4aQttpZRdIMkb2IHMCbwFKpeCmHiPjtI5CorH1nPiw4OHwrWx0PGj1ufFwa?=
 =?us-ascii?Q?ROPsPje/Rf+yfl7qxQ+z1sFGrFI4lrhy6QBqKOB7LC0iSelymvfVxv5N4mfq?=
 =?us-ascii?Q?PWeObDJhYisLQOifyf2XsYGeKQ1PtyETmWwzyesKwb3597OxoETzcIVI/NcW?=
 =?us-ascii?Q?KlJMtzQrMCZgvPVxu0Xfnfr0LDC7xnzCFlPpRM92bvaEfqb75cxA3+5NTXKn?=
 =?us-ascii?Q?Do9Fgb/uCtIDkhII/rDeuhlJyL/0SYFukOzQ7uiNC8sfCx6YPHhTtXw9fwdj?=
 =?us-ascii?Q?llWSim6aYIBazWMHkx3Mm7wklFYlT14h2sBXT3UuCypwNDoDW7fPrOChnn6F?=
 =?us-ascii?Q?dxRzzxC5lYYD0eZBXrZC3c55uUrO4x7Xn9lZSuiP5Aqw3SmzpTmBgK7wWh78?=
 =?us-ascii?Q?cE/URNRklwta2BNmb2TzT2nzLZRmXEmK6eUsL6WwEDc3RDPBu2YHQHiihBgZ?=
 =?us-ascii?Q?CAwwnxE8y98iwQNLPgH/mj4WNUOyIVGXwwz0A1UzwHk54iXMlnQ09b/bjVNW?=
 =?us-ascii?Q?pSnX43E70a/JZ5prkXF5C1rMuEgUjnmwEY5HMZorUEPNSIdvlmWACEaxhSBD?=
 =?us-ascii?Q?4+B29iKdpsUmSEqRb9EljGZ+oZ2GxwoMN3Kc0giFWE7zHJuMoaGLnCf0uWys?=
 =?us-ascii?Q?fgeyC8G3vUulRQYX+Nd5K4RcvQF5vP3vSfi3yRLsG3U7ZIuzCp1eCnpdheuG?=
 =?us-ascii?Q?fLO0yioyjlBmdn1NYY+GqIxiSWYxidBOZeauS9x3B8BlHhgJBu24zyt7bVYG?=
 =?us-ascii?Q?zmHOml9696n1v0yLXefswIHdSwpLauFq8UslsRe1jbM2f17Ph5S+qglVGBK3?=
 =?us-ascii?Q?fleFd74cw9dVpb0RLZ86dNKlIfmKiDoqv7zrzg+Pqq4HwQqeu17a1o/TYmdN?=
 =?us-ascii?Q?sF3cBwm81GZt4hiWurVYJCtjxxpZLrl3yEPe+UnwfHPXZmAGUmOnDyM/i8fj?=
 =?us-ascii?Q?HRmfUhg1KFVYGR+tulw=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9543b5-4436-45f1-13b2-08dac1239363
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 00:52:56.8669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPpSbVIVLm1+HfcYOUbRRcCXiSOkLvxwA3lUBCpz7ISh76bLyvBLSh+vWZ2d83kZ
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

iommufd doesn't establish the iommu_domains until after the device FD is
opened, even if the container has been set. This design is part of moving
away from the group centric iommu APIs.

This is fine, except that the normal sequence of establishing the kvm
wbinvd won't work:

   group = open("/dev/vfio/XX")
   ioctl(group, VFIO_GROUP_SET_CONTAINER)
   ioctl(kvm, KVM_DEV_VFIO_GROUP_ADD)
   ioctl(group, VFIO_GROUP_GET_DEVICE_FD)

As the domains don't start existing until GET_DEVICE_FD. Further,
GET_DEVICE_FD requires that KVM_DEV_VFIO_GROUP_ADD already be done as that
is what sets the group->kvm and thus device->kvm for the driver to use
during open.

Now that we have device centric cap ops and the new
IOMMU_CAP_ENFORCE_CACHE_COHERENCY we know what the iommu_domain will be
capable of without having to create it. Use this to compute
vfio_file_enforced_coherent() and resolve the ordering problems.

VFIO always tries to upgrade domains to enforce cache coherency, it never
attaches a device that supports enforce cache coherency to a less capable
domain, so the cap test is a sufficient proxy for the ultimate
outcome. iommufd also ensures that devices that set the cap will be
connected to enforcing domains.

Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/container.c |  5 +++--
 drivers/vfio/vfio.h      |  2 --
 drivers/vfio/vfio_main.c | 29 ++++++++++++++++-------------
 3 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/vfio/container.c b/drivers/vfio/container.c
index 499777930b08fa..d97747dfb05d02 100644
--- a/drivers/vfio/container.c
+++ b/drivers/vfio/container.c
@@ -188,8 +188,9 @@ void vfio_device_container_unregister(struct vfio_device *device)
 			device->group->container->iommu_data, device);
 }
 
-long vfio_container_ioctl_check_extension(struct vfio_container *container,
-					  unsigned long arg)
+static long
+vfio_container_ioctl_check_extension(struct vfio_container *container,
+				     unsigned long arg)
 {
 	struct vfio_iommu_driver *driver;
 	long ret = 0;
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 54e5a8e0834ccb..247590334e14b0 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -119,8 +119,6 @@ int vfio_container_attach_group(struct vfio_container *container,
 void vfio_group_detach_container(struct vfio_group *group);
 void vfio_device_container_register(struct vfio_device *device);
 void vfio_device_container_unregister(struct vfio_device *device);
-long vfio_container_ioctl_check_extension(struct vfio_container *container,
-					  unsigned long arg);
 int __init vfio_container_init(void);
 void vfio_container_cleanup(void);
 
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index e1fec1db6a3c93..5c0e810f8b4d08 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1625,24 +1625,27 @@ EXPORT_SYMBOL_GPL(vfio_file_is_group);
 bool vfio_file_enforced_coherent(struct file *file)
 {
 	struct vfio_group *group = file->private_data;
-	bool ret;
+	struct vfio_device *device;
+	bool ret = true;
 
 	if (!vfio_file_is_group(file))
 		return true;
 
-	mutex_lock(&group->group_lock);
-	if (group->container) {
-		ret = vfio_container_ioctl_check_extension(group->container,
-							   VFIO_DMA_CC_IOMMU);
-	} else {
-		/*
-		 * Since the coherency state is determined only once a container
-		 * is attached the user must do so before they can prove they
-		 * have permission.
-		 */
-		ret = true;
+	/*
+	 * If the device does not have IOMMU_CAP_ENFORCE_CACHE_COHERENCY then
+	 * any domain later attached to it will also not support it. If the cap
+	 * is set then the iommu_domain eventually attached to the device/group
+	 * must use a domain with enforce_cache_coherency().
+	 */
+	mutex_lock(&group->device_lock);
+	list_for_each_entry(device, &group->device_list, group_next) {
+		if (!device_iommu_capable(device->dev,
+					  IOMMU_CAP_ENFORCE_CACHE_COHERENCY)) {
+			ret = false;
+			break;
+		}
 	}
-	mutex_unlock(&group->group_lock);
+	mutex_unlock(&group->device_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(vfio_file_enforced_coherent);
-- 
2.38.1

