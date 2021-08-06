Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFDE3E20BC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 03:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0981D6E90E;
	Fri,  6 Aug 2021 01:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EC06E8FE;
 Fri,  6 Aug 2021 01:19:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARr8TEFrc1eU/QXu2lRd/b5YPt6QP6DNUmL7V1hUXHOwufNRAqz/WJn2zGitua7nPchnyEhCxPbDFyB6+hYhE03Nc73vn1KKV2H0CwTcgbsjA67EeuhnaaNVOV1RhzJ6WZW0giOgEn5F2jiWxrk9BBhy61QxDkoJnWFpQAz8D2nZt9gzwqJxZ48P/007muCTvmkvmWvqrwnvk63nLCpnb2peU26+PM9amY80VP5s8yjJO4JJqUCcPDvjLpAu8TVisZ+ZtXV2lrkEGuaOEYJYh7aVhTI//IzxGUfFbcqe8g1XE5wVZpK7dzp5BtPMQyWTbj03wNFRfiLGNutOAQLLbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGuy+uv6yu2jcpwz7Qg4IigmevePcQsgMcnhslUxJmk=;
 b=oa03utw9SxjJyZpyV19GJKKnnBnyRs5g5+9Hd/ig3CH4bBVE6GAHEgJ+XOnOsdy6v4rlT5uI0O/cK0s6K2EgGSMYaX4ItJgt16r2DufQaCouXWF+spJARNIVPxLeBhm2JEX4P54k021cs6fSG+ithIONT2i9ppgP29ISVjdTLX3z9NPeolwe5gi3ZmUvCZE1zLH7VHMweqyl7aoCcAIHS8gXa5iAmhnENYUgo5EUDxEeRLZMdrx3wmoWoMXK9JOHGliQWPIVY01JQ2KJ43ebHN8UhgRupXRNv/p8xQenEkGrDyI0YGv8yx1kY8tVHT5NwPJDxcLZicPXLabYzcqNhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGuy+uv6yu2jcpwz7Qg4IigmevePcQsgMcnhslUxJmk=;
 b=fA4WgNBJs9soeChjuF+im2ddzYEGjYPZaFQc7AzO3f+ziks4XQX59Cd+g5vcCeSQELgD0awPC+G4CZIbjmjhyH7OinDmeu1Jp8xOHqvGcm7aYX99WFv0zk8KWl1otk6C7Z0LkqDphTssJRC1zK+Gb09WYuVuuELSyYQxLyTK8bsU2bLeuLq5+AYH5iTUienFgZy9zYjn47bmTH70s76Zl9Oq1yjc3ZY9fThxiRn8EKr94aZPKsOJI4HVOcJ5dEFlvW4HXsOT/LdxlGbG0wXuGzpMI3VCA4R/eZjnS3nCTPx6IgJRUUxcwYWbj5XqVJQR6LODEdmWRKtHA7LJAWmeVg==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5206.namprd12.prod.outlook.com (2603:10b6:208:31c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 6 Aug
 2021 01:19:13 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%7]) with mapi id 15.20.4394.018; Fri, 6 Aug 2021
 01:19:12 +0000
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
Subject: [PATCH v4 09/14] vfio/pci: Change vfio_pci_try_bus_reset() to use the
 dev_set
