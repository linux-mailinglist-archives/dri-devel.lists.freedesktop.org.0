Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE998B42E8
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2024 01:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19DB1125BD;
	Fri, 26 Apr 2024 23:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="E1ZZo7G2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38561125BD
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 23:59:10 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2a68a2b3747so2002262a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 16:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714175949; x=1714780749;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+qxb7o7HPo8viKRZLe9p4BQ5iqFreL178XpJGb/dU1Y=;
 b=E1ZZo7G2UBYd5KfeuMp/1YFUE2jqqXLXAXn1IQe5C+Os0janamNGx5snCICSwiwGjR
 5z5uWsCsq444qtgdfJAuXeMcIQMlCLkwD8d3dvfcCnoAdozNfL/ZI4V6+FGkQUqegJjR
 lfB+GPmY/M7FmnlxfBS/gpkD03LFNmbR/epwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714175949; x=1714780749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+qxb7o7HPo8viKRZLe9p4BQ5iqFreL178XpJGb/dU1Y=;
 b=sBCMf9Vz7eR6TQF/CIba8oXkb1qulSNYn6SFCZctdXRrqZf87cMg/xy3NjrP/YhUpl
 mEGFX0gIVKGS+ckEivwXQ0sw563YHbAg4rn0jL7zydz/ObNzwSt3VaNcTwYinBge5YhP
 46JRJ2NUNK8GeaKrp5XFoCLpQczq86FBHp6Y0ceHq9cqfX1VYjYsKRir6stkkTC6KolM
 kefOQGg9vjHrgTJRIoga7Lys9a3Sl1pKZKgdcb3g2tnfPjrLbKxV8mxvzx3WYahVl+FF
 t0U6tko3d+x/MMPt8B+QKB1Aew0cmTxLg8mpcYPq1qT8FoYryPBqygzV+h0FWh4RoMq2
 TtVQ==
X-Gm-Message-State: AOJu0YySoP7kHOwtiDq6aTQVoYYV/k4U/c2jsFkTD+5WUICHGHLGHcRj
 OwDwBQ0OBXHq2/oM5MlVKIpLV5afLf84UuvMigo8CZdvAhMgnbniZLVB8BSZw4Uhm4m551v4UbU
 =
X-Google-Smtp-Source: AGHT+IFdpJhiAC1+tnidCuTWvB9wh2OGWr9Jkzg34ey8UBJO1FSWr0ht1iKJrR93nvquMsaf0LtUPg==
X-Received: by 2002:a17:90a:af83:b0:2a5:733c:3105 with SMTP id
 w3-20020a17090aaf8300b002a5733c3105mr1149099pjq.26.1714175949151; 
 Fri, 26 Apr 2024 16:59:09 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fca:3ae2:20e6:82bb])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a17090aab8400b002af41bd563esm5111939pjq.33.2024.04.26.16.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 16:59:08 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 lvzhaoxiong@huaqin.corp-partner.google.com,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Hsin-Yi Wang <hsinyi@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Joel Selvaraj <jo@jsfamily.in>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] drm/mipi-dsi: Fix theoretical int overflow in
 mipi_dsi_generic_write_seq()
Date: Fri, 26 Apr 2024 16:58:35 -0700
Message-ID: <20240426165839.v2.2.Iadb65b8add19ed3ae3ed6425011beb97e380a912@changeid>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
In-Reply-To: <20240426235857.3870424-1-dianders@chromium.org>
References: <20240426235857.3870424-1-dianders@chromium.org>
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
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- New

 include/drm/drm_mipi_dsi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index b3576be22bfa..5de2bd62448b 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -318,11 +318,11 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
 	do {                                                                   \
 		static const u8 d[] = { seq };                                 \
 		struct device *dev = &dsi->dev;                                \
-		int ret;                                                       \
+		ssize_t ret;                                                   \
 		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));           \
 		if (ret < 0) {                                                 \
 			dev_err_ratelimited(dev, "transmit data failed: %d\n", \
-					    ret);                              \
+					    (int)ret);                         \
 			return ret;                                            \
 		}                                                              \
 	} while (0)
-- 
2.44.0.769.g3c40516874-goog

