Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECB62B7DB3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 13:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7676E40F;
	Wed, 18 Nov 2020 12:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CBE6E3DB
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 12:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605703266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qcvzA2HWrlTWMMUBjGQsLsdvH9UGLrSB4FxkVME4Fes=;
 b=AAaR0Mms9j2ZMmdW9koHOaN3LKsbOr+pJmyjO1BDPdU1ECr2sA4teQA8aOgDrAf4TTFsOw
 tOX4XPplUSYeyh22o0ip5uIyeEvhyi4AdKd2RLA5ci+GYGxM2pDm9hJOPCcWRc1YTQ+f+Y
 jVrAra1nofrVvXgOCCZUDrVSr6N0XoQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-7X2XeQe2OvmR0EzGpZy-HQ-1; Wed, 18 Nov 2020 07:41:02 -0500
X-MC-Unique: 7X2XeQe2OvmR0EzGpZy-HQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C54A1075620;
 Wed, 18 Nov 2020 12:41:01 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-94.ams2.redhat.com [10.36.114.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1AB260C05;
 Wed, 18 Nov 2020 12:40:59 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH] drm/i915/dsi: Use unconditional msleep for the panel_on_delay
 when there is no reset-deassert MIPI-sequence
Date: Wed, 18 Nov 2020 13:40:58 +0100
Message-Id: <20201118124058.26021-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 25b4620ee822 ("drm/i915/dsi: Skip delays for v3 VBTs in vid-mode")
added an intel_dsi_msleep() helper which skips sleeping if the
MIPI-sequences have a version of 3 or newer and the panel is in vid-mode;
and it moved a bunch of msleep-s over to this new helper.

This was based on my reading of the big comment around line 730 which
starts with "Panel enable/disable sequences from the VBT spec.",
where the "v3 video mode seq" column does not have any wait t# entries.

Given that this code has been used on a lot of different devices without
issues until now, it seems that my interpretation of the spec here is
mostly correct.

But now I have encountered one device, an Acer Aspire Switch 10 E
SW3-016, where the panel will not light up unless we do actually honor the
panel_on_delay after exexuting the MIPI_SEQ_PANEL_ON sequence.

What seems to set this model apart is that it is lacking a
MIPI_SEQ_DEASSERT_RESET sequence, which is where the power-on
delay usually happens.

Fix the panel not lighting up on this model by using an unconditional
msleep(panel_on_delay) instead of intel_dsi_msleep() when there is
no MIPI_SEQ_DEASSERT_RESET sequence.

Fixes: 25b4620ee822 ("drm/i915/dsi: Skip delays for v3 VBTs in vid-mode")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/vlv_dsi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index 194c239ab6b1..ef673277b36d 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -816,10 +816,14 @@ static void intel_dsi_pre_enable(struct intel_atomic_state *state,
 		intel_dsi_prepare(encoder, pipe_config);
 
 	intel_dsi_vbt_exec_sequence(intel_dsi, MIPI_SEQ_POWER_ON);
-	intel_dsi_msleep(intel_dsi, intel_dsi->panel_on_delay);
 
-	/* Deassert reset */
-	intel_dsi_vbt_exec_sequence(intel_dsi, MIPI_SEQ_DEASSERT_RESET);
+	if (dev_priv->vbt.dsi.sequence[MIPI_SEQ_DEASSERT_RESET]) {
+		intel_dsi_msleep(intel_dsi, intel_dsi->panel_on_delay);
+		/* Deassert reset */
+		intel_dsi_vbt_exec_sequence(intel_dsi, MIPI_SEQ_DEASSERT_RESET);
+	} else {
+		msleep(intel_dsi->panel_on_delay);
+	}
 
 	if (IS_GEMINILAKE(dev_priv)) {
 		glk_cold_boot = glk_dsi_enable_io(encoder);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
