Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0113D9A79
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 02:50:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356EC6EB73;
	Thu, 29 Jul 2021 00:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF6B6EB73;
 Thu, 29 Jul 2021 00:49:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNAP8z+A5YAU0L4xBazNCmhTPQEFDkaH207SbS88gregcNDTc3+nohA+DB1QW9/69gpIvenRb0QWl1Srw8/wHJ8vuQdkM3h8dvapUpS4LbzDnmswQ/A3zZs78G+SimsZubwzfwrZdBVaLSFgS57S8KxMJZPCtYGlahmJ1RQyaEyogqAftrSDdzSCs4uIa2Y667zfQwdIz1u63VH63e5ZU7UhQw81TU/Fyn6v8hL7KnBjhNw7Jeqg8BiHhv4paJToJDPhPcQehyP3wJNboIlnKowtxiHWNRAIWHRFL7yP/+NKUn6/HQNYNBbDgXLFDo3FL5ooeTQYHPMdyrldKvnxGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnKVdAMo4luuZ0vWRuSfT4gwgfX35JVY5NN0eRmXXok=;
 b=aEY2yR/QKOb3Va/Gy4dEYT9KyghwpUz21fErpXvWuh3bAdkhdnYgBHnjuZ8tIoXbiRGP/B19Avo8Fv3RDevCRrU00uoGLRBQB1VUexsWVUZws05j4z35sG5TTWVFF6i7eF4GqbRhdDIOKFka2loqNrCQlwAPlyHC49JFfKH5XbhqDIVWyWXdvJmqjqntVh/3MqcOz7D4H+hbj2QiKNNN10gUyR1VqYJWbEvr8Y/WSRucf+6ST93EFxkBmyVtCZW2Eg1SccS+d+dh6Nk49wYtvYEbjVFbEyAbPfCLRTKI151xspKMbgZI/aUtkSWf7YBbVBZSoud7H/EIDFDCIBN5cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnKVdAMo4luuZ0vWRuSfT4gwgfX35JVY5NN0eRmXXok=;
 b=IqxqYEPJY4zBa/jZiNUZarQftdsgAXQE54LGamLSBP0OJRtWzI3AbOOz1/eBrWT6wjkBR2FHxO8KRifa69Yzqsjk6K6Rb2iNSpphDocBjuXIxgLK6+C8DXypjrGNSJnqe9HcteoB4I7Cv7tWKvuesYYHjdWtKHtSs9AoIsG6FUyUJfnnBJOoxBXvUsg6w2U9roGRbmythiY1Wk2B/s/n3R//AjD10AjCaeJDHxYhcsgx1gClkI/ZdzBCdlVWAwrXbe9HI0RDZOrWSa9SfIn+iBgRc40edadRr9PTxsBWcMNFbif6n+jjE8DbfFm7hsxMRAsCcvf//M1GG6XFSwwLrQ==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5160.namprd12.prod.outlook.com (2603:10b6:208:311::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Thu, 29 Jul
 2021 00:49:31 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4373.019; Thu, 29 Jul 2021
 00:49:31 +0000
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
Subject: [PATCH v3 10/14] vfio/pci: Reorganize VFIO_DEVICE_PCI_HOT_RESET to
 use the device set
