Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECY4D1VQp2nKggAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:19:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E11551F7653
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:19:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFC010E8D9;
	Tue,  3 Mar 2026 21:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ubuntu.com header.i=@ubuntu.com header.b="iuegO1SU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F5410E8D4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 21:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-953a8a3ca9;
 t=1772572748; bh=V1y8zzUUQhnBLmLYXsLxgaaLXMNPUeIiRXofaE0kNwY=;
 b=iuegO1SUO33mg8v8Rz/8i3x36UYSWkARMNDP5zw1tj5vkDDyMVykO+dJZtMmlswQE5PA0EYCR
 8X4iucC1OzsAYewlp/vJQ9AaTffkz2NqvSw4o87HfywyhPYotzshYsaCYVROA29EJf+PhfPxyCV
 hxYCL3iONHfHPhQtPyDIF3WRblyBfQ7tGHv8l5GUViZCuhNXHBFcamKRZa2S0p27bVUhDvrrAne
 fGWrfRCwb9I/beed9sbR73HY4SbYrq917pvMVXCAvsVTDGLuUQpNczo6YJbNu/XYpmt9rIDaG3Z
 YElI3eotE6hb7kO6l26Mvqo/M7CB0COZts9608K0lUqA==
X-Forward-Email-ID: 69a75049b5d0800e9c1f061e
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.6.37
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
Subject: [PATCH RESEND 1/2] drm/amdgpu/amdgpu_connectors: use struct drm_edid
 instead of struct edid
Date: Tue,  3 Mar 2026 16:18:22 -0500
Message-ID: <20260303211823.76631-2-jpeisach@ubuntu.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303211823.76631-1-jpeisach@ubuntu.com>
References: <20260303211823.76631-1-jpeisach@ubuntu.com>
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
X-Rspamd-Queue-Id: E11551F7653
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ubuntu.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ubuntu.com:s=fe-953a8a3ca9];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amd-gfx@lists.freedesktop.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:jpeisach@ubuntu.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[jpeisach@ubuntu.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jpeisach@ubuntu.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ubuntu.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Some amdgpu code is still using deprecated edid functions. Switch to
the newer functions and update the amdgpu_connector struct's edid type
to the drm_edid type.

At the same time, use the raw EDID when we need to for speaker
allocations and for determining if the input is digital.

Signed-off-by: Joshua Peisach <jpeisach@ubuntu.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    | 32 +++++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  4 +--
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  4 +--
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  4 +--
 5 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index d1bf2e150..6336cadad 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -246,10 +246,10 @@ amdgpu_connector_find_encoder(struct drm_connector *connector,
 	return NULL;
 }
 
-static struct edid *
+static const struct drm_edid *
 amdgpu_connector_get_hardcoded_edid(struct amdgpu_device *adev)
 {
-	return drm_edid_duplicate(drm_edid_raw(adev->mode_info.bios_hardcoded_edid));
+	return drm_edid_dup(adev->mode_info.bios_hardcoded_edid);
 }
 
 static void amdgpu_connector_get_edid(struct drm_connector *connector)
@@ -268,8 +268,8 @@ static void amdgpu_connector_get_edid(struct drm_connector *connector)
 	if ((amdgpu_connector_encoder_get_dp_bridge_encoder_id(connector) !=
 	     ENCODER_OBJECT_ID_NONE) &&
 	    amdgpu_connector->ddc_bus->has_aux) {
-		amdgpu_connector->edid = drm_get_edid(connector,
-						      &amdgpu_connector->ddc_bus->aux.ddc);
+		amdgpu_connector->edid = drm_edid_read_ddc(connector,
+							  &amdgpu_connector->ddc_bus->aux.ddc);
 	} else if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) ||
 		   (connector->connector_type == DRM_MODE_CONNECTOR_eDP)) {
 		struct amdgpu_connector_atom_dig *dig = amdgpu_connector->con_priv;
@@ -277,14 +277,14 @@ static void amdgpu_connector_get_edid(struct drm_connector *connector)
 		if ((dig->dp_sink_type == CONNECTOR_OBJECT_ID_DISPLAYPORT ||
 		     dig->dp_sink_type == CONNECTOR_OBJECT_ID_eDP) &&
 		    amdgpu_connector->ddc_bus->has_aux)
-			amdgpu_connector->edid = drm_get_edid(connector,
-							      &amdgpu_connector->ddc_bus->aux.ddc);
+			amdgpu_connector->edid = drm_edid_read_ddc(connector,
+								  &amdgpu_connector->ddc_bus->aux.ddc);
 		else if (amdgpu_connector->ddc_bus)
-			amdgpu_connector->edid = drm_get_edid(connector,
-							      &amdgpu_connector->ddc_bus->adapter);
+			amdgpu_connector->edid = drm_edid_read_ddc(connector,
+								  &amdgpu_connector->ddc_bus->adapter);
 	} else if (amdgpu_connector->ddc_bus) {
-		amdgpu_connector->edid = drm_get_edid(connector,
-						      &amdgpu_connector->ddc_bus->adapter);
+		amdgpu_connector->edid = drm_edid_read_ddc(connector,
+							  &amdgpu_connector->ddc_bus->adapter);
 	}
 
 	if (!amdgpu_connector->edid) {
@@ -292,7 +292,7 @@ static void amdgpu_connector_get_edid(struct drm_connector *connector)
 		if (((connector->connector_type == DRM_MODE_CONNECTOR_LVDS) ||
 		     (connector->connector_type == DRM_MODE_CONNECTOR_eDP))) {
 			amdgpu_connector->edid = amdgpu_connector_get_hardcoded_edid(adev);
-			drm_connector_update_edid_property(connector, amdgpu_connector->edid);
+			drm_edid_connector_update(connector, amdgpu_connector->edid);
 		}
 	}
 }
