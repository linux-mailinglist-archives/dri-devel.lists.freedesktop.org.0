Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F25B51CD8E
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 02:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0889910FE33;
	Fri,  6 May 2022 00:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062.outbound.protection.outlook.com [40.107.236.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BB610FE0F;
 Fri,  6 May 2022 00:08:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AIJGH4P/HQ+5FgZT4GvfZapE13J18DlGcdAP9Ala3q6z4DdTWpQKDkOD7aLDLTwxArSOdt+cZst8TTSEOYolPw4HaxDKzMgYTNIWtQiS8Xz9TD0/Ss2oOH3CPZaDlZJiul7Q/rZPpBgzirjkIZGaxu1y6KzqgQ4MW3m9IMB0fVoTgBhiB1IafSOS4GeYnTRXzdSm8F/rGCkTaYB2FmO79fnQcLMY6PFPoUta8CnFgC1r6nBo9cu+9yi0J0oybpWbyvXZecNrd5xGLF/qmKrWPG2HX6MaYoyYEdUHTFSt7Hy8S8H6loq1r2weBYCjdetyPbY5aqnMS4bM6lgHmHBkwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wtrIJOQpRDgxcZmQdrCfkkxhbwhBQUNhRJIwP0ntSg=;
 b=bbPtS3l8Ck1RondQ3YTa6GZyFc40KTXCv9FIMKl378BocCTD0t0wx0ZPxGvHlSBHmiq5UqkMMGOQ+cKJIZu5kXPhHjQh8cweN6gniGDp7lLj1QbxqEPv5G3cgaYsCAKkd53EC+P/vY+ewY6qHAHBxQcj8/R2OHUUElbeYyxuEHUqTzL95j+ASGzizeZ7UkVGV7n+HdGEcEtXk4SPFrhXg5HmpXJCHsR81TS2RHnWEwS7VqRIBq1AF1upfQRgCpWuCEy7E5nuxhL4kiCX03Ez5p2hXmBjGH0mtQLUkS/uV+OnlMlIKsivcaryIwpc+HvLEVZ0RzlSrgOl9zL9i7+ITA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wtrIJOQpRDgxcZmQdrCfkkxhbwhBQUNhRJIwP0ntSg=;
 b=BRLPxmfHEnKHcLnsRMgCaU/RDHbICPlHFAjLd0mKOotL3dQAXEK3DxvUvscRSJ6KIODCpanFgceHHBpWtCZQzXqKDGEpmlbWNndw+amzLqV3ZzCTZ1nK8NW2PGl9s1nA58ZyzJIf+I3xLFkIkh6l7Vc8QpHoXGqslE0dpAI21E73tSyDEPeBVZP6Lh9eaALy6eAJIL6qmxURSlA0aKjAVaTPZkiEzEiLQX5HvF7KrZ8VkJQc0j3JYYxUccERNxZF1Mij8nfP1QGuzP68ny5NFx4LvEiEJLmkzt4J/P1RKXRhEtd8u0q6pQlBcCtbT+/TZ55ivlhYym/kSy4QrYZ+Ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BYAPR12MB2934.namprd12.prod.outlook.com (2603:10b6:a03:13b::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Fri, 6 May
 2022 00:08:51 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 00:08:51 +0000
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
Subject: [PATCH v4 6/7] vfio: Remove dead code
Date: Thu,  5 May 2022 21:08:44 -0300
Message-Id: <6-v4-8045e76bf00b+13d-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <0-v4-8045e76bf00b+13d-vfio_mdev_no_group_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR1501CA0036.namprd15.prod.outlook.com
 (2603:10b6:207:17::49) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de61833c-58dd-4461-b5c9-08da2ef497e3
X-MS-TrafficTypeDiagnostic: BYAPR12MB2934:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB2934CA1A800A06540BD69DDAC2C59@BYAPR12MB2934.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YQe9NBAPbSC9BTiexdHW6dzTJfK6WKvYratYWGCPOiEEq2Y+JDTCZUu1J6at0EnO/p1bZ909jg7ahTvM+g6SgnWYrDn0LH5Zt2j94IWX4jkkWpWQWgdxjkrAenkTLJJoWUlXimx3LEgNQcjLVcOp+ATdQ52wsXdf/zfXCpdbHJDI/AH0+uK3cL6szHidllV1NPuuYigLRpldIN3V7N6LVv+bhKaiBdDPPo5a3w92frOfInKBUca+P6Rue5xPMA/P/XTdEzhAihJ23p8Kmt/eCg9YvQLu4ZoNKsZxt1uXZJl3yJ4Y+0U7yTrBQ719qpS+ujypmcfJCUts9Wz1/10BkMW20L0BwWLXcpnBgNUD+F9BlKfu8VBKGcelTP1s8AcZQbyV1BwP4NN2gdCJDPUiynGwLl1dD8C0WhG1u0nNyyvq7ElwNBNgoiVcB/+997/kt0sKm9llzloyr8p+CFo1qTJuxfkyZ3iJrl/JbM21UQNDqVYxftfh0MvKPmeYSNJHY3LthvT1YXIHACvMoMma2zQFrItJDo5rXJQ3BRqbSqBlxuI4yaAAU6gUYsgVCVUX7+dNGjjI8zSYY9IYZXaetneTQ5m+wEPOC1MmYjsQtlQDf1z5YpYpJKbXK7vsXVQcUd7PD4JX+zyiqQ4lEfEgn8E5BJOA8TIwz/hfxVES4aeNJSW1Pe5weE/Qn6tAnJ3QgtsFQTh6Ns/Ohp4MdEj/4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(2906002)(66946007)(66556008)(54906003)(8676002)(86362001)(110136005)(4326008)(6486002)(38100700002)(508600001)(316002)(66476007)(6666004)(6512007)(6506007)(186003)(2616005)(921005)(26005)(7416002)(8936002)(83380400001)(7406005)(36756003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TN9n1k7Y5YMAgedRWhQbf8Vha2spycWVVuvg/Dp1WcqRpiArJPFpECnXHSYP?=
 =?us-ascii?Q?tZHlMPzg+kNRuYuOaWOMi6M0t4HH9KpsxDu2NcZOVMnZhk66cqyNue+zF0rx?=
 =?us-ascii?Q?cWD10Wcn+k7NOCg9D5WTrSuJHDajoLhhsx59w/kqcrBlfvnuAAiUCFAnjny3?=
 =?us-ascii?Q?pgy0bL7GncB7TmOikhvPRIam3ek/NUkbuRQ2DzQNhFrMOnwy73P54ayiV/oZ?=
 =?us-ascii?Q?mmdjDalZnJxbkUm8TwPGrHmhdci2BvkBUF9lKaQUGrIQlLqHwnhNhdDcBXwx?=
 =?us-ascii?Q?4Fg5kAiuKJu+s7iSZElApIH/Fd/Q6Ga8G5rEohz6h725JwcMa1DpRd4M3YP7?=
 =?us-ascii?Q?Et3pktwuO98nROmCTY+p4hWrjleECm7MFd4iw7wTtoEAfebtg9NsbfVAN1zy?=
 =?us-ascii?Q?QrpBcaXI1FscjgFQEzB+QBgubtHog8K575SVEq7ux/cMAL2lPUNYc7nhnOA4?=
 =?us-ascii?Q?O5pkCgvKNaZzpmSKTf2pgLrMhBrZQzF6S6Sxl1wfL4ANLsNSiOMIjcNMCFQr?=
 =?us-ascii?Q?HNIWjMh+wLfTuGXN1I9TUycu+lvuNnTSuwUPm0je5nFEXQFiF43CjvfcyGu6?=
 =?us-ascii?Q?zVnzGjlCTXBmj4vYCSBHogJ97V+QPFdYV1UDR1BWTO+rNrJJRwFyMJu2r/RD?=
 =?us-ascii?Q?fglI32T6f2u/TS1UeMaSFbvgmG1XJv7ln8BSxMe5mESLE+TuUJ9A2NMQqb46?=
 =?us-ascii?Q?H9m0erdTtA6dsTiDRzdTOAvXv3k3bjd7t5K7PpNQST+HClH3qiN4OI2IIcbH?=
 =?us-ascii?Q?mN1CAIGUPio195jSykzVg97G+fDE/Q75ansi9p1TFWC2GwjNPNQSuZnSmu3Q?=
 =?us-ascii?Q?Gd5XceGDg/H1ehW3pwaKKoTmnCpPnfy4iXMHvy36WIWi/GQJxwZuD56JpIuJ?=
 =?us-ascii?Q?7i3WFa3oBN+uqGG7wdoejwrgqL1wegj4tFsO5kC+wDtC0SP9kD604o2jqeoU?=
 =?us-ascii?Q?ECjdZ2DoaMd5GG4GJQ/qpVGb5fsP8NukjDs3MoeOvBIql9pU9qLWWgTNG6vf?=
 =?us-ascii?Q?Lda9ew6t6+5e1pNbYIHnoZY/q3E3W/HXj0ieIjbT1DD49jlsgnbay4U2GPjw?=
 =?us-ascii?Q?b9KuYKTFTWoJihfg30vU0wLrgNLmmdUUjtZxhVrUbZigUM9bJsKWpCh/c6yJ?=
 =?us-ascii?Q?xCuPeMNcsX2RL9be7Kovi7XlU5a4tT4Z1e9gcC8mEKwB7rrVPLdV1ldPKmeu?=
 =?us-ascii?Q?L/UX6tZhvFql9bDQqohj3wOslbAZomZM+cJHTE3gl1Xc/6guyfRSaMNlxfe4?=
 =?us-ascii?Q?6EqCL4QyVPydE8XqeYVbhXtOkjykMvQeAcdFlEC+/03UTqvXifrhIO60Dsv2?=
 =?us-ascii?Q?rT+e+YcAESEW4YTBdIbqTpSSft3Z/lfmXAko3TTxkxMf4kKc0sSbaJ4V8dc3?=
 =?us-ascii?Q?qiDhsje+/8kLxA0SyrZ6b6XWKSg1gJF89ft+/0XRPY3GIsrKUj30i5zJ4VjI?=
 =?us-ascii?Q?66y1x+hMMhPeSJjK5+yV8+Olga/8sGg4ya08qqpFRwPnafaXCdgaf4lbRptq?=
 =?us-ascii?Q?NBm3+dks4XMtvmw7FsC2szIoqp+SRuqTrDF8NuIrHtEfcDOfCS2mBTAfpQGw?=
 =?us-ascii?Q?/q6H5qygXASuQkd63k2wDq4U01E+NgUXdomxvkHtgocJe99Hge6nZzw8vSKE?=
 =?us-ascii?Q?JajN0Oy9HLB5oepPDQM5yGMOnd51GMxBr/kK2wfzOqIHoUa/bzy0bD88sJUf?=
 =?us-ascii?Q?0378ppeqqIv6S1ggfPF3snx3oYsHpk6yCKB/fmm3YQyi7vrPFU2k7uY0c2Mh?=
 =?us-ascii?Q?iZyRBR7NqA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de61833c-58dd-4461-b5c9-08da2ef497e3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 00:08:48.3714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4FgDQHxGUqPI/ygt2CgZC8bXthyuGBm7BtnxFjkJEz16uTBhwkHTBss/tfWeY+3u
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

Now that callers have been updated to use the vfio_device APIs the driver
facing group interface is no longer used, delete it:

- vfio_group_get_external_user_from_dev()
- vfio_group_pin_pages()
- vfio_group_unpin_pages()
- vfio_group_iommu_domain()

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
--
FIXME: vfio_group_put_external_user() is removable too when combined with the KVM series
---
 drivers/vfio/vfio.c  | 151 -------------------------------------------
 include/linux/vfio.h |  11 ----
 2 files changed, 162 deletions(-)

diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 85e1304099b8a5..c651c4805acd59 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1732,44 +1732,6 @@ struct vfio_group *vfio_group_get_external_user(struct file *filep)
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
@@ -2003,101 +1965,6 @@ int vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
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
@@ -2301,24 +2168,6 @@ int vfio_unregister_notifier(struct vfio_device *device,
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
index 8a151025871776..6195edd2edcd7b 100644
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
@@ -154,18 +152,9 @@ extern int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
 			  int npage, int prot, unsigned long *phys_pfn);
 extern int vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
 			    int npage);
-
-extern int vfio_group_pin_pages(struct vfio_group *group,
-				unsigned long *user_iova_pfn, int npage,
-				int prot, unsigned long *phys_pfn);
-extern int vfio_group_unpin_pages(struct vfio_group *group,
-				  unsigned long *user_iova_pfn, int npage);
-
 extern int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova,
 		       void *data, size_t len, bool write);
 
-extern struct iommu_domain *vfio_group_iommu_domain(struct vfio_group *group);
-
 /* each type has independent events */
 enum vfio_notify_type {
 	VFIO_IOMMU_NOTIFY = 0,
-- 
2.36.0

