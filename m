Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 205741BE7E2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 21:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9016C6F3C0;
	Wed, 29 Apr 2020 19:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBCA6F3AA
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 19:55:33 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id s63so3369547qke.4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 12:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NEkqYX9ZW+igTZYhSVtHVBU4hpoPNfkaLlo8mkBQahA=;
 b=D4wiJz3RkOZKUBCdBfPmI2qALQ6j2S3999fk/FzfrLZyKshbVFyFQVTV7ZChZkGnta
 B3IMETdIaCrJYleqv4ptFuvZwBcSnluEgRLHACyYZszEEyvsrExrDc7fu3BEXNE1orFK
 ZJBa7fxtScnMi2aMHZ/+n3uLuFOyWZ7VsvRXyrM4TI5v95PhSxTE8OCSIBVaxKo0xUtK
 Fi30qpMvlVh8I6BLc1W+4dLB3u5pM2zRLW4Q7dwXxC7KIlUaxHW3aEAH3QNHjFxsiWzB
 d2dIM2JKVjRptDZrypgBSCGdJYXvotS7Iqyw5sQTwYawiOupc5HbpEURtpkMrRnOlkiP
 ok7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NEkqYX9ZW+igTZYhSVtHVBU4hpoPNfkaLlo8mkBQahA=;
 b=U/Wf42mjPajO9dRFkWwu5hRVOvrbtQjlQmF0bSNjDV/nCUU/T9p+UhIC+9YU2kIz+L
 DXMooYlx2kIMwg3vfQl80SF3y/Fp4cTa0dP06XRthI9IEFlrMzbdI0syFiGFwgpCpsa5
 +f93yhhXS7i0suz1su/1WSvUVh+Izhhi1jgrTwtIBYOnBD0NaBih81kftmQoB790VNyy
 83PVuN7bK38IHJIPmtEttDmnteJoJRpHlgLxY9JWyxW3bwQ/Ou94xiwT1+riUFwd6Dlz
 UwHf12ga8n+KWwvxRH9aG4v/Ho5pX3EvEPkFHuJrgLwFfW3FT692aTqDNdzk0BJJCGDX
 8v+w==
X-Gm-Message-State: AGi0PuaJwSdQ6BUFjZefEc5xopJ8q1BRICQo+cer8yTGzhkF+zAKIch1
 gjE2m2nEgAK6yYhvje/oIJ0ov5MvkFw=
X-Google-Smtp-Source: APiQypJ48B0lODXprnFfieWs5V7gqKjpNcjup+uGA0iz52hy2tHJLlIftsD1MvABYW2L4hbB0USRdg==
X-Received: by 2002:a37:508:: with SMTP id 8mr85148qkf.265.1588190132108;
 Wed, 29 Apr 2020 12:55:32 -0700 (PDT)
Received: from localhost (mobile-166-170-55-34.mycingular.net. [166.170.55.34])
 by smtp.gmail.com with ESMTPSA id k2sm191337qte.16.2020.04.29.12.55.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Apr 2020 12:55:31 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 15/16] drm/i915: Print HDCP version info for all connectors
Date: Wed, 29 Apr 2020 15:55:01 -0400
Message-Id: <20200429195502.39919-16-sean@poorly.run>
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

De-duplicate the HDCP version code for each connector and print it for
all connectors.

Cc: Juston Li <juston.li@intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Juston Li <juston.li@intel.com>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>

Link: https://patchwork.freedesktop.org/patch/msgid/20200227185714.171466-1-sean@poorly.run #v4
Link: https://patchwork.freedesktop.org/patch/msgid/20200305201236.152307-16-sean@poorly.run #v5

Changes in v4:
- Added to the set
Changes in v5:
-Print "No connector support" for hdcp sink capability as well (Ram)
Changes in v6:
-None
---
 .../drm/i915/display/intel_display_debugfs.c  | 21 ++++++++-----------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 70525623bcdf..03c3208e4eb9 100644
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
