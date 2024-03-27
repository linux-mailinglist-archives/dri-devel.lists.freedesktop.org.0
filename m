Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC3D88D9A1
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 09:55:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B8A10F979;
	Wed, 27 Mar 2024 08:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="mTntEdRx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF2D310F972
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 08:55:07 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-6e6b5432439so5024361b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 01:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711529707; x=1712134507;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9dKcZjC/OoDiaM+OdJQAME/VGMT+Uf23GJ2KQctLAZo=;
 b=mTntEdRxjMLIkZUa1dvFUuILmIcm7kD6A7qEvBMu1V0yETMi6WfrDBisS8ket1t1xc
 ss0Mh2Fe1G+k1RdYlKpmIUgzOVLCCM9IHdMJxUkwUWUK5JMj+IOWmX0w3AecLfcqS/Qs
 /iBESctTwYIutIXWPl1pgP2SxxbXG4TWQyFkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711529707; x=1712134507;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9dKcZjC/OoDiaM+OdJQAME/VGMT+Uf23GJ2KQctLAZo=;
 b=uLNSw83SpdPxgLlGmI1IqJW5j5Lr0AIWAVe7hUJkb5awC82NFHDu8mpvyHWMWs0ET2
 upYjDpgr0zrwHhRYGB3CMJLUdRMhi320khf1AzePtsEAeRgatvz8/2OoHBr3bBZahaBa
 z8/m5ly+6rL2VEzw2VOGSrr1bwWbDFwCsRVkzLe7ZjMAmF8qx+BNeUDIs6rdjDXhHuuG
 BAHu6GNn0V2OOOgA2p6hZ0nLeN3BNVO4Hu1C8jTV2ptDE5f4RNmkaymRh958qwFZJ0fv
 ay97RqzorzMr+U+DP1sZQvViGBbAOKJJAsejw7D7vHuNB9q0vbtSrt6Goud/kLF4OcF4
 cCyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHvXEzOt9nfKGX/WwISbMyzHsoZhxEkfS43kOjrGuS8ZjFIstUHAjQQW/wjOkyRz0bw/ukpsraM4l0qWgmbj0Qpyc4pEED3CisdWgnXWYl
X-Gm-Message-State: AOJu0YwMp4XQD98ajO8mVke6eOqTAqIktpiM1X2BJjkWvrM93BM61lbe
 dJIXLN2njK+E4PRxtyhvzfWVgos44afrcu6bqK+G1Q59wHxIzhQGmPVjaBwdNA==
X-Google-Smtp-Source: AGHT+IFUfIVQvdLysyZn334SAY0D7Vx2KrUYwFkbjwbnUAsEt/qwEP0DXbUtpROi/ojeOIlZdyTbcw==
X-Received: by 2002:a05:6a00:b48:b0:6e6:946b:a983 with SMTP id
 p8-20020a056a000b4800b006e6946ba983mr4563684pfo.10.1711529706853; 
 Wed, 27 Mar 2024 01:55:06 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:74c2:3606:170b:52f3])
 by smtp.gmail.com with ESMTPSA id
 h7-20020aa79f47000000b006e724ccdc3esm7329514pfr.55.2024.03.27.01.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 01:55:06 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: display: bridge: it6505: Add #sound-dai-cells
Date: Wed, 27 Mar 2024 16:52:48 +0800
Message-ID: <20240327085250.3427496-1-wenst@chromium.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
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

The ITE IT6505 display bridge can take one I2S input and transmit it
over the DisplayPort link.

Add #sound-dai-cells (= 0) to the binding for it.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1 [1]:
- Reference /schemas/sound/dai-common.yaml
- Change "additionalProperties: false" to "unevaluatedProperties: false"

The driver side changes [2] are still being worked on.

[1] https://lore.kernel.org/dri-devel/20240126073511.2708574-1-wenst@chromium.org/
[2] https://lore.kernel.org/linux-arm-kernel/20230730180803.22570-4-jiaxin.yu@mediatek.com/
---
 .../devicetree/bindings/display/bridge/ite,it6505.yaml    | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
index c9a882ee6d98..c4469f463978 100644
--- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
@@ -9,6 +9,9 @@ title: ITE it6505
 maintainers:
   - Allen Chen <allen.chen@ite.com.tw>
 
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+
 description: |
   The IT6505 is a high-performance DisplayPort 1.1a transmitter,
   fully compliant with DisplayPort 1.1a, HDCP 1.3 specifications.
@@ -52,6 +55,9 @@ properties:
     maxItems: 1
     description: extcon specifier for the Power Delivery
 
+  "#sound-dai-cells":
+    const: 0
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -105,7 +111,7 @@ required:
   - extcon
   - ports
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

base-commit: 084c8e315db34b59d38d06e684b1a0dd07d30287
-- 
2.44.0.396.g6e790dbe36-goog

