Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B237F4D8B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 17:57:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311BA10E2F6;
	Wed, 22 Nov 2023 16:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC84610E699
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 16:56:53 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AMG01m7020623; Wed, 22 Nov 2023 16:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=lEpyLFUZBHvKM400AV17L1qpragVTh8Kuy+BlJoVTPc=; b=gs1
 hHg3bBI9j3Wut/+fctayzV7qUhS4hjEkPBcd/xKNQULwWMfRzzmpCa1D3laWKhod
 T16k+42r0iaGnDnG0zLNZIiIrlW+2qQsAeTHK8lJsMPARmEcMQbQQCYLU5xGDfH1
 A8FV5vRsJZZmWeG2paw5wBYFws6fwOCWHEhjvFwuuHUfWzRUs//c+96tJSAUEffW
 28NmDYkBokQLsGLcvUSVS1M47VYg7gMOC4gvVb0Z/NViaKB0rKQr3NZblr/FVXzC
 g9U1ywCOCicHE6V97S7hsymHgo2SZVaXF2UYdEGnAZbYB+FyaqMikF6aKa2OzhI/
 PlUAsHpzE3xCMq8mm3g==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3ug99gsf36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 22 Nov 2023 16:35:26 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 16:35:26 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.104)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 16:35:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfmoDellWVeGWmaCA/48e5a6fczrVAR8qrhF3d/dPxln9Pf7IOgna/IfvvpoGH4IZf8FydhIorcqK0Eib+B3ipJOsdey5BHKlhz/ytj34IdelKHD0T/1bajqj2g6qFzZwVnd6XP9e8h1rC+AympGobQsqR0HwgGWLExThRjvuP65+m2Pk07rjF4i+kSMir0bbebZQI8VCgCavZ46taUQCyn6yqQCG9zg+Xv3fDzaoOPKABjjMIl3A8Dd7/vC/k4ggCQCqPTeJVvELV55jiuDidozLkN9VCkZTMCnnpT7Qbcn6EOSV9unhLUGcI/kj0jOIWhc2QGY8pPV+Ut2yCjSyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEpyLFUZBHvKM400AV17L1qpragVTh8Kuy+BlJoVTPc=;
 b=IuPzujYNW+Frn/6snsGj0MD6n6PZ5P0gYr5UKFLl9nqg+sQbqbxHYXjxdU4wThBsxGT6Q3Z88Ug0DSVVSHKudDeQx/pa7Xv26swIH2VklMyNF0jjbBhiHVGf8BnE74B8oIVkNbSctboE0o69afqQ8jOfBFXK3zF1SQcE4DykPMiq4YgjINUeTGzudyheixnKUcku6nX3CuPIyWx0wmPju8hoP8JYBIztB1Ba19DMDEh/jBIJaK416aGpC7lYLJk9z/orC3/uhabBWECmHVzaruSCLwMy/Z7qcBb3ZoJArmTHu53pDnEEThidpNfYcXaLmBPN/x+ddm+j+TWN+1zZ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEpyLFUZBHvKM400AV17L1qpragVTh8Kuy+BlJoVTPc=;
 b=rbFBJi8H6hvAEdNv/07hsniGcGRGn8VkaoXLLo6rNb/H5FZLaKLLno3xdh10sfHwU6sUQ8lcUGkYY71vqriBb3Ncl6vjhGzCwl1gMWBeCUK7WP3iQ4gzO7eVebEr81jjiQneElHYX0LJWhpwwU4ERaOhntC5jBOy7d4LND08fgo=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by CWLP265MB6864.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 16:35:24 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 16:35:24 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v9 14/20] drm/imagination: Implement MIPS firmware processor
 and MMU support
