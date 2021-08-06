Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD943E20CC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 03:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067416E90A;
	Fri,  6 Aug 2021 01:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A746E8F4;
 Fri,  6 Aug 2021 01:19:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvWPFLHmYpQ2pZSPVgy/9d2oJpJrTk58ZonQqhBp5ANaxdxUrJuFwYEQYpDwy1xoKToDUm5GnxFF9z5wtnqlEIuUzrzy91pmJHDTjZt6Ar5DlOzs1Rdzob9ueQhy1vUDqLCkDuN+eGWVT1SD+lStRlcbjzFwx3fQHecgwybu+nuw1Zkm9ekCZBw+kecCk36am8lTHk9l4EBUhv9gTXTipZiIYoLD4ENssVqZQodoamMq+ohTIxSpRKxQ1Wy0e5AgfME5eAOSyMIfywunI/7jr/Ild9BgQuwT1Gv3Q7wg8zX3LJM7sWkjPGl+zNHdo0Nso2gcb9iuuwFUAxESAgzjAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkZr13El7PtjKybR8+hEl4KqSeM2dPADQSVtSmBzw/s=;
 b=W7m+oep5lix/QDfIJtkN4KXVUNagTVwiJkO3QGD0J8BagUQgv9/t2yh5FXLRPqGFshgXEWaMQhKPkXChej6jFiSahIHc8Mn57kkz0wHHGclBni0TSoRLaL2prTcfuPTaE7kR1zGPabffeYkiz89eDi7tZSJk3UCZrl+nU8sxcfJoa3adX9SyX2gRWIrykhMBi9M50zk8UshjvGqPg+ZZpvklYuE2rwzBpCPGQQ/QrClDagebPYzf05MN9M1FPwovxqiJVbIti/jZp8p/nSW643qo+TYeerI4mzELfs/QMddGoy59dOEGUYKBp/7eG+ycWM+6l4RUVcd/qGZ0Qu0lpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkZr13El7PtjKybR8+hEl4KqSeM2dPADQSVtSmBzw/s=;
 b=Llky4geqa0KgZh2amF8Cs2KwnlbtXdD4djm2bP6YO3NcXjBOk0HQ2qKuOhwMbBlQrBROI3jx++xPLCqTpokbE81NsokNEJLlORPsz0H2+ui5iaZL9zxrWJesjXtzeHp4MpQsklicYs65otLSFdBjuJG+W/z6m85yXy95Xu5Xfli3FkzBqj/Omhb4XbiJqZ99DGUAmLSe+4PILUMbQIIcRGOPuECKalzz/rSKMHzJQ/ZtiAyYKRBozgvsBSIjUrOF//0WcIir7fdkedqh8xiuzK4lyNIBjlvbvmhJbTP76e/5vE+hQUznuN8z19tATZ6yby5BXvlvy40qPNJQgtX7Wg==
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
 01:19:13 +0000
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
Subject: [PATCH v4 10/14] vfio/pci: Reorganize VFIO_DEVICE_PCI_HOT_RESET to
 use the device set
