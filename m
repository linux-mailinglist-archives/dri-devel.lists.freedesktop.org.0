Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F16160D371
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 20:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6AB10E42D;
	Tue, 25 Oct 2022 18:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB0210E03D;
 Tue, 25 Oct 2022 18:17:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3GzpjBe3VcOy6/Sc47Z5M8EPaxGxRr7wHO7Vv7ZJH0JMxSBb/EzqpNB5APo8Qkm3ts03XMtS87CvnDLGCXTSt1xTptPnZl6EXzvLadE2GoFWZQGFLAnKCNxoWErHpHvviR+WsoCNEw7CvssoMdlbymLvbKtYdgNT7l1c6T1umtmAUCULfqDxZk7E9p8EJDqv9SeFXVbScNGwqxQ7KuZ0X2ecGHzTVmUYhE3E7/9nq2iFb2USrxJwzt7/rHKyxWkiKP98B/gyYkF0M7qWvTIFscfdarx3sAWkBSB+5Rhe43eNIxgJRG0oOFu8uM32tYtpnk2eTPNCuTHModCtlSHMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8mFVPz3zja27bC4pfdudZdXu50zF9QC4me1dDphfoI=;
 b=I6iOgfIqRiYaBgjP7MxmDwlHwvKBsJPnwt6AByFxL8w1vFZudN1g2k4UOX2VQuuRV36FKfBPM031f3Ly0jvFOlgkWo6q0gERHuWOVhgKC0MRFqzKj+hPxVrunB7U43l3y68GgpryAD8vLYCVLAxMYrL0kLCwTubjpSJBqEOvp4VPeso7ZNs+wA5azG5kklku135LkiMP9JpggyGA5NXeB6VQpctEyiL21fv53lBf8pQJsCoRPNahaxog/Jt13GJQK5JGyMEtEJ36grJSjptY89DZHwPgSvhJfpuWkz+BfycLlM53msSzS+thTTH3GMKzd4cvVBLDIhcAoThMPOg9ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8mFVPz3zja27bC4pfdudZdXu50zF9QC4me1dDphfoI=;
 b=uDzriOMAElP2Hc6BWMneZAWHOyfRXAwybfNUyhePLsIC6NGFUfuA+RIe+hJOnEL//46IczvBsSVo/6pTHNgUOu7ayYjlIv7gyC/q6pSE8V01atoTQfUQC7BIh71lT6kKGny9QxxwonFEfpQ1DXM+wdPqq6bC8Tys7WBlYXZ7OWioBGCctgJtE0oYOSzK4KQ9dbdDfmaqPfw52pKUKmfloMet0IpR92NQ0+YzxNQYUN/Mfo1EdawciRp4lL/+6xV9S7uVGlQ/hGV05VIBVGlUULFmfmu+naPknjD6SLZpMJ92fFxftXZGUo0azy21MNT40EC7XaC+zVT1RhP4/9OhHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SN7PR12MB7201.namprd12.prod.outlook.com (2603:10b6:806:2a8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 18:17:19 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5746.021; Tue, 25 Oct 2022
 18:17:19 +0000
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
Subject: [PATCH 01/10] vfio: Move vfio_device driver open/close code to a
 function