Date: Thu,  5 Aug 2021 22:19:05 -0300
Message-Id: <9-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0093.namprd03.prod.outlook.com
 (2603:10b6:208:32a::8) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BLAPR03CA0093.namprd03.prod.outlook.com (2603:10b6:208:32a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.17 via Frontend Transport; Fri, 6 Aug 2021 01:19:12 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mBoVz-00Dt7O-AZ; Thu, 05 Aug 2021 22:19:11 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3775ff5-5aaf-47dc-1dc5-08d9587832cc
X-MS-TrafficTypeDiagnostic: BL1PR12MB5206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB52060D0FDEB2987CDBE7D3BCC2F39@BL1PR12MB5206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VezQk3aYPv3SEha4z3y1Pmg4xYNA8xGCrkDPLIyFCDVJ/D6IAULaO4vH0XRuI9KtKdM+ZIvLltSOSgvlLEi2MIJrbA0Bp9Y3mUfMfNG+RBp3BhdVxQJeAuzwJRgSyY61ARO3YtUP1X1dmI5Q2JA5MHEqIErlpNVQEo2/dZiWe0MJEvCPdc+8MvVwAePpQUq8KPaOJk9Z7gF0bDTIJbdGFwK1kl/RuDB64LW/aepRryu3YxrQXhUwPNzZyMM68Sr3PssiMR46zuhjLwv7lUP3JsCwQ9jmhUad0qvwARZJyJfX6Rqdjg7pYy6oyPOFiRhjRO8qkuQ8rjtOL6yjxy+VJvY0FxV0cHmmjw7M8z/CoZORvYI8rvFswoWdrPAakt5vO/OlTE/k9I7C6i1CRYTsAC2+fB+C/EPSe1NGDt+XfZ11wKbYwlWnHdYuI9X8F7OGYr2VvlIV2pubN6PBgoJCHNGPxCDxTpyRFM8bXbbmU10QA4BmI1M23E4Zvh/blohn43WHSot+GBUshKlVxKbZsJX2KWEyoYIWRDtBrljS8Ym7CLssb9CsfxfmkFXvN76ALwqYZZxgR4+DumMwrgir/Qb4JBb6E3ibwDj8cFC/0yMBD+a9/U5YIopqvWhyULVapHy76jnKhNjd7oPFqlOFYfcGcBNwKGGIDOzYUJAC9NrtZ82QYNXyssNSLC9Lt515cvttmLaK5sFJawA3afm+3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9746002)(83380400001)(86362001)(9786002)(8936002)(426003)(2906002)(7416002)(38100700002)(7406005)(66946007)(921005)(8676002)(5660300002)(186003)(2616005)(26005)(36756003)(508600001)(6666004)(66476007)(316002)(4326008)(66556008)(110136005)(54906003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WO2FNJOSyEK/FROxFyH2xbNc4c0ow7qhmnLRjkeYi5JDIfW2VAagOS5LINHS?=
 =?us-ascii?Q?LWgdYHP9Uc/0i05lWl+xaT5wOgr5U9HIKQcAagcKq7uREI8WFr5oesGNRpuQ?=
 =?us-ascii?Q?7q3mCR93NKBDmZuM4lMAMxDGkDka2QAC5C3RASTDgm4n1pgAA42JJK6mVsgv?=
 =?us-ascii?Q?5dN5lYMslCLV3BZi9Ns7zb0iqi/zsTkE5lKMrCuluRAuCsIyeHfvBfBC6CPJ?=
 =?us-ascii?Q?dnrer1vDgyX6M8UkPMq0fOG+9vC/lOoEpmp3fJ8sUgSOsLMeegFwigbBSasP?=
 =?us-ascii?Q?MmVj+sn69jUsno2vBWeU65BLYU+fsoyhGAdkDF/W9cOf8wcz3Lw6/AWrDpbo?=
 =?us-ascii?Q?ls+NmgOSPPWy0KCFtKg/jsMoAKf72w6c8QgResJ3R88QSMZ0pRCuLg9s3f6d?=
 =?us-ascii?Q?AafV/aEvBtvsA+iN6Q0HeCp3GnGZ+dwdsrwP+c3qwMPYHVZLq9c+watBnkPy?=
 =?us-ascii?Q?HO55gJOlJZ1054ICcV07Uw5+Q7+lEHvffZpZ/X5txMNJf55ErHLy3FA02hT2?=
 =?us-ascii?Q?AQ00vZNqx+BGUiJ9fXH/SpGnZlavlwmYdQUkalNKvkaBlADshkl/EFfywEl7?=
 =?us-ascii?Q?BZtCBQ/30QdmTY6Wo78VaWkryFfTr8sPTYgSQM3OUH4WhxW5eciaveJK1/6m?=
 =?us-ascii?Q?l3lck4PVdOJ/geVCDyTzVNPJLI0x86x45diHTmZBkFrP+sMKNNcP5cjAPFaF?=
 =?us-ascii?Q?WkYEC6rNZw1hvztfBs59FSbByQo5MeVbFwkZ/vXXsVPu9TIRU1772SPIjaoj?=
 =?us-ascii?Q?L4TOTYj8Bo8sTAEO+F+e5InOgFxG+CeBmjWDwX47i2dvvIT67gJckZ6/ub1w?=
 =?us-ascii?Q?393y9aVpmpLtHDgOKdoQc5wx4MbjsQmHMGne2EA783pUNymJgEqdN/npPRSQ?=
 =?us-ascii?Q?+9Ba0TpAZzGGX3SiFpti/yW7IR9qxd5tfvbrdcm07ozoYttT8KwSbn3g9K3r?=
 =?us-ascii?Q?6qyoxr87x4B41EYxGqCWaxkYclmtf7UNGFeis7Ug2cwIZ8CdNvccLSiQa0/k?=
 =?us-ascii?Q?b+p8DnwPX60z9s0+qvFpifOfxsVuXyZAN45Wk5Y9H4YKu7H/82DisXimhjZ6?=
 =?us-ascii?Q?BOOMPzXb/3QdaFt/KSl7n6nfLhmIUnKD2UU4QOI3zI27peRIUIpqkzPwF8UK?=
 =?us-ascii?Q?RmfzSNyBewxkQXt2Ldd6CeoHQXNhUkSHgP4WJvVGBXrGEmOkE3aEPfm93P4d?=
 =?us-ascii?Q?TuipMFBKKV2OJX7pGQVTxxa/tRiZRTC7L5QFQchT0ekRLosspW4epQrvgcdZ?=
 =?us-ascii?Q?HXAfwIcyokYnm2CFEHsw+wpsGgbAOkQGb5AiQtiSIYC9Ag45lfHIagMgQeHf?=
 =?us-ascii?Q?cCvFfiXweAnYr1jTtsRLKbd1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3775ff5-5aaf-47dc-1dc5-08d9587832cc
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 01:19:12.3075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJoZdOVJpiSkvThDQdRh55WWp6OrJfN6k+qLDnZV9gVhPi2DhU42+ayuBEk0bzIL
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

vfio_pci_try_bus_reset() is triggering a reset of the entire_dev set if
any device within it has accumulated a needs_reset. This reset can only be
done once all of the drivers operating the PCI devices to be reset are in
a known safe state.

Make this clearer by directly operating on the dev_set instead of the
vfio_pci_device. Rename the function to vfio_pci_dev_set_try_reset().

Use the device list inside the dev_set to check that all drivers are in a
safe state instead of working backwards from the pci_device.

The dev_set->lock directly prevents devices from joining/leaving the set,
or changing their state, which further implies the pci_device cannot
change drivers or that the vfio_device be freed, eliminating the need for
get/put's.

If a pci_device to be reset is not in the dev_set then the reset cannot be
used as we can't know what the state of that driver is. Directly measure
this by checking that every pci_device is in the dev_set - which
effectively proves that VFIO drivers are attached to everything.

Remove the odd interaction around vfio_pci_set_power_state() - have the
only caller avoid its redundant vfio_pci_set_power_state() instead of
avoiding it inside vfio_pci_dev_set_try_reset().

This restructuring corrects a call to pci_dev_driver() without holding the
device_lock() and removes a hard wiring to &vfio_pci_driver.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/pci/vfio_pci.c | 182 +++++++++++++++++-------------------
 1 file changed, 86 insertions(+), 96 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index 5d6db93d6c680f..0147f04c91b2fb 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -223,7 +223,7 @@ static void vfio_pci_probe_mmaps(struct vfio_pci_device *vdev)
 	}
 }
 
