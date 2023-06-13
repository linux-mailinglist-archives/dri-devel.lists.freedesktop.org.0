Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FED372E4E3
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 16:04:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234A210E261;
	Tue, 13 Jun 2023 14:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4B610E25A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 14:04:13 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-543d32eed7cso2405029a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 07:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686665052; x=1689257052;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wV1ZBCQjYQHvbeHi8yLp3xmcTHgw1kfbgJnzsS6tlZo=;
 b=H8J5ul4PsRZcJmgBe7iCXSLoFpCYGhsNk4GLdmK1Xn99j8m++RJzRzeQHBisfcYkKW
 0k2gvVhPYWZYS4TPS3sWH1ZzJ8B/iz1Em0rZZLsSpPPnvNU6fQO/E1897mbZcQydhYl7
 7/HOTMIW3+YhQCOovwaUh+EZQZJ62/R1UoITg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686665052; x=1689257052;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wV1ZBCQjYQHvbeHi8yLp3xmcTHgw1kfbgJnzsS6tlZo=;
 b=fsuOS+tMFOcCa/E6byoFe0TBOeV2MVIEX7y9mZsWx9jKcTM5Pz+SR1iENu83jivlGL
 yWiu38W9VwEMNlmS8FZvntjnLm1XN6NMkcLHNl+f0KArZVL4UJkirrfKA7S8gXEuHUXU
 yrkFkHjGP3imkyRjsrUSPsEQ4TwskVGbEMtGZVQPNP1oKoR+GIUoxpIxRP9DJ7DjkiKl
 lDWnFcES65STz3+gXtGXA2B7t66501+DiaYCGqS6hnOKuKSKDICln9i4yugp4+rGZya3
 etIg6F9QlEIkHrBGpjn4VZ49261my5FL4arrDPxxC7/gZIXhciOmMKERfPS3lpyseclc
 LNAg==
X-Gm-Message-State: AC+VfDzIb8cQqTsuSjXYq85jThCMnD+M29DfhAbjDq5g1x7L9BO+UaEm
 1we/M4C+TSG9MCTs1JIX+5JWfMw6o+SuR7b/SiauwWyY
X-Google-Smtp-Source: ACHHUZ5VvQYmTmmIQqWjBevrcuv0PqFAFA2sN0IEpIr8oW0LWuYdqhdjUi7u9PR3BVPRxpCxdUTN4Q==
X-Received: by 2002:a17:90a:d304:b0:25b:e081:54e6 with SMTP id
 p4-20020a17090ad30400b0025be08154e6mr5037015pju.37.1686665051648; 
 Tue, 13 Jun 2023 07:04:11 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:1995:7db0:daf3:2c2a])
 by smtp.gmail.com with ESMTPSA id
 18-20020a17090a1a5200b0025c058be940sm2259230pjl.0.2023.06.13.07.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 07:04:10 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/bridge: ti-sn65dsi86: Fix auxiliary bus lifetime
Date: Tue, 13 Jun 2023 06:58:13 -0700
Message-ID: <20230613065812.v2.1.I24b838a5b4151fb32bccd6f36397998ea2df9fbb@changeid>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Memory for the "struct device" for any given device isn't supposed to
be released until the device's release() is called. This is important
because someone might be holding a kobject reference to the "struct
device" and might try to access one of its members even after any
other cleanup/uninitialization has happened.

Code analysis of ti-sn65dsi86 shows that this isn't quite right. When
the code was written, it was believed that we could rely on the fact
that the child devices would all be freed before the parent devices
and thus we didn't need to worry about a release() function. While I
still believe that the parent's "struct device" is guaranteed to
outlive the child's "struct device" (because the child holds a kobject
reference to the parent), the parent's "devm" allocated memory is a
different story. That appears to be freed much earlier.

Let's make this better for ti-sn65dsi86 by allocating each auxiliary
with kzalloc and then free that memory in the release().

Fixes: bf73537f411b ("drm/bridge: ti-sn65dsi86: Break GPIO and MIPI-to-eDP bridge into sub-drivers")
Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Check for allocation failure.
- Delete a blank line.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 35 +++++++++++++++++----------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 597ceb7024e0..e3de68f226e8 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -170,10 +170,10 @@
  * @pwm_refclk_freq: Cache for the reference clock input to the PWM.
  */
 struct ti_sn65dsi86 {
-	struct auxiliary_device		bridge_aux;
-	struct auxiliary_device		gpio_aux;
-	struct auxiliary_device		aux_aux;
-	struct auxiliary_device		pwm_aux;
+	struct auxiliary_device		*bridge_aux;
+	struct auxiliary_device		*gpio_aux;
+	struct auxiliary_device		*aux_aux;
+	struct auxiliary_device		*pwm_aux;
 
 	struct device			*dev;
 	struct regmap			*regmap;
@@ -464,27 +464,34 @@ static void ti_sn65dsi86_delete_aux(void *data)
 	auxiliary_device_delete(data);
 }
 
-/*
- * AUX bus docs say that a non-NULL release is mandatory, but it makes no
- * sense for the model used here where all of the aux devices are allocated
- * in the single shared structure. We'll use this noop as a workaround.
- */
-static void ti_sn65dsi86_noop(struct device *dev) {}
+static void ti_sn65dsi86_aux_device_release(struct device *dev)
+{
+	struct auxiliary_device *aux = container_of(dev, struct auxiliary_device, dev);
+
+	kfree(aux);
+}
 
 static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
-				       struct auxiliary_device *aux,
+				       struct auxiliary_device **aux_out,
 				       const char *name)
 {
 	struct device *dev = pdata->dev;
+	struct auxiliary_device *aux;
 	int ret;
 
+	aux = kzalloc(sizeof(*aux), GFP_KERNEL);
+	if (!aux)
+		return -ENOMEM;
+
 	aux->name = name;
 	aux->dev.parent = dev;
-	aux->dev.release = ti_sn65dsi86_noop;
+	aux->dev.release = ti_sn65dsi86_aux_device_release;
 	device_set_of_node_from_dev(&aux->dev, dev);
 	ret = auxiliary_device_init(aux);
-	if (ret)
+	if (ret) {
+		kfree(aux);
 		return ret;
+	}
 	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_uninit_aux, aux);
 	if (ret)
 		return ret;
@@ -493,6 +500,8 @@ static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
 	if (ret)
 		return ret;
 	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_delete_aux, aux);
+	if (!ret)
+		*aux_out = aux;
 
 	return ret;
 }
-- 
2.41.0.162.gfafddb0af9-goog

