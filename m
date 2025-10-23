Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31338C03D8D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 01:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B6E10E9B5;
	Thu, 23 Oct 2025 23:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eMgg8Oox";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012041.outbound.protection.outlook.com
 [40.93.195.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54C610E9B2;
 Thu, 23 Oct 2025 23:33:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBsny9tXKTaHYpyG0GC4utP1fXgfbWf/9SFdsLYHM5nUQdGmQbxeovIg+xnX9CZ1xzHJGNmofTx68uaXqo2vDegk0KLrcCSSnyXgcGuX2W1CMGWDAHNKdRLDvpNnzvO/MyKlMKy4igIUEtxqthFeO+cbHGUYEZy3O+aQl0HufGkR46VQzrgb8yaqOzAJVlnHYSGvzfdsWejOcI/nSWH7BLwFkEy7iV75NyrPvtkZRxaSvXbqhsXrWaZ1n2Qi53qbJ5OI/+akgdGA0zzVPrnmDd6AfSce/JfWXPTPwxN0j8HGVV7bLEcqNsHjdhjQfnTmBFJuqkhxeWuua8Xjm0kLVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RY+Fr8ADvdG6iePOmN3dWrxKpliKEM40mOH+tyCu66k=;
 b=M34zZSjFiBw4lfAXh8659qW6cKdsd4roH6qpdws91yaCTUgxuyKLKcqaSIuxPIbBDNF369uPDwnp0Wj+DHX1hfYmPr6vn4PqVcV5H28axh2vX38xyg2Hc7YFqBFq7s+0bN7ahjCwZBSRPrQq62ofWZcT62y+/tPA6bAwlrcGD4fk+o5efRyyDQiCdDTjirKrjaKLp+TkCCTSNbb8xaYEc1BUor63rTWsK/tsfqh/awrT5SfuW2Or66IQmrRHNyG4qRNeHP6LR6ElWk99TdREhpnh/VtxyFbFlTXxk66EVEnjCY4Op8UjVIN+jXZKaovol7s3PwTeAvCcWb23Qq/APg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RY+Fr8ADvdG6iePOmN3dWrxKpliKEM40mOH+tyCu66k=;
 b=eMgg8OoxvnTCPrdgmVNzqqTYktmjhuWOM9sXFCAp9SUonKAe0suc2f7f7Sc7bIuqkfeu5Q1DZsfqgujOWyEO7r0Y1VdCyvZm0TXh8TdamzmMzj2tK9YpA0PLldn7Cl31KxKyfab8RkxIjIb/Zsrw/v8zCh2g3bD3csGziUynxAs1luKlbGzazvafnm5VUx83/TS/+n5aarscHhJ0oRjyLp29amtGrh8y21AynEXCCQGU2vIPs5TtCEMVfmhcsN6J5aF7ghdAhbKlK7k4KpJeNC9e6Q/khF5erw3YcfOnygxTrdnPJWpEdmH7GyT5yNJqMmNsaDeN0hcohchuskFg3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by LV2PR12MB5943.namprd12.prod.outlook.com (2603:10b6:408:170::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 23:33:41 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 23:33:41 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brett Creeley <brett.creeley@amd.com>, dri-devel@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Pranjal Shrivastava <praan@google.com>,
 qat-linux@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Mostafa Saleh <smostafa@google.com>, Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>, Zhi Wang <zhi.wang.linux@gmail.com>
Cc: patches@lists.linux.dev
Subject: [PATCH 01/22] vfio: Provide a get_region_info op
Date: Thu, 23 Oct 2025 20:09:15 -0300
Message-ID: <1-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0124.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::9) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|LV2PR12MB5943:EE_
X-MS-Office365-Filtering-Correlation-Id: 38b4657b-8522-4bc1-ef09-08de128c998d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Gh+Y6HTFiMvofeT95vOM/k/zug2AVHnO6MT72YmhYgi0+6U2R0/aBgKSrQbv?=
 =?us-ascii?Q?z3PUJahWW8c+0CuEdCVa2fALIcDRSMLUz1aIMtyXHO+HbhSDAc/J5oMdOc0U?=
 =?us-ascii?Q?KRnFXHstigjFO2QGRYen2r7ubQxmQHkS+/T4t78UgCDciJvVG1Kq/yu/9Y8G?=
 =?us-ascii?Q?N6xm80n3p+7pbyrwmmV+8IUkrV1vb9772k6RMwGi0Jbzz95sIQOOxVJdOQ95?=
 =?us-ascii?Q?KgbfWT6XzcIwUtTP1LTYE0IA1Ae/nKs0lOXmbmoemyV5mo1I3Kr3KhVXvLBS?=
 =?us-ascii?Q?o3Z6k7m/nTCQCTNRAaIisw4f3ri0MSf+TGn5ttxxdyHpbA0ao/cizt/Pb8TS?=
 =?us-ascii?Q?Mj+AJ8Lx6inaOMNp4m38ASW67MrcRNBx/TehVxFL/VqjvzUkufRRorotkxdQ?=
 =?us-ascii?Q?3ktXZMS7vNhsRDazB5VbGJ+R3ey6aC2kmegzT02TI9VvFWdBIXahVj9k14zV?=
 =?us-ascii?Q?JuwhcWk6k3nnetJvnl19KXGtnmxQ2M6YxsND2zg0WZDqRI52HmojeCo8tj2O?=
 =?us-ascii?Q?KEzRc2SABUQ+oo7zMKFVB7OmGU0yhbYrxKfkMMBPPFNjKvQ/pHClNUo/eNrg?=
 =?us-ascii?Q?Lxyhgbks2PyO1OacsqsX9B9/98iqlzO/0cxyAE86A1ibIEYTGe1ImgdhJB7N?=
 =?us-ascii?Q?CuPo58vU99yybbAY35TyED/+Mdy1geWhNiVyF5Wdn0db8YxRm5p3GQpDYzu4?=
 =?us-ascii?Q?nw87w/lgbor1EVdpxqBvUiuFzFHOxkx3zS5mnsxeQu4dewMxcEP5R44hwDp+?=
 =?us-ascii?Q?TILS9J9RhvsjoWWK8J04OPfe36JM7Krbws1ZT9usdXQ/49JpDVmkoXuwf4aq?=
 =?us-ascii?Q?/WCsKnew5GORkZL0jHR4HtHmzadOFbM9ZKNAvBZ3DaAvNRzGfNIbH6WhhD6l?=
 =?us-ascii?Q?U9B6ZNLeMzN8NNUzXQrz/RJ2ANxllmk9QYVvsALqAVgr8Ygi0vKd5W9lptEo?=
 =?us-ascii?Q?+65KTqCJbte3YYaK+JugY3Uerdhh6PVgmm1KqAcpT/lhkdxlQN1xat8ExPaK?=
 =?us-ascii?Q?9m7N5wgRAMv6h8Ylpy37JPcItMB5c1MKsgsjmCZce5e1r9kaOVnCvKlcfoSJ?=
 =?us-ascii?Q?lKiLqZkYi7BmiMh3V9cphDs9x6ZpElrEKV5WK7bqrhqUGraQ6Jo1Kt+EEndM?=
 =?us-ascii?Q?zLxqfv+ulPaK29zprr53MJSVe8IGuTgg8PwwCv0u8YwP2ZJ7nL1rOjcg1KSF?=
 =?us-ascii?Q?+0mQ6+TbAr7m8/DEpcZ18a1ttaDkB32C3oIiWU610l9HgC6SDR8q8rORT8NI?=
 =?us-ascii?Q?7vQyyGGR5pChy7ALUDm2W5QRdNaigeDRLvUpH/pWXX25TEFrN5WYk1wcP/km?=
 =?us-ascii?Q?eAMF5fiwc0n/KDdQs5BkMcqVA7G+a1daIXDPFrp0k9BDzEpVi6W9Yg0asEr+?=
 =?us-ascii?Q?pOQoDGl/vrWkaTXgseG5o6vcacQ4XkKPgbOBr3sMYInHKdmg3ddwKwNyo3tF?=
 =?us-ascii?Q?5GF4PH28kJJFU0zzMPw4qKuPkb9s9EAYJpbPuBhH0aOC9CKcYcErOLgzNKI+?=
 =?us-ascii?Q?jMyalnPRJAX94CQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iYAAjK+LstEs1QPHIdyaAUGuwaBABgIqGCCgnmg2OTG7cVPQLnj42KxPmcSF?=
 =?us-ascii?Q?Hi5OA7P0DgcDte0j3XmjNXXIenPFha11ZYazOv8owC61Aj1FCknfjENJWiX0?=
 =?us-ascii?Q?NGItoREkg1TbY4YC522NoTTq3UyF6f8hmmBVT66yGmNLk0bqMKBKZfdhw7nY?=
 =?us-ascii?Q?F4POXYqiVocd5sxOUw/zo10vVn8OC/iprLi/cBCA9v3qk9DgZQ0a2eJdXUws?=
 =?us-ascii?Q?iyGop3pevB7BGNb59RRZnDR1MvBqgYOV8N+1IjogFqqdP8yB+RNxbOIvgP3k?=
 =?us-ascii?Q?W1RhDqPXSurFA0bP0pEOGqiOu8y8nLMzHHGvo+rBb5nrGaQwvwJzcxotqEij?=
 =?us-ascii?Q?IDh6J0aHpWpAmDhr9620HXstl3wn76l6hMrlz8G5j2WqmGmKNl7CQUC1ABIx?=
 =?us-ascii?Q?Tl7Nj0C9mv+njfq7T3785dLMbxAuAlVj+qYMCq+1vltrNcvjM8DPDlpzWrmX?=
 =?us-ascii?Q?anTZHypDgusZd7rRCn0ZLzjI8SGDVIfT8VIr6CjP8UJhXgNOXbKFLWWn+Vww?=
 =?us-ascii?Q?XKNekAngiDXaW1SAmNvUETi1PWDgtWcvKiaSLkUIV2EQka59HyEyqgN8xQ/x?=
 =?us-ascii?Q?CfCCxr8LRVSOLAB6/g9MjGJvnq66ASnSvS0RLenIv1TG3KVxsQqKXZ7B1HIO?=
 =?us-ascii?Q?y4p7G9BCnbDmLh4YC2rCXcG201+rh5tMWrYJpzTxkklYcl+9zH8saPmiNNxB?=
 =?us-ascii?Q?6NYHYzChjnzDQAWfhGaPg6J7RZCGc/X+Dp6Zymap058CrBbLNUrnD4Rayx5p?=
 =?us-ascii?Q?Aht8Z6pb3wKl95/wtdoy47XZh55KQy71ckcwPAGs8X72ae2NHrPmf3+kpUtV?=
 =?us-ascii?Q?kH8zq34HDHHTFE5kgmQLl6gXW+8fGYX+4zwCxvBt7zHJDKRMWMkvF+O2vr6c?=
 =?us-ascii?Q?S9TGgMu9L9yMvibeCfp3qLZYYQ6xnxlH2NFVKkZpj+YC3HPYb9Lk3YNeRSp3?=
 =?us-ascii?Q?9Lq8QqHKTe91MKWBTkKfTY9lB3sv/QMt3ko8KJJx/zQqkRKUJBh4p4EVAMhD?=
 =?us-ascii?Q?oCe1u1HnvgNjymBYNJ1/+Zw0/KOx06AefUJbSVarK092NOkSOEGEQxuJeHys?=
 =?us-ascii?Q?pykHZZwraLzvQa4/6mWWzka/pjpQcXv/Bjf3ny38buFELV38QHe4TySZctNW?=
 =?us-ascii?Q?gtN/jh497qJz9purqk7p54pIWhbsdeFwoXCWz+ept7CjsLnTMywvlqOx0YLu?=
 =?us-ascii?Q?2yf6HjoLvRHNAAWpXLmUF9BpFlhxUDRLIoqvAwBNB94xBnHx7Olr3rAnJ23A?=
 =?us-ascii?Q?oqA+kvUP9ySvVbt4C1NuZxZFhLS14QLjs3+21siVGeTZ+FrUFYRNR9sP6DQT?=
 =?us-ascii?Q?aYawc+2MJR1rV2H61ulq5y/5D+cMaTinuuCf33RpRHf9uEmyLndYQrBiMVFj?=
 =?us-ascii?Q?BYs0+EjE1UD8zC5q2TiuttxGWLgdTUlojRD9kdnJYyyKf/ETYChdhromgid8?=
 =?us-ascii?Q?3RbVArJZFJ62doMc0pqJQ1z9zSGO9JQpghz59h+vCroWmHNSiJGxwrtX7i67?=
 =?us-ascii?Q?Z+jTNG29ZkcRlR/ivSpVSJ3XhnJVv7lCa44BeCU/jADwByRAqUV8YWPK9NPp?=
 =?us-ascii?Q?vRubYVr00bcMVQiiCXmfFmBQxv5rz9liojAiBfgM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b4657b-8522-4bc1-ef09-08de128c998d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 23:33:41.5697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MoXSWrdz1rRoOf0wDXEd4JKJkuIewJR+nls5qVfKMtXSLJh/34fo5uB6et+klX9Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5943
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

Instead of hooking the general ioctl op, have the core code directly
decode VFIO_DEVICE_GET_REGION_INFO and call an op just for it.

This is intended to allow mechanical changes to the drivers to pull their
VFIO_DEVICE_GET_REGION_INFO int oa function. Later patches will improve
the function signature to consolidate more code.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 9 ++++++---
 drivers/vfio/vfio_main.c         | 7 +++++++
 include/linux/vfio.h             | 2 ++
 include/linux/vfio_pci_core.h    | 2 ++
 4 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 7dcf5439dedc9d..1dc350003f075c 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -996,9 +996,11 @@ static int vfio_pci_ioctl_get_info(struct vfio_pci_core_device *vdev,
 	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
 }
 
-static int vfio_pci_ioctl_get_region_info(struct vfio_pci_core_device *vdev,
-					  struct vfio_region_info __user *arg)
+int vfio_pci_ioctl_get_region_info(struct vfio_device *core_vdev,
+				   struct vfio_region_info __user *arg)
 {
+	struct vfio_pci_core_device *vdev =
+		container_of(core_vdev, struct vfio_pci_core_device, vdev);
 	unsigned long minsz = offsetofend(struct vfio_region_info, offset);
 	struct pci_dev *pdev = vdev->pdev;
 	struct vfio_region_info info;
@@ -1132,6 +1134,7 @@ static int vfio_pci_ioctl_get_region_info(struct vfio_pci_core_device *vdev,
 
 	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
 }
+EXPORT_SYMBOL_GPL(vfio_pci_ioctl_get_region_info);
 
 static int vfio_pci_ioctl_get_irq_info(struct vfio_pci_core_device *vdev,
 				       struct vfio_irq_info __user *arg)
@@ -1458,7 +1461,7 @@ long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
 	case VFIO_DEVICE_GET_PCI_HOT_RESET_INFO:
 		return vfio_pci_ioctl_get_pci_hot_reset_info(vdev, uarg);
 	case VFIO_DEVICE_GET_REGION_INFO:
-		return vfio_pci_ioctl_get_region_info(vdev, uarg);
+		return vfio_pci_ioctl_get_region_info(core_vdev, uarg);
 	case VFIO_DEVICE_IOEVENTFD:
 		return vfio_pci_ioctl_ioeventfd(vdev, uarg);
 	case VFIO_DEVICE_PCI_HOT_RESET:
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 38c8e9350a60ec..a390163ce706c4 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1296,7 +1296,14 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
 		ret = vfio_ioctl_device_feature(device, uptr);
 		break;
 
+	case VFIO_DEVICE_GET_REGION_INFO:
+		if (!device->ops->get_region_info)
+			goto ioctl_fallback;
+		ret = device->ops->get_region_info(device, uptr);
+		break;
+
 	default:
+ioctl_fallback:
 		if (unlikely(!device->ops->ioctl))
 			ret = -EINVAL;
 		else
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index eb563f538dee51..be5fcf8432e8d5 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -132,6 +132,8 @@ struct vfio_device_ops {
 			 size_t count, loff_t *size);
 	long	(*ioctl)(struct vfio_device *vdev, unsigned int cmd,
 			 unsigned long arg);
+	int	(*get_region_info)(struct vfio_device *vdev,
+				   struct vfio_region_info __user *arg);
 	int	(*mmap)(struct vfio_device *vdev, struct vm_area_struct *vma);
 	void	(*request)(struct vfio_device *vdev, unsigned int count);
 	int	(*match)(struct vfio_device *vdev, char *buf);
diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
index f541044e42a2ad..160bc2e31ece75 100644
--- a/include/linux/vfio_pci_core.h
+++ b/include/linux/vfio_pci_core.h
@@ -115,6 +115,8 @@ long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
 		unsigned long arg);
 int vfio_pci_core_ioctl_feature(struct vfio_device *device, u32 flags,
 				void __user *arg, size_t argsz);
+int vfio_pci_ioctl_get_region_info(struct vfio_device *core_vdev,
+				   struct vfio_region_info __user *arg);
 ssize_t vfio_pci_core_read(struct vfio_device *core_vdev, char __user *buf,
 		size_t count, loff_t *ppos);
 ssize_t vfio_pci_core_write(struct vfio_device *core_vdev, const char __user *buf,
-- 
2.43.0

