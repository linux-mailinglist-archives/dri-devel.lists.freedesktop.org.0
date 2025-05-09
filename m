Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0428DAB102D
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 12:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFE710EA05;
	Fri,  9 May 2025 10:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kQypb13/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50F410EA03
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 10:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1746785672;
 bh=33sX9S2Jlt4X8Crp65Sy6YYfUXNzf0QbXMSWJBZZdlQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=kQypb13/LhfLY/tjrv9OSS+R6um7HEh/fpcPrfA/Y9BaZiYjNbShKC6/nmU89dGTu
 uZE7G4uciOMCyGMEY61sdpvb4Lu103K5O8YgGdqx23v8ZyNJasTJM/W+dQs6qo2+wl
 4Ert/W9/Y/2E50PU2DTwqr07D/3Dtu2Tg9zdHT71b+V+NCKRCyryS6COnynxkpNr4H
 wJeXNmsHSBLx3jpTtqS+daZ7uJMJTNVS7XmZ8bWEjrFmh8HgnTx5mBhrzUYbvXbzUV
 tCgzLNL91+eShoyTPHvtsk1yPuII0QIjHknTEf1GBXuWdap28EKE4jmaYo8Gx8qdjt
 gEN6vcSujzSDQ==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr
 [83.113.51.247])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: laeyraud)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 54D8F17E0C0A;
 Fri,  9 May 2025 12:14:31 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 09 May 2025 12:12:49 +0200
Subject: [PATCH v6 3/5] drm/panfrost: Commonize Mediatek power domain array
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-mt8370-enable-gpu-v6-3-2833888cb1d3@collabora.com>
References: <20250509-mt8370-enable-gpu-v6-0-2833888cb1d3@collabora.com>
In-Reply-To: <20250509-mt8370-enable-gpu-v6-0-2833888cb1d3@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746785666; l=4267;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=33sX9S2Jlt4X8Crp65Sy6YYfUXNzf0QbXMSWJBZZdlQ=;
 b=WJVUyuGGi1RtE1ncr6ro6HoNYyaB727WpQW7A55qXFAouhejxURf32FAa/s9bN4D8upsMCajf
 +XgR3Q+WWo1BA2ugaopEUfinm6UQ5WonU3zjegpRMGKdLHbIQuk0j04
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

In the panfrost driver, the platform data of several Mediatek SoC
declares and uses several different power domains arrays according to
GPU core number present in the SoC:
- mediatek_mt8186_pm_domains (2 cores)
- mediatek_mt8183_pm_domains (3 cores)
- mediatek_mt8192_pm_domains (5 cores)

As they all are fixed arrays, starting with the same entries and the
platform data also has a power domains array length field
(num_pm_domains), they can be replaced by a single array, containing
all entries, if the num_pm_domains field of the platform data is also
set to the matching core number.

So, create a generic power domain array (mediatek_pm_domains) and use
it in the mt8183(b), mt8186, mt8188 and mt8192 platform data instead.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 7b899a9b2120c608e61dab9ca831ab8e907e8139..21b28bef84015793d9dba6b1e585891dc0dfcb6d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -789,6 +789,8 @@ static const struct panfrost_compatible amlogic_data = {
 	.vendor_quirk = panfrost_gpu_amlogic_quirk,
 };
 
+static const char * const mediatek_pm_domains[] = { "core0", "core1", "core2",
+						    "core3", "core4" };
 /*
  * The old data with two power supplies for MT8183 is here only to
  * keep retro-compatibility with older devicetrees, as DVFS will
@@ -798,48 +800,43 @@ static const struct panfrost_compatible amlogic_data = {
  * coupled regulators instead.
  */
 static const char * const legacy_supplies[] = { "mali", "sram", NULL };
-static const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "core2" };
 static const struct panfrost_compatible mediatek_mt8183_data = {
 	.num_supplies = ARRAY_SIZE(legacy_supplies) - 1,
 	.supply_names = legacy_supplies,
-	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
-	.pm_domain_names = mediatek_mt8183_pm_domains,
+	.num_pm_domains = 3,
+	.pm_domain_names = mediatek_pm_domains,
 };
 
 static const struct panfrost_compatible mediatek_mt8183_b_data = {
 	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
 	.supply_names = default_supplies,
-	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
-	.pm_domain_names = mediatek_mt8183_pm_domains,
+	.num_pm_domains = 3,
+	.pm_domain_names = mediatek_pm_domains,
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
 };
 
-static const char * const mediatek_mt8186_pm_domains[] = { "core0", "core1" };
 static const struct panfrost_compatible mediatek_mt8186_data = {
 	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
 	.supply_names = default_supplies,
-	.num_pm_domains = ARRAY_SIZE(mediatek_mt8186_pm_domains),
-	.pm_domain_names = mediatek_mt8186_pm_domains,
+	.num_pm_domains = 2,
+	.pm_domain_names = mediatek_pm_domains,
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
 };
 
-/* MT8188 uses the same power domains and power supplies as MT8183 */
 static const struct panfrost_compatible mediatek_mt8188_data = {
 	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
 	.supply_names = default_supplies,
-	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
-	.pm_domain_names = mediatek_mt8183_pm_domains,
+	.num_pm_domains = 3,
+	.pm_domain_names = mediatek_pm_domains,
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
 	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
 };
 
-static const char * const mediatek_mt8192_pm_domains[] = { "core0", "core1", "core2",
-							   "core3", "core4" };
 static const struct panfrost_compatible mediatek_mt8192_data = {
 	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
 	.supply_names = default_supplies,
-	.num_pm_domains = ARRAY_SIZE(mediatek_mt8192_pm_domains),
-	.pm_domain_names = mediatek_mt8192_pm_domains,
+	.num_pm_domains = 5,
+	.pm_domain_names = mediatek_pm_domains,
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
 	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
 };

-- 
2.49.0

