Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FF260D3FF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 20:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0CB10E1C1;
	Tue, 25 Oct 2022 18:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14D910E418;
 Tue, 25 Oct 2022 18:50:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SI563VnCxBg0/eBLQjbiBowglOrdCcYX1+YsjqGQszvIOPEZG74n7w5i1elCmhE56m+OdN3uyZ3Q70yt1kQDxbdvw8OcokNUXZI2d2+QrPI+pj/5880H7pdTQNorvLO+AsI95QdjvLEbeqdaeWcHsb0msw6riPbrOLpp62m0rUupSG7CpjByAVkqwqjGvyCYm3U1lmtnI3TIcqWM6sxU00RBk03p0YmtouAZo7JBar3CnNdPhOZM4PXa9HXEiGoBDnauOf4qm4JOpu3gdjEllZTlU2vc4FUqBXDmHau+V4XQqdWfqRe3ucUQKcDhICV3xh/F28YPpTbNszAiKZBbWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsHzCTSGkLJrdqQONpFo3naR3vrdgtR806sdhWqt7fs=;
 b=ncq/FZ04La/0k8GIsDuS5whD+wiTvgkwRdtibWIevdeqeyVxyH2EBknD+4EEBNSdgaAOUfgv+pe/kmTMZB9MgQWZGzmlUD2k7Au2UUoMVXUyidpT4QrEHbikolWrB2Jlew9G7+OlkZC+khaHbBAmRHisKjmyopvkDrU95ulKiBwbAAv6Jm/bAAWrLYBK2sT1HYSDvp643RVrLYzT6iOSs0ugNwGBB9GxMl+kZDizhS/5GbvLISKrLa/y6DKUCFFNnv61lvpDEas/WP7u1bzJTFq/4KcGoaNxNud9efH6vuzWQZ0otakVr5XrFnTtAu9aLYymMrGzrffkyehR6MlYGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsHzCTSGkLJrdqQONpFo3naR3vrdgtR806sdhWqt7fs=;
 b=pTb9mUG4BxvgnXlLEkzn1QnnpWn6ty3sI7Hypce7QgmP1c4bhrFY78HaUx2lcMTwN/bBaYoRHLMH07FneTDy6gbJtTurWH7+3zVq52gz/lz4Dk0wyih1vCTSdlvl+BdsZmHLFdVHUY/EZ66C+5OlNn1yApKL0tD6bQXOYWEeKWHIGeyupbYu5UTKpOnY1h+XY86HhyARFn5izpm6hPwbZ96ulhwCr8wCvvc26AHKJWswytKf2xYB4PzRymKKvCIdO8HPdpNXwARmFD8zSSttpjpS0zKbiS//i32XtzISKdyYfZ4s66qS+12vU7UrSWH30+/gz6nCnCzxON8qipcPwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ1PR12MB6124.namprd12.prod.outlook.com (2603:10b6:a03:459::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Tue, 25 Oct
 2022 18:50:49 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5746.021; Tue, 25 Oct 2022
 18:50:49 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Diana Craciun <diana.craciun@oss.nxp.com>, dri-devel@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 iommu@lists.linux.dev, Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
 kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 10/10] iommufd: Allow iommufd to supply /dev/vfio/vfio
