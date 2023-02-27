Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 771136A40E4
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 12:40:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B39410E3D2;
	Mon, 27 Feb 2023 11:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA13710E3D5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 11:39:59 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id y2so5789372pjg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 03:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+rsXUA1KC0Yo0ZaAbDx/BQxkAqMf2mzDgWqmsD9i/BI=;
 b=eZ7KZSmMRN5/NNRkc88HUUlo+bZewhD9hLYONuMIxZUQVGbzisbr0iNvz9GPLyiNvP
 bnF+aE3VJvwPjQfQMQUNtRewgzE+amUN0OryL9Z3wdRMN/HZMaZu02LWvPWvBw7+OHRW
 HPvqpX2dYFiOj7I89gta7UFVIRomCtogdPrEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+rsXUA1KC0Yo0ZaAbDx/BQxkAqMf2mzDgWqmsD9i/BI=;
 b=cbHXmjmmrL4z03Bft/tW4auHF8FHkQYnR6WB7NXAgakrLxk7iAdHoziUjzZf6esOI3
 4gem1bRpnJGyx8YGT5N6By3wl1JSzsn1gqdpv57zeZ9yHwux8azR6jSTubsQizyCNHrq
 LMsEyoxO10I8T3UTwZ8h9nP5IQkdC4sLyUN+47vgV63qg6eTnrgKcw46NUe612orR3xk
 NP1MyyBkabmpXzZrWWl1k2xGPeO8wvr0HghxmYIetozPzFVo4enYsFtM6OK5iJN0L3jQ
 o0N6tFytCI5HFc1eInvyLplI2yQx/Ld5H3KhLilHH80QUz2ZnGv6CeoqxpPjtdCdjYIS
 5g/g==
X-Gm-Message-State: AO0yUKWhFC+aqAvjHQO66e/R3mahkipkS2Za4y5WhOegDdljDTyn5FBj
 YvR6KGN+vWV+WUnBjLyBQpYcdA==
X-Google-Smtp-Source: AK7set9liMsOr27MdRyeWehoz6qo7iJGYnzUHNMJqJYFfXfb/J46WFubYCRG6IV8hhlwMeKNw2KcnA==
X-Received: by 2002:a17:902:d2c6:b0:19d:1dfe:eac8 with SMTP id
 n6-20020a170902d2c600b0019d1dfeeac8mr1802046plc.26.1677497999350; 
 Mon, 27 Feb 2023 03:39:59 -0800 (PST)
Received: from localhost.localdomain ([94.140.8.120])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a170902ba8a00b0019c919bccf8sm4395277pls.86.2023.02.27.03.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 03:39:58 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tim Harvey <tharvey@gateworks.com>, Adam Ford <aford173@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v13 03/18] drm: exynos: dsi: Drop explicit call to bridge
 detach
Date: Mon, 27 Feb 2023 17:09:10 +0530
Message-Id: <20230227113925.875425-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227113925.875425-1-jagan@amarulasolutions.com>
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Exynos DSI already converted into a bridge driver, so bridge
detach will suppose happened during bridge chain removal done
by the bridge core.

Drop the explicit call chain to detach the bridge.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v13, v12, v11:
- none
Changes for v10:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 06d6513ddaae..df15501b1075 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1531,8 +1531,6 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 	struct exynos_dsi *dsi = host_to_dsi(host);
 	struct drm_device *drm = dsi->encoder.dev;
 
-	if (dsi->out_bridge->funcs->detach)
-		dsi->out_bridge->funcs->detach(dsi->out_bridge);
 	dsi->out_bridge = NULL;
 
 	if (drm->mode_config.poll_enabled)
-- 
2.25.1