Date: Wed, 28 Jul 2021 21:49:19 -0300
Message-Id: <10-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT2PR01CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::7) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YT2PR01CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.20 via Frontend Transport; Thu, 29 Jul 2021 00:49:28 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m8uEm-009pnG-5r; Wed, 28 Jul 2021 21:49:24 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9804c77-df24-485c-7937-08d9522ab871
X-MS-TrafficTypeDiagnostic: BL1PR12MB5160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB51607A32F357D45FEB930FBDC2EB9@BL1PR12MB5160.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oBRsgGUCo9FlvgIHoj+B7eNNBz4rIyLDcwlmp5dPmjFrHQpFXB1/wGrikhBrY3/nYZTuKkVS4eW5JXVETX/5UT2RhFKlmPkypNf4BiNhl3NQ4Xk6O4N5x2TpRm1gr0akh6gq7eNvp9jZzFUuGas5XkDZQd73NZ892H/zfrJRfURqDVy8gh2XDgH3oLGONUC9H2ocaRx5p+GVGbsTuNiLpaWX3Tshi28ccwAXaPyhYLLwNlG3MCUfAuVmZjbDv9+r35CG1ivIH9mYDN6qQFZfEIL5TNOXy8bY9nONYaxLqNuve9piZMJvV75hKmzi17xGpPN4H2Sajm9ga8jsxXsDakXhUNYeqpihDpo2k9AjqHj2MNSzgXRn51neXu6MNNY6Aw2sQBURVEmMqDcCz3jAub6LN0xd1nQtEpqp7KTtUMTMdDruSJb7lOkL9Ns36lgDOqxVjge5MNFMppnq6es6WFqPgGdO42u2wsa7JkSSyxXgmAEalxnF5/Vi2W7rJprXoFL4W3xltaGHPYgNTQi+RP7iOoYXUtFfl96IF2uPmkh6wAXYratiHcR2OhuAU+iQbYpHEkc4WsAjf4nnCthD3renXln+/w79+GH7l1eBtV/XlnMXvtNqvXWY+0nsjK1W2Ela+wDmRDlBxb72/PPlmQLNALN+ftvWiBkjDmXKZ5BW7ECEngFI5gAKlBTywsZ9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(8936002)(86362001)(2906002)(6666004)(426003)(921005)(8676002)(2616005)(5660300002)(316002)(186003)(7406005)(7416002)(54906003)(110136005)(26005)(66946007)(66556008)(66476007)(36756003)(9786002)(9746002)(4326008)(83380400001)(478600001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KLQ3b0vIgEBLg5xoGscVAlK3MRCSCyGyrQ5KBTQtLXfiHfFz6vNlQPRbxM2o?=
 =?us-ascii?Q?2ydCZ6IbRoZPnSZw/qw6rChN51OWrSFPa8REsD7O+9tFbgK/VH3S5e1pJR+S?=
 =?us-ascii?Q?8c3T+q4YD4Cb6qIw9swwLRztPIszs3LuDXeFBd/ldFCvXs/C61tid7YZZZfb?=
 =?us-ascii?Q?Ke4XxhMCsrekkY3DEu1D3j9xUJjGhO5UAbAiPAhK4f5qNLssOdQc2HKSNOR5?=
 =?us-ascii?Q?zlaRKUOWPUFZcLtVbskmL5rsx/Uxy/bugLc9I2ODjWiBCnrvjkFONb0A1nSN?=
 =?us-ascii?Q?JESoKF+I9hh3EjNo8+d6OMEeYEDl0q86SaE5pSax1QWMiJPidMru+cMWQvVq?=
 =?us-ascii?Q?QtTg2SK2ifvYv684Ti1E02ZRWmxL9jiTi+V9Bh3LgHuYsZYWTSKatCw1fHy4?=
 =?us-ascii?Q?UOGh+87m0vM9QlfgOaZHWrHBhtT/Qs0usN8D/a5RcnL8VnPsIDTVEybKk9hh?=
 =?us-ascii?Q?J1PmDlUtRF6o8ZyHMku8dQBmDQ+6JdpQKrdPQkYtpcSl5CznFVWl1/6gIoq3?=
 =?us-ascii?Q?/DNGQytZvkZg6SZ/cPVeV8IhCAeBps3Kz/CyXGswR333sjmogq5IVspcjSbl?=
 =?us-ascii?Q?D+GQo4zfmUWMlKw1bGn3Cg31qz7qAEa8fXVeybqjDtiHypU2tKbWcrOlJZlq?=
 =?us-ascii?Q?nA3C4FUQSU3n8Ud2EwHA5loEj9gaI+cys4YWTCigvkvojSnXAZZoOitnLWJO?=
 =?us-ascii?Q?4KtGcPZmrwFVd2nX1JMegT/MZI+iQE4C4Gy3+VnI+/a4uu5hbIZm5ConP0BO?=
 =?us-ascii?Q?nDW5e21JWYxFr9B0Nw0xJiMqWMbtGwTRwODGcdoihpKkBCpuxggpj+lLhx2A?=
 =?us-ascii?Q?68aZZxpP8e6KU1gSy17+Wo8gFlG2UfxQLurEHNxTSRvoQTkfSn7wX4DRupqy?=
 =?us-ascii?Q?9pL0n6XJMejwM7zZ0Ez1BpubK+4sRBaaxnMfMaXxestwFMmPyxvuSFRioWN3?=
 =?us-ascii?Q?TnPV0sUjPnwZsG2lEWy7FWAYBR858GYauGAjRg5WC1UhcuVfEdPf/e/7fHqt?=
 =?us-ascii?Q?P1IzwIqqsA4BZUYnvFW7YLPxg9EGHZ2/pDdEHnBXJq0uBXlUsWA9D/9sF/ik?=
 =?us-ascii?Q?itloZilgyYiakBh5oBJA+iapUQgRY1dxNyWKd49hByGIR30XbWdAQ+hAmkW8?=
 =?us-ascii?Q?LC7U5uqBVybT7SP+q6bqcQfBhGL91R1yYJNVYzV1vdfHCindtXcDe6ocaA84?=
 =?us-ascii?Q?LT7xytxMW2BCUprnh4fvHPG/xaglRGrA8CSRjL6TqN59HH27/Pv0m2ZL7wvf?=
 =?us-ascii?Q?B7mzejjv8j8bTCsqy3uDRdGkuoAigOP4X4nA7alw4fcY8lA2eMqCvJ3/GsD6?=
 =?us-ascii?Q?4VDDspbg3lOKsnPEDcSoy5sM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9804c77-df24-485c-7937-08d9522ab871
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 00:49:29.0365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdF8VVo2lOcIMRdNPwROGCY4AaU2wqrgFDKxU4uAtXmw3BKg+kUXgiiLigUcIhB2
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

Like vfio_pci_try_bus_reset() this code wants to reset all of the devices
in the "reset group" which is the same membership as the device set.

Instead of trying to reconstruct the device set from the PCI list go
directly from the device set's device list to execute the reset.

The same basic structure as vfio_pci_try_bus_reset() is used. The
'vfio_devices' struct is replaced with the device set linked list and we
simply sweep it multiple times under the lock.

This eliminates a memory allocation and get/put traffic and another
improperly locked test of pci_dev_driver().

Reviewed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/pci/vfio_pci.c | 215 +++++++++++++++---------------------
 1 file changed, 91 insertions(+), 124 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index a1ae9a83a38621..721dcc99aaa042 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -223,9 +223,11 @@ static void vfio_pci_probe_mmaps(struct vfio_pci_device *vdev)
 	}
 }
 
