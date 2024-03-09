Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89522877068
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 11:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DCE10FE86;
	Sat,  9 Mar 2024 10:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PEV/aEa9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5624A10FE82
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 10:31:38 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2d27fef509eso43676031fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Mar 2024 02:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709980296; x=1710585096; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mwu7uG+pdqNKrhzZmBEjpkJLspquFl8V/3yQZhhNxuA=;
 b=PEV/aEa9EjpWZL4QdRPwlyLVo0tmPBmghqzgDpADk6ktlU9Lo5OX56lCwDudMiN2ot
 CXM2rULr/FZHlcTVKnMXGITMyBVVb4ervCRtlGGCVkZ93XQOSGdxu1ymmW0YySYmOJDF
 BSD+f4xLBrbm3v4+3p8JQp7ZzWoKKrNYr3RnEPY93kgmSYelwkEgzVPYMKfVYjPocvIw
 RQnpph4neSmO6x10LytrdKUPaX/8OupfGst+ka4Ted12y15dpnBCUXEA92K1mO+Olkno
 jgFCsFzoaqLkD2I9WHrahLMHz0UN5N+qeKepTOMB1jgxI2tPWIydgSP+l/Jy7ty4UAUD
 JSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709980296; x=1710585096;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mwu7uG+pdqNKrhzZmBEjpkJLspquFl8V/3yQZhhNxuA=;
 b=lvmicajb1LnqnWRXO8vmluRPqOGE2HHDr+OQCjj1AjXgZgXTS/Ni+9IgEKt9gvbHz7
 XivfaGpVBE4gBz6mgEH3gysX/49+Or1JdjioOfw81QnjA/RXMGe0JVBYobSqJlcOMaze
 UHQiB/hI5YxOy5xYSPbNU9bkP8uGZ+6L2vB4ijvMHukkVDBP34r/3TD4UjcpmugRx0+Y
 EsxeBzI53xbVNoKbB4quzSWnPx3Qdvmai2GBjB4UDH1e8bvkorowndqdDZfD0CltvM8T
 c/Cm4enW8LUlnpVO4klC+5uH/t9pJBQcU0bsVD17FmO1XZuamAfctzZjp/4bsjGzqm/D
 nTkg==
X-Gm-Message-State: AOJu0Yxbt2bGvkSDQixvcHhTm3BFKPq3ScUvzcrpCNOxaM7stsmA8IzU
 QBYJ1dWqJ3LeHZDOf4Eajsan6sKV6tuJA46PeMKpg67TvEQt+3jkH2NLNfwlbm4=
X-Google-Smtp-Source: AGHT+IGq4dI7t2fxNBuykTOQKeEoc0OK5JWQBh2V6+QG59K4Bby0WJyTYiRP0VIEcXkQjUXjIF4bZQ==
X-Received: by 2002:a2e:924c:0:b0:2d2:bdc2:2f03 with SMTP id
 v12-20020a2e924c000000b002d2bdc22f03mr1020703ljg.31.1709980295567; 
 Sat, 09 Mar 2024 02:31:35 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 y5-20020a2e3205000000b002d31953bc30sm245301ljy.55.2024.03.09.02.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Mar 2024 02:31:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RFC v2 0/5] drm/msm: make use of the HDMI connector
 infrastructure
Date: Sat, 09 Mar 2024 12:31:27 +0200
Message-Id: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH867GUC/3WNTQ6CMBCFr0Jmbc1QoIgrExMP4NawADrCJNiaq
 SEa0rvbELcu39/3VggkTAGO2QpCCwf2Lgm9y2CYOjeSYps0aNQlFlirXtgmd7IPVoN3joaXF1V
 TUVclGZNbhLR9Ct35vXFvcL2coU3mxCF1P9vXkm/RD3v4g11yharB3jRFVaE2eJrZdeL3XkZoY
 4xfPDAXtsAAAAA=
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1978;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Z+D0Xck92zqsjG+KbQH6+5R/W0ZnQtKYMm51vgFTlkY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+obq9Y2ruMMX6d4iX7q2Pw6QHLGNc5zhaq3o7ImP+w71
 da9a6ZGJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmwrKQ/Z9Bb74SK3favq/v
 F7Xej/Oo2/9nr4zdatn3h256qJ9c+vxLtL4243avxr61EY7H0uvP5hy9dvilQ8CXVat15RjPOxW
 GL03Km/vxc/kqdj0rySz+NavkhdpaOnjf+nz/dnlZ1ZZdwhatfXKJWadVEuY9/q2ceJ3L3sONe0
 YAV+xCucxFcTq56Z//LHzMr9dXGx9xd8He44xFOysO/WKM926dGbFXJOhDP7OnrbnC3f18KxbUN
 ahpep5a/HqZYnGz+Vth0852xdD1H3Xaevx85WRzWadsP36wySWu8OHJqg2Bbhsn2EfO17qi1HJ4
 cZDKVue8786HZj6Wk7RzWtdg7JFZVB52aUaMl8qEK/kTAA==
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

This patchset sits on top Maxime's HDMI connector patchset ([1]).

Currently this is an RFC exploring the interface between HDMI bridges
and HDMI connector code. This has been lightly verified on the Qualcomm
DB820c, which has native HDMI output. If this approach is considered to
be acceptable, I'll finish MSM HDMI bridge conversion (reworking the
Audio Infoframe code). Other bridges can follow the same approach (we
have lt9611 / lt9611uxc / adv7511 on Qualcomm hardware).

[1] https://patchwork.freedesktop.org/series/122421/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Dropped drm_connector_hdmi_setup(). Instead added
  drm_connector_hdmi_init() to be used by drm_bridge_connector.
- Changed the drm_bridge_connector to act as a proxy for the HDMI
  connector  infrastructure. This removes most of the logic from
  the bridge drivers.
- Link to v1: https://lore.kernel.org/r/20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org

---
Dmitry Baryshkov (5):
      drm/connector: hdmi: fix Infoframes generation
      drm/connector: hdmi: add drm_connector_hdmi_init
      drm/bridge-connector: implement glue code for HDMI connector
      drm/msm/hdmi: switch to atomic bridge callbacks
      drm/msm/hdmi: make use of the drm_connector_hdmi framework

 drivers/gpu/drm/drm_atomic_state_helper.c |  25 +++---
 drivers/gpu/drm/drm_bridge_connector.c    | 118 +++++++++++++++++++++++-
 drivers/gpu/drm/drm_connector.c           | 143 +++++++++++++++++++++++-------
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c    |  96 +++++++++++++++-----
 include/drm/drm_bridge.h                  |  82 +++++++++++++++++
 include/drm/drm_connector.h               |   9 ++
 6 files changed, 401 insertions(+), 72 deletions(-)
---
base-commit: b5b59b6c8b64e33de01434afd8f4297be175f62a
change-id: 20240307-bridge-hdmi-connector-7e3754e661d0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

