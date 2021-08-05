Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0C93E1414
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 13:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD2A6E9E6;
	Thu,  5 Aug 2021 11:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7724B6E9E5;
 Thu,  5 Aug 2021 11:47:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJXfCZUzaK3XQeOg91MIXUSuz10Dems7uRrUP3MNAdXaArhAGfiv1aWVVNGvE5RGTbrW9i/Tc3sys+3ZH9q5ZtQ9PnqiDoCMltn8pCrPNXAl9sg0uhX0mj4miOkO4RaIAJlg95Yd0IDXki0+Z8vgEOSgatRmbhw1rk3O4psnCbkvEZRDym6fzrlwl5JrEfOZ/6GbjYJL4dvzdZ11/0u9irf+1B3xCiWE3r5282Phg/kDsnRba8uMBkJFWkxj2TwNPCNzu8fWKHmvOLcoxGevrn4IUiUU4s0ib8o6icdQI5Y2YDMIypfJLNGL8Wi8OPuFFK7zr3fc0+RsqvOmv9k27g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZUNqPZLRV11X0bz3MgrQpE1I7VjISWzljAOTtg7+xY=;
 b=iOfad2sD0b/pA/Bv5Y3jlxeAHz131FEQv53HN1rQEdearZsQHe9jeUCxSxC0VBqUCP2zbwgVEJGOcLGM15OqRZ0e1RjSLBpELckORZrLSlDyqi2AjxKDiie59K221Z1UPQtwXtWXrXt2d/1wI28XtvL36kMu04Yp4uSNfpPKhBYiK7pTDeOpEDAz+cboDDO0qhNjI2aqa/ka/vb7ZkT6GR9LqnqSDweMh2pvyY+NNuVeCpl4WUQDMtL5DYB4VPGT74KWtQrVqXNoG9dtlff7YPKBrenT1zLKsaotUzMU05TBiA8Ei2XOv5pXz5FUdVPYKZLDFdNG56H327H3bsNvsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZUNqPZLRV11X0bz3MgrQpE1I7VjISWzljAOTtg7+xY=;
 b=pN+h4V8UQvyDYtVbDSlfNFsoFbjLQg46WaBmwPJjqJsYh0x1EzzyEqx983VTnVHABqBJMUsTWr/tAUq64Nt8ooyfkp9v2nC66lopdN3Ll/wVmQWmqQxz4/+OCwFUhrY8Et3Lu5e4GAWOvlle0MhvAPp36duFPJVZ8oj0Mwj12PSdbpJbahKWMzNuFX6sKJPZIBy6m+lrEqixnYYoX3P9iJmYGMqYQn8HA1tbNkIbKlAbjGEYjZ7xuxPF5x3HTIhWz3SAAEdua3qW/wuSNEM3KtJCgaFEOvfXojY5w23nS3AmaoHzBzrabi2KUNUKUZz8MPXqtmrn6wH1eCvWQvENkQ==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5141.namprd12.prod.outlook.com (2603:10b6:208:309::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 11:47:02 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%7]) with mapi id 15.20.4394.018; Thu, 5 Aug 2021
 11:47:02 +0000
Date: Thu, 5 Aug 2021 08:47:01 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, Diana Craciun <diana.craciun@oss.nxp.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 kvm@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhi Wang <zhi.a.wang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
 Max Gurtovoy <mgurtovoy@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH v3 09/14] vfio/pci: Change vfio_pci_try_bus_reset() to
 use the dev_set
Message-ID: <20210805114701.GC1672295@nvidia.com>
References: <0-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
 <9-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
 <20210803103406.5e1be269.alex.williamson@redhat.com>
 <20210803164152.GC1721383@nvidia.com>
 <20210803105225.2ee7dac2.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803105225.2ee7dac2.alex.williamson@redhat.com>
