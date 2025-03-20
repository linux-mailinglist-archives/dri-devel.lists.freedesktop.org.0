Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3512AA6A1C9
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 09:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA2710E5A9;
	Thu, 20 Mar 2025 08:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IK9wCQ3z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D672910E2CD
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 08:49:14 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3912d2c89ecso394737f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 01:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742460553; x=1743065353;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3dSSUDp0kq8Zg5C9MUmkhdPhVDOdSmRPSZzAk4mUfCY=;
 b=IK9wCQ3zlLxAnn3SGOgAA8qywsWggQN78TdBathMooFHPVhE/TS9HLzk9/1A4FAgLz
 2Rdv8OIViiZ7euF9Fj++cRSrrODi3PoUquxuZ6VGOPPhJWv10R90vhJKT3Ic3Y7GPUm3
 2ggrF4mjIS8mgtlN5HLVKiVc1w2urihsV5jJOezW5888pmCory0tI7ysovc7k15ixHzy
 Fbr9zR/9AeNkY4/JFro9EkypjgVjMM7BbiPiDOrwkdakual9H0BsSy1Gr6ssxmyr8huO
 hPvuSYBB7P0IAYRvLYcEOXheqXKIvhAPe7FwGdXy9AjsMB30rDjWpm+8oxzlo6KJzOae
 XN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742460553; x=1743065353;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3dSSUDp0kq8Zg5C9MUmkhdPhVDOdSmRPSZzAk4mUfCY=;
 b=R/frn2rzbPUdJ5oOQ9Tkyk1z9XRHcX4unfFFqkJHafoDUz/p3Vr5thKt+Oa981xxAS
 lIgH5Zo9+MhCTEroAoI70geIcwHa/VAgyuayUn8BertX2KJunINbvO/ZZUi7C/5A/JBn
 z9hi2K4jUyqpY4w7mlhX0BnhMj9A8V2gfGji3EYQxjna8aDIct7YswQapQETEDqWGZlM
 82Q1CCjcWvc528GxDw6fQ5WJqnp6xEDFjKG1oAfQtVNHNuirysygit5eR94lmKB1zjLp
 64P71B/UaV5Pikg93NX0LVQ9TjybR5m3VhKOWfHDb8RsO/xBLTwE8IgNxAa8J9eJSYiD
 wijg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe1xyAqT34k+4arYEbg+hMRse1e7iDYrO+n5Tep+Pf+i80U+JTf5nvxV+eJJvKd3hyEK7pGIRM62s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7JK3hh3gGCc5WDw7KNvaDEw/ejpsH8CwqIUEc74z4zh1eE6DP
 lg6P/XS4771K/mXEK6QjYcxT/apxjRze7tkNHnC39Z4a2CDqi4lwqUmSIMx6yQQ=
X-Gm-Gg: ASbGncs5x8X0IHQi44lPI3Bf1UtjqmKxAZCyRqHsTc0vYWueIfKjLKOHMtXUEXtxRIF
 OG3Dg+DMCrxotuNP7f1YHMI9WFoPgf2eZ2KqkI6wSaqTv+NxmI3kKS/2BwvCkJeUfOvauWEbJEX
 VOonG/aq2MXNIswCI5o9Jz0lzrfCAhBTLB0WdX0SE5BdO+sOtOCoQGwg/F47qnfvwCADK06cg1T
 Vy7dgomTkfm2E/9sIeJw46E9/r7hVKTTkABXquPub2sScUDYzQ/cOOAcGuZ9F+PTwqkp1tWKZ7k
 2u35+NfPYlzd4STM+K44Mh//gVXg0ls3YzqcjO4HbxEkrRBQ
X-Google-Smtp-Source: AGHT+IESyPaiI1V9B3T+xCXcpOdHP115r4JOZkpshAPm0pBqPbQrvCBH6xJxDvOxDEUrw+x64IGdGA==
X-Received: by 2002:a5d:584c:0:b0:391:12a5:3c95 with SMTP id
 ffacd0b85a97d-399795adb01mr1697690f8f.22.1742460553152; 
 Thu, 20 Mar 2025 01:49:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:c11c:487d:c821:54a0])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43d43fdac9dsm41381655e9.30.2025.03.20.01.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 01:49:12 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v8 0/3] Add display support for the MT8365-EVK board
