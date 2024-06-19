Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA76490F107
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 16:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E7310ECE8;
	Wed, 19 Jun 2024 14:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="szdqMLb9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC3D10ECE6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 14:46:50 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a6f9fe791f8so152147466b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 07:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718808409; x=1719413209;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8bNfBdFp5mZ2kI3ADKPWjh4YaxvbI3ApUdRoUcOWyZQ=;
 b=szdqMLb9ldlOvKNOiMol1WboqNqQAiQsGs7e9kra/TNPN4s5hNKYtt5kn9uqUC0WJN
 8hkL6le88q1EVKU0Y5nts8VMs2Q4RbVA7/vr5rNSzFvST085QPlwah97SY6ZcmOAwHH0
 m491x58rMjWQoV9bDBav8BoyyoC5eT0XkjRaj2rr0g94YntCbiUvYxx4efNj/TVq9aKy
 rPT1xi0Al8cUdGTRmUJedfDKOjFyNbSNPcIOZW239dG1KAFvixgFhhAWKdf1CXR5lAkO
 WKUG62/guLfOlCujXDAd0rtzv+5o0niBHb0BTyhrztfkd5FEqOlxejPxZXgCL1mz3Em/
 BvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718808409; x=1719413209;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8bNfBdFp5mZ2kI3ADKPWjh4YaxvbI3ApUdRoUcOWyZQ=;
 b=o1hhs05FWxvTlbxPUMxhBMUsS6bGe2z5NRT9T/ItrXlzpYtGrA9fBD2B4c36jGluCe
 +1f/6muPW1lRMNgiyI1ziJX6ZNMWHtE4m9AZl1wj7MnIDyBRfPSLW1kQIAMxKymXqTry
 h6zyioPOGZklZCCY1McYZxe8HdP914hjaNHPnVIoAVVdjHACLyEDEmPrLkfmJZuFJsnD
 f5/rADBywwWntkaX/MV2hOauNuc6KoV4jUViBQxZgcpb19M+ZcyrDTZ7AA03Oi6nPBuZ
 IUoGRzUt1RRhz+xYO00av0VZMmjwiFalhCELmktk7Sh9NTNzyB/oOPmQ9VZX1o72eb3r
 30jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+Ek85h7Nel3tXEZv5RaA8CHxDXBIU0exzcabV96aX7odFpv3vBXQ3uEcHBh+6q2roRLZJGEBGyuJSu9CM07oYSN8uSiWKMhx3YcEM1eUq
X-Gm-Message-State: AOJu0Yzh16XVI7RFuxxqwDMZRdJrlpFSQWi3LfePsPHf6g4w3Fp3CFQy
 4u4KShfjQ4egSZfRn3JXxzfTmio6eY4HlU0EzbAFrHCsTCvGjJxRKy2+HFd8mEs=
X-Google-Smtp-Source: AGHT+IEqbkgHHSkr76X0mYyJBfUpPDdN9txmatsoq3rJQUzm/9BdsMES9B/PEOaOBd6jfIHg3AGJ/g==
X-Received: by 2002:a17:907:1887:b0:a6f:af29:8d60 with SMTP id
 a640c23a62f3a-a6faf299090mr113414466b.2.1718808409118; 
 Wed, 19 Jun 2024 07:46:49 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a6f56da32c3sm679787566b.13.2024.06.19.07.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 07:46:48 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 19 Jun 2024 16:46:39 +0200
Subject: [PATCH v6 03/16] dt-bindings: mfd: mediatek: Add codec property
 for MT6357 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v6-3-f754ec1a7634@baylibre.com>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
In-Reply-To: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2491; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=SWDpxVosRWcwhcp5w5dGFmY/1KI8cAMYk3ck/hCfKf0=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmcu9QI0i0OiF8VYohADgb8z89zwTIuHnJGPKpXLp4
 Qxcv4WqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZnLvUAAKCRArRkmdfjHURVjvD/
 47o1wFtO/MX9Mn1jUZZQNx3N0YH/5/OHi7NghWuFvjOuv8lbyavVmqO4XxRjg6FXgHm36BstV/oZGC
 9FwTaixQpKNpb/clIOQV9JdHIYNxrTLva64korNqz2oUrR1LTubS2zelRWDSvKOv22pXPdV3P36FuR
 NWQaB/IzxKR33NgNb1Jhm3RKmkozk1NOu924V20WIHg6NIAXnEXgM7ZJ1exJtFyXy2xre8YKLg5JYW
 mFSpJoOEDvmaAp+WnNu4uAx6Buw2diS0Og/6PHy9Y+E2Y0TsXD5to7mfw9mJ0/VLduchVm1B4qaGV6
 xhthu7ePjErq/3euvoslGHaSS7fj18hJgQozXdIS4fJsHlZEnCbK8loJTbceN0pk61F1mFf3v/218M
 MY6mgLtbZt3GWOMS32pyWUvZ2TO7OLlYMDmknXyJ9Ixk2raSlHDJr6NLmgYdMETXyrYci+hRcLrHqV
 s3+b32VUtjoJS5EeyteW4/YfEYKjMi8p8a5H1BswAYyApuSFGO8D1vB1ELkFy6WExEQq1Z4NOjN55+
 Wy0+TzDIhmBXiXM02y5bOC4OCu9GS1brAJ8apQNFKhDo+yydxwlfB49gxa+O1j7JWZIqKiCbk33Jzf
 CtZdlPYmWP8n/ZMTIRnBLo7jfgADK8r9FFrMsAIui/aDrKdOmJt9nj+mD19g==
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

Add the audio codec sub-device. This sub-device is used to set the
optional voltage values according to the hardware.
The properties are:
  - Setup of microphone bias voltage.
  - Setup of the speaker pin pull-down.

Also, add the audio power supply property which is dedicated for
the audio codec sub-device.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../devicetree/bindings/mfd/mediatek,mt6357.yaml   | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
index 37423c2e0fdf..d95307393e75 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
@@ -37,6 +37,32 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  vaud28-supply:
+    description: 2.8 volt supply phandle for the audio codec
+
+  audio-codec:
+    type: object
+    properties:
+      mediatek,hp-pull-down:
+        description:
+          Earphone driver positive output stage short to
+          the audio reference ground.
+        type: boolean
+
+      mediatek,micbias0-microvolt:
+        description: Selects MIC Bias 0 output voltage.
+        enum: [1700000, 1800000, 1900000, 2000000,
+               2100000, 2500000, 2600000, 2700000]
+        default: 1700000
+
+      mediatek,micbias1-microvolt:
+        description: Selects MIC Bias 1 output voltage.
+        enum: [1700000, 1800000, 1900000, 2000000,
+               2100000, 2500000, 2600000, 2700000]
+        default: 1700000
+
+    unevaluatedProperties: false
+
   regulators:
     type: object
     $ref: /schemas/regulator/mediatek,mt6357-regulator.yaml
@@ -67,6 +93,7 @@ properties:
 required:
   - compatible
   - regulators
+  - vaud28-supply
 
 additionalProperties: false
 
@@ -81,8 +108,14 @@ examples:
             interrupt-parent = <&pio>;
             interrupts = <145 IRQ_TYPE_LEVEL_HIGH>;
             interrupt-controller;
+            vaud28-supply = <&mt6357_vaud28_reg>;
             #interrupt-cells = <2>;
 
+            audio-codec {
+                mediatek,micbias0-microvolt = <1700000>;
+                mediatek,micbias1-microvolt = <1700000>;
+            };
+
             regulators {
                 mt6357_vproc_reg: buck-vproc {
                     regulator-name = "vproc";

-- 
2.25.1

