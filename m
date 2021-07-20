Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A173D00A8
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 19:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC696E4F8;
	Tue, 20 Jul 2021 17:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB48C6E524;
 Tue, 20 Jul 2021 17:43:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7KCd/8uRiaYJmx5KNwE8bdNfb8mcWdDigm7vqcuXHOlJI1qJukMZps8/lLd38dm5OC9RiG4XbF+jCcDO9FxzUNQ2pmGqd3GcXLdhC+dL5YKAle4Q8+vvzvvIkiYrv3sIbOOgQuOWLcfVKF6GW5yS4xiw5UWEuYP1D2/I/KfiftPIzxzaptv0gjgsxjsVq/b3SzRXByTzLcM6g8Q95bg4SXQDxdyaRg63CyjeaolDY+rxTON/KoOfNwmXslmc7h+OjxpJeaa58eKdiIvZnwrl4LuzGB7lUzeEEqSKxskZ2MHrZUSjDebYuYxg2JrtDjefIU5FpHyVSLpROmBojkrhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEvzYizSfsJwbm1T2H0hgeWCBiAJ2Bm/jPsOCB9m9j8=;
 b=H1o9ZK7zduUE3rBCjO9cD/cjjLpOU2AZQeSdqVoEgUTNS9K94+7O8dbSkq3lDJ/Je53yYYMdRey3JPvXBso1MlRD4nWVohkNn5jvlZaSSCJYjgUE3sztmv3W0RGAoa6g7cGn1DHpHfffgBfyD+kMBXKKxu7OtdfV1i3Tain2tKl3gSZ2aKgkZacEQ0ReTY5xdIZ6FnqvJCAqYeKeiBiAome1VfGjWtEO5OHxORdh4GWok/5eSqqdjFjo/UZ1Pph9IlOKv+PDqjkozqxSbDjENerDslrhlRXENGLKhemstj7uRVY94DzxTON2ODTE65daSa0eCgCtExuR6X5lVUenUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEvzYizSfsJwbm1T2H0hgeWCBiAJ2Bm/jPsOCB9m9j8=;
 b=UOP14Pjsz8xUuIB8ccBV45F0FwM0ctLsbkH9Cvi9D0cAz1ZIpqpnCGVVjLIYKdBfARbjnDEYWHN6Xhb3oeFGqjp4GSSfbmWuJ4CvT0hIBd9OqcW53TS5vseyjdd1hTmxWX+tHSExmlz6q8UIzQ/GmBsGdF+3FLQ2UDIM23VGWvywEYnKcgsIW4VPdfqNP3IGzG+GaH4JC6w3rM74HVaK0fE64Uz/mCtAZoYPZYdwxj56fyFlYcpFpN7Lv9mVWxXzV4M+w049UszwLuoykU11g+EwY7/BzWRwyida2dOmaMUTC4cZXgNjEDboi1U2d2F9xee9KJ1el8hLJWg/f+D4qw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5125.namprd12.prod.outlook.com (2603:10b6:208:309::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 17:43:07 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 17:43:07 +0000
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
Subject: [PATCH v2 10/14] vfio/pci: Reorganize VFIO_DEVICE_PCI_HOT_RESET to
 use the device set
Date: Tue, 20 Jul 2021 14:42:56 -0300
Message-Id: <10-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:208:fc::26) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR02CA0013.namprd02.prod.outlook.com (2603:10b6:208:fc::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 17:43:04 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m5tll-0051F8-L4; Tue, 20 Jul 2021 14:43:01 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94613815-fd87-4ef4-dfa2-08d94ba5d3b2
X-MS-TrafficTypeDiagnostic: BL1PR12MB5125:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5125E06A0E24FACB8C13E34FC2E29@BL1PR12MB5125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BwRq5fSxjGhil3uML9W8mTmuGu4jV7pQf0jy+h9x5PR/HGjo7yaaEQLU0SFN8IwNdSX3VlfglS2QvQN9admfGl0+JjANFQMyahjceZHfQQySlWmlUZBhpDT4fIWapX7DE3nZfOULBqHjbAh2IGbVB7329aAIEpBD4hRLgReM2LhmFA0lZaOKYmFhJKRhsOqh2+fWSZjgpvVWVRLrnmQ6Zgusog26RT6E5/4P7jtnO2uRhrzGWrs5+3+O8OlqxSyrB+aSUqxKooe7VymWrAn7CDl55u3eOEMgCWW0t+IACV3II7VZZGkCTsqsvmrJfxO1T9JSm5UiHyA7RQtQBf3yZ19MWvYNndgve1BU/n/Lgsr+/dowzVY3wvCun6gTtUs/aAsHjGhByO+HUX1exL4k1zfRFft3ZA6YCNlrKPwEPfJNrNIldUG55urqV7MEchFad7e6y0p21o4owo08VZ1ii6xf4uUfKb9GplXaVjYWIMZm2EnX4BtFqVvpjul3QY3sHTPy04Bk1lFuhS4qTeJHUCv19OtxYUc3TWYA4dAnV8BsE9h0HsWlLbxIpdcbkppG10D6Z21dDQQfx/WYuoMdEpR8vIcGwlxYnVJuphB0/zuqYUI5kL0bD6glsMSebedkwCcn939FL5dcSmoCrnCvA6PSdeUvDvuvD9kU04aqiGFRG78V6wlFFomRl+5sHaxo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(366004)(66946007)(316002)(66556008)(83380400001)(54906003)(6666004)(7406005)(38100700002)(26005)(66476007)(8676002)(9786002)(4326008)(8936002)(9746002)(2616005)(5660300002)(186003)(110136005)(36756003)(426003)(478600001)(921005)(86362001)(7416002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d+bKJZx+xn3vdLWP3cYBRx/gg/J2kp2stM+YLpkUc0HLwEGOi6ugplFo4/uj?=
 =?us-ascii?Q?D8pGxX+1/3utKUgILBbs8DgdgzErKBjCDNTXc5ExCvJPznjGFCUbKVCyYI1z?=
 =?us-ascii?Q?GayqLxcJ8+pU92fo+sf3cnTU54MKGrFjLQjJvY9mrXCKpdIKPB+I7NGwMNmw?=
 =?us-ascii?Q?OMHd/oXY1fhwmsUcoSqc72GUYsC0BSR6BQZwtppNSxQMAoptss05YC+hWgju?=
 =?us-ascii?Q?b5weDDcRs2rDF9DtsyCxrEygSYMq1SAi8O6OrSn+45+pT27tjmzk9wmI47mG?=
 =?us-ascii?Q?tog5fwkiQcUCAM4OEFpTQadoEg3wWrbPprHICPcpSGLJ5XkU3zGZsAnL6hAJ?=
 =?us-ascii?Q?fgqZHfV4ScmBbE/urVceFA7sttGgXBMrNOoyW1vPNXwfyyq2uoJ1b/f28nOA?=
 =?us-ascii?Q?ZwjsLFOcz6uipSU7WRc3tlusJvWrsNqzFZtgji8ixzDZtsmTmX2tPPQDfQfV?=
 =?us-ascii?Q?dLhoE90cVBeTPUnMMhuFv/KwKNOc+TuCM9up/fEngQV1/zu2XoFqefxl9vXg?=
 =?us-ascii?Q?5HW2LBBVzOY6EgqV3UeB9Fn5Zn2gXncSeCFagTHwEGZ0q1GbQYTJlGndjv+W?=
 =?us-ascii?Q?RJeKRJGQ2RW/p4rv3ykH22aBGBu3oCN5rz2QBy6FQ+pyt0CePTTGcIqkAl8N?=
 =?us-ascii?Q?w45D/QUXAXf9YeSmcUWfq5l2rwLNi2Qd10ymMopY1+Z24F5f3R/AnMHtDDPg?=
 =?us-ascii?Q?T7jqnTvQkV9MdUNxZyYBIfyNE0vH+eLQYRNtwMFsQ87PjkiVb7Wq87NEJ9Bh?=
 =?us-ascii?Q?weW8akVmTXowiar562Hmj6gUWz25e+l+bm9znly8S+GeEXzyiOiaBuXutud8?=
 =?us-ascii?Q?GtTMluqRLiGjuzXNkDs+cKvnnNML5wUIT3kUxkQyRrxIKfHKXd7Bq8bJnxyL?=
 =?us-ascii?Q?Hg7ApLwGGnsi/OjeGF+XeyY3nvkOaz9lL3hpjp3z0Bblr0sPclkt4Gwdapv4?=
 =?us-ascii?Q?CVQ+q6a0uPq+ER4XD/ckjpw8/snnry6zshZihqNIVP8EmWZ4lAY5dEzb0qEK?=
 =?us-ascii?Q?LEe/cgMr+WN+3ETAFOA5VokuH4+KurdrOoHs48rZg/Jyxc2R39VKTaiocZoM?=
 =?us-ascii?Q?h3HIhUsrkgqxeRmMq7KUPiw0gpEB4FUEq646GGoyNaRaOr1f7Jmu6ORDbzCD?=
 =?us-ascii?Q?ivUygPjMITaSRwu8bjTbaJ8I8is9NrYk3wvQ+u/EggyGYfhV/FrJPjQdXql8?=
 =?us-ascii?Q?fQOKxUwWHCJSvyOQyMF4Vzg/pqM9QPvu/boHBItxXkPuyFIhbzYDLtTBq0Z9?=
 =?us-ascii?Q?GdqWgfS5uEbxPV9tPd03q4/PC36Qe8Y7iiWX2iPnVJU4LKOtK1342/rqJUIW?=
 =?us-ascii?Q?zOguoUXLZXRHJz74beJeEd88?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94613815-fd87-4ef4-dfa2-08d94ba5d3b2
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 17:43:04.5517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +r7oOzLCSXgBo1u4nlD3cwtgT+Wiw7xlScNpxAZWQC+z780x6yUx5Psl/toIR+8t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5125
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

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/pci/vfio_pci.c | 201 +++++++++++++++---------------------
 1 file changed, 84 insertions(+), 117 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index fbc20f6d2dd412..d751d38f2175b6 100644
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
@@ -2155,37 +2069,90 @@ static int vfio_pci_check_all_devices_bound(struct pci_dev *pdev, void *data)
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
+	struct vfio_pci_device *cur_mem;
+	struct vfio_pci_device *cur_vma;
+	struct vfio_pci_device *cur;
+	bool is_mem = true;
+	int ret;
 
-	if (pci_dev_driver(pdev) != &vfio_pci_driver) {
-		vfio_device_put(device);
-		return -EBUSY;
+	mutex_lock(&dev_set->lock);
+	cur_mem = list_first_entry(&dev_set->device_list,
+				   struct vfio_pci_device, vdev.dev_set_list);
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
+	cur_vma = NULL;
 
-	devs->devices[devs->cur_index++] = vdev;
-	return 0;
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
 }
 
 /*
-- 
2.32.0

