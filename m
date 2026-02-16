Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qN7WBugRk2mL1QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 13:47:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A99143708
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 13:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E26810E1D4;
	Mon, 16 Feb 2026 12:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ubuntu.com header.i=@ubuntu.com header.b="nwgjp9kR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3E810E04C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 12:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-953a8a3ca9;
 t=1771246048; bh=/wNoA/9OggUkZymj3/z82aaDa47yws0rVJJZ3kBahzM=;
 b=nwgjp9kRH8NytA8dFhkegoMX4yXGhtgv70Cc+l6wYEz58+9BP9SW+yk44Yd5Fc26EKLzXIufg
 WRExbNgStMBp3eXT2tQLXjMqXpezgjNcskIueL6pmkUu04AXyc/8kVPm8xjIGuSUyNbUQc2KP0Z
 w6k/m5CvTWF82WrviEFJIs0Ppn50tBIRNDwiUJZS7fUoP/+29ZuSb9qCaUaa8O4dM0b9ty9INbZ
 BwigaER7Zx2z8eabIJvVTSIwVwhXqP+jkiojMwlIGPjQ3A2v2J7EEzYwWxr5HSbrNgxSmgtGkLP
 EOPGEL2vXnUA9BCrvTA4WDJvy01LI/iRdxW7iSJ8vm0g==
X-Forward-Email-ID: 699311decde16816033f2235
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.6.10
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Joshua Peisach <jpeisach@ubuntu.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Joshua Peisach <jpeisach@ubuntu.com>
Subject: [PATCH 1/2] drm/radeon: use struct drm_edid instead of struct edid
Date: Mon, 16 Feb 2026 07:46:32 -0500
Message-ID: <20260216124633.42644-2-jpeisach@ubuntu.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260216124633.42644-1-jpeisach@ubuntu.com>
References: <20260216124633.42644-1-jpeisach@ubuntu.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ubuntu.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ubuntu.com:s=fe-953a8a3ca9];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:amd-gfx@lists.freedesktop.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:jpeisach@ubuntu.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[jpeisach@ubuntu.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ubuntu.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[jpeisach@ubuntu.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ubuntu.com:mid,ubuntu.com:dkim,ubuntu.com:email]
X-Rspamd-Queue-Id: C0A99143708
X-Rspamd-Action: no action

Some of the code still relies on functions that are deprecated. In
order to switch to the newer ones, replace uses of struct edid
with struct drm_edid.

For SADs, get the raw edid when necessary. Also, update the checks
for digital input to use the drm_edid_is_digital.

Signed-off-by: Joshua Peisach <jpeisach@ubuntu.com>
---
 drivers/gpu/drm/radeon/radeon_audio.c      |  4 +--
 drivers/gpu/drm/radeon/radeon_combios.c    |  4 +--
 drivers/gpu/drm/radeon/radeon_connectors.c | 30 +++++++++++-----------
 drivers/gpu/drm/radeon/radeon_mode.h       |  4 +--
 4 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
index 8d64ba185..52d004973 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -311,7 +311,7 @@ static void radeon_audio_write_sad_regs(struct drm_encoder *encoder)
 	if (!connector)
 		return;
 
-	sad_count = drm_edid_to_sad(radeon_connector->edid, &sads);
+	sad_count = drm_edid_to_sad(drm_edid_raw(radeon_connector->edid), &sads);
 	if (sad_count < 0)
 		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
 	if (sad_count <= 0)
@@ -335,7 +335,7 @@ static void radeon_audio_write_speaker_allocation(struct drm_encoder *encoder)
 	if (!connector)
 		return;
 
-	sad_count = drm_edid_to_speaker_allocation(radeon_connector->edid, &sadb);
+	sad_count = drm_edid_to_speaker_allocation(drm_edid_raw(radeon_connector->edid), &sadb);
 	if (sad_count < 0) {
 		DRM_DEBUG("Couldn't read Speaker Allocation Data Block: %d\n",
 			  sad_count);
diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
index df8d7f56b..f4947acd0 100644
--- a/drivers/gpu/drm/radeon/radeon_combios.c
+++ b/drivers/gpu/drm/radeon/radeon_combios.c
@@ -390,10 +390,10 @@ bool radeon_combios_check_hardcoded_edid(struct radeon_device *rdev)
 }
 
 /* this is used for atom LCDs as well */
-struct edid *
+const struct drm_edid *
 radeon_bios_get_hardcoded_edid(struct radeon_device *rdev)
 {
-	return drm_edid_duplicate(drm_edid_raw(rdev->mode_info.bios_hardcoded_edid));
+	return drm_edid_dup(rdev->mode_info.bios_hardcoded_edid);
 }
 
 static struct radeon_i2c_bus_rec combios_setup_i2c_bus(struct radeon_device *rdev,
diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index 012d8b229..d3a2efbcf 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -271,8 +271,8 @@ static void radeon_connector_get_edid(struct drm_connector *connector)
 	if ((radeon_connector_encoder_get_dp_bridge_encoder_id(connector) !=
 	     ENCODER_OBJECT_ID_NONE) &&
 	    radeon_connector->ddc_bus->has_aux) {
-		radeon_connector->edid = drm_get_edid(connector,
-						      &radeon_connector->ddc_bus->aux.ddc);
+		radeon_connector->edid = drm_edid_read_ddc(connector,
+							   &radeon_connector->ddc_bus->aux.ddc);
 	} else if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) ||
 		   (connector->connector_type == DRM_MODE_CONNECTOR_eDP)) {
 		struct radeon_connector_atom_dig *dig = radeon_connector->con_priv;
@@ -280,19 +280,19 @@ static void radeon_connector_get_edid(struct drm_connector *connector)
 		if ((dig->dp_sink_type == CONNECTOR_OBJECT_ID_DISPLAYPORT ||
 		     dig->dp_sink_type == CONNECTOR_OBJECT_ID_eDP) &&
 		    radeon_connector->ddc_bus->has_aux)
-			radeon_connector->edid = drm_get_edid(&radeon_connector->base,
-							      &radeon_connector->ddc_bus->aux.ddc);
+			radeon_connector->edid = drm_edid_read_ddc(&radeon_connector->base,
+								   &radeon_connector->ddc_bus->aux.ddc);
 		else if (radeon_connector->ddc_bus)
-			radeon_connector->edid = drm_get_edid(&radeon_connector->base,
-							      &radeon_connector->ddc_bus->adapter);
+			radeon_connector->edid = drm_edid_read_ddc(&radeon_connector->base,
+								   &radeon_connector->ddc_bus->adapter);
 	} else if (vga_switcheroo_handler_flags() & VGA_SWITCHEROO_CAN_SWITCH_DDC &&
 		   connector->connector_type == DRM_MODE_CONNECTOR_LVDS &&
 		   radeon_connector->ddc_bus) {
-		radeon_connector->edid = drm_get_edid_switcheroo(&radeon_connector->base,
-								 &radeon_connector->ddc_bus->adapter);
+		radeon_connector->edid = drm_edid_read_switcheroo(&radeon_connector->base,
+								  &radeon_connector->ddc_bus->adapter);
 	} else if (radeon_connector->ddc_bus) {
-		radeon_connector->edid = drm_get_edid(&radeon_connector->base,
-						      &radeon_connector->ddc_bus->adapter);
+		radeon_connector->edid = drm_edid_read_ddc(&radeon_connector->base,
+							   &radeon_connector->ddc_bus->adapter);
 	}
 
 	if (!radeon_connector->edid) {
@@ -328,11 +328,11 @@ static int radeon_ddc_get_modes(struct drm_connector *connector)
 	int ret;
 
 	if (radeon_connector->edid) {
-		drm_connector_update_edid_property(connector, radeon_connector->edid);
-		ret = drm_add_edid_modes(connector, radeon_connector->edid);
+		drm_edid_connector_update(connector, radeon_connector->edid);
+		ret = drm_edid_connector_add_modes(connector);
 		return ret;
 	}
-	drm_connector_update_edid_property(connector, NULL);
+	drm_edid_connector_update(connector, NULL);
 	return 0;
 }
 
