Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DA84F9A6F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 18:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3B110E514;
	Fri,  8 Apr 2022 16:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE6A10E514
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 16:22:41 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id p25so2052182pfn.13
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 09:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cgQ5H26dXpBSM4rzqEEf72CNZpQ5iTR6sOekInJL9nA=;
 b=qGFgE8d/FspNS34svbsGDyPnuRy9Upu/mTr9Ef8Tu5CYyNTpw+nZ6ggmcKV9shfu8n
 s3q0yl1yl7qKniYUx5mx1k1WfO9anF/XSdxeQFVA9YAUf4vn5cpxhjeEufXsuvyRD+MA
 JZWNKWs0OXIjG/HYBwYGi875S7zRkHwDKx8Qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cgQ5H26dXpBSM4rzqEEf72CNZpQ5iTR6sOekInJL9nA=;
 b=cphh+MukfblSPR3P3qPpTWkfLtAGUOineUIQ0aNIKSWzyDmrqmTOgpI6D3FhjaPprz
 m771eAjq6NLkARRRMTJKFgXkNENdpsdXH/87zv6xd3qOR6nD6TyZdCIMGWtINfSu1D9t
 GkUlfm1Ea7zVPwKZsZIeEegyc7pal2KuGHx+PduZU5KemMVGC7Ay2hMUiJIlfwZ7Vefa
 /jnNNlHy2AkIdRnQJ3CWqw1HuUWf8jbdOBaWTTLVsvrIbuoMB43rZdna1zu2fKg7S13o
 1sKTYLAUmA2Ar7x7KpEhrscxwTVUGzP3fuhGP+O0YY7Z3aCPi6GY+dqkIOBcWgjlw2X6
 ScZw==
X-Gm-Message-State: AOAM530n9Ppy8uq50daEQM+yS0DDRj8I27hwrczo8lVlgjnGDuqy4cL/
 wYsXy+X5aFS7OnYXow1oYp3ODQ==
X-Google-Smtp-Source: ABdhPJz7BYgkTc1Jr7yE94AtJvsLtYwfoFOJxo6erKU4BeLpwnKWJwOinWC2GIqbOH2+0zjtoftLRw==
X-Received: by 2002:a63:c00e:0:b0:398:a2b7:be6 with SMTP id
 h14-20020a63c00e000000b00398a2b70be6mr1775772pgg.214.1649434961113; 
 Fri, 08 Apr 2022 09:22:41 -0700 (PDT)
Received: from j-ThinkPad-E14-Gen-2.domain.name ([45.249.78.214])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a056a0007d200b004fdac35672fsm24929863pfu.68.2022.04.08.09.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:22:40 -0700 (PDT)
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
Subject: [PATCH 04/11] drm: bridge: samsung-dsim: Add DSI init in bridge
 pre_enable()
Date: Fri,  8 Apr 2022 21:51:01 +0530
Message-Id: <20220408162108.184583-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408162108.184583-1-jagan@amarulasolutions.com>
References: <20220408162108.184583-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Host transfer() in DSI master will invoke only when the DSI commands
are sent from DSI devices like DSI Panel or DSI bridges and this
host transfer wouldn't invoke for I2C-based-DSI bridge drivers.

Handling DSI host initialization in transfer calls misses the
controller setup for I2C configured DSI bridges.

This patch adds the DSI initialization from transfer to bridge
pre_enable as the bridge pre_enable API is invoked by core as
it is common across all classes of DSI device drivers.

v1:
* keep DSI init in host transfer

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index ff05c8e01cff..3e12b469dfa8 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1290,6 +1290,13 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
 	}
 
 	dsi->state |= DSIM_STATE_ENABLED;
+
+	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
+		ret = samsung_dsim_init(dsi);
+		if (ret)
+			return;
+		dsi->state |= DSIM_STATE_INITIALIZED;
+	}
 }
 
 static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
-- 
2.25.1

