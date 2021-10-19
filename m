Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C04394341AA
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 00:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A6F6E0F4;
	Tue, 19 Oct 2021 22:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63236E096;
 Tue, 19 Oct 2021 22:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
 t=1634683884; bh=uLgAv1p7Y5vFTzwdvlZ68d33po02FUVGhb3Gh9W3kqQ=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=vns70Kl8DSbTwbUcSPaxMZF/Stw7H+QwnFRH1PNJYuA8cR8ixZgUVXeQaSHKl1/77
 x31AQ5lZmK/q5m//b8s8lqplRvmbnegfkcUhs4dyY05R+NpTLtBdtQKnDV5E3ntffb
 a2zFlybSUZkYLRF6OfBMC4Y3TVY+UzsXeOKnnhoY=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Wed, 20 Oct 2021 00:51:24 +0200 (CEST)
X-EA-Auth: ZuVWjeezfcGUIMbofDm7p16bf3OEGxFPAHSY4J1oGSl3bKR0h2C0x8lwXIpvuoo0aO/EFjSNxFlgjYSFEsj4bmMb6X5vgGBM
Date: Wed, 20 Oct 2021 00:51:21 +0200
From: Claudio Suarez <cssk@net-c.es>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v3 13/13] drm/i915: replace drm_detect_hdmi_monitor()
 with drm_display_info.is_hdmi
Message-ID: <YW9L6d7e+RO29VJu@gineta.localdomain>
References: <20211016184226.3862-1-cssk@net-c.es>
 <20211016184226.3862-14-cssk@net-c.es> <YW8QYsmkm3ZrBAx3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YW8QYsmkm3ZrBAx3@intel.com>
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

drm_get_edid() internally calls to drm_connector_update_edid_property()
and then drm_add_display_info(), which parses the EDID.
This happens in the function intel_hdmi_set_edid() and
intel_sdvo_tmds_sink_detect() (via intel_sdvo_get_edid()).

Once EDID is parsed, the monitor HDMI support information is available
through drm_display_info.is_hdmi. Retriving the same information with
drm_detect_hdmi_monitor() is less efficient. Change to
drm_display_info.is_hdmi

This is a TODO task in Documentation/gpu/todo.rst

Signed-off-by: Claudio Suarez <cssk@net-c.es>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index b04685bb6439..008e5b0ba408 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2355,7 +2355,7 @@ intel_hdmi_set_edid(struct drm_connector *connector)
 	to_intel_connector(connector)->detect_edid = edid;
 	if (edid && edid->input & DRM_EDID_INPUT_DIGITAL) {
 		intel_hdmi->has_audio = drm_detect_monitor_audio(edid);
-		intel_hdmi->has_hdmi_sink = drm_detect_hdmi_monitor(edid);
+		intel_hdmi->has_hdmi_sink = connector->display_info.is_hdmi;
 
 		connected = true;
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 6cb27599ea03..b4065e4df644 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -2060,8 +2060,9 @@ intel_sdvo_tmds_sink_detect(struct drm_connector *connector)
 		if (edid->input & DRM_EDID_INPUT_DIGITAL) {
 			status = connector_status_connected;
 			if (intel_sdvo_connector->is_hdmi) {
-				intel_sdvo->has_hdmi_monitor = drm_detect_hdmi_monitor(edid);
 				intel_sdvo->has_hdmi_audio = drm_detect_monitor_audio(edid);
+				intel_sdvo->has_hdmi_monitor =
+							    connector->display_info.is_hdmi;
 			}
 		} else
 			status = connector_status_disconnected;
-- 
2.33.0



