Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E75A4D69D5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 22:03:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262EF10E66C;
	Fri, 11 Mar 2022 21:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F4F10E668
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 21:03:06 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id EE40783868;
 Fri, 11 Mar 2022 22:03:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1647032584;
 bh=AqTsQ3e3Mrdt8yLkscmhznFlRyLfI2gnmH/yk6pPKXA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=An4Q8ljvf7KP2oah0I7P7oWtn9fvfxlm/i2aP+XjfJkeUIOvMLTDmiTMZZBpxKHNS
 utVNHMQfJkjQWs3BAHhzU8Qt4zak2JSQJmnOxzVZGjDIGV6JfJKxsAN5VIvuIAc1tI
 RaeqYnbxDQVofZtBPXb4oC+lZ9Ez6MoPZBjKQ4dDzrrn2+ZZoJ+WJnRkkQ3yDdiiO2
 rEBoYmLc2aQt+xynhDXfiMuL6gk6RrgLkM9oz6MTDVGQfhJg987gzUz7gRKd5+I/jN
 anKDx725+F/rpui730JNYVdDa+N3NpZvf7sBHTfDpvtO0y4b5rOmbivkBbwuqNSywJ
 8Bqfyzhf1+7SQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 08/13] drm: bridge: icn6211: Disable DPI color swap
Date: Fri, 11 Mar 2022 22:02:22 +0100
Message-Id: <20220311210227.124331-9-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220311210227.124331-1-marex@denx.de>
References: <20220311210227.124331-1-marex@denx.de>
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
Cc: Marek Vasut <marex@denx.de>, Robert Foss <robert.foss@linaro.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The chip is capable of swapping DPI RGB channels. The driver currently
does not implement support for this functionality. Write the MIPI_PN_SWAP
register to 0 to assure the color swap is disabled.

Acked-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
V2: Rebase on next-20220214
V3: Add AB from Maxime
V4: No change
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index b3212f3387615..11c5a1553e7e0 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -302,6 +302,7 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 
 	ICN6211_DSI(icn, MIPI_PD_CK_LANE, 0xa0);
 	ICN6211_DSI(icn, PLL_CTRL(12), 0xff);
+	ICN6211_DSI(icn, MIPI_PN_SWAP, 0x00);
 
 	/* DPI HS/VS/DE polarity */
 	pol = ((mode->flags & DRM_MODE_FLAG_PHSYNC) ? BIST_POL_HSYNC_POL : 0) |
-- 
2.34.1

