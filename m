Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 532C7C03C05
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 01:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80ED10E988;
	Thu, 23 Oct 2025 23:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SThVGUr4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012029.outbound.protection.outlook.com
 [40.93.195.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9507410E04E;
 Thu, 23 Oct 2025 23:09:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNC0nu6cb2KZWwdYLfZDLkZZn5mXB0mP0gWA1CpsNWCLbPP7/crfwVhC0SA73NqgfOa/B6f/IdIPRU3AK04yJpUbbQqmbKkMWUBgeQs09n/oG0HF5/o8aIwxXQrxyxnv0jcps8M66fE3GjfdXrqPJ6yryKY+5kf5FDHLIhYrS7h7tR062asQx43XVlaKb5pu1uiJcfrKG/f+CsMUBt22GZPvRQxG7onVOo8IEeyeAFAZQDHP+hfglzwWyIG1139RC6SWBK70nf1svWsmInI0tSXR3myuVJ2EZI4TqYYKSfzZJAIOiU6hnw32K5UJMNX9QCJgkwsd2nNIP8RdRJEasA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZPRM+mgp7O7r5SMKQ+l1cMFanWWWTJ34FEWRAUW8ts=;
 b=qv3RP6mo9XanPhc43bLzvWZqliQAVxc1GgP23jXCkVSED26CDvibn6lLn/yoj7qy74k5MGSOuuBGOPenm4l1YZjP8jeDdQvRs7tlBUKYfHebmsTzgCchqZj3OyQkBvpkifUwOdi2eTdBXmV4djp6kyo2KHF/RB2woT6tfn19UyDL1RqmyK5VpioZHDx8hyySCfXdEXAX9sWTCMxBgkbzDshUfYaOF3jMr5xfBOUmRKrXX1XQtuK4V6NT2xBZqQXuwyq2kGWFbZHOKeILZeKqCZ90hzQLojbV5B2cZj7B8zESWl97mvpZZErdSc5KKHhSAAANBRl3Gy4IqZ2JRmLRBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZPRM+mgp7O7r5SMKQ+l1cMFanWWWTJ34FEWRAUW8ts=;
 b=SThVGUr4+/CYoigsHhhN4SM66/vEUWBSoz2KLqQ7LfTuIuexVBagXi3rDwk6nt4mzNH8IVHOPNReSor9ogTOOhTl6vWYteB81EXx1VTb9dTFnnYxtoqYSaKcbn4oKdxQfTWWOxTPBFBLG0kYancfJKq1eaFGIVkYuqve+yBYcny4OyXyhleeHzj7E7iNGjKjzPnhwYAFYB9QMZDLR8DRYpxtYQTbLPjX35DLREOUwLRyIb+Ar+f202L0NnTpoE7KZhPUey8xWSt9Emkwfyigo8XmE/mq1cZNWDQYJC0urqFJjMKjluf7uGhvyFJaytAKD2g92r9pv19xp0N7PvYlvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 23:09:43 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 23:09:42 +0000
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
Subject: [PATCH 12/22] vfio/ccw: Provide a get_region_info op
Date: Thu, 23 Oct 2025 20:09:26 -0300
Message-ID: <12-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:a03:333::20) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: 555dc79f-310b-44dc-9456-08de12893f20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bSnQfZIqHU21641AarO6Mn4PYeGkSRHUIJZSeeSohx34yiFuotzhN5aNpD3i?=
 =?us-ascii?Q?iRTwBqnTiJ8goDEGLJsHjauzfTDmOPP6/D8u2fs6r9fnVVSIq5+PrMGUZOXg?=
 =?us-ascii?Q?wcXCY0xwlcG9SH62cOjP+yXPUDeVuNqD+TmLajiOOv8zSJQdSh2aPrAoKCMN?=
 =?us-ascii?Q?8TJ0KgIS+9muybMvrBQypfE+f5lUi76U2NV0wWRuhrKuAUgwExyT+4laxBen?=
 =?us-ascii?Q?9WPcuWqmwA+a3Od8QNUlxrdSM/WyqMaUCR2ND7tddkHyffV+uL8yhQ521llk?=
 =?us-ascii?Q?gXFhhTmHNIx9rbM4jsJBVCKY+tYBRvhqAX4pwYTE3Fn6uS1hc8leIPUtYWu4?=
 =?us-ascii?Q?CKu1llEn/AVdpaTH3POOJ5eR09MQMgqVEc/IfxTn+QHw0mzk7sOxEJUnCkIh?=
 =?us-ascii?Q?dMTwI88EhNBlkHI9cmkme9rZQh+vmcLSlRJHottKVxffmHjDNpdF0VYHHo3s?=
 =?us-ascii?Q?heLgDUFdo5q/0V4rjZM9LYfHmPr3GvhQ5TUhzwzqByUJvp480X78dzHg0ldf?=
 =?us-ascii?Q?AztT7pBwZQt4MjDrTmefBdWKoXz7rVUJaHtDdG/tGwSM7Gy/N2k5FqgWh/Ho?=
 =?us-ascii?Q?GjIrc8+kXPsp3w/KuuyUKa0aZJJG1us4FnR7uE+vgJHoprAdCWF7VAQc43F5?=
 =?us-ascii?Q?8sfX24UDOySwROH7P9C/iGUWY+Tt7meIjgSBHncf2LfP4bwcRF68r9g67kvO?=
 =?us-ascii?Q?5S0bUqqFOwmcSyKvOyrcwUriora4sLO1HUoMGgNeEtUZbNG5CW3cjXKv+aB8?=
 =?us-ascii?Q?Z/7M4asKOk0cMagQHAXo0ytlx2iAypw8l9eIVlNxH4CPtq4s4QrD6ifLnEnG?=
 =?us-ascii?Q?sFa/dfk2x7+sGwyaujLT7g+QES8vbiA++uGjNiWOOAneXGWMA+QEn9gqV7Y1?=
 =?us-ascii?Q?S50ohBE7Yk09erhLOtrwpU+is+m9wcmQyQrRpk7TCFgVCTBWV/pDSB7b2+8C?=
 =?us-ascii?Q?hlEfsKrwJvTpl4lXM7peMBTB/SJNGTbBBNjX1QknyDD8IJoVozfbhKvMJeLa?=
 =?us-ascii?Q?OqQy+JNByrN2vzVYV/ir5c+yFINy1Zdmu+oB3a8CufgSJiZWYTDmPaKWFsrI?=
 =?us-ascii?Q?pTIxlhp8G4jbK48UW3g0TtV1CEaLlaCNKdvFqAFekzZOgzYTRIlbSbss9xdO?=
 =?us-ascii?Q?pTq98lwOWPZBTT5AAwRYuJMIRVyBmCFfn+ueBiHueZjVPzNxH3L3EhcfrIG8?=
 =?us-ascii?Q?dHz70H9IXxuteUxXvlTuCsIMxQHW+A7f8HqhWwoFaQakNf3fohVn2QFVRGQK?=
 =?us-ascii?Q?jHxFZy93g4l8gjP8Frf+zLKkcYQQuxoq5JAFxFMFby01dQcH6vdtOXv3acMk?=
 =?us-ascii?Q?s0uBujWV1Ju4ol7NYxsRsq5mVQ0gOKy1xZFxTDqBa7VCLYTIzDKRaS7tus4v?=
 =?us-ascii?Q?nyrNGfEagvKFtwH+9uIscGgeUxF7gYxUAls0slMBJCMcsQEsDwVQ0G7kD4In?=
 =?us-ascii?Q?u4KPZIO0kGl/O0joCaRYFtoN3uYeQT8p8v9+JQ8EHjTbZAidzvYrPdxaYCI9?=
 =?us-ascii?Q?TqqIaHUNE4vS4ys=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dgCVorWQ07+9iNVES5JayC4hQVDTBAxs7pMBks9ss9BROCqmJYxvPmu3WtsR?=
 =?us-ascii?Q?QvDEaCoqBYbsz6lPsQzUEO7X+MrHpKgV2tPU9mdcGUUqOtV1zxVw6nU4xikP?=
 =?us-ascii?Q?oWfR4HiEdEvY5CBcWCWafu/AWvX3/f0Da8E2YIbuGcBuJVGCIebmYw6xwnMQ?=
 =?us-ascii?Q?K2fA0f/2adZd9FtHsJ/P0IPpY4V9K3bQ+lNLSAOF6s8yab7oKeWxDQzbf8g7?=
 =?us-ascii?Q?O/XcqUHJU6AtHeCCsF8vJoEhQrreN/IEcjlOia4aPqv5SUESqsNzPKCLepjt?=
 =?us-ascii?Q?HNivHJr8zasxBVU6IDh8B/TFqaxk4/ziCY0Wdm5Sc/vmO3C8BSqvJR7SkJEs?=
 =?us-ascii?Q?Z5+8p64TfKJxAUJu9V6FPKl8bOfjDdNTm7X5xa3CLkq6LwWzNow015LBdU/2?=
 =?us-ascii?Q?87lMZzoTurs2jUHe6b3FD1ikfyum9f/rNUUsAJDrWnqQhc7sa+UXZL8L5tNn?=
 =?us-ascii?Q?2gj9DJKS3InMygO3BcoRsm9FzSt4WoOYTsSpJnqmpzhccfOS1z2Uk01CxB7d?=
 =?us-ascii?Q?8d+OZ2uyHzDVeyyg8T/jHbe+EBLM5m1b0GLXebh7R2R8l0U9vMsLz8iTx38y?=
 =?us-ascii?Q?N1faLOMPJJIeO1RHi6zKEK/c+GIDEWfU5QeGAnEoRWwMYCjBXcJHqqam8CML?=
 =?us-ascii?Q?+D22Q2YqldJXuwa3ZXuk00iu0pjTdTKj66ZDAY4+ua1G/sfCklLC7H+ksap3?=
 =?us-ascii?Q?BUguYORHB2efbHWZ0YpBAmpyQ6Ls74DYkPZRP5D74E+LYr3iuvr8lh4CZEr8?=
 =?us-ascii?Q?WXzkgd+lLbQmAOIzVv4LDmTglNud4nir0xqW5RguD7kU7I9eTVbthfxXCFK1?=
 =?us-ascii?Q?+fEpYAkaQ9YiKsgLOAATA6qWaYArLUz9J9hW2fO08CEND3VIPFCasfuTVRnJ?=
 =?us-ascii?Q?oovOnKi6JsULe1nx4AQcvL2wQDXyuM4vIojAHORAYeQttoh1M1n4ukzhYB8X?=
 =?us-ascii?Q?ur5GnzSuYwpVhcC4afDVktU2QhSfoSz9wnu0ovvCTpzNznvsHs/VSvxgqi02?=
 =?us-ascii?Q?1/p5RduJxWIv6RE9eTbSS0NjDJBV/tuZOLkj7Gkmofvgx4vrESpbzwmQiJVM?=
 =?us-ascii?Q?Dya/r+tlJtP+vCfgjtc30Xc984L/mlI4TRmvvrsjQFph68vEOdBSZKdNNZuf?=
 =?us-ascii?Q?DuiBA8gDaxiAJaxONNQo4WcGMSyv/yx89ME/kwt9fVkL3lj0NqU+PyKj5Mys?=
 =?us-ascii?Q?QCSLc7zITxVBBKh8EenSMnfX0y6KIyi7ELm9Exa4rfzrildKdAWyGi5pXdzc?=
 =?us-ascii?Q?wWk5J7TKX2rnMU3coaEM6lEc1UhqUE5/8M/G+zh4O5u15FCOmotuXf9bjoOI?=
 =?us-ascii?Q?rsN3PKhzvF9yp8FmXkf/omPJJTkeTKbQjsS+GPZpkNiqlttxqJ9c0owYg8OQ?=
 =?us-ascii?Q?iClnzuKyn3RQLtPeMUuzEgkldrXxu73BbnPsx+xZNHv1xiajy1XOm3Uw2YgP?=
 =?us-ascii?Q?qWsBIBRI/0BnD8FzGAw94IZXeyyB1lTV4v7k4cvSSZdSpYHS8ctKCbnm0WtA?=
 =?us-ascii?Q?tCb1GfNCQMXxjoyTV1YiG2wQjiBSKIBmEQDuKj4pvcz4Sqp50sPPJSFS3py/?=
 =?us-ascii?Q?UplJdR+6zWMpcVIAdv7hx09J4prT6wInrGCpYs9p?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 555dc79f-310b-44dc-9456-08de12893f20
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 23:09:41.3789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0dbveBJinXMapKS8lMLhzy+Z6q3QGWsqzJaTGgt1OWM1xhKpWbHEcZX3SH1ceQRZ
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

