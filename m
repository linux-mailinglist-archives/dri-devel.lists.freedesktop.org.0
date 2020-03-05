Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EE517AF89
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 21:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CA36EC31;
	Thu,  5 Mar 2020 20:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8386EC2E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 20:12:56 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id y62so6853473ywd.13
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2020 12:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4nIhwUUPl5S1wUDggl0A4Fskr2W9Pp3xdNA7NW2BY6o=;
 b=ZS7VqyBww4zLLFONuKZzFW5Ea+Gm1TsURmBkxAwaOEwSVQwF/I4k+WAcMYcx0FymPm
 m1zrsfAg5P7VAqEO0mXNFUDAYz5wZR5rQ0pDEoJ+G+ArzjjVq3+uvsMZ5zjLw7mEB9GP
 x5VBQmqYfaJO7N23xW8e/lEwhWdzAp8JeN+AhxK8/QjzkQC7EMZF304dI/0+L/NdcOT1
 BipeL3dYZAmcPoFP50Zdler4PB6c576PHjXwzcKvy1Uz2Sdyqx5KL8GKcqfj8ofVZLSH
 vVeGvI8DdiBstLGc6Wj8ldokkviPMFSf14Z1cZxznHJoJN2oKi3oyx/Ekf7z5JNmhgtu
 X1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4nIhwUUPl5S1wUDggl0A4Fskr2W9Pp3xdNA7NW2BY6o=;
 b=Cib7f789PssdozqoNuS2lynreDhEydEab0+BWssmjZzGL+ycnT60T7EmxpvjrAcxnp
 OqMFafmB9/r0/Lkv06JmFZDOYcFySkVMbsnUB8UARDHAIfZPZrhrvZFdM76RNpWzPoFC
 Qvzkr8/UZs5PfclbBLBBvmM7E91/+zx9McBQo5rDTgD4yUeWRBDV6SZeTweAQD51WsoG
 JFzR5mpRxUbLTY8Cm2xw2XN/2beLDux9RFsgujcNuAUvepVJO/R4EYeIF32RLEil1m10
 oXC/SuYt+kwB8WIaM8UniGOnRCElCvYZ9UGvquj1OA8JRmrOdX5D9vskkvD8nZl/gPYG
 hq8g==
X-Gm-Message-State: ANhLgQ1O2tSKC6qxRm4C6xzSg23rItkw56GE4O0mNvBL8NdsS3rll68G
 dz9aJ0KCO84uSKM6oSWhwMbYNLlzr2g=
X-Google-Smtp-Source: ADFU+vvq+0CWrzlr2acrS9lGiIHW7+D78U8XARoo5pgRXsEuHeeLbdbVMjYc7CPGCX6PdoLddUxAIA==
X-Received: by 2002:a25:6d54:: with SMTP id i81mr9442831ybc.245.1583439175185; 
 Thu, 05 Mar 2020 12:12:55 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id n2sm678654ywj.27.2020.03.05.12.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 12:12:54 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 15/16] drm/i915: Print HDCP version info for all connectors
Date: Thu,  5 Mar 2020 15:12:35 -0500
Message-Id: <20200305201236.152307-16-sean@poorly.run>
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

De-duplicate the HDCP version code for each connector and print it for
all connectors.

Cc: Juston Li <juston.li@intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Juston Li <juston.li@intel.com>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>

Link: https://patchwork.freedesktop.org/patch/msgid/20200227185714.171466-1-sean@poorly.run #v4

Changes in v4:
- Added to the set
Changes in v5:
-Print "No connector support" for hdcp sink capability as well (Ram)
---
 .../drm/i915/display/intel_display_debugfs.c  | 21 ++++++++-----------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 1e6eb7f2f72db..25f03da30ed49 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -597,6 +597,11 @@ static void intel_hdcp_info(struct seq_file *m,
 {
 	bool hdcp_cap, hdcp2_cap;
 
+	if (!intel_connector->hdcp.shim) {
+		seq_puts(m, "No Connector Support");
+		goto out;
+	}
+
 	hdcp_cap = intel_hdcp_capable(intel_connector);
 	hdcp2_cap = intel_hdcp2_capable(intel_connector);
 
@@ -608,6 +613,7 @@ static void intel_hdcp_info(struct seq_file *m,
 	if (!hdcp_cap && !hdcp2_cap)
 		seq_puts(m, "None");
 
+out:
 	seq_puts(m, "\n");
 }
 
@@ -624,10 +630,6 @@ static void intel_dp_info(struct seq_file *m,
 
 	drm_dp_downstream_debug(m, intel_dp->dpcd, intel_dp->downstream_ports,
 				&intel_dp->aux);
-	if (intel_connector->hdcp.shim) {
-		seq_puts(m, "\tHDCP version: ");
-		intel_hdcp_info(m, intel_connector);
-	}
 }
 
 static void intel_dp_mst_info(struct seq_file *m,
@@ -651,10 +653,6 @@ static void intel_hdmi_info(struct seq_file *m,
 	struct intel_hdmi *intel_hdmi = enc_to_intel_hdmi(intel_encoder);
 
 	seq_printf(m, "\taudio support: %s\n", yesno(intel_hdmi->has_audio));
-	if (intel_connector->hdcp.shim) {
-		seq_puts(m, "\tHDCP version: ");
-		intel_hdcp_info(m, intel_connector);
-	}
 }
 
 static void intel_lvds_info(struct seq_file *m,
@@ -710,6 +708,9 @@ static void intel_connector_info(struct seq_file *m,
 		break;
 	}
 
+	seq_puts(m, "\tHDCP version: ");
+	intel_hdcp_info(m, intel_connector);
+
 	seq_printf(m, "\tmodes:\n");
 	list_for_each_entry(mode, &connector->modes, head)
 		intel_seq_print_mode(m, 2, mode);
@@ -1975,10 +1976,6 @@ static int i915_hdcp_sink_capability_show(struct seq_file *m, void *data)
 	if (connector->status != connector_status_connected)
 		return -ENODEV;
 
-	/* HDCP is supported by connector */
-	if (!intel_connector->hdcp.shim)
-		return -EINVAL;
-
 	seq_printf(m, "%s:%d HDCP version: ", connector->name,
 		   connector->base.id);
 	intel_hdcp_info(m, intel_connector);
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
