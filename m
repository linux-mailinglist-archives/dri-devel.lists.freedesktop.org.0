Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FC48C5A35
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 19:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C507C10E26B;
	Tue, 14 May 2024 17:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jmJ8muqu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E5910E1E5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 17:21:58 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1eb24e3a2d9so51471955ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 10:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715707317; x=1716312117;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y+Or8KqEsgChQkx7PQCuukTAwNzg+3SO5efP38g6ozU=;
 b=jmJ8muquil/p48mKdg4BRH/AbxlF8QlcX+UWsG7mqC10Ls/xXVD/uzyp345nj1HIC6
 uELnz7/x82dd9ZhEfBNfnSjJrJYq7jFgDPOTRc1GQxXmj2Mx6NUVDC7MSeazqD4dXEmt
 ySsgZ+ytNN0M7VA2CQP+DR7EwWKQ7x5Oypv4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715707317; x=1716312117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y+Or8KqEsgChQkx7PQCuukTAwNzg+3SO5efP38g6ozU=;
 b=Me6LUS04tQjjlZ93TCuDnykDqxBpVcOX0WbPTNrvjs8TxoSzIpbKgLV6aRUgO6Ic21
 dk67NK9GAY9b4WPdJiGhC13m95H5fAvKCqklXgXg57tgk0MQ1dUvLoNcdn9JwHDxQnSa
 1nDmbaf3JEY+VV5Csn+7QCHoGevkW3V093mVGV8pMFWK8M+aFVlphEfGlOTcij1yDJAH
 zDJrFm7IpsHJKjMIhaYhAZ/qRZRW8BIVqbkBqG/9yDKvmMk8G4NXrwM9GudP7j0TiZZP
 Y0UxtY+oNlnp/e+PUibtaL3TemcBZqsmUIE9lOHO+r+nDfNx9m5dhwdvdUqgPK5b4dN3
 Zfmg==
X-Gm-Message-State: AOJu0Yw6pc2ZGbvKQhEM+A9U8ZLEJ+KQCrlUO4ScZEUOu8hL3IFa55oQ
 DzMeTLpzBrozzOFMJUc3Nc9yRVE1V/gt6HNnUpBXQ4qv3XL8LoK8CbYDVFN9dXAVm5pH+qLpLnI
 =
X-Google-Smtp-Source: AGHT+IE5+z/vnNxyc7q5T1nnaWe7eAZU+7yxjqVeuIT+BTUFK8rCGVprvdfaAHD303EVUueR7yCNug==
X-Received: by 2002:a17:902:6542:b0:1eb:1240:1aea with SMTP id
 d9443c01a7336-1ef43d12749mr155731325ad.20.1715707317226; 
 Tue, 14 May 2024 10:21:57 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:ef10:6fdf:5041:421f])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0bf3101csm100147575ad.121.2024.05.14.10.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 10:21:56 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 lvzhaoxiong@huaqin.corp-partner.google.com,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Brian Norris <briannorris@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Joel Selvaraj <jo@jsfamily.in>,
 Hsin-Yi Wang <hsinyi@google.com>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/9] drm/mipi-dsi: Fix theoretical int overflow in
 mipi_dsi_generic_write_seq()
Date: Tue, 14 May 2024 10:20:52 -0700
Message-ID: <20240514102056.v5.2.Iadb65b8add19ed3ae3ed6425011beb97e380a912@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240514172136.1578498-1-dianders@chromium.org>
References: <20240514172136.1578498-1-dianders@chromium.org>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mipi_dsi_generic_write_seq() macro makes a call to
mipi_dsi_generic_write() which returns a type ssize_t. The macro then
stores it in an int and checks to see if it's negative. This could
theoretically be a problem if "ssize_t" is larger than "int".

To see the issue, imagine that "ssize_t" is 32-bits and "int" is
16-bits, you could see a problem if there was some code out there that
looked like:

  mipi_dsi_generic_write_seq(dsi, <32768 bytes as arguments>);

...since we'd get back that 32768 bytes were transferred and 32768
stored in a 16-bit int would look negative.

Though there are no callsites where we'd actually hit this (even if
"int" was only 16-bit), it's cleaner to make the types match so let's
fix it.

Fixes: a9015ce59320 ("drm/mipi-dsi: Add a mipi_dsi_dcs_write_seq() macro")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v3)

Changes in v3:
- Use %zd in print instead of casting errors to int.

Changes in v2:
- New

 include/drm/drm_mipi_dsi.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 70ce0b8cbc68..e0f56564bf97 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -314,17 +314,17 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
  * @dsi: DSI peripheral device
  * @seq: buffer containing the payload
  */
-#define mipi_dsi_generic_write_seq(dsi, seq...)                                \
-	do {                                                                   \
-		static const u8 d[] = { seq };                                 \
-		struct device *dev = &dsi->dev;                                \
-		int ret;                                                       \
-		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));           \
-		if (ret < 0) {                                                 \
-			dev_err_ratelimited(dev, "transmit data failed: %d\n", \
-					    ret);                              \
-			return ret;                                            \
-		}                                                              \
+#define mipi_dsi_generic_write_seq(dsi, seq...)                                 \
+	do {                                                                    \
+		static const u8 d[] = { seq };                                  \
+		struct device *dev = &dsi->dev;                                 \
+		ssize_t ret;                                                    \
+		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));            \
+		if (ret < 0) {                                                  \
+			dev_err_ratelimited(dev, "transmit data failed: %zd\n", \
+					    ret);                               \
+			return ret;                                             \
+		}                                                               \
 	} while (0)
 
 /**
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

