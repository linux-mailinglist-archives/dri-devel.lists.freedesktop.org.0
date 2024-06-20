Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4879E90FE39
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 10:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113C110E2DB;
	Thu, 20 Jun 2024 08:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="QbHhfFyP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB06210E84C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:05:26 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-705fff50de2so439528b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 01:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1718870726; x=1719475526; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dakUGhqrnLzB9mnNo0IKnWBzyZqbbKSfGuNLa4v3K1U=;
 b=QbHhfFyPpYq0d+612pHCDpSIZdUZJZmYjlfcFQ2TqEqPt2lBJDpatkNBxoNKql0tg3
 KeMiHXtw52MuCFVjsP8ck5+ldRIJreVWbDPgIvbNaIpxW/hmcsNn4qtV4qaJ3oiECC8c
 7Vj2tUNigDEiUinhGlVxafbA9IBcRXI/YONSMg44qjlG8JScGih8hKR2zBUipvSIFYjX
 JGGKhyDL+N/DZtPRE9N9SU6FusbU9ExZDlDoos5LwaY/2uCdeK9TP7bj6rOXVFsAo9NZ
 6SyuS5o6+90/3eUGC86R31R0Vi6AcZTDvjbydNLaXnPEhcb2ZrFBMcq0b3NsMASfS/sA
 IhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718870726; x=1719475526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dakUGhqrnLzB9mnNo0IKnWBzyZqbbKSfGuNLa4v3K1U=;
 b=u1NykPjAYoe4QIxbBHaRlyPl+pIOm9FiCCb9dSHC1lj9yOoFDZVfz0EMqPjIWbWmbU
 5LTAmM/W4SQOaM8NrnHcRhdSxJBNjxmU2/3k+QH92LCRzx5KOaWdFiRK0HfZ+Je6Lhd1
 HRd/lS9435zYlqNMDH/GDC12mzX+4zlzLAH1CF+Q2ILIi5lfQEn+2uiWeDAI3xTHdffI
 +RtYqMeTu1jpsH5VRWSanHeA1H+A83PkJQPJEXrd2yG52OBGHLvo2JDFTwQwaR/QfM5P
 fKu02tEr8XCkDAXBYvbSIlPkuDdHBOygg71KDcnoQfJ3bk4ww4LU1VkeQzpNPy+AqmMB
 yq6g==
X-Gm-Message-State: AOJu0YwqfIBEUTaEd5Ogrjm0zZnSfetflI+6KatbDWwroL0iU5sXOYv2
 Mzgzj5TJywWdv7A2sXiUSSftOeWDGEORxBqwhMjx3+1YqGvXLv/9OhR0AXghAaQ=
X-Google-Smtp-Source: AGHT+IGIgwZB7KgN6IuNTo5vHCsjNBlcvHNhq8+jPn9RYvIJI4rtbggqu0AMU3iWTk7RGtK7PqiiHQ==
X-Received: by 2002:a05:6a00:8993:b0:6ed:825b:30c0 with SMTP id
 d2e1a72fcca58-7061ac2e955mr9532567b3a.15.1718870726368; 
 Thu, 20 Jun 2024 01:05:26 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705cc96c8c5sm11805889b3a.58.2024.06.20.01.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 01:05:25 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v4 1/4] drm/panel: jd9365da: Modify the method of sending
 commands
Date: Thu, 20 Jun 2024 16:05:06 +0800
Message-Id: <20240620080509.18504-2-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240620080509.18504-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240620080509.18504-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

