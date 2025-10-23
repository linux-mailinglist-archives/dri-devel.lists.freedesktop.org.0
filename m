Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C0FC03BED
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 01:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A10110E982;
	Thu, 23 Oct 2025 23:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SctY9aeQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012011.outbound.protection.outlook.com
 [40.93.195.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A9D10E04E;
 Thu, 23 Oct 2025 23:09:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=byiprZSxm96Zaqqrh8DN7XlfS8zb81DyQm2STBOpIlcF26dlHALvnqFMZg/SK9aK2osguKPcfXGps34eeV/0eriqZFwp2EcG4Tz09udCKBBMcpjBNB++pHyxquvbpQieku+Cnh0VmErRcf4biaktOa124XeVbotsyFNJV10/CwIsWfPqaoT23AThlCMksHPltvcXbvzYmoORGG5g3F7TELEsZxt64Kxv8Wdwlovm4NnZDeBbEUJ3c0qc0D6F+0hw3SyjfxVooR9ndR6sXzjdr7IWUwcYfzTnN2dA6/MK+d6LKn1d5gA98FiQzqmwSVOcLIIdiJ6vKVup7dVRlmVS2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0g3icqFu3Fz+ezNVCkNoJRr/66ojUTNCWyyKwbvTIA=;
 b=o0/ZnO/Q6wx88FNw97wdfkZN9yUHf/I1LrYDlgzbMovAMGVqqDV451qdQl4ss+Oe0P271Mb8rsZSOa0Rb7QKKJ0rMq8GMQASo1XIUc+b1tj8NE8gEsXlqTRCS7ugQibfrNxHnPEWaLiaF8QwPmGzT4aq+s5cW/XyzIF0mH1+OONIYU8tWvdV7mwYgN3CsgJMIDEf/zd8p2/xHRjgrd8G13Wk7aRqCy77Ua5Kn7VarSiu72AMndTUC82kOwiVbmBdgcvRLz1unJ7qbTRJADQ5D8+oo23JabsKmLN8fujDlL/xRcECJXgx5gR2MetM2TKZAVmPxnNSno5Ty8p19th+wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0g3icqFu3Fz+ezNVCkNoJRr/66ojUTNCWyyKwbvTIA=;
 b=SctY9aeQaJDA8vZK9SMCaPGDfZEP43WO8HKZT60k8eE5pEwx1ZbRbGL+vO9WH/+JXrYHL/Neosvt46bm6kphfeGlbOQI7Fw2N01CYEIbAGozzkHXC++WbhQRGvt2hcxCeumUU0b4CwR6jxMBJcedevfjpeSGgK5QtzGmTQlFdnMgstyNbb5I0mOSq8V0/qh+79zjAj5Zf1iWNkr3hvfqGGDN0PAjk2DhPEMZVH8nRNC40MayNMuXRy7HLfz+dOB95DYQVK99xFGUif70EcOu9I+omZ6G4q+vHXFZI+Chw5kpfNwK+vzpGP9urn0Pn8WknLvFDDmZLgqQbONf/p03KA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 23:09:40 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 23:09:40 +0000
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
Subject: [PATCH 03/22] vfio/virtio: Convert to the get_region_info op
Date: Thu, 23 Oct 2025 20:09:17 -0300
Message-ID: <3-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0137.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::22) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c383469-1320-4bea-fde0-08de12893df7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/hw/cYZIRLc0olC6Qd16cYDpzT/wRXVpfNsucDaPhL1FMkPLIYQWNxczBsH1?=
 =?us-ascii?Q?JvdJbrNtgcr/Vng+euDuKjb93awKhYGw4PpaGp+iYNDpJcblCbUo/Bv9F1Ys?=
 =?us-ascii?Q?otcafuu86TPYtN6B5/XEWqyg1lkbVlnRRwReBvq4S9pSt6TPDBYeKzO0FjCs?=
 =?us-ascii?Q?PZaylBxXwfB0Si56kMqcsBZEmOmhfdeh6x5IYhNYs366oVB8LZdH3YT++FGb?=
 =?us-ascii?Q?bqQ0tikSqUa2DvHx0v81yJ5odkUVj+H2JkvIqXbDjhVdc5gVlSi8YwVBbMJI?=
 =?us-ascii?Q?ew2FNnbQSGpPAscfeeYuAb19Y2rdRcHHVG4/6s7WW8jBlMhVbLbE6kz0KiSz?=
 =?us-ascii?Q?6JICMTTie5HQMxHj5poFa9FVpiyaHs000hVO9Lq7edfWLB/1neFru0322jYV?=
 =?us-ascii?Q?U/B582XOAcKWdJh30/lMPsEX0JzkN76P4tlK8I6U2q/nAPW233YE0p73nJhJ?=
 =?us-ascii?Q?mVOYezTFBPsPQEYhUEzFvamgsaHsWwf+kgu8fuU+mt2UbQIg6wwHdcXXOkV7?=
 =?us-ascii?Q?cvZnkN0qYqOHUJShFnBeukMeT4ahT1HRV8O1VeO/S930ODFpvqhjcNYFyHFm?=
 =?us-ascii?Q?i8/LuhsdGwJasxYPiD+KY6BNHoPfRDTD9Xg6tSDDqoGtRSgIY+3Ru1/ciNzX?=
 =?us-ascii?Q?UvoOms+liJDpOKsM4zmacs5mDGz6TtJn+uaJyfoV6i2eyX9Hqw50JMuQgUue?=
 =?us-ascii?Q?3/UQ1YMiQ6n91752EGxYgyoAEGVBf7xkegMAEq9XzS3vaumnysfzl8ts8tQ+?=
 =?us-ascii?Q?pE/c6xs1a4KhYNyFSLIAUFQ0grrNi3On52M8ufWyk2Dyb1LrbIHiTxgxbnZY?=
 =?us-ascii?Q?KGS7TmtL5uVVE4RmU1dPtc1plG3UHXExZox+nnY6guLLhHdRRY8WeY54PpAz?=
 =?us-ascii?Q?3X5saOIZ1CLaysjrhupEtbLwtFvkjAgrz6rcWHEfLK4X2ebMZI13ca0qJdSc?=
 =?us-ascii?Q?WX6mUkJSJDkXWPNZlxMcaUa907A+K+OT3xi59F4e+I5njreEnf3C9Lm/rHF8?=
 =?us-ascii?Q?KDlppirV9vcI7yzMowclq4lqHpMuMrxfeleoCFPoFXHed3lGqMOdWdRGLeKy?=
 =?us-ascii?Q?XLi7z+n1YIeR1VKLX6cudLeY494PJ72rWgiMjcxaQ8l0DfZBvyoba8UyXsE5?=
 =?us-ascii?Q?v041JHma04VjFo6pd/SVflf+qqFQ7afnvxXeoKqbtLQZEHTVLZtdpZGYyg9G?=
 =?us-ascii?Q?BHKy1xPDtIF2AZ0bCte457oExWl8TOnzCO5yhGUhgVTH/6vnbmXxIxGkcq4O?=
 =?us-ascii?Q?shVhSB8ofp5bMWWarrlEEZgjh/KcGDjKXkBlGweJd0GQs6I8LR1l2haTuS2u?=
 =?us-ascii?Q?DeRLqZJrgUlxAWVw6WH7Wbm1aF8t3OirgFEl5f3slMcCym/P21CBjGy+nxdT?=
 =?us-ascii?Q?4O3VcaHiUA36kZZEBQpLnWgknJhjwlwQqd/M2I3aOZVO2zSm8VQBhx0rrAub?=
 =?us-ascii?Q?6rXC8xXVB/CNTXLGiHqmq7AoHn1rD9azLLNvQ9yMnufWJ9V5HFDIZ5S2d/nq?=
 =?us-ascii?Q?cdDXqOrSctPIPgU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u2A36rczinSI5ZjXTLA2+OzSjh6RkzgHBPlpcoskk91hJYRhr8rcUkv1Pm6k?=
 =?us-ascii?Q?vCHAIPAH9DWYjAg1jb3Ilxq+VvKBzPKqZlAOZq/f/a+FE1hFyCFQD/7y6oNn?=
 =?us-ascii?Q?PNMfHc0wNh9WORwCvyZdm/6tKFOHIReHiO/h3QxQu1TqyTl8WNWWbFmeNODD?=
 =?us-ascii?Q?O/wvElytZ73jlPdLfTBg5nnemsH7M0ip47Z+k9oVgjYmEKUX3sdrrqfx7aZB?=
 =?us-ascii?Q?XUEKytdvu0FX5kidsLP6qXix0k96bTBYydppeIYMk7YoB6sGHhdy+lyAy747?=
 =?us-ascii?Q?8DtqvEw7tsCsoUrP8tIcmAy9so1V9O4pdDqMb90jfc9RaOeTsaDWIpkzwkDL?=
 =?us-ascii?Q?ylxnsHUIzHlTyMS80svExNZArATvT4k2xcHURimCqaTlUbq/5K8Ct21QwORu?=
 =?us-ascii?Q?2Iiq6oKr5ptjNT9mx/D6IF+A1Oug5okOJns/Nrd+cHLzyidM/31dJmPxHfRm?=
 =?us-ascii?Q?KE/iH4w6/649tPh7B+UuVg9E128Ol81XsarzX1cK/IhZSVEXN5M4xOxuc7Jo?=
 =?us-ascii?Q?Bdz2vl+sFZXu8XiIlItsUGo3a3U3Bax4q6OSwNMJ6mQ3zjltDiUL+Q9AJL3N?=
 =?us-ascii?Q?JNZQpsQ/LBzeouGOLfUQIX5UXGQCQa/XP2TcNOWLs0tnN95JTUskKgIDXgKB?=
 =?us-ascii?Q?RWvJdyqvi8dHru4ihcY0tMgePDF213ZUyBoXvyq2iZV+kIzPcct3YebN7gdt?=
 =?us-ascii?Q?NSSh9ikLiRptDaKsgz/iuugsIkzbhWDkW6mbCH9sSZa+pg4yHHLkNn/V29Li?=
 =?us-ascii?Q?oGZ7BVYjvDeFnnY6md4Gyt3Hrh3pYDypL5rLLqYsU8NudmBKkmZDUwKzMGGM?=
 =?us-ascii?Q?MJ2I0tAWCbAVJcqK7Ur8Sy7kx97/tz/wxl5nWhxIc/kPEEs8+xrFa/36gvpf?=
 =?us-ascii?Q?+AR/Xo/yRTSHSLh/KYWFUHArciaarMCSBJbnLGkfzkCXUG4SJY1Fd8Jt/J2o?=
 =?us-ascii?Q?X7sgwAta7SM3jGj+SkJbR/D+ltNumQeuMqJMDcUhl0PwsiU87YD2+W5kM7fU?=
 =?us-ascii?Q?HTvYcTDORlrjRfrSeTH39b+fDiVr02mFtY4AcM7Xsy+wYkyBmLvKb6qheVRy?=
 =?us-ascii?Q?vKRBV8f3RMf3ZGZu3KIuzBko2vX3eIy4fVhZLLg4oQj1jL359FsKimWPV5wK?=
 =?us-ascii?Q?geazbzgTjdgNNG4YX6vAf4bLcJ0mJ657lI6CWkAtTuUyp7lkafKPz+F6QFiG?=
 =?us-ascii?Q?YV/AUFmqS8Do2b4bp3mbHl3tDHyiTqBbHQMS1X+ar0RXtJiTm3wiZRSiqBBW?=
 =?us-ascii?Q?Wk5sF7/tqgALzB0Idqr/e8XB8uUK3OcX817sjR2Ame5eTZSOvgHlNYeVYSbE?=
 =?us-ascii?Q?X5vOu6Z873rWLx5rAk7F6iumv1NPMvlsADq0kBKRgZTURdJbrhuUw88veZgq?=
 =?us-ascii?Q?bA+lfFXcFs0uSfteiqhE1OAoCA0Lae5XU+nb+y1x/OOIh5+rOLrUMZb2v6RH?=
 =?us-ascii?Q?GYmCGXr6A+2sxSVEa5zTElOhcQ8tBF6HpdldgKIKBmn039pHdQUUQe5iHp22?=
 =?us-ascii?Q?yoXT7m8025t2WltIaZVrP4xxEJ+xbq4/kPU8UXU4J0ALCVMK0r5IuvOacc3r?=
 =?us-ascii?Q?xvwpSjMs1BgsQrHAHlnXYtVomLrB0wzsIC4AqMc8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c383469-1320-4bea-fde0-08de12893df7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 23:09:39.8810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXaDdKKAb8mjmCiIBvCZKkU6CryfTcPH5orOzqX3WZ+vLKzGNPiox8UJaZ714N3x
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

