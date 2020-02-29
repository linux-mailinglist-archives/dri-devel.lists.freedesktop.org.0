Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C25175564
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 09:18:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326986E0F9;
	Mon,  2 Mar 2020 08:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs48.siol.net [185.57.226.239])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4153F6E373
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Feb 2020 16:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTP id 88FF25235E3;
 Sat, 29 Feb 2020 17:31:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id Ug3nAeh9AHRw; Sat, 29 Feb 2020 17:31:06 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTPS id 3DB97523546;
 Sat, 29 Feb 2020 17:31:06 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net
 [194.152.20.232]) (Authenticated sender: 031275009)
 by mail.siol.net (Zimbra) with ESMTPSA id B66655235E3;
 Sat, 29 Feb 2020 17:31:03 +0100 (CET)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: a.hajda@samsung.com,
	narmstrong@baylibre.com
Subject: [PATCH 2/4] drm/bridge: dw-hdmi: Fix color space conversion detection
Date: Sat, 29 Feb 2020 17:30:41 +0100
Message-Id: <20200229163043.158262-3-jernej.skrabec@siol.net>
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

Currently, is_color_space_conversion() compares not only color spaces
but also formats. For example, function would return true if YCbCr 4:4:4
and YCbCr 4:2:2 would be set. Obviously in that case color spaces are
the same.

Fix that by comparing if both values represent RGB color space.

Fixes: b21f4b658df8 ("drm: imx: imx-hdmi: move imx-hdmi to bridge/dw_hdmi")
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 24965e53d351..9d7bfb1cb213 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -956,7 +956,8 @@ static void hdmi_video_sample(struct dw_hdmi *hdmi)
 
 static int is_color_space_conversion(struct dw_hdmi *hdmi)
 {
-	return hdmi->hdmi_data.enc_in_bus_format != hdmi->hdmi_data.enc_out_bus_format;
+	return hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_in_bus_format) !=
+		hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format);
 }
 
 static int is_color_space_decimation(struct dw_hdmi *hdmi)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
