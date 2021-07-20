Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C9A3D00A0
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 19:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4FE6E500;
	Tue, 20 Jul 2021 17:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54AB06E4E8;
 Tue, 20 Jul 2021 17:43:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOot55sPUp9de/iPPxLhd0Jw/7RjBYYusHYytQoNoxArojD1pt91DtP46lZVFrUrZaTQmqE3S3oNxvtJUG8jBJ7bqF+bHENBhaJ1lrNb/zj6YgOAhoxjk3ads0EdxrIiKHPrY1fCmOTvFLhaBPw9z8n2G4RFMuUhNGZl7b65NNuPNQLbz/NUiAwWMO1NgMVBgQj4HEWm8tiV44LaGAB4bCAzERf8Lu51E0YkGwOFFFTAi3fKw98sfPSDyQfHvWD7Da5qYr54TVYJ58ijOqbCYyWUjRlcwwdPyw2zwpEEHKdPUtxvcej5YRYFRAyvasuRPulGSda8M97cbGSXg52nqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0lNkTQD1vanlR/Ltc7GgcGK4VYeDxLnG7YEUFQ6P7I=;
 b=Tnt/YNe9YGyTYoYoImoo1vus+zWTdEPSygIoVnW5u53OEMpPLzeWFpW73kEdPopY49sN3eXxuio1r8r/RoxFonk09pbSG3uy+VYYm4iUrEUtrlbMOruU/sStQb3pW4Fa+K/0SMfTdqz05Evo5iA98AKTVMfb0vV3h4nNuq5eiBkuZWAEBQsb4fSI4T1+jXah+g8kP7aCZWlhidUhT7PX/g6QRf40Jt7piajQADVK1PhpU1QFto2GfB3UuxmwEe2vKOuxYeOYvk60NzXSO2j1EbWBx4eX/PlG6IhuuVJ6cwex6h6z+D0UFI5ebnFM5M85sQ+JqCxr8971WmmsSulV0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0lNkTQD1vanlR/Ltc7GgcGK4VYeDxLnG7YEUFQ6P7I=;
 b=Drjt+NWC7uSB1ZJJd9rrbnXP4r9iFUy8mUSVbOPysxmMGcGUKix7DuXXdc/x7Dpab8ydHa7g+WXCksm+s/huQyaDD77aU4ncH7jJS1qh6WDC0aTGw8uXuphUYAKCpbBrviCa3+zL54NrsyTxgEbEcMAS8fgLQjR8VJ0AHz8LibQQ5xvb75VbnyviJHMl3a31p0SPe+mKiAehBGh67d3rC2E2aJgQb7K4O0zbGn83eoWKL6QfG/roNcTRFSNaJxPZNOOibt5snB77T4ZdRiI0eJ25zl3si5JBpGlPtDDX2IDfkLrDaQ+U7imETXYwa9Q/qwwk2v3Faf4RooCU19OJzg==
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
Subject: [PATCH v2 09/14] vfio/pci: Change vfio_pci_try_bus_reset() to use the
 dev_set
