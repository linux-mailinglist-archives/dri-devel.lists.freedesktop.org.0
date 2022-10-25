Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9154560D36D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 20:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0F610E413;
	Tue, 25 Oct 2022 18:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6AC10E1D4;
 Tue, 25 Oct 2022 18:17:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jltL4NFia//kVX6S/boPq1+j9SeA5DpsvLZeUai7cmiYwY9AeILICeXZVLUc+Tu6dfNyIu/WqFRO3t3qimBOQIXx/+Q7etlWtgK7RdPrW/2K/v0BvVcwBox+8wkqANaytuz2SkK4nsIi2WdREGzYSYDRfCQv8TPZ5T1kkicbtSYBwjM2Bz2fPSsDhgY8g3Mw0shHOTVuBa3I2r0Vqfqwu2C6HoEMWPEle1gppBu10GkvSaBynOkZ81n0j98ZpApbTdTMKKiJaTi3CFajThqXD/KQe098+QKNP6HGhOmaPOu1PFhsgRVq4M8qYbeh6GobWfV/40BRRJKMXVZKAwTyBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqy41RsJ59plGnr0Sz/HYmsF1ZxLtZtCZq74kh633lY=;
 b=k5gRD7/V9pHNKoO92yisWqoKWYx2Ef3nCH9+s0guPb1izdo4NKu6C+O0rJmN6CN8Vr5tWp5kIVKRajLbuRIMEeoqlXQENC6FQxix51yI47kqxJo4oQxIzTeq04tEl9x0EXVdG3rmYaid7N/gqM/xmK48lZEnZw2REThA6RxLFa9ctbIAPds+CTkuPpbIDm/vtVBn2tAJYnGQVmZl3brFAaDLdWdQz+ZQFWMdky7YovItlGImAPxrOX/S8NlyXP2XOCKy6ca7NMmY9z3fFJAXZ4q6yTiiA5eS7PhV+D5yQR1SEv4sHV0blCZfb7bsOfmQ9NULSycQV1XOBv2l6Dc2JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqy41RsJ59plGnr0Sz/HYmsF1ZxLtZtCZq74kh633lY=;
 b=tfeOYq6/4Oshc6UTe3AvIN0+FrnJ9Lneoi2FA4VlDMWH0JjeTygEvNem4ZzWzR/JSoK0nIpgXrITHdlGZoLUixqTeBoBwDClgOjVx8pjwHoFFemYnXddt9vuMOLi+nXvqACWZLFPdbQW64eDNNqw81Szg3zWD7l6e51Q/9VEgJ6Jn9X3ynxlHLm/NYaV9QULh/eXQMRWlemUg9FeX97EWIYwHAaTbxkV7fdw4bg0qy8Vdew20n9X7Xr9KzcvZNeyk42+gC3sFZkigX0oFSS1eM7Qf3sXPBcrOUjA7m0COg3X+qFXJSRgfKrkXX+tWRJZNlR6nXyXX1Mjz6y4Y7CGTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SN7PR12MB7201.namprd12.prod.outlook.com (2603:10b6:806:2a8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 18:17:18 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5746.021; Tue, 25 Oct 2022
 18:17:18 +0000
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
Subject: [PATCH 03/10] vfio: Rename vfio_device_assign/unassign_container()
Date: Tue, 25 Oct 2022 15:17:09 -0300
Message-Id: <3-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0130.namprd02.prod.outlook.com
 (2603:10b6:208:35::35) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SN7PR12MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: 063380cd-945f-465b-3081-08dab6b52643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AIdbPsTprh99gAget98F6ZXbDdEKPLc2/HO4/Q7ey7CwILX2XCGCBFwM6jDaaRRBBeGvuvIn4mfrITaKucduji+E73zgmthROm+X/kL6Zfd5E3XJrYsKnK5Tv4ytcgukiE+wyQeRM1icqntghoycQjFVXRuKm7At0G55OQ1SFWXNUS10Vzz7Uvc8s886zB7hZQdyWSlC5iuyVIhssAi0eQbU+QWNrkdpNqU8RBUa89+yhQE0l0bbmtdOlWqmFTBWmjNfc9nuWi32Khm1BIegz+7lKwMvXH+A6467ZGR0sQ4VuI/oOv+hc8/ZudbJb8w24CRU1OWCgM00ZGT3MqcOyfj8v6JCXCPCpnbqWZAWO9Ksck3dT7fgD7DqzaoMIu2xGvKZW+5GWS4dD3RPFebyYlxdN+kpiw5bRn3/W2kkkFmfGJnPk+aHJzaIuUSyhpwGhpCGcRst+ZTlqR+gC4j0sV+aecFlHbHU7j/mppDS9G2a+ahl4JebslvWErsCfv1rznwXpKYxqNT12BhOoaLVfPEgIFxKCIYbTFse+ZzatbBWG8YT4CWvhJyDprzpmgAUrCsPgc/RlsHT3f1cPpZ+otMHMBv0u2PmMOEUmhYFN7yF9zcwgkr5bZO4faaEO3OW+GYsr6+4XdQhgRUqHKq4L7QLml6fwM5mImLQ4quXRkmYT4kHIVQnSHMuuhp6QXhW5YziHxDLcjqsFGlGiykSyz3e1pdUonVeqhshze9QemCJaeBLgZSogNVsaj4DljR7mth0T2nOU6xE35gww1n7+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(451199015)(110136005)(8936002)(54906003)(41300700001)(6666004)(6506007)(921005)(86362001)(38100700002)(5660300002)(7406005)(7416002)(66476007)(66556008)(66946007)(4326008)(8676002)(316002)(2906002)(478600001)(36756003)(2616005)(6486002)(83380400001)(186003)(26005)(6512007)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uQmAz4OOmrMeXo+SOORHINU+/KR9BUMjJ8yodE9k2BCXvvK8Xp0RPC/Vvz41?=
 =?us-ascii?Q?UGypM+jghicR0A6lipn77YFdduGrVhxKJYY1pUqNU8qTEdZyM+Jk673RYYc4?=
 =?us-ascii?Q?IYG0UKyZqNvASUjejiq/l5yBfyScpAcBW1NYloI0Trb/jxpUmxp6erh5wKTX?=
 =?us-ascii?Q?9+QUyRA+5gk1wJ0f3zNPyVSkQ+DOrE0fxZwPKffD66ysb+MnBRX2VvNmZ2il?=
 =?us-ascii?Q?sadPP4oFr/htKSxX4VKtIT2/6TQj1wLwlIrAkEeutgXsOV7b7blWdRn/A9P7?=
 =?us-ascii?Q?/EG60nvhmOiKFjmuwxA6zwgeTIWvqU7U5R8Ly5gkSMMwbTMhqRXsBz1cZqnz?=
 =?us-ascii?Q?cUsfuf2NPO+avvlyqQ5RurOp9bTZ4THvfCDLun1TZnBPDKcoDxI0jdsgkC4W?=
 =?us-ascii?Q?YQD19ulWPNA+GCm2T4LI0Mhx/7UScZR40dS6G3j+8gUOfPe4SuaiYGU8rlH/?=
 =?us-ascii?Q?6FrDHVuWTt5ezODIYwXAPkTTLV4Pz3cg5VVOUsy89IVTTnqdrFRTC9dEBbtD?=
 =?us-ascii?Q?PyfyaKLcE6CjjtZjRxIrZfirEGoJQytaWuZIRcwg2fqnjAfyVZ6u0OE/lW96?=
 =?us-ascii?Q?t4hsIu+RhE59U2kgWswOY84TTiTRNHsVm/wKqAraUOEqpXnmVFjyDYsPuRLq?=
 =?us-ascii?Q?oc0LErhW3Y7gkJ1aSY8g9mawoJ2m9Zz6kxJmH8EK5TdZibvwbqIgPgYfJO76?=
 =?us-ascii?Q?37a4aR55n5lUEb4MO0wTWgd5tfxuzUSBmFqkUfB4V8EFjyx49mxQfhFaXMo3?=
 =?us-ascii?Q?FtwrUGCNt9k3w1Cj7kp1KuolJ4dFvolMeLffvlDqt9pvLwYqNtk7gm114xUP?=
 =?us-ascii?Q?5xCi1YV+sxrycIva5rvhzMSVIs5Gj9PrdEHjINVIDd14vd3vBOZ2LVYBBGMF?=
 =?us-ascii?Q?nb33Kd6O5ORunJgJztfm5cgsqOhVyEV2bC0OyrFEGO4cx4hfC5Khj8Hj4nyN?=
 =?us-ascii?Q?2geOWyPZ1qAfFBnugVdXTxNjq5LUZYbcoROnLj46pvoBHCCiLCmajKX2hwKK?=
 =?us-ascii?Q?C+d3A4O0y59DLHfHMuN4axyIO4g4r1SR1FJ8wY+ah0FWDUMNA6T9oNXzVV8K?=
 =?us-ascii?Q?rxRxnf7UDpnYg5L8FdUgzcD13yHNWoaBoP5nwfWCzugqYS7W1BTjgC0CvlJ4?=
 =?us-ascii?Q?BWpZI672uhZlgIaSBYJ760iz7EsFXTx2vPve+j6oRDEmytK5qigpbg8aUhjh?=
 =?us-ascii?Q?z49sRCQ9zJhnNSQn7SbQ6woG4GDekHjttdZobvtla/01yUltr75T+UbK21dv?=
 =?us-ascii?Q?oWEgJH6C4CDYYl9DBT3qVEVbIgoZ1O5fK3OpOoORcjnojPu+uwt4kYDY5FG5?=
 =?us-ascii?Q?ttij0mTFQAMzGnGVU0wI0jqrZlsWfNDiXsg8fRpQEqnuyO4V1OYPy77p81/P?=
 =?us-ascii?Q?XujFWvRvhG2hH6WxUrr1g6Daj+X08GFmzw1IkcKG3LZ47RHhjp1UHq6tgMMm?=
 =?us-ascii?Q?MM2je8CDx5eqKe/+0HeZfUpTKcNjYi6uUf9k5dtWVOM43z5hFnoOz1KU7tTr?=
 =?us-ascii?Q?I5Z5XTHxBp7aprpt4O7kpzGJcDjy8j/r0lkF5TCAFvXSEO6MmeSIb0g/GBTt?=
 =?us-ascii?Q?MhQV2PaSsyuX6q4cBz8=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 063380cd-945f-465b-3081-08dab6b52643
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 18:17:17.5110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bPg3B3wJp8PKPbc8s7T4FJeENNIZUBMNNU54mBr5V3sR+qkVUO/pI3waRCaAGyXa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7201
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

These functions don't really assign anything anymore, they just increment
some refcounts and do a sanity check. Call them
vfio_group_[un]use_container()

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
index 204443ba3b3cd9..8d809ecd982b39 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -749,7 +749,7 @@ static int vfio_device_first_open(struct vfio_device *device)
 	 * it during close_device.
 	 */
 	mutex_lock(&device->group->group_lock);
-	ret = vfio_device_assign_container(device);
+	ret = vfio_group_use_container(device->group);
 	if (ret)
 		goto err_module_put;
 
@@ -764,7 +764,7 @@ static int vfio_device_first_open(struct vfio_device *device)
 	return 0;
 
 err_container:
-	vfio_device_unassign_container(device);
+	vfio_group_unuse_container(device->group);
 err_module_put:
 	device->kvm = NULL;
 	mutex_unlock(&device->group->group_lock);
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
2.38.0