Remove virtiovf_vfio_pci_core_ioctl() and change the signature of
virtiovf_pci_ioctl_get_region_info().

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/pci/virtio/common.h    |  4 +---
 drivers/vfio/pci/virtio/legacy_io.c | 20 ++++----------------
 drivers/vfio/pci/virtio/main.c      |  3 ++-
 3 files changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/vfio/pci/virtio/common.h b/drivers/vfio/pci/virtio/common.h
index c7d7e27af386e9..a10f2d92cb6238 100644
--- a/drivers/vfio/pci/virtio/common.h
+++ b/drivers/vfio/pci/virtio/common.h
@@ -109,10 +109,8 @@ void virtiovf_migration_reset_done(struct pci_dev *pdev);
 
 #ifdef CONFIG_VIRTIO_VFIO_PCI_ADMIN_LEGACY
 int virtiovf_open_legacy_io(struct virtiovf_pci_core_device *virtvdev);
-long virtiovf_vfio_pci_core_ioctl(struct vfio_device *core_vdev,
-				  unsigned int cmd, unsigned long arg);
 int virtiovf_pci_ioctl_get_region_info(struct vfio_device *core_vdev,
-				       unsigned int cmd, unsigned long arg);
+				       struct vfio_region_info __user *arg);
 ssize_t virtiovf_pci_core_write(struct vfio_device *core_vdev,
 				const char __user *buf, size_t count,
 				loff_t *ppos);
