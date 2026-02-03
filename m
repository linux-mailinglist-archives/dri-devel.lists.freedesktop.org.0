Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GL9qHfJEgmlHRQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:56:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DFFDDF28
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:56:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C83B10E759;
	Tue,  3 Feb 2026 18:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X6ktJBvG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7520410E759
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 18:56:47 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id
 a640c23a62f3a-b88610494b8so59619066b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 10:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770145006; x=1770749806; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YveXWB9fxJPi3CW0nlq6uRwljjhlFuvcOGXx+tNrYfY=;
 b=X6ktJBvGDQm1PdBVjoP6DOyv8V9ESNjGxBqR0Cpw1y+wGN+GWuFkyfVTKjV2I3G5oL
 VTG+z1yzM4/ZwtZDuTudoP2/SfQejZVjCUA8LcctSReP/i5pVGKHZEVarHa2t9/erWBv
 JRf+tFGshdTvrcBMB3D5RM0F35ewVLTzFNWukRKBalMHU7Ai5D4K0qths0IsxxHsBeEE
 pJbJk0ZvjFOnGMjJ78/7NUy0oGNkgR6I4y5g84AwvqsOJ4hYyYI1OzPbLUQFJ/zy6syl
 hMGY6ggCgt3ZzxeTbC0xGdT7XZJQwukYa3VycepoBmlgf5vAVcbM//xRtlUlVEeWp1iQ
 cn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770145006; x=1770749806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YveXWB9fxJPi3CW0nlq6uRwljjhlFuvcOGXx+tNrYfY=;
 b=PoiXN1LU8ctLVFArYpLOsrNWZ+RyQNdTVhuxmFH+iD2I1xF1YXF8mEvrJiB6tVSoQ9
 GbuDGX7dLEI/PuUb4O/nbeWCyYkHaI+UBccUwkYJ5n9U11jQc3DSwxcIq83qhPn96OTN
 wGmiJCQAR6JKiCoUeDcUYqgKLpkawDwTQltxspnheCKKeMPBfjzxPSEcrCqI7nkyROGS
 /IBv7jZ57dTx2PXROPuzpKFA/e5ss5HpA/DI5DlGuD7bn6/CMO9uyCMG3iJG/EL7YktH
 GkwBJeGsFXAZq1CYL47nFlBLfr8jo1PvVCAYyWzI0vymgVpN5kHue1QNeuy/PuzKNELc
 ZDuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl4ts9YiDvLZ5xN8im1KXm8+Sf8gbLo7GmxSY4oOt7YySXULUL53mm/ixJdRj2u6txzzgluUPYbMg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyO62REH3C5f9espobg7MBzJDlQa7Z3zzIyMB4ncRqf4z9oV4p7
 cd14R1LDpHnSqCN9tYzALzBt+xnHAI5pYFYX7pQfzzM4IjsGuRJdLzXA
X-Gm-Gg: AZuq6aJIxaR7Ks7UQf8Ii+w7q3QMwhjVZ+ZSZY4L5hSwnuIRVGFuCa+TWPt68lJqWLv
 YTlc5Ip42t3gnSt6QOV8Z53HLQqKOlqViRaOU7TvuJBnD1mJCd9bPiqb4ZEHVlOsAfC/NOmgRXR
 5mqgWj2iE+c+dGZwvfS3XsE968x60BRbnxS9/K+HR0ekTDBpwMKfSYSf6rimHC3XWaqKFXJC/C7
 3/2GuKtWdaCufPU5K+QvsgoPwPRA2S+f8AOKHYnb5aCwIdNr4MmsJ3/EFgJHS2gP+377jRI7u3W
 k1EyL1qNYHgaZZu73IFbtk+9zAmZTF2+sRPsyTeaXX5qprwVqCkNfInE7YJ8owWpHOgtOhE/37y
 XXR7Dy3i9asi+F7wcgEI0/y0wh0lANuZB4dSGyNRFTmPLwG45gzGXnxviFRa53qbVu1BrJPFvWY
 xq5NfqJTX0CU4QHAEtfV4fP4uKi/wqaJB+J6om/SlxHm+zYjW/2sWPSOFITqbuyuCf
