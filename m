Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 720687DD00B
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 16:14:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC3010E529;
	Tue, 31 Oct 2023 15:14:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0359010E525
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 15:13:54 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39VCA1wF001257; Tue, 31 Oct 2023 15:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=PjVhksK44pf3FoXA/CKAXmV5j35NCDvR197+Wv1+1XQ=; b=DzI
 tXiZsDZaYb+/Vz/n2w2h8VJ/rPX0Yl+5rJvj1i3IfPHh+D3WGs4gtj8lJCo4zTM8
 xMFWuim2Ma/8QcrrojMjjkdxv7hG2NFYwF+USGhHEK9lQryYUB4fMnO3ml0zdLty
 CDu/UBn/5BbBToXsetu0q/xgNDgdLCXDMjbwBGqPLz1hTXq7oW6Snvw4xgiy8KNT
 6Q45Q53tLgex4Yp4ixSv0P5i9xs7lB0A2+2sSO91yrjvz1VtuJ9P+W+BACgKBvhB
 It5Hmejpq+YVOJT8tYqQ+3AMZptI2W+k0VZOgSxpqUNb8TUj3UPMkYomR/3Gh7X9
 InbajdCasOMj+630HOg==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3u0rjntf40-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 31 Oct 2023 15:13:26 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 15:13:25 +0000
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.51) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34 via Frontend
 Transport; Tue, 31 Oct 2023 15:13:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kf3GpE7X5KdW+l+DsT9RxV7SgPaRosD1bdAKEBeMEUZhP0IE1j9IdRecT5nEZGP1J3ORwP9r4zuumzD3qdbtC9Hpudivr0G9ouwpZgkFC0q2sV007rtrGni3kzGmyce1tZJIdSed8ca5M4uflPXrcGzBa2U8vd/ZyqO91iogrYM3QRrUGCjbGYG2xjaxCEJYTdL1I1l2uNaJSpTMwepqL7SJwgxsXjVv8PpMz6dpHZ0rojygn1y8HceRR9hFyodn+uNEyht1JNIzJaBShgNqRtkCCGtVKwXRUNhlNIQQbgEYj4R4KN+eslTk+Lzf1cHbT/GkG+QPh/3yLPFVuXGc1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjVhksK44pf3FoXA/CKAXmV5j35NCDvR197+Wv1+1XQ=;
 b=FNR8F/7BF25thn41rUnKxRynzmuF0WRt+Db8XCJvBwmKWvqrHyaz5wynLqJkVvruxig3UU3MQJq1SjW3uw+nJjAbxm6DptnyCw6g3GM8W2aPAwXAQPM8uWznEb0SlmBsc8b8ZB1Jb5XJ68ODpKS8o7b3D6PmFwQifEBleUHAxqMeJwY68uwR+2I/bDok/uua6GEqgzBPZDUmNZt/r435fn0ZbNX1GWgrA07bHEIn8WG2S7Cy2baXs5alzgQ+2TDWw6yphEY9S5PC23elxyRd/B+w8BhbcnG8O9l1wmsTsY0uAbq2U21ULfY4zApeEjEimbkVwh290shqVlSE+oQ0Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjVhksK44pf3FoXA/CKAXmV5j35NCDvR197+Wv1+1XQ=;
 b=Z27TZGmqtUB7Dc1SGNcXUursJYFu6VvrrTslVqZtnroH8sdp1mS5TJIUiMV42jn6rrKw3X3ZtIuQVTFDVgIIhGq9FyaDv0tmoK0TwzAd/IX90STv/pUu1iODwL5e5VfmLv2mM1Yuakzeqg0knzmmUlnULO6sBOagYDiQj5QA9c8=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by CWLP265MB2018.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:6a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.25; Tue, 31 Oct
 2023 15:13:21 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::eef1:bccc:508d:e086]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::eef1:bccc:508d:e086%5]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 15:13:21 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 12/20] drm/imagination: Implement power management
