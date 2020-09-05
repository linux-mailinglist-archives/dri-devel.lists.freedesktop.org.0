Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB7625E9ED
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 22:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C496E252;
	Sat,  5 Sep 2020 20:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9476E252;
 Sat,  5 Sep 2020 20:04:03 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id b16so4756924pjp.0;
 Sat, 05 Sep 2020 13:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tk5zPp0nu93VQrlRpBetxr1lff5xE8i/LH2EjPSUXEI=;
 b=rKBz6zBLD6wh4+Kw+P2n9npH4iZ6q7Knl2dAdBJHy153T/TZhFgFUbSd1LXAjvNn6d
 ZcwDZy830LF/SUEGCBmu3UBaCR+sebLnzSg84yg+1o7QE2jpuXyXr0W4PhRALAZuBzH+
 TbaIZ5bXtQRKY1908g1e8y9wgnGkXNmi6uVejlJr5e+i+UnDWlr0tg72hHnca0j5QP1t
 f6jDGIBJNGB1/yqj7xpz/M7G8rFX4CxrrdZgsPMxbraR3zJZC92QPvY7aRdo2fMzmnEM
 ukYbvRCt6dfbHI3HW7TgN4+Am36tuADwP/ywBRTd8SoRA/rrtaetUcmL44+VKkXIp8D6
 7gsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tk5zPp0nu93VQrlRpBetxr1lff5xE8i/LH2EjPSUXEI=;
 b=IQovvruFko1egj8myfC9RnKIFuffmDB2qtvUqhyiOURiyOZt5/2Pj/hjUMMVXDpVd/
 /9sykBpLFX2soU4VmywJRqe7UeTdC2Nopsj+B71NhZP0U5HpQJIb6/9n8FU3sBESE1//
 iHivAFw21lD8MYLxtQgTCS1Yc8fl3tj0Je9qkqvccjcq8TpEAT4/rh3Xl3C2kfM6N91w
 /rtTBJuzvIJVIMUmZhBSMCGvxEdOuW0cwto+WN0RHpGaARVfAp/TgMTNY2m60J6uFHlV
 WP1kk6QzPELafn2SJU8blDl6ZVUS/ZpfzNIEnYi+Wwk+1H2A3A8xj3oF7w6rrcodrHQY
 nOAg==
X-Gm-Message-State: AOAM5303aRZ/f9Nul4sMUbVWDXXe1aguGOH4G1ALZKHoSmEUg7qnnLkh
 EOxCr1/tBW132LjioISpKek=
X-Google-Smtp-Source: ABdhPJy+okIVRnu/tWAphoneYtMf8sSVRn+k3AenryR8jl/FlI5FzFE8AeHMdtRkcD/OF/JXZm8Org==
X-Received: by 2002:a17:90a:ca17:: with SMTP id
 x23mr12855250pjt.96.1599336243117; 
 Sat, 05 Sep 2020 13:04:03 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 194sm10566437pfy.44.2020.09.05.13.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 13:04:01 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v17 02/20] drm/msm: Add private interface for adreno-smmu
Date: Sat,  5 Sep 2020 13:04:08 -0700
Message-Id: <20200905200454.240929-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200905200454.240929-1-robdclark@gmail.com>
References: <20200905200454.240929-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Akhil P Oommen <akhilpo@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
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
