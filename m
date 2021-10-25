Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B74A3438DE3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 05:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C5689D42;
	Mon, 25 Oct 2021 03:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC34189D42
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 03:44:25 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id bp7so10431835qkb.12
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Oct 2021 20:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x16gXWpzNHpOLXxSWON9xi6tEmmvUPoYcp94QB3jkPM=;
 b=bx8eThpUK8zmEWsN8nmUkMwDmOLKZVuVKQYqVlA9Ggp2Fl07+Pctr43l+aUybocKZB
 o18h4wMUGsSmCPk+wx28pp0ynssm2H5o7Yz/GRpbbIgML9kQ1sb3fg4r0SGYhInsnmWn
 g4uNahRCtssYPnaUK6mWhgQ5I0A1Xq5jAWx4ljltjDyAhdG1Z8MmthWaPffXgeD260ih
 60UGKSFJp9REP8oPCIZ7BZRnPL9EFjwvZgKyq6+OXGHPUzA246shmRsv2TtTk7lILyB9
 rL6qjJCU6Bm+kNXGT+ytEIwrZDMXpeb6rJbpNs66GeUotSymvCKcvvjnXHXLbFIYokoH
 h0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=x16gXWpzNHpOLXxSWON9xi6tEmmvUPoYcp94QB3jkPM=;
 b=HwcIrWmjwDny5T/4U6TfClVo4NuEL3K4/DCb00/Zj8YBud0lnTs7tOjOFPS8ZBeWj1
 lvYf0rWgsXlQjfIM97C1gUJg1LbJwLcnctUIpbvW8iABZDz+1vkUKtkBlKSHq/awZdus
 VOqWeRnq2lfM1+tI5yY8pyzDxvAUd6wTS5zLQHsMVWUeKHOlpdmCji0E0IPQVJBybmvQ
 Mu8iJaudeSwqzKRklb8ZgmPPQDFMcJhGeVF43JyVs1RePiIBUgvbHQCpN8b+sihFvAAs
 69G573MPj6NwoNkDc8eqkOlglHfHe/jsEoQZ2+GaZhTy0r7C2JN+DmhIo6ciG5RWb4EM
 orlQ==
X-Gm-Message-State: AOAM532aPABpJlIfNR0AJ715BojdPeT8teFDXzWzB9wLvOOASOQ2tFF7
 o18hWRRbKJjPSESltaQjLGw=
X-Google-Smtp-Source: ABdhPJz0LfMxCfvl7U0olYslDsDxnM3i+4BngW+nFvaHXxGffDk/Jb7B8cW/QyxzH7NwguFCkMTQiQ==
X-Received: by 2002:a37:6856:: with SMTP id d83mr11723484qkc.8.1635133463866; 
 Sun, 24 Oct 2021 20:44:23 -0700 (PDT)
Received: from ubuntu-mate-laptop.. ([2607:fb90:1bd1:606f:7cf3:da67:cb9f:91b7])
 by smtp.gmail.com with ESMTPSA id s3sm7999991qkj.118.2021.10.24.20.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 20:44:23 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: robert.foss@linaro.org, a.hajda@samsung.com, narmstrong@baylibre.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch
Cc: jagan@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm: bridge: fix unmet dependency on DRM_KMS_HELPER for
 DRM_PANEL_BRIDGE
Date: Sun, 24 Oct 2021 23:44:20 -0400
Message-Id: <20211025034420.28996-1-julianbraha@gmail.com>
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

