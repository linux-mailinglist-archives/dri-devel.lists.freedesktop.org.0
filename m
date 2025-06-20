Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBFAAE1B2A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 14:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4EF10EB57;
	Fri, 20 Jun 2025 12:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YYQCReGR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6569110EB51;
 Fri, 20 Jun 2025 12:47:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5E66861AE2;
 Fri, 20 Jun 2025 12:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5991C4CEE3;
 Fri, 20 Jun 2025 12:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750423673;
 bh=PohVpKV1EcWKh5h1vwR17he9CFGObdq89GBQaGriu4M=;
 h=From:To:Cc:Subject:Date:From;
 b=YYQCReGRiY4bge2iScXEUhsyAwUA9zO30x+YLAZPrOw5ZXaXBYK7YdgNyiK7I7YMQ
 3lm/LWDFqRwcJ5U5Nb6uZcwYxghT3T+K7UkaUq7zVKw3XmQc/ngnzoSaMtqdJsqhjE
 TZb2O2acTpYm80M6MEaGtebmYBqavX9lYPPdU7p+D5z+SL5dc8jQI4eKf/m5LFeJxI
 3+KfojPvF2NP/q3rVmjlJaYcuNk41lp6TCCl+qKNHRSqXL0lUGNLZ+XtnRbt9ffU56
 UVWnbFFldiVaUUkqP+/nVqRQSisNR0qtfcft5qdPBi60WHAXGHW9AUSbIHZhH1+uC5
 IGv6JYbx9zZZg==
From: Arnd Bergmann <arnd@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Abel Vesa <abel.vesa@linaro.org>, Jani Nikula <jani.nikula@intel.com>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dp: include linux/io.h
Date: Fri, 20 Jun 2025 14:47:43 +0200
Message-Id: <20250620124747.1928114-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

The driver started using readl/writel, which are defined in linux/io.h,
so this needs to be included here:

drivers/gpu/drm/msm/dp/dp_panel.c:33:9: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   33 |         return readl_relaxed(panel->link_base + offset);

Fixes: 9d47325ee063 ("drm/msm/dp: drop the msm_dp_catalog module")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 489e39f6c0ac..ecd5d3665541 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
  */
+#include <linux/io.h>
 
 #include "dp_panel.h"
 #include "dp_reg.h"
-- 
2.39.5

