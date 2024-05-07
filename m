Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C70DB8BDF24
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 11:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D8110F475;
	Tue,  7 May 2024 09:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AFxWPZ2f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 235A410F443
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 09:57:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D8349CE0CF9;
 Tue,  7 May 2024 09:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E187CC4AF66;
 Tue,  7 May 2024 09:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715075867;
 bh=pzTBdFsY2vgyd0djOYwWeG/Np5eTTYFhGJ8Nr6OdFJ4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=AFxWPZ2fp+Z6sTgKBaiBUWV68awA9EUHBXENPp+wFaGbg5RPD6GqYC2J1KgLkvplZ
 K0pgBKiOCBnbXrOoFAFSiFeiT/KMTa+f38RvUf+o5Fv+Z0/WnhKI4hy6U7OfWOGHsK
 RyOXwlsSHidf8bEoLeAUjNeyuMQ2yUQjzVSdyyf5S6m580rbKy3xDKIPbcFbMiLCqP
 DYQu06TyYp1l+W5CrNCgk1AOxFI2wDSB8O8YD++R9Ywpru6Nbe2pSaavmU6AyYbBnW
 +qnQkVyf5A4F5jwhAKqAMqGhdvQK/UpM3Nz3pEnaKl2l5i33t9EKrlpbnkK2TsER8U
 0Ne06co0sEGuA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id CED6EC25B75;
 Tue,  7 May 2024 09:57:47 +0000 (UTC)
From: =?utf-8?q?Noralf_Tr=C3=B8nnes_via_B4_Relay?=
 <devnull+noralf.tronnes.org@kernel.org>
Date: Tue, 07 May 2024 11:57:28 +0200
Subject: [PATCH 3/5] drm/mipi-dbi: Make bits per word configurable for
 pixel transfers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240507-panel-mipi-dbi-rgb666-v1-3-6799234afa3e@tronnes.org>
References: <20240507-panel-mipi-dbi-rgb666-v1-0-6799234afa3e@tronnes.org>
In-Reply-To: <20240507-panel-mipi-dbi-rgb666-v1-0-6799234afa3e@tronnes.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, 
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>, 
 =?utf-8?q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715075866; l=2428;
 i=noralf@tronnes.org; s=20221122; h=from:subject:message-id;
 bh=AmIGEMAdFZS+jdfkVlUhkfNHhhJJe5S4I+SgbI8FWNw=;
 b=dH2Eq2uELApFf98ZDX+iNqOc1vXH63r1yF/PM5SgZ9A4UUy52uTb7G+iciJqmjPJoZ1VV5FF7
 bfunytxnw6EAELcMaL3m4i+n4SaEqgYHMtk6BOWva5Tnb1HwdY/nkrA
X-Developer-Key: i=noralf@tronnes.org; a=ed25519;
 pk=0o9is4iddvvlrY3yON5SVtAbgPnVs0LfQsjfqR2Hvz8=
X-Endpoint-Received: by B4 Relay for noralf@tronnes.org/20221122 with auth_id=8
X-Original-From: =?utf-8?q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
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
Reply-To: noralf@tronnes.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Noralf Trønnes <noralf@tronnes.org>

This prepares for supporting other pixel formats than RGB565.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 14 ++++++++++----
 include/drm/drm_mipi_dbi.h     |  5 +++++
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index fa8aba6dc81c..77f8a828d6e0 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -1079,7 +1079,7 @@ static int mipi_dbi_typec1_command_read(struct mipi_dbi *dbi, u8 *cmd,
 static int mipi_dbi_typec1_command(struct mipi_dbi *dbi, u8 *cmd,
 				   u8 *parameters, size_t num)
 {
-	unsigned int bpw = (*cmd == MIPI_DCS_WRITE_MEMORY_START) ? 16 : 8;
+	unsigned int bpw = 8;
 	int ret;
 
 	if (mipi_dbi_command_is_read(dbi, *cmd))
@@ -1091,6 +1091,9 @@ static int mipi_dbi_typec1_command(struct mipi_dbi *dbi, u8 *cmd,
 	if (ret || !num)
 		return ret;
 
+	if (*cmd == MIPI_DCS_WRITE_MEMORY_START)
+		bpw = dbi->write_memory_bpw;
+
 	return mipi_dbi_spi1_transfer(dbi, 1, parameters, num, bpw);
 }
 
@@ -1184,8 +1187,8 @@ static int mipi_dbi_typec3_command(struct mipi_dbi *dbi, u8 *cmd,
 	if (ret || !num)
 		return ret;
 
-	if (*cmd == MIPI_DCS_WRITE_MEMORY_START && !dbi->swap_bytes)
-		bpw = 16;
+	if (*cmd == MIPI_DCS_WRITE_MEMORY_START)
+		bpw = dbi->write_memory_bpw;
 
 	spi_bus_lock(spi->controller);
 	gpiod_set_value_cansleep(dbi->dc, 1);
@@ -1256,12 +1259,15 @@ int mipi_dbi_spi_init(struct spi_device *spi, struct mipi_dbi *dbi,
 
 	dbi->spi = spi;
 	dbi->read_commands = mipi_dbi_dcs_read_commands;
+	dbi->write_memory_bpw = 16;
 
 	if (dc) {
 		dbi->command = mipi_dbi_typec3_command;
 		dbi->dc = dc;
-		if (!spi_is_bpw_supported(spi, 16))
+		if (!spi_is_bpw_supported(spi, 16)) {
+			dbi->write_memory_bpw = 8;
 			dbi->swap_bytes = true;
+		}
 	} else {
 		dbi->command = mipi_dbi_typec1_command;
 		dbi->tx_buf9_len = SZ_16K;
diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
index e8e0f8d39f3a..b36596efdcc3 100644
--- a/include/drm/drm_mipi_dbi.h
+++ b/include/drm/drm_mipi_dbi.h
@@ -56,6 +56,11 @@ struct mipi_dbi {
 	 */
 	struct spi_device *spi;
 
+	/**
+	 * @write_memory_bpw: Bits per word used on a MIPI_DCS_WRITE_MEMORY_START transfer
+	 */
+	unsigned int write_memory_bpw;
+
 	/**
 	 * @dc: Optional D/C gpio.
 	 */

-- 
2.45.0


