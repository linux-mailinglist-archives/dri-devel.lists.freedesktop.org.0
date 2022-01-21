Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C045495F7D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 14:12:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B50C10EABD;
	Fri, 21 Jan 2022 13:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4388010EABD
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 13:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1642770765; x=1674306765;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fEz+hHnADLv4ib39sL6qVqJLUtABr6G2rfYbgY7Ght4=;
 b=VoGWfRvY4DyqHTRMXR8OywHib3HMi9YdY1EywM/+gtt3qNM8EiIeiuyE
 bfgT39cwc/QimKEcimpdzwO3qZ75JoZreKGbyH6NiFJqnpIle3eYUTgT4
 tM8AcpLnS8WWP1nIy4HFjgn6QHfBjkODQzNAyqACzZVhgzkgo1bfdAfAb
 fvy6Z8WS2RsRo0a/dBfMCqbbynSuEaMMPGu+v6ustTUUUghnuIzSCrytI
 l42KSZBYBnVCFnbFlMQOKMLG0GfBBVEq5IH+h7gWFXGrK5uQr/btEHl3a
 /aDi4MOPQ7i9KxQAOeEZdY8Fj/HH84gzMNjxlObO8aGSWujnsB8Gyb508 Q==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635199200"; d="scan'208";a="21640633"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 21 Jan 2022 14:12:43 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 21 Jan 2022 14:12:43 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 21 Jan 2022 14:12:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1642770763; x=1674306763;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fEz+hHnADLv4ib39sL6qVqJLUtABr6G2rfYbgY7Ght4=;
 b=oY/6f5/ymVgNpp6/E0AXfpvvr8Gl2ccSeU/NAqhRZu3jegTeBQXeP4IV
 zNcHu/beHAl71USyV6fNHn5ZQhcl7f72my9j7ec+WpUWd7PKmBFEdrGuA
 m8kN16bLv623O+s+BlYJPiyrRUu4Babw65cRwv3j2sShVxFb87bNUz/xG
 8J+zmzm/tB4T4j6Vr93p8KCju1DFHfDJIZFErhTmfVJrBmmgQ7JeA6fas
 dspDodqqHhVec6eyP/t9sGUUQLDwN+6ucW6sPe8cvQB0RLq2oc0aA1J/+
 lB4b86D7cSX3dwVeOp+Nb4brdgEiCLesrz7yI2PZY2fyM5tAyYowzR5l6 Q==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635199200"; d="scan'208";a="21640632"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 21 Jan 2022 14:12:43 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id F4042280065;
 Fri, 21 Jan 2022 14:12:42 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/1] drm: mxsfb: Fix NULL pointer dereference
Date: Fri, 21 Jan 2022 14:12:38 +0100
Message-Id: <20220121131238.507567-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
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
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Do not deference the NULL pointer if the bridge does not return a
bridge state. Assume a fixed format instead.

Fixes: commit b776b0f00f24 ("drm: mxsfb: Use bus_format from the nearest bridge if present")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
This can happen if a "ti,sn75lvds83", "lvds-encoder" bridge is attached
to it. atomic_get_input_bus_fmts is only implemented for the
lvds-decoder case.

 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 0655582ae8ed..4cfb6c001679 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -361,7 +361,11 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 		bridge_state =
 			drm_atomic_get_new_bridge_state(state,
 							mxsfb->bridge);
-		bus_format = bridge_state->input_bus_cfg.format;
+		if (!bridge_state)
+			bus_format = MEDIA_BUS_FMT_FIXED;
+		else
+			bus_format = bridge_state->input_bus_cfg.format;
+
 		if (bus_format == MEDIA_BUS_FMT_FIXED) {
 			dev_warn_once(drm->dev,
 				      "Bridge does not provide bus format, assuming MEDIA_BUS_FMT_RGB888_1X24.\n"
-- 
2.25.1

