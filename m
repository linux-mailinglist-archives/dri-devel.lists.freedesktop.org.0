Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A4B11D6B3
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 20:03:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828996E162;
	Thu, 12 Dec 2019 19:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3549A6E147
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 19:02:47 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id f130so326201ybb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 11:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bn8u7pWoGg8zc5v1qOSMV2dK0Bpj2CVY/zjmmsWGbeU=;
 b=Lq8o1DtCawZ2UaJpL+tR++oWBU7eAZYFAf6ClWLF+HkVmTGVZTSrK3mizEeTsj4G7U
 6M5OjJaE6/OfpDgs0c1juJghoFRIdfxEPYUTOSvyu8pBcrPYSLS2rWwbuiNCUE87hGZ2
 nMev0T8C83X6zDJtWwMaT8hqKT1eFjqoE3AXONpYEqEOqYG0ZRInGEuDqLxKmi3HpUFz
 VXVAPOHXGsLck6Iko3yOGWEJKLDlwyAPna8mkevPp7S0mP9PzoQ0JkzPArh1dffkYD2W
 eku2zSWPLo7GMsu7BjmGd9sc6Uxp9x/w0ttjgRvHGe+q0kORnsjEW2GTUucSNwed33O8
 Nmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bn8u7pWoGg8zc5v1qOSMV2dK0Bpj2CVY/zjmmsWGbeU=;
 b=Pg9BLJTktXLytUXsd+/NPwxuqTCN1LLZxk04FcidwyKI2B00WvG6RIJRs+bWvwTjPg
 jc2KGwVSh14L1rxcco6kI0Uaxuz132yjjX3PxBHZ/JftxGL422DCxsgf19vJSp5z8goM
 3IIV62umZx+982XM1w0vUcCCMq8sq8vHJOEAZm/UvdkoG6LWnnXDZzBuN8ge7Zyky4kn
 5VutCOGoQFmVLFmkC6CSNY0Y7yZ/1RXVlJMDSGDFcX8SqnBi23LQxm10z+8ZXMI7d++K
 j+hnFMpaRsJARc2ccgSmchXnGT1mPxpeU1yKaxqOOWn1XPYl3Eb+BQLe4GO32tfqzbsl
 TJnA==
X-Gm-Message-State: APjAAAVpYI3pKN8jhvEc2dI77Cg+LTTBmGklWxj3IGBdCB12j2A8vsZA
 vwFHUxHHuijtGjjKnXEf1bTNUPf8s3De2g==
X-Google-Smtp-Source: APXvYqyCB/OMGpF38Yo211kR+L9o/xTHWxPl81L2KDxLemk7M0v356TJayX4RSNA4Tl01jjJlobAWw==
X-Received: by 2002:a25:208b:: with SMTP id g133mr5761792ybg.71.1576177366194; 
 Thu, 12 Dec 2019 11:02:46 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id x84sm2815532ywg.47.2019.12.12.11.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 11:02:45 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 09/12] drm/i915: Support DP MST in enc_to_dig_port()
 function
Date: Thu, 12 Dec 2019 14:02:27 -0500
Message-Id: <20191212190230.188505-10-sean@poorly.run>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191212190230.188505-1-sean@poorly.run>
References: <20191212190230.188505-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch, rodrigo.vivi@intel.com,
 Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Although DP_MST fake encoders are not subclassed from digital ports,
they are associated with them. Support these encoders.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20191203173638.94919-9-sean@poorly.run #v1

Changes in v2:
-none
---
 .../drm/i915/display/intel_display_types.h    | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 8e98840fc597..ac5af925e403 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1459,6 +1459,17 @@ static inline bool intel_encoder_is_dig_port(struct intel_encoder *encoder)
 	}
 }
 
+static inline bool intel_encoder_is_mst(struct intel_encoder *encoder)
+{
+	return encoder->type == INTEL_OUTPUT_DP_MST;
+}
+
+static inline struct intel_dp_mst_encoder *
+enc_to_mst(struct drm_encoder *encoder)
+{
+	return container_of(encoder, struct intel_dp_mst_encoder, base.base);
+}
+
 static inline struct intel_digital_port *
 enc_to_dig_port(struct drm_encoder *encoder)
 {
@@ -1467,6 +1478,8 @@ enc_to_dig_port(struct drm_encoder *encoder)
 	if (intel_encoder_is_dig_port(intel_encoder))
 		return container_of(encoder, struct intel_digital_port,
 				    base.base);
+	else if (intel_encoder_is_mst(intel_encoder))
+		return enc_to_mst(encoder)->primary;
 	else
 		return NULL;
 }
@@ -1477,12 +1490,6 @@ conn_to_dig_port(struct intel_connector *connector)
 	return enc_to_dig_port(&intel_attached_encoder(&connector->base)->base);
 }
 
-static inline struct intel_dp_mst_encoder *
-enc_to_mst(struct drm_encoder *encoder)
-{
-	return container_of(encoder, struct intel_dp_mst_encoder, base.base);
-}
-
 static inline struct intel_dp *enc_to_intel_dp(struct drm_encoder *encoder)
 {
 	return &enc_to_dig_port(encoder)->dp;
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
