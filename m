Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1A7513DA7
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 23:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A9510EB1F;
	Thu, 28 Apr 2022 21:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6911710EB1F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 21:31:43 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AF7B183108;
 Thu, 28 Apr 2022 23:31:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651181501;
 bh=gjXAa9d6LB9cKyN20kpaWSeUxh/Gi0C5nYh01w7v0f8=;
 h=From:To:Cc:Subject:Date:From;
 b=fr0Mbr262xffHmuKCzBclWxsVW1dJx6ByDQ+aBsIi13D8XYGlsVNsNxJ2nh/iCHwi
 2FgE4978HJHMCTeuO8+S5e0gOiSlLFJ3ibtD9cpQPzaTG+kT5EaK03rC+bik0JlxUd
 4p2mVdw0/NJ+Ydl6b1eZkocwjcSzWNRMyGm08hamg00oLxNulYpuZbaGp6TiyLYSNk
 JSxziyiF0uxspaUl+k3D9bbkz+/Ik1cGFyiGpMO4lv+lt+4XB/OS0LprqVw462YpdK
 ki7SbuNL5PaEYU5z3sWQSdnyXkLGDMNZ5N18+WCgtBzDVdFlxPyQd57zWAJ7frocWR
 eos0OKvh9RN+Q==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4] drm/bridge: tc358767: Fix (e)DP bridge endpoint parsing in
 dedicated function
Date: Thu, 28 Apr 2022 23:31:32 +0200
Message-Id: <20220428213132.447890-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
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
Cc: Marek Vasut <marex@denx.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 robert.foss@linaro.org, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Per toshiba,tc358767.yaml DT binding document, port@2 the output (e)DP
port is optional. In case this port is not described in DT, the bridge
driver operates in DPI-to-DP mode. The drm_of_find_panel_or_bridge()
call in tc_probe_edp_bridge_endpoint() returns -ENODEV in case port@2
is not present in DT and this specific return value is incorrectly
propagated outside of tc_probe_edp_bridge_endpoint() function. All
other error values must be propagated and are propagated correctly.

Return 0 in case the port@2 is missing instead, that reinstates the
original behavior before the commit this patch fixes.

Fixes: 8478095a8c4b ("drm/bridge: tc358767: Move (e)DP bridge endpoint parsing into dedicated function")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Marek Vasut <marex@denx.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/bridge/tc358767.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 0336b14d9e94..ad1d6e383966 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1955,7 +1955,7 @@ static int tc_probe_edp_bridge_endpoint(struct tc_data *tc)
 		tc->bridge.ops |= DRM_BRIDGE_OP_DETECT;
 	tc->bridge.ops |= DRM_BRIDGE_OP_EDID;
 
-	return ret;
+	return 0;
 }
 
 static int tc_probe_bridge_endpoint(struct tc_data *tc)
-- 
2.35.1

