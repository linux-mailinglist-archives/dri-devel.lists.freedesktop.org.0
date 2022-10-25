Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4704860D370
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 20:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5F810E42B;
	Tue, 25 Oct 2022 18:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152A110E252;
 Tue, 25 Oct 2022 18:17:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3woTcQRrNto8kajJOsPrxce+8jIO9L8g/kw4C3VGrpAHykIouEXZF/dVeJSgBn5rC6VjPlgYATP8QQTPC9L13Zxrfslo2bGE2mtnQ+GcZgSL/9mgMbxK99lVs7No7MOZMw4dbc1LjE2VIxU3Uyp+9AR8VdeGZ07NBoZ5podRVTV70IQLH/r4DWMtMRzT760j0UpU5P6sReqtTXUP/44CGKN4ObNlT3Cx7QW/GzNoqDIqheb1+F8CSbdX93GgkPwGhJu6d6cIVn7CDBPo5m0m+RwwvmLbvyVQaTkVBr0rIHlt1y6CR+ZrqrQG4BPMKjHelezdGqL/kOjL96Yw4Yggw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTogf53A0OaVKvNg0Go21GP+KUpGF4/2xivK801AMJ8=;
 b=QTIw2uB50C62qqWUnSCdnxdhp68oM/ys/+H+9YkjmlGujPjMOIupC86npWgLVJh+JHaiOBVU3e1co96o/P07T5KLLIG2S7AjRbsr1FnXAiNt6I5zhMafiDKqxnkBSNm2u1/XUD9dCKOOSXTV0nofdn9rI769ko7GJ76kE7n5bh+cndBABlgqsX5x6jDLhLMZ0yC5y3PHpI4Ra1tqP/f6ymCUQ7KtfK4GUoQoo2I8LXiZNqDHiXp1zRCPvvs+N6WilrMZli9x9XQG7QBk5H8okSvvY4020IS0LITB0JYDs5tgcyAJ1Pt3rxh8AnVSZEZH+7RiDYoNOrcLymgcrrQDsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTogf53A0OaVKvNg0Go21GP+KUpGF4/2xivK801AMJ8=;
 b=my6GRdgfSreqmi78u7ObklLcNbKdbDLgPBNi6iYBGs0KPqpnNaxSgz+4ghonHQ1GoREaB7PKZuvQZEHi/4w4T8JMvc5ljg+VanfR24yCIVkSd9bH+Nxg+iM0QJi0XXuM1vSQGRjeWbDDzSKaLhwU2+S6zZJbYzIoifp9dKkX81980dF1GQxMYQsDoecxhjDkS/A1X7APjcprhw9lep07S+ylLhc3UHTrWRc4Q4R2KEb8BtwPQk+vKNeu4JXcbkNXkHr5oLi8G670Qj/iLhHe4hdEp9Nfu9/f/yRGeue3D7PT95xtycOZB8915NC4ojBJm3T0OFwiYsKI0uzAR0qQfQ==
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
Subject: [PATCH 02/10] vfio: Move vfio_device_assign_container() into
 vfio_device_first_open()
