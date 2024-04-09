Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 826A689DAAB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 15:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B0CE10FCA1;
	Tue,  9 Apr 2024 13:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="P3mlPXcH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B50010F89D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 13:42:08 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-343c891bca5so3605155f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 06:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712670126; x=1713274926;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cWI7S1lElWn3U1R+aucOq0dCW+BF+dyNtQxwUN5pMOY=;
 b=P3mlPXcHhfDINvaJBMJ4DMse6ekJ5bZIAqmfcxz4Iz7MkcU1qAEAvyH3QJyjpvScl2
 HYbCNnlXiL+yH+MKSKBMYxE0VwR5ZF7eUgDEgncLyKT4TP6/zfr+tJrNlHbdFWpiXK5k
 dAKBoo52IW5FNNePTraBnE8ZYZ8NVe6MvEk6+KmAoIsss24ZxYCCarJgQayOuHWk3BB4
 ZBuu4hxLIiF66ixoebelyf8l802FgMrL2eq5CKqYkw91wvHTg7hA25bfKW0juFU3oMSl
 Z62w+PoELxkA8IpwGej0SdUIOs5fJikJxUjWO/jwrPTAnHBj6yyLuSPCtKL7hXswaYW7
 MbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712670126; x=1713274926;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cWI7S1lElWn3U1R+aucOq0dCW+BF+dyNtQxwUN5pMOY=;
 b=MVFE8hXk1dUnkspdqRpF8AgmFBUb6cQO4Zzv8iuUz7X6o8G/ZjwoInN/LIzDgexOAw
 EuTA21Yfmst9CmH/FfQtkMMZS6SRp1KrUD5pUhX3fqQ1aPXHAfi1Ots3Ll2Wyld99byG
 06Ut7CjoN4qkmN7l5Mk9iYvsmiX7yWGn3pOJOXtF8Gzx6+ylOQXQdiCC8oKsxMs+wxcB
 7CcVLJUaWlA5b2skiP3l9nRuDMj4BIywvKVxENz5q3Q55H4WJIyrB15r74ZWed7aoILn
 QLER/LUJJcD8yflsGhPFkdzi6ZyKTBsM9QUgAKJMtCt0/3t815ZimW+lX2p06SEEkLiB
 cY7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXecYaek3DlkaoYrDy0R5vTVfJFtg/rkqkCjpJFXoDtG3cSQj341t1CNayBgdt/9knmSSSRMkSr7hJN2aSkWcS+diCZIWQRrLglsfBbeD4F
X-Gm-Message-State: AOJu0Ywr3bLFqa0GDxueK2JKdLPAyOi6nB/UJE4ldSo9H23ms/Pif8dT
 tosGCRTxneMZx0xXBn/TVd0EC0kfubwSwmQXskEUbHFf+6xc6kvuBSmo1NS8be0=
X-Google-Smtp-Source: AGHT+IHYVcm4uy8e+4m+zihLKjtGWB1nmUnYJwk2/Yz/lUHp3i/vJBMnbO5QWc6xpkTcOVvA+nN3FA==
X-Received: by 2002:a05:6000:1202:b0:343:e152:4c43 with SMTP id
 e2-20020a056000120200b00343e1524c43mr9109327wrx.2.1712670126364; 
 Tue, 09 Apr 2024 06:42:06 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 j11-20020adff54b000000b003433bf6651dsm10753579wrp.75.2024.04.09.06.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 06:42:05 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v3 00/18] Add audio support for the MediaTek Genio 350-evk
 board
