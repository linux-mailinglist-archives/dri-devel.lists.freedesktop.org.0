Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7F075EC18
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 08:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB3E10E278;
	Mon, 24 Jul 2023 06:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6887010E275
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 06:57:27 +0000 (UTC)
Received: from srv01.abscue.de (localhost [127.0.0.1])
 by spamfilter.srv.local (Postfix) with ESMTP id 962891C015D;
 Mon, 24 Jul 2023 08:57:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on abscue.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=4.0.0
Received: from fluffy-mammal.speedport.ip
 (p200300f3cf161c9885ad30d3b3e24d7b.dip0.t-ipconnect.de
 [IPv6:2003:f3:cf16:1c98:85ad:30d3:b3e2:4d7b])
 by srv01.abscue.de (Postfix) with ESMTPSA id 432AE1C0155;
 Mon, 24 Jul 2023 08:57:25 +0200 (CEST)
From: =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/2] drm/mipi-dbi: Lock SPI bus before setting D/C GPIO
Date: Mon, 24 Jul 2023 08:56:53 +0200
Message-Id: <20230724065654.5269-2-otto.pflueger@abscue.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230724065654.5269-1-otto.pflueger@abscue.de>
References: <20230724065654.5269-1-otto.pflueger@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 David Lechner <david@lechnology.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Multiple displays may be connected to the same bus and share a D/C GPIO,
so the display driver needs exclusive access to the bus to ensure that
it can control the D/C GPIO safely.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 17 +++++++++++++----
 drivers/gpu/drm/tiny/ili9225.c |  7 ++++++-
 drivers/gpu/drm/tiny/ili9486.c |  4 ++++
 3 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index c871d9f096b8..e90f0bf895b3 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -1140,10 +1140,13 @@ static int mipi_dbi_typec3_command_read(struct mipi_dbi *dbi, u8 *cmd,
 		return -ENOMEM;
 
 	tr[1].rx_buf = buf;
+
+	spi_bus_lock(spi->controller);
 	gpiod_set_value_cansleep(dbi->dc, 0);
 
 	spi_message_init_with_transfers(&m, tr, ARRAY_SIZE(tr));
-	ret = spi_sync(spi, &m);
+	ret = spi_sync_locked(spi, &m);
+	spi_bus_unlock(spi->controller);
 	if (ret)
 		goto err_free;
 
@@ -1177,19 +1180,24 @@ static int mipi_dbi_typec3_command(struct mipi_dbi *dbi, u8 *cmd,
 
 	MIPI_DBI_DEBUG_COMMAND(*cmd, par, num);
 
+	spi_bus_lock(spi->controller);
 	gpiod_set_value_cansleep(dbi->dc, 0);
 	speed_hz = mipi_dbi_spi_cmd_max_speed(spi, 1);
 	ret = mipi_dbi_spi_transfer(spi, speed_hz, 8, cmd, 1);
+	spi_bus_unlock(spi->controller);
 	if (ret || !num)
 		return ret;
 
 	if (*cmd == MIPI_DCS_WRITE_MEMORY_START && !dbi->swap_bytes)
 		bpw = 16;
 
+	spi_bus_lock(spi->controller);
 	gpiod_set_value_cansleep(dbi->dc, 1);
 	speed_hz = mipi_dbi_spi_cmd_max_speed(spi, num);
+	ret = mipi_dbi_spi_transfer(spi, speed_hz, bpw, par, num);
+	spi_bus_unlock(spi->controller);
 
-	return mipi_dbi_spi_transfer(spi, speed_hz, bpw, par, num);
+	return ret;
 }
 
 /**
@@ -1271,7 +1279,8 @@ EXPORT_SYMBOL(mipi_dbi_spi_init);
  * @len: Buffer length
  *
  * This SPI transfer helper breaks up the transfer of @buf into chunks which
- * the SPI controller driver can handle.
+ * the SPI controller driver can handle. The SPI bus must be locked when
+ * calling this.
  *
  * Returns:
  * Zero on success, negative error code on failure.
@@ -1305,7 +1314,7 @@ int mipi_dbi_spi_transfer(struct spi_device *spi, u32 speed_hz,
 		buf += chunk;
 		len -= chunk;
 
-		ret = spi_sync(spi, &m);
+		ret = spi_sync_locked(spi, &m);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
index 077c6ff5a2e1..4ceb68ffac4b 100644
--- a/drivers/gpu/drm/tiny/ili9225.c
+++ b/drivers/gpu/drm/tiny/ili9225.c
@@ -316,19 +316,24 @@ static int ili9225_dbi_command(struct mipi_dbi *dbi, u8 *cmd, u8 *par,
 	u32 speed_hz;
 	int ret;
 
+	spi_bus_lock(spi->controller);
 	gpiod_set_value_cansleep(dbi->dc, 0);
 	speed_hz = mipi_dbi_spi_cmd_max_speed(spi, 1);
 	ret = mipi_dbi_spi_transfer(spi, speed_hz, 8, cmd, 1);
+	spi_bus_unlock(spi->controller);
 	if (ret || !num)
 		return ret;
 
 	if (*cmd == ILI9225_WRITE_DATA_TO_GRAM && !dbi->swap_bytes)
 		bpw = 16;
 
+	spi_bus_lock(spi->controller);
 	gpiod_set_value_cansleep(dbi->dc, 1);
 	speed_hz = mipi_dbi_spi_cmd_max_speed(spi, num);
+	ret = mipi_dbi_spi_transfer(spi, speed_hz, bpw, par, num);
+	spi_bus_unlock(spi->controller);
 
-	return mipi_dbi_spi_transfer(spi, speed_hz, bpw, par, num);
+	return ret;
 }
 
 static const struct drm_simple_display_pipe_funcs ili9225_pipe_funcs = {
diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index 02265c898816..938bceed5999 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -59,9 +59,11 @@ static int waveshare_command(struct mipi_dbi *mipi, u8 *cmd, u8 *par,
 	 * before being transferred as 8-bit on the big endian SPI bus.
 	 */
 	buf[0] = cpu_to_be16(*cmd);
+	spi_bus_lock(spi->controller);
 	gpiod_set_value_cansleep(mipi->dc, 0);
 	speed_hz = mipi_dbi_spi_cmd_max_speed(spi, 2);
 	ret = mipi_dbi_spi_transfer(spi, speed_hz, 8, buf, 2);
+	spi_bus_unlock(spi->controller);
 	if (ret || !num)
 		goto free;
 
@@ -79,9 +81,11 @@ static int waveshare_command(struct mipi_dbi *mipi, u8 *cmd, u8 *par,
 	if (*cmd == MIPI_DCS_WRITE_MEMORY_START && !mipi->swap_bytes)
 		bpw = 16;
 
+	spi_bus_lock(spi->controller);
 	gpiod_set_value_cansleep(mipi->dc, 1);
 	speed_hz = mipi_dbi_spi_cmd_max_speed(spi, num);
 	ret = mipi_dbi_spi_transfer(spi, speed_hz, bpw, data, num);
+	spi_bus_unlock(spi->controller);
  free:
 	kfree(buf);
 
-- 
2.39.1
