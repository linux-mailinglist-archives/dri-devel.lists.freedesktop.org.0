Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A30D39BC4
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 02:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF5010E30B;
	Mon, 19 Jan 2026 01:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O4hDBWGR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDF410E30C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 01:12:05 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id
 a640c23a62f3a-b87174fbacdso44800766b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 17:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768785124; x=1769389924; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r18vhTswb3nOt1VBJpOlruOgjP/ijyrBC8r/JG8t7Ms=;
 b=O4hDBWGRi9clgsLkpcl/dRjs8BKKhkgWb+HKbwDA55xnpumF7NbDDY9P/lCk1h74ye
 X1NOaqvMMMIsS01nmRSRT4blIFwrzQcNNYCAztrkhMkjukhEB7us9rn+bTE8teKzDglN
 7hE0hZ8uwcAkLSAYMY+bpiskMLAEYNPOtiWT+M8GD1y1OJ1ly91g7NpzJc6DvB2XUdmi
 uiwtU8bRTqSHRN7nMwapDhOL6FxN+UZ37LaKWiBSNPR4vhprQp/LfibWPg1HX/fW0Ce/
 HIjDamrPIhgp7LMU7qxEyX69+n/ePTgweTG2vD7D4qYx4jnMVDJPmQQUbgE/LMV63g2T
 qd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768785124; x=1769389924;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r18vhTswb3nOt1VBJpOlruOgjP/ijyrBC8r/JG8t7Ms=;
 b=MbhBkLtqdkU3HCLgzIy8xfeHp5DMYnkS4QSKT/CUyIVqPY/XksNRk0L4u5vMgdp4sz
 PSXWUotROqJaHjnaMEKh4Bh9XZRp7zEHPq7UPqEBQ4CKz1LCaRv6ja4siW+j+/n8Ee9f
 bkClPrHST7G+bS1CK620ZThH2QD0yXZnbrBl6HfG3MrVMU+N5MngKpWmtQyQP2gKeCRU
 SYYnlaVuX4TZhu/i4XKuRuLP5T/UMFUaUgHiunr45pS0I1C1cXETqmLxJDIgs/ZKzSo8
 G6BkgVS1VDpoSQV08KE4C3Mev6tvXF71IcmyExuZJILm9Ux0YyVy1y3FhfgSUZJJuE6S
 bDWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdofokOmpEPJ7xzaDUzSbFbCWnELtCJ203NZjGazKEAJklU9wB1+RsGEIY+FsO7XUoZR15XpUNFQo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXejKsIDnPmiPknbhbr9rkRy45x+zW3YdI/EAVSuU6zFc2/Cz0
 D91cERvX9ZOYSBaEMoLMzfn77lmppKi41fa7LxmSGSqahpIYxBjs0zI1
X-Gm-Gg: AY/fxX4mslsDUWfMd58RL8RSLBhhPpnxv2i6+PhxYgKnDvf3n9Is41EQd3yd4J7blyG
 nOX1pvI/879acsqh5ybFRGlkgbhnr+xITZuIqFXyuUYGwHW9Xk+SMxhe81KmDmWKO8ERhnijP2h
 wVLJYJGN0tGxcywh1GiGgcrAWF6MXJ0n7TnT9Ol+G38G4c1Le+hR4YKIFZO48ObkY64ZdStz8oF
 rngBLwA4bnOMcq0kpIOMbqtb5RDqmM6y0StJqqMts6VfEzho1QiPb5F8mouZ2TaYgVuaNXxlnI1
 JAvSorpLaRymp2i/2e4+imFQmnXOPtCYxNVr9k4D/RErqK2S1JZLTosJgWtW2j3PcC1fpBevCx7
 pVvey+Hm0VBhIAhN2pBVbgmF51SVmEG/1QdBKJ14rco6W5d17ROrPQY9A4sMEVnIq4P3VAhOds8
 oCJhIRxnAjCyhM1SrIJG88OQE+sFzM0mdkUnXSjnBWZ1fUVS1gN3wIj5MxiJRvghfb
X-Received: by 2002:a05:6402:348d:b0:64c:9e19:982d with SMTP id
 4fb4d7f45d1cf-654523cc85bmr4269711a12.1.1768785124078; 
 Sun, 18 Jan 2026 17:12:04 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-654535c4912sm8989806a12.30.2026.01.18.17.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 17:12:03 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com
