Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C8617A0F3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 09:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55136EB95;
	Thu,  5 Mar 2020 08:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs14.siol.net [185.57.226.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77486E132
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 23:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 67A58523EAA;
 Thu,  5 Mar 2020 00:25:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id 060BCbAtvDSr; Thu,  5 Mar 2020 00:25:37 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 1EA5F52273A;
 Thu,  5 Mar 2020 00:25:37 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net
 [194.152.20.232]) (Authenticated sender: 031275009)
 by mail.siol.net (Postfix) with ESMTPSA id C9809523EAA;
 Thu,  5 Mar 2020 00:25:34 +0100 (CET)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: a.hajda@samsung.com,
	narmstrong@baylibre.com
Subject: [PATCH v2 2/4] drm/bridge: dw-hdmi: do not force "none" scan mode
Date: Thu,  5 Mar 2020 00:25:10 +0100
Message-Id: <20200304232512.51616-3-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200304232512.51616-1-jernej.skrabec@siol.net>
References: <20200304232512.51616-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Mar 2020 08:14:30 +0000
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jonas Karlman <jonas@kwiboo.se>

Setting scan mode to "none" confuses some TVs like LG B8, which randomly
change overscan percentage over time. Digital outputs like HDMI and DVI,
handled by this controller, don't really need overscan, so we can always
set scan mode to underscan. Actually, this is exactly what
drm_hdmi_avi_infoframe_from_display_mode() already does, so we can just
remove offending line.

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
[updated commit message]
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 24965e53d351..de2c7ec887c8 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1654,8 +1654,6 @@ static void hdmi_config_AVI(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
 			HDMI_EXTENDED_COLORIMETRY_XV_YCC_601;
 	}
 
-	frame.scan_mode = HDMI_SCAN_MODE_NONE;
-
 	/*
 	 * The Designware IP uses a different byte format from standard
 	 * AVI info frames, though generally the bits are in the correct
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
