Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 324329084D4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 09:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1840B10EC6F;
	Fri, 14 Jun 2024 07:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CT7dEWrZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498BA10EC5D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 07:28:07 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-356c4e926a3so1864444f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 00:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718350085; x=1718954885;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8bNfBdFp5mZ2kI3ADKPWjh4YaxvbI3ApUdRoUcOWyZQ=;
 b=CT7dEWrZemv4IhmqntwmWpisUpJjJ8mLP+7keQ2bKCRhwGMAKIZnvzPgk+Fr8AFnyD
 HkManDVBpLMB90g9TvNFpDtOGwIiscoRYcqBQwrWv46uOs0jdozySUXgnfC1yk98P0cb
 f0ZNTPAVpmnt45LICKimJaCkMZZ0beW3tYlEAbofK5hMGZIu6IIGheyalzZo5iNXNOhO
 0DMXoXwOe3lBLjcKmRwqCq2DseaHdxg36mv99jgKxYqUFmZ5edU/4yKPhbyMYD252doA
 NR8VfM3ccptSPlz82BysV6LUAqziHlo6Z2hpu03GcPA0bcmD4F9ysymg30XvOtcoIIdP
 /osA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718350085; x=1718954885;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8bNfBdFp5mZ2kI3ADKPWjh4YaxvbI3ApUdRoUcOWyZQ=;
 b=Sfe5GrZYkybKM0HSIO6IMICdB9Gry8oS/ZvA6n3TqLqFJqR44uodOI4iw5QWmQdoCU
 7nlfUqGzR6mAbOsz5qR9rKzfbj8Z2bqAe7QnU2qwMNHz7pC+rrM+XP4FMscq6I6QbViU
 cYAsbbG/itdpkBUdYb/K23dPCB2MOzCBMruV+oFkWlZGVlViYmfzuYiok8dwvL+m405+
 wddx93++2wnRGBaPBmuVqCH0CSVIGlvOdxdJJugrtbiY0VtxN4eHy3a9iahq+3TuSakl
 67AdAq1nJ3CmlBBj5InqZiZsqfGqGPJH2xJxnFUlvL4cgtWVnj5L8z+ES7yBctzFz4VG
 m6pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgyNn3Be1m3AD7LjnuiITLdnqIcrlcpw6wVNABoHimLmeeUdMN7z8u5suyRrDe3Ksjk7tv0FZAh7mqHp7O4roHxglq/sR346vWDWB0M7ia
X-Gm-Message-State: AOJu0Yy7FgYfEqAgIhfwy9izE+eLrtN7jq2RUOADGppjn+pPN/HF7y37
 fvgklNfSkjT6dA1ui9VuIhFYrz+ApDuLfOwuN2rW3fBbFI5tBtJ3SqBcTiKgJqw=
X-Google-Smtp-Source: AGHT+IEJND1fq1c0uKqBp70d1/dGzZI9xAGs92ktXXTGZKoDsZNDhRjzQbdqX2LqrYMoStDa7YrhlA==
X-Received: by 2002:a5d:69c4:0:b0:360:85d0:3c86 with SMTP id
 ffacd0b85a97d-36085d03d20mr176336f8f.6.1718350085366; 
 Fri, 14 Jun 2024 00:28:05 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-36075104b2esm3535773f8f.101.2024.06.14.00.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 00:28:04 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 14 Jun 2024 09:27:46 +0200
Subject: [PATCH RESEND v5 03/16] dt-bindings: mfd: mediatek: Add codec
 property for MT6357 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v5-3-54827318b453@baylibre.com>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
In-Reply-To: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBma/D+I/oKQQm6/M7ruRFFizPFoZBPidH22eCRZMP0
 T2UcWeOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZmvw/gAKCRArRkmdfjHURdZND/
 4ylZ5IPjy/OzFOUB5PNaiFxsROAj8BRd6HcqJlZ/2ZUC2mfkXuXbBugwiP1VFhFowX7vkMBEs+NHA5
 VXIIsNhRUhKOslkiex4Olf5lQLp5QC8SXUTK3mESQ4I05ZRkCeunC6AfovEfD1iBxTVVdRoFXWK1Pm
 9QPu8EOCgbTiYrdcCKvSVbQ5ptTP8gUJE3b+R7ZnCxpXjUYnm/1g9DueJdCyC8fkNLML9b3oRKimpC
 E8UDv4drqCLmiQoITi5kAzkyGGIMOQpvHmw4JEopQZw93Nr/HtQ9gyAUy49GlqeSQydzINPTXnRbn0
 //VyP+7paab5PWOpt+Mfw/LZxWLzX56r0q96ZUjCt3rsbv0UeBKDNQ1qLXWHJ9Ow3hfv7MV3E7/+6V
 w3RqXLQ5Vq5ePUAY0Zgt+DJexy37wmkm8cH7wseXvQ6Am4X+XErXOd27NazXPKa+t3PuwF8umW1SRz
 R8PiEHvn7pnhRqtKY20Ixabqz2aI1gBIePkL6+q3KdRgXf8AumZ0VQ/JwGMEe23sdtsxsF6oAK8wct
 ubSpR4kJDobcgaLpB+CA11yhBhwdIdNnuLbWzhnPEd0+bgftmcmch5tFsBW+JvnHblWC6GCDUZRcCi
 bv70RD0njpP+E9yRWCpE8nhql4GtPTc0J/f4GPTaEuhe6iso3d09S5tKtYaw==
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

