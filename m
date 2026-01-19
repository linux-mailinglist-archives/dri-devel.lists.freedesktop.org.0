Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E168D39BC8
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 02:12:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B7810E30E;
	Mon, 19 Jan 2026 01:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gj6OT7pl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4958A10E309
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 01:12:11 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-64b686e7d04so460167a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 17:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768785130; x=1769389930; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZSHN2Af/L95S4Os5yYFaV1hvvj2RmaOdeVqj+0nIWBY=;
 b=Gj6OT7plJLi1XQaAj81/8j6ARvQ+6GzzWvEWfmR0VPeGOy5a2DtqDKImDi6c9vKz0u
 402nhTPbzsuafMWpxYGa5OPnUP8+VVb3aoyLW97gcjdGa20Emz3Tdiqtd+BeO8Sp6NWa
 6iYGzAmZ5gyzQVZkv6XLhWE7YxZ8KTccLturiL1m+n9USkwlBHUFvUEuHwQPw6UUa8lh
 c7ME2bwLfJl+MPJx+xSLOM4+95ZdQ6leG7vs3VHkRyr6x+rHlaO544UYBhf4ErZnq1hB
 OPoFBCoQbMOkl0p9qwRv20a6g6PVulVm0DHXAUxkisHbElR8xbDa+T2OmgnTJ/ApwVSL
 RltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768785130; x=1769389930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZSHN2Af/L95S4Os5yYFaV1hvvj2RmaOdeVqj+0nIWBY=;
 b=suTq4T5ugDRttT4t+a/bzXkeXJ2VSmB61+IUGOci6qL123YyWoFM+OmTX1S4ayrMlM
 vC6vfFVhNDzWL7HKWqj69xh2Ys/cgkZ9d+C+HsEWcujy9aEqcpJCZDhe1uC4YyFRPEw2
 7e4N07wfFFGnwnIesrhxbuPqtl2ea+FucZEmMw0NoibEawbB/gHNgf6zd55U6AcxWYfY
 sqycnn8aOUOR48JpQVQRTSETdiLSoVW8pK1ktfWYJW9H3Vmm/wUre0UmZkM+RIb+R5ex
 ksJYB1eEEYVFfUqwvUoFKdtZQu2GpCuIf5TZfmngR+mFwiyR/ldDA8nHLRpCWR2+g22j
 h1hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdHuf+NMKs9myueT/3JzBXs8HbarAGcdH0lgH2U48RSTcjtJElDpL+RnPERGOyojbgWAh2+c3uNwQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPmz+MOv9pYm9QqX6T9HQs5ebPIHWuYLNqC3BXFGNNqiw8WAAu
 N3y4/4Q2ZGxuPknuG9N+GqgXUOR1B0XkseV4qK6TDHU7XQtjVToSUgzc
X-Gm-Gg: AY/fxX7aPwOygE70SGvV+FtMwBQmM4diH+OaiOmmNATHEXO4ysyOpvnyKs2vWEv0oWa
 2Vvr/GYu4zSx4m9XA0weh9MCttoynTQEnehg8rK8PgLBtt6JNogNnOI36hRXBXoFs3VKH4AN77o
 uKpwe+YfH4kNTh7J1gpUU8m9ZhL4MeY8MC0fx3Qp+ZWQj0rhHf4dXe8VYzkGZx+qSnfI3wVO2cs
 N1LMIVTsSMpJ00tQq/+6c9DeRDZkfQ2iLauHRpHRrtJ9NfUx0W9du/aTP6H3bvZuLexFm22hF1O
 ATplnNO1CR/3uDsfkZmIe4XaMkaHcAzD3lv1vP296JfB13jDS1cpMcy+tTSpPGCiAlHGjFZojT6
 ynRLvb5h+2PHY8dWMyMoTTdmPPBwMOCSFByYDnTOuhY92CGpxjronjlnD1+SYSVEhI6TZgceblV
 VfzGe5VjB4zyFU8tMbI1vbXmCDB7DzBcMZyQiiw3e26JDtWwtdMbdGIn7l0nJKqTCzOhMCtZ5L0
 W8=
