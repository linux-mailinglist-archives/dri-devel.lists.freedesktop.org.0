Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 388556A0A92
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 14:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2159610E4C1;
	Thu, 23 Feb 2023 13:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E084510E4C1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 13:34:54 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A42EA6602206;
 Thu, 23 Feb 2023 13:34:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677159293;
 bh=J05VOJ/v8ZM7p27Zfp7JPs6FlzOQ0Zl1Z4LmO44WWW0=;
 h=From:To:Cc:Subject:Date:From;
 b=aVlcM9y0itDo2u20hnTMH+9kRHmVOG5U90DIodX+9QMNY+RItjxJq7Z1MRgEu/Sgu
 DuoBqQJCUQghxYzKMcwHuF9frPrarwqj/85fbtg9E1dIrldJ2UkGyMg8sAp0jlBrrW
 /K3I8m5WWPrEGYs5TFV4HkvPvtiL/eJPD6CDJLJcW+dzIV99WvpEu/N93o2FGwr0CC
 716Tyi5cRrxGhYzL0a9MPRAIQMSCrIkNjqjqqgZkkkxwsifnnIW/zSbHnr/FeMmP+h
 UfUsAFL8tk8A8WmGRBaMB2WP6tO7XnVD9V3SPIS61c/xybegnKC56X+jTEDuhbYEne
 ErD0hDg9xp6Rw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Subject: [PATCH v3 00/11] Panfrost: Improve and add MediaTek SoCs support
Date: Thu, 23 Feb 2023 14:34:29 +0100
Message-Id: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, wenst@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes in v3:
 - Changed MT8186 bindings to declare only two power domains
 - Added a commit introducing MT8186 specific platform data to
   panfrost_drv

Changes in v2:
 - Add power-domain-names commit from Chen-Yu to the series
 - Kept sram-supply in base schema, overridden for non-MediaTek
 - Added Reviewed-by tags from Steven Price to the driver commits
   (as released in reply to v1's cover letter - thanks!)

This series adds support for new MediaTek SoCs (MT8186/MT8192/MT8195)
and improves MT8183 support: since the mtk-regulator-coupler driver
was picked, it is now useless for Panfrost to look for, and manage,
two regulators (GPU Vcore and GPU SRAM) on MediaTek;

The aforementioned driver will take care of keeping the voltage
relation (/constraints) of the two regulators on its own when a
voltage change request is sent to the Vcore, solving the old time
issue with not working DVFS on Panfrost+MediaTek (due to devfreq
supporting only single regulator).

In the specific case of MT8183, in order to not break the ABI, it
was necessary to add a new compatible for enabling DVFS.

Alyssa Rosenzweig (3):
  drm/panfrost: Increase MAX_PM_DOMAINS to 5
  drm/panfrost: Add the MT8192 GPU ID
  drm/panfrost: Add mediatek,mt8192-mali compatible

AngeloGioacchino Del Regno (7):
  dt-bindings: gpu: mali-bifrost: Split out MediaTek power-domains
    variation
  dt-bindings: gpu: mali-bifrost: Allow up to 5 power domains for MT8192
  dt-bindings: gpu: mali-bifrost: Add compatible for MT8195 SoC
  dt-bindings: gpu: mali-bifrost: Add new MT8183 compatible
  dt-bindings: gpu: mali-bifrost: Add support for MediaTek MT8186
  drm/panfrost: Add new compatible for Mali on the MT8183 SoC
  drm/panfrost: Add support for Mali on the MT8186 SoC

Chen-Yu Tsai (1):
  dt-bindings: gpu: mali-bifrost: Add power-domain-names to base schema

 .../bindings/gpu/arm,mali-bifrost.yaml        | 80 ++++++++++++++++++-
 drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       | 37 +++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.c       |  8 ++
 4 files changed, 123 insertions(+), 4 deletions(-)

-- 
2.39.2

