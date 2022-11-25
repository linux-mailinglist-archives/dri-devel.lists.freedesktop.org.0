Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A600638754
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 11:22:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BC410E70F;
	Fri, 25 Nov 2022 10:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1A510E614;
 Fri, 25 Nov 2022 10:21:47 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso3067981wmo.1; 
 Fri, 25 Nov 2022 02:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WANO23gI2Zg38u80cknASIYETE8/F7wtFNyAR3nQEls=;
 b=dFbHJ2qyTCJCLmjuuI+/TZKwaHPRMNcqZl6D6o+fFN19OaBDUhdbHT6uQSGt+izI/f
 2H3AY+gYu+E5eErzFlgeV2mhm44F7R86Fj2xrpC1wPJRgiuiZwxCkojnyT89PDc0bxQn
 ZcMM+hrLLV7BBQexFX0i0qDYb8MKvhRQKJvIEI19FZGtuB2NfgCwjg/iDBxFM8H+rRmE
 iaVWBPRulMF9FGy9y+CSlMx+/NWTE+4w9rT5CJV/XO7tnMpoVyebAmdS9WeXrqcQM3i8
 vd0u7D2clfl97a6aCp8Hgf7CXLd0w/nTDv4KhoDBv5AH25I/xY+cXuhuFm3JmFoxhgYk
 AgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WANO23gI2Zg38u80cknASIYETE8/F7wtFNyAR3nQEls=;
 b=ahEbI64LjNkAkISd5i2ZdL7pXjvweNaG9+v5qDolIp9Z8m43DAlA3b6pLWjt6srqfT
 nGeWfUK5Tp5/TMooL2yrIABmH2M3sXaVk1aQyIxiEDh1X9kTPJ/V++6KAQcSK1jMspWj
 q5tl0/nCjEAdT5/ebdOELk1kOYtgzd9CRwMIufgiKjo8kMYPOCfeCt7TkoCLvyS1oI72
 suGc2BXvzYuTljBNvk1+NIVNF+J9ZXOf5EjrWjJA4sJfis1cLbWjUgSk0TZGqTvWDe+h
 qi1rPaGLe/Wj6jtg2iYqaI34WNluQYS4lXCNgcK1jJ+pwaTakucPJ8AcKXmUTesll50i
 1Gqg==
X-Gm-Message-State: ANoB5plorJbdisWz2idEaFoELi/DKaRd7/jl5jRHuOrYSn0Cx+BnVcf4
 1OxB5H0QbVHvIo5goqqovkd3UY7cWP0=
X-Google-Smtp-Source: AA0mqf5XHgbIhWUnVE90w1tR3HG6xBZyGA/AlQWOACiC4mOeibO8aASN2xyR9IyGhKg4V1HBkEsI6A==
X-Received: by 2002:a05:600c:1e0f:b0:3cf:e9a4:3261 with SMTP id
 ay15-20020a05600c1e0f00b003cfe9a43261mr31053035wmb.41.1669371705443; 
 Fri, 25 Nov 2022 02:21:45 -0800 (PST)
Received: from able.fritz.box (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a056000038200b00241cfe6e286sm3351193wrf.98.2022.11.25.02.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 02:21:45 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 7/9] drm/i915: stop using ttm_bo_wait
Date: Fri, 25 Nov 2022 11:21:35 +0100
Message-Id: <20221125102137.1801-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125102137.1801-1-christian.koenig@amd.com>
References: <20221125102137.1801-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

TTM is just wrapping core DMA functionality here, remove the mid-layer.
No functional change.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 5247d88b3c13..d409a77449a3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -599,13 +599,16 @@ i915_ttm_resource_get_st(struct drm_i915_gem_object *obj,
 static int i915_ttm_truncate(struct drm_i915_gem_object *obj)
 {
 	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
-	int err;
+	long err;
 
 	WARN_ON_ONCE(obj->mm.madv == I915_MADV_WILLNEED);
 
-	err = ttm_bo_wait(bo, true, false);
-	if (err)
+	err = dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP,
+				    true, 15 * HZ);
+	if (err < 0)
 		return err;
+	if (err == 0)
+		return -EBUSY;
 
 	err = i915_ttm_move_notify(bo);
 	if (err)
-- 
2.34.1

