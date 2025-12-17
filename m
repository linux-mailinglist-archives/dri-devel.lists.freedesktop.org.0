Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CE7CC8F29
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 18:04:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2392710E355;
	Wed, 17 Dec 2025 17:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="j+BnazpP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8BE10E355
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 17:04:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765991040; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QQtrRqPJfkIzhiR99d1xVv8x5pTsrIGwCZinM1rQVj8uXhEkbZDdMP2WZ+AAZu/gkZlzt8P+W74puhPA5RnVtGFACRm9lzrfiefZARyCcxeKEn2anwkGXH83vdSycpMMp4Nfdr1ZcuAc30/53XVBZm+4aO7bkkUPS8lVoOKogb4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765991040;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=gk8N5vqQY6cvukhg7xoBpaUYZclsUp62GPYaQQXQv/c=; 
 b=Q86VlC/LO65zATvVKUgOHaKbR+Vnifa0h/uScna5pVFDnTYZXnGd2Wf23d3znyKAibnOpkSODWQZjpFJUpz3iLW/2WKFbkymV1NQ5PKaEEVwEOviUVFDuSELtlXIkx6rgUVafyMX/3irYjIsb+nizobtFYjFHNsjhwPwbJdDmHA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765991040; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=gk8N5vqQY6cvukhg7xoBpaUYZclsUp62GPYaQQXQv/c=;
 b=j+BnazpPrwF27LpmCixibF9xPk1nIB9HozKnyES4WbkRZIkXYD2mB/kMFKlLf8KQ
 dVS9JH1XsPPiqP6UG8enECMlY5iXJYUYuW2rZtJ+ozX2EvO/caFKbn82QrMhySWTjv6
 pkGOjc5TFZX6cs29RahPde7O1U4dw9NdBCC0vL4g=
Received: by mx.zohomail.com with SMTPS id 1765991038674334.3696027621247;
 Wed, 17 Dec 2025 09:03:58 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 0/4] Make MT8196 get its Mali GPU shader_present from nvmem
Date: Wed, 17 Dec 2025 18:03:26 +0100
Message-Id: <20251217-mt8196-shader-present-v1-0-f6f8f3aa1e93@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF7iQmkC/y2Myw7CIBBFf4XM2omCD2x/xXSBMNhZQCuDxqTpv
 0usq5tzknsWECpMAr1aoNCbhafcQO8U+NHlByGHxmAO5qyNtpjqVXcXlNEFKjgXEsoVyQR/jJ2
 N3p6gfZuP/Pl1b8PGhZ6vlq+bhLsTQj+lxLVXoSSsPO//C8O6fgFNz9d3mgAAAA==
X-Change-ID: 20251217-mt8196-shader-present-e2dc3f97fc74
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
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

The MediaTek MT8196 SoC's Mali SHADER_PRESENT register does not list
only functional shader cores, but also those that are fused off to
improve yield.

The SHADER_PRESENT bitmask with the one fused off core omitted is to be
found in an efuse. However, the efuse address is considered
confidential, and is not public knowledge.

The MT8196 GPUEB MCU, which does the power management for the Mali GPU
on this SoC, knows and reads the efuse however, and exposes it in the
shared memory intended to communicate state to the application
processor. Reading the bitmask from this shared memory area is the
vendor's intended solution.

This series models this in the binding and implements it in the
corresponding Linux drivers:
- the mali-valhall-csf binding gets an nvmem-cells/nvmem-cell-names
  property to declare that shader-present is in a different castle
- the mt8196-gpufreq binding requires nodes to expose the shader-present
  cell
- panthor checks for the presence of the shader-present cell and uses it
  as the shader-present value if it's found, instead of the Mali GPU
  register contents
- mtk-mfg-pmdomain becomes an nvmem provider and will happily serve
  queries for the shader-present cell

While it would be preferable if we could read the efuse directly, it's
not possible as things stand, and insisting on it will just keep this
hardware from working in mainline. Running a GPU workload with a
SHADER_PRESENT bitmask that includes a faulty core results in corrupt
GPU rendering output.

Modelling the mt8196-gpufreq device as a nvmem-cell provider however is
not lying about the hardware's capabilities, as it truly does provide
access to the nvmem-cell, even if it acts as a proxy.

From a bindings and panthor perspective, this is also generic enough to
where hypothetical other vendors doing the same thing (even with direct
efuse access) can rely on the same cell name and implementation.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Nicolas Frattaroli (4):
      dt-bindings: gpu: mali-valhall-csf: Add shader-present nvmem cell
      dt-bindings: power: mt8196-gpufreq: Describe nvmem provider ability
      drm/panthor: Implement reading shader_present from nvmem
      pmdomain: mediatek: mtk-mfg: Expose shader_present as nvmem cell

 .../bindings/gpu/arm,mali-valhall-csf.yaml         | 14 +++++
 .../bindings/power/mediatek,mt8196-gpufreq.yaml    | 13 +++++
 drivers/gpu/drm/panthor/panthor_hw.c               | 63 +++++++++++++++++++---
 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c       | 57 ++++++++++++++++++++
 4 files changed, 141 insertions(+), 6 deletions(-)
---
base-commit: 16f014a645fb35303b8fd3305f23f8ecd3f2f2a6
change-id: 20251217-mt8196-shader-present-e2dc3f97fc74

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

