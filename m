Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E54B42F076
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 14:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E7BD6ED29;
	Fri, 15 Oct 2021 12:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDFA26ED1A;
 Fri, 15 Oct 2021 12:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
 t=1634297970; bh=N1FC6bbFpWwj5uck3C6Zh9AXCf70UfpiuPwfacUawG4=;
 h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding;
 b=b5GSVJXu1M47i0XuKr2lf45n+A+YLGz0uB8u1fCSlBu9vyz4DQSiFkZUKGj2jm8AT
 IOnQt/oYKVuS7pC4kBDpMtdaRHFdocNShMrl0+iN8NPFogizUwnMILf/cKQ4QpFfgJ
 5QKbqAPhpz8gWq4l3ptP+1AUAAZn1Yu4cspYsfc8=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Fri, 15 Oct 2021 13:38:57 +0200 (CEST)
X-EA-Auth: 93gjOteriWQVrMLinGDZbUCnYpqwcWRv7A9321LKmsIYPvgkBNCRrAUQiwjp/Drc+D6Zq8283vMUQFeFFp6iUfX6WR92ELHE
From: Claudio Suarez <cssk@net-c.es>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org
Cc: Claudio Suarez <cssk@net-c.es>
Subject: [PATCH 13/15] drm/bridge: replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
Date: Fri, 15 Oct 2021 13:37:11 +0200
Message-Id: <20211015113713.630119-14-cssk@net-c.es>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015113713.630119-1-cssk@net-c.es>
References: <20211015113713.630119-1-cssk@net-c.es>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Once EDID is parsed, the monitor HDMI support information is available
through drm_display_info.is_hdmi. Retriving the same information with
drm_detect_hdmi_monitor() is less efficient. Change to
drm_display_info.is_hdmi where possible

Signed-off-by: Claudio Suarez <cssk@net-c.es>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 2 +-
 drivers/gpu/drm/bridge/sii902x.c             | 2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 76555ae64e9c..f6891280a58d 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -617,7 +617,7 @@ static struct edid *adv7511_get_edid(struct adv7511 *adv7511,
 		__adv7511_power_off(adv7511);
 
 	adv7511_set_config_csc(adv7511, connector, adv7511->rgb,
-			       drm_detect_hdmi_monitor(edid));
+			       connector->display_info.is_hdmi);
 
 	cec_s_phys_addr_from_edid(adv7511->cec_adap, edid);
 
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 89558e581530..5719be0a03c7 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -283,7 +283,7 @@ static int sii902x_get_modes(struct drm_connector *connector)
 	edid = drm_get_edid(connector, sii902x->i2cmux->adapter[0]);
 	drm_connector_update_edid_property(connector, edid);
 	if (edid) {
-		if (drm_detect_hdmi_monitor(edid))
+		if (connector->display_info.is_hdmi)
 			output_mode = SII902X_SYS_CTRL_OUTPUT_HDMI;
 
 		num = drm_add_edid_modes(connector, edid);
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index f08d0fded61f..33f0afb6b646 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2359,7 +2359,7 @@ static struct edid *dw_hdmi_get_edid(struct dw_hdmi *hdmi,
 	dev_dbg(hdmi->dev, "got edid: width[%d] x height[%d]\n",
 		edid->width_cm, edid->height_cm);
 
-	hdmi->sink_is_hdmi = drm_detect_hdmi_monitor(edid);
+	hdmi->sink_is_hdmi = connector->display_info.is_hdmi;
 	hdmi->sink_has_audio = drm_detect_monitor_audio(edid);
 
 	return edid;
-- 
2.33.0