Date: Thu,  5 Aug 2021 22:19:06 -0300
Message-Id: <10-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0038.namprd02.prod.outlook.com
 (2603:10b6:207:3d::15) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR02CA0038.namprd02.prod.outlook.com (2603:10b6:207:3d::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.21 via Frontend Transport; Fri, 6 Aug 2021 01:19:12 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mBoVz-00Dt7R-Bi; Thu, 05 Aug 2021 22:19:11 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b865a6c5-bcb5-4945-726e-08d9587832d6
X-MS-TrafficTypeDiagnostic: BL1PR12MB5206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5206400442A691367614DA52C2F39@BL1PR12MB5206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aL7ZvKhyqJZfDLjpL35lL5Go/WMgVzZG0CKJKofM+Of1PPa8sCrDAlEz8Lho895IaasOigoA6DdUmptDS9/3ZXoWhvbJs3YfwomPpCgjyI9jqZrerQwrHbFFLotloNMGEG9vnL84jHIhoGRHuILqrcJT5sd/stjuZfxWJR06UqPtJ+CMEwm4zEfevisYpqNthpq1LlI1XgxvNV3GRjZXRIoVNmNelgSbeqU+t8R0oAuWlDWF6B/y7mT0nY95mdxP1FMDjAkK93ZNLndk3npbaRL+G3Uv/nj+nZetr8ryEKnIGIaLBL5t1neippdvGdu5mwFvtQ9E3IwXTMM03xVJpqYJV/bqj4bNkm/eRZdNQi9ynb56f9xYIHZbViBX+DSKqwig75m7wl1YJiCQALh52+Bz1fcvaBA9xEF1GoIBPaqOdaZPWFt+Dsv5KaH7r5u6PSQ8HGRkD+QsRmtj7Pn9zyFCjW/wAXSFzl6OE/mRTAV+jjiz7japgASAbL9lNd5iAZ1krLxWGZwY/xIHz4wMnul/0tsn1BfuFvzNJT8IWEadbgSr4tmXeDJnSiD9N/vAMIHLKE7NsxB5fPjUtDWTfP2IzEeTsJCZxDjYyvMHxx8C1aWH1ShEu7MhQ7cKPfAn1O2uCeF66dum4xK7gbUQPSz0iIISML7dQJB4NWzzQyS7/Zs10/ztCHxeQaIoWe4Z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9746002)(83380400001)(86362001)(9786002)(8936002)(426003)(2906002)(7416002)(38100700002)(7406005)(66946007)(921005)(8676002)(5660300002)(186003)(2616005)(26005)(36756003)(508600001)(6666004)(66476007)(316002)(4326008)(66556008)(110136005)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DAi6S3Rb173uUsfMePhQZu37jsnVKoGLBs6Kh1hIgM2fYXyRVXqinPWWJvPY?=
 =?us-ascii?Q?IiiilaI38Ii1PXdiA+M2zU+HWDIaagro/nNTxrYh0J1Q28Mdcx2Pfgv7UjFo?=
 =?us-ascii?Q?49987j585eE14Qr5f0nuVB1DtTAEUlvUfaVuFz1ULO3VqyZTj/ibxXzH2RJj?=
 =?us-ascii?Q?USZ5cmiGf91SxWRLMU0OHJBqJasr8k1KodLUH1PBKHJac39+XfI1RMMrtrNO?=
 =?us-ascii?Q?QEbOdopvSSBNrrzsnnhrDJfvDcjgTE3V76KLH1TBHp+y8HMN4gsRpQA34lCv?=
 =?us-ascii?Q?ZfNDAKrUah8Sk4NGAYC6Nhtviaide0dG2pdglFYlCfQ6KVauEjAJ3klWFfOi?=
 =?us-ascii?Q?rsRhg0hoC3H2OYHHNCdsWS3zG+dVfChRiaurxp98eQVqpUfYF3bFwalY4pOo?=
 =?us-ascii?Q?xfvTNkPg6H3noH3TpbhMCqgArfDxxVw14fM2C1cZ/iPVaZDvk4zN1AjrhMfz?=
 =?us-ascii?Q?6hw46q+t4wOLOnPqHkvpsbey/q5nJYKXZlu4Mxr2QhOWDKhUjLxFjB7ydnrK?=
 =?us-ascii?Q?NBeeilKirycGm0JAAl7bln6hbpkofaRgT0yhJgRLeKZy8zT6yn9MGEWiDNzI?=
 =?us-ascii?Q?sjJr94Y/YqupYIxmGvlQ3oSekLtEYCd0UAmeCGgPtyAKo7UTxnrHApB4Rmme?=
 =?us-ascii?Q?0xKHsgM5jKbRsXKNeOZv0svMy061cyVlQZuuecaq+74dZXCEKjiHaPawvvZH?=
 =?us-ascii?Q?ycxviiYpDSC7Q9TBJ4IKz2K0qULaUDEgYJvj465NGN9K/7eQZ2KgT99Z/Vs2?=
 =?us-ascii?Q?eMctpjzT6Lqxaavk05wX+BCuYOPOl9aRn5pvuLhvcKFJKuwkdbhilhL7lK38?=
 =?us-ascii?Q?pN2skwsPQmAiuMCw20LMLRQndYZbJK8tybMqAWCIztMkwlnW0ZXAsTOuHHEI?=
 =?us-ascii?Q?VB+nh5aMQBb8+7zluV1K0hI4/SFtAM4y7Gb1aUrtIv7Orv++88tiaBKfmBZP?=
 =?us-ascii?Q?mjDeSvPz7UdCAUj7ZjfLjS+t371w9+ushCwtbDvqMvAotduhbRAh+Wfi/uAu?=
 =?us-ascii?Q?QyESNvmR7wc5uGPBQ43iX73p+1gPSrg41lAvh+J09PbU6icHE2Qc7HjJlkv0?=
 =?us-ascii?Q?Hv6k4XMZ3Z+7aj3UZt+EV/Umy+Rw9vn4wYkkHtuShtEdTv+DYfqHbqZjfC23?=
 =?us-ascii?Q?iqPqdsn2n3C3M2JzvDfJajozQLsPIL+G1Gypq/xU9QzKXzGeHf/mglkYMNcW?=
 =?us-ascii?Q?lpqM+UKDcoAriz7fwAua7aI89F7AAEtqZ4tpAo7mtTjXhmjl4TrTYbfCNZuC?=
 =?us-ascii?Q?ltGlq3jPeH4xsUSIEY2vENDcfUHycxz5eLFEuRusnCrl8+2ExuMQmJ3WXrc1?=
 =?us-ascii?Q?iJvqUSNmQgCUNn1BOdZuU5LM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b865a6c5-bcb5-4945-726e-08d9587832d6
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 01:19:12.3921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fCcQqCs7aB50xzhL7nnERr8XB9kbAW/p4piFi63Ao8wIrYhKzTpOWke0fUsgJuad
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