Date: Tue, 25 Oct 2022 15:50:45 -0300
Message-Id: <10-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0273.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::8) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d7ae0f1-b80e-4f2e-6332-08dab6b9d4cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g6B9llJssnaB+2irxfCUbudZ9pipiwmHWi25BHXiGGXmT1B2J7hhhWMnb7zRqIh23Ds7keWSE+102ep6ngy0E4hD0ksa++7/pflFhNPqJVq0zBMNg8dN8RtLzSiQDk+kyDxdk0zBk3Gghu8vq/UP2vFev1AxaD0XOCYoThVBFHZpfPaizTPEtVEmYvY9MuUtbj9rFwyXtbg6GQ2hMsZn4ED0b1qhZdVA3kSWnlOEgsoti4dOFOwcY5LS4Awa9W4mc7riJVvZKahOGs57WyyCSUTWKKpRzWq5xk0vTN6EaUiZRyUrbN3tcKkkQTdfdbBoOvA5tnslSl3kMxTrtKKlLYjEpAsfzgse9qC7Ad3JJekRHF1lSa9vVDH4DRYlh+Mi/GzfNsYabUl3Fvp3xAXNTqB+5BtL4F6G/oPvHDufdntXT5qALaLWvcKfjWUm8RJe1CIo7poV9Jk/MtwO5nCOIr4m9dM6F24kmP3LpAaNkC40qQXWEwhqF0LFUsDL5QyEfp2jxb5OCVThHB0HvqOEj+uuLx6ibF/tTbJ/yq4r2mWhz0bpkdyqgQwvEyJiBat+PpMPvaQt0rSA/upd37ErMWbFm0u/N32AANcJbyciEhhq8WcPzAa5ZK8toUtUbc8CzGH8X14GlO+uaZ+4c0JK1ONub6uYuO0ol1nx5C2+l2Wp1ijeBzdyboE4kJvCjNEzh11ObQ0PuMtp/7nBHlCCHjb7BrIu0zlhd0r+DHGGOMnD04E3sd+vPRyeurSb0U3q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(396003)(136003)(39860400002)(346002)(451199015)(6512007)(26005)(921005)(8936002)(2906002)(6506007)(38100700002)(36756003)(7416002)(83380400001)(5660300002)(41300700001)(7406005)(2616005)(478600001)(6486002)(186003)(54906003)(6666004)(316002)(66556008)(66476007)(66946007)(86362001)(8676002)(110136005)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AJvJ+v4923V5kwMCjFr3hyrN3T55hSggf5+iSd9/KSW+40rqQaWj7aG4qPQc?=
 =?us-ascii?Q?dR6yx158VlbFJRahb8DFbll7KuAWMQfK8aeZoWRbBS7s10zNRyIfyjQXrkn4?=
 =?us-ascii?Q?zOcbGhxytJ6iCBW1ti6hSMf3cEYysT5NtWhpyNXSAI1HWt1fyRye8BfzTPkW?=
 =?us-ascii?Q?z8IK0LwntcED5u7XP95MlHhN2w5Nc4p7foDN4972CO05xWVJYFzzDC4ufA4x?=
 =?us-ascii?Q?EOTLPNYaj/PCVBtwEyCWKxhEYxOCRwAs7wjNKcl55ATnP6ybEnRsIEHotmjB?=
 =?us-ascii?Q?niAXm89ikLGRM07B52vSclwTR+mr2JAZHsMQyj7Bg0vZ3vL6DtYixU8wrbtR?=
 =?us-ascii?Q?S30F0iR0DZb9N7RmHhLNF7Frb76hzv8YnzwrKx/mInQWhjD9mx6AlHuL5my3?=
 =?us-ascii?Q?O8VBrDYH4iauY3oQ+uKL9mnQgXmoeeYUQa5smRbuQBh0m1qezTIzlL6ra1Hb?=
 =?us-ascii?Q?lfSshSQvUa3KwoyMyTVUMZPs26MLxqxDNJJjM13oAVwi2B80oIU7YZTsHmzq?=
 =?us-ascii?Q?y1ZW/Mi8jPiiRziMvFbOJ6UISkptAKzOzcTSIhQ4dAzUXhSl4xMrYwPPrDWI?=
 =?us-ascii?Q?dxC/7zScNyouDvsrpb6PGlvniF/vsw/xryhZ2F6gNfDfY2Kg2bPWgVlIgCgn?=
 =?us-ascii?Q?w0TOGA7MLTQcLpcCmmcpGP84a4fRJN5hAjZaU7uh6Uur/ezCXXRwzXxGYLlF?=
 =?us-ascii?Q?EilkBq7O65jgTnu0cOhCwj0Xau1CskMPAe0Pxcd8WSHUH0vf3Xd/PFEKeoJ5?=
 =?us-ascii?Q?AeElmgmXaBEH1Oe4l+XVi1N9VX542ZfEn9wXEhPmiXjbS3mBnfsEh6wl2/PW?=
 =?us-ascii?Q?hw3qE8aB9vVGSEB5oB0MUVSwRtkKXy1bAS2wASvHJSTZrpqBCao6j0/ZgGao?=
 =?us-ascii?Q?IAle6+HcPaUNlY3EhqDcsmyqRJ23IavdRmy0kB7SH5qZDGUpPCppW2icUXbZ?=
 =?us-ascii?Q?jMYESHhdk/ulcTHwwy62oV+OK6/aCTrq/xYwYjJdWgdhhmPAvgAQMxpriDjz?=
 =?us-ascii?Q?Z+XDUX+pclPfifHKssQAq7JWo1eYM/ASm5Rm8n/Tg4FYLoCjXrD3PO1cjdVb?=
 =?us-ascii?Q?w5HEao3qEZi4+IzFRlikNyZhcmrDn6rHwnaCvHWHmVoh5WGBA222gRtaKsvk?=
 =?us-ascii?Q?WWHYOuQtMbAzc2q13diLnYMfiNiF3NEXNcNJMp2pZUlBlbB9SBqcXkgM2GLX?=
 =?us-ascii?Q?UW8j7/8OYE2LHGVqOCOFdWuy8ZyMlWm5DCM3jVp/MPFPVrIJs0IcJOFlaNlw?=
 =?us-ascii?Q?cvtaw59AFCeiqgQSkDatiA/9e+L96E+FvVj2+BI20rBjAj6Hd58WvlTazD0r?=
 =?us-ascii?Q?027qdJ9TL1X6c7m/mEY5EFQCNpNUezfj29lUrY++U+XH13LqZcHFX3NbQi69?=
 =?us-ascii?Q?1kRvwJEw+Pfxc9hPDWEK/1Ux91vqilg5H0ENUljtdgoqes4aU6MK1XkzbTXq?=
 =?us-ascii?Q?4pW9jb87G2HRoILJ8ue7yGkkqtbzOqfgd9vPWnwVZW2z3rgPuxF353fKTv4Y?=
 =?us-ascii?Q?B5OGZQ4L66hrkAQMbzz9THJEO+383vlVBmelzCEb7cK8UbN47SHJtiQP9hwO?=
 =?us-ascii?Q?t1wtnrcuJ+snReOFrbs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d7ae0f1-b80e-4f2e-6332-08dab6b9d4cd
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 18:50:48.4905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5qIcnY8mEhwpCc07D6YzRx9UCJkGLyLk7KatZ2bLxJI9TTogTZo1yQkTsDW/xKhA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6124
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
Cc: Yi Liu <yi.l.liu@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the VFIO container is compiled out, give a kconfig option for iommufd
to provide the miscdev node with the same name and permissions as vfio
uses.