Date: Tue, 25 Oct 2022 15:17:08 -0300
Message-Id: <2-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0399.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::14) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SN7PR12MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: cefe6abf-86f8-4666-8d02-08dab6b52657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hNujF4XPYr2HW0n8Zywj3mN6QWMmZioSgDkkRXe3vRkfhKbmPVCKROG/kG1WqZs1uEVOd1ymronjPLvUTwxV6zp+oJLiG05MNnIPa3CnFlI6LQNMYAbDO73HTkf+0rDFQz0mCop2ZmNS878HB2PKZonBvR6303tBPEjvXyUaRkto54WzMSUpBDMaKBDTzqNELDup3sYh0PAYGu3GgB5A+2Ml6V8wwsosDP6eBtfbUpdC+LnNogobeUIHmbhpEW2G/6OyBOEo/M8K/NvXeCnNyavjzzcuxS91EFNU93KckTKqXdRE0VwWlU4eBrlWY+ymGTv3LoQQEMJn79yQD7jrkROXlFCTCi5c5srDUvw/FbdOaH6AV7bJZOUAHln5vobA2oSkvUCRsL8AfxxQm77zQyosV03pkNGUgCftSS647a69wni2tfSUf0bwFyCA/34OiN1pmdhmL2Rx5qJTK6v088LSS//bq/LrcqjjYq3BOlksXXHa2xLfAgVcVU9KgbhXiHwA5gKaI7o9+kwh71dyBGRUsyzYLRnX+GefL8fktUGW5cuC/zf3exj/B9F9K/8Zczd/1vvG7jGHt+uUWxUxGRTQkd7xXeByTTmE6iY+83Z4BcWacWjh+bQzZP7xKmoQOELEtUvKbj90aB3XYXkGVcz5P1cd04oHV4B+ni4AgmGP9YYRsLJN4WI70FSxY49jkAjbQC8aK3P7D3455xb3LbMtJHk55n8CtkVboOvlcT23Ue8lIQy33k9tdN+12k+WDSVdmy5ZaAXEIFUKJvqy9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(451199015)(110136005)(8936002)(54906003)(41300700001)(6666004)(6506007)(921005)(86362001)(38100700002)(5660300002)(7406005)(7416002)(66476007)(66556008)(66946007)(4326008)(8676002)(316002)(2906002)(478600001)(36756003)(2616005)(6486002)(83380400001)(186003)(26005)(6512007)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g2uP8hPmstq8J3/teevv1caadii/7W+FXkwGG8MvX2x0oGWHeLWyohrqQAJZ?=
 =?us-ascii?Q?kh8ZTd5UK9oNyB8UWDsfR/2cXAes7q1MfWq1r2lCeS1I+Z2KrQv6wNpEIw9p?=
 =?us-ascii?Q?fcxt8eGX5zl8oKV5JHBo3ZS9uHN5XiqpYOIoRjvxZkp2YmistHlB0VGlDx9g?=
 =?us-ascii?Q?l+b/z+nzIM8Xk+KPgngffpCvIIp8TmmHr9xNRMrfcMw3D9VEo782wXjGgbOF?=
 =?us-ascii?Q?KbxMv8cPZdo/G2FvsrmHd0/amQ9DlxX9zhkWi6uY2mdIZWsXYCFK1ZuhYiRn?=
 =?us-ascii?Q?REWKf20dJOXRZH0nI9ILCht19iBi5ZWC6ysGk3QT6dMdoQsqhFoeEugQj+tT?=
 =?us-ascii?Q?BM3mN4einTnyo4YNnIEIunk9bTw9MDHbomBS9F/GdUKfZVCZDFM7aV825ZSF?=
 =?us-ascii?Q?9R5WGZhrkxiJWttdu6mpyTC3B3vCBgpCT1AeElyE/kv5rxXMq2kxbewVAo2X?=
 =?us-ascii?Q?22xoJR51HTpt2jlQb2noZW0XXAgYXus8KyynG+Lri++qoDGhaYlgxpP1qpip?=
 =?us-ascii?Q?YXAa7WISAzXqB3GjxqXh5AoKZwYSQ9N3JwEcW9XSgKCdX/dwYpqCXkq8mb+n?=
 =?us-ascii?Q?qr+Fk1IVTxel1GdnBwOqxu2Mr3h7G4k7P8OYDqvsYekfmfQR5fGyZIeBVhq6?=
 =?us-ascii?Q?LEtk4TOhAttGWfJ+mmw3yWHonx2AYMeDT0jzD/osV4AckdNBjCEvVpEqOv2t?=
 =?us-ascii?Q?K8ZGlpF/IEwEo6LhTb6BjrEioUYGrVhP+ydBAvaC12F6c3Si7upQ9QTuUGbH?=
 =?us-ascii?Q?O9yz2ZNQBWl5AkQ/NAY9hcgrJBkjIPeC0jw28HdrrCSAX1h2i3sor6n8JE1X?=
 =?us-ascii?Q?l1c0s7SHIx1OMNxyrY6U3e70FXGTR0fLmUCbHaD5MVhEog2e0KS3uwaCYk6j?=
 =?us-ascii?Q?j1tfgUVwjphOoLr5v5TWt0JizQnSCEX3TJAEKlKP4bR1MZ5971VtwVuLyGbA?=
 =?us-ascii?Q?ErndL0JZJyrchW2cuCoUeFxnLE292f8cQSn+/MHwJ4Mf673jaM4XkrnVyuxR?=
 =?us-ascii?Q?Kg844aWSnbzECOEmWAjR+EZ6+FVJD4mVNvpBSUIBhyWA9rV+lxgoaDRp7Dfo?=
 =?us-ascii?Q?b6tOEx6TzAbXRjrL/bvOBH4cUFgqCC9GI0/W8/F1yfYDoP5GqlJDxYXeR/Qd?=
 =?us-ascii?Q?niGgrYDEeQvBNRHToP23qFcq7DeN2oaBWnVcqwug8ZEYBsczkA9IoZFxODH6?=
 =?us-ascii?Q?DL+MhETY0hWAmSuuLILCLeqVY19EZael1dcyHPWwyLJGgLTzFBTCqkF6IWPZ?=
 =?us-ascii?Q?KQb/Q2pgziUBNLAB9AtZWTZ2qpvxJ1pu/IAeuIP2Cg4MqTCfet8JU0qF89zP?=
 =?us-ascii?Q?LfQUBeaLTgP+4mqLoUsdMAUJiN5Byr9HtjOxlCQDS/KXPnpWUO1S9eykfPYA?=
 =?us-ascii?Q?m1ay3B5unIyxQkb+GnO6MJMuKNiTKP4kuw5/Ge0zMMQBy3j2k7CLdMjnHtnH?=
 =?us-ascii?Q?KF6hQgjrxaZXGY4Z5AsXrJjGCtuN3E2cDG0HTMIolFD9si3bClo+AUUEmrN4?=
 =?us-ascii?Q?bLAfQKGD6+ux9zIN/k2Pq1/9lqhNUa8zkflOd69DqcjCg/IdGpFz/F/+qzIR?=
 =?us-ascii?Q?IOpSLuSjmX87tcmWsYc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cefe6abf-86f8-4666-8d02-08dab6b52657
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 18:17:17.5904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q+3B2HeyrqZXCoXAuZm8EW+kNMz1711MDvwNZVg5nS/+QBQAdNOC7HCTiqYRUfbu
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

