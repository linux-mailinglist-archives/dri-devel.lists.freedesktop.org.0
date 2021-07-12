Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CA83C6AFF
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 09:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 913EA6E041;
	Tue, 13 Jul 2021 07:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 153782 seconds by postgrey-1.36 at gabe;
 Mon, 12 Jul 2021 08:07:56 UTC
Received: from mxout3.routing.net (mxout3.routing.net [IPv6:2a03:2900:1:a::8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2594C8914D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 08:07:56 +0000 (UTC)
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout3.routing.net (Postfix) with ESMTP id 08389604D1;
 Mon, 12 Jul 2021 08:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1626077274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Yqiw9vakvD3biQvUw7e3pOAubtn1bx+ELCF8m+Mcba0=;
 b=fWZ+xu5f1Y7voLh9UJztHYCK35D/emrZkJ6EweWgy1JiC7Agzg07eLlZ4ulMWpNkNYzqsI
 dyUUbp3zzJov2NvmPAXFx646me2onhJailCwuxkuBy/RpiG5M8Xjmov1oIyBy3amklxEH3
 +QznbvRU9aX5rKipzdikPRZawUCZht0=
Received: from localhost.localdomain (fttx-pool-157.180.225.139.bambit.de
 [157.180.225.139])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 2FA88360681;
 Mon, 12 Jul 2021 08:07:53 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH] drm/mediatek: dpi: fix NULL dereference in
 mtk_dpi_bridge_atomic_check
Date: Mon, 12 Jul 2021 10:07:36 +0200
Message-Id: <20210712080736.116435-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 98eab89e-6b02-470b-a543-117e91a2899e
X-Mailman-Approved-At: Tue, 13 Jul 2021 07:09:45 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Frank Wunderlich <frank-w@public-files.de>

bridge->driver_private is not set (NULL) so use bridge_to_dpi(bridge)
like it's done in bridge_atomic_get_output_bus_fmts

Fixes: ec8747c52434 ("drm/mediatek: dpi: Add bus format negotiation")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index bced555648b0..a2eca1f66984 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -605,7 +605,7 @@ static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
 				       struct drm_crtc_state *crtc_state,
 				       struct drm_connector_state *conn_state)
 {
-	struct mtk_dpi *dpi = bridge->driver_private;
+	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
 	unsigned int out_bus_format;
 
 	out_bus_format = bridge_state->output_bus_cfg.format;
-- 
2.25.1

