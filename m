Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7192E6B0EE5
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 17:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D88010E691;
	Wed,  8 Mar 2023 16:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D90110E691
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 16:40:26 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id p20so18154192plw.13
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 08:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1678293626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=90yBjB56MdOW/HpXbxKsjmjXCQmWwrP8jEp2gzu937o=;
 b=K//Wls+M6Qn6VF7WUpOzBSS7QYYUlUA6Cc1fYXAmD9MGM5HhjVsEDN/ujsRZZOPDKT
 pzuQZ/qY0r2g+Fm7RH7bRGGsRcq0TtPKkt09whHfftA6aD+qaI7UkCFqMvQQGMONPwKK
 UkvWuslm3Lh0wnxrBiHyM8zKXvLpAsbVnuFto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678293626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=90yBjB56MdOW/HpXbxKsjmjXCQmWwrP8jEp2gzu937o=;
 b=qDAQJKq66x3BmolfRDIf+qwFIh7comXNEeEvub7pOzTdadfnm6lngOpA9k2uycqoh5
 lLAD9aoORzNLSoF53zwQsI1htZSxF1GJwxYyOf7sgkTmSlTRLHlVg9Utz3fDZ83q+0DX
 yt9UmQ4/cdaoySAoJEN/ft4HYBIbNxKTmU1XuVZGK/Shbp07+dohQl9n2ps8RoCmBDtV
 KmzEUtE1Sav6hy2BqYSDZ0eOK2uMRHL1XIMhZFzwqxzsGcYmJmfd8DpO+zCzlxHvkpQv
 Iob+BFtFjkJFWPZK/x7K6ZQV5JEXiBaG3KuCqtkZ9xPe3MTpTKEmvzsDWyoCiWD2KcCX
 01TA==
X-Gm-Message-State: AO0yUKUzS/x7FmL6TU/l/4Swd24lFlpKOfjmv5UHw81AWoOKIJShi3Az
 vd27CDmcRjHE90bzzhVJYtn5nxHO/biDs7eQwF8PXg==
X-Google-Smtp-Source: AK7set93WOOrmFJ37Gpvxhb7LeMp3N37mFTKmXqT+Uo3pTzX8aac8SsOg1MXIxjX2ylaSI3NKSWSqA==
X-Received: by 2002:a17:902:e741:b0:19e:7bd2:a224 with SMTP id
 p1-20020a170902e74100b0019e7bd2a224mr23700768plf.62.1678293626167; 
 Wed, 08 Mar 2023 08:40:26 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a8a1:b545:91cc:80b2:f9fe])
 by smtp.gmail.com with ESMTPSA id
 kq3-20020a170903284300b0019b9a075f1fsm10046540plb.80.2023.03.08.08.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 08:40:25 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Marek Vasut <marex@denx.de>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v16 01/16] drm: exynos: dsi: Drop explicit call to bridge
 detach
Date: Wed,  8 Mar 2023 22:09:38 +0530
Message-Id: <20230308163953.28506-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308163953.28506-1-jagan@amarulasolutions.com>
References: <20230308163953.28506-1-jagan@amarulasolutions.com>
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

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v16:
- collect TB from Marek S
- collect RB from Marek V
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

