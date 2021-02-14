Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0852831B241
	for <lists+dri-devel@lfdr.de>; Sun, 14 Feb 2021 20:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2E46E0A0;
	Sun, 14 Feb 2021 19:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03C06E0A0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 19:41:22 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id nm1so2483852pjb.3
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 11:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WI1iyrnvhWaNG/MvFsahwpBXf2DTPnogdw12xoDU1G0=;
 b=EVG43J4/EO4+pGlO0g6kGGmKnxCMV3wq1NjNbFjH7MFbJIqAUh55QKyHyORwlFS1QQ
 A/JhHhwLujRXfD3v9erPMAy2OZw7EQ942OvjnvGGBD8XS31lM1THGlcSgzh7mi3R96Lm
 DnZ6I6nmeBuaUaOMGAA7101hvQTmV6ogOlTzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WI1iyrnvhWaNG/MvFsahwpBXf2DTPnogdw12xoDU1G0=;
 b=ODnYwgPUkZRwLaOX5+ScqGxfyzJx8VN/z6HHfu0elGSsxGga9IkSn9xJkA3H75d45E
 ZpqVh0hbL2glGqflSvqjsatbWqS/6VsSKjgadxiKMaTi3EKaR13qrq+cbvWr//1cAehR
 ZF2aUr/2yckn/D3/drjsvL6IE85N+1HRGeunontUjhGwf8p3xaXuWkVazAzVlsdXcqym
 bM2RhCoMpNa7aI6WIi/arZBoIqPUUHIcUT3jOXQDFBsw0T98Vp3hk4afp0SUv1FB4qoq
 ffx5e5zcFnZWFjCUOoDEQHKbrMUXd9ojem38ZUUDG/6lCm+f77rt/qh2n2Um8HAXtYST
 RvrQ==
X-Gm-Message-State: AOAM531oN/zzQVQTX/vQm/SVrXJ7LvZUl85BUZwm8B+t5UIqfBTcU0Pm
 lZ2oXRq+2MrKasXs3DmCyNqAfw==
X-Google-Smtp-Source: ABdhPJzOmjjDGQgqnxXklOvSXjd4BguDUqqil0xk86snbbpR/yGMkUu7WGUp4pAFWbPilT+STILTGw==
X-Received: by 2002:a17:90a:7e94:: with SMTP id
 j20mr12988495pjl.8.1613331682653; 
 Sun, 14 Feb 2021 11:41:22 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([45.249.78.214])
 by smtp.gmail.com with ESMTPSA id 125sm15129247pfu.7.2021.02.14.11.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 11:41:22 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 1/7] drm: sun4i: dsi: Use drm_of_find_panel_or_bridge
Date: Mon, 15 Feb 2021 01:10:56 +0530
Message-Id: <20210214194102.126146-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210214194102.126146-1-jagan@amarulasolutions.com>
References: <20210214194102.126146-1-jagan@amarulasolutions.com>
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace of_drm_find_panel with drm_of_find_panel_or_bridge
for finding panel, this indeed help to find the bridge if
bridge support added.

Added NULL in bridge argument, same will replace with bridge
parameter once bridge supported.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- none

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 4f5efcace68e..2e9e7b2d4145 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -21,6 +21,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -963,10 +964,14 @@ static int sun6i_dsi_attach(struct mipi_dsi_host *host,
 			    struct mipi_dsi_device *device)
 {
 	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
-	struct drm_panel *panel = of_drm_find_panel(device->dev.of_node);
+	struct drm_panel *panel;
+	int ret;
+
+	ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 0, 0,
+					  &panel, NULL);
+	if (ret)
+		return ret;
 
-	if (IS_ERR(panel))
-		return PTR_ERR(panel);
 	if (!dsi->drm || !dsi->drm->registered)
 		return -EPROBE_DEFER;
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
