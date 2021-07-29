Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C183D9A7C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 02:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FBE6EBF6;
	Thu, 29 Jul 2021 00:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4C46EB7C;
 Thu, 29 Jul 2021 00:49:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcCYRzJBjTc8kxnRXh62Zh1MwVxHpcJrUogl5WSXsrzOhctRgWshLGmjNlfBaGTfvPxgWYFxT3XBYwiiWoPAytCJMY07Tnz8HW+1Kjm0synehOKc1vSOlhJDVDjyUX0StuzxdLoTOodPBcE91uKd9xpt1SLzLg6vNDJTsUQ3pKS40snxblfefjTl5i+9wgP+120MAeXHlg7r6npSzA7J/gAcGQrUaONbmmz41uHI9usV0CgA1QMXl31/naX9XKYK0VtpE4cMzj1Tm3TfTyzm7adWyjKE8MBBbcStFGceOXNox0HehR0SI+8h95no8fU18NaMDQkaWm2QTU+jw/cUTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnG8FlFwgYzjJDxn7oxiEkBysHBsP4Kal0iunyEcLtg=;
 b=Wft97wi0Y00mMG1OMqle+OCy/rAcxFanTdFaseV3QEobKAyVhWgcDV5AbMlA53PGCQ4kWOn5qRKDsYH0tLCIhrnp/PidGBRA/W29pakMPhs/1ODNDWEGRSMz7g8JsfKC/Y3UXcWihtT/WO/ZPB+UbzTJvuIOIDHCGJuX9qf9IphFGOQ3RB+0QjcW4unYTGh4fGzci3Qi+Sz+vI/z0z2KrSLEGC6gUayAtMnJJRKYV3N+R9YPBEjJm1od31NhsRyRvo0zOU1Ve2+bp8qwJS8mWyfucb49dEnMsEoJHbvaE9F/hhjyttUl+fZztuSKPTAbb6vreAtDZLauIxuIwKcL8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnG8FlFwgYzjJDxn7oxiEkBysHBsP4Kal0iunyEcLtg=;
 b=CA7fY7f79K1vyBuAkBCVkz0HVrk9hlbKw78bC7pyRcc7y4FPjvQG8ICCFKp2XCF4HG6PYK5AZNz1mEupXmFyfM6Om5WF6vi7m6WfI0TCCNSrDXHCx6tfnQX3VqnvQvSW279Fjqb+r3Pqq/2hF1tb+NH7nwFj9FUoYEIdtxVaPsGjpqupo4JJwPolFHVosGumQAgQZ8JTXgOUFADDmeoaepRQlTtOUMLP+OJyjsghWyt8Pf1RbulS1UBavPSDWfhtbkHRnZincgkW/P8nVUdhQltAbyRW+6uvFAmZMiOTQvDH6C2SGaZdXSPweL1IIEo14C1ccraRjADguFVJTsHlMw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5160.namprd12.prod.outlook.com (2603:10b6:208:311::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Thu, 29 Jul
 2021 00:49:32 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4373.019; Thu, 29 Jul 2021
 00:49:32 +0000
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
Subject: [PATCH v3 03/14] vfio: Introduce a vfio_uninit_group_dev() API call
Date: Wed, 28 Jul 2021 21:49:12 -0300
Message-Id: <3-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YTBPR01CA0031.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::44) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YTBPR01CA0031.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.17 via Frontend Transport; Thu, 29 Jul 2021 00:49:28 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m8uEl-009pmo-QH; Wed, 28 Jul 2021 21:49:23 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 457b601d-b9f2-49c8-d5a6-08d9522ab89d
X-MS-TrafficTypeDiagnostic: BL1PR12MB5160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB51607EF0BFDB9EAD05C663DEC2EB9@BL1PR12MB5160.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZrN2HygifvXKGlxRjDDe3M6iGjNETHKMo9vBLPx2E6hziYLGvCHk433iTkiNpLNP2W2+83KRW5m17hgEgWrh1uTc9FP7MSz8eEQUj7x6iQanlMpPMct9VRUodQrZyGiPPE7ulldu1i0R+AYGni2+eIqe1sOYDBmcyEo1tBb2aqVwUQmH/5ZOfxnsGHeTxLYyNjTPzTOYGzyvRV0RzGSIOFa+uc8Umk5nD7zxyF3cZR8I76IRx9TQJogxJCUmIhCsTTccFDXH5I9a9sLBVFIYF8Kk1dKpyUycaZKcinSPIXRyij5SrfDHHjY8//hpZHHQfkocZJY807w7FygstIXupZwkTDDDenlNz2JXQZVtO/ZOgoUxuHOHaHb9upiCfJX3Zj6nfpoVDOqreM6VAsE4QTa2/u9H3QP7wCOQQgnCTiNLkq2+jgqzZz29jabms8M8M3bBvbJyH4c/KEYyPwMjCXy4pMEq06qpgXLI40lznBH3bbE9e49qfmcp13IPSkT//mnbss0E98Gli2HVYqBlfRweSCAcJixjxI4UY8ZVTJOcpNgufIZS9i6B2ON505vfgrv4E5J/J6ssXZwwtiQJJciapkqxOlQ5dC4/VyNUVWDBm/mr+QlGBv3dlA8PRAmjJPd4ELUFagN6yldoF53AbpVVqVdZd6JQctnWL2C5w0f8D8Grm0EUJ8xrVFMwqVhYL9+43NXyU4RYkeHXb49mkw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(8936002)(86362001)(2906002)(6666004)(426003)(921005)(8676002)(2616005)(5660300002)(30864003)(316002)(186003)(7406005)(7416002)(54906003)(110136005)(26005)(66946007)(66556008)(66476007)(36756003)(9786002)(9746002)(4326008)(83380400001)(478600001)(38100700002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Puba/Za30lNmOxNksFiCOzxomlM0ZgEh8sPbhklT7WtwiH/umDIlkbJQLwOz?=
 =?us-ascii?Q?3U0rJVzkAKbRNr45plD+GNBvh32t/a6SdK3+g2Dka0Yu71iQrWxJ2YtcPprT?=
 =?us-ascii?Q?ksalI6oHscrZC42Q82ZgMmbOgVfWRmdnmzrZR7NgJnwvVqdbYa+s6bTTlojN?=
 =?us-ascii?Q?vQqQOxKKfusXZcS1D/hUR766A8EwXXpCh57UOV2/7lTFGxSZgDpAoIKJTeWl?=
 =?us-ascii?Q?qwgC3jR9HfgI+qWyPGRCJyN6tJE/MwXMJJL+E+OGoqB5031MA8fjt5+o+w8Y?=
 =?us-ascii?Q?XTXLK+2yvbBtZOS+mqgQ/KrysQpHU4mnGQiBN1C5W3HV5DmyG/f/fX5oNOL7?=
 =?us-ascii?Q?RtuPBrOK6I7knd1AdUvCbDLZAE+ns6i2TQBotUtH3r0KwwjP2CoRTgJYwiG5?=
 =?us-ascii?Q?IfpQETOiVnz/yivaxKhhFKPeWkUs6V6Fgu9T7RIhNlS+oaBmln5RR//hy0WV?=
 =?us-ascii?Q?H+WhCr55mmvEgtypoJC1p0sZ19L5quagWxTqjOFiGHx0hCKADipPOtniPejv?=
 =?us-ascii?Q?Mkle5CNdT8ZigVtTv/DxV8xZiNkcTams6+wWNcrwNiDBGUOETe2gJ+vOPjMY?=
 =?us-ascii?Q?BgmejiEWL00jzm/ygcLUsoTn221P61xvneudkiJKuWdnulembj+TbfiNOOVr?=
 =?us-ascii?Q?Aj4ZxA+Tz390JHugqQXFRC87PQL7hZpTOAsm7cAyiO9xlMO5U//ofAx1W13Q?=
 =?us-ascii?Q?uoRijb69JXWMcFO/D7O714jDivSLhft1wVASLWguXFWp72kyVPJd9I88uo2H?=
 =?us-ascii?Q?Slq7XsVXzMwLAncgAqpJU0ielcAIUUbKRDxuVfZjb3RK8/blt01uaxYBFNEt?=
 =?us-ascii?Q?cmNp+kdgtyrWtetebSyYicQuLVebjrKsabAnJYxJEeq4vITJIPvFKJCLr25C?=
 =?us-ascii?Q?qmA82gYCvHB9KlG1AnXLgcus9B/oYHSzr/khlliotsS2QNztQjdOF0R72oaF?=
 =?us-ascii?Q?1CtomWOD0pa72h+L8OJyKJyuPsvL1dFPqM1q1sHNaV01klJw+PQjNtqt3ilU?=
 =?us-ascii?Q?Up2abmhS/vys+zmNSNM2dyeTHaoOSGxBg+p0Y8ljtNdCzQ5q+O+d0vLCTHcG?=
 =?us-ascii?Q?IM8gLCBeIb5Mn53dhIUHsIQeaRghyRMCZPaWvpEf5TDqFZupOu21Mux42Vq9?=
 =?us-ascii?Q?4YWhVdTmu0opvtPNmubKuz/O1bM3Y5at2v3QAoAkNgPoO9fLsA3Jthehn9rU?=
 =?us-ascii?Q?+1YNOUjZMJS3A+h+TYg486cjgLcS4jvh/O3Tyws0ACWDOFyv96ae1n81KWYb?=
 =?us-ascii?Q?azSY2/j9AjQb7Kvk3at+9wBaskO5IQUi+qiuBK4o1aIjEsHSJTNerjYQQZIg?=
 =?us-ascii?Q?FDJyE3d/XPUIZIKyh8xnttR/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 457b601d-b9f2-49c8-d5a6-08d9522ab89d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 00:49:29.3651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3whN+4DSw05HaCfuu/s2JvhWHrA8QG1xFVsXrT+2F+s2iH/nJff3NoByZnJkDUl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5160
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

