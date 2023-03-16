Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4156BCC77
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 11:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1066310EC42;
	Thu, 16 Mar 2023 10:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6659410EC35
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 10:20:47 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3B853660309D;
 Thu, 16 Mar 2023 10:20:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678962046;
 bh=NPP6VaAVOFpEI44miN6/IaqfO8tqUxpgcETYimQyu0Q=;
 h=From:To:Cc:Subject:Date:From;
 b=PXAB0N+wx5EOPC+IogVvomG7eWUXntn+btEZFsu7NDc5hp6DDZHdNz/wqRjNrh2uv
 tKYtrLZU6Oz3vj+StpfVirreU5JG7sF7KG7aFBmPSuB2mhUQMSG18l3RUteB3fugi1
 D+Pd3gqJ1YelF0l3xGgWSZqvfoxMvsyTJiruNvIcYY87FblCM9Bl8RG2Lt83lNcgWI
 /WVevAuBtWbv+wNR4YWcmEbAUbAEo1Udkn7bWO6w8fNqfFXS1AEl3LcevFsdh4Ww+A
 yumreiQnOmgui8cTl5bF+b9R5aAdoHsS55ssO37X7hDbGV3aBLOiX4Ptrd2SdxbVVZ
 kQrEMEgqyS8Tg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Subject: [PATCH v5 00/12] Panfrost: Improve and add MediaTek SoCs support
Date: Thu, 16 Mar 2023 11:20:29 +0100
Message-Id: <20230316102041.210269-1-angelogioacchino.delregno@collabora.com>
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

Changes in v5:
 - Changed minItems for power-domain-names in base schema as
   suggested by Rob

Changes in v4:
 - Refactored power-domains and power-domain-names exclusions as
   suggested by Krzysztof
 - Small changes in MT8192 bindings addition

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

AngeloGioacchino Del Regno (9):
  dt-bindings: gpu: mali-bifrost: Split out MediaTek power-domains
    variation
  dt-bindings: gpu: mali-bifrost: Set power-domains maxItems to 5
  dt-bindings: gpu: mali-bifrost: Fix power-domain-names validation
  dt-bindings: gpu: mali-bifrost: Add sub-schema for MT8192's power
    domains
  dt-bindings: gpu: mali-bifrost: Add new MT8183 compatible
  dt-bindings: gpu: mali-bifrost: Add support for MediaTek MT8186
  dt-bindings: gpu: mali-bifrost: Add compatible for MT8195 SoC
  drm/panfrost: Add new compatible for Mali on the MT8183 SoC
  drm/panfrost: Add support for Mali on the MT8186 SoC

 .../bindings/gpu/arm,mali-bifrost.yaml        | 80 ++++++++++++++++++-
 drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       | 37 +++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.c       |  8 ++
 4 files changed, 123 insertions(+), 4 deletions(-)

-- 
2.39.2

