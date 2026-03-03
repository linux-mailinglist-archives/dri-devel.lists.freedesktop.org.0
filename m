Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCJ4EspbpmlnOgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 04:55:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2031E8999
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 04:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B0410E621;
	Tue,  3 Mar 2026 03:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mCCa/F/C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0AAB10E621
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 03:55:49 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2adbfab4501so22961005ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 19:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772510149; x=1773114949; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YzNRJhWIi16/zzfaCP1ohKWTS+93+7FOMiA4THS2R7Y=;
 b=mCCa/F/Ce1hXQVSaGBWisbWH6Aof58b4LCL7xlUg7jr9BqbRjikjTgjxG70pvDka2Q
 a0v9vIJ085HTUl54AfBuQ9wxZz8EdSkLfsILigc14Sf+lql4mk6HC73UkbHkgjW1sBFt
 0/mS7MQKgj/6zkY/OkM7hRrqKlBldzKJkQ012WeRgFyKzz+BH3ygWceyCgDVkt8c3aMZ
 yNqPg/ipTMKjk+QYNSWWHyKhnTIkEtvPWMOK3TFgfxF9DhmrgU7eUD71umlpwSN4FTkg
 lzd/GBFc+ubBH1F4X9MdodxETYsorlKvkSyj2RDIpMG/P9TOAU4H3B0M8+Qwy5JnkBP4
 THiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772510149; x=1773114949;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YzNRJhWIi16/zzfaCP1ohKWTS+93+7FOMiA4THS2R7Y=;
 b=fQLcFEr0koAXsgUEHQpYtefuNKaJqtQ9GIQz3ZdILr4QRt7fr2GSAGFzKYd7c+nmH0
 DrMQX8zOtueeCAuyXip7eFGyDaxpUqcn1SeWCFm5Vnjq+mgiiUjvr7M1TuAYY/itY582
 6Ti7A4vsxL9/chnyFADQBbzbU54Gzc819rLxasLic9stjfl2mKWrJowkvlZVL1vbR4E5
 SXftzuiAaWTBqkwQR2b8Y+hBTiefie1UYAXV9pJYKxtU3lYZcsOgeSrVsXDG+mptQ+G5
 3UUj0d4zKFI53evuzPCoFCpfJXX81Ux2tqT4hW2qgat/s0IbNDUrsAxMPydrRrX5GmDv
 gj3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdhiuYlPVkBGcIu+Bha4WjaVFxLHp561D8QhlDuOI4Tk7VArX87xlc5zGLyyQ4TsGYQ7mPaGPKSkM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2lGUgaEn5GxRAv9XBlBegWW6zDLZkrcCUXRwVzAttf1n+mt2S
 gcn4uN2QwEoPQ8RdPAqrA6pclzWhqtUGxUOnmoyfX2zg3fTx2pwwE2rg
X-Gm-Gg: ATEYQzwQ9RDgn1dHfMMrVa0ZfY7i94+br/9nbnUJYC8NcLl9rMTcXXOy4hZfWr7laGK
 6jh/onTX/kxAK26rinbBnJN6ZV2z1C9g62CXVBXe45e8zuWBHERxREclzosISG3u1uXE311KyeJ
 oTzzkJm0Zgy7+cYH3dFfEEPys5wfFqwfu+UKXD+Mmen9q+Cq0nCVyQ40fCWD5Q3ATF09Lv4ZYU0
 Ge/5Wojw9DltCzGwNW/yH3fWMGevDwOfJpAW9wbPYLJ2CcQJprZmf0HqPPVU/MfdvznDpTQ3nW5
 sdauzJOgYLQnrhQQPxlk9yIE+ZqVDJMeeRDNxy2Xly+UEVpC0J+f9tCiV1PpO85DWO/0JoSRwxz
 zTDq5LWqeBBebv4udjYh+LR5jWnTlzPpGB+FESPOHws4hZy00pvSGKS/IJjx2XF2c8lzH6mDBbh
 EBl2c3oZX6MnKJ1Ikjng4L3sMYjo/DjvrhZPdn6AFlLRBS33ze/00XdMrk4uDM01spS3V6BT8/3
 QDxNG2wdOfko68DcMkxozL3P8I2ZhCSb8gDF9yM9mJ+zeUBuhhUjB0r9MMb
