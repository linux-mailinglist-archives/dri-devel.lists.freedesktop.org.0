Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E43678C05EB
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 22:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C92A112BB6;
	Wed,  8 May 2024 20:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="CZx+JJVI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4375E1131DF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 20:53:34 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-5dca1efad59so168969a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 13:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715201613; x=1715806413;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cUwifRVBPToieqjWacPbUdf5yseMdcFaqlaDibxgt4s=;
 b=CZx+JJVIVQLI+WdX7IvijoAefJlg1Wh8vOMA0VSPTCx2fk7KhBN5YxImBctuNhjOJ+
 vgPQsLX+kiDSb+ZxA2XJXs/5CuE+wK+o+IwjOrg6iJErHja9GWpjwptF7k5KpVgocvZU
 ULzXk/H4oYn3i8YOgiD5gOndWdVkRVizQKbqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715201613; x=1715806413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cUwifRVBPToieqjWacPbUdf5yseMdcFaqlaDibxgt4s=;
 b=jhJ72LXDK7j6VsGr2tpQs28p4Ibm8z0lElhdIdNMH0QQEmE9xVlM+scShLDUkFwGZp
 hdFvixLLKUTxm/dJ2xgwNlTURqkfXAs43hwXXjMVT6tMG9us4K+HSGm3RTpMvblEv+U+
 2qofkwiIjxjfUW8O4OpJCFV1fOuPejZb4SRj+nmqLrkQ7sWSno1mwe8zTIDuj5+xo5QK
 YfEkqjiaiotKV2hY570SinPwLbaTsypCyQmNW+aiZBTwtDDkAChPA6lCCPG7VCMy3cfB
 4GH+vd4Faspf5XcfuhHPPQWnMndKedThnF0KKUgJPK8pnp4sn/Y95ee95tW+p+Olsiof
 OMFA==
X-Gm-Message-State: AOJu0YwVpNF5nJN/zzQnCkeLTP135rIV50VrAiY5l5aF5AU7P6fi4lQp
 j2vcaZWIZhmkdPChfioen7vLKj+pZkALQWfD1eTROAYvdwH8pmnTmFm7D7v9ljZ4vH4eRAFQ6j8
 =
X-Google-Smtp-Source: AGHT+IFMyxzdWkcZQygF37akniq9/x0yayh6Kz8V+5UyFTGH3SZDpbv1nxxrvthvVSN8GmTZvj7UOA==
X-Received: by 2002:a05:6a20:12cb:b0:1af:a45a:a854 with SMTP id
 adf61e73a8af0-1afc8d1b1d7mr4388213637.13.1715201612964; 
 Wed, 08 May 2024 13:53:32 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:40f4:feca:59e0:d3ca])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2b67126ad51sm6887a91.25.2024.05.08.13.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 13:53:30 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: lvzhaoxiong@huaqin.corp-partner.google.com,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Hsin-Yi Wang <hsinyi@google.com>, Linus Walleij <linus.walleij@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Joel Selvaraj <jo@jsfamily.in>, Brian Norris <briannorris@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 8/9] drm/panel: ili9882t: Don't use a table for initting
 panels
Date: Wed,  8 May 2024 13:51:50 -0700
Message-ID: <20240508135148.v4.8.I407b977f9508573103491df549dfaffc3688db13@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240508205222.2251854-1-dianders@chromium.org>
References: <20240508205222.2251854-1-dianders@chromium.org>
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

Consensus on the mailing lists is that panels shouldn't use a table of
init commands but should instead use init functions. With the recently
introduced mipi_dsi_dcs_write_seq_multi() this is not only clean/easy
but also saves space. Measuring before/after this change:

$ scripts/bloat-o-meter \
  .../before/panel-ilitek-ili9882t.ko \
  .../after/panel-ilitek-ili9882t.ko
add/remove: 3/2 grow/shrink: 0/2 up/down: 6834/-8177 (-1343)
Function                                     old     new   delta
starry_ili9882t_init                           -    6152   +6152
starry_ili9882t_init.d                         -     678    +678
ili9882t_disable.d                             -       4      +4
ili9882t_disable                             260     228     -32
ili9882t_prepare                             540     396    -144
.compoundliteral                             681       -    -681
starry_ili9882t_init_cmd                    7320       -   -7320
Total: Before=11928, After=10585, chg -11.26%

Let's do the conversion.

Since we're touching all the tables, let's also convert hex numbers to
lower case as per kernel conventions.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v3)

Changes in v3:
- New

 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 794 ++++++++----------
 1 file changed, 368 insertions(+), 426 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
