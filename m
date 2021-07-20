Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A8F3D0095
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 19:43:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9E76E511;
	Tue, 20 Jul 2021 17:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CC66E4C7;
 Tue, 20 Jul 2021 17:43:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLhHc8qA+J5ZxrZBJnUKJMZ9x8w3cvSF7ek0+emdfJLmCITPui/UNkDiYEyhQubpDNU7t02DchP2FDlNbLGJ/Dv/aTjX0hzKZXw6KIkI+rg/rjEpRO4BmsTEak0oQi72kyaCLBBdGngdYzslJEJ/h3CLH9Aanmnj4oNe0zVb4+HVEkEdAAtecq/cUrerTOdx0A2kYCwjHKpg9WxJpTMxinZ77NQYn0NZ0YKy7Lmyr1mhsKrYMli4AwiloKltaQR5lmJ22d9dEF6xGFy2/Z0mVSCsqeLFlKPM/n194rr/jMYlPIv7B/51MX6jDBH2nHO8GJshcF9hJ+eMHksEYfIIBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEW6a736NdKyaz8Ax/GwfdrWAK5zGMeI/ZEa/De9Uqg=;
 b=Guf92MHxve/nJWd1p1yvmzXyJFNBoVMPrSBM9MieLis+7aA7lBntlfE3gbnnKIf5DaCHLqEgWoCVpgAlFTEYsRQmt9Ijy/phZN+upStXKo2txyPNWyRG9kFDe5iGhfFcdDEjx+vbP7yCbmNun4sKypY64SwZSc0OtcVLi3JTppVLUANPNARWcok/UVIZ5JUBF8lh4vdUcJ2BIcwuNJNsdHXfe/AQa3X4NzByFs2DS3mijnxMy5syOllQ2iwykPNUDI6RVOZLayeqxBpyp33z2cw4G8slvJ/rDJ+/tGxLSRoh2fPb+ztVrY8ZeDHLIuUi5T0pzErErtqFVd+MTm7R6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEW6a736NdKyaz8Ax/GwfdrWAK5zGMeI/ZEa/De9Uqg=;
 b=ktMLKVvGd5+VXn7q8AoXEu6RyMnP1RwSRAj8PTZW7bBjhlsUVYrT8iZ2Mn0HN72mVT9/4gJ20Bb7bT3oI5hELm/2CwGFWl3Clp61n5mrs1ySsGNHA7kkdfsnJd3yiKtmXmpcYgXFzlcWsyNPgxowdTEQIp9dAYkqiChysYDpIlRchqpZzNbVmvXz1EuYoVUqmGnKwBsAazb8eJ3VUl5T9FAX9d38XCO+8Q7NEag61lGwwPX3W9ob+/wb4yUSDAmgLcg2R7+iUj/AyNWu2YpmRONC7hxq09hO2Hge887XwqOQu3zso8D6mSbuMnN/vsfMZ0SeJTO0BfJoBMJXsr9HTg==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5288.namprd12.prod.outlook.com (2603:10b6:208:314::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 17:43:06 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 17:43:06 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, Diana Craciun <diana.craciun@oss.nxp.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>,
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
 Vineeth Vijayan <vneethv@linux.ibm.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v2 06/14] vfio/fsl: Move to the device set infrastructure
