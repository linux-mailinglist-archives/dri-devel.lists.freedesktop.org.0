Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF729817AC5
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:15:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7853D10E3C2;
	Mon, 18 Dec 2023 19:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B6610E390
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1702926930; x=1734462930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LF02UyNK/xpkLqe9tr31YIzv+kTaNRG9vqb7cPz4ldI=;
 b=XNjCPprALbsqTe6F/o7m35kGpueJQI7CFY74Juwmh3lnDlTe8frFyPNR
 dFRJI79ir7zQ1vfAzOru6b5UfBdYoTztpBM1HiBLQyNGsoNOvwxotKdBJ
 3cJmq0DQDJW0B7o+Ir/jLJvMpkuU6T2ago+fUn1bJ/iLwgxCJtGiCqp5+
 vM+C+dGHegtn90TEfht24g5RN2QF2h/cFk3wDxHkY3/S06s4ETR8pCBtQ
 DfMtDJrWLoA9S1/ACaOPRSFjc08TydWfvPkgync/QndoYBy/wpGOt2JdB
 bTtxbz89nj8pc9ffjE3TfIx09TmlD9XjGgB6UK/6TPjQJuDNrO/YWC4KJ A==;
X-IronPort-AV: E=Sophos;i="6.04,285,1695679200"; d="scan'208";a="34559834"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 18 Dec 2023 11:57:22 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 24E1F280084;
 Mon, 18 Dec 2023 11:57:22 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 5/6] drm/bridge: dpu-dprc: Use dev_err_probe
Date: Mon, 18 Dec 2023 11:57:17 +0100
Message-Id: <20231218105718.2445136-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218105718.2445136-1-alexander.stein@ew.tq-group.com>
References: <20231218105718.2445136-1-alexander.stein@ew.tq-group.com>
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This simplifies the code and gives additional information upon deferral.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/imx/dpu/dpu-dprc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/imx/dpu/dpu-dprc.c b/drivers/gpu/drm/imx/dpu/dpu-dprc.c
index 261c9566721e..6467ad960080 100644
--- a/drivers/gpu/drm/imx/dpu/dpu-dprc.c
+++ b/drivers/gpu/drm/imx/dpu/dpu-dprc.c
@@ -612,7 +612,8 @@ static int dpu_dprc_probe(struct platform_device *pdev)
 
 		dprc->prgs[i] = dpu_prg_lookup_by_phandle(dev, "fsl,prgs", i);
 		if (!dprc->prgs[i])
-			return -EPROBE_DEFER;
+			return dev_err_probe(dev, -EPROBE_DEFER,
+					     "Failed to lookup fsl,prgs\n");
 
 		if (i == 1)
 			dpu_prg_set_auxiliary(dprc->prgs[i]);
@@ -623,11 +624,10 @@ static int dpu_dprc_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, wrap_irq, dpu_dprc_wrap_irq_handler,
 			       IRQF_SHARED, dev_name(dev), dprc);
-	if (ret < 0) {
-		dev_err(dev, "failed to request dpr_wrap irq(%u): %d\n",
-			wrap_irq, ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "failed to request dpr_wrap irq(%u)\n",
+				     wrap_irq);
 
 	platform_set_drvdata(pdev, dprc);
 
-- 
2.34.1