Move it out of vfio_ccw_mdev_ioctl() and re-indent it.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/s390/cio/vfio_ccw_ops.c | 44 +++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index ea532a8a4a0c29..6d46e0bc76df15 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -504,6 +504,31 @@ void vfio_ccw_unregister_dev_regions(struct vfio_ccw_private *private)
 	private->region = NULL;
 }
 
+static int
+vfio_ccw_mdev_ioctl_get_region_info(struct vfio_device *vdev,
+				    struct vfio_region_info __user *arg)
+{
+	struct vfio_ccw_private *private =
+		container_of(vdev, struct vfio_ccw_private, vdev);
+	struct vfio_region_info info;
+	unsigned long minsz;
+	int ret;
+
+	minsz = offsetofend(struct vfio_region_info, offset);
+
+	if (copy_from_user(&info, arg, minsz))
+		return -EFAULT;
+
+	if (info.argsz < minsz)
+		return -EINVAL;
+
+	ret = vfio_ccw_mdev_get_region_info(private, &info, arg);
+	if (ret)
+		return ret;
+
+	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
+}
+
 static ssize_t vfio_ccw_mdev_ioctl(struct vfio_device *vdev,
 				   unsigned int cmd,
 				   unsigned long arg)
@@ -532,24 +557,6 @@ static ssize_t vfio_ccw_mdev_ioctl(struct vfio_device *vdev,
 
 		return copy_to_user((void __user *)arg, &info, minsz) ? -EFAULT : 0;
 	}
-	case VFIO_DEVICE_GET_REGION_INFO:
-	{
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
-		ret = vfio_ccw_mdev_get_region_info(private, &info, arg);
-		if (ret)
-			return ret;
-
-		return copy_to_user((void __user *)arg, &info, minsz) ? -EFAULT : 0;
-	}
 	case VFIO_DEVICE_GET_IRQ_INFO:
 	{
 		struct vfio_irq_info info;
@@ -627,6 +634,7 @@ static const struct vfio_device_ops vfio_ccw_dev_ops = {
 	.read = vfio_ccw_mdev_read,
 	.write = vfio_ccw_mdev_write,
 	.ioctl = vfio_ccw_mdev_ioctl,
+	.get_region_info = vfio_ccw_mdev_ioctl_get_region_info,
 	.request = vfio_ccw_mdev_request,
 	.dma_unmap = vfio_ccw_dma_unmap,
 	.bind_iommufd = vfio_iommufd_emulated_bind,
-- 
2.43.0

