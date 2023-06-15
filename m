Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 558A37320C0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 22:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28FDE10E535;
	Thu, 15 Jun 2023 20:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B873D10E535
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 20:15:28 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2E5CC8617C;
 Thu, 15 Jun 2023 22:15:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1686860125;
 bh=G1lbRyM0mBvSwPbPJlV+/r3jfCO67BRw6keSWA0TxaQ=;
 h=From:To:Cc:Subject:Date:From;
 b=K+UaNCN9YAbCSbRIN8k+rPICKxGuCaoPvhLXXQbkv69ST2GFvvgsy0HrlwQXIArey
 g15jAOzmFjTy1mNaBttPNBJlkQp5/u07QEDU3quIdPyMU3u4KPzoJfryeIKt+dxJ8y
 Vja/WVfXLtHmF+78vDQ5ymk+2dhlrXMY2rF4toVaOlBauUBJbdgly1tf9nz3GeXbGr
 gycqNQawhS/vIpDdsBP5CP1TPcYRkxc+PnfbQvhahWnFhS39Bky+YJ6kdmtFl+Tht+
 KmuCF0Zg+k3SmdY9JzUYHfjnzb77vfkoZirjMJQFoyeOyYf75nipO49ireVYkEiVaG
 hky8NYza6mMDg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: bridge: samsung-dsim: Drain command transfer FIFO before
 transfer
Date: Thu, 15 Jun 2023 22:15:11 +0200
Message-Id: <20230615201511.565923-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Wait until the command transfer FIFO is empty before loading in the next
command. The previous behavior where the code waited until command transfer
FIFO was not full suffered from transfer corruption, where the last command
in the FIFO could be overwritten in case the FIFO indicates not full, but
also does not have enough space to store another transfer yet.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 043b8109e64aa..9b7a00bafeaaa 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1009,7 +1009,7 @@ static int samsung_dsim_wait_for_hdr_fifo(struct samsung_dsim *dsi)
 	do {
 		u32 reg = samsung_dsim_read(dsi, DSIM_FIFOCTRL_REG);
 
-		if (!(reg & DSIM_SFR_HEADER_FULL))
+		if (reg & DSIM_SFR_HEADER_EMPTY)
 			return 0;
 
 		if (!cond_resched())
-- 
2.39.2

