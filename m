Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D7D442EB3
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 14:00:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32396FD27;
	Tue,  2 Nov 2021 13:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-4.mailo.com (ip-15.mailobj.net [213.182.54.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD59890E9;
 Tue,  2 Nov 2021 13:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
 t=1635858027; bh=KZE5be4kZ78AY9HnD875H39rS7AY7Po+gyBhLbeR+7Q=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=gLPzDJ2Zt52jpaCdwkiNzcp7JRczDHs6DAzPfjQOmpW7xHavFW/ZqF+2X4AT7w0y/
 1DCTS+5mmrc0FzHCKnk5vXz3F0cG7Zy1lx+yJ9+2mFtL99bsA2gi8LCN18hRzZEeT6
 vz6lFJECZyw3qmw9Cna4dfiDWsZBWaTEOcmvpuf0=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Tue,  2 Nov 2021 14:00:27 +0100 (CET)
X-EA-Auth: kyKYQi70H6EL66+AI7uvNmj5oUg5Z6PG/JpYJTFXfoSMem1EG/HqbLnQ7tSwzwE8WKzJ1Hb3lnp7YzkeWlRV97PALCV7FQLV
Date: Tue, 2 Nov 2021 14:00:24 +0100
From: Claudio Suarez <cssk@net-c.es>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 13/13] drm/i915: replace drm_detect_hdmi_monitor()
 with drm_display_info.is_hdmi
Message-ID: <YYE2aLJeUSx1lk/J@gineta.localdomain>
References: <20211016184226.3862-1-cssk@net-c.es>
 <20211016184226.3862-14-cssk@net-c.es> <YW8QYsmkm3ZrBAx3@intel.com>
 <YW9L6d7e+RO29VJu@gineta.localdomain> <YXFwB7rN4bvR0Z+m@intel.com>
 <YXKRnUHWuboQKBF1@zorro.micasa> <YXKoMEF/gU98cL9n@intel.com>
 <YXKtIUDk+f2Bnn++@intel.com> <YXXbgWNHts9CMJXD@gineta.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXXbgWNHts9CMJXD@gineta.localdomain>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 amd-gfx@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Ben Skeggs <bskeggs@redhat.com>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Jingoo Han <jingoohan1@gmail.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 Sandy Huang <hjc@rock-chips.com>, Robert Foss <robert.foss@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit a92d083d08b0 created the new flag is_hdmi in drm_display_info
which is set when sink compliant with CEA-861 (EDID) will be treated
as an HDMI sink.

From that day, this value can be used in some cases instead of
calling drm_detect_hdmi_monitor() and a second parse is avoided
because drm_detect_hdmi_monitor() parses. A TODO task was
registered in Documentation/gpu/todo.rst to perform that task in
the future.

The flag drm_display_info.is_hdmi is set in the function
drm_add_display_info(), which is called from
drm_connector_update_edid_property(). Since commit 5186421cbfe2,
drm_get_edid() calls drm_connector_update_edid_property() when
reading the edid data from an i2c adapter. Therefore, in these
cases drm_display_info.is_hdmi is updated to its correct
value when returning from drm_get_edid().

Replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
in the cases when drm_detect_hdmi_monitor() is called after a
read from an i2c adapter using drm_get_edid() in the i915 driver.

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



