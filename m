Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CE33C9527
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 02:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77CE06E514;
	Thu, 15 Jul 2021 00:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6436E51D;
 Thu, 15 Jul 2021 00:20:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHFJXDf4amty2+zOEmTeUqg0kawvWU/a/8bAuPzD4B1twqJrYYQbHsDkUfTiDp1RItSRTDFbxNnTjIUIEPi2QsOUTKVoCHWjuFBFQVN7ruBWyxrfbOXqRTPfsHTF3kbZQ5x/P5KAbSbUC/HSMDnCOcey2IYtm8ogkBA9a3J/f710mWDwovwz6m2RNtbkpoeqrJxf2TjunLHRrnCetXq9KuPxVMrq21AlqGZXqxaEZj+YFZQ3cphbiJFFiu4PrgfwFL2B7qjY0FVVyKufjyATWEpxWP4Pt8smpX5yCn4AHvMhRURfjr6OG+7moSk/f8JLnJpnlWsgofNLQbEetZcEJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VGW7wr/BkFmokiMOi9zUR4JROkKeHfKGvBjk3PptLg=;
 b=X5xX80oduBQxb4s7Y5MbEdnwQk3dnYQPnpxMG52OAdBSYqhaZFgAqwdXQiZ3d8AERxlV3SMBjUu7YCo4N5kWXEAqVA3GsEBZOSnxaJTGgMLBsoAiKJQ1N9iXPLSQKqbppgenGGNbfnquWb3F8h5HZ8fnyE6O4HsH/1VNeUBq8w85DJZIONK4WpFwL1wVA0XtsaYnmRWreiWrZTJ0JQ60kW0fEu+58E+A5zyE8yIdJfB7kY9+qTJs4e/J9cNY+CYGtlay/CWMp2V/y44RTrgDueRqu3RzKTgXM7eT1tO+xm3+2nxS28kIX4uhAiRUfaXW+kwEa7+EY6d6Se+qL21J5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VGW7wr/BkFmokiMOi9zUR4JROkKeHfKGvBjk3PptLg=;
 b=BsGB1r1xsQNMiGEmXm/PxNA9Ni6Eo3sSpY97/I1kKtkFWKqTzXdb+yWFIaq1w18NuGvKjGNflaLFSNE6l1H7i/yI4R5oepQh2+XrrTZXw7nn4X6da97M9GmyzXYuZREacsneJU8jwpAnDhSCdXc59DbMOi3O3soP/VgmR0D/YOUkXPW7URs2nB8LCd09kYi+UreSEsUJF7yAySvvYPXFxMoe6lkO1euozw7jc97KgxVlvE/g8gQZzV9SL1MoA85LlqgfETkoRKz2XxUu3ArqURd5qkOoJH5yMvrHHka5J5qng1E4/79lTvrDCG6+dIHD2qgRDPg5le9PpWv/UfWfRw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5555.namprd12.prod.outlook.com (2603:10b6:208:1c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Thu, 15 Jul
 2021 00:20:51 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 00:20:51 +0000
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
Subject: [PATCH 09/13] vfio/pci: Reorganize VFIO_DEVICE_PCI_HOT_RESET to use
 the device set
Date: Wed, 14 Jul 2021 21:20:38 -0300
Message-Id: <9-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:610:b0::16) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 CH0PR03CA0011.namprd03.prod.outlook.com (2603:10b6:610:b0::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 00:20:46 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m3p7K-002Uxd-Q9; Wed, 14 Jul 2021 21:20:42 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 017de31f-b664-4048-6824-08d94726640d
X-MS-TrafficTypeDiagnostic: BL0PR12MB5555:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB5555ED54D97F0B7A728953B3C2129@BL0PR12MB5555.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +RYE+64cSU46/9muguWmX7fNBoawaDOhh8YOmI3lets8U6X3d0Kcs0v3BZ0w/cwdufaiOVnK3ThxCsatGP71a4URImuCA7hwSeygJe6vWLZBB6mhvvbQAaTRaYe643jjQrfx/tMzdZ6ybZ6LTKV15BW38aEK9TmxEpwpJlvwjVyYJelUAjTHhgevUx1MEaackXhoDUccRAivN/GuZ3PT50EFXHTMiv9C/fKKcNr1RsNSeItM1qu9IcEyKbUzv5R1XoOP6O+4vhXPTCr0buBImjz44Uoj5E3cZzQbnXTe2nVb0keOs2lJIMAQg3hkBYrgittUt296V4qV/3ao+/eYYetFfnhP2polaO3BZesfBi18T/vb8Pjpj7cHvtQ8JdO1ijSOJQ/ipCOgpL8/9nfGxF/KN76F+X4g/9OfFO/qX3+iCBqvwp+kDTNU1p1Nw+5cButXhVAj7VLn4WWgre9kGWSvMGL5lPJGEZM3eH6P0m5nuwu0ZzU7Ml8/qVsm0/snvxOJ+uchscMh14jTG1sZOb5gZgbFGSrPKlMcOkaEQMdMQw6g1oYdhJrBl6BpQ1bxMV1VaAY6seip4Swf77HnnnFWSsl9qiBoiug1oBf96QuzQXAoXcTmK+tLa2faCagBBqNSic43vBIo9hJERoN6PrMuZAbfzy/iSOIoibGz2KPDamrc6GkZAWOKmt+sw6cHbGQWUHvKa0zhRi25DjwZsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(83380400001)(2616005)(426003)(316002)(107886003)(2906002)(478600001)(4326008)(7416002)(7406005)(38100700002)(36756003)(5660300002)(66556008)(66476007)(66946007)(921005)(9746002)(26005)(8936002)(110136005)(54906003)(8676002)(9786002)(86362001)(6666004)(186003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tdMlDvy83TROOkXgfgz1xV+tIK8S2qzW1PTvwBHydaBhyMVOeXxqLOkFPUT9?=
 =?us-ascii?Q?d+i3r5vVvRX0d8Sb4UOPt9lsq8Y4XV9/exSkvih9K7/c+W94H/xao1oqKXui?=
 =?us-ascii?Q?ed0Fxy17uowS9keWgwGgZLLW+Acpt+QqRjwWrQFgyJ+FUN9DjJATkkYtlncj?=
 =?us-ascii?Q?jlJHbg5Ccl7mc23hpzFQA+tvepI+0kvsvNRQMh5hap7SQphHrFOTFwP+uOHw?=
 =?us-ascii?Q?O8CRVOVnHd5b08rzhySB/3lTHT4uynlAiO5d3q1GNk0NDl3fOpcN6uz0iQhv?=
 =?us-ascii?Q?xlwwyVJDCNp2FB3aYEySseHD7hYtnX2htrp+A5YHmh19+fAB42UjTCTGc74c?=
 =?us-ascii?Q?gXF+61325wwyxOZiwq3Bhryjfpp6yGzagsVphVlYdkcXxe1A9ApFscFdchWA?=
 =?us-ascii?Q?CJFKwmF+7xtNSjuxpGzDbIHL9ClHJmgjpZwR9sQim7fg1l6JmLutnD6awkiU?=
 =?us-ascii?Q?MS3IWoEBvPHeqNgix8qEg52t2WzBctT3OdV3gLjCtz8Jv1roLWbnhS57s4+X?=
 =?us-ascii?Q?TWqIxHydExG0LciwELLG45lRhZgl4yOMA4jGCFlSQCoNuTl5rsUGg31OoCSC?=
 =?us-ascii?Q?CWiB06DcwFnDyHrrYKDL9yPrqDxImAs5KovWe+fHZm6Aprt/Rh34Y5zjd2DE?=
 =?us-ascii?Q?rclMHCNcx/1bOFAMFOXzY6MPcXpe14qGbEYXzoj5+sWPMLL3M0KM0vaia8s+?=
 =?us-ascii?Q?LK2k7ElvBnaPOjgD1klOs0QL9DaF2YlAAGGe5oTdEtK4cARif5oejopBLM8u?=
 =?us-ascii?Q?cVu3kgxr8Wvb0QxHlVw/6pLqxHZ5Pt+eqgwSxZhFIkhKwN10CHB3oy1MJwtL?=
 =?us-ascii?Q?9IUjYyn3rsPdouoGCcvo/lXK481Kh6tumhiKXSUIVFyhOJfVTkcLbVysrKK7?=
 =?us-ascii?Q?mhVVAv9bZPD25n32/jbMoAuMmjM0pC3u3HTdGwiOrEbH93q4/yI9DxKqQ1o/?=
 =?us-ascii?Q?ekccDHfVirGC67irUSL72PAIkv/BUqeYuSnKhkY7YmqGMOKVAI1ZRLh7/ZoH?=
 =?us-ascii?Q?X9cYOTpVjM/ARlP4ar/AIkx/xOCaUHfNKYnbAPg5Q61FOZVHivW4d0sBuZbN?=
 =?us-ascii?Q?ud94sDTBL37cC1ly5S/2WV5JMJZyAoh/L2SCTZ1L1Fe7YqJ9Xuu6ypVOAGdG?=
 =?us-ascii?Q?4dvBfSgJddfPlcvdtDw+VBaEPM7R3wh6Q/FsWWITljxVCQu8QVHto40ty5rO?=
 =?us-ascii?Q?MZ7N5YAobFhov1iCzRuzAWuO5VGuVZ4iZ+RioL+Gf8/rjMyGwEB2aJCvkWPO?=
 =?us-ascii?Q?vIe89QQly4GbqOOKbsWBouLSUm4MY+dlnhW4MYhE1VmKaZOJSCaJgUcvaZUu?=
 =?us-ascii?Q?SXuHvm9L8a+8+6WfSd3HYUKm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 017de31f-b664-4048-6824-08d94726640d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 00:20:46.4228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: crdvZ9E4+bPCAmUTeGR4gL2A9MHjuak1C4wJez41HjTTGZ97YfMb/cGX+efAel0X
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

Like vfio_pci_try_bus_reset() this code wants to reset all of the devices
in the "reset group" which is the same membership as the device set.

Instead of trying to reconstruct the device set from the PCI list go
directly from the device set's device list to execute the reset.

The same basic structure as vfio_pci_try_bus_reset() is used. The
'vfio_devices' struct is replaced with the device set linked list and we
simply sweep it multiple times under the lock.

This eliminates a memory allocation and get/put traffic and another
improperly locked test of pci_dev_driver().

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/pci/vfio_pci.c | 205 ++++++++++++++++--------------------
 1 file changed, 88 insertions(+), 117 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index fbc20f6d2dd412..ff23168b8dc551 100644
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
@@ -2155,37 +2069,94 @@ static int vfio_pci_check_all_devices_bound(struct pci_dev *pdev, void *data)
 	return -EBUSY;
 }
 
-static int vfio_pci_try_zap_and_vma_lock_cb(struct pci_dev *pdev, void *data)
+static bool vfio_dev_in_groups(struct vfio_pci_device *vdev,
+			       struct vfio_pci_group_info *groups)
 {
-	struct vfio_devices *devs = data;
-	struct vfio_device *device;
-	struct vfio_pci_device *vdev;
+	unsigned int i;
 
-	if (devs->cur_index == devs->max_index)
-		return -ENOSPC;
+	for (i = 0; i < groups->count; i++)
+		if (groups->groups[i] == vdev->vdev.group)
+			return true;
+	return false;
+}
 
-	device = vfio_device_get_from_dev(&pdev->dev);
-	if (!device)
-		return -EINVAL;
+/*
+ * We need to get memory_lock for each device, but devices can share mmap_lock,
+ * therefore we need to zap and hold the vma_lock for each device, and only then
+ * get each memory_lock.
+ */
+static int vfio_hot_reset_device_set(struct vfio_pci_device *vdev,
+				     struct vfio_pci_group_info *groups)
+{
+	struct vfio_device_set *dev_set = vdev->vdev.dev_set;
+	struct vfio_pci_device *cur_mem =
+		list_first_entry(&dev_set->device_list, struct vfio_pci_device,
+				 vdev.dev_set_list);
+	struct vfio_pci_device *cur_vma;
+	struct vfio_pci_device *cur;
+	bool is_mem = true;
+	int ret;
 
-	if (pci_dev_driver(pdev) != &vfio_pci_driver) {
-		vfio_device_put(device);
-		return -EBUSY;
+	mutex_lock(&dev_set->lock);
+
+	/* All devices in the group to be reset need VFIO devices */
+	if (vfio_pci_for_each_slot_or_bus(
+		    vdev->pdev, vfio_pci_check_all_devices_bound, dev_set,
+		    !pci_probe_reset_slot(vdev->pdev->slot))) {
+		ret = -EINVAL;
+		goto err_unlock;
 	}
 
-	vdev = container_of(device, struct vfio_pci_device, vdev);
+	list_for_each_entry(cur_vma, &dev_set->device_list, vdev.dev_set_list) {
+		/*
+		 * Test whether all the affected devices are contained by the
+		 * set of groups provided by the user.
+		 */
+		if (!vfio_dev_in_groups(cur_vma, groups)) {
+			ret = -EINVAL;
+			goto err_undo;
+		}
 
-	/*
-	 * Locking multiple devices is prone to deadlock, runaway and
-	 * unwind if we hit contention.
-	 */
-	if (!vfio_pci_zap_and_vma_lock(vdev, true)) {
-		vfio_device_put(device);
-		return -EBUSY;
+		/*
+		 * Locking multiple devices is prone to deadlock, runaway and
+		 * unwind if we hit contention.
+		 */
+		if (!vfio_pci_zap_and_vma_lock(cur_vma, true)) {
+			ret = -EBUSY;
+			goto err_undo;
+		}
 	}
 
-	devs->devices[devs->cur_index++] = vdev;
-	return 0;
+	list_for_each_entry(cur_mem, &dev_set->device_list, vdev.dev_set_list) {
+		if (!down_write_trylock(&cur_mem->memory_lock)) {
+			ret = -EBUSY;
+			goto err_undo;
+		}
+		mutex_unlock(&cur_mem->vma_lock);
+	}
+
+	ret = pci_reset_bus(vdev->pdev);
+
+	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list)
+		up_write(&cur->memory_lock);
+	mutex_unlock(&dev_set->lock);
+
+	return ret;
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
 }
 
 /*
-- 
2.32.0