@@ -311,11 +311,11 @@ static int amdgpu_connector_ddc_get_modes(struct drm_connector *connector)
 	int ret;
 
 	if (amdgpu_connector->edid) {
-		drm_connector_update_edid_property(connector, amdgpu_connector->edid);
-		ret = drm_add_edid_modes(connector, amdgpu_connector->edid);
+		drm_edid_connector_update(connector, amdgpu_connector->edid);
+		ret = drm_edid_connector_add_modes(connector);
 		return ret;
 	}
-	drm_connector_update_edid_property(connector, NULL);
+	drm_edid_connector_update(connector, NULL);
 	return 0;
 }
 
@@ -883,7 +883,7 @@ amdgpu_connector_vga_detect(struct drm_connector *connector, bool force)
 			ret = connector_status_connected;
 		} else {
 			amdgpu_connector->use_digital =
-				!!(amdgpu_connector->edid->input & DRM_EDID_INPUT_DIGITAL);
+				drm_edid_is_digital(amdgpu_connector->edid);
 
 			/* some oems have boards with separate digital and analog connectors
 			 * with a shared ddc line (often vga + hdmi)
@@ -1063,7 +1063,7 @@ amdgpu_connector_dvi_detect(struct drm_connector *connector, bool force)
 			broken_edid = true; /* defer use_digital to later */
 		} else {
 			amdgpu_connector->use_digital =
-				!!(amdgpu_connector->edid->input & DRM_EDID_INPUT_DIGITAL);
+				drm_edid_is_digital(amdgpu_connector->edid);
 
 			/* some oems have boards with separate digital and analog connectors
 			 * with a shared ddc line (often vga + hdmi)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index dc8d2f52c..c4e025581 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -624,7 +624,7 @@ struct amdgpu_connector {
 	bool use_digital;
 	/* we need to mind the EDID between detect
 	   and get modes due to analog/digital/tvencoder */
-	struct edid *edid;
+	const struct drm_edid *edid;
 	void *con_priv;
 	bool dac_load_detect;
 	bool detected_by_load; /* if the connection status was determined by load */
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index a7ffe10ee..4aaee1bf9 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -1298,7 +1298,7 @@ static void dce_v10_0_audio_write_speaker_allocation(struct drm_encoder *encoder
 		return;
 	}
 
-	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector->edid, &sadb);
+	sad_count = drm_edid_to_speaker_allocation(drm_edid_raw(amdgpu_connector->edid), &sadb);
 	if (sad_count < 0) {
 		DRM_ERROR("Couldn't read Speaker Allocation Data Block: %d\n", sad_count);
 		sad_count = 0;
@@ -1368,7 +1368,7 @@ static void dce_v10_0_audio_write_sad_regs(struct drm_encoder *encoder)
 		return;
 	}
 
-	sad_count = drm_edid_to_sad(amdgpu_connector->edid, &sads);
+	sad_count = drm_edid_to_sad(drm_edid_raw(amdgpu_connector->edid), &sads);
 	if (sad_count < 0)
 		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
 	if (sad_count <= 0)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index a72e20db5..7cb207c7f 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -1265,7 +1265,7 @@ static void dce_v6_0_audio_write_speaker_allocation(struct drm_encoder *encoder)
 		return;
 	}
 
-	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector->edid, &sadb);
+	sad_count = drm_edid_to_speaker_allocation(drm_edid_raw(amdgpu_connector->edid), &sadb);
 	if (sad_count < 0) {
 		DRM_ERROR("Couldn't read Speaker Allocation Data Block: %d\n", sad_count);
 		sad_count = 0;
@@ -1346,7 +1346,7 @@ static void dce_v6_0_audio_write_sad_regs(struct drm_encoder *encoder)
 		return;
 	}
 
-	sad_count = drm_edid_to_sad(amdgpu_connector->edid, &sads);
+	sad_count = drm_edid_to_sad(drm_edid_raw(amdgpu_connector->edid), &sads);
 	if (sad_count < 0)
 		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
 	if (sad_count <= 0)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index 4221c7b7c..0eff41e94 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -1271,7 +1271,7 @@ static void dce_v8_0_audio_write_speaker_allocation(struct drm_encoder *encoder)
 		return;
 	}
 
-	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector->edid, &sadb);
+	sad_count = drm_edid_to_speaker_allocation(drm_edid_raw(amdgpu_connector->edid), &sadb);
 	if (sad_count < 0) {
 		DRM_ERROR("Couldn't read Speaker Allocation Data Block: %d\n", sad_count);
 		sad_count = 0;
@@ -1339,7 +1339,7 @@ static void dce_v8_0_audio_write_sad_regs(struct drm_encoder *encoder)
 		return;
 	}
 
-	sad_count = drm_edid_to_sad(amdgpu_connector->edid, &sads);
+	sad_count = drm_edid_to_sad(drm_edid_raw(amdgpu_connector->edid), &sads);
 	if (sad_count < 0)
 		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
 	if (sad_count <= 0)
-- 
2.51.0

