Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB14245F1A0
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 17:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75D26F8FF;
	Fri, 26 Nov 2021 16:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D606F8FF
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 16:19:39 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id l22so25476352lfg.7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 08:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EGYE2SKnVy6XUO3gt4QOJrl2h2mMOuvQupKJEmx7wLw=;
 b=OYSb5CZ4d1koa2NEof02FCy0m/8Pzku84dP7KlxAAaL1z9g0oj2oIe1VfZiNN1hjTF
 OqluiqoStReFLEqyvoExriqN4FH3ufQdWygygGL7iWOeiiRz8hoymkowjD0dd9Wjoz3I
 E/uiTDUNCR0o81UOvHeUJpVBQ1BuHmhpA8+ey+6cYP+iVDHago8k20TqSI7q9cV7obnT
 Lipxb9hreF6XSJz3g5CPqoMM4WVlDn3BDdyYtOQ6j0nRa2ne6oXNI+6ThC4KsLcjY3jC
 HXxTIySKUmSSnk3TEtABsKSPVHFJakJXmxVOatvKGb0Mk6StCf8vE9Yv/CZxDtY/g80K
 Q/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EGYE2SKnVy6XUO3gt4QOJrl2h2mMOuvQupKJEmx7wLw=;
 b=HpqoTcTHTQNWDxFe4hEGybCDMWl7XWoo/K6pGOKTovQbL3/sFENr4q7uaZuajAYGlx
 w2FWVI3puuTcMSSCSQZe1aDLON9xVB3IQUhWqsXuoxjh0okHKIxqszgv0tsqCKIQ+oaP
 Hni3zddEVdanIqW2/5aHEPfbCecrANuNDvxIovNwYur+0/G/kEoqC/ZqRtjKw9l+88cr
 k2fR3LpQnziZxBfMdv3180uZzo+Azo9I4Nnyi0oPQzoZzlq5kbknwmy0kuxkapyiJEPt
 4VAa8/U7UzIzOqji2uK289lSNZogcpfVVOTjNy1fkagpLZ9QqsYNf3fk4zZDSsqU1w19
 HBSg==
X-Gm-Message-State: AOAM532H7FfmJFjzp9vS6uA6MZVga0CDCVWcRMiaCv2TTWMQh1/c0BO+
 FSSvy61LLbiZa7oL3z9CNMQ=
X-Google-Smtp-Source: ABdhPJz7sHkXXKiLMg6G6JYpkIDopsTF9YR51ddFr0iMm6PJXFjDhx6d8/yGFAbyVwklgAtFwtUs0A==
X-Received: by 2002:a05:6512:c0c:: with SMTP id
 z12mr12452241lfu.591.1637943578165; 
 Fri, 26 Nov 2021 08:19:38 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:37 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 00/20] Support HDMI audio on NVIDIA Tegra20
Date: Fri, 26 Nov 2021 19:17:47 +0300
Message-Id: <20211126161807.15776-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series revives Tegra20 S/PDIF driver which was upstreamed long time
ago, but never was used. It also turns Tegra DRM HDMI driver into HDMI
audio CODEC provider. Finally, HDMI audio is enabled in device-trees.
For now the audio is enable only for Acer A500 tablet and Toshiba AC100
netbook because they're already supported by upstream, later on ASUS TF101
tablet will join them.

I based S/PDIF patches on Arnd's Bergmann patch from a separate series [1]
that removes obsolete slave_id. This eases merging of the patches by
removing the merge conflict.

[1] https://patchwork.ozlabs.org/project/linux-tegra/list/?submitter=80402

Changelog:

v1: - Corrected I2S yaml problem that was reported by the DT bot for v1
      by removing the non-existent required clock-names property.

    - Removed assigned-clocks property from S/PDIF yaml since this property
      is now inherited from the clocks property.

    - Reordered the "tegra20: spdif: Set FIFO trigger level" patch, making
      it the first sound/soc patch in the series, like it was suggested by
      Mark Brown in the comment to v1. Also reworded commit message of this
      patch to *not* make it looks like it should be backported to stable
      kernels.

Arnd Bergmann (1):
  ASoC: tegra20-spdif: stop setting slave_id

Dmitry Osipenko (19):
  ASoC: dt-bindings: Add binding for Tegra20 S/PDIF
  ASoC: dt-bindings: tegra20-i2s: Convert to schema
  ASoC: dt-bindings: tegra20-i2s: Document new nvidia,fixed-parent-rate
    property
  dt-bindings: host1x: Document optional HDMI sound-dai-cells
  ASoC: tegra20: spdif: Set FIFO trigger level
  ASoC: tegra20: spdif: Support device-tree
  ASoC: tegra20: spdif: Improve driver's code
  ASoC: tegra20: spdif: Use more resource-managed helpers
  ASoC: tegra20: spdif: Reset hardware
  ASoC: tegra20: spdif: Support system suspend
  ASoC: tegra20: spdif: Filter out unsupported rates
  ASoC: tegra20: i2s: Filter out unsupported rates
  drm/tegra: hdmi: Unwind tegra_hdmi_init() errors
  drm/tegra: hdmi: Register audio CODEC on Tegra20
  ARM: tegra_defconfig: Enable S/PDIF driver
  ARM: tegra: Add S/PDIF node to Tegra20 device-tree
  ARM: tegra: Add HDMI audio graph to Tegra20 device-tree
  ARM: tegra: acer-a500: Enable S/PDIF and HDMI audio
  ARM: tegra: paz00: Enable S/PDIF and HDMI audio

 .../display/tegra/nvidia,tegra20-host1x.txt   |   1 +
 .../bindings/sound/nvidia,tegra20-i2s.txt     |  30 ---
 .../bindings/sound/nvidia,tegra20-i2s.yaml    |  77 +++++++
 .../bindings/sound/nvidia,tegra20-spdif.yaml  |  85 ++++++++
 .../boot/dts/tegra20-acer-a500-picasso.dts    |   8 +
 arch/arm/boot/dts/tegra20-paz00.dts           |   8 +
 arch/arm/boot/dts/tegra20.dtsi                |  40 +++-
 arch/arm/configs/tegra_defconfig              |   1 +
 drivers/gpu/drm/tegra/Kconfig                 |   3 +
 drivers/gpu/drm/tegra/hdmi.c                  | 168 +++++++++++++--
 sound/soc/tegra/tegra20_i2s.c                 |  49 +++++
 sound/soc/tegra/tegra20_spdif.c               | 195 +++++++++++++-----
 sound/soc/tegra/tegra20_spdif.h               |   1 +
 sound/soc/tegra/tegra_pcm.c                   |   6 +
 sound/soc/tegra/tegra_pcm.h                   |   1 +
 15 files changed, 571 insertions(+), 102 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml

-- 
2.33.1

