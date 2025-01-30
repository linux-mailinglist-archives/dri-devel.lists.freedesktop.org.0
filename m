Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0F8A22CEF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 13:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E88910E94D;
	Thu, 30 Jan 2025 12:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="K83NvuMq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B92510E94D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 12:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1738240279;
 bh=BOe8T7yqL2fWxNPADFS1rLyrsJ45Ih63iRFkiHDXmZE=;
 h=From:Subject:Date:To:Cc:From;
 b=K83NvuMqExr+ZhY3w+crCwNhTjyuiKpJ3vafFjv8X7pb377cieVBMc6ZlzU/5k5Wc
 gyBnr7QKEThKc/BS5nxZ50zY66mG46MzMFL4blZHNidvTn68B0F3++rMC+ptv69gP/
 7MKjM7YEUUjwiI7a+yp51XP6FJkXAXTuYjjVVH9Z6WRsIn6Vp/hxBdOxgELjs5siVi
 5cD0xK6FZVkDMYiyV5aTrq/e0TD3ChTTgSUOn5/6kw3N7vXiCvU4VqwAyE9efLwXK8
 mqR0M/kV3VpdRwqouJD7DSZDMQPMDe4dH78Y4ZnqvAcqP5zbN5Ms3EUuxklLLpPCWR
 kFP/izdTb3oaw==
Received: from yukiji.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr
 [90.76.208.231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: laeyraud)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DD7D017E10AA;
 Thu, 30 Jan 2025 13:31:18 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH v2 0/3] Add Mali GPU support for Mediatek MT8370 SoC
Date: Thu, 30 Jan 2025 13:30:58 +0100
Message-Id: <20250130-mt8370-enable-gpu-v2-0-c154d0815db5@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAANxm2cC/22PS26EMBBEr4K8jiN/cPNZ5R7RKHKbNmMJ8MRmU
 KIRd48Ds8giy2qpX716sEwpUGZ99WCJtpBDXEpQLxVzV7uMxMNQMlNCGSGl4fPa6kZwWixOxMf
 bnWsEbzrjLeiBlb9bIh++Dub75cyJPu8FvZ5HhjYTd3Gew9pXupEa0BunLXhAaGFoal/LUmOhF
 oDkABt07K9SMTyFNB/W/PGUGmkJkRspuDYgsBVSoO36TbFfj2vIa0zfx9RNHiJPCPyzapNccGF
 LdUudMq59c3GaLMZkX4s6u+z7/gMHFpT6PgEAAA==
X-Change-ID: 20250115-mt8370-enable-gpu-3b6f595fa63d
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738240278; l=2390;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=BOe8T7yqL2fWxNPADFS1rLyrsJ45Ih63iRFkiHDXmZE=;
 b=rZUUXKvVf0uhJKG72wmAlUlnhiFSWt0wrJxRZ7ymjVMmF3wTWaNQERDW5j+0/jU6Hu9bXI6X2
 3NoKiTJEFXECw8LX1LZCaXD7O558lYtPUesioFfKxa+piRlbHUd0Rvx
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
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

This patchset adds the support of the ARM Mali G57 MC2 GPU (Valhall-JM,
dual core), integrated in the Mediatek MT8370 SoC, to the panfrost driver
and to the mt8370.dtsi include file.

I've testing this patchset on a Mediatek Genio 510 EVK board,
with a kernel based on linux-next (tag: next-20250113) plus [1] patchset.

The panfrost driver probed with the following messages:
```
panfrost 13000000.gpu: clock rate = 390000000
panfrost 13000000.gpu: mali-g57 id 0x9093 major 0x0 minor 0x0 status 0x0
panfrost 13000000.gpu: features: 00000000,000019f7, issues: 00000003,
  80000400
panfrost 13000000.gpu: Features: L2:0x08130206 Shader:0x00000000
  Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
panfrost 13000000.gpu: shader_present=0x5 l2_present=0x1
[drm] Initialized panfrost 1.3.0 for 13000000.gpu on minor 0
```

[1] https://lore.kernel.org/linux-mediatek/20250115-dts_mt8370-genio-510-v2-0-fc9b01d08834@collabora.com/

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Changes in v2:
- Rework "drm/panfrost: Add support for Mali on the MT8370 SoC" to avoid
  data structure duplication, as requested by Krzysztof Kozlowski
- Reword commit messages to use imperative mood and make new compatible
  need more explicit
- Link to v1: https://lore.kernel.org/r/20250116-mt8370-enable-gpu-v1-0-0a6b78e925c8@collabora.com

---
Louis-Alexis Eyraud (3):
      dt-bindings: gpu: mali-bifrost: Add compatible for MT8370 SoC
      drm/panfrost: Add support for Mali on the MT8370 SoC
      arm64: dts: mediatek: mt8370: Enable gpu support

 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 ++++-
 arch/arm64/boot/dts/mediatek/mt8370.dtsi                    | 9 +++++++++
 drivers/gpu/drm/panfrost/panfrost_drv.c                     | 1 +
 3 files changed, 14 insertions(+), 1 deletion(-)
---
base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
change-id: 20250115-mt8370-enable-gpu-3b6f595fa63d
prerequisite-change-id: 20250113-dts_mt8370-genio-510-3560b8010ba9:v2
prerequisite-patch-id: af53ae39240467340ac4c9cdbc8fdd949c5457a2
prerequisite-patch-id: ca07485956f81c1a40029b48d2b4bcf00d74fc13
prerequisite-patch-id: c34d9870b2c61d87ad8a6facba13d8970682e679
prerequisite-patch-id: 48784acdcdd8b886fdec9f21c9cb88abb327e2e1

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

