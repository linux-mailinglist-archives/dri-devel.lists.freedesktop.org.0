Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D291635BB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 23:04:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596A36EAB7;
	Tue, 18 Feb 2020 22:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79C36E417
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 22:03:41 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id z141so10125818ywd.13
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 14:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2EOch5Rw3WBJMp4XFKpC6cuq8lAKO8K/UQJcWa2z04E=;
 b=XQ5lZbPiQ5NRHZBckdqypesKO35A3U8OyigM0WIPQwaEwufKMEOCP8gl1QXVZpJgvH
 P0G/FaDUmP0t+9Qilt2K5BjU13FEvDjzs8jdNWcbyAbIxv4mLuMkU4nUFpWzZAnXxUwz
 Mf6m12ucOx20alpkEg2tIJBIod4RSW4Qajc+iMh97YD4yYPlwf/FeJG8x5QHAany5ZLK
 1Xn2jPPpjhg92VyGTHvJoomV0bYbZ1S0dWL7BKFPn2r1fZG08BX48OR4sS1JhDImM+ud
 FkC497gHQ2UbIt7DcV0DtNSMIBchas1aor/rBb9cGE+yXjD3ausLtT32KYuO3ayF9e5W
 veYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2EOch5Rw3WBJMp4XFKpC6cuq8lAKO8K/UQJcWa2z04E=;
 b=ja+qUqFXuWYn8/x245eYmcwgOQmArG+CfdmVp6wedtvYbghYvrfveoSwr2FnnpCS2h
 DPuXrEJQlLmHo6fmw8uY3n8Fca44ZMYns9xzWl3mnlKYoSQf6KPgjdqkfEBCcEnhnkJU
 heDz4T1hRag4wrmfS9abBYczpGCQ48l0MT/KBLm1mLEynfH+8d/x7GsX8ZAU74/v1bZ/
 iNqTDEVm/EQBHBzEoPUl51poPVpNyxdp9+VOuKudF+E7SyKIh2sgL/U5BXlUZRBshC/g
 YgAtUfdTh0QLtsA6kb5eUeIylgKtavvfrtCj8VDQNqoB+E9UP/Wxvi4QiQvgUyn60J7n
 OSvQ==
X-Gm-Message-State: APjAAAV7ranfcZZIGpDj/te2wzcR+152EY2MERRCmuYPHCiDaJElrI+M
 vAHMFkeJYf51k0Jb2V/H9wjNotAP7cY=
X-Google-Smtp-Source: APXvYqxFP7kqlT/z0xwWhddDnmLSUArX8hEVg8DxV7ZciVIngV+T5wN2mDmmjsenccm2xLHnFQ2kbw==
X-Received: by 2002:a0d:cf85:: with SMTP id
 r127mr19028316ywd.514.1582063420703; 
 Tue, 18 Feb 2020 14:03:40 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id d137sm21972ywe.36.2020.02.18.14.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 14:03:40 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 09/14] drm/i915: Support DP MST in enc_to_dig_port()
 function
Date: Tue, 18 Feb 2020 17:02:37 -0500
Message-Id: <20200218220242.107265-10-sean@poorly.run>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200218220242.107265-1-sean@poorly.run>
References: <20200218220242.107265-1-sean@poorly.run>
MIME-Version: 1.0
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
Cc: daniel.vetter@ffwll.ch, Sean Paul <seanpaul@chromium.org>,
 juston.li@intel.com, rodrigo.vivi@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Although DP_MST fake encoders are not subclassed from digital ports,
they are associated with them. Support these encoders.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20191203173638.94919-9-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20191212190230.188505-10-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20200117193103.156821-10-sean@poorly.run #v3

Changes in v2:
-None
Changes in v3:
-None
Changes in v4:
-None
---
 .../drm/i915/display/intel_display_types.h    | 21 ++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index edbe8211078df..9fb25f80dc91d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1444,6 +1444,18 @@ static inline bool intel_encoder_is_dig_port(struct intel_encoder *encoder)
 	}
 }
 
+static inline bool intel_encoder_is_mst(struct intel_encoder *encoder)
+{
+	return encoder->type == INTEL_OUTPUT_DP_MST;
+}
+
+static inline struct intel_dp_mst_encoder *
+enc_to_mst(struct intel_encoder *encoder)
+{
+	return container_of(&encoder->base, struct intel_dp_mst_encoder,
+			    base.base);
+}
+
 static inline struct intel_digital_port *
 enc_to_dig_port(struct intel_encoder *encoder)
 {
@@ -1452,6 +1464,8 @@ enc_to_dig_port(struct intel_encoder *encoder)
 	if (intel_encoder_is_dig_port(intel_encoder))
 		return container_of(&encoder->base, struct intel_digital_port,
 				    base.base);
+	else if (intel_encoder_is_mst(intel_encoder))
+		return enc_to_mst(encoder)->primary;
 	else
 		return NULL;
 }
@@ -1462,13 +1476,6 @@ intel_attached_dig_port(struct intel_connector *connector)
 	return enc_to_dig_port(intel_attached_encoder(connector));
 }
 
-static inline struct intel_dp_mst_encoder *
-enc_to_mst(struct intel_encoder *encoder)
-{
-	return container_of(&encoder->base, struct intel_dp_mst_encoder,
-			    base.base);
-}
-
 static inline struct intel_dp *enc_to_intel_dp(struct intel_encoder *encoder)
 {
 	return &enc_to_dig_port(encoder)->dp;
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