+struct vfio_pci_group_info;
 static void vfio_pci_try_bus_reset(struct vfio_pci_device *vdev);
 static void vfio_pci_disable(struct vfio_pci_device *vdev);
-static int vfio_pci_try_zap_and_vma_lock_cb(struct pci_dev *pdev, void *data);
+static int vfio_hot_reset_device_set(struct vfio_pci_device *vdev,
+				     struct vfio_pci_group_info *groups);
 
 /*
  * INTx masking requires the ability to disable INTx signaling via PCI_COMMAND
@@ -645,37 +647,11 @@ static int vfio_pci_fill_devs(struct pci_dev *pdev, void *data)
 	return 0;
 }
 
-struct vfio_pci_group_entry {
-	struct vfio_group *group;
-	int id;
-};
-
 struct vfio_pci_group_info {
 	int count;
-	struct vfio_pci_group_entry *groups;
+	struct vfio_group **groups;
 };
 
-static int vfio_pci_validate_devs(struct pci_dev *pdev, void *data)
-{
-	struct vfio_pci_group_info *info = data;
-	struct iommu_group *group;
-	int id, i;
-
-	group = iommu_group_get(&pdev->dev);
-	if (!group)
-		return -EPERM;
-
-	id = iommu_group_id(group);
-
-	for (i = 0; i < info->count; i++)
-		if (info->groups[i].id == id)
-			break;
-
-	iommu_group_put(group);
-
-	return (i == info->count) ? -EINVAL : 0;
-}
-
 static bool vfio_pci_dev_below_slot(struct pci_dev *pdev, struct pci_slot *slot)
 {
 	for (; pdev; pdev = pdev->bus->self)
@@ -753,12 +729,6 @@ int vfio_pci_register_dev_region(struct vfio_pci_device *vdev,
 	return 0;
 }
 
-struct vfio_devices {
-	struct vfio_pci_device **devices;
-	int cur_index;
-	int max_index;
-};
-
 static long vfio_pci_ioctl(struct vfio_device *core_vdev,
 			   unsigned int cmd, unsigned long arg)
 {
@@ -1127,11 +1097,10 @@ static long vfio_pci_ioctl(struct vfio_device *core_vdev,
 	} else if (cmd == VFIO_DEVICE_PCI_HOT_RESET) {
 		struct vfio_pci_hot_reset hdr;
 		int32_t *group_fds;
-		struct vfio_pci_group_entry *groups;
+		struct vfio_group **groups;
 		struct vfio_pci_group_info info;
-		struct vfio_devices devs = { .cur_index = 0 };
 		bool slot = false;
-		int i, group_idx, mem_idx = 0, count = 0, ret = 0;
+		int group_idx, count = 0, ret = 0;
 
 		minsz = offsetofend(struct vfio_pci_hot_reset, count);
 
@@ -1198,9 +1167,7 @@ static long vfio_pci_ioctl(struct vfio_device *core_vdev,
 				break;
 			}
 
-			groups[group_idx].group = group;
-			groups[group_idx].id =
-					vfio_external_user_iommu_id(group);
+			groups[group_idx] = group;
 		}
 
 		kfree(group_fds);
@@ -1212,64 +1179,11 @@ static long vfio_pci_ioctl(struct vfio_device *core_vdev,
 		info.count = hdr.count;
 		info.groups = groups;
 
-		/*
-		 * Test whether all the affected devices are contained
-		 * by the set of groups provided by the user.
-		 */
-		ret = vfio_pci_for_each_slot_or_bus(vdev->pdev,
-						    vfio_pci_validate_devs,
-						    &info, slot);
-		if (ret)
-			goto hot_reset_release;
-
-		devs.max_index = count;
-		devs.devices = kcalloc(count, sizeof(struct vfio_device *),
-				       GFP_KERNEL);
-		if (!devs.devices) {
-			ret = -ENOMEM;
-			goto hot_reset_release;
-		}
-
-		/*
-		 * We need to get memory_lock for each device, but devices
-		 * can share mmap_lock, therefore we need to zap and hold
-		 * the vma_lock for each device, and only then get each
-		 * memory_lock.
-		 */
-		ret = vfio_pci_for_each_slot_or_bus(vdev->pdev,
-					    vfio_pci_try_zap_and_vma_lock_cb,
-					    &devs, slot);
-		if (ret)
-			goto hot_reset_release;
-
-		for (; mem_idx < devs.cur_index; mem_idx++) {
-			struct vfio_pci_device *tmp = devs.devices[mem_idx];
-
-			ret = down_write_trylock(&tmp->memory_lock);
-			if (!ret) {
-				ret = -EBUSY;
-				goto hot_reset_release;
-			}
-			mutex_unlock(&tmp->vma_lock);
-		}
-
-		/* User has access, do the reset */
-		ret = pci_reset_bus(vdev->pdev);
+		ret = vfio_hot_reset_device_set(vdev, &info);
 
 hot_reset_release:
-		for (i = 0; i < devs.cur_index; i++) {
-			struct vfio_pci_device *tmp = devs.devices[i];
-
-			if (i < mem_idx)
-				up_write(&tmp->memory_lock);
-			else
-				mutex_unlock(&tmp->vma_lock);
-			vfio_device_put(&tmp->vdev);
-		}
-		kfree(devs.devices);
-
 		for (group_idx--; group_idx >= 0; group_idx--)
-			vfio_group_put_external_user(groups[group_idx].group);
+			vfio_group_put_external_user(groups[group_idx]);
 
 		kfree(groups);
 		return ret;
@@ -2148,37 +2062,15 @@ static struct pci_driver vfio_pci_driver = {
 	.err_handler		= &vfio_err_handlers,
 };
 
-static int vfio_pci_try_zap_and_vma_lock_cb(struct pci_dev *pdev, void *data)
+static bool vfio_dev_in_groups(struct vfio_pci_device *vdev,
+			       struct vfio_pci_group_info *groups)
 {
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
+	unsigned int i;
 
-	/*
-	 * Locking multiple devices is prone to deadlock, runaway and
-	 * unwind if we hit contention.
-	 */
-	if (!vfio_pci_zap_and_vma_lock(vdev, true)) {
-		vfio_device_put(device);
-		return -EBUSY;
-	}
-
-	devs->devices[devs->cur_index++] = vdev;
-	return 0;
+	for (i = 0; i < groups->count; i++)
+		if (groups->groups[i] == vdev->vdev.group)
+			return true;
+	return false;
 }
 
 static int vfio_pci_is_device_in_set(struct pci_dev *pdev, void *data)
