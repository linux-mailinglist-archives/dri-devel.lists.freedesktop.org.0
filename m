Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A43914FBE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 16:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C880810E462;
	Mon, 24 Jun 2024 14:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="tmE82sAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F35B10E462
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:20:39 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1f64ecb1766so32743105ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1719238839; x=1719843639; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IW9xB7SGLE1u2drt2ajd8WcJZilPv6W7f231Ewn0yIc=;
 b=tmE82sAyA26v8W9+TdScc37zYhl0rAqiB0bWTUCO5HePtL5w5PuHia3+0cYwCf1t89
 SA5BtUoJgqNA0B878KqtsNymna73MfsyUezNtY0Ouy9bcgH8lNif530NVe7OicBUzuqY
 2DN6rrOI9Q678JkeJa8fSADCqCkNbSeboQdOViJxj6wr/pC2qHTKde0hwDkhXbLLEn4T
 ES+VSol7dfMnMujHW32DsRur26ryIbhl6EB4Xntc14ANnmYLs8OaKG6oNjy92U9rQdhV
 Iy6hZoQOEq+imUPotjqNsmqNQqiLd8pmvbjctlXB1kh9A1MDs6l8Sm2E/OTfK/UENvHC
 KPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719238839; x=1719843639;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IW9xB7SGLE1u2drt2ajd8WcJZilPv6W7f231Ewn0yIc=;
 b=Hmh/pciCdEqk50++7G1dKBuGP1kxoeX4A4yQMVHQD7nnRCHckEda0yF+yC372hR9oZ
 GuQfWPPK+oLeqXnQjSje0akAMZSKAPbGcIrGgMBWhJQ/omFHOzeLp50yuvUkGQUeuS+R
 zNTjUs4GmLwaepiZqWmpCpN0juqJDNoWrOVHx5zNP/SOUpuTgrry1VxwhPhm5hC4RnGS
 qfcXq1m1ETq0pUfq22BfOkOAjrP67Z2AB/JyJ3133gVE8VhasohuL3Lw4Fy3fm1XPGsA
 /5jGIpLqjSyp+TQJWGn0/W9Tf2PFxPiVzUYxROnii+RzNiSxptthXUcF0pUNKq7OQW2O
 yb5A==
X-Gm-Message-State: AOJu0Yyt1mIJgMye+uhD/gmvHNnr/Wslv5u9IbIa0k18ogkZwvJKiPxH
 JftvCUoURwngH9f0PJcbZpiApqlMDCPndU72lKeleaCKbXFpHp5kI9NqhZ8ZQBo=
X-Google-Smtp-Source: AGHT+IH0DteN1dbTBG1GBK0A/Io6IUJtHamrxjwv3MOs421ET94+vw2aJrPi6z85bBFLz6x8HGkyWw==
X-Received: by 2002:a17:902:c404:b0:1f4:71ef:98f8 with SMTP id
 d9443c01a7336-1fa1d3e3b9amr69848235ad.16.1719238838647; 
 Mon, 24 Jun 2024 07:20:38 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb3d5fa9sm63243855ad.206.2024.06.24.07.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 07:20:38 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com,
 jagan@edgeble.ai, neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v5 1/5] drm/panel: jd9365da: Modify the method of sending
 commands
Date: Mon, 24 Jun 2024 22:19:22 +0800
Message-Id: <20240624141926.5250-2-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240624141926.5250-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240624141926.5250-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Currently, the init_code of the jd9365da driver is placed
in the enable() function and sent, but this seems to take
a long time. It takes 17ms to send each instruction (an init
code consists of about 200 instructions), so it takes
about 3.5s to send the init_code. So we moved the sending
of the inti_code to the prepare() function, and each
instruction seemed to take only 25μs.

We checked the DSI host and found that the difference in
command sending time is caused by the different modes of
the DSI host in prepare() and enable() functions.
Our DSI Host only supports sending cmd in LP mode, The
prepare() function can directly send init_code (LP->cmd)
in LP mode, but the enable() function is in HS mode and
needs to switch to LP mode before sending init code
(HS->LP->cmd->HS). Therefore, it takes longer to send
the command.

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
Changes between V5 and V4:
- 1. No changes.

V4:https://lore.kernel.org/all/20240620080509.18504-2-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V4 and V3:
- 1. Only move mipi_dsi_dcs_write_buffer from enable() function to prepare() function,
-    and no longer use mipi_dsi_dcs_write_seq_multi.

V3:https://lore.kernel.org/all/20240614145510.22965-2-lvzhaoxiong@huaqin.corp-partner.google.com/

---
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 24 +++++++++----------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 4879835fe101..a9c483a7b3fa 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -52,21 +52,9 @@ static int jadard_enable(struct drm_panel *panel)
 {
 	struct device *dev = panel->dev;
 	struct jadard *jadard = panel_to_jadard(panel);
-	const struct jadard_panel_desc *desc = jadard->desc;
 	struct mipi_dsi_device *dsi = jadard->dsi;
-	unsigned int i;
 	int err;
 
-	msleep(10);
-
-	for (i = 0; i < desc->num_init_cmds; i++) {
-		const struct jadard_init_cmd *cmd = &desc->init_cmds[i];
-
-		err = mipi_dsi_dcs_write_buffer(dsi, cmd->data, JD9365DA_INIT_CMD_LEN);
-		if (err < 0)
-			return err;
-	}
-
 	msleep(120);
 
 	err = mipi_dsi_dcs_exit_sleep_mode(dsi);
@@ -100,6 +88,8 @@ static int jadard_disable(struct drm_panel *panel)
 static int jadard_prepare(struct drm_panel *panel)
 {
 	struct jadard *jadard = panel_to_jadard(panel);
+	const struct jadard_panel_desc *desc = jadard->desc;
+	unsigned int i;
 	int ret;
 
 	ret = regulator_enable(jadard->vccio);
@@ -117,7 +107,15 @@ static int jadard_prepare(struct drm_panel *panel)
 	msleep(10);
 
 	gpiod_set_value(jadard->reset, 1);
-	msleep(120);
+	msleep(130);
+
+	for (i = 0; i < desc->num_init_cmds; i++) {
+		const struct jadard_init_cmd *cmd = &desc->init_cmds[i];
+
+		ret = mipi_dsi_dcs_write_buffer(dsi, cmd->data, JD9365DA_INIT_CMD_LEN);
+		if (ret < 0)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.17.1

