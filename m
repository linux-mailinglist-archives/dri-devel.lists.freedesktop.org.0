Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D80E7BFDC7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC74510E378;
	Tue, 10 Oct 2023 13:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32ADB10E37B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 13:38:54 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39ACU2Wc020208; Tue, 10 Oct 2023 14:38:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=u1ra2t71ksOmLAFc1d2bTr3fHT+gLTvIQJ2se2x2AWA=; b=m3r
 75WKRtDxAdq0HEPDkiA3FvG6B7G8bbeB7rimlkHTE1eflxwXRM4ARQH81/Wm8aAo
 c6d3hmbmPO2wdUWqXjRxDh/x+olA4EEKqsAwUkDQsaHWA/wFHoNSpRvvDlz4hT4v
 /MI75j0JFPn8ufG89DC5JeW6ECpVyZukyygCKhz/fDczZFb+dq4ReRvHXIwdN+bi
 IfjZ3AgIJxEb0yjZZKR4A9/LeVAK7qIwfh0wahWsgQJAjgGOMe5ZkkcwuwPcnRuY
 fbeuJZV1fP4cNFpKMks4mz24ZBwHKjLraFrsPFNQaXmPaVa9k9sk5bfdVjjncQqH
 57E7UjFdxRFiP+p12Yg==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3tjydrt72j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 10 Oct 2023 14:38:17 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 10 Oct 2023 14:38:15 +0100
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.105)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31 via Frontend Transport; Tue, 10 Oct 2023 14:38:15 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9GNIJjcko5QYmluuGRwcJB9Beo8uQVfsQKNOLqBL9ZkbOiOqsDhqtwcX26Qnr0L0UKJ+5kpLVsVKuWqPkTt5rdIGEu+lHonltVZPVeqn0+whpg0zogbEGr5mCME25BfEyQC76aLc9V89DuzbwGDIiiEBHQt3DXqLtf66itSR1wJrfejcqe7lLvjR8EqiunXhy1HqbPzUJdu2HaseLmdJ20SfTIQPsa3S846TUrKuQhMHmYdUNDhTQ8woB/oiF4iaW/fzXXlSa1+EJmbE/HmXlUrWKukoza+uH/TzDHX9MXM3A+hoAwN3Lt4oXrJ++fUwU14ARxsNf+PV/kfT2+iNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1ra2t71ksOmLAFc1d2bTr3fHT+gLTvIQJ2se2x2AWA=;
 b=Y442TdYGtK+N+05OmsN7+HGGDJVTMWYrLS2feYB/JGfG5wI9i2sEeqRxJhTR36I0WJrlZv9SZhByD8xImj5HEC7DjRAfScvqPe2H01gEgzCNuVobjKOZqV15vePIKpBkI4h9PQM9uupnbCpVcAzjwYLMXM+doKqU+jTPZvAh0agGRYY0bcbFNZQFGBgUvDzXBSPUtrCUxbr+QjxrqIviCHNmeS6sGPIoBeGCA5N531Q/rsmkY/hn1KhF4YUxI+1ANxtRegJaI+lkhdVmKptjVUY8+cNMivtyOwUtKzBtVQBTo+bu9HnRZnICczZhwSUC2gr1ODKOQXYgjNWMbisraw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1ra2t71ksOmLAFc1d2bTr3fHT+gLTvIQJ2se2x2AWA=;
 b=O+aqRj+e0Jz5O2WUXWnVkQn14P2Bh893G+oRlsIGeLDCf8RDE0GfuOn2gzreZjCG09aP/JLHrC/P/kl23aWsLfNyHgH9fURgTHWTDnCiY4thrnpqAnQbty+ryBHqOQnKpACuIJCwHARnqHp3pCR0PxyapQnmmPGdbsh3e6ppZX8=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LO0P265MB6147.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:248::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 13:38:13 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1f14:8c15:179d:7afc]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1f14:8c15:179d:7afc%4]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 13:38:13 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 12/20] drm/imagination: Implement power management
