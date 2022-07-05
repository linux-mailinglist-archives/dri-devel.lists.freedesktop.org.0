Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22434567503
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 19:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D50D926FF;
	Tue,  5 Jul 2022 17:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD1F926C2;
 Tue,  5 Jul 2022 17:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657040482; x=1688576482;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=KJEqjiyJCjcTLZ25oWrA2VIRC1Sd75b2tLdI9i17zxI=;
 b=xj7QZzAffZO/rrdh4Fas6m8nQ/20LyCGFqcWUtxGsOWeU0A6/DVTL3aq
 uJRyYmMj3Yll1/RgSqCnblywegea3XriOuoJbGvQhtRgntsGohbJ/zvxn
 zRM+rKPL1S6yHbSHVazG98gEGfNi1vwOIsag1pouqbVZpXkYRYGzD7Jye M=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 05 Jul 2022 10:01:22 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 05 Jul 2022 10:01:19 -0700
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg01-blr.qualcomm.com with ESMTP; 05 Jul 2022 22:30:58 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id 53C003CBE; Tue,  5 Jul 2022 22:30:57 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v4 2/7] drm: add helper functions to retrieve old and new crtc
Date: Tue,  5 Jul 2022 22:30:40 +0530
Message-Id: <1657040445-13067-3-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1657040445-13067-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1657040445-13067-1-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com, quic_khsieh@quicinc.com,
 dianders@chromium.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add new helper functions, drm_atomic_get_old_crtc_for_encoder
and drm_atomic_get_new_crtc_for_encoder to retrieve the
corresponding crtc for the encoder.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
---
 drivers/gpu/drm/drm_atomic.c | 60 ++++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_atomic.h     |  7 ++++++
 2 files changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 58c0283..87fcb55 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -983,6 +983,66 @@ drm_atomic_get_new_connector_for_encoder(struct drm_atomic_state *state,
 EXPORT_SYMBOL(drm_atomic_get_new_connector_for_encoder);
 
 /**
+ * drm_atomic_get_old_crtc_for_encoder - Get old crtc for an encoder
+ * @state: Atomic state
+ * @encoder: The encoder to fetch the crtc state for
+ *
+ * This function finds and returns the crtc that was connected to @encoder
+ * as specified by the @state.
+ *
+ * Returns: The old crtc connected to @encoder, or NULL if the encoder is
+ * not connected.
+ */
+struct drm_crtc *
+drm_atomic_get_old_crtc_for_encoder(struct drm_atomic_state *state,
+				    struct drm_encoder *encoder)
+{
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+
+	connector = drm_atomic_get_old_connector_for_encoder(state, encoder);
+	if (!connector)
+		return NULL;
+
+	conn_state = drm_atomic_get_old_connector_state(state, connector);
+	if (!conn_state)
+		return NULL;
+
+	return conn_state->crtc;
+}
+EXPORT_SYMBOL(drm_atomic_get_old_crtc_for_encoder);
+
+/**
+ * drm_atomic_get_new_crtc_for_encoder - Get new crtc for an encoder
+ * @state: Atomic state
+ * @encoder: The encoder to fetch the crtc state for
+ *
+ * This function finds and returns the crtc that will be connected to @encoder
+ * as specified by the @state.
+ *
+ * Returns: The new crtc connected to @encoder, or NULL if the encoder is
+ * not connected.
+ */
+struct drm_crtc *
+drm_atomic_get_new_crtc_for_encoder(struct drm_atomic_state *state,
+				    struct drm_encoder *encoder)
+{
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+
+	connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
+	if (!connector)
+		return NULL;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (!conn_state)
+		return NULL;
+
+	return conn_state->crtc;
+}
+EXPORT_SYMBOL(drm_atomic_get_new_crtc_for_encoder);
+
+/**
  * drm_atomic_get_connector_state - get connector state
  * @state: global atomic state object
  * @connector: connector to get state object for
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 0777725..7001f12 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -528,6 +528,13 @@ struct drm_connector *
 drm_atomic_get_new_connector_for_encoder(struct drm_atomic_state *state,
 					 struct drm_encoder *encoder);
 
+struct drm_crtc *
+drm_atomic_get_old_crtc_for_encoder(struct drm_atomic_state *state,
+					 struct drm_encoder *encoder);
+struct drm_crtc *
+drm_atomic_get_new_crtc_for_encoder(struct drm_atomic_state *state,
+					 struct drm_encoder *encoder);
+
 /**
  * drm_atomic_get_existing_crtc_state - get CRTC state, if it exists
  * @state: global atomic state object
-- 
2.7.4

