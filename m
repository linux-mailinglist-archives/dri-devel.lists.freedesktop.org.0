Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD4C90D995
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 18:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E842210E733;
	Tue, 18 Jun 2024 16:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JfNk+Pzu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 654E410E728;
 Tue, 18 Jun 2024 16:43:14 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-6fb2f398423so3423403a12.0; 
 Tue, 18 Jun 2024 09:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718728993; x=1719333793; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X5ij09frDd39efzAZkFTAzjB+rv6CK7gd8si9b05hGc=;
 b=JfNk+PzuqGWRQ4l7X/DWwqPKkLHVyRooN8ZlY3Nm676evAj1X0fpUufiFQziDEgw2x
 kuO7yi3g7A9nB7XZQ+l7nzc8oEG/njHZMxr2+3/Ps2knMQRgaOIz1NHWPuWkHaGA63M6
 f73FrXMgc2tWjrdb8oG1pqR6BhzGW+C77n3lDR517U3CaMZZbxceAEj/lX70jQyYqAkl
 bE2ARlMILpAy5mQj+qvEbgfsNugBpKHbf98ehAvryGBo9FkvoocdmLVbTWt6koqFo6dl
 /JN/kGonwhecvHdO86GvrsLb5duNC5MAwSwdlaLfKAMf0PIT0Pb2LR6K6brrwv5tN2jR
 LD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718728993; x=1719333793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X5ij09frDd39efzAZkFTAzjB+rv6CK7gd8si9b05hGc=;
 b=tNciK7P8aNqATPGm5NBXsQnbsvQSXRMZdj+Kig0qYJm6Thoi9bXSfI1zYcQWusWnxf
 FmpzJphY4wRd4B1bnX8srZYlD1iUxBLkqCkeujDxEwqw7NGZpbdQ/gsoTScFaez58Q12
 6BY7/M1zfMazrwOZ1H/oKKla1M7Cjxmj/72EZXhefgN8Fvpu6EX8sD4t0f3Z1g/TSH5n
 BIBiUSfwE3G+QXuMU5xVbgALrSSlnnV0tFz7fEBsYPt0lk+KgJD0w+a+VEa993oPAZOW
 0ThH4neizI4Y1FetYgNfw963GaRssjZoMDvjSLJLeaml2fH7dXhnHoSDXqgP3QzQaQIk
 zo6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy2fqMBbDrLrgof4sEQc9P1deMr7XA8pAD1nF4dzfEHYN5NwWkzt/uWcZm4A8bs6EOPGOMFpjZQHj6xCPwhNRqaaZTELGZpKip7SaQFFX8
X-Gm-Message-State: AOJu0YxSkOikCztrsB+plnv4vMTnUxrvmZiBMSEjebmp2YxycUw03SIJ
 +t3tYh3EaakGEHqZInvDp1nTqoaPE+3GdOB8N6y6X1gjsAQMQ0aUO6rTdQ==
X-Google-Smtp-Source: AGHT+IE0TpeyUFZklLy0TQOMft+1wtVcvGT5PmzBnivldD/l75kOdH2BMSy56sumPHip9kr4toTTZg==
X-Received: by 2002:a17:90b:3586:b0:2c7:b606:a3b5 with SMTP id
 98e67ed59e1d1-2c7b606a68bmr155342a91.39.1718728992909; 
 Tue, 18 Jun 2024 09:43:12 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c4fcac51c6sm6857063a91.30.2024.06.18.09.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 09:43:12 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 2/5] drm/msm/adreno: Split catalog into separate files
Date: Tue, 18 Jun 2024 09:42:48 -0700
Message-ID: <20240618164303.66615-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618164303.66615-1-robdclark@gmail.com>
References: <20240618164303.66615-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Rob Clark <robdclark@chromium.org>

Split each gen's gpu table into it's own file.  Only code-motion, no
functional change.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/Makefile               |   5 +
 drivers/gpu/drm/msm/adreno/a2xx_catalog.c  |  52 ++
 drivers/gpu/drm/msm/adreno/a3xx_catalog.c  |  81 +++
 drivers/gpu/drm/msm/adreno/a4xx_catalog.c  |  50 ++
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c  | 148 +++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c  | 338 +++++++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c | 625 +--------------------
 7 files changed, 680 insertions(+), 619 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/adreno/a2xx_catalog.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a3xx_catalog.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a4xx_catalog.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a5xx_catalog.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a6xx_catalog.c

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index eb788921ff4f..f5e2838c6a76 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -8,13 +8,18 @@ ccflags-$(CONFIG_DRM_MSM_DP) += -I $(src)/dp
 adreno-y := \
 	adreno/adreno_device.o \
 	adreno/adreno_gpu.o \
+	adreno/a2xx_catalog.o \
 	adreno/a2xx_gpu.o \
 	adreno/a2xx_gpummu.o \
+	adreno/a3xx_catalog.o \
 	adreno/a3xx_gpu.o \
+	adreno/a4xx_catalog.o \
 	adreno/a4xx_gpu.o \
+	adreno/a5xx_catalog.o \
 	adreno/a5xx_gpu.o \
 	adreno/a5xx_power.o \
 	adreno/a5xx_preempt.o \
+	adreno/a6xx_catalog.o \
 	adreno/a6xx_gpu.o \
 	adreno/a6xx_gmu.o \
 	adreno/a6xx_hfi.o \