X-Received: by 2002:a17:907:3ea8:b0:b71:a627:3d9f with SMTP id
 a640c23a62f3a-b8e9ec91abamr22683566b.0.1770145005819; 
 Tue, 03 Feb 2026 10:56:45 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8e9fad97a7sm16715766b.0.2026.02.03.10.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 10:56:45 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org,
 daniel@fooishbar.org, admin@ptr1337.dev
Subject: [PATCH v3 11/19] drm/amd/display: Support HDMI VRRmax=0
Date: Tue,  3 Feb 2026 19:56:18 +0100
Message-ID: <20260203185626.55428-12-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:admin@ptr1337.dev,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org,ptr1337.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 19DFFDDF28
X-Rspamd-Action: no action

[Why]
VRRmax=0 is a valid value and means that the upper bound is guared by
the selected video mode.

[How]
In this context, saved vrr max is the max possible refresh rate ever.
Try getting upper VRR bound from AMD vsdbif it exists or rely on the
limitations of BRR in VTEM info frames.

I found through testing, that TVs seem to reject VTEM when BRR is set
to over 1023 Hz. Use this as the last resort VRRmax. 1023 is the max
value for a 10-bit field as well.

v2:
- Update max BRR value to 1023

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 23 +++++++++++++++----
 .../amd/display/modules/inc/mod_info_packet.h |  2 ++
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6fb23d59fcc9..2200161da71b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13232,14 +13232,27 @@ static void monitor_range_from_vsdb(struct drm_display_info *display,
 }
 
 /**
- * Get VRR range from HDMI VRR info in EDID.
+ * Get VRR range from HDMI VRR info in EDID. If VRRmax == 0,
+ * try getting upper bound from AMD vsdb.
  *
  * @conn: drm_connector with HDMI VRR info
+ * @vsdb: AMD vsdb from CAE
  */
-static void monitor_range_from_hdmi(struct drm_display_info *display)
+static void monitor_range_from_hdmi(struct drm_display_info *display,
+				    const struct amdgpu_hdmi_vsdb_info *vsdb)
 {
+	u16 vrr_max = display->hdmi.vrr_cap.vrr_max;
+
+	/* Try getting upper vrr bound from AMD vsdb */
+	if (vrr_max == 0)
+		vrr_max = vsdb->max_refresh_rate_hz;
+
+	/* Use max possible BRR value as a last resort */
+	if (vrr_max == 0)
+		vrr_max = VTEM_BRR_MAX;
+
 	display->monitor_range.min_vfreq = display->hdmi.vrr_cap.vrr_min;
-	display->monitor_range.max_vfreq = display->hdmi.vrr_cap.vrr_max;
+	display->monitor_range.max_vfreq = vrr_max;
 }
 
 /*
@@ -13374,8 +13387,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	/* DP -> HDMI PCON */
 	} else if (pcon_allowed) {
 		/* Prefer HDMI VRR */
-		if (hdmi_vrr.supported && hdmi_vrr.vrr_max > 0)
-			monitor_range_from_hdmi(&connector->display_info);
+		if (hdmi_vrr.supported)
+			monitor_range_from_hdmi(&connector->display_info, &vsdb_info);
 		else if (vsdb_info.freesync_supported) {
 			amdgpu_dm_connector->vsdb_info = vsdb_info;
 			monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
diff --git a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
index 5de8a6918e6a..306eb7355c25 100644
--- a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
+++ b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
@@ -33,6 +33,8 @@ struct dc_stream_state;
 struct dc_info_packet;
 struct mod_vrr_params;
 
+#define VTEM_BRR_MAX 1023
+
 void set_vsc_packet_colorimetry_data(
 		const struct dc_stream_state *stream,
 		struct dc_info_packet *info_packet,
-- 
2.52.0