X-ClientProxiedBy: CH0PR03CA0290.namprd03.prod.outlook.com
 (2603:10b6:610:e6::25) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 CH0PR03CA0290.namprd03.prod.outlook.com (2603:10b6:610:e6::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 11:47:02 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mBbq1-00DFYB-2f; Thu, 05 Aug 2021 08:47:01 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7b4c886-ecac-44d7-a632-08d95806bd87
X-MS-TrafficTypeDiagnostic: BL1PR12MB5141:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB51414849F60F3F95C01FF497C2F29@BL1PR12MB5141.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: apF8TpEiGAYaNig6vVvEAOvUPtl4ou8aOb9YMW9YfyjRD0wwKHOrIc2g7tuyypChuD2z8JEMKNRoKxL+lT1+UsHT2Jaqys/Hz09b8sI4K9rj1N4tWAr3agcfr+fncjP9Vx+WXla/wPCfBeHb7hr1gmUF49ZeySwFATzFhWLKV6ICxG4LMClfrBQIcn1N/m08yd1NCa6sgKaOPqoiAe5gNi7bEQrJkodTN6qIyWzh2SQMJzpAqg3T0WVnW/J7wuusMSoBL0Dxa3DTg7J3RatKIISrx61XJSlO1WKCSUJJQ4RwDJ36V8rC2cDhGCA4Q1t6CcRiGq7/9X5DKYiyoRV5AJ/wH2Cfk4WcA09G8XnZg4q0ITmDcowUB8sAc3deiFZZ3AUNPCdtmrXV2X/EVEQbS1EIrz/GMO80dTTTUIETJOq2epuKLXbsuNkJG+ye2b1fSba7xliGnphFROeIamuvcMQqQahi24eJMBux52hOb2EYLZX0Rsufkxr7Qa16sdyR1NHL5DIsSe4NUgld7bHWTBgzD2e0WKIPKRKslh2ORb+SanjsAHTgRwxQuq3BckvJP3Uyr9UIQ8BK0L1CFxK8z8bUnTcfy/zm2PX53LLTg6qL6X+8kDXs68fVUjhXBU8+X6RvIn/AOUE31H9M6OeB3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(38100700002)(1076003)(316002)(426003)(7416002)(7406005)(36756003)(83380400001)(54906003)(6916009)(8936002)(508600001)(5660300002)(8676002)(2616005)(33656002)(9786002)(66476007)(4326008)(66556008)(9746002)(26005)(86362001)(186003)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2o3G1pmJE+Y3wikC1sjqqRROIecgAfMPpmQhFaylFYw2rIoRIca23ZntBIHU?=
 =?us-ascii?Q?ho56Aiq37IOdE3TNwqrexSmxJzu8rxWz0Lul89S0m0w+8Z5EVdajGo5sAXxC?=
 =?us-ascii?Q?E2LQZ4a3nXG+BMJEh7KGblHSKn4d5lQTSyVvF22+muW94FD1MOuMV8I85CAH?=
 =?us-ascii?Q?4adLvgPdDvAEBvSnvVEev/4zuEI1nxmxgv6kZ3y3go03yjs431w0yEk1YDdY?=
 =?us-ascii?Q?K5zd2KIMCD/inBiucWLA4HzHAqJ+OlIOdVQRoVy1l5fE3VDKYgAfxlgYbSqP?=
 =?us-ascii?Q?8hida6sbucH//SRRVtg9Z7qomHVc0gLyvRe7Ez19oSY9pWx297hhaM+3wQch?=
 =?us-ascii?Q?Vnd5h1fduQHifR+w+jHTQWUW05uO/nVOkue89kMkuI6N9C3TC8UtH0joXZGO?=
 =?us-ascii?Q?uCp81tTEtUVAiktkWHgQFJ0jKRT4Fdw5zYsU5ZZwYL4vLsucifuwhh2TT55q?=
 =?us-ascii?Q?teFDDP6pUL9wIdBetITfmAzFIZa7kktmJjdk0JYn5tF4EtZW8Haf0ao3dq+w?=
 =?us-ascii?Q?6EAA81VhdVP+RGpEFphogxj9tPCKgIN0mT2+cMVlXsslL3HwgwBLdIKm5Nr1?=
 =?us-ascii?Q?B978jTIEURVGsnmoLaInxR6alYY7WcS5m0tmEhMqnY/06qfoNNAYFDu4yxT0?=
 =?us-ascii?Q?v5qFeNRT5eNzY8RDZ8Qk51fL3R1bhY0jlQ1hbEmw3a4zi9eT9zFsiI5ksHWX?=
 =?us-ascii?Q?bp8OeWPPK5Vx0Am8Zs/gIPOpKpqRg6re9ocQ6gSxmPJ6RAidh+Ofs6E3wykY?=
 =?us-ascii?Q?VcQQ6B/y73L/+sVVxex7kTmupOcUMYjP+nLOQi+Sqsbt21DwvaRz1iazxYmi?=
 =?us-ascii?Q?JV6RRVeq04UZFu0GIUF9GC9QNxOQ6h2PG3CkIw/NKctxZMePiEpVTN9xfry7?=
 =?us-ascii?Q?ozxI2BZdYSuDF3LnLsiEY7SXbdIS3XbABWlFYM+n7NDYIiR906HD5RQGUjdR?=
 =?us-ascii?Q?Ae9wgoB7N9DzXFfPYqCB02BRlJ7pwxD/8kAzXVx6gbTEVncebs6H16k/vJLK?=
 =?us-ascii?Q?POd3XjkWHB7J56Eed1IkOSZCgHkNFDlQ1Srpx65Flge6V1DBXpP7WbRrzjQd?=
 =?us-ascii?Q?V2oOPLWDFHgEOnS+XWmiuwmj4bwYM6LtBPMNVM/zPAhYq4D4TM33sqG1QHTG?=
 =?us-ascii?Q?U5NCxqt6yuVi5Gv2YSwUhExFSG1ToBN3Pk8x1x3nI4Zk+Q66cmWr9mowAHs6?=
 =?us-ascii?Q?ulLa2IgCobtqqchhOln5oCROOoc9wnhkff5W6FOPdmsF82FMXLxWX6iDPVE8?=
 =?us-ascii?Q?yvZMJaD6bcG3lHmYLbU85+G4YK4PM5ZoXlZoGDzwm7r3mEJdxU4BqxgSJEC+?=
 =?us-ascii?Q?XUbM8ovQv3t3z5JKnUua+H4v?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b4c886-ecac-44d7-a632-08d95806bd87
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 11:47:02.6310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hrljNrt+xHpvJD3qcLGfiLeBWpw+MI5O/P+mjXsc+Y6nOIMUjhDHwQXmLmgWxMGX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5141
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

On Tue, Aug 03, 2021 at 10:52:25AM -0600, Alex Williamson wrote:
> On Tue, 3 Aug 2021 13:41:52 -0300
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> > On Tue, Aug 03, 2021 at 10:34:06AM -0600, Alex Williamson wrote:
> > > I think the vfio_pci_find_reset_target() function needs to be re-worked
> > > to just tell us true/false that it's ok to reset the provided device,
> > > not to anoint an arbitrary target device.  Thanks,  
> > 
> > Yes, though this logic is confusing, why do we need to check if any
> > device needs a reset at this point? If we are being asked to reset
> > vdev shouldn't vdev needs_reset?
> > 
> > Or is the function more of a 'synchronize pending reset' kind of
> > thing?
> 
> Yes, the latter.  For instance think about a multi-function PCI device
> such as a GPU.  The functions have dramatically different capabilities,
> some might have function level reset abilities and others not.  We want
> to be able to trigger a bus reset as the last device of the set is
> released, no matter the order they're released and no matter the
> capabilities of the device we're currently processing.  Thanks,

I worked on this for awhile, I think this is much clearer about what
this algorithm is trying to do:

diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index 5d6db93d6c680f..e418bcbb68facc 100644
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
@@ -2208,79 +2179,86 @@ static int vfio_pci_try_zap_and_vma_lock_cb(struct pci_dev *pdev, void *data)
 	return 0;
 }
 
