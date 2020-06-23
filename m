Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DB420569E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 17:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8CA6E9EF;
	Tue, 23 Jun 2020 15:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC89F6E9F3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 15:59:43 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id 80so7426196qko.7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 08:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xsvYXXz3Zgff96bTgBtfBN4T2zxUneoOoU2T2WZ3G74=;
 b=XzTOsyStS9Dlemjy8IHFlvdD97lVGxVYZgUCjU1iCs0pNY2WTgBA4RJQRpTccuLCIY
 3e+hy0OY55gE/3INahR1h//4wkUnaA05EJkKft6tpdHgBpocpfWH3xnnYZVSR1cR59a4
 0JlpWiEunhCuMTX8Qn3V9fgr1ZJHYh45g/f4+lKaX8XIyG9ul1z28IXj5e0jdukGrnZH
 njddwGIQIORQYDX3vzfhn/54sqdTWUHJuvDwr3UfhRl+lABfjFymJwhxMwdCz699nrhW
 hkYgaJgaUnRWinjQeCAk7v6ZJJ4JxkVdaWVKgparHV3wwc7C2GKjJkLtsNv8xQiBScDX
 cKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xsvYXXz3Zgff96bTgBtfBN4T2zxUneoOoU2T2WZ3G74=;
 b=eN77Bv+lj8wffzrnOI/Roq2kNYE7t618NvVLITfK+hDT7HabKQS5D5dzUw1bV/0Ful
 3wBqxIlbD5z1t3lflBACFth6hghGwRRj6a0iI1EZhtXsZkqQJ6ESYxCbYYyqv5ielelT
 NUCGQ6Qdk+g7QiA0IzmY7CB2CTOafKQxYgdTzMm6/Ynymbus+ao6wg46lAcDw+6+MqNN
 gEp2dSodOCnnp7maZtMqQ7bbLE7FvhHQWgn5ICkRzblWj47E1dIZD/rfAnOYg2zTZh5x
 SMbyezar71jIBBn/dcWN2k0zDxC6iCEQgT0slsNmyfVqIRRyQ+fSU+Ck/gnAJrxYswe7
 Gpog==
X-Gm-Message-State: AOAM530/pWU0I08X5H+WOpIPU/2q8To5yhNG23Rln7FM/OSG49i0CZDC
 B54mA+RCWY3rPApjmBqzSNcMFJ0lfc0=
X-Google-Smtp-Source: ABdhPJyse7Plx1IV3TE7RdJFLKwSSkkNK/gVD/pE1HnH5y9gp2nwxvfgqVze/6HpfsQvpTC4eBQ/Hg==
X-Received: by 2002:a05:620a:1108:: with SMTP id
 o8mr15254804qkk.33.1592927982733; 
 Tue, 23 Jun 2020 08:59:42 -0700 (PDT)
Received: from localhost ([166.137.96.174])
 by smtp.gmail.com with ESMTPSA id x4sm993987qtj.50.2020.06.23.08.59.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Jun 2020 08:59:42 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 16/17] drm/i915: Print HDCP version info for all connectors
Date: Tue, 23 Jun 2020 11:59:06 -0400
Message-Id: <20200623155907.22961-17-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200623155907.22961-1-sean@poorly.run>
References: <20200623155907.22961-1-sean@poorly.run>
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
MIME-Version: 1.0
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
Link: https://patchwork.freedesktop.org/patch/msgid/20200305201236.152307-16-sean@poorly.run #v5
Link: https://patchwork.freedesktop.org/patch/msgid/20200429195502.39919-16-sean@poorly.run #v6

Changes in v4:
- Added to the set
Changes in v5:
-Print "No connector support" for hdcp sink capability as well (Ram)
Changes in v6:
-None
Changes in v7:
-None
---
 .../drm/i915/display/intel_display_debugfs.c  | 21 ++++++++-----------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index d1cb48b3f462..1f748a480eb2 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -598,6 +598,11 @@ static void intel_hdcp_info(struct seq_file *m,
 {
 	bool hdcp_cap, hdcp2_cap;
 
+	if (!intel_connector->hdcp.shim) {
+		seq_puts(m, "No Connector Support");
+		goto out;
+	}
+
 	hdcp_cap = intel_hdcp_capable(intel_connector);
 	hdcp2_cap = intel_hdcp2_capable(intel_connector);
 
@@ -609,6 +614,7 @@ static void intel_hdcp_info(struct seq_file *m,
 	if (!hdcp_cap && !hdcp2_cap)
 		seq_puts(m, "None");
 
+out:
 	seq_puts(m, "\n");
 }
 
@@ -625,10 +631,6 @@ static void intel_dp_info(struct seq_file *m,
 
 	drm_dp_downstream_debug(m, intel_dp->dpcd, intel_dp->downstream_ports,
 				&intel_dp->aux);
-	if (intel_connector->hdcp.shim) {
-		seq_puts(m, "\tHDCP version: ");
-		intel_hdcp_info(m, intel_connector);
-	}
 }
 
 static void intel_dp_mst_info(struct seq_file *m,
@@ -646,10 +648,6 @@ static void intel_hdmi_info(struct seq_file *m,
 	struct intel_hdmi *intel_hdmi = enc_to_intel_hdmi(intel_encoder);
 
 	seq_printf(m, "\taudio support: %s\n", yesno(intel_hdmi->has_audio));
-	if (intel_connector->hdcp.shim) {
-		seq_puts(m, "\tHDCP version: ");
-		intel_hdcp_info(m, intel_connector);
-	}
 }
 
 static void intel_lvds_info(struct seq_file *m,
@@ -705,6 +703,9 @@ static void intel_connector_info(struct seq_file *m,
 		break;
 	}
 
+	seq_puts(m, "\tHDCP version: ");
+	intel_hdcp_info(m, intel_connector);
+
 	seq_printf(m, "\tmodes:\n");
 	list_for_each_entry(mode, &connector->modes, head)
 		intel_seq_print_mode(m, 2, mode);
@@ -2026,10 +2027,6 @@ static int i915_hdcp_sink_capability_show(struct seq_file *m, void *data)
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
