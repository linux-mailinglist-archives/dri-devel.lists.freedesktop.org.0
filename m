Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06150765079
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 12:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA9B10E564;
	Thu, 27 Jul 2023 10:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F5A10E564
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 10:01:37 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1bbd03cb7c1so4603395ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 03:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690452097; x=1691056897;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CARYd8ARiLxF5jPoq3PGLDFWv0ljfFGEfqeFhyIpcRU=;
 b=dXLsqrrNBLBrIkAdUcLisQXUAPad2iWVIeWLiXeQ5I42iC0MjkrP5YTJkR0zFEtBA0
 /23ZdFidAHj/23+wehfD9Mt2fqE1S/bvOuiIusc/QWGl9pIoOk7VY3MyuWxayS0RcDNv
 R6Hpu+9pJQ6345N/VjPCBdurYfmFD0RhkwQr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690452097; x=1691056897;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CARYd8ARiLxF5jPoq3PGLDFWv0ljfFGEfqeFhyIpcRU=;
 b=fQ9/b+zZ4GS8mUtdZANplXTVEw1RyBImdvyq3ZEQRMP6kAB3/zGeRYSzoA7LqYVzgQ
 bnKUFgUTPDl+/zQPbXP4xXqQ7cVis8yYkiaZxAb92RxlP7BL5yDtj2w9UyKn/1MT1Etq
 VcJN0af50msMh0gifoHc2/kxvlxuPqW1QOK2B+csaNsB4ii6QnumyHbPxqUDr+xy8j6/
 oRTZA6Qqz9sW8s7m8PBAnSMO2Rke/RywaVWxYtxxag/4FXQb1Q5tzPYKex6muM34CSEf
 /d7S6SFB3wEI16EZpTH6upzwvJDfTtxH07VAf8r7ohflXO5Ixa5gYoutjQcJpm16yPWa
 k/nA==
X-Gm-Message-State: ABy/qLa/ObQb0ZGgur0MQxKubyI0SLeNq/uYJVDmJRbJoH6v0qA7abX7
 B7WxQJij14Y8GcqMaog2omZDxg==
X-Google-Smtp-Source: APBJJlFY40YO/cks4NQsjjmQjn7CZmUmhVYqeVRxBuQoVSYFcEa2b1lCRtUalXLwI4oMULKg21fNhA==
X-Received: by 2002:a17:902:a9c1:b0:1bb:77a0:33e9 with SMTP id
 b1-20020a170902a9c100b001bb77a033e9mr3583731plr.58.1690452097090; 
 Thu, 27 Jul 2023 03:01:37 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:dc11:8e9e:95e:4068])
 by smtp.gmail.com with ESMTPSA id
 jj6-20020a170903048600b001bba7aab826sm1199913plb.163.2023.07.27.03.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 03:01:36 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge: it6505: Check power state with it6505->powered in
 IRQ handler
Date: Thu, 27 Jul 2023 18:01:10 +0800
Message-ID: <20230727100131.2338127-1-treapking@chromium.org>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
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
Cc: Pin-yen Lin <treapking@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On system resume, the driver might call it6505_poweron directly if the
runtime PM hasn't been enabled. In such case, pm_runtime_get_if_in_use
will always return 0 because dev->power.runtime_status stays at
RPM_SUSPENDED, and the IRQ will never be handled.

Use it6505->powered from the driver struct fixes this because it always
gets updated when it6505_poweron is called.

Fixes: 5eb9a4314053 ("drm/bridge: it6505: Guard bridge power in IRQ handler")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

 drivers/gpu/drm/bridge/ite-it6505.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 6c2fcd8b8780..2f300f5ca051 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2517,9 +2517,11 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
 	};
 	int int_status[3], i;
 
-	if (it6505->enable_drv_hold || pm_runtime_get_if_in_use(dev) <= 0)
+	if (it6505->enable_drv_hold || !it6505->powered)
 		return IRQ_HANDLED;
 
+	pm_runtime_get_sync(dev);
+
 	int_status[0] = it6505_read(it6505, INT_STATUS_01);
 	int_status[1] = it6505_read(it6505, INT_STATUS_02);
 	int_status[2] = it6505_read(it6505, INT_STATUS_03);
-- 
2.41.0.487.g6d72f3e995-goog