@@ -2194,6 +2086,81 @@ static int vfio_pci_is_device_in_set(struct pci_dev *pdev, void *data)
 	return -EBUSY;
 }
 
+/*
+ * We need to get memory_lock for each device, but devices can share mmap_lock,
+ * therefore we need to zap and hold the vma_lock for each device, and only then
+ * get each memory_lock.
+ */
+static int vfio_hot_reset_device_set(struct vfio_pci_device *vdev,
+				     struct vfio_pci_group_info *groups)
+{
+	struct vfio_device_set *dev_set = vdev->vdev.dev_set;
+	struct vfio_pci_device *cur_mem;
+	struct vfio_pci_device *cur_vma;
+	struct vfio_pci_device *cur;
+	bool is_mem = true;
+	int ret;
+
+	mutex_lock(&dev_set->lock);
+	cur_mem = list_first_entry(&dev_set->device_list,
+				   struct vfio_pci_device, vdev.dev_set_list);
+
+	/* All devices in the group to be reset need VFIO devices */
+	if (vfio_pci_for_each_slot_or_bus(
+		    vdev->pdev, vfio_pci_is_device_in_set, dev_set,
+		    !pci_probe_reset_slot(vdev->pdev->slot))) {
+		ret = -EINVAL;
+		goto err_unlock;
+	}
+
+	list_for_each_entry(cur_vma, &dev_set->device_list, vdev.dev_set_list) {
+		/*
+		 * Test whether all the affected devices are contained by the
+		 * set of groups provided by the user.
+		 */
+		if (!vfio_dev_in_groups(cur_vma, groups)) {
+			ret = -EINVAL;
+			goto err_undo;
+		}
+
+		/*
+		 * Locking multiple devices is prone to deadlock, runaway and
+		 * unwind if we hit contention.
+		 */
+		if (!vfio_pci_zap_and_vma_lock(cur_vma, true)) {
+			ret = -EBUSY;
+			goto err_undo;
+		}
+	}
+	cur_vma = NULL;
+
+	list_for_each_entry(cur_mem, &dev_set->device_list, vdev.dev_set_list) {
+		if (!down_write_trylock(&cur_mem->memory_lock)) {
+			ret = -EBUSY;
+			goto err_undo;
+		}
+		mutex_unlock(&cur_mem->vma_lock);
+	}
+	cur_mem = NULL;
+
+	ret = pci_reset_bus(vdev->pdev);
+
+err_undo:
+	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
+		if (cur == cur_mem)
+			is_mem = false;
+		if (cur == cur_vma)
+			break;
+		if (is_mem)
+			up_write(&cur->memory_lock);
+		else
+			mutex_unlock(&cur->vma_lock);
+	}
+err_unlock:
+	mutex_unlock(&dev_set->lock);
+	return ret;
+}
+
 /*
  * vfio-core considers a group to be viable and will create a vfio_device even
  * if some devices are bound to drivers like pci-stub or pcieport.  Here we
-- 
2.32.0

