Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF414CC2EF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 17:37:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A12D10E9FF;
	Thu,  3 Mar 2022 16:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E340F10E9FF
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 16:37:21 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id z16so5143633pfh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 08:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pGR8lNdCSMp4bDiwIxgvTVOw5WSRkRGsDizit+YBhFY=;
 b=Bd/bj/gzvge+l1f/Cggjjx3tggy2+WFnhkFbVgxGs/EwFwEg1+k0Nw7eScUv240s3J
 N2SPI3Kld4cGZXZ44tahOwMNVAn2YDD9bgL5SAP/8XBv1uKJQi8aUrdiNART/N8FyTD1
 YazsK93ghn3CnREUXviHjk49uHPWTpgsdGnLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pGR8lNdCSMp4bDiwIxgvTVOw5WSRkRGsDizit+YBhFY=;
 b=nmmPIGG0XkGy9xYhrZyN7I6kEPL+tdf7bQwVtGg3lT5xpHtTT48cUSIjCyhjlS17CJ
 F7w24ta8edIinUh124QuPZKe2v3QQBuzFs39yWFRFKzYmj0mcaCcXgh0165NoXttk0Lq
 nzHitarnp4RLu5t0xCqoYlyydiI87hUhHZYkTbxCogYdQf1iDEL3jlVHpDyqcMJa60LO
 zUhojjANDSPn8SuuFWOKQRuunBy85k6I8a3zextUqt5JjMfnqGe2C7q8pfBqcgH8TlMb
 ZNb1p6jPNcHpPU2K6mDOxuzP7iAhpAcVIuYwrJ2Hbzgd//UvN5pMdgI0DHQjHwjeNMCF
 CPqg==
X-Gm-Message-State: AOAM5320YZFTWjio8zdAYRvWNV9vl1LR4NNjICfPzO8UGnUU++2ngQBf
 Hf58hksOEEk9OGcOOorzOA6WQw==
X-Google-Smtp-Source: ABdhPJwxa8eDdkCQWX1N2x7QLJxj6hDHWL0CBTKG+5qW6P69HjOgGhyVaNd3fYykgDa5eqDPwzKBPQ==
X-Received: by 2002:a05:6a00:a8f:b0:4e1:2619:11a2 with SMTP id
 b15-20020a056a000a8f00b004e1261911a2mr38854775pfl.53.1646325441472; 
 Thu, 03 Mar 2022 08:37:21 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:4526:5253:a010:63f4])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a056a00235400b004e192221ec2sm3220983pfj.14.2022.03.03.08.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 08:37:20 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v6 0/6] drm: exynos: dsi: Convert drm bridge
Date: Thu,  3 Mar 2022 22:06:48 +0530
Message-Id: <20220303163654.3381470-1-jagan@amarulasolutions.com>
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

Patch 1: tc358764 panel_bridge API

Patch 2: connector reset

Patch 3: bridge attach in MIC

Patch 4: panel_bridge API

Patch 5: bridge conversion

Patch 6: atomic functions

[1] https://patchwork.amarulasolutions.com/cover/1839

Any inputs?
Jagan.

Jagan Teki (6):
  drm: bridge: tc358764: Use drm panel_bridge API
  drm: bridge: panel: Reset the connector state pointer
  exynos: drm: dsi: Attach in_bridge in MIC driver
  drm: exynos: dsi: Use drm panel_bridge API
  drm: exynos: dsi: Convert to bridge driver
  drm: exynos: dsi: Switch to atomic funcs

 drivers/gpu/drm/bridge/panel.c          |   3 +
 drivers/gpu/drm/bridge/tc358764.c       | 104 +---------
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 241 ++++++------------------
 drivers/gpu/drm/exynos/exynos_drm_mic.c |  22 +++
 4 files changed, 93 insertions(+), 277 deletions(-)

-- 
2.25.1

