Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF844620567
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 01:54:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063FA10E3A4;
	Tue,  8 Nov 2022 00:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1F210E38D;
 Tue,  8 Nov 2022 00:53:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgaUWa65gOnnVDgsDB+e9dfczsmgRy4OwGbK8aRucjkIkqbj9gCMP/8GFFruyJFbBN0LX/KleImrDURtiI7fliKR7mLVxKi8etm+KkXA7yNPEHhtZ3xZsDyiuTD9RzGzCGLxPpPpO5hVvqmwsHXPS9IiNK/HPt16eZAtpWV2/XLKgHZPKyGHzIPeICCYt++PiJ9F/+SCrqJKu96U13Fmbb/gkB4IWu5V/G3pOXJnbHtO150MoBV0n2JTqIXFYm4Ysw5Ng07mRh80ZXX52IXBEjq7rJ7Js7p6CXUjl7X4hJxnBnKREPJgCZXiUj3W3NJJRlRyXaWmOcyjDdxfDmobAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuyT2DuSOFsxrb5+jGdEOq7NkxR1S18FYkkA6FzhOvs=;
 b=cIVHUC+nh7VDZJAKbcJQgdoJOz/cnJdo7Y8JDK5ct08ycGszTsvf7CU8VZODUENuyyPL+YAxkLN4D/jcCAINpl/4SC37oH/Kv0NRRDbtXPiJiH3fGPnV8jwW0zvZM4eeC5PWHKDcdiBhCuOo9sgQP1dOPaFvCaiky6FNl8QDWMFZzOoJi4XBQ4czkmfdHkHnxSKaJ5DL+MIswuA/ZloF7I1dr5Q//U9YdbjN6knFyLlbl11bHzTGOCio00nF1UK0Au7KpxoGrGtYqZRN0HDDYUTTTq2o5k9GmOja2nlAEph/Tiu8afPASV0UeTMQgij2/GT8FRfobtiD98I60VQG9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuyT2DuSOFsxrb5+jGdEOq7NkxR1S18FYkkA6FzhOvs=;
 b=Po1wMYMoY0TALLSUtww8RGVv/3svCl8DwwEDmq7O/3V9NwHINBUEVwaRUUyN8NXvG2z5dlXQC3Lo/rGo2hd3fXZsVg2TBGgxQSmlit8fmlpm4PBs6WnoFgalRoBd3Vh2xk+86SnUYpGiV2MQMnHQhO48GHNqEMlkm4svU3ptCMWp1iCJ80KXKo2zTuaNZOez4lrGTsjIl1NCRvWOqaPkEp5qkJII5JeHXvFtfgOBKCkCdA6XLv2xOvvgTtV/tYkyKioV4FYD/yR7f6GWJYqWK+fvxi4Y2asfU42YZ0GFW5dqF8psZsx6NV4qyIa5VBKie9CG5sG+ArOz8j3w7PigEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB6257.namprd12.prod.outlook.com (2603:10b6:208:3e7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Tue, 8 Nov
 2022 00:53:03 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 00:53:03 +0000
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
Subject: [PATCH v2 10/11] vfio: Make vfio_container optionally compiled
Date: Mon,  7 Nov 2022 20:52:54 -0400
Message-Id: <10-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0135.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dd7826e-58b5-46c2-3395-08dac12393df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YUxzwTsuBlRl91m3T+zKeYlbgRWIVLzWjPCkJ332h9QjuDco0cGsFRTkLcsf2c3904OEWLl5b6ECBPdpIYGAEVIPyWlskHkcSuGcfkToMPoTc/W8EmxH+TW6P8r8UVWup6vuDSWC9KPl1+CqFBeR2R8Kq+xoYUvWYKDEFk75Tdkv1UkEvpPO26LG0Ka5gXlldpagn2cHry99Tzbb6icjD4KST0aCCp8mwtrjyPY6hfcZvmbzmPRUMf6V6KJNVX/VuJWLLgRuKEn01eZkaEn3isgeY5BnGhXY2auxEFdl+XLSZ5Y15xdSG04oOUU6jvrIUkkh3td1loObBtQKDFT8FJbO0qX8tsH3U+GWWnjFTu3vLEkBIqO0cBproJh4qaV3GdT2kJTnL0Nsis4VsG+lUaGaoa8fMNnKZJn5hr27n4ARZ+ftwKRg6OPg89fF7brub188KxmKghKV7IcSN1kdcAaasv2a1O0dMnLZAcUkbNyOZIUFWPhcgZRzijeYQEPxFqKNNMigb1KbOsx0Ol8TQrBWcpZIlZj7eodl0OaOitSbnSAg/DkHpMrj1xs/VfZdC5jBpXiwNULr6Kj0jHaOAgZJ5Px7N4DrsTbsLjBmzohHChb1JipfCOCR9teclU8xw+ky/f6MZTh+a/dKezISORtmS3wvQMXXLa4XQR+ynRdRHgSuMq0VTilJ5b4rlxW1wheivqkSIzO0trRCBnKOR0truaJNzudcL6RkSjDiRFr1wvXBbdXhAcvioPryWNyG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199015)(8936002)(36756003)(7416002)(5660300002)(41300700001)(7406005)(86362001)(6486002)(83380400001)(8676002)(6666004)(6506007)(26005)(2616005)(478600001)(38100700002)(6512007)(186003)(4326008)(921005)(66556008)(66946007)(66476007)(54906003)(316002)(110136005)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sjFgIr6Cy6skjEthl9dcAjml8+pVdNps8S+oqMKPtrazpDFV0z+RTUerdsgd?=
 =?us-ascii?Q?JGeD6OiM9N8kcWd99btVeNnKvryP210aX6OwCRKAP7YvXRJQ2+QzcRtSKOi7?=
 =?us-ascii?Q?1JxApxl/2K9YghUyif+TE0DKGshJIGBHil/ozrE1tShzbNxrkpleyM1scDRC?=
 =?us-ascii?Q?Joj8fvsRW0CJu4KNRlwow9jWeMnHcH/+jfWY1AmjrdlVxDTEZ1bp3V1DWDub?=
 =?us-ascii?Q?337uU2q2AWCwhuOJBE2iGWNumUMG72Fc1pj6+lGU0+V/2QKxkGLYZ3N7ChOV?=
 =?us-ascii?Q?G6JERTNbPfDVlCsWQIvWZVSG7j5wRfFP/xYBfYXycZsg1JydmfZVg73lf4vB?=
 =?us-ascii?Q?E6rki2we063q19esr0dSKxcBihh645+NIrbaY0EafoAMj+W5WxXUkGRpG273?=
 =?us-ascii?Q?gMEtYQfz4KHcVTtkx783f5scdaMAhv+iSxa8Wv72COfpsBMXdnMEJlj91S3L?=
 =?us-ascii?Q?ATodG11IiJ2bzcolxqAjWvop8TcRk/4+ointuFYkgb4kBO2r+Wcc3myFi8+F?=
 =?us-ascii?Q?IgjYlVIdtpPoOeBiHCjfWkKNgG/9atIi6aLQU2mVTmb8bSULt/VuwaKc4+hi?=
 =?us-ascii?Q?bJoiz9FhYIoM0P2Jd/YU9Uuhd2//gsmLUFccSWt/oHjzqALnUCqSqnV16AhA?=
 =?us-ascii?Q?xsPNltBrA6MCDLoTKQqWonnjTMRDnoVqi2/WZ2Jd9JLu7T/uRpa0ly7nu764?=
 =?us-ascii?Q?25/pf14n3GSNlyy/A1YpKsm4Yh1tw3kOOz7zqnZ1fJi3czS0dnLxpm4DaIzT?=
 =?us-ascii?Q?5blloV/61RmHPo5fXr8j6RTd4Yz1cVIRwP6QIqZRyOewwNmWo0yQRcBMBeOs?=
 =?us-ascii?Q?JHNIAyFxJlZhZeoMflYHLMiRUbpDGppdoOrPtElWWeBEwo2gpIA8EABTkSzY?=
 =?us-ascii?Q?fWe0NV4a452XOIltR/Nym66hI35flGVs7wokTVI/mntyfMFxFkM1JZpsNYXR?=
 =?us-ascii?Q?o4BRzhW+FyHOym2vzC6xRxg8oFroHA+fTT4wpLHMhjbTGghCAA+g0FX/HOVk?=
 =?us-ascii?Q?0p8AJQmNfdWik/qyVzB7zQmW0lM6o0TxT3XXf2hydSWqbbLVcrotu+/AndxO?=
 =?us-ascii?Q?aEpm62mpXN1r3LvwZJg/FedO37SmqN0o7QJVkr/+nB9r7odOzQ1SesUkQqXA?=
 =?us-ascii?Q?3f7QOCFz501RbsgIG4C0l77leBzjT6ZqRY4dAzv5jaoINpXmLjtHaJoH/H6z?=
 =?us-ascii?Q?ST8SQrNCcgnkIRr8nRYmj1wSBlspxklGZ+kBW81WmB7EFqhJqnpvzFqgiPqZ?=
 =?us-ascii?Q?czSoAarLKkeW+O0h9J5SchzRzP43Y9bgFgWAhHM1Uq2IPn5GkX0kmMxI85HC?=
 =?us-ascii?Q?HrsVeX/YHBDyFZMFGLNLv9fomBinuiSgt4xQSvoIWJaC6ybmBacIEefbGrK2?=
 =?us-ascii?Q?xvUExZZCRal9DL/IyWggeDWL0uIc887xmpIMr72JBKUUm6++yIRo3Donsl1s?=
 =?us-ascii?Q?RVvog2zBWvMVuePRTGzAnh9pxhOrdEjSHPc5BebWZSUVncyGqYZl0ptiDrEe?=
 =?us-ascii?Q?CyUuT4UfNCFMxOCRUzQRlxc3Lrs+o8Sf431Dy9jrd9HDFSAFADrO9RuW6elO?=
 =?us-ascii?Q?u0UHLJbRXF4OvJWtNuo=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd7826e-58b5-46c2-3395-08dac12393df
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 00:52:57.6959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5rTmtK1Wu8l0VGUa7Uvk/q8a/X36lWslJUO4E5u4sx4+/OIFwoGik/9wUyMe+KVa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6257
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

