Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 368428C0F35
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 14:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CC410E4A0;
	Thu,  9 May 2024 12:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CNSAu6dC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B629110E110
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 12:07:25 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-51f3761c96aso999150e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 05:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715256443; x=1715861243; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CkypWPW9zjRDxFdsbSAq2JqA2c+afHrqHIvisMDjIts=;
 b=CNSAu6dCdK6rs5er/r7u9nPTBz71Ot3gQy+CjbuVuy+YtcyK5IdiGo8+sH6vjmEXnd
 XDN2/ohLJRCXygfbTfz6JawZ/EyvVs2fQ+DB7g2OE+cWcDFwCqPUe0kawQah9Q0wmtxQ
 4eHL7LhNnQK8s8/aKzzrA+EhPBUqzwlVknWu4zef595ufb4eV/2CsR6QTTPmQrE7cn97
 wQmMhnPv/u2k47nZTooG7aw+fdtgeab83BglcnoXkbJLvvI0O+1zHEGRQZps2VMgNjEI
 te1kGGJ/ISvqID59M2m3+V34zOUU1nvNnDbUPBw0PoOJbv0RWe61Eu0t83kZTSFio6ot
 ggxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715256443; x=1715861243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CkypWPW9zjRDxFdsbSAq2JqA2c+afHrqHIvisMDjIts=;
 b=qMNJ5JQzbp7/pO8RqdevCTq3I1mHjXGkDF64URTcamoZw4gCzs9Dl7hP7PjeCXniP0
 wRiyNCKcFbhqqTXWEMpg/FSEeQFCFU3MkqWD+GG0z78H6/UYAKDEPI5irMmSF4t3eu9h
 u6eCChwqJ0/4ILejP2XcPhJ+OsrMpuC09Z2nrq22KGHmO+3oTDHzv+gGRb3dBOo59Cgw
 yJbDalWBNzDRKOEpQyofe2JQlvxXNyajw54mu5UyLsr5Q1LFVoAW3igrP2zduGNl7n4m
 RDDPi0/lz/ARDHF2wpmlLTYfsPWZcq3sCgkL0nhTjjn5jbURGLI1U5BWoZCo+t6HUoIT
 BkaA==
X-Gm-Message-State: AOJu0YyGwFflKLP+VbuOjwtRlTy+/rT/dQrWS2Y3uasudlCzItGXJtDI
 rAyrf2aTBVp+WQRCkca22IQso93LPu0pZ4LbX0qe+lnLaGWPf0Q=
X-Google-Smtp-Source: AGHT+IHys9c5rfgObjKdpLe0taBmnOFFOHsrH8dMTFsMSmyd7UfuBmkk0BjGCiFKBOXChJJYLuzTew==
X-Received: by 2002:ac2:5388:0:b0:51a:e305:eb20 with SMTP id
 2adb3069b0e04-5217c567012mr4863974e87.17.1715256443303; 
 Thu, 09 May 2024 05:07:23 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:b44:d8c3:6fa8:c46f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccce1912sm24112005e9.11.2024.05.09.05.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 05:07:23 -0700 (PDT)
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
 Alex Bee <knaerzche@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/7] dt-bindings: clock: rk3128: Add PCLK_MIPIPHY
Date: Thu,  9 May 2024 14:07:10 +0200
Message-ID: <20240509120715.86694-3-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240509120715.86694-1-knaerzche@gmail.com>
References: <20240509120715.86694-1-knaerzche@gmail.com>
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
changes since v1:
 - none

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