The only thing this function does is assert the group has an assigned
container and incrs refcounts.

The overall model we have is that once a conatiner_users refcount is
incremented it cannot be de-assigned from the group -
vfio_group_ioctl_unset_container() will fail and the group FD cannot be
closed.

Thus we do not need to check this on evey device FD open, just the
first. Reorganize the code so that only the first open and last close
manages the container.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/container.c |  4 ++--
 drivers/vfio/vfio_main.c | 18 ++++++++----------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/vfio/container.c b/drivers/vfio/container.c
index d74164abbf401d..dd79a66ec62cad 100644
--- a/drivers/vfio/container.c
+++ b/drivers/vfio/container.c
@@ -531,11 +531,11 @@ int vfio_device_assign_container(struct vfio_device *device)
 
 void vfio_device_unassign_container(struct vfio_device *device)
 {
-	mutex_lock(&device->group->group_lock);
+	lockdep_assert_held_write(&device->group->group_lock);
+
 	WARN_ON(device->group->container_users <= 1);
 	device->group->container_users--;
 	fput(device->group->opened_file);
-	mutex_unlock(&device->group->group_lock);
 }
 
 /*
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index d043383fc3ba2b..204443ba3b3cd9 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -749,16 +749,22 @@ static int vfio_device_first_open(struct vfio_device *device)
 	 * it during close_device.
 	 */
 	mutex_lock(&device->group->group_lock);
+	ret = vfio_device_assign_container(device);
+	if (ret)
+		goto err_module_put;
+
 	device->kvm = device->group->kvm;
 	if (device->ops->open_device) {
 		ret = device->ops->open_device(device);
 		if (ret)
-			goto err_module_put;
+			goto err_container;
 	}
 	vfio_device_container_register(device);
 	mutex_unlock(&device->group->group_lock);
 	return 0;
 
+err_container:
+	vfio_device_unassign_container(device);
 err_module_put:
 	device->kvm = NULL;
 	mutex_unlock(&device->group->group_lock);
@@ -775,6 +781,7 @@ static void vfio_device_last_close(struct vfio_device *device)
 	if (device->ops->close_device)
 		device->ops->close_device(device);
 	device->kvm = NULL;
+	vfio_device_unassign_container(device);
 	mutex_unlock(&device->group->group_lock);
 	module_put(device->dev->driver->owner);
 }
@@ -784,12 +791,6 @@ static struct file *vfio_device_open(struct vfio_device *device)
 	struct file *filep;
 	int ret;
 
-	mutex_lock(&device->group->group_lock);
-	ret = vfio_device_assign_container(device);
-	mutex_unlock(&device->group->group_lock);
-	if (ret)
-		return ERR_PTR(ret);
-
 	mutex_lock(&device->dev_set->lock);
 	device->open_count++;
 	if (device->open_count == 1) {
@@ -833,7 +834,6 @@ static struct file *vfio_device_open(struct vfio_device *device)
 err_unassign_container:
 	device->open_count--;
 	mutex_unlock(&device->dev_set->lock);
-	vfio_device_unassign_container(device);
 	return ERR_PTR(ret);
 }
 
@@ -1040,8 +1040,6 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
 	device->open_count--;
 	mutex_unlock(&device->dev_set->lock);
 
-	vfio_device_unassign_container(device);
-
 	vfio_device_put_registration(device);
 
 	return 0;
-- 
2.38.0

