Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E76213A6E0C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 20:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9872B89BF4;
	Mon, 14 Jun 2021 18:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D389989BF4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 18:13:44 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id e25so258056ljj.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 11:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vd20yFoPnATDft0FmoiW9GhRQape+3mX4NGsnoZFr0U=;
 b=zg0Sm31DbSV5fpX/GI0H5Rn/uoCkQ4KE48SO3Y6xngPLb5eTBJzImukW93FlwbDTw4
 0XmBpcx031+vi3Ka6LdtYc3dlI3mckdf6/9vYF5Q3yOHp2jdkLQA2E/eeHt0ZSzuwEGK
 EPdoeVMXCe3LQqfXEcpH245bcvod27dC89yvPJ/oY/FiV39s/Sf9/6aLKnoSHLynC5Ke
 ROK9l7YptEhzY0iNJoFjptOwLv3W2eC11FMLzrzBIAoMIG6jjvnJYxmYfUInwV05AdAZ
 CS0d/HDJlXwr7xkDan8MVt85kEN+BZOMzClf//5DQ5dGjbAKv6KfwV8R6ZNb9HgF1K+8
 7vww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vd20yFoPnATDft0FmoiW9GhRQape+3mX4NGsnoZFr0U=;
 b=b3dci76pADwiGjqJI/oIjERBdEw6fxM/JQ84Cyj03vnyE301vi+CsV5exIamUatruo
 oKk2MjHdxodyqfAVdVOBfeR420N/LjxfZHLxY8tBqnYljlmrnCcXaToK/aCiiDH3u9Ui
 LHuM/LCl4Hz5fgcWanidBTOILSh+NWXRKCUup42yw5s6j+4+rDp8mMvjiWeBqYckA5Yq
 FndEw346J7lFH/+rSFb3B11p4eYlOit1iu4uTgNWbYX0uOeZJV1lxRCjwQUZfQ8hvOWx
 64a+jRqQu0DymUOfivxgAK+ayWx9OAiDpyQHiJAD7W6GHpBx5F10vrJGpLuiSZW+TDCl
 NcJg==
X-Gm-Message-State: AOAM533n6kwUq/Gt7BTFaTgIcROLfCia64Bk9oeT0ZpNl2c97PJzUX2j
 gmRoJlR1AF/lVfd9Tn6Zj1tsag==
X-Google-Smtp-Source: ABdhPJwj+hGooNXMBN7vs0oEVeODSg9n35AmeEl7gT29UjPVZofkixos26ILCaP76quLNFNmHMTPsw==
X-Received: by 2002:a2e:a4c6:: with SMTP id p6mr14559130ljm.485.1623694423210; 
 Mon, 14 Jun 2021 11:13:43 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id v26sm1678013lfp.0.2021.06.14.11.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 11:13:42 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2 v2] drm/dbi: Support DBI typec1 read operations
Date: Mon, 14 Jun 2021 20:11:34 +0200
Message-Id: <20210614181135.1124445-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
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
Cc: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Douglas Anderson <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement SPI reads for typec1, for SPI controllers that
can support 9bpw in addition to 8bpw (such as GPIO bit-banged
SPI).

9bpw emulation is not supported but we have to start with
something.

This is used by s6e63m0 to read display MTP information
which is used by the driver for backlight control.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Only print MIPI_DBI_DEBUG_COMMAND if ret == 0
- Collect Noralf's Reviewed-by
- Collect Doug's Reviewed-by
---
 drivers/gpu/drm/drm_mipi_dbi.c | 55 +++++++++++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 43a9b739bba7..10b4e59384ae 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -928,6 +928,59 @@ static int mipi_dbi_spi1_transfer(struct mipi_dbi *dbi, int dc,
 	return 0;
 }
 
+static int mipi_dbi_typec1_command_read(struct mipi_dbi *dbi, u8 *cmd,
+					u8 *data, size_t len)
+{
+	struct spi_device *spi = dbi->spi;
+	u32 speed_hz = min_t(u32, MIPI_DBI_MAX_SPI_READ_SPEED,
+			     spi->max_speed_hz / 2);
+	struct spi_transfer tr[2] = {
+		{
+			.speed_hz = speed_hz,
+			.bits_per_word = 9,
+			.tx_buf = dbi->tx_buf9,
+			.len = 2,
+		}, {
+			.speed_hz = speed_hz,
+			.bits_per_word = 8,
+			.len = len,
+			.rx_buf = data,
+		},
+	};
+	struct spi_message m;
+	u16 *dst16;
+	int ret;
+
+	if (!len)
+		return -EINVAL;
+
+	if (!spi_is_bpw_supported(spi, 9)) {
+		/*
+		 * FIXME: implement something like mipi_dbi_spi1e_transfer() but
+		 * for reads using emulation.
+		 */
+		dev_err(&spi->dev,
+			"reading on host not supporting 9 bpw not yet implemented\n");
+		return -EOPNOTSUPP;
+	}
+
+	/*
+	 * Turn the 8bit command into a 16bit version of the command in the
+	 * buffer. Only 9 bits of this will be used when executing the actual
+	 * transfer.
+	 */
+	dst16 = dbi->tx_buf9;
+	dst16[0] = *cmd;
+
+	spi_message_init_with_transfers(&m, tr, ARRAY_SIZE(tr));
+	ret = spi_sync(spi, &m);
+
+	if (!ret)
+		MIPI_DBI_DEBUG_COMMAND(*cmd, data, len);
+
+	return ret;
+}
+
 static int mipi_dbi_typec1_command(struct mipi_dbi *dbi, u8 *cmd,
 				   u8 *parameters, size_t num)
 {
@@ -935,7 +988,7 @@ static int mipi_dbi_typec1_command(struct mipi_dbi *dbi, u8 *cmd,
 	int ret;
 
 	if (mipi_dbi_command_is_read(dbi, *cmd))
-		return -EOPNOTSUPP;
+		return mipi_dbi_typec1_command_read(dbi, cmd, parameters, num);
 
 	MIPI_DBI_DEBUG_COMMAND(*cmd, parameters, num);
 
-- 
2.31.1

