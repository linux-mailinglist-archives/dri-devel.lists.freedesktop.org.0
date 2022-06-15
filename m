Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2895954D485
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 00:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528E5113917;
	Wed, 15 Jun 2022 22:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105E1113920
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 22:25:15 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id n10so25900814ejk.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 15:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EqzQW4bvuiA6pvJtGB4rjgOdvlv8E2OoMiyxcMbYrTc=;
 b=JSDW99nkzGyW3xICFnKaivNYgZ++b2aFROAcUyNdGBKm2s/+IJcAqkaFBg0XmZ2/at
 edM8wEefSZDksc/lyQB8aMS2rfc9PHBogmCkD0C28dfFHNWeHdX2doEMJ2WflhmFU6T5
 blyVH1ZWFdRN/Ja1usyOpD77t4Gzm8VRRbVYxcznxBulPSb2Rg4XrbBthfBXfH3v6Wf5
 4+gtdlhnHVpbJJ6lTB5wI7oyMLMavx+gBQ0uW6j/E6LKOih2kqRk1EiTCGWrocgUDsTJ
 pe8/Vzs97c3I+qE2ezj9xETPih6I6gJesyK/m3sf7ZybpEZiCtO4vJjtL42JwFhjEExG
 r0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EqzQW4bvuiA6pvJtGB4rjgOdvlv8E2OoMiyxcMbYrTc=;
 b=QnsoPd7BfTSnwocDxfsf8n+XlYRgTJC/hM1uQqiyUFZ4z6hZj2MDMBEGKA+zKv42VX
 NrkhvBZy0m4RdgkXGsuGC43Vqhpga+kz+wZ9/7Yi5+Kx83NvjGkJTXUgaoXocxaVS3LG
 sUFwQdqSpqMDSrjLDpOolqpGBxy3fa7ujSz38GtWUoR+5Hab1OeqopbudOJQuIZmCRoS
 GAKUouU8eZAmOgoLtw8Av58WuEJsn2SJGZAIdLx3aR3kkvCZTeYeauG/+2/4VqPV+1sa
 iCzj641VZpW1WQxiRJfXwas9slBods1PsJOTiqp+BT1T/8/2xNlWWJf3iKCf0FOZV32u
 9qbA==
X-Gm-Message-State: AJIora/gz+DaWrF07JMbyixfRqggjX9Mn9l/TZieRotavomaBBS4/+GJ
 A5ClNdUp2tHIzyIZl04JD7g=
X-Google-Smtp-Source: AGRyM1vecP0FSol4KwYKeB+9vu236BPxycyySMJXvkigqrEt5XtwuYhjnuoaB3hP+TSVK07JAymodQ==
X-Received: by 2002:a17:906:14d5:b0:711:c55a:998 with SMTP id
 y21-20020a17090614d500b00711c55a0998mr1798067ejc.708.1655331913477; 
 Wed, 15 Jun 2022 15:25:13 -0700 (PDT)
Received: from debian.home (90-180-208-18.rcn.o2.cz. [90.180.208.18])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a056402358300b0042dc25fdf5bsm350427edc.29.2022.06.15.15.25.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Jun 2022 15:25:13 -0700 (PDT)
From: Jiri Vanek <jirivanek1@gmail.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH 2/2] drm/bridge/tc358775: Fix DSI clock division for vsync
 delay calculation
Date: Thu, 16 Jun 2022 00:22:21 +0200
Message-Id: <20220615222221.1501-3-jirivanek1@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220615222221.1501-1-jirivanek1@gmail.com>
References: <20220615222221.1501-1-jirivanek1@gmail.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jiri Vanek <jirivanek1@gmail.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Vinay Simha B N <simhavcs@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the same PCLK divide option (divide DSI clock to generate pixel clock)
which is set to LVDS Configuration Register (LVCFG) also for a VSync delay
calculation. Without this change an auxiliary variable could underflow
during the calculation for some dual-link LVDS panels and then calculated
VSync delay is wrong. This leads to a shifted picture on a panel.

Tested-by: Jiri Vanek <jirivanek1@gmail.com>
Signed-off-by: Jiri Vanek <jirivanek1@gmail.com>
---
 drivers/gpu/drm/bridge/tc358775.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index cd2721ab02a9..fecb8558b49a 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -430,7 +430,7 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
 		val = TC358775_VPCTRL_MSF(1);
 
 	dsiclk = mode->crtc_clock * 3 * tc->bpc / tc->num_dsi_lanes / 1000;
-	clkdiv = dsiclk / DIVIDE_BY_3 * tc->lvds_link;
+	clkdiv = dsiclk / (tc->lvds_link == DUAL_LINK ? DIVIDE_BY_6 : DIVIDE_BY_3);
 	byteclk = dsiclk / 4;
 	t1 = hactive * (tc->bpc * 3 / 8) / tc->num_dsi_lanes;
 	t2 = ((100000 / clkdiv)) * (hactive + hback_porch + hsync_len + hfront_porch) / 1000;
-- 
2.30.2