Like vfio_pci_dev_set_try_reset() this code wants to reset all of the
devices in the "reset group" which is the same membership as the device
set.

Instead of trying to reconstruct the device set from the PCI list go
directly from the device set's device list to execute the reset.

The same basic structure as vfio_pci_dev_set_try_reset() is used. The
'vfio_devices' struct is replaced with the device set linked list and we
simply sweep it multiple times under the lock.

This eliminates a memory allocation and get/put traffic and another
improperly locked test of pci_dev_driver().

Reviewed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/pci/vfio_pci.c | 213 +++++++++++++++---------------------
 1 file changed, 89 insertions(+), 124 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index 0147f04c91b2fb..a4f44ea52fa324 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -223,9 +223,11 @@ static void vfio_pci_probe_mmaps(struct vfio_pci_device *vdev)
 	}
 }
 
+struct vfio_pci_group_info;
 static bool vfio_pci_dev_set_try_reset(struct vfio_device_set *dev_set);
 static void vfio_pci_disable(struct vfio_pci_device *vdev);
-static int vfio_pci_try_zap_and_vma_lock_cb(struct pci_dev *pdev, void *data);
+static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
+				      struct vfio_pci_group_info *groups);
 
 /*
  * INTx masking requires the ability to disable INTx signaling via PCI_COMMAND
@@ -643,37 +645,11 @@ static int vfio_pci_fill_devs(struct pci_dev *pdev, void *data)
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
@@ -751,12 +727,6 @@ int vfio_pci_register_dev_region(struct vfio_pci_device *vdev,
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
@@ -1125,11 +1095,10 @@ static long vfio_pci_ioctl(struct vfio_device *core_vdev,
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
 
@@ -1196,9 +1165,7 @@ static long vfio_pci_ioctl(struct vfio_device *core_vdev,
 				break;
 			}
 
-			groups[group_idx].group = group;
-			groups[group_idx].id =
-					vfio_external_user_iommu_id(group);
+			groups[group_idx] = group;
 		}
 
 		kfree(group_fds);
@@ -1210,64 +1177,11 @@ static long vfio_pci_ioctl(struct vfio_device *core_vdev,
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
+		ret = vfio_pci_dev_set_hot_reset(vdev->vdev.dev_set, &info);
 
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
@@ -2146,37 +2060,15 @@ static struct pci_driver vfio_pci_driver = {
 	.err_handler		= &vfio_err_handlers,
 };
 
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
@@ -2226,6 +2118,79 @@ vfio_pci_dev_set_resettable(struct vfio_device_set *dev_set)
 	return pdev;
 }
 
+/*
+ * We need to get memory_lock for each device, but devices can share mmap_lock,
+ * therefore we need to zap and hold the vma_lock for each device, and only then
+ * get each memory_lock.
+ */
+static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
+				      struct vfio_pci_group_info *groups)
+{
+	struct vfio_pci_device *cur_mem;
+	struct vfio_pci_device *cur_vma;
+	struct vfio_pci_device *cur;
+	struct pci_dev *pdev;
+	bool is_mem = true;
+	int ret;
+
+	mutex_lock(&dev_set->lock);
+	cur_mem = list_first_entry(&dev_set->device_list,
+				   struct vfio_pci_device, vdev.dev_set_list);
+
+	pdev = vfio_pci_dev_set_resettable(dev_set);
+	if (!pdev) {
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
+	ret = pci_reset_bus(pdev);
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
 static bool vfio_pci_dev_set_needs_reset(struct vfio_device_set *dev_set)
 {
 	struct vfio_pci_device *cur;
-- 
2.32.0

