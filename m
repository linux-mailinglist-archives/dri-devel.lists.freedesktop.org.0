Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC3A62056D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 01:54:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6476110E3BA;
	Tue,  8 Nov 2022 00:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C58210E38D;
 Tue,  8 Nov 2022 00:53:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2r9bpSnJDV+KUIftbEIJo/wXUWN8nd5EyMMfrpLaj0Av2kxEyLbbReYnLguwdRSkVdE3s8JFe1ymC9ftF6uw1HCkNrDfIk8szCFbOw5OMN/He/oKqucFUNHK1U+JcIQc7VjkO7pyCyX1DfI6VMW6RFDNbO+0jGwthRFX+Hliu9ybH/kv3ZIhHXxNBHo1ZXkR32Q044UmY4Ka5+CMe1pFQ1cMmg3bxPSO7pvGLn939NxW8DayWz60lmtHdQA7MoFwEPUVgFhCPEHWIyfWxRvyp/O/3wmXTs0M7xAJSFQa+FtEwiEy1vilpV9Ij35jLHM2507RfQq9qMi4RV+c6hMvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIs5p5e+2jfPOnk6ydJHcMNsVejoOdrG2tIPlleinD0=;
 b=I5sl7oXfSpcHgvgQlZjShMEDGqIpmeGufYyIw56wMVzMGWBahAnOqNYDso931cF/cyFvvPVzFBNG+H8TrPi7iGcXhjpjKxNn6rswH76X5DXNj1k562baBk9WvzdtlCNQTsIfQzHL0diENH11DkraZbP/EMXqskgGAMg0AGJvEFreZkX2OgA+EutCsAwl3rQ2Whzl7fh6ZdW41JpVTrsM5owTsJPNjSYKh13vGZT06hRKAlbvqwn8b25IbSBXi/LiNxJE9I8WzYPkCg7bhzSmb27sMW1Gw6e5nNn4ZHkZDumzy3WOCq0vv1rJwj0z9etq1yrXpViDzRuRvRpDawLIxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIs5p5e+2jfPOnk6ydJHcMNsVejoOdrG2tIPlleinD0=;
 b=qR2JoqY48JXkdxabK7xA3aTRfPmOj4ucznP4Xew5ibvHrr1sbOJ46J0/2YwKpfz9rzFjEBUdYLcxK1FYm4ioKArZWB+4M3T3vHPiWyMqYHp+YmJuIDq8QEVr3xkMyVwgb4gbGil73Uk8dEExeIkZydxu3VUzugj7VSqi/kOzF/5cUHM/U2RIQhYen0b+3HHgvJgQMztKOYC0oQW1LS1QHbj5U6F8eVf6j0fyrYtgLqcoO4bYVNFNMjhI0yz6GkCj4dc9RcTkLSaKPPLNAtPSu42SJ7yzaKeIWjx+/dC5ZuAzeqHRjMVzArE0MEqAvfw2Kd2Wy2bfQ9azPQDGJ44fwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB6257.namprd12.prod.outlook.com (2603:10b6:208:3e7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Tue, 8 Nov
 2022 00:53:04 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 00:53:04 +0000
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
Subject: [PATCH v2 01/11] vfio: Move vfio_device driver open/close code to a
 function
Date: Mon,  7 Nov 2022 20:52:45 -0400
Message-Id: <1-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0122.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::7) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f7d8f00-cf9e-4558-cd13-08dac123941a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0jw0Ukht7TGzbiShwAjCJfDQQtolxkJVTEhBQkhBB8LVVH//xw9Ttd5jNjQEmPT71JaQSsSngWR18GWZYlbVObtuQAMs83pSS69awcO0BN6v1E2IKN4c1tKXXSyW0ANNulxskrDhnExKpVMI4od3yQDLqgii8t/yTxIQnHJom+sPqrewcI6D9W8wv6I48Qng1PFVQ8XeAALOWdcXolUEqXM6Xd02zCg/c3mLW9kObcMLdUYnglpkOIsNpPcPXkalhyepbmyW/DKPVioDar7wSIP/izUQgyZAhgnhZGXCgK3pnIdVwikzBgltNVwJxxfJ773ggCLRQDJgeFIJzEeOZjrmj8e5bQHEbyUjkqra7FBWhEp2fY1FGDTc95jojHCflWxgpDiHKGVfTYLsEokAK19PwtVhS9elyVPJ4mN2gxqvFXglFxWe8k5devY97mKt5RnHcZGtFbxJ9zsw4H84yo6nq1qVZDAmXSDniBfRxDRkseS4di+38+mly1gkK3G90t5EHD+6ddg7u4VH36iahGNPXzLeOv3FMo/3BGYr7DHec4Qo0lq2Ah0pv3L7r5qhEo3yXzIBAYWipMJYeDmuD+P1GGKHsQ9G+4OVJhaVCPm8x7/5353sYuYiuPLo2HRJtjyZMvzZwzdOAWWRWpn8D89Xkeh1ukT3+zs4aOwFHyuugexjc3HouGJRPxoYVFjsAy70c6blUQ+L2rEsYjw+UNoFRFovaDnsXixq+WKR6ajFlMH3jObR15ilBYO343FYABbYL2FQOUHyTkzwS7qLhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199015)(8936002)(36756003)(7416002)(5660300002)(41300700001)(7406005)(86362001)(6486002)(83380400001)(8676002)(6666004)(6506007)(26005)(2616005)(478600001)(38100700002)(6512007)(186003)(4326008)(921005)(66556008)(66946007)(66476007)(54906003)(316002)(110136005)(2906002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v2uxEj4mY0xIZEvdWMMBiWlwOXqMC484ZAa1Kr7qU4A/QlNX6xa66yu8xXfC?=
 =?us-ascii?Q?kB2kRePeKKPi/wEXWoUIQL4nLaMAwTdl/DAKyr4lXyysc6vUgFuFGklYZbOI?=
 =?us-ascii?Q?ipjotA0lFXd7rk2uzsdFqlK98U2x6u75Mnbh4EJzqNF2soa7Vfa23g7ZXBqa?=
 =?us-ascii?Q?7rp62YZhp/sT0lJMagJh7I15At+LwDWmKrfTloMNuhmvcx9RqefvVsBmNDcT?=
 =?us-ascii?Q?bMWMZFO1DWgMT04VWk2tSj3uGyp4c/sEGAD7UlybOzmlyFow5R/O5fbxIvbb?=
 =?us-ascii?Q?0F+5CIsj1YCglEn+7XlgZMA41JeMrtZVZbBhvj7ZieToE//XfCsMJ3S7G8O5?=
 =?us-ascii?Q?YovH8KpwFruIHTUAGvyMGuGVtyrH0XVE4qi/A20afzVo3X7p5J7IInCRk7lv?=
 =?us-ascii?Q?Bot/D/1iWwesBY4vusWChfp6vwB69YgcojtO8F9OResZdPrb/oEe4HqcLxub?=
 =?us-ascii?Q?tBv61YAVCJFjnJJxSnRz+odTXMJkBF6ywAMs2gHxi0n1qqLm19hXqrimWQHD?=
 =?us-ascii?Q?pu9RH64v6qBf8iGjReb5LAjrijB+MCOn9D2Uufwo7mnV+S2u8XZbxTJEnIHs?=
 =?us-ascii?Q?OaogYdjCvRdWlwzwy6ppN/n/K2THaZtKA7KxnQQxEd66ObSEnAU67MzBShn6?=
 =?us-ascii?Q?bCe1XQiM7TDxtxVewQX2ssdqbKbDKMu9MhsXnFSfecby5x1Uz6u2/tHos8sG?=
 =?us-ascii?Q?WkN+2m2moN2+wd75jUnzHtww/dA7PQu9qSMRGzXw5EOke9c/qLBkPUg0qu7n?=
 =?us-ascii?Q?AONMO5ZCHSEirsLN3zVBHZc4VF1t486RH26UMOFL+nZRCas26JXFUE6varEG?=
 =?us-ascii?Q?uPMfaGerGe+ojJHurD5/w2C/D0Fxx2OKG5LBKYMBoch7R2uQ1zoTYhhTTkEM?=
 =?us-ascii?Q?kTYQsXOgoefa/YRD602H5e5e86YA1LgbFKx3pyNZEJGoy3dAWNqdUL3pZeMt?=
 =?us-ascii?Q?n7Q0Oi13P1yNTrZbS/gbPGFMxIIhPaA5L/Bwwpw/+lrMTQpkzpZBouakapNf?=
 =?us-ascii?Q?bPutUb18sBrBjVwCd1J6Sb3bEGEA8BQQgma0hkkPRghwU1iIDcZXW+DeuZaw?=
 =?us-ascii?Q?lNP03Ey2Y51Rvm1+T6kgM7nF9lw1pOszeqxloFhA1vrpWCCOLb11KRUIYpga?=
 =?us-ascii?Q?zuCc8+4CLtNqf5heq/+9EKDY5KzOZW5VZ+ueBd912vuC1v7YKRBf/hPUOPl/?=
 =?us-ascii?Q?o3iJ5gZJD7TjQ8E96KjKaiYTcle1tr9ay6pn9z8sh3kLqYFlHdMrVTDyQre6?=
 =?us-ascii?Q?Gfwmn+gl6Ze3PMpUt4jSzIYRGz+sXaxKGScH3LrGHZ9hDJbGxfPFwoHcFLJ5?=
 =?us-ascii?Q?e7i8pb3ChqpFYs2juf9oysqn90/NBAZ4L90lJaaCorBH1XRnw9VyGexiQEr7?=
 =?us-ascii?Q?z7KSsryqi52exQte7yqnouveZV89sAuQx9dL0Ep64tF/vyrI+0IqMUYKA2/s?=
 =?us-ascii?Q?3WsX2KdBgmyYw3LPHnBeBJjgnvNhirc8Bx8MOS7GvKWf5nQ4PAfYQ2iEINsK?=
 =?us-ascii?Q?HT5AIc/14Pb1FWN2LjYkbxpRnCrPLYYjIjMUsacGc+8JvqauFp6/MJv2BsBk?=
 =?us-ascii?Q?tZQx6pPzF7cOcm8pw7c=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7d8f00-cf9e-4558-cd13-08dac123941a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 00:52:58.0865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jlCJvevRFUF4z40GvsrhIrAxelmbOaztKo+rO3wD1yAtMmSk1wjSburitRxqMLfE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6257
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

