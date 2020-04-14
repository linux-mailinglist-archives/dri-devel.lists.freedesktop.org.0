Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6C21A940A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7557D6E85A;
	Wed, 15 Apr 2020 07:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B656E5B2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 22:20:22 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id j3so1102086ljg.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 15:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=onnXURnDKlMg1uxo6qnz+iE+q0NRBVnox8AeT5i1HKQ=;
 b=qMMpe9cdrz7x4TJjmfaO5VHmQbNxFkDe2pVnhslgkSnWNj83Y0vjcvV2f1RQLROfHZ
 rox+B8BeaGYOnyn1RoiXIYkD8d0moANyTzwDMbg2/wKQgc6t4kgqaeYfQoGwGcTpXFN0
 rh1+4YV5pfrftLUrKZeykau1/fuLm7VsZItuWqOfqK9/bixQMpPHS++g1wYZpXwhDfLk
 4K8jTISGXO3wDuzlc5KWJX7YBzkXJKtDM85m2+0tYibU2BG//4jtnnfV1i9j2qPKUuBU
 9IauDIjwQodV4UxcABcPBdUfSZ0fagMBbKPNX8lAkyC3hJGof7O8ZZzzid6KpjvBSkEU
 rxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=onnXURnDKlMg1uxo6qnz+iE+q0NRBVnox8AeT5i1HKQ=;
 b=m0l50PY0t3lHUTA67jNvDSaGqcoN4/gQ6YQd+axM+X3A/RAxuCeGue5PEqYF6II45O
 GX+T+Bh8zLTTx/sQEPlQ0iXK4n+Q8Tv9MJXUvP59aIJ3D6lpEu0F68/09+YyFLdgT9Qr
 cO3zmAWfQEvspFLbap0Xm3HWkJi/eJ5EqRYFapHwVqL5MoKiSJe14yhINA1J8WZkTQlx
 b8iIUdkSJWB38GmsBqiwMC1SsXySuOLvUgJjdl4JdPJgu5+x3Fdwa0sb9DW6OXwH7roq
 2R9AhbksWsoFm+gCFc0T5fUfGV/h1h4ZxUEO48Gl1IBolQoy2A7aavSK61FRkP0eRfjc
 qXjA==
X-Gm-Message-State: AGi0PuYsUuxdbs21ZTmJ8dzNDDP0mhyn8dm1yB1eri/lIfZj0dZZVGqU
 AXOlnNFgwoz0iaIatlsQegs=
X-Google-Smtp-Source: APiQypLpYz8jfKSPIBcjC/VEtLmf4Lu78UHdIMgYpTMwUzxmRljvh+WvmekbJEyXhoYHYWqxOGXryA==
X-Received: by 2002:a2e:8410:: with SMTP id z16mr1339187ljg.197.1586902821153; 
 Tue, 14 Apr 2020 15:20:21 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id k11sm11120064lfe.44.2020.04.14.15.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 15:20:20 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 2/2] drm/tegra: output: rgb: Don't register connector if
 bridge is used
Date: Wed, 15 Apr 2020 01:20:07 +0300
Message-Id: <20200414222007.31306-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200414222007.31306-1-digetx@gmail.com>
References: <20200414222007.31306-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 Apr 2020 07:17:53 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We rely on the connector that is created by the bridge, and thus, the
Tegra's output connector is not needed in this case because it will be
an unused connector.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/rgb.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 4be4dfd4a68a..6e6b3fee1d87 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -275,21 +275,32 @@ int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
 	if (!dc->rgb)
 		return -ENODEV;
 
+	drm_encoder_init(drm, &output->encoder, &tegra_rgb_encoder_funcs,
+			 DRM_MODE_ENCODER_LVDS, NULL);
+	drm_encoder_helper_add(&output->encoder,
+			       &tegra_rgb_encoder_helper_funcs);
+
+	/*
+	 * We don't create a parent "output bridge" that sets the
+	 * DRM_BRIDGE_ATTACH_NO_CONNECTOR flag for drm_bridge_attach(),
+	 * and thus, the bridge creates connector for us in this case.
+	 * The output's connector is unused and not needed if bridge is
+	 * used, so skip the connector's registration in this case.
+	 */
+	if (output->bridge)
+		goto init_output;
+
 	drm_connector_init(drm, &output->connector, &tegra_rgb_connector_funcs,
 			   DRM_MODE_CONNECTOR_LVDS);
 	drm_connector_helper_add(&output->connector,
 				 &tegra_rgb_connector_helper_funcs);
 	output->connector.dpms = DRM_MODE_DPMS_OFF;
 
-	drm_encoder_init(drm, &output->encoder, &tegra_rgb_encoder_funcs,
-			 DRM_MODE_ENCODER_LVDS, NULL);
-	drm_encoder_helper_add(&output->encoder,
-			       &tegra_rgb_encoder_helper_funcs);
-
 	drm_connector_attach_encoder(&output->connector,
 					  &output->encoder);
 	drm_connector_register(&output->connector);
 
+init_output:
 	err = tegra_output_init(drm, output);
 	if (err < 0) {
 		dev_err(output->dev, "failed to initialize output: %d\n", err);
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
