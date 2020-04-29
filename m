Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 638781BE7DB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 21:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782616F3A5;
	Wed, 29 Apr 2020 19:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852D26F3A5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 19:55:21 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id e17so2998062qtp.7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 12:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6eXN93n5WsbFLFCMW80MEZcP/cByGzMxe2MgUPU8/k0=;
 b=L0zCC/L8v9LJJGMnmWTLbnCWMCmQNYJMf7QTGkcxRJDE6YmYxBiyXnOrQcC3m0l1oI
 4KSA7yaWr7WToAPSW9NTTyfTtedlpkKJqQmtsLnhECbl80oAhY8Jy8i/XGMX/9eNE1w0
 /LZMak9K8WiXeMo3u+2/Wl3szyvG6MNs7QxLf2/ouW++TAwsTrN3QFbGefnPgdv2xj8D
 tDkii6OwSMZWUIiNpFCPiv4jiO3fAFmsfKxQ+gMQSf3kLDrDNKHATrTcksf57Kf3J0b9
 AlEnGFXJYH0mJT/vcbicdk7EtovSVt13zEcY0jcgU4uhAhTg8hZm5ixE/58FuwaP7Y6U
 iOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6eXN93n5WsbFLFCMW80MEZcP/cByGzMxe2MgUPU8/k0=;
 b=tMBUgPRqYZyc+6UZEIJse2N18H1shRgeH6qaERmo+w0pORqYMZolrGgg7BK/kDzeTo
 3Nb8S55pbMUCEF9q5K4cBFag6OxqF4+v+/52ej2cbRxIbfZPILRhGpDEFnHcj0QTVWpB
 g7PdgWgH+Nx0RS4s97Q/PwGa37l5+sPMexxgaQEHaNUpF6qnbhv93itNnP3zwfHFCg4a
 7YZiFeTxSQdqK2WfJq95PPiL6/n6tvTXO5lF/BfPb96WYln/CJeCN/2uLpeiL6YtM4tz
 sgIHyNyRV2tohsNnzeXabv1/nkjX+rDURhdOTM4NGaANmAYqN6Q6e0GgsMWDpdK++RdW
 4C7Q==
X-Gm-Message-State: AGi0PuYXD2PI1OmXfWcURReetaWi1R6YIwKdrlRGSGtg9KeJDK7T2B+4
 UY2XQEmzQ76nVlHr91XYgX1me/OLe2U=
X-Google-Smtp-Source: APiQypIIYGb9JyK3D/uHYr7OG0Fx5C4VJY+BKKFNSeadFySk6dCRyxl0jDjC5qaY0uuDtyL+94HDyg==
X-Received: by 2002:ac8:7096:: with SMTP id y22mr11020900qto.251.1588190120544; 
 Wed, 29 Apr 2020 12:55:20 -0700 (PDT)
Received: from localhost (mobile-166-170-55-34.mycingular.net. [166.170.55.34])
 by smtp.gmail.com with ESMTPSA id x24sm174595qth.80.2020.04.29.12.55.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Apr 2020 12:55:20 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 09/16] drm/i915: Support DP MST in enc_to_dig_port()
 function
Date: Wed, 29 Apr 2020 15:54:55 -0400
Message-Id: <20200429195502.39919-10-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429195502.39919-1-sean@poorly.run>
References: <20200429195502.39919-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch, seanpaul@chromium.org, juston.li@intel.com,
 rodrigo.vivi@intel.com
MIME-Version: 1.0
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
Link: https://patchwork.freedesktop.org/patch/msgid/20200305201236.152307-10-sean@poorly.run #v5

Changes in v2:
-None
Changes in v3:
-None
Changes in v4:
-None
Changes in v5:
-None
Changes in v6:
-None
---
 .../drm/i915/display/intel_display_types.h    | 21 ++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 69edfab4e266..f17911e25452 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1525,6 +1525,18 @@ static inline bool intel_encoder_is_dig_port(struct intel_encoder *encoder)
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
@@ -1533,6 +1545,8 @@ enc_to_dig_port(struct intel_encoder *encoder)
 	if (intel_encoder_is_dig_port(intel_encoder))
 		return container_of(&encoder->base, struct intel_digital_port,
 				    base.base);
+	else if (intel_encoder_is_mst(intel_encoder))
+		return enc_to_mst(encoder)->primary;
 	else
 		return NULL;
 }
@@ -1543,13 +1557,6 @@ intel_attached_dig_port(struct intel_connector *connector)
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
