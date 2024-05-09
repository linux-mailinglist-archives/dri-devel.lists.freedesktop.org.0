Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7026E8C183C
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 23:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C88DF10F54B;
	Thu,  9 May 2024 21:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="llr1ia8Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2789A10F53A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 21:20:27 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2db17e8767cso17633641fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 14:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715289625; x=1715894425; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g1w2Dg2zMqYrpdo5K6ppk2Wk2CEUaZVGV/kusmzWa10=;
 b=llr1ia8YHBF6Nl26bQWCNLYMvPkYOgccKg5UAXtC+nqKIQqYt3kPTV2hWzCfhNAiSH
 GqPNEfs7ZFp6EOV/mIcbmtB6yefllWI6xC88afUlTXruKzbyiZpU5u9kAo5W9cXPxJB4
 nvAMf10X9QBqKVbRmiGY3261RU9OqbSXWU/tKCqQgOZ0eN087kqtaErxoDnjGa8ihElU
 +lAci2u2Ct1SIrfQFKf7/03m41La/PMTu7sN74cfXb8IW9/9tY0aEKa3sB0I8euQ30DO
 3WtshzwVwNpzhJptOduQTctcxNO/4h42ke7YKI77o6dkq/+ppWce6S1dbFheVyPQtDCG
 zyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715289625; x=1715894425;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g1w2Dg2zMqYrpdo5K6ppk2Wk2CEUaZVGV/kusmzWa10=;
 b=o5xuhS4pxt8dvL8umpNi8xShdI9fPA5qmmI/owCsDtcbNB9+Sx483d8/9px3YyrQSk
 R3drqHQgRzKqt+Fg38GIocuA2n0/Hhmix/PT4RwRutwjM3NngcXfbGjUZxAZXYRQUbo8
 iQWa22dYBP7wZ76UTyU6XZbICGw+34TxbznqEmwunplYMLnVQmYrBF9GnLe+J74f6ycX
 n4sVICrDP2d8H+NstF1bpo5zbWv4ihGKq3WwsofA9DK2A1t11a8Lle/FKeANx2xGPt3f
 RS/OSMs9DUELHIDDxQbcHkhyWtKOwIrBz8JXzHYMUPDz8QFYGj3cIZ60pBGKcggndhF5
 B3xg==
X-Gm-Message-State: AOJu0Ywl30sUJDOz8OgB8pUCrb+mO7kDzX+WVPUlDEIifIt74oz5ommf
 GgfonYwG29a0MyH6yIC6Xg2oytyveNvXtAmHeZqqm8JZfQA88mRttW4FD/BLbo8=
X-Google-Smtp-Source: AGHT+IHnU/aJy1ZO1/xfH52rJie0WRqDYb/sNSj7f6lqtWBZo2L5OLSGrePaO9FoY1/O5wDNN3L4dA==
X-Received: by 2002:ac2:5049:0:b0:51c:348:3ba9 with SMTP id
 2adb3069b0e04-5220fc78614mr475324e87.22.1715289624766; 
 Thu, 09 May 2024 14:20:24 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d898fsm438832e87.208.2024.05.09.14.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 14:20:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/2] drm/panel: two fixes for lg-sw43408
Date: Fri, 10 May 2024 00:20:20 +0300
Message-Id: <20240510-panel-sw43408-fix-v2-0-d1ef91ee1b7d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABQ+PWYC/32NQQ6CMBBFr0Jm7Zh2LIqsvIdhATiFSUhLWlM1p
 He3cgCX7yX//Q0iB+EIbbVB4CRRvCtAhwrGuXcTozwKAykyypDCtXe8YHyZk1ENWnmjtefaXEd
 NemAouzVw0Xvz3hWeJT59+OwXSf/sv1rSqHCghqy9UE2Gbou4PvijDxN0Oecv7sdNXLMAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=834;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BYK2WN06GtAji32+gfIGh/W9H3jyH7UilTyBvi9es9o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmPT4XQW4EmHL745xMaQ3Khgc3J6NZ1SYxnm0Z9
 VtzIoOZkXyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj0+FwAKCRCLPIo+Aiko
 1fufB/0dIT6yHh/Df7jknSeMZ1ifhCbIcAxPhjYPSt/lQZ9IvamjjzpbcmcA1vT+POsDmG+Kbdu
 34442SiqfdFwqC60oKphHv+KBxtn8koF9d+EHOb7/V+fbSKy4ue+ht9GYX2AbtIFTb10qJKTPyM
 ID+WGhnKX+WC3gPMJ/DQM5yphcxuoHRjulWxpuGMVanKbW2XSzhdbQohHeQwbJl0ZZIt9KvApF5
 rbTIna2d3gl6oCSbdgbkddMVivY8oGtlg48o23V/Q2m6xJqJHsYoSE9WFziveCpxOiqBfOKmfmU
 BgYnhat7KwcA7FbAOW3JDGH7IHp7Fzkq4ThNGtpla92IRDN8
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Fix two issues with the panel-lg-sw43408 driver reported by the kernel
test robot.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- use SELECT instead of DEPEND to follow the reverted Kconfig changes
- Link to v1: https://lore.kernel.org/r/20240420-panel-sw43408-fix-v1-0-b282ff725242@linaro.org

---
Dmitry Baryshkov (2):
      drm/panel/lg-sw43408: select CONFIG_DRM_DISPLAY_DP_HELPER
      drm/panel/lg-sw43408: mark sw43408_backlight_ops as static

 drivers/gpu/drm/panel/Kconfig            | 2 ++
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
---
base-commit: 704ba27ac55579704ba1289392448b0c66b56258
change-id: 20240420-panel-sw43408-fix-ff6549c121be

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