Date: Wed, 22 Nov 2023 16:34:35 +0000
Message-Id: <a114f7b3e97cb07460c7f2842901716a9207b0c4.1700668843.git.donald.robson@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1700668843.git.donald.robson@imgtec.com>
References: <cover.1700668843.git.donald.robson@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0273.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::10) To CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1a0::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5770:EE_|CWLP265MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a8386a6-7e5a-4c10-1bf1-08dbeb7906b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lK6stQ9/A6U2J4OppoJiYS06k5HCC6i0Kh6kpMqMNcJ7TmkQYC/pfEow1W8anYtHljAFTMjMtzb2sCVOtVMBfjkUwpFYGBvMSY8DEWOw6H9bdHYD6JsuzHvlZEjR6URQ9emhSP8exvBVYMrILeM02ZkmClnLGMI/k62aQg7Li5H2wTWzDaJ7+DTxocPzBQHN5goyrGLOqTB2mAGrCu33NF6rSYrxDr9YKUBCrBkYjA9j7ipoYqVh5hbawylaHBzSzDNFUMOrR9ji9vYNKiAxPZe3zbPvJQA3Y3YZZFM5eWp4wJHhLWc8IyHSoq/SIAZse7ERgVt5kCZwFBkv+TTXTb2jvFgirgY1ghkrsXj7Oa9oKa1PiZFEPpaFzePQajiu8gSRx5BygdzHirjk5cfe7H10myHCkfMccAXeCm9R83Qwzz7uYVlu+uoHxIglnSzXVS+9pnBBecNZum3oMjIPrk4v1d3wbZCyFkqtg4n/E0tC892IjV6lh7teUoGx8tgA6kc9JQOSFG+UTLinQOugumicqlsws+iIWo3WdHa3Uk1J1oHXM4P7st1D8lnkNGughJ52g/7IRdAn7KLJg1w6rhv2Wwan1rwQUFUGVusyy2vA81S0MFP+iXBh0u0e5B/j
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(346002)(39850400004)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(52116002)(5660300002)(38350700005)(6666004)(6506007)(6512007)(2616005)(8936002)(8676002)(4326008)(83380400001)(2906002)(7416002)(478600001)(30864003)(66476007)(6916009)(66556008)(107886003)(316002)(26005)(66946007)(6486002)(44832011)(38100700002)(41300700001)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1tabWAZ9nm3cX/N6DbIko3L+oJW/7fb+xmEYR5ucUZ5HrmV+vta74qiKjdAY?=
 =?us-ascii?Q?e56A6h3pnwfgte7mBgAKZ/aM5RO/AhZUO8icJISBt6MPSixPNwl/3jjpJ3PE?=
 =?us-ascii?Q?ObOcW+AJeuAgmD3qlJnrX3oGRSfm4Qgoa3q5lwzAFEVDwfWv8iMbdOJCrRFk?=
 =?us-ascii?Q?IksSfpiituCX5pbAyULYDQVF85doybAzi+nO6K4M/HEpaHV5Td5f8064QSa1?=
 =?us-ascii?Q?ftUiZE9KriWTurVq6y7ZpR4fm7xJ73Vk/lb/AUIWxSjhhcu8nMT00yGtEZ4f?=
 =?us-ascii?Q?doUGRePeZgnnL6aYy5hoIJi83juekBGeBabPgGr+2UirwWAyL6HrzD4FHGcu?=
 =?us-ascii?Q?PfpXVKUtMO35ZvnL/ciUqkyy49+KnN0M8lhHDIc3hF+vjQCGUICGvIp9P91O?=
 =?us-ascii?Q?Ya5Q+70kd+/IJafpHpVgw2r6XixiwQ/H/EadANIF+hZAQDe4cjji+oTXLreY?=
 =?us-ascii?Q?NPKUlfv8BERsBCMHAAcslfE6/3VM1KFZ2L2yhTn+MWUXTDDwTQAn3TWUXwx5?=
 =?us-ascii?Q?xGgilAWl5swMe+DxXbXTbvWGjTy7gqCd2R2que4w7fWpGSdsi8GvhqdDfiVV?=
 =?us-ascii?Q?QXTxN1Sz9BVh/lrFhZtBLVFRx0gxe4AucoyLmDewQeO43RXk1lCKRn5236xg?=
 =?us-ascii?Q?MuIZpwxm1+gjc4kuDJVWNgOqnntjb3HwCyBCGJUjMlmEOEM/6qJ3Ru20q6s9?=
 =?us-ascii?Q?eihvwOBunqfIqlTxk6/zuPFXTGxDP6q3RmbPJ3GYWvPVjGad37Nq9C5+4dhY?=
 =?us-ascii?Q?wcrs00POklEmgN/Flo3zV5NadIQOFuURMR0mSwVtvuDYunANwR56lGkMvgIU?=
 =?us-ascii?Q?GP/sH4rJeXTaEE2dB0I4bEV9A6ZZuubjqTLP6O+4X8eOin/6ZOLPM+IyTIq/?=
 =?us-ascii?Q?N2+NrR/Fs8ZSGGxWZ/2D7SyWElcKQ/dhPaLS/7ZGVTLRHxA7RrgCVsP0/FZR?=
 =?us-ascii?Q?Exy7bLTj0gbHtah+6DuBDGHKpNDrcNgG5mePyoJroiO+xigTI/zlm+cxXQuB?=
 =?us-ascii?Q?1glry50Vdm7y8y/+kmaB42Zf8lN/XMx8Xa3vSQMHJs+BnCC02heFB3zZHoiK?=
 =?us-ascii?Q?qhjF4jVQ3mWuIFExNyTUpLzIb2opfCVwMU8DQdLEU2rpwUScUTsX8qB+8DnH?=
 =?us-ascii?Q?A4lmFex1yz70GAjbqVCIpxRmVDfy1JN1PXIfY77nfAqh0AWw6aO3kJx+R2rR?=
 =?us-ascii?Q?8B7Jl5xCmQ8UvFEUMUowgmDnVQiUaOd7ztUFf8tiDMe0zGVikDWuhaldVTfX?=
 =?us-ascii?Q?bO05bL2YsYRf6p8WIrxJIJaI0oKE/KmS4W1WyXGKtXb4IgVvDnaD2xqBSJ0Q?=
 =?us-ascii?Q?YPJDK9zjepW4EmmKJ7QRI7q2vvEimBfiSFAinMDe2I1Ezuy7E05ymH50z7DI?=
 =?us-ascii?Q?9iWocDlhZmc6AaUdIDK8Gjdlc+/DUbaBXTcFgj/7SQSrI/vwZ0w58+pA2dcl?=
 =?us-ascii?Q?1DfqMeRggPzTFGeAPcGfYA0FhMZBg4aVmIJY5B7FmH433UHWRn01B4j9pB/Z?=
 =?us-ascii?Q?LFf19zLTFJgI78/9bzg01GD+inFCY1p+DgRPzeyf6v1+brSCtOLaCyFLvIIm?=
 =?us-ascii?Q?kufSLi44Fn5DneJzWlqCqU4PbwSizbftfLByp6ak2UywoNxrV257lK2dvV/K?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8386a6-7e5a-4c10-1bf1-08dbeb7906b8
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 16:35:24.0803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PpZPOfDTsvE1/qAUEmLbw1zFBkKXTWAcoRb/raoVaiApmZbVlpkl+Vnjf9wXvC0VsiMPfexyaOKSmI7Ryg2fnXVQW3p0qj+pEGpy2GPjLYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6864
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: miqwFZM7XRew2dA2YGO3PTIB7FaZnuPy
X-Proofpoint-ORIG-GUID: miqwFZM7XRew2dA2YGO3PTIB7FaZnuPy
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
Cc: linux-doc@vger.kernel.org, hns@goldelico.com,
 krzysztof.kozlowski+dt@linaro.org, matthew.brost@intel.com, corbet@lwn.net,
 luben.tuikov@amd.com, dakr@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, Sarah Walker <sarah.walker@imgtec.com>,
 mripard@kernel.org, matt.coster@imgtec.com, robh+dt@kernel.org,
 faith.ekstrand@collabora.com, linux-kernel@vger.kernel.org, afd@ti.com,
 boris.brezillon@collabora.com, tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sarah Walker <sarah.walker@imgtec.com>