@@ -1016,7 +1016,7 @@ radeon_vga_detect(struct drm_connector *connector, bool force)
 			ret = connector_status_connected;
 		} else {
 			radeon_connector->use_digital =
-				!!(radeon_connector->edid->input & DRM_EDID_INPUT_DIGITAL);
+				drm_edid_is_digital(radeon_connector->edid);
 
 			/* some oems have boards with separate digital and analog connectors
 			 * with a shared ddc line (often vga + hdmi)
@@ -1271,7 +1271,7 @@ radeon_dvi_detect(struct drm_connector *connector, bool force)
 			}
 		} else {
 			radeon_connector->use_digital =
-				!!(radeon_connector->edid->input & DRM_EDID_INPUT_DIGITAL);
+				drm_edid_is_digital(radeon_connector->edid);
 
 			/* some oems have boards with separate digital and analog connectors
 			 * with a shared ddc line (often vga + hdmi)
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index 9e34da2ca..2f1624292 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -525,7 +525,7 @@ struct radeon_connector {
 	bool use_digital;
 	/* we need to mind the EDID between detect
 	   and get modes due to analog/digital/tvencoder */
-	struct edid *edid;
+	const struct drm_edid *edid;
 	void *con_priv;
 	bool dac_load_detect;
 	bool detected_by_load; /* if the connection status was determined by load */
@@ -847,7 +847,7 @@ radeon_get_crtc_scanout_position(struct drm_crtc *crtc, bool in_vblank_irq,
 				 const struct drm_display_mode *mode);
 
 extern bool radeon_combios_check_hardcoded_edid(struct radeon_device *rdev);
-extern struct edid *
+extern const struct drm_edid *
 radeon_bios_get_hardcoded_edid(struct radeon_device *rdev);
 extern bool radeon_atom_get_clock_info(struct drm_device *dev);
 extern bool radeon_combios_get_clock_info(struct drm_device *dev);
-- 
2.51.0

