Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC6C3B9894
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 00:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086046EC6D;
	Thu,  1 Jul 2021 22:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9590D6EC6D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jul 2021 22:27:22 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id a11so14541549lfg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jul 2021 15:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nYq5B2eCjHaLj+NviWCnlDjQJJ2Evn2WlQpXkMJEiog=;
 b=SIt34orSu2HmTfN+acJyw7AUW/E3pZIIJ+idzW64FXXjqQJ4JRhtHwQmeHwnisgxqQ
 djrWumQVoDXjAIEMv3QAyewsy1zZqvTC5WGaCetB5FJpNIoltk+/ArWXwitFwhYASKuf
 YBQk1aqzmOHMCmx4IIKnv7lhbXj7Ig6798/c9GwB38+IyAuWunSzgvqNf7lhvIL9VEDT
 AzHEOuOHnlMC9sM5hIdmP9D67b5o7BTtPx9acIAuFeFL6ibmti7qtB0J1zxP9SoRcLLK
 lBpoyunFFiipVM0o3xb4YncKDwhExd1xbgLzJpTRWFP2OrDc7s6kWZjsTu+Ewd+5c+Kt
 h/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nYq5B2eCjHaLj+NviWCnlDjQJJ2Evn2WlQpXkMJEiog=;
 b=mJI1pceuUX4iqdOSBm81WKHAITp/zZumJDH3SrpMRM2Rft2xgfqW1WZrXyxONEo3MZ
 oAJYC7C4B54P01/bP+4VUpLvUg1UqPZFDcKjh7aBoVaFQUrdvh+r8x9PxUxX1jcBp0DP
 dq2GpP28TPsnIdkeZS7hn5bzN7bat5A/RxrK8vCPYP42X8+7ycEfXasx4xHvFEtlH/8k
 7Mb/Il58b3In2gamOCssfnl9oELWahsrVgqs/x0RrtUIaIDU+IIKIBlE3gnSqRjf2srT
 qcnUf9jqvsYdx7EOWBO9VKq1TnQ2TGTx/KcyVx5suQd8uv2m5Q04KhpV556qRSYf0GV/
 hXHQ==
X-Gm-Message-State: AOAM533F92tQ0/fU2uSqbsL0TcuqENo5v7hOeQlY9nIDu2LWzBKF2w5Z
 /H3bsn3Wk7hqeJuZ9Qf9AET6Gw==
X-Google-Smtp-Source: ABdhPJyt4VsDo1nIt0rH487VFwTxtI3gbxMsPc0tcWnAhDNMnscyp3mhedRaSCueXDHZbQaYJK4e9Q==
X-Received: by 2002:a05:6512:3b8c:: with SMTP id
 g12mr1383492lfv.551.1625178440891; 
 Thu, 01 Jul 2021 15:27:20 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id i1sm95719ljn.40.2021.07.01.15.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 15:27:20 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/dbi: Print errors for mipi_dbi_command()
Date: Fri,  2 Jul 2021 00:25:18 +0200
Message-Id: <20210701222518.3895552-1-linus.walleij@linaro.org>
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
 drivers/gpu/drm/drm_mipi_dbi.c | 2 +-
 include/drm/drm_mipi_dbi.h     | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

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
index f543d6e3e822..2057ad32760c 100644
--- a/include/drm/drm_mipi_dbi.h
+++ b/include/drm/drm_mipi_dbi.h
@@ -183,7 +183,10 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 #define mipi_dbi_command(dbi, cmd, seq...) \
 ({ \
 	const u8 d[] = { seq }; \
-	mipi_dbi_command_stackbuf(dbi, cmd, d, ARRAY_SIZE(d)); \
+	int ret; \
+	ret = mipi_dbi_command_stackbuf(dbi, cmd, d, ARRAY_SIZE(d)); \
+	if (ret) \
+		pr_err_ratelimited("MIPI DBI: error %d when sending command\n", ret); \
 })
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.31.1