-static void vfio_pci_try_bus_reset(struct vfio_pci_device *vdev);
+static bool vfio_pci_dev_set_try_reset(struct vfio_device_set *dev_set);
 static void vfio_pci_disable(struct vfio_pci_device *vdev);
 static int vfio_pci_try_zap_and_vma_lock_cb(struct pci_dev *pdev, void *data);
 
@@ -404,6 +404,9 @@ static void vfio_pci_disable(struct vfio_pci_device *vdev)
 	struct vfio_pci_ioeventfd *ioeventfd, *ioeventfd_tmp;
 	int i, bar;
 
+	/* For needs_reset */
+	lockdep_assert_held(&vdev->vdev.dev_set->lock);
+
 	/* Stop the device from further DMA */
 	pci_clear_master(pdev);
 
@@ -487,9 +490,7 @@ static void vfio_pci_disable(struct vfio_pci_device *vdev)
 out:
 	pci_disable_device(pdev);
 
-	vfio_pci_try_bus_reset(vdev);
-
-	if (!disable_idle_d3)
+	if (!vfio_pci_dev_set_try_reset(vdev->vdev.dev_set) && !disable_idle_d3)
 		vfio_pci_set_power_state(vdev, PCI_D3hot);
 }
 
@@ -2145,36 +2146,6 @@ static struct pci_driver vfio_pci_driver = {
 	.err_handler		= &vfio_err_handlers,
 };
 