Date: Thu, 20 Mar 2025 09:48:44 +0100
Message-Id: <20231023-display-support-v8-0-c2dd7b0fb2bd@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGzW22cC/4XQS27EIAwG4KuMWJcKMBBmVr1H1QUP0yBNkwjSq
 NEody/MskrFgsVvyZ9tHqRgTljI7fIgGbdU0jzVYF4uxI92+kSaQs1EMAG8PhpSWe52p+V7Wea
 8Uq8lNw4YSn4ltcvZgtRlO/mx9a1YVt7qS8aYfp6T3j9qHlNZ57w/B2+8Vf+fsXHKqPJGMwzKA
 7g3Z/d7chlf/fxFGreJDiEqAeDRGC2dEMMJAR0C2hYAxkTAAPJsC9khZCUwGIGOaxMdPyFUh1D
 tkCtTkaN0BtQJoTuEroTXNsoIMspgToihQwyV0AOD+hVCG/h7yHEcv+U7Pw1bAgAA
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5549; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=dFWBZa11361gL22ddaMWSIWli3shFJKSBcr7kHO8OAs=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn29aHbKmfCxg9p7exTe9tO4ahnJps7WII3FBjPnb4
 3eBbyQaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ9vWhwAKCRArRkmdfjHURXGrEA
 Cmq6GfCcjI8Ht1UNcjWmd4WfAieGbhW5mYUQQVUZyrkkVUl2sEDA94dd7L1HlTzNmiO9qXciEj+GZ4
 CD5NhyDyHrTXp8bkL0bgGIjHZXf8QqT3ae/1WYtL0HUH4c8sTjcWF8p8fIDmRzE3ql2nSKmTB5w9fb
 6T+oJLElauBuc6eWCq6nJjF4PfdmotiB/2RyRmo+9FNm8jp9PSYjniUQo61mmbssD0zx1fGiDMJcNE
 dfXFLBOhju/EEHdvcAqBD/sHMu+4//dxQ2ZPmJ4CV6lTFeJpJDNX98Vy7tgehwEAs5QfLzqawHpgh4
 tN/2XWMzX1S/pNqcr2DMw2UJwMGHuD+/yr9bmsbSwtadQCWflHc8HNCRiT3qGvXBYdQ2nX1D34SHGS
 yhOSRFKlIKQTcIhsOLJMx+go6P/BiffF3PsPFlnClkdu9Rp8MaohY8YKRNnpPAdQnly1FYZ8OKNJ7L
 XJRh3+RoEC/eZNgm/As3WaJjJYoRU9d3Io5XvOqis3TFJwUMZNhzsyHNlmILLFiPdT3sKqYt/1+UFK
 MrKj41Oe6yoMBlQupg9mQc34O8Wiq5ap7bI/5sfAwwqV8YNojrqnlh71tf7QGQdFBrLoCTonkx6gR3
 tGEGOZO1VwKbIUnxiKIvX8I1iBHJejB8KysIYz8BVCnhPK9vSuOv71qUJbdQ==
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

The purpose of this series is to add the display support for the mt8365-evk.

This is the list of HWs / IPs support added:
- Connectors (HW):
  - HDMI
  - MIPI DSI (Mobile Industry Processor Interface Display Serial Interface)
- HDMI bridge (it66121)
- DSI pannel (startek,kd070fhfid015)
- SoC display blocks (IP):
  - OVL0 (Overlay)
  - RDMA0 (Data Path Read DMA)
  - Color0
  - CCorr0 (Color Correction)
  - AAL0 (Adaptive Ambient Light)
  - GAMMA0
  - Dither0
  - DSI0 (Display Serial Interface)
  - RDMA1 (Data Path Read DMA)
  - DPI0 (Display Parallel Interface)

The Mediatek DSI, DPI and DRM drivers are also improved.

The series is rebased on top of Angelo's series [1] to
use the OF graphs support.

Update 03/20/25:
According to Angelo's comment, the DSI fix in the previous version
doesn't fix the root issue.
Then, the "drm/mediatek: dsi: Improves the DSI lane setup robustness"
as been replaced by two other patch to fix the DSI power on sequence
and remove custom power function.

