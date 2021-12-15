Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B58FB475602
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 11:15:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE2B10E44F;
	Wed, 15 Dec 2021 10:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959F310E44F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 10:15:43 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id g18so20285810pfk.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 02:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ycmrdCTib9LbjMA6+mULN/vXli0o3f4sKXQ8iB3x1RA=;
 b=XUkqrc9/qtaGMu/jp8JqH6oRQp5c1DYDglT/y8KzpC/M2eJwBh+chxliQ9cg7bMf9Q
 10hRg/PLr3BxulehHbC1eL9TdoCl/SamHosOmri2mhPrAQGvv8IWuT/SJKPjP6eXZub/
 u9rUzuKiJHOMPMx2p2oCsYCYtP526ul0yRlv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ycmrdCTib9LbjMA6+mULN/vXli0o3f4sKXQ8iB3x1RA=;
 b=cokHUbvdQb3oS3n2H37gPV/vQQZN0zrhgUxN4wg1BTpp5QYAXcZiGV76P8MeK5dRXY
 D8++o/oa2ms2NlWFFLGa3S/AETi2zK0xcZjwGQ5jrj+C342rPwqnqobQXwKrzx/D8246
 ZMql+2E+GaKerqD5oVsK9k8vCVKKjHsXnMePA7yPAD82He/Nx1FvR5YZjg0QrM0dHOx/
 Rh+YCGelQlTIBh0o/if3g3ttbwb+6dA7N0WR/H7klx1qZOiIuqp7JL+mDPgV4jq9nstx
 MSHGVbuyDXRct2FJVHzwDB/wA66hWp+ig2wWBqdc5lKYCkhj5sa4kVw+bMZL+Bu50t3b
 Ar1w==
X-Gm-Message-State: AOAM531IzYSSdgJpwMpxtGnFGDHkusKV3fU4IuKB5O7nttGvjFfnUU1Q
 lJcPd8acPsRUT6JoxCRM5XMBCw==
X-Google-Smtp-Source: ABdhPJzHRoP2coUeUFSwEHhUJtCbk6pHQNumN40eodjOkPCHCyU5YnRkgViV9dtuF9HX64zLHHL/mw==
X-Received: by 2002:aa7:918c:0:b0:494:6b49:cbfa with SMTP id
 x12-20020aa7918c000000b004946b49cbfamr8440363pfa.72.1639563343169; 
 Wed, 15 Dec 2021 02:15:43 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:a7:8328:d9c4:5bc9])
 by smtp.gmail.com with ESMTPSA id
 v11sm2408149pfu.184.2021.12.15.02.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:15:42 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v4 0/6] drm: exynos: dsi: Convert drm bridge
Date: Wed, 15 Dec 2021 15:45:28 +0530
Message-Id: <20211215101534.45003-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Updated series about drm bridge conversion of exynos dsi.
Previous version can be accessible, here [1].

Patch 1: connector reset

Patch 2: panel_bridge API

Patch 3: Bridge conversion

Patch 4: Atomic functions

Patch 5: atomic_set

Patch 6: DSI init in enable

Apply below patches to test on Exynos DSI:
- https://patchwork.amarulasolutions.com/patch/1825/
- https://patchwork.amarulasolutions.com/patch/1823/

[1] https://patchwork.kernel.org/project/dri-devel/cover/20211212181416.3312656-1-jagan@amarulasolutions.com/

Any inputs?
Jagan.

Jagan Teki (6):
  drm: bridge: panel: Reset the connector state pointer
  drm: exynos: dsi: Use drm panel_bridge API
  drm: exynos: dsi: Convert to bridge driver
  drm: exynos: dsi: Switch to atomic funcs
  drm: exynos: dsi: Get the mode from bridge
  drm: exynos: dsi: Move DSI init in bridge enable

 drivers/gpu/drm/bridge/panel.c          |   3 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 244 ++++++++----------------
 2 files changed, 80 insertions(+), 167 deletions(-)

-- 
2.25.1

