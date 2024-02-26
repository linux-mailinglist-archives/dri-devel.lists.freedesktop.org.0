Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEE1867777
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 15:02:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDDE10E758;
	Mon, 26 Feb 2024 14:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PH54rM6x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742BE10E737
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 14:02:08 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-412a87f0d8eso2798505e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 06:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956127; x=1709560927;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1kXm5bhwE0RIFKLS+klmit5NTgkdIxAJX8Ps6s9DZUw=;
 b=PH54rM6xNthn30LeoXoLDU8AwS8AVkLJRJDNHFV+VcNVdbxpwfjuX5q2J2bupbmiPM
 n8FVBltgFGVYxltfbFkerSKa+s++1fXPuruT4cSl8RqSDPJC/Fvo3YL9t7HNfMZLcBr3
 J/y0Sr7JYYdh/3lxkwOHJcWCWfyyw5lwbzroYEUuEEnt9CNPxmDBjfiO8cyE1eVMvCa3
 8LrWwFG8kWHXoKOzdv4HxIpXFPg1W8MAldODvHmmhR3KleSCIPdMh8aYOYfaj2GHyh9q
 bVP8WGIIt9zeI3chmduyiHC19354OWB991Z9rtjHvuyt9v/zzqNIQYf+/UX0wMVwh27a
 PYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708956127; x=1709560927;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1kXm5bhwE0RIFKLS+klmit5NTgkdIxAJX8Ps6s9DZUw=;
 b=S4RgRJUqoG7+5NrdfQT1b4BvD/6cQiIpakVrllL3ijSsF+WYv5Zh7xZ7RX50AxWSHL
 GaTvkEDJ2iGDuAsdpe8JCX7DSMImK/vwfsGaVbSIxazkRIadqpW4qJsTCvOZmj7x5ucg
 CsjS8FNs/H1kWyrpwUqlr9ih2aIpJj8FaNPHqFwEpcfz8Kl5EOKPVjPBdmPg38f4fNYg
 df0fbh7Hr723ltOh0H/SIpqs8C9DyQBP9eB/O1/1oNJ/7/zUOMQvRLjE2eSeHmIRXfp0
 hJ/coBiXr90mRqMdWQ4XNPTq2LBfH9XeXh+X5eJ/WArGy+Vx6KWTYJbCd/7wOQ+oBKC8
 dHjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvZ/X1iVYDpkQOqHf+GH7RBVnqgabq9Vwo5WOaXZvYhTiPkjcX2utivNZFlDpeW70W4mjNRxJ97zFK+DmJpYUgw3aKYRQ1Y+bl2h9UV+GK
X-Gm-Message-State: AOJu0YykVIAXsPha0uZInuR/AbwNKHPSxbgiOvK38e+PmFL8NnYXnNQk
 oxtARX7XWNjlfXW9rD8nH+Fzo12nqOkKVb1NINeV2w3RrTrx042f8XtYhw5jTag=
X-Google-Smtp-Source: AGHT+IGxhQkl9Xqk2as1WdZDuKZznJImfUbVUhJLg9Dl69bLd0mMxQOlNl7tJbZdZSMC2T0clhx0uA==
X-Received: by 2002:a7b:c459:0:b0:412:817c:364e with SMTP id
 l25-20020a7bc459000000b00412817c364emr4917841wmi.36.1708956126570; 
 Mon, 26 Feb 2024 06:02:06 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 06:02:06 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH 00/18] Add audio support for the MediaTek Genio 350-evk board
