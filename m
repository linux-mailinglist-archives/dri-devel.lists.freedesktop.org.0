Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B548C10D9
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 16:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D533710EA6C;
	Thu,  9 May 2024 14:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lqmT7McJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F206010EA54
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 14:07:00 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-34dc129accaso625442f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 07:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715263619; x=1715868419; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CkypWPW9zjRDxFdsbSAq2JqA2c+afHrqHIvisMDjIts=;
 b=lqmT7McJxZiYjyMrrKEwpFZzhuU9CwQR9UCXHhVtfc26mmGzCpwK+l11Eie36Q/i0C
 t1blfH4Pr4ufHRuZWE4p5Gha770aKk0bSRzKo2qLUPXzsh7rCpgk3NR2Q9GiIjuMaT2J
 DOg1Mtcn99Vbq8jOlpPLgssOZPfzgy+wGQd+ErI1S2e6VBJ6x5WfcuzEwJZvB8MNfiE6
 lX8kq7msXBcVBgXKZRjSyu5RogNcUnP5uH568FGFc8caN6Bibxt5C5jlkOIKjoF5txGx
 Xn0y1t6xXrDJdzj4Oibhq0t4i2w/Yn38Poyg/IJaoA5TQYlVjQKCgI9cRzpsfq76/BRV
 v9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715263619; x=1715868419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CkypWPW9zjRDxFdsbSAq2JqA2c+afHrqHIvisMDjIts=;
 b=LYLCchitdiirAgxHTWs8/dyWl9ukFuePfZp03bUO4TKKxTOrecfbDI2sMzop8H0YkR
 oMLDU5S67rbpuudPSIGEFFE6tgm9Xkhc56u0x6LaQlGp1m0gW4mesREUMQhyQOBdI3Gq
 y+U4bg43oxdFzHEntjx7NqLDPLkETKfSTDtVA24i7HdvBb2Tkx0LzbKKa9LGp9I7XJVR
 s6RIRCOrE+9afzJscqmWjqmowCgoLrZ90f3w/zhaBwsFk1qMaol1u4o0p54i9jMWl1z7
 TUulJzkVGWxBzX4XNyNvTvrvEOSDBvWz07T0LtPieLV/6wSW5gNLz0tW+FW0sWbZ4MWx
 mr1Q==
X-Gm-Message-State: AOJu0YyOsoElSZI672n49Wz6PjDEJ20jbsKcA8q9NmhSJzFNEXWlrU5F
 FaOBl9dmfNwaN3BpNPIlm/1Uaq6Q7l404Kju9NrdPr1uC2eCO9E=
X-Google-Smtp-Source: AGHT+IFqb5Butmg/XL3s32gTYjgv+S8OXC4Ust9AbxM9joeLAhE7w7QJYm4NxRM4exE+Z+nqR7jOZg==
X-Received: by 2002:adf:e904:0:b0:34f:7788:37ef with SMTP id
 ffacd0b85a97d-34fca244116mr4586628f8f.29.1715263619359; 
 Thu, 09 May 2024 07:06:59 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:b44:d8c3:6fa8:c46f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502baad058sm1793311f8f.66.2024.05.09.07.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 07:06:58 -0700 (PDT)
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
Subject: [PATCH v3 2/7] dt-bindings: clock: rk3128: Add PCLK_MIPIPHY
Date: Thu,  9 May 2024 16:06:48 +0200
Message-ID: <20240509140653.168591-3-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240509140653.168591-1-knaerzche@gmail.com>
References: <20240509140653.168591-1-knaerzche@gmail.com>
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

