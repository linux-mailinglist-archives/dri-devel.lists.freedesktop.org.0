Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E15B68CCE43
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 10:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1DB110E159;
	Thu, 23 May 2024 08:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BlXMmbsx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6915A10E09E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 08:42:43 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42011507a4eso14999475e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 01:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716453762; x=1717058562;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s9IoM7ubfwjCRGp2OqRR9/s+nq5WA6taakqxn5di/mM=;
 b=BlXMmbsxKccyLYMBib06K+hFG4rfZU/1qsC2qL1UTmvoa/gIFT8aPsvnw259JLK9HQ
 2GurjggEfDgIaMiQ3dyI0HNGsc0xgVSfcbKeJpIYW9U9ypjEJpz00sFpT3cLVt3mw3IT
 XxGsUqfAmk3aShxPCZaBOvt1CuJVHrDCoK8NYGYRx3m04RwIos9yxUMMNag8xbAoKUq1
 ttK9xV/DF7CQn3AUhGEz89+Bf+n4gKBhwii8Gu25FrH0Hjm/t3MnQNzMcK/QE6m4J2yU
 RFNUjyfasQl7MdSffYbLhRvWRCt9jeR6e0DciixvqNLkHxVAaHJ2vCqBiyU5wuiFHn47
 lbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716453762; x=1717058562;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s9IoM7ubfwjCRGp2OqRR9/s+nq5WA6taakqxn5di/mM=;
 b=mMrKMXdJgFK17+saqdrndTT6kjrt/18o7T488R/j6E+L4lFCD33G2XFeWlSIMnyw2t
 2MQ+OmTfS7fyGAuHAntpWALXL57mvsc2Ia+etnPXvlgWipSMFzELqg4/5DLVWjGMoDak
 7XSuRzlgifm7UG02LIrhlY/y2jF1vLZpRWOWbIPRjx0cg/tuEmIh3CsXcCzYiZS1Ehci
 Qa+H8nRdgV62s+uV3lyvncNYMfpnY/n/MXx9G13dtxKuK1dB9JrZ7Snd98OOIbCRl+FM
 2diIpfgzcXbG5/3OfqyOlbLBbzoWD5JOlwVigtOzCuqOOjJxHryQsqlB3RIAc4VduMac
 EHXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlX8W0tNXCCCUuCjB4gaGQcutU8x6E3QupCCNnR1RBx4KF3jqgTAQ6eSGLXPs1Mw5BjyEIZZvNk0nh0Z6yZDCirglD34zL5G9AT6PmLxAE
X-Gm-Message-State: AOJu0YxokvITlJn1MEdTbiy0bOLLLaUj/fy/0ZX27+hQCf2YdOZrJTBC
 ACuQpDDyi0/X/XNhQYqB0K1QyImKdV/CmR7SMpEssUGuPWHvQHgW/0O5OzbiVLg=
X-Google-Smtp-Source: AGHT+IEeSF0n+GzArx73nwYO6lnriXZ6tJ0DRv8D6jLr9WeIudFedWUiTESJQl7Eo1V0D4QbkiLZMg==
X-Received: by 2002:a05:600c:584c:b0:418:f760:abfb with SMTP id
 5b1f17b1804b1-420fd2d7071mr29842315e9.5.1716453761573; 
 Thu, 23 May 2024 01:42:41 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42100f3e03asm18556645e9.17.2024.05.23.01.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 01:42:41 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v5 00/16] Add audio support for the MediaTek Genio 350-evk
 board
