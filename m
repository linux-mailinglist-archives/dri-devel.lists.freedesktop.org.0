Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81966817AC7
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:15:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180BE10E38F;
	Mon, 18 Dec 2023 19:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E4310E396
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1702926930; x=1734462930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fddthYdTBT69uFgmETEmEISCHIBOg8BtXB5X4yHA0g8=;
 b=TRH+RlrHY2Rw17bk9DjB99l1Sn2WnskV5ebP2czUhRrXPLCHpLORh6B3
 mNRyvozXPezIlmhXrlfwwr2SRwkcAJigmx9VOTXFpePknJKsdk/ILGMUW
 ENnvJN73BeQM6zIIkZmGuGman4R6t+H0HOBn5VRJGlI6wHwxqZxRrENtM
 whIw1F8FqwgRuDX+Ke912o8BEOHrjgcVXBQILI3qJc2AAdedsiWY7RU6i
 qqxCzeZkXBmt0aR3b+piZlI6c1Aq4Ho0dG7RJL3NgPRcOqhmN+zzROibR
 d4gN7s7hWrULwo6oDyJYcx2yTN56X0nDnAn+3uGwIKje+SWiFdYXqInXe Q==;
X-IronPort-AV: E=Sophos;i="6.04,285,1695679200"; d="scan'208";a="34559835"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 18 Dec 2023 11:57:22 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7ABC4280075;
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
Subject: [PATCH 6/6] drm/bridge: dpu-core: Don't print error on -EPROBE_DEFER
Date: Mon, 18 Dec 2023 11:57:18 +0100
Message-Id: <20231218105718.2445136-7-alexander.stein@ew.tq-group.com>
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

-517 errors are just annoying. dev_err_probe can't be used here either
as this would hide the error message already set in us->init.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/imx/dpu/dpu-core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/imx/dpu/dpu-core.c b/drivers/gpu/drm/imx/dpu/dpu-core.c
index d6116b3e4ed7..ea2558a14a6c 100644
--- a/drivers/gpu/drm/imx/dpu/dpu-core.c
+++ b/drivers/gpu/drm/imx/dpu/dpu-core.c
@@ -592,9 +592,10 @@ static int dpu_submodules_init(struct dpu_soc *dpu, unsigned long dpu_base)
 			ret = us->init(dpu, j, us->ids[j], us->types[j],
 				       pec_ofs, dpu_base + us->ofss[j]);
 			if (ret) {
-				dev_err(dpu->dev,
-					"failed to initialize %s%d: %d\n",
-						us->name, us->ids[j], ret);
+				if (ret != -EPROBE_DEFER)
+					dev_err(dpu->dev,
+						"failed to initialize %s%d: %d\n",
+							us->name, us->ids[j], ret);
 				return ret;
 			}
 		}
-- 
2.34.1