Regards,
Alex

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v8:
- Patch merged, then removed from the series:
  - dt-bindings: display: mediatek: dpi: add power-domains example
  - drm/mediatek: add MT8365 SoC support
  - arm64: dts: mediatek: add display blocks support for the MT8365 SoC
  - arm64: dts: mediatek: add display support for mt8365-evk
- Patch removed:
  - drm/mediatek: dsi: Improves the DSI lane setup robustness
- Patch added:
  - drm/panel: startek-kd070fhfid015: add another init step
  - drm/mediatek: dsi: remove custom init part
- Remove MTK custom init function for the DSI driver to avoid conflict
  with what the DRM APIs provide.
- Link to v7: https://lore.kernel.org/r/20231023-display-support-v7-0-6703f3e26831@baylibre.com

Changes in v7:
- Improve defconfig commit description
- Add comment in the DTS about pins clash with ethernet and HDMI (DPI0)
- Link to v6: https://lore.kernel.org/r/20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com

Changes in v6:
- Fix DPI binding: remove the duplicated property (power-domains).
- Squash defconfig commit.
- Fix the property order in the DTS.
- Link to v5: https://lore.kernel.org/r/20231023-display-support-v5-0-3905f1e4b835@baylibre.com

Changes in v5:
- Patch merged, then removed from the series:
  - dt-bindings: display: mediatek: rdma: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: ovl: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: gamma: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: dpi: add compatible for MT8365
  - dt-bindings: display: mediatek: dsi: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: dither: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: color: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: ccorr: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: aal: add compatible for MT8365 SoC
- Enable STARTEK KD070FHFID015 panel in the defconfig.
- Rebase on top of 6.13-rc6.
- Link to v4: https://lore.kernel.org/all/20231023-display-support-v4-0-ed82eb168fb1@baylibre.com

Changes in v4:
- Patch merged, then removed from the series:
  - dt-bindings: display: mediatek: dpi: add power-domains property
  - dt-bindings: pwm: mediatek,pwm-disp: add compatible for mt8365 SoC
  - clk: mediatek: mt8365-mm: fix DPI0 parent
- Remove mediatek,mt8365-dpi compatible from mtk_drm_drv.c because it
  use the mt8192's data. It's a miss.
- Add MT8365 OF graphs support, remove the hardcoded display path and
  rebase on top of Angelo's series [1].
- Link to v3: https://lore.kernel.org/r/20231023-display-support-v3-0-53388f3ed34b@baylibre.com

Changes in v3:
- Drop "drm/mediatek: add mt8365 dpi support" because it's the same
  config as mt8192 SoC
- Drop "dt-bindings: pwm: mediatek,pwm-disp: add power-domains property"
  because an equivalent patch has been merge already.
- Add DPI clock fix in a separate commit.
- Improve DTS(I) readability.
- Link to v2: https://lore.kernel.org/r/20231023-display-support-v2-0-33ce8864b227@baylibre.com

Changes in v2:
- s/binding/compatible/ in commit messages/titles.
- Improve commit messages as Conor suggest.
- pwm-disp: Set power domain property for MT8365. This one is optionnal
  and can be used for other SoC.
- Fix mediatek,dsi.yaml issue.
- Remove the extra clock in the DPI node/driver and fix the dpi clock
  parenting to be consistent with the DPI clock assignement.
- Link to v1: https://lore.kernel.org/r/20231023-display-support-v1-0-5c860ed5c33b@baylibre.com

[1] https://lore.kernel.org/lkml/20240516081104.83458-1-angelogioacchino.delregno@collabora.com/

---
Alexandre Mergnat (3):
      arm64: defconfig: enable display support for mt8365-evk
      drm/panel: startek-kd070fhfid015: add another init step
      drm/mediatek: dsi: remove custom init part

 arch/arm64/configs/defconfig                       |  2 ++
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c            |  2 --
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |  2 --
 drivers/gpu/drm/mediatek/mtk_dsi.c                 | 16 --------------
 .../gpu/drm/panel/panel-startek-kd070fhfid015.c    | 25 +++++++++++++---------
 5 files changed, 17 insertions(+), 30 deletions(-)
---
base-commit: 72e8ab284ff34785ec292f79610de5fcf3825b32
change-id: 20231023-display-support-c6418b30e419

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