Date: Tue, 10 Oct 2023 14:37:30 +0100
Message-Id: <20231010133738.35274-13-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010133738.35274-1-sarah.walker@imgtec.com>
References: <20231010133738.35274-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0183.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::8) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LO0P265MB6147:EE_
X-MS-Office365-Filtering-Correlation-Id: 344d2f52-8b56-47ee-855a-08dbc99626c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UpVmztetQk/UQtUubFL2+hE9ZWf6TpzCimV3jw0WqWERkx8Lz84KPnUufhSv4gAT4u3Fs8PegVIPeRcYu3IRwAxLqnbqWY/zBnv4NHQYVRI2yrlrwFBHEY9X67Be21fQicIrzOCNyWWpflB9DEVKEoSKuRYyiqspZaYXDf3T1IN8c4uGnTl2nSoA9b4BYfj0moBhdvq6dFdZR9UBD/c5G2ARL1spNBvDn2XP8EZFjYSiO33jLZLYyF/U4HM7j6SBCWj6IipcwRvXzww9PQtAitzc1o0yblgVjW3S7fw96COG0gLG+o7R0/X7AoIQU5n7WqfLnG5NQjpUY8dQ9cVw3Zt3Tf71OkNrDKyLeAxHTe09fOcSalbTslPAqxoGkztJwNJIo0/DMhsQ2MOk4JeLMqYgCM1t/HsGDxkhdj6TyJ3PRdO/2ayEz4AJWfLvbUYgrmruqdzgPkyngNeUIGABQFDccud9QsPb8TjQffOpatZTXM3+RK5nsTWX2fBm/WZcQUt8kHq4mZORvi/SCwlLm4gUnmUuZ8H4lnK6MWsm2+YkI3vqJ9I+3HVx+EVFRdMYVjnePJMEGks8XQC99y45CdG5sLyzDgWGHqEq7MNC+b1jpNmfDhoKbK5x1KSfTBD8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(346002)(396003)(39850400004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6512007)(478600001)(52116002)(6486002)(6666004)(6506007)(1076003)(83380400001)(26005)(2616005)(2906002)(30864003)(66556008)(316002)(66476007)(5660300002)(8936002)(44832011)(41300700001)(8676002)(4326008)(66946007)(6916009)(38100700002)(38350700002)(36756003)(86362001)(7416002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SiVFQt4qoS9Wj2fpoZF8JVRdPZLvrvXL4+lE0/9oHn3+oLY0h+ZhxCqbm5iK?=
 =?us-ascii?Q?F1J/IaH5vXH7/A6NAmj88kmmfMIxQRnWnb4NAUG1cmGc2tVavBJq5MWNW5lF?=
 =?us-ascii?Q?GTqCShp7cl4UADqPuqTm+m3Tj6CFgemsFSFqenIIrzupYTjecwrxb6zwzIVz?=
 =?us-ascii?Q?EkqvlsiMiF5zo1GQIfRZ41yvMoQd5R/RUjpcVKMdvy/+YCkSvOiS34GzB7wg?=
 =?us-ascii?Q?N4DnUog1X2XC3h3MNagD66JbhD1JirR9hfk2fTxINX5q578shRCnakvNB+JB?=
 =?us-ascii?Q?zV5UQYTgCDfwQ0vH4yHqxEcRNu8sUJCHFPXWyMdyPNSw2N7N/A2UR4IOBekJ?=
 =?us-ascii?Q?JLqd8ieaAhagR2CzsRTRM09+KCpO0PKTDSm8YhmkxxGsuDuhlKP8/IZhbKKD?=
 =?us-ascii?Q?UkpvGZyu2vnWhZsgIQSPg0UL6S6QKGvC5YU0qRsL16DcuFTbuykSzcp5c6Wk?=
 =?us-ascii?Q?JshhgUu6sCXHGoNpjvR0VyA+C4wPEUPl+u/00F0U9OFMNpTeKyBl1Phepu3s?=
 =?us-ascii?Q?mJPMWK0rJKpNNnBc/vuRBK+5QroCqj56JSki350GzTTdniVGAv1nw02fbPL4?=
 =?us-ascii?Q?1ACUAEFJ3qbUz4kkeo464Up1aiQPt6l2t8+JOPKV9xy7/2vNF4y4geYI64Kk?=
 =?us-ascii?Q?Yaofn3ygpx+eP75Ep4wU4ZBrTPSMG/ZGjUtbvbARuaDSxUBeK6oDWzYcgBjA?=
 =?us-ascii?Q?0IyIClyS5dzsDj+P9QsgvVfWbVYqKGa8hmPbokwsI2gHG025BgtQGtOlJQV2?=
 =?us-ascii?Q?r7XPMlfDntiyFoDHxDpr217gV8WH0Qq7NXzneXnXYQDVUCMhg68rE/d9YxoL?=
 =?us-ascii?Q?ESu7uAaeuQ1VAyKFcB/6ni3YfZEt1iV7PR6fNM79sMZH4hv8lrI1nRlDtb3G?=
 =?us-ascii?Q?8Ir/mvGZgsRFoei7bET0t5La4o9LWGVfmW0P5MuNmdVN9WIOkKVAlXo0QNBV?=
 =?us-ascii?Q?ziAjfMEPAyViiLmzOsRvoLv8q0ZfZaWHKR2wApAvwlI7P+qA1jR4S7gpIwue?=
 =?us-ascii?Q?+EUNDee/U/tSw+aFX9WLvpSRn4Uo4vvwLutA2nPU1UXRkcQm+o8wzBmxGGw/?=
 =?us-ascii?Q?8Nif/efwP5AaQN6seh3JC25yUXZ018Yo/yWHG/JlOve932XkQgcaw5oYJfqb?=
 =?us-ascii?Q?ocjBSkz9d3xkVTIWR18K3XBC/uGIMnvqOIQw2tXyLLnaXdTX1+UQS4kgldMz?=
 =?us-ascii?Q?xyUwIBtDqnxvfvIL/SAszPtUHt802DaiUSCBinDC7u3AoE77oJF/MFaCSmzO?=
 =?us-ascii?Q?TnIHRkWPDu5f1kBmlhuVIi7xbbNCeKICAl3Fgk5JjGx8+7OmIXnoeNFGJhQa?=
 =?us-ascii?Q?RkDixCGkSNs+TaT0/1utSuU2rm7Wl/iXD5c3bhwZh0lYH2paYAjFnBxWoYFl?=
 =?us-ascii?Q?etPK+xaUw7UffyWnXeb0LH9sA/VnvDWUOpOpJwzZUEYBxtN6kFF1wfa+5sL5?=
 =?us-ascii?Q?mVMFPet3TaZucFcTkCgqIQba7+OR1VY87qLNhqtJA8e+ymIn47hmZyf1cScf?=
 =?us-ascii?Q?/T3sSeyz+dQGwtftpwFwXOQJHBp4xjeF/QJpokgIy/6Lk5IuzbVE+ksECp18?=
 =?us-ascii?Q?ddvAejYYE8tFvzVSdkhNjyWOmC1S/iF0z7b+lQNp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 344d2f52-8b56-47ee-855a-08dbc99626c6
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 13:38:13.7383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4LNLLvpSLZbnqvv4HOn5t512ifakFu0HCkjZEVmpWrcXXu24EcTevepsoeVGMTRSM62V+TzTkjQ/kNOPH5V9UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6147
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: RqQTqqZMvK1nt6KKXWL4UECRDZXmH8Kv
X-Proofpoint-ORIG-GUID: RqQTqqZMvK1nt6KKXWL4UECRDZXmH8Kv
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
 luben.tuikov@amd.com, dakr@redhat.com, donald.robson@imgtec.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, mripard@kernel.org,
 robh+dt@kernel.org, faith.ekstrand@collabora.com, linux-kernel@vger.kernel.org,
 afd@ti.com, boris.brezillon@collabora.com, tzimmermann@suse.de,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add power management to the driver, using runtime pm. The power off
sequence depends on firmware commands which are not implemented in this
patch.

Changes since v5:
- Use RUNTIME_PM_OPS() to declare PM callbacks
- Add Kconfig dependency on CONFIG_PM

Changes since v4:
- Suspend runtime PM before unplugging device on rmmod

Changes since v3:
- Don't power device when calling pvr_device_gpu_fini()
- Documentation for pvr_dev->lost has been improved
- pvr_power_init() renamed to pvr_watchdog_init()
- Use drm_dev_{enter,exit}

Changes since v2:
- Use runtime PM
- Implement watchdog

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/imagination/Kconfig      |   1 +
 drivers/gpu/drm/imagination/Makefile     |   1 +
 drivers/gpu/drm/imagination/pvr_device.c |  23 +-
 drivers/gpu/drm/imagination/pvr_device.h |  22 ++
 drivers/gpu/drm/imagination/pvr_drv.c    |  20 +-
 drivers/gpu/drm/imagination/pvr_mmu.c    |   6 +-
 drivers/gpu/drm/imagination/pvr_power.c  | 271 +++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_power.h  |  39 ++++
 8 files changed, 378 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/imagination/pvr_power.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_power.h

diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
index 3e167d5470b4..2639fbf3ebac 100644
--- a/drivers/gpu/drm/imagination/Kconfig
+++ b/drivers/gpu/drm/imagination/Kconfig
@@ -5,6 +5,7 @@ config DRM_POWERVR
 	tristate "Imagination Technologies PowerVR (Series 6 and later) & IMG Graphics"
 	depends on ARM64
 	depends on DRM
+	depends on PM
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_SCHED
 	select DRM_GPUVM
diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index 8fcabc1bea36..235e2d329e29 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -10,6 +10,7 @@ powervr-y := \
 	pvr_fw.o \
 	pvr_gem.o \
 	pvr_mmu.o \
+	pvr_power.o \
 	pvr_vm.o
 
 obj-$(CONFIG_DRM_POWERVR) += powervr.o
diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index f71e400ea24e..51ff10522d23 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -5,6 +5,7 @@
 #include "pvr_device_info.h"
 
 #include "pvr_fw.h"
+#include "pvr_power.h"
 #include "pvr_rogue_cr_defs.h"
 #include "pvr_vm.h"
 
@@ -361,6 +362,8 @@ pvr_device_gpu_fini(struct pvr_device *pvr_dev)
 int
 pvr_device_init(struct pvr_device *pvr_dev)
 {
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct device *dev = drm_dev->dev;
 	int err;
 
 	/* Enable and initialize clocks required for the device to operate. */
@@ -368,13 +371,29 @@ pvr_device_init(struct pvr_device *pvr_dev)
 	if (err)
 		return err;
 
+	/* Explicitly power the GPU so we can access control registers before the FW is booted. */
+	err = pm_runtime_resume_and_get(dev);
+	if (err)
+		return err;
+
 	/* Map the control registers into memory. */
 	err = pvr_device_reg_init(pvr_dev);
 	if (err)
-		return err;
+		goto err_pm_runtime_put;
 
 	/* Perform GPU-specific initialization steps. */
-	return pvr_device_gpu_init(pvr_dev);
+	err = pvr_device_gpu_init(pvr_dev);
+	if (err)
+		goto err_pm_runtime_put;
+
+	pm_runtime_put(dev);
+
+	return 0;
+
+err_pm_runtime_put:
+	pm_runtime_put_sync_suspend(dev);
+
+	return err;
 }
 
 /**
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 350e894a2939..f7eb14942195 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -135,6 +135,28 @@ struct pvr_device {
 
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
+	/**
+	 * @lost: %true if the device has been lost.
+	 *
+	 * This variable is set if the device has become irretrievably unavailable, e.g. if the
+	 * firmware processor has stopped responding and can not be revived via a hard reset.
+	 */
+	bool lost;
+
+	/** @sched_wq: Workqueue for schedulers. */
+	struct workqueue_struct *sched_wq;
 };
 
 /**
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 4b0c52118735..cfd4cea5a69c 100644
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
@@ -1277,9 +1278,16 @@ pvr_probe(struct platform_device *plat_dev)
 
 	platform_set_drvdata(plat_dev, drm_dev);
 
+	devm_pm_runtime_enable(&plat_dev->dev);
+	pm_runtime_mark_last_busy(&plat_dev->dev);
+
+	pm_runtime_set_autosuspend_delay(&plat_dev->dev, 50);
+	pm_runtime_use_autosuspend(&plat_dev->dev);
+	pvr_watchdog_init(pvr_dev);
+
 	err = pvr_device_init(pvr_dev);
 	if (err)
-		return err;
+		goto err_watchdog_fini;
 
 	err = drm_dev_register(drm_dev, 0);
 	if (err)
@@ -1290,6 +1298,9 @@ pvr_probe(struct platform_device *plat_dev)
 err_device_fini:
 	pvr_device_fini(pvr_dev);
 
+err_watchdog_fini:
+	pvr_watchdog_fini(pvr_dev);
+
 	return err;
 }
 
@@ -1299,8 +1310,10 @@ pvr_remove(struct platform_device *plat_dev)
 	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
 	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
 
+	pm_runtime_suspend(drm_dev->dev);
 	drm_dev_unplug(drm_dev);
 	pvr_device_fini(pvr_dev);
+	pvr_watchdog_fini(pvr_dev);
 
 	return 0;
 }
@@ -1311,11 +1324,16 @@ static const struct of_device_id dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, dt_match);
 
+static const struct dev_pm_ops pvr_pm_ops = {
+	RUNTIME_PM_OPS(pvr_power_device_suspend, pvr_power_device_resume, pvr_power_device_idle)
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
diff --git a/drivers/gpu/drm/imagination/pvr_mmu.c b/drivers/gpu/drm/imagination/pvr_mmu.c
index 895e206fe555..34a290136f74 100644
--- a/drivers/gpu/drm/imagination/pvr_mmu.c
+++ b/drivers/gpu/drm/imagination/pvr_mmu.c
@@ -61,8 +61,10 @@
  * pvr_mmu_flush() - Request flush of all MMU caches.
  * @pvr_dev: Target PowerVR device.
  *
- * This function must be called following any possible change to the MMU page
- * tables.
+ * This function must be called following any possible change to the MMU page tables.
+ *
+ * As a failure to flush the MMU caches could risk memory corruption, if the flush fails (implying
+ * the firmware is not responding) then the GPU device is marked as lost.
  *
  * Returns:
  *  * 0 on success, or
diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
new file mode 100644
index 000000000000..a494fed92e81
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+#include "pvr_fw.h"
+#include "pvr_power.h"
+#include "pvr_rogue_fwif.h"
+
+#include <drm/drm_drv.h>
+#include <drm/drm_managed.h>
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/timer.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#define POWER_SYNC_TIMEOUT_US (1000000) /* 1s */
+
+#define WATCHDOG_TIME_MS (500)
+
+static int
+pvr_power_send_command(struct pvr_device *pvr_dev, struct rogue_fwif_kccb_cmd *pow_cmd)
+{
+	/* TODO: implement */
+	return -ENODEV;
+}
+
+static int
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
+static int
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
+pvr_power_fw_disable(struct pvr_device *pvr_dev, bool hard_reset)
+{
+	if (!hard_reset) {
+		int err;
+
+		cancel_delayed_work_sync(&pvr_dev->watchdog.work);
+
+		err = pvr_power_request_idle(pvr_dev);
+		if (err)
+			return err;
+
+		err = pvr_power_request_pwr_off(pvr_dev);
+		if (err)
+			return err;
+	}
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
+	queue_delayed_work(pvr_dev->sched_wq, &pvr_dev->watchdog.work,
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
+		goto out_requeue;
+
+	stalled = pvr_watchdog_kccb_stalled(pvr_dev);
+
+	if (stalled) {
+		drm_err(from_pvr_device(pvr_dev), "FW stalled, trying hard reset");
+
+		pvr_power_reset(pvr_dev, true);
+		/* Device may be lost at this point. */
+	}
+
+	pm_runtime_put(from_pvr_device(pvr_dev)->dev);
+
+out_requeue:
+	if (!pvr_dev->lost) {
+		queue_delayed_work(pvr_dev->sched_wq, &pvr_dev->watchdog.work,
+				   msecs_to_jiffies(WATCHDOG_TIME_MS));
+	}
+}
+
+/**
+ * pvr_watchdog_init() - Initialise watchdog for device
+ * @pvr_dev: Target PowerVR device.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * -%ENOMEM on out of memory.
+ */
+int
+pvr_watchdog_init(struct pvr_device *pvr_dev)
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
+	int idx;
+
+	if (!drm_dev_enter(drm_dev, &idx))
+		return -EIO;
+
+	clk_disable_unprepare(pvr_dev->mem_clk);
+	clk_disable_unprepare(pvr_dev->sys_clk);
+	clk_disable_unprepare(pvr_dev->core_clk);
+
+	drm_dev_exit(idx);
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
+	int idx;
+	int err;
+
+	if (!drm_dev_enter(drm_dev, &idx))
+		return -EIO;
+
+	err = clk_prepare_enable(pvr_dev->core_clk);
+	if (err)
+		goto err_drm_dev_exit;
+
+	err = clk_prepare_enable(pvr_dev->sys_clk);
+	if (err)
+		goto err_core_clk_disable;
+
+	err = clk_prepare_enable(pvr_dev->mem_clk);
+	if (err)
+		goto err_sys_clk_disable;
+
+	drm_dev_exit(idx);
+
+	return 0;
+
+err_sys_clk_disable:
+	clk_disable_unprepare(pvr_dev->sys_clk);
+
+err_core_clk_disable:
+	clk_disable_unprepare(pvr_dev->core_clk);
+
+err_drm_dev_exit:
+	drm_dev_exit(idx);
+
+	return err;
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
+/**
+ * pvr_power_reset() - Reset the GPU
+ * @pvr_dev: Device pointer
+ * @hard_reset: %true for hard reset, %false for soft reset
+ *
+ * If @hard_reset is %false and the FW processor fails to respond during the reset process, this
+ * function will attempt a hard reset.
+ *
+ * If a hard reset fails then the GPU device is reported as lost.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * Any error code returned by pvr_power_get, pvr_power_fw_disable or pvr_power_fw_enable().
+ */
+int
+pvr_power_reset(struct pvr_device *pvr_dev, bool hard_reset)
+{
+	/* TODO: Implement hard reset. */
+	int err;
+
+	/*
+	 * Take a power reference during the reset. This should prevent any interference with the
+	 * power state during reset.
+	 */
+	WARN_ON(pvr_power_get(pvr_dev));
+
+	err = pvr_power_fw_disable(pvr_dev, false);
+	if (err)
+		goto err_power_put;
+
+	err = pvr_power_fw_enable(pvr_dev);
+
+err_power_put:
+	pvr_power_put(pvr_dev);
+
+	return err;
+}
+
+/**
+ * pvr_watchdog_fini() - Shutdown watchdog for device
+ * @pvr_dev: Target PowerVR device.
+ */
+void
+pvr_watchdog_fini(struct pvr_device *pvr_dev)
+{
+	cancel_delayed_work_sync(&pvr_dev->watchdog.work);
+}
diff --git a/drivers/gpu/drm/imagination/pvr_power.h b/drivers/gpu/drm/imagination/pvr_power.h
new file mode 100644
index 000000000000..439f08d13655
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_power.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_POWER_H
+#define PVR_POWER_H
+
+#include "pvr_device.h"
+
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
+
+int pvr_watchdog_init(struct pvr_device *pvr_dev);
+void pvr_watchdog_fini(struct pvr_device *pvr_dev);
+
+bool pvr_power_is_idle(struct pvr_device *pvr_dev);
+
+int pvr_power_device_suspend(struct device *dev);
+int pvr_power_device_resume(struct device *dev);
+int pvr_power_device_idle(struct device *dev);
+
+int pvr_power_reset(struct pvr_device *pvr_dev, bool hard_reset);
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
2.42.0

