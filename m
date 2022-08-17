Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FED5973D5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 18:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8735599A9E;
	Wed, 17 Aug 2022 16:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761DD999DE
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 16:11:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9RM6OPkIrv/QrUlQ16WasNKIbSAh0EdO4CzobJKJ7GhZf+4TOD3VKf/S8NlL/lROtaXe+F7PCxln7Aq1g7cwUNoHjKOnO92Ts/06z8AkRo5c8XZQ4JXbK3aBTxOv/+Ynqp7b9wvNBk1vbXsrKA9/7BKcc0ny+14SuyaXamz53jMGr5d/siZIz/49IphPIrEIK8zJ296OY2gOKQ7RFK7zx1ikXREkpF9lN+bJ/J0nxlbZwU2yhiTPdwd54urb/l2rS7FeeBcmOsJ89BM/zCSqgjDY1OsDYoCk13HO1E5oYSLazj1fQoDHZ1s5rY32mIkgJOcQxeNl67I6fMnHNAZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZc4Za0nuGWHAVHcE6SCuKfrxwZpP9evnPTLOJU+Luw=;
 b=QNPRvfGlXqVEJtuIHIMa+AS05UfTUyw4+rnBqgmguZQWu1Ic008xBSFbftuCy2OyaWSCbjeiOoXzRygA23ROxf/bFCGLY0zj0RL3lkD/XungOOZnb9EXbJzEa+RFSlw07pQXaeZ8+qkyw9PHa0pzuF+KTVGG+AWCuxPbNi5IuvPdzUtwKMZ+4oWxMpDNGO0jWJzmDDy3Stlqr/WvBz+NXQUKRCfccIkQcuUVh8z1VDOAbx955csMJWbz4HuEeDR1RUV6wccbII1emWrmh5mAyNuOwdr3yTbpKFp8VaY2LQ1WH/XaLa8JNTUy8bIcbKvdGbPyzD3zyLFZcbcilM1iew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZc4Za0nuGWHAVHcE6SCuKfrxwZpP9evnPTLOJU+Luw=;
 b=a0OohiVI3Gaxg5KnG9R7DzAA+KH45JGjx6XEMMadS/+6n0cYlW0c1E+T1mFhJZUoBcSjjif9R3JJlRfmqatfv/c3Dku/hTmxxZoMPAzXgMSo9aebVDZqUtZ1ALZwv8zWNFkhrElbcAiF15PIb+RUAK1x44EYQsBmF6g33t+u4ENogI9ZoTU17zLG0/J//GlK97KcNCse2ZdrcAyjg7FWkbLu+m30aEuQ9i0nqlYuNDYzO3vsvTvNKpewGOtna6AvcoxoRIxD0pipkJZdobLhxfoc5Lg+zXss13ImAKOSswHephkcY4umbTDje6OV5YvsmJjGlnqlNN7mtfcy/M2Opw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CO6PR12MB5458.namprd12.prod.outlook.com (2603:10b6:5:35b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 16:11:46 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5%6]) with mapi id 15.20.5525.019; Wed, 17 Aug 2022
 16:11:46 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, dri-devel@lists.freedesktop.org,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH 3/4] vfio_pci: Do not open code pci_try_reset_function()