X-Received: by 2002:a17:902:c94b:b0:2ae:5442:45cf with SMTP id
 d9443c01a7336-2ae54424962mr52815935ad.33.1772510149374; 
 Mon, 02 Mar 2026 19:55:49 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:f389:ec50:2d31:32f3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb6ba5eesm157089845ad.68.2026.03.02.19.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 19:55:48 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: sumit.semwal@linaro.org,
	neil.armstrong@linaro.org
Cc: dianders@chromium.org, jesszhan0024@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v2] drm/panel: novatek-nt36672a: Convert to mipi_dsi_*_multi()
 helpers
Date: Mon,  2 Mar 2026 19:55:08 -0800
Message-ID: <20260303035508.8288-1-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
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
X-Rspamd-Queue-Id: AA2031E8999
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[chromium.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:neil.armstrong@linaro.org,m:dianders@chromium.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:chintanlike@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[chintanlike@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chintanlike@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Convert the driver to use the non-deprecated mipi_dsi_*_multi() helpers and
mipi_dsi_msleep().

Switch DCS command sequences to the multi context API and
accumulate errors via struct mipi_dsi_multi_context. Replace
open-coded error handling with the multi helpers and convert
nt36672a_send_cmds() and power sequencing accordingly.

Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
Changes in v2:
- Address alignment feedback from Doug.
- Restore original power-down ordering.
- Drop return value from nt36672a_panel_power_off().
- Consolidate error handling around dsi_ctx.accum_err.

 .../gpu/drm/panel/panel-novatek-nt36672a.c    | 98 ++++++-------------
 1 file changed, 30 insertions(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
index 29e1f6aea480..3ebdc3048b26 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
@@ -79,70 +79,53 @@ static inline struct nt36672a_panel *to_nt36672a_panel(struct drm_panel *panel)
 	return container_of(panel, struct nt36672a_panel, base);
 }
 
-static int nt36672a_send_cmds(struct drm_panel *panel, const struct nt36672a_panel_cmd *cmds,
-			      int num)
+static void nt36672a_send_cmds(struct mipi_dsi_multi_context *dsi_ctx,
+			       const struct nt36672a_panel_cmd *cmds, int num)
 {
-	struct nt36672a_panel *pinfo = to_nt36672a_panel(panel);
 	unsigned int i;
-	int err;
 
 	for (i = 0; i < num; i++) {
 		const struct nt36672a_panel_cmd *cmd = &cmds[i];
 
-		err = mipi_dsi_dcs_write(pinfo->link, cmd->data[0], cmd->data + 1, 1);
-
-		if (err < 0)
-			return err;
+		/* cmd->data[0] is the DCS command, cmd->data[1] is the parameter */
+		mipi_dsi_dcs_write_buffer_multi(dsi_ctx, cmd->data, sizeof(cmd->data));
 	}
-
-	return 0;
 }
 
-static int nt36672a_panel_power_off(struct drm_panel *panel)
+static void nt36672a_panel_power_off(struct drm_panel *panel)
 {
 	struct nt36672a_panel *pinfo = to_nt36672a_panel(panel);
-	int ret = 0;
 
 	gpiod_set_value(pinfo->reset_gpio, 1);
 
-	ret = regulator_bulk_disable(ARRAY_SIZE(pinfo->supplies), pinfo->supplies);
-	if (ret)
-		dev_err(panel->dev, "regulator_bulk_disable failed %d\n", ret);
-
-	return ret;
+	if (regulator_bulk_disable(ARRAY_SIZE(pinfo->supplies), pinfo->supplies) < 0)
+		dev_err(panel->dev, "regulator_bulk_disable failed\n");
 }
 
 static int nt36672a_panel_unprepare(struct drm_panel *panel)
 {
 	struct nt36672a_panel *pinfo = to_nt36672a_panel(panel);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = pinfo->link };
 
 	/* send off cmds */
-	ret = nt36672a_send_cmds(panel, pinfo->desc->off_cmds,
-				 pinfo->desc->num_off_cmds);
+	nt36672a_send_cmds(&dsi_ctx, pinfo->desc->off_cmds,
+			   pinfo->desc->num_off_cmds);
 
-	if (ret < 0)
-		dev_err(panel->dev, "failed to send DCS off cmds: %d\n", ret);
-
-	ret = mipi_dsi_dcs_set_display_off(pinfo->link);
-	if (ret < 0)
-		dev_err(panel->dev, "set_display_off cmd failed ret = %d\n", ret);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	/* Reset error to continue power-down even if display off failed */
+	dsi_ctx.accum_err = 0;
 
 	/* 120ms delay required here as per DCS spec */
 	msleep(120);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(pinfo->link);
-	if (ret < 0)
-		dev_err(panel->dev, "enter_sleep cmd failed ret = %d\n", ret);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
 	/* 0x3C = 60ms delay */
-	msleep(60);
+	mipi_dsi_msleep(&dsi_ctx, 60);
 
-	ret = nt36672a_panel_power_off(panel);
-	if (ret < 0)
-		dev_err(panel->dev, "power_off failed ret = %d\n", ret);
+	nt36672a_panel_power_off(panel);
 
-	return ret;
+	return 0;
 }
 
 static int nt36672a_panel_power_on(struct nt36672a_panel *pinfo)
@@ -170,52 +153,31 @@ static int nt36672a_panel_power_on(struct nt36672a_panel *pinfo)
 static int nt36672a_panel_prepare(struct drm_panel *panel)
 {
 	struct nt36672a_panel *pinfo = to_nt36672a_panel(panel);
-	int err;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = pinfo->link };
 
-	err = nt36672a_panel_power_on(pinfo);
-	if (err < 0)
-		goto poweroff;
+	dsi_ctx.accum_err = nt36672a_panel_power_on(pinfo);
 
 	/* send first part of init cmds */
-	err = nt36672a_send_cmds(panel, pinfo->desc->on_cmds_1,
-				 pinfo->desc->num_on_cmds_1);
+	nt36672a_send_cmds(&dsi_ctx, pinfo->desc->on_cmds_1,
+			   pinfo->desc->num_on_cmds_1);
 
-	if (err < 0) {
-		dev_err(panel->dev, "failed to send DCS Init 1st Code: %d\n", err);
-		goto poweroff;
-	}
-
-	err = mipi_dsi_dcs_exit_sleep_mode(pinfo->link);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to exit sleep mode: %d\n", err);
-		goto poweroff;
-	}
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 
 	/* 0x46 = 70 ms delay */
-	msleep(70);
+	mipi_dsi_msleep(&dsi_ctx, 70);
 
-	err = mipi_dsi_dcs_set_display_on(pinfo->link);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to Set Display ON: %d\n", err);
-		goto poweroff;
-	}
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
 	/* Send rest of the init cmds */
-	err = nt36672a_send_cmds(panel, pinfo->desc->on_cmds_2,
-				 pinfo->desc->num_on_cmds_2);
+	nt36672a_send_cmds(&dsi_ctx, pinfo->desc->on_cmds_2,
+			   pinfo->desc->num_on_cmds_2);
 
-	if (err < 0) {
-		dev_err(panel->dev, "failed to send DCS Init 2nd Code: %d\n", err);
-		goto poweroff;
-	}
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
-	msleep(120);
+	if (dsi_ctx.accum_err < 0)
+		gpiod_set_value(pinfo->reset_gpio, 0);
 
-	return 0;
-
-poweroff:
-	gpiod_set_value(pinfo->reset_gpio, 0);
-	return err;
+	return dsi_ctx.accum_err;
 }
 
 static int nt36672a_panel_get_modes(struct drm_panel *panel,
-- 
2.43.0

