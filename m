Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E85A72E6E8
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 17:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D17C10E39C;
	Tue, 13 Jun 2023 15:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551A510E39C
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 15:20:26 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 35DBeOa8026252; Tue, 13 Jun 2023 15:48:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=OmUhKPT3WoVTTpi4EtUtt8ovYnfUAEmhePdiGBsg2j0=; b=GBt
 a18NXlJtG128PTbxJpcMzx375S8G5U3V9E5IgIvBZLl/ETz6abRq6K8n5slMlLS0
 ZinaO/yCucoo0gHz93jXKF1tN3gi5xHgPYG1f+cfLjL74d7SJiVEKs8qbpp44hc3
 xXxqJBdqryC0BujM0y0WLNr+aToEWL+JWVGtE4DvwZ5lu4ouJou5Ytq2YTKWLb6M
 daIyLFvIUWb/XP486EKA4I1yCfW5Ip5uk2jiiFS/mdHcYr1uWvLo9z5+fqL9E/GV
 yMD+PcZ61A5l2wI8VqMuNzQta7WQNg8za3N9pqfSJyKzuJ1jMVK14FlwnPxMtAKn
 XJmwlSQjS/1pw40wMbg==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3r4ferjc3g-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 13 Jun 2023 15:48:20 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 15:48:19 +0100
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (104.47.20.50) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23 via Frontend
 Transport; Tue, 13 Jun 2023 15:48:19 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XmE8U0b6ZyYTglWGGzeDQQ4B6D/qjgaVJ9oFbDwKvw9Di9u/HYbm385UZTCUoStU0XoTJdWy3m3DlMFQTnU7/86SAu2tx39AQT4mw+EzZ1dHGIlYuqiNBSNf2DSyfV74VPQfnFhtokvm34E0jbrehm+5ayKODwICnkqrfjSh2zmMd+6uSIoOWQDRxWTjOCMYaFc2fUsYbxKspiCD+5xcR/9N3+GeYicWg+zK4VlN/LzMr7AY9G2dQyCnBYLl7CeEikKZqNdbYRgAVBMtoBepklBkP0FalPa6ooPEuxVGnqtBQh4IKDfmzg8TYFA9BLypN1y5ef5Zgf5aqmbtM25wEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmUhKPT3WoVTTpi4EtUtt8ovYnfUAEmhePdiGBsg2j0=;
 b=Gb2+qsS5MvixOAwkIFKYVrlOMbcmdD24wOBJmQjGWWPIfC66AOpMTe/pHQqARxvslKt5mcMBFFxoaZ5qZQwuDvccqfvArO+EigQVCp8vR95IpMAcpcSXMrAsfon+DBTLAh0t+23/efaORwfUQXeh+YRDM9t33p4JTSHQ+8MpiuI+osjNqtid+aZwTa8QSC/KrvtQr7BiMHz1fFmnbiOLS1qMEZZ8aGDQj6MIWWonZwwAO/94xrW19pivOkQc8X563hri2G2Gzt+rZIBvtH7LCq9F0FkShyxGwr2j7xdr8celYwIF6O8UsGplP8a15Bm9xvy2eY6+dJD1tWUjDBOxSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmUhKPT3WoVTTpi4EtUtt8ovYnfUAEmhePdiGBsg2j0=;
 b=q25t0dkY/d8U3cN7IAlHD4kS/3r78dfRRnlvGM3q4Zfoacvo95mE4rZK0yYkLWyGUCjq+iDIBVHaZRR74PHklm0xQhx+R46Sr0mP0VxbTmbtYb6/DWhARrUWHWgAJaqez32v96jROjRvy0HKdv0OfSvKpuortowajms1AF09AEI=
Received: from CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:155::11)
 by LO3P265MB2282.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:100::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.21; Tue, 13 Jun
 2023 14:48:17 +0000
Received: from CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 ([fe80::23bd:d6e:8ecc:fa5f]) by CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 ([fe80::23bd:d6e:8ecc:fa5f%5]) with mapi id 15.20.6500.020; Tue, 13 Jun 2023
 14:48:17 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 09/17] drm/imagination: Implement power management
