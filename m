Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D660791EA29
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 23:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EADB10E185;
	Mon,  1 Jul 2024 21:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W+zpybGB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE3410E0D6;
 Mon,  1 Jul 2024 21:23:37 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2c927152b4bso2511969a91.2; 
 Mon, 01 Jul 2024 14:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719869016; x=1720473816; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kgp7NHRVTqgOOQSOalpQlbnN69Db7Yr6qntJTF+0wVQ=;
 b=W+zpybGBpv7NOhB8owIDAthlZzm/DCtHOzynhD8jobT79H0PscQ3IDEznmxcUhWzRD
 SrUNVos7/yQxFFXaIeFItiJRKe4LFYpRn4dsn/cByCsT23nw16FOBubCDi9nFG7i1u3D
 fhOHobNaefLc8mOOffU8h3RDvyoVFyn5eIJwlZUpVlnHqSFHB5JAeWlW1vAw/TEsrxmi
 WrUPrPI2gO+atDNyZvBvtcvHznDFLYO9+B7Xzbk+HTdIZotn3edKQyIOE5fRnOg0q5eh
 M4yVbAUccYw7VAiSEdxkbGU3LnUCZ9de4uXUFY3ruV9JbrcX1QkgJbbXSN2RbBFStErQ
 prIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719869016; x=1720473816;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kgp7NHRVTqgOOQSOalpQlbnN69Db7Yr6qntJTF+0wVQ=;
 b=o3Lc1usavleonJ4P2yzScAzUpflETf8l/eCc0WePBstDw9leH1ABtPvQobd+vRNCBB
 Kk3EVezqOgrN1Xspd6tl42myIRZDiFHfx+UXB88aYnzMJEDd4bvRFS01bD8OGpsD+0P2
 hCR8xoyesc8+YJd1zC8MooN6jKBA+2ylqHe/MYrcakafWjl30O4XD3ncqBGGq8nEvm2h
 Eg7QNqtWOT6hAKWE3C5bLWdxoUQM6fkuXEdnSsez0li08JYoWZBIRyMmFz1g4fonkxTs
 Afa6d7j27IXQ3Keyhy1iM8hwPx7YNcRgDbi2Xi9THyUd+utJTE99dN99wDeqNXKRqfKP
 YTbg==
X-Gm-Message-State: AOJu0YwEiVOUQDYJc69yDpWevY3yOFpUxxDAnsCHyiwjC/lm2R3FegVR
 HmiHfcUoTryR7Q1g1OPZCbNfVMebeaNTZFZ7b7Z6jhDWfQH74tQllK6lVw==
X-Google-Smtp-Source: AGHT+IGEfZTBckuXSprd/rSjhMFhdz8yGzcw7MjpySN/S0Tzj8JLrZKwOBsz9eoR0yvCrECy77vyxw==
X-Received: by 2002:a17:90b:4b48:b0:2c7:e24d:f695 with SMTP id
 98e67ed59e1d1-2c93d715ec5mr5682410a91.12.1719869015621; 
 Mon, 01 Jul 2024 14:23:35 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c91ce43303sm7263491a91.17.2024.07.01.14.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 14:23:34 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, kernel test robot <lkp@intel.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx: Add missing __always_unused
Date: Mon,  1 Jul 2024 14:23:29 -0700
Message-ID: <20240701212330.426399-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
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

The __build_asserts() function only exists to have a place to put
build-time asserts.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407010401.rfunrBSx-lkp@intel.com/
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index bdafca7267a8..68ba9aed5506 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1249,7 +1249,7 @@ static const struct adreno_info a7xx_gpus[] = {
 };
 DECLARE_ADRENO_GPULIST(a7xx);
 
-static inline void __build_asserts(void)
+static inline __always_unused void __build_asserts(void)
 {
 	BUILD_BUG_ON(a630_protect.count > a630_protect.count_max);
 	BUILD_BUG_ON(a650_protect.count > a650_protect.count_max);
-- 
2.45.2

