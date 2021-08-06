Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C053E20C7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 03:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50B76E91C;
	Fri,  6 Aug 2021 01:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333EA6E8F4;
 Fri,  6 Aug 2021 01:19:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYWMtPxWHGD5/44rJtwoqqkw1oDNt9Z2AGL5mZkYwQbfJKQL/Uz5uQUZtHokAiswqxhKy9dNt43aFGo6M2RTjNZz7xaShWAaVcorW4oZtM/l5rUIWTD3LfGSzZWY9nBIeSSZjOuJ3zIpGZrQB9bFihB0S84btPCT+QmEd1QnsNFL+ILecAVmJFaKrCpd7XL6jAcx4eAJuik/DWi/pu6bHrMe4FufOSLkRKyPCXgg+s1aEj03BleGC9UmuhtNLCKB4hEEK8Nc5UT5LPZH004qwu+hkh4N4/zrKEtu1Gw6CL13SbXXT508Od3TAKcn4TtNz0YBPhU57pSfBqgqkQoIbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ik7VLX8abqEg85NWfI40dG+Jvqfk94oI4OQ1M+W+xWo=;
 b=SpMV44h19yQtxL/kmlg5dR+PYCqOxxTErph3GZupfDlDR74+51rlYZ7AYWhnPfA9vvXUdnVEvRFc00e2eBgNueU8gDUOTI9CTweJIiom/+FKRj9WGdIaeKadwBAlAgFwxfQMTslkOvABVFaAGZ00pqci2gQSQhgeDbrqpZx+BVjR7qavYnhPaTV4dsuLyXEafnVDyF4sBJyYs6jETwW6usU73ohG9e0UYlwyWNyoo2M7vHC1m8XyQ6lkRIWMWVrV8CDa/E0rsKP7wQQRMSV+QHgeQEnV8NkD9BEvakBWqKCNW6z/vvoY4Ha4GOwIMhVhHhzhi4tGO5+Knz/+2kO1wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ik7VLX8abqEg85NWfI40dG+Jvqfk94oI4OQ1M+W+xWo=;
 b=VxgNEXJikpDthCyf5KKF/Q0nFFJ4UyDH+8TbaFMPTEHnlDI2IxZKsn8AkCipTaU6nxyzNTWpwJqEIjoH8qlBXcJ89BjYcy4ksxQRBr7MBdXegMzsJwvBVEOmQRd3hPsfsEma6HV2Hor/v9jq064lIj/SmjN+PpIe4eV6Usm+6Yb7doi5KJZr5tdUMl0qy0WZNeyXHeW5iYDhcm38R3AByNU1zAjfjSmiWvnBmvu3h8S/4T2YVDx7wOvbONPeYYgGLuufOXd/anXjbppF4YGVgN5rkJOTGct3UA4N/G92ipwAOMIxuT547T7brX3ZsSaiChNVLung2vQyFbhvipGpsg==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5206.namprd12.prod.outlook.com (2603:10b6:208:31c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 6 Aug
 2021 01:19:15 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%7]) with mapi id 15.20.4394.018; Fri, 6 Aug 2021
 01:19:15 +0000
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
Subject: [PATCH v4 08/14] vfio/pci: Move to the device set infrastructure
Date: Thu,  5 Aug 2021 22:19:04 -0300
Message-Id: <8-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR07CA0011.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::21) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR07CA0011.namprd07.prod.outlook.com (2603:10b6:208:1a0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16 via Frontend
 Transport; Fri, 6 Aug 2021 01:19:13 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mBoVz-00Dt7K-8L; Thu, 05 Aug 2021 22:19:11 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07d4aebb-aed8-4b3a-6b80-08d958783376
X-MS-TrafficTypeDiagnostic: BL1PR12MB5206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5206664BF33FA336F6BD6CCCC2F39@BL1PR12MB5206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +i9YhQY9LVcyW/75rRb+5s+jziV2t8CRgCAiKqUF0xAB9uBnqZLLTVVZs3Ma93Fo0OVaNDashI/sWoEzCq3bfNY8RjKfKDUsZmnucI4FNaaRQjqYrJxxSQwx6jdO7No+lDaNr2gBUaWifvreK+CYTpJlpRIZoHTHGNCfAWOvOQcDBP1bZsQ+hMXW063QFfWIDB/G76EdTvdcOtFEguDf5RrpIVqtmsTvakgEySQFMo/6lawzYzCz2rNboxelv8o7mjXQiJvWx1savsKWccrFK/Vgf2SJTa7lmiskLcNqaf5CbL4jo241HHbv3Y17V7kLvTiCl6IMLWgF4Lmzc3AwhTtN8xSwUIbGx93vA2FR+iY2dYkaw2jc1J07e31vhc+lQeVk/qNit1zMglbUjR+MeBOg3ZbL9SLvuQH6QcgN6dXfMEduEzEekecm2+xz0LTbxGg0Fe08pF+VS011XdQC4qHulRrQYndSf8nBNKHECQGtMUWW8GYbpUHgRwaaLmPZvU1LlPJTM16cuiHja6GzlZ+xvZuQbLWowyDGYp3Answwn0DwytsDpcKowEXxgqgyCpJW1NLTV1MYrUpnr2MJpkhTKMEwfRpRVLv36293SC+dbarLgM4t/rmyuJCZCHGKDdtsckSOA4w1Pq25XxNUXQdoVfAcpbTbXtz6xx0wCOc6Pxqi4GBn1GUzrsXPZggc3da3EfM5QOgAzMDgr6R1pg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9746002)(83380400001)(86362001)(9786002)(8936002)(426003)(2906002)(7416002)(38100700002)(7406005)(66946007)(921005)(8676002)(5660300002)(186003)(2616005)(26005)(36756003)(508600001)(6666004)(66476007)(316002)(4326008)(66556008)(110136005)(54906003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+Er2eyfN3B76J4/x/LRnUKrKd4miOO61+Hyu02y1hyrfLDgOMzQ2y9AR9+w8?=
 =?us-ascii?Q?upqT6B2PKdkPFlAcxkAhx7UM7+q3Ou5cGbKk2NgiQODRqtaeqJcd663rT5Qg?=
 =?us-ascii?Q?vLh+lML1rxXqOjmDQYO3hBqPGxk2b1bp1g7N6lJ2uMOUIBkZbYfoFKbLp+4y?=
 =?us-ascii?Q?gipN1TNL6cyIyJ04cVdFwjbOzMceIa1kYvyrJuiciykxmFieW4NQ4hmGwde+?=
 =?us-ascii?Q?qtiEUV8/av/5BYDjC/S0/bWidAy6aS+o3npcOlsWB2cXIB4LL1k+1JiP2bpn?=
 =?us-ascii?Q?D9Nt4wkQCAMoVUqqPQkzNAf6qDTASkjdh3XLxMveTXQ54zuo5ZeNQ+zqbljd?=
 =?us-ascii?Q?hBCBrwe5h5XG4bm1CAVOmh8I0QgceaopN67Dn9g3KS5AAwmWO/UrAm03/Ibs?=
 =?us-ascii?Q?waU0SiXtiMF7snZH83EL4NDG/TjKDlwJPCU5JNDymgWcP1PcN/vVuH/V8C3Y?=
 =?us-ascii?Q?jE3fLEiUpeOO+cIHgoUnmWQ8gIsl4qMnruuT3qBMN5NiuCpKz+DDrvVBdOuZ?=
 =?us-ascii?Q?n+LO84v8zc3uTBegIjmIbjhZH4ySRCdmF1IQisjAlGwWu9B4lGApc2Z1vSjS?=
 =?us-ascii?Q?/TO6cDou7s9j9KTZwj9ogQVetQ7NEjCopDA1j4c1DEeiVZ0JAoQWr0i0KMRX?=
 =?us-ascii?Q?Us90UKbh80qYY2PRLv4Up14WT72Tn4MT6yGqZeZkKF6X6sJHg930ofc8av+Q?=
 =?us-ascii?Q?nl6l7ZNZw9iQ2mco2psaQ8mPPjQkqRAP0CK01/I/7j2Z2AutR9z4VR5n8tfx?=
 =?us-ascii?Q?hBdM7+3jFmHIF3QEdy1ypceznP7CmfYIH/gc80l/HYOxHHeaDZ245y00UKZS?=
 =?us-ascii?Q?kT6BjPItbG/GvZT0mRvPidUckGL8vkqpcvICsDtkHIEN7lgPVGRkdwLlMCqp?=
 =?us-ascii?Q?YLtGl8QxNG+3UtModSCJvJIvtX/vq4aedouYaHagN/VQRZ/8klBC+wcy/vam?=
 =?us-ascii?Q?J3WHcxtg0hUu72jr4NYiWBVFhyTNLFrhXpoNkXCHgOhUCBj6XhceWYrz4Hg+?=
 =?us-ascii?Q?DKcODqLKpLrI38N9bEK0QMW6K8ii+cbhqQrzZvbqRi2yTpGdrl91CjlAmxus?=
 =?us-ascii?Q?FK0hkZdpG75aFocKozgO+HuFRmmsVcAsXZiDTda/wCOyYmZPXXTWvcEbVvn6?=
 =?us-ascii?Q?3N6NBLqb4/RHoUrGQxdkw97Am8zJkDA8L8OK/m0nTzBIAbUs3FjpIHYRFi43?=
 =?us-ascii?Q?Vb4NsEVxKa+X8x+PnTdKQmnGABtI0FRUpcZ1FkztT/QC7o+qdp0naYPDmige?=
 =?us-ascii?Q?6DOtRVJIElCyMWrqjsAbpSHaGwzoeIcn45w1Dkvt+TXQbGBFx5IslbvLSTtl?=
 =?us-ascii?Q?PgIo9AZWtByujwxqs0Kx+CH1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d4aebb-aed8-4b3a-6b80-08d958783376
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 01:19:13.4345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MsfTpv9XwiVD3ZyBIJ0pGiSORAdzOxmvpJtWAtKHltYpj42ruotLIRQCatn9YmT7
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

From: Yishai Hadas <yishaih@nvidia.com>

PCI wants to have the usual open/close_device() logic with the slight
twist that the open/close_device() must be done under a singelton lock
shared by all of the vfio_devices that are in the PCI "reset group".

The reset group, and thus the device set, is determined by what devices
pci_reset_bus() touches, which is either the entire bus or only the slot.

Rely on the core code to do everything reflck was doing and delete reflck
entirely.

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/pci/vfio_pci.c         | 162 +++++++---------------------
 drivers/vfio/pci/vfio_pci_private.h |   7 --
 2 files changed, 37 insertions(+), 132 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index fab3715d60d4ba..5d6db93d6c680f 100644
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
+	vfio_pci_vf_token_user_add(vdev, -1);
+	vfio_spapr_pci_eeh_release(vdev->pdev);
+	vfio_pci_disable(vdev);
 
-	if (!(--vdev->refcnt)) {
-		vfio_pci_vf_token_user_add(vdev, -1);
-		vfio_spapr_pci_eeh_release(vdev->pdev);
-		vfio_pci_disable(vdev);
-
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
+	ret = vfio_pci_enable(vdev);
+	if (ret)
+		return ret;
 
-	if (!vdev->refcnt) {
-		ret = vfio_pci_enable(vdev);
-		if (ret)
-			goto error;
-
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
@@ -2020,12 +2004,23 @@ static int vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	INIT_LIST_HEAD(&vdev->vma_list);
 	init_rwsem(&vdev->memory_lock);
 
-	ret = vfio_pci_reflck_attach(vdev);
+	if (pci_is_root_bus(pdev->bus)) {
+		ret = vfio_assign_device_set(&vdev->vdev, vdev);
+	} else if (!pci_probe_reset_slot(pdev->slot)) {
+		ret = vfio_assign_device_set(&vdev->vdev, pdev->slot);
+	} else {
+		/*
+		 * If there is no slot reset support for this device, the whole
+		 * bus needs to be grouped together to support bus-wide resets.
+		 */
+		ret = vfio_assign_device_set(&vdev->vdev, pdev->bus);
+	}
+
 	if (ret)
 		goto out_uninit;
 	ret = vfio_pci_vf_init(vdev);
 	if (ret)
-		goto out_reflck;
+		goto out_uninit;
 	ret = vfio_pci_vga_init(vdev);
 	if (ret)
 		goto out_vf;
@@ -2057,8 +2052,6 @@ static int vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		vfio_pci_set_power_state(vdev, PCI_D0);
 out_vf:
 	vfio_pci_vf_uninit(vdev);
-out_reflck:
-	vfio_pci_reflck_put(vdev->reflck);
 out_uninit:
 	vfio_uninit_group_dev(&vdev->vdev);
 	kfree(vdev->pm_save);
@@ -2077,7 +2070,6 @@ static void vfio_pci_remove(struct pci_dev *pdev)
 	vfio_unregister_group_dev(&vdev->vdev);
 
 	vfio_pci_vf_uninit(vdev);
-	vfio_pci_reflck_put(vdev->reflck);
 	vfio_uninit_group_dev(&vdev->vdev);
 	vfio_pci_vga_uninit(vdev);
 
@@ -2153,86 +2145,6 @@ static struct pci_driver vfio_pci_driver = {
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
@@ -2254,7 +2166,7 @@ static int vfio_pci_get_unused_devs(struct pci_dev *pdev, void *data)
 	vdev = container_of(device, struct vfio_pci_device, vdev);
 
 	/* Fault if the device is not unused */
-	if (vdev->refcnt) {
+	if (device->open_count) {
 		vfio_device_put(device);
 		return -EBUSY;
 	}
@@ -2303,7 +2215,7 @@ static int vfio_pci_try_zap_and_vma_lock_cb(struct pci_dev *pdev, void *data)
  *  - At least one of the affected devices is marked dirty via
  *    needs_reset (such as by lack of FLR support)
  * Then attempt to perform that bus or slot reset.  Callers are required
- * to hold vdev->reflck->lock, protecting the bus/slot reset group from
+ * to hold vdev->dev_set->lock, protecting the bus/slot reset group from
  * concurrent opens.  A vfio_device reference is acquired for each device
  * to prevent unbinds during the reset operation.
  *
diff --git a/drivers/vfio/pci/vfio_pci_private.h b/drivers/vfio/pci/vfio_pci_private.h
index bbc56c857ef081..70414b6c904d89 100644
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

