Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 218A7A22CF4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 13:31:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F66210E94F;
	Thu, 30 Jan 2025 12:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DorLOpSm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7159510E94F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 12:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1738240282;
 bh=93P5ZXHodgRz2/DZJHG52x9JGTE1DP1XAy3V1flSNRM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=DorLOpSmA8H+QGiEPuWaTYVCcZPO2kA/fb228oMM2O1Aid7EgEXj36ZmYy9db8zFB
 TTrKNMZStyx02apZdoaIQBD6TK3ur/o7u8+SHjRu1Qt3E5tmYqkidseVv3bCmmGgVY
 7hq3H4rLnn3ZuHfUshPH18a19ou+Kk09WTQ4VG9LLPSVyJlzdEH6Lt3ZFg/uApnqxM
 zUQNdO599Qfxwbelv3oPHfkwbNVUJy1wDl+15ZWtCDdTGinEpNQHEafurwVJWBhtIT
 xAi1G32/VA7wMCZEX8+sW87Ss+6hgGov7UiIwgpZTo0K9WdDMxWJm0JT1ZHSmwrY1+
 0vG377m4+Hypw==
Received: from yukiji.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr
 [90.76.208.231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: laeyraud)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 33CD717E10D3;
 Thu, 30 Jan 2025 13:31:21 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 30 Jan 2025 13:31:00 +0100
Subject: [PATCH v2 2/3] drm/panfrost: Add support for Mali on the MT8370
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250130-mt8370-enable-gpu-v2-2-c154d0815db5@collabora.com>
References: <20250130-mt8370-enable-gpu-v2-0-c154d0815db5@collabora.com>
In-Reply-To: <20250130-mt8370-enable-gpu-v2-0-c154d0815db5@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738240278; l=1123;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=93P5ZXHodgRz2/DZJHG52x9JGTE1DP1XAy3V1flSNRM=;
 b=N6UtDwnG820Ja6QmEOtTIDM2xlq+nyy2jgencPUCTPXYODCgxJ/NgTlaFFdS7qvHKxw1tOEVt
 qujoDiMacIeCzr9WLEQ7R6quQVNICEYyPQ7e+4Frfuidy3rh32JkwJ3
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

Add a compatible for the MediaTek MT8370 SoC, with an
integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core),
with the same platform data as MT8186 (one regulator, two power
domains).

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 0f3935556ac761adcd80197d87e8e478df436fd5..7b7e9f6f620659a7fdcb5d907ebc4f01eca876e0 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -859,6 +859,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
 	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
 	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
+	{ .compatible = "mediatek,mt8370-mali", .data = &mediatek_mt8186_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);

-- 
2.48.1