index 267a5307041c..58fc1d799371 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
@@ -15,6 +15,8 @@
 
 #include <video/mipi_display.h>
 
+struct ili9882t;
+
 /*
  * Use this descriptor struct to describe different panels using the
  * Ilitek ILI9882T display controller.
@@ -34,7 +36,7 @@ struct panel_desc {
 
 	unsigned long mode_flags;
 	enum mipi_dsi_pixel_format format;
-	const struct panel_init_cmd *init_cmds;
+	int (*init)(struct ili9882t *boe);
 	unsigned int lanes;
 };
 
@@ -52,433 +54,372 @@ struct ili9882t {
 	struct gpio_desc *enable_gpio;
 };
 
-enum dsi_cmd_type {
-	INIT_DCS_CMD,
-	DELAY_CMD,
-};
-
-struct panel_init_cmd {
-	enum dsi_cmd_type type;
-	size_t len;
-	const char *data;
-};
-
-#define _INIT_DCS_CMD(...) { \
-	.type = INIT_DCS_CMD, \
-	.len = sizeof((char[]){__VA_ARGS__}), \
-	.data = (char[]){__VA_ARGS__} }
-
-#define _INIT_DELAY_CMD(...) { \
-	.type = DELAY_CMD,\
-	.len = sizeof((char[]){__VA_ARGS__}), \
-	.data = (char[]){__VA_ARGS__} }
-
 /* ILI9882-specific commands, add new commands as you decode them */
 #define ILI9882T_DCS_SWITCH_PAGE	0xFF
 
