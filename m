Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E42C93C9526
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 02:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77A46E513;
	Thu, 15 Jul 2021 00:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291276E520;
 Thu, 15 Jul 2021 00:20:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vl1HOsAHGzH+LTohJeq27/dJEmA/Nbam8pXDmkUKshZpbdNNP2yVw3OxMaOEG79oTt+ySs9l+wMyklnG1jK2X5LP0ixTUzN8+1Y1bwNzfKO/4PA41A9RUrZ21LeAZlKtcK7BJ9iMs4CjUjFJJ7HtmjzsR/eOa2ORswIwx0Y6KkqGkFWWlDYXQmJRdjZke/3jopbeR4bsj8AyZzJIJg9dckDsHSq2rguxRHwurA4sF3yg44N0oYVfNkKU+UNiqXiidJ7E4zCUQcDbn1GdIgYhTzb1d0MEgRvJIAB+nOJaTaGrmITm+tl83AQDjqU6a0M7119pX9iaygUQT8McpV1BWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UD/1ND3WjMAvCzEW8ntZtZuwg29W/AC0FqTAlDAgfwk=;
 b=iuLQ1y/uUhGX4QLOblb0Xv4gEVzYJU5Iz6BINt9Dh880R1Y7NtUSczM7uUaSl3FH7+cGUSNJOtvyZznZDUKrlSN7MMqiQ2RBxMCzybDtQxntmL5KhmYdeq70w2J0Tsy1gZineTUWh5gdklMI8+I0oIk96NMvNrbVYBCo2jDNISMEJ2Lz0fU02bGd7hAhUDaHUaeniFuZ5Z+zUSK/ng4zSWoK5NCVzJ8XW5rmgErzXsNRPHsPFvkGUgQriNmM3/s14zjkbFKXw+mupwqGtcXrjZKeT9q6jQ0w4+8465evBsxIYI+EzA+DTQyraHs+tVPxcznLC2RDdoY7RXyW6UWK0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UD/1ND3WjMAvCzEW8ntZtZuwg29W/AC0FqTAlDAgfwk=;
 b=g1kSjd1LjflMlDf/6r6WiApGaf/OwyvqpJOpt0a7sWXemLGNscXnGqqEe0RDg53FApqaa4B3q7V7kmY9ZkwmE/dAVOQ03LeTQfJYNsHsW91xGcy7r3Hppe3HJnK+d+KPEPCtaNzoeKjvenL+/tPzrnOvOWLf0pPaO+89fVM3Ij0RqYKV4Y/7cGz6uIyVMCbGJzUL35U/13bU0vZoVnR5BMwIAZobBs4FhYldU8mxHjCWz5oY5hajmBAQ5QOWeEII8PY5hWesMxrlhPV7CPQPpPYM2fQHNmvQtU5Cx2dvRkmiINXd6oSxsdr2OqEecsMof5cBIIOEPDTNzn5GWb0u3w==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5555.namprd12.prod.outlook.com (2603:10b6:208:1c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Thu, 15 Jul
 2021 00:20:52 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 00:20:52 +0000
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
Subject: [PATCH 08/13] vfio/pci: Change vfio_pci_try_bus_reset() to use the
 dev_set
Date: Wed, 14 Jul 2021 21:20:37 -0300
Message-Id: <8-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:610:b0::29) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 CH0PR03CA0024.namprd03.prod.outlook.com (2603:10b6:610:b0::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 00:20:46 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m3p7K-002Uxa-OP; Wed, 14 Jul 2021 21:20:42 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5526b35a-5120-4646-5b56-08d947266411
X-MS-TrafficTypeDiagnostic: BL0PR12MB5555:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB5555212A855D0C21DFED8C6DC2129@BL0PR12MB5555.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x7sxUDEbZ65OhRBf+mkmYWnBFoEbL92mSKkdHxNEJjrEoavcWcQ1bSvExiBVpnFLOh3id2UBcSRdCevcW+wE9Zb7oeYlImBecb9h9tsqv0Fd/hXsbzwA1bAo4XphIt1H56lfaBOf9SIBU3HgxsrcM9FDdUAEPdg+HEtrptKVOI5CKBtcwclKxZw3VLuT2w3gmdK9Ii6q8YFR1yEVhZL/8rhlCqddT/0pRs4tfl6lcJvs0JxfLxg7KHGJskxDAQ2aVfy7k3n5Gbm36D05JtQ8nX9UWxzZUvyzxPiG2ZFA/cIZ1xhrEXG1Ut4OLyIJK9axTql0PSSdcrE8bh9DUWkuh+eXTKX9AD9bCltSKp9Q3RQ3bzgTlQUWGUcpDsORtdqRB/wXdGpcCxWO1vHR7S5F32xd4OHybfCeeZkLuba5dEUUKXrXXt2FCrFz1biB+HMZZx5S8QMj8W875SK4i+AV4qo1PPk4PE4uuFqSdrJZrQ9l1uKH04tzljuPgnT0EDRMrDvOkz2Ist/QrifdRg+hjm/Z8HoiipT0VKYK71bwKnM0LJePOC1Sg+u+GFzyw3bELY0Kwpj0rdlbZvUZ1Hfd2eFIzYLo8+2kO8bj5R/lu5fOqChXy56ZsWZAuV4lVBXHUPwq5hxemWRbyAMx8Qvwa6tZBmiypE20y9TVM5EfUYh4Z1RI8QHnNgtD8HkxDsSs2d6gxMClhHqhIie6907oRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(83380400001)(2616005)(426003)(316002)(107886003)(2906002)(478600001)(4326008)(7416002)(7406005)(38100700002)(36756003)(5660300002)(66556008)(66476007)(66946007)(921005)(9746002)(26005)(8936002)(110136005)(54906003)(8676002)(9786002)(86362001)(6666004)(186003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TipHyy3AIPmn9pT5Nh4lwqVDjIKTWS72euvzmw+GPCCaa1JImtn7TyyeXoJd?=
 =?us-ascii?Q?chB2FgCAHkShxKn1kxGhXGWmp/r9IzkKHF2aT81p3ApH3lRC/jXTl6F6O+bM?=
 =?us-ascii?Q?bVmvamYzCEKkQcWq7gZcIIjOth+CCjkJPBv/YUbWHDPkIwaf20EbpQ0JrJTv?=
 =?us-ascii?Q?a/3Co/RbcQXfuAagkRjEOIox73xXT0qVZEwftpdLKDZCS50BoI5YAFdqseGy?=
 =?us-ascii?Q?gFrJ7nBfmOIYxjLGhl2olzDMLxFCSqOzZJBbILFUKi5blEUK4oJPgCG27tbU?=
 =?us-ascii?Q?r8EnrD+f5EvrzJShvEAtuLraUtm1x0BpWt3CCWMJtE6GiNdl7BMvR973oyXa?=
 =?us-ascii?Q?ye3JEzgBGkPd2crEam0PKGbKtEX5C936ZJ6paFKAzNmgJh/ppQFfSf7HxGiW?=
 =?us-ascii?Q?ZKiIwChOB9ez3NKM/cu3BSN4PL9PK71Xo5AdkSo7ttpmYsB8iDMoNPJAu5ga?=
 =?us-ascii?Q?1U8Wm0ZairMpi1SJMarBVBLP7NF4b/aF08pZFxk6OCXX0nzdDxRVrv9SBfyL?=
 =?us-ascii?Q?SeUTccD8nYH/es2TrjM+ia+7ih8YWRQTp/3CaKreempHPvhZ7ZcqM4GBfwuK?=
 =?us-ascii?Q?2MxwlXfaPgT/eg/9eF5rZXWqD8IkPT85Zp9xqju6XDnOUNOyBDXB5GDmCfrY?=
 =?us-ascii?Q?h4G789YvM7RAW3CIs/Fs61dUm4+QA/MvvZaF/Eu/uIH6weCBxfZyIVDG+PpW?=
 =?us-ascii?Q?pMJZ72QhvWF0QeQ+tS9xjRlhB93Wb8gp9WnPRP/u9MjuEF340eQPa7zhCSDk?=
 =?us-ascii?Q?Eh7fryt+ieZBDvlb3V6ydAsUXLyiKrjYy7jSXw39mbIUrtyZol28KnOdtt0c?=
 =?us-ascii?Q?yvaKfZRO6PY8UoLJFc75/BWX7By9hMCoxJfrANtuaXc11NDB+fpKtMu/fvhI?=
 =?us-ascii?Q?S9t1MEV2OXrdCYpUJAiZs0JwwLK9LUYtBuUG6G0Xh0mTJFONAaseiyEBb6QV?=
 =?us-ascii?Q?q0Z3g3xQnMmNFUzInB4IVcNHS4oCBBeBvvcrRfNZZXQZB8phm1mrlxvncjoA?=
 =?us-ascii?Q?RehjrLoIRlPefyIuyDB/Z/BSE0/2TdjqeQ2m07yPzKjNiLEqk8BE754/1/n/?=
 =?us-ascii?Q?IWEjdsGqXPXqECIUv9x+OD+wdlJks7LsFBOKx2HhkEi1xciKwWXxI4zc/BjR?=
 =?us-ascii?Q?cZWKUkdNJ414whqIvBzKLPLk+EYEH//JZvZ534T3AbI9qFIL90k4lCR0KMjF?=
 =?us-ascii?Q?WJ1fqAZhQKJ72DC4WyK9ZB0blNtImTbZMyvj91a+wBJQigI2KhtPdriJZSsC?=
 =?us-ascii?Q?OK0Hfm+Uya1FO6T8ai7KztkTUOGdxb8nQQ5VFQiaNp0BjrOi2BhVVwpHx/UZ?=
 =?us-ascii?Q?4bMxThod15yi1rGcKV7w7KpL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5526b35a-5120-4646-5b56-08d947266411
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 00:20:46.4467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PoirCNknu0MDVW9iX+I3cWFUd98vrxoo9bV5hXkuzyI3MfOf56dsMgq1iY8h1jjP
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

Keep track of all the vfio_devices that have been added to the device set
and use this list in vfio_pci_try_bus_reset() instead of trying to work
backwards from the pci_device.

The dev_set->lock directly prevents devices from joining/leaving the set,
which further implies the pci_device cannot change drivers or that the
vfio_device be freed, eliminating the need for get/put's.

Completeness of the device set can be directly measured by checking if
every PCI device in the reset group is also in the device set - which
proves that VFIO drivers are attached to everything.

This restructuring corrects a call to pci_dev_driver() without holding the
device_lock() and removes a hard wiring to &vfio_pci_driver.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/pci/vfio_pci.c | 110 ++++++++++++++----------------------
 drivers/vfio/vfio.c         |  10 ++++
 include/linux/vfio.h        |   2 +
 3 files changed, 53 insertions(+), 69 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index 22774e447b5f4a..fbc20f6d2dd412 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -404,6 +404,9 @@ static void vfio_pci_disable(struct vfio_pci_device *vdev)
 	struct vfio_pci_ioeventfd *ioeventfd, *ioeventfd_tmp;
 	int i, bar;
 
+	/* For needs_reset */
+	lockdep_assert_held(&vdev->vdev.dev_set->lock);
+
 	/* Stop the device from further DMA */
 	pci_clear_master(pdev);
 
@@ -2139,34 +2142,17 @@ static struct pci_driver vfio_pci_driver = {
 	.err_handler		= &vfio_err_handlers,
 };
 
-static int vfio_pci_get_unused_devs(struct pci_dev *pdev, void *data)
+static int vfio_pci_check_all_devices_bound(struct pci_dev *pdev, void *data)
 {
-	struct vfio_devices *devs = data;
-	struct vfio_device *device;
-	struct vfio_pci_device *vdev;
-
-	if (devs->cur_index == devs->max_index)
-		return -ENOSPC;
+	struct vfio_device_set *dev_set = data;
+	struct vfio_device *cur;
 
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
+	lockdep_assert_held(&dev_set->lock);
 
-	devs->devices[devs->cur_index++] = vdev;
-	return 0;
+	list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
+		if (cur->dev == &pdev->dev)
+			return 0;
+	return -EBUSY;
 }
 
 static int vfio_pci_try_zap_and_vma_lock_cb(struct pci_dev *pdev, void *data)
@@ -2210,8 +2196,7 @@ static int vfio_pci_try_zap_and_vma_lock_cb(struct pci_dev *pdev, void *data)
  *    needs_reset (such as by lack of FLR support)
  * Then attempt to perform that bus or slot reset.  Callers are required
  * to hold vdev->dev_set->lock, protecting the bus/slot reset group from
- * concurrent opens.  A vfio_device reference is acquired for each device
- * to prevent unbinds during the reset operation.
+ * concurrent opens.
  *
  * NB: vfio-core considers a group to be viable even if some devices are
  * bound to drivers like pci-stub or pcieport.  Here we require all devices
@@ -2220,61 +2205,48 @@ static int vfio_pci_try_zap_and_vma_lock_cb(struct pci_dev *pdev, void *data)
  */
 static void vfio_pci_try_bus_reset(struct vfio_pci_device *vdev)
 {
-	struct vfio_devices devs = { .cur_index = 0 };
-	int i = 0, ret = -EINVAL;
-	bool slot = false;
-	struct vfio_pci_device *tmp;
-
-	if (!pci_probe_reset_slot(vdev->pdev->slot))
-		slot = true;
-	else if (pci_probe_reset_bus(vdev->pdev->bus))
-		return;
+	struct vfio_device_set *dev_set = vdev->vdev.dev_set;
+	struct vfio_pci_device *to_reset = NULL;
+	struct vfio_pci_device *cur;
+	int ret;
 
-	if (vfio_pci_for_each_slot_or_bus(vdev->pdev, vfio_pci_count_devs,
-					  &i, slot) || !i)
+	if (pci_probe_reset_slot(vdev->pdev->slot) &&
+	    pci_probe_reset_bus(vdev->pdev->bus))
 		return;
 
-	devs.max_index = i;
-	devs.devices = kcalloc(i, sizeof(struct vfio_device *), GFP_KERNEL);
-	if (!devs.devices)
-		return;
+	lockdep_assert_held(&vdev->vdev.dev_set->lock);
 
-	if (vfio_pci_for_each_slot_or_bus(vdev->pdev,
-					  vfio_pci_get_unused_devs,
-					  &devs, slot))
-		goto put_devs;
+	/* All VFIO devices have a closed FD */
+	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list)
+		if (cur->vdev.open_count)
+			return;
+
+	/* All devices in the group to be reset need VFIO devices */
+	if (vfio_pci_for_each_slot_or_bus(
+		    vdev->pdev, vfio_pci_check_all_devices_bound, dev_set,
+		    !pci_probe_reset_slot(vdev->pdev->slot)))
+		return;
 
 	/* Does at least one need a reset? */
-	for (i = 0; i < devs.cur_index; i++) {
-		tmp = devs.devices[i];
-		if (tmp->needs_reset) {
-			ret = pci_reset_bus(vdev->pdev);
+	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
+		if (cur->needs_reset) {
+			to_reset = cur;
 			break;
 		}
 	}
+	if (!to_reset)
+		return;
 
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
+	ret = pci_reset_bus(to_reset->pdev);
+	if (ret)
+		return;
 
-			if (tmp != vdev && !disable_idle_d3)
-				vfio_pci_set_power_state(tmp, PCI_D3hot);
-		}
+	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
+		cur->needs_reset = false;
 
-		vfio_device_put(&tmp->vdev);
+		if (cur != to_reset && !disable_idle_d3)
+			vfio_pci_set_power_state(cur, PCI_D3hot);
 	}
-
-	kfree(devs.devices);
 }
 
 static void __exit vfio_pci_cleanup(void)
diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 6908c2ae9b36f6..26d340283044e7 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -127,7 +127,12 @@ int vfio_assign_device_set(struct vfio_device *device, void *set_id)
 	if (dev_set) {
 		dev_set->device_count++;
 		xa_unlock(&vfio_device_set_xa);
+
+		mutex_lock(&dev_set->lock);
 		device->dev_set = dev_set;
+		list_add_tail(&device->dev_set_list, &dev_set->device_list);
+		mutex_unlock(&dev_set->lock);
+
 		if (dev_set != alloc_dev_set)
 			kfree(alloc_dev_set);
 		return 0;
@@ -141,6 +146,7 @@ int vfio_assign_device_set(struct vfio_device *device, void *set_id)
 	if (!alloc_dev_set)
 		return -ENOMEM;
 	mutex_init(&alloc_dev_set->lock);
+	INIT_LIST_HEAD(&alloc_dev_set->device_list);
 	alloc_dev_set->set_id = set_id;
 	goto again;
 }
@@ -153,6 +159,10 @@ static void vfio_release_device_set(struct vfio_device *device)
 	if (!dev_set)
 		return;
 
+	mutex_lock(&dev_set->lock);
+	list_del(&device->dev_set_list);
+	mutex_unlock(&dev_set->lock);
+
 	xa_lock(&vfio_device_set_xa);
 	dev_set->device_count--;
 	if (!dev_set->device_count) {
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 128b4db00adc57..f0e6a72875e471 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -23,6 +23,7 @@
 struct vfio_device_set {
 	void *set_id;
 	struct mutex lock;
+	struct list_head device_list;
 	unsigned int device_count;
 };
 
@@ -31,6 +32,7 @@ struct vfio_device {
 	const struct vfio_device_ops *ops;
 	struct vfio_group *group;
 	struct vfio_device_set *dev_set;
+	struct list_head dev_set_list;
 
 	/* Members below here are private, not for driver use */
 	refcount_t refcount;
-- 
2.32.0