Date: Tue, 20 Jul 2021 14:42:55 -0300
Message-Id: <9-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:208:fc::29) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR02CA0016.namprd02.prod.outlook.com (2603:10b6:208:fc::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 17:43:03 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m5tll-0051F4-Ik; Tue, 20 Jul 2021 14:43:01 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f3a4786-216b-4341-b370-08d94ba5d37d
X-MS-TrafficTypeDiagnostic: BL1PR12MB5288:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5288131FC677A37180A5A3B3C2E29@BL1PR12MB5288.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oCayBSaOlurHVP3RgZL2gg9gqdn1a6Xi0XukFsjtZGVzGHx3N+5TvdKz9cfT6iUTPBnGqtvgU587od6/hIqLOh1DKWZ9zIy40w71aF4Ph86U0caXlyGBBhecGeYM7eFqUFLP+rFVF1NzV4wv3EAXT7LqEbnpv7ALuDprcUwp/wlyyd8ojsiaz0xXVga1or5ORCRN0wyqgG17rJXXLrDXcK+w+PcYiGeS9sVZkvR2toZpjYNMIlyAuJtGgvvWk4habyMr6pFXyyWSBs/WDQ7lCxHWdVjVI7hnYWsBiBGsdA5Wo+ra1NZCerMzN9LpzmN6E4rUSrajpQrnZlrLrCZ40VkYUVWiiawvQ/mSuq/ppJjsMH4l0GJe+EJU4oG/vXiI34xMRkekUYqTrh42XXEQHRio+XTNq5XAnM2S5JpMy6dpjlE0oWyC5Vvn5Obo3QQhn1namQ6UHMd/0FFrqgZJBNKNTjFdHPI+kEqpVt1rm+DFeW6uigw3s1oYU1SzNtEQJn/+LgbH3m3VNx62TXQSynVbOTuvbcOKhwADpx3zepg0i3bFxA3IdtiKqoroQm2+Fhzih2S5SrHY1b7EsPVgK91dSMDJJWIfFRcPDRhPuD/SJWlxO719JUHNcrWvWoVlQbRzNdO22IKY2XZSRC+j4/XMZp5/os7t5tf1teWW6pgfB3bN4ZHb9w7DM05O9uniZav7iUCyIXh56gMeRHeixQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(6666004)(66946007)(7416002)(7406005)(86362001)(2906002)(66476007)(54906003)(38100700002)(83380400001)(8936002)(316002)(110136005)(478600001)(36756003)(66556008)(186003)(26005)(5660300002)(8676002)(921005)(9786002)(9746002)(4326008)(426003)(2616005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Uqsy6FaEsJykhpYzcxCmCpFT8zmxqiIXqUlH4SqP9k3YYrmnSNyBz9Swb3PP?=
 =?us-ascii?Q?Dx8JJnEbsceSuL0ghnMpSfu1ZxgT3AgYw98tGlvyHk+TUqYikkCqHQErpbx0?=
 =?us-ascii?Q?xxAtIM+GU7Fat5jSu+tOya+gGIXKIuvbA+HmbxZwBk7piyoOc9QrBGek8bJb?=
 =?us-ascii?Q?4hfYECNx4IShHhdbCobJP9GjwWUJO1PeTHQ8jrlMi9gpHjGI5IouZHyl9qBa?=
 =?us-ascii?Q?mxbLz/bLeEllPEgj0AMRxyAI/PV66JTRfgOlQpc8P82Os69mOGEsyD1/wqwv?=
 =?us-ascii?Q?Hm3S81owXZ2MVpXEHcZvL4nHQfB16HhDQFVO4ZlUdeOQrjmMcCHsDskeCtSR?=
 =?us-ascii?Q?NVa3oGJw9ucNDQdQIR3k+EiOYj78BwOJ/Z6H3wQsyivIYcZzwGo71ho3QRxa?=
 =?us-ascii?Q?dJZFfklLZh8Fzyqr2y2uC2t35QyYoMSEft6JjlbH4DcPcNdmEuIwNrvVJSQH?=
 =?us-ascii?Q?S+gZi6jhiudvl5trhSVdjw32vVqhAox4gmwA5crXuwBtZOQX2/ZKkeQY23oD?=
 =?us-ascii?Q?IbWt1eUPK1hv7Q6QyrjbIzGmh5mZU3+nvHGg8WlqJWF3HRLf115IiaauukO5?=
 =?us-ascii?Q?Vxto8raByUqfhk9tFsv2fJx1j9rZDn2SD1CNI1GkOgu4QgKXBP7CA8vMUx4t?=
 =?us-ascii?Q?DrS7K3v0wkPxnrlt6w4KWlbjMBuR5eSQ3PBHYrMNZM7AP4KddrO+ax5AoyPm?=
 =?us-ascii?Q?2l6forjaQX7hPVnCk+pEYS/PS/ANlNm7g3p7ktQS24ACjFKPqr+JDNRKbXW7?=
 =?us-ascii?Q?vloqeTrhrIMeqffP+JVSM44iKSkz8X7+ZdXTAT66tp9+nfJoG/FAr1EofZ12?=
 =?us-ascii?Q?Ooi3Eov4fsLsNOeCFz0KmGVlAuq1WNFKPRlVcLRy2yS0z82kjKnrinDOlbBc?=
 =?us-ascii?Q?b4Xs3gCAr1MnoE92kTdVR0SnM4RagtyKfCquJDsMFu+HE7E4jQKY4yCoWPjf?=
 =?us-ascii?Q?EXvXz0/x2xNixJB/+WE/NdhSzbCYpYoSkwigUkbc3Ti04ezsl4a4ig2J5B0d?=
 =?us-ascii?Q?FBAkqveiKDnsrtBdmOTMBaItTzokgEdaohSopdve1hHqhCekh0RQzBupwlO9?=
 =?us-ascii?Q?yD9nwQzCJzBtT+HmJFfywnJWuPGPRcmiGSxBofZmJisCw9N37stz0h7fboPi?=
 =?us-ascii?Q?fYdEOEqB9SlwkhNiWXxZq5xO0OGHAM8BQsUd/Z6L23LbRNOPKiveQzrdWWOu?=
 =?us-ascii?Q?o8Trp4LeTl4OuiVjLO/ikXapTGaknxS0I6j9kobhPNJjTga1S1x0Y//Ff72t?=
 =?us-ascii?Q?kjkIpJ/d3xRJIV0Js7PGG2wA8qQ6MMdzdxP91AtQ1Qk/XElqGmuX5s7XPfKw?=
 =?us-ascii?Q?clvkAt7Tj47D0Y2GSVH2OH+C?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3a4786-216b-4341-b370-08d94ba5d37d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 17:43:04.1753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1AoQE9gnktv0XmkWJQE5KwvwBvNW87dL8JTxLbKsFSZVpd1PyH1WxoIZwjw/6jxG
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
index 8572d943320214..7e352d68b1b01d 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -129,7 +129,12 @@ int vfio_assign_device_set(struct vfio_device *device, void *set_id)
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
@@ -143,6 +148,7 @@ int vfio_assign_device_set(struct vfio_device *device, void *set_id)
 	if (!alloc_dev_set)
 		return -ENOMEM;
 	mutex_init(&alloc_dev_set->lock);
+	INIT_LIST_HEAD(&alloc_dev_set->device_list);
 	alloc_dev_set->set_id = set_id;
 	goto again;
 }
@@ -155,6 +161,10 @@ static void vfio_release_device_set(struct vfio_device *device)
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

