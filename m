Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA4551CD9A
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 02:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB38210FEDD;
	Fri,  6 May 2022 00:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062.outbound.protection.outlook.com [40.107.236.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15FB10FDF9;
 Fri,  6 May 2022 00:08:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ps3JYd1cyiiTCtSdl25iVwPwdc4M/cCqGP7Mq6+P2K8bF2MzVx3Mw6vypgNOE6qHaQJmYvlw7EvJe6Dy11oNkQcp3Fptj51ibUvbtRjibgKZdREeUogwqGMw5q8yCxV+BB/oghemv+HEPYVCnUopNJ68GA8bm1D9ozlWMsC7xxu9luqIfwFw4v0YS6xtljJWqgJMS6bQkbmdjRrXVsDHNuJimBPHIZoHYYpMCNDun0JHBusX1IzVF36msVzzJj88cRu15SfW4ZyYRNN/qepc0qREFEPgNP/lbLX/ZgS2BAQ/Vo/pSYMrQgWF/VKswueDnGDWNUJdOwCOuqoYAyEBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKgMH0C+sdZdX+Xl3LsrWj+gZJ/nBXyZObIa3eQ9eZM=;
 b=T8NdWD/iPa6bu5WablAAqNT3J3IkO6GIhiUs+UIzC2VwCEY2287DL+bbRppvPfhimJyT6RXk/rPsKyhvpEF5WS0BlExEP9wot7qSn27ZloukRLdOTkNLFE38KpnpOyyGktpeKwkU3kNQl3vHrG5XvkHnhXdroJYjQtMJqKjqCcl4/rlIL03pciSlmSAnXBeI7ztQsvWl/dn7uNxdDCqo80W6231D9TEsmpYVOu9L13ylMapLO9r8mxzUw1j0BX3GMCrVlcArDojUxHVvst8qMUjXg2G+nHXYBJo+iwK1lQecDC1R3IcgVUc47MQkeZoZ7EH5JU0ajqYEaMQkDic6pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKgMH0C+sdZdX+Xl3LsrWj+gZJ/nBXyZObIa3eQ9eZM=;
 b=mBQE/pAWn1osKhlZAHJ7lULDG9ZLthCQNF6V8RqxIoJvhRr9gmO1M0l1l0Qb01x5YGP/IOB2QLBaeRzsLb6Q+aaqbvgGeOMiAIocDQ/TuHqz7X8oUIDpHMXyyD3KRuIIfqGGR9Ne3RK1C56cMj72MUy4TTsWHhjcVBOJ/Rdvf8P3wMD1mHLngbxG0OneJW8VBsAsixwVWQzN6iw+TNhcX2jkYAh8PowdfyaK+nYWynyn947ZnkX62+o/+fzspP38uBckxwFQ9WmJwFTbHHNnt9s7C576cYcySUn/P/DjtYz9P31tSu4fC7+59fGWoVzKbiRhFrMkCqkajHvklV9JVw==
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
Subject: [PATCH v4 4/7] vfio/mdev: Pass in a struct vfio_device * to
 vfio_dma_rw()
Date: Thu,  5 May 2022 21:08:42 -0300
Message-Id: <4-v4-8045e76bf00b+13d-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <0-v4-8045e76bf00b+13d-vfio_mdev_no_group_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR1501CA0002.namprd15.prod.outlook.com
 (2603:10b6:207:17::15) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0affd359-3fca-4001-75aa-08da2ef49759
X-MS-TrafficTypeDiagnostic: BYAPR12MB2934:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB2934E3B67CF9787D17C931D8C2C59@BYAPR12MB2934.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zXS34a/bDPPYkuTo1Q0WywF5xF1I0H3H2+sXWUXtSszgsHfMv3p2F6Of+Pnan+9yzDzp9/OReQ6t4D6ZncvM0T2y+RDHaJ9LHb/Zh9HFfRF7PI1h6ZmAOVF4XFxXax0WIih8qtUvB2Pe+3hJTibyTR4ynZ4vMzbp7S37HOe420/0Qext3iDIzazfYYy1vhTZgfhvjEfYvSRkG71fLl1wNK2a3qjCtZRgSWboF4GwvVenguI+I1qD5W/4uUUsiIcbU3M9MqFaGuXT4656wHqYoQJ1HcXE+WQBYP+h15+bzSRGAfNcSBjJFHmm9fex3b9cbqfb7cKhbKayCg1tc4bJeD3XCmE5PI86l6UQ3nt/xMWAxjFDQYhYjl0Ekbkw3SHpePY16MXWy8+suG4nXU0tNHOMhMW+owP7HzZXODFh0MCVh0yC2jRkGTRvVTmSDkCfWywmiljb0XNvzDFxxRES9oy7UltdrjKfiMsO8gmenF4W3P6xH6XLLOHektz5VhjcvGh1qQ0ooG85+8/k9lVZxNg7y06m5IQGhiA+W5e3xxJN/oSzZhtlAhz1Y14RRK4EBBUqeihWt3eJXoeqDtEuqnB/npgFlaG9s/SNSQP76/aYD2t4XkWYUmdeD+7K+Wi53oRMZxJDrpgIkh9I3PDPcAthkwazc3NTK+iiQD3hS0sYrnqRtxoeXwElWSQz/m+LatjiJpXhJ9K3AOq0bnETGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(2906002)(66946007)(66556008)(54906003)(8676002)(86362001)(110136005)(4326008)(6486002)(38100700002)(508600001)(316002)(66476007)(6666004)(6512007)(6506007)(186003)(2616005)(921005)(26005)(7416002)(8936002)(83380400001)(7406005)(36756003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p88Q0GQQ4kiyeChsMliXvExb1zgjmfr5Cw8qL5L+AfP0ENP9QRwnzj1pPf1T?=
 =?us-ascii?Q?QB19ThEU8OGsM3P8cE2ecMTvFCQAev/F3AqWwRx7RF9x+JiHVxqpY5/n77nk?=
 =?us-ascii?Q?U/EblQ5YiswsfBzW6TNW/q8Yy+tx2VZ5f7jm1FrxbbBPFpTtbH+7AczlBgYk?=
 =?us-ascii?Q?S5dAcggZSZe1/y66nSYgKMGh5RJ8P97CT2KEjtQ66sU8HqKcxqBrpyhlbGUj?=
 =?us-ascii?Q?3P/Z4hA6Rn8CPJFBRR/ZoOJzI093Kkr6fAi5jn1hAHGv98AiW44uHXV5K2bW?=
 =?us-ascii?Q?ZqdtoIq31c7NYHbrQEGCziPcrPQaNYYv9wXvBb3AcJqah9eEYISIU4llCE/Y?=
 =?us-ascii?Q?oUr9FsFeVPqbEuNzrUSo43z7/3HxElsoW1Rc3718PM9QjsWks4Y/qgNZZ3xk?=
 =?us-ascii?Q?ygSXRJUTWmFAuhtphubn3K09FPeihKW/5ip1g7pnGR0h/uvhDx5r7ClB3Ix1?=
 =?us-ascii?Q?TRM6Y4SQusjIvRp7pYmMUdHh0bDMWTMHYYtFY7FP8BR6EmMjO3UlgiymbG8D?=
 =?us-ascii?Q?mz8nrvfwpSHeTuYTBJNH0iFkVIBAAxj7aK/cssre+XIABHC72k58ZvpvCFm1?=
 =?us-ascii?Q?ZOehFgXyrcn/d4LfegyJ7eUU+98wAR9VLitgtz54e5Yl+JP88nbo4AVXALaP?=
 =?us-ascii?Q?eytwgRWv0GxDt5u8U2d+o0CZFLihccD6lXYHZXNU8UsdIiGgpBVqeqXLviiX?=
 =?us-ascii?Q?XsX0wYXTIkcIiu0h9CQMw0jfeRTJNgKoIwf5R4pfH0CQakXmWoC59Dh4ZhPA?=
 =?us-ascii?Q?eYVBC9CY6vVJvMyW3oLrmF8fQ3scT2CJm1DWR4jShjIhgrg/l0QbMDr7lliG?=
 =?us-ascii?Q?fijEjoZlTpArs/rZ++fuKygdNKxdi/EO6jFUcTv3dbu77YHX9rjdDKuLUUM+?=
 =?us-ascii?Q?shVCoEtkaO4nTYGhNiYMgx78ztq6FH32Poixc+V6v8BhnQXOja7T/aL7fUUT?=
 =?us-ascii?Q?EOVMmgotSkJOU3y16V99ptb3zHoc9tBQ+ZFckW57gpZE1fJxvcJeivpWN74C?=
 =?us-ascii?Q?IBk2YRIKDvGhSZhA2/28ZKpgxcepZVHvH7wjQxGiC5WTY7FhsaYRgkd32jHN?=
 =?us-ascii?Q?OcGLFRc5RXCKU/NlJ4gFOLPfauw6RE3l65yVAz3oFLyCgoFFMTTF32zvYbrV?=
 =?us-ascii?Q?eU/80E+nlKQb0f2DVisRQSyHdQbEzTEIBBmq4Oa3NgEAuzlSQ/2U8nhu57BV?=
 =?us-ascii?Q?BqrsvLyPE95Ksqb/FjjRU7R6/s4HjXPuV00UKZARkF8QS7z/bNoxpbFve6Ob?=
 =?us-ascii?Q?rGjvL5WYNEIOJGHPtkZnblCI+I04Ibbt4EckULcKHn0ad1lbU99jkV7rbTIt?=
 =?us-ascii?Q?CmU9atGBnHO2YwOTfOL2iDLUD5szmtYY451I8iy6LmGYIGTgr3Isv5/xCkCn?=
 =?us-ascii?Q?R1JMqFCp6jNFJu2kjGFYRxq+q2SNyLG2j8u5BCRidab5jfa0nzXAMBGgFszE?=
 =?us-ascii?Q?RzxVsmLK78Tmisd1osNavwYAaZ9hUgE4iKXh8Sk3qbyNpovB/Ugw2GfYEty8?=
 =?us-ascii?Q?J86mC7RoSm3nokR6/juvKiZQWMSuriHZlLtk4TUzmEU8U8RUWT1gdtGguj0+?=
 =?us-ascii?Q?i4/4q7Q8eRC2Kt4BlF/07JDPa7uYVAGfpDhSgOzdrPOIVDQvpbMdafl7lvOK?=
 =?us-ascii?Q?9SOlwUdmmWdV9MkDGdEuOo1mranknqo87iZk7wR6s1T/qbGzBzzZAgZlo7IR?=
 =?us-ascii?Q?aHC8+nzuKTKTpepm1qFO0EMQsQkmn2FI+o9kyf1d/IsO9UtpDOqcWcfSBsac?=
 =?us-ascii?Q?YXIrzwdo/Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0affd359-3fca-4001-75aa-08da2ef49759
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 00:08:47.4028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4raNAuH7sGGQzFLa9VsF5OhfvyTnqnHCK4XlB9iHsY0Ie5dhchtONGMo5Ms3kuO
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

Every caller has a readily available vfio_device pointer, use that instead
of passing in a generic struct device. Change vfio_dma_rw() to take in the
struct vfio_device and move the container users that would have been held
by vfio_group_get_external_user_from_dev() to vfio_dma_rw() directly, like
vfio_pin/unpin_pages().

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/gvt.h |  4 ++--
 drivers/vfio/vfio.c            | 24 +++++++++++-------------
 include/linux/vfio.h           |  2 +-
 3 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 03ecffc2ba56a9..5a28ee965b7f3e 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -732,7 +732,7 @@ static inline int intel_gvt_read_gpa(struct intel_vgpu *vgpu, unsigned long gpa,
 {
 	if (!vgpu->attached)
 		return -ESRCH;
-	return vfio_dma_rw(vgpu->vfio_group, gpa, buf, len, false);
+	return vfio_dma_rw(&vgpu->vfio_device, gpa, buf, len, false);
 }
 
 /**
@@ -750,7 +750,7 @@ static inline int intel_gvt_write_gpa(struct intel_vgpu *vgpu,
 {
 	if (!vgpu->attached)
 		return -ESRCH;
-	return vfio_dma_rw(vgpu->vfio_group, gpa, buf, len, true);
+	return vfio_dma_rw(&vgpu->vfio_device, gpa, buf, len, true);
 }
 
 void intel_gvt_debugfs_remove_vgpu(struct intel_vgpu *vgpu);
diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 93caab1f29dbd7..85e1304099b8a5 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -2108,32 +2108,28 @@ EXPORT_SYMBOL(vfio_group_unpin_pages);
  * As the read/write of user space memory is conducted via the CPUs and is
  * not a real device DMA, it is not necessary to pin the user space memory.
  *
- * The caller needs to call vfio_group_get_external_user() or
- * vfio_group_get_external_user_from_dev() prior to calling this interface,
- * so as to prevent the VFIO group from disposal in the middle of the call.
- * But it can keep the reference to the VFIO group for several calls into
- * this interface.
- * After finishing using of the VFIO group, the caller needs to release the
- * VFIO group by calling vfio_group_put_external_user().
- *
- * @group [in]		: VFIO group
+ * @device [in]		: VFIO device
  * @user_iova [in]	: base IOVA of a user space buffer
  * @data [in]		: pointer to kernel buffer
  * @len [in]		: kernel buffer length
  * @write		: indicate read or write
  * Return error code on failure or 0 on success.
  */
-int vfio_dma_rw(struct vfio_group *group, dma_addr_t user_iova,
-		void *data, size_t len, bool write)
+int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova, void *data,
+		size_t len, bool write)
 {
 	struct vfio_container *container;
 	struct vfio_iommu_driver *driver;
 	int ret = 0;
 
-	if (!group || !data || len <= 0)
+	if (!data || len <= 0)
 		return -EINVAL;
 
-	container = group->container;
+	ret = vfio_group_add_container_user(device->group);
+	if (ret)
+		return ret;
+
+	container = device->group->container;
 	driver = container->iommu_driver;
 
 	if (likely(driver && driver->ops->dma_rw))
@@ -2142,6 +2138,8 @@ int vfio_dma_rw(struct vfio_group *group, dma_addr_t user_iova,
 	else
 		ret = -ENOTTY;
 
+	vfio_group_try_dissolve_container(device->group);
+
 	return ret;
 }
 EXPORT_SYMBOL(vfio_dma_rw);
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index bddc70f88899c3..8a151025871776 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -161,7 +161,7 @@ extern int vfio_group_pin_pages(struct vfio_group *group,
 extern int vfio_group_unpin_pages(struct vfio_group *group,
 				  unsigned long *user_iova_pfn, int npage);
 
-extern int vfio_dma_rw(struct vfio_group *group, dma_addr_t user_iova,
+extern int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova,
 		       void *data, size_t len, bool write);
 
 extern struct iommu_domain *vfio_group_iommu_domain(struct vfio_group *group);
-- 
2.36.0

