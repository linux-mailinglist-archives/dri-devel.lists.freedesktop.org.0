Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF4767CE8B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 15:45:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1519010E919;
	Thu, 26 Jan 2023 14:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B573410E920
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 14:45:21 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id 5so2019941plo.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 06:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=szahjNSumSDXHid0fYalhBWCMxVcircmAlXVe0dAaOg=;
 b=GMHSCK0VlGTKgtoBtSvuboOBZKfQwGe4VvGA8evVShcGrPNRrBynjw4wC7iXSFwNVz
 zBS5X10R6Pk8GfyYwEQxWRxFeD9+4y/H+TYuvignx2TzI9MqWOQ+lu1xpSTbfYEdkD7T
 Q3qOeWLfiJ9MnsF6WzBC2b7HyINNXUhBqhvYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=szahjNSumSDXHid0fYalhBWCMxVcircmAlXVe0dAaOg=;
 b=vk+0ATzQBsRrf2LeG2/Mv866jTwcxAZ4uQ0VxdDdJWUNQvCo/HS1MExH/Mev3bzJyi
 h9Ovsvln/HDn8W6FtKKiKuUIFUM03Vi8WF7D9FxQ1Wmfk9gz0l2X+Ph03MaC+/tgwvFg
 J1qyd0VRxOwvJnH0t6PEpmvStiE1rYBbAKPE00P56v6qZ+gClA3x2FXwe1qoSQkYDA6E
 BFegqvn0avGw3j/Xp2wekJjArhl/at4a4qIEOGX1CIHvtD8xm/M6WL97YYcwVQKlUbfL
 8Lad02xwZ/1t39eB3vvvLqDS45p3KuSTTUsxiau1brX5+aQnDtlyLhgjheLblRlstOMB
 TdjQ==
X-Gm-Message-State: AO0yUKX6trHfMH6CfUbq7lQTKOhyV1y8eeNxmgsbuazWVQPK04F1DOZw
 Xr0vIvkhDfNT9D3lj54smerFWw==
X-Google-Smtp-Source: AK7set8viY2FGvSkAuaTk1msXSlH4Fh1y7TTnoO52wKvjLois8RZieo3sfS0/ThWzwObgzjlVHRa+w==
X-Received: by 2002:a05:6a20:3950:b0:b8:6a9c:fe21 with SMTP id
 r16-20020a056a20395000b000b86a9cfe21mr2839859pzg.51.1674744321250; 
 Thu, 26 Jan 2023 06:45:21 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a238:3cb1:2156:ef87:8af5])
 by smtp.gmail.com with ESMTPSA id
 d197-20020a6336ce000000b0042988a04bfdsm823660pga.9.2023.01.26.06.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 06:45:20 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tim Harvey <tharvey@gateworks.com>, Adam Ford <aford173@gmail.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v12 03/18] drm: exynos: dsi: Drop explicit call to bridge
 detach
Date: Thu, 26 Jan 2023 20:14:12 +0530
Message-Id: <20230126144427.607098-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230126144427.607098-1-jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
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
Changes for v12, v11:
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

