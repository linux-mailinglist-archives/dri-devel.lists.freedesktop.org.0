Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B052260D414
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 20:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF7C10E420;
	Tue, 25 Oct 2022 18:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F067B10E1E9;
 Tue, 25 Oct 2022 18:50:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTg+yqVHYDeZT2PbMjnQvbXd8U6Zu0oWcyVhlJDhyaxkoL77Gty8fW0lvBIwZrTvn2l6bzWsQ7aioWmU36ZNKq8ct2k+lNDCAWFwYIko6VA7P6Q/d7tEOvz/jLX75zSvrw3xKMI3g91IjlmbYnE8ZZEfIollC0xK7kQXa9eTX6ZR01i/8WC8WWPkuNMfSFt32fY0T/Rs/yS6ZCJYyctLvrI7lTD6uszQP/FLOI9qwQ5CZbqPkElByMOUELf0Y+6dvVvj3LNMEXsiDuL6Vr1NERh6kItd7SfY+zzvek3PdZJRFdJkuIAJe44pCfwODSTD5VxQCeEkFtfBRWe+5H+pQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fe12dM7oPskbgYykdQKNIWZAqpNCVzbXp9YmebaFkFw=;
 b=d3l10+Le3lD2urOrKIRIY0Wb4FjFHiUBhNwweF2HIEU6fmHpMJj0b7UM37T799VifeG/nmpEjeFUrZhql9I56G8XuOQXrtKD5M32PgaZ2KZxIW1hNls9sTAnJL/7nsUPKIcOQIYzqM9BzgG2nbCzlNizy3uNC/Q4MNtnO7oXVREGZnxNuCRdIslXjh/IIIf69ssrE0QNWqUPqHLJvC6a5a5zylWecud62IuD3MKP7IZiTXd6Z81r4xN7LxpicoKdnGuhoLKjz/J5heG1I2P/vYB3Xusa2KuSsDWo5jT8Ecd/sx1rEJ9azhMAnvTRrqHvhsQxhFSKhnmoHNuMfUcRGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fe12dM7oPskbgYykdQKNIWZAqpNCVzbXp9YmebaFkFw=;
 b=iKBFLHds+xT7MnAnbyPy4yqRvdwGUk7qTb4Mqtb24WiSep9FhMHUhY0kLM3RnlyiBnk8Fw5rFIfx8ZvyI7CmjuTuAD6Udv6NPrtf0Z2gbs0UnOR6hNVqrrvxr0s5ADO7Sk2laZhK5pSo/82qH/rVYTCFXZVaj9UUA3uM4j3R0NBP6nZVGDIFwRRN1rE2bWLM0yaE4kSHLZ5BWkIxws2kRoTUkce+Tf5P26WNm9qx71eODn2o3zONoQ8pmsW4sPkRekpfa2yHQZMasEsghv37DSmyI1RtsY2xAvTto6iNwN48pJf9sao3u7D9qKNpAvF0hPn1q+k540a9Wt0Wafukzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH8PR12MB6938.namprd12.prod.outlook.com (2603:10b6:510:1bd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Tue, 25 Oct
 2022 18:50:48 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5746.021; Tue, 25 Oct 2022
 18:50:48 +0000
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
Subject: [PATCH 06/10] vfio-iommufd: Allow iommufd to be used in place of a
 container fd
Date: Tue, 25 Oct 2022 15:50:41 -0300
Message-Id: <6-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0083.namprd02.prod.outlook.com
 (2603:10b6:208:51::24) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH8PR12MB6938:EE_
X-MS-Office365-Filtering-Correlation-Id: fb161d99-b9b3-4d21-ee18-08dab6b9d442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jZgqSOQVGdMdrzvGHuN+xg3Qo/qBwJo4j7rt0xTPtj5CG66SpH4ojKoSLzTTYTueB2t+zVb96eYnfdWj4OUH7O6omJ6vzeRRJt46x6hQJ/KY/NCIaclYScZVaitX9wj0MRQtYCKJ7aAs4F5FYHG0FmcuASkveVwmVkCpXbnWkQeVdObVOtVqg0uwOHtqldIY6XZEd1+cD3tbKaUDvjxqx9Q2hf11qxrk9JYb+pxwMXhtmWmTksne+IVPQxLSSa5ppsYIYdJ5BToXk1NU0HfpVj88kJNsnotKfiyvOzvpX3TgYU4uw1kDqStSG4SkGo9vcgwwjK/mg6feGYrnGH1NyAMI1q0A1HWJb6fAVgPZG1jZqEGLDo9ACeLjJKw5lJt3Ja8vLJ/jWjQWw++NO+25sZGl2O3UCCo2b0SSI6qCMJWbRwwMLIXqmMFAyGv8VUD8Fyrj6zqt48k/MX+nUIw1a7da1BQO8scLYjGgqpfKK/HQsf3dscVZmPetXfMTNrWKPTYeO7u52sPTrQHP0BDJoZQpEtXoe1EyUp54RtIJb8d4Z9lm4uA3BcYyhw7eRuxZcslUCsT5UAY8zDGsPur0UYlr+BKCj9fLaQdmOrNA/+n7H4+oHK0/JrEfZKr+gbbk5RvPNTG3OaK7Dvy+5rIZkpKwDLO09ct5L5Dfq1S8BZzIAph5g7Vv9IMTdavBfr1vFj0HzzODXez3XHn7zN3JKGyHl8kHBUzqqjMWom0F7uec7T+3vdLXFXoD8rGQsreR33JMY/vSgcvKvZG9+KBc3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(451199015)(86362001)(38100700002)(921005)(6486002)(8936002)(7406005)(7416002)(5660300002)(2906002)(478600001)(6666004)(316002)(4326008)(8676002)(66946007)(66476007)(66556008)(110136005)(54906003)(41300700001)(83380400001)(26005)(6512007)(6506007)(2616005)(186003)(36756003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3dHEJ+8u0Rpu8Oq7UDBiS9yO6JRv39K5WmXfDrjtEcftirbdl7uKQ0ozHztB?=
 =?us-ascii?Q?CiDFMKbU6zG0s2uNhQKiEqPBkYhNgAwcH3hwO/nCD2skfLm5TMOnrKJpDZVV?=
 =?us-ascii?Q?lE5eEUh3X6cbI/8EY9+Q37vJYKDQ2XRVD704YbREuhgrOwXDlOf8GNFKTZXb?=
 =?us-ascii?Q?MTnYkjkRV1cnt2PbHQ005d6k5hqTGJ+8ad8yvbC9RilzRCbYzqNA/xI7jGfC?=
 =?us-ascii?Q?W68OH09vPF75NG0WDFSbDQxU7sVdP/R5/45uJKpR21S75JDP4sUiwDFKX33v?=
 =?us-ascii?Q?7EA84HCyzFpV5jAnXLjDe5UdkeYF/0jAF+SDTFeYtAc+Hex38bkwZ+HrFaKu?=
 =?us-ascii?Q?BG/2uPaR04j2sD6pkk3ciUKfIhfUYIPZjJU9F/CjM63tYCoJzHVP5Riax/jM?=
 =?us-ascii?Q?Xl8ycLI0Eid9GjNap+X9oS3QjlDyAVZFZrlDg+3dzILNRtsk+pfB745S3VU7?=
 =?us-ascii?Q?Ghuiiofrbh7LGFcD4qGz/hWjRfJ6Ly9YwLmLtkwvdorEacOQbYmz9OHcJRpN?=
 =?us-ascii?Q?iXwgIjU4w9Jt3jZr6jj3MyTcpQoH3gRpj5AtN2P0MqxrQJZvyFHrQJJ7aexi?=
 =?us-ascii?Q?BkhsDHcD0OklmiO/XWICVpjYchO8bljVXWpu30e5KkCg9pDKPRMbUWIhD09I?=
 =?us-ascii?Q?5+UMDsKqCHg2FLN0IMq0/dcJZYWkfU+KC7tdqWRu717yHwDhgTmC1Cn1g0u4?=
 =?us-ascii?Q?beeEZ3SCTv6qZPpJRFLUoMSyWaKem70ZOmoEyfC543sKxVnpDpSE1unx4ITe?=
 =?us-ascii?Q?/yxIDDpeXG4MwBuYBLxk5yJFFwSinqihY+qtTTW32fGbUbFL8c9uuydpuU7m?=
 =?us-ascii?Q?qnxrQD9XcBzQ6PU9SRMH2Bwm5/Bf+S44WQPmalHZBvOp3BRWvfH3Uz5O1pJp?=
 =?us-ascii?Q?7NmRW5ZwF9uDbsnx4CynPLnRJFrdnVVIqu4JHdHnq4NsUi8vZ2V7Bo+RJuML?=
 =?us-ascii?Q?TEG+Xa0L6VQLvKkw9sL3Yj2a5L/OpBAAVswZ7ChK+8UJ6hnc4XvLe5QE6/Il?=
 =?us-ascii?Q?wdUehu7K5/vtajT/8wqKSrMCbhBOsi+MQUsCuM7Qcsbon/Q/gz+CsVMJj6Xr?=
 =?us-ascii?Q?O3X51kMQfB76EXepTfQDDnaxcEIEng1EGgIKqLm9Rgie+OgARoWw6De4DKhr?=
 =?us-ascii?Q?FKtediu5+lDjKWegZihZZLZh0Rg2W4X3mxv50iMzRow/CcJvyESMFjHq80bl?=
 =?us-ascii?Q?Ybq8gChD65Vw3oZkXgtDaaAqEab8q12GMWJoFkEpC3TkaQS2kVJd5jtp9Ze7?=
 =?us-ascii?Q?KTfCz7uFM0k0j0TElPGImngtI8Qsz0iXYFrUc0DFDLswZNMWfmK2en3oZ4Wp?=
 =?us-ascii?Q?rgfsnZGeJmtnJmoPwbSR+QoYQ8K8DFPtT529GR5wLkuAcFWLNDs4zHOBAmyR?=
 =?us-ascii?Q?v7yIg9V/4qhY9D+hrFDHtySN6ttiKrir+C0TbY0wC67KwCX6OrSCByHHzqeI?=
 =?us-ascii?Q?d46X2sc6l1846sf7awV7A1Za7QjC7qJJunaWAS8n4asWJ47FzH8bh4BOmdxV?=
 =?us-ascii?Q?rxTtqeP/sYeRdy5z9NFRVe5jar4tg5L8k4zXRAZPKCVJEEeTZgp+WtSGQnhF?=
 =?us-ascii?Q?OwBRmKqqN97JyuQJ6bk=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb161d99-b9b3-4d21-ee18-08dab6b9d442
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 18:50:47.6626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Q8nY0lQ5ACMq7AKcN37q0UflMaslK1NycgT5y21tqJZQ+GG3SCE6ARaztR5Nldj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6938
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
Cc: Yi Liu <yi.l.liu@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This makes VFIO_GROUP_SET_CONTAINER accept both a vfio container FD and an
iommufd.

In iommufd mode an IOAS will exist after the SET_CONTAINER, but it will
not be attached to any groups.

From a VFIO perspective this means that the VFIO_GROUP_GET_STATUS and
VFIO_GROUP_FLAGS_VIABLE works subtly differently. With the container FD
the iommu_group_claim_dma_owner() is done during SET_CONTAINER but for
IOMMFD this is done during VFIO_GROUP_GET_DEVICE_FD. Meaning that
VFIO_GROUP_FLAGS_VIABLE could be set but GET_DEVICE_FD will fail due to
viability.

As GET_DEVICE_FD can fail for many reasons already this is not expected to
be a meaningful difference.

Reorganize the tests for if the group has an assigned container or iommu
into a vfio_group_has_iommu() function and consolidate all the duplicated
WARN_ON's etc related to this.

Call container functions only if a container is actually present on the
group.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/Kconfig     |  1 +
 drivers/vfio/container.c |  7 ++--
 drivers/vfio/vfio.h      |  2 ++
 drivers/vfio/vfio_main.c | 76 ++++++++++++++++++++++++++++++++--------
 4 files changed, 69 insertions(+), 17 deletions(-)

diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
index 86c381ceb9a1e9..1118d322eec97d 100644
--- a/drivers/vfio/Kconfig
+++ b/drivers/vfio/Kconfig
@@ -2,6 +2,7 @@
 menuconfig VFIO
 	tristate "VFIO Non-Privileged userspace driver framework"
 	select IOMMU_API
+	depends on IOMMUFD || !IOMMUFD
 	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64)
 	select INTERVAL_TREE
 	help
diff --git a/drivers/vfio/container.c b/drivers/vfio/container.c
index d97747dfb05d02..8772dad6808539 100644
--- a/drivers/vfio/container.c
+++ b/drivers/vfio/container.c
@@ -516,8 +516,11 @@ int vfio_group_use_container(struct vfio_group *group)
 {
 	lockdep_assert_held(&group->group_lock);
 
-	if (!group->container || !group->container->iommu_driver ||
-	    WARN_ON(!group->container_users))
+	/*
+	 * The container fd has been assigned with VFIO_GROUP_SET_CONTAINER but
+	 * VFIO_SET_IOMMU hasn't been done yet.
+	 */
+	if (!group->container->iommu_driver)
 		return -EINVAL;
 
 	if (group->type == VFIO_NO_IOMMU && !capable(CAP_SYS_RAWIO))
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 247590334e14b0..985e13d52989ca 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -10,6 +10,7 @@
 #include <linux/cdev.h>
 #include <linux/module.h>
 
+struct iommufd_ctx;
 struct iommu_group;
 struct vfio_device;
 struct vfio_container;
@@ -60,6 +61,7 @@ struct vfio_group {
 	struct kvm			*kvm;
 	struct file			*opened_file;
 	struct blocking_notifier_head	notifier;
+	struct iommufd_ctx		*iommufd;
 };
 
 /* events for the backend driver notify callback */
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index a8d1fbfcc3ddad..cf0ea744de931e 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -35,6 +35,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/interval_tree.h>
 #include <linux/iova_bitmap.h>
+#include <linux/iommufd.h>
 #include "vfio.h"
 
 #define DRIVER_VERSION	"0.3"
@@ -665,6 +666,16 @@ EXPORT_SYMBOL_GPL(vfio_unregister_group_dev);
 /*
  * VFIO Group fd, /dev/vfio/$GROUP
  */
+static bool vfio_group_has_iommu(struct vfio_group *group)
+{
+	lockdep_assert_held(&group->group_lock);
+	if (!group->container)
+		WARN_ON(group->container_users);
+	else
+		WARN_ON(!group->container_users);
+	return group->container || group->iommufd;
+}
+
 /*
  * VFIO_GROUP_UNSET_CONTAINER should fail if there are other users or
  * if there was no container to unset.  Since the ioctl is called on
@@ -676,15 +687,21 @@ static int vfio_group_ioctl_unset_container(struct vfio_group *group)
 	int ret = 0;
 
 	mutex_lock(&group->group_lock);
-	if (!group->container) {
+	if (!vfio_group_has_iommu(group)) {
 		ret = -EINVAL;
 		goto out_unlock;
 	}
-	if (group->container_users != 1) {
-		ret = -EBUSY;
-		goto out_unlock;
+	if (group->container) {
+		if (group->container_users != 1) {
+			ret = -EBUSY;
+			goto out_unlock;
+		}
+		vfio_group_detach_container(group);
+	}
+	if (group->iommufd) {
+		iommufd_ctx_put(group->iommufd);
+		group->iommufd = NULL;
 	}
-	vfio_group_detach_container(group);
 
 out_unlock:
 	mutex_unlock(&group->group_lock);
@@ -695,6 +712,7 @@ static int vfio_group_ioctl_set_container(struct vfio_group *group,
 					  int __user *arg)
 {
 	struct vfio_container *container;
+	struct iommufd_ctx *iommufd;
 	struct fd f;
 	int ret;
 	int fd;
@@ -707,7 +725,7 @@ static int vfio_group_ioctl_set_container(struct vfio_group *group,
 		return -EBADF;
 
 	mutex_lock(&group->group_lock);
-	if (group->container || WARN_ON(group->container_users)) {
+	if (vfio_group_has_iommu(group)) {
 		ret = -EINVAL;
 		goto out_unlock;
 	}
@@ -717,12 +735,23 @@ static int vfio_group_ioctl_set_container(struct vfio_group *group,
 	}
 
 	container = vfio_container_from_file(f.file);
-	ret = -EINVAL;
 	if (container) {
 		ret = vfio_container_attach_group(container, group);
 		goto out_unlock;
 	}
 
+	iommufd = iommufd_ctx_from_file(f.file);
+	if (!IS_ERR(iommufd)) {
+		u32 ioas_id;
+
+		group->iommufd = iommufd;
+		ret = iommufd_vfio_compat_ioas_id(iommufd, &ioas_id);
+		goto out_unlock;
+	}
+
+	/* The FD passed is not recognized. */
+	ret = -EBADF;
+
 out_unlock:
 	mutex_unlock(&group->group_lock);
 	fdput(f);
@@ -752,9 +781,16 @@ static int vfio_device_first_open(struct vfio_device *device)
 	 * it during close_device.
 	 */
 	mutex_lock(&device->group->group_lock);
-	ret = vfio_group_use_container(device->group);
-	if (ret)
+	if (!vfio_group_has_iommu(device->group)) {
+		ret = -EINVAL;
 		goto err_module_put;
+	}
+
+	if (device->group->container) {
+		ret = vfio_group_use_container(device->group);
+		if (ret)
+			goto err_module_put;
+	}
 
 	device->kvm = device->group->kvm;
 	if (device->ops->open_device) {
@@ -762,14 +798,16 @@ static int vfio_device_first_open(struct vfio_device *device)
 		if (ret)
 			goto err_container;
 	}
-	vfio_device_container_register(device);
+	if (device->group->container)
+		vfio_device_container_register(device);
 	mutex_unlock(&device->group->group_lock);
 	return 0;
 
 err_container:
-	vfio_group_unuse_container(device->group);
-err_module_put:
+	if (device->group->container)
+		vfio_group_unuse_container(device->group);
 	device->kvm = NULL;
+err_module_put:
 	mutex_unlock(&device->group->group_lock);
 	module_put(device->dev->driver->owner);
 	return ret;
@@ -780,11 +818,13 @@ static void vfio_device_last_close(struct vfio_device *device)
 	lockdep_assert_held(&device->dev_set->lock);
 
 	mutex_lock(&device->group->group_lock);
-	vfio_device_container_unregister(device);
+	if (device->group->container)
+		vfio_device_container_unregister(device);
 	if (device->ops->close_device)
 		device->ops->close_device(device);
 	device->kvm = NULL;
-	vfio_group_unuse_container(device->group);
+	if (device->group->container)
+		vfio_group_unuse_container(device->group);
 	mutex_unlock(&device->group->group_lock);
 	module_put(device->dev->driver->owner);
 }
@@ -900,7 +940,7 @@ static int vfio_group_ioctl_get_status(struct vfio_group *group,
 		return -ENODEV;
 	}
 
-	if (group->container)
+	if (group->container || group->iommufd)
 		status.flags |= VFIO_GROUP_FLAGS_CONTAINER_SET |
 				VFIO_GROUP_FLAGS_VIABLE;
 	else if (!iommu_group_dma_owner_claimed(group->iommu_group))
@@ -983,6 +1023,10 @@ static int vfio_group_fops_release(struct inode *inode, struct file *filep)
 	WARN_ON(group->notifier.head);
 	if (group->container)
 		vfio_group_detach_container(group);
+	if (group->iommufd) {
+		iommufd_ctx_put(group->iommufd);
+		group->iommufd = NULL;
+	}
 	group->opened_file = NULL;
 	mutex_unlock(&group->group_lock);
 	return 0;
@@ -1879,6 +1923,8 @@ static void __exit vfio_cleanup(void)
 module_init(vfio_init);
 module_exit(vfio_cleanup);
 
+MODULE_IMPORT_NS(IOMMUFD);
+MODULE_IMPORT_NS(IOMMUFD_VFIO);
 MODULE_VERSION(DRIVER_VERSION);
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR(DRIVER_AUTHOR);
-- 
2.38.0