Date: Wed, 17 Aug 2022 13:11:41 -0300
Message-Id: <3-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
In-Reply-To: <0-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:c0::28) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c840418f-65a4-4bb9-c9ee-08da806b2e0e
X-MS-TrafficTypeDiagnostic: CO6PR12MB5458:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MGJai6iVF8uRmcJsW3tR78xg9wKhA800BummeGj4Q/6422OpsKb4nkycKMHXLys2TEBzQsU4NNVJyFwPAjyqGuMUf2tGRmLkoyx8HyUuoLw5KBQt0NxThOy7mp16zLocAUOTAwcfS5ReyJzqXlTqnLa4MQXx1gCwMIy9nstrde7mfPgs6xHPZuHMFSHIeER2UvTTYIw2urXlKus3a2/yLTzfoDj/k4BB02tY6TtS9kLbMcV5wXlC8jJcdHz4F3+4picvfwndtZHW1tQKZqaQ7lGWGdfQK1uawhAbMsaOD6ZkZTzwc7ZhG3xTq6/Emq7WGjSXzK9GkU5gb9l6kght4+1QQJBhI4LeY7eWD/aDEtxc9PSvlAQ858WHd8KLn7Rxzss2MvPiikg4XtSEss3CS12VuOTsr/Jhffl3qqt5hu8+At11Bukq1AmsQsEBuAtdxwp3/ItEXjr1UTpfnkfclw37LJhOu0rh9Th9yO9hjWHVMElkq5xncFBdN489rZrLTX3OO3AYFXlBLmUlB/som1i859+NdqMIsAIVVm9EbkaDHV3eh/Z5/+mBWVQuZ72UVaZi0sYkCiYMsO4Kev6eKDtfn9ENTwN6j+GlDkmOoahC7IGSptcLHFOHRyGnG4eRshLx3bYkJpuoCIwuCEVq+3uveOayr91jcIq+96sgHnJHUwtE1L6wV2xTR7dkvUfyz/qwn5EY20K1mDoCpZjdvkEKLT06aqtV174SinCNz6Vxz9ncJtye9OV8tJVgJHA85AEDOt6X6lO+ll75rsj71fn775QSckM/CsRPRkcL/nQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(26005)(316002)(41300700001)(2616005)(7416002)(6666004)(6512007)(2906002)(66476007)(66946007)(8676002)(4326008)(38100700002)(66556008)(186003)(5660300002)(478600001)(54906003)(83380400001)(8936002)(110136005)(86362001)(36756003)(6486002)(6506007)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cVJkfEkC92Q4s/p9PXi5PSAoZtLot9zPCDUCjKMWu/9cpvwIX4eJNSwETSJO?=
 =?us-ascii?Q?+bMBJX306Q4nH0SM3kBeQmunDcFyVx5VXRa4yirYHTx2xmpJCwL+6PMhGsPv?=
 =?us-ascii?Q?SMA658nYOoYqREfvVtJMd3oU8J5NwuuH50vqT4HuKJZb4FXxA1VyfVvrRDLp?=
 =?us-ascii?Q?YrcE0pPt74egTcBp1w0lx3jXaaX07eBRGE2krAM0FaYKIs4/vQZKFdLPo77y?=
 =?us-ascii?Q?xk9Xl2sFFa4uSDqPcfFWTLbDCRz4M5s9vVMzKvzFNsmBsckVGV7yWoPyY9p2?=
 =?us-ascii?Q?z1tWqMWOpkj0SndfoH+ivAGSkygpJYbcFBasVctEK6ubhDXEfAXpxQQ/YGJQ?=
 =?us-ascii?Q?RkEB5zjWp74BxSUdA0CWoLctNwrZr46kjbGg9u7BQHZWlx1WpIrfAKD5m2k5?=
 =?us-ascii?Q?HtHO2nFIFoxDL6YnTo000VNqgTToucjbN5/5NFSmCtNvxjE02TH/YK7KXnOl?=
 =?us-ascii?Q?2AoJIMibj7IGy85WVAa0b4Fei2IVnYzmHi4LhnL595j5VzIF9ot0cV1BuZeu?=
 =?us-ascii?Q?kdMN85V4dfm1RlCrecl1xPjUr4x0uL3oZ8vr25xraqIQHcR31NhQ2VZvFIyK?=
 =?us-ascii?Q?8LBdkFgQ/qxPHGo49/nbGTFGeKe9LTOUmvKqkbJ7YZc3irp4vougxR1sucdN?=
 =?us-ascii?Q?h2jIR1Y6sOLE0ICkJ+2yRDscMKf20aMy2/YKed1Q87ThAFlgLwRnQy3yrIl4?=
 =?us-ascii?Q?Ei387sgEgzLoEgun5chzH9MmJ0OeLbIp/HAvBKOIczFiEQu3O978zvyL+8g2?=
 =?us-ascii?Q?iQ1K1outYGxn2qiLzd1GJvdpSw5PHfj531+IIblXqgSqRRkdCMv29cOFQmSN?=
 =?us-ascii?Q?NYZBbN+cBA05wDFt4GkHGfKTEaT/hlhOQSoMwji3V/BVa+zoQIWqLAlLvYsm?=
 =?us-ascii?Q?AFkGNQdT3qVnAiyfZMhnt4Age7n9t5ZmHSm6vwyD/3T9rdFS6qvlhSmhHtlG?=
 =?us-ascii?Q?pqafyuGC53CpbWQdvQE6NLrnAhedVv9OZDvm0dF6eQ6RwSra05H8j9ftZgkp?=
 =?us-ascii?Q?aMZ5rNnICb5GDVbSSUsiC/Bm6ZoKQyvTGW1j3tpKb1p4tpFBL8DbjKRLvJ7c?=
 =?us-ascii?Q?EiKl0gYPqBoxbzBR/wpQALksQIa02urIzYzQERMd9sycU0kSSh2M9vrhL5ly?=
 =?us-ascii?Q?LEQOaDveto0S0H1c5/Jfin9UHzp8jd1xnG3RqEotvqZmyz8vWDCcQ1TdS32f?=
 =?us-ascii?Q?2crl7y7QNcmxZicZb+s5Db5eYhp62bxcIw1mVCcPLLxXbjeJkdSjs+vwim1G?=
 =?us-ascii?Q?3Yp3MG/DFQMm19g+wOBM7jRYK9u/mSe//hKAl73DhhoTsFMKfbzCyKPka+Is?=
 =?us-ascii?Q?D/AAXxZLyq0DA8y9hX7GPrHj95j0rB2GYlCs6E52n6Ta0ck/9nBASbdDr8Pr?=
 =?us-ascii?Q?dCn18HEWLZW1xmR/PJ88XtN5CudICvQB6j9R3PmPFb7PjM7E+f3+WU1dXf5B?=
 =?us-ascii?Q?G6sHwpEQnTJxXmB9tZQ0xIPekeQSdifbFTYIsT/ZdyQnNy+UycR2YqVyckY9?=
 =?us-ascii?Q?3MSvd3InfYp5AVJpF2FmcBzyQA8c2rqzGlsSQSyBmbqzA7CZ/5Gk0zZokrxJ?=
 =?us-ascii?Q?/V09j8EFEqtD9V1VF1rNDksJWzqSsOwKU9hf1D+Y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c840418f-65a4-4bb9-c9ee-08da806b2e0e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 16:11:44.9860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jTajYxvSwR2fBpRrIfY49hJLcQCBwUvj5DBO6CTj/+8qbD0x0Ob/Ar4WAPSRxX3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5458
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Oded Gabbay <ogabbay@kernel.org>, Maor Gottlieb <maorg@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

