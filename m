Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943338C10D7
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 16:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FC610EA54;
	Thu,  9 May 2024 14:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aZlDbvvR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB8910EA54
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 14:06:59 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-346359c8785so651579f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 07:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715263618; x=1715868418; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wbWVkqkhZ2d0PkibWvpex0qMFtjGLxAjIIoCdT+E/c8=;
 b=aZlDbvvRsVifX9/2Lkae2KDEENlWF/sA+wnPWqPB9lNzhYsaXUr+Yfh9gz11AIBTQP
 fEAIkl19cebOtQRyHySlVqX9vSMxWprW6PxHQHvlZ3AGDXz7Vb0Dd7b+ywImxFN0ar05
 RvlC6NK5//MmU6PypnpEXCz1B3/nEWHh4LMCvLBI8jJlj13kaJVXddthnBGHHaPYkQ9R
 lc5OFFkMrpVxCOsMrPrlR2hSakRu/W7aV2TgDkK2YYcQq5HKJEpPxeojPEaz/mdRlQZC
 nLQ5f78ZnCefdClqxeXjS8gx0pkzHf0yRpPqLdBQBFQNbE0n6HgGEFwmrnW90KfzaTAl
 jIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715263618; x=1715868418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wbWVkqkhZ2d0PkibWvpex0qMFtjGLxAjIIoCdT+E/c8=;
 b=CoC02GFd6qHleoEPxpmJTcICg2Z1NgDQzcpveytxdaTlxyDFOS4z37fQ39nNfoT1pc
 ThkzuCiRRHVh7jX5zK/9eXJ7zscZeGLy5fvEU5SOviydFz0gM5LRBrru3377nQ4FfSVU
 4uGc3hfyoKIz0wDDhM/IX9/4mvVmWSZDYssLPYqKrVBC+50s5pzNFE/C9MoZ4xoU7YvF
 h4HfDDIh2fBOplTRUTI6AFNarJnnQ1A2ypw1atosbAx2geN6vTx+t4A/Y5ZQ80t1Rlps
 vwXQgMNYK0EeHXGmNDeoKbkm3w7u+pKUJRFwQRVk0LOPqT+B4+RW3KICF/dRsGd08MT4
 qQig==
X-Gm-Message-State: AOJu0YwqFP6ur3R1+TP5ikN7bK5qK6fR2xpCn86CCfq0YRL6yQ2NkDZj
 nuKkLP78s6WvZAqsADFwqigJgyL3ZbML/vVjytIHsqlvWb70yfY=
X-Google-Smtp-Source: AGHT+IGJGV6bFqKBadGxqXhAzkF2pE6cCKZpD95eQc6VzdGRYvOXM2SRAFICzVxoDStLNZJ7jxAXuA==
X-Received: by 2002:a5d:6e8c:0:b0:34d:8c1f:3194 with SMTP id
 ffacd0b85a97d-34fcafcd7afmr3768024f8f.35.1715263617622; 
 Thu, 09 May 2024 07:06:57 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:b44:d8c3:6fa8:c46f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502baad058sm1793311f8f.66.2024.05.09.07.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 07:06:56 -0700 (PDT)
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
Subject: [PATCH v3 1/7] dt-bindings: display: rockchip,
 dw-mipi-dsi: Document RK3128 DSI
Date: Thu,  9 May 2024 16:06:47 +0200
Message-ID: <20240509140653.168591-2-knaerzche@gmail.com>
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

Document the MIPI DSI controller for Rockchip RK3128. The integration is
similar to PX30 so it's bindings-constraints can be re-used.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
changes since v1:
 - added ahb clock

changes since v2:
 - revert added ahb clock
 
 .../rockchip/rockchip,dw-mipi-dsi.yaml        | 25 ++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
index ccf79e738fa1..ccd71c5324af 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
@@ -15,6 +15,7 @@ properties:
     items:
       - enum:
           - rockchip,px30-mipi-dsi
+          - rockchip,rk3128-mipi-dsi
           - rockchip,rk3288-mipi-dsi
           - rockchip,rk3399-mipi-dsi
           - rockchip,rk3568-mipi-dsi
@@ -77,6 +78,7 @@ allOf:
           contains:
             enum:
               - rockchip,px30-mipi-dsi
+              - rockchip,rk3128-mipi-dsi
               - rockchip,rk3568-mipi-dsi
               - rockchip,rv1126-mipi-dsi
 
-- 
2.43.2