-#define _INIT_SWITCH_PAGE_CMD(page) \
-	_INIT_DCS_CMD(ILI9882T_DCS_SWITCH_PAGE, 0x98, 0x82, (page))
-
-static const struct panel_init_cmd starry_ili9882t_init_cmd[] = {
-	_INIT_DELAY_CMD(5),
-	_INIT_SWITCH_PAGE_CMD(0x01),
-	_INIT_DCS_CMD(0x00, 0x42),
-	_INIT_DCS_CMD(0x01, 0x11),
-	_INIT_DCS_CMD(0x02, 0x00),
-	_INIT_DCS_CMD(0x03, 0x00),
-
-	_INIT_DCS_CMD(0x04, 0x01),
-	_INIT_DCS_CMD(0x05, 0x11),
-	_INIT_DCS_CMD(0x06, 0x00),
-	_INIT_DCS_CMD(0x07, 0x00),
-
-	_INIT_DCS_CMD(0x08, 0x80),
-	_INIT_DCS_CMD(0x09, 0x81),
-	_INIT_DCS_CMD(0x0A, 0x71),
-	_INIT_DCS_CMD(0x0B, 0x00),
-
-	_INIT_DCS_CMD(0x0C, 0x00),
-	_INIT_DCS_CMD(0x0E, 0x1A),
-
-	_INIT_DCS_CMD(0x24, 0x00),
-	_INIT_DCS_CMD(0x25, 0x00),
-	_INIT_DCS_CMD(0x26, 0x00),
-	_INIT_DCS_CMD(0x27, 0x00),
-
-	_INIT_DCS_CMD(0x2C, 0xD4),
-	_INIT_DCS_CMD(0xB9, 0x40),
-
-	_INIT_DCS_CMD(0xB0, 0x11),
-
-	_INIT_DCS_CMD(0xE6, 0x32),
-	_INIT_DCS_CMD(0xD1, 0x30),
-
-	_INIT_DCS_CMD(0xD6, 0x55),
-
-	_INIT_DCS_CMD(0xD0, 0x01),
-	_INIT_DCS_CMD(0xE3, 0x93),
-	_INIT_DCS_CMD(0xE4, 0x00),
-	_INIT_DCS_CMD(0xE5, 0x80),
-
-	_INIT_DCS_CMD(0x31, 0x07),
-	_INIT_DCS_CMD(0x32, 0x07),
-	_INIT_DCS_CMD(0x33, 0x07),
-	_INIT_DCS_CMD(0x34, 0x07),
-	_INIT_DCS_CMD(0x35, 0x07),
-	_INIT_DCS_CMD(0x36, 0x01),
-	_INIT_DCS_CMD(0x37, 0x00),
-	_INIT_DCS_CMD(0x38, 0x28),
-	_INIT_DCS_CMD(0x39, 0x29),
-	_INIT_DCS_CMD(0x3A, 0x11),
-	_INIT_DCS_CMD(0x3B, 0x13),
-	_INIT_DCS_CMD(0x3C, 0x15),
-	_INIT_DCS_CMD(0x3D, 0x17),
-	_INIT_DCS_CMD(0x3E, 0x09),
-	_INIT_DCS_CMD(0x3F, 0x0D),
-	_INIT_DCS_CMD(0x40, 0x02),
-	_INIT_DCS_CMD(0x41, 0x02),
-	_INIT_DCS_CMD(0x42, 0x02),
-	_INIT_DCS_CMD(0x43, 0x02),
-	_INIT_DCS_CMD(0x44, 0x02),
-	_INIT_DCS_CMD(0x45, 0x02),
-	_INIT_DCS_CMD(0x46, 0x02),
-
-	_INIT_DCS_CMD(0x47, 0x07),
-	_INIT_DCS_CMD(0x48, 0x07),
-	_INIT_DCS_CMD(0x49, 0x07),
-	_INIT_DCS_CMD(0x4A, 0x07),
-	_INIT_DCS_CMD(0x4B, 0x07),
-	_INIT_DCS_CMD(0x4C, 0x01),
-	_INIT_DCS_CMD(0x4D, 0x00),
-	_INIT_DCS_CMD(0x4E, 0x28),
-	_INIT_DCS_CMD(0x4F, 0x29),
-	_INIT_DCS_CMD(0x50, 0x10),
-	_INIT_DCS_CMD(0x51, 0x12),
-	_INIT_DCS_CMD(0x52, 0x14),
-	_INIT_DCS_CMD(0x53, 0x16),
-	_INIT_DCS_CMD(0x54, 0x08),
-	_INIT_DCS_CMD(0x55, 0x0C),
-	_INIT_DCS_CMD(0x56, 0x02),
-	_INIT_DCS_CMD(0x57, 0x02),
-	_INIT_DCS_CMD(0x58, 0x02),
-	_INIT_DCS_CMD(0x59, 0x02),
-	_INIT_DCS_CMD(0x5A, 0x02),
-	_INIT_DCS_CMD(0x5B, 0x02),
-	_INIT_DCS_CMD(0x5C, 0x02),
-
-	_INIT_DCS_CMD(0x61, 0x07),
-	_INIT_DCS_CMD(0x62, 0x07),
-	_INIT_DCS_CMD(0x63, 0x07),
-	_INIT_DCS_CMD(0x64, 0x07),
-	_INIT_DCS_CMD(0x65, 0x07),
-	_INIT_DCS_CMD(0x66, 0x01),
-	_INIT_DCS_CMD(0x67, 0x00),
-	_INIT_DCS_CMD(0x68, 0x28),
-	_INIT_DCS_CMD(0x69, 0x29),
-	_INIT_DCS_CMD(0x6A, 0x16),
-	_INIT_DCS_CMD(0x6B, 0x14),
-	_INIT_DCS_CMD(0x6C, 0x12),
-	_INIT_DCS_CMD(0x6D, 0x10),
-	_INIT_DCS_CMD(0x6E, 0x0C),
-	_INIT_DCS_CMD(0x6F, 0x08),
-	_INIT_DCS_CMD(0x70, 0x02),
-	_INIT_DCS_CMD(0x71, 0x02),
-	_INIT_DCS_CMD(0x72, 0x02),
-	_INIT_DCS_CMD(0x73, 0x02),
-	_INIT_DCS_CMD(0x74, 0x02),
-	_INIT_DCS_CMD(0x75, 0x02),
-	_INIT_DCS_CMD(0x76, 0x02),
-
-	_INIT_DCS_CMD(0x77, 0x07),
-	_INIT_DCS_CMD(0x78, 0x07),
-	_INIT_DCS_CMD(0x79, 0x07),
-	_INIT_DCS_CMD(0x7A, 0x07),
-	_INIT_DCS_CMD(0x7B, 0x07),
-	_INIT_DCS_CMD(0x7C, 0x01),
-	_INIT_DCS_CMD(0x7D, 0x00),
-	_INIT_DCS_CMD(0x7E, 0x28),
-	_INIT_DCS_CMD(0x7F, 0x29),
-	_INIT_DCS_CMD(0x80, 0x17),
-	_INIT_DCS_CMD(0x81, 0x15),
-	_INIT_DCS_CMD(0x82, 0x13),
-	_INIT_DCS_CMD(0x83, 0x11),
-	_INIT_DCS_CMD(0x84, 0x0D),
-	_INIT_DCS_CMD(0x85, 0x09),
-	_INIT_DCS_CMD(0x86, 0x02),
-	_INIT_DCS_CMD(0x87, 0x07),
-	_INIT_DCS_CMD(0x88, 0x07),
-	_INIT_DCS_CMD(0x89, 0x07),
-	_INIT_DCS_CMD(0x8A, 0x07),
-	_INIT_DCS_CMD(0x8B, 0x07),
-	_INIT_DCS_CMD(0x8C, 0x07),
-
-	_INIT_SWITCH_PAGE_CMD(0x02),
-	_INIT_DCS_CMD(0x29, 0x3A),
-	_INIT_DCS_CMD(0x2A, 0x3B),
-
-	_INIT_DCS_CMD(0x06, 0x01),
-	_INIT_DCS_CMD(0x07, 0x01),
-	_INIT_DCS_CMD(0x08, 0x0C),
-	_INIT_DCS_CMD(0x09, 0x44),
-
-	_INIT_DCS_CMD(0x3C, 0x0A),
-	_INIT_DCS_CMD(0x39, 0x11),
-	_INIT_DCS_CMD(0x3D, 0x00),
-	_INIT_DCS_CMD(0x3A, 0x0C),
-	_INIT_DCS_CMD(0x3B, 0x44),
-
-	_INIT_DCS_CMD(0x53, 0x1F),
-	_INIT_DCS_CMD(0x5E, 0x40),
-	_INIT_DCS_CMD(0x84, 0x00),
-
-	_INIT_SWITCH_PAGE_CMD(0x03),
-	_INIT_DCS_CMD(0x20, 0x01),
-	_INIT_DCS_CMD(0x21, 0x3C),
-	_INIT_DCS_CMD(0x22, 0xFA),
-
-	_INIT_SWITCH_PAGE_CMD(0x0A),
-	_INIT_DCS_CMD(0xE0, 0x01),
-	_INIT_DCS_CMD(0xE2, 0x01),
-	_INIT_DCS_CMD(0xE5, 0x91),
-	_INIT_DCS_CMD(0xE6, 0x3C),
-	_INIT_DCS_CMD(0xE7, 0x00),
-	_INIT_DCS_CMD(0xE8, 0xFA),
-
-	_INIT_SWITCH_PAGE_CMD(0x12),
-	_INIT_DCS_CMD(0x87, 0x2C),
-
-	_INIT_SWITCH_PAGE_CMD(0x05),
-	_INIT_DCS_CMD(0x73, 0xE5),
-	_INIT_DCS_CMD(0x7F, 0x6B),
-	_INIT_DCS_CMD(0x6D, 0xA4),
-	_INIT_DCS_CMD(0x79, 0x54),
-	_INIT_DCS_CMD(0x69, 0x97),
-	_INIT_DCS_CMD(0x6A, 0x97),
-	_INIT_DCS_CMD(0xA5, 0x3F),
-	_INIT_DCS_CMD(0x61, 0xDA),
-	_INIT_DCS_CMD(0xA7, 0xF1),
-	_INIT_DCS_CMD(0x5F, 0x01),
-	_INIT_DCS_CMD(0x62, 0x3F),
-	_INIT_DCS_CMD(0x1D, 0x90),
-	_INIT_DCS_CMD(0x86, 0x87),
-
-	_INIT_SWITCH_PAGE_CMD(0x06),
-	_INIT_DCS_CMD(0xC0, 0x80),
-	_INIT_DCS_CMD(0xC1, 0x07),
-	_INIT_DCS_CMD(0xCA, 0x58),
-	_INIT_DCS_CMD(0xCB, 0x02),
-	_INIT_DCS_CMD(0xCE, 0x58),
-	_INIT_DCS_CMD(0xCF, 0x02),
-	_INIT_DCS_CMD(0x67, 0x60),
-	_INIT_DCS_CMD(0x10, 0x00),
-	_INIT_DCS_CMD(0x92, 0x22),
-	_INIT_DCS_CMD(0xD3, 0x08),
-	_INIT_DCS_CMD(0xD6, 0x55),
-	_INIT_DCS_CMD(0xDC, 0x38),
-
-	_INIT_SWITCH_PAGE_CMD(0x08),
-	_INIT_DCS_CMD(0xE0, 0x00, 0x10, 0x2A, 0x4D, 0x61, 0x56, 0x6A, 0x6E, 0x79, 0x76, 0x8F, 0x95, 0x98, 0xAE, 0xAA, 0xB2, 0xBB, 0xCE, 0xC6, 0xBD, 0xD5, 0xE2, 0xE8),
-	_INIT_DCS_CMD(0xE1, 0x00, 0x10, 0x2A, 0x4D, 0x61, 0x56, 0x6A, 0x6E, 0x79, 0x76, 0x8F, 0x95, 0x98, 0xAE, 0xAA, 0xB2, 0xBB, 0xCE, 0xC6, 0xBD, 0xD5, 0xE2, 0xE8),
-
-	_INIT_SWITCH_PAGE_CMD(0x04),
-	_INIT_DCS_CMD(0xBA, 0x81),
-
-	_INIT_SWITCH_PAGE_CMD(0x0C),
-	_INIT_DCS_CMD(0x00, 0x02),
-	_INIT_DCS_CMD(0x01, 0x00),
-	_INIT_DCS_CMD(0x02, 0x03),
-	_INIT_DCS_CMD(0x03, 0x01),
-	_INIT_DCS_CMD(0x04, 0x03),
-	_INIT_DCS_CMD(0x05, 0x02),
-	_INIT_DCS_CMD(0x06, 0x04),
-	_INIT_DCS_CMD(0x07, 0x03),
-	_INIT_DCS_CMD(0x08, 0x03),
-	_INIT_DCS_CMD(0x09, 0x04),
-	_INIT_DCS_CMD(0x0A, 0x04),
-	_INIT_DCS_CMD(0x0B, 0x05),
-	_INIT_DCS_CMD(0x0C, 0x04),
-	_INIT_DCS_CMD(0x0D, 0x06),
-	_INIT_DCS_CMD(0x0E, 0x05),
-	_INIT_DCS_CMD(0x0F, 0x07),
-	_INIT_DCS_CMD(0x10, 0x04),
-	_INIT_DCS_CMD(0x11, 0x08),
-	_INIT_DCS_CMD(0x12, 0x05),
-	_INIT_DCS_CMD(0x13, 0x09),
-	_INIT_DCS_CMD(0x14, 0x05),
-	_INIT_DCS_CMD(0x15, 0x0A),
-	_INIT_DCS_CMD(0x16, 0x06),
-	_INIT_DCS_CMD(0x17, 0x0B),
-	_INIT_DCS_CMD(0x18, 0x05),
-	_INIT_DCS_CMD(0x19, 0x0C),
-	_INIT_DCS_CMD(0x1A, 0x06),
-	_INIT_DCS_CMD(0x1B, 0x0D),
-	_INIT_DCS_CMD(0x1C, 0x06),
-	_INIT_DCS_CMD(0x1D, 0x0E),
-	_INIT_DCS_CMD(0x1E, 0x07),
-	_INIT_DCS_CMD(0x1F, 0x0F),
-	_INIT_DCS_CMD(0x20, 0x06),
-	_INIT_DCS_CMD(0x21, 0x10),
-	_INIT_DCS_CMD(0x22, 0x07),
-	_INIT_DCS_CMD(0x23, 0x11),
-	_INIT_DCS_CMD(0x24, 0x07),
-	_INIT_DCS_CMD(0x25, 0x12),
-	_INIT_DCS_CMD(0x26, 0x08),
-	_INIT_DCS_CMD(0x27, 0x13),
-	_INIT_DCS_CMD(0x28, 0x07),
-	_INIT_DCS_CMD(0x29, 0x14),
-	_INIT_DCS_CMD(0x2A, 0x08),
-	_INIT_DCS_CMD(0x2B, 0x15),
-	_INIT_DCS_CMD(0x2C, 0x08),
-	_INIT_DCS_CMD(0x2D, 0x16),
-	_INIT_DCS_CMD(0x2E, 0x09),
-	_INIT_DCS_CMD(0x2F, 0x17),
-	_INIT_DCS_CMD(0x30, 0x08),
-	_INIT_DCS_CMD(0x31, 0x18),
-	_INIT_DCS_CMD(0x32, 0x09),
-	_INIT_DCS_CMD(0x33, 0x19),
-	_INIT_DCS_CMD(0x34, 0x09),
-	_INIT_DCS_CMD(0x35, 0x1A),
-	_INIT_DCS_CMD(0x36, 0x0A),
-	_INIT_DCS_CMD(0x37, 0x1B),
-	_INIT_DCS_CMD(0x38, 0x0A),
-	_INIT_DCS_CMD(0x39, 0x1C),
-	_INIT_DCS_CMD(0x3A, 0x0A),
-	_INIT_DCS_CMD(0x3B, 0x1D),
-	_INIT_DCS_CMD(0x3C, 0x0A),
-	_INIT_DCS_CMD(0x3D, 0x1E),
-	_INIT_DCS_CMD(0x3E, 0x0A),
-	_INIT_DCS_CMD(0x3F, 0x1F),
-
-	_INIT_SWITCH_PAGE_CMD(0x04),
-	_INIT_DCS_CMD(0xBA, 0x01),
-
-	_INIT_SWITCH_PAGE_CMD(0x0E),
-	_INIT_DCS_CMD(0x02, 0x0C),
-	_INIT_DCS_CMD(0x20, 0x10),
-	_INIT_DCS_CMD(0x25, 0x16),
-	_INIT_DCS_CMD(0x26, 0xE0),
-	_INIT_DCS_CMD(0x27, 0x00),
-	_INIT_DCS_CMD(0x29, 0x71),
-	_INIT_DCS_CMD(0x2A, 0x46),
-	_INIT_DCS_CMD(0x2B, 0x1F),
-	_INIT_DCS_CMD(0x2D, 0xC7),
-	_INIT_DCS_CMD(0x31, 0x02),
-	_INIT_DCS_CMD(0x32, 0xDF),
-	_INIT_DCS_CMD(0x33, 0x5A),
-	_INIT_DCS_CMD(0x34, 0xC0),
-	_INIT_DCS_CMD(0x35, 0x5A),
-	_INIT_DCS_CMD(0x36, 0xC0),
-	_INIT_DCS_CMD(0x38, 0x65),
-	_INIT_DCS_CMD(0x80, 0x3E),
-	_INIT_DCS_CMD(0x81, 0xA0),
-	_INIT_DCS_CMD(0xB0, 0x01),
-	_INIT_DCS_CMD(0xB1, 0xCC),
-	_INIT_DCS_CMD(0xC0, 0x12),
-	_INIT_DCS_CMD(0xC2, 0xCC),
-	_INIT_DCS_CMD(0xC3, 0xCC),
-	_INIT_DCS_CMD(0xC4, 0xCC),
-	_INIT_DCS_CMD(0xC5, 0xCC),
-	_INIT_DCS_CMD(0xC6, 0xCC),
-	_INIT_DCS_CMD(0xC7, 0xCC),
-	_INIT_DCS_CMD(0xC8, 0xCC),
-	_INIT_DCS_CMD(0xC9, 0xCC),
-	_INIT_DCS_CMD(0x30, 0x00),
-	_INIT_DCS_CMD(0x00, 0x81),
-	_INIT_DCS_CMD(0x08, 0x02),
-	_INIT_DCS_CMD(0x09, 0x00),
-	_INIT_DCS_CMD(0x07, 0x21),
-	_INIT_DCS_CMD(0x04, 0x10),
-
-	_INIT_SWITCH_PAGE_CMD(0x1E),
-	_INIT_DCS_CMD(0x60, 0x00),
-	_INIT_DCS_CMD(0x64, 0x00),
-	_INIT_DCS_CMD(0x6D, 0x00),
-
-	_INIT_SWITCH_PAGE_CMD(0x0B),
-	_INIT_DCS_CMD(0xA6, 0x44),
-	_INIT_DCS_CMD(0xA7, 0xB6),
-	_INIT_DCS_CMD(0xA8, 0x03),
-	_INIT_DCS_CMD(0xA9, 0x03),
-	_INIT_DCS_CMD(0xAA, 0x51),
-	_INIT_DCS_CMD(0xAB, 0x51),
-	_INIT_DCS_CMD(0xAC, 0x04),
-	_INIT_DCS_CMD(0xBD, 0x92),
-	_INIT_DCS_CMD(0xBE, 0xA1),
-
-	_INIT_SWITCH_PAGE_CMD(0x05),
-	_INIT_DCS_CMD(0x86, 0x87),
-
-	_INIT_SWITCH_PAGE_CMD(0x06),
-	_INIT_DCS_CMD(0x92, 0x22),
-
-	_INIT_SWITCH_PAGE_CMD(0x00),
-	_INIT_DCS_CMD(MIPI_DCS_EXIT_SLEEP_MODE),
-	_INIT_DELAY_CMD(120),
-	_INIT_DCS_CMD(MIPI_DCS_SET_DISPLAY_ON),
-	_INIT_DELAY_CMD(20),
-	{},
-};
+#define ili9882t_switch_page(ctx, page) \
+	mipi_dsi_dcs_write_seq_multi(ctx, ILI9882T_DCS_SWITCH_PAGE, \
+				     0x98, 0x82, (page))
 