FLR triggered by an emulated config space write should not behave
differently from a FLR triggered by VFIO_DEVICE_RESET, currently the
config space path misses the power management.

Consolidate all the call sites to invoke a single function.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/pci/vfio_pci_config.c | 14 ++++----------
 drivers/vfio/pci/vfio_pci_core.c   |  5 ++---
 drivers/vfio/pci/vfio_pci_priv.h   |  1 +
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
index 4a350421c5f62a..d22921efa25987 100644
--- a/drivers/vfio/pci/vfio_pci_config.c
+++ b/drivers/vfio/pci/vfio_pci_config.c
@@ -893,11 +893,8 @@ static int vfio_exp_config_write(struct vfio_pci_core_device *vdev, int pos,
 						 pos - offset + PCI_EXP_DEVCAP,
 						 &cap);
 
-		if (!ret && (cap & PCI_EXP_DEVCAP_FLR)) {
-			vfio_pci_zap_and_down_write_memory_lock(vdev);
-			pci_try_reset_function(vdev->pdev);
-			up_write(&vdev->memory_lock);
-		}
+		if (!ret && (cap & PCI_EXP_DEVCAP_FLR))
+			vfio_pci_try_reset_function(vdev);
 	}
 
 	/*
@@ -975,11 +972,8 @@ static int vfio_af_config_write(struct vfio_pci_core_device *vdev, int pos,
 						pos - offset + PCI_AF_CAP,
 						&cap);
 
-		if (!ret && (cap & PCI_AF_CAP_FLR) && (cap & PCI_AF_CAP_TP)) {
-			vfio_pci_zap_and_down_write_memory_lock(vdev);
-			pci_try_reset_function(vdev->pdev);
-			up_write(&vdev->memory_lock);
-		}
+		if (!ret && (cap & PCI_AF_CAP_FLR) && (cap & PCI_AF_CAP_TP))
+			vfio_pci_try_reset_function(vdev);
 	}
 
 	return count;
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 050b9d4b8c290c..d13e22021860cc 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -960,8 +960,7 @@ static int vfio_pci_ioctl_set_irqs(struct vfio_pci_core_device *vdev,
 	return ret;
 }
 
-static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
-				void __user *arg)
+int vfio_pci_try_reset_function(struct vfio_pci_core_device *vdev)
 {
 	int ret;
 
@@ -1202,7 +1201,7 @@ long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
 	case VFIO_DEVICE_PCI_HOT_RESET:
 		return vfio_pci_ioctl_pci_hot_reset(vdev, uarg);
 	case VFIO_DEVICE_RESET:
-		return vfio_pci_ioctl_reset(vdev, uarg);
+		return vfio_pci_try_reset_function(vdev);
 	case VFIO_DEVICE_SET_IRQS:
 		return vfio_pci_ioctl_set_irqs(vdev, uarg);
 	default:
diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
index 58b8d34c162cd6..5b1cb9a9838442 100644
--- a/drivers/vfio/pci/vfio_pci_priv.h
+++ b/drivers/vfio/pci/vfio_pci_priv.h
@@ -60,6 +60,7 @@ void vfio_config_free(struct vfio_pci_core_device *vdev);
 int vfio_pci_set_power_state(struct vfio_pci_core_device *vdev,
 			     pci_power_t state);
 
+int vfio_pci_try_reset_function(struct vfio_pci_core_device *vdev);
 bool __vfio_pci_memory_enabled(struct vfio_pci_core_device *vdev);
 void vfio_pci_zap_and_down_write_memory_lock(struct vfio_pci_core_device *vdev);
 u16 vfio_pci_memory_lock_and_enable(struct vfio_pci_core_device *vdev);
-- 
2.37.2

