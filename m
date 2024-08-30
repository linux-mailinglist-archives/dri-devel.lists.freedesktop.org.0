Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBAE965C09
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 10:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110CD10EA42;
	Fri, 30 Aug 2024 08:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="HCRVx8XY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEF510E8AA
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 08:46:03 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-76cb5b6b3e4so996330a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 01:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1725007563; x=1725612363;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MG9yE55j5lJtqIWbVs9SHCJ5Kc9kTWgC1tP2vOkNljE=;
 b=HCRVx8XYxOoIAwtk5MkMTpsQsRBzDap96ddoy0q8Wg9gSbaJrGi3fND5mEhTg5ETEq
 qJZumSJNy/Mdmv+l5+Z2KtcKCH980HDjm6Ri7eILR7D/RCG4sKqh6YyZf5Ms2+jFgSef
 jeC3vHXAUoBD0qBHDMcGLxQkMiLO6Em5aummA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725007563; x=1725612363;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MG9yE55j5lJtqIWbVs9SHCJ5Kc9kTWgC1tP2vOkNljE=;
 b=OsMjM0YQqz0QevsEfkne/8Wo/CO8ix/KauFYCYSw10/gK5gJ8G85vKhbdmx79ii9Kz
 WSoee9LXRr3lgGXgnI1an7tfu+M8mcKkxPx7DCNwWq+9+E5qEo8uXMAX/1SBb7TBW1nL
 qDiqEZVNz5LKq1OP4hsKwyriWlx3kUxcFQz1xBmUPU4zJ6OFnR7t5QAjcBqy6glG9BUl
 5qHUZT2zmGQ2Z7xKWd5NDLk9eocYGrsGfwN6b/Mrvl1ymDEXvbtGKxyaIDIGludAikOx
 w6BYGG7rKuvThEeipHHTPATeJ4Y2xF6m4mcVYP9zhTtl/XmmzNLovJnPrW4GDAuOTcAy
 u6tw==
X-Gm-Message-State: AOJu0Yyc/nZhIJDeGsdeFINzAYSYY1ty9ubQ+fEMDIxLshfho0nWgrCb
 NyA9TAyiJHp1WOjfIjE4waL4U2hpFiIPasPmM9KBE/Qm6j6qRh1WCOp4Mptjiw==
X-Google-Smtp-Source: AGHT+IEc629GXImBuNOILo97YU6aaZaMx2RzjoxMwdEEvSYsu0H0uErl6hhdNvBxFRkjzwhSGg98Rw==
X-Received: by 2002:a05:6a20:d486:b0:1cc:dd3a:ed43 with SMTP id
 adf61e73a8af0-1cce100b087mr4623425637.12.1725007562833; 
 Fri, 30 Aug 2024 01:46:02 -0700 (PDT)
Received: from localhost (117.196.142.34.bc.googleusercontent.com.
 [34.142.196.117]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-2d85b0fdf44sm3192373a91.6.2024.08.30.01.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Aug 2024 01:46:02 -0700 (PDT)
From: Rohit Agarwal <rohiagar@chromium.org>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Rohit Agarwal <rohiagar@chromium.org>
Subject: [PATCH v4 2/3] arm64: dts: mediatek: mt8186: Add power domain for DPI
Date: Fri, 30 Aug 2024 08:45:43 +0000
Message-ID: <20240830084544.2898512-3-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240830084544.2898512-1-rohiagar@chromium.org>
References: <20240830084544.2898512-1-rohiagar@chromium.org>
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

Add power domain phandle to the DPI controller in mediatek
mt8186 SoC.

Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index caec83f5eece..85b77ec033c1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1843,6 +1843,7 @@ dpi: dpi@1400a000 {
 			assigned-clocks = <&topckgen CLK_TOP_DPI>;
 			assigned-clock-parents = <&topckgen CLK_TOP_TVDPLL_D2>;
 			interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_LOW 0>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
 			status = "disabled";
 
 			port {
-- 
2.46.0.469.g59c65b2a67-goog

