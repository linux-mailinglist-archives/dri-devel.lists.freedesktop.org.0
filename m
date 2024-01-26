Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F39B83E156
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 19:27:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D87F10FD18;
	Fri, 26 Jan 2024 18:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6CC610FD18
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 18:27:28 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2cf33035d1dso10784321fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 10:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706293587; x=1706898387; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LYGDfQbY/xCYYNsqD+fm8Yc+HDSRw2uFMdxVRxyadQY=;
 b=I9qLWlA7I43s4EbJGAGO4iGOKvSBKpdUYJuVZP6wHxo8Pt4cemA98A3L+kUSIV6Rtf
 PPiUAByR0k3yBIQqeJt34kPMjiraDz5nHHcJCctQR6cRStegvcckPL/gz3o4rPhKB+3E
 srR2BQrqZ/d5lwu65EkJCABpIIQb2zJS77z60Mz5W6Our9Uoo5zC9TccbLu2ONJIYPIl
 09L67lYnjg6G00LK4nSxhrcLMAI9P7Kf61OPomZEGSRm99or/PahDfb+FqYTdREqVYN/
 kbxLeg51ZgE1sf28GjLlbeeCXd/lRWQNmIvagvES0Dt1NcgzTgtQnKqjtYc8IE//aLaD
 DXcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706293587; x=1706898387;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LYGDfQbY/xCYYNsqD+fm8Yc+HDSRw2uFMdxVRxyadQY=;
 b=ksXAMqoiLutgbAOh3s8So/umu/QhneuiIDpRsmaFj5ZEeBXhrWOiM8uqMjX0rK295R
 5J8+qcXgPFq6kSlS6tvrJ+/GQvoAlPCjPxmQ39ayRkpfrWTyVtFw8hmvyMr+h0EGCzFs
 At6JlDP2fMWC1vjxlEhzVaflux/hAm4hKGsxKatY7HM/WXkytmcOw7mlTLFHsA2zOXe5
 IXYn/RMnP8tVBmlTEb9U6+jq8H9CtVhHAa1w126W4BfZFULmWqRaGL/SM5Fed/UqkDQV
 pTvDoupb9t/WNA85DrjGRDGwesu+S5KHgxWWvhKypjf0bOJmI7iomGhp/HypPGPSFGUI
 3zvg==
X-Gm-Message-State: AOJu0YyHi3W6bQjFbDXE2pN5+ON7SOFv0WYKnkheQ0vrx0Ys8ANi8boq
 WZ0VOX9kH3d4g+O6LC2WYUIOQ1UGSRIBVSK2cXKESCMPX8EfTkTiHQ4jSNeVDUQ=
X-Google-Smtp-Source: AGHT+IGaW8gWxmWZ0T7kgixxqervfpwlBJ40/w8GxSEe9gixUP0JvYejpmlB3AR9ZGPddSvkp/C+Uw==
X-Received: by 2002:a2e:9b9a:0:b0:2ce:e49:5b38 with SMTP id
 z26-20020a2e9b9a000000b002ce0e495b38mr142607lji.29.1706293586770; 
 Fri, 26 Jan 2024 10:26:26 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 l25-20020a2e8699000000b002cf30f27698sm232218lji.91.2024.01.26.10.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 10:26:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RESEND v3 00/15] drm/msm/dp: clear power and parser
 submodules away
Date: Fri, 26 Jan 2024 20:26:19 +0200
Message-Id: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2906;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=O8mpqaR8HXjJgB3eXyOdLmL7m98OK8uSbhLioXRWhf0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBls/lPHsYJLRUKxYf/7pbJxS9Mgri7FPORZPncT
 2wxrr5OmQiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbP5TwAKCRCLPIo+Aiko
 1ViWCACcrta6QUtcFHnUJxeO3FEeg1rptIvp1EfCOwrsR1kCTzuSzCuQvJOk4mm6+HEVaMzxoou
 CaOu5vICYrZsFUVYvYgg/t7K3ggB8HGaapRaDyKbkjWA+TxG1/EaLe4op7KPoHJH70YoYKVPTcg
 sV8EE28Co2nDGc7l+nv9slcXcyXjuL8cXxDMgJYUS3TL5G+6b8m0vkTyVgPr1fLfoSt6VW+qk47
 +OK/9uPBgWgHlvVNEz9QuccmP59baIo7R3NSOJuqCMSehQzrxUQ2F8NWBMZpO9/p4ZtYDmCH5kc
 uNvNHFYeOmO+/xGAj0yIgL9lQVSLy6EKt1DbPvZX9SImZBWP
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reshuffle code in the DP driver, cleaning up clocks and DT parsing and
dropping the dp_power and dp_parser submodules.

Initially I started by looking onto stream_pixel clock handling only to
find several wrapping layers around a single clocks. After inlining
and/or dropping them (and thus dp_power submodule), it was more or less
natural to continue cleaning up the dp_parser until it got removed
completely.

---
Changes in v3:
- Fixed crash in the DP when there is no next bridge (Kuogee)
- Removed excess documentation for the removed dp_parser::io field
- Link to v2: https://lore.kernel.org/r/20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org

Changes in v2:
- Fixed unrelated power->ctrl change in comment (Konrad)
- Made sure that all functions use reverse-Christmas-tree flow (Konrad)
- Fixed indents in several moved functions
- Added a patch splitting dp_ctlr_clk_enable
- Link to v1: https://lore.kernel.org/r/20231229225650.912751-1-dmitry.baryshkov@linaro.org

---
Dmitry Baryshkov (15):
      drm/msm/dp: drop unused parser definitions
      drm/msm/dp: drop unused fields from dp_power_private
      drm/msm/dp: parse DT from dp_parser_get
      drm/msm/dp: inline dp_power_(de)init
      drm/msm/dp: fold dp_power into dp_ctrl module
      drm/msm/dp: simplify stream clocks handling
      drm/msm/dp: stop parsing clock names from DT
      drm/msm/dp: split dp_ctrl_clk_enable into four functuions
      drm/msm/dp: move phy_configure_opts to dp_ctrl
      drm/msm/dp: remove PHY handling from dp_catalog.c
      drm/msm/dp: handle PHY directly in dp_ctrl
      drm/msm/dp: move all IO handling to dp_catalog
      drm/msm/dp: move link property handling to dp_panel
      drm/msm/dp: move next_bridge handling to dp_display
      drm/msm/dp: drop dp_parser

 drivers/gpu/drm/msm/Makefile        |   2 -
 drivers/gpu/drm/msm/dp/dp_aux.c     |   9 +-
 drivers/gpu/drm/msm/dp/dp_aux.h     |   2 +
 drivers/gpu/drm/msm/dp/dp_catalog.c | 156 +++++++++++-----
 drivers/gpu/drm/msm/dp/dp_catalog.h |   6 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 358 ++++++++++++++++++++++++------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  17 +-
 drivers/gpu/drm/msm/dp/dp_debug.c   |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 102 +++-------
 drivers/gpu/drm/msm/dp/dp_display.h |   3 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   |  66 +++++++
 drivers/gpu/drm/msm/dp/dp_parser.c  | 327 --------------------------------
 drivers/gpu/drm/msm/dp/dp_parser.h  | 155 ----------------
 drivers/gpu/drm/msm/dp/dp_power.c   | 183 ------------------
 drivers/gpu/drm/msm/dp/dp_power.h   |  95 ----------
 15 files changed, 465 insertions(+), 1017 deletions(-)
---
base-commit: 39676dfe52331dba909c617f213fdb21015c8d10
change-id: 20231231-dp-power-parser-cleanup-9e3a5f9a6821

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

