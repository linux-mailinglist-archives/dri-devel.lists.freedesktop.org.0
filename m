Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D0672D53D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 01:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2740910E2D7;
	Mon, 12 Jun 2023 23:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA6410E2D7
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 23:53:23 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-25c02bb57fbso728764a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 16:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686614002; x=1689206002;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ilCV1eavcppCZqSQlFFleTY0mmggm6H7OwYAhwT+pjE=;
 b=mvyGeYV5fJUviPeruRJWp/J2seLtopAZBeAkMlWKwi1+XvbXc+n449dyXKx2bGA8pS
 1fhqEE0nbC9V3zmpX+1zE1UCd0f8gFaImEminvqGXeE8vXbKkkegJVS1KOybl9l/SxIS
 o1vOKr5IqFET4cgNF0DqXka9LjUqOvybRh/UE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686614002; x=1689206002;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ilCV1eavcppCZqSQlFFleTY0mmggm6H7OwYAhwT+pjE=;
 b=eJUTxpCA7y7oYW/y9KB1c657z5Dxd2zaujZt9YWRc0awIhU3zTrHgQROrUTwHqE/bT
 xgEQ1iP0ol38fbGYR1sBi9TxktlWq+6cknLP0h9I2ivLalN8Gqr5sKMnms6vayppARfT
 C7nFR9a9JgJq38rGLyKtwg9mypmlfsqMAm+108UX9ldzSL7PhQCopuiPw0iOncQaVOPh
 l1JYYENv0LyAwkZq6yaqD40XP3BO5EDuINhezukVnFp6JTJhNflXqKEHpSrdnNhwglKI
 YhcSSTLOjnQWaxkeCRBfKDHS1NgUgMen/8DtYjN/6kmd1K3xwEVbxaWxBC/6oPktqXgw
 XDuw==
X-Gm-Message-State: AC+VfDyRoITQuUUrATMWZYKsxjeOlcc5z7D8YfUhejRZlJJQG42+B/IP
 RlG85yCHJw2SGKwfJ1bco22EdMwPuZYWVRz/Jjrgp/Yl
X-Google-Smtp-Source: ACHHUZ7B0ZWzMzO6JgKgvWXIa24+k2wYnRIGMhA66aBGl7pZyjS/BUAFMsF9LgOTT+j6GtWDvcjm5Q==
X-Received: by 2002:a17:90a:19c4:b0:255:6174:1588 with SMTP id
 4-20020a17090a19c400b0025561741588mr9620969pjj.42.1686614002174; 
 Mon, 12 Jun 2023 16:53:22 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:1995:7db0:daf3:2c2a])
 by smtp.gmail.com with ESMTPSA id
 bk17-20020a17090b081100b00256b9d26a2bsm9653465pjb.44.2023.06.12.16.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 16:53:21 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: ti-sn65dsi86: Fix auxiliary bus lifetime
Date: Mon, 12 Jun 2023 16:53:03 -0700
Message-ID: <20230612165302.1.I24b838a5b4151fb32bccd6f36397998ea2df9fbb@changeid>
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

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 34 +++++++++++++++++----------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 597ceb7024e0..db1461cc3170 100644
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
@@ -464,27 +464,32 @@ static void ti_sn65dsi86_delete_aux(void *data)
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
@@ -494,6 +499,9 @@ static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
 		return ret;
 	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_delete_aux, aux);
 
+	if (!ret)
+		*aux_out = aux;
+
 	return ret;
 }
 
-- 
2.41.0.162.gfafddb0af9-goog

