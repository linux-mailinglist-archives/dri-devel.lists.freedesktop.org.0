Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E2DD39BC6
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 02:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340F110E303;
	Mon, 19 Jan 2026 01:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R2Szm/Rm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D43B10E303
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 01:12:07 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id
 a640c23a62f3a-b8718e54398so69202266b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 17:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768785125; x=1769389925; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9/53CE6A9/GsgJ6BVK8QZ50j6vF5XTAayna7qWQhe+s=;
 b=R2Szm/RmZqo3nSk20VJvkRA6dHuCsSEFpcuExy7i8OzDvJxvw1DsWRMaz2DwFY69uD
 1O4Hw3VtFWzzmkkUQ3r4nIsf+uUdUepUC4ladr0/Yp9M+9nnmefHUcgRyR8lN7XAsgEf
 7HPaeUEkQkUq7S9SKt0NdVf/T9vKi4eWJAQX3tnjNPhfRr454bxWqCa+nPCfc/yLB0BG
 XHtwJCOLA6qR4wxhMWMsG7w4hfTCw81xbDMWyo+YpcoDGFEQXvDWLKjsI0DhzpQuw8nR
 xAU/oIe8I2YRgfDQh4bMdCeU7pBhRBL0yJsmnHK29CNKQmwv6WvViHfUGzg+rWcPLIQB
 vC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768785125; x=1769389925;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9/53CE6A9/GsgJ6BVK8QZ50j6vF5XTAayna7qWQhe+s=;
 b=SORQ+Xejd6UA3w1+mvmyrpqkTOrHrbNMZeKap0k+R/ZMMt6aGQ23wmxeIOJsRDi1l5
 3nN+YO4+s9y8CAM23KrgKurgZWHIAkwd+nUsjFS8Zsdtqt5nsFCKiG3iPKOn0r4NUf3H
 TtDVA6DKBC0rogqgP0oRYx7kG412p6mO/CymNrw7kN61LIOQRmKdXUVpa2CN4hPBVADM
 d7mAggUHzyv4bcHW2hXrggTdcK8Cis1J6Upw6RojdPtOS0Xnjn/nahG5q9DKrkhNJwvL
 5JX8Hb7hpKsSbbPLfzBzlcJEVBBPji4c6MsI48fi9Bk/odmJAMhjwIYmXlN/eeTdJQfC
 x/tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPDL1bpQnBgrN79KSq9SvLSxvXD54B8isCN8vi2SLGi5gzRtluLJSCaLk2n08W5ajLikbA9oqPmfo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTqxitqOdGx0WStQIt5BhLfscnvKJ6pbe0pvLNF9U2IqOZ9Y9O
 CsUe9PIwP7ztM9SG1KKeH/diLdksikDTYGN/X2Ey98SkjuUsXFARwD5N
X-Gm-Gg: AY/fxX4s+PLpwaK0rRV8Zgz9bx4Swb3DtkA9/FYKv5yal/oPVMo6czpdZzjL2hWGEZ/
 S4K5QE4088ebVuSFGhz2gesE5O1qrI9efHfGe8vsxZSP2QgnEHigjALyUN35qIKUznfiLE6wiCd
 Z4z/sCqecmajlPwPfvdlwUU/q2q+SBCnMHp2aK2mumq9ZEQ1cOWBmHeSTzipfJrr+Bf8+9kEkSC
 8M6jxayfHTCOFJS+xCrlV5sO65wv90cbjxsCTZcrghX9xcz6dPMDNvyQadyQqCMMm/LoRF8FX9Z
 9JXequb/8FpC3CWy2jSLtIwngsHOs1rKfJI0bSClFtCpuNAbADf+SMsJYFGyekPvx7HwFI2DZk3
 b/uyXoCGvTbbUfQ6wk4QnJZFk81zUsqofqyZb4/tcAylCXavTRSkxYUq4lrFFJ+ADEh2dQNhESI
 udw4BEiAYXGkTAuu2FizNWJ8/wL4qtdvcV/N0ormUfsymeN81BuzOMHpFDkq6fw56DnHuPmNWOI
 Hk=
