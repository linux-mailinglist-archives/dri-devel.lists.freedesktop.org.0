Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CA33E20DB
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 03:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8410189958;
	Fri,  6 Aug 2021 01:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53D26E8FE;
 Fri,  6 Aug 2021 01:19:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSkbX+KsWhh3ILky7SDp5nQ2uxeC9Mp7rvXOoTKUcvBnVa/gZOuUGEfoVaddZLlKcOsww71l4NaxLpwNCfOIZo96pHVzeX+fabXeebdNEu91mwWQZVTcy5cXFMZgqaaLXHKiYsvA2kDDDKy29+OGCpOgre/WV1pWprsKalDby3EXlcLhShc0dDV1y7peX/zgVDwVwgdjmr4MhgYb1MpGsYmtXIwF0kA8X/IvMnBB0cdMgWtlx0x0VLaRwRLKr5osuqIZlyGxiQN0u9g9S/R0NL4GwVBMGhAk+HR7MALiCTM4IAVfohjSGsPdGng1c81gDyaM+3yOeNGgoD7ujDfAkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrpU1Fv62Z3YZqSXmzyKLeLkM3/gBuN+KeHRxkgJNow=;
 b=EtmdxJ25smge15FlXhEfqwcZ9TxEvhwlKuNP8/flhgBiZthenGMrZRlfwDC44uwZnQTNA8OZXiOpJflFgHVfLaOuv0G8b5J4eBncKhnSd5rUpQqgI6PHTKLGsIOpPKT5tyzAtsDiChY+wQY4YpO4kTec19/0qgg1qkkdkyjTnL5oW4ugLlNPpZsg+KSTfI5aofk9r8+2l34togOHsg8Z8cLr237v7vCvSDPcCCJOEGVHsRkkJuZ4CrqC5RlrSitVOgn1kQ1zYoPRtKY5eVFZSTJsD1lRoWhWAk5oM0MB44z/uUodGMpG8eXifc8UkufECX76I9/HQdelPDDhL9SzuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrpU1Fv62Z3YZqSXmzyKLeLkM3/gBuN+KeHRxkgJNow=;
 b=sLr8BMGnLwEcYZ53hgrYPpL7ePwTSKpnOpNZ0k3GKgk6LTvIMF7BOH66byBrx8kEyG4kquRjx2AKCh2lA6mfMzVZ/n6CA/+/TyPUBHP8D8trzXatrCicPVVn9FWTRurqEtFMvbWWeSQgSrCSUIc089CYwQZLmj5RWZEPE9pgC0E9rLR5XLSftdU4ZlZmFx+/c8XplU5FJ0jwC9Xl5lFSitGd0GgDXPoidm6nQCSUPfozYRZYPMu6Y6t8iehXf7EsFYzxTvhze820ZMs4hp5vP6JK0AKHEgETyBQnWxnF1fUs+dyUD1ZgkDm1IM/UHKDPgpcTV9kx+zO11k26KgasnA==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5206.namprd12.prod.outlook.com (2603:10b6:208:31c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 6 Aug
 2021 01:19:14 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%7]) with mapi id 15.20.4394.018; Fri, 6 Aug 2021
 01:19:14 +0000
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
Cc: "Raj, Ashok" <ashok.raj@intel.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [PATCH v4 06/14] vfio/fsl: Move to the device set infrastructure
Date: Thu,  5 Aug 2021 22:19:02 -0300
Message-Id: <6-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0103.namprd03.prod.outlook.com
 (2603:10b6:208:32a::18) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BLAPR03CA0103.namprd03.prod.outlook.com (2603:10b6:208:32a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Fri, 6 Aug 2021 01:19:12 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mBoVz-00Dt7B-58; Thu, 05 Aug 2021 22:19:11 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05bcaa18-a74d-4901-7089-08d958783350
X-MS-TrafficTypeDiagnostic: BL1PR12MB5206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB520670E6D50F631594435A03C2F39@BL1PR12MB5206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ymso1yhqBVWuOFzOLJPCbxKuqMLENAJdUDh+8+5XcTfraaGo+5/kkpsHO3stXu/7tXrMXGk+REiKMNgBmzBNFwzEVhkTe2xJd7gaCDAUKsKqJqKKRJ+9sI75BJlSb2kNZfNzUlbWIfnrjSOXJ3f0GK8uG9pVQNCzdTrY93o1KBdLnRpXaiN0FjcyxYneCiJUkqS2y7kfIHlRjHWN3H1IDkZN/FMg1hdMaj/bpVqFOm9zS3IcKlODNvQVcb2QoH8P563d5o7b20ckgNuUpfBl1xELUBDQTz+7tFlqm8RoOKCqv4g84qBD8oCoU2k44DGm8NCwo/13dxGbOAg80Bl8dOMKbxO6sH5nYf7SlChKdpHNnuU5fFWP8h+dgzmQEfyKyj7Afz0ZL4a+FtLIUjFjj15UUPy2oAkQThwhPJkv7lrEuDI2KlMast3zgmPnrYpMadmAeeiMwBKmkw7xy6zTSJ0lZoL+X2YuAqwMZ+bTdDyQ2WfUyP7/n50l85ZFpIm648VgXrCrNBX5yvQMTFoODid++hyxGR6yB911uTqZxpOZydHdLgTaHNDr4vBr/fBuXIoRJcRSTR08PT1/ZIOhaEn4AhfHH1zmxjImiPxK59WSsqGFiNKIDN2P2B0+eLFo32kBBkaBXOupVp/HDzPvO5Biu7w9wAcH+ZmYbM351qJHM+N8916oPLH2swlQQEXpYu/gF+JWQUMIMMG0znspog==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9746002)(83380400001)(86362001)(9786002)(8936002)(426003)(2906002)(7416002)(38100700002)(7406005)(66946007)(921005)(8676002)(5660300002)(186003)(2616005)(26005)(36756003)(508600001)(6666004)(66476007)(316002)(4326008)(66556008)(110136005)(54906003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hNAYVRq4XWp9xxAJDJHWAULJjpqzadej2tNbQBf9ZTbBIXzkD+1QVAl0qIBJ?=
 =?us-ascii?Q?uEfh1SWTibVaVuqfmAL2jFEOrojFp1EjM1MbpgwMgOHZ9kKo//2iZ98OvmsU?=
 =?us-ascii?Q?LsyPfXlyktCKtW8gt2IMwq8W2Kob5sdJG5LYjWCGAXJF6JM+6ovuu+2Os68j?=
 =?us-ascii?Q?kIorczKaTBe0uIrIjhKA86y+ogO7XomCz/LKIswyINhfcsX/qiIa3lfAJCnB?=
 =?us-ascii?Q?fFUCHXNYVDDlpDFczMX0zNxMl6BnHzdObnHfTAOOpQOKotwknt7XEEHWesTy?=
 =?us-ascii?Q?zHYph9smbxlWAWSCUNfbFNRA2pf9UieB0UEBBn6gIpCQtAhROEbxMURgPZo/?=
 =?us-ascii?Q?uYqgtDaDgtVIWQqPh2EhQD8+0mO8REsmUSq3dK0x3usYeZj/5V2ERJf/9L4J?=
 =?us-ascii?Q?7efwHBhUNeLrc7pBfAPadK/fog+83G92tZNnTcHUMMMBWVebprvRoCN9NWpL?=
 =?us-ascii?Q?pCh4DyV/BCYG+3tdyOLEEQXjyvTc5NoPAgNUxv8p5BOjQF6I+KMtyDF7UrVP?=
 =?us-ascii?Q?BZ41EguNHpibEbniFkcEI12w2e5laSsuz96tYSi0kZ5F3TPVGhVHUVNx26hy?=
 =?us-ascii?Q?6MOQAZSNI+gPcK1gs+TifaL0jHMgpDRQQWVstP4TZR4t5BzEKGhIfg3kwF/S?=
 =?us-ascii?Q?4uZk3mRIrf2Gcw2vH0m5Y5cFm+BEQXjRI5S2mrs3B8L8xUnOlyWVrPLThugX?=
 =?us-ascii?Q?oRD2izV2jgyYcVhUxrL6kOLdNWMkGKRZdH+QKWaX4thIf+M3DqJs/Rv7DFoq?=
 =?us-ascii?Q?146Vl4tvC8u4ukrMlPXjLNLu5X1GFCdAUnA6RC5pY+eXtl68uVXmN7JpZFVP?=
 =?us-ascii?Q?R8xbo7VtKHAvMAycX/Ld6THLOomSOu+sOsveaWzyMO7QypDhwsgvQ8mr/F4R?=
 =?us-ascii?Q?yoG2iHSSZRZTbYUx3ai4G6xf6pUkUW2OfktyS3i7dKDVxDurSYV3UGaaFgn7?=
 =?us-ascii?Q?k07lJghhbYW0vLowJTn22QUp1r4+qolxlyDL9tNKSdX5ZFPjMmcJ3O3JEShL?=
 =?us-ascii?Q?jh/TTTBujczabghECpDzRUR4xS2l5vXlaOYRyagVnT25cJnmfRb2eURyxMRD?=
 =?us-ascii?Q?HvjUoQAuUPF/KA3iZx6WeCUPRd2LJSskz0Ce0iZFjQ5K4/Tk3/EueCaTfMCa?=
 =?us-ascii?Q?XOkIR9IUhBIomshhHYpGtWCz56XeI9veXSam87FPes1JPe5e70upTL58OMvO?=
 =?us-ascii?Q?vSGUIds+TkJAv591asssE64IRkMSlGWfJ6bTp6LZWZdz+HPmsTRj00oBXgHi?=
 =?us-ascii?Q?BgCK8aicz/BohgspwVxxWJQ18GPbeaGT+93TZY9qZI9IzbV55oKITb7qB3H+?=
 =?us-ascii?Q?dJ+7bBjENfxENw47UC2JFBGU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05bcaa18-a74d-4901-7089-08d958783350
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 01:19:13.1538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T16wKkUPEDnvjVUQKAo3I5IOKNmsHwI4OIiEwmYpPvn9ikLPGxcMYGGFozhXfGPn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5206
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
 drivers/vfio/fsl-mc/vfio_fsl_mc.c         | 156 ++++------------------
 drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c    |   6 +-
 drivers/vfio/fsl-mc/vfio_fsl_mc_private.h |   7 -
 3 files changed, 29 insertions(+), 140 deletions(-)

diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
index 122997c61ba450..0ead91bfa83867 100644
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
-
-	return ret;
-}
-
-static void vfio_fsl_mc_release(struct vfio_device *core_vdev)
+
+static void vfio_fsl_mc_close_device(struct vfio_device *core_vdev)
 {
 	struct vfio_fsl_mc_device *vdev =
 		container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
+	struct fsl_mc_device *mc_dev = vdev->mc_dev;
+	struct device *cont_dev = fsl_mc_cont_dev(&mc_dev->dev);
+	struct fsl_mc_device *mc_cont = to_fsl_mc_device(cont_dev);
 	int ret;
 
-	mutex_lock(&vdev->reflck->lock);
+	vfio_fsl_mc_regions_cleanup(vdev);
 
-	if (!(--vdev->refcnt)) {
-		struct fsl_mc_device *mc_dev = vdev->mc_dev;
-		struct device *cont_dev = fsl_mc_cont_dev(&mc_dev->dev);
-		struct fsl_mc_device *mc_cont = to_fsl_mc_device(cont_dev);
+	/* reset the device before cleaning up the interrupts */
+	ret = dprc_reset_container(mc_cont->mc_io, 0, mc_cont->mc_handle,
+				   mc_cont->obj_desc.id,
+				   DPRC_RESET_OPTION_NON_RECURSIVE);
 
-		vfio_fsl_mc_regions_cleanup(vdev);
+	if (WARN_ON(ret))
+		dev_warn(&mc_cont->dev,
+			 "VFIO_FLS_MC: reset device has failed (%d)\n", ret);
 
-		/* reset the device before cleaning up the interrupts */
-		ret = dprc_reset_container(mc_cont->mc_io, 0,
-		      mc_cont->mc_handle,
-			  mc_cont->obj_desc.id,
-			  DPRC_RESET_OPTION_NON_RECURSIVE);
+	vfio_fsl_mc_irqs_cleanup(vdev);
 
-		if (ret) {
-			dev_warn(&mc_cont->dev, "VFIO_FLS_MC: reset device has failed (%d)\n",
-				 ret);
-			WARN_ON(1);
-		}
-
-		vfio_fsl_mc_irqs_cleanup(vdev);
-
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
@@ -625,13 +526,16 @@ static int vfio_fsl_mc_probe(struct fsl_mc_device *mc_dev)
 	vdev->mc_dev = mc_dev;
 	mutex_init(&vdev->igate);
 
-	ret = vfio_fsl_mc_reflck_attach(vdev);
+	if (is_fsl_mc_bus_dprc(mc_dev))
+		ret = vfio_assign_device_set(&vdev->vdev, &mc_dev->dev);
+	else
+		ret = vfio_assign_device_set(&vdev->vdev, mc_dev->dev.parent);
 	if (ret)
 		goto out_uninit;
 
 	ret = vfio_fsl_mc_init_device(vdev);
 	if (ret)
-		goto out_reflck;
+		goto out_uninit;
 
 	ret = vfio_register_group_dev(&vdev->vdev);
 	if (ret) {
@@ -639,12 +543,6 @@ static int vfio_fsl_mc_probe(struct fsl_mc_device *mc_dev)
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
@@ -655,8 +553,6 @@ static int vfio_fsl_mc_probe(struct fsl_mc_device *mc_dev)
 	vfio_unregister_group_dev(&vdev->vdev);
 out_device:
 	vfio_fsl_uninit_device(vdev);
-out_reflck:
-	vfio_fsl_mc_reflck_put(vdev->reflck);
 out_uninit:
 	vfio_uninit_group_dev(&vdev->vdev);
 	kfree(vdev);
@@ -675,7 +571,7 @@ static int vfio_fsl_mc_remove(struct fsl_mc_device *mc_dev)
 
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