This error unwind is getting complicated. Move all the code into two
pair'd function. The functions should be called when the open_count == 1
after incrementing/before decrementing.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Yi Liu <yi.l.liu@intel.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/vfio_main.c | 95 ++++++++++++++++++++++------------------
 1 file changed, 53 insertions(+), 42 deletions(-)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 2d168793d4e1ce..2e8346d13c16ca 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -734,6 +734,51 @@ bool vfio_assert_device_open(struct vfio_device *device)
 	return !WARN_ON_ONCE(!READ_ONCE(device->open_count));
 }
 
+static int vfio_device_first_open(struct vfio_device *device)
+{
+	int ret;
+
+	lockdep_assert_held(&device->dev_set->lock);
+
+	if (!try_module_get(device->dev->driver->owner))
+		return -ENODEV;
+
+	/*
+	 * Here we pass the KVM pointer with the group under the lock.  If the
+	 * device driver will use it, it must obtain a reference and release it
+	 * during close_device.
+	 */
+	mutex_lock(&device->group->group_lock);
+	device->kvm = device->group->kvm;
+	if (device->ops->open_device) {
+		ret = device->ops->open_device(device);
+		if (ret)
+			goto err_module_put;
+	}
+	vfio_device_container_register(device);
+	mutex_unlock(&device->group->group_lock);
+	return 0;
+
+err_module_put:
+	device->kvm = NULL;
+	mutex_unlock(&device->group->group_lock);
+	module_put(device->dev->driver->owner);
+	return ret;
+}
+
+static void vfio_device_last_close(struct vfio_device *device)
+{
+	lockdep_assert_held(&device->dev_set->lock);
+
+	mutex_lock(&device->group->group_lock);
+	vfio_device_container_unregister(device);
+	if (device->ops->close_device)
+		device->ops->close_device(device);
+	device->kvm = NULL;
+	mutex_unlock(&device->group->group_lock);
+	module_put(device->dev->driver->owner);
+}
+
 static struct file *vfio_device_open(struct vfio_device *device)
 {
 	struct file *filep;
@@ -745,29 +790,12 @@ static struct file *vfio_device_open(struct vfio_device *device)
 	if (ret)
 		return ERR_PTR(ret);
 
-	if (!try_module_get(device->dev->driver->owner)) {
-		ret = -ENODEV;
-		goto err_unassign_container;
-	}
-
 	mutex_lock(&device->dev_set->lock);
 	device->open_count++;
 	if (device->open_count == 1) {
-		/*
-		 * Here we pass the KVM pointer with the group under the read
-		 * lock.  If the device driver will use it, it must obtain a
-		 * reference and release it during close_device.
-		 */
-		mutex_lock(&device->group->group_lock);
-		device->kvm = device->group->kvm;
-
-		if (device->ops->open_device) {
-			ret = device->ops->open_device(device);
-			if (ret)
-				goto err_undo_count;
-		}
-		vfio_device_container_register(device);
-		mutex_unlock(&device->group->group_lock);
+		ret = vfio_device_first_open(device);
+		if (ret)
+			goto err_unassign_container;
 	}
 	mutex_unlock(&device->dev_set->lock);
 
@@ -800,20 +828,11 @@ static struct file *vfio_device_open(struct vfio_device *device)
 
 err_close_device:
 	mutex_lock(&device->dev_set->lock);
-	mutex_lock(&device->group->group_lock);
-	if (device->open_count == 1 && device->ops->close_device) {
-		device->ops->close_device(device);
-
-		vfio_device_container_unregister(device);
-	}
-err_undo_count:
-	mutex_unlock(&device->group->group_lock);
+	if (device->open_count == 1)
+		vfio_device_last_close(device);
+err_unassign_container:
 	device->open_count--;
-	if (device->open_count == 0 && device->kvm)
-		device->kvm = NULL;
 	mutex_unlock(&device->dev_set->lock);
-	module_put(device->dev->driver->owner);
-err_unassign_container:
 	vfio_device_unassign_container(device);
 	return ERR_PTR(ret);
 }
@@ -1016,19 +1035,11 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
 
 	mutex_lock(&device->dev_set->lock);
 	vfio_assert_device_open(device);
-	mutex_lock(&device->group->group_lock);
-	if (device->open_count == 1 && device->ops->close_device)
-		device->ops->close_device(device);
-
-	vfio_device_container_unregister(device);
-	mutex_unlock(&device->group->group_lock);
+	if (device->open_count == 1)
+		vfio_device_last_close(device);
 	device->open_count--;
-	if (device->open_count == 0)
-		device->kvm = NULL;
 	mutex_unlock(&device->dev_set->lock);
 
-	module_put(device->dev->driver->owner);
-
 	vfio_device_unassign_container(device);
 
 	vfio_device_put_registration(device);
-- 
2.38.1

