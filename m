Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B135683D041
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 00:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017CF10EB90;
	Thu, 25 Jan 2024 23:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E113C10EBBE
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 23:03:36 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2cf45305403so2063141fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 15:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706223755; x=1706828555; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LYGDfQbY/xCYYNsqD+fm8Yc+HDSRw2uFMdxVRxyadQY=;
 b=dexN1c4waoWyg9Ttfz/Z7oZ9aG2CX41TxFiYoeLHlujZTyCykccK+APulopQLaQOtK
 KyfAJ3zydxGo+6AZ15SSm/PjydJBRYYKCRfWYkUBVwSDpNlcWVXcMKp63SBq8jLv8ad1
 u+xY0NYV/0NVYNfJf9cQNyDqZ0q/2HTnHEnRWmQ40sje2z69sQIMH+0L33hLUXn6v/kH
 fPGd3LwQs2EUw0xpXP+JWu57/z4ke9hsnSESDfdOzznAHOiSdQftU/IR4BWcc2lf04VL
 KMM4U7/tdH4+6pZlCPVmrbXJ/lRDmk9lSVYwRSAc4O7Khe8UrmSHYzIbFgytVxkpIepN
 AaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706223755; x=1706828555;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LYGDfQbY/xCYYNsqD+fm8Yc+HDSRw2uFMdxVRxyadQY=;
 b=oypDPO9su/TQX4UFTgweeDtFtbeECtozJHby0DLdFsaSUKsjPnln8refO/+Q5BA2OW
 NkpPecHXYVagCrIN+U3/ePM1raE9KigxGODLAVGPDoi8+hIQvQEdiMpXx0p7X077ScIT
 x1SU/PlDkBOdYoEksXTFyAJjXbw2hXBrSHm7BRc2H3R15REsylkI6/vaxw/WI7xeG68w
 I/001YJKbK2N7aAN0l6lz++YY8vv3HmPFKIpFvZwRseq1nGtKe92SeRwb3An4605fNO0
 yO+cVtJrohLXS1v+7xvn2HNjNhW1qDepJXQhPnmk0P+4PPMqRIHAErz6mUoLyTZJMnP1
 Dw4Q==
X-Gm-Message-State: AOJu0YyOfaY8kfMcsn/qxXZBEfsaMPFZ/nKfjH5BA1nZRfGJgBzW6aNQ
 JhOMBZHJaVXT9i1goyHMlfgM2BfPMwhy6HzPGFT8kwyL2lwm12LdlzUiwyEzqwY=
X-Google-Smtp-Source: AGHT+IH+M3Xf2nCYP/B0lMAMqNOjMEpdZtiGzowCmtg/W0S4hn2lrNviimtzYXFCJ3IJMWv/tyUY+A==
X-Received: by 2002:a2e:b60f:0:b0:2cf:13c1:6a4 with SMTP id
 r15-20020a2eb60f000000b002cf13c106a4mr120265ljn.75.1706223754508; 
 Thu, 25 Jan 2024 15:02:34 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 x19-20020a2e8813000000b002cdfc29b46dsm405872ljh.88.2024.01.25.15.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 15:02:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 00/15] drm/msm/dp: clear power and parser submodules
 away
Date: Fri, 26 Jan 2024 01:02:29 +0200
Message-Id: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIXosmUC/53PMW7DMAwF0KsEmkPDoiGnypR7FBkYh4qFOpZAu
 UqNwHevnMldOgTg8of/8PlUicVzUsfdUwlnn3wYS2j2O9X1NN4Y/LVkhTU2uhxcI8TwYIFIUrr
 QDUzjdwTLDRlnqf1ArUo7Cjv/85I/zyU7CXeYemHaeGgRTWvqymo8GA2Fv/tJ5upCMqf+K+TT4
 EeSUAW5rWrv0xRkfs3NerXfktZBGTf1fx7LCDW4rmFbI7XOXP5Ay7L8AhotHmREAQAA
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlsuiGDQpLcmTmiCe/6wXmlwkZtq2iba+FUsfX7
 EB6skPk1j2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbLohgAKCRCLPIo+Aiko
 1RrWB/0eHcko7OQB/iGbQZuNv5Uh51UC9Tna1aeJSLOXn0wEwC8w898v4kW/qZbf56zs2FGQwkF
 R7jBC38N8uFXIXuBQ/Te7BdxaB3VYTk5x3LKaNVcD9Nq1Br5CavDkC0BNf8627jjh9TSc0vsvKS
 XVxcOaE7cMdF253Pk+Au3Xa+bpCKz97GxjvCwEFulF/Sbl7DWFuqkeq2SPWvbIV68CbzoZNviy0
 5v6WjEwS82s1xUTwz6tsEmpCOyJZEBhuR8fyiZ0jZITQk+3+tLAjBV5UnuXh4ebHw8ARn5NrJjp
 lMajfEftow2UwTrsWVUcyrHzb9IDYdVktot4KoNCGb2Vljtt
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

