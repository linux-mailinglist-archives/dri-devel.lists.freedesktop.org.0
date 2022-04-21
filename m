Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B5B50A572
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 18:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3570C10E758;
	Thu, 21 Apr 2022 16:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2768410E218;
 Thu, 21 Apr 2022 16:28:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQ/2ZFLejbnejIfV3ya0BrIaRAquK/BBKuPGXgq3g+Z2k2iAxx0HniUZYQYA3RkTsUeTHJttNYBm0K8BQ7lzjIgkkbcWt0RrLqwW41PxI+RqfTdk4U4DPDevdJcvBNsChEB2EqMoRqi9qfTI7wJNo9pN+XhcE8mkD8HrUoOZHBvg25po9JaElywJXfSfS79Z5vocHE6zBP6CB/JbX4+i2rEo0u323fUW/XFX32LcdQ69fYu9AmXaKqH1vbe1RxEgWE1ISDv8SDzRJro1VYuFDy1bDGU/2OqAszy1rwCBSy4+vfAnMUESQ1Rp+aVHT8bcPxKTucAaWUqxCeNUSB6MYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbVOaJ0V4NV+PN2yzjHQXErdQPPlNnEkO4/VJR1NOKQ=;
 b=Dfc92FVS+108ovlHqELIAPcH26i1XCQzV1vOZflp82cRefjU7VTKdBp3vdssn86gaMIYjYi/NNOwZDCITCJzfR8BDKkaJL97WowQlQgLXA6ReCA5uhI2j82A8vq1ApeK5aIehFchueT8QEGvASjWbIPFWiZ6sjwRwHJlk30v+JgNkZQIdJPPNwRU8gSlm5/zZxhBysu9EmfaZaWQUoY78HEOkB98T1efKxpsu4lxtMqtJDw7ZlsA57KLiobfWcpWHFnaheDWPg6TBRDfiNOVHL5KCAIE1bbnOoHWZmeCulu40ryFHfCxJ20os0LFzX9cvis0BTSKbV5QWZyx3d6EqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbVOaJ0V4NV+PN2yzjHQXErdQPPlNnEkO4/VJR1NOKQ=;
 b=JkvWV1/zICrPRnV3YxCd7pcfN4LgoSyy9Y9q0LHgyincvVNhJ2DY0ENLDjuj01hkei0/DpHDycV+e/daIAJQbN2jeDK9noMVsdT7mEWODic4ueLZ2NFUWKDvJD/l9+zMNQbP6nq3sNieS+qfO2xFXEgA0nFremHEkUxZmSK3DqnePCJjiRnAMMspFIiGcIcBaBEv3hIUMBgswicWoatH8p7IevV8dLJFy4e57VLKgFrU6JK4j2cgssEXY0vmosdM/VrpZk7ELfx/yuNikPT8PV6aewean4z3va3yGM/FAFsVFmwNa9MGvPBoeejd1wsR3hSGHQwv6fmL1/Bv2eKr+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB2907.namprd12.prod.outlook.com (2603:10b6:5:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 16:28:42 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 16:28:42 +0000
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
Subject: [PATCH v2 7/7] vfio: Remove calls to vfio_group_add_container_user()
Date: Thu, 21 Apr 2022 13:28:38 -0300
Message-Id: <7-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:208:91::20) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2001af5b-4c11-4c69-2f51-08da23b3fea6
X-MS-TrafficTypeDiagnostic: DM6PR12MB2907:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB290761B96C68C159E863B724C2F49@DM6PR12MB2907.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J3FqGZvp+iFJKx+1vDVtw5/bg1eGeQu9+0AghpQ5N717ww8Jlto4/nygDX56eegaMLKPYAz7DRi8cBcX7rC8pW3rpPq6J1/WVc1Oq2FU4Gw3hWhbVDwA4X3y4S0608ICXT4osLtuEzKx2b7KMgo587mYCavKih6J/sfbFl2J3F65243kadMN0vy4ukzbDj+Q4jj0OLCBzEB40KRoasjCpE6jTkWdB//wrWZfnzXW4jIRlxXS/9UJOZgz28oucRpqzP4q/vFaM1AlyRCVDByJxpXhkrw8W/oobideO9wEBvSj9iq9hDJZq9YLr448MO5JskbcelrwuarTKzLUSUJtXpeBGnkB4FyNClyjP2JUkjxufeQ736iyROqYC3IZ6m5fgdOYbe3rQlkUAjzB/1SYgg4hZn+idBLZQ0eOpO3LqkpND7KXWtfsbvSIAqnqK4pUsxe90enHFpsI4InteEuw5KOQIvRGdXjfilf+RPVIeR3b49tfDvH2qpUtkGq9Yl/PFkmkkYqpPgja0UOXmyKQK0WKC9/pNgYTAs1XvceaRE00JOip3XK3NPSx9Qgmt9LYB4+DLG8lthcgj8vV5ch2u4UPbhDCq29u1XvOWQIcCXH8c78z7VU2LNiW+VVcNKeQya5Hnw0aRVrgtYw9wwAyg44bozoRzeH2SNj1H+RpFdGGRBHvFkoz8wIeT7oaHoMS1CEPUTJb2rqiiGGDOIWrrQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(6506007)(316002)(5660300002)(38100700002)(6512007)(54906003)(36756003)(66946007)(86362001)(186003)(921005)(110136005)(508600001)(8936002)(6666004)(2616005)(83380400001)(8676002)(7416002)(7406005)(66556008)(4326008)(26005)(2906002)(66476007)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2seeYSoi2u2IQwLifh/apfuLwQhufLLl+X/4mSw0ahJDCXUuMAn7+/XzERzT?=
 =?us-ascii?Q?yMQlou415UmgS6OavH77wxDw9/SHRZD/VHMm+FP9h5Cd4oenVKX1xgBqYrm7?=
 =?us-ascii?Q?KEw/CRK4LWKJVw1z55cd0hvFSUH+rzrIiY5VbeGyaKenTsOIeib6iJGi74Us?=
 =?us-ascii?Q?6kmr3pRJ1KxIxOd9ORAKB4IBENpOnSBl5GaZlQHlvuhERqPRzAnankANGR0m?=
 =?us-ascii?Q?eKRkcP+f9dSmYDBEmdI/HVxR8zUn/+iAtg77aJ9tvImeUyXyqpcv95rZ8jYR?=
 =?us-ascii?Q?q0KxE7hlqzcFVkxLMAfS9n6u/5Sbly0hzT8b6CnSoimwcnRHNkjDS3gqYfLd?=
 =?us-ascii?Q?DgPdERWTqoq4YR9Fp3LLiG9uRwvXxJ4tFEDJa65WC8i3cqktTKBXbLph3beN?=
 =?us-ascii?Q?0WHOE9AeYa+gZSvxJDK69rTLzbDAOyTxa97vNYokLq8UDNV2G3A4xdKIMWay?=
 =?us-ascii?Q?mr/OVTqmAESE2qRxVbzY6UARIVZ5qdvFv0dtUP+054cr6D6oK1OHBEKD9M/q?=
 =?us-ascii?Q?lKgmUPPtFpkBtZEZOUyRaYpO9yiU3YX61GzDj3W7xG2q7D1fmVyEp6U0yhL7?=
 =?us-ascii?Q?uWvfY5LV8As4tG2haBgjgqGoMdwxxp0GbLYx+AedgHg12lsb27HwywoVwd3Y?=
 =?us-ascii?Q?n+KI/kd3Etu0OoTOkJNSDW/8qYzaEaSpyKeZlELjxyKqRnQET62tQ9hKQsnW?=
 =?us-ascii?Q?M0t6Rptu3w1LpefFzBSdFwZbD++wvRd4uW7E5TzjptJv9CyO3vKuDOKbIh9w?=
 =?us-ascii?Q?xch/Noc2DzYdOSluFHO9WqUVrzGMn72IjImESY7ymAxRZ2Uf/DdRs6FsPsYW?=
 =?us-ascii?Q?kPHoSaJyx+UzwYZAKF6BF5Lo0v6km64VcEr7/69K/Mr6Kc5gDRHQ8jyfTato?=
 =?us-ascii?Q?gBavi0F58QPQ9xO3+uoxh/uxI4XqLLOYW/7w6Lcd2o3FSDxLz2Ka0VK2S/FH?=
 =?us-ascii?Q?EQ8EL+66GP6WksxZQfSvS8nEwEYZF+yHTK4HRGOjGJjru04LJ+HOlimaHP+I?=
 =?us-ascii?Q?TVqR2LP9QcnOQ2XUlCBDhkQRTCLCQU6Cy5QmVAJ3IcKfJLYnAPMEOhpJcjji?=
 =?us-ascii?Q?/MxKCOrN0VVwfPjpelPGEQyszyo9uKtR0vIOcRQN0TynnU1PJ4vY1uigJbvC?=
 =?us-ascii?Q?1lWiNbzWn4GJfwzU5ehcABpY94TZVVfLFKY1GVnJWP/x/rE4VoCMxuiCC8g+?=
 =?us-ascii?Q?v+LjvlIfz3yrkcQQRklK+tulNG/cHjqrBoRLC6raOntpVG70jkeIQL+x7s7f?=
 =?us-ascii?Q?b9CD1A4PgWEGHDUU1JH4aOVNDyYRv3A+IK68nZWTlBf7Xz9jwbXNAoXHBK+1?=
 =?us-ascii?Q?sFq8cvQL1xxjU33l4mATQF1L5qcg7LXRxys29TpdU6BfWGCVoo1QFBMQ76uH?=
 =?us-ascii?Q?fA1NeyYj2WjsJ0sKuLtWFGMGlFu/XYCOoL7Ar20LrsTVtbfKWnOUHmj4VduS?=
 =?us-ascii?Q?9Ix3+2zbCvRjh62PJAv/jzMg2NBRZjcHzWU8Dg/TPlwY5VplxOVqAT0pEBMH?=
 =?us-ascii?Q?lwSBsJkATeweuIauAK7bK5ILKkaRtQC8iI+dbP1k/TSYPyRDpYaScHgCNBpp?=
 =?us-ascii?Q?z8n9fiGUZMaOz8ET4wwHIVPNyEVR+dQ0n6C9HINtQX1g+9TqWFASwf3mzCts?=
 =?us-ascii?Q?5lpu7+DLwYcs1lWJz3f71LWppZIHWPFTj3XRb0QDU2hctaS2P/CaajNyREob?=
 =?us-ascii?Q?MZFCPb6s15CwYe62A+yQB8rIlqzAARE/xmqGjmKP4yzrw2wb2a7jVa1ibfs0?=
 =?us-ascii?Q?4uTjB4FnwA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2001af5b-4c11-4c69-2f51-08da23b3fea6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 16:28:40.6487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGwi+z9QkRxI48xbFq3q5zjqpNpfGV4ZiWbH/mfvaArGwHSgjdLlLzhhIPII483C
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

