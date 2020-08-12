Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6C124349B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 09:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97556E52F;
	Thu, 13 Aug 2020 07:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB43D6E8CC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 08:38:03 +0000 (UTC)
Received: from localhost (unknown [192.168.167.235])
 by lucky1.263xmail.com (Postfix) with ESMTP id 4CFACC5B3D;
 Wed, 12 Aug 2020 16:35:07 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [103.29.142.67])
 by smtp.263.net (postfix) whith ESMTP id
 P12148T140383044482816S1597221301879174_; 
 Wed, 12 Aug 2020 16:35:06 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <9b940f70c8aae58a528400653cfcd4ec>
X-RL-SENDER: algea.cao@rock-chips.com
X-SENDER: algea.cao@rock-chips.com
X-LOGIN-NAME: algea.cao@rock-chips.com
X-FST-TO: a.hajda@samsung.com
X-SENDER-IP: 103.29.142.67
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From: Algea Cao <algea.cao@rock-chips.com>
To: a.hajda@samsung.com, kuankuan.y@gmail.com, hjc@rock-chips.com,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org, sam@ravnborg.org,
 airlied@linux.ie, heiko@sntech.de, jernej.skrabec@siol.net,
 algea.cao@rock-chips.com, Laurent.pinchart@ideasonboard.com,
 laurent.pinchart+renesas@ideasonboard.com, jonas@kwiboo.se,
 mripard@kernel.org, darekm@google.com, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, cychiang@chromium.org,
 linux-kernel@vger.kernel.org, narmstrong@baylibre.com,
 jbrunet@baylibre.com, maarten.lankhorst@linux.intel.com, daniel@ffwll.ch
Subject: [PATCH 3/6] drm: bridge: dw-hdmi: Introduce
 previous_pixelclock/previous_tmdsclock
Date: Wed, 12 Aug 2020 16:34:59 +0800
Message-Id: <20200812083459.989-1-algea.cao@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200812083120.743-1-algea.cao@rock-chips.com>
References: <20200812083120.743-1-algea.cao@rock-chips.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Aug 2020 07:12:31 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce previous_pixelclock/previous_tmdsclock to
determine whether PHY needs initialization. If phy is power off,
or mpixelclock/mtmdsclock is different to previous value, phy is
neet to be reinitialized.

Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
---

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 50 +++++++++++++++++++----
 1 file changed, 43 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index a1a81fc768c2..1eb4736b9b59 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -101,6 +101,8 @@ static const u16 csc_coeff_rgb_full_to_rgb_limited[3][4] = {
 struct hdmi_vmode {
 	bool mdataenablepolarity;
 
+	unsigned int previous_pixelclock;
+	unsigned int previous_tmdsclock;
 	unsigned int mpixelclock;
 	unsigned int mpixelrepetitioninput;
 	unsigned int mpixelrepetitionoutput;
@@ -890,6 +892,32 @@ static int hdmi_bus_fmt_color_depth(unsigned int bus_format)
 	}
 }
 
+static unsigned int
+hdmi_get_tmdsclock(struct dw_hdmi *hdmi, unsigned long mpixelclock)
+{
+	unsigned int tmdsclock = mpixelclock;
+	unsigned int depth =
+		hdmi_bus_fmt_color_depth(hdmi->hdmi_data.enc_out_bus_format);
+
+	if (!hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format)) {
+		switch (depth) {
+		case 16:
+			tmdsclock = mpixelclock * 2;
+			break;
+		case 12:
+			tmdsclock = mpixelclock * 3 / 2;
+			break;
+		case 10:
+			tmdsclock = mpixelclock * 5 / 4;
+			break;
+		default:
+			break;
+		}
+	}
+
+	return tmdsclock;
+}
+
 /*
  * this submodule is responsible for the video data synchronization.
  * for example, for RGB 4:4:4 input, the data map is defined as
@@ -1861,11 +1889,13 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 	int hblank, vblank, h_de_hs, v_de_vs, hsync_len, vsync_len;
 	unsigned int vdisplay, hdisplay;
 
+	vmode->previous_pixelclock = vmode->mpixelclock;
 	vmode->mpixelclock = mode->clock * 1000;
 
 	dev_dbg(hdmi->dev, "final pixclk = %d\n", vmode->mpixelclock);
 
-	vmode->mtmdsclock = vmode->mpixelclock;
+	vmode->previous_tmdsclock = vmode->mtmdsclock;
+	vmode->mtmdsclock = hdmi_get_tmdsclock(hdmi, vmode->mpixelclock);
 
 	if (!hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format)) {
 		switch (hdmi_bus_fmt_color_depth(
@@ -2172,12 +2202,18 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi,
 	hdmi_av_composer(hdmi, &connector->display_info, mode);
 
 	/* HDMI Initializateion Step B.2 */
-	ret = hdmi->phy.ops->init(hdmi, hdmi->phy.data,
-				  &connector->display_info,
-				  &hdmi->previous_mode);
-	if (ret)
-		return ret;
-	hdmi->phy.enabled = true;
+	if (!hdmi->phy.enabled ||
+	    hdmi->hdmi_data.video_mode.previous_pixelclock !=
+	    hdmi->hdmi_data.video_mode.mpixelclock ||
+	    hdmi->hdmi_data.video_mode.previous_tmdsclock !=
+	    hdmi->hdmi_data.video_mode.mtmdsclock) {
+		ret = hdmi->phy.ops->init(hdmi, hdmi->phy.data,
+					  &connector->display_info,
+					  &hdmi->previous_mode);
+		if (ret)
+			return ret;
+		hdmi->phy.enabled = true;
+	}
 
 	/* HDMI Initialization Step B.3 */
 	dw_hdmi_enable_video_path(hdmi);
-- 
2.25.1



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
