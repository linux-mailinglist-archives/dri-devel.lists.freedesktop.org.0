Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA06C03C77
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 01:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB7A10E97C;
	Thu, 23 Oct 2025 23:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TS1er2N3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012006.outbound.protection.outlook.com [52.101.43.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4177810E99E;
 Thu, 23 Oct 2025 23:09:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D1LkE+1lKP47B4/ow/AHyVdY7Q+LKGaqTNqg4HecC17xNu3VXS/M/E1qCzk7WRtLObvUeOSNIiZwiIRii3Lpj5Eof9JJZg7hczBVehm8WWYUH7cZ8nP36PZCll2hf2M6ZoTTj3ED5DqhNkXdn3G302Ft5sDricIurZCbBlLuDjXIFN289EpmAYoNPsXi3zw60C3u0jmDd2OQl7GafWIkAJzl+DqIuF3A0nFLeVRiQzKrJ9iSYXQCqlH62IM+kmLk/TwK9m5HkjXhIoVgtxBMZ7iVco7sKYhu06bo8ctgsKMgijpTD9gqLm+1A09pcgzlY2kQn56XTx2tsdyeuCaOjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIsV2Hvn7Vn2OKPwK7I5tTQff7elcWLac/vfH+OM2z0=;
 b=We8GoEfXnbR15wAv3802oEKPg6iTEsqE6Mydn1SphC5tzN3tzKsMI9lCXa7Mf5HJkFd7GOA1IrUDt9LGdOBLdhF8XvGYWPMxdn9Gf4mILTdiajwmZJ45GC1B8SPdG0n7M5QAuB9vZVLzniXJvyz/ST7Fifmde+UL+p2aaKZTGFtyaTCL548Ot5W/tepDmQyHO7N5gldtAW07GcJVCUXYCFhpbBbsWgYh9plr230dDR7rZLhcpUsFR3LtXO6RVhxq5AQ0Aa4Q5tC1vr8hu+li6HHRmNup/d8xsbZ+28R1Z3c4y4+fMpOQ44Az9e1RTe7K+9LPdZMMblEr7VhfL3bFOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIsV2Hvn7Vn2OKPwK7I5tTQff7elcWLac/vfH+OM2z0=;
 b=TS1er2N3Dy0zCnSLl/bL8EvJErATOKGHWm4MyPH92ao8mfLTOKw4WEiuOqGLHUMHkzJuKvBGHCbgI5Ttt8NAsfEZ/XL38unBDXLkxsUrdxZOiGBaQ/yI59Us82g3tpkoLzgou9Dl+uPcCfS7xglVuRsC0tLsETh/U9QTHjYQPlKakfWkd2pi4nEFpFy71/k7E/wM8zX6pTrEePzJ+0brSGWiMqReMmq9c+7Z+LYwg/WuK33UdCm9qqGq1uFg8PN/iKZVD14uX1oeOJfTCD8Z86yO1zl4E3CRE/zmSE2xIOL4t1d0JW/mt5hYPWWl43TEls/rMLRD3GfRISl3eCpa1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by IA1PR12MB6652.namprd12.prod.outlook.com (2603:10b6:208:38a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 23:09:51 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 23:09:51 +0000
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
Subject: [PATCH 04/22] vfio/nvgrace: Convert to the get_region_info op
Date: Thu, 23 Oct 2025 20:09:18 -0300
Message-ID: <4-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0115.namprd03.prod.outlook.com
 (2603:10b6:a03:333::30) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|IA1PR12MB6652:EE_
X-MS-Office365-Filtering-Correlation-Id: 436316e2-bc1c-446b-2f55-08de128942de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sf+Spj0ZZLQ0/+0X/7oVgBOc/64lzNWXjKWm/0GkNky04b8pVQMQ1zXqGsGu?=
 =?us-ascii?Q?yhE7wdbtSjvO7Fv4yGv6pBL0m0tb4S+VIZ0uXT6ED3FL+PeeWUwrJbNK9E05?=
 =?us-ascii?Q?aVFSyT6dRITkdC2onK5bp/3P/aY8u5XbPqnj/lOK2352KU0fDoetJpSvyUh/?=
 =?us-ascii?Q?+UKwsNZ9U6T6dgNqi2mkGP6afuGkleD5YrH6cH1cbV/h+aSzu1opI0IpOVzN?=
 =?us-ascii?Q?buIYyn7XpVktouZK1wgjmN1PUubsMx52qyJK049oaqGGAK1/ak9r6Xqr+lG1?=
 =?us-ascii?Q?bFueP67cZ0WVjlTYV+Skv8thk9eRKarRna4BUtt6KDY9SaBcq1Pd3eP0Fc+V?=
 =?us-ascii?Q?fqXO/0QzgWdhM7+LAlBCLcEHjc97TOJ2h9oA9vlvU2jypNzqVG5ruHnLg7vx?=
 =?us-ascii?Q?pCsTWxzbiB0Kc+/UOZd/heujrAkozDiF8CayhCQP1qx/3nYE69bDX+IgIOoH?=
 =?us-ascii?Q?e4zza8ipz/pSudncnwOOQXC82TkKWUwdsI4GgoUlKCVZGsI0iDFMizZOCHIM?=
 =?us-ascii?Q?bkB5FAgn0X5mC1lcXw5e25ybONXaDrvCvDPCc0enb/1nUmeLfW+MidOEMtRO?=
 =?us-ascii?Q?YnlpRsMsg21tlhso89MVUo6OmePmjmFQqsg9F5dBt4lBJd6L2uSXoGEr5Bxk?=
 =?us-ascii?Q?6vzITvZRymig14dM8plidZi3cPqqJJkpmSfkcvpaNYr23mvukZOXslfpMaL8?=
 =?us-ascii?Q?nBEp2GsnqFIWe78MpwSVj+S9tlnuqgXarG25asoga8iTgcuQQCze2CF7Z2aw?=
 =?us-ascii?Q?nJ357LR81AipoROJRHPosndSB7hlt6gJ1qKZtCtLZTtQqndHV8pGrqMr5pix?=
 =?us-ascii?Q?HuNvFYVqX8F5aVs1rmphOz0vDZr8TOpgI6ykt7iIkHEQZLIALD588Hr6fnUk?=
 =?us-ascii?Q?Vqva57CliHuUCf5YZdkzKFeORgDdYK7xa4eLBvRxNCB0JuWEVzOoHuL3h4nr?=
 =?us-ascii?Q?4ryVl0rz5XjTMJfOTqjnrRIQbkBhxywcAHDMCIOzH5vWZR9w9v8es370moWF?=
 =?us-ascii?Q?sRASvDO7c8bYY4wPR3104wA8eeyjkEN+7j47Z5QhndnkWuX4ZNkHTlD1WERQ?=
 =?us-ascii?Q?EzLK14O3Z/oHMc3xYq2gtxuDZIsv+bEVjtbErefVib6/zyOezUFDlC49ltYm?=
 =?us-ascii?Q?ZC1Y9d0oDmNollu4swqL5Ch2hh35cw/PxZ1U0+i6tR+C1htjoc+vL+bctk7c?=
 =?us-ascii?Q?Ibb13QbruyPJx703Zux1esJSv1VvRkaVNRn48STLIfNEB2k+ulxUOSJJJvwy?=
 =?us-ascii?Q?lBEvwqqfwtxm1Ku/TOWRpk6QfQ07goEkKzqJPl+hf3wLJ8+T/hdpgAiDhfJB?=
 =?us-ascii?Q?GznY7YBcPYKeX1hwV0H+t+SzYXoz7ckT71lLTVpgbTV5/LfODJS4SJQcLu96?=
 =?us-ascii?Q?7NzGuYD0Yz15pAidvuly+MbZkIex33EpUt+bqKGY2XTHjTL+1fm0Ik6Qjrbg?=
 =?us-ascii?Q?DM1l5cjzH9Rp0r/updKljJan2mpDqflijajV7p8jV119cjs+nYjbDh/e4XeA?=
 =?us-ascii?Q?uc2GwR/ykMi129U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pbsfXYhHQNHJ8ThFhalQhQp2gGxXqSP81ENK9M/B3BuRta8zJ7gHgJVIOZJr?=
 =?us-ascii?Q?eR2mE6RRvC7D3z12ux55nCrWi7DKo+0vquqCPdE114y0H+Ebv6eWMEVJJnmD?=
 =?us-ascii?Q?RbwtiPzpdlHyL8SbqWGKMYbmsyoItov1OFent6GKGK2mzWLUVeAcEnQsbEDh?=
 =?us-ascii?Q?/qMZqt3G+dER8znEduly8+eS4Zls3qYBJhSiG1PsRa1Wp3JKuzrJpYQGGCyr?=
 =?us-ascii?Q?hq1iX8DlwaMJdfQU8HHLCuOhngCuNCZqnB64Azjl5LljF/4j9f58Gc3mNDFj?=
 =?us-ascii?Q?W4neTXs+Z3OmQrh+bGFkgMozsStRjlodcYEhjjjOz+c7NQspVixhzVpgSHGL?=
 =?us-ascii?Q?0lXbU/7iq4HoFJUEwKqfB11bcvklgy8hZW1fkgp27Q9gWY+MsICqw0Qx2BzS?=
 =?us-ascii?Q?CIWVkYpPAlvte8vAU1K0wxMyX/g2QFiaC4FRTPyzwM9nZdoyIAOVEkRvzmsl?=
 =?us-ascii?Q?vC/mYBs88liVznaDoBS0uW/adrJu6aFjktWarKOgjAAHr9nf4f77wYVIi/rq?=
 =?us-ascii?Q?LN0PonfDklvv7XROfYbZTxGhSH3aUF+xx4VT9FEycj70JyyeyT3rxWFDhzR2?=
 =?us-ascii?Q?h4R519+ZUSPeDnWnebIA+Mp5HGsBHk0Q/L0L385eKQJ/I4qRoBwBzbfsihlM?=
 =?us-ascii?Q?k6NdFk3sllrN1TT8J1ljOpKyvZb5IbPvNsPzU9RDF1M7uMYIPco0BubGL4dE?=
 =?us-ascii?Q?OU1AnjAXp7LeW7Exz6oek445Bou4E6n9aH0O5sShBQeTrsL1bdcZWOrGq4mh?=
 =?us-ascii?Q?ACdno+UXjWVEUhkmLMSyVollVN3Q8Nlegxuz09PZMjej3aC5I2uuZU/kq75c?=
 =?us-ascii?Q?Grlcs4CkbJZfr8cD+gcdgdHzgR2rLoMOdenNxd7neiKNrJ9gRX0Xo/EmnP0a?=
 =?us-ascii?Q?BlT9BuDc9wFZF8K/9NtQaJdNJ4jhvqwgVVfuAPca/N7t0YkM1GgfQ7Jd62IJ?=
 =?us-ascii?Q?CkiJIWm9SqJG6UGbYTj/Xe/QE6MKjLmCHBRYD/2FPopNrOUAdg5bQY8t6svY?=
 =?us-ascii?Q?/5hwVRrXN6M/ADoRf925F1Ppf5+nruJAE/drFx5m9d2MpZ2f//05psG179UB?=
 =?us-ascii?Q?GSJpgNv4ZjeRgFoDBZ3nN2CSW+sTSlJpVFThBl/x/pXR2a/noAiyGyq1qvWD?=
 =?us-ascii?Q?Q3Im8qogkexHSm+y5mBq7oRiXkn1ZAYUbvQcBtOFcCmM7SPI/auCn8rjJ190?=
 =?us-ascii?Q?/FYkXV4sDlYQ1/Y0cKEpHI+IJ6eFH3sfmsjAR6CikBAtdwd27IRQWz5yTQUw?=
 =?us-ascii?Q?aYGJSBYbwVhllF1rPwHh6GI23mTTWDVxUVuGmz0qMgJzaQEq+3pIcbs6WJXa?=
 =?us-ascii?Q?Xrn3MR3eSdolCDTwFEr2DZ81gBBZuwtpu4FqHh6ZNYtPKlHx8oeHd1Q5MPoe?=
 =?us-ascii?Q?9zhBokoeJPbbnMWIGM32U5HZSBNHj9yNgicqPfcs7G+OH8N8TAcibVnpyJ/z?=
 =?us-ascii?Q?88tDxrZYQUi5lncVmv8Be/DHbYyjBxa282ZtxbtrsLyqfdfFRmvPZ1P2An7Z?=
 =?us-ascii?Q?tqLz41j3VJ2AvEAeX2+I+cjgKUzDttICIvzlWnryaG/wZL9AOtenn4LHnU7h?=
 =?us-ascii?Q?sfAPKSGIBeYX/cQV/ku8Nv0y7dclBitnd5XsYmp8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 436316e2-bc1c-446b-2f55-08de128942de
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 23:09:47.6862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwXc68lJxpUV+BowDYRFOJfcR6mTcxWI6RFNYWFRgRp2qQwXfu4NJPTyKXHW1yAv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6652
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

