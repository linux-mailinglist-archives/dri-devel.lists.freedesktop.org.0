Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1644DA2C6C1
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 16:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B789410EB46;
	Fri,  7 Feb 2025 15:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mianmZKb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364E910EB3C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 15:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1738941521;
 bh=I4naQ4du97R0ib9F27jLpy7nIKZ3D3FTwYtREBA8SF0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mianmZKbEEIXaY0pyE8qmNml7S5tH7mMg6iQyxOf/jTsADYmnSpA8d1Bbb2JGPRjX
 CP9pWVAHBZUVauj+aPe8cB9j0KfaBVuXxK6RL82O9K4aZkhAzawn4/Cyn19LmQ7xBZ
 VVYswt7nr0agGAkX08/I+hTLnj62H3ppKMgjmFFhcepyBWqxpC3FS8mVrwXLlRcHPy
 uP4WBHbf+KchpaB6D6kROgJ6Sai75NFlYwD5FK1eWi9q4bFmMfwS5jKFw/QBrr+pT/
 aJYNbcKNcSVr4HjjiET4/wtIMEZgxS5s0TuKHv24J38ZDpW0reuk5UXlPmNuQyDcBC
 JauUwICBOLZhQ==
Received: from yukiji.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr
 [90.76.208.231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: laeyraud)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id F21EA17E10B5;
 Fri,  7 Feb 2025 16:18:40 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 07 Feb 2025 16:18:31 +0100
Subject: [PATCH v3 2/3] drm/panfrost: Add support for Mali on the MT8370
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-mt8370-enable-gpu-v3-2-75e9b902f9c1@collabora.com>
References: <20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com>
In-Reply-To: <20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738941518; l=1373;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=I4naQ4du97R0ib9F27jLpy7nIKZ3D3FTwYtREBA8SF0=;
 b=6EopXfZjmiAqGuV53X9US0qgB2osoMvaZrSYUiqqyZXINeVtqzc40DXaXLGUNgknMbzJFPeqX
 K68iZTd1j4PBWW8A9wOwzN9IEdQsGMRhmUMZ2n4f1fAJbZ8Qhwm2wTg
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
Despite their different GPU architecture (making them not being
compatible), the MT8186 platform data can still be used for MT8370
because it only describes supplies, pm_domains and enablement of power
management features in the panfrost driver.

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

