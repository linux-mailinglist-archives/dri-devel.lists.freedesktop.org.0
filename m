Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A80178C5A34
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 19:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A4610E1E5;
	Tue, 14 May 2024 17:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="C1K6Ekmr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAEC10E1E5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 17:21:56 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1ee12baa01cso48214305ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 10:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715707315; x=1716312115;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Uu6dCXHK9Tlz6RzQlfXaGHd6MvNaaLjZ+6OmZoYDL8=;
 b=C1K6EkmrNDefs2mi9aeQevN8zvAKE9CPcweYZRBU46m6fU9e7UyoqqUFBqpbOgsMe7
 tmOPoOp77yct1Gp2U5Q+i9htWZmSGrSwuUknLJmRW7x3nbDRDgsMNlLb4HkidJhT0T0j
 4qhbEYtshRNBauiMH6TqAsXbOOVS/jsTfX5Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715707315; x=1716312115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Uu6dCXHK9Tlz6RzQlfXaGHd6MvNaaLjZ+6OmZoYDL8=;
 b=eBzcDuMkKg4YXImbLiYo/IpJYowVnORJBkEwkkwcCgt9rj1w26eik/aIjm6TsLiiML
 wLyQGZPN0PHdShEEpyreQHi33CpeLuHuoByYXxi46Psl1+esK3FQzCmxb7CvwMHZlhcq
 tBxP7yYlQinGY+YaQmifkmv331AJkAcNfghaOR2Hrbq6b6/0JEiLjp2ke3QFa/xpc60h
 YyseWsCm/OeKNDXkMnFpHOpt3EtFENuwkwFM/TQgpFHGp7pUIuJExSm4QAyAIDDHVZCN
 vABIMYMayUfFWN3nqmYgJ8uuFnj8WrtaCepVxBlEgqd99si3EkEhSGT/l5lrfVI+WGcM
 i9Mg==
X-Gm-Message-State: AOJu0Yy5IqUDkcRXQToe9fefPOCOiJfiKQaxaJYg00+2KfKgXpWhlnzv
 S8e2JuKIZLuibXjYAuwUs2uRBrfJYX0UDQeGGS0dvkkMGB/e6Jo/LyHTSlWhHjPnXQYiZvGKNqE
 =
X-Google-Smtp-Source: AGHT+IGjeyNjIsqx/qIdTeqiOr7chjKO4qVOUsbjOG2rvGAEFIqKBZ+MLM5yAX47d9CWwJWEw+PbHg==
X-Received: by 2002:a17:902:da8c:b0:1ee:b35e:963f with SMTP id
 d9443c01a7336-1ef43d18cb3mr161152385ad.26.1715707315153; 
 Tue, 14 May 2024 10:21:55 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:ef10:6fdf:5041:421f])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0bf3101csm100147575ad.121.2024.05.14.10.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 10:21:54 -0700 (PDT)
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
Subject: [PATCH v5 1/9] drm/mipi-dsi: Fix theoretical int overflow in
 mipi_dsi_dcs_write_seq()
Date: Tue, 14 May 2024 10:20:51 -0700
Message-ID: <20240514102056.v5.1.I30fa4c8348ea316c886ef8a522a52fed617f930d@changeid>
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

The mipi_dsi_dcs_write_seq() macro makes a call to
mipi_dsi_dcs_write_buffer() which returns a type ssize_t. The macro
then stores it in an int and checks to see if it's negative. This
could theoretically be a problem if "ssize_t" is larger than "int".

To see the issue, imagine that "ssize_t" is 32-bits and "int" is
16-bits, you could see a problem if there was some code out there that
looked like:

  mipi_dsi_dcs_write_seq(dsi, cmd, <32767 bytes as arguments>);

...since we'd get back that 32768 bytes were transferred and 32768
stored in a 16-bit int would look negative.

Though there are no callsites where we'd actually hit this (even if
"int" was only 16-bit), it's cleaner to make the types match so let's
fix it.

Fixes: 2a9e9daf7523 ("drm/mipi-dsi: Introduce mipi_dsi_dcs_write_seq macro")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v3)

Changes in v3:
- Use %zd in print instead of casting errors to int.

Changes in v2:
- New

 include/drm/drm_mipi_dsi.h | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 82b1cc434ea3..70ce0b8cbc68 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -333,18 +333,18 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
  * @cmd: Command
  * @seq: buffer containing data to be transmitted
  */
-#define mipi_dsi_dcs_write_seq(dsi, cmd, seq...)                           \
-	do {                                                               \
-		static const u8 d[] = { cmd, seq };                        \
-		struct device *dev = &dsi->dev;                            \
-		int ret;                                                   \
-		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));    \
-		if (ret < 0) {                                             \
-			dev_err_ratelimited(                               \
-				dev, "sending command %#02x failed: %d\n", \
-				cmd, ret);                                 \
-			return ret;                                        \
-		}                                                          \
+#define mipi_dsi_dcs_write_seq(dsi, cmd, seq...)                            \
+	do {                                                                \
+		static const u8 d[] = { cmd, seq };                         \
+		struct device *dev = &dsi->dev;                             \
+		ssize_t ret;                                                \
+		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));     \
+		if (ret < 0) {                                              \
+			dev_err_ratelimited(                                \
+				dev, "sending command %#02x failed: %zd\n", \
+				cmd, ret);                                  \
+			return ret;                                         \
+		}                                                           \
 	} while (0)
 
 /**
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