Add a kconfig CONFIG_VFIO_CONTAINER that controls compiling the container
code. If 'n' then only iommufd will provide the container service. All the
support for vfio iommu drivers, including type1, will not be built.

This allows a compilation check that no inappropriate dependencies between
the device/group and container have been created.

Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/Kconfig  | 35 +++++++++++++++--------
 drivers/vfio/Makefile |  4 +--
 drivers/vfio/vfio.h   | 65 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 91 insertions(+), 13 deletions(-)

diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
index 1118d322eec97d..286c1663bd7564 100644
--- a/drivers/vfio/Kconfig
+++ b/drivers/vfio/Kconfig
@@ -3,8 +3,8 @@ menuconfig VFIO
 	tristate "VFIO Non-Privileged userspace driver framework"
 	select IOMMU_API
 	depends on IOMMUFD || !IOMMUFD
-	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64)
 	select INTERVAL_TREE
+	select VFIO_CONTAINER if IOMMUFD=n
 	help
 	  VFIO provides a framework for secure userspace device drivers.
 	  See Documentation/driver-api/vfio.rst for more details.
@@ -12,6 +12,18 @@ menuconfig VFIO
 	  If you don't know what to do here, say N.
 
 if VFIO
+config VFIO_CONTAINER
+	bool "Support for the VFIO container /dev/vfio/vfio"
+	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64)
+	default y
+	help
+	  The VFIO container is the classic interface to VFIO for establishing
+	  IOMMU mappings. If N is selected here then IOMMUFD must be used to
+	  manage the mappings.
+
+	  Unless testing IOMMUFD say Y here.
+
+if VFIO_CONTAINER
 config VFIO_IOMMU_TYPE1
 	tristate
 	default n
