Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9D6250805
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 20:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792DA6E46B;
	Mon, 24 Aug 2020 18:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43126E466;
 Mon, 24 Aug 2020 18:42:11 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id k18so5304901pfp.7;
 Mon, 24 Aug 2020 11:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kWycSi8/0OaxvdZxdOTDCmrk2sU9rNWY5PuqZqeV1sg=;
 b=r4rwEj+O6r+DxrTANoYOTdX6LhhgVZHiSCccBdDNrSo/wyXwo/qLbSGybpJlYchNd5
 4uOMmCRIPb7QG89OgxnkzeqEVvSF2yB5lmk/APS0miJQKs9fum30PA1zKedNQavescci
 xe5Nre1Am+p4ugxF3qjbckrlCuRi2P0G1Tlb3c1pPTB3Jb3P0Q78YwYpqGMP2vfc8y4t
 AvvzPQAPjg/i4PeS2hoYNW1/yea+iAvEmxVJ94Ut+BrYPvwyY18/m97KL01DRCIR3bem
 Dt6thI9Vb6rWe6np9yy9FsKsIF24vLoL4hlTvLYcX8T8+n2RIO6OJlhaT6QXcHNovGry
 OsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kWycSi8/0OaxvdZxdOTDCmrk2sU9rNWY5PuqZqeV1sg=;
 b=kCGBB/YOtJCR8s/pSqTanKF7e0uSz4dPIM3Wv/xhh5RPYrnDSSyao/a4sb7Bh6AF4m
 j8ZH4KcOAGs2zTeu0v4zEHG2Y88HL1UoQ7risGgfrxyYRqv8tMEyI1d55J/4UbzPs90/
 DbqcHynKB9n6XHP7iM73B+wigC9CsfOf4pzdYO8dbEDpYqEDd/wHWeKQlRp0FEG0gSqe
 +hNzQTjgzLvjMRrV44MG6bgtZcocvY6GEOTwjV1bLA+OUJ+cQ3i+PTSvS5ShHuJdoRp9
 3cmnKubDW6gfXXREBUFqg2pUyrVW7sXVwGEZG7uSHhSJaxImrvMKV6mhxKNcQxH9IT/H
 a7rg==
X-Gm-Message-State: AOAM533GVqt/dZu23xOVvYG5nP/G0ZQ0eUK10x1dJKP+YQfcN0qgub+j
 tkmpbZxstCCFZXsoh96E73nsmJyUqYx/aw==
X-Google-Smtp-Source: ABdhPJy1K46vS/XLW2Rghqha2/afjikWJYTKXUJdYFsRFmeCGtgIpOYe82nrsWdZjXAh0X0rM2Gd/A==
X-Received: by 2002:a17:902:24c:: with SMTP id
 70mr4620642plc.284.1598294530939; 
 Mon, 24 Aug 2020 11:42:10 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id c15sm12191543pfo.115.2020.08.24.11.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 11:42:09 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 05/20] iommu: add private interface for adreno-smmu
Date: Mon, 24 Aug 2020 11:37:39 -0700
Message-Id: <20200824183825.1778810-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200824183825.1778810-1-robdclark@gmail.com>
References: <20200824183825.1778810-1-robdclark@gmail.com>
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
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, Joerg Roedel <jroedel@suse.de>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Akhil P Oommen <akhilpo@codeaurora.org>,
 Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Brian Masney <masneyb@onstation.org>
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