Date: Mon, 26 Feb 2024 15:01:38 +0100
Message-Id: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMOZ3GUC/x3NQQqDMBBA0avIrJuapEZCryKljMlUB9ookyoF8
 e6NLv/i8TfIJEwZ7tUGQitnnlIJc6kgjJgGUhxLg9W20da2CpfIk+Kb06ohYyJq78k5KKDHTKo
 XTGE8CH5IhoTfem2vXkkw9Wmf4U2YlvkQs9CLf+e+e+z7H1s9ilOOAAAA
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
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Nicolas Belin <nbelin@baylibre.com>, Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3544; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=zP1cF1mgMLFjF9Qj79hddJ9+2MDw+VU8qnc4hJ6MA+c=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3JnboXUAMF+d1Pz/oxJlDp69tLo702vaeLTtEvz3
 Zs54U5iJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ2wAKCRArRkmdfjHURf7dEA
 CMc6/wfi/2TzT8m4kxe9uHkWXnmfVn8cMY1YQ/FMS4X65BJAh4PE5cSprnuKt+voatzOKr85v3ee7w
 cVEroPkVPySozdENDx/SoDfTd5A4upnm10iuMq6gccPYG/Aah23WwOXsuaKqtNjrkdeEmfyFoTxfu6
 jk+Grduq0B8+5hMC8OKKu6Vd33+oEblbSK5/0mvmtK3ztTt6wWq6TDBF/0KkBeVGXIQKy/1C3jHV8I
 vlIqSfEmHOT4vaUunm9J11XyRb6fIiVJ6cndJ+vi/FbBH6okKqufmwFuBuL1TdxSZyQkU0BY6M6BDY
 fZDD3k0Kgoux87c4tgFJJISAVFLCqbKyWTpvLc0lYNphbICyl50RnLyXrDOiOd7rJK7gfy5Gmgg6Qy
 DJxUROkZF0nCvpncUQFPBNVbrIBNbXNAV25DDG+b2BiZeBwnkRsT4b1ehNK8cqg8lpkJylY28Y3msl
 rD+88VGE2PDXtuOlfan1IGfcwOAXyJLB2lYbc6sty2yWMaNM0uVctSwHvsRKReA4EOvUxnQyGaauqg
 Y0q3s/vBKUORMb0RUABnpUoTSC2v875meO3LhXRrlqw3HFt5TJM1YtP4BlyIRTPyIucWiJTTqJKHAe
 U3GiLPL+dK3MeZIBisMzUY3gT3jDvsIuQJ7fco/aWeWkwUpWEYfZ+LVdlnNA==
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

[1]: https://lore.kernel.org/all/20231023-display-support-v1-0-5c860ed5c33b@baylibre.com/

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Alexandre Mergnat (15):
      ASoC: dt-bindings: mediatek,mt8365-afe: Add audio afe document
      ASoC: dt-bindings: mediatek,mt8365-mt6357: Add audio sound card document
      dt-bindings: mfd: mediatek: Add codec property for MT6357 PMIC
      ASoC: mediatek: mt8365: Add common header
      SoC: mediatek: mt8365: support audio clock control
      ASoC: mediatek: mt8365: Add I2S DAI support
      ASoC: mediatek: mt8365: Add ADDA DAI support
      ASoC: mediatek: mt8365: Add DMIC DAI support
      ASoC: mediatek: mt8365: Add PCM DAI support
      ASoC: mediatek: mt8365: Add platform driver
      ASoC: mediatek: Add MT8365 support
      arm64: defconfig: enable mt8365 sound
      arm64: dts: mediatek: add mt6357 audio codec support
      arm64: dts: mediatek: add afe support for mt8365 SoC
      arm64: dts: mediatek: add audio support for mt8365-evk

Fabien Parent (1):
      mfd: mt6397-core: register mt6357 sound codec

Nicolas Belin (2):
      ASoc: mediatek: mt8365: Add a specific soundcard for EVK
      ASoC: codecs: mt6357: add MT6357 codec

 .../devicetree/bindings/mfd/mediatek,mt6357.yaml   |   11 +
 .../bindings/sound/mediatek,mt8365-afe.yaml        |  164 ++
 .../bindings/sound/mediatek,mt8365-mt6357.yaml     |  127 ++
 arch/arm64/boot/dts/mediatek/mt6357.dtsi           |    6 +-
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        |   95 +-
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           |   47 +-
 arch/arm64/configs/defconfig                       |    2 +
 drivers/mfd/mt6397-core.c                          |    3 +
 sound/soc/codecs/Kconfig                           |    7 +
 sound/soc/codecs/Makefile                          |    2 +
 sound/soc/codecs/mt6357.c                          | 1805 +++++++++++++++
 sound/soc/codecs/mt6357.h                          |  674 ++++++
 sound/soc/mediatek/Kconfig                         |   20 +
 sound/soc/mediatek/Makefile                        |    1 +
 sound/soc/mediatek/mt8365/Makefile                 |   15 +
 sound/soc/mediatek/mt8365/mt8365-afe-clk.c         |  455 ++++
 sound/soc/mediatek/mt8365/mt8365-afe-clk.h         |   55 +
 sound/soc/mediatek/mt8365/mt8365-afe-common.h      |  495 +++++
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c         | 2347 ++++++++++++++++++++
 sound/soc/mediatek/mt8365/mt8365-dai-adda.c        |  355 +++
 sound/soc/mediatek/mt8365/mt8365-dai-dmic.c        |  475 ++++
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c         |  901 ++++++++
 sound/soc/mediatek/mt8365/mt8365-dai-pcm.c         |  298 +++
 sound/soc/mediatek/mt8365/mt8365-mt6357.c          |  379 ++++
 sound/soc/mediatek/mt8365/mt8365-reg.h             |  987 ++++++++
 25 files changed, 9718 insertions(+), 8 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240226-audio-i350-4e11da088e55

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

