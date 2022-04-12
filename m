Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 543794FE562
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 17:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1990510E6A7;
	Tue, 12 Apr 2022 15:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83B510E37F;
 Tue, 12 Apr 2022 15:53:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YY9zcyssM3PwfIdYdogYTRn5fIgnwaXb60ylq8YG2jzhzk+g7d8oNhN8BJ/gqytGLtUBJd4bnM1nqa2XtMq1c59CSJ71DP4pGGQRjT9y4aOLCXuaB8EucppRQE3IJ0rDMiIgw2XLGazZwFZciV9D3XfcC0Spdq2b8LLMpcenYY3r9lOUTI6p7P0Bsyhu4pL1/9veg4jrC2G68QhuS8F8AN+NOsyFPNhyEOoD0S2OpPpoHisHO9hCoA2//lebdd3vtk9UohkPCFor1oyYapvc2S1ETgjOc1Nbx+lmMyehU3mzLQnyWsYQKu42m4DH4QxyepZVTAz9Z2GDvie98SK0iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pL6fMmsy3sjaZPRWSMFgOEgjLTB+AnOQW85MOhaJYWU=;
 b=nRvH6/mII8p4TLT0Aql9BrC55BtEj/3NsT314/rf4Pzj88olYLHJvKCtWTRPoZrnwWOqUFcFNBVe0ssOWul510fCXTZ32VI3mEFfRNkJpuep38gA+HgafdmzyqI2nS53WuKXlpPROnkCtRGNK1FTjBb+FhL3G8gqQOYdKF0rbiq6YJ/DmGZjNScxdv6bwkDAPZ7GoGRgk6+hEG14U7mJjQoSUQrLUyZJ9zLDRvaFEU2AXZutlf33GsruGmK63sYVuaV26lhSJx9gdX8f7HzPK67cdycJC6xk9sZIIvZxLyR44zLcSxqb8ax7qDRDwwt3h14E5LX2uJ60Mk9CxPu10g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pL6fMmsy3sjaZPRWSMFgOEgjLTB+AnOQW85MOhaJYWU=;
 b=AFLwff/K+WGG2QPO8ZqJ+BfWpvlPt+84S+m1jzm6TM1YtLw/nmFD637+zWeW41K45ItlLNDOCbgBHThpR++RfrtbcoSIuBhFcZGk6pTS7Sk2H9vWunPaNcEZld/ZoOZ7Q0R6uQddwzfyRwu4kMFikNDfAsU91TFBiJwYlYH5GB3Omwxl6haqRTaEImM39lhQu1H6NqwTul9gZFj7PsxavqcyZ1HfEpR1jidFIlp1UZYfw5V27K9NLuVTOk6r7jYwmKm6Lb7lGpe4BsT8V6IIrOXGxKH7iPLtpWpgeUVTM7SfoqzMOB3FKOdjDAWOv89b9TDgI409t+YuryZf1usnnQ==
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
 15:53:39 +0000
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
Subject: [PATCH 9/9] vfio: Remove calls to vfio_group_add_container_user()
Date: Tue, 12 Apr 2022 12:53:36 -0300
Message-Id: <9-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <0-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:208:32e::17) To CH2PR12MB4181.namprd12.prod.outlook.com
 (2603:10b6:610:a8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adaa8adb-2860-4c57-f709-08da1c9c9c1d
X-MS-TrafficTypeDiagnostic: DM6PR12MB4172:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB417238C0D599DA740242A488C2ED9@DM6PR12MB4172.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sC43+zzKfIVxLbRhIEbF+OsW2Yb6wtlm4oKcbylG5oVe3A1Nt+YoqUKO10qYEmXb5FuaDWJvgf8LIQSHq5CA4ziG+iXcFwAk3cMdzsk4aU2Wk3s3QnoMTT00cbUf5VdSpiyNWcmTAYo6nduuVDu0yevimzm57y0qq4VBVFQ3hRtQ3oeIw5PJYMtPLfNhsbnAWCdHgSYiX819i5e9KAfHvTXQQv/szD4VzvismnZ2PKPq0dWjK1A1nHbUbJni77iStAHq1OHcHLY+6SS/W8sDV0bYlHhquZ3sHrFd5//wqu8T1+TdjxK+16lv+UYae2jX5Ni8qmMqk3c/L7bXQMnP6aVDgNzofZyIjOdM3iGIuKonLcBxUC9B3KSzEHwuIyBcTVQVzaFuA2Q0uTpVyEEHerbomF2PrpomUhoQ2tZ1ih2ktaDjTfm9RM8jpzDM5UdfUTG31CPD5/Ud1oLFkApgxxDlGkhuH+ub8Z52FN5zAPq64B955XCfACd9kHzC5ZllGYNqOu/OtNAqvY2PzCTBXoot33UXtdTvlW1m4QKg6yBQ1gp68kgkoX6ML6LhIWKGAC/RqqhhH7EyMszDmhd9Y7YwoCncsZM/gUKpZFg0yds3J5HRKEmzb+170UTDiImT89TlvyuuJK0+xgs6BLK/zlCLiToMfdXrGNmeAbTUyRd1/jnSmJRRdxwlP4Se8lHrxh4mkk8ru7p4JfpmFIA+DA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4181.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(6486002)(6506007)(6666004)(66946007)(66476007)(4326008)(66556008)(26005)(186003)(36756003)(83380400001)(8676002)(316002)(54906003)(86362001)(8936002)(6512007)(2616005)(921005)(110136005)(7416002)(5660300002)(38100700002)(2906002)(7406005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eWXmhOGX7sQUzgq5DYvFOHFc9HL3WGG9FlOIWFQp/F7GXODhKYyCBK0c6VM0?=
 =?us-ascii?Q?P//0+NSGg6D+QJSQlBN05jzptloikpGnWiahQ2TPAoesuXxQv9pI4RsvQvEc?=
 =?us-ascii?Q?B3OiKeA41xlP5VQ9ucPZNduU4SaR6t4EXP5MuKcRRPzkxpION9v5tAS9WHd8?=
 =?us-ascii?Q?qOnnDZFed80hFPFQfD45MngJ4kQfqMWIOGxkhaPackUp1Z4/AWcnLZ0xDpRu?=
 =?us-ascii?Q?db4864YQTGXMML6IG0U+DYGKuTHgOprI/2Um9Z23c0G7ethBGKzWfSfiVTTH?=
 =?us-ascii?Q?XiBf5kQtoDQ6LdUjubFHEziAQuU5NY3YukzmGiZxid/s9J+XmyEiryiT3/gG?=
 =?us-ascii?Q?NlXgYkcNNGG/xsjlOWNr6cUKlKxGbU4MROdq8+QbuW11t6B0x35TwaWxbgy7?=
 =?us-ascii?Q?6W/N37Ql/gUeqwFCfwZDDB6L2wrZdL7TWb3k9PugVpvt3MuKW52VSS/kpJud?=
 =?us-ascii?Q?LYognTLov63gT5YwBgWRhw0bIaQ4B4pTz/f/YQO5Citve25PVBMiV94Qbqoj?=
 =?us-ascii?Q?v/nC2oICphqfKZqdcRMJgRsCmSfUxc2pHbJL0v/rVW5FcGlCx+DEdrIRlZtT?=
 =?us-ascii?Q?c5woofJ+JfXZMbckta7wGFJzjQGocQPzqCN3oh/ajNoMKxLGEc/cy1C+KC2o?=
 =?us-ascii?Q?fhnkr7i+Kn5msicOLTcvPCIk/ncatchm/vYnS8fGB8PMA0evDXNuD37U3zWV?=
 =?us-ascii?Q?saWKxF1NNwO6rDmpRaIZoel0MSlvJRXQkAF9WwdTzafpAwS7iiexX9Hdg8dY?=
 =?us-ascii?Q?Xdf2Lehz0VwwCT2qXOqeKHVV7YVaSjfPocJCJSUT/jvxDTpkSHQFfderrQjO?=
 =?us-ascii?Q?I7ILKh5ouk8uhz/1W43H5Y5zNlk2hIT/nnqkC8PWAO+R249EIc8wOPckmG76?=
 =?us-ascii?Q?+CbtCazxbq8t3UlqVqF5WFxS/JId/wnBSIF2A9oS2jfHWhbM6pKCj+1YG4VM?=
 =?us-ascii?Q?vH75Pnb4TyzF00tDAdOqg23WuBPHLdD6buGp3KgY/WEFdwNyuSS+bPFyBwK0?=
 =?us-ascii?Q?uBbRvJyacrVpyRvsytymGdzdI7KDnOBDulzvAaaPX07KEal1M3MJhr2WhbIr?=
 =?us-ascii?Q?Nxv82extd4aO79usoBcNilKjq/YY7jFZ/eFdu4nDVlfnpMY3QlW+Giz9gLsW?=
 =?us-ascii?Q?jGhUMmyPCDaSbjr+0X/qSYFT2Qolh5aZitajz0vDv5sC/c8AwCTF2NM+RQmg?=
 =?us-ascii?Q?zPbYxiirF7zwsWbJV+THCAdv7AE9NW2n7dCuTMkuDwRJzaTZy0dxgeBv/2e4?=
 =?us-ascii?Q?l660C0GzlCB7MjRuTsAmW5oFuphs3ceCQf+sQUwXRFUGuqLXCwB7KOFJE2MW?=
 =?us-ascii?Q?AVqyCb1Korr9zE2mTxjGCaoqEeu4KaLencj7ROmmW9NNvhaIjncCRglyyg47?=
 =?us-ascii?Q?gph/8GnnRHiCUyAzBTkB03/B+EHKMbXyKO06wBqTzAALdazGvuMv8Z5PZ2Zn?=
 =?us-ascii?Q?x5680uJVw1pVW+OwO5bQTA6d+7IBCb94YdBiZkjo2MfKSy97uulZveIFXX/Y?=
 =?us-ascii?Q?9bH52FhbEQ09is9fc8tMaxju3jDLh1lf182WuI74+7/jxQHY34Zr92LbCYV0?=
 =?us-ascii?Q?MH3RBjoztrPkKv8wVStxexgFlrC8Yu4Ci2fdvNAFLt4oruqIGxqpM533JZNd?=
 =?us-ascii?Q?0+ZORXTCXqVkPiyLdLcmUHnpXR9EpaC/RVF3UfL4yTbyvSN/45gC/VdNhM4Z?=
 =?us-ascii?Q?Xgju9Qgg0qb85TG6E9lRTb1UATKT9pa386qPtlrq0joLuaxo/2D7ktxD35dg?=
 =?us-ascii?Q?REPLpsjXGQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adaa8adb-2860-4c57-f709-08da1c9c9c1d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4181.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 15:53:38.7281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6t5RNUhDQezu6Efm9GKlNGtZuKdLzzba4TDw0wrw376aZke9dJQ5mtNvC+Q8g1i
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

When the open_device() op is called the container_users is incremented and
held incremented until close_device(). Thus, so long as drivers call
functions within their open_device()/close_device() region they do not
need to worry about the container_users.

These functions can all only be called between
open_device()/close_device():

  vfio_pin_pages()
  vfio_unpin_pages()
  vfio_dma_rw()
  vfio_register_notifier()
  vfio_unregister_notifier()

So eliminate the calls to vfio_group_add_container_user() and add a simple
WARN_ON to detect mis-use by drivers.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/vfio.c | 67 +++++++++------------------------------------
 1 file changed, 13 insertions(+), 54 deletions(-)

diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 3d75505bf3cc26..ab0c3f5635905c 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -2121,9 +2121,8 @@ int vfio_pin_pages(struct vfio_device *vdev, unsigned long *user_pfn, int npage,
 	if (group->dev_counter > 1)
 		return -EINVAL;
 
-	ret = vfio_group_add_container_user(group);
-	if (ret)
-		return ret;
+	if (WARN_ON(!READ_ONCE(vdev->open_count)))
+		return -EINVAL;
 
 	container = group->container;
 	driver = container->iommu_driver;
@@ -2134,8 +2133,6 @@ int vfio_pin_pages(struct vfio_device *vdev, unsigned long *user_pfn, int npage,
 	else
 		ret = -ENOTTY;
 
-	vfio_group_try_dissolve_container(group);
-
 	return ret;
 }
 EXPORT_SYMBOL(vfio_pin_pages);
@@ -2162,9 +2159,8 @@ int vfio_unpin_pages(struct vfio_device *vdev, unsigned long *user_pfn,
 	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
 		return -E2BIG;
 
-	ret = vfio_group_add_container_user(vdev->group);
-	if (ret)
-		return ret;
+	if (WARN_ON(!READ_ONCE(vdev->open_count)))
+		return -EINVAL;
 
 	container = vdev->group->container;
 	driver = container->iommu_driver;
@@ -2174,8 +2170,6 @@ int vfio_unpin_pages(struct vfio_device *vdev, unsigned long *user_pfn,
 	else
 		ret = -ENOTTY;
 
-	vfio_group_try_dissolve_container(vdev->group);
-
 	return ret;
 }
 EXPORT_SYMBOL(vfio_unpin_pages);
@@ -2207,9 +2201,8 @@ int vfio_dma_rw(struct vfio_device *vdev, dma_addr_t user_iova,
 	if (!data || len <= 0)
 		return -EINVAL;
 
-	ret = vfio_group_add_container_user(vdev->group);
-	if (ret)
-		return ret;
+	if (WARN_ON(!READ_ONCE(vdev->open_count)))
+		return -EINVAL;
 
 	container = vdev->group->container;
 	driver = container->iommu_driver;
@@ -2219,9 +2212,6 @@ int vfio_dma_rw(struct vfio_device *vdev, dma_addr_t user_iova,
 					  user_iova, data, len, write);
 	else
 		ret = -ENOTTY;
-
-	vfio_group_try_dissolve_container(vdev->group);
-
 	return ret;
 }
 EXPORT_SYMBOL(vfio_dma_rw);
@@ -2234,10 +2224,6 @@ static int vfio_register_iommu_notifier(struct vfio_group *group,
 	struct vfio_iommu_driver *driver;
 	int ret;
 
-	ret = vfio_group_add_container_user(group);
-	if (ret)
-		return -EINVAL;
-
 	container = group->container;
 	driver = container->iommu_driver;
 	if (likely(driver && driver->ops->register_notifier))
@@ -2245,9 +2231,6 @@ static int vfio_register_iommu_notifier(struct vfio_group *group,
 						     events, nb);
 	else
 		ret = -ENOTTY;
-
-	vfio_group_try_dissolve_container(group);
-
 	return ret;
 }
 
@@ -2258,10 +2241,6 @@ static int vfio_unregister_iommu_notifier(struct vfio_group *group,
 	struct vfio_iommu_driver *driver;
 	int ret;
 
-	ret = vfio_group_add_container_user(group);
-	if (ret)
-		return -EINVAL;
-
 	container = group->container;
 	driver = container->iommu_driver;
 	if (likely(driver && driver->ops->unregister_notifier))
@@ -2269,9 +2248,6 @@ static int vfio_unregister_iommu_notifier(struct vfio_group *group,
 						       nb);
 	else
 		ret = -ENOTTY;
-
-	vfio_group_try_dissolve_container(group);
-
 	return ret;
 }
 
@@ -2300,10 +2276,6 @@ static int vfio_register_group_notifier(struct vfio_group *group,
 	if (*events)
 		return -EINVAL;
 
-	ret = vfio_group_add_container_user(group);
-	if (ret)
-		return -EINVAL;
-
 	ret = blocking_notifier_chain_register(&group->notifier, nb);
 
 	/*
@@ -2313,25 +2285,6 @@ static int vfio_register_group_notifier(struct vfio_group *group,
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
 
@@ -2344,6 +2297,9 @@ int vfio_register_notifier(struct vfio_device *dev, enum vfio_notify_type type,
 	if (!nb || !events || (*events == 0))
 		return -EINVAL;
 
+	if (WARN_ON(!READ_ONCE(dev->open_count)))
+		return -EINVAL;
+
 	switch (type) {
 	case VFIO_IOMMU_NOTIFY:
 		ret = vfio_register_iommu_notifier(group, events, nb);
@@ -2368,12 +2324,15 @@ int vfio_unregister_notifier(struct vfio_device *dev,
 	if (!nb)
 		return -EINVAL;
 
+	if (WARN_ON(!READ_ONCE(dev->open_count)))
+		return -EINVAL;
+
 	switch (type) {
 	case VFIO_IOMMU_NOTIFY:
 		ret = vfio_unregister_iommu_notifier(group, nb);
 		break;
 	case VFIO_GROUP_NOTIFY:
-		ret = vfio_unregister_group_notifier(group, nb);
+		ret = blocking_notifier_chain_unregister(&group->notifier, nb);
 		break;
 	default:
 		ret = -EINVAL;
-- 
2.35.1

