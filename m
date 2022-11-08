Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9FF620551
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 01:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154A510E391;
	Tue,  8 Nov 2022 00:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB69C10E1FB;
 Tue,  8 Nov 2022 00:52:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiUf2SA8PAMrk8K/91dZ+nPVihsC0fmtQnuQwUTRNFJKjfRiWC7UU7x98r4HuykpYW3aqTZ8eE0kaRY6YfKPvJgJj/sXcTz2cxQLKogt60gze5XLArpTrxRIGvSTUaQrubihCnwWLdBexPiXlGwiAq97I7kIIxfF3SH+2mTnyoAYnl3JZyN18XaNRb7diBUTK2h7vTiuvRtDlkki+oidQkZppMjBLvgWbv3l2PGa8xWeQYFIA0kQpfVy32tqCvU3B/m7/uR5jVv89X6CNNJo6G3ToeP7fa8yARJihDrWnIeVjC5dmv5Gcem1TbgDCeTYis0UI1Yob+iTSemMmLNaTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UohQBqyo5/UZ25YCnK7iG/bppPcw76t4exxEiSmdcRU=;
 b=JMF/X5fs5R9H2MKd8iiGAUCGW7bCHRJ7LsATUdO6CFxJU10NVH9aPSgS46rApa4yKg6TcgcFV1xp4O+U2AJ3bXFj6+xEO+hjejtNnHAf4MoXtdHx/4cfiv7tc8hshnnMdXVec0Zt+uZ8iTCbYZufdu0uN+pRXCuJgCM+GfgWgaH+lWFyct3l0npaxwgMrOhWhAJc2J2u0/WymV6cgucQ8ysAQIsqZnjlscxJfpzCe8n6+ZxCmPiWGELpbZVufqkHOTms7ZG0hvAWM+5x0jrm+om9HPlL73QY/mZjxGXLR7ouuUdLu3UaRYCV5RxiNfS/KByQej9nfx07SnKeeLn29w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UohQBqyo5/UZ25YCnK7iG/bppPcw76t4exxEiSmdcRU=;
 b=BonHrYDQn2O4UOqOoKeMyHKxbabAHuRpfGr2CPMr8ubjWQj29wx0MBsXhm6i6hF7OuRn4D/tSOr8G71CvwBAFYRv0OJSszowQAPxufQuvw0h/wQf12LY2XBFxDSYnWZqcdWRC/L/c2br61JfTFE8WkPAWXc1NbdE0LcXfZVvB4ZWq1cjfaQ097N8jn2Cumi5A4/R1kT8lG3WcbX26xmjnUjtAqeUyAkFxZP3hJkT0WdilLQW04M4K4uu6vsQXXyvP9gQCXVE92Zo2MwDn9UlKNXSVR2l9NYX8MjDzVzFPw2tjIvNZayr2xu5kITdGgJxzZ1lsAUMt8fhB17Eb0iDYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ0PR12MB6686.namprd12.prod.outlook.com (2603:10b6:a03:479::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Tue, 8 Nov
 2022 00:52:56 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 00:52:56 +0000
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
Subject: [PATCH v2 11/11] iommufd: Allow iommufd to supply /dev/vfio/vfio
Date: Mon,  7 Nov 2022 20:52:55 -0400
Message-Id: <11-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0124.namprd03.prod.outlook.com
 (2603:10b6:208:32e::9) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ0PR12MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: f4556473-7dfc-4508-a6fd-08dac123932e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: js+aOYBFlS/N4+g715TzriMIgG0flvgzfGyMVQii/85NSLB7NN+DJgGrbS+3SxKisqGPhjBdv2yz/w4pf1VsVi3XngSnSOEZ8CS7JiqE/a4PveMYdQATWy7xn7jexkPLOXGJxXYgG/9fnHJCu7KZUAH9UuPKqRePougMcGx1FpAlZt2Xk0olLLZVi6hNmA2Ik+rEmIwf834jrEcmhJX/vWIGtEVgJVgDcevYv8jWrRlGt3joBxef0Hj/gvETvklYShFlW1Ztba0eXfSSHM6QccXYe85+6XMrfTpYe6zSZ530t8xX/+VFPrbcb+KwH2jB2/a66mzcCvFLJLEPyz2DefQYg/k58D3BkyEyvyq0/no9zsHvhqW5R3pC4nUi75Z+m9RhU/RKRsxMKt8gTWlWTp3K8H5MlkgPTjd3f+aFRIW++cuz7Yu+8xxXi+QgLGmw0hHyBFyKBi3GOocKbdmgyst0GwU6cetEqhQdqWgl7qONl6RkUAPweTXf5lWTB8+ujIO024Bypc7nj4OCGQJw5rY5NME4hIdchVfmq+oJx4B76g6tt2tjE5ej3VzfD5tU4E5mAiaaqj0m645yxLlWij+hUBwGnjBih4WDxIN/HSLE+m6kq0PdCsqVQRfsBW9B9kGQvweqpG6HWFMWHtFPKgMuAN/eS7ZBhxOyNxpGLmBfDwUV342A79BnXbrrLzVvRf+tR1CRPAZdaOPNaeKZP/h0nUWpopMscvMue7jmEkl7EzyzBC+MxmGuCvl9AnPn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199015)(2616005)(921005)(83380400001)(38100700002)(186003)(2906002)(7416002)(7406005)(8936002)(86362001)(5660300002)(478600001)(6486002)(26005)(6512007)(6506007)(66476007)(66556008)(8676002)(4326008)(316002)(41300700001)(110136005)(54906003)(66946007)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m90Ur0mET4lA97E7sPkCTBE5Af+bm/PAuLds5S8/ejEwrvlaVoPAUluCqdUF?=
 =?us-ascii?Q?v+rTmoQP+1GrMEg8Qfjtehv05cDI2A6WDaf+GrKOZQ0QozRvSX1KnqkamDMK?=
 =?us-ascii?Q?dYxI7csTpjm4ZMgl5DdnQsoAEM8N1aQU6eqClx3ZSjBXPVJCGHEF2noh9sM2?=
 =?us-ascii?Q?JqVshZROpoaVScmZpFYuPTKK8y5k0FqIT8h0C6rBr0MUHGeV5mfCYrZsKq37?=
 =?us-ascii?Q?MU0nu5Y7dCOthM2ynyTldtV2Q/qUOfrfI6b1RIzIJplyqglxIM8EqVuF4gPT?=
 =?us-ascii?Q?ZX+tGfurOfFe1G0B4XPFw5oK0Za/6uxlzd5xNUXBtPNMugmAXKCF9XZwCim8?=
 =?us-ascii?Q?Yxo4eXpMTsC+Zb4jtaxI3tFgR4mGbvJhUnMYsVYg7KuRdEofLAnmdjTpl/41?=
 =?us-ascii?Q?xxHrSiwKhPdtvHS7r3RnRn7RKzunlzFc1beLbrVNqdJUD77CrHh9Q7I3mWm1?=
 =?us-ascii?Q?EFgVcc8vgdYGE8zHg+0p4rnONjgyexG7fR+HxpnaN/mjr0DT8NCT9P5VHlhS?=
 =?us-ascii?Q?8Isxp7MhxGvI9MnLGXnkZaqVinrvXDcfqKX+hULQgWOqpE6XxuODd3aooJF1?=
 =?us-ascii?Q?Dr6dMMgQfEGYH8b+PPPqwy5keSpCgJ/UEZ4NLP+9FtE6mj3RBkD5LjwsmGJM?=
 =?us-ascii?Q?SodZqo4oYsBSBXDBUE5SJfImNRtIudadeCSmfzrBp5dTWLzCxWWBu4DTKEtn?=
 =?us-ascii?Q?H5OLTiEGgAdL7rRfEN8NiE7fGrKKyweXiAxJNSYdLPsjlH/giMOScwL6PgJi?=
 =?us-ascii?Q?gbRlrzfADP51jP/Z3CB17b+XCsULtivv2bKAEMsorTuGX4P5f7fvBgeGUMtv?=
 =?us-ascii?Q?N7rwT2h8ZYZWEAf8XjZOLOluZDRB4TrehwChE0DrhpuegIjl6YybfYjovFza?=
 =?us-ascii?Q?HsOaKfEf9DRVqZnypxXaIKJYN3AxyF0/9DCQR6hIZXPM3kaTzEpWry+vz8Fc?=
 =?us-ascii?Q?R9einr14SbYqEKK+/rQzi1nb//iVQWir+ZY/EtZ2liYmTMD4fsEjTOuwr3R7?=
 =?us-ascii?Q?NRmMMHu+qh1DTW4A9yDa//Qf4NccMO+nSrU8dB0MiYoekj8QeK3Ly3JClQk4?=
 =?us-ascii?Q?t4JtO4nq1kAMJoTJd9awEzU1a6alVchijeKkwlZprq8p5pfC7ZI41Fpmg0CR?=
 =?us-ascii?Q?o1RewuI/X4kKjT5W91jNsfmzuNHLPyZJHCXge9m0AKrFYZl6jWCY6UCI27i2?=
 =?us-ascii?Q?qFurfmFJSQOpzjja8WCJq3B45tqFdGs/MNCeq7jdqcN6eZVLUPh1cs5sYpHQ?=
 =?us-ascii?Q?zfJuZSyhodXh2WFr5F0Xb0VG4hhMQfWFwQ5kKwOKbGJvKWfjkcQZlqAowXHM?=
 =?us-ascii?Q?pApAWpE9MFpU+/C4LN16kFEOx3a2+SVIq/IOsuV5xCOmvUFhDszJw3mhwCs3?=
 =?us-ascii?Q?nbdlmsMmtffsTGsy7ExVuLARaK/M9fAQ/MF0xXFUabNoK8rbyvWBF+T/YOtC?=
 =?us-ascii?Q?+R/1CR6/MlE2MEz3dqJd9P/weamPbhx9+5H35O5uPdHLADzMlohSVEU3eQ2m?=
 =?us-ascii?Q?l6luNmiAcrHrkXu8rd5w5M8ffz15/2IgvvJ9+Yy3QVYj2uv0l21OsUNw51kw?=
 =?us-ascii?Q?fzzodf2h+ek/cPZbDLM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4556473-7dfc-4508-a6fd-08dac123932e
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 00:52:56.5700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZnNmote5CnhMTO2NptdhslTzLrqlJ6uitveGwXftqRlAk6dXTgT0ywD7BSnBVEd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6686
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the VFIO container is compiled out, give a kconfig option for iommufd
to provide the miscdev node with the same name and permissions as vfio
uses.