Date: Thu, 23 May 2024 10:42:29 +0200
Message-Id: <20240226-audio-i350-v5-0-e7e2569df481@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHYBT2YC/3XOTW7CMBAF4Ksgr2uwxz+4XfUeFarG9oRYAgfZE
 IFQ7l4nyypZvpG+9+bNKpVElX3t3qzQmGoacgvmY8dCj/lMPMWWGQjQAsByfMQ08KSM4JqkjCi
 cI2NYAx4rcV8wh34meKVyzng/jHbveAnysNjfcCHMj9ssboW69Fzmf04t96neh/JavhnlfF0dH
 iVv6x3KQCitPXbfHl+X5Avtw3Blc9MI2xqaVkKrqJ2KJOKKVttaNS2t9xA+jzoYs6L1ttZNCwc
 eQDobdfinp2n6AyV0kEyTAQAA
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5809; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=6mA9w0EQq5o6RRMrcQA5mF6HTvpiguhhgrxdASPo2e0=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTwF/BUH/8IbYUnAckzLUkGmhFoeLd1jg/OI0wnsK
 bUZ4x6OJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk8BfwAKCRArRkmdfjHURWW7D/
 sHp0Ao+lZD/Vn6BLG/eCP+OxIy594sYU8PBH193MniLgdvURvi1RArpum6PqVbLKrZul1xG/g2YvdR
 sqt8QK7fF/ZwjabEs+53x3DXhvmOv3uBthAH8gWXLthhC5R1PETsMvli9L8lp7O3XyKVcizHJfYhWi
 zlZUdLFCQe5exrBmd7q9pWtJnkPXZjZvgIHcrMUBhX2b/kBZUrg4cQ/qKKjqlfwRV4srqQpj98Sm9J
 cl3u+A8Go5Ig1OaFacv+7WsuJPJTcg97R+YFsbuLvbtQqv9DmdbJ8FT8DDhOYRXdTabUhpWbQwRdCy
 VHmoCtr7dfNpnosf4di42MTHBaoHw/INpDi3OTRcU58gqfQYhIJFMoWbwCxkaaOH6PQ4mzW9OD5BHO
 tweyZQFWxQBcANsCIrIrExjdD6gQszvZI3bnjG1wBNcH/jRZkisd07vTZM5C8rxDWDtNddnTH608FN
 GXKeKIBk9JZFzM1VohHg9KGcsAt1msPFBlLYyQxJHuSMHSf3NCmsXU2TSE9eEAMOHvuIL/ZHL4Cr2k
 HIFWhrUbNS3fVp+xNn3x+Qsw/ztOqzrMvtLDTSXkkwChA2EQFaAgqh2Zcen92jvz2Lv++j7pkEzx/F
 h637DaBirZmda/kkMfDm+aoGBVZ3GYhYwgsMubHgGSj2MNvqW2rLWR4YNaLg==
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

This serie aim to add the following audio support for the Genio 350-evk:
- Playback
  - 2ch Headset Jack (Earphone)
  - 1ch Line-out Jack (Speaker)
  - 8ch HDMI Tx
- Capture
  - 1ch DMIC (On-board Digital Microphone)
  - 1ch AMIC (On-board Analogic Microphone)
  - 1ch Headset Jack (External Analogic Microphone)

Of course, HDMI playback need the MT8365 display patches [1] and a DTS
change documented in "mediatek,mt8365-mt6357.yaml".

Applied patch:
- mfd: mt6397-core: register mt6357 sound codec

Test passed:
- mixer-test log: [3]
- pcm-test log: [4]

[1]: https://lore.kernel.org/all/20231023-display-support-v1-0-5c860ed5c33b@baylibre.com/
[2]: https://lore.kernel.org/all/20240313110147.1267793-1-angelogioacchino.delregno@collabora.com/
[3]: https://pastebin.com/pc43AVrT
[4]: https://pastebin.com/cCtGhDpg
[5]: https://gitlab.baylibre.com/baylibre/mediatek/bsp/linux/-/commits/sound/for-next/add-i350-audio-support

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v5:
- Rebase to "next-20240523" branch.
- bindings: power supply property moved to the parent node
- Replace "SoC" by "ASoC" in the patch title (5/16)
- Move and rename DAI I2S's defines
- Improve code readability and cleanup
- Link to v4: https://lore.kernel.org/r/20240226-audio-i350-v4-0-082b22186d4c@baylibre.com

Changes in v4:
- Rebase to "next-20240422" branch.
- Re-pass dt_binding_check, functionnal tests, mixer test and pcm test.
- Remove copyright changes.
- Move mt6357 audio codec documention from mt6357.yaml
  to mediatek,mt6357.yaml
- Fix broken indentation in mt8365-evk.dts
- Remove empty node.
- Add more dai link name according to the HW capability.
- Remove spurious property (mediatek,topckgen)
  from mediatek,mt8365-afe.yaml
- Rename "afe" to "audio-controller" in the documentation.
- Link to v3: https://lore.kernel.org/r/20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com

