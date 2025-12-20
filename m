Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3500FCD3983
	for <lists+dri-devel@lfdr.de>; Sun, 21 Dec 2025 02:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9D410E273;
	Sun, 21 Dec 2025 01:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cp0vPnlf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4D410E229
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 11:46:59 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b79f698aa91so57342666b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 03:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766231218; x=1766836018; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BvS8nMfVOZkciUcLL0fNAysqWTrj8F7eL3+iW/A/2SM=;
 b=cp0vPnlfDxP9OWFXeVcVZ3kDkVMXz5asSmIT8x6tNeLw9RZ+Y5Sk4vm6jl3S3IMkuR
 XaZF4Tda13cbt+RR9GwDAwHeqjubMkchhrI+A7Bu+7SNR0sPPRKEUWnTUXmVgMtY5dIF
 nh6lf1gtNnSomti1SbkIganMJuuhGqqKljHo9HjY9Q5lGH+LaegI0qn/PQtODWXV/Zg3
 xW9hXB29sDnPGXpiXvZ7P3njeag5AAHIEOR8kWsjjXTUZUcUQsSzQwJF6880X3yTE7zi
 5BNPXb84tP9hLUn/O/jbEHjmp+qpM2eovqXZ/hj9Op/A8WTQsoctnR2Pe18zX8xJy+k6
 JKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766231218; x=1766836018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BvS8nMfVOZkciUcLL0fNAysqWTrj8F7eL3+iW/A/2SM=;
 b=Fw3Kw1e8Nd2Nz5qJ85uPN2/w61eOFWeNXFcDMRslK1q5ItSGIrRqHsR4NXlkKWTnka
 +sChL0xqAQ1aE2sM0b2hIK9OpgFlJYocvX7gkvP3ZQCbv/5qjTE9rZ8O4qgBvEVSM6Zo
 Rr2MfEBz7v9TsYeTYnHN1ukVVEfKgivWqEftNOUcOm3gby5bdqS/Tnrl+3Gab89iZOHW
 eT9Weme+X/pSYkBoS8D5aZ4o+gnlLyPbYQR7tNea4hEQvc6Feo6KFTzvd3WMWdXVM8nj
 3IXF+bZUhTDIiwtNc9R4S6dS1HFYhb9v7g9ZN39oLb59seVQPNJRnR9S61bisH1u6fVC
 CMJg==
X-Gm-Message-State: AOJu0YyZPnhyaKNR6/odCOoD3jXiohFfeSEI61QIyGMoXMpUYJm9N3Tq
 Xuboob9/d951QTVfamlfAF7hxU+Iz02SOBy+WFDl9sNH59y7iRs6Spe3
X-Gm-Gg: AY/fxX685vlemodF9BbBqiPpfCqSttFCxC+DCjOLndBK6U+Np3E67c6STtZ4DnSRCBB
 uF3AMON/nKWLtRhd33DZCwu/ntL4ZvNf9eBvtH9mJtpF2kyEWrqikSWEa8Y0V21VNZRFAb/Sq1+
 cM8Ag8OMB5ISG7y9lKz5iUTrML06lNyKvgsr2Q/wGwdEfyQZnNPnMC+ES8DgRBOKpXUOAJK2mgH
 TaGTdWPWdVyuHFzlgjW9xUBWM00CxvepPwbYbhq2Gav52I0u3ePjjGjUhb/3Jox9wS6S6v54p35
 dVF3tX9vomsZUvhbCv9D5oeguGfIRBrpdLFcHQpsf6BogXaGJcSH5UJtLKNEKqkVECTvTImEull
 0iPJCRZt8jQhgBxpV9G1GnyiUKTJREitvFoUiWyYn2PJCrDaDSGvcCRmeZSnwVeOpqsk3MT73WM
 0x1EkxMSKOhYOGnzVrUEJvMZIUFVECVeZrtLakbhcvQKwU0ygd2tHWo2Fn6u9XeC10
X-Google-Smtp-Source: AGHT+IFpb8Z+EOD0vVvWHTkVo9gH0KH6QXyuq83o10PpKMNP6cCf9/UUbfTDB8BmtFOBvZ3ibym94w==
X-Received: by 2002:a17:907:3d88:b0:b80:1a97:6511 with SMTP id
 a640c23a62f3a-b80372b643bmr315685366b.6.1766231217595; 
 Sat, 20 Dec 2025 03:46:57 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037a5bdb9sm495449066b.7.2025.12.20.03.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 03:46:57 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 bernhard.berger@gmail.com
Subject: [PATCH 4/4] drm/amd/display: enable HDMI VRR over PCON
Date: Sat, 20 Dec 2025 12:46:49 +0100
Message-ID: <20251220114649.169147-5-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251220114649.169147-1-tomasz.pakula.oficjalny@gmail.com>
References: <20251220114649.169147-1-tomasz.pakula.oficjalny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 21 Dec 2025 01:26:28 +0000
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

Tested with VMM7100 and CH7218 based adapters on multiple HDMI 2.1 and
HDMI 2.0 devices. (Samsung S95B, LG C4, Sony Bravia 8, Dell AW3423DWF)

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Tested-by: Bernhard Berger <bernhard.berger@gmail.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 1318d88687ae..7860779d7ede 100644
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
@@ -13004,21 +13005,34 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		as_type = dm_get_adaptive_sync_support_type(amdgpu_dm_connector->dc_link);
 
 	if (as_type == ADAPTIVE_SYNC_TYPE_PCON_IN_WHITELIST) {
+		hdmi_vrr = &connector->display_info.hdmi.vrr_cap;
 		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
-		if (i >= 0 && vsdb_info.freesync_supported && vsdb_info.amd_vsdb_version > 0) {
 
+		/* Prefer HDMI VRR over FreeSync */
+		if (hdmi_vrr->supported) {
+			amdgpu_dm_connector->pack_sdp_v1_3 = true;
+			amdgpu_dm_connector->as_type = as_type;
+
+			amdgpu_dm_connector->min_vfreq = hdmi_vrr->min_hz;
+			amdgpu_dm_connector->max_vfreq = hdmi_vrr->max_hz;
+
+			connector->display_info.monitor_range.min_vfreq = hdmi_vrr->min_hz;
+			connector->display_info.monitor_range.max_vfreq = hdmi_vrr->max_hz;
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

