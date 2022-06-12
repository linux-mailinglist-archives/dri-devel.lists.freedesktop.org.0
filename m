Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA332547A53
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jun 2022 15:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5438B10E32E;
	Sun, 12 Jun 2022 13:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBCF10E36C
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 13:22:14 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B74C68441A;
 Sun, 12 Jun 2022 15:22:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1655040133;
 bh=/uMkAREEyFL5fNhBsokObfv/Ik4lTHRXziN6JFpJnVg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I2/2BEv/kFbSAeOZ8yqAZc12TudI99cdGifFBvWMdiAECF7EE0liwjy87i2nQd9Eo
 gQfTVY+8KQNOH+0ZV5w488kerk46O2m4G1by8Bnj/ZyhgQciFpPdjPsdvf6IlUkFXD
 m5/1wbMYyjR1SnZZ0jvAMiDceVLJMp3yN/Y4dvSkWhLi/Y2YRJ1uxA9e8AUYeKcC8p
 gAsNOaF/BRCLkAWgqiTNdsf41p6SFBfq08pPFC4gWb7iLJ5nEkLciO6E2IIw/eFkBz
 l8YUUQLkq42XSf69lZ/hx8mWuRqPo8DKXbom8orbOiHpShgj/2OAc4rrE5dMDlhQsv
 /ziPd89KJYD+A==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/bridge: tc358775: Fix drm_of_get_data_lanes_count_ep
 conversion
Date: Sun, 12 Jun 2022 15:21:51 +0200
Message-Id: <20220612132152.91052-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220612132152.91052-1-marex@denx.de>
References: <20220612132152.91052-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, kernel test robot <lkp@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, robert.foss@linaro.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initialize dsi_lanes to -1, so that in case the endpoint is missing,
probe would fail as it did before the conversion, instead of depending
on uninitialized variable and thus undefined behavior.

Fixes: 56426faa1492 ("drm/bridge: tc358775: Convert to drm_of_get_data_lanes_count_ep")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/tc358775.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 5b1fb8e2f9a7d..e5d00a6e7880b 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -529,7 +529,7 @@ static int tc358775_parse_dt(struct device_node *np, struct tc_data *tc)
 	struct device_node *endpoint;
 	struct device_node *parent;
 	struct device_node *remote;
-	int dsi_lanes;
+	int dsi_lanes = -1;
 
 	/*
 	 * To get the data-lanes of dsi, we need to access the dsi0_out of port1
-- 
2.35.1

