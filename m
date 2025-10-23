Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCCEC03D6E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 01:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31CC510E99D;
	Thu, 23 Oct 2025 23:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hu3LdU9U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010054.outbound.protection.outlook.com [52.101.56.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D65210E99E;
 Thu, 23 Oct 2025 23:33:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PyTT6w3qrkJRpnzcjJ7yZTcII9Td79g2ORE5Jj5wIlRztoiRUEOGWfhTcR0xC3QmcgxDLgkd07yC0qJtrcYYHhalpaNHaIRLwiuAtIml5yy1Mg8H1BJ1tXEYicucYC3JjQB7Q2D8xa/ATWktchRMdVxPDTRNxnnAZtDy81W7FGV/xdbw5Ov4SpaJv44amjIIvQNpPQoSVSyyj0D5/T+2rEaL0oloiqMugmRHPQ8ZhXVoEDuFJXXA0FBVHoLrm8cOcy9t/ysO1B3onREUlGfZS3WOfNCevFODHGCSEzIcs3Qqkl5gIE4FIt2yo/f7cXz29VOhcIA9CzAYhv6he9+yFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2Dtoyz1fF/K/21EgkAQ4NZN0haDpcFi2xhc0Ctw/u8=;
 b=obqnNC1XqoSDizsESo5MmC3IFR2s2dP+9QLUbymUTE0y1i+IBm9pvE5X8QOewHMfazMiAY4IPt+/fGY0H++XRO+LwG8jZ4jmR9s8Lpyj4MGTcqQyg/cQ+G8Dbr6OVA3YlCnrrgdQUdNiKNyjR84/fqDEJYjwXEzq22+sH2AoEB0vAUrV4gobFso9Tr6FrhsWY+I3o7OopAPqHwX0fuSXY7F318FPzRgZeQuxCo9cbc3bxfoGXXImRD+E7wXyQ0PL6ukkinAS6acVeE0wsj11zp7vig8gVjIGw/7hPscXAjEEz3YX1DxddmMmvu2enKn18KsxyIxonoNguttfK7i8iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2Dtoyz1fF/K/21EgkAQ4NZN0haDpcFi2xhc0Ctw/u8=;
 b=hu3LdU9UYEXGMcaOMcbVsQIK9460oNoM2eYWfZPasY4SJaOEUV0xYHhbv2LtvhZeUr416NQppl+/nnfiu/VpELTiG75iJ0+/dQbXIxOzss9tfzqKned1V6GtT3eG5zh2bSy/A1/aBZ09g9/MM1Ki8eZ3HwZSPMxs0nk8RGKvjbTi0H7vGakWm2Ge9TKWM9Av//HZKqtYQqtrMX8H7teffwoE5sQuGy63xxIlEJmkxQ8D1XoZFcIKwEU4HdAeoXNnaW2uh2bi2XKHc1N7znBL21XoBTtvJ1U/iSOrnGFFJCgbtq0TcgT5CnJ/jKzCA+80OBjL8mEWVDbvFjAbTe3+pQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by LV2PR12MB5943.namprd12.prod.outlook.com (2603:10b6:408:170::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 23:33:32 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 23:33:32 +0000
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
Subject: [PATCH 22/22] vfio: Remove the get_region_info op
Date: Thu, 23 Oct 2025 20:09:36 -0300
Message-ID: <22-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0031.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::44) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|LV2PR12MB5943:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f085dec-bb7f-4398-0310-08de128c93b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bxJUh9MHFP3vZ2FgaGtfaqW1qXw0kbaYY66P2C9kncsWOqSuyjlenfGV0eHv?=
 =?us-ascii?Q?flSgsEVCopoajVvrWXJOqM3JC4YGYTJ+lMYdO318H7LTiUbPeCNU/hquid8Q?=
 =?us-ascii?Q?USYg5NGqkj3/etLdSB+nwSEdiPUB1WpZLYTjm90sSJJ7UDpGVLm64JF5XZYo?=
 =?us-ascii?Q?gB5TkkG4M4c1Kaj7g8svXduNoeMgdu7b7907h4fScCgsEhlqFdwb+/u9gyIj?=
 =?us-ascii?Q?lq4NNS0mE7gVXBMJCY5uvaUEFAwdDCiOQn0SPqoqeRMh0tGyXq+6nxD8Q8gW?=
 =?us-ascii?Q?xSn5aNYLYBuFPSkQUdDY9hnDmnllZJlJbZcTFRqVXo6dB+o8Ups2hrs2YKTU?=
 =?us-ascii?Q?nk55Nbte9Q/p6Ye9R4NpqHFBCd5IHY90NRH20UZOrFxjHOPt4ihc8J7TsgL7?=
 =?us-ascii?Q?tx5XhWyFXFpY80ZJFtzLRRGfCmohVAaawK30dgVjtZf+VMS+3zR3rK3YHrx9?=
 =?us-ascii?Q?PIqj2uXTbJgrPPYQhZ9+gQqq4Ahn9yV87kShNhUbRrbD+VWiWbAZwpViNXUT?=
 =?us-ascii?Q?7NUF1LwMe2dMTu8Fas0J6YF+fdbuZRpk2qSwdoekEcyZvz/PntcOeo5hKKJT?=
 =?us-ascii?Q?g9JgaIxnauReoj3QoGHDmpo7cZ1Wdx/RG9xiUOAbG4cyKXReDR7bhtm0Praw?=
 =?us-ascii?Q?PFTFHRss1KBBN8Lgnz75jNBmQVbGzQvz8ye+MpSB2OEt2z5VqDnSRGangWwf?=
 =?us-ascii?Q?dOTVCdcyoXoUZ81840hnR2g0b7DPSTiZMiZ3vfgUPJwUBr5nwNLHaJRaMZmm?=
 =?us-ascii?Q?py24QpsBIHaA5VZ3iFf0Vh18VV3hPdakGEIJlKa3HD3Rd/IoMEIUq1KmOp7b?=
 =?us-ascii?Q?NZEFCjXcqDU02D8IVK0dSmxXBR0pjZZG/XmidXAeWoD0pPVMM6j+tlqd5cRb?=
 =?us-ascii?Q?fu02sqQ3cQEx4B4MzSaU07AAjVf3awIsF+ARJnve+PCuK0x9mojpHqnPCsQg?=
 =?us-ascii?Q?ZEAEp++cr7P3OrEjiD2xGTHXcNn1XrZEkxFquc+eTWIJpb8JJgT7uZrg0ym/?=
 =?us-ascii?Q?RTpsw5AcqLiecQ/T1Z0oD95yyEBfHpIbUMwAFzVmvfy+7UDpuoWZ91pM0vBT?=
 =?us-ascii?Q?RXfHiqNyCYVmV2KQOX7uFA8fu+Vge+X0Ewb5bAB4FlLkPuP2UX3fECD+Ib/d?=
 =?us-ascii?Q?Jy+uDx5NKATcaRDjrznr5dEBjGMLstusaLYLAKN5uuLlh6EbN8bC7y5bhQBj?=
 =?us-ascii?Q?CCimn5P9vMxQkjpwFtLhp1aaoSPvastNFCgmYOVpDBhQ3VkkiEVaZeIRPivx?=
 =?us-ascii?Q?wz4ePo/0MTv1a787piy+04daVK8dyMQxbOPQMEnAg/6OTZu8UhVGY2pFXnxE?=
 =?us-ascii?Q?XJ4IdvVcnWJXN6jtgcg36P0TOb4qagCanQQkqaO6KeymLX/CUcrkvPjud9hJ?=
 =?us-ascii?Q?n8qmfejW3zpRsgqV5kwLZzBj+wt1hC9o/DkppqZBGT8Yh12awGDJaDFLqcRm?=
 =?us-ascii?Q?ZlCULhjLVSuybJ8T6djFKEuGpW554yizFKlYzanzjbjTXkEb3ADEzZPe7Zgo?=
 =?us-ascii?Q?0zZxGy6BHwFLciM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NmWcbh2iyJx/vVNZ3J0JoOCoCpM+diYVY46DBjjGCBXeFuulD+QEA7ylD+ax?=
 =?us-ascii?Q?L8V1H4dsq6DJPNnF4WqES5OW0I2QeDpUhJT0HP/hKTpy89cZ0buHmwANoi+q?=
 =?us-ascii?Q?E+GBdKWGUzlB5Rz/suWY6GQqSD0+aU6PcLv1n3t8P1y88ClH8QQX+B+tsRPU?=
 =?us-ascii?Q?CgOmtjOZqmHkyGEaGTXncDkO0IWHSdI11NoES3cRwFuJfyrLiHgbgDZqzhtZ?=
 =?us-ascii?Q?dJivgEUVxir0EHDX7mlalB6jqea/ibJhOvTmxPe/Sv8+RzwrH3YeWynuh8z2?=
 =?us-ascii?Q?M0B78wUKP3h6lABCFw235i3EqapidU1kQ2Nk7kM/c+OB6xPE9lNB1e8uefiV?=
 =?us-ascii?Q?zAtOEl1V+KRTRSIEAgiYLuEwU2M3OVDTRAUZwpuPOl92mZV3QWCYKD5dH9UC?=
 =?us-ascii?Q?EaOk7bJPqohQQBm5Jk8jh1WWIJH+SnIplHuw1WjqbZRpBRBVNziRdYwZtykZ?=
 =?us-ascii?Q?HoXBdL2pQp1ycxfaOJnFecF1Ufh9PIRys6hpWVqNtaws/MSyStrBzjWHBhoU?=
 =?us-ascii?Q?g68/yNQHhqB28goH+8CmNzK9ptvfrztpA6VcfGBCtCRXddOlYOxK9wQT+TUI?=
 =?us-ascii?Q?1XrAfJyMda8EybU1oIQ8XyrrBS8Ry6kIwU5bbcdnBN+bXsGvL0t0PiyP0+W/?=
 =?us-ascii?Q?5gpJ+OS1T07xh32hSR9fm4ilI6LyjXD8iqFWRi+v52qrqZ/rAhFAUhpLkl9H?=
 =?us-ascii?Q?DcRRqDQuhAbyUA9D5W5IM0ILh/pzqmHZMRvnOqUXZdFPmcGCX2U6m8iLqmTD?=
 =?us-ascii?Q?LtLuaFg+qHm53zlqzUSgNczu2lg9mBZJlN3hcQicqVdMmzk9T4HcSagzQE20?=
 =?us-ascii?Q?5pJEDLvPJf7uhOPzI6aex9/FoSwpve/5axNdvMsCp+HmFEc1QlBVlRkJ0n82?=
 =?us-ascii?Q?Md8p0EmFXGfnnwNeUD1d+RVwpmrkndxDiz1IQDKFBhGZrmF+JjLzE8aK2s48?=
 =?us-ascii?Q?MGS51ZZRjgmF2ear9IrfOpIN4Dnb+MHHszOKLhR0uM75YGayDtO6VDIkOSnr?=
 =?us-ascii?Q?Xj6O95fIHeiYYFHsTktFW8r39HxLg+Im0TeMsk2jx4RX7nG8VteWRJsRUN3Z?=
 =?us-ascii?Q?Ic7Rq2P96UJ+9GMX44YfwYGWtJim3H+ms4hGMDEuB8LPNF61Ejbjx/BgaabN?=
 =?us-ascii?Q?jH52oz8sz16XkyOLJhZJ68GBp9254MPf6t3dMoVgDBixmGRh+10Wio691JGv?=
 =?us-ascii?Q?KOLHF3fDRHRkw03oDhW5H4yY/GyNcP4qEo3pOH6ZnMij6k+h3uIYeCHPHAxY?=
 =?us-ascii?Q?Llp6Ie3BTEWU0iHpqyKdlh3NoEH4aElZpp2YM0du9qTRGW+PrVcjkS7NEtoT?=
 =?us-ascii?Q?01kJ2KEbzSAtX0a7fcKBE4Suz/QV9if0YAOELHYJcHmoVwCuV/LbTXvlDIG+?=
 =?us-ascii?Q?jYpEuN3N/Fuik7CJwn28V9hEqz2QtwPWCnZZoZz1ZwasqfRwrbhtHLgMfWXz?=
 =?us-ascii?Q?5TJNVh2PTtExgSbNgbZgvb4k+BCdIomrhDz2VzUBAgITpylIZO7upmqQFmHi?=
 =?us-ascii?Q?B5SAZb3HqM7763SrLkJClYsiOgWAYjv/lbZ3dphKlNIRew/Ph+bI5abnc64L?=
 =?us-ascii?Q?YmoOj9CoTRIVxPryGbKFfridxdZPvCcrTqIDOkPr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f085dec-bb7f-4398-0310-08de128c93b1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 23:33:32.2894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NhfAIQ9B42Qz6nnWlWwfU5owIsJBkI/Vw+qzHOSrbH63ZhTVW4eFnpNDBFYKh5NS
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

