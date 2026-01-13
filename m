Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C74DD1B1FD
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 20:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935B110E546;
	Tue, 13 Jan 2026 19:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jb8LY3ai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9EC210E541
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 19:59:50 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-7c6d13986f8so162660a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 11:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768334390; x=1768939190; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/1xCfJteJeME9NGRhsVNII7duVLe6cYsSH/mt2zuydA=;
 b=Jb8LY3aimRKsFBDIrZnvGcj6uGw7PUnloSfkf3B39OhVuBOULOgKGgmOVX0b2k8sfG
 3/oVeYOvuvhYBd9GvrKE2AfbBX4t5e/aKMIwmBvJ8UyezxYDsAZN1CTpvKOubY4//T4Z
 qeca1q/Z5yTgGT4bT0DFmZAgumXuaxJ9q/3sA7f/cQT6645fmMC4VYe+V/Yg4SNjtHmR
 cK68jCxGY20WhsXFnYYqwWpUXxPNGiXUxijA/RhEHWQic3bhqukqd+U/uluDBhsstNNF
 Zb5ssqaxc1pAXqRO8TIfolA1PTkuMZmtWsRTGLhJSSIhwFKYzat1womQcqLRVNIGQkvw
 KQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768334390; x=1768939190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/1xCfJteJeME9NGRhsVNII7duVLe6cYsSH/mt2zuydA=;
 b=j+21XsW1oVNcfSLV3m5HkOEwy/OVQkXItL/JcH65gUPLCfGo62yFGhopcoeiss/EiX
 I5j7A3AuU8psixjba98xe5yPehxR5yCSGaFHqNASZ05VvUfVxH1VLvg1KGp8nomK58S3
 1pQ7yVNCungwNgZ0NX640stjlh6Ipgig2PKtiVbZqH1lNf8VPLmSO33J+yMbrnl1YoNr
 LA8BFlt/mZH+vACviRXw6KGFzSFb8e0FpKIvRnYlYb0vLDxqz7iYgmFChlyJeh1nxamj
 29eWuU7F8sY1Xdy8nvESIAOExqYGNx6fLzq4UuLyDMEhfhNynp3NusZf09nMFVwo0gjy
 1CQA==
X-Gm-Message-State: AOJu0Yw3gdKldKq27seoSWT/qnQuwGHVcpKZHZJNQqDdmf3kXqsY1B8j
 1kyb3hH0lnXtdRVdn+s2ODYmYSjZsJkbFh2LNjXSg4P1OUEmvAA2mmbH
X-Gm-Gg: AY/fxX6AirpZZGYWRzpqbJMtpWzkNc8uo3c4MCcpHjj3ePsjmjkyN5J0yOAaicy/G0o
 DdHQIYLs1B6Zk7pW2ndjdohSVmhrr/4VSTE5aUXYiW9mDzdfE84bDI2SLdfCl0UvYtHfddCUbQN
 B5oqP1jZaFBLKAAkA9VWX9P+0v6LNc4sw/TX/Wn0uzjahXqUDmPmYM9XTxHgDW7sLbvLAHiGBZZ
 WnL5vY+UMy+hzJliZkPC5Z/YzvtaZo+dv4Xvhf1bbFZmjat0TRSyeTLNkHzCTfKEbojItEdhyLN
 zPgKw2+1hBQqTqGbUbB2FZaomguaTkGVPj7GKgK1QkNnQzuhUJ7mGgTulMmlw3LYwTcIV7IUq/i
 ZcX7DhSbwyntjPdARVc+H2Tkibx4K4GgSgyhDca1U0aXX/i9WIS3iQvW3HWloJWgz/u3kc6jYjS
 WBL/KbCd3t
X-Received: by 2002:a9d:6c10:0:b0:7cd:f5dc:56ea with SMTP id
 46e09a7af769-7cfbe3dad50mr1674790a34.4.1768334390048; 
 Tue, 13 Jan 2026 11:59:50 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7ce47801d4dsm16221119a34.5.2026.01.13.11.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 11:59:49 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 dmitry.torokhov@gmail.com, simona@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jesszhan0024@gmail.com, neil.armstrong@linaro.org, jagan@edgeble.ai,
 heiko@sntech.de, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 aweinzerl13@yahoo.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 3/6] drm/panel: jd9365da: Support for Anbernic RG-DS Panel
