Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFE5959716
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 11:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF5A10E455;
	Wed, 21 Aug 2024 09:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="PiCMuAKr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58AC10E455
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 09:27:17 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-7cd830e0711so518984a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 02:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724232437; x=1724837237;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SpLoj/GHdJ90mGMNH9UOi6XZ//oOyZzmQ1SqbdjiU5Q=;
 b=PiCMuAKr9lKXMij94cbHbzVLrJTejSz/EDZpzfVV6O4ONMwLKq4tegFDeNMtcw8WXB
 i2YWd7EUfP3U903pSIX2mgH8PKrAjJI60Mm0O3MykooCD1+Te6o03ZPsK08/ImuO/7YI
 V5qvZ7u1X8fU58WOsp9IBKxKJS7RPuSjV8Ygs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724232437; x=1724837237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SpLoj/GHdJ90mGMNH9UOi6XZ//oOyZzmQ1SqbdjiU5Q=;
 b=ZO/wKgfdfIyzq0UYlV7uqAxs7q73DcGwCwvoh5O1BNa1dqf6TfgRiE3+tZbdg+jVDH
 abO0310sFsunlwljJyN4tVhlU3v2QE4kOQn5qpvVx8DfP5VdtYDIJfRUmZefVuZ2VBwN
 KbCPvR9mon0aTctE1pPBEeQ4TsR9vjn5sKAczMQhw25UEGqRRwqi9t7mxgomuroWSuNg
 Wjrxl6kUdsVluaX0XMX7E40ZY2+0oIj8kRaG/yC9sYE/6OAO7BxMKp7/HrCjmOIcoLTV
 tG7m0fKJZe1jxSVX0ST8OrDLdLcUnpetY0C/FzflBfj6Mv9qfEddnP8dl1JnyJYM3yne
 pRSA==
X-Gm-Message-State: AOJu0YxKcctb15pBYPHstpD+O+dBDWR0UNn74PziW4Xlhhk6uqeV6Rwq
 PhI6R8oJiYktYegEWATFHvH4HlcIE8yqAgTz2otIDBLWAHWwa5IwT2BO4+fP5Q==
X-Google-Smtp-Source: AGHT+IH2Uik2B9V5fu3Btspt6fJZ1exe9FDCGD9hvpgvwCy8I2HfWJgIXUX3gWybKSU8xAPUw5kyAw==
X-Received: by 2002:a17:90a:cf87:b0:2d3:d79f:e8b7 with SMTP id
 98e67ed59e1d1-2d5e995b72emr3035904a91.5.1724232436829; 
 Wed, 21 Aug 2024 02:27:16 -0700 (PDT)
Received: from localhost (185.174.143.34.bc.googleusercontent.com.
 [34.143.174.185]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-2d5eb8cf420sm1246810a91.10.2024.08.21.02.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 02:27:16 -0700 (PDT)
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
Subject: [PATCH v2 1/3] dt-bindings: display: mediatek: dpi: Add power domains
Date: Wed, 21 Aug 2024 09:26:57 +0000
Message-ID: <20240821092659.1226250-2-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240821092659.1226250-1-rohiagar@chromium.org>
References: <20240821092659.1226250-1-rohiagar@chromium.org>
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

Add power domain binding to the mediatek DPI controller
for MT8186.
Also, add power domain binding for other SoCs like
MT6795 and MT8173 that already had power domain property.

Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
---
 .../display/mediatek/mediatek,dpi.yaml        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 5ca7679d5427..864b781fdcea 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -62,6 +62,8 @@ properties:
       - const: default
       - const: sleep
 
+  power-domains: true
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description:
@@ -76,6 +78,23 @@ required:
   - clock-names
   - port
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt6795-dpi
+              - mediatek,mt8173-dpi
+              - mediatek,mt8186-dpi
+    then:
+      properties:
+        power-domains:
+          maxItems: 1
+    else:
+      properties:
+        power-domains: false
+
 additionalProperties: false
 
 examples:
-- 
2.46.0.295.g3b9ea8a38a-goog

