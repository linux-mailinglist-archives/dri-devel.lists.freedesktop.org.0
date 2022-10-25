Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF51460D417
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 20:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B72E10E442;
	Tue, 25 Oct 2022 18:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC0A10E203;
 Tue, 25 Oct 2022 18:50:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pf1xDPL4r8albKqvUDs/makzcpC+n5fCXSjv42cSVUDLEjoM5nmXdSdarNsC+X5RDIKIxMrRNXHaKBdTGRupeXqyqKXH7eVpNQGpGhe33PP8ITFr8RnPHBlQb/vA6soO707th8kU4SFvUJK9Wv2vdIFmKJO5OzsqZ/+oGg6KyflTm3/fhV2T1wxBYanCyNf27nzFN8ZPz+qrNZjI1cB8YRvRriENLbM9U4mtkKI8p312K2hR2xarl/HsXGcibfrh6OzT8cb32hzYzk5J1uHpb4hv6riJ0njbOu4n2UJKkHlZO7dgE29LswJUPfVeGAv3SdUBz+//V6mhfkMQA4Tkcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wstwQ1tHiNdlxbLxOJqyv/A9NiGNxkfl46a4tLaqQrc=;
 b=ZSPcAxMjkHV98RdixGmnQyXoYXq31cAp23jrplE4OT2k8Jh0s6BzcN4kJAjAXszhBN+S2Nou8ra9atHWhnTmyC9ev3KkN/NZkoU1A0fuObBP2hD232qFLMJ18fv2S6MpDC5Ju1KBf4GMwyDyE9HOGVNWw4vqjwhRT911Opy+k+SZjngiWCEARhbXpcZ0DXbUY9juQbMPhDHciaRcrpsNokTZcYSo0ZBNHHNrpmtw9t8SHdDRjRiSK+szCyzY6H98DgYUItBZYjP3RgvfBDLiN7ajnCxUnMDyk4H2CubhQKIAL14XA9muSkV1HqFAZooNBVHiT396jlrOKjwos4LFIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wstwQ1tHiNdlxbLxOJqyv/A9NiGNxkfl46a4tLaqQrc=;
 b=AQHbhZOmWWHP65lhd9fKLy64alUVI60c0lbfQ9yCPtpIIa/h7x0gZkzg1HCHvcPHemuYML45u0Ry25gGNbPN2TB8MtVqlg4XkPZd073RymmZKxpGH0NTVvi9lgSICLGdbzXPQOyoPYCUsWdBMFC3oFzbrgIFK42kCybhvQPiDifMyvGbFfqZGtwixzYMLtlfmeMvN0gkmpSMFb2uhucn7UO45rtGIq0PUpJjDqnB91XlW3mz770zr0452CxDRLOLqxy4tuzAjkSMUiJ0qWLdDD2V+/+PMA996vqyf129lPQ5S/gdXXI7eP0rq/Xmu7IPpL185PU+gSygQ+49/tnvbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH8PR12MB6938.namprd12.prod.outlook.com (2603:10b6:510:1bd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Tue, 25 Oct
 2022 18:50:47 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5746.021; Tue, 25 Oct 2022
 18:50:47 +0000
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
Subject: [PATCH 09/10] vfio: Make vfio_container optionally compiled
Date: Tue, 25 Oct 2022 15:50:44 -0300
Message-Id: <9-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0296.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::31) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH8PR12MB6938:EE_
X-MS-Office365-Filtering-Correlation-Id: acdf86ac-75a6-4943-94e5-08dab6b9d3e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fh5LZg7QYehwtiCnvuwmVUYdcNCi23cdk05Hkrns6cgbPHvixiOkwKicQ2ocfDggvLKRdU/FnO3JBPEZdX/liH1p/ddy9EcUiW1qBsdxfv1DU+iuAKyElOFm523KN7pLAvVoZBDkchYsDklOBq/mExRFQKsvmba4dDa0RnUlQ1zgDRfDPZ1bZnyTm209X/PpTpLAlJ3k/Tuogv3pJL56ZMeHZlU1QtCpoghLWw9cjEjfN82FjGaW66snpSiZsgr2s7q9Nu9p8IgAdacoDKvw1OFn1YAmy1nr5BRZYYbn2WXSqX5TynqOyw1RAnC4k4com9g3JpASr0T4tlG/wP/Rk63CzEDGWHpqyC48gqwrcGMuCqqkxupSJ/g2W7pJYPT/57Zk/ua9xRaf3qCbuH+yWawURrxSU5BZYgh2jdzLYWzG/4SczUlh6/s/1jwtZzBstIIqsm9BB3lhbt2IUvLHJ4RwLwhBRcvIBkXbqFMZL6xCDWCWv8NEDdI/LLXcpFxQwpk6pujUrFFoZeSV9rw4ELfe7TaJ1QX+ZNON9lsqiHuqC1YusIEBZEQLYDFUGmFyJ3YgHnF32JuivYQzPV41u61Tm1xf1ZP4gGUZk9fgNRyijjVchFFHp30Smb9bwb5j+TTOkptawSmLy0Yq/eL5KFh4t+enXWpUiW4uzev1k8cSiSDBTsF3w0TNzNnCJ5pfaHxlS/SKRrnovAkBoiGPyZ96nor30cDyWuWig/iZjNDO511UZ47KWiI8oMJq7tvt2bgXsTFinelT9TWK4ifIbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(451199015)(86362001)(38100700002)(921005)(6486002)(8936002)(7406005)(7416002)(5660300002)(2906002)(478600001)(6666004)(316002)(4326008)(8676002)(66946007)(66476007)(66556008)(110136005)(54906003)(41300700001)(83380400001)(26005)(6512007)(6506007)(2616005)(186003)(36756003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rr1ejsc9he2LxXJSk+/DPHO4zM6MQDNFrPcK8seYslERggN0CU27bPeelQYa?=
 =?us-ascii?Q?Mkjni0ho8miHhZxRydnvPxfpXDUuLZJnPaF2E1Ihji9fzXiCVNhchGxQ0VND?=
 =?us-ascii?Q?pCPdQPD1w2Vcmk9234vA4f4qHzawxYtX6VJSWohBmjskJ7txJ02tFJteAGic?=
 =?us-ascii?Q?cw4R4g3wuN2zBp968VYf4SRKchhYJxWOPNL7cjM1O+EpB9A8VjYtxZj4c5NV?=
 =?us-ascii?Q?zG0+2JAVgr3C6wn49e0xGVroqRDfrWLXEvvZM10JRKe0xNgfKVXpuNHNyreK?=
 =?us-ascii?Q?9aqr2hyd0K/DNHBn5QOBtBKnWBK3QZcxXKQNUSuf3sfcH5L/wdsgV5xJeSHW?=
 =?us-ascii?Q?McEeC5CbkW+f/M+Zob29ffAP2AA+Q2zgIpKVcFuBkYltdRNe8xGDI3RlMcN9?=
 =?us-ascii?Q?SYxK7rMl08ndyRpxYE2aP/DAyYujmIcWJTdjd0Zbwhrco9MRGCYhfcVvwhIp?=
 =?us-ascii?Q?uXY/93NnbpXlITnAnAPe++Mm4JsBDiDdeedXLeFqBOLIiwPuyMIJ2maTQxi7?=
 =?us-ascii?Q?kWSaQNFo4NU7hBG4RSTduhxvOYBrHBRL8iBKF+dCSIHI8RRTcYHQp//X281N?=
 =?us-ascii?Q?zVoz/+3Y/4H73+/eHQ8sKarGRikRXvCy6x67JAXO+mhiy192x5Pc5vX1lPnw?=
 =?us-ascii?Q?6N/b21G0QMyVkRIFTEHqt9MYY5UafAr+HgSgpDKt9NrKj9HOJqW8smLpH4Oi?=
 =?us-ascii?Q?6OXVGgSsg4FGmBSHxtRv4kVoErWZpXFtCQTXetHEhxq/X+KdIWT3GtDC4aa1?=
 =?us-ascii?Q?RFnSO2V2lgffw+ykJa7vwdfWKWCPd3WqxaGhsbIDq0SuTbN7Sn1Z2s2cUMdd?=
 =?us-ascii?Q?84AhKa0lAlEcdFstG1e8FDjO3DSZ4FDS4ZM8o6M1i/df2VVvscfnNY7Lf1go?=
 =?us-ascii?Q?yxPxbikS6o6PueMzPjr8gZSUqcrtThf2kCIZkNdsFLxICNRd+/59WCfbTQJJ?=
 =?us-ascii?Q?Y8SxbkUUMM2ZOI4Qz4c+VaqUxX11XyCK3Aa1YsmQPhlPDoRrpnKHmACtmbBR?=
 =?us-ascii?Q?Eq6X+FvW11htcPenT47apCPoR1tJ2E8iIIUebnLC2napdXFK3drv/ZLpR52X?=
 =?us-ascii?Q?xuC2PIiuyBzzMY+aTl1IrNJEYNAYAqoj/QazU3m9a04CF5dqqAOzRZqAUxRo?=
 =?us-ascii?Q?jPdtXhVSBoi0twLGU9UiOGw5V+bSC3lw4FZJuoXW4gkO5oQVeRl92ye8Ztos?=
 =?us-ascii?Q?WPg/OXl2Azuxqm1NxK0KHEOezWePlK14XDLzE7NwGm2m3jI5Tq7Hfrd+x0x0?=
 =?us-ascii?Q?OqhpkQE75ABzz70mdCVdeqGrAwkU+pnhNCUMnVFQm36GadvPh1tYCDN166Hh?=
 =?us-ascii?Q?SXQi7EiPV/3jfYR0Nz48gIUpfRkVL+KD6sife7rEOOoCGcz4CdMO0L+9MChG?=
 =?us-ascii?Q?/IokXuA8zJ2V5YzsaJi+wPdaEHwiLijK3CdEJFRyjFQ/sL4ahF7U5QbN/ktV?=
 =?us-ascii?Q?T2QohvLGwuv6Irr3iwFD02ch/l1Pv5ej3tJ+guscIhE4Q0jJeaMN1Zr9uiEc?=
 =?us-ascii?Q?BVbzgvMFqva/nxndsiRkpO8xZ+i8nmaFZZWgrcfy1C11PWz8B1AXihUMgy4+?=
 =?us-ascii?Q?f4uh23HPausvO06Jqj0=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acdf86ac-75a6-4943-94e5-08dab6b9d3e3
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 18:50:47.3332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFOjWKBRYZ0jpwVcpiSXJzcyaENgtKajFczBsBepCrNsfzrNKIXJKtpHGSm2MNvj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6938
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

Add a kconfig CONFIG_VFIO_CONTAINER that controls compiling the container
code. If 'n' then only iommufd will provide the container service. All the
support for vfio iommu drivers, including type1, will not be built.

This allows a compilation check that no inappropriate dependencies between
the device/group and container have been created.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/Kconfig  | 37 ++++++++++++++++--------
 drivers/vfio/Makefile |  4 +--
 drivers/vfio/vfio.h   | 65 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 92 insertions(+), 14 deletions(-)

diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
index 1118d322eec97d..d384419d151dda 100644
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
@@ -12,25 +12,27 @@ menuconfig VFIO
 	  If you don't know what to do here, say N.
 
 if VFIO
+config VFIO_CONTAINER
+	bool "Support for the VFIO container /dev/vfio/vfio"
+	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64)
+	default y
+	help
+	  The VFIO container is the classic interface to VFIO for establishing
+	  mappings. If N is selected here then IOMMUFD must be used the manage
+	  the mappings.
+
+	  Unless testing IOMMUFD say Y here.
+
+if VFIO_CONTAINER
 config VFIO_IOMMU_TYPE1
 	tristate
-	default n
+	default MMU && (X86 || S390 || ARM || ARM64)
 
 config VFIO_IOMMU_SPAPR_TCE
 	tristate
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
2.38.0

