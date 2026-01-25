Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HQXO3tjdmmVQAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 19:39:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 800C281BEC
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 19:39:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB92C10E37D;
	Sun, 25 Jan 2026 18:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="igEBpoCq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560BA10E378
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 18:39:41 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b8845a47e39so63022266b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 10:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769366380; x=1769971180; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UcnraORJPqzLaNna/Rh/WEL5R0qkbZJXIJKvYu5IS4o=;
 b=igEBpoCqlBu1AdTRhZKLKH3rVHP0qSbWz2pIMyAA0+QYxJJIKx+WsuyC+8h0Xi49YA
 FWS6kn+na6dx19j9EjZ0vrJyqDzYiWOPYskC9XD2XneT682VNy7QWpRV7g4ujqfCiEyi
 dQJo+xs6g4WDbFA/MNaIGYT7ZwJFrapP5ZiUA1A9ePyuzx/Sxgyrhb2h9aoj1fjYh/9O
 8OCsRAWIe7ixyJULyteDLUEaiS0z/Gsr1YG3nbvVzSTlIFXVrjPm5IR2F+puFr1INOoN
 c24KhOV9BvMkKvLOvLWFRLhAFSaZg9TGgbtSA0wDO99Ox2eM3xgRx2cbiu3rHRwEVlYX
 FmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769366380; x=1769971180;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UcnraORJPqzLaNna/Rh/WEL5R0qkbZJXIJKvYu5IS4o=;
 b=qD7lVoP9v7ggvQW/0OEWSmZzQLXpWTx7ivtpiF6fmZ3q1yrj7Rt2X1DeK0TCOoikOQ
 zy1iYqaJUOLsTaT2cEdbdgM58GObLZnp+Qt9tUjDXgzKIQssju7kwlkmEMI/mNvtAONL
 lMZBwmOSNnmAoAsgMqsdkT1Qt5Rp/oxV0U99JrDgt7YettIsm9x+t6Rn0ZOxqZsRVE7H
 n0fUcju3dPH/h8BHQfA7i1vib/QES3Y/rriPGRQq5hYLsgbySTRziJi1+kKWYsO1dAW5
 CiJzDGEY5oMen8RYNRcqRajhdrWbh4ifYkvPWeziIO4oyjrViMJsg7ROC0EQpI2Lig40
 yxhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZyh3SrLfSf3+Mztb/PksBODKYhSRrB07qX38OG9TFnCVEl9WuW2UabfdZw4ooeZ7tgGPwmjzJRbk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1FPFvgeTzN1nSKaszjH0JWvw5ua+bXOcD5mIhJtndz68TJ3bU
 OAoJxaUkDVkn+Uu2rB8u323TxUaQK0q4z//2CPnjNmU6rtbPJtQ5d87I
X-Gm-Gg: AZuq6aLnOUxBmPHujW0yJdzF59pkB2xy7dKE5MCocNL1UeLw/n1LmY8Fp4oCUXtgHY0
 82/oTv9g/43j3lvvlC1hvshBqYld8/tqoNGkisRxcC7fcBl7BbWohHIS9OKUf1ntj4m59JmwPV8
 HXutq7MkURSfPNUdgLUHEGbc1EpU+wq1O9K+3rz6jEX4nfkfCHUIx3nBoeXvP9r6XUivnFGZ+wO
 UYL2871SSi/X1XbOritVTnNwsgr1Fg+ajYpXfuaptvr5nnF+IZQNLYFrQLr9yGDtEQO4w5sT34Z
 bGftV8ehvvsWnpruM87F5eIET3+YupWuoHm6dU6ue3X32od+bZXSLoIBji5hWVuyve371bcnNRc
 YV0qqDinLXEspdMt7eB1yVwt7XS2sYoioxQqjpsu6s4RjQ9kJlVbnWLNm7I+5JKgSsUqtm/+beQ
 FTF/T5JkPBoc8sV7QuVVXNSf3O1BnSjcaS9eVEIbp7FPXqGl6uxCdbdeR7csJBMWmL