Date: Tue, 25 Oct 2022 15:17:07 -0300
Message-Id: <1-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0407.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::22) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SN7PR12MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cf6af8a-1ac9-4775-3e08-08dab6b526dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UCB1wDD2tBjGNA3Gqi81rcHM9s/LdxYtaqP5FkEkQAgYQeL7/vBWyaFF9QN6L8hNeV3vEhcb5kwAh2Bmp+cuK+O0o+drz7uDlaTnvN8fm+LOBCzmGxy8aIraxJ8SC9wsskrQyDuukonEhie8GC74csPeMLBLpUESCkM0XkS00BDsq5FgsmVbCFLNDir7zwb/S06rvXKgwC57lUgJxDBecWwH6Q5F6bgvZNdOSPmdPwX0KN5Jxl6j+eg8hGn6na3120no5cx5fTO1KGy2tXHGs1JXrF8ex3DDmGMz6htUmy0V37jzBeS8icwoOebzyUGOxhDyz6UdI8klaeIWRe430Vs2v6nHSvWlM6PkfaiYTAfnjV4LmfeiR5NlbB/cfiCtOEEcMxxZGRi0SNALQjYvAMRl1BiSqIrHSgwzJt0TgOx8wHXIq1toG09+oxANDqb6GuazR0SGnaORPhAzCYoF4MmKCaO9wG3DIeZVGktedDLR7SSst74n4XwR8S+6qLPWpz9ns5HHFAESXlJfYh/x7/cdyfK7SdJSPpoP1omtOMXnGlxRczDpYfEu7jyyRoOnF+0GPd4/2hDJwpCAh8k0WoI6x8f3hFgX9eWFZGJjRiy8CnwF5ywUqmwhVf4c9mwkq9iIBcSMcQMFzLH+/U0vqRox+rTKGgPrqSP6nldSLGrD0bKy0tHdgx628OTV+pnt6ObxWb/KnMGkoVrab5llbsDtBWkqP1vyjMTGmkGJYSuHU1lJDY3aNvxodiY3F1qbacP9e/lRZY7r9TDKGx/Xgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(451199015)(110136005)(8936002)(54906003)(41300700001)(6666004)(6506007)(921005)(86362001)(38100700002)(5660300002)(7406005)(7416002)(66476007)(66556008)(66946007)(4326008)(8676002)(316002)(2906002)(478600001)(36756003)(2616005)(6486002)(83380400001)(186003)(26005)(6512007)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r4s8glIL+iZrfT6XomSicAmTlmHjK2HY/S2z+bNbH9YAyfQbvAtVgGdOGJif?=
 =?us-ascii?Q?7nCxODCZPfkdpq/vYHrBNgNtG1Dr0vSvEnabER/8BKcTuUPTkpYWGAZCDW7D?=
 =?us-ascii?Q?OL/xKJxm7E2mTGvnNqcaO7NZq5YHNHwb0tw+XBMV1t6OzddNMoHXU1O5v9aJ?=
 =?us-ascii?Q?91HSOPv28S467bkWWqiKLH2vVO4gKCdfAhUoLoQODZIy+s7E4M14TWj5EQ/Y?=
 =?us-ascii?Q?bLYvaPh3IO3PKbnxoLm/Uqt9fLHvXV6AEdU49FSojlRKbVSeo3ErQ+Emp6+m?=
 =?us-ascii?Q?YbM7b7GySyaavOJ5RnoYR6nHiJaDOA2E8JTfOdZ5CV5t8I67d+LtzGtk1rqA?=
 =?us-ascii?Q?Id1OfyZcNK30v01lmGqjJRGkK8o1vLQWWkex0GARTMHGlessKU0qLYmKyPsn?=
 =?us-ascii?Q?/b9c/RL80RuK+xHKXfBoHVPBt6d6iBHgUpSbhf2eSkuiMGdbhoTMtAYzm3Mf?=
 =?us-ascii?Q?wjDjwqU7/ItfbeWkpmMg8+R3Du4vRcYodZdu1zXgw+YnbeOfzOqbKc0qYNBJ?=
 =?us-ascii?Q?lCLZ4mMCNASALCpm7lZ8Jf0jYJmZjJEUZ7b1wLhXTK18RVxm4ZbYfblOKCmh?=
 =?us-ascii?Q?pbO9vOJKC0d7ZQgcvQwXH0IJF5ExtTAzKIGTO8Rn6DudRpNJwOMl3AAatbQq?=
 =?us-ascii?Q?zsl4YyJ+vvloOf5Idfk4LZ1VuzR1EANnwrXdKQrrHaq7jh7fCf4VIQZtglJb?=
 =?us-ascii?Q?vVtCvm73sw1jP9vM3HPHOSIQZ3GZ2UBWECSEEj4TXU4WgKvX2lJAylay0uSQ?=
 =?us-ascii?Q?1raPohtm7w61gDCL7HYYeVfmgJAWujjrTZI6xFHa/GRvpA5Dc80j99tYbBcG?=
 =?us-ascii?Q?oMBEyEjV05kxsysVpL7w20egUxe0xtPzauQpfyJPXC2fgdPp6ghNeGB+YtBA?=
 =?us-ascii?Q?WjnqiE3Y2itQMfPR/MEoafE65acoQZJokDb+czx0GqQdNfKOREF6cQOy4EPv?=
 =?us-ascii?Q?o26igAJUWA805cEsGTOer+HhW4m+XaPYxdha2VVGbnrFeACrdDfTUvvWAmh/?=
 =?us-ascii?Q?4s1K+KeeTIy3l5HPZd6s+IfrYTnbs6O1Byo8Va/mHVfACOsmPrxP14QeEXY0?=
 =?us-ascii?Q?fwVRssKGKnub6L6kw3Pm5nZthooBRoeJxepLXcNXIZXteDPKKGBk+tgYVWsw?=
 =?us-ascii?Q?hNOdzhrRykSIEtRqzgb2fjEsWJqhJGlX1kHjQsfnHoBCFFyIXXQstYDbHzVc?=
 =?us-ascii?Q?rw5KbiVUvUT0DWhzea26xEvEMg9ke7EnhgXtHs86I57RveHrLBEpNeVOXUGY?=
 =?us-ascii?Q?fXLylr3cKOhulyAcTk42toXJJa3QFFoI9IguMUjm1oElL0/JxwPIfHpjUwNb?=
 =?us-ascii?Q?fE3wkpYne2Z46/Nh9kHxyWqN13RMjmId5J/Q8QIzZUOO6tFSEzvlgB48eM3r?=
 =?us-ascii?Q?n4aytS8iDvWJsfcqq3By7URZKeCRKSK2+ta0LOumH3n386z9aJwMmD6eoLJb?=
 =?us-ascii?Q?uPKeS2zqx2nQSusSZ/SAenJ1rlLgpT2ohYBrXX9k4jdfuKCzuw8sFo5RscFX?=
 =?us-ascii?Q?f5TNyIWvJTnbgcG6c0SGqPPgVICuITK5EWbQWJMbXc6830/ZwFSJpzOEuuWs?=
 =?us-ascii?Q?0fgNdQgySQoR1EFAEGg=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf6af8a-1ac9-4775-3e08-08dab6b526dd
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 18:17:18.4809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nzjtRH+f8t0+bxmHEncEdy4sQ9AjaAEjXqHFIIYpgWOA2a7xcaqR02lFnt6NR2uV
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

This error unwind is getting complicated. Move all the code into two
pair'd function. The functions should be called when the open_count == 1
after incrementing/before decrementing.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/vfio_main.c | 95 ++++++++++++++++++++++------------------
 1 file changed, 53 insertions(+), 42 deletions(-)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 2d168793d4e1ce..d043383fc3ba2b 100644
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
+	 * Here we pass the KVM pointer with the group under the read lock.  If
+	 * the device driver will use it, it must obtain a reference and release
+	 * it during close_device.
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
2.38.0