Subject: [PATCH 10/17] drm/amd/display: Enable HDMI VRR over PCON
Date: Mon, 19 Jan 2026 02:11:39 +0100
Message-ID: <20260119011146.62302-11-tomasz.pakula.oficjalny@gmail.com>
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
Not all TVs support FreeSync and many TVs suffer from VRR flickering
while Freesync is activated.

[How]
This works the same as FreeSync over PCON just without sending FreeSync
info packets (we're sending standard DisplayPort info packets) + reading
the VRR range from the HDMI Forum vendor specific data block. PCONs take
over HDMI VRR triggering.

Prefer HDMI VRR over FreeSync to reduce VRR flickering on many TVs.
FreeSync over HDMI seems to be a fallback solution and not a first-class
citizen. This especially helps VMM7100.

Tested with VMM7100 and CH7218 based adapters on multiple HDMI 2.1 and
HDMI 2.0 devices. (Samsung S95B, LG C4, Sony Bravia 8, Dell AW3423DWF)

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4805

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Tested-by: Bernhard Berger <bernhard.berger@gmail.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 31 ++++++++++++++++---
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b7deff137df4..772deaa136d7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13193,6 +13193,20 @@ static void monitor_range_from_vsdb(struct drm_connector *conn,
 	range->max_vfreq = vsdb->max_refresh_rate_hz;
 }
 
+/*
+ * Get VRR range from HDMI VRR info in EDID.
+ *
+ * @conn: drm_connector with HDMI VRR info
+ */
+static void monitor_range_from_hdmi(struct drm_connector *conn)
+{
+	struct drm_monitor_range_info *range = &conn->display_info.monitor_range;
+	struct drm_hdmi_vrr_cap *caps = &conn->display_info.hdmi.vrr_cap;
+
+	range->min_vfreq = caps->vrr_min;
+	range->max_vfreq = caps->vrr_max;
+}
+
 /**
  * Returns true if connector is capable of freesync
  * Optionally, can fetch the range from AMD vsdb
@@ -13242,6 +13256,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	struct amdgpu_hdmi_vsdb_info vsdb_info = {0};
 	struct amdgpu_hdmi_vsdb_info vsdb_did = {0};
 	struct dpcd_caps dpcd_caps = {0};
+	struct drm_hdmi_vrr_cap *hdmi_vrr;
 	const struct edid *edid;
 	bool freesync_capable = false;
 	bool valid_vsdb_cea = false;
@@ -13279,6 +13294,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
 	valid_vsdb_cea = parse_amd_vsdb_cea(amdgpu_dm_connector, edid, &vsdb_info) >= 0;
 	vsdb_freesync = valid_vsdb_cea && vsdb_info.freesync_supported;
+	hdmi_vrr = &connector->display_info.hdmi.vrr_cap;
 
 	if (amdgpu_dm_connector->dc_link) {
 		dpcd_caps = amdgpu_dm_connector->dc_link->dpcd_caps;
@@ -13324,12 +13340,17 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		freesync_capable = copy_range_to_amdgpu_connector(connector);
 
 	/* DP -> HDMI PCON */
-	} else if (pcon_allowed && vsdb_freesync) {
-		amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_PCON_ALLOWED;
-		amdgpu_dm_connector->pack_sdp_v1_3 = true;
-		amdgpu_dm_connector->vsdb_info = vsdb_info;
+	} else if (pcon_allowed) {
+		/* Prefer HDMI VRR */
+		if (hdmi_vrr->supported && hdmi_vrr->vrr_max > 0)
+			monitor_range_from_hdmi(connector);
+		else if (vsdb_freesync) {
+			amdgpu_dm_connector->vsdb_info = vsdb_info;
+			monitor_range_from_vsdb(connector, &vsdb_info);
+		}
 
-		monitor_range_from_vsdb(connector, &vsdb_info);
+		amdgpu_dm_connector->pack_sdp_v1_3 = true;
+		amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_PCON_ALLOWED;
 		freesync_capable = copy_range_to_amdgpu_connector(connector);
 	}
 
-- 
2.52.0

