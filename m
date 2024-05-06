Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCB28BD595
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 21:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A5C10F298;
	Mon,  6 May 2024 19:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S68yq1Ix";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8479110F094
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 19:44:01 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a59ab4f60a6so492271566b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 12:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715024640; x=1715629440; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yZPuZVUOkEjt2jKWfIEHf/5qiKMeNNTvIl6Wxm0Wr0M=;
 b=S68yq1IxyFUVrSZPTWsDpFlPfn60lxl3dbatCFb+mNPKZmvQV+0+i6TvxUpGXLDvip
 WWRD3C61d4hz4Qsn24ngqHv7/5NgkzKlg+jSjN2HMsLjVzqVPgxnNBY9qJ02zkGUkTQT
 87kTqaorw6uu5VjAMpZn8Yohr7sZUv0mIo8OrWohaLFmrFuimim7LksW6WbSRGBj2Abv
 zE4qRSxFu3pZZOc/IDixx85Wli+GWiUPUM1XmAJYMMJ8rf36NfgdbE+JNBwWpWVAZP2r
 Jk0O8kQptTqvf2d+Gg030hoXDheAMyrvg9BaGnzLXH9Xhen/qjXAbaaubcmS8qPciMv1
 BU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715024640; x=1715629440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yZPuZVUOkEjt2jKWfIEHf/5qiKMeNNTvIl6Wxm0Wr0M=;
 b=rRuW9IVdscFDfEfTc6VS2lkK8RthYoqY5ZJLO6bpMcocfo918ierjkA0M23WxaivFY
 wHt9jnqCwoBG4byXCh3nuXAOImIu2LXvhHlWxoeZIX1ZOGhQO/Vg5nwYIY3kqhiLnOOW
 2q5YZnqBRCBtUSVF+50a2pQr3ITSlvxc9On5yiVV5PMo1zci68ZYOOTICRHMxkjFMJRY
 24nSX6B3+rIhiJ6Spsl9z5yUNKhhEnjy4GsqqORXao+NWdFauP9XA7rf4sfkZlBlQT9p
 9iBHk9HPg+i84NDHLyRStxCod2mf3Z7mMUQeHqSIBCP54Vup6qiGKgxzJnVQJGaVQO3U
 mOow==
X-Gm-Message-State: AOJu0YzwZ8r41GSmi6ZQgEe2nTYok8loxMKmrRJUylR2nEX8E/uXbgLt
 ak8M2FGRph0xr/XX4Fob959QkRs0TWHlaqdKXRCMJVAmTIKWWoU=
X-Google-Smtp-Source: AGHT+IGnSZ98ZQbdnsdJyC90pRyVt1nr5YcSW20LHXMtpRatNPwIAZ0FaJwwj91H77v0m8hCBi2Kpw==
X-Received: by 2002:a17:907:6e87:b0:a59:b9b1:a1d1 with SMTP id
 sh7-20020a1709076e8700b00a59b9b1a1d1mr7115835ejc.46.1715024639700; 
 Mon, 06 May 2024 12:43:59 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:1c62:e77:6753:5729])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a1709067f8d00b00a59d146f034sm1367321ejr.132.2024.05.06.12.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 12:43:59 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Alex Bee <knaerzche@gmail.com>
Subject: [PATCH 2/7] dt-bindings: clock: rk3128: Add PCLK_MIPIPHY
Date: Mon,  6 May 2024 21:43:37 +0200
Message-ID: <20240506194343.282119-3-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240506194343.282119-1-knaerzche@gmail.com>
References: <20240506194343.282119-1-knaerzche@gmail.com>
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

The DPHY's APB clock is required to be exposed in order to be able to
enable it and access the phy's registers.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 include/dt-bindings/clock/rk3128-cru.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/rk3128-cru.h b/include/dt-bindings/clock/rk3128-cru.h
index 6a47825dac5d..1be455ba4985 100644
--- a/include/dt-bindings/clock/rk3128-cru.h
+++ b/include/dt-bindings/clock/rk3128-cru.h
@@ -116,6 +116,7 @@
 #define PCLK_GMAC		367
 #define PCLK_PMU_PRE		368
 #define PCLK_SIM_CARD		369
+#define PCLK_MIPIPHY		370
 
 /* hclk gates */
 #define HCLK_SPDIF		440
-- 
2.43.2

