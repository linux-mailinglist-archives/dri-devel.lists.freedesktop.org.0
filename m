Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5051B64A3CB
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 15:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A7B10E1A4;
	Mon, 12 Dec 2022 14:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958E910E195
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 14:55:35 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id t2so9340259ply.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 06:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y/y5vw0u9kB/6hX1ihxQilGZuqMG9YrydhtDvt3iYOI=;
 b=BuTOUmaReEVhSmrY4tNdyrVDylbaCAI9zI2x/KRj7AlKYnD+crXBjLg6I7Tl/K9/vI
 7QH/rUKSJ+wzvtLhF/iZXahZ0wjb/yur7gwTxnf3Qeoh059IGL2sgnZosXbPWh+9+ZlZ
 cLirNBdGyjHNotHKA9aW8XHZvkVPpgqMebgpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y/y5vw0u9kB/6hX1ihxQilGZuqMG9YrydhtDvt3iYOI=;
 b=ppJz7RrQ+KgOYM+B4kfta7OjQSWXLc4Bv6NOd3pAcUlS3CEJODNncqUQWgNg5wnn86
 h6sJIXiNs10qqJQB81eNCXlI79mk9h2ehtncKMJNbK/pJZe14LgoHWtbw//McvFJ/Ydo
 VCf0u5W2emXLslED3hYHugHti9dxrIO8sx15mBTxmsHCXOvzflDgkn7A0+niJo9LAcE4
 JRZOq5JVJekL8gFpqGQdsVv5Qt+2w2roVomSMJzr12Ci4xllTt95dk3FCzzAD7He3Bv+
 MaIxIUyuctxsLQhKImLqp/I3trYM+ilP21EDssmpFEqVVlFyJVMG2IRPKeJM/6Flwpdv
 bpPg==
X-Gm-Message-State: ANoB5pkVbXMGhl+1efsJ/xz13WzQlmRKiuzYzxeaTGGlbhjmAPxL7lOu
 Of00Xdfb+i7OX+dhv7oJtzLHMA==
X-Google-Smtp-Source: AA0mqf78CzP6wF4vC+jXEZ80TBSbKmyUeLFBAdMzjJ3bFN/hcrsPFs0IqmKVYOdlesA41J6QEB2Xew==
X-Received: by 2002:a17:902:b494:b0:188:635d:4ca9 with SMTP id
 y20-20020a170902b49400b00188635d4ca9mr17072148plr.2.1670856935321; 
 Mon, 12 Dec 2022 06:55:35 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:c713:dc69:f2de:e52f])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a170902784b00b001782aab6318sm6463272pln.68.2022.12.12.06.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 06:55:34 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v10 3/3] drm: exynos: dsi: Restore proper bridge chain order
Date: Mon, 12 Dec 2022 20:25:08 +0530
Message-Id: <20221212145508.15096-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212145508.15096-1-jagan@amarulasolutions.com>
References: <20221212145508.15096-1-jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Marek Szyprowski <m.szyprowski@samsung.com>

Restore the proper bridge chain by finding the previous bridge
in the chain instead of passing NULL.

This establishes a proper bridge chain while attaching downstream
bridges.

Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v10:
- collect Marek review tag

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index ec673223d6b7..e5b1540c4ae4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1428,7 +1428,8 @@ static int exynos_dsi_attach(struct drm_bridge *bridge,
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 
-	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, NULL, flags);
+	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
+				 flags);
 }
 
 static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
@@ -1474,7 +1475,10 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 
 	drm_bridge_add(&dsi->bridge);
 
-	drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
+	drm_bridge_attach(encoder, &dsi->bridge,
+			  list_first_entry_or_null(&encoder->bridge_chain,
+						   struct drm_bridge,
+						   chain_node), 0);
 
 	/*
 	 * This is a temporary solution and should be made by more generic way.
-- 
2.25.1