From: Max Gurtovoy <mgurtovoy@nvidia.com>

This pairs with vfio_init_group_dev() and allows undoing any state that is
stored in the vfio_device unrelated to registration. Add appropriately
placed calls to all the drivers.

The following patch will use this to add pre-registration state for the
device set.

Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 Documentation/driver-api/vfio.rst            |  4 ++-
 drivers/vfio/fsl-mc/vfio_fsl_mc.c            |  7 ++---
 drivers/vfio/mdev/vfio_mdev.c                | 13 +++++++---
 drivers/vfio/pci/vfio_pci.c                  |  6 +++--
 drivers/vfio/platform/vfio_platform_common.c |  7 +++--
 drivers/vfio/vfio.c                          |  5 ++++
 include/linux/vfio.h                         |  1 +
 samples/vfio-mdev/mbochs.c                   |  2 ++
 samples/vfio-mdev/mdpy.c                     | 25 ++++++++++--------
 samples/vfio-mdev/mtty.c                     | 27 ++++++++++++--------
 10 files changed, 64 insertions(+), 33 deletions(-)

diff --git a/Documentation/driver-api/vfio.rst b/Documentation/driver-api/vfio.rst
index 606eed8823ceab..c663b6f978255b 100644
--- a/Documentation/driver-api/vfio.rst
+++ b/Documentation/driver-api/vfio.rst
@@ -255,11 +255,13 @@ vfio_unregister_group_dev() respectively::
 	void vfio_init_group_dev(struct vfio_device *device,
 				struct device *dev,
 				const struct vfio_device_ops *ops);