diff --git a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
new file mode 100644
index 000000000000..9ddb7b31fd98
--- /dev/null
+++ b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013-2014 Red Hat
+ * Author: Rob Clark <robdclark@gmail.com>
+ *
+ * Copyright (c) 2014,2017 The Linux Foundation. All rights reserved.
+ */
+
+#include "adreno_gpu.h"
+
+static const struct adreno_info a2xx_gpus[] = {
+	{
+		.chip_ids = ADRENO_CHIP_IDS(0x02000000),
+		.family = ADRENO_2XX_GEN1,
+		.revn  = 200,
+		.fw = {
+			[ADRENO_FW_PM4] = "yamato_pm4.fw",
+			[ADRENO_FW_PFP] = "yamato_pfp.fw",
+		},
+		.gmem  = SZ_256K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init  = a2xx_gpu_init,
+	}, { /* a200 on i.mx51 has only 128kib gmem */
+		.chip_ids = ADRENO_CHIP_IDS(0x02000001),
+		.family = ADRENO_2XX_GEN1,
+		.revn  = 201,
+		.fw = {
+			[ADRENO_FW_PM4] = "yamato_pm4.fw",
+			[ADRENO_FW_PFP] = "yamato_pfp.fw",
+		},
+		.gmem  = SZ_128K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init  = a2xx_gpu_init,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x02020000),
+		.family = ADRENO_2XX_GEN2,
+		.revn  = 220,
+		.fw = {
+			[ADRENO_FW_PM4] = "leia_pm4_470.fw",
+			[ADRENO_FW_PFP] = "leia_pfp_470.fw",
+		},
+		.gmem  = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init  = a2xx_gpu_init,
+	}
+};
+DECLARE_ADRENO_GPULIST(a2xx);
+
+MODULE_FIRMWARE("qcom/leia_pfp_470.fw");
+MODULE_FIRMWARE("qcom/leia_pm4_470.fw");
+MODULE_FIRMWARE("qcom/yamato_pfp.fw");
+MODULE_FIRMWARE("qcom/yamato_pm4.fw");
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
new file mode 100644
index 000000000000..0de8465b6cf0
--- /dev/null
+++ b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013-2014 Red Hat
+ * Author: Rob Clark <robdclark@gmail.com>
+ *
+ * Copyright (c) 2014,2017 The Linux Foundation. All rights reserved.
+ */
+
+#include "adreno_gpu.h"
+
+static const struct adreno_info a3xx_gpus[] = {
+	{
+		.chip_ids = ADRENO_CHIP_IDS(0x03000512),
+		.family = ADRENO_3XX,
+		.fw = {
+			[ADRENO_FW_PM4] = "a330_pm4.fw",
+			[ADRENO_FW_PFP] = "a330_pfp.fw",
+		},
+		.gmem  = SZ_128K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init  = a3xx_gpu_init,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x03000520),
+		.family = ADRENO_3XX,
+		.revn  = 305,
+		.fw = {
+			[ADRENO_FW_PM4] = "a300_pm4.fw",
+			[ADRENO_FW_PFP] = "a300_pfp.fw",
+		},
+		.gmem  = SZ_256K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init  = a3xx_gpu_init,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x03000600),
+		.family = ADRENO_3XX,
+		.revn  = 307,        /* because a305c is revn==306 */
+		.fw = {
+			[ADRENO_FW_PM4] = "a300_pm4.fw",
+			[ADRENO_FW_PFP] = "a300_pfp.fw",
+		},
+		.gmem  = SZ_128K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init  = a3xx_gpu_init,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(
+			0x03020000,
+			0x03020001,
+			0x03020002
+		),
+		.family = ADRENO_3XX,
+		.revn  = 320,
+		.fw = {
+			[ADRENO_FW_PM4] = "a300_pm4.fw",
+			[ADRENO_FW_PFP] = "a300_pfp.fw",
+		},
+		.gmem  = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init  = a3xx_gpu_init,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(
+			0x03030000,
+			0x03030001,
+			0x03030002
+		),
+		.family = ADRENO_3XX,
+		.revn  = 330,
+		.fw = {
+			[ADRENO_FW_PM4] = "a330_pm4.fw",
+			[ADRENO_FW_PFP] = "a330_pfp.fw",
+		},
+		.gmem  = SZ_1M,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init  = a3xx_gpu_init,
+	}
+};
+DECLARE_ADRENO_GPULIST(a3xx);
+
+MODULE_FIRMWARE("qcom/a300_pm4.fw");
+MODULE_FIRMWARE("qcom/a300_pfp.fw");
+MODULE_FIRMWARE("qcom/a330_pm4.fw");
+MODULE_FIRMWARE("qcom/a330_pfp.fw");
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_catalog.c b/drivers/gpu/drm/msm/adreno/a4xx_catalog.c
new file mode 100644
index 000000000000..93519f807f87
--- /dev/null
+++ b/drivers/gpu/drm/msm/adreno/a4xx_catalog.c
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013-2014 Red Hat
+ * Author: Rob Clark <robdclark@gmail.com>
+ *
+ * Copyright (c) 2014,2017 The Linux Foundation. All rights reserved.
+ */
+
+#include "adreno_gpu.h"
+
+static const struct adreno_info a4xx_gpus[] = {
+	{
+		.chip_ids = ADRENO_CHIP_IDS(0x04000500),
+		.family = ADRENO_4XX,
+		.revn  = 405,
+		.fw = {
+			[ADRENO_FW_PM4] = "a420_pm4.fw",
+			[ADRENO_FW_PFP] = "a420_pfp.fw",
+		},
+		.gmem  = SZ_256K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init  = a4xx_gpu_init,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x04020000),
+		.family = ADRENO_4XX,
+		.revn  = 420,
+		.fw = {
+			[ADRENO_FW_PM4] = "a420_pm4.fw",
+			[ADRENO_FW_PFP] = "a420_pfp.fw",
+		},
+		.gmem  = (SZ_1M + SZ_512K),
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init  = a4xx_gpu_init,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x04030002),
+		.family = ADRENO_4XX,
+		.revn  = 430,
+		.fw = {
+			[ADRENO_FW_PM4] = "a420_pm4.fw",
+			[ADRENO_FW_PFP] = "a420_pfp.fw",
+		},
+		.gmem  = (SZ_1M + SZ_512K),
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init  = a4xx_gpu_init,
+	}
+};
+DECLARE_ADRENO_GPULIST(a4xx);
+
+MODULE_FIRMWARE("qcom/a420_pm4.fw");
+MODULE_FIRMWARE("qcom/a420_pfp.fw");
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_catalog.c b/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
new file mode 100644
index 000000000000..455a953dee67
--- /dev/null
+++ b/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013-2014 Red Hat
+ * Author: Rob Clark <robdclark@gmail.com>
+ *
+ * Copyright (c) 2014,2017 The Linux Foundation. All rights reserved.
+ */
+
+#include "adreno_gpu.h"
+
+static const struct adreno_info a5xx_gpus[] = {
+	{
+		.chip_ids = ADRENO_CHIP_IDS(0x05000600),
+		.family = ADRENO_5XX,
+		.revn = 506,
+		.fw = {
+			[ADRENO_FW_PM4] = "a530_pm4.fw",
+			[ADRENO_FW_PFP] = "a530_pfp.fw",
+		},
+		.gmem = (SZ_128K + SZ_8K),
+		/*
+		 * Increase inactive period to 250 to avoid bouncing
+		 * the GDSC which appears to make it grumpy
+		 */
+		.inactive_period = 250,
+		.quirks = ADRENO_QUIRK_TWO_PASS_USE_WFI |
+			  ADRENO_QUIRK_LMLOADKILL_DISABLE,
+		.init = a5xx_gpu_init,
+		.zapfw = "a506_zap.mdt",
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x05000800),
+		.family = ADRENO_5XX,
+		.revn = 508,
+		.fw = {
+			[ADRENO_FW_PM4] = "a530_pm4.fw",
+			[ADRENO_FW_PFP] = "a530_pfp.fw",
+		},
+		.gmem = (SZ_128K + SZ_8K),
+		/*
+		 * Increase inactive period to 250 to avoid bouncing
+		 * the GDSC which appears to make it grumpy
+		 */
+		.inactive_period = 250,
+		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
+		.init = a5xx_gpu_init,
+		.zapfw = "a508_zap.mdt",
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x05000900),
+		.family = ADRENO_5XX,
+		.revn = 509,
+		.fw = {
+			[ADRENO_FW_PM4] = "a530_pm4.fw",
+			[ADRENO_FW_PFP] = "a530_pfp.fw",
+		},
+		.gmem = (SZ_256K + SZ_16K),
+		/*
+		 * Increase inactive period to 250 to avoid bouncing
+		 * the GDSC which appears to make it grumpy
+		 */
+		.inactive_period = 250,
+		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
+		.init = a5xx_gpu_init,
+		/* Adreno 509 uses the same ZAP as 512 */
+		.zapfw = "a512_zap.mdt",
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x05010000),
+		.family = ADRENO_5XX,
+		.revn = 510,
+		.fw = {
+			[ADRENO_FW_PM4] = "a530_pm4.fw",
+			[ADRENO_FW_PFP] = "a530_pfp.fw",
+		},
+		.gmem = SZ_256K,
+		/*
+		 * Increase inactive period to 250 to avoid bouncing
+		 * the GDSC which appears to make it grumpy
+		 */
+		.inactive_period = 250,
+		.init = a5xx_gpu_init,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x05010200),
+		.family = ADRENO_5XX,
+		.revn = 512,
+		.fw = {
+			[ADRENO_FW_PM4] = "a530_pm4.fw",
+			[ADRENO_FW_PFP] = "a530_pfp.fw",
+		},
+		.gmem = (SZ_256K + SZ_16K),
+		/*
+		 * Increase inactive period to 250 to avoid bouncing
+		 * the GDSC which appears to make it grumpy
+		 */
+		.inactive_period = 250,
+		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
+		.init = a5xx_gpu_init,
+		.zapfw = "a512_zap.mdt",
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(
+			0x05030002,
+			0x05030004
+		),
+		.family = ADRENO_5XX,
+		.revn = 530,
+		.fw = {
+			[ADRENO_FW_PM4] = "a530_pm4.fw",
+			[ADRENO_FW_PFP] = "a530_pfp.fw",
+			[ADRENO_FW_GPMU] = "a530v3_gpmu.fw2",
+		},
+		.gmem = SZ_1M,
+		/*
+		 * Increase inactive period to 250 to avoid bouncing
+		 * the GDSC which appears to make it grumpy
+		 */
+		.inactive_period = 250,
+		.quirks = ADRENO_QUIRK_TWO_PASS_USE_WFI |
+			ADRENO_QUIRK_FAULT_DETECT_MASK,
+		.init = a5xx_gpu_init,
+		.zapfw = "a530_zap.mdt",
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x05040001),
+		.family = ADRENO_5XX,
+		.revn = 540,
+		.fw = {
+			[ADRENO_FW_PM4] = "a530_pm4.fw",
+			[ADRENO_FW_PFP] = "a530_pfp.fw",
+			[ADRENO_FW_GPMU] = "a540_gpmu.fw2",
+		},
+		.gmem = SZ_1M,
+		/*
+		 * Increase inactive period to 250 to avoid bouncing
+		 * the GDSC which appears to make it grumpy
+		 */
+		.inactive_period = 250,
+		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
+		.init = a5xx_gpu_init,
+		.zapfw = "a540_zap.mdt",
+	}
+};
+DECLARE_ADRENO_GPULIST(a5xx);
+
+MODULE_FIRMWARE("qcom/a530_pm4.fw");
+MODULE_FIRMWARE("qcom/a530_pfp.fw");
+MODULE_FIRMWARE("qcom/a530v3_gpmu.fw2");
+MODULE_FIRMWARE("qcom/a530_zap.mdt");
+MODULE_FIRMWARE("qcom/a530_zap.b00");
+MODULE_FIRMWARE("qcom/a530_zap.b01");
+MODULE_FIRMWARE("qcom/a530_zap.b02");
+MODULE_FIRMWARE("qcom/a540_gpmu.fw2");
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
new file mode 100644
index 000000000000..10a92eab0232
--- /dev/null
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -0,0 +1,338 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013-2014 Red Hat
+ * Author: Rob Clark <robdclark@gmail.com>
+ *
+ * Copyright (c) 2014,2017 The Linux Foundation. All rights reserved.
+ */
+
+#include "adreno_gpu.h"
+
+static const struct adreno_info a6xx_gpus[] = {
+	{
+		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
+		.family = ADRENO_6XX_GEN1,
+		.revn = 610,
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+		},
+		.gmem = (SZ_128K + SZ_4K),
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a6xx_gpu_init,
+		.zapfw = "a610_zap.mdt",
+		.hwcg = a612_hwcg,
+		/*
+		 * There are (at least) three SoCs implementing A610: SM6125
+		 * (trinket), SM6115 (bengal) and SM6225 (khaje). Trinket does
+		 * not have speedbinning, as only a single SKU exists and we
+		 * don't support khaje upstream yet.  Hence, this matching
+		 * table is only valid for bengal.
+		 */
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 206, 1 },
+			{ 200, 2 },
+			{ 157, 3 },
+			{ 127, 4 },
+		),
+	}, {
+		.machine = "qcom,sm7150",
+		.chip_ids = ADRENO_CHIP_IDS(0x06010800),
+		.family = ADRENO_6XX_GEN1,
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+			[ADRENO_FW_GMU] = "a630_gmu.bin",
+		},
+		.gmem = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
+		.init = a6xx_gpu_init,
+		.zapfw = "a615_zap.mbn",
+		.hwcg = a615_hwcg,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 128, 1 },
+			{ 146, 2 },
+			{ 167, 3 },
+			{ 172, 4 },
+		),
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x06010800),
+		.family = ADRENO_6XX_GEN1,
+		.revn = 618,
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+			[ADRENO_FW_GMU] = "a630_gmu.bin",
+		},
+		.gmem = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
+		.init = a6xx_gpu_init,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 169, 1 },
+			{ 174, 2 },
+		),
+	}, {
+		.machine = "qcom,sm4350",
+		.chip_ids = ADRENO_CHIP_IDS(0x06010900),
+		.family = ADRENO_6XX_GEN1,
+		.revn = 619,
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+			[ADRENO_FW_GMU] = "a619_gmu.bin",
+		},
+		.gmem = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a6xx_gpu_init,
+		.zapfw = "a615_zap.mdt",
+		.hwcg = a615_hwcg,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 138, 1 },
+			{ 92,  2 },
+		),
+	}, {
+		.machine = "qcom,sm6375",
+		.chip_ids = ADRENO_CHIP_IDS(0x06010901),
+		.family = ADRENO_6XX_GEN1,
+		.revn = 619,
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+			[ADRENO_FW_GMU] = "a619_gmu.bin",
+		},
+		.gmem = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a6xx_gpu_init,
+		.zapfw = "a615_zap.mdt",
+		.hwcg = a615_hwcg,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 190, 1 },
+			{ 177, 2 },
+		),
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x06010900),
+		.family = ADRENO_6XX_GEN1,
+		.revn = 619,
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+			[ADRENO_FW_GMU] = "a619_gmu.bin",
+		},
+		.gmem = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
+		.init = a6xx_gpu_init,
+		.zapfw = "a615_zap.mdt",
+		.hwcg = a615_hwcg,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 120, 4 },
+			{ 138, 3 },
+			{ 169, 2 },
+			{ 180, 1 },
+		),
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(
+			0x06030001,
+			0x06030002
+		),
+		.family = ADRENO_6XX_GEN1,
+		.revn = 630,
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+			[ADRENO_FW_GMU] = "a630_gmu.bin",
+		},
+		.gmem = SZ_1M,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
+		.init = a6xx_gpu_init,
+		.zapfw = "a630_zap.mdt",
+		.hwcg = a630_hwcg,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x06040001),
+		.family = ADRENO_6XX_GEN2,
+		.revn = 640,
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+			[ADRENO_FW_GMU] = "a640_gmu.bin",
+		},
+		.gmem = SZ_1M,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
+		.init = a6xx_gpu_init,
+		.zapfw = "a640_zap.mdt",
+		.hwcg = a640_hwcg,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0, 0 },
+			{ 1, 1 },
+		),
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x06050002),
+		.family = ADRENO_6XX_GEN3,
+		.revn = 650,
+		.fw = {
+			[ADRENO_FW_SQE] = "a650_sqe.fw",
+			[ADRENO_FW_GMU] = "a650_gmu.bin",
+		},
+		.gmem = SZ_1M + SZ_128K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			ADRENO_QUIRK_HAS_HW_APRIV,
+		.init = a6xx_gpu_init,
+		.zapfw = "a650_zap.mdt",
+		.hwcg = a650_hwcg,
+		.address_space_size = SZ_16G,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0, 0 },
+			{ 1, 1 },
+			{ 2, 3 }, /* Yep, 2 and 3 are swapped! :/ */
+			{ 3, 2 },
+		),
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x06060001),
+		.family = ADRENO_6XX_GEN4,
+		.revn = 660,
+		.fw = {
+			[ADRENO_FW_SQE] = "a660_sqe.fw",
+			[ADRENO_FW_GMU] = "a660_gmu.bin",
+		},
+		.gmem = SZ_1M + SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			ADRENO_QUIRK_HAS_HW_APRIV,
+		.init = a6xx_gpu_init,
+		.zapfw = "a660_zap.mdt",
+		.hwcg = a660_hwcg,
+		.address_space_size = SZ_16G,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x06030500),
+		.family = ADRENO_6XX_GEN4,
+		.fw = {
+			[ADRENO_FW_SQE] = "a660_sqe.fw",
+			[ADRENO_FW_GMU] = "a660_gmu.bin",
+		},
+		.gmem = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			ADRENO_QUIRK_HAS_HW_APRIV,
+		.init = a6xx_gpu_init,
+		.zapfw = "a660_zap.mbn",
+		.hwcg = a660_hwcg,
+		.address_space_size = SZ_16G,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 117, 0 },
+			{ 172, 2 }, /* Called speedbin 1 downstream, but let's not break things! */
+			{ 190, 1 },
+		),
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x06080001),
+		.family = ADRENO_6XX_GEN2,
+		.revn = 680,
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+			[ADRENO_FW_GMU] = "a640_gmu.bin",
+		},
+		.gmem = SZ_2M,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
+		.init = a6xx_gpu_init,
+		.zapfw = "a640_zap.mdt",
+		.hwcg = a640_hwcg,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x06090000),
+		.family = ADRENO_6XX_GEN4,
+		.fw = {
+			[ADRENO_FW_SQE] = "a660_sqe.fw",
+			[ADRENO_FW_GMU] = "a660_gmu.bin",
+		},
+		.gmem = SZ_4M,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			ADRENO_QUIRK_HAS_HW_APRIV,
+		.init = a6xx_gpu_init,
+		.zapfw = "a690_zap.mdt",
+		.hwcg = a690_hwcg,
+		.address_space_size = SZ_16G,
+	}
+};
+DECLARE_ADRENO_GPULIST(a6xx);
+
+MODULE_FIRMWARE("qcom/a615_zap.mbn");
+MODULE_FIRMWARE("qcom/a619_gmu.bin");
+MODULE_FIRMWARE("qcom/a630_sqe.fw");
+MODULE_FIRMWARE("qcom/a630_gmu.bin");
+MODULE_FIRMWARE("qcom/a630_zap.mbn");
+MODULE_FIRMWARE("qcom/a640_gmu.bin");
+MODULE_FIRMWARE("qcom/a650_gmu.bin");
+MODULE_FIRMWARE("qcom/a650_sqe.fw");
+MODULE_FIRMWARE("qcom/a660_gmu.bin");
+MODULE_FIRMWARE("qcom/a660_sqe.fw");
+
+static const struct adreno_info a7xx_gpus[] = {
+	{
+		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
+		.family = ADRENO_6XX_GEN1, /* NOT a mistake! */
+		.fw = {
+			[ADRENO_FW_SQE] = "a702_sqe.fw",
+		},
+		.gmem = SZ_128K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
+		.init = a6xx_gpu_init,
+		.zapfw = "a702_zap.mbn",
+		.hwcg = a702_hwcg,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 236, 1 },
+			{ 178, 2 },
+			{ 142, 3 },
+		),
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x07030001),
+		.family = ADRENO_7XX_GEN1,
+		.fw = {
+			[ADRENO_FW_SQE] = "a730_sqe.fw",
+			[ADRENO_FW_GMU] = "gmu_gen70000.bin",
+		},
+		.gmem = SZ_2M,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV,
+		.init = a6xx_gpu_init,
+		.zapfw = "a730_zap.mdt",
+		.hwcg = a730_hwcg,
+		.address_space_size = SZ_16G,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x43050a01), /* "C510v2" */
+		.family = ADRENO_7XX_GEN2,
+		.fw = {
+			[ADRENO_FW_SQE] = "a740_sqe.fw",
+			[ADRENO_FW_GMU] = "gmu_gen70200.bin",
+		},
+		.gmem = 3 * SZ_1M,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV,
+		.init = a6xx_gpu_init,
+		.zapfw = "a740_zap.mdt",
+		.hwcg = a740_hwcg,
+		.address_space_size = SZ_16G,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
+		.family = ADRENO_7XX_GEN3,
+		.fw = {
+			[ADRENO_FW_SQE] = "gen70900_sqe.fw",
+			[ADRENO_FW_GMU] = "gmu_gen70900.bin",
+		},
+		.gmem = 3 * SZ_1M,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV,
+		.init = a6xx_gpu_init,
+		.zapfw = "gen70900_zap.mbn",
+		.address_space_size = SZ_16G,
+	}
+};
+DECLARE_ADRENO_GPULIST(a7xx);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index a57659eaddc2..1e789ff6945e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -20,596 +20,12 @@ bool allow_vram_carveout = false;
 MODULE_PARM_DESC(allow_vram_carveout, "Allow using VRAM Carveout, in place of IOMMU");
 module_param_named(allow_vram_carveout, allow_vram_carveout, bool, 0600);
 
