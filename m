Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C492EC41160
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 18:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F8210EB3D;
	Fri,  7 Nov 2025 17:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ewQMp5Ag";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010022.outbound.protection.outlook.com [52.101.61.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C1910E1C8;
 Fri,  7 Nov 2025 17:41:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVxOWdxuESfoiO5ZWockCXuoOQe9IaBqPIe87UsZ5QmxuIrinm6M+1SUZFv9jP/sLUtutCQLe+vopGlhK0LZ0u3sCMPTAHgyU1F4X5G2UoWh9rlsXGg+nixsS415W9OivLt0KLc6+jiFuR2CzaqT6mmUhOKIvuCkw0nmeqxsC7bRUtpsFFFSxFNLki4KPYNaA121hGDr3ebXHfnOl+k9+DKReoh8u5o7xOdb5ZS7s6YyoLJ2ACWQDg1MR06PHOkzMt4S1GT1v32QombrwuIHtcIN5IEE8BRxdO4r/zNu8zDAKnqLj7FYumhAlxyIUuROGQVbWIYTvl+MYsfOO2h1DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjA0WX/6WBtVs8nXUKFaR8W04DMY9u4hhoPcczDnATI=;
 b=YvF48770E/ivk+3C+UvoQD2m3wOwBJFLd5GRQesqqvKh9en/iImkR9Or/jglS1zqJz3jp1ej5PQJddq26jQh7T3hhA+BtiWT6df1iPx1yBPs67kjt55KkJnQBUx1bDRYNlVoyOP6Tbx4C63f/QjOXBpo9yiA69OhGMeRrqFtjbbFnE8tbHn+oOR5xNbKHOaCHCJYF56q7hIER8VNwtPS2k606n+CMJpBgsqSZ/hcya8HDYXBMH/lVIPrS1Q1gwhOf+VG5y6w9l9594b0K8z2I7MgTJRD1AINev6VCSkRxdk0govwqG3uwATEomS4ZMjuAJJ9RxZexvQf7y0ikeKQTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjA0WX/6WBtVs8nXUKFaR8W04DMY9u4hhoPcczDnATI=;
 b=ewQMp5AgshXLnb++3Nd/fi4hiCc5lYIRnJ+DeZFqWz1mG3O8BPLTA+B63cRBcMeFaqkndvj+1UrjJCXKMNB4GaxQz7MLlvNgYJIyf4AANWe7E6NEsqWzRuC1Yjsdak4IqaDJ5m0xBr2BiP8KonYGeXcDtNCfZKQ/YnUEhvy1qpYLyXsHzpFg65iSwS3AGuzaK5St0S4InYLLATDnqwZAKgik6rtq6dcirZvowjGsUtyAMSSeTmrZYnbQrv6auYlCUWyHQrYdbhkHX58msrTvTATFVeIySKuoxpKdB8z+4yJeoqGRuEC1BZJoTolrSnXcSi4vTaxsUpdc84CM3jxMtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by PH7PR12MB8826.namprd12.prod.outlook.com (2603:10b6:510:26a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 17:41:43 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Fri, 7 Nov 2025
 17:41:43 +0000
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
Subject: [PATCH v2 21/22] vfio: Move the remaining drivers to
 get_region_info_caps
Date: Fri,  7 Nov 2025 13:41:37 -0400
Message-ID: <21-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL6PEPF00016414.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:c) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|PH7PR12MB8826:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cd1bdbb-1d82-45d1-4d04-08de1e24e8ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cKM3GjKf9zjYdBcP+l57CE3ZtyH4gIuZaIgDboyGanhc7/AccjZ0vmZRkUnv?=
 =?us-ascii?Q?W1H1KXIi141JfxNYby7yD287xKbH+SUB6PnNNKH5prOUhRQJWKYt9fC6NF4O?=
 =?us-ascii?Q?ioVdUbDs4KNaoPxpg1A9PJPu+0CwkstVvayjcEKcLx747lLlFVmCksKE3+2a?=
 =?us-ascii?Q?iPJ/FNyv4soQ/qC65kJf16sJhtSBMq/5yImlC/vM7mAs2VHplL48+zRhT0CU?=
 =?us-ascii?Q?OsszoQVa2y5Tc4QQxFJeL29Ye6tH8Ab/jaP2j84QdLaWUizgjTc3rGddk4Pq?=
 =?us-ascii?Q?+CzNpIpkvZz2ye7jraa/6P9I2mF4AHJ1xsdTuZhEUiMNu5qAP19AR+nbxP0f?=
 =?us-ascii?Q?+L0xmdEAefTbSoW0jlZcAjyrOpV0GJMTVIVPaW6nMVc0u0EEA/1e/Yq+5JuJ?=
 =?us-ascii?Q?81089SenQD113+V4UVhrQPu2EsJSeILcwqVumeFL7JnXsdn2h2HfGjWc6eWN?=
 =?us-ascii?Q?zHVGp6mpOS/YvPJrtEWN61IGZJL8tqSlxK4MFvLMv2ox2K+IQqwkS+JJkayk?=
 =?us-ascii?Q?t044AjWoqOVhT52gNSJZhVIvOfUL/+w/5PFPl8XHG3RoBaMdoFFvuVjZ4+7Z?=
 =?us-ascii?Q?WymPLPgJl///aB7nyqAe9gFgzekk2KKaTIoZXuXERIsFW+ZQwdv2k1NGyvNV?=
 =?us-ascii?Q?36WMDfpy2Db4pK0GSXFOo9ZjWAnugO/v7Ry4IU4RiDI0Xtm3F3D+nv89ZH4j?=
 =?us-ascii?Q?2agO3mpRGH/DR5gLrdPHwqOcFiM8mTeFSmYXPob/ZcuzQZxExFWC/7fqKlnv?=
 =?us-ascii?Q?jC0oMwpYB+Rd4RIRCLKHBqA9xJhsNeBH8KN/UCEcO5EzmPvve2vJHC7RTobF?=
 =?us-ascii?Q?F150K8T22iPlWuPIPNiThH0SzPchtQqQTC3Xn5XE+q+WoXcz1MjGclnzI+Ry?=
 =?us-ascii?Q?xn+wvCwIwDr6t98LrJTIl2V5BdC1ilUfajQr+OPUrbspmbCfoakIBoAvSeFW?=
 =?us-ascii?Q?WSZSXgEDVz6GbpAa+AqDnUvkJQfWjO6gmv6vXcsa2MouLu6ddkjhUOpZNsh9?=
 =?us-ascii?Q?C9sxBRKk/EnJ0jass3lihwMafCXigwItrnMyYrhUzO+E78C0FUoDF8huYKl/?=
 =?us-ascii?Q?V7UZuHeUONEPFypN3CjHADXUj1rTEGbW+2bvHApAY0zTg7bw4kk4BvNL1dnc?=
 =?us-ascii?Q?yyM8O8dImh8KXhRSjnqtRGy8kmTTd3nOsHxWmnCV3ddIHAI+N49PePm+ninr?=
 =?us-ascii?Q?Ah/aQABvTURjONW2r+KuVfzCrmi+rqdjfDAy0VAioK9KUe1BYWvCLuPc52LP?=
 =?us-ascii?Q?ITyLPFxntPHO4g9d/sxHkxiEAEPr4RmO64BkplNtcUKFmJonM9pdqdxArzu6?=
 =?us-ascii?Q?VHrAKYfAVXcdtLl3caQgNOdyg1SiUgWcLnjJojiOJ/cAKcpvE1RuY2mBXwjq?=
 =?us-ascii?Q?bOtkbeufImaNIjNKUIK1uILYrpul3iBegXGkNsVPpKXfMgIP/L8b/qV7+TsB?=
 =?us-ascii?Q?BtkUhI03umey4b93lKt9dCaOC24Ir8DzgNADmWv5ptNp42V56vbMGt99uxhA?=
 =?us-ascii?Q?NpmUA1NRv44Gjl4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1UuK1FFd9Daxi+Fl+j3CCPma4Oa5pchrwyRskW4Fy2dL/9ZvyWK89jzD8kvX?=
 =?us-ascii?Q?PBN9niuH9bHsiK6nxEd/uufGF/NFC+ZE03sPY019/0ghLuypt3tEnGBP+YHo?=
 =?us-ascii?Q?notBYr4f9bizcbfhqlD+pOBqHnaX4cgelzzBeImHutvcAmbi0m5WhwhP/Ol3?=
 =?us-ascii?Q?TbToS+4u+q0X+Hprv9CQH2KRUeuTdtLI/pHJjj5s8sQR3oMjqKmYfDnc8pDH?=
 =?us-ascii?Q?+hLCAzs1Vk/Z7QIm7YYkZ9DBurKztUGXi434nbWLqi2yx774AGrZnmhyatuV?=
 =?us-ascii?Q?dmbF0AOqQkKUQ9d4/vRh08qHy52LuT8rHHO7Su98Nd39ZTEJcaiOZQAsljPh?=
 =?us-ascii?Q?vrFVDNtfJpTSA0l9fDnaI8oKNn3YNAS8zuDSNiJ9MrYq/n8ua9Qy4Z/dVh3x?=
 =?us-ascii?Q?+5dt8i5iPJptr3Bo0J3UQg3ro4vcldiAno+N1NI8Hq9jAlg6AbJpKOVWybRC?=
 =?us-ascii?Q?82DXoA4QcGk5+tt5WfgGtIvjwgBxy12BZqq8S4jjJ47/TNNDa6BZOFramUNj?=
 =?us-ascii?Q?/Nt5sycA7W3gnfH1HivBm9hdRqs3kVSAzvNPuXd6p7E4phwAlAgUOujeghTz?=
 =?us-ascii?Q?6U2zHIjMN2kguEtZD0BQ7IRkmXm5tBkkIJijlzKW3+iFXo623CE4MHL18mb1?=
 =?us-ascii?Q?VzCkdgzj3dhzf4rWBDbIRuXOlSvahMIGhs/dOCCZlisceBYCHRNXSJODMcC0?=
 =?us-ascii?Q?XAVLUODewAVRmuQD2Mo/bi9hYoJC1EgMkOa2CPZI7HrT5fWoKT3jFr6C+1fi?=
 =?us-ascii?Q?tD+e9W4TYywzbaTHazhVg8sbwWHfF+5E+iqxIdN0a6LMiOg1ppbl4bbX3uwN?=
 =?us-ascii?Q?NoHPkn6kKF2V6D5GMyV0nrC3+p3ycOmvVKNv5yY0R/a5qRfYMXGTlkkSZpyJ?=
 =?us-ascii?Q?7xRQZNcyT1uBsfIlKae3VhX4eazII2rB13ie/S923RxykhG2e/JKI+Ht1AVx?=
 =?us-ascii?Q?zlph8GRphYm3PiPVvoykJ9mCC/kofSevfo2kpMD6FEDFI/UxyuVMvbdTiO7U?=
 =?us-ascii?Q?IWZcTRWANyiyh0z8xVIeESguGIthDzZCEYPRDkaPo3e8eImyCrjhXCvoIQWW?=
 =?us-ascii?Q?Jdl/Bo6ZKKxFYAKPYrh/XY4h8jSDUOoxbhE3a3khDOtIq35wFoS9DGbBiwqY?=
 =?us-ascii?Q?jZiurTGpY7v0HY7XEgrGG5l+AC3ADBKDEufqSofpmv1WRMZ+/FGDt+JZ/RM7?=
 =?us-ascii?Q?QqO6VX1LzXwIeeSj950OYgj3qSq0CjLxzCzVI65xpiZKZOH66vCLmQEjR3Bl?=
 =?us-ascii?Q?RcL//PT6VtjOu81IQs5x6ZEMlsnnUaARUPDicZg+UUiCuZl/i6JtX6Pyq0gS?=
 =?us-ascii?Q?suQa5nS0yl/t1yh+IQAjmUv9otsiQB0uxKL8eloOEMVohLw3eSfAb4GdYX7l?=
 =?us-ascii?Q?6yQCXJHCAHE9ffirY5vuOM9zOGt1EHlyp8gvyTSvd+sCDDj59SheK2usU663?=
 =?us-ascii?Q?iLRJ9/MiaOyBPd6jUAYv9rlKxAFO8N3U7kjIkeeH/i91fxTRp39pYVrHJwLi?=
 =?us-ascii?Q?6iO3vXdoEzHQB9AHpUxlR3MjaDBijYiYUf+lpbK/cZwxa9DLu+HGdJ7zXY6n?=
 =?us-ascii?Q?az8OkrpLxQuVU3omaRA=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd1bdbb-1d82-45d1-4d04-08de1e24e8ea
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 17:41:41.0688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I1CiwLHKu4FGMBVccJEah0LMCLlue67W+MhvU+PuwQ/K3r5iwveczcKFR2F/2S7o
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