-static int vfio_pci_get_unused_devs(struct pci_dev *pdev, void *data)
-{
-	struct vfio_devices *devs = data;
-	struct vfio_device *device;
-	struct vfio_pci_device *vdev;
-
-	if (devs->cur_index == devs->max_index)
-		return -ENOSPC;
-
-	device = vfio_device_get_from_dev(&pdev->dev);
-	if (!device)
-		return -EINVAL;
-
-	if (pci_dev_driver(pdev) != &vfio_pci_driver) {
-		vfio_device_put(device);
-		return -EBUSY;
-	}
-
-	vdev = container_of(device, struct vfio_pci_device, vdev);
-
-	/* Fault if the device is not unused */
-	if (device->open_count) {
-		vfio_device_put(device);
-		return -EBUSY;
-	}
-
-	devs->devices[devs->cur_index++] = vdev;
-	return 0;
-}
-
 static int vfio_pci_try_zap_and_vma_lock_cb(struct pci_dev *pdev, void *data)
 {
 	struct vfio_devices *devs = data;
@@ -2208,79 +2179,98 @@ static int vfio_pci_try_zap_and_vma_lock_cb(struct pci_dev *pdev, void *data)
 	return 0;
 }
 
+static int vfio_pci_is_device_in_set(struct pci_dev *pdev, void *data)
+{
+	struct vfio_device_set *dev_set = data;
+	struct vfio_device *cur;
+
+	list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
+		if (cur->dev == &pdev->dev)
+			return 0;
+	return -EBUSY;
+}
+
 /*
- * If a bus or slot reset is available for the provided device and:
+ * vfio-core considers a group to be viable and will create a vfio_device even
+ * if some devices are bound to drivers like pci-stub or pcieport. Here we
+ * require all PCI devices to be inside our dev_set since that ensures they stay
+ * put and that every driver controlling the device can co-ordinate with the
+ * device reset.
+ *
+ * Returns the pci_dev to pass to pci_reset_bus() if every PCI device to be
+ * reset is inside the dev_set, and pci_reset_bus() can succeed. NULL otherwise.
+ */
+static struct pci_dev *
+vfio_pci_dev_set_resettable(struct vfio_device_set *dev_set)
+{
+	struct pci_dev *pdev;
+
+	lockdep_assert_held(&dev_set->lock);
+
+	/*
+	 * By definition all PCI devices in the dev_set share the same PCI
+	 * reset, so any pci_dev will have the same outcomes for
+	 * pci_probe_reset_*() and pci_reset_bus().
+	 */
+	pdev = list_first_entry(&dev_set->device_list, struct vfio_pci_device,
+				vdev.dev_set_list)->pdev;
+
+	/* pci_reset_bus() is supported */
+	if (pci_probe_reset_slot(pdev->slot) && pci_probe_reset_bus(pdev->bus))
+		return NULL;
+
+	if (vfio_pci_for_each_slot_or_bus(pdev, vfio_pci_is_device_in_set,
+					  dev_set,
+					  !pci_probe_reset_slot(pdev->slot)))
+		return NULL;
+	return pdev;
+}
+
+static bool vfio_pci_dev_set_needs_reset(struct vfio_device_set *dev_set)
+{
+	struct vfio_pci_device *cur;
+	bool needs_reset = false;
+
+	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
+		/* No VFIO device in the set can have an open device FD */
+		if (cur->vdev.open_count)
+			return false;
+		needs_reset |= cur->needs_reset;
+	}
+	return needs_reset;
+}
+
+/*
+ * If a bus or slot reset is available for the provided dev_set and:
  *  - All of the devices affected by that bus or slot reset are unused
- *    (!refcnt)
  *  - At least one of the affected devices is marked dirty via
  *    needs_reset (such as by lack of FLR support)
- * Then attempt to perform that bus or slot reset.  Callers are required
- * to hold vdev->dev_set->lock, protecting the bus/slot reset group from
- * concurrent opens.  A vfio_device reference is acquired for each device
- * to prevent unbinds during the reset operation.
- *
- * NB: vfio-core considers a group to be viable even if some devices are
- * bound to drivers like pci-stub or pcieport.  Here we require all devices
- * to be bound to vfio_pci since that's the only way we can be sure they
- * stay put.
+ * Then attempt to perform that bus or slot reset.
+ * Returns true if the dev_set was reset.
  */
