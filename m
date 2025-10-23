Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA2CC03C59
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 01:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD7C10E9AE;
	Thu, 23 Oct 2025 23:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kPlctco2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012031.outbound.protection.outlook.com [52.101.48.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0C010E992;
 Thu, 23 Oct 2025 23:09:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZelLmdCUcPVYm2VQ+w9Bt+SgEnoZqTQ8gF0GmWmbYWNvc6M68o2kCqyv0SMI+efh66MAuI8Dk9NSrnOYNp9qveszcfBumMZkupYZra2TpCHS7XtWzyoJn+sOaWDfYGHNJJuTFyEJz+yIOEbmGceF2b0dJVz8yeJfjvxrPrED88UiigMbn6cFrHGxwV9FMW6QcQEv/w6XpvCbrSJQMK/pkyXtnw0K0M7g8K5G3CS2CPDajIjHm6cfZ55PQfJC58OPqAydTjWfnPZ315/TFs4dDmegAL0YnhWH4ie3kbZTv9DINLaqTQ4uf22wMerWO9OEBbSO3Z2eXC07N/ktItaK6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1wsxYJyq6u5DV19Bt/e+MpCutoNNnKwR+SYOsxzEpg=;
 b=gw6+cqyKrpKeKZ7FB7h6g9BoR32IMvxbQvvFi0p5L3l/TlIt8nOUNsMzzbsJxmTaPtSfbExrskpHxWCJi6Wae5YL1q4jGJtPWyfDmKjSV4hSqcjXvhNXIE+x0t2Fn++XeWy9BGdGq2EKuQzxklOUY2Y7bKZ2+Hy6DiQtkTBtzbxJ4krc8aF0sws01kE8mqE89GFc5E2mrJJNN5Q4hT5TbN/VlONPosayGSm7/QhhDAsYAa9JcWlwciREwQUGYlNacoNNq0BXHiXB1iuR4ehD34NOC4jVsAviIfg01m9YoL4JA4M3WMRXSswxXKoPTqx1nuOMOOKCa6MJffvti3VfdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1wsxYJyq6u5DV19Bt/e+MpCutoNNnKwR+SYOsxzEpg=;
 b=kPlctco2AMc45w8mEh/QHPNJuPienAh/2W7Ajkox1sYfXyJoY4jW0njwgrgh6b0HiK6s2oE5j5abmn3Mvl4o9CYBHuK3kWzVJ9h8RPsbU3SPRCyZkFdUq9bw2YahHBZLpXBGkOPhItADNncUD/58mHFujDOg53zqf8kZFAM6mnnNbdjBDZLPLzV6XqGauTNTt+vfhp4ZETJKdvIylwN6Q0JU7rZ7w2bzstKVG/lJ2Mf6QM7FGHC56gdP5+25+E2CQ/Bfy3UrD3DO3t8xV9Us/qR6Z6Byp/A2ayIAXa3NlPrQh73G15uLnr7LsCMY0oraT2pZlOI74NSxpH05SF/GSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 23:09:48 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 23:09:48 +0000
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
Subject: [PATCH 09/22] vfio/platform: Provide a get_region_info op
Date: Thu, 23 Oct 2025 20:09:23 -0300
Message-ID: <9-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0093.namprd03.prod.outlook.com
 (2603:10b6:a03:333::8) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: beda84b5-79d6-407e-078a-08de12894134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qh9K3P8mZQufRIF44UjK9YfgxT9z+CLK/eMCxnDu96xu+U+sazYFZzJzRDT3?=
 =?us-ascii?Q?LwfhoV95VnXlWoRdu0z/chLAWSLTq87N42zVYCVuM4bRGtcg7NWMKdnDeZWs?=
 =?us-ascii?Q?PIJV9+j8PrtaC3UMNu4qOR5I6wueYzn3mPnUpjxN7Fl+1su5vPKZlU3qjeCj?=
 =?us-ascii?Q?ocrCMjksTAS8mWnRAWFK0SfXmvbm/3U6mSg3Diu8yYReaOKG4MF49aCNo1Lo?=
 =?us-ascii?Q?qKlCl8/DRax5lzBQDl4DqcOIGmzDAo2/IXnmNz2GIsNyqw64iZJBuLNeFpbA?=
 =?us-ascii?Q?lGYFYm9gvaYw6y94UfO74gOyP2R619QYpoXWQgpw/aOuev45yUJZMOoyYFf/?=
 =?us-ascii?Q?6bhLWd+UWhifJnj/wuahVulu2UsaLRDYtq4nOjU4D/H2kNr67slL37O4+lhV?=
 =?us-ascii?Q?B92at5TCUJ03yPITu8vO86h70hc7KBn+sJIDuF8iLt8rnpm8B14cTQBYf4G/?=
 =?us-ascii?Q?e5YPcrGfs8XzGqASdIjQC9rzVd79BfK4NmvVn3cRb5c5bK5pNgX6RZodTUsR?=
 =?us-ascii?Q?DZyy3oq0FxpYEGa0sejGHyPcAWUKq3Miu8AtAXBSE/IgU6zpHvLIx1jyxtNq?=
 =?us-ascii?Q?Kr1pNTX1b629lvIn0BAnchrj0t28fy2WX98G58D023C33wCF1+h9lqRMpQ1u?=
 =?us-ascii?Q?4E8E1ksiBZEz89XNJEtnpsHIQrjnEao+QA5LHYakp+UG4J282FTjGCpDyeB+?=
 =?us-ascii?Q?uNdRDglciZaK8Rr/dnOTwQ9Vxx+Sap72iFU6vYfB1gyShYBOtu6LlWohBIRg?=
 =?us-ascii?Q?kZC5b/tDvMOyXHED9AMiuD7PpOLToqXbWMmFsMDBcI6shT1ywGTZbT1ei1hb?=
 =?us-ascii?Q?4zP36pEVfXlBPZLoXakjsjivKvoA8yfAUorzc1B5tXaQ/eyz+b9xKpRD7H7a?=
 =?us-ascii?Q?O8zmGvQxt4yiivHwNSTjUW3prMKhX/ns/Puo8DnfcyDUJGRBL6IqO+ohmPFc?=
 =?us-ascii?Q?4jlFn+UK9BtZjLKMkQCPPy95iaBFHTxgAguLvzgGCLmVtyfGlnJ/xZpprV6f?=
 =?us-ascii?Q?biM3paB38yLhhrBrIQEoi4Xjq8W4bN4YHDaqEED80IiiVOG+D8Yl6qmeuBRB?=
 =?us-ascii?Q?pwpFE/gT6ZQRXDf5+rjRb5EEHLnkHGNs9YR+9XKRp0PrQIV1QpY8Gh9T4Tpq?=
 =?us-ascii?Q?k0C8OnMBe+SBdhRS78PlMj1YadPfu0i4E7vL2bWSuM5/4mUTJX8wMeZLMbG3?=
 =?us-ascii?Q?LmzQaM/I4+GypTpRHbSz4RPj2mwhs5WA1atgKcUIuAzxuvB2xKCB192IjfnQ?=
 =?us-ascii?Q?nzKe7Crro1g+okNV+FPNcMskymw2ROXH1JemVtNj+9HYnZSh9MXFJsEl3pt/?=
 =?us-ascii?Q?YhmkNCDEWiGoSJhBv0hg2/HQMrh8NotyNZCfMHZwYZjxrJfC1ouY9EZHdKie?=
 =?us-ascii?Q?aLow07qj3359mgvwyxF1EUJ8cmHiQUfNU0vl1O2RyVMuASNNIFal77aE5bUk?=
 =?us-ascii?Q?W5PMZ1ePWCPadW4/luBOxUtPsHNheZX9eBla3Ly6Gf32+NoBPXEoxG6a8GKz?=
 =?us-ascii?Q?z3bWadaxRanpADE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k1aib11ZS/tDhrIGcmNg1HC7WkF+afIfY5Rc+z+5e7T7IQLcSRtZESPYVWKK?=
 =?us-ascii?Q?sg8lyHApRCUh4H+oZaMKLw63TqARUobzvsKctQ2SEFeQ91MoSxwR46nRUw2J?=
 =?us-ascii?Q?QFLuTgAvdKibRVzdSuH6wPO/Y+hC2vx88+gChQCLcKD7jsiLJKNpl4YOlk7U?=
 =?us-ascii?Q?p1S+TChy/71NGgUcGiQfxx+Ym4chyRaEOWJJziJf8qk+O3EM4axGQEld7Q/3?=
 =?us-ascii?Q?pha1vC3SDqvuAoIxxJkhmnW2BVwexbdSfu1z0Og4N5SaDP36qwNjTqbvfqZH?=
 =?us-ascii?Q?Dq2hyGrKCyB8ShBHzmPo5av1RJw6+s3kCaBMb3T7R1/z1hP7yc2Yi4lgVcic?=
 =?us-ascii?Q?QUiMcaKkUdzaAXtiPV7SGwLaXfODuxqBGVsVJFWSzaPeYWQndaJI9gOUjawV?=
 =?us-ascii?Q?O6+jTgfKWzkoGh+Cj6do8ETj8te6CpdD+N4HZmVisne4sY1Onjrd6+haGr4L?=
 =?us-ascii?Q?WaEMfMDTk1mfNi3LgURrOWayZTZDmwomdbKySGkd/GfJBttU9Or35mktlVyU?=
 =?us-ascii?Q?SEOUntR0DTAZF5ssnHvMQiZzQtoWsAwBJ5p6JPnvKoUXh/xotHSrouHG7XbC?=
 =?us-ascii?Q?2LS98h/cVzUvYYOw9mVBiDlgNNe3MmEDyxbeyrPsty99wgqGbCIfXZkR7t91?=
 =?us-ascii?Q?eS3nn+ZB/PqrOvq+Ldw+1ZZcMbYL8OXdiMxJbBgvAFaf+n9VrbVVxbDzlUOC?=
 =?us-ascii?Q?pyz8mdtrf+6AuFgd1F1anvfPnF8a7RTgg8P6Q0Ty+e2lGRvkfa12dMpIKw5z?=
 =?us-ascii?Q?UkuPquObzShFWVQP6rK/4Xyzn5bxTA4NT1xh44QdxBJnndny2O1e9QL+1Wen?=
 =?us-ascii?Q?w4IIQ5yc0/AbHHHp5QbFng0ngkNK4+OgGCnNeEaUJU/HoZx7BRVd3IxHRHFx?=
 =?us-ascii?Q?P/9mKzqwL73GbgoNJNWydCfdhZ3dY4ZARfl+FH+gGRRDt6wWhveuHeAqmWut?=
 =?us-ascii?Q?9hqq67HWFPdMd683weCu7bH2FOYp/MxQDeDba/CkOz6TlNhP0BJpRaqDndfj?=
 =?us-ascii?Q?vXHCClkkGBGbCw/vOOA8g2Mm6r5x7ajaVCyZazrDrBn1pEusRBK8NAs+W2BD?=
 =?us-ascii?Q?gDZmzdDXLYejvHrh6LmcCa6Yh/MLcbWA0WIFd13srJ78AQXqzcXIYIwPbYe1?=
 =?us-ascii?Q?J0tZmbXGGgGnk3fUxTm00xwiHCK2lIkQd18IF7qgb+1/AlchfiDmxkmeLqim?=
 =?us-ascii?Q?UzIDxlvcDRJ/ScVbS2rPG0b0UwmIBvKNC52Y+Z9rH5bLyxF5NsyP0UZeNKwm?=
 =?us-ascii?Q?LLa56b7Ph3r/pryvnChCkC73H8s0zdw73hMRMpbq2d+86W/gmhob2N0aWzdP?=
 =?us-ascii?Q?SUrErouTJ4aiMLRy+pbCP5Hx/3wJMNmjll3Swojd56q8tmAebz7ruYAazPzn?=
 =?us-ascii?Q?JfIX+MLIn/zncDPXbJr/uk6/28N2pbN4xMaDydjMN2dPX79Uny9OY87N8lkD?=
 =?us-ascii?Q?ZmZIDrqp+ApOukbmN+2wkiHQC96odiVG45LHePTLFc3fcP06AqF7H+15V+A6?=
 =?us-ascii?Q?t6cfUeUvCRPCEU2aVjO9kK65aJp5yDJ3uk3YSt2tHsOmincTQGwFXME9Qgxq?=
 =?us-ascii?Q?efg42yuTHfArkemTgFv/AakatVbfEYASoZ2GVYa5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beda84b5-79d6-407e-078a-08de12894134
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 23:09:44.9699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fTlbKQM2qDUOV11Ypk7ORPgvAhMN+UO3WZej8uUkzHVMD5cXOniZistVWbeFc85K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9138
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

Move it out of vfio_platform_ioctl() and re-indent it. Add it to all
platform drivers.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/platform/vfio_amba.c             |  1 +
 drivers/vfio/platform/vfio_platform.c         |  1 +
 drivers/vfio/platform/vfio_platform_common.c  | 50 +++++++++++--------
 drivers/vfio/platform/vfio_platform_private.h |  2 +
 4 files changed, 32 insertions(+), 22 deletions(-)

diff --git a/drivers/vfio/platform/vfio_amba.c b/drivers/vfio/platform/vfio_amba.c
index 9f5c527baa8a36..d600deaf23b6d7 100644
--- a/drivers/vfio/platform/vfio_amba.c
+++ b/drivers/vfio/platform/vfio_amba.c
@@ -115,6 +115,7 @@ static const struct vfio_device_ops vfio_amba_ops = {
 	.open_device	= vfio_platform_open_device,
 	.close_device	= vfio_platform_close_device,
 	.ioctl		= vfio_platform_ioctl,
+	.get_region_info = vfio_platform_ioctl_get_region_info,
 	.read		= vfio_platform_read,
 	.write		= vfio_platform_write,
 	.mmap		= vfio_platform_mmap,
diff --git a/drivers/vfio/platform/vfio_platform.c b/drivers/vfio/platform/vfio_platform.c
index 512533501eb7f3..0e85c914b65105 100644
--- a/drivers/vfio/platform/vfio_platform.c
+++ b/drivers/vfio/platform/vfio_platform.c
@@ -101,6 +101,7 @@ static const struct vfio_device_ops vfio_platform_ops = {
 	.open_device	= vfio_platform_open_device,
 	.close_device	= vfio_platform_close_device,
 	.ioctl		= vfio_platform_ioctl,
+	.get_region_info = vfio_platform_ioctl_get_region_info,
 	.read		= vfio_platform_read,
 	.write		= vfio_platform_write,
 	.mmap		= vfio_platform_mmap,
diff --git a/drivers/vfio/platform/vfio_platform_common.c b/drivers/vfio/platform/vfio_platform_common.c
index 3bf1043cd7957c..3ebd50fb78fbb7 100644
--- a/drivers/vfio/platform/vfio_platform_common.c
+++ b/drivers/vfio/platform/vfio_platform_common.c
@@ -272,6 +272,34 @@ int vfio_platform_open_device(struct vfio_device *core_vdev)
 }
 EXPORT_SYMBOL_GPL(vfio_platform_open_device);
 
+int vfio_platform_ioctl_get_region_info(struct vfio_device *core_vdev,
+					struct vfio_region_info __user *arg)
+{
+	struct vfio_platform_device *vdev =
+		container_of(core_vdev, struct vfio_platform_device, vdev);
+	struct vfio_region_info info;
+	unsigned long minsz;
+
+	minsz = offsetofend(struct vfio_region_info, offset);
+
+	if (copy_from_user(&info, arg, minsz))
+		return -EFAULT;
+
+	if (info.argsz < minsz)
+		return -EINVAL;
+
+	if (info.index >= vdev->num_regions)
+		return -EINVAL;
+
+	/* map offset to the physical address  */
+	info.offset = VFIO_PLATFORM_INDEX_TO_OFFSET(info.index);
+	info.size = vdev->regions[info.index].size;
+	info.flags = vdev->regions[info.index].flags;
+
+	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
+}
+EXPORT_SYMBOL_GPL(vfio_platform_ioctl_get_region_info);
+
 long vfio_platform_ioctl(struct vfio_device *core_vdev,
 			 unsigned int cmd, unsigned long arg)
 {
@@ -300,28 +328,6 @@ long vfio_platform_ioctl(struct vfio_device *core_vdev,
 		return copy_to_user((void __user *)arg, &info, minsz) ?
 			-EFAULT : 0;
 
-	} else if (cmd == VFIO_DEVICE_GET_REGION_INFO) {
-		struct vfio_region_info info;
-
-		minsz = offsetofend(struct vfio_region_info, offset);
-
-		if (copy_from_user(&info, (void __user *)arg, minsz))
-			return -EFAULT;
-
-		if (info.argsz < minsz)
-			return -EINVAL;
-
-		if (info.index >= vdev->num_regions)
-			return -EINVAL;
-
-		/* map offset to the physical address  */
-		info.offset = VFIO_PLATFORM_INDEX_TO_OFFSET(info.index);
-		info.size = vdev->regions[info.index].size;
-		info.flags = vdev->regions[info.index].flags;
-
-		return copy_to_user((void __user *)arg, &info, minsz) ?
-			-EFAULT : 0;
-
 	} else if (cmd == VFIO_DEVICE_GET_IRQ_INFO) {
 		struct vfio_irq_info info;
 
diff --git a/drivers/vfio/platform/vfio_platform_private.h b/drivers/vfio/platform/vfio_platform_private.h
index 8d8fab51684909..a6008320e77bae 100644
--- a/drivers/vfio/platform/vfio_platform_private.h
+++ b/drivers/vfio/platform/vfio_platform_private.h
@@ -85,6 +85,8 @@ int vfio_platform_open_device(struct vfio_device *core_vdev);
 void vfio_platform_close_device(struct vfio_device *core_vdev);
 long vfio_platform_ioctl(struct vfio_device *core_vdev,
 			 unsigned int cmd, unsigned long arg);
+int vfio_platform_ioctl_get_region_info(struct vfio_device *core_vdev,
+					struct vfio_region_info __user *arg);
 ssize_t vfio_platform_read(struct vfio_device *core_vdev,
 			   char __user *buf, size_t count,
 			   loff_t *ppos);
-- 
2.43.0