+	void vfio_uninit_group_dev(struct vfio_device *device);
 	int vfio_register_group_dev(struct vfio_device *device);
 	void vfio_unregister_group_dev(struct vfio_device *device);
 
 The driver should embed the vfio_device in its own structure and call
-vfio_init_group_dev() to pre-configure it before going to registration.
+vfio_init_group_dev() to pre-configure it before going to registration
+and call vfio_uninit_group_dev() after completing the un-registration.
 vfio_register_group_dev() indicates to the core to begin tracking the
 iommu_group of the specified dev and register the dev as owned by a VFIO bus
 driver. Once vfio_register_group_dev() returns it is possible for userspace to
diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
index 90cad109583b80..122997c61ba450 100644
--- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
+++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
@@ -627,7 +627,7 @@ static int vfio_fsl_mc_probe(struct fsl_mc_device *mc_dev)
 
 	ret = vfio_fsl_mc_reflck_attach(vdev);
 	if (ret)
-		goto out_kfree;
+		goto out_uninit;
 
 	ret = vfio_fsl_mc_init_device(vdev);
 	if (ret)
@@ -657,7 +657,8 @@ static int vfio_fsl_mc_probe(struct fsl_mc_device *mc_dev)
 	vfio_fsl_uninit_device(vdev);
 out_reflck:
 	vfio_fsl_mc_reflck_put(vdev->reflck);