-static void vfio_pci_try_bus_reset(struct vfio_pci_device *vdev)
+static bool vfio_pci_dev_set_try_reset(struct vfio_device_set *dev_set)
 {
-	struct vfio_devices devs = { .cur_index = 0 };
-	int i = 0, ret = -EINVAL;
-	bool slot = false;
-	struct vfio_pci_device *tmp;
+	struct vfio_pci_device *cur;
+	struct pci_dev *pdev;
+	int ret;
 
-	if (!pci_probe_reset_slot(vdev->pdev->slot))
-		slot = true;
-	else if (pci_probe_reset_bus(vdev->pdev->bus))
-		return;
+	if (!vfio_pci_dev_set_needs_reset(dev_set))
+		return false;
 
-	if (vfio_pci_for_each_slot_or_bus(vdev->pdev, vfio_pci_count_devs,
-					  &i, slot) || !i)
-		return;
+	pdev = vfio_pci_dev_set_resettable(dev_set);
+	if (!pdev)
+		return false;
 
-	devs.max_index = i;
-	devs.devices = kcalloc(i, sizeof(struct vfio_device *), GFP_KERNEL);
-	if (!devs.devices)
-		return;
+	ret = pci_reset_bus(pdev);
+	if (ret)
+		return false;
 
-	if (vfio_pci_for_each_slot_or_bus(vdev->pdev,
-					  vfio_pci_get_unused_devs,
-					  &devs, slot))
-		goto put_devs;
-
-	/* Does at least one need a reset? */
-	for (i = 0; i < devs.cur_index; i++) {
-		tmp = devs.devices[i];
-		if (tmp->needs_reset) {
-			ret = pci_reset_bus(vdev->pdev);
-			break;
-		}
+	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
+		cur->needs_reset = false;
+		if (!disable_idle_d3)
+			vfio_pci_set_power_state(cur, PCI_D3hot);
 	}
-
-put_devs:
-	for (i = 0; i < devs.cur_index; i++) {
-		tmp = devs.devices[i];
-
-		/*
-		 * If reset was successful, affected devices no longer need
-		 * a reset and we should return all the collateral devices
-		 * to low power.  If not successful, we either didn't reset
-		 * the bus or timed out waiting for it, so let's not touch
-		 * the power state.
-		 */
-		if (!ret) {
-			tmp->needs_reset = false;
-
-			if (tmp != vdev && !disable_idle_d3)
-				vfio_pci_set_power_state(tmp, PCI_D3hot);
-		}
-
-		vfio_device_put(&tmp->vdev);
-	}
-
-	kfree(devs.devices);
+	return true;
 }
 
 static void __exit vfio_pci_cleanup(void)
-- 
2.32.0

