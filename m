Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2598D8106
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 13:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B801B10E2D3;
	Mon,  3 Jun 2024 11:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mKRRI6jr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95ED310E2D3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 11:22:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C9817CE0B74;
 Mon,  3 Jun 2024 11:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FEE0C4AF0B;
 Mon,  3 Jun 2024 11:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717413715;
 bh=iFvgWAP20cKbo5XLn03btfYzeWKSJUOTP46lYlaH+qU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=mKRRI6jrxYULVTwEMCL2bBx3YTJzUaBcLXEpkVj+Dy7cCn90/ihl5KStcPWmGdLS0
 iDVt4L3zwylY9MjbgMnO0UQin7OQATecfwF3ocnpgh27uXej3Nz28QbhSF3KJXLAJ5
 tHV6u5TekC1j5/kz5vJ1xpzI3pOXDNNg36MjI3m5FjyVAmxwa04YuH+ZrfFQ7F37kL
 cOhIjvbTxQE+FTiT7RpgaubDayb1DUQv6jqKtJMW8W7DrmGuVHmPvSGIgkS4h2vR4+
 rWRCYBDgfbvyAlDzCGamqvque92gwlWrtd8nHztUoVx/xPTqakfMyJ57invJDhzfwN
 zQ7fX+c/a0xbw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 8F890C27C52;
 Mon,  3 Jun 2024 11:21:55 +0000 (UTC)
From: =?utf-8?q?Noralf_Tr=C3=B8nnes_via_B4_Relay?=
 <devnull+noralf.tronnes.org@kernel.org>
Date: Mon, 03 Jun 2024 13:21:33 +0200
Subject: [PATCH v3 2/5] drm/mipi-dbi: Remove mipi_dbi_machine_little_endian()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240603-panel-mipi-dbi-rgb666-v3-2-59ed53ca73da@tronnes.org>
References: <20240603-panel-mipi-dbi-rgb666-v3-0-59ed53ca73da@tronnes.org>
In-Reply-To: <20240603-panel-mipi-dbi-rgb666-v3-0-59ed53ca73da@tronnes.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <david@lechnology.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, 
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>, 
 =?utf-8?q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717413714; l=4005;
 i=noralf@tronnes.org; s=20221122; h=from:subject:message-id;
 bh=PGwohHtaQlpaHPUzPUY/RjNLR8dYXEVaagc/JZVG6k4=;
 b=ndSuO9IGmR4xSKrkU92SRT/bO8b303pHB+MZZ+zBBO3Ofyau6lj4I0xxieVtKgL7FEeuRHMiz
 NDlmaBLPhIoBayTQJ9yeaZXqYM/7+TJl7gSjLy8KkyeGwBNGepk7TTB
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

mipi_dbi_machine_little_endian() should really have been called
mipi_dbi_framebuffer_little_endian() because that's the function it
performs. When I added support for these SPI displays I thought that the
framebuffers on big endian machines were also big endian, but I have
later learned that this is not the case. There's a bit in the fourcc code
that controls this: DRM_FORMAT_BIG_ENDIAN.

Just remove the function to avoid confusion. We can add big endian support
later should the need arise and we have hardware to test on.

Instead of just amending the docs, expand it to explain the endianness
handling.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index daac649aabdb..fa8aba6dc81c 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -824,15 +824,6 @@ u32 mipi_dbi_spi_cmd_max_speed(struct spi_device *spi, size_t len)
 }
 EXPORT_SYMBOL(mipi_dbi_spi_cmd_max_speed);
 
-static bool mipi_dbi_machine_little_endian(void)
-{
-#if defined(__LITTLE_ENDIAN)
-	return true;
-#else
-	return false;
-#endif
-}
-
 /*
  * MIPI DBI Type C Option 1
  *
@@ -855,7 +846,7 @@ static int mipi_dbi_spi1e_transfer(struct mipi_dbi *dbi, int dc,
 				   const void *buf, size_t len,
 				   unsigned int bpw)
 {
-	bool swap_bytes = (bpw == 16 && mipi_dbi_machine_little_endian());
+	bool swap_bytes = (bpw == 16);
 	size_t chunk, max_chunk = dbi->tx_buf9_len;
 	struct spi_device *spi = dbi->spi;
 	struct spi_transfer tr = {
@@ -1004,7 +995,7 @@ static int mipi_dbi_spi1_transfer(struct mipi_dbi *dbi, int dc,
 		size_t chunk = min(len, max_chunk);
 		unsigned int i;
 
-		if (bpw == 16 && mipi_dbi_machine_little_endian()) {
+		if (bpw == 16) {
 			for (i = 0; i < (chunk * 2); i += 2) {
 				dst16[i]     = *src16 >> 8;
 				dst16[i + 1] = *src16++ & 0xFF;
@@ -1218,11 +1209,23 @@ static int mipi_dbi_typec3_command(struct mipi_dbi *dbi, u8 *cmd,
  * If @dc is set, a Type C Option 3 interface is assumed, if not
  * Type C Option 1.
  *
- * If the SPI master driver doesn't support the necessary bits per word,
- * the following transformation is used:
+ * If the command is %MIPI_DCS_WRITE_MEMORY_START and the pixel format is RGB565, endianness has
+ * to be taken into account. The MIPI DBI serial interface is big endian and framebuffers are
+ * assumed stored in memory as little endian (%DRM_FORMAT_BIG_ENDIAN is not supported).
  *
- * - 9-bit: reorder buffer as 9x 8-bit words, padded with no-op command.
- * - 16-bit: if big endian send as 8-bit, if little endian swap bytes
+ * This is how endianness is handled:
+ *
+ * Option 1 (D/C as a bit): The buffer is sent on the wire byte by byte so the 16-bit buffer is
+ *                          byteswapped before transfer.
+ *
+ * Option 3 (D/C as a gpio): If the SPI controller supports 16 bits per word the buffer can be
+ *                           sent as-is. If not the caller is responsible for swapping the bytes
+ *                           before calling mipi_dbi_command_buf() and the buffer is sent 8 bpw.
+ *
+ * This handling is optimised for %DRM_FORMAT_RGB565 framebuffers.
+ *
+ * If the interface is Option 1 and the SPI controller doesn't support 9 bits per word,
+ * the buffer is sent as 9x 8-bit words, padded with MIPI DCS no-op commands if necessary.
  *
  * Returns:
  * Zero on success, negative error code on failure.
@@ -1257,7 +1260,7 @@ int mipi_dbi_spi_init(struct spi_device *spi, struct mipi_dbi *dbi,
 	if (dc) {
 		dbi->command = mipi_dbi_typec3_command;
 		dbi->dc = dc;
-		if (mipi_dbi_machine_little_endian() && !spi_is_bpw_supported(spi, 16))
+		if (!spi_is_bpw_supported(spi, 16))
 			dbi->swap_bytes = true;
 	} else {
 		dbi->command = mipi_dbi_typec1_command;

-- 
2.45.1