@@ -21,16 +33,6 @@ config VFIO_IOMMU_SPAPR_TCE
 	depends on SPAPR_TCE_IOMMU
 	default VFIO
 
-config VFIO_SPAPR_EEH
-	tristate
-	depends on EEH && VFIO_IOMMU_SPAPR_TCE
-	default VFIO
-
-config VFIO_VIRQFD
-	tristate
-	select EVENTFD
-	default n
-
 config VFIO_NOIOMMU
 	bool "VFIO No-IOMMU support"
 	help
@@ -44,6 +46,17 @@ config VFIO_NOIOMMU
 	  this mode since there is no IOMMU to provide DMA translation.
 
 	  If you don't know what to do here, say N.
+endif
+
+config VFIO_SPAPR_EEH
+	tristate
+	depends on EEH && VFIO_IOMMU_SPAPR_TCE
+	default VFIO
+
+config VFIO_VIRQFD
+	tristate
+	select EVENTFD
+	default n
 
 source "drivers/vfio/pci/Kconfig"
 source "drivers/vfio/platform/Kconfig"
diff --git a/drivers/vfio/Makefile b/drivers/vfio/Makefile
index 3863922529ef20..b953517dc70f99 100644
--- a/drivers/vfio/Makefile
+++ b/drivers/vfio/Makefile
@@ -4,9 +4,9 @@ vfio_virqfd-y := virqfd.o
 obj-$(CONFIG_VFIO) += vfio.o
 
 vfio-y += vfio_main.o \
