Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5B1983BB8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 05:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2A210E4C6;
	Tue, 24 Sep 2024 03:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="f+sRnSFO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6968610E4C6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 03:53:20 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-208e0a021cfso24710955ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 20:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1727150000; x=1727754800;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K4JDPhYLX8gOFX6qvDK3s7d/UNCPkxhxheW4+MaLpxU=;
 b=f+sRnSFOKTayCtdsqVre07HL49iOAHG5s4Si7YgAAPE1vUTQiz51jkgrWPYhjqVtjz
 rbh0v4bN9MbwLwvbY/SVMb1pZlxnxBIN9DyuzIMB0xOmigJ5cGh9Y3k5RMgWUB/SvZEo
 pgWA0q1eryyzrEQ+zxgDmwwSNq9yKKLra4+7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727150000; x=1727754800;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K4JDPhYLX8gOFX6qvDK3s7d/UNCPkxhxheW4+MaLpxU=;
 b=bv6LgigWt17rrxDn52Snq+MG0FQRr3milIC3UjqXN1/YAi70aAiB/3zktH2+P0dXY9
 R70/+2GxLLz+frzYV6+MTHcAl1Xe60ND/vW5ro1Rxn6Uki1EQkOl4wdHjNyAPqv9q3zj
 3jvcD3qXVta7ljKF6/kIkbUqH3WJgQdmrtLObwmYYfTxloASH0giA2IDZ5ikzUuTTwnC
 PgGRRX/ofkLdCjjbTeNZUajgYbMhOaGhKr9z9QcyJmkG+1mVNo5+GoVe5oA1NVWvv2m0
 lub0oo/PzKBO1SdBcUtKS2XJWx/PzOgOW6VtmtySyGRpqqhWYhjLz4J4samy+kHB2Zda
 oVjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtQF1FWyESxdBkqvmLOPa0vSADh0XUT28Uq8wZQYCWVo+fi9UfeYpM7koiRKuEeg/anCiY+e/MU3E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRctybCJYb4ttjmUxmKql8m1o5MhXKmkBuUl7IpYVWI+0UjyHN
 QTlvKUIllIuXdqZ3EWXcI4qyMXq3O0lpBKeJ6wAeJw7s4+9zG5cjCLBo6N9er+jZnH5oyFT+ozs
 =
X-Google-Smtp-Source: AGHT+IFLuTTEL04yCULpYt8EVG3MEuP3tIFneXOCV6K0qCW5+TTc6vxsM21BR/5fxrk7lOFKauUFCg==
X-Received: by 2002:a17:902:ec88:b0:206:91e7:ba98 with SMTP id
 d9443c01a7336-208d8408162mr193275135ad.50.1727149999914; 
 Mon, 23 Sep 2024 20:53:19 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:727c:308e:bfa8:9ccb])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20af1869000sm2555335ad.307.2024.09.23.20.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 20:53:19 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Xin Ji <xji@analogixsemi.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Pin-yen Lin <treapking@chromium.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 1/2] drm/bridge: anx7625: Drop EDID cache on bridge power off
Date: Tue, 24 Sep 2024 11:51:46 +0800
Message-ID: <20240924035231.1163670-2-treapking@chromium.org>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
In-Reply-To: <20240924035231.1163670-1-treapking@chromium.org>
References: <20240924035231.1163670-1-treapking@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bridge might miss the display change events when it's powered off.
This happens when a user changes the external monitor when the system
is suspended and the embedded controller doesn't not wake AP up.

It's also observed that one DP-to-HDMI bridge doesn't work correctly
when there is no EDID read after it is powered on.

Drop the cache to force an EDID read after system resume to fix this.

Fixes: 8bdfc5dae4e3 ("drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

 drivers/gpu/drm/bridge/analogix/anx7625.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 88e4aa5830f3..b4c1f00f1c3d 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2561,6 +2561,7 @@ static int __maybe_unused anx7625_runtime_pm_suspend(struct device *dev)
 	mutex_lock(&ctx->lock);
 
 	anx7625_stop_dp_work(ctx);
+	anx7625_remove_edid(ctx);
 	anx7625_power_standby(ctx);
 
 	mutex_unlock(&ctx->lock);
-- 
2.46.0.792.g87dc391469-goog

