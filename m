Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJ9wNPpEgmlHRQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:56:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57529DDF5D
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639FB10E75A;
	Tue,  3 Feb 2026 18:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UNAyfSXM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817DF10E763
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 18:56:54 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b8dd0168b90so64200266b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 10:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770145013; x=1770749813; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r2h2wnsXtZ4g2BRwKy8/RzhvGTG6VzYgHk4FML1+grU=;
 b=UNAyfSXMHg78tm2q8xnGkWrqabfVvIkC4oUh8auxWwrXQSZCQLH7udgV+m5DL/4MbN
 +sC2i3Y7H7/tozm1jJF52ihvEqMFGyXr3C9dg8khAt7g2e9U26ssnRgX8T+R9lajU+HO
 PMI9YxpnVeoHuXJN2q5bGM+i8+oOTomF+/kIzXs0fyaJdvNPao5T57pw9b+YEzxXoA2c
 n0HiHLKS65cVWou6xD3+n0sJpKyNiDLYzspMr6/ECZ5oJpWBR4B7bbNO7MDCQwlQSkDJ
 rHQKiS8N2gaOopZCi+oJZ0yvBvaY13o4GcnXaC1idzwWFasKpD0C3CtgoVvboH4rUjxV
 RDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770145013; x=1770749813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r2h2wnsXtZ4g2BRwKy8/RzhvGTG6VzYgHk4FML1+grU=;
 b=EjxGaiDP2uPZZ5+AbQiIQmeE45gKou+/ZJJXxai0hqbqqUC+tjbte9aHdoWK1DHWuN
 4AlfhA0U/APzkNqOFhgWhHs/lX/LvHRUv1WAyAQTJzWqmMf/wliDxd0+AvYg+pKc5vY5
 NAtTndnaAfcPITb98JU3wsDYvj1Zd0tVlpp4Dk5j+QF8H0dgn7MdYIAHghZYYJ6PgOmx
 LMlBix08o+mXPc+14GI3O3EH9STx/HX3hXZDvfPQgiZ3O9bqckfyOxo+PT4U+ph/c1ZF
 N7jLEb+TF9R6qjoQI3A72NBs4RDLo2mQQLxJySjXkrn4GIrk01DhyYGEyCJOFyDGg85N
 7DGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU4Az+9DGZb9EHZgWfVi9LenK6jqbTbkacQUt9o3ZvKS/SOKqgvR+iEQT9ZXvUpu9MR7GGmTAdMW4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz81VSQcF3RA33WN6mHVPugavy7OdSA/Hb6ALQRfxip9GRQ/uvr
 ykl/kDuiAVf6aI4b+TkDAhnNzeTaSzZ6xMEz2NL7MABGNv+2ZClQRdTv
X-Gm-Gg: AZuq6aKV4NgIank5k54306ueaiTuR2eAk4dlvuBI4yzwNWvrd6PFQkQ6vYKEFcpCjbb
 QT9aslQ7CeGbdndXlX+3gD3+ZWrzGneEL0j8TH7hfqNKQp6UMO5G724X+26/qzxUS8JM/p6rKwH
 TnPXhln+AViOQ8AV/NYmP9dD4Uz8XlkGVRuafzz50ElhsJgHwMDF9MNJLy4QkAqI9pW4uBADMbS
 PAFrBJN9CdVg2vfDVCxrFuhMl0xtbpWGAbvuVZaLJ7dA0HlRY+Y75YHEoZsjsj/LlSM8PzcT/Us
 kFdq13JVzY1I6HaStNLRpZCDuTbUwIhWYfqp8a3/GFCRZJ1eaJQNHcWlTccp6bnoNtYD3LAeAtd
 d1vurltvuNaKTxb3387uc5L22buW5ipkJ8cUj6pyjZNERz9OI8xdPDc6SJwVrE8Xi6jNNb9NuOH
 T6j7oDOAjJNLvS1q7hUQ3FQiD0UjUpbut9KsloDhUiW72imds/7WXu4BERC9wcWYL2
X-Received: by 2002:a17:907:3e0a:b0:b87:2780:1b2b with SMTP id
 a640c23a62f3a-b8e9f2f270bmr21095366b.4.1770145012928; 
 Tue, 03 Feb 2026 10:56:52 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8e9fad97a7sm16715766b.0.2026.02.03.10.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 10:56:52 -0800 (PST)
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
Subject: [PATCH v3 16/19] drm/amd/display: Add parameter to control ALLM
 behavior