The compatibility node supports the same ioctls as VFIO and automatically
enables the VFIO compatible pinned page accounting mode.

Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommufd/Kconfig | 12 ++++++++++++
 drivers/iommu/iommufd/main.c  | 36 +++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/iommu/iommufd/Kconfig b/drivers/iommu/iommufd/Kconfig
index 399a2edeaef6de..f387f803dc6f7f 100644
--- a/drivers/iommu/iommufd/Kconfig
+++ b/drivers/iommu/iommufd/Kconfig
@@ -12,6 +12,18 @@ config IOMMUFD
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
index ab3fa05f38505d..1eeb326f74f005 100644
--- a/drivers/iommu/iommufd/main.c
+++ b/drivers/iommu/iommufd/main.c
@@ -18,6 +18,7 @@
 #include <uapi/linux/iommufd.h>
 #include <linux/iommufd.h>
 
+#include "io_pagetable.h"
 #include "iommufd_private.h"
 #include "iommufd_test.h"
 
@@ -25,6 +26,7 @@ struct iommufd_object_ops {
 	void (*destroy)(struct iommufd_object *obj);
 };
 static const struct iommufd_object_ops iommufd_object_ops[];
+static struct miscdevice vfio_misc_dev;
 
 struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
 					     size_t size,
@@ -170,6 +172,16 @@ static int iommufd_fops_open(struct inode *inode, struct file *filp)
 	if (!ictx)
 		return -ENOMEM;
 