Add support for the MIPS firmware processor, used in the Series AXE GPU.
The MIPS firmware processor uses a separate MMU to the rest of the GPU, so
this patch adds support for that as well.

Changes since v8:
- Corrected license identifiers

Changes since v6:
- Fix integer overflow in VM map error path

Changes since v5:
- Use alloc_page() when allocating MIPS pagetable

Changes since v3:
- Get regs resource (removed from GPU resources commit)

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
---
 drivers/gpu/drm/imagination/Makefile      |   4 +-
 drivers/gpu/drm/imagination/pvr_device.c  |   5 +-
 drivers/gpu/drm/imagination/pvr_device.h  |   3 +
 drivers/gpu/drm/imagination/pvr_fw.c      |   2 +
 drivers/gpu/drm/imagination/pvr_fw_mips.c | 252 ++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_fw_mips.h |  48 +++++
 drivers/gpu/drm/imagination/pvr_vm_mips.c | 238 ++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_vm_mips.h |  22 ++
 8 files changed, 572 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_mips.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_mips.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.h

diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index 5c1c918af7a3..71dc36cc6b9d 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -10,11 +10,13 @@ powervr-y := \
 	pvr_drv.o \
 	pvr_fw.o \
 	pvr_fw_meta.o \
+	pvr_fw_mips.o \
 	pvr_fw_startstop.o \
 	pvr_fw_trace.o \
 	pvr_gem.o \
 	pvr_mmu.o \
 	pvr_power.o \
-	pvr_vm.o
+	pvr_vm.o \
+	pvr_vm_mips.o
 
 obj-$(CONFIG_DRM_POWERVR) += powervr.o
diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 1be14cdbdace..2d6db4715f85 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -50,16 +50,19 @@ pvr_device_reg_init(struct pvr_device *pvr_dev)
 {
 	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
 	struct platform_device *plat_dev = to_platform_device(drm_dev->dev);
+	struct resource *regs_resource;
 	void __iomem *regs;
 
+	pvr_dev->regs_resource = NULL;
 	pvr_dev->regs = NULL;
 
-	regs = devm_platform_ioremap_resource(plat_dev, 0);
+	regs = devm_platform_get_and_ioremap_resource(plat_dev, 0, &regs_resource);
 	if (IS_ERR(regs))
 		return dev_err_probe(drm_dev->dev, PTR_ERR(regs),
 				     "failed to ioremap gpu registers\n");
 
 	pvr_dev->regs = regs;
+	pvr_dev->regs_resource = regs_resource;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 39347595c6f0..8853249f4884 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -93,6 +93,9 @@ struct pvr_device {
 	/** @fw_version: Firmware version detected at runtime. */
 	struct pvr_fw_version fw_version;
 
+	/** @regs_resource: Resource representing device control registers. */
+	struct resource *regs_resource;
+
 	/**
 	 * @regs: Device control registers.
 	 *
diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/imagination/pvr_fw.c
index f8ed981f1807..3debc9870a82 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.c
+++ b/drivers/gpu/drm/imagination/pvr_fw.c
@@ -933,6 +933,8 @@ pvr_fw_init(struct pvr_device *pvr_dev)
 
 	if (fw_dev->processor_type == PVR_FW_PROCESSOR_TYPE_META)
 		fw_dev->defs = &pvr_fw_defs_meta;
+	else if (fw_dev->processor_type == PVR_FW_PROCESSOR_TYPE_MIPS)
+		fw_dev->defs = &pvr_fw_defs_mips;
 	else
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/imagination/pvr_fw_mips.c b/drivers/gpu/drm/imagination/pvr_fw_mips.c
new file mode 100644
index 000000000000..0bed0257e2ab
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_mips.c
@@ -0,0 +1,252 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+#include "pvr_fw.h"
+#include "pvr_fw_mips.h"
+#include "pvr_gem.h"
+#include "pvr_rogue_mips.h"
+#include "pvr_vm_mips.h"
+
+#include <linux/elf.h>
+#include <linux/err.h>
+#include <linux/types.h>
+
+#define ROGUE_FW_HEAP_MIPS_BASE 0xC0000000
+#define ROGUE_FW_HEAP_MIPS_SHIFT 24 /* 16 MB */
+#define ROGUE_FW_HEAP_MIPS_RESERVED_SIZE SZ_1M
+
+/**
+ * process_elf_command_stream() - Process ELF firmware image and populate
+ *                                firmware sections
+ * @pvr_dev: Device pointer.
+ * @fw: Pointer to firmware image.
+ * @fw_code_ptr: Pointer to FW code section.
+ * @fw_data_ptr: Pointer to FW data section.
+ * @fw_core_code_ptr: Pointer to FW coremem code section.
+ * @fw_core_data_ptr: Pointer to FW coremem data section.
+ *
+ * Returns :
+ *  * 0 on success, or
+ *  * -EINVAL on any error in ELF command stream.
+ */
+static int
+process_elf_command_stream(struct pvr_device *pvr_dev, const u8 *fw, u8 *fw_code_ptr,
+			   u8 *fw_data_ptr, u8 *fw_core_code_ptr, u8 *fw_core_data_ptr)
+{
+	struct elf32_hdr *header = (struct elf32_hdr *)fw;
+	struct elf32_phdr *program_header = (struct elf32_phdr *)(fw + header->e_phoff);
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	u32 entry;
+	int err;
+
+	for (entry = 0; entry < header->e_phnum; entry++, program_header++) {
+		void *write_addr;
+
+		/* Only consider loadable entries in the ELF segment table */
+		if (program_header->p_type != PT_LOAD)
+			continue;
+
+		err = pvr_fw_find_mmu_segment(pvr_dev, program_header->p_vaddr,
+					      program_header->p_memsz, fw_code_ptr, fw_data_ptr,
+					      fw_core_code_ptr, fw_core_data_ptr, &write_addr);
+		if (err) {
+			drm_err(drm_dev,
+				"Addr 0x%x (size: %d) not found in any firmware segment",
+				program_header->p_vaddr, program_header->p_memsz);
+			return err;
+		}
+
+		/* Write to FW allocation only if available */
+		if (write_addr) {
+			memcpy(write_addr, fw + program_header->p_offset,
+			       program_header->p_filesz);
+
+			memset((u8 *)write_addr + program_header->p_filesz, 0,
+			       program_header->p_memsz - program_header->p_filesz);
+		}
+	}
+
+	return 0;
+}
+
+static int
+pvr_mips_init(struct pvr_device *pvr_dev)
+{
+	pvr_fw_heap_info_init(pvr_dev, ROGUE_FW_HEAP_MIPS_SHIFT, ROGUE_FW_HEAP_MIPS_RESERVED_SIZE);
+
+	return pvr_vm_mips_init(pvr_dev);
+}
+
+static void
+pvr_mips_fini(struct pvr_device *pvr_dev)
+{
+	pvr_vm_mips_fini(pvr_dev);
+}
+
+static int
+pvr_mips_fw_process(struct pvr_device *pvr_dev, const u8 *fw,
+		    u8 *fw_code_ptr, u8 *fw_data_ptr, u8 *fw_core_code_ptr, u8 *fw_core_data_ptr,
+		    u32 core_code_alloc_size)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	struct pvr_fw_mips_data *mips_data = fw_dev->processor_data.mips_data;
+	const struct pvr_fw_layout_entry *boot_code_entry;
+	const struct pvr_fw_layout_entry *boot_data_entry;
+	const struct pvr_fw_layout_entry *exception_code_entry;
+	const struct pvr_fw_layout_entry *stack_entry;
+	struct rogue_mipsfw_boot_data *boot_data;
+	dma_addr_t dma_addr;
+	u32 page_nr;
+	int err;
+
+	err = process_elf_command_stream(pvr_dev, fw, fw_code_ptr, fw_data_ptr, fw_core_code_ptr,
+					 fw_core_data_ptr);
+	if (err)
+		return err;
+
+	boot_code_entry = pvr_fw_find_layout_entry(pvr_dev, MIPS_BOOT_CODE);
+	boot_data_entry = pvr_fw_find_layout_entry(pvr_dev, MIPS_BOOT_DATA);
+	exception_code_entry = pvr_fw_find_layout_entry(pvr_dev, MIPS_EXCEPTIONS_CODE);
+	if (!boot_code_entry || !boot_data_entry || !exception_code_entry)
+		return -EINVAL;
+
+	WARN_ON(pvr_gem_get_dma_addr(fw_dev->mem.code_obj->gem, boot_code_entry->alloc_offset,
+				     &mips_data->boot_code_dma_addr));
+	WARN_ON(pvr_gem_get_dma_addr(fw_dev->mem.data_obj->gem, boot_data_entry->alloc_offset,
+				     &mips_data->boot_data_dma_addr));
+	WARN_ON(pvr_gem_get_dma_addr(fw_dev->mem.code_obj->gem,
+				     exception_code_entry->alloc_offset,
+				     &mips_data->exception_code_dma_addr));
+
+	stack_entry = pvr_fw_find_layout_entry(pvr_dev, MIPS_STACK);
+	if (!stack_entry)
+		return -EINVAL;
+
+	boot_data = (struct rogue_mipsfw_boot_data *)(fw_data_ptr + boot_data_entry->alloc_offset +
+						      ROGUE_MIPSFW_BOOTLDR_CONF_OFFSET);
+
+	WARN_ON(pvr_fw_object_get_dma_addr(fw_dev->mem.data_obj, stack_entry->alloc_offset,
+					   &dma_addr));
+	boot_data->stack_phys_addr = dma_addr;
+
+	boot_data->reg_base = pvr_dev->regs_resource->start;
+
+	for (page_nr = 0; page_nr < ARRAY_SIZE(boot_data->pt_phys_addr); page_nr++) {
+		/* Firmware expects 4k pages, but host page size might be different. */
+		u32 src_page_nr = (page_nr * ROGUE_MIPSFW_PAGE_SIZE_4K) >> PAGE_SHIFT;
+		u32 page_offset = (page_nr * ROGUE_MIPSFW_PAGE_SIZE_4K) & ~PAGE_MASK;
+
+		boot_data->pt_phys_addr[page_nr] = mips_data->pt_dma_addr[src_page_nr] +
+						   page_offset;
+	}
+
+	boot_data->pt_log2_page_size = ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K;
+	boot_data->pt_num_pages = ROGUE_MIPSFW_MAX_NUM_PAGETABLE_PAGES;
+	boot_data->reserved1 = 0;
+	boot_data->reserved2 = 0;
+
+	return 0;
+}
+
+static int
+pvr_mips_wrapper_init(struct pvr_device *pvr_dev)
+{
+	struct pvr_fw_mips_data *mips_data = pvr_dev->fw_dev.processor_data.mips_data;
+	const u64 remap_settings = ROGUE_MIPSFW_BOOT_REMAP_LOG2_SEGMENT_SIZE;
+	u32 phys_bus_width;
+
+	int err = PVR_FEATURE_VALUE(pvr_dev, phys_bus_width, &phys_bus_width);
+
+	if (WARN_ON(err))
+		return err;
+
+	/* Currently MIPS FW only supported with physical bus width > 32 bits. */
+	if (WARN_ON(phys_bus_width <= 32))
+		return -EINVAL;
+
+	pvr_cr_write32(pvr_dev, ROGUE_CR_MIPS_WRAPPER_CONFIG,
+		       (ROGUE_MIPSFW_REGISTERS_VIRTUAL_BASE >>
+			ROGUE_MIPSFW_WRAPPER_CONFIG_REGBANK_ADDR_ALIGN) |
+		       ROGUE_CR_MIPS_WRAPPER_CONFIG_BOOT_ISA_MODE_MICROMIPS);
+
+	/* Configure remap for boot code, boot data and exceptions code areas. */
+	pvr_cr_write64(pvr_dev, ROGUE_CR_MIPS_ADDR_REMAP1_CONFIG1,
+		       ROGUE_MIPSFW_BOOT_REMAP_PHYS_ADDR_IN |
+		       ROGUE_CR_MIPS_ADDR_REMAP1_CONFIG1_MODE_ENABLE_EN);
+	pvr_cr_write64(pvr_dev, ROGUE_CR_MIPS_ADDR_REMAP1_CONFIG2,
+		       (mips_data->boot_code_dma_addr &
+			~ROGUE_CR_MIPS_ADDR_REMAP1_CONFIG2_ADDR_OUT_CLRMSK) | remap_settings);
+
+	if (PVR_HAS_QUIRK(pvr_dev, 63553)) {
+		/*
+		 * WA always required on 36 bit cores, to avoid continuous unmapped memory accesses
+		 * to address 0x0.
+		 */
+		WARN_ON(phys_bus_width != 36);
+
+		pvr_cr_write64(pvr_dev, ROGUE_CR_MIPS_ADDR_REMAP5_CONFIG1,
+			       ROGUE_CR_MIPS_ADDR_REMAP5_CONFIG1_MODE_ENABLE_EN);
+		pvr_cr_write64(pvr_dev, ROGUE_CR_MIPS_ADDR_REMAP5_CONFIG2,
+			       (mips_data->boot_code_dma_addr &
+				~ROGUE_CR_MIPS_ADDR_REMAP5_CONFIG2_ADDR_OUT_CLRMSK) |
+			       remap_settings);
+	}
+
+	pvr_cr_write64(pvr_dev, ROGUE_CR_MIPS_ADDR_REMAP2_CONFIG1,
+		       ROGUE_MIPSFW_DATA_REMAP_PHYS_ADDR_IN |
+		       ROGUE_CR_MIPS_ADDR_REMAP2_CONFIG1_MODE_ENABLE_EN);
+	pvr_cr_write64(pvr_dev, ROGUE_CR_MIPS_ADDR_REMAP2_CONFIG2,
+		       (mips_data->boot_data_dma_addr &
+			~ROGUE_CR_MIPS_ADDR_REMAP2_CONFIG2_ADDR_OUT_CLRMSK) | remap_settings);
+
+	pvr_cr_write64(pvr_dev, ROGUE_CR_MIPS_ADDR_REMAP3_CONFIG1,
+		       ROGUE_MIPSFW_CODE_REMAP_PHYS_ADDR_IN |
+		       ROGUE_CR_MIPS_ADDR_REMAP3_CONFIG1_MODE_ENABLE_EN);
+	pvr_cr_write64(pvr_dev, ROGUE_CR_MIPS_ADDR_REMAP3_CONFIG2,
+		       (mips_data->exception_code_dma_addr &
+			~ROGUE_CR_MIPS_ADDR_REMAP3_CONFIG2_ADDR_OUT_CLRMSK) | remap_settings);
+
+	/* Garten IDLE bit controlled by MIPS. */
+	pvr_cr_write64(pvr_dev, ROGUE_CR_MTS_GARTEN_WRAPPER_CONFIG,
+		       ROGUE_CR_MTS_GARTEN_WRAPPER_CONFIG_IDLE_CTRL_META);
+
+	/* Turn on the EJTAG probe. */
+	pvr_cr_write32(pvr_dev, ROGUE_CR_MIPS_DEBUG_CONFIG, 0);
+
+	return 0;
+}
+
+static u32
+pvr_mips_get_fw_addr_with_offset(struct pvr_fw_object *fw_obj, u32 offset)
+{
+	struct pvr_device *pvr_dev = to_pvr_device(gem_from_pvr_gem(fw_obj->gem)->dev);
+
+	/* MIPS cacheability is determined by page table. */
+	return ((fw_obj->fw_addr_offset + offset) & pvr_dev->fw_dev.fw_heap_info.offset_mask) |
+	       ROGUE_FW_HEAP_MIPS_BASE;
+}
+
+static bool
+pvr_mips_has_fixed_data_addr(void)
+{
+	return true;
+}
+
+const struct pvr_fw_defs pvr_fw_defs_mips = {
+	.init = pvr_mips_init,
+	.fini = pvr_mips_fini,
+	.fw_process = pvr_mips_fw_process,
+	.vm_map = pvr_vm_mips_map,
+	.vm_unmap = pvr_vm_mips_unmap,
+	.get_fw_addr_with_offset = pvr_mips_get_fw_addr_with_offset,
+	.wrapper_init = pvr_mips_wrapper_init,
+	.has_fixed_data_addr = pvr_mips_has_fixed_data_addr,
+	.irq = {
+		.enable_reg = ROGUE_CR_MIPS_WRAPPER_IRQ_ENABLE,
+		.status_reg = ROGUE_CR_MIPS_WRAPPER_IRQ_STATUS,
+		.clear_reg = ROGUE_CR_MIPS_WRAPPER_IRQ_CLEAR,
+		.event_mask = ROGUE_CR_MIPS_WRAPPER_IRQ_STATUS_EVENT_EN,
+		.clear_mask = ROGUE_CR_MIPS_WRAPPER_IRQ_CLEAR_EVENT_EN,
+	},
+};
diff --git a/drivers/gpu/drm/imagination/pvr_fw_mips.h b/drivers/gpu/drm/imagination/pvr_fw_mips.h
new file mode 100644
index 000000000000..408dbe63a90c
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_mips.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_FW_MIPS_H
+#define PVR_FW_MIPS_H
+
+#include "pvr_rogue_mips.h"
+
+#include <asm/page.h>
+#include <linux/types.h>
+
+/* Forward declaration from pvr_gem.h. */
+struct pvr_gem_object;
+
+#define PVR_MIPS_PT_PAGE_COUNT ((ROGUE_MIPSFW_MAX_NUM_PAGETABLE_PAGES * ROGUE_MIPSFW_PAGE_SIZE_4K) \
+				>> PAGE_SHIFT)
+/**
+ * struct pvr_fw_mips_data - MIPS-specific data
+ */
+struct pvr_fw_mips_data {
+	/**
+	 * @pt_pages: Pages containing MIPS pagetable.
+	 */
+	struct page *pt_pages[PVR_MIPS_PT_PAGE_COUNT];
+
+	/** @pt: Pointer to CPU mapping of MIPS pagetable. */
+	u32 *pt;
+
+	/** @pt_dma_addr: DMA mappings of MIPS pagetable. */
+	dma_addr_t pt_dma_addr[PVR_MIPS_PT_PAGE_COUNT];
+
+	/** @boot_code_dma_addr: DMA address of MIPS boot code. */
+	dma_addr_t boot_code_dma_addr;
+
+	/** @boot_data_dma_addr: DMA address of MIPS boot data. */
+	dma_addr_t boot_data_dma_addr;
+
+	/** @exception_code_dma_addr: DMA address of MIPS exception code. */
+	dma_addr_t exception_code_dma_addr;
+
+	/** @cache_policy: Cache policy for this processor. */
+	u32 cache_policy;
+
+	/** @pfn_mask: PFN mask for MIPS pagetable. */
+	u32 pfn_mask;
+};
+
+#endif /* PVR_FW_MIPS_H */
diff --git a/drivers/gpu/drm/imagination/pvr_vm_mips.c b/drivers/gpu/drm/imagination/pvr_vm_mips.c
new file mode 100644
index 000000000000..7268cf6e630b
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_vm_mips.c
@@ -0,0 +1,238 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+#include "pvr_fw_mips.h"
+#include "pvr_gem.h"
+#include "pvr_mmu.h"
+#include "pvr_rogue_mips.h"
+#include "pvr_vm.h"
+#include "pvr_vm_mips.h"
+
+#include <drm/drm_managed.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+/**
+ * pvr_vm_mips_init() - Initialise MIPS FW pagetable
+ * @pvr_dev: Target PowerVR device.
+ *
+ * Returns:
+ *  * 0 on success,
+ *  * -%EINVAL,
+ *  * Any error returned by pvr_gem_object_create(), or
+ *  * And error returned by pvr_gem_object_vmap().
+ */
+int
+pvr_vm_mips_init(struct pvr_device *pvr_dev)
+{
+	u32 pt_size = 1 << ROGUE_MIPSFW_LOG2_PAGETABLE_SIZE_4K(pvr_dev);
+	struct device *dev = from_pvr_device(pvr_dev)->dev;
+	struct pvr_fw_mips_data *mips_data;
+	u32 phys_bus_width;
+	int page_nr;
+	int err;
+
+	/* Page table size must be at most ROGUE_MIPSFW_MAX_NUM_PAGETABLE_PAGES * 4k pages. */
+	if (pt_size > ROGUE_MIPSFW_MAX_NUM_PAGETABLE_PAGES * SZ_4K)
+		return -EINVAL;
+
+	if (PVR_FEATURE_VALUE(pvr_dev, phys_bus_width, &phys_bus_width))
+		return -EINVAL;
+
+	mips_data = drmm_kzalloc(from_pvr_device(pvr_dev), sizeof(*mips_data), GFP_KERNEL);
+	if (!mips_data)
+		return -ENOMEM;
+
+	for (page_nr = 0; page_nr < ARRAY_SIZE(mips_data->pt_pages); page_nr++) {
+		mips_data->pt_pages[page_nr] = alloc_page(GFP_KERNEL | __GFP_ZERO);
+		if (!mips_data->pt_pages[page_nr]) {
+			err = -ENOMEM;
+			goto err_free_pages;
+		}
+
+		mips_data->pt_dma_addr[page_nr] = dma_map_page(dev, mips_data->pt_pages[page_nr], 0,
+							       PAGE_SIZE, DMA_TO_DEVICE);
+		if (dma_mapping_error(dev, mips_data->pt_dma_addr[page_nr])) {
+			err = -ENOMEM;
+			goto err_free_pages;
+		}
+	}
+
+	mips_data->pt = vmap(mips_data->pt_pages, pt_size >> PAGE_SHIFT, VM_MAP,
+			     pgprot_writecombine(PAGE_KERNEL));
+	if (!mips_data->pt) {
+		err = -ENOMEM;
+		goto err_free_pages;
+	}
+
+	mips_data->pfn_mask = (phys_bus_width > 32) ? ROGUE_MIPSFW_ENTRYLO_PFN_MASK_ABOVE_32BIT :
+						      ROGUE_MIPSFW_ENTRYLO_PFN_MASK;
+
+	mips_data->cache_policy = (phys_bus_width > 32) ? ROGUE_MIPSFW_CACHED_POLICY_ABOVE_32BIT :
+							  ROGUE_MIPSFW_CACHED_POLICY;
+
+	pvr_dev->fw_dev.processor_data.mips_data = mips_data;
+
+	return 0;
+
+err_free_pages:
+	for (; page_nr >= 0; page_nr--) {
+		if (mips_data->pt_dma_addr[page_nr])
+			dma_unmap_page(from_pvr_device(pvr_dev)->dev,
+				       mips_data->pt_dma_addr[page_nr], PAGE_SIZE, DMA_TO_DEVICE);
+
+		if (mips_data->pt_pages[page_nr])
+			__free_page(mips_data->pt_pages[page_nr]);
+	}
+
+	return err;
+}
+
+/**
+ * pvr_vm_mips_fini() - Release MIPS FW pagetable
+ * @pvr_dev: Target PowerVR device.
+ */
+void
+pvr_vm_mips_fini(struct pvr_device *pvr_dev)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	struct pvr_fw_mips_data *mips_data = fw_dev->processor_data.mips_data;
+	int page_nr;
+
+	vunmap(mips_data->pt);
+	for (page_nr = ARRAY_SIZE(mips_data->pt_pages) - 1; page_nr >= 0; page_nr--) {
+		dma_unmap_page(from_pvr_device(pvr_dev)->dev,
+			       mips_data->pt_dma_addr[page_nr], PAGE_SIZE, DMA_TO_DEVICE);
+
+		__free_page(mips_data->pt_pages[page_nr]);
+	}
+
+	fw_dev->processor_data.mips_data = NULL;
+}
+
+static u32
+get_mips_pte_flags(bool read, bool write, u32 cache_policy)
+{
+	u32 flags = 0;
+
+	if (read && write) /* Read/write. */
+		flags |= ROGUE_MIPSFW_ENTRYLO_DIRTY_EN;
+	else if (write)    /* Write only. */
+		flags |= ROGUE_MIPSFW_ENTRYLO_READ_INHIBIT_EN;
+	else
+		WARN_ON(!read);
+
+	flags |= cache_policy << ROGUE_MIPSFW_ENTRYLO_CACHE_POLICY_SHIFT;
+
+	flags |= ROGUE_MIPSFW_ENTRYLO_VALID_EN | ROGUE_MIPSFW_ENTRYLO_GLOBAL_EN;
+
+	return flags;
+}
+
+/**
+ * pvr_vm_mips_map() - Map a FW object into MIPS address space
+ * @pvr_dev: Target PowerVR device.
+ * @fw_obj: FW object to map.
+ *
+ * Returns:
+ *  * 0 on success,
+ *  * -%EINVAL if object does not reside within FW address space, or
+ *  * Any error returned by pvr_fw_object_get_dma_addr().
+ */
+int
+pvr_vm_mips_map(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	struct pvr_fw_mips_data *mips_data = fw_dev->processor_data.mips_data;
+	struct pvr_gem_object *pvr_obj = fw_obj->gem;
+	const u64 start = fw_obj->fw_mm_node.start;
+	const u64 size = fw_obj->fw_mm_node.size;
+	u64 end;
+	u32 cache_policy;
+	u32 pte_flags;
+	u32 start_pfn;
+	u32 end_pfn;
+	s32 pfn;
+	int err;
+
+	if (check_add_overflow(start, size - 1, &end))
+		return -EINVAL;
+
+	if (start < ROGUE_FW_HEAP_BASE ||
+	    start >= ROGUE_FW_HEAP_BASE + fw_dev->fw_heap_info.raw_size ||
+	    end < ROGUE_FW_HEAP_BASE ||
+	    end >= ROGUE_FW_HEAP_BASE + fw_dev->fw_heap_info.raw_size ||
+	    (start & ROGUE_MIPSFW_PAGE_MASK_4K) ||
+	    ((end + 1) & ROGUE_MIPSFW_PAGE_MASK_4K))
+		return -EINVAL;
+
+	start_pfn = (start & fw_dev->fw_heap_info.offset_mask) >> ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K;
+	end_pfn = (end & fw_dev->fw_heap_info.offset_mask) >> ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K;
+
+	if (pvr_obj->flags & PVR_BO_FW_FLAGS_DEVICE_UNCACHED)
+		cache_policy = ROGUE_MIPSFW_UNCACHED_CACHE_POLICY;
+	else
+		cache_policy = mips_data->cache_policy;
+
+	pte_flags = get_mips_pte_flags(true, true, cache_policy);
+
+	for (pfn = start_pfn; pfn <= end_pfn; pfn++) {
+		dma_addr_t dma_addr;
+		u32 pte;
+
+		err = pvr_fw_object_get_dma_addr(fw_obj,
+						 (pfn - start_pfn) <<
+						 ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K,
+						 &dma_addr);
+		if (err)
+			goto err_unmap_pages;
+
+		pte = ((dma_addr >> ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K)
+		       << ROGUE_MIPSFW_ENTRYLO_PFN_SHIFT) & mips_data->pfn_mask;
+		pte |= pte_flags;
+
+		WRITE_ONCE(mips_data->pt[pfn], pte);
+	}
+
+	pvr_mmu_flush_request_all(pvr_dev);
+
+	return 0;
+
+err_unmap_pages:
+	for (; pfn >= start_pfn; pfn--)
+		WRITE_ONCE(mips_data->pt[pfn], 0);
+
+	pvr_mmu_flush_request_all(pvr_dev);
+	WARN_ON(pvr_mmu_flush_exec(pvr_dev, true));
+
+	return err;
+}
+
+/**
+ * pvr_vm_mips_unmap() - Unmap a FW object into MIPS address space
+ * @pvr_dev: Target PowerVR device.
+ * @fw_obj: FW object to unmap.
+ */
+void
+pvr_vm_mips_unmap(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	struct pvr_fw_mips_data *mips_data = fw_dev->processor_data.mips_data;
+	const u64 start = fw_obj->fw_mm_node.start;
+	const u64 size = fw_obj->fw_mm_node.size;
+	const u64 end = start + size;
+
+	const u32 start_pfn = (start & fw_dev->fw_heap_info.offset_mask) >>
+			      ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K;
+	const u32 end_pfn = (end & fw_dev->fw_heap_info.offset_mask) >>
+			    ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K;
+
+	for (u32 pfn = start_pfn; pfn < end_pfn; pfn++)
+		WRITE_ONCE(mips_data->pt[pfn], 0);
+
+	pvr_mmu_flush_request_all(pvr_dev);
+	WARN_ON(pvr_mmu_flush_exec(pvr_dev, true));
+}
diff --git a/drivers/gpu/drm/imagination/pvr_vm_mips.h b/drivers/gpu/drm/imagination/pvr_vm_mips.h
new file mode 100644
index 000000000000..0fd59f68fb5b
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_vm_mips.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_VM_MIPS_H
+#define PVR_VM_MIPS_H
+
+/* Forward declaration from pvr_device.h. */
+struct pvr_device;
+
+/* Forward declaration from pvr_gem.h. */
+struct pvr_fw_object;
+
+int
+pvr_vm_mips_init(struct pvr_device *pvr_dev);
+void
+pvr_vm_mips_fini(struct pvr_device *pvr_dev);
+int
+pvr_vm_mips_map(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj);
+void
+pvr_vm_mips_unmap(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj);
+
+#endif /* PVR_VM_MIPS_H */
-- 
2.25.1

