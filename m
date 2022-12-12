Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F027364A3CA
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 15:55:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0ED10E18B;
	Mon, 12 Dec 2022 14:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C59810E188
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 14:55:26 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso76495pjt.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 06:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NlSuQTrbVzaxIlmPuxUKvQXXdzde89nREfoms55D9Qs=;
 b=gXnyqjcrXkKChetQW4gPuaaZ5gL80mQe2td6N26dwHtUpHnhmNx0jPQwqPR7Q0hi1h
 eiLSoKyrcj+h7xzat0FbErzx4Kay80BbRL081ETmKV4ZFSdMBoQ4bomqb9WZ3p1EiAET
 /uDo9UYiKTXHcftbiD3rn36JUu0DFWagzsxas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NlSuQTrbVzaxIlmPuxUKvQXXdzde89nREfoms55D9Qs=;
 b=b2nfrUgZNckDjtSkNRfAqarj0NqbVtS+yLWtX6p4rt4vlSq1OW4pCfsB99GOF0Xca/
 UUk8zRbTU5K/sjTTlzqEjgx5cgs8OWc0cvHIe8EcYH4BQMjKjdxPb5AyLE5srhJazyw+
 qWrtQEJCkAsc5OV0yMP3gaxiV9pzwPqHfp+/aMh1Lm0OY6UX8qZtTfQpmZlWQ8RsCW3Q
 nOptwESbmRTY4rIWsj/Zs/3VrPirRP/zRQ4PUvnQWTFkP0KTjXdXJAirtVci2gMQgHbp
 0frgJOU8K5X6IXil87hj2x3o/r0IdKgAJ9aBjANO5Twmyu2KQfE81PK4e+/OIx2Zz3fq
 +ObA==
X-Gm-Message-State: ANoB5plS2YzxjAKTnpqeK1GT8ug754ixiD9ANWPTR1FpbGyIvWj87hBU
 FSThGiIMnPpmIU02xdQqKGwU8g==
X-Google-Smtp-Source: AA0mqf4R6zWBHRqWR1AUnRnYGnPWvwKljqQzjysHJohx0NVSjERBAgNOcXOyL6/rTnkESipNLon5Ew==
X-Received: by 2002:a17:902:e811:b0:189:d8fb:152d with SMTP id
 u17-20020a170902e81100b00189d8fb152dmr23302674plg.25.1670856925633; 
 Mon, 12 Dec 2022 06:55:25 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:c713:dc69:f2de:e52f])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a170902784b00b001782aab6318sm6463272pln.68.2022.12.12.06.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 06:55:25 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v10 1/3] drm: panel: Enable prepare_prev_first flag for
 samsung-s6e panels
Date: Mon, 12 Dec 2022 20:25:06 +0530
Message-Id: <20221212145508.15096-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212145508.15096-1-jagan@amarulasolutions.com>
References: <20221212145508.15096-1-jagan@amarulasolutions.com>
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
Changes for v10:
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