Date: Tue, 31 Oct 2023 15:12:49 +0000
Message-Id: <20231031151257.90350-13-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231031151257.90350-1-sarah.walker@imgtec.com>
References: <20231031151257.90350-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0301.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::18) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|CWLP265MB2018:EE_
X-MS-Office365-Filtering-Correlation-Id: f379b17f-fd6e-4676-fa9f-08dbda23eb51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jGcigI+uiLivQFdc/z9PJLYEPatUsVkWzV2HH00TSuDsgzZtpmfCUo1Gb3AZ113wlh4sOlwVeusIuIqWGp8LQ7WhyMejlg9eVbVzItXmCna1Gf6Pv6PeDnX1JX/cOfd50+fge1ajHN5i18jrNHun8rliv3Cf51ksB7aEdH7Yz1fAzabm9zB6Y8akrYmj9Ct/hMnkf8VDr+yzKawCAvjPFfz2cBpsFYCKbyTVUeYpjuRlAHcI/GTE2jvfasF+RLDSOHGYfyRH1ffVAT/wCyrC81r4ldp91fbzEJkaXuoAdbrVytgCii5/mACjTcgTBh3JJ/m1LgZBaFTPSqV61ZPqdPyL+0nWlyvcxmlPXDG/fdpcXuyZ2Kzk6QG1eQ7KqKXOHn3vloJFX0gMQmTZXbK1N8TOLopgVvCXZzyKXDOgaO7d3xKtCXXxhu+NwEeHWc4SYlmGlTjS6vjol1aI8d2vmWglRYVds8zcBrXSA6pjv2NVjI70/OAJbwxmjHrNAR+3TQw5SE8D5NHEBdYjybL5FTHNchPXeKNIFH2H8eGMnzzZt53eWIzzA9FDHVeZel6dt5KOodjnfFKmy+dRDfbc7HX65XU3qSrteTeC+CxDvN0WYWzHCwyTltOP8ilL7P0T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(39850400004)(346002)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(30864003)(7416002)(41300700001)(5660300002)(44832011)(8676002)(4326008)(8936002)(38350700005)(36756003)(86362001)(38100700002)(1076003)(316002)(6916009)(66946007)(66476007)(66556008)(2616005)(83380400001)(478600001)(6666004)(26005)(6512007)(6506007)(52116002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VmetmMq3jYrQ1EP0j24+UsFRXQTh1Z9thhSj2NKcgC6NzuwacAK+7xXK4yNr?=
 =?us-ascii?Q?lq67ojAy9Bu7Yjb3UKeqDqiC7aSMxDsde9SSfDjzfncjuL24l33FfTl9L0G1?=
 =?us-ascii?Q?2WQKmUJGQqrmdaazrUnDTqsASY5nMVNHbZ+z5PlNEJZPAALgP3GDDbHzrfub?=
 =?us-ascii?Q?w77bBr2toNhAMVwQ67jVYPTK3AKUBR0OntBh+PUrBOQ39W8owt+UAyjkYBMS?=
 =?us-ascii?Q?ennf1iJbyX13p8xyF4fBfumKjf5m/2+0EWDsIDc7kzqmbeZEgpF6Vby1KaDr?=
 =?us-ascii?Q?1WvFZTsrN1e+WzrxMKfOVo+Pk1ruxwwUCMiF4cacgXJKuC0SA6pOeO+FGRyA?=
 =?us-ascii?Q?x5D7On7HqQ7RwzUYxNoUURcsZ6Ce5m6ewLkSqvtsnOO+YJ8L8ZVLtSs6AfFH?=
 =?us-ascii?Q?VXVAygQFCMIBpJtN1ihZ2TeiSp+czGuURJeGM4DHOXTVZ5Ybv5zf6gNpY3fh?=
 =?us-ascii?Q?AoyY2CLMa1FMsfa41rFxNWB8B2q7STXAfZ8oK2V/pUZBx+GUwDupv3GF/vW+?=
 =?us-ascii?Q?ViymxM5AAjZ/XBgnyPIRF+DJ/6Umy8WiYTIRyLJ2aaj7HeNEYPI6fJj002nr?=
 =?us-ascii?Q?ClhwGtiDRV27T/Nf44dWeBfDhCIIdEfkLLUuacc0Mljs/96t/ta6URJCn322?=
 =?us-ascii?Q?JBFOYx8vbC/KYlj+jRoHB3LamdL9goyI0iMvgbBrKOHBvE4HORxissmWIhTp?=
 =?us-ascii?Q?2pMRAPXcL3sTzQQ1aoYhkuM1vA68ELYQN5Uq+vVPtYCHktLPawM2xoK3inSt?=
 =?us-ascii?Q?P+cJdc8jfFSnhzLOx6IeLB9wxAFax0EPQX/PlIzfNnGD8MWNgCYjVLZ9Tc10?=
 =?us-ascii?Q?DinkUEV2NiTAS0nublO4L5ABfhsYTx1EU9i9OLWLcZPb9uKTyrl/aBu0hyI3?=
 =?us-ascii?Q?Ox/sE4RgJmCGEAfxkDQ5F79+hqHJiaCy4+S1+G+ogZ2/CdCdQ0Vhs5ADuv9R?=
 =?us-ascii?Q?XpYE989Zgsyp0LBP4uXm3uRxK2wZ3fXSckuFnPER1jEsYsWWsjdxwQlp25n3?=
 =?us-ascii?Q?SGQV9Z07v/91Y8r4i9WNClT8hmkR0zOKHDKtTdf1dq2OpnwVfk8J2J7QvK4r?=
 =?us-ascii?Q?7SXkRjDSGyeNYWOtydeptAGLCj+C5xRpUuC0OJaacWGs7EPFI7GjNbpVpxhw?=
 =?us-ascii?Q?gyzw43cCB1z75kFR4yqvYNY37cxTkYKzwPNi5saevm0Duencs9hVr2id3EMn?=
 =?us-ascii?Q?f0Z4jvas/UJE8KnAWhu41OEQ+rQuyo1mhyOYoIk8p1XiF2ccJNTvInwvAayY?=
 =?us-ascii?Q?TbmjNT2PklKUF2Td9aib90NTfaP2VN6+Uy6kDeaYV6yR1yQgeQrW2wCF8Jpv?=
 =?us-ascii?Q?AAJ8DhIAvhtqpcTxfvTVxyFYErkisIexkRnhZfEc9LWM0rVNJavgbhohFZ0t?=
 =?us-ascii?Q?sPrtw5tufQ6T+X/qT3gpV7mdWZ2xUeBpOfQHjNV4ImgeyKqg7YDPu5gEKk3b?=
 =?us-ascii?Q?1NqvbFD6XCK1FwO6xcB3kbLzM9b28D9zuWCwmiXHyEXd1p3qXJGKYaTeoAYG?=
 =?us-ascii?Q?Dk2NFxUMc0GQOe/hgOVMWCQrqrHIsroswyg13R0Q2uzkjqEQp0o3RRgrK/ti?=
 =?us-ascii?Q?hzRWobgVPq0Y++MR6Zw74u5XDq/ZMpg9XCB+tM4gJGo5kkE1eqN/qbOF4DvP?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f379b17f-fd6e-4676-fa9f-08dbda23eb51
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 15:13:21.0806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AhV39YnY+mGmL7tYb/OcBXdM1TMKXb+a/P+zpJe4J+YGlPj1+ywA3qM4JRK9I5Y2j6aX18pVwwjs8+JXrGUaZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2018
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: 0cIrL9ghbmOb1ixnrxFX8Pa87wReVIZF
X-Proofpoint-ORIG-GUID: 0cIrL9ghbmOb1ixnrxFX8Pa87wReVIZF
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
 drivers/gpu/drm/imagination/pvr_power.c  | 271 +++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_power.h  |  39 ++++
 7 files changed, 374 insertions(+), 3 deletions(-)
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
index a5e62ca00737..0f37d84e9c61 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -141,6 +141,28 @@ struct pvr_device {
 	 * before submitting the next job.
 	 */
 	atomic_t mmu_flush_cache_flags;
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
index c3a5cc04c3de..debec785a7c0 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -5,6 +5,7 @@
 #include "pvr_drv.h"
 #include "pvr_gem.h"
 #include "pvr_mmu.h"
+#include "pvr_power.h"
 #include "pvr_rogue_defs.h"
 #include "pvr_rogue_fwif_client.h"
 #include "pvr_rogue_fwif_shared.h"
@@ -1265,9 +1266,16 @@ pvr_probe(struct platform_device *plat_dev)
 
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
@@ -1278,6 +1286,9 @@ pvr_probe(struct platform_device *plat_dev)
 err_device_fini:
 	pvr_device_fini(pvr_dev);
 
+err_watchdog_fini:
+	pvr_watchdog_fini(pvr_dev);
+
 	return err;
 }
 
@@ -1287,8 +1298,10 @@ pvr_remove(struct platform_device *plat_dev)
 	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
 	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
 
+	pm_runtime_suspend(drm_dev->dev);
 	pvr_device_fini(pvr_dev);
 	drm_dev_unplug(drm_dev);
+	pvr_watchdog_fini(pvr_dev);
 
 	return 0;
 }
@@ -1299,11 +1312,16 @@ static const struct of_device_id dt_match[] = {
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