Date: Tue,  3 Feb 2026 19:56:23 +0100
Message-ID: <20260203185626.55428-17-tomasz.pakula.oficjalny@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ptr1337.dev:email]
X-Rspamd-Queue-Id: 57529DDF5D
X-Rspamd-Action: no action

[Why]
Some users prefer to always manually control ALLM/Gaming mode while
others might want it permanently forced on.

[How]
Since there isn't yet an API to control this, expose module parameter

Changes in v3:
- Include a fix for possible NULL pointer dereference by Peter

Closes: https://github.com/CachyOS/linux-cachyos/issues/680

Co-developed-by: Peter Jung <admin@ptr1337.dev>
Signed-off-by: Peter Jung <admin@ptr1337.dev>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 14 +++++-
 .../gpu/drm/amd/display/dc/core/dc_resource.c |  7 +--
 .../amd/display/modules/inc/mod_info_packet.h |  1 +
 .../display/modules/info_packet/info_packet.c | 46 ++++++++++++++++---
 5 files changed, 56 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 447e734c362b..312aa32064d5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -268,6 +268,7 @@ extern int amdgpu_rebar;
 
 extern int amdgpu_wbrf;
 extern int amdgpu_user_queue;
+extern uint amdgpu_allm_mode;
 
 extern uint amdgpu_hdmi_hpd_debounce_delay_ms;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index d6d0a6e34c6b..4b038c8bbf9f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -248,6 +248,7 @@ int amdgpu_umsch_mm_fwlog;
 int amdgpu_rebar = -1; /* auto */
 int amdgpu_user_queue = -1;
 uint amdgpu_hdmi_hpd_debounce_delay_ms;
+uint amdgpu_allm_mode = 1;
 
 DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
 			"DRM_UT_CORE",
@@ -1124,7 +1125,7 @@ module_param_named(rebar, amdgpu_rebar, int, 0444);
 MODULE_PARM_DESC(user_queue, "Enable user queues (-1 = auto (default), 0 = disable, 1 = enable, 2 = enable UQs and disable KQs)");
 module_param_named(user_queue, amdgpu_user_queue, int, 0444);
 
-/*
+/**
  * DOC: hdmi_hpd_debounce_delay_ms (uint)
  * HDMI HPD disconnect debounce delay in milliseconds.
  *
@@ -1134,6 +1135,17 @@ module_param_named(user_queue, amdgpu_user_queue, int, 0444);
 MODULE_PARM_DESC(hdmi_hpd_debounce_delay_ms, "HDMI HPD disconnect debounce delay in milliseconds (0 to disable (by default), 1500 is common)");
 module_param_named(hdmi_hpd_debounce_delay_ms, amdgpu_hdmi_hpd_debounce_delay_ms, uint, 0644);
 
+/**
+ * DOC: allm_mode (int)
+ * Changes ALLM triggering mode (if sink supports ALLM). Possible values:
+ *
+ * - 0 = ALLM disabled
+ * - 1 = ALLM dynamically triggered based on VRR state / Game Content Type Hint
+ * - 2 = ALLM forced always on
+ */
+MODULE_PARM_DESC(allm_mode, "Changes ALLM trigger mode (0 = disable, 1 = enable (default), 2 = force enable)");
+module_param_named(allm_mode, amdgpu_allm_mode, uint, 0644);
+
 /* These devices are not supported by amdgpu.
  * They are supported by the mach64, r128, radeon drivers
  */
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 4a7c9f810e35..b779aac28dfa 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -44,6 +44,7 @@
 #include "clk_mgr.h"
 #include "dc_state_priv.h"
 #include "dc_stream_priv.h"
+#include "modules/inc/mod_info_packet.h"
 
 #include "virtual/virtual_link_hwss.h"
 #include "link/hwss/link_hwss_dio.h"