-static inline struct ili9882t *to_ili9882t(struct drm_panel *panel)
+static int starry_ili9882t_init(struct ili9882t *ili)
 {
-	return container_of(panel, struct ili9882t, base);
-}
+	struct mipi_dsi_multi_context ctx = { .dsi = ili->dsi };
+
+	usleep_range(5000, 5100);
+
+	ili9882t_switch_page(&ctx, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x42);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x02, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x03, 0x00);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x04, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x05, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x06, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x07, 0x00);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x08, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x09, 0x81);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0a, 0x71);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0b, 0x00);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0e, 0x1a);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x24, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x25, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x26, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x27, 0x00);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2c, 0xd4);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb9, 0x40);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0x11);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe6, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd1, 0x30);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd6, 0x55);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd0, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe3, 0x93);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe4, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe5, 0x80);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x31, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x32, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x33, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x34, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x36, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x38, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x39, 0x29);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3a, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3b, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3c, 0x15);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3d, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3e, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3f, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x40, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x41, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x42, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x43, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x44, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x45, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x46, 0x02);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x47, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x48, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x49, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4a, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4b, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4c, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4e, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4f, 0x29);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x50, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x51, 0x12);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x52, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x53, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x54, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x56, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x57, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x58, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x59, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5a, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5b, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5c, 0x02);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x61, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x62, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x63, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x64, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x65, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x66, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x67, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x68, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x69, 0x29);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6a, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6b, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6c, 0x12);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6d, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6e, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6f, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x70, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x71, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x72, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x73, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x74, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x75, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x76, 0x02);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x77, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x78, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x79, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7a, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7b, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7c, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7e, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7f, 0x29);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x80, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x81, 0x15);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x82, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x83, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x84, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x85, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x86, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x87, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x88, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x89, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x8a, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x8b, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x8c, 0x07);
+
+	ili9882t_switch_page(&ctx, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29, 0x3a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2a, 0x3b);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x06, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x07, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x08, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x09, 0x44);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3c, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x39, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3a, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3b, 0x44);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x53, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5e, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x84, 0x00);
+
+	ili9882t_switch_page(&ctx, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x20, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x21, 0x3c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x22, 0xfa);
+
+	ili9882t_switch_page(&ctx, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe0, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe2, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe5, 0x91);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe6, 0x3c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe7, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe8, 0xfa);
+
+	ili9882t_switch_page(&ctx, 0x12);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x87, 0x2c);
+
+	ili9882t_switch_page(&ctx, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x73, 0xe5);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7f, 0x6b);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6d, 0xa4);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x79, 0x54);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x69, 0x97);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6a, 0x97);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xa5, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x61, 0xda);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xa7, 0xf1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5f, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x62, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1d, 0x90);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x86, 0x87);
+
+	ili9882t_switch_page(&ctx, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc0, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc1, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xca, 0x58);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xcb, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xce, 0x58);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xcf, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x67, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x10, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x92, 0x22);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd3, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd6, 0x55);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xdc, 0x38);
+
+	ili9882t_switch_page(&ctx, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe0, 0x00, 0x10, 0x2a, 0x4d, 0x61, 0x56, 0x6a, 0x6e,
+				     0x79, 0x76, 0x8f, 0x95, 0x98, 0xae, 0xaa, 0xb2, 0xbb, 0xce,
+				     0xc6, 0xbd, 0xd5, 0xe2, 0xe8);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe1, 0x00, 0x10, 0x2a, 0x4d, 0x61, 0x56, 0x6a, 0x6e,
+				     0x79, 0x76, 0x8f, 0x95, 0x98, 0xae, 0xaa, 0xb2, 0xbb, 0xce,
+				     0xc6, 0xbd, 0xd5, 0xe2, 0xe8);
+
+	ili9882t_switch_page(&ctx, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xba, 0x81);
+
+	ili9882t_switch_page(&ctx, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x02, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x03, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x04, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x05, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x06, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x07, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x08, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x09, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0a, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0b, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0c, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0d, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0e, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0f, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x10, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x12, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x13, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x14, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x15, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x16, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x17, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x18, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x19, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1a, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1b, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1c, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1d, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1e, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1f, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x20, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x21, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x22, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x23, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x24, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x25, 0x12);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x26, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x27, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x28, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2a, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2b, 0x15);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2c, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2d, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2e, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2f, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x30, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x31, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x32, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x33, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x34, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0x1a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x36, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0x1b);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x38, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x39, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3a, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3b, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3c, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3d, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3e, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3f, 0x1f);
+
+	ili9882t_switch_page(&ctx, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xba, 0x01);
+
+	ili9882t_switch_page(&ctx, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x02, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x20, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x25, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x26, 0xe0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x27, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29, 0x71);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2a, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2b, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2d, 0xc7);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x31, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x32, 0xdf);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x33, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x34, 0xc0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x36, 0xc0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x38, 0x65);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x80, 0x3e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x81, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb1, 0xcc);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc0, 0x12);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc2, 0xcc);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc3, 0xcc);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc4, 0xcc);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc5, 0xcc);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc6, 0xcc);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc7, 0xcc);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc8, 0xcc);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc9, 0xcc);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x30, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x81);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x08, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x09, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x07, 0x21);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x04, 0x10);
+
+	ili9882t_switch_page(&ctx, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x60, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x64, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6d, 0x00);
+
+	ili9882t_switch_page(&ctx, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xa6, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xa7, 0xb6);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xa8, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xa9, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xaa, 0x51);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xab, 0x51);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xac, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xbd, 0x92);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xbe, 0xa1);
+
+	ili9882t_switch_page(&ctx, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x86, 0x87);
+
+	ili9882t_switch_page(&ctx, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x92, 0x22);
+
+	ili9882t_switch_page(&ctx, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, MIPI_DCS_EXIT_SLEEP_MODE);
+	if (ctx.accum_err)
+		return ctx.accum_err;
+
+	msleep(120);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, MIPI_DCS_SET_DISPLAY_ON);
+	if (ctx.accum_err)
+		return ctx.accum_err;
+
+	msleep(20);
 
