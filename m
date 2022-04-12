Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 553BA4FE554
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 17:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B828310E6F9;
	Tue, 12 Apr 2022 15:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2075.outbound.protection.outlook.com [40.107.102.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F1F10E5AB;
 Tue, 12 Apr 2022 15:53:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxvAZk6BwFOihfMNufU0JTJBg5kjllEOBTrw51GCov+rVYTfaN3TdlSCAsnhCuv6yUu+Z7kvkyf4vcUvRY6LjN22pCILVPiM2aaMJDzi25ORqmkhp+RujFUGvUv790ulKEF2sgKVHsUwW2TxC5KQE/uZRnVQmA9K+h5AwsaXMshW7RTHb9kp/jhnJV4kYnlJ9ZSTis49oaR2xmCYsg+x4/HFnTVxS1eCW7AHr30HQ2Mj+kqgZdvMg5o75HTiKTF7dknU+N9D9IMr1qPnKCgjQyifsc+K+3YI5PMQtkm1V+YoXZsMW7e1b3LCTU/qmVHZIdSS5A8qtbD/s9OnIvjkng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrZ9g3FaZI20+0MWXqn4DjRgP3laNrkGpp4uvldcai4=;
 b=Xcvv0mMxndYrokMsE8a92AsDGEFFAnZGottin27FTgopfvckwq0eOE5tnYZm8LRIOwY51UU+B5sgqDU7jQNIH6kNc8KlWY3r9kheECQfuJ36luVJLutFEBBf77X/evTNYoiJEn3+N8gJHGASMLoz+bJe3pjr68PnEU/soshsHsGykHwqUaN1CSJPeB0QtMA6LIhiccj0EBrEMDLYfBpApxOC9zTKUrALq0uGcgr+CeCFAd5KEckUASZ9Bcp65s2NyxZQdJ3eROyvaqmnmVNXHOHaCf2qEHUFdsncxZdq1mhI2bVIf7JUsZmL0QhL0BYwVzSWLoNjqSIbt5YCzWYpDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PrZ9g3FaZI20+0MWXqn4DjRgP3laNrkGpp4uvldcai4=;
 b=cICATLSsSyMVY/PVkzZKXqvZK5e5JSe+Fr8zbdArfnmO+gMDJBJq/eaTuotdVDMWtcaLyHKU4E2AkdQyNoVwuanfdQOHw47JNGMc5WKFIPt4HkXW3POKGqe8PE6TVH6GuGXd5ln3X9vnoBprUO8DII8OmQVQo0EsMfyLZ1IF7LVLKN3CRV2mxjRruMCJGeDg5R5utN7/T4DA/PngLciMrDF6yLcQ5/TH/FBYuvofmdAtpGkmtcon85B0s0S29evOOgu7iHRFm93kmfKb4c1axQdy//zs5vYTqzah/Dx/H/DTrQ+wY+pChlYrdnHiMQZPDwnmjD8W0sBYUOviNILw2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB4181.namprd12.prod.outlook.com (2603:10b6:610:a8::16)
 by MN2PR12MB4045.namprd12.prod.outlook.com (2603:10b6:208:1d6::15)
 with Microsoft SMTP Server (version=TLS1_2,
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
Subject: [PATCH 7/9] drm/i915/gvt: Delete kvmgt_vdev::vfio_group
Date: Tue, 12 Apr 2022 12:53:34 -0300
Message-Id: <7-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <0-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR0102CA0019.prod.exchangelabs.com
 (2603:10b6:207:18::32) To CH2PR12MB4181.namprd12.prod.outlook.com
 (2603:10b6:610:a8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12731ccf-7502-469d-336b-08da1c9c9bc3
X-MS-TrafficTypeDiagnostic: MN2PR12MB4045:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB404596F71D2C3812D9310D26C2ED9@MN2PR12MB4045.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +1gdDE79vCFuQf11Djx/m8F0jcbZ77MZRaRVeehD6jMoo/3mrXF7NZMHz031TpUU0WJ1A2d0gUBuihI7kr7K1F6iZKK2V8gIuMyKCDM6jPwi+VgC0INqxRbWYpjGLpQJxsoQu0iIC70xETFhTKMtapG47ZFom1gyN3mDVvbca7pA9ujkWIRRJ13c0wstHQV7TbQWksMasTWHxk5TXsYXC19W4AAc52ex6yyvNQznBvBWKI968Y0j+KOAj+g6wGixTvjs2qkdTJKjXxetsxqibrIl5n+4BLo+WhsxGvP3rJJAvxWd+f5yx45L02Inx1Bba/RTa+L1Ohk6exQGOW0VDexSi5kVPljUeb0hshcA7A3CqQBqkLCofG/2J2suKgl2s3MJ+/+9pqBFGqBeiuYNXQWlKyN9wkSDJQgqT2E0+A5Yz94Ng4jsAzWC7K9G2NdbrQlZMoSGOpTBbolMQIJtuGZesh7EbC5mu3XeNj+XSU4aFzZmOifKg4WP163wT66I3oVjbeBVBIX++B3FfJU+xpG3k4yZ8L/RAd40D2beZbQFJPbcJlwYwo31sj1mLCZbqGMssJdMft2oxXylfPJlXbWyfjyP05VswBvmt07xr5+fBwHLplMi66d/H+KzfBfIoQdXPghcCS3RuwYAFv0KN/ziRKJmonwIDlnY0OEWn0ZkKVzuTNE4Oa2jBaizS6tap3WTXCa8ituB1ABUZTU7rg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4181.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(4326008)(8676002)(66946007)(7416002)(2906002)(5660300002)(38100700002)(7406005)(921005)(83380400001)(316002)(2616005)(508600001)(186003)(8936002)(26005)(6512007)(86362001)(6666004)(6506007)(66476007)(6486002)(54906003)(110136005)(66556008)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w2mc698qaOXV/yqNqXC3HxmeDdDK5u7mQUmop/Hr/3Xkxi4R3Dg7p9R4Ofg2?=
 =?us-ascii?Q?tBqUQyEJrR4gquF3spYRRFF+H6MLzcB/om642PkM6MmWyFSbp7UK+uy8pKUw?=
 =?us-ascii?Q?se5t0Rt+zbniTDZ/x5yDoOSaphA24opBSkSErg+n2wBrxHDgiPn8sZSkZ/vD?=
 =?us-ascii?Q?aRxlZF04xMoeDrjZRCaAdPgsk13asDGi3j0tQ7+hWRrYbXXD+1LVWBQi7khQ?=
 =?us-ascii?Q?ggbhOCPLiUgGyTR2v4HOqs9mLRmqZHe6izlUnSYLEFZfg/56YTbOjhzyuEuC?=
 =?us-ascii?Q?E9DjglJxJ2Vaovhhd+mWfQFI9JiaQYZSa3mjWopeddC09cf9m+gZ/bUfzv/k?=
 =?us-ascii?Q?yKSrKFpKWy2DXo8l+9pEhBMV3HlfL3pQybLbKC77Uf9NxHBoRTsJkkslZbiV?=
 =?us-ascii?Q?sscjUii7G3WsdzAz3Houeif5vMscgFnJZTo68hcolbHwp6keFYhfXUTvg8Mm?=
 =?us-ascii?Q?BkDrnceCsbN18po3eTtQ5/5gctedvewVByJSdxzT1K0Y4dkJwiOY0uXCsA9W?=
 =?us-ascii?Q?fW6dMpXTGBBOuQUHW9KvPjeGMFulFOLLNY0twNb1P27cR/BdbHzlQ1M5MJCz?=
 =?us-ascii?Q?65L0BChH/5enqYX0Q1czAIPipcILNiky3zCtnJcHOVGqkJuBj64Hxs2ko3JF?=
 =?us-ascii?Q?xpVqWFpu63rmzFeiqqjsPYJlH9bXUqvMxLuwK8uRP4DbGkw3F6mGchsUzvC3?=
 =?us-ascii?Q?dRxh6WhmGfS0QpGjwSn953ydBqG/pWUEU2/kaUhQSsUj/GyjbkFDxWf6cCWE?=
 =?us-ascii?Q?8U096aHkoeHcRld3ec3XVu/IEkHBanWGPO7ynuWPH4QynUFavL3l8ZakXZvm?=
 =?us-ascii?Q?uItGltG478wxuHHi+FbN0brP10Vha4XVEWEHEdQkaB8cSADUgqJ8MgF7OJCZ?=
 =?us-ascii?Q?SfQ4tN4q3Fzc5N6+c6aj9w0qGrWboHTPe1omJq8JYJLVMRDODJWkM4HauLXn?=
 =?us-ascii?Q?9/3fa3XnULLEjvIasosi+oDMWZyVLxnh3BOREoaCsFo7PyVlIchWUCz/HHfl?=
 =?us-ascii?Q?g7yZDd6gHh9unhW/DFvFLnAQk24MKLLFi6hTFiX+tQdPWQDu3Lo0y7c3fh2L?=
 =?us-ascii?Q?AggDhDTIDbmIUustSl3rQEMQkFJEJ/Rhd/Yq6jLjq3+7YglXIETbK0UtBf83?=
 =?us-ascii?Q?EKdHuHiahfPYzz1BKk8YrItSNQGdXLJdP7QQE4U7JoOFgvRdaOnAi6ZBT4U/?=
 =?us-ascii?Q?+ZobHi8MbQ5lV3WYTkVCQKsgApL5hDIBv7/N4FM7TbjOnOp14flKDERb5mUb?=
 =?us-ascii?Q?OWRsq+tHD5A4DTcjbuXWYFpElxw3IX9jBFc6YJeBctQbZUr/D8gxuSVxTHph?=
 =?us-ascii?Q?gxVpVytL37xJjPhRenhiDYMB+pUPofbEI1OcfCj7XSVcUv8FkArL4jLRHewi?=
 =?us-ascii?Q?CkkvZu2Dsb2sbZZv9/wgPE5HuHKcSyzZn2VmJPlYMoHoPc3U9YYCxaK6Rr3l?=
 =?us-ascii?Q?lLH25PxpywNSywP7t33EYumOHt/jCjCRgM5Nzn2K6HV86HyOUfKDj1FfDlcI?=
 =?us-ascii?Q?FNpWkdGp5i8yTYsrnrJU/kpNpXJXo3gFyzHRw0eX4f/kUYRHl9ej157qreLk?=
 =?us-ascii?Q?tC1t2w+FH7qpDqRCbVERAiZ+2ggLcw5YAtOOS+hD2J9QY1wQpNu53Bx1CNkd?=
 =?us-ascii?Q?t7yU3K5NlhfrNwX/NTAAISZWNH6hkCtLxU3Gf1AA6uZ6/0UJqtNfXH8TU3tr?=
 =?us-ascii?Q?aU2wkFPCYWtNrNeuNBwlmnUt/lbyKgyPTsEScD2FysFJe+eAi/7HFCyJGCAH?=
 =?us-ascii?Q?yk+FOJBhhg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12731ccf-7502-469d-336b-08da1c9c9bc3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4181.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 15:53:38.1032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VT4kOgz3l/NY16q9GFz/3cJdwkg2rxt3QqbZvjPN22MNHRKzDP+PmEVhlJLiiSM/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4045
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

Nothing references this struct member any more, delete it completely.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index d7c22a2601f3ad..b15dbe9ecd7e15 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -133,7 +133,6 @@ struct kvmgt_vdev {
 	struct work_struct release_work;
 	atomic_t released;
 	struct vfio_device *vfio_device;
-	struct vfio_group *vfio_group;
 };
 
 static inline struct kvmgt_vdev *kvmgt_vdev(struct intel_vgpu *vgpu)
@@ -911,7 +910,6 @@ static int intel_vgpu_open_device(struct mdev_device *mdev)
 	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 	unsigned long events;
 	int ret;
-	struct vfio_group *vfio_group;
 
 	vdev->iommu_notifier.notifier_call = intel_vgpu_iommu_notifier;
 	vdev->group_notifier.notifier_call = intel_vgpu_group_notifier;
@@ -934,20 +932,12 @@ static int intel_vgpu_open_device(struct mdev_device *mdev)
 		goto undo_iommu;
 	}
 
-	vfio_group = vfio_group_get_external_user_from_dev(mdev_dev(mdev));
-	if (IS_ERR_OR_NULL(vfio_group)) {
-		ret = !vfio_group ? -EFAULT : PTR_ERR(vfio_group);
-		gvt_vgpu_err("vfio_group_get_external_user_from_dev failed\n");
-		goto undo_register;
-	}
-	vdev->vfio_group = vfio_group;
-
 	/* Take a module reference as mdev core doesn't take
 	 * a reference for vendor driver.
 	 */
 	if (!try_module_get(THIS_MODULE)) {
 		ret = -ENODEV;
-		goto undo_group;
+		goto undo_register;
 	}
 
 	ret = kvmgt_guest_init(mdev);
@@ -962,10 +952,6 @@ static int intel_vgpu_open_device(struct mdev_device *mdev)
 undo_module_get:
 	module_put(THIS_MODULE);
 
-undo_group:
-	vfio_group_put_external_user(vdev->vfio_group);
-	vdev->vfio_group = NULL;
-
 undo_register:
 	vfio_unregister_notifier(vfio_dev, VFIO_GROUP_NOTIFY,
 					&vdev->group_notifier);
@@ -1023,7 +1009,6 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 	kvmgt_guest_exit(info);
 
 	intel_vgpu_release_msi_eventfd_ctx(vgpu);
-	vfio_group_put_external_user(vdev->vfio_group);
 
 	vdev->kvm = NULL;
 	vgpu->handle = 0;
-- 
2.35.1

