Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F76E987020
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 11:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DAF10E2EB;
	Thu, 26 Sep 2024 09:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="oCP5R1u2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB3F10E2EB
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 09:29:41 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2055136b612so8973855ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 02:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1727342981; x=1727947781;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4nTlJ8reywH+UC/jgM6J/PkAv8gFWsekGW6wrV9sFl8=;
 b=oCP5R1u2zKWpnlPDGVLNFjE+Bp7LIBVfhAW4b6lWxHwnskeAyTG3pgIggJUAplxAHc
 d658jy5ehS1NwrjWu4wej0PEFiTvOXIm/Yk7uBrExc9t3DKNXyYefXF1iVbST9SBiopT
 pxFiIcxGbWJ4oLROSDGhdgJaKwY1IcZmEJe6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727342981; x=1727947781;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4nTlJ8reywH+UC/jgM6J/PkAv8gFWsekGW6wrV9sFl8=;
 b=D39FHDbSvLJoYIdRo1QpnXDf8DHMvLcOsaC/B6LW/yAaqleDVHYqDwjXL+X2zK2f95
 rBZUvCnG2f5XStLPhntAYDdp3O8VPzb8mGwUBzg8A//r9L6ryC3ZccsDajnnTpTxNy1K
 RWa8YjJ5nY3jW/REVWHUAjXz3dyjuSqhLyMc57P6cs0fDEGFWFAPI8S65RIz6q2yKxZN
 jI24eKuJz59gBn+gHaC+etcMZXmDXcY4upLhjf66NO4Y6KIQ9NP+FIU3Z27bqgbygk58
 XqVBEKgNPSCriJjJ0n7Cb5MMb+Q4YyVitr/z0e6El54HVKYgtjzw7JKljL2sJjmbrrhl
 bLIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpKK1lupW3xHXdQFC2Kzjnp2USwQVRudqaWjLjh/6AW8AJzlA77FZNDg/6hA2tVuLjLVk2kLIUIgM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWR6grEiaoe68NO0/2GLwcSVU2P42cNaPxHD5c3T6QwURw/fHr
 3n8jR6peR2kgdARdb32w+EvD1DI48SuQ6CTUUx24W6QsBsn0hNJt48NMdVvdaA==
X-Google-Smtp-Source: AGHT+IEJGdzaJvD2oLJXYm0GdTv7+DhwanIXJf+yHPiigY6DhQrpoz5uhLKvyVCzsX1nrFaQy7M1XA==
X-Received: by 2002:a17:903:2bce:b0:206:a239:de67 with SMTP id
 d9443c01a7336-20afc435afamr79921955ad.18.1727342980725; 
 Thu, 26 Sep 2024 02:29:40 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:4234:cfaa:3b83:d75a])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20af1720b00sm34819105ad.64.2024.09.26.02.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 02:29:40 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Xin Ji <xji@analogixsemi.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 1/2] drm/bridge: anx7625: Drop EDID cache on bridge power
 off
Date: Thu, 26 Sep 2024 17:29:08 +0800
Message-ID: <20240926092931.3870342-2-treapking@chromium.org>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
In-Reply-To: <20240926092931.3870342-1-treapking@chromium.org>
References: <20240926092931.3870342-1-treapking@chromium.org>
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

---

Changes in v2:
- Only drop the EDID cache for anx7625 when it's not in eDP mode
- Collect review tag

 drivers/gpu/drm/bridge/analogix/anx7625.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 88e4aa5830f3..5c6bd7be25c0 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2561,6 +2561,8 @@ static int __maybe_unused anx7625_runtime_pm_suspend(struct device *dev)
 	mutex_lock(&ctx->lock);
 
 	anx7625_stop_dp_work(ctx);
+	if (!ctx->pdata.panel_bridge)
+		anx7625_remove_edid(ctx);
 	anx7625_power_standby(ctx);
 
 	mutex_unlock(&ctx->lock);
-- 
2.46.0.792.g87dc391469-goog

