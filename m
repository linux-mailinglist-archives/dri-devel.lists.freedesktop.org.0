Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0936938923
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 08:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122A010E381;
	Mon, 22 Jul 2024 06:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1SB83/oh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A61810E37E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 06:53:42 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5a1c496335aso1514158a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2024 23:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721631220; x=1722236020;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a+Cj7XwFFzAC2R+vJ+C1jfJoPbZ6EO8weZS6/aNxaN8=;
 b=1SB83/ohqVHgZGp0FZKUWRtDtVhaoJNIuWYF5RGJNUjPLt6sIA0QaJJflm0xBJKCzz
 QWyMxxggdXyn5WtkN/lOo4MKajnRGWJMohjUlH/H7/y8C91IrCvyOhBrhZ7eeqnkT6sU
 xxgw2q1JqV/Kw8GGW3m7JhWnKERSXzMuZ9hZ0ahqgcvVmfn22kSf2wHa6AQ/yXz8n3f5
 Tz5mfXnTD6i/O6ctjOzhUWw5wXOS8KWAB73Q2w0uZbtqg1+7xe5C1YdIHr7aAvRZjLbC
 niS6nU2nfbN1dzAeTR610ozSFaFauL6o7sqUtEkJrtX53CGhdsK58MUn66td37Jh1frk
 mbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721631220; x=1722236020;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a+Cj7XwFFzAC2R+vJ+C1jfJoPbZ6EO8weZS6/aNxaN8=;
 b=AKFVS+RUoZzW2NZie3d/D9IT4k4rs1OpnHl4ntKoMfmkOAASkrxSy5Lk7y2JL1j4vE
 ajk0ZC9A/5ItylKMMSVNEPReJNvagr2+k5GHbVApgyv2OV/XcVXGR8jINOAFRCzTbdml
 zKnDFA/slbjbMzBuRTaoKwUAowgMH5UV2SFoke6trh8VicM9I22b0n4CUF5L91zMYnfu
 XCH6BLiNJ4JlFjjOPGZdxvznPRGWjQBRvTRs4Sl9mFnmaKjOe2xuYhSmDWqFiSl192Ld
 e/5XPa97+lL0wWUs1RWvUZBmppnkGM6F4VykhTtBWiCEzCkMhieCc5uStMoFQAm1aTpH
 BoLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFrg6oG2mICT9gNZPxVtIA5SwZIrP5K1ldi6AZEloMajRwexoPhBa8RVHrZuSBzZ3euT4UaDz0xmdnxVxs+JG+f6OscyF+hCx/r84zdmaO
X-Gm-Message-State: AOJu0YxWcCUWw1LPSc3FOjUgxenRvUvpfVwYyae9Y+WoOfKGHhhGSU7E
 Xno5EIUCJUXcRRdMDUzMOq9va6LJ5cxj8VUkvJ9X60NmDMHuFO/MSjXcuO9mnYG3khZqOaqNjxA
 j95s=
X-Google-Smtp-Source: AGHT+IHUPUZEPf4MkuXpuZ1eBdP2F87Pg9/UOsRP7bwjnKX895Rnp97yYU72I9lpPkf7L+Ns9p//8A==
X-Received: by 2002:a05:6402:1d4c:b0:5a2:4558:d17c with SMTP id
 4fb4d7f45d1cf-5a478b65d96mr5616343a12.4.1721631220529; 
 Sun, 21 Jul 2024 23:53:40 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5a69c1f56a0sm1982126a12.64.2024.07.21.23.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 23:53:40 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 22 Jul 2024 08:53:31 +0200
Subject: [PATCH v7 02/16] ASoC: dt-bindings: mediatek,mt8365-mt6357: Add
 audio sound card document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v7-2-6518d953a141@baylibre.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