Changes in v3:
- Re-order documentation commit to fix dt_binding_check error.
- Remove $ref and add "mediatek," prefix to vaud28-supply property.
- Link to v2: https://lore.kernel.org/r/20240226-audio-i350-v2-0-3043d483de0d@baylibre.com

Changes in v2:
- Documentation fixed:
  - Remove spurious description.
  - Change property order to fit with dts coding style rules.
  - micbias property: use microvolt value instead of index.
  - mediatek,i2s-shared-clock property removed.
  - mediatek,dmic-iir-on property removed.
  - mediatek,dmic-irr-mode property removed.
  - Change dmic-two-wire-mode => dmic-mode to be aligned with another SoC
  - Remove the spurious 2nd reg of the afe.
- Manage IIR filter feature using audio controls.
- Fix audio controls to pass mixer-test and pcm-test.
- Refactor some const name according to feedbacks.
- Rework the codec to remove spurious driver data.
- Use the new common MTK probe functions for AFE PCM and sound card.
- Rework pinctrl probe in the soundcard driver.
- Remove spurious "const" variables in all files.
- Link to v1: https://lore.kernel.org/r/20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com

---
Alexandre Mergnat (14):
      ASoC: dt-bindings: mediatek,mt8365-afe: Add audio afe document
      ASoC: dt-bindings: mediatek,mt8365-mt6357: Add audio sound card document
      dt-bindings: mfd: mediatek: Add codec property for MT6357 PMIC
      ASoC: mediatek: mt8365: Add common header
      ASoC: mediatek: mt8365: Add audio clock control support
      ASoC: mediatek: mt8365: Add I2S DAI support
      ASoC: mediatek: mt8365: Add ADDA DAI support
      ASoC: mediatek: mt8365: Add DMIC DAI support
      ASoC: mediatek: mt8365: Add PCM DAI support
      ASoC: mediatek: mt8365: Add the AFE driver support
      ASoC: mediatek: Add MT8365 support
      arm64: defconfig: enable mt8365 sound
      arm64: dts: mediatek: add afe support for mt8365 SoC
      arm64: dts: mediatek: add audio support for mt8365-evk

Nicolas Belin (2):
      ASoc: mediatek: mt8365: Add a specific soundcard for EVK
      ASoC: codecs: add MT6357 support

 .../devicetree/bindings/mfd/mediatek,mt6357.yaml   |   33 +
 .../bindings/sound/mediatek,mt8365-afe.yaml        |  130 ++
 .../bindings/sound/mediatek,mt8365-mt6357.yaml     |  107 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        |   89 +
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           |   43 +-
 arch/arm64/configs/defconfig                       |    2 +
 sound/soc/codecs/Kconfig                           |    7 +
 sound/soc/codecs/Makefile                          |    2 +
 sound/soc/codecs/mt6357.c                          | 1898 ++++++++++++++++
 sound/soc/codecs/mt6357.h                          |  662 ++++++
 sound/soc/mediatek/Kconfig                         |   20 +
 sound/soc/mediatek/Makefile                        |    1 +
 sound/soc/mediatek/mt8365/Makefile                 |   15 +
 sound/soc/mediatek/mt8365/mt8365-afe-clk.c         |  429 ++++
 sound/soc/mediatek/mt8365/mt8365-afe-clk.h         |   32 +
 sound/soc/mediatek/mt8365/mt8365-afe-common.h      |  491 +++++
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c         | 2275 ++++++++++++++++++++
 sound/soc/mediatek/mt8365/mt8365-dai-adda.c        |  311 +++
 sound/soc/mediatek/mt8365/mt8365-dai-dmic.c        |  340 +++
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c         |  850 ++++++++
 sound/soc/mediatek/mt8365/mt8365-dai-pcm.c         |  293 +++
 sound/soc/mediatek/mt8365/mt8365-mt6357.c          |  345 +++
 sound/soc/mediatek/mt8365/mt8365-reg.h             |  991 +++++++++
 23 files changed, 9364 insertions(+), 2 deletions(-)
---
base-commit: 3689b0ef08b70e4e03b82ebd37730a03a672853a
change-id: 20240226-audio-i350-4e11da088e55

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

