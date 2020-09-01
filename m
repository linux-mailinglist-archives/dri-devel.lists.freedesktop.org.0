Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C91259A00
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 18:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A1C6E899;
	Tue,  1 Sep 2020 16:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A210F6E899
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 16:46:25 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id k13so799362plk.13
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 09:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tk5zPp0nu93VQrlRpBetxr1lff5xE8i/LH2EjPSUXEI=;
 b=jfADtGc2ZPCjhynKOdCJEaVZwckWuNnvv0bA+wk9rmOjtBW3xWIDyC6ePwcx4A24/i
 6vn81mR2qNa14TEuW0kfe6glsktawQ1wOLEdACNI/tLpDGFwh8en3sZP3gJeIno6a7eD
 qo1y7fY8cSKmdS6eK9Tx9pEZ8LYZC9hNnmqMblP6vQt1ZGGTmAY6qFVHOUDQMcUU/YRh
 X+51rpiAjLJN8TJZhjJGGWh1gSTKuI8vvMP8H0bWvCzGUfPZdLvlZz+aiNDVyKTkBYTX
 9lm/yEsLeSlOO+JoGVjnYwbwZutIZjR0i2wrCnjW/xo/Ipu7ChHwMkU8FaYvLbHqQYsI
 k0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tk5zPp0nu93VQrlRpBetxr1lff5xE8i/LH2EjPSUXEI=;
 b=a8kuBKVKDv2X9VwkkvqJYcUsC6GQdcQwYb8KPedfWrPQ71sDdc3wQLvBymsckL0bZ1
 3o99kz+rnluCIVtSD9vo6eGVzQ48fnGykeuTOICbLC7xPLj90XNNowFZ5ENiTisOameH
 Mn1fGLT/HxYY0y1Q51Xc0EZ29fhn1bBFjGikgvqLp3NMCKCpRO3bwb5LaB8/lda1Y8W9
 qPdoCb7zsjL8fJS0rkV6Y7OdqSvs/2B8dHWSs4IxyTJoOXoqtIzmLdoGckAKWGJZyspn
 ngmeNt/Hw/5+G31atIijBkPXG5ltk45Bk+F8uqrneNTEMc7xf/vGOxWlF/pR2RkmidW2
 NixQ==
X-Gm-Message-State: AOAM533EuYaYPK7FFZmj3qQQUI9Ykt36ArthZjQXnrGtwZfBzjDNdaAM
 TwBvBP9+jlBEDs3hugpSY94i1C1O/Wjmug==
X-Google-Smtp-Source: ABdhPJyTygZSGFX5eIM6/dkAIywFF35ZHmq9xGT/4duvrNw2xgG3rUQmmclMh4zKcn0Nwpq4ubuUiw==
X-Received: by 2002:a17:90a:dac5:: with SMTP id g5mr2325737pjx.5.1598978784522; 
 Tue, 01 Sep 2020 09:46:24 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id u123sm2401020pfb.209.2020.09.01.09.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 09:46:23 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v16 02/20] drm/msm: Add private interface for adreno-smmu
Date: Tue,  1 Sep 2020 09:46:19 -0700
Message-Id: <20200901164707.2645413-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901164707.2645413-1-robdclark@gmail.com>
References: <20200901164707.2645413-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This interface will be used for drm/msm to coordinate with the
qcom_adreno_smmu_impl to enable/disable TTBR0 translation.

Once TTBR0 translation is enabled, the GPU's CP (Command Processor)
will directly switch TTBR0 pgtables (and do the necessary TLB inv)
synchronized to the GPU's operation.  But help from the SMMU driver
is needed to initially bootstrap TTBR0 translation, which cannot be
done from the GPU.

Since this is a very special case, a private interface is used to
avoid adding highly driver specific things to the public iommu
interface.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 include/linux/adreno-smmu-priv.h | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 include/linux/adreno-smmu-priv.h

diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
new file mode 100644
index 000000000000..a889f28afb42
--- /dev/null
+++ b/include/linux/adreno-smmu-priv.h
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 Google, Inc
+ */
+
+#ifndef __ADRENO_SMMU_PRIV_H
+#define __ADRENO_SMMU_PRIV_H
+
+#include <linux/io-pgtable.h>
+
+/**
+ * struct adreno_smmu_priv - private interface between adreno-smmu and GPU
+ *
+ * @cookie:        An opque token provided by adreno-smmu and passed
+ *                 back into the callbacks
+ * @get_ttbr1_cfg: Get the TTBR1 config for the GPUs context-bank
+ * @set_ttbr0_cfg: Set the TTBR0 config for the GPUs context bank.  A
+ *                 NULL config disables TTBR0 translation, otherwise
+ *                 TTBR0 translation is enabled with the specified cfg
+ *
+ * The GPU driver (drm/msm) and adreno-smmu work together for controlling
+ * the GPU's SMMU instance.  This is by necessity, as the GPU is directly
+ * updating the SMMU for context switches, while on the other hand we do
+ * not want to duplicate all of the initial setup logic from arm-smmu.
+ *
+ * This private interface is used for the two drivers to coordinate.  The
+ * cookie and callback functions are populated when the GPU driver attaches
+ * it's domain.
+ */
+struct adreno_smmu_priv {
+    const void *cookie;
+    const struct io_pgtable_cfg *(*get_ttbr1_cfg)(const void *cookie);
+    int (*set_ttbr0_cfg)(const void *cookie, const struct io_pgtable_cfg *cfg);
+};
+
+#endif /* __ADRENO_SMMU_PRIV_H */
\ No newline at end of file
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
