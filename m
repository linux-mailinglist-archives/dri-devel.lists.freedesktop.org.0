Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D541915867
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 23:00:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E8410E160;
	Mon, 24 Jun 2024 21:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Ci2e1DLW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA2710E160
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 20:59:59 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-7954f8b818fso302366085a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 13:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719262798; x=1719867598;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yVxF+4NYTfstkalmv/Dj6jTNN9gH7g+rtrp6ooGCgtk=;
 b=Ci2e1DLWrBPzRgWTDwX8eNv3tkXexV5fws5B3+f+kT1Rj8rE1pVeFXE0x4w2vh8ffB
 1LpN5OY8Jhl0ShTgvYJ1DLJ6YaoWRRya9rP7H70zVJxTb5bc3DHypO3R9O/zF5tWNrTB
 FrBMat0F0hXOZHn5leyDFW6RMoQkF31XZg34k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719262798; x=1719867598;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yVxF+4NYTfstkalmv/Dj6jTNN9gH7g+rtrp6ooGCgtk=;
 b=JC7Mj4pnnsqXYNuKEncNmU8bulb/hm3aAQlP6qynwbw614/Ob52Llw+xASSmzq8Gek
 /2mzuAIwALteVuTt73DOJfTDO+MugoJWk7mfuAozHV1RdHDOvOhoXNF6CmpkXgLklhvQ
 ba24RJxxBKc5SnoDOG8d3C5z3P8+lRONxLgFU8XtnGNjFhTqUZ6K3gIu5chqBfWRs+Wr
 FmHdCovOcQ7LhYRfV/Rdw6CFalyEZfyBuiX2BwssG9pezODzqKw5lwtIFlxDa2Gpsg0w
 UCGkAPIVlSB8oDkDMzisTgi0vziQM+r2GMpkzhuJnpATHWDrXppeS44RGG9NQ5y0Iag/
 G0LA==
X-Gm-Message-State: AOJu0YydrQSt21Odi/OvvBRpA1q06WG17mPfPj8v3ZJlnIL/3Gv6OWjW
 9J6A02qgRm1tWubdHHyCEtbpWWybrQQhgkG4Gw08Q9O2eHVonxcSZ5iVd7gyk1VCn9xmQ/x6LiA
 YveFXRQhxoR13wVWwUAFeR2M1tX0MqWolYqQWy2V3nCK9s9vEb0QoZzime2wH43E0sLLwiCzb0C
 ICoOMJG03zHV3uFkgytLTlCNmlbcZ1oH2/wnRehnt80ueK0vK2lA==
X-Google-Smtp-Source: AGHT+IFOVzBEZW6diO/NcPKjT82uRlPaY2ES9OdGVy19e3xKLzRgeQYr1wC48b/WIW9oxMOBoEjUPA==
X-Received: by 2002:a0c:dc09:0:b0:6b2:c034:6aa3 with SMTP id
 6a1803df08f44-6b5409e1411mr51663256d6.35.1719262797668; 
 Mon, 24 Jun 2024 13:59:57 -0700 (PDT)
Received: from localhost ([192.19.144.250]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b531673e6esm24967356d6.85.2024.06.24.13.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 13:59:57 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH] drm/vmwgfx: Trigger a modeset when the screen moves
Date: Mon, 24 Jun 2024 15:59:51 -0500
Message-Id: <20240624205951.23343-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
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

When multi-monitor is cycled the X,Y position of the Screen Target will
likely change but the resolution will not. We need to trigger a modeset
when this occurs in order to recreate the Screen Target with the correct
X,Y position.

Fixes a bug where multiple displays are shown in a single scrollable
host window rather than in 2+ windows on separate host displays.

Fixes: 426826933109 ("drm/vmwgfx: Filter modes which exceed graphics memory")
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 29 +++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index a04e0736318da..9becd71bc93bc 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -877,6 +877,32 @@ vmw_stdu_connector_mode_valid(struct drm_connector *connector,
 	return MODE_OK;
 }
 
+/*
+ * Trigger a modeset if the X,Y position of the Screen Target changes.
+ * This is needed when multi-mon is cycled. The original Screen Target will have
+ * the same mode but its relative X,Y position in the topology will change.
+ */
+static int vmw_stdu_connector_atomic_check(struct drm_connector *conn,
+					   struct drm_atomic_state *state)
+{
+	struct drm_connector_state *conn_state;
+	struct vmw_screen_target_display_unit *du;
+	struct drm_crtc_state *new_crtc_state;
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	du = vmw_connector_to_stdu(conn);
+
+	if (!conn_state->crtc)
+		return 0;
+
+	new_crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	if (du->base.gui_x != du->base.set_gui_x ||
+	    du->base.gui_y != du->base.set_gui_y)
+		new_crtc_state->mode_changed = true;
+
+	return 0;
+}
+
 static const struct drm_connector_funcs vmw_stdu_connector_funcs = {
 	.dpms = vmw_du_connector_dpms,
 	.detect = vmw_du_connector_detect,
@@ -891,7 +917,8 @@ static const struct drm_connector_funcs vmw_stdu_connector_funcs = {
 static const struct
 drm_connector_helper_funcs vmw_stdu_connector_helper_funcs = {
 	.get_modes = vmw_connector_get_modes,
-	.mode_valid = vmw_stdu_connector_mode_valid
+	.mode_valid = vmw_stdu_connector_mode_valid,
+	.atomic_check = vmw_stdu_connector_atomic_check,
 };
 
 
-- 
2.34.1

