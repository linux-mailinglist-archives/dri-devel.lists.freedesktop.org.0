Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C69448C1972
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 00:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018B610E6B3;
	Thu,  9 May 2024 22:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qiMYn8u8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB4E10E6B3
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 22:37:38 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2db17e8767cso18351861fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 15:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715294256; x=1715899056; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IwDfo96K4ZN1gvjMKsnALPIr6uZujP2Mw+2zG530qIc=;
 b=qiMYn8u8hm+j0qqHEZg1HvxO9Kk7VscGULqitcTbo7WpZtSpB1ULXa9CsZcVPgvKTi
 1Ai4KFnqWgKNvLXvgW+VT254Wa7jLdwx3S828k3QMbL2bZe423CJInwjhhphSPpRes/n
 vrQwgW0spZxUYLi8NDeJ26FZXa0elmWqcFdMXoNOB1yW3DI+H+I1OHGX/Yf57set194+
 /k8rZT10yzyOdlnzSLpVWdqPf1BrF+RP+D6Ez0TbTNvXMYaDIJH1q0JsyfNNp6GRoki6
 K7kEk7UTe6WBnIodEd2Pl9V+ZXdQXs/nLk/VlSXv12Wcj/A5vtvc7cVq4/vpTPp4azqY
 f9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715294256; x=1715899056;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IwDfo96K4ZN1gvjMKsnALPIr6uZujP2Mw+2zG530qIc=;
 b=mFhioa4jSgoWpj8KDhU3LH8N8xjVUzzpGo1dhXUIYUqQN3rlIOMZmKfQbpCPHwkcC8
 XJaL07NyPRatD2tyzV7ctCQlmIJlkpxScObqTm8qdNBU0kBZsgB4MNoDetaug92Ti3tE
 yFvJxtx/1fg7yqXvhk3kvkT9JbMSLrXVNet/VLTZRGpzKZeB+LSAQ3zjERBSTrP162Ke
 4Wdt9howh/AiHjh9wRxMLqlQ/rnStODgEMHH3Lym+/vGbPcOoyptVXL1WT7IPI8KEhjg
 nEAHGU5mWrWzG7EkP/mABP3RCOxr4rSSVy0BqwNbd/lGKIxzHcoHNKkZKZVdWmOEs4NN
 ZEOw==
X-Gm-Message-State: AOJu0YwkcQ+LHFSgjc+oqpVEHP3pC7zI6ZhMTP+IMxZ9kcKQ5zT8jJTB
 n5FI7gNpXID5UGTJHKlu3hEq9TWx1CyAflKYMXNeckSriygPKoAbIRSc2JB5+74=
X-Google-Smtp-Source: AGHT+IGh0M0O5qEntvykXCw1Hf9FQ/GL1VJ5wmKdoAgEPaW2ZM/BGtJRM/SOUMuG+gJBtyPWBzWThA==
X-Received: by 2002:a05:6512:3b94:b0:51d:8b86:6588 with SMTP id
 2adb3069b0e04-5220f76f343mr666423e87.0.1715294256332; 
 Thu, 09 May 2024 15:37:36 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d32f1sm457974e87.181.2024.05.09.15.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 15:37:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RFC 0/7] drm/mipi-dsi: simplify MIPI DSI init/cleanup even more
Date: Fri, 10 May 2024 01:37:33 +0300
Message-Id: <20240510-dsi-panels-upd-api-v1-0-317c78a0dcc8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC1QPWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDU0MD3ZTiTN2CxLzUnGLd0oIU3cSCTF0Tc8vElCSjJINUA0MloMaCotS
 0zAqwodFKQW7OSrG1tQCYmgFLaQAAAA==
To: Douglas Anderson <dianders@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=VxcZp1w/YGAckFLVc2gsng7lHzErKTzZobRSJjoTank=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmPVAuMV3wx2gZaFh7kczhgwtAqtMTSfjEM9Uxj
 L8jsu8mx6mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj1QLgAKCRCLPIo+Aiko
 1UuCB/9yNsgxlbxhybmzf+kdUFmXa5mewjR7yrDjRzsCLGxkMG2OfBf9EbH/LkBTpAJit6Kq/pw
 cxFlLPJ1hFzZ2m6uWekZJjT1waOHg/OsZvpB0EiSFjUh7O2giMM8BnM44eKsFsSBtsKco+LoU0I
 i6fJOFKnDmdGtPxNDT/X+cxjoslYCBdkaNa46lGpZ1qXaorPzgViDAyP9kBHP1LwbaiRG5GsEyj
 6MCp83FWkGyrw4jeS6vNeMaws8dWFkLppISqsducdRIvzo+xVZM0XFegI8U8/0H7oB2czry5FSI
 lvn25E9NxdXCXOFY9wjJqKFKfsVWV/NECnx1ZfccC9aIMtTL
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

Follow the example of mipi_dsi_generic_write_multi(),
mipi_dsi_dcs_write_buffer_multi(), mipi_dsi_generic_write_seq_multi()
and mipi_dsi_dcs_write_seq_multi(). Define _multi variants for several
other common MIPI DSI functions and use these functions in the panel
code.

This series also includes a fix for the LG SW43408. If the proposed
approach is declined, the fix will be submitted separately.

Depends: https://lore.kernel.org/dri-devel/20240508205222.2251854-1-dianders@chromium.org/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (7):
      drm/mipi-dsi: wrap more functions for streamline handling
      drm/panel: boe-tv101wum-nl6: use wrapped MIPI DCS functions
      drm/panel: ilitek-ili9882t: use wrapped MIPI DCS functions
      drm/panel: innolux-p079zca: use mipi_dsi_dcs_nop_multi()
      drm/panel: novatek-nt36672e: use wrapped MIPI DCS functions
      drm/panel: lg-sw43408: add missing error handling
      drm/panel: lg-sw43408: use new streamlined MIPI DSI API

 drivers/gpu/drm/drm_mipi_dsi.c                 | 209 +++++++++
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c |  73 +--
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c  |  30 +-
 drivers/gpu/drm/panel/panel-innolux-p079zca.c  |   9 +-
 drivers/gpu/drm/panel/panel-lg-sw43408.c       |  74 ++--
 drivers/gpu/drm/panel/panel-novatek-nt36672e.c | 587 ++++++++++++-------------
 include/drm/drm_mipi_dsi.h                     |  19 +
 7 files changed, 578 insertions(+), 423 deletions(-)
---
base-commit: c09cb909a4fba9c42baa343bb9a84986c15d5f01
change-id: 20240510-dsi-panels-upd-api-479adb2b0e01

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