@@ -4503,8 +4504,6 @@ static void set_avi_info_frame(
 	unsigned int vic = pipe_ctx->stream->timing.vic;
 	unsigned int rid = pipe_ctx->stream->timing.rid;
 	unsigned int fr_ind = pipe_ctx->stream->timing.fr_index;
-	enum dc_timing_3d_format format;
-	bool allm;
 
 	if (stream->avi_infopacket.valid) {
 		*info_packet = stream->avi_infopacket;
@@ -4658,10 +4657,8 @@ static void set_avi_info_frame(
 	///VIC
 	if (pipe_ctx->stream->timing.hdmi_vic != 0)
 		vic = 0;
-	format = stream->timing.timing_3d_format;
-	allm = stream->link->local_sink->edid_caps.allm;
 	/*todo, add 3DStereo support*/
-	if ((format != TIMING_3D_FORMAT_NONE) || allm) {
+	if (!is_hdmi_vic_mode(pipe_ctx->stream)) {
 		// Based on HDMI specs hdmi vic needs to be converted to cea vic when 3D is enabled
 		switch (pipe_ctx->stream->timing.hdmi_vic) {
 		case 1:
diff --git a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
index 306eb7355c25..9ec123ecc7c4 100644
--- a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
+++ b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
@@ -41,6 +41,7 @@ void set_vsc_packet_colorimetry_data(
 		enum dc_color_space cs,
 		enum color_transfer_func tf);
 
+bool is_hdmi_vic_mode(const struct dc_stream_state *stream);
 void mod_build_vsc_infopacket(const struct dc_stream_state *stream,
 		struct dc_info_packet *info_packet,
 		enum dc_color_space cs,
diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
index 53e488fdb4ea..829cce9455db 100644
--- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
+++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
@@ -23,12 +23,13 @@
  *
  */
 
-#include "mod_info_packet.h"
+#include "amdgpu.h"
 #include "core_types.h"
-#include "dc_types.h"
-#include "mod_shared.h"
-#include "mod_freesync.h"
 #include "dc.h"
+#include "dc_types.h"
+#include "mod_freesync.h"
+#include "mod_info_packet.h"
+#include "mod_shared.h"
 
 enum vsc_packet_revision {
 	vsc_packet_undefined = 0,
@@ -54,6 +55,12 @@ enum vsc_packet_revision {
 #define HF_VSIF_3D_BIT   0
 #define HF_VSIF_ALLM_BIT 1
 
+enum allm_trigger_mode {
+	ALLM_MODE_DISABLED        = 0,
+	ALLM_MODE_ENABLED_DYNAMIC = 1,
+	ALLM_MODE_ENABLED_FORCED  = 2,
+};
+
 // VTEM Byte Offset
 #define VTEM_PB0		0
 #define VTEM_PB1		1
@@ -499,7 +506,32 @@ void mod_build_vsc_infopacket(const struct dc_stream_state *stream,
 	}
 }
 
-static bool is_hdmi_vic_mode(const struct dc_stream_state *stream)
+static bool is_hdmi_allm_mode(const struct dc_stream_state *stream)
+{
+	/* No local sink */
+	if (!stream->link->local_sink)
+		return false;
+
+	/* Sink doesn't expose ALLM support in edid */
+	if (!stream->link->local_sink->edid_caps.allm)
+		return false;
+
+	switch (amdgpu_allm_mode) {
+	case ALLM_MODE_DISABLED:
+		return false;
+
+	case ALLM_MODE_ENABLED_DYNAMIC:
+		break;
+
+	case ALLM_MODE_ENABLED_FORCED:
+		return true;
+	}
+
+	return stream->content_type == DISPLAY_CONTENT_TYPE_GAME ||
+	       stream->vrr_active_variable;
+}
+
+bool is_hdmi_vic_mode(const struct dc_stream_state *stream)
 {
 	if (stream->timing.hdmi_vic == 0)
 		return false;
@@ -512,7 +544,7 @@ static bool is_hdmi_vic_mode(const struct dc_stream_state *stream)
 	if (stream->view_format != VIEW_3D_FORMAT_NONE)
 		return false;
 
-	if (stream->link->local_sink->edid_caps.allm)
+	if (is_hdmi_allm_mode(stream))
 		return false;
 
 	return true;
@@ -541,7 +573,7 @@ void mod_build_hf_vsif_infopacket(const struct dc_stream_state *stream,
 
 		info_packet->valid = false;
 
-		allm = stream->link->local_sink->edid_caps.allm;
+		allm = is_hdmi_allm_mode(stream);
 		format = stream->view_format == VIEW_3D_FORMAT_NONE ?
 			 TIMING_3D_FORMAT_NONE :
 			 stream->timing.timing_3d_format;
-- 
2.52.0