+static int vfio_pci_is_device_in_set(struct pci_dev *pdev, void *data)
+{
+	struct vfio_device_set *dev_set = data;
+	struct vfio_device *cur;
+
+	lockdep_assert_held(&dev_set->lock);
+
+	list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
+		if (cur->dev == &pdev->dev)
+			return 0;
+	return -EBUSY;
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
 /*
- * If a bus or slot reset is available for the provided device and:
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
+	lockdep_assert_held(&dev_set->lock);
 
-	if (vfio_pci_for_each_slot_or_bus(vdev->pdev, vfio_pci_count_devs,
-					  &i, slot) || !i)
-		return;
+	/*
+	 * By definition all PCI devices in the dev_set share the same PCI
+	 * reset, so any pci_dev will have the same outcomes for
+	 * pci_probe_reset_*() and pci_reset_bus().
+	 */
+	pdev = list_first_entry(&dev_set->device_list, struct vfio_pci_device,
+				vdev.dev_set_list)->pdev;
 
-	devs.max_index = i;
-	devs.devices = kcalloc(i, sizeof(struct vfio_device *), GFP_KERNEL);
-	if (!devs.devices)
-		return;
+	/* Reset of the dev_set is possible */
+	if (pci_probe_reset_slot(pdev->slot) && pci_probe_reset_bus(pdev->bus))
+		return false;
 
-	if (vfio_pci_for_each_slot_or_bus(vdev->pdev,
-					  vfio_pci_get_unused_devs,
-					  &devs, slot))
-		goto put_devs;
+	if (!vfio_pci_dev_set_needs_reset(dev_set))
+		return false;
 
-	/* Does at least one need a reset? */
-	for (i = 0; i < devs.cur_index; i++) {
-		tmp = devs.devices[i];
-		if (tmp->needs_reset) {
-			ret = pci_reset_bus(vdev->pdev);
-			break;
-		}
+	/*
+	 * vfio-core considers a group to be viable and will create a
+	 * vfio_device even if some devices are bound to drivers like pci-stub
+	 * or pcieport. Here we require all PCI devices to be inside our dev_set
+	 * since that ensures they stay put and that every driver controlling
+	 * the device can co-ordinate with the device reset.
+	 */
+	if (vfio_pci_for_each_slot_or_bus(pdev, vfio_pci_is_device_in_set,
+					  dev_set,
+					  !pci_probe_reset_slot(pdev->slot)))
+		return false;
+
+	ret = pci_reset_bus(pdev);
+	if (ret)
+		return false;
+
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
