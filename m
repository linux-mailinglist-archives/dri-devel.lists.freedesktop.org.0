Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 304D1AF77C2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 16:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF21010E862;
	Thu,  3 Jul 2025 14:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Llqrv6l/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D1610E862;
 Thu,  3 Jul 2025 14:38:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6AE6D434C7;
 Thu,  3 Jul 2025 14:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AABDC4CEF1;
 Thu,  3 Jul 2025 14:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751553513;
 bh=frFxIZdqr9u3z9N3c+nLFcUI2wN9fAMULO89/6Dlhn4=;
 h=From:To:Cc:Subject:Date:From;
 b=Llqrv6l/MaCoIRynheGW6Kg+30e1FGGhggdfF4ldKZ9Bzy3uD7w9J99pknoo3qcZV
 8QD8R/zFTTI1YOFxbjFZG9RFRsHGPzcKRPWA5UThegF2UKfdgX8GXYtgmpF3ClvCOm
 RgMl01k8oQ7J8j66/3j4U7rYbDDxalgT2YJRQ2214RY7m/IzkGCKcuIwgH/YsHEyxI
 H5GfMzpPd/JiAffOeyqQ82AtEx14K2hR59GcOPao1EFuK5AKKQ2Grj4Tmp4/nNCabZ
 mNnj0avZwij8QyxECQTBjk4AV+p1w2AGlEyG/hTC1qzbW3eF0NqslKJuXUP8efBpUa
 xiyC88O6chu0A==
From: Hans de Goede <hansg@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH resend] drm/i915/bios: Apply vlv_fixup_mipi_sequences() to v2
 mipi-sequences too
Date: Thu,  3 Jul 2025 16:38:24 +0200
Message-ID: <20250703143824.7121-1-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
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

From: Hans de Goede <hdegoede@redhat.com>

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
index ba7b8938b17c..166ee11831ab 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -1938,7 +1938,7 @@ static int get_init_otp_deassert_fragment_len(struct intel_display *display,
 	int index, len;
 
 	if (drm_WARN_ON(display->drm,
-			!data || panel->vbt.dsi.seq_version != 1))
+			!data || panel->vbt.dsi.seq_version >= 3))
 		return 0;
 
 	/* index = 1 to skip sequence byte */
@@ -1961,7 +1961,7 @@ static int get_init_otp_deassert_fragment_len(struct intel_display *display,
 }
 
 /*
- * Some v1 VBT MIPI sequences do the deassert in the init OTP sequence.
+ * Some v1/v2 VBT MIPI sequences do the deassert in the init OTP sequence.
  * The deassert must be done before calling intel_dsi_device_ready, so for
  * these devices we split the init OTP sequence into a deassert sequence and
  * the actual init OTP part.
@@ -1972,9 +1972,9 @@ static void vlv_fixup_mipi_sequences(struct intel_display *display,
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
2.49.0