-static const struct adreno_info a2xx_gpus[] = {
-	{
-		.chip_ids = ADRENO_CHIP_IDS(0x02000000),
-		.family = ADRENO_2XX_GEN1,
-		.revn  = 200,
-		.fw = {
-			[ADRENO_FW_PM4] = "yamato_pm4.fw",
-			[ADRENO_FW_PFP] = "yamato_pfp.fw",
-		},
-		.gmem  = SZ_256K,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a2xx_gpu_init,
-	}, { /* a200 on i.mx51 has only 128kib gmem */
-		.chip_ids = ADRENO_CHIP_IDS(0x02000001),
-		.family = ADRENO_2XX_GEN1,
-		.revn  = 201,
-		.fw = {
-			[ADRENO_FW_PM4] = "yamato_pm4.fw",
-			[ADRENO_FW_PFP] = "yamato_pfp.fw",
-		},
-		.gmem  = SZ_128K,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a2xx_gpu_init,
-	}, {
-		.chip_ids = ADRENO_CHIP_IDS(0x02020000),
-		.family = ADRENO_2XX_GEN2,
-		.revn  = 220,
-		.fw = {
-			[ADRENO_FW_PM4] = "leia_pm4_470.fw",
-			[ADRENO_FW_PFP] = "leia_pfp_470.fw",
-		},
-		.gmem  = SZ_512K,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a2xx_gpu_init,
-	}
-};
-DECLARE_ADRENO_GPULIST(a2xx);
-
-static const struct adreno_info a3xx_gpus[] = {
-	{
-		.chip_ids = ADRENO_CHIP_IDS(0x03000512),
-		.family = ADRENO_3XX,
-		.fw = {
-			[ADRENO_FW_PM4] = "a330_pm4.fw",
-			[ADRENO_FW_PFP] = "a330_pfp.fw",
-		},
-		.gmem  = SZ_128K,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a3xx_gpu_init,
-	}, {
-		.chip_ids = ADRENO_CHIP_IDS(0x03000520),
-		.family = ADRENO_3XX,
-		.revn  = 305,
-		.fw = {
-			[ADRENO_FW_PM4] = "a300_pm4.fw",
-			[ADRENO_FW_PFP] = "a300_pfp.fw",
-		},
-		.gmem  = SZ_256K,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a3xx_gpu_init,
-	}, {
-		.chip_ids = ADRENO_CHIP_IDS(0x03000600),
-		.family = ADRENO_3XX,
-		.revn  = 307,        /* because a305c is revn==306 */
-		.fw = {
-			[ADRENO_FW_PM4] = "a300_pm4.fw",
-			[ADRENO_FW_PFP] = "a300_pfp.fw",
-		},
-		.gmem  = SZ_128K,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a3xx_gpu_init,
-	}, {
-		.chip_ids = ADRENO_CHIP_IDS(
-			0x03020000,
-			0x03020001,
-			0x03020002
-		),
-		.family = ADRENO_3XX,
-		.revn  = 320,
-		.fw = {
-			[ADRENO_FW_PM4] = "a300_pm4.fw",
-			[ADRENO_FW_PFP] = "a300_pfp.fw",
-		},
-		.gmem  = SZ_512K,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a3xx_gpu_init,
-	}, {
-		.chip_ids = ADRENO_CHIP_IDS(
-			0x03030000,
-			0x03030001,
-			0x03030002
-		),
-		.family = ADRENO_3XX,
-		.revn  = 330,
-		.fw = {
-			[ADRENO_FW_PM4] = "a330_pm4.fw",
-			[ADRENO_FW_PFP] = "a330_pfp.fw",
-		},
-		.gmem  = SZ_1M,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a3xx_gpu_init,
-	}
-};
-DECLARE_ADRENO_GPULIST(a3xx);
-
-static const struct adreno_info a4xx_gpus[] = {
-	{
-		.chip_ids = ADRENO_CHIP_IDS(0x04000500),
-		.family = ADRENO_4XX,
-		.revn  = 405,
-		.fw = {
-			[ADRENO_FW_PM4] = "a420_pm4.fw",
-			[ADRENO_FW_PFP] = "a420_pfp.fw",
-		},
-		.gmem  = SZ_256K,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a4xx_gpu_init,
-	}, {
-		.chip_ids = ADRENO_CHIP_IDS(0x04020000),
-		.family = ADRENO_4XX,
-		.revn  = 420,
-		.fw = {
-			[ADRENO_FW_PM4] = "a420_pm4.fw",
-			[ADRENO_FW_PFP] = "a420_pfp.fw",
-		},
-		.gmem  = (SZ_1M + SZ_512K),
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a4xx_gpu_init,
-	}, {
-		.chip_ids = ADRENO_CHIP_IDS(0x04030002),
-		.family = ADRENO_4XX,
-		.revn  = 430,
-		.fw = {
-			[ADRENO_FW_PM4] = "a420_pm4.fw",
-			[ADRENO_FW_PFP] = "a420_pfp.fw",
-		},
-		.gmem  = (SZ_1M + SZ_512K),
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a4xx_gpu_init,
-	}
-};
-DECLARE_ADRENO_GPULIST(a4xx);
-
-static const struct adreno_info a5xx_gpus[] = {
-	{
-		.chip_ids = ADRENO_CHIP_IDS(0x05000600),
-		.family = ADRENO_5XX,
-		.revn = 506,
-		.fw = {
-			[ADRENO_FW_PM4] = "a530_pm4.fw",
-			[ADRENO_FW_PFP] = "a530_pfp.fw",
-		},
-		.gmem = (SZ_128K + SZ_8K),
-		/*
-		 * Increase inactive period to 250 to avoid bouncing
-		 * the GDSC which appears to make it grumpy
-		 */
-		.inactive_period = 250,
-		.quirks = ADRENO_QUIRK_TWO_PASS_USE_WFI |
-			  ADRENO_QUIRK_LMLOADKILL_DISABLE,
-		.init = a5xx_gpu_init,
-		.zapfw = "a506_zap.mdt",
-	}, {
-		.chip_ids = ADRENO_CHIP_IDS(0x05000800),
-		.family = ADRENO_5XX,
-		.revn = 508,
-		.fw = {
-			[ADRENO_FW_PM4] = "a530_pm4.fw",
-			[ADRENO_FW_PFP] = "a530_pfp.fw",
-		},
-		.gmem = (SZ_128K + SZ_8K),
-		/*
-		 * Increase inactive period to 250 to avoid bouncing
-		 * the GDSC which appears to make it grumpy
-		 */
-		.inactive_period = 250,
-		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
-		.init = a5xx_gpu_init,
-		.zapfw = "a508_zap.mdt",
-	}, {
-		.chip_ids = ADRENO_CHIP_IDS(0x05000900),
-		.family = ADRENO_5XX,
-		.revn = 509,
-		.fw = {
-			[ADRENO_FW_PM4] = "a530_pm4.fw",
-			[ADRENO_FW_PFP] = "a530_pfp.fw",
-		},
-		.gmem = (SZ_256K + SZ_16K),
-		/*
-		 * Increase inactive period to 250 to avoid bouncing
-		 * the GDSC which appears to make it grumpy
-		 */
-		.inactive_period = 250,
-		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
-		.init = a5xx_gpu_init,
-		/* Adreno 509 uses the same ZAP as 512 */
-		.zapfw = "a512_zap.mdt",
-	}, {
-		.chip_ids = ADRENO_CHIP_IDS(0x05010000),
-		.family = ADRENO_5XX,
-		.revn = 510,
-		.fw = {
-			[ADRENO_FW_PM4] = "a530_pm4.fw",
-			[ADRENO_FW_PFP] = "a530_pfp.fw",
-		},
-		.gmem = SZ_256K,
-		/*
-		 * Increase inactive period to 250 to avoid bouncing
-		 * the GDSC which appears to make it grumpy
-		 */
-		.inactive_period = 250,
-		.init = a5xx_gpu_init,
-	}, {
-		.chip_ids = ADRENO_CHIP_IDS(0x05010200),
-		.family = ADRENO_5XX,
-		.revn = 512,
-		.fw = {
-			[ADRENO_FW_PM4] = "a530_pm4.fw",
-			[ADRENO_FW_PFP] = "a530_pfp.fw",
-		},
-		.gmem = (SZ_256K + SZ_16K),
-		/*
-		 * Increase inactive period to 250 to avoid bouncing
-		 * the GDSC which appears to make it grumpy
-		 */
-		.inactive_period = 250,
-		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
-		.init = a5xx_gpu_init,
-		.zapfw = "a512_zap.mdt",
-	}, {
-		.chip_ids = ADRENO_CHIP_IDS(
-			0x05030002,
-			0x05030004
-		),
-		.family = ADRENO_5XX,
-		.revn = 530,
-		.fw = {
-			[ADRENO_FW_PM4] = "a530_pm4.fw",
-			[ADRENO_FW_PFP] = "a530_pfp.fw",
-			[ADRENO_FW_GPMU] = "a530v3_gpmu.fw2",
-		},
-		.gmem = SZ_1M,
-		/*
-		 * Increase inactive period to 250 to avoid bouncing
-		 * the GDSC which appears to make it grumpy
-		 */
-		.inactive_period = 250,
-		.quirks = ADRENO_QUIRK_TWO_PASS_USE_WFI |
-			ADRENO_QUIRK_FAULT_DETECT_MASK,
-		.init = a5xx_gpu_init,
-		.zapfw = "a530_zap.mdt",
-	}, {
-		.chip_ids = ADRENO_CHIP_IDS(0x05040001),
-		.family = ADRENO_5XX,
-		.revn = 540,
-		.fw = {
-			[ADRENO_FW_PM4] = "a530_pm4.fw",
-			[ADRENO_FW_PFP] = "a530_pfp.fw",
-			[ADRENO_FW_GPMU] = "a540_gpmu.fw2",
-		},
-		.gmem = SZ_1M,
-		/*
-		 * Increase inactive period to 250 to avoid bouncing
-		 * the GDSC which appears to make it grumpy
-		 */
-		.inactive_period = 250,
-		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
-		.init = a5xx_gpu_init,
-		.zapfw = "a540_zap.mdt",
-	}
-};
-DECLARE_ADRENO_GPULIST(a5xx);
-
-static const struct adreno_info a6xx_gpus[] = {
-	{
-		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
-		.family = ADRENO_6XX_GEN1,
-		.revn = 610,
-		.fw = {
-			[ADRENO_FW_SQE] = "a630_sqe.fw",
-		},
-		.gmem = (SZ_128K + SZ_4K),
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init = a6xx_gpu_init,
-		.zapfw = "a610_zap.mdt",
-		.hwcg = a612_hwcg,
-		/*
-		 * There are (at least) three SoCs implementing A610: SM6125
-		 * (trinket), SM6115 (bengal) and SM6225 (khaje). Trinket does
-		 * not have speedbinning, as only a single SKU exists and we
-		 * don't support khaje upstream yet.  Hence, this matching
-		 * table is only valid for bengal.
-		 */
-		.speedbins = ADRENO_SPEEDBINS(
-			{ 0,   0 },
-			{ 206, 1 },
-			{ 200, 2 },
-			{ 157, 3 },
-			{ 127, 4 },
-		),
-	}, {
-		.machine = "qcom,sm7150",
-		.chip_ids = ADRENO_CHIP_IDS(0x06010800),
-		.family = ADRENO_6XX_GEN1,
-		.fw = {
-			[ADRENO_FW_SQE] = "a630_sqe.fw",
-			[ADRENO_FW_GMU] = "a630_gmu.bin",
-		},
-		.gmem = SZ_512K,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
-		.init = a6xx_gpu_init,
-		.zapfw = "a615_zap.mbn",
-		.hwcg = a615_hwcg,
-		.speedbins = ADRENO_SPEEDBINS(
-			{ 0,   0 },
-			{ 128, 1 },
-			{ 146, 2 },
-			{ 167, 3 },
-			{ 172, 4 },
-		),
-	}, {
-		.chip_ids = ADRENO_CHIP_IDS(0x06010800),
-		.family = ADRENO_6XX_GEN1,
-		.revn = 618,
-		.fw = {
-			[ADRENO_FW_SQE] = "a630_sqe.fw",
-			[ADRENO_FW_GMU] = "a630_gmu.bin",
-		},
-		.gmem = SZ_512K,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
-		.init = a6xx_gpu_init,
-		.speedbins = ADRENO_SPEEDBINS(
-			{ 0,   0 },
-			{ 169, 1 },
-			{ 174, 2 },
-		),
-	}, {
-		.machine = "qcom,sm4350",
-		.chip_ids = ADRENO_CHIP_IDS(0x06010900),
-		.family = ADRENO_6XX_GEN1,
-		.revn = 619,
-		.fw = {
-			[ADRENO_FW_SQE] = "a630_sqe.fw",
-			[ADRENO_FW_GMU] = "a619_gmu.bin",
-		},
-		.gmem = SZ_512K,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init = a6xx_gpu_init,
-		.zapfw = "a615_zap.mdt",
-		.hwcg = a615_hwcg,
-		.speedbins = ADRENO_SPEEDBINS(
-			{ 0,   0 },
-			{ 138, 1 },
-			{ 92,  2 },
-		),
-	}, {
-		.machine = "qcom,sm6375",
-		.chip_ids = ADRENO_CHIP_IDS(0x06010901),
-		.family = ADRENO_6XX_GEN1,
-		.revn = 619,
-		.fw = {
-			[ADRENO_FW_SQE] = "a630_sqe.fw",
-			[ADRENO_FW_GMU] = "a619_gmu.bin",
-		},
-		.gmem = SZ_512K,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init = a6xx_gpu_init,
-		.zapfw = "a615_zap.mdt",
-		.hwcg = a615_hwcg,
-		.speedbins = ADRENO_SPEEDBINS(
-			{ 0,   0 },
-			{ 190, 1 },
-			{ 177, 2 },
-		),
-	}, {
-		.chip_ids = ADRENO_CHIP_IDS(0x06010900),
-		.family = ADRENO_6XX_GEN1,
-		.revn = 619,
-		.fw = {
-			[ADRENO_FW_SQE] = "a630_sqe.fw",
-			[ADRENO_FW_GMU] = "a619_gmu.bin",
-		},
-		.gmem = SZ_512K,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
-		.init = a6xx_gpu_init,
-		.zapfw = "a615_zap.mdt",
-		.hwcg = a615_hwcg,
-		.speedbins = ADRENO_SPEEDBINS(
-			{ 0,   0 },
-			{ 120, 4 },
-			{ 138, 3 },
-			{ 169, 2 },
-			{ 180, 1 },
-		),
-	}, {
-		.chip_ids = ADRENO_CHIP_IDS(
-			0x06030001,
-			0x06030002
-		),
-		.family = ADRENO_6XX_GEN1,
-		.revn = 630,
-		.fw = {
-			[ADRENO_FW_SQE] = "a630_sqe.fw",
-			[ADRENO_FW_GMU] = "a630_gmu.bin",
-		},
-		.gmem = SZ_1M,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
-		.init = a6xx_gpu_init,
-		.zapfw = "a630_zap.mdt",
-		.hwcg = a630_hwcg,
-	}, {
-		.chip_ids = ADRENO_CHIP_IDS(0x06040001),
-		.family = ADRENO_6XX_GEN2,
-		.revn = 640,
-		.fw = {
-			[ADRENO_FW_SQE] = "a630_sqe.fw",
-			[ADRENO_FW_GMU] = "a640_gmu.bin",
-		},
-		.gmem = SZ_1M,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
-		.init = a6xx_gpu_init,
-		.zapfw = "a640_zap.mdt",
-		.hwcg = a640_hwcg,
-		.speedbins = ADRENO_SPEEDBINS(
-			{ 0, 0 },
-			{ 1, 1 },
-		),
-	}, {
-		.chip_ids = ADRENO_CHIP_IDS(0x06050002),
-		.family = ADRENO_6XX_GEN3,
-		.revn = 650,
-		.fw = {
-			[ADRENO_FW_SQE] = "a650_sqe.fw",
-			[ADRENO_FW_GMU] = "a650_gmu.bin",
-		},
-		.gmem = SZ_1M + SZ_128K,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			ADRENO_QUIRK_HAS_HW_APRIV,
-		.init = a6xx_gpu_init,
-		.zapfw = "a650_zap.mdt",
-		.hwcg = a650_hwcg,
-		.address_space_size = SZ_16G,
-		.speedbins = ADRENO_SPEEDBINS(
-			{ 0, 0 },
-			{ 1, 1 },
-			{ 2, 3 }, /* Yep, 2 and 3 are swapped! :/ */
-			{ 3, 2 },
-		),
-	}, {
-		.chip_ids = ADRENO_CHIP_IDS(0x06060001),
-		.family = ADRENO_6XX_GEN4,
-		.revn = 660,
-		.fw = {
-			[ADRENO_FW_SQE] = "a660_sqe.fw",
-			[ADRENO_FW_GMU] = "a660_gmu.bin",
-		},
-		.gmem = SZ_1M + SZ_512K,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			ADRENO_QUIRK_HAS_HW_APRIV,
-		.init = a6xx_gpu_init,
-		.zapfw = "a660_zap.mdt",
-		.hwcg = a660_hwcg,
-		.address_space_size = SZ_16G,
-	}, {
-		.chip_ids = ADRENO_CHIP_IDS(0x06030500),
-		.family = ADRENO_6XX_GEN4,
-		.fw = {
-			[ADRENO_FW_SQE] = "a660_sqe.fw",
-			[ADRENO_FW_GMU] = "a660_gmu.bin",
-		},
-		.gmem = SZ_512K,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			ADRENO_QUIRK_HAS_HW_APRIV,
-		.init = a6xx_gpu_init,
-		.zapfw = "a660_zap.mbn",
-		.hwcg = a660_hwcg,
-		.address_space_size = SZ_16G,
-		.speedbins = ADRENO_SPEEDBINS(
-			{ 0,   0 },
-			{ 117, 0 },
-			{ 172, 2 }, /* Called speedbin 1 downstream, but let's not break things! */
-			{ 190, 1 },
-		),
-	}, {
-		.chip_ids = ADRENO_CHIP_IDS(0x06080001),
-		.family = ADRENO_6XX_GEN2,
-		.revn = 680,
-		.fw = {
-			[ADRENO_FW_SQE] = "a630_sqe.fw",
-			[ADRENO_FW_GMU] = "a640_gmu.bin",
-		},
-		.gmem = SZ_2M,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
-		.init = a6xx_gpu_init,
-		.zapfw = "a640_zap.mdt",
-		.hwcg = a640_hwcg,
-	}, {
-		.chip_ids = ADRENO_CHIP_IDS(0x06090000),
-		.family = ADRENO_6XX_GEN4,
-		.fw = {
-			[ADRENO_FW_SQE] = "a660_sqe.fw",
-			[ADRENO_FW_GMU] = "a660_gmu.bin",
-		},
-		.gmem = SZ_4M,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			ADRENO_QUIRK_HAS_HW_APRIV,
-		.init = a6xx_gpu_init,
-		.zapfw = "a690_zap.mdt",
-		.hwcg = a690_hwcg,
-		.address_space_size = SZ_16G,
-	}
-};
-DECLARE_ADRENO_GPULIST(a6xx);
-
-static const struct adreno_info a7xx_gpus[] = {
-	{
-		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
-		.family = ADRENO_6XX_GEN1, /* NOT a mistake! */
-		.fw = {
-			[ADRENO_FW_SQE] = "a702_sqe.fw",
-		},
-		.gmem = SZ_128K,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
-		.init = a6xx_gpu_init,
-		.zapfw = "a702_zap.mbn",
-		.hwcg = a702_hwcg,
-		.speedbins = ADRENO_SPEEDBINS(
-			{ 0,   0 },
-			{ 236, 1 },
-			{ 178, 2 },
-			{ 142, 3 },
-		),
-	}, {
-		.chip_ids = ADRENO_CHIP_IDS(0x07030001),
-		.family = ADRENO_7XX_GEN1,
-		.fw = {
-			[ADRENO_FW_SQE] = "a730_sqe.fw",
-			[ADRENO_FW_GMU] = "gmu_gen70000.bin",
-		},
-		.gmem = SZ_2M,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			  ADRENO_QUIRK_HAS_HW_APRIV,
-		.init = a6xx_gpu_init,
-		.zapfw = "a730_zap.mdt",
-		.hwcg = a730_hwcg,
-		.address_space_size = SZ_16G,
-	}, {
-		.chip_ids = ADRENO_CHIP_IDS(0x43050a01), /* "C510v2" */
-		.family = ADRENO_7XX_GEN2,
-		.fw = {
-			[ADRENO_FW_SQE] = "a740_sqe.fw",
-			[ADRENO_FW_GMU] = "gmu_gen70200.bin",
-		},
-		.gmem = 3 * SZ_1M,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			  ADRENO_QUIRK_HAS_HW_APRIV,
-		.init = a6xx_gpu_init,
-		.zapfw = "a740_zap.mdt",
-		.hwcg = a740_hwcg,
-		.address_space_size = SZ_16G,
-	}, {
-		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
-		.family = ADRENO_7XX_GEN3,
-		.fw = {
-			[ADRENO_FW_SQE] = "gen70900_sqe.fw",
-			[ADRENO_FW_GMU] = "gmu_gen70900.bin",
-		},
-		.gmem = 3 * SZ_1M,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			  ADRENO_QUIRK_HAS_HW_APRIV,
-		.init = a6xx_gpu_init,
-		.zapfw = "gen70900_zap.mbn",
-		.address_space_size = SZ_16G,
-	}
-};
-DECLARE_ADRENO_GPULIST(a7xx);
+extern const struct adreno_gpulist a2xx_gpulist;
+extern const struct adreno_gpulist a3xx_gpulist;
+extern const struct adreno_gpulist a4xx_gpulist;
+extern const struct adreno_gpulist a5xx_gpulist;
+extern const struct adreno_gpulist a6xx_gpulist;
+extern const struct adreno_gpulist a7xx_gpulist;
 
 static const struct adreno_gpulist *gpulists[] = {
 	&a2xx_gpulist,
@@ -620,35 +36,6 @@ static const struct adreno_gpulist *gpulists[] = {
 	&a6xx_gpulist,
 };
 
-MODULE_FIRMWARE("qcom/a300_pm4.fw");
-MODULE_FIRMWARE("qcom/a300_pfp.fw");
-MODULE_FIRMWARE("qcom/a330_pm4.fw");
-MODULE_FIRMWARE("qcom/a330_pfp.fw");
-MODULE_FIRMWARE("qcom/a420_pm4.fw");
-MODULE_FIRMWARE("qcom/a420_pfp.fw");
-MODULE_FIRMWARE("qcom/a530_pm4.fw");
-MODULE_FIRMWARE("qcom/a530_pfp.fw");
-MODULE_FIRMWARE("qcom/a530v3_gpmu.fw2");
-MODULE_FIRMWARE("qcom/a530_zap.mdt");
-MODULE_FIRMWARE("qcom/a530_zap.b00");
-MODULE_FIRMWARE("qcom/a530_zap.b01");
-MODULE_FIRMWARE("qcom/a530_zap.b02");
-MODULE_FIRMWARE("qcom/a540_gpmu.fw2");
-MODULE_FIRMWARE("qcom/a615_zap.mbn");
-MODULE_FIRMWARE("qcom/a619_gmu.bin");
-MODULE_FIRMWARE("qcom/a630_sqe.fw");
-MODULE_FIRMWARE("qcom/a630_gmu.bin");
-MODULE_FIRMWARE("qcom/a630_zap.mbn");
-MODULE_FIRMWARE("qcom/a640_gmu.bin");
-MODULE_FIRMWARE("qcom/a650_gmu.bin");
-MODULE_FIRMWARE("qcom/a650_sqe.fw");
-MODULE_FIRMWARE("qcom/a660_gmu.bin");
-MODULE_FIRMWARE("qcom/a660_sqe.fw");
-MODULE_FIRMWARE("qcom/leia_pfp_470.fw");
-MODULE_FIRMWARE("qcom/leia_pm4_470.fw");
-MODULE_FIRMWARE("qcom/yamato_pfp.fw");
-MODULE_FIRMWARE("qcom/yamato_pm4.fw");
-
 static const struct adreno_info *adreno_info(uint32_t chip_id)
 {
 	/* identify gpu: */
-- 
2.45.2

