Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B121B3AB80
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 22:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1F310EABF;
	Thu, 28 Aug 2025 20:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OvEUYswp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC8810EABF
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 20:18:20 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-327aa47c928so1078115a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 13:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756412300; x=1757017100; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Hkl96sz9Yr5LrUJYz+vvxi+pTvjsFIFXM2mejqnFZu8=;
 b=OvEUYswpKzVJQoLAN2vZkFDCqd8d2XcDgCfz5Ck37ZYEyKxhKP7WHzL75P7tuRX+2X
 AFKOWJhbkPBg6BVVeRhCUiJeO7tZs/cHNkqDny8X7052kPtsTpQuGragjm2eWS8JuMNp
 9Yf4A5URs2YEgH2bqd707OmB+YzFhE+BGxY80GxfK0k/AV7uPqYcqWod8EDx6wEpY+cc
 NDWIEdPMxl7zomSafmxjvOX1olw2M7imFhBXcnBCC0//N399xTFCt1ny1oRzi8RukOCH
 khBnSH+4jO9NSrtpnRwa9Io74/2znjBSeoRCmiWJyQN/GeQULcH8c5eXVZ161fr+byDj
 mvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756412300; x=1757017100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hkl96sz9Yr5LrUJYz+vvxi+pTvjsFIFXM2mejqnFZu8=;
 b=czPEikoYDuufXUZl1QSaqFLEfWX1P9LeKeeLHNfDlM9rqA9040BSTDApsFeYjglpLY
 Aak1LHYi2jJOcngnbVTRpr3RNI7Lh8kUOocGbTmyYW+qi7t4TxqovC4e5R8Ll6tEVVhQ
 tqRNxa+mMCVPf4ps1U5o3XKekzTvVdRXj5/wXCfUQM/E9TnceQp63Czdc8RJKANKeVel
 hbSizta1y3aS6GB4R7ADJJbbbfvy+0IRS1gSsxnrWyoS9OdIjjMCdDFvEyJzTnnGKAIc
 hR438b1KijqL+B+6tUx5SXd9N2OaDzdwilQTI1MMI4AZcv/wBtCi+5gsF4XjWiuNyEp3
 LE9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrit1jpgCljunQNR7HtcKeD/KrjTaaHz2nXNh88qy5yQL6cqoHFLkMEo0/xjzNNVq2xcducKioagw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRjuqURQhQ6Fh7iC2o3R3b44JYdh4DHsm9O5xCdyiBJ3dlQvOp
 CjT0B7jZD3rd64F8j3gR4c6wLvS3wT83xAep6jwRA7e/VvZp/VREF4gO
X-Gm-Gg: ASbGncszrNREUbOgUmBa/DgZol2upSkvVCQM2UU8eYpIs3YizJGU01Gyi+dBxHo+tfJ
 aiAcDEy7LVqzg69CBvO8Zm5IOORssFMVIlKLxh/zVAlLL4TA05wjdqpYfsgKRo8jYjag90mJ3Lo
 rw3u7hDBaXRPBJ9VQM2Yqs45rPqc0Y2XUcRqUVBdmYvV50HTi1ajSHZOHdtkAf/ETX5whRqm4oc
 1BeP7gh+5txE+5KkSQtAdrorsqmEiBw4pXZPH/8utD4AQGoGHRpnFp23dT0MsNtM2jAn1cq3xbQ
 3Lhr8nqOpdfmGKKfquuBNNzAcjxq47l33G02Oa27ZtN5ZDf19IdDNGu1wKrX30EZh2w9iuj1o1z
 c78SWpZGRMWxmqk4hJECKxuz4nUQdWKvyKqjql3auqCKNjc8qRL2cyALtEXmj/fSf
X-Google-Smtp-Source: AGHT+IFNi8pMmnxtxmZvYnJUxy2Z820GYeE07V0AvaK8tiu/72Ud4aJE4Ze/ExduFiegC2/RegxJKQ==
X-Received: by 2002:a17:90b:58c8:b0:325:5229:8610 with SMTP id
 98e67ed59e1d1-3255229874cmr28385877a91.6.1756412295756; 
 Thu, 28 Aug 2025 13:18:15 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-32741503367sm4540727a91.0.2025.08.28.13.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 13:18:15 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: gpu: mali-valhall-csf: add asn-hash
Date: Thu, 28 Aug 2025 13:18:05 -0700
Message-ID: <20250828201806.3541261-2-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.318.gd7df087d1a-goog
In-Reply-To: <20250828201806.3541261-1-olvaffe@gmail.com>
References: <20250828201806.3541261-1-olvaffe@gmail.com>
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

The values are written to ASN_HASH[0..2] registers. The property is
called "l2-hash-values" in the downstream driver.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 .../devicetree/bindings/gpu/arm,mali-valhall-csf.yaml     | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
index a5b4e00217587..258bcba66d1d1 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
@@ -85,6 +85,14 @@ properties:
 
   dma-coherent: true
 
+  asn-hash:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      The values are written to ASN_HASH[0..2] registers. They affect how
+      physical addresses are mapped to L2 cache slices.
+    minItems: 3
+    maxItems: 3
+
 required:
   - compatible
   - reg
-- 
2.51.0.318.gd7df087d1a-goog

