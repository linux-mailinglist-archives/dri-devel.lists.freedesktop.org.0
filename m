Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1253C86778C
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 15:03:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EA210F1FC;
	Mon, 26 Feb 2024 14:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ioROAk6R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB0510F1D5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 14:02:12 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-412a87f0d8eso2799235e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 06:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956131; x=1709560931;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qnHZw5ifKCP/mPnI9SQ3FYZZamkSdSQAcxOif/txQYc=;
 b=ioROAk6RCTwfmgC1S6ovNs7OvAixzeIJ7v/YoOUJH1Q4q+UPvCDFWE2bSbDhn3ybOP
 WBKbAltb2EPQmR42X++7+g+AB1FQj9QDBYvrSpeVEh1k99VnZKxuD3VXco++/jnoxE4E
 yGnC/kpKjS+RQtZtDBm7yu4ZyTPE09/0fuLkawjuybfmw0Q6WUX0pUQhhwwDF6Ch/u++
 1XsdHp5Yhh9qBIYWmxoO1lRDOiRMjaP4W0oU4XkJEluFM2HrahfglNLq+Vk74279gWEs
 jC96Q+XmBHWy75EekFNBF3BNoPmrpXc3zpkf3kqON4ez2YWsNDjgXiM1EDB37li3KS28
 m6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708956131; x=1709560931;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qnHZw5ifKCP/mPnI9SQ3FYZZamkSdSQAcxOif/txQYc=;
 b=PEpOqN5J7RCkUwu9MK5hRAhFPFrShPUGzzXSrdpsxeeHC615rg3RjSY7oDZAqvWXKz
 DtuXnml5hghi2VuxJi0Ig9Sr9CNIShmJoBKYZenpJMmRr7QUSbu4uB8DGm8cqjxFch9G
 vDsGIHvEe6ayscfYzbHDM1fpYo1Ee+UCNW5+rKiuN5Rtr4F+LwgI8HNlKPM5TnnzFCK1
 u8SIq2Fb/BhLI7RdXRNntBobxhbPqy/+L87wDF4Qzjw2fb0sDuKP5Dj06k4NITsjNtM3
 ScMWD/QfzZqYvQoFYJfrt0KrfeQ9WsIf4z5/Cn3mhgeDvNsjRWsugZ99ZJM7ysLN2pL6
 yzLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmY/2iKeXgD5dnChNfydlBCbVZ15MndZi+bHZmh5JlYEzMiK22paiqQ1nT1W5pmQwO5Y/+EkvpNyLm30L65BeXFqXBKgThVnAb9NugBV1+
X-Gm-Message-State: AOJu0YxQKkCsYirP61pkhbtoCRc+4yPT8Ccoi3mUnt8mHk3vktRMn3C7
 HAe6+M47wME+34tHtEciOf2hhwqJqply0+aOPGp/sCC1Fb55cGhDqWnFDL3NNRo=
X-Google-Smtp-Source: AGHT+IGdWj7muzrLmYabNE+rgWx3rZZThzpeILTHoY5SoipoWCOa9p5u5DJq70C9u7xNKXoHsKM3OA==
X-Received: by 2002:a05:600c:5109:b0:412:610f:c2e7 with SMTP id
 o9-20020a05600c510900b00412610fc2e7mr5950589wms.41.1708956130954; 
 Mon, 26 Feb 2024 06:02:10 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 06:02:10 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 26 Feb 2024 15:01:41 +0100
Subject: [PATCH 03/18] dt-bindings: mfd: mediatek: Add codec property for
 MT6357 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v1-3-4fa1cea1667f@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
In-Reply-To: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=972; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=yRuLIf2m0xnCfvzLq9R/BcOzRbUE5cS2RXvKgyHfYpM=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3JncgGSS0C1k8gOGoK5RbBNCnTfpg0bIV9KdQMrF
 bRwkPGGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ3AAKCRArRkmdfjHURWryEA
 Cf9/b3stfOP6wQreJbNQ0rCPhRLBn+WoIe4w4DPE2zxO6lUqXMXUmJUd3l+heg+JAn0jmFRNiYLI9N
 F2TvTYvt7QNPnw9UXKo4OWGWEy9EO7zpZB8Q0PVOWmZ2ieZ27JnJUHlhsF/7T62mg6HkPedQdgiwVD
 sef+ZSBq7Y+Z3G+NHkYGOi9/2AsPI1Vp1xnghEP7CbOI+f5aa1NCafxiHSUh9c2Rr0kdHOyl8xI5Ta
 HX3bSltTsRR8Y70YCeAcQ8xya1d2AVqqjVUaNzCAygjkzV+staYy/hF9o/vMZLTP/EKEWzFFIdVTff
 YD+WnyAQONOe4yw6oQZPsXkl2IjgoVYcBDYU0dpckhhSZGFYbOFBMzrSBoCHNAkUl7latYHzKLG5Jp
 RZtpxshoYS05Fs4nJX2DaAL432pspBJelJfXahY6ZvH5n0P3qlepcF7qgRWJ/pNnqPr5EPbdWJ/9+/
 IIgyGi7BgJFu0l8JZcGNJtzPVQLXL6SD4mI+TKV/tRiDQGbEyFf+AxsdJRqvmLQF9/O9EYvdwPbVoX
 8ZL9CpzfyC5sj0By9DImYNw4j06R28Wb165soxMql11bk63bnj9m5G00bNNX+uvnUosowi470da3Gq
 /6SnaR1y8SJLrpdirZTURqAhwvNWjRouipiTsD53dDH3XnDvA0rFaM4LRNeA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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

Add the codec property along with the mt6357.c codec driver support.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
index 37423c2e0fdf..d25a78070744 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
@@ -37,6 +37,17 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  codec:
+    type: object
+    unevaluatedProperties: false
+    description:
+      MT6357 sound codec.
+    properties:
+      compatible:
+        const: mediatek,mt6357-sound
+    required:
+      - compatible
+
   regulators:
     type: object
     $ref: /schemas/regulator/mediatek,mt6357-regulator.yaml

-- 
2.25.1