-out_kfree:
+out_uninit:
+	vfio_uninit_group_dev(&vdev->vdev);
 	kfree(vdev);
 out_group_put:
 	vfio_iommu_group_put(group, dev);
@@ -675,7 +676,7 @@ static int vfio_fsl_mc_remove(struct fsl_mc_device *mc_dev)
 	dprc_remove_devices(mc_dev, NULL, 0);
 	vfio_fsl_uninit_device(vdev);
 	vfio_fsl_mc_reflck_put(vdev->reflck);
-
+	vfio_uninit_group_dev(&vdev->vdev);
 	kfree(vdev);
 	vfio_iommu_group_put(mc_dev->dev.iommu_group, dev);
 
diff --git a/drivers/vfio/mdev/vfio_mdev.c b/drivers/vfio/mdev/vfio_mdev.c
index 39ef7489fe4719..a5c77ccb24f70a 100644
--- a/drivers/vfio/mdev/vfio_mdev.c
+++ b/drivers/vfio/mdev/vfio_mdev.c
@@ -120,12 +120,16 @@ static int vfio_mdev_probe(struct mdev_device *mdev)
 
 	vfio_init_group_dev(vdev, &mdev->dev, &vfio_mdev_dev_ops);
 	ret = vfio_register_group_dev(vdev);
-	if (ret) {
-		kfree(vdev);
-		return ret;
-	}
+	if (ret)
+		goto out_uninit;
+
 	dev_set_drvdata(&mdev->dev, vdev);
 	return 0;
+
+out_uninit:
+	vfio_uninit_group_dev(vdev);
+	kfree(vdev);
+	return ret;
 }
 
 static void vfio_mdev_remove(struct mdev_device *mdev)
@@ -133,6 +137,7 @@ static void vfio_mdev_remove(struct mdev_device *mdev)
 	struct vfio_device *vdev = dev_get_drvdata(&mdev->dev);
 
 	vfio_unregister_group_dev(vdev);
+	vfio_uninit_group_dev(vdev);
 	kfree(vdev);
 }
 
diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index 318864d5283782..fab3715d60d4ba 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -2022,7 +2022,7 @@ static int vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	ret = vfio_pci_reflck_attach(vdev);
 	if (ret)
-		goto out_free;
+		goto out_uninit;
 	ret = vfio_pci_vf_init(vdev);
 	if (ret)
 		goto out_reflck;
@@ -2059,7 +2059,8 @@ static int vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	vfio_pci_vf_uninit(vdev);
 out_reflck:
 	vfio_pci_reflck_put(vdev->reflck);
-out_free:
+out_uninit:
+	vfio_uninit_group_dev(&vdev->vdev);
 	kfree(vdev->pm_save);
 	kfree(vdev);
 out_group_put:
@@ -2077,6 +2078,7 @@ static void vfio_pci_remove(struct pci_dev *pdev)
 
 	vfio_pci_vf_uninit(vdev);
 	vfio_pci_reflck_put(vdev->reflck);
+	vfio_uninit_group_dev(&vdev->vdev);
 	vfio_pci_vga_uninit(vdev);
 
 	vfio_iommu_group_put(pdev->dev.iommu_group, &pdev->dev);
