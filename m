Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5A23D9A69
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 02:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60D96E8F1;
	Thu, 29 Jul 2021 00:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B743B6E05A;
 Thu, 29 Jul 2021 00:49:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbkNp+jZyYUZPu7Uq/uz4uhTQfQ2vLwqgJiQ//7FBzg2BgzYMGsbQFyheVILYCjECR1yGgOwdn4tju/TwaTzHqCplHe2lWJKr5za27rX0FQtWlg48ejiy7BVRniJ+1nwEfdQyoHwXH/3oYulYxZJA2TZA2fwx/IOxfwRviSmx1NIyyGyQeajYNEW4oNmV4kpMYSSqHZeREWc9THh3x8e5lJGRIRMkT1x3Xt4l7qrlaXp3C7F/hP6ljfXHgHTvwYS1HbxpM4liPHOUQY2N8449PoT4ayOECV2xcqmJ4R/7pt8U5dFDMkePe1sIooY6tqIQ9HmrCWtmk/CACFfhRON/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qw8nAUP0+Ikl43727+nr4qkb3CkEauo5R6GR9ALm5yo=;
 b=cXXxBt5Xsa7ofCcWrRX3B0Z+iu0bLufaDhPx9cJlOTwVWZw9mGgNSrU/5d1oAjG8EERx8Wo7FuIe5jT816eMCg6oJ5XT5HfEJPBnJwwMrD/nVHYU+H5NgXYryUTmd0cDnUwadLNBbwyxlY9ZtWfpf6zwY0f3pkEYafhnpOG9MsPreCid+63obOAb3asgIDPo3r6PS3vbJIZOCvfzQDixwogz8UEFEKrPNnzksZKa6D9nk8wIwTnR+bVrNXXNJNQ9XCJgVrtVMOiENH9n+OSNp/vwm9LnU0ekXo62KADfNqeM6+/4ySy9//+V/Wwi7Zoun3HyHZOsaZkMRMWnPXj2mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qw8nAUP0+Ikl43727+nr4qkb3CkEauo5R6GR9ALm5yo=;
 b=UrO9BlXqxq2rRxp5ny7d/AKPcFQuaq/3CVsNkslp1o9zFSw6p9u7FN9jjQlBQ4A3uBFcdTZ9B28114EtbY9i//sjHoPPn6f9NgK960A2zzAvZZS/5ylGRFd2/lQIif1d1C6nw5SnPYZ06Q36whXQhsN90w3zyZ509HOyyXFn5biRopdFt4K7rREnly6rF+KxdILi4gsjY6XHFl/r5u4wdskdPq+1kX0OQHP9t+XLvDsvXX8o2JfyqbV5+yZl0FXhdxYbmO9X1IrSbfXo98mHrNVE/5B4neQkShXguNFbmvP0qyd9GpftNV/EADU2m9KpgKu3BebfI7BCMmnvAcWsBQ==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5160.namprd12.prod.outlook.com (2603:10b6:208:311::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Thu, 29 Jul
 2021 00:49:26 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4373.019; Thu, 29 Jul 2021
 00:49:26 +0000
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
Subject: [PATCH v3 08/14] vfio/pci: Move to the device set infrastructure
Date: Wed, 28 Jul 2021 21:49:17 -0300
Message-Id: <8-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YTBPR01CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::35) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YTBPR01CA0022.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Thu, 29 Jul 2021 00:49:25 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m8uEm-009pn9-3d; Wed, 28 Jul 2021 21:49:24 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a080787-6755-42dc-e3aa-08d9522ab664
X-MS-TrafficTypeDiagnostic: BL1PR12MB5160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5160197D683C17D77559902CC2EB9@BL1PR12MB5160.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ay7e1fBiO9EB8V3wMjv334hWNnqKj1Qee5FYyP6n8yihiINwdu9VyK1Pd6vafopsQsbk+Epd7lueUSQy3qnoT6x5XOF+9L7zRxk3JkKmvOGrwWp5p2Cr+Ikd2sgfC9ZKHjuRERHEjjICuIN1ETouiSztu5jvHlsgo5Gg08rPUAxu6GA5GRvAmvy0Oh2wuxKKWwvvZtUnXimOlC/LJxDG67kd29fZkj2E6UrzwCSj64GNKwozPwrYrQsGKlOWpbnHJ5g6lo1Mn7w2RiVG1Jm41g7I1WQoQWhkkOY5BAPQvetykyXgmqyKsfcwj7v6gIO97Fm41YI6BqNH0EGlArj4Kqx5enyqIo4S/e/Oey4spfNB59b0x+GIJWdLHMmYEB/YAkTdep7i8pgGAS7BYwwQlRdg9AqNGiJ9zya5soidm6cQ0Lugp5Jpgv4/qVbqO3GwPleONwjJIdiTQWj4C18oTh7VfgzqIoLknAwM7DjNJ0JGpxcPhqCSC3oW6Lr9s+62hN0aVHbLtPZgGDxwRGzBwyUfhajhyrJGK8k4Sbl5tCJmf8FkCs7/tnowu8Et/xRnee4QFOsy9LmukiCQYyARafPPZPbp3xWMwLHemLUYuYkYC4PoMRTzQP88eS6kNalLFAMBC6y3SiyL+ba2QlxkMd9ChsxVAs4I+m26+2BjANz9olmW0xWK3HLDQWsIkKmKf7qf6c6G1THXie3+NJ8esg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(8936002)(86362001)(2906002)(6666004)(426003)(921005)(8676002)(2616005)(5660300002)(316002)(186003)(7406005)(7416002)(54906003)(110136005)(26005)(66946007)(66556008)(66476007)(36756003)(9786002)(9746002)(4326008)(83380400001)(478600001)(38100700002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gHo2h/eI1nmNL1a/4TY38JIFyTB8ZokJm8zSP8e9hIbOk8QTogt0tBVGYV9J?=
 =?us-ascii?Q?lMUKfyJBOfDYKpwroa9qNj+dHPxej24ExxtsuPGpjYT9kt2A1Snkk6eO/yh7?=
 =?us-ascii?Q?zU9EBydFffYuRJAXf5uh70+3b2BpajxUj31vu+Ex54NqNs/f4I0k6GJWZfAE?=
 =?us-ascii?Q?L4VtMcuRrfGUgM1sibueOKpTRsSwRw8XxxZGCeowuDEEencpb4Tmzl+30b8H?=
 =?us-ascii?Q?yJ/vp/Ji2brnhFH0GtDt6CaMP9pozEXuw3oK+U/kTQrdUId9F5U/3YZ4OBhR?=
 =?us-ascii?Q?LRgmLCSMREiCxPDEuozvjKSEEvmifcqtC2BoUUHSbsSA0WmSO4rOzRb+E7JJ?=
 =?us-ascii?Q?687LlKDYOeTVji28qhrUg7iepnkgDGHL2qPGtU+MYTjYtJ0kqHAlXgpUvbjI?=
 =?us-ascii?Q?JFDPh/gEjIorAOnQWv1StMVqGiZfCMMpGAlTBkCZG92XE/1mZtQPEIGptXT/?=
 =?us-ascii?Q?o/5ANkg96X2cZQsS5e9bNMT6IqNDVzSJub8MdAZDMdm7GYRzDbjsN55WW5tw?=
 =?us-ascii?Q?YWviCSYY0YBpMQgcu0j+i07K20XnL/orTOfzFTgUO1VjEZPb6HYEVp9nBwO9?=
 =?us-ascii?Q?ah5JTukgVEmM7J9GTY/caxhOeV+khPGuc1nSRWgcCAf1cGsg6SnI7s+cKX2F?=
 =?us-ascii?Q?S7HU1fKborSodj60qdtR/K040BBRgXrOkUXaprm3Z4GrvvOjXind4SvQ1/00?=
 =?us-ascii?Q?ZFLXs4oO92c9X5L5sx2qfAwasR3285iKoZAkKvtlE9dZJQdplBca7CD/2Xt1?=
 =?us-ascii?Q?0CyyFopLqeL+A/ugzoiuc/Y+vRHv9zJlSk0jFkDvTTD2He0AVr6cYGvZemPQ?=
 =?us-ascii?Q?dwEULjL38RcDWmO0O8pjdmQ9mxu1LS7OwLYtlrMFSBGc4XSVsyKRSJUbMORS?=
 =?us-ascii?Q?Y2JHvYNfKiQHSeerIv0HzcqdfF2d8he5Pnt39WEtk88ucXLfLShhJWZ4EDol?=
 =?us-ascii?Q?KpRHmcOGUYX5SfRZRnWSr1W3dJWriBgBW+sMzW5Mjf6H4Ne3QXoSZ4aVj+LE?=
 =?us-ascii?Q?RLvUpwDaWOLIcCuwoYkJd3Q6/P0ZUp/Sl3uZvZBkgB8+CaMCe9ANs7U2Hg5w?=
 =?us-ascii?Q?NTtmiZnVkUCt0YVjJaDQsRh7N0twcNZa4AgeUqAY7WSlwV9J0mEO5YNuyJ9g?=
 =?us-ascii?Q?Xi+LLlsXQNm+pfL3fSNy/A1IEF+q3kl7qtijxO5+Dg0ZtYjQZ4M2IDoJdpCy?=
 =?us-ascii?Q?BjI0LY721dOeT8oz0DwfVk489l/cx0WTuUloXjl9DlJxZOUcJYN72TtNpJ5j?=
 =?us-ascii?Q?6s8JOJ5DId3sk1YMFgqv4tEsn5MmksI5uZdEwFYkarqrxxEzVu7xRfd7KSHX?=
 =?us-ascii?Q?IcQRs3hUDn62jY+S0O0dKUJ1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a080787-6755-42dc-e3aa-08d9522ab664
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 00:49:25.8057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7UoJMLqEriE+b54CVywNt4zYFNjmn3NpcFvB7nfiqQL49oP4o6gwWe1rsrJgGVA
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

