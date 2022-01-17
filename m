Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BA4490A29
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 15:18:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E0910E2C7;
	Mon, 17 Jan 2022 14:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02CEF10E2C0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 14:17:57 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so24693588wmo.5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 06:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DJwsITSMY4QI1R0GyVDZJD0gSOxLKr++NG45dIxuuJs=;
 b=RIqG2RM1JSZMzH3Ltu70CUWzXiGPKZkk6KaXW/WMH4QnBcWgVffvRVOIPTxBFWHxNk
 QEK25D9g9Cofj5DtQrc5AhOtb0wXb7XMWB9w+2/BDyS8T87HBQ1q+KL15jwHX2m0rV/W
 YBdSd0Nc6gA87MRxxsfyisMmQIghcyXDqbXR2l/yUi7Zyf8NCDjnafAupzL2cIdPlcUl
 Q7jlKIqf49CRzNjKiMNhpe1uZb62jVfeUOgUzyzFJTmLBVfhqqoh764JVknbA/2R7JJy
 B0PkWyIYRAKppKAlHG+q44USoznorkTcX6G0FB8M4kaC2Wfta5+c4DwoRzVIMXBNsfLK
 k5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DJwsITSMY4QI1R0GyVDZJD0gSOxLKr++NG45dIxuuJs=;
 b=iEjjrkSaCU+iUgJ92pI3dDtlXcLYmphOihPc8Ob77igEcJ8ub2ABfRMfaTi93SW8KR
 gxFiAQD4roUhNDz0jFQ8FgOvJ1dRX0Xmej+KQX5PUKXDxkY2ukCDkcYJKXNi2tbz0tdI
 nNCvxmF0MxGprRrsHek4sc3I5UASuh9aTbaFCYqP4Q2eTRXrOf9cALSOht3PPz+eQ4Zm
 mDVMIeR5UARfjgI7tuU+sdpsSdvozVdfc5rgqDY1ZlPSNSaaqLL0WtfrRoSNiIF45U9G
 Z6snVuHCcYRfxIBVK+XTeaHteahljdYSUn6rHiyH6DnHagvhqUppbu8eKvXK1MqWfuLR
 SLPA==
X-Gm-Message-State: AOAM532LazPU/HjrVr82VFcXjujmcFS4SoR6XamnE91NA7K3F6LhiHn8
 9UGM2rimWto1v+BCTzwGvdAw9Q==
X-Google-Smtp-Source: ABdhPJx2Lp6ss2rXVGBn2sErjrUmZPIzPgpqhB8Kd0/S/liD97bAVpi21dNqow/jsz25iV/zAWV9AQ==
X-Received: by 2002:a5d:5849:: with SMTP id i9mr7839177wrf.358.1642429076455; 
 Mon, 17 Jan 2022 06:17:56 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:c004:9fe1:fbda:2d0c])
 by smtp.gmail.com with ESMTPSA id f141sm7975972wmf.30.2022.01.17.06.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 06:17:55 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robert.foss@linaro.org
Subject: [PATCH] drm/bridge: dw-hdmi: use safe format when first in bridge
 chain
Date: Mon, 17 Jan 2022 15:17:50 +0100
Message-Id: <20220117141750.1182223-1-narmstrong@baylibre.com>
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
Cc: jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kieran.bingham@ideasonboard.com,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent.pinchart@ideasonboard.com, biju.das.jz@bp.renesas.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the dw-hdmi bridge is in first place of the bridge chain, this
means there is now way to select an input format of the dw-hdmi HW
component.

Since introduction of display-connector, negociation was broken since
the dw-hdmi negociation code only worked when the dw-hdmi bridge was
in last position of the bridge chain or behind another bridge also
supporting input & output format negociation.

Commit 0656d1285b79 ("drm/bridge: display-connector: implement bus fmts callbacks")
was introduced to make negociation work again by making display-connector
act as a pass-through concerning input & output format negociation.

But in the case were the dw-hdmi was single in the bridge chain, for
example on Renesas SoCs, with the disply-connector bridge the dw-hdmi
is no more single, breaking output format.

Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
Bisected-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Fixes: 0656d1285b79 ("drm/bridge: display-connector: implement bus fmts callbacks").
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 54d8fdad395f..9f2e1cac0ae2 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2551,8 +2551,9 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 	if (!output_fmts)
 		return NULL;
 
-	/* If dw-hdmi is the only bridge, avoid negociating with ourselves */
-	if (list_is_singular(&bridge->encoder->bridge_chain)) {
+	/* If dw-hdmi is the first or only bridge, avoid negociating with ourselves */
+	if (list_is_singular(&bridge->encoder->bridge_chain) ||
+	    list_is_first(&bridge->chain_node, &bridge->encoder->bridge_chain)) {
 		*num_output_fmts = 1;
 		output_fmts[0] = MEDIA_BUS_FMT_FIXED;
 
@@ -2673,6 +2674,10 @@ static u32 *dw_hdmi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	if (!input_fmts)
 		return NULL;
 
+	/* If dw-hdmi is the first bridge fall-back to safe output format */
+	if (list_is_first(&bridge->chain_node, &bridge->encoder->bridge_chain))
+		output_fmt = MEDIA_BUS_FMT_FIXED;
+
 	switch (output_fmt) {
 	/* If MEDIA_BUS_FMT_FIXED is tested, return default bus format */
 	case MEDIA_BUS_FMT_FIXED:
-- 
2.25.1