The compatibility node supports the same ioctls as VFIO and automatically
enables the VFIO compatible pinned page accounting mode.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommufd/Kconfig | 12 ++++++++++++
 drivers/iommu/iommufd/main.c  | 35 ++++++++++++++++++++++++++++++++---
 2 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommufd/Kconfig b/drivers/iommu/iommufd/Kconfig
index f0a2012234fa09..afc83b7575cce6 100644
--- a/drivers/iommu/iommufd/Kconfig
+++ b/drivers/iommu/iommufd/Kconfig
@@ -14,6 +14,18 @@ config IOMMUFD
 	  If you don't know what to do here, say N.
 
 if IOMMUFD
+config IOMMUFD_VFIO_CONTAINER
+	bool "IOMMUFD provides the VFIO container /dev/vfio/vfio"
+	depends on VFIO && !VFIO_CONTAINER
+	default VFIO && !VFIO_CONTAINER
+	help
+	  IOMMUFD will provide /dev/vfio/vfio instead of VFIO. This relies on
+	  IOMMUFD providing compatibility emulation to give the same ioctls.
+	  It provides an option to build a kernel with legacy VFIO components
+	  removed.
+
+	  Unless testing IOMMUFD say N here.
+
 config IOMMUFD_TEST
 	bool "IOMMU Userspace API Test support"
 	depends on RUNTIME_TESTING_MENU
diff --git a/drivers/iommu/iommufd/main.c b/drivers/iommu/iommufd/main.c
index 8a31c1a14cdd53..19db81fbf7f08f 100644
--- a/drivers/iommu/iommufd/main.c
+++ b/drivers/iommu/iommufd/main.c
@@ -24,6 +24,7 @@
 #include <uapi/linux/iommufd.h>
 #include <linux/iommufd.h>
 
+#include "io_pagetable.h"
 #include "iommufd_private.h"
 #include "iommufd_test.h"
 
@@ -31,6 +32,7 @@ struct iommufd_object_ops {
 	void (*destroy)(struct iommufd_object *obj);
 };
 static struct iommufd_object_ops iommufd_object_ops[];
+static struct miscdevice vfio_misc_dev;
 
 struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
 					     size_t size,
@@ -167,6 +169,13 @@ static int iommufd_fops_open(struct inode *inode, struct file *filp)
 	if (!ictx)
 		return -ENOMEM;
 
+	/*
+	 * For compatibility with VFIO when /dev/vfio/vfio is opened we default
+	 * to the same rlimit accounting as vfio uses.
+	 */
+	if (filp->private_data == &vfio_misc_dev)
+		ictx->account_mode = IOPT_PAGES_ACCOUNT_MM;
+
 	xa_init_flags(&ictx->objects, XA_FLAGS_ALLOC1 | XA_FLAGS_ACCOUNT);
 	ictx->file = filp;
 	filp->private_data = ictx;
@@ -392,26 +401,46 @@ static struct miscdevice iommu_misc_dev = {
 	.mode = 0660,
 };
 
+
+static struct miscdevice vfio_misc_dev = {
+	.minor = VFIO_MINOR,
+	.name = "vfio",
+	.fops = &iommufd_fops,
+	.nodename = "vfio/vfio",
+	.mode = 0666,
+};
+
 static int __init iommufd_init(void)
 {
 	int ret;
 
 	ret = misc_register(&iommu_misc_dev);
-	if (ret) {
-		pr_err("Failed to register misc device\n");
+	if (ret)
 		return ret;
-	}
 
+	if (IS_ENABLED(CONFIG_IOMMUFD_VFIO_CONTAINER)) {
+		ret = misc_register(&vfio_misc_dev);
+		if (ret)
+			goto err_misc;
+	}
 	return 0;
+err_misc:
+	misc_deregister(&iommu_misc_dev);
+	return ret;
 }
 
 static void __exit iommufd_exit(void)
 {
+	if (IS_ENABLED(CONFIG_IOMMUFD_VFIO_CONTAINER))
+		misc_deregister(&vfio_misc_dev);
 	misc_deregister(&iommu_misc_dev);
 }
 
 module_init(iommufd_init);
 module_exit(iommufd_exit);
 
+#if IS_ENABLED(CONFIG_IOMMUFD_VFIO_CONTAINER)
+MODULE_ALIAS_MISCDEV(VFIO_MINOR);
+#endif
 MODULE_DESCRIPTION("I/O Address Space Management for passthrough devices");
 MODULE_LICENSE("GPL");
-- 
2.38.0