Remove the duplicate code and change info to a pointer. caps are not used.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Acked-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/cdx/main.c           | 24 +++++++------------
 drivers/vfio/fsl-mc/vfio_fsl_mc.c | 29 +++++++----------------
 samples/vfio-mdev/mdpy.c          | 39 ++++++-------------------------
 samples/vfio-mdev/mtty.c          | 38 +++++-------------------------
 4 files changed, 29 insertions(+), 101 deletions(-)

diff --git a/drivers/vfio/cdx/main.c b/drivers/vfio/cdx/main.c
index 506d849139d35a..253031b86b60a7 100644
--- a/drivers/vfio/cdx/main.c
+++ b/drivers/vfio/cdx/main.c
@@ -130,29 +130,21 @@ static int vfio_cdx_ioctl_get_info(struct vfio_cdx_device *vdev,
 }
 
 static int vfio_cdx_ioctl_get_region_info(struct vfio_device *core_vdev,
-					  struct vfio_region_info __user *arg)
+					  struct vfio_region_info *info,
+					  struct vfio_info_cap *caps)
 {
 	struct vfio_cdx_device *vdev =
 		container_of(core_vdev, struct vfio_cdx_device, vdev);
-	unsigned long minsz = offsetofend(struct vfio_region_info, offset);
 	struct cdx_device *cdx_dev = to_cdx_device(vdev->vdev.dev);
-	struct vfio_region_info info;
 
-	if (copy_from_user(&info, arg, minsz))
-		return -EFAULT;
-
-	if (info.argsz < minsz)
-		return -EINVAL;
-
-	if (info.index >= cdx_dev->res_count)
+	if (info->index >= cdx_dev->res_count)
 		return -EINVAL;
 
 	/* map offset to the physical address */
-	info.offset = vfio_cdx_index_to_offset(info.index);
-	info.size = vdev->regions[info.index].size;
-	info.flags = vdev->regions[info.index].flags;
-
-	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
+	info->offset = vfio_cdx_index_to_offset(info->index);
+	info->size = vdev->regions[info->index].size;
+	info->flags = vdev->regions[info->index].flags;
+	return 0;
 }
 
 static int vfio_cdx_ioctl_get_irq_info(struct vfio_cdx_device *vdev,
@@ -284,7 +276,7 @@ static const struct vfio_device_ops vfio_cdx_ops = {
 	.open_device	= vfio_cdx_open_device,
 	.close_device	= vfio_cdx_close_device,
 	.ioctl		= vfio_cdx_ioctl,
-	.get_region_info = vfio_cdx_ioctl_get_region_info,
+	.get_region_info_caps = vfio_cdx_ioctl_get_region_info,
 	.device_feature = vfio_cdx_ioctl_feature,
 	.mmap		= vfio_cdx_mmap,
 	.bind_iommufd	= vfio_iommufd_physical_bind,
diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
index d38e51a57f0775..ba47100f28c1d0 100644
--- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
+++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
@@ -117,34 +117,21 @@ static void vfio_fsl_mc_close_device(struct vfio_device *core_vdev)
 	fsl_mc_cleanup_irq_pool(mc_cont);
 }
 
-static int
-vfio_fsl_mc_ioctl_get_region_info(struct vfio_device *core_vdev,
-				  struct vfio_region_info __user *arg)
+static int vfio_fsl_mc_ioctl_get_region_info(struct vfio_device *core_vdev,
+					     struct vfio_region_info *info,
+					     struct vfio_info_cap *caps)
 {
 	struct vfio_fsl_mc_device *vdev =
 		container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
 	struct fsl_mc_device *mc_dev = vdev->mc_dev;
-	struct vfio_region_info info;
-	unsigned long minsz;
 
-	minsz = offsetofend(struct vfio_region_info, offset);
-
-	if (copy_from_user(&info, arg, minsz))
-		return -EFAULT;
-
-	if (info.argsz < minsz)
-		return -EINVAL;
-
-	if (info.index >= mc_dev->obj_desc.region_count)
+	if (info->index >= mc_dev->obj_desc.region_count)
 		return -EINVAL;
 
 	/* map offset to the physical address  */
-	info.offset = VFIO_FSL_MC_INDEX_TO_OFFSET(info.index);
-	info.size = vdev->regions[info.index].size;
-	info.flags = vdev->regions[info.index].flags;
-
-	if (copy_to_user(arg, &info, minsz))
-		return -EFAULT;
+	info->offset = VFIO_FSL_MC_INDEX_TO_OFFSET(info->index);
+	info->size = vdev->regions[info->index].size;
+	info->flags = vdev->regions[info->index].flags;
 	return 0;
 }
 
@@ -596,7 +583,7 @@ static const struct vfio_device_ops vfio_fsl_mc_ops = {
 	.open_device	= vfio_fsl_mc_open_device,
 	.close_device	= vfio_fsl_mc_close_device,
 	.ioctl		= vfio_fsl_mc_ioctl,
-	.get_region_info = vfio_fsl_mc_ioctl_get_region_info,
+	.get_region_info_caps = vfio_fsl_mc_ioctl_get_region_info,
 	.read		= vfio_fsl_mc_read,
 	.write		= vfio_fsl_mc_write,
 	.mmap		= vfio_fsl_mc_mmap,
diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index 0c65ed22173862..0759bd68edca0d 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -435,10 +435,13 @@ static int mdpy_mmap(struct vfio_device *vdev, struct vm_area_struct *vma)
 	return remap_vmalloc_range(vma, mdev_state->memblk, 0);
 }
 
-static int mdpy_get_region_info(struct mdev_state *mdev_state,
-				struct vfio_region_info *region_info,
-				u16 *cap_type_id, void **cap_type)
+static int mdpy_ioctl_get_region_info(struct vfio_device *vdev,
+				      struct vfio_region_info *region_info,
+				      struct vfio_info_cap *caps)
 {
+	struct mdev_state *mdev_state =
+		container_of(vdev, struct mdev_state, vdev);
+
 	if (region_info->index >= VFIO_PCI_NUM_REGIONS &&
 	    region_info->index != MDPY_DISPLAY_REGION)
 		return -EINVAL;
@@ -512,34 +515,6 @@ static int mdpy_query_gfx_plane(struct mdev_state *mdev_state,
 	return 0;
 }
 
-static int mdpy_ioctl_get_region_info(struct vfio_device *vdev,
-				      struct vfio_region_info __user *arg)
-{
-	struct mdev_state *mdev_state =
-		container_of(vdev, struct mdev_state, vdev);
-	struct vfio_region_info info;
-	void *cap_type = NULL;
-	u16 cap_type_id = 0;
-	unsigned long minsz;
-	int ret;
-
-	minsz = offsetofend(struct vfio_region_info, offset);
-
-	if (copy_from_user(&info, arg, minsz))
-		return -EFAULT;
-
-	if (info.argsz < minsz)
-		return -EINVAL;
-
-	ret = mdpy_get_region_info(mdev_state, &info, &cap_type_id, &cap_type);
-	if (ret)
-		return ret;
-
-	if (copy_to_user(arg, &info, minsz))
-		return -EFAULT;
-	return 0;
-}
-
 static long mdpy_ioctl(struct vfio_device *vdev, unsigned int cmd,
 		       unsigned long arg)
 {
@@ -669,7 +644,7 @@ static const struct vfio_device_ops mdpy_dev_ops = {
 	.read = mdpy_read,
 	.write = mdpy_write,
 	.ioctl = mdpy_ioctl,
-	.get_region_info = mdpy_ioctl_get_region_info,
+	.get_region_info_caps = mdpy_ioctl_get_region_info,
 	.mmap = mdpy_mmap,
 	.bind_iommufd	= vfio_iommufd_emulated_bind,
 	.unbind_iommufd	= vfio_iommufd_emulated_unbind,
diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
index b27f9b93471bc5..3e029d0cba1ea8 100644
--- a/samples/vfio-mdev/mtty.c
+++ b/samples/vfio-mdev/mtty.c
@@ -1717,10 +1717,12 @@ static int mtty_set_irqs(struct mdev_state *mdev_state, uint32_t flags,
 	return ret;
 }
 
-static int mtty_get_region_info(struct mdev_state *mdev_state,
-			 struct vfio_region_info *region_info,
-			 u16 *cap_type_id, void **cap_type)
+static int mtty_ioctl_get_region_info(struct vfio_device *vdev,
+				      struct vfio_region_info *region_info,
+				      struct vfio_info_cap *caps)
 {
+	struct mdev_state *mdev_state =
+		container_of(vdev, struct mdev_state, vdev);
 	unsigned int size = 0;
 	u32 bar_index;
 
@@ -1785,34 +1787,6 @@ static int mtty_get_device_info(struct vfio_device_info *dev_info)
 	return 0;
 }
 
-static int mtty_ioctl_get_region_info(struct vfio_device *vdev,
-				      struct vfio_region_info __user *arg)
-{
-	struct mdev_state *mdev_state =
-		container_of(vdev, struct mdev_state, vdev);
-	struct vfio_region_info info;
-	void *cap_type = NULL;
-	u16 cap_type_id = 0;
-	unsigned long minsz;
-	int ret;
-
-	minsz = offsetofend(struct vfio_region_info, offset);
-
-	if (copy_from_user(&info, arg, minsz))
-		return -EFAULT;
-
-	if (info.argsz < minsz)
-		return -EINVAL;
-
-	ret = mtty_get_region_info(mdev_state, &info, &cap_type_id, &cap_type);
-	if (ret)
-		return ret;
-
-	if (copy_to_user(arg, &info, minsz))
-		return -EFAULT;
-	return 0;
-}
-
 static long mtty_ioctl(struct vfio_device *vdev, unsigned int cmd,
 			unsigned long arg)
 {
@@ -1953,7 +1927,7 @@ static const struct vfio_device_ops mtty_dev_ops = {
 	.read = mtty_read,
 	.write = mtty_write,
 	.ioctl = mtty_ioctl,
-	.get_region_info = mtty_ioctl_get_region_info,
+	.get_region_info_caps = mtty_ioctl_get_region_info,
 	.bind_iommufd	= vfio_iommufd_emulated_bind,
 	.unbind_iommufd	= vfio_iommufd_emulated_unbind,
 	.attach_ioas	= vfio_iommufd_emulated_attach_ioas,
-- 
2.43.0

