Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CB7D1B746
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 22:41:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C0A710E555;
	Tue, 13 Jan 2026 21:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pf7Nr+s9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929EC10E554
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 21:41:11 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-64b5b68a9bdso1334402a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 13:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768340470; x=1768945270; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N4LHM++IvHyHjeqEMT100Kj5QFDlUAnoHSe0AnsGOac=;
 b=Pf7Nr+s9oLXy88kFDfzaUyhKv6S86YWMpLvEErt8P2mSL0UtYKRpPWg2rvnJ/ELhQK
 LdO+YZwObbAQDp0TgHTGRn/sJqMznrK6x+LX6tpKrVAuE4WswD06lKfv2I+98k6U6tjH
 hcCraZ6HPBkHg71gsBjyn4d85kwlVg8QlNesoXaxQFdKmxk9B9+RWRbdomjll3rftgDb
 OkOdg2jPmCvuV1GakB6BHRHGd1yJno9NJlqd8WwO22NVggwImKK+FLu3EYCGrVfn4/2c
 AtlTk8eYNHImNt9hctmNX/RB2MRvxIXptzseDjLthdgIPiZ30b+zAeKs90HgQziONCxR
 07sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768340470; x=1768945270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=N4LHM++IvHyHjeqEMT100Kj5QFDlUAnoHSe0AnsGOac=;
 b=SzjPbsY3+1WYv+oL8DmvG0h3VudYy2wss+cyC56qcg+hSRmX8zvRPlvoqM+wSoP7BL
 RicKrfUOue14NVvpOQ2xJWPh+tYTHETH1S1xD/tC0KOHsQAx6uDL3QWaaEz87DPjEVjR
 ztteLISgQEMCfdRT4xIdQZLyEUrmBdPHIF6hXKIwrQRln8GxgvXXNWq2XZ3bOlEf3Jeq
 DIFdhuvcl8YVAqlyxNBcYKtBfn2M8XhUBLKoLw5RPg6rEL8s1dr8MnYLM183NNvlQPls
 M6kRnj8Keh2O9vYvnhgEVae7P6uE358FBVD7v2UNJnavqi81DXHIFoVEIJS9cuecHbWS
 Ayow==
X-Gm-Message-State: AOJu0YxBr3sUkFCojK4lJZmRg6J+hbFpyIonZnfEEpnU1zaf0Q2JHsHV
 vcLMbQtXPQxg3+rRw8t2pUWsNlO47Wcjv8gGMNwW1vKmEqrBsd4uRxUe
X-Gm-Gg: AY/fxX7UqqMQ1mUOTM5XXDXgFUC2s+idEEsWDb3BXMwFq1AFtiS71Y7PvcPfZCcZxK9
 debgy06jTqcA762yxsaz0CpxhZf+KGkiCKSVMY/lKGr95aqCsvjiSHEusNSSIChBbTVIUg/FbwZ
 6Sjx5Oo9i4AFqHgs57q8rn8HLVkl1bie162+MySX1Kz1Li6Az1NNqN43ES8AZ3mMoxmpsLgbaUl
 qvf/8xAh/l2bUAKQgRNYFyLCCXBJLGE0juXMvBusxgsgl3jmlHctpBch6GWAxTsfAxOC4LUYWs/
 yEqA4hf9IyYGJLrR5EDTLJZZO7N5hmguR7RtiiJKxhAO2pEjBW/vTu+J6OmsPhMrbibMtlFZTNR
 Ib/mSQjQMJLV9XylnqDz6dPJA+/VVx03Cxay0prHJAcBeCEY22DrjvjtvTLwjgZmBYqyUdVehss
 DHov6kkA6lHOtcGnGGwn+NEH5UX+BqK1jy11PTCt9ZAIFVL5ZkpgUD+CKj747FAC3p
