Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B09C4117F
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 18:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B1010EB4B;
	Fri,  7 Nov 2025 17:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pF8sf1lO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010002.outbound.protection.outlook.com
 [40.93.198.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9547C10EB40;
 Fri,  7 Nov 2025 17:41:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQn6DVqvkZQpoaOKRJxeQJfpOLR+PAU9MgS6+vWyzZxQXG0ksZw7F6VQHniGRrEGkF47I9434Hk8tk1XLu5zbGdGv4Qoxux2lP22ivWdUf6DncseYd7kABye+pEkF+9d6L7d0uOynlMDL2vE/akKJ2Oful/Lmj1YIMD+VYKJKlnn2mK4nd85Lme42zxmo+I62VvnxA+04yRKM/BK73SaKdfb8UX48hWhdLAoO4TZF1qdgaRnDW0jkepOF6NLf+wx44keJKrnzHI9552ZqYgxsum+lrL7HbCk9LdnGVWDNhPOsIYXtlUnGzvsC2/gxXkLXmaZfZihXU2DUjYiC4J+wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTf9X4ira0yZmFfUx2OlBANxJwSlwrBFhKGp8/cRbC4=;
 b=V0XiSPUTFZGkDI+yRj/cIKpAp1u9cae+SUhp6eNsnCfvrkIhOi9pqRwdvuQv5dIE3spykSzFTI9mMI6mkCu47XaXtokZTf/4/Zaziojx28pjmnTg7t70FCTbsu22alUFTH4Cuj88UylFSjjrBe0scka6z8jbEADF4MnU18yky3v74PVtoj7zyrN+DtbkHBXjgEmMdnFkt00D4MO6Gs7Qlpt6mqwA9d9xfn39lHzz4TjCbUu9QeIyjiaWNciexm4EQH88GWhIc3o59+FwjeQMcVo8ZxyJ/5vkhhtI6jqTFQE8Jj6ASvx6/dSjsOVM4+7wVJympa++HkUnE2gzuPq/dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTf9X4ira0yZmFfUx2OlBANxJwSlwrBFhKGp8/cRbC4=;
 b=pF8sf1lO31GwWwU1dylYttfEqawj/is9CHN0kYTQ0jS9/PBEbGB8XcsgY8wrneBSwroit0rxvMgNCN1Hjkf26uqk4DOW9DdT5gKGDd8G19uj6ydIri2YQ1BqyC5Xxq2+HFeiKK7+MKU6ROQ1wTs7JxtPppqLn5I0R2GANyBaKQvEpJdUoolYoduurhXzm83tryC8PplUYQ8RE3SBoZfj09ChhhFR4J4crrIfTwRxN378KNePrcygtkwp4KhXpxmsD8Qm+jzUqULCkpfs+JM6gcTdL94Y2XWVoaf6jjePZRuq6vD1O4AgD8/etjJjcr0cDfG+xwqR8vnuCTAAGmgUwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by MW6PR12MB8833.namprd12.prod.outlook.com (2603:10b6:303:23f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 7 Nov
 2025 17:41:47 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Fri, 7 Nov 2025
 17:41:47 +0000
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
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, qat-linux@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 virtualization@lists.linux.dev, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>
Cc: Kevin Tian <kevin.tian@intel.com>, patches@lists.linux.dev,
 Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>
Subject: [PATCH v2 02/22] vfio/hisi: Convert to the get_region_info op
Date: Fri,  7 Nov 2025 13:41:18 -0400
Message-ID: <2-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL6PEPF00013DFE.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:20) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|MW6PR12MB8833:EE_
X-MS-Office365-Filtering-Correlation-Id: 3362c7e2-a631-4eda-d590-08de1e24ea08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oyOXEXjLPDOBQgUk6izn4nysSCnFbnUDX5oHkiWdVlE10WYdQ2oWihnyl+F8?=
 =?us-ascii?Q?gIjLaK0AHZ0NqF+B+7ZAMscWQOhMV+LKOAZtG0DDRQuXwnOIytM1BuRF1X7e?=
 =?us-ascii?Q?Nb1esZ3M7c16RsEKaOIRkfZYirD1J7zFb28UDrDyVHtGRH1//mOh7oRdwJ2M?=
 =?us-ascii?Q?Ty/5z5FprA1cuwKIPVQ2l9s3jXINTDFWhT0I07f7cpS9rI+1jwZ5cjchXJ92?=
 =?us-ascii?Q?dVGL7Oczde2a0Ms1AEHRoc+oWvSS31MglYg7hi3x3Ggt1CqiA++kcnFLCR2d?=
 =?us-ascii?Q?9PxVknAIef+6V3vdJleYjr9DerbvrFC/dV3US8NSoOGjXIf04OVJpyTAV/K4?=
 =?us-ascii?Q?ky9NokuLNfQ96aGCvxjUU32+zk0yBHIo/EDpcBzA6ec8qRx9tNk5kltcT38u?=
 =?us-ascii?Q?meKxsAEBjpKmnRV5RV+aqYanR4oL07v+LHMNGLpF1YoM1SB3Mm827BYEQJtu?=
 =?us-ascii?Q?kIttxOv5w5pSvU6TpHEUqJORIJVI26iGcYDYHBiN5QHJY/0F9je1n6zdmBO9?=
 =?us-ascii?Q?3fW27LsH8eY49HvnZ3iakXGO4NSSxEzBw8QTeVeArlP9dwbIb3gEd6fG1fyV?=
 =?us-ascii?Q?nXqnT0W6KKPTfsjhFujQLWTVfGHNIWJjWaOcW4eyadk6ZHMy5Q4EAw4MwaIU?=
 =?us-ascii?Q?N5HeQaFcSuQoMsmJbn7B6rly5HxIqS4vXf2xUyMq8cw68rHwmMnAVLRYeoak?=
 =?us-ascii?Q?tyREqjXUo3Qc1E1K6ytKg9OfVJIP9ECZtmlF6pwZLudVRT+3u44V5RZrsddX?=
 =?us-ascii?Q?htq1IHaStlRW4/8JOQhWnEmWaMagAZBVE13KhuVf2M2js5ulsx+zBS4JP0Kx?=
 =?us-ascii?Q?dIL5DrrI50UibkCYTakzamoCe1jbxIQ2Bizt2aY+LYHp57T4PGsxlAhCgLHh?=
 =?us-ascii?Q?wy0jiYtoBc0GJaS9Tp6F0uAbIfDLdWcJLQ5/WWKXj47PPXFf6772/9E6nAaP?=
 =?us-ascii?Q?tHpJIivpR7W9Iis49Q5vL1/0YXmFQx8oTSrF0kOrhN9zps7PKSsqwLVTPa5x?=
 =?us-ascii?Q?YFyWOxzcUhlpGpsDUHriSebLQu++RPItrBO2SGPGDsxhrzhGwrhwY3N4Ytsc?=
 =?us-ascii?Q?9jv+YzdANL7dlJRL3UXZvIEEgdMnsTlsmLp23KISDLDjhzczUWPo44x+v1cm?=
 =?us-ascii?Q?igY47BQgFVCcms1p2PJN0toMoLc7unCqr7foibynOuieW0k4CURTQAe9sG9o?=
 =?us-ascii?Q?0bqcSoQHV95AkpdF3yEToKQvzl9zREa+Xmy8qqtq1Lll41otbTU3J1DaA30V?=
 =?us-ascii?Q?LERdoyvcV7Nb2w7+UCBYUi7oOry7Jk8i4v9TwivLik25I3HzgmuNkF0ndz5x?=
 =?us-ascii?Q?Mg57eCUXsUpIgrDd6iRR4aARVmHWWK7k6vVmEFLOb13YXesUQXRjw3SmfcZF?=
 =?us-ascii?Q?25S1qFbgGw8htg0OWiliPRjFn07LYpgf9cVxcucwKcwbFCuusb3xQFAiGk3f?=
 =?us-ascii?Q?B+voGRyPpKPYonDuWxix4HFc4Tdv7sI/i1QRsM/MhRMOmU2F3MnUERQkJePj?=
 =?us-ascii?Q?DcIuqmOwJMofdmM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9daWU+FWFEkyJIfSCNp5di0JFVhjQ02YjIpxUNSU43MEfePUnirKicPiCTaL?=
 =?us-ascii?Q?2jPREriiTGPpg/BBgNwNjcDxpqvAiJsxZd5iFJ/06RjTKfiqJ6Ygn+F0cp+C?=
 =?us-ascii?Q?lrWpSp2+unGAakU9z6zX1RMrlATVBYJQXsUhRWCGn1HS9UXh507yz5h0mW0S?=
 =?us-ascii?Q?eUSyGx2fepuorGIwST4ch6oDcTKMFUTgrKTz0pHfJai9RkNp06gD0xXo8GEV?=
 =?us-ascii?Q?TwXDv1AwqAHEPkf51xX3o6djyGjfxluIg5gfI0qBilXdu6a3MbXGHlhwOCIt?=
 =?us-ascii?Q?ZZxLLd1mHcRA24AJogbmRiiw+j8gEKV5hmL6pYcz9DPN7nZk9FFIdObp8ROu?=
 =?us-ascii?Q?ki8nPzZKu/XU4vqePrqbdPLvyOX8PVvdJc8rkTle8dQkCl2coYdrl2h8swL0?=
 =?us-ascii?Q?X/wPXHpPGl9olabd/AXBVIkaxn3k7Vr30KN6MLeLUuthrzl64gxaYzl9EGpu?=
 =?us-ascii?Q?rLH0Hr/8ZXjpFpTe3HSnmUi/WMAuv3L1k4ReQDBD+Xg/wNg9+xQOoDw6l9WQ?=
 =?us-ascii?Q?C68cOxJjYpj2sBvKcZr/iJDWQnxLu9CgE2p0uYZY1cFqQj5rcP/dsTXsD0KJ?=
 =?us-ascii?Q?5K2iripyeJd/n2vODap0af4ATAA8iot81rn37Bjtrt5XnsIcyu38Z1odkDIq?=
 =?us-ascii?Q?KA6Kax+Lo3wORWhhTovvM3zqOSx22qpJek82+DuzKADT70jHiHUIjaisO6zO?=
 =?us-ascii?Q?VDyPbjS85ZxAFWCsHwf3wiPhY40WnBtOTes9pGWBEAP9Z9Va6F4fZBSqLmD0?=
 =?us-ascii?Q?J7EO4RSNcvD64u//yiaugPjmz+WX9MtnBNo8timmvdmCWdZ1DCfE5XGxywoJ?=
 =?us-ascii?Q?ySVDMtD4zlKYrFDXxCiGzTvY8HlmFsKuYGW/sTlgBTXewZT2pLr0wTVPKWE3?=
 =?us-ascii?Q?slA6hjOlUd8qtDnQjSW6CW+wDKC1JOWESuewXX05ObawZbQRDOeu9NBoXQ4g?=
 =?us-ascii?Q?dp4YxVlGmaEZ7vvJOlcajcV9PLUAKYJ0bx1hpE59pNyBIC4OsgS1KTnj40TY?=
 =?us-ascii?Q?6pfL1o01MRUVIeu0MkbhauY4dgbSoCUSPouxMEBzJ4BLeiz2qRjlIfIevwHB?=
 =?us-ascii?Q?BRzj23kGJ2Up0D0woTHDcp146ozoFWE9PIa2+SFXaSP8Vt8FGz2jKXb6cKy6?=
 =?us-ascii?Q?8PeXJSj8umB0T5ucrDTDV94m88yX61bqwIl6nx4aUysTbbgEOzbH8cKYl9AB?=
 =?us-ascii?Q?KqZGl4bwvVs0b6cGTcXp9PvnoxY45vb/QPHwpWUkvcQQov2nbmL+S7qsUqcZ?=
 =?us-ascii?Q?EfrunWXx8mo+H0Kq/uX/LeBM36OF/QFijcDQ/TCTWbdOqZDz1pPQP9G8777I?=
 =?us-ascii?Q?+rtsnWy+kM4sRLA7tlLcvgwRxkOTv5x3HywPmJ3RZprqnZZD17/iPpPIyigc?=
 =?us-ascii?Q?OvIR03+bWlThZbwTzcOM2Auz36H+uWjg5X6sP1LS/ro2Cd7DvrA9nG+w0unr?=
 =?us-ascii?Q?gpM0gEgiTiV8SWpqYQdb8YntfZ4Mt1tQ+nRB1TRx1Y7fK7/KVUHWiRQDdeDC?=
 =?us-ascii?Q?FxWh+FDVbNiCFnwIhXbIRmBiZXe2KLsL3sgVTwfVS+Bv8WbnU7bDmlWxKlBz?=
 =?us-ascii?Q?8PuiiYoLnkd8fi9GE1s=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3362c7e2-a631-4eda-d590-08de1e24ea08
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 17:41:42.8785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gZ/GbmrPTNGijwIqp7ikx5aG5WC9aRzyUNsdgoCoNZ9Ehta527NLCtr3qcbnjbqv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8833
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

Change the function signature of hisi_acc_vfio_pci_ioctl()
and re-indent it.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Acked-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    | 57 +++++++++----------
 1 file changed, 27 insertions(+), 30 deletions(-)

diff --git a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
index fde33f54e99ec5..899db4d742a010 100644
--- a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
+++ b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
@@ -1324,43 +1324,39 @@ static ssize_t hisi_acc_vfio_pci_read(struct vfio_device *core_vdev,
 	return vfio_pci_core_read(core_vdev, buf, new_count, ppos);
 }
 
-static long hisi_acc_vfio_pci_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
-				    unsigned long arg)
+static int hisi_acc_vfio_ioctl_get_region(struct vfio_device *core_vdev,
+					  struct vfio_region_info __user *arg)
 {
-	if (cmd == VFIO_DEVICE_GET_REGION_INFO) {
-		struct vfio_pci_core_device *vdev =
-			container_of(core_vdev, struct vfio_pci_core_device, vdev);
-		struct pci_dev *pdev = vdev->pdev;
-		struct vfio_region_info info;
-		unsigned long minsz;
+	struct vfio_pci_core_device *vdev =
+		container_of(core_vdev, struct vfio_pci_core_device, vdev);
+	struct pci_dev *pdev = vdev->pdev;
+	struct vfio_region_info info;
+	unsigned long minsz;
 
-		minsz = offsetofend(struct vfio_region_info, offset);
+	minsz = offsetofend(struct vfio_region_info, offset);
 
-		if (copy_from_user(&info, (void __user *)arg, minsz))
-			return -EFAULT;
+	if (copy_from_user(&info, arg, minsz))
+		return -EFAULT;
 
-		if (info.argsz < minsz)
-			return -EINVAL;
+	if (info.argsz < minsz)
+		return -EINVAL;
 
-		if (info.index == VFIO_PCI_BAR2_REGION_INDEX) {
-			info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
+	if (info.index != VFIO_PCI_BAR2_REGION_INDEX)
+		return vfio_pci_ioctl_get_region_info(core_vdev, arg);
 
-			/*
-			 * ACC VF dev BAR2 region consists of both functional
-			 * register space and migration control register space.
-			 * Report only the functional region to Guest.
-			 */
-			info.size = pci_resource_len(pdev, info.index) / 2;
+	info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
 
-			info.flags = VFIO_REGION_INFO_FLAG_READ |
-					VFIO_REGION_INFO_FLAG_WRITE |
-					VFIO_REGION_INFO_FLAG_MMAP;
+	/*
+	 * ACC VF dev BAR2 region consists of both functional
+	 * register space and migration control register space.
+	 * Report only the functional region to Guest.
+	 */
+	info.size = pci_resource_len(pdev, info.index) / 2;
 
-			return copy_to_user((void __user *)arg, &info, minsz) ?
-					    -EFAULT : 0;
-		}
-	}
-	return vfio_pci_core_ioctl(core_vdev, cmd, arg);
+	info.flags = VFIO_REGION_INFO_FLAG_READ | VFIO_REGION_INFO_FLAG_WRITE |
+		     VFIO_REGION_INFO_FLAG_MMAP;
+
+	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
 }
 
 static int hisi_acc_vf_debug_check(struct seq_file *seq, struct vfio_device *vdev)
@@ -1557,7 +1553,8 @@ static const struct vfio_device_ops hisi_acc_vfio_pci_migrn_ops = {
 	.release = vfio_pci_core_release_dev,
 	.open_device = hisi_acc_vfio_pci_open_device,
 	.close_device = hisi_acc_vfio_pci_close_device,
-	.ioctl = hisi_acc_vfio_pci_ioctl,
+	.ioctl = vfio_pci_core_ioctl,
+	.get_region_info = hisi_acc_vfio_ioctl_get_region,
 	.device_feature = vfio_pci_core_ioctl_feature,
 	.read = hisi_acc_vfio_pci_read,
 	.write = hisi_acc_vfio_pci_write,
-- 
2.43.0

