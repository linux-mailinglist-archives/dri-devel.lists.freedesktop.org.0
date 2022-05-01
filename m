Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3975164DF
	for <lists+dri-devel@lfdr.de>; Sun,  1 May 2022 17:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F48A10F22F;
	Sun,  1 May 2022 15:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B9710F22C
 for <dri-devel@lists.freedesktop.org>; Sun,  1 May 2022 15:12:23 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id y19so15846002ljd.4
 for <dri-devel@lists.freedesktop.org>; Sun, 01 May 2022 08:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bcp90gaPZLzvVD4QztWlFtHIaIGASrYLr4Z5ANOtEbg=;
 b=lKnZjMgrJdGl9HP0JnYC9LYTnOiNOrDjnSOhuibPINeJ8AumJGsZKdLIzQ/Km3d+VO
 p9cDZGdyiINY7KsZzFUAASrG4xP2YxRMAxEmcakBd5DTmOOZdPH9AX8NJraF508LB1tT
 hrkl6vV9nUNlNfsuyZ29rgBk8C5KeJDTFswg56dOq0vuidD9Sabbm3grEe7GWdin8lYx
 xcEbtizWOqcnotUEk3mqaizkOD4jL4YspRz/YO+xwtG8G7PARMH1lHNg/+/s7fxmU8mb
 0KFC6x+btQw0jpjfLMC3tS9dpMnUV0hRo1NMcrLRbJSJP600cQGOXoTac6OfYSyj5ooj
 jA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bcp90gaPZLzvVD4QztWlFtHIaIGASrYLr4Z5ANOtEbg=;
 b=z+LoTZ7+QHsGm7c5bfXu9iN4Gc9oiiRc6irZm6tIYL3ZxDtofkDU6Pu01678cem6nL
 bLX7YzkhO1KQ+Ny/RRAwkSFbdU7KHHVR2egNKkJn+RjauRD2XhlLlwj0Xz0t0dk8jrpt
 E5dZsI1bopLUUCJPtUtAJrgkM3oaz+orf7Zx+RUDOKzcpkSAkHt2JngxDXUhfi9VGLE0
 Qoqc2iLbuavmqJ+mRJaSfzw/mR+MT072rwZtM4BGkA7zh3VG3C2XTjMkNOV0MJBQ88ez
 9RKPHi5RuaMI4lDdmA6zU6kaHbr+fJQ1bshDthlfFO3jtUiw+6uTLYaCY4ygzF8gtSjD
 2HIw==
X-Gm-Message-State: AOAM533v30b/OGWGH2bD6Tw88B/uvfN4Q7P9MRpldlw+E4mSsy3lzfYJ
 xWUMDWQNqXD15D0xjLfPC+stDA==
X-Google-Smtp-Source: ABdhPJwy3LKBmD0zbYUKLq70u5uq7jRovsAeKwEnH4chta+EQoxhvuNX/52f0cVP3W3Wp+06QV2Qhw==
X-Received: by 2002:a2e:b557:0:b0:247:e509:4a50 with SMTP id
 a23-20020a2eb557000000b00247e5094a50mr5770859ljn.72.1651417941572; 
 Sun, 01 May 2022 08:12:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 l16-20020ac25550000000b0047255d210dbsm461975lfk.10.2022.05.01.08.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 08:12:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/3] drm: move dsc data pointer from drm_panel to
 mipi_dsi_device
Date: Sun,  1 May 2022 18:12:17 +0300
Message-Id: <20220501151220.3999164-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To properly support DSC the sink driver (panel) has to pass DSC pps data
to the source (DSI host). The commit 0f40ba48de3b ("drm/msm/dsi: Pass
DSC params to drm_panel") added a pointer to the DSC data to the struct
drm_panel. However this is not the ideal solution.

First, this leaves DSC-supporting DSI sink bridges (like ANX7625 which
support DSC decoding on the MIPI DSI inputs).

Second, this does not play well with the panel_bridge. Drivers depending
solely on the bridge chains will still have to lookup panel and fetch
data from it.

Last, but not least, the DSC data is not relevant for the wide variety
of panels including DPI and LVDS panels.

To solve all these problems, move struct drm_dsc_config pointer from
struct drm_panel to struct mipi_host_device. This way MIPI DSI host
driver receives DSC data during attach callback without additional
lookups.

Dependencies: this depends on the MSM DRM DSC patchset [1] being pulled
in through the MSM DRM tree.

[1] https://patchwork.freedesktop.org/series/102262/

Dmitry Baryshkov (3):
  drm/mipi-dsi: pass DSC data through the struct mipi_dsi_device
  drm/msm/dsi: fetch DSC pps payload from struct mipi_dsi_device
  drm/panel: drop DSC pps pointer

 drivers/gpu/drm/msm/dsi/dsi_host.c | 25 +++++++++++--------------
 include/drm/drm_mipi_dsi.h         |  2 ++
 include/drm/drm_panel.h            |  7 -------
 3 files changed, 13 insertions(+), 21 deletions(-)

-- 
2.35.1

