Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B693C9521
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 02:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83A36E55E;
	Thu, 15 Jul 2021 00:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E956E516;
 Thu, 15 Jul 2021 00:20:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEci8HHNGvoA0aKiYSRiAmaEnzwTtdZTKhuT2IukIHVY+Bnfh0nw7asIEEVSEYstTRByIMaKR5SWyo60c25OA3eAnSoL7XNdEggUC5y3GupHFIglwAjLOtoN2s8qHsjoPPfmRKCwB9lgsDKUmjaAhGpw90feZGYO04yReSipg01QsnXxm3vw4AHMQarVg2QUmzVWKMFTltohlCHlxgjsKqYfrmXz3yPjjGRC0dMouyMtGci+KX5DONMRqyeeio8j0pp5CL54D3Zbh/u6VzoIZgQ7qUWASvjzTc6gH0DUMMG8/egJvPnSlqIV8DDk6Uj8dhf/1ArJQQCOp2UxdgGc2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfSzLrWx9phOGS1Ir9TXtZygWdUrRCe/TL6aPalVd/Q=;
 b=eDE5LasGq6rCZwzcsZYd3ZieXzYWlaAaRI/lUitRnvjap8SKFXBE4RUQCRhTPlixMDDZvBX9v/bjlgJGd0pnL+z7TFpN4QQUDbNk/5RmG6BKj55Bvio0rNNhACV6QkUEPmOyWjZjBgWWIy9uaxUd29rQHBjBFg86hsQvsUU0ojeuftAV/bOj4lrl0z5sdJHDSZ/T8wup7txY4Ih/gygjEayvXmWaQlPTwumhCEnzUEaHlomHNi35zty77h96Ucyy3wmXTINcly17viK2xgDb5s2PNPM3k99uORUHtXsNHNF6Mnrzu4fjQ+s0kbvHwuz0kaMZi8ve1kkhmrtGJ0JfXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfSzLrWx9phOGS1Ir9TXtZygWdUrRCe/TL6aPalVd/Q=;
 b=IdX99UaGupvmFeDH0ltspNAuUdVGQRCTJzVzkLvKCphk6acC66+iD2qr35uPimeSHClmeIycZ4F7repeDaha+L0yTboTSSxNI428nxe/SX7A3AKC+yrCsGlukvp4xuat8PUfU9baCcCFo6S8di2NeM6fYseBio3ZMzsvZlbcGcIM08ab89B6frbheW/Usbw1LXylQ/Pv1C/XVTmJyz1UV5vFry5laqHxm5eUYfexUzjYqJOYCqZiaPIvRU9FuPkk6yqTRDSk5GmGOdjet/FOpwuxcVR6UT8mFIiwmYC6Pj1waEbadEWM7QnhAABT/UeyCNQJyZl02Ht6hZW6nL+Mqg==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5555.namprd12.prod.outlook.com (2603:10b6:208:1c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Thu, 15 Jul
 2021 00:20:49 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 00:20:49 +0000
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
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 07/13] vfio/pci: Move to the device set infrastructure
Date: Wed, 14 Jul 2021 21:20:36 -0300
Message-Id: <7-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR08CA0025.namprd08.prod.outlook.com
 (2603:10b6:610:5a::35) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 CH2PR08CA0025.namprd08.prod.outlook.com (2603:10b6:610:5a::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Thu, 15 Jul 2021 00:20:45 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m3p7K-002UxV-MR; Wed, 14 Jul 2021 21:20:42 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 551bdec9-9e25-4c31-3d0c-08d947266352
X-MS-TrafficTypeDiagnostic: BL0PR12MB5555:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB555589EBD8A60AF3B8A82B18C2129@BL0PR12MB5555.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r1YJrV+YfpAFHSADfVEwSZyQTQFqXQCiMDki1VO+hEPKHRwuP9EheuLyPSPIWCqaCfG6NJze7DTV75l55I1cYlYnjXJH5FTRnoL+SRQl+S4Sg8TCnBNbT8Ko07xxffb8A2niUNwTGWr/Hz/fJuCi5LQm85vTNETMn2eoMkmnEDKXLOPtgGENH+82H9EUjrQ9qdaep8gpwvZGPxxrcHXs1wfhBmweaVJ7dXvd4pX1xikN/0npZ1HCOSD3tAgT/6gy/O0mdKkIlimLk/f7Cp2JicJRk1H/WGr+45hWfHxOK9cpsgBkmkv4UuHf1WXIhTTL4/Ewrp692e0TheUYsh6f+XfFBR4SQXGnkbsdDSMJbGLF6qJDW0KbcrVhjKluj7vWP1bz776zNE8arJ42x0Cy5tcpH8f9wRLupn90Ah3CDgt2o/nFRTZmq4r7FNR0VkijOYeLCkSVZyI3H1roczah4UjUgTY2/IGfJ3/olE6cb168k4ORjIz2XIczb0kN5UXfZ+UMm00h4KTr3BlORRnAcMu59WOGonLSr3AKn2IS4pfiJLX6KeuAPDFGzl9Koed0cbitce8clhxHdi0KSsyWEFr2/IS6d0FcCC8wA82AUtNSwX1ED/j5k9qCWXmWuvAy2/xe3w6tmw0vg7hfKhv1s3Kozniy+YZxQy3AaSlHd2et7I9xwUCcykeUXJc0FV9MY69OxaNWCzKQqECERVxsUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(83380400001)(2616005)(426003)(316002)(107886003)(2906002)(478600001)(4326008)(7416002)(7406005)(38100700002)(36756003)(5660300002)(66556008)(66476007)(66946007)(921005)(9746002)(26005)(8936002)(110136005)(54906003)(8676002)(9786002)(86362001)(6666004)(186003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QZeAaeEDYX6NMy3eXhUUCu86jGiIBWvUnt2xJbKaULZprjZyccgUQ9yHX3Qm?=
 =?us-ascii?Q?eeqnkAkCJbp7HG1stmjgMbmCPm+MghTLetgcjdOqhVGvnuPIRd3lvA0u8BNy?=
 =?us-ascii?Q?ILBNAje8nc/LNdxeL/C9iIrj7rlWsyEZhi25gRRuAYwtAWZhXUrW78b1Egga?=
 =?us-ascii?Q?siOlnsBSLiSoiiiloVXysw7gVnDTIWCL5vbKK3RWT9QADRtGcRQvyvcgrhMP?=
 =?us-ascii?Q?R5D79gYrH3POQEpLEygjN7HGlV544y7ts92Xz1L3e/CpqlY8g6usdr6OKsL6?=
 =?us-ascii?Q?SUliUT3Mhqk0rs5LordIkGsHI7xotbAsN+/IzwQkOZuXMIA9ERpDT4YoOJPC?=
 =?us-ascii?Q?vaKIzI51pCfLNbD+tKwC9lo0GPTu9YFKRdYyR5Rv0JEVn52J9Ms2fpkSS0YC?=
 =?us-ascii?Q?tTgeRz/99GaV8j7UEiRvWI7o8adrHmCN8IGg2RMRfc5XZOl23VAOfBDNz8fc?=
 =?us-ascii?Q?Bjx5OglGb01K5kaCGIsefqktaZHAqGKB51a0412x1cJ8vnN/K1syKNJnq3Kv?=
 =?us-ascii?Q?VV8hcS4Cr0OG0hIXsA/Qu8HI9+Q7pntwa+RX/isXtHtXFxzyl19hcf3yMAs/?=
 =?us-ascii?Q?jOnyutWxQswGYL3Jn6IMcmSBvm34WZRrQJaBFAwuUavemttPTDNgFhlH7RlP?=
 =?us-ascii?Q?3NPjLjWVSJ3Lb/dVDhSYiUizmzRXxj174vBGTD1jkHNkxbvKna821/HpJstM?=
 =?us-ascii?Q?r++kKL3SsvnxCf78HCAZtNW1pf/0cBk8C/ZYgU8jc3VHj/i2gM6Kv8yW+nCP?=
 =?us-ascii?Q?pgA02BDLVAFaXe+5CeItlUchiCCxLnAUBEJudGe+rMu32j4jZ7hOCG7uv0wH?=
 =?us-ascii?Q?4JAza9baUgMWMGldjH/obnpLPRoEUVJaXOq+zj08oWm3CQHwCGYLENrredW3?=
 =?us-ascii?Q?uCIuEEDRgVoxHzrQbt6+N48mThy1uJcYq/Fm+InH2TUjv/N2x3Re0BDTD2YU?=
 =?us-ascii?Q?weY5RzJir21ligP3YdkKC9LCRERede8SlGzduIK1KjfUuZM+Z61Cl7cjo88f?=
 =?us-ascii?Q?QrGumGQMlJ/4GXafoyXq1ZlO2H0OjdfDgmU0KAhYKnBOq7A34jngBMLn3Yqu?=
 =?us-ascii?Q?Tz0YZ3TMfVfYflTyd81Ni7ZI/GE/cj3zQp+jh8ew3qswbZbqP29KyrPVBEzn?=
 =?us-ascii?Q?HS+EFITeGwL9NdbITL3e/Ca/QTeDO5xIOqPeXupLLgZSyBukxqCiKUuiIgQ6?=
 =?us-ascii?Q?VfMcKNBDGfLIL+rVIHPngYjLzROSU8SM9HjT5Qz9I/N7H4INaXK913FAs5Uy?=
 =?us-ascii?Q?wT8LXWOASOiIe2KhxR+r3pDm72yogt77F62OjUIf7kv/4vWr3QfHSTmecT7X?=
 =?us-ascii?Q?PVuy2u+RTFk21YpT/5oJQGtw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 551bdec9-9e25-4c31-3d0c-08d947266352
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 00:20:45.2350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E6lBRbPCxLhI3SHB0akiV6pe2eUkkA3noBnuq7dNiOo7YE8/dC1/4duUR5rPzreA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5555
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
 Leon Romanovsky <leonro@nvidia.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yishai Hadas <yishaih@nvidia.com>

PCI wants to have the usual open/close_device() logic with the slight
twist that the open/close_device() must be done under a singelton lock
shared by all of the vfio_devices that are in the PCI "reset group".

The reset group, and thus the device set, is determined by what devices
pci_reset_bus() touches, which is either the entire bus or only the slot.

Rely on the core code to do everything reflck was doing and delete reflck
entirely.

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/pci/vfio_pci.c         | 156 ++++++----------------------
 drivers/vfio/pci/vfio_pci_private.h |   7 --
 2 files changed, 31 insertions(+), 132 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index fab3715d60d4ba..22774e447b5f4a 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -530,53 +530,40 @@ static void vfio_pci_vf_token_user_add(struct vfio_pci_device *vdev, int val)
 	vfio_device_put(&pf_vdev->vdev);
 }
 
-static void vfio_pci_release(struct vfio_device *core_vdev)
+static void vfio_pci_close_device(struct vfio_device *core_vdev)
 {
 	struct vfio_pci_device *vdev =
 		container_of(core_vdev, struct vfio_pci_device, vdev);
 
-	mutex_lock(&vdev->reflck->lock);
-
-	if (!(--vdev->refcnt)) {
-		vfio_pci_vf_token_user_add(vdev, -1);
-		vfio_spapr_pci_eeh_release(vdev->pdev);
-		vfio_pci_disable(vdev);
+	vfio_pci_vf_token_user_add(vdev, -1);
+	vfio_spapr_pci_eeh_release(vdev->pdev);
+	vfio_pci_disable(vdev);
 
-		mutex_lock(&vdev->igate);
-		if (vdev->err_trigger) {
-			eventfd_ctx_put(vdev->err_trigger);
-			vdev->err_trigger = NULL;
-		}
-		if (vdev->req_trigger) {
-			eventfd_ctx_put(vdev->req_trigger);
-			vdev->req_trigger = NULL;
-		}
-		mutex_unlock(&vdev->igate);
+	mutex_lock(&vdev->igate);
+	if (vdev->err_trigger) {
+		eventfd_ctx_put(vdev->err_trigger);
+		vdev->err_trigger = NULL;
 	}
-
-	mutex_unlock(&vdev->reflck->lock);
+	if (vdev->req_trigger) {
+		eventfd_ctx_put(vdev->req_trigger);
+		vdev->req_trigger = NULL;
+	}
+	mutex_unlock(&vdev->igate);
 }
 
-static int vfio_pci_open(struct vfio_device *core_vdev)
+static int vfio_pci_open_device(struct vfio_device *core_vdev)
 {
 	struct vfio_pci_device *vdev =
 		container_of(core_vdev, struct vfio_pci_device, vdev);
 	int ret = 0;
 
-	mutex_lock(&vdev->reflck->lock);
-
-	if (!vdev->refcnt) {
-		ret = vfio_pci_enable(vdev);
-		if (ret)
-			goto error;
+	ret = vfio_pci_enable(vdev);
+	if (ret)
+		return ret;
 
-		vfio_spapr_pci_eeh_open(vdev->pdev);
-		vfio_pci_vf_token_user_add(vdev, 1);
-	}
-	vdev->refcnt++;
-error:
-	mutex_unlock(&vdev->reflck->lock);
-	return ret;
+	vfio_spapr_pci_eeh_open(vdev->pdev);
+	vfio_pci_vf_token_user_add(vdev, 1);
+	return 0;
 }
 
 static int vfio_pci_get_irq_count(struct vfio_pci_device *vdev, int irq_type)
@@ -1870,8 +1857,8 @@ static int vfio_pci_match(struct vfio_device *core_vdev, char *buf)
 
 static const struct vfio_device_ops vfio_pci_ops = {
 	.name		= "vfio-pci",
-	.open		= vfio_pci_open,
-	.release	= vfio_pci_release,
+	.open_device	= vfio_pci_open_device,
+	.close_device	= vfio_pci_close_device,
 	.ioctl		= vfio_pci_ioctl,
 	.read		= vfio_pci_read,
 	.write		= vfio_pci_write,
@@ -1880,9 +1867,6 @@ static const struct vfio_device_ops vfio_pci_ops = {
 	.match		= vfio_pci_match,
 };
 
-static int vfio_pci_reflck_attach(struct vfio_pci_device *vdev);
-static void vfio_pci_reflck_put(struct vfio_pci_reflck *reflck);
-
 static int vfio_pci_bus_notifier(struct notifier_block *nb,
 				 unsigned long action, void *data)
 {
@@ -2020,12 +2004,17 @@ static int vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	INIT_LIST_HEAD(&vdev->vma_list);
 	init_rwsem(&vdev->memory_lock);
 
-	ret = vfio_pci_reflck_attach(vdev);
+	if (pci_is_root_bus(pdev->bus))
+		ret = vfio_assign_device_set(&vdev->vdev, vdev);
+	else if (!pci_probe_reset_slot(pdev->slot))
+		ret = vfio_assign_device_set(&vdev->vdev, pdev->slot);
+	else
+		ret = vfio_assign_device_set(&vdev->vdev, pdev->bus);
 	if (ret)
 		goto out_uninit;
 	ret = vfio_pci_vf_init(vdev);
 	if (ret)
-		goto out_reflck;
+		goto out_uninit;
 	ret = vfio_pci_vga_init(vdev);
 	if (ret)
 		goto out_vf;
@@ -2057,8 +2046,6 @@ static int vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		vfio_pci_set_power_state(vdev, PCI_D0);
 out_vf:
 	vfio_pci_vf_uninit(vdev);
-out_reflck:
-	vfio_pci_reflck_put(vdev->reflck);
 out_uninit:
 	vfio_uninit_group_dev(&vdev->vdev);
 	kfree(vdev->pm_save);
@@ -2077,7 +2064,6 @@ static void vfio_pci_remove(struct pci_dev *pdev)
 	vfio_unregister_group_dev(&vdev->vdev);
 
 	vfio_pci_vf_uninit(vdev);
-	vfio_pci_reflck_put(vdev->reflck);
 	vfio_uninit_group_dev(&vdev->vdev);
 	vfio_pci_vga_uninit(vdev);
 
@@ -2153,86 +2139,6 @@ static struct pci_driver vfio_pci_driver = {
 	.err_handler		= &vfio_err_handlers,
 };
 
-static DEFINE_MUTEX(reflck_lock);
-
-static struct vfio_pci_reflck *vfio_pci_reflck_alloc(void)
-{
-	struct vfio_pci_reflck *reflck;
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
-static void vfio_pci_reflck_get(struct vfio_pci_reflck *reflck)
-{
-	kref_get(&reflck->kref);
-}
-
-static int vfio_pci_reflck_find(struct pci_dev *pdev, void *data)
-{
-	struct vfio_pci_reflck **preflck = data;
-	struct vfio_device *device;
-	struct vfio_pci_device *vdev;
-
-	device = vfio_device_get_from_dev(&pdev->dev);
-	if (!device)
-		return 0;
-
-	if (pci_dev_driver(pdev) != &vfio_pci_driver) {
-		vfio_device_put(device);
-		return 0;
-	}
-
-	vdev = container_of(device, struct vfio_pci_device, vdev);
-
-	if (vdev->reflck) {
-		vfio_pci_reflck_get(vdev->reflck);
-		*preflck = vdev->reflck;
-		vfio_device_put(device);
-		return 1;
-	}
-
-	vfio_device_put(device);
-	return 0;
-}
-
-static int vfio_pci_reflck_attach(struct vfio_pci_device *vdev)
-{
-	bool slot = !pci_probe_reset_slot(vdev->pdev->slot);
-
-	mutex_lock(&reflck_lock);
-
-	if (pci_is_root_bus(vdev->pdev->bus) ||
-	    vfio_pci_for_each_slot_or_bus(vdev->pdev, vfio_pci_reflck_find,
-					  &vdev->reflck, slot) <= 0)
-		vdev->reflck = vfio_pci_reflck_alloc();
-
-	mutex_unlock(&reflck_lock);
-
-	return PTR_ERR_OR_ZERO(vdev->reflck);
-}
-
-static void vfio_pci_reflck_release(struct kref *kref)
-{
-	struct vfio_pci_reflck *reflck = container_of(kref,
-						      struct vfio_pci_reflck,
-						      kref);
-
-	kfree(reflck);
-	mutex_unlock(&reflck_lock);
-}
-
-static void vfio_pci_reflck_put(struct vfio_pci_reflck *reflck)
-{
-	kref_put_mutex(&reflck->kref, vfio_pci_reflck_release, &reflck_lock);
-}
-
 static int vfio_pci_get_unused_devs(struct pci_dev *pdev, void *data)
 {
 	struct vfio_devices *devs = data;
@@ -2254,7 +2160,7 @@ static int vfio_pci_get_unused_devs(struct pci_dev *pdev, void *data)
 	vdev = container_of(device, struct vfio_pci_device, vdev);
 
 	/* Fault if the device is not unused */
-	if (vdev->refcnt) {
+	if (device->open_count) {
 		vfio_device_put(device);
 		return -EBUSY;
 	}
@@ -2303,7 +2209,7 @@ static int vfio_pci_try_zap_and_vma_lock_cb(struct pci_dev *pdev, void *data)
  *  - At least one of the affected devices is marked dirty via
  *    needs_reset (such as by lack of FLR support)
  * Then attempt to perform that bus or slot reset.  Callers are required
- * to hold vdev->reflck->lock, protecting the bus/slot reset group from
+ * to hold vdev->dev_set->lock, protecting the bus/slot reset group from
  * concurrent opens.  A vfio_device reference is acquired for each device
  * to prevent unbinds during the reset operation.
  *
diff --git a/drivers/vfio/pci/vfio_pci_private.h b/drivers/vfio/pci/vfio_pci_private.h
index 5a36272cecbf94..ae83c2eada3a64 100644
--- a/drivers/vfio/pci/vfio_pci_private.h
+++ b/drivers/vfio/pci/vfio_pci_private.h
@@ -83,11 +83,6 @@ struct vfio_pci_dummy_resource {
 	struct list_head	res_next;
 };
 
-struct vfio_pci_reflck {
-	struct kref		kref;
-	struct mutex		lock;
-};
-
 struct vfio_pci_vf_token {
 	struct mutex		lock;
 	uuid_t			uuid;
@@ -130,8 +125,6 @@ struct vfio_pci_device {
 	bool			needs_pm_restore;
 	struct pci_saved_state	*pci_saved_state;
 	struct pci_saved_state	*pm_save;
-	struct vfio_pci_reflck	*reflck;
-	int			refcnt;
 	int			ioeventfds_nr;
 	struct eventfd_ctx	*err_trigger;
 	struct eventfd_ctx	*req_trigger;
-- 
2.32.0

