Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A3C759259
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 12:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948CA10E095;
	Wed, 19 Jul 2023 10:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646A810E0FF
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 10:07:06 +0000 (UTC)
Received: from srv01.abscue.de (localhost [127.0.0.1])
 by spamfilter.srv.local (Postfix) with ESMTP id 3C7B01C0168;
 Wed, 19 Jul 2023 11:57:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on abscue.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=4.0.0
Received: from fluffy-mammal.speedport.ip
 (p200300f3cf161c21784c9f47d061c57a.dip0.t-ipconnect.de
 [IPv6:2003:f3:cf16:1c21:784c:9f47:d061:c57a])
 by srv01.abscue.de (Postfix) with ESMTPSA id C41E51C015E;
 Wed, 19 Jul 2023 11:57:35 +0200 (CEST)
From: =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/mipi-dbi: Lock SPI bus before setting D/C GPIO
Date: Wed, 19 Jul 2023 11:53:42 +0200
Message-Id: <20230719095343.88359-2-otto.pflueger@abscue.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230719095343.88359-1-otto.pflueger@abscue.de>
References: <20230719095343.88359-1-otto.pflueger@abscue.de>
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
 =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Multiple displays may be connected to the same bus and share a D/C GPIO,
so the display driver needs exclusive access to the bus to ensure that
it can control the D/C GPIO safely.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 22 +++++++++++++++++-----
 include/drm/drm_mipi_dbi.h     |  2 +-
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index c871d9f096b8..c205b7594571 100644
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
-	ret = mipi_dbi_spi_transfer(spi, speed_hz, 8, cmd, 1);
+	ret = mipi_dbi_spi_transfer(spi, speed_hz, 8, cmd, 1, true);
+	spi_bus_unlock(spi->controller);
 	if (ret || !num)
 		return ret;
 
 	if (*cmd == MIPI_DCS_WRITE_MEMORY_START && !dbi->swap_bytes)
 		bpw = 16;
 
+	spi_bus_lock(spi->controller);
 	gpiod_set_value_cansleep(dbi->dc, 1);
 	speed_hz = mipi_dbi_spi_cmd_max_speed(spi, num);
 
-	return mipi_dbi_spi_transfer(spi, speed_hz, bpw, par, num);
+	ret = mipi_dbi_spi_transfer(spi, speed_hz, bpw, par, num, true);
+	spi_bus_unlock(spi->controller);
+	return ret;
 }
 
 /**
@@ -1269,6 +1277,7 @@ EXPORT_SYMBOL(mipi_dbi_spi_init);
  * @bpw: Bits per word
  * @buf: Buffer to transfer
  * @len: Buffer length
+ * @is_locked: Is the SPI bus locked?
  *
  * This SPI transfer helper breaks up the transfer of @buf into chunks which
  * the SPI controller driver can handle.
@@ -1277,7 +1286,7 @@ EXPORT_SYMBOL(mipi_dbi_spi_init);
  * Zero on success, negative error code on failure.
  */
 int mipi_dbi_spi_transfer(struct spi_device *spi, u32 speed_hz,
-			  u8 bpw, const void *buf, size_t len)
+			  u8 bpw, const void *buf, size_t len, bool is_locked)
 {
 	size_t max_chunk = spi_max_transfer_size(spi);
 	struct spi_transfer tr = {
@@ -1305,7 +1314,10 @@ int mipi_dbi_spi_transfer(struct spi_device *spi, u32 speed_hz,
 		buf += chunk;
 		len -= chunk;
 
-		ret = spi_sync(spi, &m);
+		if (is_locked)
+			ret = spi_sync_locked(spi, &m);
+		else
+			ret = spi_sync(spi, &m);
 		if (ret)
 			return ret;
 	}
diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
index 816f196b3d4c..da632288aff9 100644
--- a/include/drm/drm_mipi_dbi.h
+++ b/include/drm/drm_mipi_dbi.h
@@ -185,7 +185,7 @@ int mipi_dbi_poweron_conditional_reset(struct mipi_dbi_dev *dbidev);
 
 u32 mipi_dbi_spi_cmd_max_speed(struct spi_device *spi, size_t len);
 int mipi_dbi_spi_transfer(struct spi_device *spi, u32 speed_hz,
-			  u8 bpw, const void *buf, size_t len);
+			  u8 bpw, const void *buf, size_t len, bool is_locked);
 
 int mipi_dbi_command_read(struct mipi_dbi *dbi, u8 cmd, u8 *val);
 int mipi_dbi_command_buf(struct mipi_dbi *dbi, u8 cmd, u8 *data, size_t len);
-- 
2.39.1
