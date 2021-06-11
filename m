Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E473F3A4A9C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 23:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509BE6F3DC;
	Fri, 11 Jun 2021 21:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938F86F3DC
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 21:29:44 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id k40so10550836lfv.7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 14:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z3S4SWBbQXkGDm7deVeJ07J9kq7j2iDnIVoqrVsMwkw=;
 b=fu8W+3jzQ/Y1ldG2d21gEG+cgLClWBJUxeKTuAsi/CovzCthZE9ePgZ6cvZKhgIymm
 9S6p0D+1JcICsM0QWyAVO7ee/cJVajRbZJuuRWvP2IzJaDImHvPanQ5x3s5iiQgLMNJs
 kzBadSUqqBXjZVX4Rz17FTwFLKcqLM1vnXoaNXvQ0Itr8mTKuaUwX4B71YSjaTZNUTnw
 GhFzQODcweMyd9LHKSsJCab5Q85CO+bN46iHev2ztVdW4pTSxMoasm3FSZBCMutq8wgc
 9pdLPsCaoUN0x5gpHQURhmxPzrpWpgyHPvXXOE3eVvWFYnV17l0c0LWSn9GkOGRBQn13
 tqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z3S4SWBbQXkGDm7deVeJ07J9kq7j2iDnIVoqrVsMwkw=;
 b=XDnfw5oUaDmV5RKedYhRiu0MLIfrNujOtWr+xOdR4L6FY1rF6+p0AZrHwAzR+ktEw+
 +t6xQ63bccGIQWwj7YO4EC9hpLAh8GxQBPzed2JayeQHbtzFcZ//aErxBDA/QTksWkBk
 5hMYdrODrA6UMtJVZeCSEI69fASuBIddTA9kPhocnlammCkuAWN8y/la66MCV8ZIKr/8
 +d9+nOrUsCCf1/sh8YbqjPX9Ah1dueXuP6v/3Kx0X8afok7toYffZxWMR4u1/4lQQKsT
 Qx7BLVswSAF/pnGw/sJ2J4trgwESpRU53MWJt0sXXTI9YIjB6xvvZ2hS+Icvo5nDdaPZ
 de9A==
X-Gm-Message-State: AOAM532YUQASzC/rcONRuBdvhEKRK+NyJJUlduWFRjV6wOexA/MaFpYc
 VjYrpxok8ajftUF4w7Tm4/4mIA==
X-Google-Smtp-Source: ABdhPJwScakcgIhl2Y6vSG/x5pOyxrM9nAdwNZJHPNxShFmPqsb8VPhSdmWv+bRgpKedeeDMSMJS1Q==
X-Received: by 2002:a05:6512:2192:: with SMTP id
 b18mr3932910lft.422.1623446982985; 
 Fri, 11 Jun 2021 14:29:42 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id c20sm695419lfv.291.2021.06.11.14.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 14:29:42 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/dbi: Support DBI typec1 read operations
Date: Fri, 11 Jun 2021 23:27:35 +0200
Message-Id: <20210611212736.668563-1-linus.walleij@linaro.org>
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

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 54 +++++++++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 43a9b739bba7..3854fb9798e9 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -928,6 +928,58 @@ static int mipi_dbi_spi1_transfer(struct mipi_dbi *dbi, int dc,
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
+	MIPI_DBI_DEBUG_COMMAND(*cmd, data, len);
+
+	return ret;
+}
+
 static int mipi_dbi_typec1_command(struct mipi_dbi *dbi, u8 *cmd,
 				   u8 *parameters, size_t num)
 {
@@ -935,7 +987,7 @@ static int mipi_dbi_typec1_command(struct mipi_dbi *dbi, u8 *cmd,
 	int ret;
 
 	if (mipi_dbi_command_is_read(dbi, *cmd))
-		return -EOPNOTSUPP;
+		return mipi_dbi_typec1_command_read(dbi, cmd, parameters, num);
 
 	MIPI_DBI_DEBUG_COMMAND(*cmd, parameters, num);
 
-- 
2.31.1