-static int ili9882t_init_dcs_cmd(struct ili9882t *ili)
-{
-	struct mipi_dsi_device *dsi = ili->dsi;
-	struct drm_panel *panel = &ili->base;
-	int i, err = 0;
-
-	if (ili->desc->init_cmds) {
-		const struct panel_init_cmd *init_cmds = ili->desc->init_cmds;
-
-		for (i = 0; init_cmds[i].len != 0; i++) {
-			const struct panel_init_cmd *cmd = &init_cmds[i];
-
-			switch (cmd->type) {
-			case DELAY_CMD:
-				msleep(cmd->data[0]);
-				err = 0;
-				break;
-
-			case INIT_DCS_CMD:
-				err = mipi_dsi_dcs_write(dsi, cmd->data[0],
-							 cmd->len <= 1 ? NULL :
-							 &cmd->data[1],
-							 cmd->len - 1);
-				break;
-
-			default:
-				err = -EINVAL;
-			}
-
-			if (err < 0) {
-				dev_err(panel->dev,
-					"failed to write command %u\n", i);
-				return err;
-			}
-		}
-	}
 	return 0;
-}
+};
 
-static int ili9882t_switch_page(struct mipi_dsi_device *dsi, u8 page)
+static inline struct ili9882t *to_ili9882t(struct drm_panel *panel)
 {
-	int ret;
-	const struct panel_init_cmd cmd = _INIT_SWITCH_PAGE_CMD(page);
-
-	ret = mipi_dsi_dcs_write(dsi, cmd.data[0],
-				 cmd.len <= 1 ? NULL :
-				 &cmd.data[1],
-				 cmd.len - 1);
-	if (ret) {
-		dev_err(&dsi->dev,
-			"error switching panel controller page (%d)\n", ret);
-		return ret;
-	}
-
-	return 0;
+	return container_of(panel, struct ili9882t, base);
 }
 
 static int ili9882t_enter_sleep_mode(struct ili9882t *ili)
