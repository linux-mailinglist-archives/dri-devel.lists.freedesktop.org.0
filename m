Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBB28BD598
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 21:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DCC610FBC0;
	Mon,  6 May 2024 19:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ql4xqxJ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8E410F094
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 19:44:00 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-51fb14816f6so2791823e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 12:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715024639; x=1715629439; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hiy2vL57H3KzFyuIeojalhw0sromROUcEPl800VpgDs=;
 b=Ql4xqxJ2goSPKe4vMODVb2KIBFZuUzf7B54TmqxvqsVWYkSeDwXkja1swVL5lPym7V
 qytp8w31KrcDsL/T06sznPNLEQe4ScWWdwTFlQbVFSES9E9uE68FLbwGhLqdnALJ3jGw
 1/qBIvRaaM8u8eaA+xiX5c38aB2Ti8yauyvq/WG3osifpmsUhzBbChRouEvKgqDqoo5D
 DyCZslpm5rSTiyd2SaiiEt6AghgBwt/M1in196Fv4VmHacr8z0FiNL/Eh8PE6Asmd3i1
 T9Wq/y1UbFB/2PpbfGUcZQ3RpvSyvZ1Vwtk/8FwF/Vhha0/ijmWbY/LWf4Y5y1r2R3XM
 VpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715024639; x=1715629439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hiy2vL57H3KzFyuIeojalhw0sromROUcEPl800VpgDs=;
 b=Mwg9X4TNc5CSj+jWpk8TEFYL0Z1CDpM1+8f6FQ0RzQ5MX8YTxkS3RyUJ7jTR+sWuBV
 Sim7An/430l5jEvs6FzRKBmQb0YP4IZ24pjdFi6l2sNXR6kq62rTSVYe9az5q1XUKisx
 J6b6QpM3WIiheNx/+EWzzT0uekSxNCDXsbn8OKDcM62FgfQAHiy+sSS7fQm5R5ztsGVx
 p6or2fYfcSYncL7ooQCd8ZVKs5zXjzwvh+0m6mFmT98zk7/kIZeGUOfwU1d88Ur/aQIq
 d/hj5Qer5wTB7LJU0xoC9TIGQ1/7Ir39RsSJGaBih56na5F2CKWxdnk4tkd63+OJIlX+
 pu4g==
X-Gm-Message-State: AOJu0Yxib2bBoXv5+YAfsTUwFmgUQB+QM7v7UJ10S38s6zECHNNeiSKc
 fTjUCvHD6gLqj8CX3W11ZahJ6VwzyXX8U57JRheeF5lCmFh5DfQ=
X-Google-Smtp-Source: AGHT+IE3JAd8h4TS07pAYS2PxovxmJduheJelK1ti9csXaOuNGCuxVp7c/O9qhjmBPiNhSTXCswuGQ==
X-Received: by 2002:a05:6512:2090:b0:515:9abe:6c46 with SMTP id
 t16-20020a056512209000b005159abe6c46mr6362105lfr.34.1715024638800; 
 Mon, 06 May 2024 12:43:58 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:1c62:e77:6753:5729])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a1709067f8d00b00a59d146f034sm1367321ejr.132.2024.05.06.12.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 12:43:58 -0700 (PDT)
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
Subject: [PATCH 1/7] dt-bindings: display: rockchip,
 dw-mipi-dsi: Document RK3128 DSI
Date: Mon,  6 May 2024 21:43:36 +0200
Message-ID: <20240506194343.282119-2-knaerzche@gmail.com>
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

Document the MIPI DSI controller for Rockchip RK3128. The integration is
similar to PX30 so it's bindings-constraints can be re-used.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 .../bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml         | 2 ++
 1 file changed, 2 insertions(+)

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