+	/*
+	 * For compatibility with VFIO when /dev/vfio/vfio is opened we default
+	 * to the same rlimit accounting as vfio uses.
+	 */
+	if (IS_ENABLED(CONFIG_IOMMUFD_VFIO_CONTAINER) &&
+	    filp->private_data == &vfio_misc_dev) {
+		ictx->account_mode = IOPT_PAGES_ACCOUNT_MM;
+		pr_info_once("IOMMUFD is providing /dev/vfio/vfio, not VFIO.\n");
+	}
+
 	xa_init_flags(&ictx->objects, XA_FLAGS_ALLOC1 | XA_FLAGS_ACCOUNT);
 	ictx->file = filp;
 	filp->private_data = ictx;
@@ -395,6 +407,15 @@ static struct miscdevice iommu_misc_dev = {
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
@@ -402,18 +423,33 @@ static int __init iommufd_init(void)
 	ret = misc_register(&iommu_misc_dev);
 	if (ret)
 		return ret;
+
+	if (IS_ENABLED(CONFIG_IOMMUFD_VFIO_CONTAINER)) {
+		ret = misc_register(&vfio_misc_dev);
+		if (ret)
+			goto err_misc;
+	}
 	iommufd_test_init();
 	return 0;
+err_misc:
+	misc_deregister(&iommu_misc_dev);
+	return ret;
 }
 
 static void __exit iommufd_exit(void)
 {
 	iommufd_test_exit();
+	if (IS_ENABLED(CONFIG_IOMMUFD_VFIO_CONTAINER))
+		misc_deregister(&vfio_misc_dev);
 	misc_deregister(&iommu_misc_dev);
 }
 
 module_init(iommufd_init);
 module_exit(iommufd_exit);
 
+#if IS_ENABLED(CONFIG_IOMMUFD_VFIO_CONTAINER)
+MODULE_ALIAS_MISCDEV(VFIO_MINOR);
+MODULE_ALIAS("devname:vfio/vfio");
+#endif
 MODULE_DESCRIPTION("I/O Address Space Management for passthrough devices");
 MODULE_LICENSE("GPL");
-- 
2.38.1

