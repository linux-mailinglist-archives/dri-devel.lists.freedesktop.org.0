Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6134F9A6C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 18:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7FA10E511;
	Fri,  8 Apr 2022 16:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984E210E511
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 16:22:33 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id r66so8201987pgr.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 09:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gGzzNcZY8RobibNWD65GpD1P4b/cN9VaV+JKjs3w2tM=;
 b=cEAopD5V2S3S9ex0G6yHvQna15BEzdeRDqQPGNwvzhtdW32VdJuPEHuaXwCxfnl93B
 vc3qC9H4s7hVxWGb7MCY0xBskCl0wOyh0MqHzrWShGJmF0wTQ3DCBxX3hI2x75BfLhtQ
 fy3SOSKYH3fg9aP9OvoFMxcLVee2Lh3Zlye7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gGzzNcZY8RobibNWD65GpD1P4b/cN9VaV+JKjs3w2tM=;
 b=V143vfR8U2OPmh/51ofYhvBE4xiPMQZLRBl9pHLYIPKKLxtDQCCMcKQ/gybgpvbbEM
 GyBKD14EMFQCGS4cNfQSH7rHsox6QE86rRm7TDXV7WPYPbeFmLviKy+uU4ILbvRYm6HE
 x4DnXDVVYFjHIkd+LrfrpBH0JvlL2oQPUao6Qebzdp7kK6ShMKoOsnEjjJRUDms+QRYR
 zLZ8gYGViNJl8DoPqVcv/pnOHv+aQwmJf3jm6DIdAvNapEEmS8uWvLvmqz3rUOBblA3n
 KrgH4hbIHhRAXjCYyFLVbmEnxO+/rzLu9lKTc2cmxBl+Z9He9MmGDlhn5SOE7PjAkgN0
 PmRA==
X-Gm-Message-State: AOAM533cBDPF15pB4945igCiz2Kw3DVZLLIo9+lt64np8Adyw8ec6sQ2
 xA54IcQ1vG9EqmwYoCvPI3egVA==
X-Google-Smtp-Source: ABdhPJyMQiWVcRguZ6ZZ6h+HCm/rUJKRxdLX++3Psb+xCLNDLaij1ylis+3u/mmBF732gkrXUsyQHA==
X-Received: by 2002:a05:6a00:238f:b0:4f7:78b1:2f6b with SMTP id
 f15-20020a056a00238f00b004f778b12f6bmr20311000pfc.17.1649434953099; 
 Fri, 08 Apr 2022 09:22:33 -0700 (PDT)
Received: from j-ThinkPad-E14-Gen-2.domain.name ([45.249.78.214])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a056a0007d200b004fdac35672fsm24929863pfu.68.2022.04.08.09.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:22:32 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 03/11] drm: bridge: samsung-dsim: Mark PHY as optional
Date: Fri,  8 Apr 2022 21:51:00 +0530
Message-Id: <20220408162108.184583-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408162108.184583-1-jagan@amarulasolutions.com>
References: <20220408162108.184583-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In i.MX8M Mini/Nano SoC the DSI Phy requires a MIPI DPHY bit
to reset in order to activate the PHY and that can be done via
upstream i.MX8M blk-ctrl driver.

So, mark the phy get as optional.

v1:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 0e6a5d1c7e4e..ff05c8e01cff 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1539,7 +1539,7 @@ static int samsung_dsim_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->reg_base))
 		return PTR_ERR(dsi->reg_base);
 
-	dsi->phy = devm_phy_get(dev, "dsim");
+	dsi->phy = devm_phy_optional_get(dev, "dsim");
 	if (IS_ERR(dsi->phy)) {
 		dev_info(dev, "failed to get dsim phy\n");
 		return PTR_ERR(dsi->phy);
-- 
2.25.1

