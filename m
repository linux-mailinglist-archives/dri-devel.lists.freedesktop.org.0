Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78162248A2D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 17:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4036E047;
	Tue, 18 Aug 2020 15:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BE96E047
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 15:40:39 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id s23so15408979qtq.12
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 08:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pKyNB1nBv3O7w2A0j3MvE3ozOPRktLMjXXc4Gm1c23Q=;
 b=Ua5ZXVMiAPjdNrGtUQPZKqgxzAvYbTP7tcnJ8xsbYZuzuDbW+piRLHE3wOaFsUXtU+
 RW54iI7yjlPdVLUprPWySONHbh7hjCoM+K1hAKq23nrfFuZcrrdpaOhpCGBMsFnuLJ4V
 LSkhDuBsYCQtcKr//DA/wrs5E53bwXZ0otzn/g4WjP92ctQtX05Ivw5yJ8BpQ6kykPca
 LHrSv1Se8IdLyaOm+z3XqWBqXWPbvsLQp49RUAMwpnrMqmsUL9pja3kB0ik963Haic8K
 RYB5hjs5WzMmtm1cDVRQWZgyS1R7Z940Htl9/MM88bi0g2pWzqnVFA42rs+w2zLBnbz+
 CrSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pKyNB1nBv3O7w2A0j3MvE3ozOPRktLMjXXc4Gm1c23Q=;
 b=Jo/V1p4G1p/c5lMD0J+V/M5EnALPQtquSvqI9R6Uvow27RknA8JwzHJ9RoOb+pVw2m
 KUl1c2/ElG0lCg6tthFQ4EtgYGD5T28KbuguCEq+leLiHWyemXc1vq9NjqdQBlXdYTZ1
 Vef04nz3CSP+Gqji2kalBqlPd/rz7G3OzOjp1LqpMUPC9teLeDI0flIG6jqhWp+whJBF
 a6Jn8SU+zwY4OzOq/Eq20McJVCZgaJDPWSZRP051AE/effJnnVIsjbazZrdG9j3qPR4C
 Szfj8DCVvzPQjrInW3UKfpH0krsLtG7Lw6Gi6t6KSaoxluaHJO/cqj2likAP2d3J7Pkg
 fybw==
X-Gm-Message-State: AOAM533E9szwCnpA653T1RBx3zr8oet1Rdr5MIg8Uq3KDF/dpzzgLLhm
 Asj39rxCTnvtcOdgzQfJaCBnXXqd/7WQoQ==
X-Google-Smtp-Source: ABdhPJxycA2x3tXMkaelDuAzWBOAJkfS0uHr9+l9HjwmJB95hSjHEZQ4t0EaVIKb1Ma4lxkc5i5Ijg==
X-Received: by 2002:ac8:6919:: with SMTP id e25mr18455506qtr.339.1597765238517; 
 Tue, 18 Aug 2020 08:40:38 -0700 (PDT)
Received: from localhost (mobile-166-170-57-144.mycingular.net.
 [166.170.57.144])
 by smtp.gmail.com with ESMTPSA id m30sm25616988qtm.46.2020.08.18.08.40.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Aug 2020 08:40:38 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 juston.li@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 anshuman.gupta@intel.com
Subject: [PATCH v8 14/17] drm/i915: Add connector to hdcp_shim->check_link()
Date: Tue, 18 Aug 2020 11:39:02 -0400
Message-Id: <20200818153910.27894-15-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818153910.27894-1-sean@poorly.run>
References: <20200818153910.27894-1-sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 Sean Paul <seanpaul@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Currently we derive the connector from digital port in check_link(). For
MST, this isn't sufficient since the digital port passed into the
function can have multiple connectors downstream. This patch adds
connector to the check_link() arguments so we have it when we need it.

Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20200218220242.107265-13-sean@poorly.run #v4
Link: https://patchwork.freedesktop.org/patch/msgid/20200305201236.152307-14-sean@poorly.run #v5
Link: https://patchwork.freedesktop.org/patch/msgid/20200429195502.39919-14-sean@poorly.run #v6
Link: https://patchwork.freedesktop.org/patch/msgid/20200623155907.22961-15-sean@poorly.run #v7

Changes in v4:
-Added to the set
Changes in v5:
-None
Changes in v6:
-None
Changes in v7:
-None
Changes in v8:
-None
---
 drivers/gpu/drm/i915/display/intel_display_types.h |  3 ++-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |  3 ++-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |  2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          | 10 +++++-----
 4 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 5e01f2f840c9..413b60337a0b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -318,7 +318,8 @@ struct intel_hdcp_shim {
 				 bool enable);
 
 	/* Ensures the link is still protected */
-	bool (*check_link)(struct intel_digital_port *dig_port);
+	bool (*check_link)(struct intel_digital_port *dig_port,
+			   struct intel_connector *connector);
 
 	/* Detects panel's hdcp capability. This is optional for HDMI. */
 	int (*hdcp_capable)(struct intel_digital_port *dig_port,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
index c164ad11e617..b744253a5924 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
@@ -224,7 +224,8 @@ int intel_dp_hdcp_toggle_signalling(struct intel_digital_port *dig_port,
 }
 
 static
-bool intel_dp_hdcp_check_link(struct intel_digital_port *dig_port)
+bool intel_dp_hdcp_check_link(struct intel_digital_port *dig_port,
+			      struct intel_connector *connector)
 {
 	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
 	ssize_t ret;
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index f25cfb7a9565..028cf3ac548f 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -952,7 +952,7 @@ static int intel_hdcp_check_link(struct intel_connector *connector)
 		goto out;
 	}
 
-	if (hdcp->shim->check_link(dig_port)) {
+	if (hdcp->shim->check_link(dig_port, connector)) {
 		if (hdcp->value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
 			intel_hdcp_update_value(connector,
 				DRM_MODE_CONTENT_PROTECTION_ENABLED, true);
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index c0ea16dae3b3..0978b0d8f4c6 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -1546,11 +1546,10 @@ int intel_hdmi_hdcp_toggle_signalling(struct intel_digital_port *dig_port,
 }
 
 static
-bool intel_hdmi_hdcp_check_link_once(struct intel_digital_port *dig_port)
+bool intel_hdmi_hdcp_check_link_once(struct intel_digital_port *dig_port,
+				     struct intel_connector *connector)
 {
 	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
-	struct intel_connector *connector =
-		dig_port->hdmi.attached_connector;
 	enum port port = dig_port->base.port;
 	enum transcoder cpu_transcoder = connector->hdcp.cpu_transcoder;
 	int ret;
@@ -1578,13 +1577,14 @@ bool intel_hdmi_hdcp_check_link_once(struct intel_digital_port *dig_port)
 }
 
 static
-bool intel_hdmi_hdcp_check_link(struct intel_digital_port *dig_port)
+bool intel_hdmi_hdcp_check_link(struct intel_digital_port *dig_port,
+				struct intel_connector *connector)
 {
 	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
 	int retry;
 
 	for (retry = 0; retry < 3; retry++)
-		if (intel_hdmi_hdcp_check_link_once(dig_port))
+		if (intel_hdmi_hdcp_check_link_once(dig_port, connector))
 			return true;
 
 	drm_err(&i915->drm, "Link check failed\n");
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