X-Received: by 2002:a05:6402:350f:b0:649:5709:aafc with SMTP id
 4fb4d7f45d1cf-65452cdaddemr4632382a12.7.1768785129599; 
 Sun, 18 Jan 2026 17:12:09 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-654535c4912sm8989806a12.30.2026.01.18.17.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 17:12:09 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com
Subject: [PATCH 14/17] drm/amd/display: Restore ALLM support in HDMI vsif
Date: Mon, 19 Jan 2026 02:11:43 +0100
Message-ID: <20260119011146.62302-15-tomasz.pakula.oficjalny@gmail.com>
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
Support for triggering ALLM in modern TVs is missing.

When HDMI vsif was added in 2019:
commit 3c2381b92cba ("drm/amd/display: add support for VSIP info packet")
it was improperly handeled as HDMI actually has two separate vsifs. The
implementation was based on H14b-vsif and ALLM bit was messing it up
because H14b-vsif doesn't support ALLM. It was later removed in:
commit 75f77aafe281 ("drm/amd/display: Send H14b-VSIF specified in HDMI")

ALLM is supported by hf-vsif (HDMI Forum) instead.

[How]
Add proper logic to construct either h14b-vsif or hf-vsif based on
required capabilities. Currently, only ALLM from hf-vsif is supported.

Turns out, hf-vsif is almost identical to h14b-vsif, BUT has additional
two bytes of data after OUI. First byte is static and seems like
a version supported by leftover define. Second byte consists of 3D and
ALLM bits.

Implement logic to offset 3D data if building hf-vsif.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 .../display/modules/info_packet/info_packet.c | 112 ++++++++++++------
 1 file changed, 73 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
index 294f56d20062..1a1ddcdb4362 100644
--- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
+++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
@@ -49,7 +49,10 @@ enum vsc_packet_revision {
 };
 
 #define HDMI_INFOFRAME_TYPE_VENDOR 0x81
-#define HF_VSIF_VERSION 1
+#define HDMI_INFOFRAME_LENGTH_MASK 0x1F
+#define HF_VSIF_VERSION  1
+#define HF_VSIF_3D_BIT   0
+#define HF_VSIF_ALLM_BIT 1
 
 // VTEM Byte Offset
 #define VTEM_PB0		0
@@ -496,9 +499,28 @@ void mod_build_vsc_infopacket(const struct dc_stream_state *stream,
 	}
 }
 