diff --git a/drivers/vfio/pci/virtio/legacy_io.c b/drivers/vfio/pci/virtio/legacy_io.c
index 832af5ba267c49..d735d5c4bd7775 100644
--- a/drivers/vfio/pci/virtio/legacy_io.c
+++ b/drivers/vfio/pci/virtio/legacy_io.c
@@ -281,15 +281,14 @@ ssize_t virtiovf_pci_core_write(struct vfio_device *core_vdev, const char __user
 }
 
 int virtiovf_pci_ioctl_get_region_info(struct vfio_device *core_vdev,
-				       unsigned int cmd, unsigned long arg)
+				       struct vfio_region_info __user *arg)
 {
 	struct virtiovf_pci_core_device *virtvdev = container_of(
 		core_vdev, struct virtiovf_pci_core_device, core_device.vdev);
 	unsigned long minsz = offsetofend(struct vfio_region_info, offset);
-	void __user *uarg = (void __user *)arg;
 	struct vfio_region_info info = {};
 
-	if (copy_from_user(&info, uarg, minsz))
+	if (copy_from_user(&info, arg, minsz))
 		return -EFAULT;
 
 	if (info.argsz < minsz)
@@ -301,20 +300,9 @@ int virtiovf_pci_ioctl_get_region_info(struct vfio_device *core_vdev,
 		info.size = virtvdev->bar0_virtual_buf_size;
 		info.flags = VFIO_REGION_INFO_FLAG_READ |
 			     VFIO_REGION_INFO_FLAG_WRITE;
-		return copy_to_user(uarg, &info, minsz) ? -EFAULT : 0;
+		return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
 	default:
-		return vfio_pci_core_ioctl(core_vdev, cmd, arg);
-	}
-}
-
-long virtiovf_vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
-				  unsigned long arg)
-{
-	switch (cmd) {
-	case VFIO_DEVICE_GET_REGION_INFO:
-		return virtiovf_pci_ioctl_get_region_info(core_vdev, cmd, arg);
-	default:
-		return vfio_pci_core_ioctl(core_vdev, cmd, arg);
+		return vfio_pci_ioctl_get_region_info(core_vdev, arg);
 	}
 }
 
diff --git a/drivers/vfio/pci/virtio/main.c b/drivers/vfio/pci/virtio/main.c
index 8084f3e36a9f70..92b525e52abe4d 100644
--- a/drivers/vfio/pci/virtio/main.c
+++ b/drivers/vfio/pci/virtio/main.c
@@ -108,7 +108,8 @@ static const struct vfio_device_ops virtiovf_vfio_pci_tran_lm_ops = {
 	.release = virtiovf_pci_core_release_dev,
 	.open_device = virtiovf_pci_open_device,
 	.close_device = virtiovf_pci_close_device,
-	.ioctl = virtiovf_vfio_pci_core_ioctl,
+	.ioctl = vfio_pci_core_ioctl,
+	.get_region_info = virtiovf_pci_ioctl_get_region_info,
 	.device_feature = vfio_pci_core_ioctl_feature,
 	.read = virtiovf_pci_core_read,
 	.write = virtiovf_pci_core_write,
-- 
2.43.0

