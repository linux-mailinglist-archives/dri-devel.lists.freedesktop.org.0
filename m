Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B98443B9ED5
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 12:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E296E0AC;
	Fri,  2 Jul 2021 10:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2866E0AC
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 10:06:59 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id x20so12610673ljc.5
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 03:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CEiSt5frG9o3dy6EsmOYqX/mxqv+AzqOSQsYlYDE+ns=;
 b=y/bJSDjWJoWgxW3t0hZuVYG9FlNw3O1oxYrVqPo2d4vvQ2uiAM0wdRMKwg8iXh8qYm
 u/YGKV7dFKUjZFY+SY1+7EMQeSb/9DZ/a9JgMW09DOC9ImNTcte7Hvmwb2nUyiTyr10D
 ry/fg8Sv/iI75TLIzL386dG5bG9D/9mI5mz2LTLwWdiNjq7bNRvMWawEPkulcxa4/GlZ
 T4LuXhzL4XwNasN7lOpcwxBR1zluqBKttc3ohCPRamaTgsYQnUaJ7mevTKeRf2SeJnLF
 dp44HzVUTTAtjUvQqIflDJSsW6A7671oqYOpKuyeM5NEgEHR8ZyXrBX+jxblIDATpq7r
 XPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CEiSt5frG9o3dy6EsmOYqX/mxqv+AzqOSQsYlYDE+ns=;
 b=elX+PUG526lAMDAEAnBo8M/A8+6YINj9V17+JPbj/32DipwAXOEcuqv+yEFUpGSyWg
 Rssfhyqy+LQ4SI4+FKc9tLtQ4l6G2L4Wk3vmGRTSgbb4bJQaOqlfHPXoUuF6m5WWPrRF
 CeBROeMVQbxoQ2NGIrQv9y+38Ms+D0fy21BwGCX4mHxaAo0UhMgHCDY9n0s4EQRSeXwA
 3PzPs4+OeyZwkog6/4PZUXARmu6ezve+Qn1Vg5lhgul89VtlKKT5wajfv4Xw1EI/mnSv
 xOq1YM9oyPR082pBKVo2tAHkSPKkBD89q1Ano8sEvh4mNnQAFVTQTbzMsexr35nKhoVM
 h/NA==
X-Gm-Message-State: AOAM530IkdpIJcSXHXyvUsuwHK34VGDwUGi6pdAdJgVDbrOE9ZaKlo6Q
 dDcZ5uHx/mn+BYTiA3tvbA0qwQ==
X-Google-Smtp-Source: ABdhPJw9UCBcSF5PweValabUwkK385L2oN0nP8ondvpcmFYPhAHnnqJyCT9fwHQg7zKwqLGrWvSXrA==
X-Received: by 2002:a2e:5348:: with SMTP id t8mr116595ljd.343.1625220418312;
 Fri, 02 Jul 2021 03:06:58 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id q4sm311683ljh.13.2021.07.02.03.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 03:06:57 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/dbi: Print errors for mipi_dbi_command()
Date: Fri,  2 Jul 2021 12:04:55 +0200
Message-Id: <20210702100455.3928920-1-linus.walleij@linaro.org>
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

The macro mipi_dbi_command() does not report errors unless you wrap it
in another macro to do the error reporting.

Report a rate-limited error so we know what is going on.

Drop the only user in DRM using mipi_dbi_command() and actually checking
the error explicitly, let it use mipi_dbi_command_buf() directly
instead.

After this any code wishing to send command arrays can rely on
mipi_dbi_command() providing an appropriate error message if something
goes wrong.

Suggested-by: Noralf Trønnes <noralf@tronnes.org>
Suggested-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Fish out the struct device * from the DBI SPI client and use
  that to print the errors associated with the SPI device.
---
 drivers/gpu/drm/drm_mipi_dbi.c | 2 +-
 include/drm/drm_mipi_dbi.h     | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 3854fb9798e9..c7c1b75df190 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -645,7 +645,7 @@ static int mipi_dbi_poweron_reset_conditional(struct mipi_dbi_dev *dbidev, bool
 		return 1;
 
 	mipi_dbi_hw_reset(dbi);
-	ret = mipi_dbi_command(dbi, MIPI_DCS_SOFT_RESET);
+	ret = mipi_dbi_command_buf(dbi, MIPI_DCS_SOFT_RESET, NULL, 0);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "Failed to send reset command (%d)\n", ret);
 		if (dbidev->regulator)
diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
index f543d6e3e822..f00cb9690cf2 100644
--- a/include/drm/drm_mipi_dbi.h
+++ b/include/drm/drm_mipi_dbi.h
@@ -183,7 +183,11 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 #define mipi_dbi_command(dbi, cmd, seq...) \
 ({ \
 	const u8 d[] = { seq }; \
-	mipi_dbi_command_stackbuf(dbi, cmd, d, ARRAY_SIZE(d)); \
+	struct device *dev = &dbi->spi->dev; \
+	int ret; \
+	ret = mipi_dbi_command_stackbuf(dbi, cmd, d, ARRAY_SIZE(d)); \
+	if (ret) \
+		dev_err_ratelimited(dev, "error %d when sending command\n", ret); \
 })
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.31.1

