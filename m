Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E3332C3AB
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 01:41:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F2A6E453;
	Thu,  4 Mar 2021 00:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98716E450
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Mar 2021 00:41:45 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id e7so40276862lft.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 16:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lCEQAYlTVYaQPbVDlTiY9GA99pQuUSajrn5pF/IEpG0=;
 b=nfvAJ3+hMbwC5KQbrqidZ07oqNaO+GcHeCMykX31fJqz9XVNr4sfd88RTn372uXuN7
 W5JHZz5us6ozUWAWYdUw4Ah0ts1SoMHjYfEpZ2ccGnNq/bFcPdeUa+vJstvOZCJG19J8
 ayrv1dIdNWaeK94b7XcWMZ/8/8FwmZs40n03N8J8VsNlTAIZTH0IDtfI9H5gpRNWCeZy
 6EMAtPhSt3nP+rGaGHRDqDXE5GCDzFrapRDwQF1wwEkrSLqtKqpuEm8p0BhK2MxGuQVv
 3ZjZWkEp9fmccuQM1vNFHBdtuPiR91MiKesBVY62drl4mTSjh0OlusadY42tX3NN0BaC
 ToQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lCEQAYlTVYaQPbVDlTiY9GA99pQuUSajrn5pF/IEpG0=;
 b=TIhvT9zClQGBTq/M7aOb0nYsw6mELoT+e1o/kFV8mXv8obUrMjLzrmHpBVAwJSF74U
 6cECPFowLLDWuVCbJathAam8+rywItUFFag121Y135eQXft1fRaRA2xKEndVvEhDIbXP
 iDMvBJBaEhMJ+GE08GeU95P/ONXX9q4yKGv7WkpGkFwSbi258N0keBrG7/lKAUPovg3K
 Bm8JaVmXkr7wTy0EG7LmTkfc+p0ObLFtOh5lZIVDWVXHWq3Rdo2s1kifQ4NQ2j0teRjt
 0qVw63kTk5WWuwH5SuhAhpUaB8P3zwbJvSQkQEIPTELQh5sOPOfovG/rw5DWNbpDOAHW
 /fOg==
X-Gm-Message-State: AOAM5311hoJ2TnJOQVjaWzVGufJW0+o4PVUyXosqvzU9uBIW+9GCodeD
 2S1imQd2rXIk6cMQrcXScACnoGzKzETm9dfl
X-Google-Smtp-Source: ABdhPJwQPvMhBkLjLhU2BO0IbF0sbZDZ0Zou8f3ENQ1qAzn6LOqeu1KCcDtsu2VDXDwm6qcmel8OSw==
X-Received: by 2002:a05:6512:202b:: with SMTP id
 s11mr810480lfs.22.1614818504010; 
 Wed, 03 Mar 2021 16:41:44 -0800 (PST)
Received: from localhost.localdomain
 (c-d7cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.215])
 by smtp.gmail.com with ESMTPSA id x25sm950061lfn.307.2021.03.03.16.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 16:41:43 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/mcde/panel: Inverse misunderstood flag
Date: Thu,  4 Mar 2021 01:41:38 +0100
Message-Id: <20210304004138.1785057-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A recent patch renaming MIPI_DSI_MODE_EOT_PACKET to
MIPI_DSI_MODE_NO_EOT_PACKET brought to light the
misunderstanding in the current MCDE driver and all
its associated panel drivers that MIPI_DSI_MODE_EOT_PACKET
would mean "use EOT packet" when in fact it means the
reverse.

Fix it up by implementing the flag right in the MCDE
DSI driver and remove the flag from panels that actually
want the EOT packet.

Suggested-by: Nicolas Boichat <drinkcat@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/mcde/mcde_dsi.c                   | 2 +-
 drivers/gpu/drm/panel/panel-novatek-nt35510.c     | 3 +--
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c     | 4 +---
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c | 1 -
 drivers/gpu/drm/panel/panel-sony-acx424akp.c      | 3 +--
 5 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 2314c8122992..b3fd3501c412 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -760,7 +760,7 @@ static void mcde_dsi_start(struct mcde_dsi *d)
 		DSI_MCTL_MAIN_DATA_CTL_BTA_EN |
 		DSI_MCTL_MAIN_DATA_CTL_READ_EN |
 		DSI_MCTL_MAIN_DATA_CTL_REG_TE_EN;
-	if (d->mdsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET)
+	if (!(d->mdsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
 		val |= DSI_MCTL_MAIN_DATA_CTL_HOST_EOT_GEN;
 	writel(val, d->regs + DSI_MCTL_MAIN_DATA_CTL);
 
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
index b9a0e56f33e2..ef70140c5b09 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
@@ -898,8 +898,7 @@ static int nt35510_probe(struct mipi_dsi_device *dsi)
 	 */
 	dsi->hs_rate = 349440000;
 	dsi->lp_rate = 9600000;
-	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
-		MIPI_DSI_MODE_EOT_PACKET;
+	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
 	/*
 	 * Every new incarnation of this display must have a unique
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
index 4aac0d1573dd..70560cac53a9 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
@@ -184,9 +184,7 @@ static int s6d16d0_probe(struct mipi_dsi_device *dsi)
 	 * As we only send commands we do not need to be continuously
 	 * clocked.
 	 */
-	dsi->mode_flags =
-		MIPI_DSI_CLOCK_NON_CONTINUOUS |
-		MIPI_DSI_MODE_EOT_PACKET;
+	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
 	s6->supply = devm_regulator_get(dev, "vdd1");
 	if (IS_ERR(s6->supply))
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
index eec74c10ddda..9c3563c61e8c 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
@@ -97,7 +97,6 @@ static int s6e63m0_dsi_probe(struct mipi_dsi_device *dsi)
 	dsi->hs_rate = 349440000;
 	dsi->lp_rate = 9600000;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
-		MIPI_DSI_MODE_EOT_PACKET |
 		MIPI_DSI_MODE_VIDEO_BURST;
 
 	ret = s6e63m0_probe(dev, s6e63m0_dsi_dcs_read, s6e63m0_dsi_dcs_write,
diff --git a/drivers/gpu/drm/panel/panel-sony-acx424akp.c b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
index 065efae213f5..95659a4d15e9 100644
--- a/drivers/gpu/drm/panel/panel-sony-acx424akp.c
+++ b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
@@ -449,8 +449,7 @@ static int acx424akp_probe(struct mipi_dsi_device *dsi)
 			MIPI_DSI_MODE_VIDEO_BURST;
 	else
 		dsi->mode_flags =
-			MIPI_DSI_CLOCK_NON_CONTINUOUS |
-			MIPI_DSI_MODE_EOT_PACKET;
+			MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
 	acx->supply = devm_regulator_get(dev, "vddi");
 	if (IS_ERR(acx->supply))
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
