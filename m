Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF29964A719
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 19:29:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B1810E27D;
	Mon, 12 Dec 2022 18:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357F510E27D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 18:29:37 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 t11-20020a17090a024b00b0021932afece4so761802pje.5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 10:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R+Av/2b/ycy/RF3odcL3zI/UzS7FDZGXbIff6fnk4N0=;
 b=BnDGNHVrwFfXAnM9SyZeC9QH9o6KivMSPD1A8n6oPm6t8kdRpWWFIfq14tbtVxieWz
 Qd723axcn8ltXjluGv/NZ9rPBedPFTN0XSwPp5OOdMkHzagWOXC6AnEJC5kUqJQxFkqr
 RJB4Iqe6+yNzfy6qElEhLaGzuElsUeplD426M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R+Av/2b/ycy/RF3odcL3zI/UzS7FDZGXbIff6fnk4N0=;
 b=ZAfomCflVtVF1XfkkMA+d3pcQiWxJ1HIlvghsPJHM5GMaW8Ca+kVaSi+Znvo/wnFdQ
 87o1VbfeUtaVDbBDsEjgqBGmgZYSH6FGB3I/awsS3/tkIA8KfVx77QR9Gq71bV5vBJ5p
 DrcVpnob6jpgSNa/elUmAn56swoUJlc0d5rKcr7bOhYbuT9igg+9/Y0L+lUwhzJLgsO8
 WnXAyXb/NqPGPwwZk9B8OMxURRlB9ix7YSG/WRw7wp3hLbcCnZNg0jYVg8r1PTI5Hehx
 Ihv4tEvEXIZl4g6tNhKblmKSB1rcll/4obUR990wgudkoV/aws1QKwJIF+SfASg5s4nK
 +P2Q==
X-Gm-Message-State: ANoB5plowQ60NEECGa9xhRfYPUngHlMKtQRAOoBaaxeiX8wQIHaiWxqD
 zrDdnHq22p2hFf2NbLSOKKI+dA==
X-Google-Smtp-Source: AA0mqf5hsCFAcHLuL+AKUeephHjjqJ2dqqQyzD8sLhqo13HfDb8qhj+/6xrx4HNXqbUYYXrCRXyb1g==
X-Received: by 2002:a05:6a20:69a0:b0:9d:efbe:52ae with SMTP id
 t32-20020a056a2069a000b0009defbe52aemr27929032pzk.30.1670869776804; 
 Mon, 12 Dec 2022 10:29:36 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:c713:dc69:f2de:e52f])
 by smtp.gmail.com with ESMTPSA id
 n28-20020a634d5c000000b0046fefb18a09sm5357998pgl.91.2022.12.12.10.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 10:29:36 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v11 1/3] drm: panel: Enable prepare_prev_first flag for
 samsung-s6e panels
Date: Mon, 12 Dec 2022 23:59:21 +0530
Message-Id: <20221212182923.29155-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212182923.29155-1-jagan@amarulasolutions.com>
References: <20221212182923.29155-1-jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable the drm panel prepare_prev_first flag so-that the previous
controller should be prepared first before the prepare for the
panel is called.
   
samsung-s6e3ha2, samsung-s6e63j0x03 and samsung-s6e8aa0 are the
effected samsung-s6e panels for this change.
   
This makes sure that the previous controller, likely to be a DSI
host controller should be initialized to LP-11 before the panel
is powered up.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v11, v10:
- none

 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c    | 1 +
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c | 1 +
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c    | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
index 5c621b15e84c..1355b2c27932 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
@@ -731,6 +731,7 @@ static int s6e3ha2_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_init(&ctx->panel, dev, &s6e3ha2_drm_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
 
 	drm_panel_add(&ctx->panel);
 
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
index e06fd35de814..3223a9d06a50 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
@@ -462,6 +462,7 @@ static int s6e63j0x03_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_init(&ctx->panel, dev, &s6e63j0x03_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
 
 	ctx->bl_dev = backlight_device_register("s6e63j0x03", dev, ctx,
 						&s6e63j0x03_bl_ops, NULL);
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
index 54213beafaf5..362eb10f10ce 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
@@ -1018,6 +1018,7 @@ static int s6e8aa0_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_init(&ctx->panel, dev, &s6e8aa0_drm_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
 
 	drm_panel_add(&ctx->panel);
 
-- 
2.25.1

