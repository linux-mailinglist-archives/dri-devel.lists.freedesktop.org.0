Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2393B4667DA
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 17:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B8D6EE9F;
	Thu,  2 Dec 2021 16:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A4F6EE9F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 16:25:17 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id r26so72787559lfn.8
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 08:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=imLf4C09RyVy+Ea5NbMda4qEdBwYu+Q8gzSH5LvY08M=;
 b=CvoWguysiszg7EIo/KVTylyyzVddJnXGME2sUkSxXPE9QI/M3G8WW2gcb4Ek7CLTkI
 3OJJMgnRPQJXKbujpC7ujQ9wYAxJoCVX65idvYa3GvigcBfm/gUYtCJJvZ2uP9UjMtPK
 HRMs7PTCX+5RlqbV1bUccYeBpf7CUglk+Zkys9HnjNqGPGy7z6A8TixZaxXBfYQIt6DZ
 zPCDUvOWZQ5RSqndRin4+7Mb8/+sii0fHswcT6k1I0e8l4ixYoJmlgslf65hRDKC/SUF
 H8qushryTjmB197mMux8vD/lE1VXc04JApMYeZ3NaNY+32Snz0LSbaD6jb2QkYMFSwlz
 WacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=imLf4C09RyVy+Ea5NbMda4qEdBwYu+Q8gzSH5LvY08M=;
 b=7j00m6HkF3A5H855hO0dcEn5qYwNMygCVfKa1dHzDiabdq1RCgtxPhcK7Qxs53X31A
 O84YGPEA0vsKjD/+u6bKO7+YDDpzhiUCm/+/uHWANzZ9RMKvQosr1dzY6kAyX0UPcQAK
 iAJuikhgHMsNW28wrs1aaSdXjRtfr2gZUf/5reACQ07JlnK0O1nkrJ40dFSGeHKWf6i6
 kwS74sBFP66l1BOxXSZXAfBMPEMn/V+7TfaDeRU/hKe7Rvcsiod/UrZU3yWwGl+cpBNN
 g0q5QZg6cXvawmJZs6MoHzUmnjyJDamV08zNuW6ph7oNiKevjWq9VREko0xe4kXVRejL
 e9Ig==
X-Gm-Message-State: AOAM533qAsAKQvGJnj78Q7R3y6ffsvyzL4s3WmKjasRpZQt94RYkw2eD
 12y6gmtnc+zI3t/NNHyFNnM=
X-Google-Smtp-Source: ABdhPJxBOZ/Rf8efL1/chi4Rtn8qA9mSShnKA0016dzHrdbF1opdrOowLz1/fQq8mfpdVWPuKJuYOg==
X-Received: by 2002:ac2:454b:: with SMTP id j11mr12665406lfm.41.1638462316009; 
 Thu, 02 Dec 2021 08:25:16 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:15 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 00/20] Support HDMI audio on NVIDIA Tegra20
Date: Thu,  2 Dec 2021 19:23:21 +0300
Message-Id: <20211202162341.1791-1-digetx@gmail.com>
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
removing the merge conflict. This is a note for Mark Brown.

I also based this series on top of power management series [2]. I.e. [2]
should be applied first, otherwise "Add S/PDIF node to Tegra20 device-tree"
patch should have merge conflict. This is a note for Thierry.

[1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=273312
[2] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=274534

Changelog:

v3: - Renamed S/PDIF device-tree clocks as was suggested by Rob Herring.

    - Added r-bs and acks that were given by Rob Herring to v2.

v2: - Corrected I2S yaml problem that was reported by the DT bot for v1
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
 sound/soc/tegra/tegra20_spdif.c               | 197 ++++++++++++------
 sound/soc/tegra/tegra20_spdif.h               |   1 +
 sound/soc/tegra/tegra_pcm.c                   |   6 +
 sound/soc/tegra/tegra_pcm.h                   |   1 +
 15 files changed, 572 insertions(+), 103 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml

-- 
2.33.1

