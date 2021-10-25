Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D115439DC1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 19:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881236E13A;
	Mon, 25 Oct 2021 17:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16286E13A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 17:42:08 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id bp7so12407257qkb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 10:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X9zUblVIGuZd4IjMbSrFBsAjSqw6zhs1OIqj/eH6y0g=;
 b=dhzO+fgnJ3U+lS/5F/TkufBFbMB0FNv9RJNCypmqJeBdqIvAj71pWD2NOfYrm2raA+
 Gz9sHdjGm2gbUyrghphWehHsFnCPBtO6T9pVNjdQSUCyFAmXo8C3q3oGIkmxya074LmW
 TlFgNZF+u6HWvpfWXC/CyLuVW2E9zBF/LQH6/EulYw0xE0hGLB2G2+L5qnzUUVo+OSTW
 KqdL/e4Zr/FS54+IBlJsSt/8phFMwL6kcbkRQh9cplG6LIR2aVK2fA1oVATMLa4ubnex
 paHwS5WXDqXF08tonhgFBfATSqQZsS+YnFccAJ8MBRZF6Iw71aePvl9Td/MigGEoJmT3
 LRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=X9zUblVIGuZd4IjMbSrFBsAjSqw6zhs1OIqj/eH6y0g=;
 b=7UzmhKvZMHDt/nviYDM3PPg42CSHDOdQFjGekJM3AfeGyKEe4Tk86uRkEq/cR1FVt7
 7m7zXxzlPkBUvR/lV5AOltmFD/G2J3mOns1BxOT3DGxZAAxyWF4K/JMYORhorx88+V+C
 PzHYTlfT5G6yyb+BIz5o8k9iL6pVebdIUCwJmMtOZA0XBt/r0mHg4bdJ974u0USC5tNA
 8jvMxxMkvOFrVhzwH/s0tc6dBt111TJd691CFzdEfvbOPc3KCeT4YYMLIy1RL1HjGWda
 PBdx3cDpKjVxhL4IPSut3C17iDg4Y6yuQ1gP1PjC82gVHGu4Fhr1YzMtc54wlGUxQB/H
 S02g==
X-Gm-Message-State: AOAM532VeYpDvUkshYIGbN62wbiZZSczczXH/u4NmKX9rYqat0k2cQji
 1s2lgEqRURIJ6zBgh3wYiMs=
X-Google-Smtp-Source: ABdhPJyM2kiThlmSeP8Np46MA9t73+LW7QdDF8frc+w+QIhaegc9ynRNr+0HDKlD7vGk7em/wPsvEQ==
X-Received: by 2002:a05:620a:4153:: with SMTP id
 k19mr14333359qko.246.1635183727839; 
 Mon, 25 Oct 2021 10:42:07 -0700 (PDT)
Received: from localhost.localdomain ([67.8.38.84])
 by smtp.gmail.com with ESMTPSA id v21sm502280qtk.46.2021.10.25.10.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 10:42:07 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: robert.foss@linaro.org, a.hajda@samsung.com, narmstrong@baylibre.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch
Cc: jagan@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm: bridge: fix unmet dependency on DRM_KMS_HELPER for
 DRM_PANEL_BRIDGE
Date: Mon, 25 Oct 2021 13:42:02 -0400
Message-Id: <20211025174202.32396-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.30.2
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

When DRM_CHIPONE_ICN6211 is selected, and DRM_KMS_HELPER is not selected,
Kbuild gives the following warning:

WARNING: unmet direct dependencies detected for DRM_PANEL_BRIDGE
  Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && DRM_KMS_HELPER [=n]
  Selected by [y]:
  - DRM_CHIPONE_ICN6211 [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && OF [=y]

This is because DRM_CHIPONE_ICN6211 selects DRM_PANEL_BRIDGE
without depending on or selecting DRM_KMS_HELPER,
despite DRM_PANEL_BRIDGE depending on DRM_KMS_HELPER.

This unmet dependency bug was detected by Kismet,
a static analysis tool for Kconfig.
Please advise if this is not the appropriate solution.

Fixes: ce517f18944e ("drm: bridge: Add Chipone ICN6211 MIPI-DSI to RGB bridge")
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 431b6e12a81f..a630cb8fd1c8 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -30,6 +30,7 @@ config DRM_CDNS_DSI
 config DRM_CHIPONE_ICN6211
 	tristate "Chipone ICN6211 MIPI-DSI/RGB Converter bridge"
 	depends on OF
+  select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL_BRIDGE
 	help
--
2.30.2