No driver uses it now, all are using get_region_info_caps().

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/vfio_main.c | 50 +++++++++++++++++-----------------------
 include/linux/vfio.h     |  2 --
 2 files changed, 21 insertions(+), 31 deletions(-)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 82e7d79b1f9fe2..f911c1980c9420 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1263,48 +1263,40 @@ static long vfio_get_region_info(struct vfio_device *device,
 				 struct vfio_region_info __user *arg)
 {
 	unsigned long minsz = offsetofend(struct vfio_region_info, offset);
+	struct vfio_info_cap caps = { .buf = NULL, .size = 0 };
 	struct vfio_region_info info = {};
 	int ret;
 
+	if (unlikely(!device->ops->get_region_info_caps))
+		return -EINVAL;
+
 	if (copy_from_user(&info, arg, minsz))
 		return -EFAULT;
 	if (info.argsz < minsz)
 		return -EINVAL;
 
-	if (device->ops->get_region_info_caps) {
-		struct vfio_info_cap caps = { .buf = NULL, .size = 0 };
+	ret = device->ops->get_region_info_caps(device, &info, &caps);
+	if (ret)
+		return ret;
 
-		ret = device->ops->get_region_info_caps(device, &info, &caps);
-		if (ret)
-			return ret;
-
-		if (caps.size) {
-			info.flags |= VFIO_REGION_INFO_FLAG_CAPS;
-			if (info.argsz < sizeof(info) + caps.size) {
-				info.argsz = sizeof(info) + caps.size;
-				info.cap_offset = 0;
-			} else {
-				vfio_info_cap_shift(&caps, sizeof(info));
-				if (copy_to_user(arg + 1, caps.buf,
-						 caps.size)) {
-					kfree(caps.buf);
-					return -EFAULT;
-				}
-				info.cap_offset = sizeof(info);
+	if (caps.size) {
+		info.flags |= VFIO_REGION_INFO_FLAG_CAPS;
+		if (info.argsz < sizeof(info) + caps.size) {
+			info.argsz = sizeof(info) + caps.size;
+			info.cap_offset = 0;
+		} else {
+			vfio_info_cap_shift(&caps, sizeof(info));
+			if (copy_to_user(arg + 1, caps.buf, caps.size)) {
+				kfree(caps.buf);
+				return -EFAULT;
 			}
-			kfree(caps.buf);
+			info.cap_offset = sizeof(info);
 		}
-
-		if (copy_to_user(arg, &info, minsz))
-			return -EFAULT;
-	} else if (device->ops->get_region_info) {
-		ret = device->ops->get_region_info(device, arg);
-		if (ret)
-			return ret;
-	} else {
-		return -EINVAL;
+		kfree(caps.buf);
 	}
 
+	if (copy_to_user(arg, &info, minsz))
+		return -EFAULT;
 	return 0;
 }
 
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 6311ddc837701d..8e1ddb48b9b54e 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -133,8 +133,6 @@ struct vfio_device_ops {
 			 size_t count, loff_t *size);
 	long	(*ioctl)(struct vfio_device *vdev, unsigned int cmd,
 			 unsigned long arg);
-	int	(*get_region_info)(struct vfio_device *vdev,
-				   struct vfio_region_info __user *arg);
 	int	(*get_region_info_caps)(struct vfio_device *vdev,
 					struct vfio_region_info *info,
 					struct vfio_info_cap *caps);
-- 
2.43.0

