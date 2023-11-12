Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B21637E920A
	for <lists+dri-devel@lfdr.de>; Sun, 12 Nov 2023 19:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF91510E151;
	Sun, 12 Nov 2023 18:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9614110E14E
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 18:44:13 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-5bf5d6eaf60so38127137b3.2
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 10:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699814652; x=1700419452; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LKapjGZo46m2u3Pg+KgGkylJklW8QTl7gfgNZK8ZJCY=;
 b=VclV4zzqL1NMjqfq8honTpAqE/Ks6ax7YvvBMcqu4T7pNAlnLkLVRIjE6LCeHgMKAM
 7Dwu/C8n5PqbmgmceIo9u5WSbt3BObx8L1+GeHkZK1ayq87rE64S9qDZP2tmlK5l9xIX
 gbIyYkFMcfANTCNiOFYnAP8AP7yhBO6FE7JYiwR8hD/dh0YOf4gckVpvZFrBopi7TOUT
 dyy9WnqQkAfOs8cVmIfGIcl1qhsl6CeB5yYDLDlnjveicUNHt4XNvDP5X923T21L7EYV
 aYXJj1swFd3c/QFg/XhzGvhxZTt1zPRoX7Rtr1AghSv7USWscphFqWVNM7FAYWQl1Lb9
 gs4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699814653; x=1700419453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LKapjGZo46m2u3Pg+KgGkylJklW8QTl7gfgNZK8ZJCY=;
 b=IH/SbEUUjgInF1XX4/1oca4EucPy11gIa9ujSBhCLyfCU6cAMYAzsViyFYCInUy+TI
 ltaJoFEn/9m2s35BkSD2Wh/8ppO+Cja3UNNtx0oa3fpuycPnXdAKVbiWqqMep+T6QsQI
 7Fs+K0XgFVpgSxr956X3QLZJp/8DZ5WKk2PjQbCxcM4ItkeQ/bjv9ETtPX8E12i7ZcLL
 H/7Dh5lQVVXzH7wfmOF22DbFeoHVFuDZkWUrR/53iMoojIrcC/UmHrFQPF0+0n9u+meR
 1SO3N2N3RiGu5ELtzzjbZeek/fmzbQ1eqOAZuBwhlgeFjR+um51vwIc8hQKeNy3lmZRr
 OlUQ==
X-Gm-Message-State: AOJu0YwJchsd91/Ee/NzeHIWHMSZiLUPAn2A5mftMLvxZxwMTta6UhDO
 qNqXBnrCUFT7f3a1ZHF5aAHhpg==
X-Google-Smtp-Source: AGHT+IG6jLEwOvsic3zim3Oi0DQNKZCCpaWpZotIRjhbW1JFP57Ypl6v3EbQBFpfe1K3LZKV2jWSMQ==
X-Received: by 2002:a0d:ca8f:0:b0:5a7:ba54:af02 with SMTP id
 m137-20020a0dca8f000000b005a7ba54af02mr5340230ywd.38.1699814652746; 
 Sun, 12 Nov 2023 10:44:12 -0800 (PST)
Received: from krzk-bin.. ([12.161.6.170]) by smtp.gmail.com with ESMTPSA id
 u63-20020a0deb42000000b005b3f6c1b5edsm1308938ywe.80.2023.11.12.10.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Nov 2023 10:44:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] dt-bindings: gpu: samsung: constrain clocks in top-level
 properties
Date: Sun, 12 Nov 2023 19:44:01 +0100
Message-Id: <20231112184403.3449-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231112184403.3449-1-krzysztof.kozlowski@linaro.org>
References: <20231112184403.3449-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When number of clock varies between variants, the Devicetree bindings
coding convention expects to have widest constraints in top-level
definition of the properties and narrow them in allOf:if:then block.

This is more readable and sometimes allows to spot some errors in the
bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/gpu/samsung-g2d.yaml | 10 ++++++++--
 .../devicetree/bindings/gpu/samsung-scaler.yaml        | 10 ++++++++--
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/samsung-g2d.yaml b/Documentation/devicetree/bindings/gpu/samsung-g2d.yaml
index b6951acc7643..f368966cf83a 100644
--- a/Documentation/devicetree/bindings/gpu/samsung-g2d.yaml
+++ b/Documentation/devicetree/bindings/gpu/samsung-g2d.yaml
@@ -22,8 +22,14 @@ properties:
   interrupts:
     maxItems: 1
 
-  clocks: {}
-  clock-names: {}
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+
   iommus: {}
   power-domains: {}
 
diff --git a/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml b/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
index 97d86a002a90..e08fc1e4115f 100644
--- a/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
+++ b/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
@@ -21,8 +21,14 @@ properties:
   interrupts:
     maxItems: 1
 
-  clocks: {}
-  clock-names: {}
+  clocks:
+    minItems: 1
+    maxItems: 3
+
+  clock-names:
+    minItems: 1
+    maxItems: 3
+
   iommus: {}
   power-domains: {}
 
-- 
2.34.1

