Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AB74F5A15
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 11:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACB210EFBA;
	Wed,  6 Apr 2022 09:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7EB10F006
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 09:36:41 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7AFE683CA3;
 Wed,  6 Apr 2022 11:36:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1649237799;
 bh=DjqbgkwjUDuqY40icMf/gBVOPgX4ORIhjTSVV3ymvoY=;
 h=From:To:Cc:Subject:Date:From;
 b=V1V3ASu+EtvbjYJEhI46dCq0JzdfnbpWoOOGXYnDvxmgJ/ZNXcMNalj81GwIrzNbo
 sBTqFe7SDn4DTGQoF7mQOk28wGK2zSLP3EGRpEbuWxUKF6+Ek5S59p2qERVoIKxG4+
 dbdVHdHoGXHWJ6JZtp9ktkE/W5jvdEH7qw41CAzbv8QSTEbdkKi18gQ9oMPBRSQ18d
 khVm4YBbG/jxvt3p4kmElsnAatfLi/RWHdILkOHbPC5hZQwW0KRtEmz0zGI5dMkPbc
 623hvNbQqqZON5Y18Dq6fJLbk0FUyuSnLLbzyxavdNx5hX5wZyFs5JVq/2DgSFDZuz
 Dn6MIUfL1jukw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: simple: Add missing bus flags for Innolux
 G070Y2-L01
Date: Wed,  6 Apr 2022 11:36:27 +0200
Message-Id: <20220406093627.18011-1-marex@denx.de>
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
Cc: Marek Vasut <marex@denx.de>, robert.foss@linaro.org,
 Christoph Fritz <chf.fritz@googlemail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DE signal is active high on this display, fill in the missing bus_flags.
This aligns panel_desc with its display_timing .

Fixes: a5d2ade627dca ("drm/panel: simple: Add support for Innolux G070Y2-L01")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Christoph Fritz <chf.fritz@googlemail.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/panel/panel-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 65c2a3000e471..18fccb0d47382 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2149,6 +2149,7 @@ static const struct panel_desc innolux_g070y2_l01 = {
 		.unprepare = 800,
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
-- 
2.35.1