Date: Tue, 09 Apr 2024 15:41:58 +0200
Message-Id: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKdFFWYC/3XOTQ6CMBAF4KuYri30B5C48h7GmKEdZBItpIVGQ
 ri7haXR5Zvke28WFtATBnY+LMxjpEC9S0EfD8x04B7IyabMlFCFUKriMFnqOelS8AKltCDqGsu
 SJdBAQN54cKbbCLzQPxyMeayymnsj893ezRPBTcMmBo8tvff56y3ljsLY+3n/Jsrt+nM4Sp7WW
 5AGQVbVqb00MD+p8ZiZ/sW2pqj+a5W0FoW2Ra0tCvul13X9APBs2hMXAQAA
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
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5262; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=35Y/hWwz12Ve63DuUSoS7RbzfGqLgB7dwKktzFb/Izc=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFUWs2/gi0dORmN+sYnWD5lQDLvls9amOl8w+6j55
 0W3z/yeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhVFrAAKCRArRkmdfjHURVzjD/
 9GNDSHdXURnV0TjG9IhD2P+jLCMn5WYhOdsUWG/duDY/npD7ypoJLjGS8RRw2SQsKh4fLTBeQWdO7m
 GNnJBaeC5OTYhZlu7zGgksypJ56wQlQDnXcB437f9xDjGFVVDeTAUXvzvauG5L9INx0Y5NNehXFFX+
 GYOp1UC5Rj1EgIWltNeVQmIpu0JDU4cBMjq8HfvjD6iTtaHkrSpvhUqr1FSXUjvam6l4nm8RIMqiU/
 DqU14gd6TzaGrMUSyKl7dYE86lp9cIKsQICQZbU7Uoz3+SXdaoAlVjX6W6ZjaC8gUn84i9T4JMDgsP
 ykSn05+s79iGwBkFnzGhI6oGKKt8H3ibqwkq6lZAAFIe8AsALv6nUpHghEnVOIuWRxHm+oCaRlInDI
 WO/r8TM20Gmn3jE+178G8BOk7d1DZyJ/gPeaqEMFXqn05WNA8STRgAcZmaeu7E6rUw0r/M5cMsWWQk
 jLtQde3t0fYJO+S54vjaZ6O06ILQ4LjFZfrz+NvQgBYNcwTVL93qDbZFWpbhFe0Eisl+3+sPVEHx9u
 KHa3OZEAlmuhWsxockSlsoLYfHnENXHOcasSJaioDO7Vab/5PccF+saEN/jnqhy5eGtVt2B9Cp/cYo
 IQc6VLDICZo8Otr2I0+CDqJOG2kTjskq4EmjCtcWEdFfZoDNQLwnwM2JJFFg==
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

Rebase on top of sound/for-next branch and the
Angelo's serie "SoC: Cleanup MediaTek soundcard machine drivers" [2]
Work branch with all patches [5]

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
Alexandre Mergnat (16):
      ASoC: dt-bindings: mediatek,mt8365-afe: Add audio afe document
      ASoC: dt-bindings: mediatek,mt8365-mt6357: Add audio sound card document
      ASoC: dt-bindings: mt6357: Add audio codec document
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

Nicolas Belin (2):
      ASoc: mediatek: mt8365: Add a specific soundcard for EVK
      ASoC: codecs: add MT6357 support

 .../devicetree/bindings/mfd/mediatek,mt6357.yaml   |    5 +
 .../bindings/sound/mediatek,mt8365-afe.yaml        |  136 ++
 .../bindings/sound/mediatek,mt8365-mt6357.yaml     |   99 +
 .../devicetree/bindings/sound/mt6357.yaml          |   54 +
 arch/arm64/boot/dts/mediatek/mt6357.dtsi           |    5 +-
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        |   98 +-
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           |   46 +-
 arch/arm64/configs/defconfig                       |    2 +
 sound/soc/codecs/Kconfig                           |    7 +
 sound/soc/codecs/Makefile                          |    2 +
 sound/soc/codecs/mt6357.c                          | 1898 ++++++++++++++++
 sound/soc/codecs/mt6357.h                          |  662 ++++++
 sound/soc/mediatek/Kconfig                         |   20 +
 sound/soc/mediatek/Makefile                        |    1 +
 sound/soc/mediatek/mt8365/Makefile                 |   15 +
 sound/soc/mediatek/mt8365/mt8365-afe-clk.c         |  451 ++++
 sound/soc/mediatek/mt8365/mt8365-afe-clk.h         |   49 +
 sound/soc/mediatek/mt8365/mt8365-afe-common.h      |  491 +++++
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c         | 2275 ++++++++++++++++++++
 sound/soc/mediatek/mt8365/mt8365-dai-adda.c        |  315 +++
 sound/soc/mediatek/mt8365/mt8365-dai-dmic.c        |  347 +++
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c         |  854 ++++++++
 sound/soc/mediatek/mt8365/mt8365-dai-pcm.c         |  293 +++
 sound/soc/mediatek/mt8365/mt8365-mt6357.c          |  348 +++
 sound/soc/mediatek/mt8365/mt8365-reg.h             |  991 +++++++++
 25 files changed, 9456 insertions(+), 8 deletions(-)
---
base-commit: 6a3d4a830e4e9de8e8aefc233d790bef4a5c0037
change-id: 20240226-audio-i350-4e11da088e55

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

