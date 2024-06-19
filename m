Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFA490F102
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 16:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C2810ECE5;
	Wed, 19 Jun 2024 14:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fQ4Fb80z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA5D10ECE6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 14:46:46 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52bc3130ae6so7041301e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 07:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718808404; x=1719413204;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8l1poncsZMMe0uC3O/p1SQMVn5qtQ/mJ+sOBHcikenM=;
 b=fQ4Fb80zf2/jRvId5OsHP2USNLU1MIN8hEdwzcRA2RoEJGmkIva5uVk/ZjHvKH4b5L
 K8kxVOIF+wQQFyQlu9RIvscNXUm1lV/F7huVoO91NHFwWgp7pPsIORelDZH5wplbjX5S
 gv3BQRlROj3KSPdFywG5ti7ZazuuRVOvWjJOGOcyX847xXaKihKmD8+uif34CnE90lWV
 T8gJI4bz19QxHXoo2A+HlgooU9gkelKz9GFpw9TB05QLoFFa4L9evIjt7/jodI54cwrX
 ujrxbKg1YFwQXKExvSHvxaBjRb6MRWCKBMYtLcVjcCmdxs92v6l8b6HR3dfXjO+7IoS1
 7zzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718808404; x=1719413204;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8l1poncsZMMe0uC3O/p1SQMVn5qtQ/mJ+sOBHcikenM=;
 b=i0sYnM55JcT68xuu9UhO1p1GItuzwn7IxBelxFiz5S7bC6ZLMqFaxG42dPgWrgxjVt
 6DTvtIJwCMCz4sqyctZg03XjCmfmHtRsPNwNIyra9gXItFIxTBmPGGxVeXGbU4/f2c1Z
 kK/FeSwdEAIVELYyb1s5LGbxZ27yevtFuXV2mASuZpjRP44Izbhv3v42k5vOyc8Ay957
 +McoBzTBC3p8E7JzU0kJ4vKdt/pHsoLoRnQvIYM+uHDKl5KMZSPTjP6C7eifruGpIB0L
 he/i9RyOcaccXLo5MqgL82O0z3ewmbtwcnwpk1UtANThwDNdioD0tGn6me5dvBy5RUfL
 Tq9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHWnUDX+2eMnO8pZzr4mQSaS+D2fZ4T2Rz2tYGzpQtl4DUxkZQcuv6ftGx/FfMFzHAsTUxDmuiMyjg4wrpdstMxdRapX8DAyM0vV28KC/u
X-Gm-Message-State: AOJu0Yz2m4MG/gsBZtKwcp/Bsjt78R+JEiTH1mdIhTwDCQcSlw3BHf3x
 lRghXhQ1uU3Ix7OETJ6zCZHZmKZmJa5bXxcZCVfx4zH+0tIGQ2/Ht7C+GpwKrtA=
X-Google-Smtp-Source: AGHT+IELsBUFTt89Rl6aCgmDvE1rDPoDRef2/QnX3YE3iz/r1xX3fuzWCyC4/yxgvATcurRtIU12VA==
X-Received: by 2002:ac2:4a6a:0:b0:52c:820e:a7e7 with SMTP id
 2adb3069b0e04-52ccaa54ba4mr1671197e87.50.1718808402870; 
 Wed, 19 Jun 2024 07:46:42 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a6f56da32c3sm679787566b.13.2024.06.19.07.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 07:46:42 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v6 00/16] Add audio support for the MediaTek Genio 350-evk
 board
Date: Wed, 19 Jun 2024 16:46:36 +0200
Message-Id: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE3vcmYC/3XOTW7CMBAF4Ksgr2uwxz8xrHqPClVje0IsgYMci
 EAod6+TZZUs30jfe/NhA5VEAzvtPqzQmIbU5xrs146FDvOFeIo1MxCgBYDl+Iyp50kZwTVJGVE
 4R8awCjwOxH3BHLqZ4I3KJePjMNq94yXIw2J/w5UwP++zuBdq02uZ/znX3KXh0Zf38s0o5+vq8
 Ch5XW9RBkJpbdN+e3xfky+0D/2NzU0jbGuoWgmtonYqkogrWm1rVbW03kM4NjoYs6L1ttZVCwc
 eQDobdVjRZlubqqkhMPYYW+3kPz1N0x+lq8qQ0QEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6087; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=qbKqZY51YB0ftXD0Nl17TEBgNm5fRtW4lNsHPkLg4qk=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmcu9QKE/KLmrXEAvPk9YgTGWcMZ6XrlVEP7SJfZ3O
 jW4WEruJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZnLvUAAKCRArRkmdfjHURYeSD/
 9C2wJ/7i6KWENomzMoCdkRLd7rj+IKvvoR4ghYC12ym6W8yW41LsBIGbgpgQESqU8DZ3cRaPIhEX/T
 MqN/PDEXbN58WXuItfNuavEj7tFFXA6JyX/WD0KhsY35mkN9eiSQDtQpsir95om7sdk92eX7j506nW
 PG+R1ZLKrofftd2Rs0d7+6lDhoeQmWV0ulZPqTyuBOwhPQCX1DmumG/TSCQtFILXcL9qFS5wERx8Ig
 3wA5dVxVOZlKi08EYb/XcyCP6l6P1mi0ZNAp6COSbOlRDY98SrcDdLZsIIIorRnktXlGTrBdGugszX
 zrLvVfYU1y74QVrSri5MFrejcT4FpGlSi6hC9UzmoMdV6P9W5XIGesHQyCYBJxrjmUjw0e4r8n9/Dn
 t0hADgfMf6p7TdX9MUkhaK2TxBXCD3fmx79Zh8rBabXnL7vr7in0q6iMdKrIqx0XmY7Pz0k5+LoR/+
 XxckjyKDjQZq1Z0RjY3V42S0Htbk4dudN+/EoizEXXKs2qM8B8qyxS9m4qozeF15VQSO0kOJi4U626
 Dq/JTM4B4zTqvs+QcypM8PiJcdjBxBCWdw9PVnRoG9SJNyTZjt1Z4exDmOLFTqoIJstF+fCm6ORVsj
 ap/RukXPJmbbWdjmR1WGpgh3gncdBvYEygH9sXBEeWBkpQfyaV/hBAnu3gNg==
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
Changes in v6:
- Remove spurious defines
- all files: replace "Mediatek" by "MediaTek"
- dts: replace "pins" by "clk-dat-pins"
- dts: drive-strength: use integer instead of define
- Link to v5: https://lore.kernel.org/r/20240226-audio-i350-v5-0-e7e2569df481@baylibre.com

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
 sound/soc/mediatek/mt8365/mt8365-afe-clk.c         |  421 ++++
 sound/soc/mediatek/mt8365/mt8365-afe-clk.h         |   32 +
 sound/soc/mediatek/mt8365/mt8365-afe-common.h      |  449 ++++
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c         | 2275 ++++++++++++++++++++
 sound/soc/mediatek/mt8365/mt8365-dai-adda.c        |  311 +++
 sound/soc/mediatek/mt8365/mt8365-dai-dmic.c        |  340 +++
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c         |  850 ++++++++
 sound/soc/mediatek/mt8365/mt8365-dai-pcm.c         |  293 +++
 sound/soc/mediatek/mt8365/mt8365-mt6357.c          |  345 +++
 sound/soc/mediatek/mt8365/mt8365-reg.h             |  991 +++++++++
 23 files changed, 9314 insertions(+), 2 deletions(-)
---
base-commit: 3689b0ef08b70e4e03b82ebd37730a03a672853a
change-id: 20240226-audio-i350-4e11da088e55

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