diff --git a/drivers/vfio/platform/vfio_platform_common.c b/drivers/vfio/platform/vfio_platform_common.c
index 703164df7637db..bdde8605178cd2 100644
--- a/drivers/vfio/platform/vfio_platform_common.c
+++ b/drivers/vfio/platform/vfio_platform_common.c
@@ -667,7 +667,7 @@ int vfio_platform_probe_common(struct vfio_platform_device *vdev,
 		ret = vfio_platform_of_probe(vdev, dev);
 
 	if (ret)
-		return ret;
+		goto out_uninit;
 
 	vdev->device = dev;
 
@@ -675,7 +675,7 @@ int vfio_platform_probe_common(struct vfio_platform_device *vdev,
 	if (ret && vdev->reset_required) {
 		dev_err(dev, "No reset function found for device %s\n",
 			vdev->name);
-		return ret;
+		goto out_uninit;
 	}
 
 	group = vfio_iommu_group_get(dev);
@@ -698,6 +698,8 @@ int vfio_platform_probe_common(struct vfio_platform_device *vdev,
 	vfio_iommu_group_put(group, dev);
 put_reset:
 	vfio_platform_put_reset(vdev);
+out_uninit:
+	vfio_uninit_group_dev(&vdev->vdev);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(vfio_platform_probe_common);
@@ -708,6 +710,7 @@ void vfio_platform_remove_common(struct vfio_platform_device *vdev)
 
 	pm_runtime_disable(vdev->device);
 	vfio_platform_put_reset(vdev);
+	vfio_uninit_group_dev(&vdev->vdev);
 	vfio_iommu_group_put(vdev->vdev.dev->iommu_group, vdev->vdev.dev);
 }
 EXPORT_SYMBOL_GPL(vfio_platform_remove_common);
diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 02cc51ce6891a9..cc375df0fd5dda 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -749,6 +749,11 @@ void vfio_init_group_dev(struct vfio_device *device, struct device *dev,
 }
 EXPORT_SYMBOL_GPL(vfio_init_group_dev);
 
+void vfio_uninit_group_dev(struct vfio_device *device)
+{
+}
+EXPORT_SYMBOL_GPL(vfio_uninit_group_dev);
+
 int vfio_register_group_dev(struct vfio_device *device)
 {
 	struct vfio_device *existing_device;
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index a2c5b30e1763ba..b0875cf8e496bb 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -61,6 +61,7 @@ extern void vfio_iommu_group_put(struct iommu_group *group, struct device *dev);
 
 void vfio_init_group_dev(struct vfio_device *device, struct device *dev,
 			 const struct vfio_device_ops *ops);
+void vfio_uninit_group_dev(struct vfio_device *device);
 int vfio_register_group_dev(struct vfio_device *device);
 void vfio_unregister_group_dev(struct vfio_device *device);
 extern struct vfio_device *vfio_device_get_from_dev(struct device *dev);
diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index a12b1fc94ed402..3d02e8e5964be7 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -559,6 +559,7 @@ static int mbochs_probe(struct mdev_device *mdev)
 	dev_set_drvdata(&mdev->dev, mdev_state);
 	return 0;
 err_mem:
+	vfio_uninit_group_dev(&mdev_state->vdev);
 	kfree(mdev_state->pages);
 	kfree(mdev_state->vconfig);
 	kfree(mdev_state);
@@ -572,6 +573,7 @@ static void mbochs_remove(struct mdev_device *mdev)
 	struct mdev_state *mdev_state = dev_get_drvdata(&mdev->dev);
 
 	vfio_unregister_group_dev(&mdev_state->vdev);
+	vfio_uninit_group_dev(&mdev_state->vdev);
 	atomic_add(mdev_state->type->mbytes, &mbochs_avail_mbytes);
 	kfree(mdev_state->pages);
 	kfree(mdev_state->vconfig);
diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index a7d4ed28d66411..57334034cde6dd 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -235,17 +235,16 @@ static int mdpy_probe(struct mdev_device *mdev)
 
 	mdev_state->vconfig = kzalloc(MDPY_CONFIG_SPACE_SIZE, GFP_KERNEL);
 	if (mdev_state->vconfig == NULL) {
-		kfree(mdev_state);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_state;
 	}
 
 	fbsize = roundup_pow_of_two(type->width * type->height * type->bytepp);
 
 	mdev_state->memblk = vmalloc_user(fbsize);
 	if (!mdev_state->memblk) {
-		kfree(mdev_state->vconfig);
-		kfree(mdev_state);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_vconfig;
 	}
 	dev_info(dev, "%s: %s (%dx%d)\n", __func__, type->name, type->width,
 		 type->height);
@@ -260,13 +259,18 @@ static int mdpy_probe(struct mdev_device *mdev)
 	mdpy_count++;
 
 	ret = vfio_register_group_dev(&mdev_state->vdev);
-	if (ret) {
-		kfree(mdev_state->vconfig);
-		kfree(mdev_state);
-		return ret;
-	}
+	if (ret)
+		goto err_mem;
 	dev_set_drvdata(&mdev->dev, mdev_state);
 	return 0;
+err_mem:
+	vfree(mdev_state->memblk);
+err_vconfig:
+	kfree(mdev_state->vconfig);
+err_state:
+	vfio_uninit_group_dev(&mdev_state->vdev);
+	kfree(mdev_state);
+	return ret;
 }
 
 static void mdpy_remove(struct mdev_device *mdev)
@@ -278,6 +282,7 @@ static void mdpy_remove(struct mdev_device *mdev)
 	vfio_unregister_group_dev(&mdev_state->vdev);
 	vfree(mdev_state->memblk);
 	kfree(mdev_state->vconfig);
+	vfio_uninit_group_dev(&mdev_state->vdev);
 	kfree(mdev_state);
 
 	mdpy_count--;
diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
index 8b26fecc4afedd..37cc9067e1601d 100644
--- a/samples/vfio-mdev/mtty.c
+++ b/samples/vfio-mdev/mtty.c
@@ -718,8 +718,8 @@ static int mtty_probe(struct mdev_device *mdev)
 
 	mdev_state = kzalloc(sizeof(struct mdev_state), GFP_KERNEL);
 	if (mdev_state == NULL) {
-		atomic_add(nr_ports, &mdev_avail_ports);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_nr_ports;
 	}
 
 	vfio_init_group_dev(&mdev_state->vdev, &mdev->dev, &mtty_dev_ops);
@@ -732,9 +732,8 @@ static int mtty_probe(struct mdev_device *mdev)
 	mdev_state->vconfig = kzalloc(MTTY_CONFIG_SPACE_SIZE, GFP_KERNEL);
 
 	if (mdev_state->vconfig == NULL) {
-		kfree(mdev_state);
-		atomic_add(nr_ports, &mdev_avail_ports);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_state;
 	}
 
 	mutex_init(&mdev_state->ops_lock);
@@ -743,14 +742,19 @@ static int mtty_probe(struct mdev_device *mdev)
 	mtty_create_config_space(mdev_state);
 
 	ret = vfio_register_group_dev(&mdev_state->vdev);
-	if (ret) {
-		kfree(mdev_state);
-		atomic_add(nr_ports, &mdev_avail_ports);
-		return ret;
-	}
-
+	if (ret)
+		goto err_vconfig;
 	dev_set_drvdata(&mdev->dev, mdev_state);
 	return 0;
+
+err_vconfig:
+	kfree(mdev_state->vconfig);
+err_state:
+	vfio_uninit_group_dev(&mdev_state->vdev);
+	kfree(mdev_state);
+err_nr_ports:
+	atomic_add(nr_ports, &mdev_avail_ports);
+	return ret;
 }
 
 static void mtty_remove(struct mdev_device *mdev)
@@ -761,6 +765,7 @@ static void mtty_remove(struct mdev_device *mdev)
 	vfio_unregister_group_dev(&mdev_state->vdev);
 
 	kfree(mdev_state->vconfig);
+	vfio_uninit_group_dev(&mdev_state->vdev);
 	kfree(mdev_state);
 	atomic_add(nr_ports, &mdev_avail_ports);
 }
-- 
2.32.0