X-Received: by 2002:a17:907:3e1d:b0:b7d:3c0d:96ef with SMTP id
 a640c23a62f3a-b8d4f8369b9mr93097066b.7.1769366379622; 
 Sun, 25 Jan 2026 10:39:39 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b3dad3asm499133766b.12.2026.01.25.10.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 10:39:39 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v2 17/19] drm/amd/display: Reintroduce VTEM info frame
Date: Sun, 25 Jan 2026 19:39:12 +0100
Message-ID: <20260125183914.459228-18-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260125183914.459228-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260125183914.459228-1-tomasz.pakula.oficjalny@gmail.com>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 800C281BEC
X-Rspamd-Action: no action

[Why]
VTEM info fram building was removed back in: commit a9f54ce3c603
("drm/amd/display: Refactoring VTEM"), but it's needed to support
HDMI VRR signalling.

[How]
Build completely new and more robust functions to build out the VTEM
infopacket. Many values are defined but could have added logic in the
future, that's shy they are not static values but already value + bit
position in it's byte.

Reduced blanking detection was previously missing. Use possible hblank
periods defined for RB1 (from CVT 1.2), RB2 and RB3 (from CVT 2.1).

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 .../amd/display/modules/inc/mod_info_packet.h |   4 +
 .../display/modules/info_packet/info_packet.c | 178 ++++++++++++------
 2 files changed, 121 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
