Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A984EC03C35
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 01:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993F110E996;
	Thu, 23 Oct 2025 23:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="P3a0GtLV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012007.outbound.protection.outlook.com
 [40.93.195.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68E110E986;
 Thu, 23 Oct 2025 23:09:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=joifCk59fdjHuArAbkCIQgcwDZqy8lt7IyTV/e7dr19iXzZI2vFweLYm9RXiUSH3JU9tbmnAxXc4gEHt7luPEE50Wfl0gne1KfbFKEVf1Cs25/JGXocHdJtrnWiqH3ZE7T/jRFLLyHVRoHjVrSk9cNH2zp8zoy5oMYU7u7/bjV+QN/nearTnsELgELFh/imeqaOPDMzc4dGQ0uGAZrXL9RuY+LcOE3H5nFqgZc6NpDxNy15vDQri/eyue0D6cdujDivnDDqpb8/pIgEHoeBnU+i6H0vXCHIatqdeQAaWc14owixe8cQBgwrKBkrZmJpSrBInLJy+bois5D99tCILOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96oEibw/XTSvHPGMgILEZZqLmlEesB+47+6i9j2XZk4=;
 b=GfFI4HENFwgpo3OJ9jba35MsnTMEZ3ioIRNG6m4HUiDZ9RdAseb2CAuE4U4tLzRy31r5WK/dQSngqz2mtz17WVC4APpPbl0Rk8DNcOIMRKRPPrY4n8l9BVlhtVJLYhvuuWMzvkA7063cCKD6GYNPb9wYZGPP4FNIG/bKMPBLTzmvuRmu0NPcocP09wSUoFM1UQNBwvTddG07ie6/z33AaATf/BOmadfvL4uT03Ad1r9AV8v20NWuQIT1TkcybYBlbfrRBzutHV/aN8irqiTmZETpuj1bzN31JKgi8/5UbufmricGJA8wp9MgfzHrvJ/hHFQ/G2KXc33R8/tO+ry1Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96oEibw/XTSvHPGMgILEZZqLmlEesB+47+6i9j2XZk4=;
 b=P3a0GtLVNBfonBfDb8tHVk80SXZCXeYXe5ovT5+NRtzF8Q+C+a+xRb5DH/IuX66Y2zCcoJEfoJtCzLn4NJi8bfvAcPx5ZbKd0+sVQDljszMA3aSK5Cw+fbj89pneh40ruNlB+2EJe3b3l5JsB2butV1cZhcwQl2XPJOzgLQwOr/2KROfA42AysWfZLo9nXABXu4YaRg0bN+WPrKE9pzJh0ipVz5miTZtTFonPLl4wmsu0C7PpSTvP9M64dKNfrkXy+sm5vcDGE7Shb9wMUbCgjtmiN7bRHyHep1JfvwEB/WVjVK1OLZTiZLygsv8tcAGU6ovZBE5KUEAkxt+hZahow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 23:09:44 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 23:09:44 +0000
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
Subject: [PATCH 02/22] vfio/hisi: Convert to the get_region_info op
Date: Thu, 23 Oct 2025 20:09:16 -0300
Message-ID: <2-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0009.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::22) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a8a981c-0042-43b4-5c58-08de12893f8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YGhVF55NJH+9veeGhpZhsJYpNK4vZKxJ/ywFB+UPo+IwFVWJj7RUML+x7aC4?=
 =?us-ascii?Q?uvPfnKKPWlndzXV1VGzLJyW40mQH4/pEURhvY5cTKBBtZ+sK3R3xSbXmBMqi?=
 =?us-ascii?Q?xQBJypZWnxyJhyC/mmAN7JhlIqTtszSQckAnHADBzqFeTJ7Z3F/+xWnzxxW7?=
 =?us-ascii?Q?zE5LtzGpWD+x1DLqEKYmR0+mEX3xXpgDRNSwOP99JEhnXco/UFmCN6O51ncG?=
 =?us-ascii?Q?ODEJJz0uqbcUYP/BBDvFUQl15g28ouF+lnEah3+P8yji8LlSRcUuu6b6Z1EV?=
 =?us-ascii?Q?Csvy01Il4URuD5HAz/wlJYDdUUEUXtQSsxHK4AeA20pOdI6XV1x+t65941+4?=
 =?us-ascii?Q?OT/uW3RiNYNgyp3Irc6AufNe0P17rVZ2jlq2YeLJYmyaUKI+xlFutm5URG6f?=
 =?us-ascii?Q?hZTH+9wNVHUCwieFweZxx41CiCoGlgo80NedbWztuyHdfRl0YhMV3uYuYX3v?=
 =?us-ascii?Q?jYmGIJkVXWfrmurqecc8BC8Wwi5OUS43KVSRPuwpaDFooPjM4HZrwxlNR9T7?=
 =?us-ascii?Q?rSgNL+xdOXdGIc/Xoq714SA5WplYMsO3sYvr8Egb9i+z0QXFyLIdiWswWFdD?=
 =?us-ascii?Q?D2AciADOJFH2wyEcIsdwzYzzyazaD146Mc7dcsRcDzzobwdj8PId3Tv+4eeO?=
 =?us-ascii?Q?Mxb280R5oBv0FCLcV1/RKVj3J/Wv84Kd8koFJEjcftvWsQXGGS5/b81X+iAn?=
 =?us-ascii?Q?+fbiotZoYeyaF0MQ41OVLOgh+5Wd/BYc0oa7URHIHkBZpD3oqvMazVDy65pG?=
 =?us-ascii?Q?TkdrdTYYuCnuH8qHy/ZeEBwthX22hkjgdOAyzQVKHE07dFHcjyqM8YeTopK+?=
 =?us-ascii?Q?z6Zo0zOzdwOOGZpp4PK5rrbO3UP+TnH3hWXzI785//64dtgcbHHVh8bV1RJj?=
 =?us-ascii?Q?F4m69YMNXpiibUyTPBCk7jgvklYVAHlYWcvkpeZ5+3tnSjsDv87hBsu/k3dX?=
 =?us-ascii?Q?0l/WxoQh0Pms873GqZalXPFkwLYy8RXo2sYEJO6L/Yu3Tt/oVNRtsOsP+aKh?=
 =?us-ascii?Q?wQJWWKUPgtP7/H9F3OvpWlA9VxNbjbXH/1qu7cD27X5SPL11JRAZHIA1viae?=
 =?us-ascii?Q?Tna4LQ3eXDcnvZGeXomc4bnx0kqQp3OpCEWBTJSMN2qHs5dK02BL031voEDc?=
 =?us-ascii?Q?GlE/3SxB0Kzh6GvRSSXgKPbZ9GLLqF/ZwxQnQMySrPIhFp//s3zQkCkcyCA5?=
 =?us-ascii?Q?NdLThfrHbZ1NHtieIpKxS7EipLtLdODRRgVjTSvnxjhBlrC/6YRTxKd833MX?=
 =?us-ascii?Q?odHmFbUxFqg/udPT8A57dcUoCgChtOntSh03JHRVAECPTNt90zmI8ZL0aZxl?=
 =?us-ascii?Q?jKn6+X62uGJ25MQ72dMPggds5lsh1aVLWoaou5Nso0LWLi45aGpzOsZPGRBX?=
 =?us-ascii?Q?5+SkcJ66asa1ZhdNtPa9KaxiDx7g+i9pQBg85Uh7KjDish/d0o0kuE4M2gWf?=
 =?us-ascii?Q?4zEGL1ki1390HY1SPx+uQd5PWsR3ulUqtI2FEQXFYHzpQUebN0rbFx6j/gmJ?=
 =?us-ascii?Q?qJEsrXKC/5jubig=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ATw7lUyLDn3eXMqQzO2jAX+VLbWy8zy7NTy/X04DlkEA+6mw0Lqrff4HU14i?=
 =?us-ascii?Q?egTdAZOdPDaZHwT5+QvDppIyEUy4zvhccpCsact3df4turQXWD1heetMiGyf?=
 =?us-ascii?Q?T9Ched3uRVRZU9cYhpR2iUMGOzqV4VG3du+DZdwsAUtZHIOLpDXpgqXQFyeB?=
 =?us-ascii?Q?bEzOtIglNdXGEYokQUyUNQJEScBBl3EbM62H2Pm9hl/Mqtb1dcfdUfRRMqhp?=
 =?us-ascii?Q?xdmGvTKRKdDyMmxUnx1QD1vsDsOtKcVMYZair5McYRl0oLsN73+hBNkVY7t3?=
 =?us-ascii?Q?DwKiyrfu9QvODSEL6j/oNuv05YvIQCwOKv47dNwbh3P8dVWh8cfUTYKb/5YK?=
 =?us-ascii?Q?N46/nCjFhhmT8TwyC8lFm8Nub3Md8+lyt2N4+ExTt9TtEofkbILJOUkGu+3+?=
 =?us-ascii?Q?mRcGcWsTmEuNJM1r+vXh67GXgRawHeWJ+OAnnGyiTdasJRRsalN7kXMUXHAT?=
 =?us-ascii?Q?ueEjlXWuvvZsHjoLJ0AF/K6uvY6PJyOWvFYeOliJjkTsig7an1LV+Lfu11yz?=
 =?us-ascii?Q?s4SbK+jIVJxMYocdhZiDb0lInIdUPRoCuZtb5bsU3hW0yz5hj1g60kNN1TCI?=
 =?us-ascii?Q?jVk3UskMHWTjU4iTlymYVU+yUkI67s3jsEJJRd3+JpgBwjzlHEIWFQwIgTZf?=
 =?us-ascii?Q?6//l06P5HtlH6mhI0b0rwOSe3yx//ZdC8hWQVHg6Ss44T1RWNlhI7iYF/KXw?=
 =?us-ascii?Q?5iqXNtTqnYan0dzOhIh154+y0dCXxMBnti64LfSsOPcNbreSVGK3VFFZ4YCx?=
 =?us-ascii?Q?pUXlbf8aTg8W0/7bv0NSLXrBiSqtTgrySY9KTPE8+Rk4BQ9MKnpYveboULv9?=
 =?us-ascii?Q?jYYL1Rd0qKpqrdcmwrswzOiFTj8b8XyJ6y8Ao+u0gglPwuP60j0VLeUOSzQY?=
 =?us-ascii?Q?IXylmd5nmm1cgnhi2HSdgQQ7AEZefnOqIeJFyET39hxOcHV19CpXWDYCW+xk?=
 =?us-ascii?Q?rpWBKrmMLROlcd/1MwP+zIVY8QnPz0l0v1Sv74pRsJgP2BfeXeB7Q6Dxrrdm?=
 =?us-ascii?Q?otT7pxp9gaJpLL4ZCKfA4TcH01fpKdsrAFheSW3v1UEIyGN4kiWGHWN58bMa?=
 =?us-ascii?Q?SJcDYqnWkjZGHvuzMK4pHEEgd7Xckw1ZSRhxcOhMxJdQJUF21E5t6cMWPzvN?=
 =?us-ascii?Q?igGn8gm08zzaWZR4tyXSTqaEN5M5AL5a6COCoqXu00i8YPdOkVk+cZ1ym4I+?=
 =?us-ascii?Q?RvY5ORRIT88sOY2s4JuX7zpUgyoGxhHrl3dXZmVe+YhHldJu7EuqC9sVTb5/?=
 =?us-ascii?Q?0x17+G1FeK9ojwnUvZq0ZHwOf1FVDfGmLyQZHAlof8PsZoqu1mMAvuAXRWe/?=
 =?us-ascii?Q?RyxA7gKfErzq46223cNIwMXDxc9hjUtNj4rnuLj6mNXOIFqu7IOW/7iFEpGl?=
 =?us-ascii?Q?eXU8KYipQQ6wRhPvrbG40D60XjdY5gvY0NIi4ttJxDD1jnYvCDXwxg1efcam?=
 =?us-ascii?Q?sm+u9Im/5BDdzyAd0BSqJRYOoFATXM0uriucAWUzJe1+IXt7Orti/Y435w9+?=
 =?us-ascii?Q?49PyosDgfyFQKDPqNexLQC8OCVr/oB1chleISW3pPga7YKwBpWyX8o0tyh6U?=
 =?us-ascii?Q?FJwj1qY5hk364zPOVDalOh1/e/MrK7WMYim4hiAX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a8a981c-0042-43b4-5c58-08de12893f8e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 23:09:42.2642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/xZR7b4JwzWpkdoIFHwdmNtbIqVqyjAQ2j60T+EvWqdBwoDwNCGtrlPKVad4KWM
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

Change the function signature of hisi_acc_vfio_pci_ioctl()
and re-indent it.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    | 57 +++++++++----------
 1 file changed, 27 insertions(+), 30 deletions(-)

diff --git a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
index fde33f54e99ec5..f06dcfcf09599f 100644
--- a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
+++ b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
@@ -1324,43 +1324,39 @@ static ssize_t hisi_acc_vfio_pci_read(struct vfio_device *core_vdev,
 	return vfio_pci_core_read(core_vdev, buf, new_count, ppos);
 }
 
-static long hisi_acc_vfio_pci_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
-				    unsigned long arg)
+static int hisi_acc_vfio_get_region(struct vfio_device *core_vdev,
+				    struct vfio_region_info __user *arg)
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
+	.get_region_info = hisi_acc_vfio_get_region,
 	.device_feature = vfio_pci_core_ioctl_feature,
 	.read = hisi_acc_vfio_pci_read,
 	.write = hisi_acc_vfio_pci_write,
-- 
2.43.0

