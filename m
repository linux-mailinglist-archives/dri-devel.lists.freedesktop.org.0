Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7928417555E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 09:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEAC16E0E0;
	Mon,  2 Mar 2020 08:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs30.siol.net [185.57.226.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973DC6E375
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Feb 2020 16:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTP id DFF3D5235EC;
 Sat, 29 Feb 2020 17:31:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id SV9myldJ_oFv; Sat, 29 Feb 2020 17:31:08 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTPS id 96502523546;
 Sat, 29 Feb 2020 17:31:08 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net
 [194.152.20.232]) (Authenticated sender: 031275009)
 by mail.siol.net (Zimbra) with ESMTPSA id 4608A5235F3;
 Sat, 29 Feb 2020 17:31:06 +0100 (CET)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: a.hajda@samsung.com,
	narmstrong@baylibre.com
Subject: [PATCH 3/4] drm/bridge: dw-hdmi: do not force "none" scan mode
Date: Sat, 29 Feb 2020 17:30:42 +0100
Message-Id: <20200229163043.158262-4-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200229163043.158262-1-jernej.skrabec@siol.net>
References: <20200229163043.158262-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Mar 2020 08:17:47 +0000
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
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jonas Karlman <jonas@kwiboo.se>

Setting scan mode to "none" confuses some TVs like LG B8, which randomly
change overscan procentage over time. Digital outputs like HDMI and DVI,
handled by this controller, don't really need overscan, so we can always
set scan mode to underscan. Actually, this is exactly what
drm_hdmi_avi_infoframe_from_display_mode() already does, so we can just
remove offending line.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
[updated commit message]
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 9d7bfb1cb213..3d6021119942 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1655,8 +1655,6 @@ static void hdmi_config_AVI(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
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
