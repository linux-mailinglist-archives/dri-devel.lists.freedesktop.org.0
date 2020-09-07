Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2787625F820
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 12:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0196E2E1;
	Mon,  7 Sep 2020 10:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FB16E2E1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 10:27:19 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q9so13871265wmj.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 03:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q+TGJ9Ym0syTVzzBabl2tk8Nt0BUMxgbGAdUQw/45cA=;
 b=btZLeOKD0ZVAZhWmFKYS7P+7KmHUYWi1YspXazFPkyYMaMzS+7Yne84P1Hf5+6az8t
 2Is6BXNHwuVtIc+ZX/bdAkv/amNgrbBGPRtmn7XmYH+E/cSG/3Q1VYZa85sd0iDyalx2
 c/R5xqbskcE2fnqx/ZjejzFED8IF2x1kT87psi2z0vymvG9eGPOmkp/YvyVOg/WNSClz
 jyPl9BNrQCoFZSoxYYvAF7VhDAqY4c4AZn8usGF9s7LhAos481B0gg2hEFjj0LAK8axM
 at7Z2eSFJbP2M6ydH2zGbss0+yB1bC04xUBy5MDsWLJj3lO37XBAwiY3dCC2C98+Nuel
 KIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q+TGJ9Ym0syTVzzBabl2tk8Nt0BUMxgbGAdUQw/45cA=;
 b=HQS/TgaHioRwYPTHYF/y1qDTzsZRPHlHazZRk5uwuo/hLGg+iMqTGI5/HZxBV5WXb0
 KeHAua8gNj0Hg2AhAOnKya360KzGjUojA/wVl3PUVNIZ75SMuSUBes0BqvqKlO5Wj8us
 Esgj8Ww/S0o4+8mFG61oiTEuRNhn9EgA+9eboB8ZY/f9wBqOu2aByc+Letp2tV97HPRA
 tcpr9AIndxTScG7mx22CHlnAsUWzvR/kmDDHJfL4A8rUN2WPTVcMRAdhUSNE2n4kn+QP
 9Fp6vSf2/xsTwJ5XQopNFcpNqOsohfoykFGQ9nUrYIxci4D2F7QPXod+RWMDWFTTv2h7
 VByA==
X-Gm-Message-State: AOAM531mV0p/ROFnQyyamnTptUUjAwwh26COtO2zRpJHfVozf7UsQMvL
 5b7zOLMxQfFJZdqik9+rUl45bQ==
X-Google-Smtp-Source: ABdhPJyxS4K4d+QoWFAYuoDAZcg++KNLJApzaQrGlUOj4t+ZfxjITEPYxwzZXZUCD6x1bh0qP/+QKQ==
X-Received: by 2002:a7b:c3d0:: with SMTP id t16mr20046965wmj.169.1599474438401; 
 Mon, 07 Sep 2020 03:27:18 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id j14sm27758688wrr.66.2020.09.07.03.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 03:27:17 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: maxime@cerno.tech, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 angelo.ribeiro@synopsys.com
Subject: [PATCH] drm/bridge: dw-mipi-dsi: fix dw_mipi_dsi_debugfs_show/write
 warnings
Date: Mon,  7 Sep 2020 12:27:11 +0200
Message-Id: <20200907102711.23748-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This fixes the following warnings while building in W=1 :
dw-mipi-dsi.c:1002:5: warning: no previous prototype for 'dw_mipi_dsi_debugfs_write' [-Wmissing-prototypes]
dw-mipi-dsi.c:1027:5: warning: no previous prototype for 'dw_mipi_dsi_debugfs_show' [-Wmissing-prototypes]

Fixes: e2435d69204c ("drm/bridge: dw-mipi-dsi.c: Add VPG runtime config through debugfs")
Reported-by: kernel test robot <lkp@intel.com>
Cc: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 0b3825a4fbdb..52f5c5a2ed64 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -999,7 +999,7 @@ static const struct drm_bridge_funcs dw_mipi_dsi_bridge_funcs = {
 
 #ifdef CONFIG_DEBUG_FS
 
-int dw_mipi_dsi_debugfs_write(void *data, u64 val)
+static int dw_mipi_dsi_debugfs_write(void *data, u64 val)
 {
 	struct debugfs_entries *vpg = data;
 	struct dw_mipi_dsi *dsi;
@@ -1024,7 +1024,7 @@ int dw_mipi_dsi_debugfs_write(void *data, u64 val)
 	return 0;
 }
 
-int dw_mipi_dsi_debugfs_show(void *data, u64 *val)
+static int dw_mipi_dsi_debugfs_show(void *data, u64 *val)
 {
 	struct debugfs_entries *vpg = data;
 
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
