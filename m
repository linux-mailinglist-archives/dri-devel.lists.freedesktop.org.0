Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 631FCAD14D4
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 23:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A44F10EDAD;
	Sun,  8 Jun 2025 21:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="L2C4AF21";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ZUUqGiMv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9DE10E077
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 14:38:16 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bFcrg5n5qz9tLb;
 Sun,  8 Jun 2025 16:29:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1749392979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZeCefA3P5IASqdj+LeZ+xE90hGJvP5XfofYKX5OpXho=;
 b=L2C4AF21HqDBj8ASogL2wuEE6MNQZD8vYUKMgtWH3GkdKBawEmm0iBnN/eJu6Cbet/Wss6
 OzO0ugfUyHiyNAiktyjETs2YpaeF/8uUxnLZBVu9oWNGmF9A6ByEquRnVcdNS/kR8/O5qD
 kKJHucCUIYYvTvjpHzCvw0zdIqdmrNjy9/6ZrGGXWUA3jZnoc1UwN1yxRXC1yy5ckebaTB
 pJYrGAYWZJ9GDdDMNLu4DaoZWUjDZuMNhQPWEiybAaBwgQSU0YfdudMTB5OeMVV+PnzcNA
 74b6MLVwmnqH8HM89clPP6lvpYLDS5WRh1skc4VUnPc7Y3nTfA6Ck5641D0gJw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1749392977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZeCefA3P5IASqdj+LeZ+xE90hGJvP5XfofYKX5OpXho=;
 b=ZUUqGiMv7evt2R/zvdGnNl4enFOawgSZdVYB2Oh2K4JCY7tABrUwzTJpl+3SAO4vkIpH7+
 s9v30QQ8mudktclhovhk6k54j7fQE82lZ+Vz8vp9o01+JdQpD4BPJ+OQyh05be2U1dvAKu
 kpZeHmyeDjFd91V936i5CsXm3+EPFLMIzyOpKSb1J+99Lmdm3Auj/fjTdEigwloFCGnK/b
 F9JPrw/aRWEk/qN02r326oW7/lN7XpkWba9ho3W/uqFbIAXP8DAMrGctQ5eFQ5xuSBATaC
 BpCaoO0Cyl6daM7xTEyPsnYZ5SBcKtMQlPxLxmEWVzYdEE7IbKqmEechRmLl0Q==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/3] drm/panel: ilitek-ili9881c: Allow configuration of the
 number of lanes
Date: Sun,  8 Jun 2025 16:28:17 +0200
Message-ID: <20250608142908.54121-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250608142908.54121-1-marek.vasut+renesas@mailbox.org>
References: <20250608142908.54121-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: sxb63c6q46ru8tuix71q97gg3wsxs8z7
X-MBO-RS-ID: e4380f2ea91e0367887
X-Mailman-Approved-At: Sun, 08 Jun 2025 21:44:43 +0000
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

Not all panels use all 4 data lanes, so allow configuration based
on the compatible string.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Based on https://github.com/raspberrypi/linux 0d7ac78a3dd9 ("Extending ili9881c driver support for nwe080 panel")
by Dave Stevenson <dave.stevenson@raspberrypi.com> and others
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 28cd7560e5db..2f5ae69148cc 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -43,6 +43,7 @@ struct ili9881c_desc {
 	const struct drm_display_mode *mode;
 	const unsigned long mode_flags;
 	u8 default_address_mode;
+	unsigned int lanes;
 };
 
 struct ili9881c {
@@ -1549,7 +1550,7 @@ static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
 
 	dsi->mode_flags = ctx->desc->mode_flags;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->lanes = 4;
+	dsi->lanes = ctx->desc->lanes;
 
 	return mipi_dsi_attach(dsi);
 }
@@ -1567,6 +1568,7 @@ static const struct ili9881c_desc lhr050h41_desc = {
 	.init_length = ARRAY_SIZE(lhr050h41_init),
 	.mode = &lhr050h41_default_mode,
 	.mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
+	.lanes = 4,
 };
 
 static const struct ili9881c_desc k101_im2byl02_desc = {
@@ -1574,6 +1576,7 @@ static const struct ili9881c_desc k101_im2byl02_desc = {
 	.init_length = ARRAY_SIZE(k101_im2byl02_init),
 	.mode = &k101_im2byl02_default_mode,
 	.mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
+	.lanes = 4,
 };
 
 static const struct ili9881c_desc kd050hdfia020_desc = {
@@ -1599,6 +1602,7 @@ static const struct ili9881c_desc w552946aba_desc = {
 	.mode = &w552946aba_default_mode,
 	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
 		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
+	.lanes = 4,
 };
 
 static const struct ili9881c_desc am8001280g_desc = {
-- 
2.47.2