In-Reply-To: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
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
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3413; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=7RiTz7/DbEcpnGh40/G/GiZJyYiXWSGAGW7k/Ludygk=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmngHwXd0xvDpLVp0CSV+q14Gvkt2Efi6arTJxAw3p
 IJGl4OGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZp4B8AAKCRArRkmdfjHURYIBD/
 4r2AhbZX+WCAyw7/UINA2YuXQ2ixUIY8ECPOeuc/Y10XhRSWTI4ohbrcxZEFA8E9j7J9NEoH8cwwzq
 6JlDHxqVGQp1k/Lh4ov9LLrknjvPU9uRFz3j3A/nEE5Ffm6eBQN2rFd4UdR6uZIm6WHYNmgFAg/TNl
 etNmpFgoBPJGaB2haSczJ1fsuyf4IvER2DehMRZxj6gtIq/bwdfffyyt9NGHwHHuZVTMlyrzH8D0YW
 kKp6ZL07eWqLFBe8SCubj4TqSPNWcA71GuXiFPA6GVeVpxcsFSDTnzTISdFj7X+LKUai+X4wo/iLQp
 yspBo/Ogo+ccwbKrIY035Wa8VTzrYE+/wEFHBr2PUxfYYuaj5C7Ze+VhWEFtRVjKp/MVe8FYQkFgRv
 lb+LT7D0xw7Ns3lUxJcOFNAMW+xf2o5UCF3XIH8VMWqoNSk1zhfeeN5JJznWlo9O0H23JodqdoMYHt
 cY+T6UjM8fc3vyCYVeZbpp2zOVESoMJnq3hNYxu1Ulhvu/9SkMnVUX+cpoBGWiQjIPME4QBPr6aion
 m1HrwlT1L67suGAkAupoMTqLWhP+fbmTjWwdpWxGlud0Z+gBIdYTudf93RpUr3LtjYEuw5o+F/XLe+
 y/Iftno3bvJeVhXlPr9a4Tw4sZPOSitH5nDK2vQjz3tJYCMKK2nRCRMNipPw==
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

Add soundcard bindings for the MT8365 SoC with the MT6357 audio codec.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../bindings/sound/mediatek,mt8365-mt6357.yaml     | 107 +++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
new file mode 100644
index 000000000000..ff9ebb63a05f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8365-mt6357.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8365 ASoC sound card
+
+maintainers:
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8365-mt6357
+
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: default
+      - const: dmic
+      - const: miso_off
+      - const: miso_on
+      - const: mosi_off
+      - const: mosi_on
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of MT8365 ASoC platform.
+
+patternProperties:
+  "^dai-link-[0-9]+$":
+    type: object
+    description:
+      Container for dai-link level properties and CODEC sub-nodes.
+
+    properties:
+      codec:
+        type: object
+        description: Holds subnode which indicates codec dai.
+
+        properties:
+          sound-dai:
+            maxItems: 1
+            description: phandle of the codec DAI
+
+        additionalProperties: false
+
+      link-name:
+        description: Indicates dai-link name and PCM stream name
+        enum:
+          - I2S_IN_BE
+          - I2S_OUT_BE
+          - PCM1_BE
+          - PDM1_BE
+          - PDM2_BE
+          - PDM3_BE
+          - PDM4_BE
+          - SPDIF_IN_BE
+          - SPDIF_OUT_BE
+          - TDM_IN_BE
+          - TDM_OUT_BE
+
+      sound-dai:
+        maxItems: 1
+        description: phandle of the CPU DAI
+
+    required:
+      - link-name
+      - sound-dai
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - pinctrl-names
+  - mediatek,platform
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "mediatek,mt8365-mt6357";
+        pinctrl-names = "default",
+                        "dmic",
+                        "miso_off",
+                        "miso_on",
+                        "mosi_off",
+                        "mosi_on";
+        pinctrl-0 = <&aud_default_pins>;
+        pinctrl-1 = <&aud_dmic_pins>;
+        pinctrl-2 = <&aud_miso_off_pins>;
+        pinctrl-3 = <&aud_miso_on_pins>;
+        pinctrl-4 = <&aud_mosi_off_pins>;
+        pinctrl-5 = <&aud_mosi_on_pins>;
+        mediatek,platform = <&afe>;
+
+        /* hdmi interface */
+        dai-link-0 {
+            link-name = "I2S_OUT_BE";
+            sound-dai = <&afe>;
+
+            codec {
+                sound-dai = <&it66121hdmitx>;
+            };
+        };
+    };

-- 
2.25.1

