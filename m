Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 615316A99D3
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 15:52:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 139B310E634;
	Fri,  3 Mar 2023 14:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A89310E634
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 14:52:20 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id a2so2913836plm.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 06:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VXMF7IvJ5lsdZk4pO/zptMJoKK8XksLiBme5rkpOyuQ=;
 b=hGkxGdF7kmPPJuJpjPc6kHlHiYApnlT+vJHdTwT37NhdzcXWQAn9fHSEQ0TQ/kbmS5
 QypfI0Mf2i8O+/SW49124lKK23mSAwlV45XMizDf+a66Xvia4s+AcmL96M5OdvkpZSO5
 UyTJ5JoL5M6QwtmTVE+Fy1G4Xhf9HCqph+/h0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VXMF7IvJ5lsdZk4pO/zptMJoKK8XksLiBme5rkpOyuQ=;
 b=jYkVL2j9M3PlclxxlItalHV+tJTJVriFDxguAGcO+4VtKH9UOLFdC7GZYrvbBGw/97
 JxSTk+dPykVX2UB7xYMRNQxh4oH+047gLBDzF4BLAORX4RW5EaS1y4pIFKXDGQQ95S65
 YL6RJOKfaWmgUxCFwMKbY+Z67ojLd+/+RGDxOgnP0NdblvcosqyDRGO5tZMBm+41JePl
 f8uWrXqA09K8AdopK4W7UEKGZLVL4D7S6mLKG8Zd+bdYro/78/Ee7Bsvz3sQqTvusFRe
 Ah3ItV3UwHSs5oCqpdHDU7sPi0Qx7ZLZOX7fvbR7+FGs8KcFAyn7TzhpJCKtTu0t1IpL
 YbrQ==
X-Gm-Message-State: AO0yUKUnmrzMw1y4tF/jXqtmGag8oWo20/2RPIUJZCM27EXZdQDSkd4y
 AC4YN3bCoCdW/xh6vtA6RhJM9Q==
X-Google-Smtp-Source: AK7set81p7rwz/HUcdzWmogVP+ug4N0ohDc+9qRzXBre8c4tHgQ1gH/Ofu3GqXOriiZsk89cvsimjg==
X-Received: by 2002:a05:6a20:8f0f:b0:cb:7f0d:e25f with SMTP id
 b15-20020a056a208f0f00b000cb7f0de25fmr2918924pzk.41.1677855139916; 
 Fri, 03 Mar 2023 06:52:19 -0800 (PST)
Received: from localhost.localdomain ([183.83.137.89])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm1660856pgj.52.2023.03.03.06.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 06:52:19 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Marek Vasut <marex@denx.de>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v15 01/16] drm: exynos: dsi: Drop explicit call to bridge
 detach
Date: Fri,  3 Mar 2023 20:21:23 +0530
Message-Id: <20230303145138.29233-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303145138.29233-1-jagan@amarulasolutions.com>
References: <20230303145138.29233-1-jagan@amarulasolutions.com>
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
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Adam Ford <aford173@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Exynos DSI already converted into a bridge driver, so bridge
detach will suppose happened during bridge chain removal done
by the bridge core.

Drop the explicit call chain to detach the bridge.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v15, v13, v12, v11:
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