Date: Tue, 13 Jan 2026 13:57:18 -0600
Message-ID: <20260113195721.151205-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113195721.151205-1-macroalpha82@gmail.com>
References: <20260113195721.151205-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Add support for both panels used in the Anbernic RG-DS. These panels
are physically identical and differ only with a single instruction
in the init sequence. The init sequence commands suggest it uses
an identical controller as the jd9365da.

Additionally, allow specifying per-panel dsi->mode_flags that can
override the default values.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Co-developed-by: Alexander Weinzerl <aweinzerl13@yahoo.com>
Signed-off-by: Alexander Weinzerl <aweinzerl13@yahoo.com>
---
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 271 +++++++++++++++++-
 1 file changed, 269 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 063ed9646d53..5386a06fcd08 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -33,6 +33,7 @@ struct jadard_panel_desc {
 	unsigned int backlight_off_to_display_off_delay_ms;
 	unsigned int display_off_to_enter_sleep_delay_ms;
 	unsigned int enter_sleep_to_reset_down_delay_ms;
+	unsigned long mode_flags;
 };
 
 struct jadard {
@@ -1113,6 +1114,258 @@ static const struct jadard_panel_desc melfas_lmfbx101117480_desc = {
 	.enter_sleep_to_reset_down_delay_ms = 100,
 };
 
+static int anbernic_rgds_init_cmds(struct jadard *jadard)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
+	struct drm_panel *panel = &jadard->panel;
+
+	jd9365da_switch_page(&dsi_ctx, 0x0);
+
+	jadard_enable_standard_cmds(&dsi_ctx);
+
+	jd9365da_switch_page(&dsi_ctx, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x6a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x6a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x74);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xbf);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0xbf);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0xfe);
+
+	if (of_device_is_compatible(panel->dev->of_node,
+				    "anbernic,rg-ds-display-top"))
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x05);
+	else
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x09);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0xf7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x3c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x6d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x22);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x3a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x2d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x1b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x22);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x3a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x2d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x1b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x00);
+
+	jd9365da_switch_page(&dsi_ctx, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x5e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x5e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x26, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2c, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2d, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2e, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x30, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x31, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x32, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x46, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x47, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4a, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4c, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4d, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4e, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4f, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x50, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x51, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x52, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x53, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x54, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0xe9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0xe9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0xda);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0xfc);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x83, 0xf4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x87, 0x10);
+
+	jd9365da_switch_page(&dsi_ctx, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0xb3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x58);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x0f);
+
+	jd9365da_switch_page(&dsi_ctx, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x1d);
+
+	jd9365da_switch_page(&dsi_ctx, 0x00);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 10);
+
+	return dsi_ctx.accum_err;
+};
+
+static const struct jadard_panel_desc anbernic_rgds_display_desc = {
+	.mode = {
+		.clock		= (640 + 260 + 220 + 260) * (480 + 10 + 2 + 16) * 60 / 1000,
+
+		.hdisplay	= 640,
+		.hsync_start	= 640 + 260,
+		.hsync_end	= 640 + 260 + 220,
+		.htotal		= 640 + 260 + 220 + 260,
+
+		.vdisplay	= 480,
+		.vsync_start	= 480 + 10,
+		.vsync_end	= 480 + 10 + 2,
+		.vtotal		= 480 + 10 + 2 + 16,
+
+		.width_mm	= 68,
+		.height_mm	= 87,
+		.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+		.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	},
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init = anbernic_rgds_init_cmds,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
+};
+
 static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 {
 	struct device *dev = &dsi->dev;
@@ -1126,8 +1379,14 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 		return PTR_ERR(jadard);
 
 	desc = of_device_get_match_data(dev);
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_NO_EOT_PACKET;
+
+	if (desc->mode_flags)
+		dsi->mode_flags = desc->mode_flags;
+	else
+		dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
+				  MIPI_DSI_MODE_VIDEO_BURST |
+				  MIPI_DSI_MODE_NO_EOT_PACKET;
+
 	dsi->format = desc->format;
 	dsi->lanes = desc->lanes;
 
@@ -1176,6 +1435,14 @@ static void jadard_dsi_remove(struct mipi_dsi_device *dsi)
 }
 
 static const struct of_device_id jadard_of_match[] = {
+	{
+		.compatible = "anbernic,rg-ds-display-bottom",
+		.data = &anbernic_rgds_display_desc
+	},
+	{
+		.compatible = "anbernic,rg-ds-display-top",
+		.data = &anbernic_rgds_display_desc
+	},
 	{
 		.compatible = "chongzhou,cz101b4001",
 		.data = &cz101b4001_desc
-- 
2.43.0

