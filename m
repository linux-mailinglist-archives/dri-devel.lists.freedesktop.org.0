Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B54C41155
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 18:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5E110EB3B;
	Fri,  7 Nov 2025 17:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BN1gOcfO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010022.outbound.protection.outlook.com
 [52.101.193.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448F110EB2F;
 Fri,  7 Nov 2025 17:41:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYuxTtnTp6ZdD5zVJ+PGjCF6UKn2cdOtzptxfyUuDLtstF1vicFUfRVxk179zrj6IOjiGC1bOHwSvcCvr/t029C85NvfLyRPb+uLyMo8kRojHD7flBM0TLciZoxB/IRL2o/fcm8u6Hq04Q1tNjexmM8apIEiTh1Ffhhagz98dRzgkWaihoOLRzIYSOo8GaUhfXHEY45DDnaVBx0gvU1AyTvj6OcTQQCnIYU2Fl+uR0PV/ft86xkTRYVItGRSE3YMTchAClQBPWYt0C+LWuJWdEQJsHUdkIu8CMSFoWRvZj7NPYvOQx7tbeoRhGmrFfhuJymhQhgZpAFae6T2Qj+T6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUCItCx2B15OH+ccyxFa+SxNDeEs6Pr2DQHdppwA4VQ=;
 b=swZFUsncv1mAUHOn7XuD3aomNxia/G7QqCS052HDFvkMcQ9UtrfgR3kHpfJJiL36Pmce5uHt/NHD4C1ZX+sZiRgO1Xt/ILyKqvywpRq/8KqcEBwxGqShU4Rtw3XcLR1ReZkSKucNo3bceLgR99f50GQVtSY+uu/KPxQUj4JTT9nubv0NnUNaHIODqR5tNTJFbfIzUWPOOClvoL16qPp73jPqsb3oy+b9jSjf9luePGCPgzsHpo1CPHeFAkHMDAqMYgtuc6VNv4qoOWwDMDS/JssN3K7Kgc95j7KuHvxsCjCNxegWsrkQTRILLsVL337LFmcQgFsHQGI4u38uXhaTLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUCItCx2B15OH+ccyxFa+SxNDeEs6Pr2DQHdppwA4VQ=;
 b=BN1gOcfOoUpsSRNG573zBnKhn3BIwbWr5IXGMu+7QH6BslW4LSB2Rt9cgAac2UVqg92peRtW5WfhwPau0TCOLx8+UyNAQGfcNb+GJ8EIX87BUCOKd0jHWUIluZnq7cfS+W4zDTfWXaBUF1WIevgS/r1EaILsiQgfrvVchQJxYPx0TmGTCndKqNdsGSvzG2Oc7aKZfjxTU6fkWYp6STrcHzFknGEVDjoEmwfwtijsllp/m0MCL3/5o2JJUotNmSD+5M4sQnIIrMh1F0X+aAhfAvEObRyQbk6nAaHm3ugLf7B7Kr+sOauuhdr7RLZfrEMDjLvZgrUT8D8tb9gXgDO4XA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by PH7PR12MB8826.namprd12.prod.outlook.com (2603:10b6:510:26a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 17:41:45 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Fri, 7 Nov 2025
 17:41:44 +0000
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
Subject: [PATCH v2 04/22] vfio/nvgrace: Convert to the get_region_info op
Date: Fri,  7 Nov 2025 13:41:20 -0400
Message-ID: <4-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0344.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::19) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|PH7PR12MB8826:EE_
X-MS-Office365-Filtering-Correlation-Id: ba44768a-6dc2-4aed-b634-08de1e24e964
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v6G2a0ydGCmbRBBiD5OjBbcVGlql13/uLy5ZkLy+vJ8L4bIDzBB/DQEl4cDD?=
 =?us-ascii?Q?PZcKKJPt9YyeDoFNUyR1HnNPUjdaRt3DSSltfbMHmMxR48u7dPZA3n+MwqwE?=
 =?us-ascii?Q?XOWX1aNq9XnHzgf+1m8z/G36bop/2ZzcigRiCbFaLFXM850rFNFYrCM4K+J4?=
 =?us-ascii?Q?lV8EpqkszJDXbpcbmsAHt4zSC53bviTY3XcoEfC+O5ZB+K/Su9E5tsIN1cxD?=
 =?us-ascii?Q?WmUf2YbOqsxMxbYZY1Q4aRr3osYlHsS+JFo2Vnl62G09RyUBN6je2g/9+Dvb?=
 =?us-ascii?Q?uGOqWxM1vybIKYP8omUIxBjlWlmoHFdHohH3BG+JeYEmNGob1RoYiQNoKCdD?=
 =?us-ascii?Q?EkWinzziBKQQ/+8UaTvKaUpamqZx2plIsvP/NrGcTpOhM4q1fpdgEgwANvUs?=
 =?us-ascii?Q?x6Gc2pItT33m2jmYYQbiy6Zq4829eEaDDMT3h9oedRFDCqfycsWF8AORjXw/?=
 =?us-ascii?Q?rgtIDc9UM9ETsyaFFBlBhNTPrGwAFdkkt5gEa1shjiYFYhTbq9LXnOhH+SXT?=
 =?us-ascii?Q?5DtbCPYxl+m93fpi0ZPNmtE//MlYtzpX4SfjFyR598FUO6EwogfMoII48v5c?=
 =?us-ascii?Q?UDJ1mFRwsCRJN2ljmJQ4NmMp2jeQKFC/4hyymKc1/J38RJ5cZtaHay1i5CZO?=
 =?us-ascii?Q?sEkzYBe74WWLAkAd/9siEFcRYFvs6NZ46/VA6mPnWdaWj8r+s071EtCqF9GT?=
 =?us-ascii?Q?kXJ8EUpNj8XVqygTNeOPzAjLGSksJ1WOEKOZKTnBhFoTVhYeJ9ArUkUpo/99?=
 =?us-ascii?Q?xsAQL0xOIjiZkbf9cQpDmZWUgua7ZfwiSbSgNmv3xWepVIasz4djIbEpukos?=
 =?us-ascii?Q?gLKrsUg2SmEZfhMb9ZrvmNeedghfWeWLDtmpqmclfO8aa3leITyOiXN05RiF?=
 =?us-ascii?Q?Y7CflAm80GpAD7Od0dzfT/KqvDVg3G9JMrfxhpFFH6xqRSOShNwaEtzEcHio?=
 =?us-ascii?Q?8xW/9C8AlA+LhOy4WV41TKOK5CCBC3J72kBrxNeiMZ0HBECx3kk4AUzr9ptL?=
 =?us-ascii?Q?HNZVAfCMJyOO99W1WoJ3z0zFdbuo1umuTeoTltkNFsDQ0Wl1FWg01Cvn3i/8?=
 =?us-ascii?Q?u3iDJARIDeCasUjUWkgZ+BXltgIgZMMHTpPjhJyX4yUPhH7yeW4q+/oSiOoy?=
 =?us-ascii?Q?kIUjPRtqCImtbIy9wqpWD+fbj4DQIU0dCmoNhJ/OqCW0GQi61mTnAohWUq7T?=
 =?us-ascii?Q?2W1cftreZrjPkk1B/3MtPRb7tQDhZ9VmeiRaWcxZyDneJanEhpKRvEL/HzJ2?=
 =?us-ascii?Q?caHGObUjPvoWpjbeUltCrtZVEv+DpWHodaTf0ASeiK4owJqgDwUhEjhSyKvX?=
 =?us-ascii?Q?C27w5pJ/1owPR8pXCY+SJYMt4hOSVyrgsl8wJklonZTtfd7eOWPIXppcCyyX?=
 =?us-ascii?Q?xF0a+/+suUx2WUriQpQKU40QJRmlnKJSsUprQtCg1hfhh2RRYc8DV9BkdrYO?=
 =?us-ascii?Q?4pdKrk9qEM2ICxcT3kMURuJvXxFBzskO7vxXLn7J9Mrh/8Wo1ecWvuRfudDn?=
 =?us-ascii?Q?tLRZ4Dv2/qhz1ho=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WGLYGVd0ncwaznseflMGbzFz6WR62pd+49ZvdKJjTXUaeEvXAiRpcHSgrZLG?=
 =?us-ascii?Q?aGnYkgDzWjkiq2CfBZSCCqTkXbkzhaNY455/ePa2yrScnZZLrQVdiDzFUR2b?=
 =?us-ascii?Q?tS4PeYGj5Z9ZMeFKqOooVE6P9A0mBjgPjs/BYovi48TMFoteYBDa4A0pmtWA?=
 =?us-ascii?Q?BnTDLdkRi2jtoNo8KOFjzBwAXW5BYR+E2chhVaBu5kfLBFIy+RIv24F32Q2K?=
 =?us-ascii?Q?lwIwjHbrpybj4PHa1pcDL066xdiNrawcbcX5tF+XDOKIPNLc2CphUeMZjGBr?=
 =?us-ascii?Q?zeIEs+bmrddEV3wGjsRTIRpB8oz7FKcSOy8VN0sKUe+orYd9ixaWg8rNMifu?=
 =?us-ascii?Q?raPdx3+xoL4rXKqx3ZQMgbfiZNgpLMRl3OEfNIn6HrzC8y/8ZR5M62QXOhDK?=
 =?us-ascii?Q?XuzGY26lVCLqvdjhgR3aApe6q/6/lgm+HqlWokWwl+CixtoVVn/RW2yfmi2B?=
 =?us-ascii?Q?iR9eWTJYNUVQUqjSR5gDEm1YJvR8O9/sSwyEnAEJ4ZdH0SKP9+1+YzKf3gYF?=
 =?us-ascii?Q?TnUP4ySHvZQleUv2lIzxkeldLj+v/WtmwTJIrVU/icqoBKNw6UngmYXk75pY?=
 =?us-ascii?Q?AlIO3/Ha8dvanYBNvauGZJugIT5l7zyc3eZi7rEFzOojYu6L9M3IY2ZSropI?=
 =?us-ascii?Q?HyX/a7gyplCjkhXvTQVQHbbbzTqgxqVcQ/p/1bu35NLmUCqf6MenwNa9A08F?=
 =?us-ascii?Q?O9BJBD2Bpt2k6hSQkvGBUtGa+XtLkzc7lN4X6XxAgIGUPQbM6EgT5qBEw2Dz?=
 =?us-ascii?Q?87Ml4EqjzfErStqofxHSG37BuJVuSyxjD0g0rQBSoxdqG5sJX1ooIT/I9HAz?=
 =?us-ascii?Q?M4CKbRJqI/Fs5ucJe88BHsu8b8o6JggaR4RiS2O5xTSAo2e2tl5QCvaRT+d1?=
 =?us-ascii?Q?Y7519Feh86ToY1zVBopDBQ+zPmoVMHLdj9D7z0zBENzkZigIyf1QbH1J6sQ2?=
 =?us-ascii?Q?BMwQnZZvGN8XN5kB4D2RgBq9r4sIz63ujFxfJXhqvHRI+huryLeNDyhG2xqB?=
 =?us-ascii?Q?ZZVD+dnh4h26AqG2pnYa5fJ/1MBwrgdQDmWTbLVwJaVHyVTl0WX+k991dguU?=
 =?us-ascii?Q?RD7edle8XWhmbf2fC/Sk804O0IVWVRtkU5xqhpFuVL8d+pXhmwpoNypAi9KG?=
 =?us-ascii?Q?iF2qrRIFejvADX10UK8kdzf6kWN4lH0viW9IEuSiQVAPQ+cet4ONEnyu3yHy?=
 =?us-ascii?Q?l1/WDU47YKKSOI3k7zQiEmCmTPxZbb9vtkSxxwCL9GKTC+eHz+L7wpdPA2NE?=
 =?us-ascii?Q?KUWxQSLpQEzQs2qmgiAm5XJeLCpNYvGu9iRYMHli+dReAoeFpVY9zjQkFudO?=
 =?us-ascii?Q?gYnhxO8jDg7D65QSReWk/OeWA3r/GYPSxyjpWePEj9Dzrj+1WskMkay64pNn?=
 =?us-ascii?Q?fWyeBZAyHTvnLL962wXxogjKqJPa54XkJ6t+nBsQiIoRdXkeFSGcfIG4yjh5?=
 =?us-ascii?Q?SsryH4CWFUtX9cEuhO/gJXnFUPGtEcE0x3kloLDGavgh720Qke7kQ51wqaz/?=
 =?us-ascii?Q?um7IXzRIGThiBVPyTTPQAHU8bC9eCai6ra5RMsNpwzXF8N3cvyiEMSgqpv+M?=
 =?us-ascii?Q?RRMqEhPdNsi1MKyZZdU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba44768a-6dc2-4aed-b634-08de1e24e964
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 17:41:41.9046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NzZhRe9dFA4Z9EYcElG19hTwr0mQxGRKco1yq/EhXxNy4+a5TPG536Kna/u8tP39
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8826
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

Change the signature of nvgrace_gpu_ioctl_get_region_info()

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Ankit Agrawal <ankita@nvidia.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/pci/nvgrace-gpu/main.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/vfio/pci/nvgrace-gpu/main.c b/drivers/vfio/pci/nvgrace-gpu/main.c
index e346392b72f6ab..d3a5253473e002 100644
--- a/drivers/vfio/pci/nvgrace-gpu/main.c
+++ b/drivers/vfio/pci/nvgrace-gpu/main.c
@@ -205,9 +205,9 @@ static int nvgrace_gpu_mmap(struct vfio_device *core_vdev,
 	return 0;
 }
 
-static long
+static int
 nvgrace_gpu_ioctl_get_region_info(struct vfio_device *core_vdev,
-				  unsigned long arg)
+				  struct vfio_region_info __user *arg)
 {
 	struct nvgrace_gpu_pci_core_device *nvdev =
 		container_of(core_vdev, struct nvgrace_gpu_pci_core_device,
@@ -220,7 +220,7 @@ nvgrace_gpu_ioctl_get_region_info(struct vfio_device *core_vdev,
 	u32 size;
 	int ret;
 
-	if (copy_from_user(&info, (void __user *)arg, minsz))
+	if (copy_from_user(&info, arg, minsz))
 		return -EFAULT;
 
 	if (info.argsz < minsz)
@@ -232,8 +232,7 @@ nvgrace_gpu_ioctl_get_region_info(struct vfio_device *core_vdev,
 	 */
 	memregion = nvgrace_gpu_memregion(info.index, nvdev);
 	if (!memregion)
-		return vfio_pci_core_ioctl(core_vdev,
-					   VFIO_DEVICE_GET_REGION_INFO, arg);
+		return vfio_pci_ioctl_get_region_info(core_vdev, arg);
 
 	size = struct_size(sparse, areas, 1);
 
@@ -285,16 +284,13 @@ nvgrace_gpu_ioctl_get_region_info(struct vfio_device *core_vdev,
 		}
 		kfree(caps.buf);
 	}
-	return copy_to_user((void __user *)arg, &info, minsz) ?
-			    -EFAULT : 0;
+	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
 }
 
 static long nvgrace_gpu_ioctl(struct vfio_device *core_vdev,
 			      unsigned int cmd, unsigned long arg)
 {
 	switch (cmd) {
-	case VFIO_DEVICE_GET_REGION_INFO:
-		return nvgrace_gpu_ioctl_get_region_info(core_vdev, arg);
 	case VFIO_DEVICE_IOEVENTFD:
 		return -ENOTTY;
 	case VFIO_DEVICE_RESET:
@@ -690,6 +686,7 @@ static const struct vfio_device_ops nvgrace_gpu_pci_ops = {
 	.open_device	= nvgrace_gpu_open_device,
 	.close_device	= nvgrace_gpu_close_device,
 	.ioctl		= nvgrace_gpu_ioctl,
+	.get_region_info = nvgrace_gpu_ioctl_get_region_info,
 	.device_feature	= vfio_pci_core_ioctl_feature,
 	.read		= nvgrace_gpu_read,
 	.write		= nvgrace_gpu_write,
-- 
2.43.0