@@ -502,10 +443,13 @@ static int ili9882t_enter_sleep_mode(struct ili9882t *ili)
 static int ili9882t_disable(struct drm_panel *panel)
 {
 	struct ili9882t *ili = to_ili9882t(panel);
-	struct mipi_dsi_device *dsi = ili->dsi;
+	struct mipi_dsi_multi_context ctx = { .dsi = ili->dsi };
 	int ret;
 
-	ili9882t_switch_page(dsi, 0x00);
+	ili9882t_switch_page(&ctx, 0x00);
+	if (ctx.accum_err)
+		return ctx.accum_err;
+
 	ret = ili9882t_enter_sleep_mode(ili);
 	if (ret < 0) {
 		dev_err(panel->dev, "failed to set panel off: %d\n", ret);
@@ -570,11 +514,9 @@ static int ili9882t_prepare(struct drm_panel *panel)
 	gpiod_set_value(ili->enable_gpio, 1);
 	usleep_range(6000, 10000);
 
-	ret = ili9882t_init_dcs_cmd(ili);
-	if (ret < 0) {
-		dev_err(panel->dev, "failed to init panel: %d\n", ret);
+	ret = ili->desc->init(ili);
+	if (ret < 0)
 		goto poweroff;
-	}
 
 	return 0;
 
@@ -620,7 +562,7 @@ static const struct panel_desc starry_ili9882t_desc = {
 	.format = MIPI_DSI_FMT_RGB888,
 	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
 		      MIPI_DSI_MODE_LPM,
-	.init_cmds = starry_ili9882t_init_cmd,
+	.init = starry_ili9882t_init,
 };
 
 static int ili9882t_get_modes(struct drm_panel *panel,
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