index 9ec123ecc7c4..07e86b16ef77 100644
--- a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
+++ b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
@@ -50,6 +50,10 @@ void mod_build_vsc_infopacket(const struct dc_stream_state *stream,
 void mod_build_hf_vsif_infopacket(const struct dc_stream_state *stream,
 		struct dc_info_packet *info_packet);
 
+void mod_build_vtem_infopacket(const struct dc_stream_state *stream,
+		const struct mod_vrr_params *vrr,
+		struct dc_info_packet *infopacket);
+
 enum adaptive_sync_type {
 	ADAPTIVE_SYNC_TYPE_NONE             = 0,
 	ADAPTIVE_SYNC_TYPE_DP               = 1,
diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
index 7516ab9a7554..5e245a053267 100644
--- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
+++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
@@ -49,6 +49,7 @@ enum vsc_packet_revision {
 	vsc_packet_rev7 = 7,
 };
 
+#define HDMI_INFOFRAME_TYPE_EMP    0x7F
 #define HDMI_INFOFRAME_TYPE_VENDOR 0x81
 #define HDMI_INFOFRAME_LENGTH_MASK 0x1F
 #define HF_VSIF_VERSION  1
@@ -61,74 +62,52 @@ enum allm_trigger_mode {
 	ALLM_MODE_ENABLED_FORCED  = 2,
 };
 
-// VTEM Byte Offset
-#define VTEM_PB0		0
-#define VTEM_PB1		1
-#define VTEM_PB2		2
-#define VTEM_PB3		3
-#define VTEM_PB4		4
-#define VTEM_PB5		5
-#define VTEM_PB6		6
+#define VTEM_ORG_ID          1
+#define VTEM_DATA_SET_TAG    1
+#define VTEM_DATA_SET_LENGTH 4
 
-#define VTEM_MD0		7
-#define VTEM_MD1		8
-#define VTEM_MD2		9
-#define VTEM_MD3		10
+#define VTEM_M_CONST    0
+#define VTEM_FVA_FACTOR 0
 
+#define VTEM_BRR_MASK_UPPER 0x03
+#define VTEM_BRR_MASK_LOWER 0xFF
 
-// VTEM Byte Masks
-//PB0
-#define MASK_VTEM_PB0__RESERVED0  0x01
-#define MASK_VTEM_PB0__SYNC       0x02
-#define MASK_VTEM_PB0__VFR        0x04
-#define MASK_VTEM_PB0__AFR        0x08
-#define MASK_VTEM_PB0__DS_TYPE    0x30
-	//0: Periodic pseudo-static EM Data Set
-	//1: Periodic dynamic EM Data Set
-	//2: Unique EM Data Set
-	//3: Reserved
-#define MASK_VTEM_PB0__END        0x40
-#define MASK_VTEM_PB0__NEW        0x80
+/* VTEM Byte Offset */
+#define VTEM_PB0 0
+#define VTEM_PB1 1
+#define VTEM_PB2 2
+#define VTEM_PB3 3
+#define VTEM_PB4 4
+#define VTEM_PB5 5
+#define VTEM_PB6 6
 
-//PB1
-#define MASK_VTEM_PB1__RESERVED1 0xFF
+#define VTEM_MD0 7
+#define VTEM_MD1 8
+#define VTEM_MD2 9
+#define VTEM_MD3 10
 
-//PB2
-#define MASK_VTEM_PB2__ORGANIZATION_ID 0xFF
-	//0: This is a Vendor Specific EM Data Set
-	//1: This EM Data Set is defined by This Specification (HDMI 2.1 r102.clean)
-	//2: This EM Data Set is defined by CTA-861-G
-	//3: This EM Data Set is defined by VESA
-//PB3
-#define MASK_VTEM_PB3__DATA_SET_TAG_MSB    0xFF
-//PB4
-#define MASK_VTEM_PB4__DATA_SET_TAG_LSB    0xFF
-//PB5
-#define MASK_VTEM_PB5__DATA_SET_LENGTH_MSB 0xFF
-//PB6
-#define MASK_VTEM_PB6__DATA_SET_LENGTH_LSB 0xFF
+/* Extended Metadata Packet */
+/* Header */
+#define EMP_LAST_BIT  6
+#define EMP_FIRST_BIT 7
+/* PB0 */
+#define EMP_SNC_BIT 1
+#define EMP_VFR_BIT 2
+#define EMP_AFR_BIT 3
+#define EMP_DST_BIT 4
+#define EMP_END_BIT 6
+#define EMP_NEW_BIT 7
+/* PB7 = MD0 */
+#define VTEM_VRR_BIT     0
+#define VTEM_M_CONST_BIT 1
+#define VTEM_FVA_BIT     4
+/* MD1 Base_Vfront */
+/* MD2 */
+#define VTEM_BRR_UPPER_BIT 0
+#define VTEM_RB_BIT        2
+/* MD3 BRR Lower */
 
 
-
-//PB7-27 (20 bytes):
-//PB7 = MD0
-#define MASK_VTEM_MD0__VRR_EN         0x01
-#define MASK_VTEM_MD0__M_CONST        0x02
-#define MASK_VTEM_MD0__QMS_EN         0x04
-#define MASK_VTEM_MD0__RESERVED2      0x08
-#define MASK_VTEM_MD0__FVA_FACTOR_M1  0xF0
-
-//MD1
-#define MASK_VTEM_MD1__BASE_VFRONT    0xFF
-
-//MD2
-#define MASK_VTEM_MD2__BASE_REFRESH_RATE_98  0x03
-#define MASK_VTEM_MD2__RB                    0x04
-#define MASK_VTEM_MD2__NEXT_TFR              0xF8
-
-//MD3
-#define MASK_VTEM_MD3__BASE_REFRESH_RATE_07  0xFF
-
 enum ColorimetryRGBDP {
 	ColorimetryRGB_DP_sRGB               = 0,
 	ColorimetryRGB_DP_AdobeRGB           = 3,
@@ -639,6 +618,83 @@ void mod_build_hf_vsif_infopacket(const struct dc_stream_state *stream,
 		info_packet->valid = true;
 }
 
+static void build_vtem_infopacket_header(struct dc_info_packet *infopacket)
+{
+	uint8_t pb0 = 0;
+
+	/* might need logic in the future */
+	pb0 |= 0 << EMP_SNC_BIT;
+	pb0 |= 1 << EMP_VFR_BIT;
+	pb0 |= 0 << EMP_AFR_BIT;
+	pb0 |= 0 << EMP_DST_BIT;
+	pb0 |= 0 << EMP_END_BIT;
+	pb0 |= 1 << EMP_NEW_BIT;
+
+	infopacket->hb0 = HDMI_INFOFRAME_TYPE_EMP;
+	infopacket->hb1 = (1 << EMP_FIRST_BIT) | (1 << EMP_LAST_BIT);
+	infopacket->hb2 = 0; // sequence
+
+	infopacket->sb[VTEM_PB0] = pb0;
+	infopacket->sb[VTEM_PB2] = VTEM_ORG_ID;
+	infopacket->sb[VTEM_PB4] = VTEM_DATA_SET_TAG;
+	infopacket->sb[VTEM_PB6] = VTEM_DATA_SET_LENGTH;
+}
+
+static void build_vtem_infopacket_data(const struct dc_stream_state *stream,
+		const struct mod_vrr_params *vrr,
+		struct dc_info_packet *infopacket)
+{
+	unsigned int hblank = 0;
+	unsigned int brr = 0;
+	bool hdmi_vic_mode = false;
+	bool vrr_active = false;
+	bool rb = false;
+
+	hdmi_vic_mode = is_hdmi_vic_mode(stream);
+	vrr_active = vrr->state == VRR_STATE_ACTIVE_VARIABLE ||
+		     vrr->state == VRR_STATE_ACTIVE_FIXED;
+
+	infopacket->sb[VTEM_MD0] = VTEM_M_CONST << VTEM_M_CONST_BIT;
+	infopacket->sb[VTEM_MD0] |= VTEM_FVA_FACTOR << VTEM_FVA_BIT;
+	infopacket->sb[VTEM_MD0] |= vrr_active << VTEM_VRR_BIT;
+
+	infopacket->sb[VTEM_MD1] = 0;
+	infopacket->sb[VTEM_MD2] = 0;
+	infopacket->sb[VTEM_MD3] = 0;
+
+	if (hdmi_vic_mode || !vrr_active)
+		return;
+	/*
+	 * In accordance with CVT 1.2 and CVT 2.1:
+	 * Reduced Blanking standard defines a fixed value of
+	 * 160 for hblank, further reduced to 80 in RB2. RB3 uses
+	 * fixed hblank of 80 pixels + up to 120 additional pixels
+	 * in 8-pixel steps.
+	 */
+	hblank = stream->timing.h_total - stream->timing.h_addressable;
+	rb = (hblank >= 80 && hblank <= 200 && hblank % 8 == 0);
+	brr = mod_freesync_calc_nominal_field_rate(stream) / 1000000;
+
+	if (brr > VTEM_BRR_MAX) {
+		infopacket->valid = false;
+		return;
+	}
+
+	infopacket->sb[VTEM_MD1] = (uint8_t) stream->timing.v_front_porch;
+	infopacket->sb[VTEM_MD2] = rb << VTEM_RB_BIT;
+	infopacket->sb[VTEM_MD2] |= (brr & VTEM_BRR_MASK_UPPER) >> 8;
+	infopacket->sb[VTEM_MD3] = brr & VTEM_BRR_MASK_LOWER;
+}
+
+void mod_build_vtem_infopacket(const struct dc_stream_state *stream,
+		const struct mod_vrr_params *vrr,
+		struct dc_info_packet *infopacket)
+{
+	infopacket->valid = true;
+	build_vtem_infopacket_header(infopacket);
+	build_vtem_infopacket_data(stream, vrr, infopacket);
+}
+
 void mod_build_adaptive_sync_infopacket(const struct dc_stream_state *stream,
 		enum adaptive_sync_type asType,
 		const struct AS_Df_params *param,
-- 
2.52.0

