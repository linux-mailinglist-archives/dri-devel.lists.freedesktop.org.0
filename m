Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 636DF8B8D58
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2024 17:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4571210F6FB;
	Wed,  1 May 2024 15:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="OTk6T7Xo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED97610F157
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2024 15:43:21 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6edb76d83d0so5978460b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 May 2024 08:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714578200; x=1715183000;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IqSRaJ+I/NgAMp1CRzQlMWp8eVTN4Fv5wLPbhbxPoyI=;
 b=OTk6T7XoqBocFosoR1dUNJ2RAaesv93u8u19owPSKR9WVG1iVb1FA4uBBjyIeFyEpW
 /kHuThZU13hPXd0PKK6TXoCu4tlwOjzoeLXBQ49DO1D+INbaSo95yhNi+RBth5dFRBWB
 pPt7flWdcGbo5Chkip8ZMFlDmNrFp1V1ZAoPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714578200; x=1715183000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IqSRaJ+I/NgAMp1CRzQlMWp8eVTN4Fv5wLPbhbxPoyI=;
 b=pWCnewYQtuXdr/+nfe70S35IhK1sITGg7y60ik1dtdAj+3ekqHzpWiOHSAc2FsUT1r
 BXWEWIiNZq1B3FOgIA9yvQ8EtOU0/SZrB6/veHx4XV4PyTALdCyTFFXJw1PfihOk+dok
 OYepq9/Xj0WC/ZiQ4dyKX9xBTqM86U/+bA3anvxx1V0IqZf/0LzCr1vSUhrkCDwbDfMN
 hRPbDHOtW2C1hGpQWrMG/DPyysPE/ZC0JoRddItRdr/4qzElOD6JJ/zFWLtIW3SQArHP
 A9f+LMdzDOiidjt8px07OQ2GKJJfqk/nusSxN2tmVC+JWcEttzR+Z8AYdkYfovl4R6In
 9SyQ==
X-Gm-Message-State: AOJu0YzDVah6CEO368Pe+QkL3knSjhF3iN3KmZyJVI+WF4FdcXw1mzi0
 Ac4qUj4g53amWHFLu8b1eomENjRLx4U0fs3BaIP72UviuDrgSQzai9j1uqCfeHDR3Nl/IT4QvuI
 =
X-Google-Smtp-Source: AGHT+IFI0XRKl4xlF9oA6mVlSbPDXsPwloqxxCaCX7TyGbZ6xYS649sCJKaSQ+96XKkEBKOMHdGtmg==
X-Received: by 2002:a05:6a20:2593:b0:1a9:8251:41ba with SMTP id
 k19-20020a056a20259300b001a9825141bamr3504545pzd.51.1714578200409; 
 Wed, 01 May 2024 08:43:20 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:e886:8de:19a2:55b0])
 by smtp.gmail.com with ESMTPSA id
 fb12-20020a056a002d8c00b006f3ec69bc09sm7717924pfb.75.2024.05.01.08.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 08:43:19 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Hsin-Yi Wang <hsinyi@google.com>, Brian Norris <briannorris@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Joel Selvaraj <jo@jsfamily.in>, lvzhaoxiong@huaqin.corp-partner.google.com,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/9] drm/mipi-dsi: Fix theoretical int overflow in
 mipi_dsi_dcs_write_seq()
Date: Wed,  1 May 2024 08:41:04 -0700
Message-ID: <20240501084109.v3.1.I30fa4c8348ea316c886ef8a522a52fed617f930d@changeid>
X-Mailer: git-send-email 2.45.0.rc0.197.gbae5840b3b-goog
In-Reply-To: <20240501154251.3302887-1-dianders@chromium.org>
References: <20240501154251.3302887-1-dianders@chromium.org>
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
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

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
2.45.0.rc0.197.gbae5840b3b-goog