+static bool is_hdmi_vic_mode(const struct dc_stream_state *stream)
+{
+	bool allm = stream->link->local_sink->edid_caps.allm;
+	bool stereo = stream->view_format != VIEW_3D_FORMAT_NONE;
+
+	if (stream->timing.hdmi_vic == 0)
+		return false;
+
+	if (stream->timing.h_total < 3840 ||
+	    stream->timing.v_total < 2160)
+		return false;
+
+	if (stereo || allm)
+		return false;
+
+	return true;
+}
+
 /**
  *  mod_build_hf_vsif_infopacket - Prepare HDMI Vendor Specific info frame.
  *                                 Follows HDMI Spec to build up Vendor Specific info frame
+ *                                 Conforms to h14b-vsif or hf-vsif based on the capabilities
  *
  *  @stream:      contains data we may need to construct VSIF (i.e. timing_3d_format, etc.)
  *  @info_packet: output structure where to store VSIF
@@ -506,63 +528,75 @@ void mod_build_vsc_infopacket(const struct dc_stream_state *stream,
 void mod_build_hf_vsif_infopacket(const struct dc_stream_state *stream,
 		struct dc_info_packet *info_packet)
 {
-		unsigned int length = 5;
 		bool hdmi_vic_mode = false;
+		bool allm = false;
+		bool stereo = false;
 		uint8_t checksum = 0;
-		uint32_t i = 0;
+		uint8_t offset = 0;
+		uint8_t i = 0;
+		uint8_t length = 5;
+		uint32_t oui = HDMI_IEEE_OUI;
 		enum dc_timing_3d_format format;
 
 		info_packet->valid = false;
+
 		format = stream->timing.timing_3d_format;
 		if (stream->view_format == VIEW_3D_FORMAT_NONE)
 			format = TIMING_3D_FORMAT_NONE;
+		stereo = format != TIMING_3D_FORMAT_NONE;
+		hdmi_vic_mode = is_hdmi_vic_mode(stream);
 
-		if (stream->timing.hdmi_vic != 0
-				&& stream->timing.h_total >= 3840
-				&& stream->timing.v_total >= 2160
-				&& format == TIMING_3D_FORMAT_NONE)
-			hdmi_vic_mode = true;
-
-		if ((format == TIMING_3D_FORMAT_NONE) && !hdmi_vic_mode)
+		if (!stereo && !hdmi_vic_mode && !allm)
 			return;
 
-		info_packet->sb[1] = 0x03;
-		info_packet->sb[2] = 0x0C;
-		info_packet->sb[3] = 0x00;
+		if (allm)
+			oui = HDMI_FORUM_IEEE_OUI;
 
-		if (format != TIMING_3D_FORMAT_NONE)
-			info_packet->sb[4] = (2 << 5);
+		info_packet->sb[1] = oui & 0xff;
+		info_packet->sb[2] = (oui >> 8) & 0xff;
+		info_packet->sb[3] = (oui >> 16) & 0xff;
 
-		else if (hdmi_vic_mode)
-			info_packet->sb[4] = (1 << 5);
-
-		switch (format) {
-		case TIMING_3D_FORMAT_HW_FRAME_PACKING:
-		case TIMING_3D_FORMAT_SW_FRAME_PACKING:
-			info_packet->sb[5] = (0x0 << 4);
-			break;
-
-		case TIMING_3D_FORMAT_SIDE_BY_SIDE:
-		case TIMING_3D_FORMAT_SBS_SW_PACKED:
-			info_packet->sb[5] = (0x8 << 4);
-			length = 6;
-			break;
-
-		case TIMING_3D_FORMAT_TOP_AND_BOTTOM:
-		case TIMING_3D_FORMAT_TB_SW_PACKED:
-			info_packet->sb[5] = (0x6 << 4);
-			break;
-
-		default:
-			break;
+		if (oui == HDMI_FORUM_IEEE_OUI) {
+			offset = 2;
+			length += 2;
+			info_packet->sb[4] = HF_VSIF_VERSION;
+			info_packet->sb[5] = stereo << HF_VSIF_3D_BIT;
+			info_packet->sb[5] = allm << HF_VSIF_ALLM_BIT;
 		}
 
-		if (hdmi_vic_mode)
+		if (stereo) {
+			info_packet->sb[4 + offset] = (2 << 5);
+
+			switch (format) {
+			case TIMING_3D_FORMAT_HW_FRAME_PACKING:
+			case TIMING_3D_FORMAT_SW_FRAME_PACKING:
+				info_packet->sb[5 + offset] = (0x0 << 4);
+				break;
+
+			case TIMING_3D_FORMAT_SIDE_BY_SIDE:
+			case TIMING_3D_FORMAT_SBS_SW_PACKED:
+				info_packet->sb[5 + offset] = (0x8 << 4);
+				++length;
+				break;
+
+			case TIMING_3D_FORMAT_TOP_AND_BOTTOM:
+			case TIMING_3D_FORMAT_TB_SW_PACKED:
+				info_packet->sb[5 + offset] = (0x6 << 4);
+				break;
+
+			default:
+				break;
+			}
+
+		/* Doesn't need the offset as it can't be used with hf-vsif */
+		} else if (hdmi_vic_mode) {
+			info_packet->sb[4] = (1 << 5);
 			info_packet->sb[5] = stream->timing.hdmi_vic;
+		}
 
 		info_packet->hb0 = HDMI_INFOFRAME_TYPE_VENDOR;
 		info_packet->hb1 = 0x01;
-		info_packet->hb2 = (uint8_t) (length);
+		info_packet->hb2 = length & HDMI_INFOFRAME_LENGTH_MASK;
 
 		checksum += info_packet->hb0;
 		checksum += info_packet->hb1;
-- 
2.52.0