X-Received: by 2002:a05:6402:2816:b0:645:7d1b:e151 with SMTP id
 4fb4d7f45d1cf-653ec1086d0mr204062a12.1.1768340470025; 
 Tue, 13 Jan 2026 13:41:10 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507bf6d5e0sm20858052a12.31.2026.01.13.13.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 13:41:09 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] drm/amd/display: enable HDMI VRR over PCON
Date: Tue, 13 Jan 2026 22:41:04 +0100
Message-ID: <20260113214104.146856-4-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113214104.146856-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260113214104.146856-1-tomasz.pakula.oficjalny@gmail.com>
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

This works the same as FreeSync over PCON just without sending FreeSync
info packets (we're sending standard DisplayPort info packets) + reading
the VRR range from the HDMI Forum vendor specific data block. PCONs take
over HDMI VRR triggering.

Prefer HDMI VRR over FreeSync to reduce VRR flickering on many TVs.
FreeSync over HDMI seems to be a fallback solution and not a first-class
citizen. This especially helps VMM7100.

In case of VRRmin == 0, the selected video mode is the upper boundary.

Tested with VMM7100 and CH7218 based adapters on multiple HDMI 2.1 and
HDMI 2.0 devices. (Samsung S95B, LG C4, Sony Bravia 8, Dell AW3423DWF)

Fixes: https://gitlab.freedesktop.org/drm/amd/-/issues/4805

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Tested-by: Bernhard Berger <bernhard.berger@gmail.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 23 ++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 1318d88687ae..53f3c88c7cdc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -12932,6 +12932,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	struct dc_sink *sink;
 	struct amdgpu_device *adev = drm_to_adev(connector->dev);
 	struct amdgpu_hdmi_vsdb_info vsdb_info = {0};
+	struct drm_hdmi_vrr_cap *hdmi_vrr;
 	const struct edid *edid;
 	bool freesync_capable = false;
 	enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
@@ -13004,21 +13005,37 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		as_type = dm_get_adaptive_sync_support_type(amdgpu_dm_connector->dc_link);
 
 	if (as_type == ADAPTIVE_SYNC_TYPE_PCON_IN_WHITELIST) {
+		hdmi_vrr = &connector->display_info.hdmi.vrr_cap;
 		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
-		if (i >= 0 && vsdb_info.freesync_supported && vsdb_info.amd_vsdb_version > 0) {
 
+		/* Prefer HDMI VRR over FreeSync */
+		if (hdmi_vrr->supported) {
+			/* VRRmax == 0 is a valid value. Selected mode is the upper boundary. */
+			u16 vrr_max = hdmi_vrr->vrr_max ? hdmi_vrr->vrr_max : 10000;
+
+			amdgpu_dm_connector->pack_sdp_v1_3 = true;
+			amdgpu_dm_connector->as_type = as_type;
+
+			amdgpu_dm_connector->min_vfreq = hdmi_vrr->vrr_min;
+			amdgpu_dm_connector->max_vfreq = vrr_max;
+
+			connector->display_info.monitor_range.min_vfreq = hdmi_vrr->vrr_min;
+			connector->display_info.monitor_range.max_vfreq = vrr_max;
+
+		} else if (i >= 0 && vsdb_info.freesync_supported && vsdb_info.amd_vsdb_version > 0) {
 			amdgpu_dm_connector->pack_sdp_v1_3 = true;
 			amdgpu_dm_connector->as_type = as_type;
 			amdgpu_dm_connector->vsdb_info = vsdb_info;
 
 			amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
 			amdgpu_dm_connector->max_vfreq = vsdb_info.max_refresh_rate_hz;
-			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
-				freesync_capable = true;
 
 			connector->display_info.monitor_range.min_vfreq = vsdb_info.min_refresh_rate_hz;
 			connector->display_info.monitor_range.max_vfreq = vsdb_info.max_refresh_rate_hz;
 		}
+
+		if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
+			freesync_capable = true;
 	}
 
 update:
-- 
2.52.0