-	  iova_bitmap.o \
-	  container.o
+	  iova_bitmap.o
 vfio-$(CONFIG_IOMMUFD) += iommufd.o
+vfio-$(CONFIG_VFIO_CONTAINER) += container.o
 
 obj-$(CONFIG_VFIO_VIRQFD) += vfio_virqfd.o
 obj-$(CONFIG_VFIO_IOMMU_TYPE1) += vfio_iommu_type1.o
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index d57a08afb5cf5c..3378714a746274 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -55,7 +55,9 @@ struct vfio_group {
 	struct list_head		device_list;
 	struct mutex			device_lock;
 	struct list_head		vfio_next;
+#if IS_ENABLED(CONFIG_VFIO_CONTAINER)
 	struct list_head		container_next;
+#endif
 	enum vfio_group_type		type;
 	struct mutex			group_lock;
 	struct kvm			*kvm;
@@ -64,6 +66,7 @@ struct vfio_group {
 	struct iommufd_ctx		*iommufd;
 };
 
+#if IS_ENABLED(CONFIG_VFIO_CONTAINER)
 /* events for the backend driver notify callback */
 enum vfio_iommu_notify_type {
 	VFIO_IOMMU_CONTAINER_CLOSE = 0,
@@ -129,6 +132,68 @@ int vfio_container_dma_rw(struct vfio_container *container, dma_addr_t iova,
 
 int __init vfio_container_init(void);
 void vfio_container_cleanup(void);
+#else
+static inline struct vfio_container *
+vfio_container_from_file(struct file *filep)
+{
+	return NULL;
+}
+
+static inline int vfio_group_use_container(struct vfio_group *group)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void vfio_group_unuse_container(struct vfio_group *group)
+{
+}
+
+static inline int vfio_container_attach_group(struct vfio_container *container,
+					      struct vfio_group *group)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void vfio_group_detach_container(struct vfio_group *group)
+{
+}
+
+static inline void vfio_device_container_register(struct vfio_device *device)
+{
+}
+
+static inline void vfio_device_container_unregister(struct vfio_device *device)
+{
+}
+
+static inline int vfio_container_pin_pages(struct vfio_container *container,
+					   struct iommu_group *iommu_group,
+					   dma_addr_t iova, int npage, int prot,
+					   struct page **pages)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void vfio_container_unpin_pages(struct vfio_container *container,
+					      dma_addr_t iova, int npage)
+{
+}
+
+static inline int vfio_container_dma_rw(struct vfio_container *container,
+					dma_addr_t iova, void *data, size_t len,
+					bool write)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int vfio_container_init(void)
+{
+	return 0;
+}
+static inline void vfio_container_cleanup(void)
+{
+}
+#endif
 
 #if IS_ENABLED(CONFIG_IOMMUFD)
 int vfio_iommufd_bind(struct vfio_device *device, struct iommufd_ctx *ictx);
-- 
2.38.1

