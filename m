Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC784FE566
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 17:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A123D10E6E8;
	Tue, 12 Apr 2022 15:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A042A10E69A;
 Tue, 12 Apr 2022 15:53:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elbzJg7q52Yna75xhswCgx49AEOuLqVTRvsjHsLpY0iWLsmIonJiqjnyQyX+Qi8RTk+gk1UNZ4F/U1/8TwqC6BAt90BP3tIfJCaliG+HPQdwiMeMLCzndm8TvzHYqoUKqkBDuSvSHxJ9fofAMrEp01O9jZtE4R1J2F8Bb+CF8SrVBXpLaEW9UtSBG5i+FWjOIssl8s3jKosBgB7SQOHXDfxwBnjcn77/LzL8PjwpW9dS4kPdmRqfrzoeEV5KmBHc21lYl17C4wBiACUD69yI/TXfAzp4VvSWt9ui7/1oexCbilcErwAso+JenTsOFtE37Xw3mhSuyfcc9jkw70fSZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUm89Wvcl/c0WqbqRLZLTxPH9jHz+NnwQfWw/QQQtr0=;
 b=bELek9ocGs1Ssx6sg6rz9q8EpACedsLAPqu0Jha1qboWTAHzYQPGhGS7xHZVgn9AsrELtQOyQ89zsanchLWGGHUDZoYsS0qhd0UdwcoJVg0+/SK3O+q2go9dlbedf7oVecLYlHt/Qs3zEyeA1UWZ4rNVmwi+XuNjhtlIDo2iOzD2loC8X8RHwTyBGM0pSZ+vS1GHvQFKy+LVJdIIzk0/eDfKt2fnTkUdvck4By83AZsQqq6HwDvQwCmTPtVgAfu73WJZL34UBfx3hHXG/KRdQPU5fVdVpiUn+gD19pfdZi7CmaFAc21pLAJCLOtXbW6T/mNd8UV5WX2D3CiOAckLhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUm89Wvcl/c0WqbqRLZLTxPH9jHz+NnwQfWw/QQQtr0=;
 b=fHHz/8H0b8exzrYmxcMsFEH7+7vymoyZduXUhBxegCNNX7rtehjKSPnPImcNNMo0vVUUa+D1QBq+YOu7+G74qyW0ivuyxxACeJr6pAyvVLgZRLGpdRwQIDKTKG2uKJkxiDKRP/o1fX2HupzUXPZJ24KFgE0lG03/AoHntJne+nDMedPxozmLYDtcXQVGagnFX5PHz6urjrDgGSykuWeyJIpSVuR/yGPVDE0F3im2wFKsUEdQJu8TtbS5VZoKXxbwLmeWBxCUhwMqs7/G0hyKNp4Ehp4WDrjNNnq3LS/WBaraL1Cs3WL8bVOFQ9y2irjv3+xxUqtlbFbriRkQtpJadw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB4181.namprd12.prod.outlook.com (2603:10b6:610:a8::16)
 by DM6PR12MB4172.namprd12.prod.outlook.com (2603:10b6:5:212::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 15:53:41 +0000
Received: from CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::c911:71b5:78e6:3a38]) by CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::c911:71b5:78e6:3a38%8]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 15:53:41 +0000
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
Subject: [PATCH 8/9] vfio: Remove dead code
Date: Tue, 12 Apr 2022 12:53:35 -0300
Message-Id: <8-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <0-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0151.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::6) To CH2PR12MB4181.namprd12.prod.outlook.com
 (2603:10b6:610:a8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ae43c12-059d-44d7-bf36-08da1c9c9cd0
X-MS-TrafficTypeDiagnostic: DM6PR12MB4172:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4172A15D8FA07338738A76CEC2ED9@DM6PR12MB4172.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eIlfLsTm5EMgpAAuYEUh0h9ziOK4AkLMvaWatquwJ89511UBEw+ZtGv05J6MraDoUyL1/njivMI6fDxyNt9zSU40v+suKrGV2sVRGywnCrpAw2I2wUR9dWO+6u3t87qKnPDZc1KuyAHaqIzelDeXh38SBMPScUjDpfNQ6eM5umzdRazX0Kn8N7NX/42DDG0nlBpTkVx5vWygBAamnigyK8FOLj1jM6xJ5AVSrmJE+KPPKF5IMt9K+vyr1LIxOpbv8MZfNq0AVt3J564HWd91ey7t/ddQhcKxWoV9VUL+x8Q7LMFgxxVdfimjtIEWX9cDKjb7XZbge9+HoMqjU/1D8RPiaboQzd6FB35VREbwhB+QjZMzbKuXDkQJLOIpjvExmig4DAhVVrf7V9YJ5bTj3dkQLoP04ZloP9cQX4WhQZ4Ph+pZOsZvCi/kltrgVYBO7gVCt/yCiEXGdlyRGvp/fgN3LC5Uzv5Ax9m+pyUzgbqk3O5YhVDyeRV/SuuJDna91b19s6pw+WN78juub+zK7Xo51vj6n5XmheHMhpk9+08KabYqHXQXUgn5AiTpcqbsWPpkB78wTQuMaT1dJmaiwEQGhusEXOIixsqCh+NDI/Zf89rA3PT0XUhkwnulIHD0CI9onsJ0kwfJ0h+nRkgalYBi9L5UVDRAVv3irqdxGBUHVjoyfpT3gGyNPMCZ36rTMdu52lFh5ggUYFIp7e1r9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4181.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(6486002)(6506007)(6666004)(66946007)(66476007)(4326008)(66556008)(26005)(186003)(36756003)(83380400001)(8676002)(316002)(54906003)(86362001)(8936002)(6512007)(2616005)(921005)(110136005)(7416002)(5660300002)(38100700002)(2906002)(7406005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+l0mgVg4gB6ZBlcrh36n0FFm1QhYDS9e7QzU6iVzUhs4G8kxggO+w8voJ+vv?=
 =?us-ascii?Q?/49lANs5OxVuSqrrm7EkwW/2P1MZ0b2KTjlgDW4EZYk7ol1NkAX0bfIprWqH?=
 =?us-ascii?Q?SfOK+5ThNc7554qrjkIF2nVKwe6A3SU+uWJN0vM9Mx2dAsBbROTPd/bKtgiy?=
 =?us-ascii?Q?bgF9bOniVPVvVNhIHWfiITxKbVaGwmMwaJrgc/f0BVWsP7enxUsoDtuBH9wl?=
 =?us-ascii?Q?ao/hF5ud56kVDxrYq59ROgujb0VFlC2mKPMpqI/GkOhh99ZwF4GHcT2UH+KR?=
 =?us-ascii?Q?PpAxss0cSuKyZwX5OSNlaEZbVnDzWg4ghpDMaNEB3nyvewiWy6jt6J+4blGq?=
 =?us-ascii?Q?nD+bj2Ey98GX1XnK2wVRi8DV6PAdNpUM+fJ7WOlPh/b90iyZKMZWxSSgrVjs?=
 =?us-ascii?Q?tu7miyPcBEnJKmBSn1zL0Hr+A/NFnZRGt2fWJznWNHM5eNIMXMf+XlJWfwMC?=
 =?us-ascii?Q?3WIPDozsrM+PGTGwXeupiLqv99UF1DIf0WPEzduTZHXecMyHo9c51S28G0QA?=
 =?us-ascii?Q?ehBUlOPqt7MUw1EJJ/OHlDjtBbkIBiU+eEo/sWxNnZ/aEKvnkJbs1uYE1fE2?=
 =?us-ascii?Q?n2NmZiBu6Dev5+IE0s62S/G09eujOf9JtV30E2GACFc2yEliw2kpRrMBMOiE?=
 =?us-ascii?Q?1ajN/b0R6EExakJnfCg6AvLQTqFV+/OD/kR2bGFUCSxv6afjMKYqGilfHVsT?=
 =?us-ascii?Q?512QMlEpSWFPbKXfOu+HSUUptWxlTfyPFRBc/dgqFAlarWz1rwzukO3CkbtA?=
 =?us-ascii?Q?zJ2MmbtVguUdADjyVXTl8NHkHK3cUKrp4azEWH8YZNa6xM3xc89mQyOUBUaf?=
 =?us-ascii?Q?ufEyFk0Qc+O/BgTjhqtnsZJBZJ9Pc+gnWaLBESK14lkUxv7wJVhscs2UNK2c?=
 =?us-ascii?Q?rpcskfowIc7lEXpCh/HPdxvTft7gw/bItWOCg6tFncGJJlpHrHHr8kiiGZ7C?=
 =?us-ascii?Q?W753Mzza5slbF1AaIwUJaShdmU0a8Q0BXXCSKbZKaV3iIYRXOyAuqLL6o5Wu?=
 =?us-ascii?Q?Wbcscou08VSSFHWvgZ0+osbn6D96IqwWSDsNbD1HT4+9JMy6NQ+rN5vgeZ6F?=
 =?us-ascii?Q?j+wQvEJ7sva0cBHKSWfRSZxgJa6nAfwiZzoFB+0llSNkLqGDMEuPffBmae6X?=
 =?us-ascii?Q?aX5fMh7613cTSE8Ml82oXWeejJaDsPoPlc4ZRCbkqhJtXwJH6xFShyO+ZARj?=
 =?us-ascii?Q?46vhr2ZPKi5LZV0fBn5Ygpci6lxsO0fBS5U6L64henn1pht55n4nYtghVGdc?=
 =?us-ascii?Q?63hWQVuzte+DrRkmiYXS6QsFpeUUdOI3LMyFEvlMVygfWUOPmNIarsHO3j2v?=
 =?us-ascii?Q?r51dbQZ5k6Y9KIGcXvpGYfKkYmGuF2y+woe2TX/QuTe2U3th0fwRtVu+DAZj?=
 =?us-ascii?Q?6XUCBdSzoYfqaQgSWio6tfdBgTfsRgcA/aQKy6PpSj/ovhGULMliX4Bvlcyt?=
 =?us-ascii?Q?kT1mOIC5wK6zRRYIXwp+fg3EIlfmRFVi/0xyWbc+qAAVjqdE3LLRIzCUHwLq?=
 =?us-ascii?Q?C4trWuixp5m5rxenYxncm92DZlmQD8uIehtIv+TWKQWPQLpf+Tm6wtoq7cmT?=
 =?us-ascii?Q?StVV/sO7Y91dJXx4aN1gHkQFPL2pXJFlh7j+9BoH4ghuNT0FPkNGH9kStfvS?=
 =?us-ascii?Q?2qL0Jk7cEaXs7x0b0qSQILguMRVGZYD1VPbMEFYgGfhywqPII6iAECk3wMgd?=
 =?us-ascii?Q?zr0vNfliuDByH81jOv9rQfisFWW6oCWjdq+mZZN8qcmOf4JSWG/HbP0boJjE?=
 =?us-ascii?Q?zzSfcxjUZA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae43c12-059d-44d7-bf36-08da1c9c9cd0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4181.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 15:53:39.8998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sb3Nv8PIjwWiS4I/41ZHsZs6gQSBSKhnp2knfNRZaazSyjwY3WAtR+g0XH4ddk3W
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

Now that callers have been updated to use the vfio_device APIs the driver
facing group interface is no longer used, delete it:

- vfio_group_get_external_user_from_dev()
- vfio_group_pin_pages()
- vfio_group_unpin_pages()
- vfio_group_iommu_domain()

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/vfio.c  | 151 -------------------------------------------
 include/linux/vfio.h |  11 ----
 2 files changed, 162 deletions(-)

diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index e6e102e017623b..3d75505bf3cc26 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1947,44 +1947,6 @@ struct vfio_group *vfio_group_get_external_user(struct file *filep)
 }
 EXPORT_SYMBOL_GPL(vfio_group_get_external_user);
 
-/*
- * External user API, exported by symbols to be linked dynamically.
- * The external user passes in a device pointer
- * to verify that:
- *	- A VFIO group is assiciated with the device;
- *	- IOMMU is set for the group.
- * If both checks passed, vfio_group_get_external_user_from_dev()
- * increments the container user counter to prevent the VFIO group
- * from disposal before external user exits and returns the pointer
- * to the VFIO group.
- *
- * When the external user finishes using the VFIO group, it calls
- * vfio_group_put_external_user() to release the VFIO group and
- * decrement the container user counter.
- *
- * @dev [in]	: device
- * Return error PTR or pointer to VFIO group.
- */
-
-struct vfio_group *vfio_group_get_external_user_from_dev(struct device *dev)
-{
-	struct vfio_group *group;
-	int ret;
-
-	group = vfio_group_get_from_dev(dev);
-	if (!group)
-		return ERR_PTR(-ENODEV);
-
-	ret = vfio_group_add_container_user(group);
-	if (ret) {
-		vfio_group_put(group);
-		return ERR_PTR(ret);
-	}
-
-	return group;
-}
-EXPORT_SYMBOL_GPL(vfio_group_get_external_user_from_dev);
-
 void vfio_group_put_external_user(struct vfio_group *group)
 {
 	vfio_group_try_dissolve_container(group);
@@ -2218,101 +2180,6 @@ int vfio_unpin_pages(struct vfio_device *vdev, unsigned long *user_pfn,
 }
 EXPORT_SYMBOL(vfio_unpin_pages);
 
-/*
- * Pin a set of guest IOVA PFNs and return their associated host PFNs for a
- * VFIO group.
- *
- * The caller needs to call vfio_group_get_external_user() or
- * vfio_group_get_external_user_from_dev() prior to calling this interface,
- * so as to prevent the VFIO group from disposal in the middle of the call.
- * But it can keep the reference to the VFIO group for several calls into
- * this interface.
- * After finishing using of the VFIO group, the caller needs to release the
- * VFIO group by calling vfio_group_put_external_user().
- *
- * @group [in]		: VFIO group
- * @user_iova_pfn [in]	: array of user/guest IOVA PFNs to be pinned.
- * @npage [in]		: count of elements in user_iova_pfn array.
- *			  This count should not be greater
- *			  VFIO_PIN_PAGES_MAX_ENTRIES.
- * @prot [in]		: protection flags
- * @phys_pfn [out]	: array of host PFNs
- * Return error or number of pages pinned.
- */
-int vfio_group_pin_pages(struct vfio_group *group,
-			 unsigned long *user_iova_pfn, int npage,
-			 int prot, unsigned long *phys_pfn)
-{
-	struct vfio_container *container;
-	struct vfio_iommu_driver *driver;
-	int ret;
-
-	if (!group || !user_iova_pfn || !phys_pfn || !npage)
-		return -EINVAL;
-
-	if (group->dev_counter > 1)
-		return -EINVAL;
-
-	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
-		return -E2BIG;
-
-	container = group->container;
-	driver = container->iommu_driver;
-	if (likely(driver && driver->ops->pin_pages))
-		ret = driver->ops->pin_pages(container->iommu_data,
-					     group->iommu_group, user_iova_pfn,
-					     npage, prot, phys_pfn);
-	else
-		ret = -ENOTTY;
-
-	return ret;
-}
-EXPORT_SYMBOL(vfio_group_pin_pages);
-
-/*
- * Unpin a set of guest IOVA PFNs for a VFIO group.
- *
- * The caller needs to call vfio_group_get_external_user() or
- * vfio_group_get_external_user_from_dev() prior to calling this interface,
- * so as to prevent the VFIO group from disposal in the middle of the call.
- * But it can keep the reference to the VFIO group for several calls into
- * this interface.
- * After finishing using of the VFIO group, the caller needs to release the
- * VFIO group by calling vfio_group_put_external_user().
- *
- * @group [in]		: vfio group
- * @user_iova_pfn [in]	: array of user/guest IOVA PFNs to be unpinned.
- * @npage [in]		: count of elements in user_iova_pfn array.
- *			  This count should not be greater than
- *			  VFIO_PIN_PAGES_MAX_ENTRIES.
- * Return error or number of pages unpinned.
- */
-int vfio_group_unpin_pages(struct vfio_group *group,
-			   unsigned long *user_iova_pfn, int npage)
-{
-	struct vfio_container *container;
-	struct vfio_iommu_driver *driver;
-	int ret;
-
-	if (!group || !user_iova_pfn || !npage)
-		return -EINVAL;
-
-	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
-		return -E2BIG;
-
-	container = group->container;
-	driver = container->iommu_driver;
-	if (likely(driver && driver->ops->unpin_pages))
-		ret = driver->ops->unpin_pages(container->iommu_data,
-					       user_iova_pfn, npage);
-	else
-		ret = -ENOTTY;
-
-	return ret;
-}
-EXPORT_SYMBOL(vfio_group_unpin_pages);
-
-
 /*
  * This interface allows the CPUs to perform some sort of virtual DMA on
  * behalf of the device.
@@ -2515,24 +2382,6 @@ int vfio_unregister_notifier(struct vfio_device *dev,
 }
 EXPORT_SYMBOL(vfio_unregister_notifier);
 
-struct iommu_domain *vfio_group_iommu_domain(struct vfio_group *group)
-{
-	struct vfio_container *container;
-	struct vfio_iommu_driver *driver;
-
-	if (!group)
-		return ERR_PTR(-EINVAL);
-
-	container = group->container;
-	driver = container->iommu_driver;
-	if (likely(driver && driver->ops->group_iommu_domain))
-		return driver->ops->group_iommu_domain(container->iommu_data,
-						       group->iommu_group);
-
-	return ERR_PTR(-ENOTTY);
-}
-EXPORT_SYMBOL_GPL(vfio_group_iommu_domain);
-
 /*
  * Module/class support
  */
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 91d46e532ca104..9a9981c2622896 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -140,8 +140,6 @@ int vfio_mig_get_next_state(struct vfio_device *device,
  */
 extern struct vfio_group *vfio_group_get_external_user(struct file *filep);
 extern void vfio_group_put_external_user(struct vfio_group *group);
-extern struct vfio_group *vfio_group_get_external_user_from_dev(struct device
-								*dev);
 extern bool vfio_external_group_match_file(struct vfio_group *group,
 					   struct file *filep);
 extern int vfio_external_user_iommu_id(struct vfio_group *group);
@@ -154,18 +152,9 @@ extern int vfio_pin_pages(struct vfio_device *vdev, unsigned long *user_pfn,
 			  int npage, int prot, unsigned long *phys_pfn);
 extern int vfio_unpin_pages(struct vfio_device *vdev, unsigned long *user_pfn,
 			    int npage);
-
-extern int vfio_group_pin_pages(struct vfio_group *group,
-				unsigned long *user_iova_pfn, int npage,
-				int prot, unsigned long *phys_pfn);
-extern int vfio_group_unpin_pages(struct vfio_group *group,
-				  unsigned long *user_iova_pfn, int npage);
-
 extern int vfio_dma_rw(struct vfio_device *vdev, dma_addr_t user_iova,
 		       void *data, size_t len, bool write);
 
-extern struct iommu_domain *vfio_group_iommu_domain(struct vfio_group *group);
-
 /* each type has independent events */
 enum vfio_notify_type {
 	VFIO_IOMMU_NOTIFY = 0,
-- 
2.35.1

