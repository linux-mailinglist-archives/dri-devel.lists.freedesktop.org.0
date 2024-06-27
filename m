Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8ED91AB08
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 17:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9428D10E5DB;
	Thu, 27 Jun 2024 15:21:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="VSXqdYxW";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="GMBHode6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE61710E1EB
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 08:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1719477927; x=1751013927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZFGqWlGDXLgahl3x+snZ/G6V92Yhfok4ec2lzUw0c3k=;
 b=VSXqdYxW2J3jefrRb4MpOZWNrjZBpiJ8oANJ4nYwoR7NgVtfiuqXDLVr
 ff61LaM+dEMjoPsdzwC32SP5TxWNL1/RNyMUcNDrflQ896Ji5Pswkfu00
 Os0BM/dqnFfCvLLKVe/a1z4SdaKaOP8vgZpqDb2Shz2bGIm+yurCqS8cz
 ywjXrwexqTlrp6xbQz2g+bqKsTsLu4s+aEmQmr8clLEmJAgubyTPP1g6A
 EXQ30lj8K/KmuT2Tai82m/FXmJK2cABeZlMcrZN5+SD84TgUfKFqD/sYn
 kr7xbgLyjbV2WbqET4CrLn+tT4RtLWmSsmLJ4tDKYjhlS6zyNpD16gfoD Q==;
X-CSE-ConnectionGUID: fPlsaZRKQwGux1jLtUYd3Q==
X-CSE-MsgGUID: ZHArUhrkQOeLkxzqYXyj5w==
X-IronPort-AV: E=Sophos;i="6.08,269,1712613600"; d="scan'208";a="37617956"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 27 Jun 2024 10:45:25 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B95BC164472; Thu, 27 Jun 2024 10:45:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1719477921; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=ZFGqWlGDXLgahl3x+snZ/G6V92Yhfok4ec2lzUw0c3k=;
 b=GMBHode6N2s/fDaiAlyQLoxp5ChkEBPkZGgwr4/ekQfTnrpl3ldnaKVcCoS0M0tt2JvLLA
 Lf02ZfoqdhHqG/VFoE/rFinb42eDYysVR+ncQcYWYF1e90Ded0XU7V8pmUWaJVGcwc7l2E
 Mas9nz3sDvJfomTnBQTGgOiTmczi7J13sJE6lqoV+lb81iShxLEFURxVY9rN4IMstk5R+x
 tkAf1lcK5CKRDzyg5VQsPCnFDn0FI5NvCGSHj1mx599zqy5MRHcVXFgXsmHXeLD/Ux668P
 grmeyP20nqx8bjVVISflefnGI1c1MHyTeuwkrn+hdpD5VpKz6BS4fhZiI2SM4w==
From: Paul Gerber <paul.gerber@ew.tq-group.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Paul Gerber <paul.gerber@ew.tq-group.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/panel: simple: Add AUO G104STN01 panel entry
Date: Thu, 27 Jun 2024 10:44:44 +0200
Message-ID: <20240627084446.3197196-3-paul.gerber@ew.tq-group.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240627084446.3197196-1-paul.gerber@ew.tq-group.com>
References: <20240627084446.3197196-1-paul.gerber@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Thu, 27 Jun 2024 15:21:11 +0000
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

Add support for the AUO G104STN01 10.4" (800x600) LCD-TFT panel.

Signed-off-by: Paul Gerber <paul.gerber@ew.tq-group.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Tested on TQ TQMa8MPxL on MBa8MPxL.

 drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index dcb6d0b6ced0..5eacd2085a53 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1081,6 +1081,30 @@ static const struct panel_desc auo_g104sn02 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct drm_display_mode auo_g104stn01_mode = {
+	.clock = 40000,
+	.hdisplay = 800,
+	.hsync_start = 800 + 40,
+	.hsync_end = 800 + 40 + 88,
+	.htotal = 800 + 40 + 88 + 128,
+	.vdisplay = 600,
+	.vsync_start = 600 + 1,
+	.vsync_end = 600 + 1 + 23,
+	.vtotal = 600 + 1 + 23 + 4,
+};
+
+static const struct panel_desc auo_g104stn01 = {
+	.modes = &auo_g104stn01_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 211,
+		.height = 158,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct display_timing auo_g121ean01_timing = {
 	.pixelclock = { 60000000, 74400000, 90000000 },
 	.hactive = { 1280, 1280, 1280 },
@@ -4434,6 +4458,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "auo,g104sn02",
 		.data = &auo_g104sn02,
+	}, {
+		.compatible = "auo,g104stn01",
+		.data = &auo_g104stn01,
 	}, {
 		.compatible = "auo,g121ean01",
 		.data = &auo_g121ean01,
-- 
2.44.1

