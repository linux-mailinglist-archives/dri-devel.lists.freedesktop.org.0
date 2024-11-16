Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC3A9CFD82
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2024 10:34:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4F310E029;
	Sat, 16 Nov 2024 09:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="F+480j8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C442D89DA5
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2024 09:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731749674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pAf+Qe0ud5sHOSH6k8HTdTMeftLfO4sxECxvpooLaiU=;
 b=F+480j8PQjjw3afSjVk6Zby7SgYlABb+yVIOABFhB60u2BLQNdGash5LYjRl2b+9XeF6+O
 xRa/srTrd6kcDXqmnZf1UUblhgfwilDXln0k+lSttjguXQ+ZFXyUrBafY2PHCqOKe/U7Gv
 Ojv6DMoxpALV0nLnEtSKpox1rNdrJH8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-103-k7lHsCGEOdK4hnVevpyPYQ-1; Sat,
 16 Nov 2024 04:34:31 -0500
X-MC-Unique: k7lHsCGEOdK4hnVevpyPYQ-1
X-Mimecast-MFC-AGG-ID: k7lHsCGEOdK4hnVevpyPYQ
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 025C21955F43; Sat, 16 Nov 2024 09:34:30 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.52])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7FE8A19560A3; Sat, 16 Nov 2024 09:34:27 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/bios: Apply vlv_fixup_mipi_sequences() to v2
 mipi-sequences too
Date: Sat, 16 Nov 2024 10:34:26 +0100
Message-ID: <20241116093426.4989-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: L8D89bmZPWySf6hiynnteK9uVTZLQn_ei3y-yKdFfVE_1731749670
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

It turns out that the fixup from vlv_fixup_mipi_sequences() is necessary
for some DSI panel's with version 2 mipi-sequences too.

Specifically the Acer Iconia One 8 A1-840 (not to be confused with the
A1-840FHD which is different) has the following sequences:

BDB block 53 (1284 bytes) - MIPI sequence block:
	Sequence block version v2
	Panel 0 *

Sequence 2 - MIPI_SEQ_INIT_OTP
	GPIO index 9, source 0, set 0 (0x00)
	Delay: 50000 us
	GPIO index 9, source 0, set 1 (0x01)
	Delay: 6000 us
	GPIO index 9, source 0, set 0 (0x00)
	Delay: 6000 us
	GPIO index 9, source 0, set 1 (0x01)
	Delay: 25000 us
	Send DCS: Port A, VC 0, LP, Type 39, Length 5, Data ff aa 55 a5 80
	Send DCS: Port A, VC 0, LP, Type 39, Length 3, Data 6f 11 00
	...
	Send DCS: Port A, VC 0, LP, Type 05, Length 1, Data 29
	Delay: 120000 us

Sequence 4 - MIPI_SEQ_DISPLAY_OFF
	Send DCS: Port A, VC 0, LP, Type 05, Length 1, Data 28
	Delay: 105000 us
	Send DCS: Port A, VC 0, LP, Type 05, Length 2, Data 10 00
	Delay: 10000 us

Sequence 5 - MIPI_SEQ_ASSERT_RESET
	Delay: 10000 us
	GPIO index 9, source 0, set 0 (0x00)

Notice how there is no MIPI_SEQ_DEASSERT_RESET, instead the deassert
is done at the beginning of MIPI_SEQ_INIT_OTP, which is exactly what
the fixup from vlv_fixup_mipi_sequences() fixes up.

Extend it to also apply to v2 sequences, this fixes the panel not working
on the Acer Iconia One 8 A1-840.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index bed485374ab0..855176c8d943 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -1929,7 +1929,7 @@ static int get_init_otp_deassert_fragment_len(struct intel_display *display,
 	int index, len;
 
 	if (drm_WARN_ON(display->drm,
-			!data || panel->vbt.dsi.seq_version != 1))
+			!data || panel->vbt.dsi.seq_version >= 3))
 		return 0;
 
 	/* index = 1 to skip sequence byte */
@@ -1952,7 +1952,7 @@ static int get_init_otp_deassert_fragment_len(struct intel_display *display,
 }
 
 /*
- * Some v1 VBT MIPI sequences do the deassert in the init OTP sequence.
+ * Some v1/v2 VBT MIPI sequences do the deassert in the init OTP sequence.
  * The deassert must be done before calling intel_dsi_device_ready, so for
  * these devices we split the init OTP sequence into a deassert sequence and
  * the actual init OTP part.
@@ -1963,9 +1963,9 @@ static void vlv_fixup_mipi_sequences(struct intel_display *display,
 	u8 *init_otp;
 	int len;
 
-	/* Limit this to v1 vid-mode sequences */
+	/* Limit this to v1/v2 vid-mode sequences */
 	if (panel->vbt.dsi.config->is_cmd_mode ||
-	    panel->vbt.dsi.seq_version != 1)
+	    panel->vbt.dsi.seq_version >= 3)
 		return;
 
 	/* Only do this if there are otp and assert seqs and no deassert seq */
-- 
2.47.0