Date: Tue, 13 Jun 2023 15:47:52 +0100
Message-Id: <20230613144800.52657-10-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230613144800.52657-1-sarah.walker@imgtec.com>
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0375.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::20) To CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:155::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWXP265MB4826:EE_|LO3P265MB2282:EE_
X-MS-Office365-Filtering-Correlation-Id: 95c4b138-9cbf-4fd7-ffc5-08db6c1d3955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KbVIPcrD+brS5bZNpiAbGoetbPyV6HyBYcezRdLEAgH5uYdScGJ5oRovkSTOpdJRKiWJ0QPHTA9FEng+wIKgxuOTn122EAK8tXnerSt/39I09mNjUEL15I2BSUW7dOAnl1lYzQtGRjTU+jgP+HXTKQvNt2/JE9f7Vhp4+yrgMbXqt+wIMsxRDD3iizLxFIrGMdILpmiD+jnuq7PaTNKVHcuFxzhJRvBAFdYGFZZDtUEb7iSkyylooh/9LkaiuQaM4df64qIclIRffp0Hz6snyS7BCY+oX0nZEeEyw9tuiL1lC83gsydeZc90/LHFfMCtxzFpgef0ZhzvHnAcwRM2mlG9fTZELDycx6xEHlkJknsqC/Z7Okzo5FiDH5N1uaV0+7xS6Dx/aTFT//ie/ZxeROYYET90GjPMhsPTFAAlQHNGOwiH6eGoKKiO2MGNkfvnezUQxQTtNaqAx2X17aql7qM2WNTaa1zA0KqWQ1fllYYW7tU6vUa6oXQRnw4xSulUnRyKs6CFveguy/GViTItQYwNTacD2vyF/gGYy51zQUNruDKumWTxrwlI55rhcdxjm/HHrBlxYyaLQzfd8wqAu3rqr6m5n2VsQsIWtT8338TZXrxIovbnt1tVssphoNWZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(376002)(346002)(39840400004)(451199021)(44832011)(4326008)(8936002)(316002)(7416002)(66946007)(6916009)(66476007)(41300700001)(186003)(2906002)(30864003)(66556008)(478600001)(8676002)(5660300002)(6666004)(52116002)(6486002)(6512007)(1076003)(6506007)(26005)(83380400001)(36756003)(86362001)(2616005)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D+2S+0THZo3QVspIfKA5iNuKsiZeGXL9JLdJZAUgY+lYVuZBNpfjjDNds3a3?=
 =?us-ascii?Q?dP0TMv0BNcHny0v/eU+IYjEj4DYvmXGROM1PlAHoyrEbt4Y+4lj74MkymS0z?=
 =?us-ascii?Q?KJ54EFCB2QXWZTs2VHIZM+z9+XiBDP8Q0qAAv4ZlgfZ7tss+KenfZC8ms8kt?=
 =?us-ascii?Q?ZEDXNYAVAEn0QoLvSTas96y4Cr7tAViICMcFJZ2khHWUsWCUNANdoT1+gPub?=
 =?us-ascii?Q?z0iXXZaMxJ4cdGeUAvTB7/AAeBsd+riHProtEsu0Qfr43NsRge5ks1ajDdMN?=
 =?us-ascii?Q?u8GxC4LDYbRvNbgx3v6YtwABpmCwEaZngsXGiAePWwHskbkgFGelXJ5ahY6M?=
 =?us-ascii?Q?fYrFt0nU3wBTAaMS8PF5GhVEqL60Jo0z/WPJB1fZHTLFohVYaS5LDdmcAyHs?=
 =?us-ascii?Q?OX7EnJ9zE1Jpv4llIJ8bVLbSnTHQJb1kTzSJndKOoW8PO5fvKca1H7IryNr+?=
 =?us-ascii?Q?CZjyxC3Pt077DBOKwkFDywUWJn9jzRQ2dgP4gL1v94LrbolGYUbLfG8LSSvb?=
 =?us-ascii?Q?eWnRAGUJ0rSeWTtL/X6aiQfFd9N4Sly5OGYnO60J5haUIGNyxb7WTWD8YxaV?=
 =?us-ascii?Q?5MOKaNguZSe6mbPw0hVb7nyueOQI/kEPEy/RY/ZkqRsIOLgBC1fKAApo5yTU?=
 =?us-ascii?Q?lGcEC1WbFGIe8VCi0mYG2YsldgGrFWfoOaTW2/cNY5vdsfb6yh80IxJP2MEM?=
 =?us-ascii?Q?atmBJeo2hAimJ0ziXYV0bgCPJsCimF5BqCViUHteEfGSwQ/uht7HYdzGIcxh?=
 =?us-ascii?Q?kjX+5mUDxH6U34dHS8c/d9IbMAXFxYBlRP02195tBXSFkg6ODBWip2ZBbzxs?=
 =?us-ascii?Q?V4DvusvERaRWLyfJJlj+myvwwhiX80JWtsFS5mihKiK/7xpckFR0Ho8qabp/?=
 =?us-ascii?Q?W9/VVwLv8ONxt1Qx8yoUiO4/Tf4Q9QSQfODkzMYjawmZKxgrz9hbQC0mGykp?=
 =?us-ascii?Q?l+61fhe4bITiUQDIrWSS+GUqObc3Yt63H5NBtuD6To7uNXcviwmOurmt1a7a?=
 =?us-ascii?Q?3biBX7Qm5hNeVqFY30RSq2odzvHMCl5TaUaprMOV3I4IkZtfPw7wKGu6InSs?=
 =?us-ascii?Q?LWvxQTMYaHfJLqOBElNuICofXe3wJZq6Mu4q9euP9zG4VnXqsrvKSHEGcyum?=
 =?us-ascii?Q?ov62i8J+hZBNeMOEBwWzLnRkgL5/z1PbgCgEBj92gRy4GOCbsE32ZLUMhPCi?=
 =?us-ascii?Q?UdNr+F/MGPhkLNn/G4qq1tncDo5tBKGmONHNJIS+jg5wJ+Sd24VMH4IyMmO2?=
 =?us-ascii?Q?dbpm7z1xMdO23tc59JCkllzQzO39Hwz3W2BdeOlP5ShZFfY34E8RZXpYuokk?=
 =?us-ascii?Q?p4TRqnIsKJ+CWYI01lQfIHm4b92NbxuW3bCmSogZW9h27r639jc//aFgs9Lj?=
 =?us-ascii?Q?GeyqGUD3CINQZ5EdsjMmqdeccbwps2EumC5j5Wtjm06DObejXB2pEIJKT4rs?=
 =?us-ascii?Q?z317DNwZOm266r4b4xHnFwPjN+zwRDJCSk1yGaJM8s8KPLB35ymLuXQ2ADxd?=
 =?us-ascii?Q?vbS15Y963mdOWYRT+Mkdt1xc/76QqFpbRnyC96vov29/N0NVy68pLZ8pz9/h?=
 =?us-ascii?Q?sU8UvoXd2PDE/rcqpTFJPmxas9gfNQ+ohV/tP8Vslw4K/ybAV7kt3g8wBy2i?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c4b138-9cbf-4fd7-ffc5-08db6c1d3955
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 14:48:17.6586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FwPkvy2GL9U+UxMHWqa52p0LTG2c+yz3MufxaSDHD7wPLuodtzdebdGIgVlguQnZR5H7/TXJix9GrD5YeaWOww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2282
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: 7Ih0Bimcg68ovbGV4dVm59kEK3ajvdmb
X-Proofpoint-GUID: 7Ih0Bimcg68ovbGV4dVm59kEK3ajvdmb
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, sumit.semwal@linaro.org,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add power management to the driver, using runtime pm. The power off
sequence depends on firmware commands which are not implemented in this
patch.

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 drivers/gpu/drm/imagination/Makefile     |   1 +
 drivers/gpu/drm/imagination/pvr_device.c |  20 +-
 drivers/gpu/drm/imagination/pvr_device.h |  17 ++
 drivers/gpu/drm/imagination/pvr_drv.c    |  35 +++-
 drivers/gpu/drm/imagination/pvr_power.c  | 239 +++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_power.h  |  41 ++++
 6 files changed, 351 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/imagination/pvr_power.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_power.h

diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index 93d89909a8d7..00036b075505 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -8,6 +8,7 @@ powervr-y := \
 	pvr_device_info.o \
 	pvr_drv.o \
 	pvr_gem.o \
+	pvr_power.o \
 	pvr_vm.o
 
 obj-$(CONFIG_DRM_POWERVR) += powervr.o
diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 6f7ef3767e56..8428e1270a22 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -5,6 +5,7 @@
 #include "pvr_device_info.h"
 
 #include "pvr_fw.h"
+#include "pvr_power.h"
 #include "pvr_rogue_cr_defs.h"
 #include "pvr_vm.h"
 
@@ -492,6 +493,8 @@ pvr_device_gpu_fini(struct pvr_device *pvr_dev)
 int
 pvr_device_init(struct pvr_device *pvr_dev)
 {
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct device *dev = drm_dev->dev;
 	int err;
 
 	/* Enable and initialize clocks required for the device to operate. */
@@ -503,21 +506,31 @@ pvr_device_init(struct pvr_device *pvr_dev)
 	if (err)
 		goto err_device_clk_fini;
 
+	/* Explicitly power the GPU so we can access control registers before the FW is booted. */
+	err = pm_runtime_resume_and_get(dev);
+	if (err)
+		goto err_device_clk_fini;
+
 	/* Map the control registers into memory. */
 	err = pvr_device_reg_init(pvr_dev);
 	if (err)
-		goto err_device_clk_fini;
+		goto err_pm_runtime_put;
 
 	/* Perform GPU-specific initialization steps. */
 	err = pvr_device_gpu_init(pvr_dev);
 	if (err)
 		goto err_device_reg_fini;
 
+	pm_runtime_put_autosuspend(dev);
+
 	return 0;
 
 err_device_reg_fini:
 	pvr_device_reg_fini(pvr_dev);
 
+err_pm_runtime_put:
+	pm_runtime_put_sync_suspend(dev);
+
 err_device_clk_fini:
 	pvr_device_clk_fini(pvr_dev);
 
@@ -532,12 +545,17 @@ pvr_device_init(struct pvr_device *pvr_dev)
 void
 pvr_device_fini(struct pvr_device *pvr_dev)
 {
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct device *dev = drm_dev->dev;
+
 	/*
 	 * Deinitialization stages are performed in reverse order compared to
 	 * the initialization stages in pvr_device_init().
 	 */
+	pm_runtime_get_sync(dev);
 	pvr_device_gpu_fini(pvr_dev);
 	pvr_device_reg_fini(pvr_dev);
+	pm_runtime_put_sync_suspend(dev);
 	pvr_device_clk_fini(pvr_dev);
 }
 
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index ce10bca36eb1..e5c5e47bf573 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -118,6 +118,9 @@ struct pvr_device {
 	/** @regulator: Power regulator. */
 	struct regulator *regulator;
 
+	/** @irq_wq: Workqueue for actions triggered off the IRQ handler. */
+	struct workqueue_struct *irq_wq;
+
 	/**
 	 * @kernel_vm_ctx: Virtual memory context used for kernel mappings.
 	 *
@@ -130,6 +133,20 @@ struct pvr_device {
 
 	/** @fw_dev: Firmware related data. */
 	struct pvr_fw_device fw_dev;
+
+	struct {
+		/** @work: Work item for watchdog callback. */
+		struct delayed_work work;
+
+		/** @old_kccb_cmds_executed: KCCB command execution count at last watchdog poll. */
+		u32 old_kccb_cmds_executed;
+
+		/** @kccb_stall_count: Number of watchdog polls KCCB has been stalled for. */
+		u32 kccb_stall_count;
+	} watchdog;
+
+	/** @lost: %true if the device has been lost. */
+	bool lost;
 };
 
 /**
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 547b4fbe355c..9d26cfcc7a16 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -4,6 +4,7 @@
 #include "pvr_device.h"
 #include "pvr_drv.h"
 #include "pvr_gem.h"
+#include "pvr_power.h"
 #include "pvr_rogue_defs.h"
 #include "pvr_rogue_fwif_client.h"
 #include "pvr_rogue_fwif_shared.h"
@@ -73,6 +74,9 @@ pvr_ioctl_create_bo(struct drm_device *drm_dev, void *raw_args,
 
 	int err;
 
+	if (pvr_dev->lost)
+		return -EIO;
+
 	/* All padding fields must be zeroed. */
 	if (args->_padding_c != 0)
 		return -EINVAL;
@@ -159,11 +163,15 @@ pvr_ioctl_get_bo_mmap_offset(__always_unused struct drm_device *drm_dev,
 			     void *raw_args, struct drm_file *file)
 {
 	struct drm_pvr_ioctl_get_bo_mmap_offset_args *args = raw_args;
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
 	struct pvr_file *pvr_file = to_pvr_file(file);
 	struct pvr_gem_object *pvr_obj;
 	struct drm_gem_object *gem_obj;
 	int ret;
 
+	if (pvr_dev->lost)
+		return -EIO;
+
 	/* All padding fields must be zeroed. */
 	if (args->_padding_4 != 0)
 		return -EINVAL;
@@ -647,6 +655,9 @@ pvr_ioctl_dev_query(struct drm_device *drm_dev, void *raw_args,
 	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
 	struct drm_pvr_ioctl_dev_query_args *args = raw_args;
 
+	if (pvr_dev->lost)
+		return -EIO;
+
 	switch ((enum drm_pvr_dev_query)args->type) {
 	case DRM_PVR_DEV_QUERY_GPU_INFO_GET:
 		return pvr_dev_query_gpu_info_get(pvr_dev, args);
@@ -813,10 +824,14 @@ pvr_ioctl_create_vm_context(struct drm_device *drm_dev, void *raw_args,
 			    struct drm_file *file)
 {
 	struct drm_pvr_ioctl_create_vm_context_args *args = raw_args;
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
 	struct pvr_file *pvr_file = to_pvr_file(file);
 	struct pvr_vm_context *vm_ctx;
 	int err;
 
+	if (pvr_dev->lost)
+		return -EIO;
+
 	if (args->_padding_4)
 		return -EINVAL;
 
@@ -911,6 +926,9 @@ pvr_ioctl_vm_map(struct drm_device *drm_dev, void *raw_args,
 	u64 offset_plus_size;
 	int err;
 
+	if (pvr_dev->lost)
+		return -EIO;
+
 	/* Initial validation of args. */
 	if (args->_padding_14)
 		return -EINVAL;
@@ -1285,9 +1303,15 @@ pvr_probe(struct platform_device *plat_dev)
 
 	platform_set_drvdata(plat_dev, drm_dev);
 
+	devm_pm_runtime_enable(&plat_dev->dev);
+
+	pm_runtime_set_autosuspend_delay(&plat_dev->dev, 50);
+	pm_runtime_use_autosuspend(&plat_dev->dev);
+	pvr_power_init(pvr_dev);
+
 	err = pvr_device_init(pvr_dev);
 	if (err)
-		goto err_out;
+		goto err_power_fini;
 
 	err = drm_dev_register(drm_dev, 0);
 	if (err)
@@ -1298,6 +1322,9 @@ pvr_probe(struct platform_device *plat_dev)
 err_device_fini:
 	pvr_device_fini(pvr_dev);
 
+err_power_fini:
+	pvr_power_fini(pvr_dev);
+
 err_out:
 	return err;
 }
@@ -1310,6 +1337,7 @@ pvr_remove(struct platform_device *plat_dev)
 
 	drm_dev_unregister(drm_dev);
 	pvr_device_fini(pvr_dev);
+	pvr_power_fini(pvr_dev);
 
 	return 0;
 }
@@ -1321,11 +1349,16 @@ static const struct of_device_id dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, dt_match);
 
+static const struct dev_pm_ops pvr_pm_ops = {
+	SET_RUNTIME_PM_OPS(pvr_power_device_suspend, pvr_power_device_resume, pvr_power_device_idle)
+};
+
 static struct platform_driver pvr_driver = {
 	.probe = pvr_probe,
 	.remove = pvr_remove,
 	.driver = {
 		.name = PVR_DRIVER_NAME,
+		.pm = &pvr_pm_ops,
 		.of_match_table = dt_match,
 	},
 };
diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
new file mode 100644
index 000000000000..fa1a84934127
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -0,0 +1,239 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+#include "pvr_fw.h"
+#include "pvr_power.h"
+#include "pvr_rogue_fwif.h"
+
+#include <drm/drm_managed.h>
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <linux/timer.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#define POWER_SYNC_TIMEOUT_US (1000000) /* 1s */
+
+#define WATCHDOG_TIME_MS (500)
+
+static void
+pvr_device_lost(struct pvr_device *pvr_dev)
+{
+	if (!pvr_dev->lost)
+		pvr_dev->lost = true;
+}
+
+static int
+pvr_power_send_command(struct pvr_device *pvr_dev, struct rogue_fwif_kccb_cmd *pow_cmd)
+{
+	/* TODO: implement */
+	return -ENODEV;
+}
+
+int
+pvr_power_request_idle(struct pvr_device *pvr_dev)
+{
+	struct rogue_fwif_kccb_cmd pow_cmd;
+
+	/* Send FORCED_IDLE request to FW. */
+	pow_cmd.cmd_type = ROGUE_FWIF_KCCB_CMD_POW;
+	pow_cmd.cmd_data.pow_data.pow_type = ROGUE_FWIF_POW_FORCED_IDLE_REQ;
+	pow_cmd.cmd_data.pow_data.power_req_data.pow_request_type = ROGUE_FWIF_POWER_FORCE_IDLE;
+
+	return pvr_power_send_command(pvr_dev, &pow_cmd);
+}
+
+int
+pvr_power_request_pwr_off(struct pvr_device *pvr_dev)
+{
+	struct rogue_fwif_kccb_cmd pow_cmd;
+
+	/* Send POW_OFF request to firmware. */
+	pow_cmd.cmd_type = ROGUE_FWIF_KCCB_CMD_POW;
+	pow_cmd.cmd_data.pow_data.pow_type = ROGUE_FWIF_POW_OFF_REQ;
+	pow_cmd.cmd_data.pow_data.power_req_data.forced = true;
+
+	return pvr_power_send_command(pvr_dev, &pow_cmd);
+}
+
+static int
+pvr_power_fw_disable(struct pvr_device *pvr_dev)
+{
+	int err;
+
+	cancel_delayed_work_sync(&pvr_dev->watchdog.work);
+
+	err = pvr_power_request_idle(pvr_dev);
+	if (err)
+		return err;
+
+	err = pvr_power_request_pwr_off(pvr_dev);
+	if (err)
+		return err;
+
+	/* TODO: stop firmware */
+	return -ENODEV;
+}
+
+static int
+pvr_power_fw_enable(struct pvr_device *pvr_dev)
+{
+	int err;
+
+	/* TODO: start firmware */
+	err = -ENODEV;
+	if (err)
+		return err;
+
+	queue_delayed_work(pvr_dev->irq_wq, &pvr_dev->watchdog.work,
+			   msecs_to_jiffies(WATCHDOG_TIME_MS));
+
+	return 0;
+}
+
+bool
+pvr_power_is_idle(struct pvr_device *pvr_dev)
+{
+	/* TODO: implement */
+	return true;
+}
+
+static bool
+pvr_watchdog_kccb_stalled(struct pvr_device *pvr_dev)
+{
+	/* TODO: implement */
+	return false;
+}
+
+static void
+pvr_watchdog_worker(struct work_struct *work)
+{
+	struct pvr_device *pvr_dev = container_of(work, struct pvr_device,
+						  watchdog.work.work);
+	bool stalled;
+
+	if (pvr_dev->lost)
+		return;
+
+	if (pm_runtime_get_if_in_use(from_pvr_device(pvr_dev)->dev) <= 0)
+		return;
+
+	stalled = pvr_watchdog_kccb_stalled(pvr_dev);
+
+	if (stalled) {
+		drm_err(from_pvr_device(pvr_dev), "GPU device lost");
+		pvr_device_lost(pvr_dev);
+	}
+
+	if (!pvr_dev->lost) {
+		queue_delayed_work(pvr_dev->irq_wq, &pvr_dev->watchdog.work,
+				   msecs_to_jiffies(WATCHDOG_TIME_MS));
+	}
+
+	pm_runtime_put(from_pvr_device(pvr_dev)->dev);
+}
+
+/**
+ * pvr_power_init() - Initialise power management for device
+ * @pvr_dev: Target PowerVR device.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * -%ENOMEM on out of memory.
+ */
+int
+pvr_power_init(struct pvr_device *pvr_dev)
+{
+	INIT_DELAYED_WORK(&pvr_dev->watchdog.work, pvr_watchdog_worker);
+
+	return 0;
+}
+
+int
+pvr_power_device_suspend(struct device *dev)
+{
+	struct platform_device *plat_dev = to_platform_device(dev);
+	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
+
+	clk_disable(pvr_dev->mem_clk);
+	clk_disable(pvr_dev->sys_clk);
+	clk_disable(pvr_dev->core_clk);
+
+	if (pvr_dev->regulator)
+		regulator_disable(pvr_dev->regulator);
+
+	return 0;
+}
+
+int
+pvr_power_device_resume(struct device *dev)
+{
+	struct platform_device *plat_dev = to_platform_device(dev);
+	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
+	int err;
+
+	if (pvr_dev->regulator) {
+		err = regulator_enable(pvr_dev->regulator);
+		if (err)
+			return err;
+	}
+
+	clk_enable(pvr_dev->core_clk);
+	clk_enable(pvr_dev->sys_clk);
+	clk_enable(pvr_dev->mem_clk);
+
+	return 0;
+}
+
+int
+pvr_power_device_idle(struct device *dev)
+{
+	struct platform_device *plat_dev = to_platform_device(dev);
+	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
+
+	return pvr_power_is_idle(pvr_dev) ? 0 : -EBUSY;
+}
+
+int
+pvr_power_reset(struct pvr_device *pvr_dev)
+{
+	int err;
+
+	/*
+	 * Take a power reference during the reset. This should prevent any interference with the
+	 * power state during reset.
+	 */
+	err = pvr_power_get(pvr_dev);
+	if (err)
+		goto err_out;
+
+	err = pvr_power_fw_disable(pvr_dev);
+	if (err)
+		goto err_power_put;
+
+	err = pvr_power_fw_enable(pvr_dev);
+
+err_power_put:
+	pvr_power_put(pvr_dev);
+
+err_out:
+	return err;
+}
+
+/**
+ * pvr_power_fini() - Shutdown power management for device
+ * @pvr_dev: Target PowerVR device.
+ */
+void
+pvr_power_fini(struct pvr_device *pvr_dev)
+{
+	cancel_delayed_work_sync(&pvr_dev->watchdog.work);
+}
diff --git a/drivers/gpu/drm/imagination/pvr_power.h b/drivers/gpu/drm/imagination/pvr_power.h
new file mode 100644
index 000000000000..557457e7bdcd
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_power.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#ifndef PVR_POWER_H
+#define PVR_POWER_H
+
+#include "pvr_device.h"
+
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
+
+int pvr_power_init(struct pvr_device *pvr_dev);
+void pvr_power_fini(struct pvr_device *pvr_dev);
+bool pvr_power_is_idle(struct pvr_device *pvr_dev);
+
+int pvr_power_request_idle(struct pvr_device *pvr_dev);
+int pvr_power_request_pwr_off(struct pvr_device *pvr_dev);
+
+int pvr_power_device_suspend(struct device *dev);
+int pvr_power_device_resume(struct device *dev);
+int pvr_power_device_idle(struct device *dev);
+
+int pvr_power_reset(struct pvr_device *pvr_dev);
+
+static __always_inline int
+pvr_power_get(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+
+	return pm_runtime_resume_and_get(drm_dev->dev);
+}
+
+static __always_inline int
+pvr_power_put(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+
+	return pm_runtime_put(drm_dev->dev);
+}
+
+#endif /* PVR_POWER_H */
-- 
2.40.1