X-Received: by 2002:a05:6402:27cf:b0:64d:4623:8475 with SMTP id
 4fb4d7f45d1cf-654524cf67cmr4280917a12.2.1768785125504; 
 Sun, 18 Jan 2026 17:12:05 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-654535c4912sm8989806a12.30.2026.01.18.17.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 17:12:05 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com
Subject: [PATCH 11/17] drm/amd/display: Support HDMI VRRmax=0
Date: Mon, 19 Jan 2026 02:11:40 +0100
Message-ID: <20260119011146.62302-12-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119011146.62302-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260119011146.62302-1-tomasz.pakula.oficjalny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

[Why]
VRRmax=0 is a valid value and means that the upper bound is guared by
the selected video mode.

[How]
In this context, saved vrr max is the max possible refresh rate ever.
Try getting upper VRR bound from AMD vsdbif it exists or rely on the
limitations of BRR in VTEM info frames.

I found through testing, that TVs seem to reject VTEM when BRR is set
to over 1000 Hz. Use this as the last resort VRRmax.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 22 ++++++++++++++-----
 .../amd/display/modules/inc/mod_info_packet.h |  2 ++
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 772deaa136d7..3c535a361882 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13194,17 +13194,29 @@ static void monitor_range_from_vsdb(struct drm_connector *conn,
 }
 
 /*
- * Get VRR range from HDMI VRR info in EDID.
+ * Get VRR range from HDMI VRR info in EDID. If VRRmax == 0,
+ * try getting upper bound from AMD vsdb (if passed).
  *
  * @conn: drm_connector with HDMI VRR info
+ * @vsdb: AMD vsdb from CAE. Can be NULL if not found.
  */
-static void monitor_range_from_hdmi(struct drm_connector *conn)
+static void monitor_range_from_hdmi(struct drm_connector *conn,
+				    const struct amdgpu_hdmi_vsdb_info *vsdb)
 {
 	struct drm_monitor_range_info *range = &conn->display_info.monitor_range;
 	struct drm_hdmi_vrr_cap *caps = &conn->display_info.hdmi.vrr_cap;
+	u16 vrr_max = caps->vrr_max;
+
+	/* Try getting upper vrr bound from AMD vsdb */
+	if (vrr_max == 0 && vsdb)
+		vrr_max = vsdb->max_refresh_rate_hz;
+
+	/* Use max possible BRR value as a last resort */
+	if (vrr_max == 0)
+		vrr_max = VTEM_BRR_MAX;
 
 	range->min_vfreq = caps->vrr_min;
-	range->max_vfreq = caps->vrr_max;
+	range->max_vfreq = vrr_max;
 }
 
 /**
@@ -13342,8 +13354,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	/* DP -> HDMI PCON */
 	} else if (pcon_allowed) {
 		/* Prefer HDMI VRR */
-		if (hdmi_vrr->supported && hdmi_vrr->vrr_max > 0)
-			monitor_range_from_hdmi(connector);
+		if (hdmi_vrr->supported)
+			monitor_range_from_hdmi(connector, valid_vsdb_cea ? &vsdb_info : NULL);
 		else if (vsdb_freesync) {
 			amdgpu_dm_connector->vsdb_info = vsdb_info;
 			monitor_range_from_vsdb(connector, &vsdb_info);
diff --git a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
index 5de8a6918e6a..67274ce129bd 100644
--- a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
+++ b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
@@ -33,6 +33,8 @@ struct dc_stream_state;
 struct dc_info_packet;
 struct mod_vrr_params;
 
+#define VTEM_BRR_MAX 1000
+
 void set_vsc_packet_colorimetry_data(
 		const struct dc_stream_state *stream,
 		struct dc_info_packet *info_packet,
-- 
2.52.0

