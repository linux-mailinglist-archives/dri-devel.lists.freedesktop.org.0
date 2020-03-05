Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B845D17AF82
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 21:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AB56EC1A;
	Thu,  5 Mar 2020 20:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E75C6EC26
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 20:12:49 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id t192so6880113ywe.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2020 12:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pmH5P3UPzpZunNOabz5UiiKtE1ndD7oQc4aQripKu0k=;
 b=W0MCXvp6hObqMaYeIyT0nlTkEZAqKOtmhgasT1SKRSWY4NA5Ox1HfEb2e11mrxPT+Q
 y7igL4exVRci44I1DS9BKR0ujeRpf3pceJ1mbYyQpIAXh97dzEbOsi3KKlUVNzxT+/U1
 celncqzJwpsNfL4ukB3rNKx2UnJHzIARlUq0n+eBqFkdsPvsVuA8INGSkeOurdJFxRbR
 PszbUBB21M55A6zc0S/C0KLYF8REM9+MSbf85zQULi7rgSWmZCteMWmxDEgnRapBnY5G
 sGKscXc5xWMctZGPZDgg4sx952z/ramU7tMvnn2oK7k8YCFYidnZmeaRoJBfOpvQvbjU
 iOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pmH5P3UPzpZunNOabz5UiiKtE1ndD7oQc4aQripKu0k=;
 b=QWEbOzppJ5/mVVGB9gglUAiPi1qjJQjNqw+6rv+1E1N7b6wPTkLgvtfQt9QL1IF92K
 4CeU0+s4155cTIYPhYaA34ijREw1PoR2FvfW4T6TmVgKKiLmvcbUAFnGKMNtZsL36mdE
 HKX20Kbs1sL9z4VTklI7S20Y0/lkBK9ktx2yVSa0SkI8kwecBrPpA3r8COFHQvFB56Ag
 x8OHLTvFL13PaEaWJok/xe0pEeAGyyXtv1nlOHw0MeTLovzssn5izoYhLzYbS7PrbQHb
 UQJUHDB9sBgFXIBfvLW6Q+kHJs3YKNtmS8+JiH6ncTyPfa554oOaIgZtAEEcyW65Awtt
 pwQQ==
X-Gm-Message-State: ANhLgQ1Cg22HkzsOHTSo+2t8v6BuK8ESxyUP1aKUVd7HqiuABtRFe3Hr
 oe5eFL5PWvjaVLIRMbuvkugPqTV3RBU=
X-Google-Smtp-Source: ADFU+vub4axTAgrYzMLq88agkhOWkYwwktVEPejDmdWCD6heVfr8mUy5puIMCuJAfFGl58Hcol/Vjw==
X-Received: by 2002:a81:8408:: with SMTP id u8mr128139ywf.384.1583439168532;
 Thu, 05 Mar 2020 12:12:48 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id i2sm12277494ywm.17.2020.03.05.12.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 12:12:48 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 09/16] drm/i915: Support DP MST in enc_to_dig_port()
 function
Date: Thu,  5 Mar 2020 15:12:29 -0500
Message-Id: <20200305201236.152307-10-sean@poorly.run>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200305201236.152307-1-sean@poorly.run>
References: <20200305201236.152307-1-sean@poorly.run>
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
Link: https://patchwork.freedesktop.org/patch/msgid/20200218220242.107265-10-sean@poorly.run #v4

Changes in v2:
-None
Changes in v3:
-None
Changes in v4:
-None
Changes in v5:
-None
---
 .../drm/i915/display/intel_display_types.h    | 21 ++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 04161993e2038..3cac51955f250 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1502,6 +1502,18 @@ static inline bool intel_encoder_is_dig_port(struct intel_encoder *encoder)
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
@@ -1510,6 +1522,8 @@ enc_to_dig_port(struct intel_encoder *encoder)
 	if (intel_encoder_is_dig_port(intel_encoder))
 		return container_of(&encoder->base, struct intel_digital_port,
 				    base.base);
+	else if (intel_encoder_is_mst(intel_encoder))
+		return enc_to_mst(encoder)->primary;
 	else
 		return NULL;
 }
@@ -1520,13 +1534,6 @@ intel_attached_dig_port(struct intel_connector *connector)
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
