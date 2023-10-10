Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 324917BF275
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 07:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B201210E1B8;
	Tue, 10 Oct 2023 05:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E4B10E1A8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 05:49:24 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b9c907bc68so59345811fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 22:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696916962; x=1697521762; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CFbHOAgZVXSg1kKOflBZaq1B31YfZJPkEFEvk9ENnLs=;
 b=rJeJA/UNIRaRkR1+DNYfe5cm39Hs1ObLsC1Po1xohqggxSzNVd4kopqkClzSazB1Rf
 ElgST5msdj2VCuvgnfLB+6p45Ji2IZFOMhWxi6Cs0WSEBw12NM5koVsNgCAQ3ZVn5t/6
 lNnRbHRjaz9HBhADvbyGMolyoxEZy8gmYbE4j1yiE070/EkLaNURUgMeRWmm0++DECTo
 CWN6arnEkgyPSQl3aQeFXuxeRKZLfqjFpktNO1qHsmjfV20k+rfe0OWhadU9umBApkFA
 2KwrxgGs9bUee4vhOCOja6VpbNYj4SomBABTNGS5S9Agf4wS1l5PrnvodWgEksRDbPA6
 xNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696916962; x=1697521762;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CFbHOAgZVXSg1kKOflBZaq1B31YfZJPkEFEvk9ENnLs=;
 b=XiPlWrhSpZxl/3QOUH3WzOB6HYwnh3sDmMRkHjSbTZ3LncH3VxPMiDPYak81sHn5ly
 kazK1XEO8wqPFrTla3Ft972LoC8GhS+QD7Mgj8vUuR9wbdlFCC3/nTVRCK1C6HcNmhsk
 qQSoyf35DGpoCKzHIts9GuClPbzFCG/Zefv0EB4FaTSPQ2rHr8WWONeRwvZvxm6QK37Z
 gCXG8qrWzz5yZdS+tF19o0x+EL1LQunMYg4XjHYfpHymcrIdVMUVku81a8s+TUkxx656
 nFprj+0ux1q3gNpw4SXk3RMX8jVEEvMa6bJWrtvVKAGkcWj6LCTjxWugIXLGR6MxXXBn
 SVqQ==
X-Gm-Message-State: AOJu0YyJ5tUCaBshk8ydQZFYAAPW+LiBolGVqEYy5EiB5ZxupZUHAXwj
 Iw93EQog+iiwAKMNmEj/GfMn1Q==
X-Google-Smtp-Source: AGHT+IFJ0hwFexb/Jn2jlVn3hI6Fio1n0bEXN8vdVrCP2YpJpdTs8EeiniK6yetHCXyfssGsOUG1oA==
X-Received: by 2002:a2e:7310:0:b0:2bc:fd50:573a with SMTP id
 o16-20020a2e7310000000b002bcfd50573amr14953125ljc.6.1696916962099; 
 Mon, 09 Oct 2023 22:49:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a2e8216000000b002bba9a4f715sm2280398ljg.11.2023.10.09.22.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 22:49:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH] drm/msm: fix fault injection support
Date: Tue, 10 Oct 2023 08:49:20 +0300
Message-Id: <20231010054920.2821140-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Readd the header that was erroneously dropped during KMS code
refactoring.

Fixes: 506efcba3129 ("drm/msm: carve out KMS code from msm_drv.c")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202310100836.6E6zjEcE-lkp@intel.com/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 93c026d79aea..2aae7d107f33 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/dma-mapping.h>
+#include <linux/fault-inject.h>
 #include <linux/of_address.h>
 #include <linux/uaccess.h>
 
-- 
2.39.2