When the open_device() op is called the container_users is incremented and
held incremented until close_device(). Thus, so long as drivers call
functions within their open_device()/close_device() region they do not
need to worry about the container_users.

These functions can all only be called between open_device() and
close_device():

  vfio_pin_pages()
  vfio_unpin_pages()
  vfio_dma_rw()
  vfio_register_notifier()
  vfio_unregister_notifier()

Eliminate the calls to vfio_group_add_container_user() and add
vfio_assert_device_open() to detect driver mis-use.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/vfio.c | 78 +++++++++------------------------------------
 1 file changed, 15 insertions(+), 63 deletions(-)

diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index ba6fae95555ec7..b566ae3d320b36 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1330,6 +1330,12 @@ static int vfio_group_add_container_user(struct vfio_group *group)
 
 static const struct file_operations vfio_device_fops;
 
+/* true if the vfio_device has open_device() called but not close_device() */
+static bool vfio_assert_device_open(struct vfio_device *device)
+{
+	return !WARN_ON_ONCE(!READ_ONCE(device->open_count));
+}
+
 static int vfio_group_get_device_fd(struct vfio_group *group, char *buf)
 {
 	struct vfio_device *device;
@@ -1544,8 +1550,10 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
 	struct vfio_device *device = filep->private_data;
 
 	mutex_lock(&device->dev_set->lock);
-	if (!--device->open_count && device->ops->close_device)
+	vfio_assert_device_open(device);
+	if (device->open_count == 1 && device->ops->close_device)
 		device->ops->close_device(device);
+	device->open_count--;
 	mutex_unlock(&device->dev_set->lock);
 
 	module_put(device->dev->driver->owner);
@@ -2112,7 +2120,7 @@ int vfio_pin_pages(struct vfio_device *vdev, unsigned long *user_pfn, int npage,
 	struct vfio_iommu_driver *driver;
 	int ret;
 
-	if (!user_pfn || !phys_pfn || !npage)
+	if (!user_pfn || !phys_pfn || !npage || !vfio_assert_device_open(vdev))
 		return -EINVAL;
 
 	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
@@ -2121,10 +2129,6 @@ int vfio_pin_pages(struct vfio_device *vdev, unsigned long *user_pfn, int npage,
 	if (group->dev_counter > 1)
 		return -EINVAL;
 
-	ret = vfio_group_add_container_user(group);
-	if (ret)
-		return ret;
-
 	container = group->container;
 	driver = container->iommu_driver;
 	if (likely(driver && driver->ops->pin_pages))
@@ -2134,8 +2138,6 @@ int vfio_pin_pages(struct vfio_device *vdev, unsigned long *user_pfn, int npage,
 	else
 		ret = -ENOTTY;
 
-	vfio_group_try_dissolve_container(group);
-
 	return ret;
 }
 EXPORT_SYMBOL(vfio_pin_pages);
@@ -2156,16 +2158,12 @@ int vfio_unpin_pages(struct vfio_device *vdev, unsigned long *user_pfn,
 	struct vfio_iommu_driver *driver;
 	int ret;
 
-	if (!user_pfn || !npage)
+	if (!user_pfn || !npage || !vfio_assert_device_open(vdev))
 		return -EINVAL;
 
 	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
 		return -E2BIG;
 
-	ret = vfio_group_add_container_user(vdev->group);
-	if (ret)
-		return ret;
-
 	container = vdev->group->container;
 	driver = container->iommu_driver;
 	if (likely(driver && driver->ops->unpin_pages))
@@ -2174,8 +2172,6 @@ int vfio_unpin_pages(struct vfio_device *vdev, unsigned long *user_pfn,
 	else
 		ret = -ENOTTY;
 
-	vfio_group_try_dissolve_container(vdev->group);
-
 	return ret;
 }
 EXPORT_SYMBOL(vfio_unpin_pages);
@@ -2204,13 +2200,9 @@ int vfio_dma_rw(struct vfio_device *vdev, dma_addr_t user_iova, void *data,
 	struct vfio_iommu_driver *driver;
 	int ret = 0;
 
-	if (!data || len <= 0)
+	if (!data || len <= 0 || !vfio_assert_device_open(vdev))
 		return -EINVAL;
 
-	ret = vfio_group_add_container_user(vdev->group);
-	if (ret)
-		return ret;
-
 	container = vdev->group->container;
 	driver = container->iommu_driver;
 
@@ -2219,9 +2211,6 @@ int vfio_dma_rw(struct vfio_device *vdev, dma_addr_t user_iova, void *data,
 					  user_iova, data, len, write);
 	else
 		ret = -ENOTTY;
-
-	vfio_group_try_dissolve_container(vdev->group);
-
 	return ret;
 }
 EXPORT_SYMBOL(vfio_dma_rw);
@@ -2234,10 +2223,6 @@ static int vfio_register_iommu_notifier(struct vfio_group *group,
 	struct vfio_iommu_driver *driver;
 	int ret;
 
-	ret = vfio_group_add_container_user(group);
-	if (ret)
-		return -EINVAL;
-
 	container = group->container;
 	driver = container->iommu_driver;
 	if (likely(driver && driver->ops->register_notifier))
@@ -2245,9 +2230,6 @@ static int vfio_register_iommu_notifier(struct vfio_group *group,
 						     events, nb);
 	else
 		ret = -ENOTTY;
-
-	vfio_group_try_dissolve_container(group);
-
 	return ret;
 }
 
@@ -2258,10 +2240,6 @@ static int vfio_unregister_iommu_notifier(struct vfio_group *group,
 	struct vfio_iommu_driver *driver;
 	int ret;
 
-	ret = vfio_group_add_container_user(group);
-	if (ret)
-		return -EINVAL;
-
 	container = group->container;
 	driver = container->iommu_driver;
 	if (likely(driver && driver->ops->unregister_notifier))
@@ -2269,9 +2247,6 @@ static int vfio_unregister_iommu_notifier(struct vfio_group *group,
 						       nb);
 	else
 		ret = -ENOTTY;
-
-	vfio_group_try_dissolve_container(group);
-
 	return ret;
 }
 
@@ -2300,10 +2275,6 @@ static int vfio_register_group_notifier(struct vfio_group *group,
 	if (*events)
 		return -EINVAL;
 
-	ret = vfio_group_add_container_user(group);
-	if (ret)
-		return -EINVAL;
-
 	ret = blocking_notifier_chain_register(&group->notifier, nb);
 
 	/*
@@ -2313,25 +2284,6 @@ static int vfio_register_group_notifier(struct vfio_group *group,
 	if (!ret && set_kvm && group->kvm)
 		blocking_notifier_call_chain(&group->notifier,
 					VFIO_GROUP_NOTIFY_SET_KVM, group->kvm);
-
-	vfio_group_try_dissolve_container(group);
-
-	return ret;
-}
-
-static int vfio_unregister_group_notifier(struct vfio_group *group,
-					 struct notifier_block *nb)
-{
-	int ret;
-
-	ret = vfio_group_add_container_user(group);
-	if (ret)
-		return -EINVAL;
-
-	ret = blocking_notifier_chain_unregister(&group->notifier, nb);
-
-	vfio_group_try_dissolve_container(group);
-
 	return ret;
 }
 
@@ -2341,7 +2293,7 @@ int vfio_register_notifier(struct vfio_device *dev, enum vfio_notify_type type,
 	struct vfio_group *group = dev->group;
 	int ret;
 
-	if (!nb || !events || (*events == 0))
+	if (!nb || !events || (*events == 0) || !vfio_assert_device_open(dev))
 		return -EINVAL;
 
 	switch (type) {
@@ -2365,7 +2317,7 @@ int vfio_unregister_notifier(struct vfio_device *dev,
 	struct vfio_group *group = dev->group;
 	int ret;
 
-	if (!nb)
+	if (!nb || !vfio_assert_device_open(dev))
 		return -EINVAL;
 
 	switch (type) {
@@ -2373,7 +2325,7 @@ int vfio_unregister_notifier(struct vfio_device *dev,
 		ret = vfio_unregister_iommu_notifier(group, nb);
 		break;
 	case VFIO_GROUP_NOTIFY:
-		ret = vfio_unregister_group_notifier(group, nb);
+		ret = blocking_notifier_chain_unregister(&group->notifier, nb);
 		break;
 	default:
 		ret = -EINVAL;
-- 
2.36.0