Date: Tue, 20 Jul 2021 14:42:52 -0300
Message-Id: <6-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR02CA0015.namprd02.prod.outlook.com
 (2603:10b6:208:fc::28) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR02CA0015.namprd02.prod.outlook.com (2603:10b6:208:fc::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Tue, 20 Jul 2021 17:43:03 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m5tll-0051Et-Bw; Tue, 20 Jul 2021 14:43:01 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3f49cae-f730-4f31-6f33-08d94ba5d325
X-MS-TrafficTypeDiagnostic: BL1PR12MB5288:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5288D41696E9F2EDB91FDC67C2E29@BL1PR12MB5288.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BMCVBIxl1tPZC7AqHGjiOQP/Bf1F6u07WosE3bFkCith7JLyjPGYEpTxg9Npq4Tvs7FlinbtaPP1GkjVdQzocMq4XN4WCorDcQ8W/xNZJF2rxnk8IGDgIObcn1HSEKr1bDuDYDuKYPSvyqByTmZBhBP2npK80/3E3+oV9OTKjPMsvXSOYbQDjgXLTlisskMpdkEwRK56x09g3eCHhiR8CIBHdXKz1pEr9C/BzePyKommLaB3kYA/h3KHfmRfLExjV2SnC/xX406bYk6kakuu7nSQCCfdyywmcyrLC31PnMhTZuWgTiK+YzDsoBYlndT3ja2Os3UKduPCv0M0cGJxjk+6qePzVJghwxCrsz9IDoLUaK26z5eiYFKq9/fYafVh5rB2kgb644GUmTBqTho/1EUpipbT2EOIxURqz5XcPnn5f+EfarpOTyGSTFJZeCJHRxvhTCOuEklR/n3Qlg/aVV8ipbz0m6yb2MR6giQX/lYHhzLUDEG7m1mEaqWMI+i5le9Xcusrca81EVT6WvdkLdZLflifZtYCQiTZKgMuIXXqW9d9e48bs7nCIkNX4rVtMWXnnpMom4Eo1Q/QRCRxqpS5Rzbb1yOmUI3Ft3Cv3uNRg9vQKjtw17BJKarkkkwJTGHOzSdxcJPX+rakePUgq+ZKJ9KaWKTc80sdxztHncu8fO5gKmSTMeyrc1Xk4FSlxY2auqwczWH77QlVeXC9TQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(6666004)(66946007)(7416002)(7406005)(86362001)(2906002)(66476007)(54906003)(38100700002)(83380400001)(8936002)(316002)(110136005)(478600001)(36756003)(66556008)(186003)(26005)(5660300002)(8676002)(921005)(9786002)(9746002)(4326008)(426003)(2616005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?61TgUyWCIFUtOu2ZdaFX6DAhJbxStyjiYYXHU3xWA48xVa+hg9U+7sE+K+Om?=
 =?us-ascii?Q?/+HlJyaCfcilE+7wD/GjAFHhq1hRxtipE7LYQFC/C1Nq7fa/oM+NCCh0CbQ4?=
 =?us-ascii?Q?SolDsnnYvUxB0gWWunoUefjoRyrOH/4Nyu8uU4QVaR25jH4N72VIYqLj6Mqb?=
 =?us-ascii?Q?ymhTFUIfPLnlL1m1/eikF4rd3JwXtFiO0BwCyIbDXaMeJWt2VF7hGRi2pUx2?=
 =?us-ascii?Q?TV5s9c49Ddg+6RbAwFDEZsIH7+wCpxzFJDPLBUBCskUmucBZpx2CesdAEVj9?=
 =?us-ascii?Q?Zul0BVJTtpunxL84Keup3pACpJgLUaJvThqKSuOTAqTApHxZY1PlzSDaMuXY?=
 =?us-ascii?Q?BxBTeF1OFFyC2HhrMsDlRT8FyWsLu5y8aCXsUeaR+DMwVQMulZserxNEb/yv?=
 =?us-ascii?Q?hLs5qJ8/mMt+EJIoRkp7d6KT6UZP1NWNlLaPcZRk3/w/tfUnbbZYdtdAmOSx?=
 =?us-ascii?Q?beQ89dLNjV6B2It6h2htEHCCypPVWOfdqoZxl8SDe6yFqO8AaScSwAVwItUu?=
 =?us-ascii?Q?TdLYN9Ljj2MlMIdm45aBaUGUZo/MV5gUamgsvT6rOjfBamuBIdpo5nKmIA7E?=
 =?us-ascii?Q?ShKRbnHJHXDPGCa7gntsWBQ95GAUl3afTrg6IFDASmDwk4w4V7dpJ9l5TAho?=
 =?us-ascii?Q?/jgvq0XKwXbYPD0FWzV+qHIfvA9OMcpLSisgzYsxAMZTJo334a9VvVPv65eu?=
 =?us-ascii?Q?naWvkB0ke7uzg3jPbtSdeIXFPwbVLmw6j7Yg62IHcBsuXgKcvo4b/9S58BdT?=
 =?us-ascii?Q?0U5z9fjOPfZR9ggfqV44KQUFk4KRWMfAazxJ5NB4eOP0LaTf+uFiS9nHm5MO?=
 =?us-ascii?Q?27e8AYYRkd+/+HD1vNbPBIFb0JrCwnUOXJno8xBJkLQuyNaMGyE4XuXM5PbJ?=
 =?us-ascii?Q?SLXIT8yPFV6AlStal5q0xNjC1iAFOPBNHAaj9ffgvvjvM3MjG2jC8RdJAVE0?=
 =?us-ascii?Q?VOpkCWt2etJ2VudDIdB/NbfAEnWvXVoi/s9SFJrqbAyCnhACPF971aKkky1Y?=
 =?us-ascii?Q?/5tm5Yc/3ITbxsJk8Lxa8Ww1JjzNDltpXKv753fJ2ooyRddCgCuPiF03DHoi?=
 =?us-ascii?Q?AK9WPFvzsp4hxmUTwxVVy8w3aheYRbAxHXIopZLZvcQU1SOTc6PnQ3COe00l?=
 =?us-ascii?Q?BkvqBPdqSVxzj7tKlFvvXPhahow/e3xn3qSdPY+jLtSu5WD2XTbrA3mbdJNX?=
 =?us-ascii?Q?QVc9SxJZ58gmTqJSw6edvKeWg/kgW5b8NMr5H8kj6/4u5RtrMX1Af/RnKxfB?=
 =?us-ascii?Q?18fTmLpPxy3mZlMAOkYol8zKtWZkZLZFEQq6ETVX65BIbCsXmbbqq3yFFXDA?=
 =?us-ascii?Q?FCoULeLp8XT3dhlFzF9OTfhL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f49cae-f730-4f31-6f33-08d94ba5d325
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 17:43:03.6357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nbVtbNW36/6IqLeSeAH2M7ByaS1sHP01aZshiIxsp4VCZ6eFlnLJB6Jq+ejXe4zH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5288
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 "Raj, Ashok" <ashok.raj@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

FSL uses the internal reflck to implement the open_device() functionality,
conversion to the core code is straightforward.

The decision on which set to be part of is trivially based on the
is_fsl_mc_bus_dprc() and we use a 'struct device *' pointer as the set_id.

The dev_set lock is protecting the interrupts setup. The FSL MC devices
are using MSIs and only the DPRC device is allocating the MSIs from the
MSI domain. The other devices just take interrupts from a pool. The lock
is protecting the access to this pool.

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
Tested-by: Diana Craciun OSS <diana.craciun@oss.nxp.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/fsl-mc/vfio_fsl_mc.c         | 153 ++++------------------
 drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c    |   6 +-
 drivers/vfio/fsl-mc/vfio_fsl_mc_private.h |   7 -
 3 files changed, 27 insertions(+), 139 deletions(-)

diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
index 122997c61ba450..0dc87a23a51302 100644
--- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
+++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
@@ -19,81 +19,10 @@
 
 static struct fsl_mc_driver vfio_fsl_mc_driver;
 
-static DEFINE_MUTEX(reflck_lock);
-
-static void vfio_fsl_mc_reflck_get(struct vfio_fsl_mc_reflck *reflck)
-{
-	kref_get(&reflck->kref);
-}
-
-static void vfio_fsl_mc_reflck_release(struct kref *kref)
-{
-	struct vfio_fsl_mc_reflck *reflck = container_of(kref,
-						      struct vfio_fsl_mc_reflck,
-						      kref);
-
-	mutex_destroy(&reflck->lock);
-	kfree(reflck);
-	mutex_unlock(&reflck_lock);
-}
-
-static void vfio_fsl_mc_reflck_put(struct vfio_fsl_mc_reflck *reflck)
-{
-	kref_put_mutex(&reflck->kref, vfio_fsl_mc_reflck_release, &reflck_lock);
-}
-
-static struct vfio_fsl_mc_reflck *vfio_fsl_mc_reflck_alloc(void)
-{
-	struct vfio_fsl_mc_reflck *reflck;
-
-	reflck = kzalloc(sizeof(*reflck), GFP_KERNEL);
-	if (!reflck)
-		return ERR_PTR(-ENOMEM);
-
-	kref_init(&reflck->kref);
-	mutex_init(&reflck->lock);
-
-	return reflck;
-}
-
-static int vfio_fsl_mc_reflck_attach(struct vfio_fsl_mc_device *vdev)
-{
-	int ret = 0;
-
-	mutex_lock(&reflck_lock);
-	if (is_fsl_mc_bus_dprc(vdev->mc_dev)) {
-		vdev->reflck = vfio_fsl_mc_reflck_alloc();
-		ret = PTR_ERR_OR_ZERO(vdev->reflck);
-	} else {
-		struct device *mc_cont_dev = vdev->mc_dev->dev.parent;
-		struct vfio_device *device;
-		struct vfio_fsl_mc_device *cont_vdev;
-
-		device = vfio_device_get_from_dev(mc_cont_dev);
-		if (!device) {
-			ret = -ENODEV;
-			goto unlock;
-		}
-
-		cont_vdev =
-			container_of(device, struct vfio_fsl_mc_device, vdev);
-		if (!cont_vdev || !cont_vdev->reflck) {
-			vfio_device_put(device);
-			ret = -ENODEV;
-			goto unlock;
-		}
-		vfio_fsl_mc_reflck_get(cont_vdev->reflck);
-		vdev->reflck = cont_vdev->reflck;
-		vfio_device_put(device);
-	}
-
-unlock:
-	mutex_unlock(&reflck_lock);
-	return ret;
-}
-
-static int vfio_fsl_mc_regions_init(struct vfio_fsl_mc_device *vdev)
+static int vfio_fsl_mc_open_device(struct vfio_device *core_vdev)
 {
+	struct vfio_fsl_mc_device *vdev =
+		container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
 	struct fsl_mc_device *mc_dev = vdev->mc_dev;
 	int count = mc_dev->obj_desc.region_count;
 	int i;
@@ -136,58 +65,30 @@ static void vfio_fsl_mc_regions_cleanup(struct vfio_fsl_mc_device *vdev)
 	kfree(vdev->regions);
 }
 
-static int vfio_fsl_mc_open(struct vfio_device *core_vdev)
-{
-	struct vfio_fsl_mc_device *vdev =
-		container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
-	int ret = 0;
-
-	mutex_lock(&vdev->reflck->lock);
-	if (!vdev->refcnt) {
-		ret = vfio_fsl_mc_regions_init(vdev);
-		if (ret)
-			goto out;
-	}
-	vdev->refcnt++;
-out:
-	mutex_unlock(&vdev->reflck->lock);
 
-	return ret;
-}
-
-static void vfio_fsl_mc_release(struct vfio_device *core_vdev)
+static void vfio_fsl_mc_close_device(struct vfio_device *core_vdev)
 {
 	struct vfio_fsl_mc_device *vdev =
 		container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
+	struct fsl_mc_device *mc_dev = vdev->mc_dev;
+	struct device *cont_dev = fsl_mc_cont_dev(&mc_dev->dev);
+	struct fsl_mc_device *mc_cont = to_fsl_mc_device(cont_dev);
 	int ret;
 
-	mutex_lock(&vdev->reflck->lock);
-
-	if (!(--vdev->refcnt)) {
-		struct fsl_mc_device *mc_dev = vdev->mc_dev;
-		struct device *cont_dev = fsl_mc_cont_dev(&mc_dev->dev);
-		struct fsl_mc_device *mc_cont = to_fsl_mc_device(cont_dev);
-
-		vfio_fsl_mc_regions_cleanup(vdev);
+	vfio_fsl_mc_regions_cleanup(vdev);
 
-		/* reset the device before cleaning up the interrupts */
-		ret = dprc_reset_container(mc_cont->mc_io, 0,
-		      mc_cont->mc_handle,
-			  mc_cont->obj_desc.id,
-			  DPRC_RESET_OPTION_NON_RECURSIVE);
+	/* reset the device before cleaning up the interrupts */
+	ret = dprc_reset_container(mc_cont->mc_io, 0, mc_cont->mc_handle,
+				   mc_cont->obj_desc.id,
+				   DPRC_RESET_OPTION_NON_RECURSIVE);
 
-		if (ret) {
-			dev_warn(&mc_cont->dev, "VFIO_FLS_MC: reset device has failed (%d)\n",
-				 ret);
-			WARN_ON(1);
-		}
+	if (WARN_ON(ret))
+		dev_warn(&mc_cont->dev,
+			 "VFIO_FLS_MC: reset device has failed (%d)\n", ret);
 
-		vfio_fsl_mc_irqs_cleanup(vdev);
+	vfio_fsl_mc_irqs_cleanup(vdev);
 
-		fsl_mc_cleanup_irq_pool(mc_cont);
-	}
-
-	mutex_unlock(&vdev->reflck->lock);
+	fsl_mc_cleanup_irq_pool(mc_cont);
 }
 
 static long vfio_fsl_mc_ioctl(struct vfio_device *core_vdev,
@@ -504,8 +405,8 @@ static int vfio_fsl_mc_mmap(struct vfio_device *core_vdev,
 
 static const struct vfio_device_ops vfio_fsl_mc_ops = {
 	.name		= "vfio-fsl-mc",
-	.open		= vfio_fsl_mc_open,
-	.release	= vfio_fsl_mc_release,
+	.open_device	= vfio_fsl_mc_open_device,
+	.close_device	= vfio_fsl_mc_close_device,
 	.ioctl		= vfio_fsl_mc_ioctl,
 	.read		= vfio_fsl_mc_read,
 	.write		= vfio_fsl_mc_write,
@@ -625,13 +526,15 @@ static int vfio_fsl_mc_probe(struct fsl_mc_device *mc_dev)
 	vdev->mc_dev = mc_dev;
 	mutex_init(&vdev->igate);
 
-	ret = vfio_fsl_mc_reflck_attach(vdev);
+	ret = vfio_assign_device_set(&vdev->vdev, is_fsl_mc_bus_dprc(mc_dev) ?
+							  &mc_dev->dev :
+							  mc_dev->dev.parent);
 	if (ret)
 		goto out_uninit;
 
 	ret = vfio_fsl_mc_init_device(vdev);
 	if (ret)
-		goto out_reflck;
+		goto out_uninit;
 
 	ret = vfio_register_group_dev(&vdev->vdev);
 	if (ret) {
@@ -639,12 +542,6 @@ static int vfio_fsl_mc_probe(struct fsl_mc_device *mc_dev)
 		goto out_device;
 	}
 
-	/*
-	 * This triggers recursion into vfio_fsl_mc_probe() on another device
-	 * and the vfio_fsl_mc_reflck_attach() must succeed, which relies on the
-	 * vfio_add_group_dev() above. It has no impact on this vdev, so it is
-	 * safe to be after the vfio device is made live.
-	 */
 	ret = vfio_fsl_mc_scan_container(mc_dev);
 	if (ret)
 		goto out_group_dev;
@@ -655,8 +552,6 @@ static int vfio_fsl_mc_probe(struct fsl_mc_device *mc_dev)
 	vfio_unregister_group_dev(&vdev->vdev);
 out_device:
 	vfio_fsl_uninit_device(vdev);
-out_reflck:
-	vfio_fsl_mc_reflck_put(vdev->reflck);
 out_uninit:
 	vfio_uninit_group_dev(&vdev->vdev);
 	kfree(vdev);
@@ -675,7 +570,7 @@ static int vfio_fsl_mc_remove(struct fsl_mc_device *mc_dev)
 
 	dprc_remove_devices(mc_dev, NULL, 0);
 	vfio_fsl_uninit_device(vdev);
-	vfio_fsl_mc_reflck_put(vdev->reflck);
+
 	vfio_uninit_group_dev(&vdev->vdev);
 	kfree(vdev);
 	vfio_iommu_group_put(mc_dev->dev.iommu_group, dev);
diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c b/drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c
index 0d9f3002df7f51..77e584093a233d 100644
--- a/drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c
+++ b/drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c
@@ -120,7 +120,7 @@ static int vfio_fsl_mc_set_irq_trigger(struct vfio_fsl_mc_device *vdev,
 	if (start != 0 || count != 1)
 		return -EINVAL;
 
-	mutex_lock(&vdev->reflck->lock);
+	mutex_lock(&vdev->vdev.dev_set->lock);
 	ret = fsl_mc_populate_irq_pool(mc_cont,
 			FSL_MC_IRQ_POOL_MAX_TOTAL_IRQS);
 	if (ret)
@@ -129,7 +129,7 @@ static int vfio_fsl_mc_set_irq_trigger(struct vfio_fsl_mc_device *vdev,
 	ret = vfio_fsl_mc_irqs_allocate(vdev);
 	if (ret)
 		goto unlock;
-	mutex_unlock(&vdev->reflck->lock);
+	mutex_unlock(&vdev->vdev.dev_set->lock);
 
 	if (flags & VFIO_IRQ_SET_DATA_EVENTFD) {
 		s32 fd = *(s32 *)data;
@@ -154,7 +154,7 @@ static int vfio_fsl_mc_set_irq_trigger(struct vfio_fsl_mc_device *vdev,
 	return 0;
 
 unlock:
-	mutex_unlock(&vdev->reflck->lock);
+	mutex_unlock(&vdev->vdev.dev_set->lock);
 	return ret;
 
 }
diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc_private.h b/drivers/vfio/fsl-mc/vfio_fsl_mc_private.h
index 89700e00e77d10..4ad63ececb914b 100644
--- a/drivers/vfio/fsl-mc/vfio_fsl_mc_private.h
+++ b/drivers/vfio/fsl-mc/vfio_fsl_mc_private.h
@@ -22,11 +22,6 @@ struct vfio_fsl_mc_irq {
 	char            *name;
 };
 
-struct vfio_fsl_mc_reflck {
-	struct kref		kref;
-	struct mutex		lock;
-};
-
 struct vfio_fsl_mc_region {
 	u32			flags;
 	u32			type;
@@ -39,9 +34,7 @@ struct vfio_fsl_mc_device {
 	struct vfio_device		vdev;
 	struct fsl_mc_device		*mc_dev;
 	struct notifier_block        nb;
-	int				refcnt;
 	struct vfio_fsl_mc_region	*regions;
-	struct vfio_fsl_mc_reflck   *reflck;
 	struct mutex         igate;
 	struct vfio_fsl_mc_irq      *mc_irqs;
 };
-- 
2.32.0

