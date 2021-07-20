Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7963D009C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 19:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688E46E4BA;
	Tue, 20 Jul 2021 17:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CB56E4C4;
 Tue, 20 Jul 2021 17:43:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+Qq6Ben4Myo4RFSuFvhUwVGYnSlNfoALBcmKgLBzIlfN9W1ICLU0AIUUMVmnZBPE342A92kJ4y5BvV/BgxBCPXMRCe6pugL1YnXu6dVeq4/Splu0+2+s4J9oGWeQ3/fD3BnWQly8Rqsk9+lodKymj8rDefJqzMZWRsjhyR7336zsfb/lwsTwaGiFxGjzDLRR4/iM4i46vds3LoyIzZgh1xXstoHWD66J7//vXssU9jplmHMdi7yD/r/+YblifkMhZuFdBn5COCYnB5a7jAgAr4zCrd8wCN6Bl5lFiUEUF7gRnDdZd/vSv0eBrojH7lbyx/HG9ABsmuVf4uD6BFqBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfSzLrWx9phOGS1Ir9TXtZygWdUrRCe/TL6aPalVd/Q=;
 b=naZ8PO8Q2F08DWB9vhd0Bs0QGkdGoCNIcuP5DaGo7o/zmZ8zjbonUaLfD2XMr8V/B/k+sbdLL9E84I5aY2tkYW8u3bkWVr2Wz0mG1/kV9YT3Wx27SFS/7HYTek1Mepoy0QOW0H9FP+dq3OVisMsZ0Gvcd0wGBW0jqr9HlgTDN/Y+mJPC9QUve3ceiXyvmxt4XDKwwHDvbLJLmpplO3eApDrkbNZbDWyGX1fd5SOOolOl19MW/XVNYsmlpxkA7xsPCopvoDkbwTf8dwXFzmDmgIZTXjVeyDzn4x+vQRGfceHGqxHUFI37fJ/T3Oi4woOrQ3UVD7/w7js+UlyW2SRgNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfSzLrWx9phOGS1Ir9TXtZygWdUrRCe/TL6aPalVd/Q=;
 b=uqS3jydPp6CFFFfeulhVfFICWZuQbJXbAZAkw9vaxceKDB9ccF9XeymSCNGupCL2P17Nbzkw/a0zEm6/NHBozsqPcemcZkHvZJjz2p5YkYTBc+WG0w7wpG2lulArHWdCtEueSQyEbk6rQ4KvMESEN/cc3KnPZ6kT1cJaS2eGu5qktN3r4qRWAgelC9j8gzg7O1NBDTGo6Cxi4N4ITkdIChMtWg8VcBkE2hZuAT/23yb2JDMJEuV7jOwGlDFAggnC+CSu/1F6AgTr0DilLj9BCQ0oKan4xVFHh4iADIHo8xzhVR5uw6tpCYoateActycg4tC2Orm87YhbLGWvSJliCg==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5288.namprd12.prod.outlook.com (2603:10b6:208:314::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 17:43:09 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 17:43:09 +0000
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
Subject: [PATCH v2 08/14] vfio/pci: Move to the device set infrastructure
Date: Tue, 20 Jul 2021 14:42:54 -0300
Message-Id: <8-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0019.namprd22.prod.outlook.com
 (2603:10b6:208:238::24) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR22CA0019.namprd22.prod.outlook.com (2603:10b6:208:238::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Tue, 20 Jul 2021 17:43:04 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m5tll-0051F0-FS; Tue, 20 Jul 2021 14:43:01 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fa1c241-3e48-45ad-54ff-08d94ba5d41a
X-MS-TrafficTypeDiagnostic: BL1PR12MB5288:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB52889EA1A0529837C7DFC00EC2E29@BL1PR12MB5288.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NQScLqjlmub14XzGHQmXkFB2AG1TZeGB+uUF5xcTGN3upzyQLXhndKb/rwj4jRFhIUoqRLPEK0wCTZXE8sWelDmJM4GsVJ/ixbATiPeTg8gkTHOxeFrkvPo/RDPoin78fCjlQ/1O/Jjtkh7nMohLxJ/pXlnUtWYb1hrgTOmm3lDUIBGahb0TfPsdg8Gb6iU20uiN6xeCQEGsJAS7K/ATsXLMxpmYnDLrH6sNMaz3Zt4kXrzU7RtxJsCXMjmChu0719Cfz1LeZOEqNgFH0NAjGz9rCWZm3jpuSIAJVhFAD4AY0zYLEYecE12+v3lLz+CxqVyPsjtmFC2NhWNl48WTeVf3lCyRip0sO73IB+HSeAWQoweYzg44i1fqIn9Lnv2E94BVZDbV3gA/6EEDRd97OFZErP+f6krQUq2oKgNeTzAPbd90dR/65juyeO26fjTxPCvqBwikggWjLL/aB7Zpjclftycf6u21qK5+mEtPySQ/YsobE6cl8g/K44LuITtmbQpMQsjNRyFU/+17v76isgJXP81KYOWPcQC2J+lh44tFcYgcvEJwtu7gW+DnQM5KWZM/5mnvynN/8PNbzXfv5NNBfAKoybiyLXdUd8dQxqQ1a9C2v7fRsSnlijnuulYHJwR4wkkgRdodSZsRFkf/PasDjTuFLREe4jftQhXt71iFMbpbk7Oct368K+A0iJQlXlpAQ19+BMxZdxrA9CjlPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(6666004)(66946007)(7416002)(7406005)(86362001)(2906002)(66476007)(54906003)(38100700002)(83380400001)(8936002)(316002)(110136005)(478600001)(36756003)(66556008)(186003)(26005)(5660300002)(8676002)(921005)(9786002)(9746002)(4326008)(426003)(2616005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6xjNzB7o+9Uy0NQZFdsNKoNfCea5TQnXLnvDrPF5apFsXiAI+49M9op7aiig?=
 =?us-ascii?Q?+8sWMM9cNUjaiqh9sKAiyh6Og89NDGL2sBtDMDBJl3YcRTwgbqKi2q1VdMrA?=
 =?us-ascii?Q?7bnj6Ro8oMh70RMTtKptFCOznHmIwjzVFNKMeY2eDDKk7ELVdDBkKgDCYWnr?=
 =?us-ascii?Q?PVaS6HhOuBO7kGgrqd1WQfXoYi7YgjdpseCRsYitky2RooociU+JObLTzLYh?=
 =?us-ascii?Q?pw4KoccPrWZkFEeL+YyJ/WQIy2l0TVSzQkrqw1lXI+53RFSpuCoaOyuyg7pE?=
 =?us-ascii?Q?AVI19xH1aBnIZ6I9xKoWn7TMQbJezDWHL2m+ei60xwcwa9TO3N+/UJPUyTVF?=
 =?us-ascii?Q?VKlSgIKDzDd3APfV2vossimbGlhT6ODFzvg0tqcnq2nHj9Z0tnlFhqxMBNOk?=
 =?us-ascii?Q?4BivHgqCm/3Cg+lb5zxtmaF6Gr4nVGukoL3yLybKt63jlk1HSxZ4QkPDZi+T?=
 =?us-ascii?Q?6UAq++PB+CfaHZQAsC1tRjYu1QwjxJQ4jMLrQvoNMsATAoRNsJFcoNHznViv?=
 =?us-ascii?Q?XEI2QhIDBc6G4apbPRscUT79DzsQBEqnvMS+EAIMVOT4MmLYdxxqJiQdrlQA?=
 =?us-ascii?Q?J9V+YctMuHi0E53w1F7RpGZ70JsS9nSSYWMW7aeiNqwYAgAQFnqsccStzhz1?=
 =?us-ascii?Q?e92gbsnPmB9+HHbkgKDafc/8ndRLLgCwel2qcJjAScL9mzRqwm6t46W0rcqP?=
 =?us-ascii?Q?nyOYVYno1OpoxEVOZzK4rzrVvNS7cHMwnkK8Tj/7LPWy+mXJN2s1VtHQis79?=
 =?us-ascii?Q?NcpKdWrL7gvd/edrW7stykbK464dJEbkAB0etYvX74ndElNYgm4yOuISibMo?=
 =?us-ascii?Q?ri2E1MbzJw1aUT3Te8Duej3OEDpUWpblexaecsxc8WMjoYA/nd8lTKFwo/8P?=
 =?us-ascii?Q?Lhxss6tJyglaAwYNxFA2th8choXtoN2g3SR0UCoBpo8UthlUAeJoajmb/ZFE?=
 =?us-ascii?Q?VoLmgBMm6Qs5pB4spYz0VPv/tgjppaK/lH+SeyoIcUctacRGRnBSvMssIl9R?=
 =?us-ascii?Q?/+z4sQGNWDAzZl8cFzDg4zyGqvue6xjpc8J64TIG/a4KC4D6HRpc6fw6MDJG?=
 =?us-ascii?Q?6CoYbtjouS1UOcsMSs8KuUlpJqUrdsA5x0jxG+6/SCq+ALirwlMS3X0JIJZu?=
 =?us-ascii?Q?zsf6yv3GE6GYdIIPERFLHHgt5jlo1TVXZwVVU5IJYLbKJHFgrjMrnfNfjnqY?=
 =?us-ascii?Q?RvwX5ElJANPqB0i699Uy/qIRyDhK7meYajLjGH2HwypzqfDKX2Hi5qApN1j6?=
 =?us-ascii?Q?KQT/28thZiOREmKV0e9RT6QaUai9V71coSfEciSrL26XmYZtmoz5TJ6UDw22?=
 =?us-ascii?Q?PqyXD0U89pjUohu6HVtfD//O?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa1c241-3e48-45ad-54ff-08d94ba5d41a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 17:43:05.2546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHyqU1DnSFmxUIS//C/QfIQw0YOx3AcbwqzQrvq+jW2YhQ4PZ8uirg3AGXwNNImW
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

